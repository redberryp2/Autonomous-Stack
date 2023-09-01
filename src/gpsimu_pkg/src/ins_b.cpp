#define _USE_MATH_DEFINES
#include "ros/ros.h"
#include <sensor_msgs/Imu.h>
// #include <sensor_msgs/NavSatFix.h>
#include <morai_msgs/GPSMessage.h>
// #include <INS_Integration/GNSSInfo.h>
#include <gpsimu_pkg/gpsimu_msg.h>
#include <geometry_msgs/Point.h>
#include <Eigen/Dense>
#include <unsupported/Eigen/MatrixFunctions>
#include <iostream>
#include <limits>
#include <fstream>
#include <algorithm>
#include <string>
#include <vector>
#include <sstream>
#include <istream>
#include <cmath>
#include <ctime>
#include <cstdlib>
#include <iostream>
#include <vector>

using namespace std;
using namespace Eigen;

sensor_msgs::Imu imu_msg;
morai_msgs::GPSMessage gps_msg;
gpsimu_pkg::gpsimu_msg INS;
// sensor_msgs::NavSatFix gps_msg;
// INS_Integration::GNSSInfo INS;

class SubandPub
{
private:
    double INSTime;
    double lastINST;

    ros::NodeHandle nh;
    ros::Publisher pub;
    ros::Subscriber sub1;
    ros::Subscriber sub2;

    Eigen::MatrixXd latitude;
    Eigen::MatrixXd V;
    Eigen::MatrixXd V_ned;
    Eigen::MatrixXd Vt;
    Eigen::MatrixXd Vt2;

    Eigen::MatrixXd c1;
    Eigen::MatrixXd c2;
    Eigen::MatrixXd c3;
    Eigen::MatrixXd c31;
    Eigen::MatrixXd c32;
    Eigen::MatrixXd c33;
    Eigen::MatrixXd c34;
    Eigen::MatrixXd c35;

    Eigen::MatrixXd m_7;

    Eigen::MatrixXd acc;
    Eigen::MatrixXd la;
    Eigen::VectorXd euler_angles;

    Eigen::MatrixXd Pt;
    Eigen::MatrixXd Pt2;

    Eigen::MatrixXd g;

    Eigen::MatrixXd Rotation;

    Eigen::MatrixXd gM;
    Eigen::MatrixXd av;
    Eigen::MatrixXd av_2;
    Eigen::MatrixXd av_exp;
    Eigen::MatrixXd Bias;
    Eigen::MatrixXd Accel_Bias;

    Eigen::MatrixXd delta_Vt;

    Eigen::MatrixXd X;
    Eigen::MatrixXd dX;
    Eigen::MatrixXd dX0;
    Eigen::MatrixXd Q;
    Eigen::MatrixXd R;
    Eigen::MatrixXd H;
    Eigen::MatrixXd K;
    Eigen::MatrixXd P;

    Eigen::MatrixXd w_ibb;
    Eigen::MatrixXd w_enn;
    Eigen::MatrixXd w_ien;
    Eigen::MatrixXd w_inn;
    Eigen::MatrixXd Cbn;
    Eigen::MatrixXd minCbn;

    Eigen::MatrixXd f_ned;
    Eigen::MatrixXd F;
    Eigen::MatrixXd A;

