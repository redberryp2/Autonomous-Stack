#include <ros/ros.h>
#include <iostream>
#include <geometry_msgs/Accel.h>  // pkg name/msg name
// #include <msg_tutorial/nameyear.h>

using namespace std;

float x;
float y;
float z;

void callback(const geometry_msgs::Accel::ConstPtr &msg)
{
    x = msg -> linear.x;
    y = msg -> linear.y;
    z = msg -> linear.z;

    
    cout << x << " "<< y <<" "<< z << endl;
}
int main(int argc, char **argv)
{
    ros::init(argc, argv, "sub");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<geometry_msgs::Accel>("/message",1,callback);
    // <test_pkg::test_msg>("/Control", 1, callback) => <pkg name:: msg name>("topic name", quee size, callback function)
    ros::spin();
}