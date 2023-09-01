#include <ros/ros.h>
#include <morai_msgs/EgoVehicleStatus.h> // Car -> User
#include <morai_msgs/CtrlCmd.h>			 // User -> Car
// #include <gpsimu_pkg/gpsimu_msg.h>		 // User -> Car
#include <iostream>
#include <string>
#include <vector>
#include <cmath>
#include <algorithm>
#include <fstream>

using namespace std;

ifstream Out("/home/autonav/catkin_ws/src/Tracking_pkg/src/map.txt");
vector<int> Map_Size(3, 0);
vector<vector<float>> Map_Data(3870, vector<float>(2, 0));
vector<float> Find_Dist_Map(500, 0);					  // Map_Dist
vector<float> Find_Dist(100, 0);						  // Renewal Near Dist
vector<float> Position(3, 0);							  // X, Y, Heading
vector<float> Car_Value(3, 0);							  // Speed, Ld, Steering
vector<vector<float>> Point_Data(2, vector<float>(2, 0)); // Nearest_Point_X, Y / Way_Point_X, Y
vector<int> Point_Index(2, 0);							  // Nearest_Point_Index, Way_Point_Index

morai_msgs::CtrlCmd msg; // Control -> Car
ros::Publisher pub;

void Map_Dist_Function(vector<vector<float>> &Map, int &Map_Size, vector<float> &Point, int &Near_Index, vector<float> &Find_Dist) // pick
{
	Find_Dist.clear();
	Find_Dist.resize(500, 5000);
	if (Near_Index + 500 > Map_Size)
	{
		for (int i = Near_Index; i < Map_Size; i++)
		{
			Find_Dist.pop_back();
			Find_Dist.emplace(Find_Dist.begin() + i - Near_Index, sqrt(pow(Map[i][0] - Point[0], 2) + pow(Map[i][1] - Point[1], 2)));
		}
	}
	else
	{
		for (int i = Near_Index; i < Near_Index + 500; i++)
		{
			Find_Dist.pop_back();
			Find_Dist.emplace(Find_Dist.begin() + i - Near_Index, sqrt(pow(Map[i][0] - Point[0], 2) + pow(Map[i][1] - Point[1], 2)));
		}
	}
}

void Map_Dist_Function_50(vector<vector<float>> &Map, int &Map_Size, vector<float> &Point, vector<float> &Find_Dist_50, vector<int> &Point_Index) // pick
{
	Find_Dist_50.clear();
	if (Point_Index[0] + 100 < Map_Size)
	{
		for (int i = Point_Index[0]; i < Point_Index[0] + 100; i++)
		{
			Find_Dist_50.emplace_back(sqrt(pow(Map[i][0] - Point[0], 2) + pow(Map[i][1] - Point[1], 2)));
		}
	}
	else
	{
		for (int i = Point_Index[0]; i < Map_Size; i++)
		{
			Find_Dist_50.emplace_back(sqrt(pow(Map[i][0] - Point[0], 2) + pow(Map[i][1] - Point[1], 2)));
		}
		for (int i = Map_Size - Point_Index[0]; i < 100 - Map_Size + Point_Index[0]; i++)
		{
			Find_Dist_50.emplace_back(sqrt(pow(Map[i][0] - Point[0], 2) + pow(Map[i][1] - Point[1], 2)));
		}
	}
}

void Nearest_Point_Renewal(vector<vector<float>> &Map, int &Map_Size, vector<float> &Find_Dist_50, vector<int> &Point_Index, vector<vector<float>> &Point_Data) // pick
{
	Point_Data[0].clear();
	if (Point_Index[0] + 100 > Map_Size)
	{
		Map_Dist_Function_50(Map, Map_Size, Position, Find_Dist_50, Point_Index);
		Point_Index.clear();
		Point_Index.emplace_back(min_element(Find_Dist_50.begin(), Find_Dist_50.end()) - Find_Dist_50.begin());
	}
	else
	{
		Map_Dist_Function_50(Map, Map_Size, Position, Find_Dist_50, Point_Index);
		Point_Index.clear();
		Point_Index.emplace_back(min_element(Find_Dist_50.begin(), Find_Dist_50.end()) - Find_Dist_50.begin() + Point_Index[0]);
	}
	Point_Data[0].emplace_back(Map[Point_Index[0]][0]);
	Point_Data[0].emplace_back(Map[Point_Index[0]][1]);
}

