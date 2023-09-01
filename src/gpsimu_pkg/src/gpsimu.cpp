#define _USE_MATH_DEFINES
#include <limits>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <string>
#include <vector>
#include <sstream>
#include <istream>
#include "ros/ros.h"
#include <cmath>
#include <ctime>
#include <cstdlib>
#include "sensor_msgs/Imu.h"
#include "sensor_msgs/NavSatFix.h"
#include "nav_msgs/Odometry.h"
#include "nav_msgs/Path.h"
// #include "gpsimu_pkg/imu_msg.h"
// #include "gpsimu_pkg/gps_msg.h"
#include "gpsimu_pkg/INS.h"
#include <iostream>
#include <vector>
#include <geometry_msgs/Point.h>
#include <sensor_msgs/NavSatFix.h>
#include "morai_msgs/GPSMessage.h"
#include <Eigen/Dense>
#include <unsupported/Eigen/MatrixFunctions>
#include <tf/transform_broadcaster.h>

using namespace std;
using namespace Eigen;

// gpsimu_pkg::imu_msg imu_msg;
// morai_msgs::GPSMessage gps_msg;
nav_msgs::Odometry INSOdometry;
nav_msgs::Path imuPath;
gpsimu_pkg::INS INS;

// ofstream in("map.txt");

class SubandPub
{
private:
  ros::NodeHandle nh;
  ros::Publisher pub1;
  ros::Publisher pub2;
  ros::Publisher pub;
  ros::Subscriber sub1;
  ros::Subscriber sub2;
  ros::Publisher pubImuPath;

  Eigen::MatrixXd latitude;
  Eigen::MatrixXd X;
  Eigen::MatrixXd V;
  Eigen::MatrixXd V_ned;
  Eigen::MatrixXd Vt;
  Eigen::MatrixXd Vt2;
  Eigen::MatrixXd la;
  Eigen::MatrixXd Pt;
  Eigen::MatrixXd Pt2;
  Eigen::MatrixXd Rotation;
  Eigen::MatrixXd av;
  Eigen::MatrixXd gM;
  Eigen::MatrixXd av_2;
  Eigen::MatrixXd av_exp;
  double lat;
  double lon;
  double alt;
  double av_x, av_y, av_z;
  double la_x, la_y, la_z;
  double qu_x, qu_y, qu_z, qu_w;
  double t0, t1, t2, t3, t4, t5;
  double roll, pitch, yaw;
  double degree = M_PI / 180.0; // degree to rad
  double radian = 180.0 / M_PI; // rad to degree
  bool gps_received = false;
  double ecc = 0.0818192;
  double R0 = 6378137.0;
  double Ome = 7.2921151467e-5;
  double g = -9.81;
  double ecc_2 = pow(ecc, 2);
  double dt;
  double f_n, f_e, f_d;
  double x, y, z;
  double Rm;
  double Rt;
  double Rmm;
  double Rtt;
  double v_n;
  double v_e;
  double v_d;
  double cur_N_GPS;
  double cur_E_GPS;
  double cur_D_GPS;
  double cur_N_IMU;
  double cur_E_IMU;
  double cur_D_IMU;
  double last_N_GPS;
  double last_E_GPS;
  double last_D_GPS;
  double DEGREES_TO_RADIANS = 3.1415926535897932384626433 / 180;
  double lat_origin = 37.3382566508110471659165341, lon_origin = 127.8989538793211551137574133, alt_origin = 147.6740264892578125000000000; // 원점의 위도, 경도, 고도
  double wgs84_a = 6378137.0;                                                                                                               // WGS84 타원페의 장반경
  double lat_lef, lon_lef, alt_lef;                                                                                                         // 원점 rad
  double wgs84_f = 1 / 298.257223563;
  double wgs84_e2 = 2 * wgs84_f - pow(wgs84_f, 2);
  double lat_point, lon_point, alt_point; // 변환할 좌표의 위도, 경도, 고도
  double xr, yr, zr;
  double N, E, D; // NED 좌표계에서의 변환 결과

  int flag = 0;

public:
  SubandPub()
  {
    // initialsetting();
    sub1 = nh.subscribe<sensor_msgs::Imu>("/imu", 1, &SubandPub::imuCallback, this);
    sub2 = nh.subscribe<morai_msgs::GPSMessage>("/gps", 1, &SubandPub::gpsCallback, this);
    pub = nh.advertise<gpsimu_pkg::INS>("/INS_pub", 1);
    // pubImuPath = nh.advertise<nav_msgs::Path>("/INS_path", 1);
  }

