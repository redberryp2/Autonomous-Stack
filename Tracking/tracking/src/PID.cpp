#include <ros/ros.h>
#include <iostream>
#include <vector>
#include <cmath>
#include <fstream>
#include <chrono>
#include "cubic_spline.h"
#include "motion_model.h"
#include "cpprobotics_types.h"
#include <morai_msgs/CtrlCmd.h>
#include <morai_msgs/EgoVehicleStatus.h>

using namespace std;
using namespace chrono;
using namespace cpprobotics;

ros::Subscriber sub; 
morai_msgs::CtrlCmd control;
ros::Publisher pub;

ifstream Out("/home/sangwoo/catkin_ws/src/morai_tutorial/src/map/morai_highway2.txt");
vector<vector<float>> Map_data(790,vector<float>(2,0));
int ind;
float calc_nearest_index(State state, Vec_f cx, Vec_f cy, Vec_f cyaw){
  float mind = numeric_limits<float>::max();
  for(uint32_t i=ind; i<ind + 50; i++){
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
  float angle = YAW_P2P(cyaw[ind] - atan2(dyl, dxl));
  if (angle < 0) 
  mind = mind * -1;
  return mind;
};
double prevError = 0;
double integral = 0; // 적분 항을 저장하기 위한 변수
double Kp = 5000;
double Ki = 0.01; // 적분 게인
double Kd = 0.0005;
double current_velocity = 0;
double update(double target_velocity, double current_velocity,double dt)
{
  double error = target_velocity - current_velocity;
  integral += error * dt; // 오차를 시간에 따라 적분
  double derivative =(error - prevError) / dt;
  prevError = error;
  return Kp * error + Kd * derivative + Ki * integral;
}

void Morai_pub()
{
  double target_velocity = 50 / 3.6;
  double dt = 0.02;
  double control_signal = update(target_velocity,current_velocity,dt);
  cout<<control_signal<<endl;
  double accel1 = max(0.0, min(1.0, control_signal)); // [0, 1] 범위 내로 제한
  double brake1 = max(0.0, min(1.0, -control_signal)); // [0, 1] 범위 내로 제한    
  control.longlCmdType = 1;
  if (control_signal > 0)
  { 
    control.accel = accel1;
    control.brake = 0;

  }
  else 
  {
    control.accel = 0;
    control.brake = brake1;
  }
  pub.publish(control);

}

void callback(const morai_msgs::EgoVehicleStatus::ConstPtr &msg)
{
    double vx = msg -> velocity.x;
    double vy = msg -> velocity.y;
    current_velocity = sqrt(vx*vx + vy*vy);
    cout<<current_velocity<<endl;

    Morai_pub();
}

int main(int argc, char **argv)
{
    ros::init(argc,argv,"pid");
    ros::NodeHandle nh;
    sub = nh.subscribe<morai_msgs::EgoVehicleStatus>("/Ego_topic",100,callback);
    pub = nh.advertise<morai_msgs::CtrlCmd>("ctrl_cmd_0",100);
    ros::spin();
}
