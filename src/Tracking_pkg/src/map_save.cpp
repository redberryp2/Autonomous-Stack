#include <ros/ros.h>
#include <morai_msgs/EgoVehicleStatus.h> // Car -> User
#include <iostream>
#include <fstream>

using namespace std;

ofstream GPS("map.txt");

void Load_Car(const morai_msgs::EgoVehicleStatusConstPtr &Car_Data)
{
    GPS << fixed;
    GPS.precision(15);
    GPS << Car_Data->position.x << "\t" << Car_Data->position.y << endl; // "/t" << Position[2] << endl;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Control");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<morai_msgs::EgoVehicleStatus>("/Ego_topic", 1, Load_Car);
    ros::spin();
}