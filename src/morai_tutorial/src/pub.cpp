#include <ros/ros.h>
#include <iostream>
#include <geometry_msgs/Accel.h>   // pkg name/msg name
// #include <msg_tutorial/nameyear.h>

using namespace std;
geometry_msgs::Accel msg;
ros::Publisher pub;
float x, y, z;

int main(int argc, char **argv)
{
    ros::init(argc, argv,"pub");
    ros::NodeHandle nh;
    pub = nh.advertise<geometry_msgs::Accel>("/message", 1);
    // ros::Rate rate(30);

    while (ros::ok())
    {
        msg.linear.x = 5.0;
        msg.linear.y = 1.0;
        msg.linear.z = 3.0;
        // rate.sleep();
        pub.publish(msg);
    }
}