    // ------------------new-------------------
    Eigen::MatrixXd F_pp;
    Eigen::MatrixXd F_pv;
    Eigen::MatrixXd F_vp;
    Eigen::MatrixXd F_vv;
    Eigen::MatrixXd F_vphi;
    Eigen::MatrixXd F_phip;
    Eigen::MatrixXd F_phiv;
    Eigen::MatrixXd F_phiphi;
    Eigen::MatrixXd Cbn_minus;
    // ------------------new-------------------
    double lat, lon, alt, h;
    double gps_lat, gps_lon, gps_alt;
    double cos_lat, sin_lat, tan_lat;
    double av_x, av_y, av_z;
    double la_x, la_y, la_z;
    double qu_x, qu_y, qu_z, qu_w;
    double t0, t1, t2, t3, t4, t5;
    double roll, pitch, yaw;
    double rho_n, rho_e, rho_d;
    double f_n, f_e, f_d;
    double x, y, z;
    double Rm, Rt, Rmm, Rtt;
    double v_e, v_n, v_u;
    double gps_v_e, gps_v_n, gps_v_u;
    double cur_E, cur_N, cur_U;
    double prev_E, prev_N, prev_U;
    double degree = M_PI / 180.0, radian = 180.0 / M_PI; // degree -> rad / rad -> degree
    bool gps_received = false;
    double dt = 0.005;
    // wgs84 earth's eccentricity / wgs84 earth's mean radius (m) / earth's rotational rate (rad/s)
    double ecc = 0.0818192, R0 = 6378137.0, Ome = 7.2921151467e-5, gravity = -9.81, ecc_2 = ecc * ecc;                  // earth value
    double wgs84_f = 1 / 298.257223563, wgs84_e2 = 2 * wgs84_f - pow(wgs84_f, 2);                                       // wgs84 model
    double lat_origin = 37.44964 * degree, lon_origin = 126.65661 * degree, alt_origin = 147.6740264892578125000000000; // origin LLA(rad)
    double E, N, U;                                                                                                     // NED 좌표계에서의 변환 결과
    int flag = 0;                                                                                                       // ins start or end siganl

public:
    SubandPub()
    {
        initialsetting();
        // pub = nh.advertise<INS_Integration::GNSSInfo>("/GNSScom", 1);
        // sub1 = nh.subscribe<sensor_msgs::NavSatFix>("ublox/fix", 1, &SubandPub::gpsCallback, this);
        // sub2 = nh.subscribe<sensor_msgs::Imu>("vectornav/IMU", 1, &SubandPub::imuCallback, this);
        pub = nh.advertise<gpsimu_pkg::gpsimu_msg>("/G2C", 1);
        sub1 = nh.subscribe<morai_msgs::GPSMessage>("/gps", 1, &SubandPub::gpsCallback, this);
        sub2 = nh.subscribe<sensor_msgs::Imu>("/imu", 1, &SubandPub::imuCallback, this);
    }
    void initialsetting()
    {
        X = Eigen::MatrixXd(1, 9);    // ok
        R = Eigen::MatrixXd(15, 15);  // (6,6) -> (15,15)
        dX = Eigen::MatrixXd(15, 1);  // ok
        dX0 = Eigen::MatrixXd(15, 1); // ok
        Q = Eigen::MatrixXd(15, 15);  // ok
        H = Eigen::MatrixXd(15, 15);  // ok // (6,15) -> (15,15)
        K = Eigen::MatrixXd(15, 15);  // 이전에는 행렬인 것만 선언하고 공간은 선언 안해줌 15 by 15 해주려고 바꿈 (1,15) -> (15,15)
        P = Eigen::MatrixXd(15, 15);
        w_ibb = Eigen::MatrixXd(1, 3);
        w_enn = Eigen::MatrixXd(1, 3);
        w_ien = Eigen::MatrixXd(1, 3);
        w_inn = Eigen::MatrixXd(1, 3);
        Cbn = Eigen::MatrixXd(3, 3);
        Cbn = Eigen::MatrixXd(3, 3);
        f_ned = Eigen::MatrixXd(3, 1);
        V = Eigen::MatrixXd(3, 1);
        F = Eigen::MatrixXd(15, 15);
        A = Eigen::MatrixXd(15, 15);
        V_ned = Eigen::MatrixXd(3, 1);
        c1 = Eigen::MatrixXd(1, 3);
        c2 = Eigen::MatrixXd(1, 3);
        c3 = Eigen::MatrixXd(3, 1);
        c31 = Eigen::MatrixXd(1, 3);
        c32 = Eigen::MatrixXd(1, 3);
        c33 = Eigen::MatrixXd(1, 3);
        c34 = Eigen::MatrixXd(1, 3);
        c35 = Eigen::MatrixXd(1, 3);
        m_7 = Eigen::MatrixXd(15, 1);
        acc = Eigen::MatrixXd(3, 1);
        Vt = Eigen::MatrixXd(3, 1);
        Vt2 = Eigen::MatrixXd(3, 1);
        la = Eigen::MatrixXd(3, 1);
        Pt = Eigen::MatrixXd(3, 1);
        Pt2 = Eigen::MatrixXd(3, 1);
        av = Eigen::MatrixXd(3, 3);
        g = Eigen::MatrixXd(3, 1);
        av_exp = Eigen::MatrixXd(3, 3);
        av_2 = Eigen::MatrixXd(3, 3);
        Rotation = Eigen::MatrixXd(3, 3);
        euler_angles = Eigen::VectorXd(3);
        F_pp = Eigen::MatrixXd(3, 3);
        F_pv = Eigen::MatrixXd(3, 3);
        F_vp = Eigen::MatrixXd(3, 3);
        F_vv = Eigen::MatrixXd(3, 3);
        F_vphi = Eigen::MatrixXd(3, 3);
        F_phip = Eigen::MatrixXd(3, 3);
        F_phiv = Eigen::MatrixXd(3, 3);
        F_phiphi = Eigen::MatrixXd(3, 3);
        Cbn_minus = Eigen::MatrixXd(3, 3);
        X(0, 0) = lat;
        X(0, 1) = lon;
        X(0, 2) = alt;
        X(0, 3) = 0;
        X(0, 4) = 0;
        X(0, 5) = 0;
        X(0, 6) = roll;
        X(0, 7) = pitch;
        X(0, 8) = yaw;
        dX(0, 0) = -6.97664e-09;
        dX(1, 0) = 7.15927e-09;
        dX(2, 0) = 0.33608;
        dX(3, 0) = -0.00283069;
        dX(4, 0) = -0.00158075;
        dX(5, 0) = 0.000746894;
        dX(6, 0) = 0.000721;
        dX(7, 0) = -0.00100877;
        dX(8, 0) = 0.000739909;
        dX(9, 0) = -0.231594;
        dX(10, 0) = 0.152261;
        dX(11, 0) = 0.08364;
        dX(12, 0) = 3.3118e-06;
        dX(13, 0) = 2.10972e-05;
        dX(14, 0) = -6.86601e-06;
        dX0 = dX;
        Q.setIdentity(); // 대각 요소는 1, 대각 제외한 모든 요소=0
        // Q.setZero();     // 행렬 모든 요소=0
        for (int i = 0; i < 15; i++)
        {
            if (i < 3) //  LLH(latitude, longitude, altitude)
            {
                Q(i, i) = 0.01;
            }
            else if (i < 6) // velocity_ned
            {
                Q(i, i) = 0.00000001;
                if (i == 5)
                {
                    Q(i, i) = 0.000001;
                }
            }
            else if (i < 9) // roll, pitch, yaw
            {
                Q(i, i) = 10;
                if (i == 8) // 필요 없을 수도
                {
                    Q(i, i) = 1;
                }
            }
            else if (i < 15) // gyro(aceel, angular velocity) / Body Frame
            {
                Q(i, i) = 0.1;
            }
        }
        Q = Q * 100; // 100 is parameter?

        R.setIdentity(); // ?? 15 by 15 맞춰줘야하는듯? 그럼 아래도 바뀌어야 하지 않나?
        for (int i = 0; i < 6; i++)
        {
            if (i < 3)
            {
                R(i, i) = 0.0001;
            }
            else // 필요 없을 수도
            {
                R(i, i) = 1;
            }
        }
        R = R * 0.1;     // 0.1 is parameter?
        H.setIdentity(); // H.setZero(); ?? 이게 맞나? 이전 코드에서는 H(6,6) = 1 이것만 그랬는데
        for (int i = 0; i < H.cols(); i++)
        {
            H(i, i) = 1;
        }
        P.setZero();
        for (int i = 0; i < P.cols(); i++)
        {
            P(i, i) = 0.1;
        }
        ENUconverter();
        prev_E = cur_E;
        prev_N = cur_N;
        prev_U = cur_U;
    }

