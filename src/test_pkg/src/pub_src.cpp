#include <ros/ros.h>
#include <iostream>
#include <test_pkg/test_msg.h> // <const pkg name/msg name.h>

using namespace std;

test_pkg::test_msg msg;

int main(int argc, char **argv)
{
    // Ros Message
    ros::init(argc, argv, "pub");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<test_pkg::test_msg>("/message", 1);

    while (ros::ok())
    {
        msg.data_a = 1;
        msg.data_b = 2;
        msg.data_c = 3;

        pub.publish(msg);
    }
}