void Load_Map() // pick
{
	for (int i = 0; i < 3870; i++)
	{
		for (int j = 0; j < 2; j++)
		{
			Out >> Map_Data[i][j];
		}
	}
	Map_Size.pop_back();
	Map_Size.emplace(Map_Size.begin(), 3870);
}

inline void Look_Distance()
{
	Car_Value.emplace_back(2.5);
}

inline void Change_LD(vector<vector<float>> &Point_Data)
{
	Car_Value.pop_back();
	Car_Value.emplace_back(sqrt(pow(Point_Data[1][0] - Position[0], 2) + pow(Point_Data[1][1] - Position[1], 2)));
}

void Way_Point(vector<vector<float>> &Map, int &Map_Size, vector<float> &Find_Dist_Map, vector<int> &Point_Index, vector<vector<float>> &Point_Data)
{
	Point_Data[1].clear();
	if (Point_Index[0] + 500 > Map_Size)
	{
		for (int i = Point_Index[0]; i < Map_Size; i++)
		{
			if (Find_Dist_Map[i - Point_Index[0]] > Car_Value[1])
			{
				Point_Index.emplace_back(i);
				break;
			}
		}
		for (int i = Map_Size - Point_Index[0]; i < 500 - Map_Size + Point_Index[0]; i++)
		{
			if (Find_Dist_Map[i - (Map_Size - Point_Index[0])] > Car_Value[1])
			{
				Point_Index.emplace_back(i);
				break;
			}
		}
		Point_Data[1].emplace_back(Map[Point_Index[1]][0]);
		Point_Data[1].emplace_back(Map[Point_Index[1]][1]);
	}
	else
	{
		for (int i = Point_Index[0]; i < Point_Index[0] + 500; i++)
		{
			if (Find_Dist_Map[i - Point_Index[0]] > Car_Value[1])
			{
				Point_Index.emplace_back(i);
				break;
			}
		}
		Point_Data[1].emplace_back(Map[Point_Index[1]][0]);
		Point_Data[1].emplace_back(Map[Point_Index[1]][1]);
	}
}

inline void Heading() // pick
{
	if (-90 <= Position[2] && Position[2] <= 180)
	{
		Position.erase(Position.begin() + 2);
		Position.emplace(Position.begin() + 2, 90 - Position[2]);
	}
	else
	{
		Position.erase(Position.begin() + 2);
		Position.emplace(Position.begin() + 2, -270 - Position[2]);
	}
}

inline void Pure_pursuit(vector<vector<float>> &Point_Data) // pick
{
	float Theta = atan2((Point_Data[1][0] - Position[0]), (Point_Data[1][1] - Position[1]));
	Theta = Theta - Position[2] / 180 * 3.14159265359;
	Theta = -atan2(2 * 2.7 * sin(Theta), Car_Value[1]);
	Car_Value.emplace_back(Theta);
}
void Pub_Morai()
{
	msg.longlCmdType = 2;
	msg.accel = 1;
	msg.brake = 0;
	msg.steering = Car_Value[2];
	msg.velocity = Car_Value[0];
	msg.acceleration = 15;
	pub.publish(msg);
}

void Control(vector<vector<float>> &Map, int &Map_Size, vector<float> &Point, vector<float> &Find_Dist_50, vector<float> &Find_Dist_Map, vector<int> &Point_Index, vector<vector<float>> &Point_Data) // pick
{
	Nearest_Point_Renewal(Map, Map_Size, Find_Dist_50, Point_Index, Point_Data);
	Map_Dist_Function(Map, Map_Size, Position, Point_Index[0], Find_Dist_Map);
	Look_Distance();
	Way_Point(Map, Map_Size, Find_Dist_Map, Point_Index, Point_Data);
	Change_LD(Point_Data);
	Pure_pursuit(Point_Data);
	Pub_Morai();
}