    void ENUconverter()
    {
        double lat_point, lon_point, alt_point; // find LLA(rad)
        lat_point = lat * degree;
        lon_point = lon * degree;
        alt_point = alt;

        double chi = sqrt(1 - wgs84_e2 * pow(sin(lat_point), 2));
        double q = (R0 / chi + alt_point) * cos(lat_point);

        double find_x = q * cos(lon_point);
        double find_y = q * sin(lon_point);
        double find_z = ((R0 * (1 - wgs84_e2) / chi) + alt_point) * sin(lat_point);

        double ref_chi = sqrt(1 - wgs84_e2 * pow(sin(lat_origin), 2));
        double ref_q = (R0 / ref_chi + alt_origin) * cos(lat_origin);
        double ref_x = ref_q * cos(lon_origin);
        double ref_y = ref_q * sin(lon_origin);
        double ref_z = ((R0 * (1 - wgs84_e2) / ref_chi) + alt_origin) * sin(lat_origin);

        double dx = find_x - ref_x;
        double dy = find_y - ref_y;
        double dz = find_z - ref_z;

        cur_E = -sin(lon_origin) * dx + cos(lon_origin) * dy;
        cur_N = -sin(lat_origin) * cos(lon_origin) * dx - sin(lat_origin) * sin(lon_origin) * dy + cos(lat_origin) * dz;
        cur_U = (cos(lat_origin) * cos(lon_origin) * dx + cos(lat_origin) * sin(lon_origin) * dy + sin(lat_origin) * dz);
    }

