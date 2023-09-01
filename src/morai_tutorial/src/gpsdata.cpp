#include <ros/ros.h>
#include <morai_msgs/GPSMessage.h>
#include <iostream>
using namespace std;


float x;
float y;
float z;
void callback(const morai_msgs::GPSMessage::ConstPtr &msg)
{
    x= msg -> latitude;
    y= msg -> longitude;
    z= msg -> altitude;
    cout<<"[latitude:"<<x<<"][longitude:"<<y<<"][altitude:"<<z<<"]"<<endl;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv,"recieve_gps_data");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<morai_msgs::GPSMessage>("/gps",1,callback);
    ros::spin();
}