void Load_Car_Status(const morai_msgs::EgoVehicleStatusConstPtr &Car_Data) // pick
{
	Position.clear();
	Position.emplace_back(Car_Data->position.x);
	Position.emplace_back(Car_Data->position.y);
	Position.emplace_back(Car_Data->heading);
	Car_Value.clear();
	Car_Value.emplace_back(15);

	Heading();
	Control(Map_Data, Map_Size[0], Position, Find_Dist, Find_Dist_Map, Point_Index, Point_Data);

	// cout << Position[2] << endl;

	cout << "------------------------Position------------------------"
		 << "\n"
		 << "\n";
	cout << "x : " << Position[0] << "\t"
		 << "y : " << Position[1] << "\n"
		 << "\n";

	cout << "-----------------------Car_State------------------------"
		 << "\n"
		 << "\n";
	cout << "Speed : " << Car_Value[0] << "\t"
		 << "Steering : " << Car_Value[2] << "\t"
		 << "Ld : " << Car_Value[1] << "\n"
		 << "\n";

	cout << "-------------------------Map----------------------------"
		 << "\n"
		 << "\n";
	cout << "Nearest_Point : " << Point_Index[0] << "\t"
		 << "x : " << Point_Data[0][0] << "\t"
		 << "y : " << Point_Data[0][1] << "\n";
	cout << "Way_Point : " << Point_Index[1] << "\n"
		 << "x : " << Point_Data[1][0] << "\t"
		 << "y : " << Point_Data[1][1] << "\n"
		 << "\n";
}

// void Load_Car_Status(const gpsimu_pkg::gpsimu_msgConstPtr &Car_Data) // pick
// {
// 	Position.clear();
// 	Position.emplace_back(Car_Data->Position_E);
// 	Position.emplace_back(Car_Data->Position_N);
// 	Position.emplace_back(Car_Data->heading);
// 	Car_Value.clear();
// 	Car_Value.emplace_back(15);

// 	Heading();
// 	Control(Map_Data, Map_Size[0], Position, Find_Dist, Find_Dist_Map, Point_Index, Point_Data);

// 	// cout << Position[2] << endl;

// 	cout << Position[0] << "\t" << Position[1] << "\t" << Position[2] << endl;
// 	// cout << "------------------------Position------------------------"
// 	// 	 << "\n"
// 	// 	 << "\n";
// 	// cout << "x : " << Position[0] << "\t"
// 	// 	 << "y : " << Position[1] << "\n"
// 	// 	 << "\n";

// 	// cout << "-----------------------Car_State------------------------"
// 	// 	 << "\n"
// 	// 	 << "\n";
// 	// cout << "Speed : " << Car_Value[0] << "\t"
// 	// 	 << "Steering : " << Car_Value[2] << "\t"
// 	// 	 << "Ld : " << Car_Value[1] << "\n"
// 	// 	 << "\n";

// 	// cout << "-------------------------Map----------------------------"
// 	// 	 << "\n"
// 	// 	 << "\n";
// 	// cout << "Nearest_Point : " << Point_Index[0] << "\t"
// 	// 	 << "x : " << Point_Data[0][0] << "\t"
// 	// 	 << "y : " << Point_Data[0][1] << "\n";
// 	// cout << "Way_Point : " << Point_Index[1] << "\n"
// 	// 	 << "x : " << Point_Data[1][0] << "\t"
// 	// 	 << "y : " << Point_Data[1][1] << "\n"
// 	// 	 << "\n";
// }

int main(int argc, char **argv) // pick
{
	Load_Map();
	ros::init(argc, argv, "Control");
	ros::NodeHandle nh;
	pub = nh.advertise<morai_msgs::CtrlCmd>("ctrl_cmd", 1);
	ros::Subscriber sub = nh.subscribe<morai_msgs::EgoVehicleStatus>("/Ego_topic", 1, Load_Car_Status);
	// ros::Subscriber sub = nh.subscribe<gpsimu_pkg::gpsimu_msg>("/G2C", 1, Load_Car_Status);
	ros::spin();
}