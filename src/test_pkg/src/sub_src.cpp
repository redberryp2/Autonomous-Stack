#include <ros/ros.h>
#include <iostream>
#include <test_pkg/test_msg.h> // <const pkg name/msg name.h>

using namespace std;

void callback(const test_pkg::test_msg::ConstPtr &msg) // (const pkg name::msg name)
{
    cout << "data_a : " << msg->data_a << "   "
         << "data_b : " << msg->data_b << "   "
         << "data_c : " << msg->data_c << "   " << endl;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "sub");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<test_pkg::test_msg>("/message", 1, callback);
    // <test_pkg::test_msg>("/Control", 1, callback) => <pkg name:: msg name>("topic name", quee size, callback function)
    ros::spin();
}