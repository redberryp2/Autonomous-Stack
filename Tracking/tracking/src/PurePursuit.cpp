#include <ros/ros.h>
#include <iostream>
#include <string>
#include <vector>
#include <cmath>
#include <fstream>
#include <limits>
#include <sys/time.h>
#include <eigen3/Eigen/Dense>
#include "cubic_spline.h"
#include "motion_model.h"
#include "cpprobotics_types.h"
#include <morai_msgs/CtrlCmd.h>
#include <morai_msgs/EgoVehicleStatus.h>
#define DT 0.1
#define L 0.5
#define KP 1.0
#define MAX_STEER 45.0/180*M_PI

using namespace std;
using namespace cpprobotics;

ros::Subscriber sub; 
morai_msgs::CtrlCmd control;
ros::Publisher pub;

ifstream Out("/home/autonav/catkin_ws/src/morai_tutorial/src/map/morai_highway.txt");
vector<vector<float>> Map_data(7896,vector<float>(2,0));
vector<float> Way_point(2,0);
vector<double> My_enu(3,0);
vector<float> xx(7896,0);
vector<float> yy(7896,0);
float target_speed = 30.0 / 3.6;
Vec_f speed_profile;
Vec_f r_x;
Vec_f r_y;
Vec_f ryaw;
Vec_f rk;
Vec_f rs;
int LD = 15;  //lookaheaddistance
float delta;  // steering angle

//LQR
State state(-0.0, -0.0, 0.0, 0.0);


Vec_f calc_speed_profile(Vec_f rx, Vec_f ry, Vec_f ryaw, float target_speed){
  Vec_f speed_profile(ryaw.size(), target_speed);

  float direction = 1.0;
  for(unsigned int i=0; i < ryaw.size()-1; i++){
    float dyaw = std::abs(ryaw[i+1] - ryaw[i]);
    float switch_point = (M_PI/4.0< dyaw) && (dyaw<M_PI/2.0);

    if (switch_point) direction = direction * -1;
    if (direction != 1.0) speed_profile[i]= target_speed * -1;
    else speed_profile[i]= target_speed;

    if (switch_point) speed_profile[i] = 0.0;
  }

  speed_profile[speed_profile.size()-1] = 0.0;
  return speed_profile;
};


float calc_nearest_index(State state, Vec_f cx, Vec_f cy, Vec_f cyaw, int &ind){
  float mind = std::numeric_limits<float>::max();
  for(unsigned int i=0; i<cx.size(); i++){
    float idx = cx[i] - state.x;
    float idy = cy[i] - state.y;
    float d_e = idx*idx + idy*idy;

    if (d_e<mind){
      mind = d_e;
      ind = i;
    }
  }
  float dxl = cx[ind] - state.x;
  float dyl = cy[ind] - state.y;
  float angle = YAW_P2P(cyaw[ind] - std::atan2(dyl, dxl));
  if (angle < 0) mind = mind * -1;

  return mind;
};

Eigen::Matrix4f solve_DARE(Eigen::Matrix4f A, Eigen::Vector4f B, Eigen::Matrix4f Q, float R){
  Eigen::Matrix4f X = Q;
  int maxiter = 150;
  float eps = 0.01;

  for(int i=0; i<maxiter; i++){
    Eigen::Matrix4f Xn = A.transpose()*X*A-A.transpose()*X*B/(R+B.transpose()*X*B) * B.transpose()*X*A+Q;
    Eigen::Matrix4f error = Xn - X;
    if (error.cwiseAbs().maxCoeff()<eps){
      return Xn;
    }
    X = Xn;
  }

  return X;
};

Eigen::RowVector4f dlqr(Eigen::Matrix4f A, Eigen::Vector4f B, Eigen::Matrix4f Q, float R){
  Eigen::Matrix4f X = solve_DARE(A, B ,Q, R);
  Eigen::RowVector4f K = 1.0/(B.transpose()*X*B + R) * (B.transpose()*X*A);
  return K;
};

float lqr_steering_control(State state, Vec_f cx, Vec_f cy, Vec_f cyaw, Vec_f ck, int& ind, float& pe, float& pth_e){
  float e = calc_nearest_index(state, cx, cy, cyaw, ind);

  float k = ck[ind];
  float th_e = YAW_P2P(state.yaw - cyaw[ind]);

  Eigen::Matrix4f A = Eigen::Matrix4f::Zero();
  A(0, 0) = 1.0;
  A(0 ,1) = DT;
  A(1 ,2) = state.v;
  A(2 ,2) = 1.0;
  A(2 ,3) = DT;

  Eigen::Vector4f B = Eigen::Vector4f::Zero();
  B(3) = state.v/L;

  Eigen::Matrix4f Q = Eigen::Matrix4f::Identity();
  float R = 1;

  // gain of lqr
  Eigen::RowVector4f K = dlqr(A, B, Q, R);

  Eigen::Vector4f x = Eigen::Vector4f::Zero();
  x(0) = e;
  x(1) = (e-pe)/DT;
  x(2) = th_e;
  x(3) = (th_e-pth_e)/DT;

  float ff = std::atan2((L*k), (double)1.0);
  float fb = YAW_P2P((-K * x)(0));
  float delta = ff+fb;

  pe = e;
  pth_e = th_e;
  return delta;
};


void closed_loop_prediction(Vec_f cx, Vec_f cy, Vec_f cyaw, Vec_f ck, Vec_f speed_profile){
  float e = 0;
  float e_th = 0;
  int ind =0;
  delta = lqr_steering_control(state, cx, cy, cyaw, ck, ind, e, e_th);
  float ai = KP * (speed_profile[ind]-state.v);
};


void Morai_pub()
{
    control.longlCmdType = 2;  //what is it?
	control.accel = 1;
	control.brake = 0;
	control.steering = -delta;
	control.velocity = 30;
	pub.publish(control);
    
}

void callback(const morai_msgs::EgoVehicleStatus::ConstPtr &msg)
{
    My_enu.clear();
    My_enu.emplace_back(msg->position.x);
    My_enu.emplace_back(msg->position.y);
    My_enu.emplace_back(msg->heading);
    state.x = My_enu[0];
    state.y = My_enu[1];
    state.yaw = My_enu[2];
    state.v = 30;
    closed_loop_prediction(r_x, r_y, ryaw, rk, speed_profile);
    Morai_pub();


}

void Load_Map() // pick
{
	for (int i = 0; i < 7896; i++)
	{
		for (int j = 0; j < 2; j++)
		{
			Out >> Map_data[i][j];
		}
	}

    for(int i = 0; i < Map_data.size();i++)
    {
        xx[i] = Map_data[i][0];
        yy[i] = Map_data[i][1];
    }
}



int main(int argc, char **argv)
{
    ros::init(argc,argv,"lqr");
    Load_Map();
    Spline2D csp_obj(xx, yy);
    for(float i=0; i<csp_obj.s.back(); i+=0.1)
    {
        array<float, 2> point_ = csp_obj.calc_postion(i);
        r_x.push_back(point_[0]);
        r_y.push_back(point_[1]);
        ryaw.push_back(csp_obj.calc_yaw(i));
        rk.push_back(csp_obj.calc_curvature(i));
        rs.push_back(i);
    }
    speed_profile = calc_speed_profile(r_x, r_y, ryaw, target_speed);
    ros::NodeHandle nh;
    sub = nh.subscribe<morai_msgs::EgoVehicleStatus>("/Ego_topic",1,callback);
    pub = nh.advertise<morai_msgs::CtrlCmd>("ctrl_cmd_0",1);
    ros::spin();
}