    void INS_ERROR_MODEL()
    {
        ros::Time INSTime = ros::Time::now();
        ros::Time lastINST;
        if (flag == 0)
        {
            lastINST = INSTime;
            flag == 1;
        }
        else
        {
            ros::Duration dt = INSTime - lastINST;
            lastINST = INSTime;
        }
        lat = X(0, 0);
        lon = X(0, 1);
        alt = X(0, 2);
        v_n = X(0, 3);
        v_e = X(0, 4);
        v_u = X(0, 5);
        roll = X(0, 6);
        pitch = X(0, 7);
        yaw = X(0, 8);
        // earth model
        Rm = R0 * (1 - ecc_2) / pow((1 - ecc_2 * pow((sin(lat * degree)), 2)), 1.5);                                                     // 위도(lat)에 따라 북-남 방향으로의 원경거리
        Rt = R0 / (1 - ecc_2 * pow(pow((sin(lat * degree)), 2), 0.5));                                                                   // 위도(lat)에 따라 동-서 방향으로의 원경거리
        Rmm = (3 * R0 * (1 - ecc_2) * ecc_2 * sin(lat * degree)) * cos(lat * degree) / pow((1 - ecc_2 * ((sin(lat * degree)), 2)), 2.5); // 위도(lat)에 따라 북-남 방향의 곡률 반경
        Rtt = R0 * ecc_2 * sin(lat * degree) * cos(lat * degree) / pow((1 - ecc_2 * pow((sin(lat * degree)), 2)), 1.5);                  // 위도(lat)에 따라 동-서 방향의 곡률 반경
        // X = Eigen::Matrix(1,9)

        av.setZero();
        g.setZero();
        w_ibb << av_x, av_y, av_z;                                                     // 순수 자이로 값 각속도
        w_enn << v_e / (Rt + h), -v_n / (Rm + h), -v_e * tan(lat * degree) / (Rt + h); // ECEF에 대한 nav frame의 angular rate
        rho_n = w_enn(0);
        rho_e = w_enn(1);
        rho_d = w_enn(2);
        w_ien << Ome * cos(lat * degree), 0, -Ome * sin(lat * degree);                            // 지구 자전 각속도
        w_inn << w_ien(0, 0) + w_enn(0, 0), w_ien(0, 1) + w_enn(0, 1), w_ien(0, 2) + w_enn(0, 2); // using poistion and velocity, calculate gyro(angular vel)
        Cbn << cos(pitch * degree) * cos(yaw * degree),
            cos(yaw * degree) * sin(pitch * degree) * sin(roll * degree) -
                cos(roll * degree) * sin(yaw * degree),
            cos(roll * degree) * cos(yaw * degree) * sin(pitch * degree) +
                sin(roll * degree) * sin(yaw * degree),
            cos(pitch * degree) * sin(yaw * degree),
            cos(roll * degree) * cos(yaw * degree) +
                sin(pitch * degree) * sin(roll * degree) * sin(yaw * degree),
            cos(roll * degree) * sin(pitch * degree) * sin(yaw * degree) -
                cos(yaw * degree) * sin(roll * degree),
            -sin(pitch * degree),
            cos(pitch * degree) * sin(roll * degree),
            cos(pitch * degree) * cos(roll * degree); // body to ned DCM  eul2DCM_bn
        // Cbn 연산을 위해 선언한 두 행렬
        c1 = skew(w_ibb(0, 0) - dX(12, 0), w_ibb(0, 1) - dX(13, 0), w_ibb(0, 2) - dX(14, 0)); // w_ibb(0,3) -> w_ibb(0,2)
        c2 = skew(w_inn(0, 0), w_inn(0, 1), w_inn(0, 2));
        la << la_x, la_y, la_z;
        f_ned = Cbn * acc;                      // Cosine direction matrix @=matrix x matrix body to ned accel
        f_n = f_ned(0, 0);                      // n accel
        f_e = f_ned(1, 0);                      // e accel
        f_d = f_ned(2, 0);                      // d accel
        Cbn = Cbn + (Cbn * c1 - c2 * Cbn) * dt; // mechanization DCM differential equation
        DCM2eul_bn(Cbn);                        // 상태 업데이트
        roll = euler_angles[0];
        pitch = euler_angles[1];
        yaw = euler_angles[2];
        dX << 3.1249998144744495e-09, 2.4999999848063226e-08, -0.13608,
            0.0125625, 0.011875000000000002, 0.01665625,
            0.0007, -0.001, 0.0007,
            0.0194921875, 0.3706640625, 0.02261718750000026,
            0.0005827734375, 0.0006302734375, 0.00054640625;
        // X는 위치, 속도, 자세 등등에 대한 값 dX는 이에대한 변위 값
        // 이 dX를 칼만필터를 통해 구하는 것이 목표
        // 이후 dX를 X에 더해 새로운 X를 구하는 방식

        // 여기서부터는 m_7을 구하기 위한 행렬 선언
        c31 << w_ien(0, 0) * 2, w_ien(0, 1) * 2, w_ien(0, 2) * 2;
        c32 << w_enn(0, 0), w_enn(0, 1), w_enn(0, 2);
        c33 = c31 + c32;
        c34 << c33(0, 1) * V_ned(2, 0) - c33(0, 2) * V_ned(1, 0), c33(0, 2) * V_ned(0, 0) - c33(0, 0) * V_ned(2, 0), c33(0, 1) * V_ned(1, 0) - c33(0, 1) * V_ned(0, 0);
        c35 = reshape(c34, 3, 1);
        c3 << la_x - dX(9, 0) - c35(0, 0), la_y - dX(10, 0) - c35(1, 0), la_z - dX(11, 0) - c35(2, 0);
        //-------------velocity update

        V_ned << v_n, v_e, -v_u;
        g << 0, 0, gravity;
        m_7 = Cbn * c3 - c35;
        V = V_ned + (m_7 + g) * dt; // <- V = reshape(V_ned, 3, 1) + (m_7 + g) * dt;

        v_n = V(0, 0);
        v_e = V(1, 0);
        v_u = -V(2, 0);

        // Position 업데이트
        double before_lat = lat;
        lat = lat + (radian) * (v_n / (Rm + h)) * dt;
        lon = lon + (radian) * (v_e / ((Rt + h) * cos(lat * degree))) * dt;
        h = h + (v_u)*dt;
        Vt << 0, 0, 0;
        Pt << 0, 0, 0;

        g(2, 0) = gravity;
        la(0, 0) = la_x;
        la(1, 0) = la_y;
        la(2, 0) = la_z;
        av << 0, -av_z, av_y,
            av_z, 0, -av_x,
            -av_y, av_x, 0;
        av_2 = av * dt;
        av_exp = av_2.exp();

        Vt2 = Vt + g * dt + Rt * la * dt;
        Pt2 = Pt + Vt * dt + 0.5 * g * dt * dt + 0.5 * Rt * la * dt * dt;
        x = Pt2(0, 0);
        y = Pt2(1, 0);
        z = Pt2(2, 0);
        X << lat, lon, alt, v_n, v_e, -v_u, roll, pitch, yaw;
    }

