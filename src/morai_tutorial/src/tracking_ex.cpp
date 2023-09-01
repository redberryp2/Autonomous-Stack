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
morai_msgs::EgoVehicleStatus carstatus;
morai_msgs::CtrlCmd control;
ros::Publisher pub;

ifstream Out("/home/autonav/catkin_ws/src/morai_tutorial/src/kcity_map.txt");

vector<vector<float>> Map_Data(3870, vector<float>(2, 0));
vector<float> My_Position(3,0);  //X Y HEADING
vector<float> waypoint (2,0); 
float delta;
int LD = 2;


void pub_control()
{
    control.longlCmdType = 2;  //what is it?
	control.accel = 1;
	control.brake = 0;
	control.steering = delta;
	control.velocity = 20;
	pub.publish(control);
}

void callback(const morai_msgs::EgoVehicleStatus::ConstPtr &carstatus)
{   
    My_Position.clear();
	My_Position.emplace_back(carstatus->position.x);
	My_Position.emplace_back(carstatus->position.y);
	My_Position.emplace_back(carstatus->heading);

    float min_dist = 10000000; // inf
    int idx = 0;
    for (int i =0 ; i < 3870 ; i++)
        {
            if (min_dist > sqrt(pow(Map_Data[i][0]-My_Position[0],2)+pow(Map_Data[i][1]-My_Position[1],2)))
            {
                min_dist = sqrt(pow(Map_Data[i][0]-My_Position[0],2)+pow(Map_Data[i][1]-My_Position[1],2));
                idx = i;
            }
        }

    for (idx ; idx < 3870 ; idx++)
    {
        if (LD < sqrt(pow(Map_Data[idx][0]-My_Position[0],2)+pow(Map_Data[idx][1]-My_Position[1],2)))
        {   
            waypoint = Map_Data[idx];
            cout<<waypoint[0]<<"    "<<waypoint[1]<<endl;
            break;
        }
    }
    if (-90 < My_Position[2] && My_Position[2] < 180)
    {
        My_Position[2] = 90 - My_Position[2]; 
    }

    else
    {
        My_Position[2] = -270 -My_Position[2];
    }


    float Theta = atan2((waypoint[0] - My_Position[0]), (waypoint[1] - My_Position[1]));
	Theta = Theta - My_Position[2] / 180 * 3.14159265359;
	Theta = -atan2(2 * 2.7 * sin(Theta), LD);
	delta = Theta;
    pub_control();
}

void Load_Map() // pick
{
	for (int i = 0; i < 3870; i++)
	{
		for (int j = 0; j < 2; j++)
		{
			Out >> Map_Data[i][j];
		}
	}
}

int main(int argc,char **argv)
{
    Load_Map();
    ros::init(argc, argv,"tracking");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<morai_msgs::EgoVehicleStatus>("/Ego_topic", 1, callback );
    pub = nh.advertise<morai_msgs::CtrlCmd>("ctrl_cmd", 1);
    ros::spin();
}