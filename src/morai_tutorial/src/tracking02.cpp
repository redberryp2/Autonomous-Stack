#include <ros/ros.h>
#include <morai_msgs/EgoVehicleStatus.h>
#include <morai_msgs/CtrlCmd.h>
#include <iostream>
#include <string>
#include <vector>
#include <cmath>
#include <fstream>

using namespace std;
morai_msgs::CtrlCmd control;
morai_msgs::EgoVehicleStatus msg;
ros::Publisher pub;
ifstream Out("/home/autonav/catkin_ws/src/morai_tutorial/src/map02.txt");

vector<vector<float>> Map_data(3870,vector<float>(2,0));  //path_data
vector<float> My_point(3,0);   //x, y, head  
vector<float> Way_point(2,0);  //Way_point


//nearest index
int LD = 2;  //lookaheaddistance
float delta;  // steering angle
int min_idx = 0;



//nearest    my_point
void Find_Nearest()
{   
    float Min_dist = int(1e9);
    for(int i=min_idx; i < min_idx+100; i++)
    {
        if (Min_dist > sqrt(pow(Map_data[i][0]-My_point[0],2)+pow(Map_data[i][1]-My_point[1],2)))
            {
            Min_dist = sqrt(pow(Map_data[i][0]-My_point[0],2)+pow(Map_data[i][1]-My_point[1],2));
            min_idx = i;
            }
        
    }
}
void Find_Waypoint()
{
    cout<<min_idx<<endl;
    for(min_idx; min_idx < 3870; min_idx++ )
    {
        if(LD < sqrt(pow(Map_data[min_idx][0]-My_point[0],2)+pow(Map_data[min_idx][1]-My_point[1],2)))
        {
            Way_point = Map_data[min_idx];
            cout<<Way_point[0]<<"and"<<Way_point[1]<<endl;
            break;
        }
    }
    
} 



//find steering angle= delta
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

    float alpha = atan2((Way_point[0] - My_point[0]),(Way_point[1] - My_point[1]));
    alpha = alpha - My_point[2] / 180 * 3.14159265359;
    delta = -atan2(2*sin(alpha)*4.54,LD); 
}




// ctrl_cmd msgs for steering
void Morai_pub()
{
    control.longlCmdType = 2;  //what is it?
	control.accel = 1;
	control.brake = 0;
	control.steering = delta;
	control.velocity = 20;
	pub.publish(control);
    
}

// callback for looping 
void callback(const morai_msgs::EgoVehicleStatus::ConstPtr &msg)
{
    My_point.clear();
    My_point.emplace_back(msg -> position.x);
    My_point.emplace_back(msg -> position.y);
    My_point.emplace_back(msg -> heading);
    Find_Nearest();
    Find_Waypoint();
    Find_delta();
    Morai_pub();
}

void Load_Map() // pick
{
	for (int i = 0; i < 3870; i++)
	{
		for (int j = 0; j < 2; j++)
		{
			Out >> Map_data[i][j];
		}
	}
}



int main(int argc, char **argv)
{
    Load_Map();
    ros::init(argc,argv,"track02");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<morai_msgs::EgoVehicleStatus>("/Ego_topic",1,callback);
    pub = nh.advertise<morai_msgs::CtrlCmd>("ctrl_cmd",1);
    ros::spin();
}