    void INS_MECHANIZATION()
    {
        cos_lat = cos(lat * degree);
        sin_lat = sin(lat * degree);
        tan_lat = tan(lat * degree);
        F_pp << Rmm * rho_e / (Rm + h), 0, rho_e / (Rm + h),
            rho_n * (tan_lat - Rtt / (Rt + h)) / cos_lat, 0, -rho_n / (cos_lat * (Rt + h)),
            0, 0, 0;
        F_pv << 1 / (Rm + h), 0, 0,
            0, 1 / (cos_lat * (Rt + h)), 0,
            0, 0, -1;
        F_vp << Rmm * rho_e * (-v_u) / (Rm + h) - (rho_n / (pow(cos_lat, 2)) + 2 * w_ien(0)) * v_e - rho_n * rho_d * Rtt, 0,
            rho_e * (-v_u) / (Rm + h) - rho_n * rho_d,
            (2 * w_ien(0) + rho_n / (pow(cos_lat, 2)) + rho_d * Rtt / (Rt + h)) * v_n - (rho_n * Rtt / (Rt + h) - 2 * w_ien(2)) * (-v_u), 0, rho_d * v_n / (Rt + h) - rho_n * (-v_u) / (Rt + h),
            (pow(rho_n, 2)) * Rtt + (pow(rho_e, 2)) * Rmm - 2 * w_ien(2) * v_e, 0, pow(rho_n, 2) + pow(rho_e, 2);
        F_vv << (-v_u) / (Rm + h), 2 * rho_d + 2 * w_ien(2), -rho_e,
            -2 * w_ien(2) - rho_d, (v_n * tan_lat - v_u) / (Rt + h), 2 * w_ien(0) + rho_n,
            2 * rho_e, -2 * w_ien(0) - 2 * rho_n, 0;
        F_vphi << 0, -f_d, f_e,
            f_d, 0, -f_n,
            -f_e, f_n, 0;
        F_phip << w_ien(2) - rho_n * Rtt / (Rt + h), 0, -rho_n / (Rt + h),
            -rho_e * Rmm / (Rm + h), 0, -rho_e / (Rm + h),
            -w_ien(0) - rho_n / (pow(cos_lat, 2)) - rho_d * Rtt / (Rt + h), 0, -rho_d / (Rt + h);
        F_phiv << 0, 1 / (Rt + h), 0,
            -1 / (Rm + h), 0, 0,
            0, -tan_lat / (Rt + h), 0;
        F_phiphi << 0, w_ien(2) + rho_d, -rho_e,
            -w_ien(2) - rho_d, 0, w_ien(0) + rho_n,
            rho_e, -w_ien(0) - rho_n, 0;
        minCbn = (-1) * Cbn;
        F.setZero();
        // 3 by 3 맞춰주는 느낌인 거 같은데
        for (int i = 0; i < 3; i++)
        {
            for (int k = 0; k < 3; k++)
            {
                F(i, k) = F_pp(i, k);
            }
        }
        for (int i = 0; i < 3; i++)
        {
            for (int k = 3; k < 6; k++)
            {
                F(i, k) = F_pv(i, k - 3);
            }
        }
        for (int i = 3; i < 6; i++)
        {
            for (int k = 0; k < 3; k++)
            {
                F(i, k) = F_vp(i - 3, k);
            }
        }
        for (int i = 3; i < 6; i++)
        {
            for (int k = 3; k < 6; k++)
            {
                F(i, k) = F_vv(i - 3, k - 3);
            }
        }
        for (int i = 3; i < 6; i++)
        {
            for (int k = 6; k < 9; k++)
            {
                F(i, k) = F_vphi(i - 3, k - 6);
            }
        }
        for (int i = 3; i < 6; i++)
        {
            for (int k = 9; k < 12; k++)
            {
                F(i, k) = Cbn(i - 3, k - 9);
            }
        }
        for (int i = 6; i < 9; i++)
        {
            for (int k = 0; k < 3; k++)
            {
                F(i, k) = F_phip(i - 6, k);
            }
        }
        for (int i = 6; i < 9; i++)
        {
            for (int k = 3; k < 6; k++)
            {
                F(i, k) = F_phiv(i - 6, k - 3);
            }
        }
        for (int i = 6; i < 9; i++)
        {
            for (int k = 6; k < 9; k++)
            {
                F(i, k) = F_phiphi(i - 6, k - 6);
            }
        }
        for (int i = 6; i < 9; i++)
        {
            for (int k = 12; k < 15; k++)
            {
                F(i, k) = Cbn_minus(i - 6, k - 12);
            }
        }
    }

