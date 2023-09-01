#include <ros/ros.h>
#include <iostream>
#include <morai_msgs/CtrlCmd.h>

using namespace std;

morai_msgs::CtrlCmd msg;
ros::Publisher pub;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Control");
    ros::NodeHandle nh;
    pub = nh.advertise<morai_msgs::CtrlCmd>("/ctrl_cmd",1);

    while(ros::ok())
    {
        msg.accel = 1;
        msg.brake = 0;
        msg.steering = 0;
        msg.velocity = 20;
        msg.acceleration =10;
        pub.publish(msg);
    }

}