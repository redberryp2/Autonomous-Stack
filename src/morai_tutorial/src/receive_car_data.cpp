#include <ros/ros.h>
#include <iostream>
#include <morai_msgs/EgoVehicleStatus.h>

using namespace std;

morai_msgs::EgoVehicleStatus msg;

vector<float> position(4,0);



void callback(const morai_msgs::EgoVehicleStatus::ConstPtr &msg)
{   
    position.clear();
    position.emplace_back(msg -> position.x);
    position.emplace_back(msg -> position.y);
    position.emplace_back(msg -> heading);
    position.emplace_back(msg -> acceleration.x);
    

    // cout<< position[0] <<" "<< position[1] <<" "<< position[2] <<" "<< position[3] << " "<< endl;
    cout<< position[0] <<" "<< position[1]<<endl;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "EGO_INFO");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<morai_msgs::EgoVehicleStatus>("/Ego_topic",1,callback);
    // <test_pkg::test_msg>("/Control", 1, callback) => <pkg name:: msg name>("topic name", quee size, callback function)
    ros::spin();
}