    void Prediction()
    {
        Eigen::MatrixXd F2(15, 15);
        F2 = dt * F;
        A = F2.exp();
        dX = A * dX;
        P = A * P * A.transpose() + Q;
    }

    Eigen::MatrixXd skew(double x, double y, double z)
    {
        Eigen::MatrixXd M(3, 3);
        M << 0, -z, y,
            z, 0, -x,
            -y, x, 0;

        return M;
    }

    Eigen::VectorXd DCM2eul_bn(const Eigen::MatrixXd &matrix)
    {
        Eigen::VectorXd euler_angles(3);
        euler_angles[0] = atan2(matrix(2, 1), matrix(2, 2)) * 180.0 / M_PI;
        euler_angles[1] = asin(-matrix(2, 0)) * 180.0 / M_PI;
        euler_angles[2] = atan2(matrix(1, 0), matrix(0, 0)) * 180.0 / M_PI;

        return euler_angles;
    }

    Eigen::MatrixXd reshape(Eigen::MatrixXd m, int col, int row)
    {
        Eigen::MatrixXd M(col, row);
        M << m(0, 0), m(0, 1), m(0, 2);
        return M;
    }

    void imuCallback(const sensor_msgs::Imu::ConstPtr &msg_imu)
    {
        INSTime = msg_imu->header.stamp.toSec();
        av_x = msg_imu->angular_velocity.x;
        av_y = msg_imu->angular_velocity.y;
        av_z = msg_imu->angular_velocity.z;

        la_x = msg_imu->linear_acceleration.x;
        la_y = msg_imu->linear_acceleration.y;
        la_z = msg_imu->linear_acceleration.z;

        qu_x = msg_imu->orientation.x;
        qu_y = msg_imu->orientation.y;
        qu_z = msg_imu->orientation.z;
        qu_w = msg_imu->orientation.w;
        t0 = 2 * (qu_w * qu_x + qu_y * qu_z);
        t1 = 1 - 2 * (qu_x * qu_x + qu_y * qu_y);
        t2 = sqrt(1 + 2 * (qu_w * qu_y - qu_z * qu_x));
        t3 = sqrt(1 - 2 * (qu_w * qu_y - qu_z * qu_x));
        t4 = 2 * (qu_w * qu_z + qu_x * qu_y);
        t5 = 1 - 2 * (qu_y * qu_y + qu_z * qu_z);
        roll = atan2(t0, t1) * radian;
        pitch = (2 * atan2(t2, t3) - M_PI / 2) * radian;
        yaw = atan2(t4, t5) * radian;

        cout << "roll: " << roll << "    "
             << "pitch: " << pitch << "    "
             << "yaw: " << yaw << endl;

        INS_ERROR_MODEL();   // 사실상 kalman_filter
        INS_MECHANIZATION(); // F 계산 (P를 계산하기 위한 15*15 행렬)
        Prediction();        // P계산 (오차공분산)
        ENUconverter();      // 좌표계 전환
        INS.heading = SubandPub::yaw;
        INS.Position_E = SubandPub::cur_E;
        INS.Position_N = SubandPub::cur_N;
        INS.Position_U = SubandPub::cur_U;

        pub.publish(INS);
    }
    // void gpsCallback(const sensor_msgs::NavSatFix::ConstPtr &msg)
    void gpsCallback(const morai_msgs::GPSMessage::ConstPtr &msg)
    {
        Eigen::MatrixXd z(15, 1); // (6,1) -> (15,1) 계산 맞춰주려고 바꿈
        lat = msg->latitude;
        lon = msg->longitude;
        alt = msg->altitude;
        h = alt;

        ENUconverter();
        double dt_gps = 0.05;
        gps_v_e = (cur_E - prev_E) / dt_gps;
        gps_v_n = (cur_N - prev_N) / dt_gps;
        gps_v_u = (cur_U - prev_U) / dt_gps;

        prev_N = cur_N;
        prev_E = cur_E;
        prev_U = cur_U;
        // cout << "K.row() : " << K.rows() << "      "
        //      << "K.cols() : " << K.cols() << endl;
        // cout << "P.row() : " << P.rows() << "      "
        //      << "P.cols() : " << P.cols() << endl;
        // cout << "R.row() : " << R.rows() << "      "
        //      << "R.cols() : " << R.cols() << endl;
        K = P * (H.transpose()) * ((H * P * H.transpose() + R).inverse());
        // cout << "1" << endl;
        // cout << "X.row() : " << X.rows() << "      "
        //      << "X.cols() : " << X.cols() << endl;

        // z << X(0) - gps_lat,
        //     X(1) - gps_lon,
        //     X(2) - gps_alt,
        //     X(3) - gps_v_n,
        //     X(4) - gps_v_e,
        //     X(5) - gps_v_u;
        z.setZero();
        z(0, 0) = X(0, 0) - lat;
        z(1, 0) = X(0, 1) - lon;
        z(2, 0) = X(0, 2) - alt;
        z(3, 0) = X(0, 3) - v_n;
        z(4, 0) = X(0, 4) - v_e;
        z(5, 0) = X(0, 5) - v_u;
        dX = dX + (K * (z - H * dX));
        P = P - K * H * P;

        X(0, 0) = X(0, 0) - dX(0, 0); // lla
        X(0, 1) = X(0, 1) - dX(1, 0);
        X(0, 2) = X(0, 2) - dX(2, 0);
        X(0, 3) = X(0, 3) - dX(3, 0); // V_ned
        X(0, 4) = X(0, 4) - dX(4, 0);
        X(0, 5) = X(0, 5) - dX(5, 0);
        X(0, 6) = X(0, 6) - dX(6, 0); // Roll Pitch Yaw
        X(0, 7) = X(0, 7) - dX(7, 0);
        X(0, 8) = X(0, 8) - dX(8, 0);
        dX = dX0;
    }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "INSS");
    SubandPub SaP;
    ros::spin();
}