  void imuCallback(const sensor_msgs::Imu::ConstPtr &msg_imu)
  {
    // av_x = msg_imu->angular_velocity.x;
    // av_y = msg_imu->angular_velocity.y;
    // av_z = msg_imu->angular_velocity.z;

    // la_x = msg_imu->linear_acceleration.x;
    // la_y = msg_imu->linear_acceleration.y;
    // la_z = msg_imu->linear_acceleration.z;

    // qu_x = msg_imu->orientation.x;
    // qu_y = msg_imu->orientation.y;
    // qu_z = msg_imu->orientation.z;
    // qu_w = msg_imu->orientation.w;

    // t0 = 2 * (qu_w * qu_x + qu_y * qu_z);
    // t1 = 1 - 2 * (qu_x * qu_x + qu_y * qu_y);
    // t2 = sqrt(1 + 2 * (qu_w * qu_y - qu_z * qu_x));
    // t3 = sqrt(1 - 2 * (qu_w * qu_y - qu_z * qu_x));
    // t4 = 2 * (qu_w * qu_z + qu_x * qu_y);
    // t5 = 1 - 2 * (qu_y * qu_y + qu_z * qu_z);

    // roll = atan2(t0, t1);
    // pitch = 2 * atan2(t2, t3) - M_PI / 2;
    // yaw = atan2(t4, t5) * radian;

    // if (-180 <= yaw && yaw < 128)
    // {
    //   yaw = -yaw - 52;
    // }
    // else
    // {
    //   yaw = 308 - yaw;
    // }

    // INS_ERROR_MODEL();

    pub_message();
  }

  void gpsCallback(const morai_msgs::GPSMessage::ConstPtr &msg)
  {
    lat = msg->latitude;
    lon = msg->longitude;
    alt = msg->altitude;

    // gps_received = true;
    pub_message();
  }
  void initialsetting()
  {
    latitude = Eigen::MatrixXd(1, 3);
    V_ned = Eigen::Vector3d(3);
    V_ned = Eigen::MatrixXd(3, 1);
    // c = Eigen::MatrixXd(1, 3);
    X = Eigen::MatrixXd(1, 9);
    Vt = Eigen::MatrixXd(3, 1);
    Vt2 = Eigen::MatrixXd(3, 1);
    la = Eigen::MatrixXd(3, 1);
    Pt = Eigen::MatrixXd(3, 1);
    Pt2 = Eigen::MatrixXd(3, 1);
    Rotation = Eigen::MatrixXd(3, 3);
    av = Eigen::MatrixXd(3, 3);
    gM = Eigen::MatrixXd(3, 1);
    av_exp = Eigen::MatrixXd(3, 3);
    av_2 = Eigen::MatrixXd(3, 3);
    V = Eigen::MatrixXd(3, 1);

    // Vt << 0, 0, 0;
    // Pt << 0, 0, 0;
  }

  // void lla2ned(double lat, double lon, double alt)
  // {

  //   lat_point = lat;
  //   lon_point = lon;
  //   alt_point = alt;

  //   double lat_rad = degree * lat_origin;
  //   double lon_rad = degree * lon_origin;

  //   double N = WGS84_A / sqrt(1 - WGS84_E * WGS84_E * sin(lat_rad) * sin(lat_rad)); // chi

  //   // NED 좌표계에서 원점과의 차이
  //   double dx = (lon_point - lon_origin) * degree * N * cos(lat_rad);
  //   double dy = (lat_point - lat_origin) * degree * N;
  //   double dz = alt_point - alt_origin;

  //   // 회전 행렬 계산
  //   double R[3][3] = {
  //       {-sin(lat_rad) * cos(lon_rad), -sin(lat_rad) * sin(lon_rad), cos(lat_rad)},
  //       {-sin(lon_rad), cos(lon_rad), 0},
  //       {-cos(lat_rad) * cos(lon_rad), -cos(lat_rad) * sin(lon_rad), -sin(lat_rad)}};

