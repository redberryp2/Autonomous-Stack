#include <ros/ros.h>
#include <morai_msgs/GetTrafficLightStatus.h>
#include <iostream>
using namespace std;

//C119BS010001
string x;
int y;
int z;

void callback(const morai_msgs::GetTrafficLightStatus::ConstPtr &msg)
{
    x= msg -> trafficLightIndex;
    y= msg -> trafficLightType;
    z= msg -> trafficLightStatus;
    cout<<x<<"  "<<y<<" "<<z<<endl;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv,"sinho_get");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<morai_msgs::GetTrafficLightStatus>("/GetTrafficLightStatus",1,callback);
    ros::spin();
}
