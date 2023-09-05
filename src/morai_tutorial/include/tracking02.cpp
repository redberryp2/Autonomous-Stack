#include <ros/ros.h>
#include <morai_msgs/EgoVehicleStatus.h>
#include <morai_msgs/CtrlCmd.h>
#include <iostream>
#include <string>
#include <vector>
#include <cmath>
// #include <algoritm>
#include <fstream>

using namespace std;

vector<vector<float>> Map_data(3870,vector<float>(2,0));  //path
vector<float> My_point(3,0);   //x, y, head  
vector<float> Way_point(2,0);
int min_idx = 0;
int LD = 2;
float delta;

morai_msgs::CtrlCmd control;
morai_msgs::EgoVehicleStatus msg;
ros::Publisher pub;

ifstream Out("/home/autonav/catkin_ws/src/morai_tutorial/src/kcity_map.txt");

void Load_Map()  //txt_path load
{
    for(int i = 0; i <3870; i++)
    {
        for(int j = 0; j <2; j++)
        {
            Out >> Map_data[i][j];
        }
    }
}

//nearest    my_point
void Find_Nearest()
{   
    float Min_dist = 1000000000;
    for(int i=0; i < 3870; i++)
    {
        if (Min_dist < sqrt(pow(Map_data[i][0]-My_point[0],2)+pow(Map_data[i][1]-My_point[1],2)))
            {
            Min_dist = sqrt(pow(Map_data[i][0]-My_point[0],2)+pow(Map_data[i][1]-My_point[1],2));
            min_idx = i;
            }
    }
}

void Find_Waypint()
{
    for(int i = min_idx; i < 3870; i++ )
    {
        if(LD < sqrt(pow(Map_data[i][0]-My_point[0],2)+pow(Map_data[i][1]-My_point[1],2)))
        {
            Way_point[0]= Map_data[i][0];
            Way_point[1]= Map_data[i][1];

        }
    }

} 

void Find_delta()  //delta = My_point[2]
{
    if (My_point[2] > -90 && My_point[2] < 180)
    {
        My_point[2] = 90 - My_point[2];     
    }
    else
    {
        My_point[2] = -270-My_point[2];
    }

    float alpha = atan2(Way_point[0] - My_point[0],Way_point[1] - My_point[1]);
    alpha = alpha - My_point[2];
    delta = -atan2(2*sin(alpha)*2.7,LD); 
}





void Morai_pub()
{
    control.longlCmdType = 2;
    control.velocity =20;
    control.steering = delta;
    control.accel = 1;
    control.brake = 0;
    pub.publish(control);
}


void callback(const morai_msgs::EgoVehicleStatus::ConstPtr &msg)
{
    My_point.clear();
    My_point.emplace_back(msg -> position.x);
    My_point.emplace_back(msg -> position.y);
    My_point.emplace_back(msg -> heading);
    Find_Nearest();
    Find_Waypint();
    Find_delta();
    Morai_pub();
    }





int main(int argc, char **argv)
{
    Load_Map();
    ros::init(argc,argv,"track02");
    ros::NodeHandle nh;
    pub = nh.advertise<morai_msgs::CtrlCmd>("ctrl_cmd",1);
    ros::Subscriber sub = nh.subscribe<morai_msgs::EgoVehicleStatus>("/Ego_topic",1,callback);
    ros::spin();


}