  //   // NED 좌표계 계산
  //   cur_N_GPS = R[0][0] * dx + R[0][1] * dy + R[0][2] * dz;
  //   cur_E_GPS = R[1][0] * dx + R[1][1] * dy + R[1][2] * dz;
  //   cur_D_GPS = R[2][0] * dx + R[2][1] * dy + R[2][2] * dz;
  // }
  void lla2ned(double lat, double lon, double alt)
  {
    lat_point = lat * DEGREES_TO_RADIANS;
    lon_point = lon * DEGREES_TO_RADIANS;
    alt_point = alt;

    double chi = sqrt(1 - wgs84_e2 * pow(sin(lat_point), 2));
    double q = (wgs84_a / chi + alt_point) * cos(lat_point);
    double x = q * cos(lon_point);
    double y = q * sin(lon_point);
    double z = ((wgs84_a * (1 - wgs84_e2) / chi) + alt_point) * sin(lat_point);

    lat_lef = lat_origin * DEGREES_TO_RADIANS;
    lon_lef = lon_origin * DEGREES_TO_RADIANS;
    alt_lef = alt_origin;

    double ref_chi = sqrt(1 - wgs84_e2 * pow(sin(lat_lef), 2));
    double ref_q = (wgs84_a / ref_chi + alt_lef) * cos(lat_lef);
    double ref_x = ref_q * cos(lon_lef);
    double ref_y = ref_q * sin(lon_lef);
    double ref_z = ((wgs84_a * (1 - wgs84_e2) / ref_chi) + alt_lef) * sin(lat_lef);
    double dx = x - ref_x;
    double dy = y - ref_y;
    double dz = z - ref_z;
    // *************** 수정 필요 ***************
    cur_N_GPS = -sin(lon_lef) * dx + cos(lon_lef) * dy;                                                   // E
    cur_E_GPS = -sin(lat_lef) * cos(lon_lef) * dx - sin(lat_lef) * sin(lon_lef) * dy + cos(lat_lef) * dz; // N
    cur_D_GPS = cos(lat_lef) * cos(lon_lef) * dx + cos(lat_lef) * sin(lon_lef) * dy + sin(lat_lef) * dz;  // U
    // *************** 수정 필요 ***************
  }

  void imu2gps(double last_N_GPS, double last_E_GPS, double last_D_GPS)
  {
    cur_N_GPS = last_N_GPS + cur_N_IMU;
    cur_E_GPS = last_E_GPS + cur_E_IMU;
    cur_D_GPS = last_E_GPS + cur_D_IMU;
  }
  // ************ 사용하는 곳이 없음 **************
  // void getNED()
  // {
  //   if (cur_N_GPS == 0.0 && cur_E_GPS == 0.0 && cur_D_GPS == 0.0)
  //   {
  //     INS_ERROR_MODEL();
  //     imu2gps(last_N_GPS, last_E_GPS, last_D_GPS);
  //   }
  //   else
  //   {
  //     lla2ned(lat, lon, alt);
  //   }
  //   pub_message();
  // }
  // ************ 사용하는 곳이 없음 **************

  void INS_ERROR_MODEL()
  {
    // plot();

    ros::Time INSTime = ros::Time::now();
    ros::Time lastINST;

    if (flag == 0)
    {
      lastINST = INSTime;
      dt = 0.005;
      flag = 1;
    }
    else
    {
      ros::Duration dt = INSTime - lastINST;
      lastINST = INSTime;
    }

    Rotation << cos(pitch * degree) * cos(yaw * degree),
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
        cos(pitch * degree) * cos(roll * degree);

    gM(2, 0) = g;

    la << la_x, la_y, la_z;

    Vt = Vt + gM * dt + Rotation * la * dt;
    Vt(2, 0) = 0;

    // cout << "lat : " << lat << "lon : " << lon << "lat : " << alt << endl;
    // cout << "Vt: " << Vt(0, 0) << " " << Vt(1, 0) << " " << Vt(2, 0) << endl;
    Pt = Pt + Vt * dt + 0.5 * gM * dt * dt + 0.5 * Rotation * la * dt * dt;

    cur_N_IMU = Pt(0, 0);
    cur_E_IMU = Pt(1, 0);
    cur_D_IMU = -Pt(2, 0);

    lla2ned(lat, lon, alt);

    last_N_GPS = cur_N_GPS;
    last_E_GPS = cur_E_GPS;
    last_D_GPS = cur_D_GPS;
  }

  void pub_message()
  {
    // cout << fixed;
    // cout.precision(25);
    // // cout << "yaw :" << yaw << endl;
    // // cout << "lon :" << lon << endl;
    // // cout << "lat :" << lat << endl;
    // // cout << "alt :" << alt << endl;
    // cout << "cur_E :" << cur_E_GPS << endl;
    // cout << "cur_N :" << cur_N_GPS << endl;
    // cout << "cur_U :" << cur_D_GPS << endl;
    // cout << "----------------------------------------" << endl;
    // in << fixed;
    // in.precision(15);
    // in << cur_E_GPS << "\t" << cur_N_GPS << endl;

    INS.heading = 0;
    INS.latitude = 0;
    INS.longitude = 0;
    INS.altitude = 0;

    // INS.yaw = yaw;
    // INS.cur_E_GPS = cur_E_GPS;
    // INS.cur_N_GPS = cur_N_GPS;
    pub.publish(INS);
  }
};

int main(int argc, char **argv)
{
  ros::init(argc, argv, "gpsimu");

  SubandPub SaP;

  ros::spin();
}
