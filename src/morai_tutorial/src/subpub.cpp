#include <ros/ros.h>
#include <morai_tutorial/test2.h>
#include <morai_tutorial/test_msg.h>

using namespace std;

int a, b, c;
morai_tutorial::test2 msg;

void callback(const morai_tutorial::test_msg::ConstPtr &msg)
{
    a = msg->data_a;
    b = msg->data_b;
    c = msg->data_c;

    cout<< "data_a: "<<a<< "    "
        << "data_b: "<<b<< "    "
        << "data_c: "<<c<< "    "<<endl;
}


int main(int argc, char **argv)
{
    ros::init(argc,argv,"sangwoo");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<morai_tutorial::test2>("/sangwootp",1);
    ros::Subscriber sub = nh.subscribe<morai_tutorial::test_msg>("/message",1,callback);
    pub.publish(msg);
    ros::spin();


}