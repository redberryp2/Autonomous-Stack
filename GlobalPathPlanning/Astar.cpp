#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include <set>
#include <map>
#include <queue>
#include <math.h>
using namespace std;

ifstream MAP("../Map/Fullmap.txt");  //call Map Data
vector<vector<float>> Map_Data (15000,vector<float>(2.0));  //save Map Data

typedef pair<int,int> Point; 

void LoadMap()
{
    for (int i = 0; i < 15000; i++)
    {
        for (int j =0 ; j < 2; j++)
        {
            MAP >> Map_Data[i][j];
        }
    }
}

struct sorting
{
    bool operator()(pair<int,Point>& a,pair<int,Point>& b)
    {
        return a.first >= b.first;
    }
};


float heruistic(Point& a, Point& b)  //Heruistic <Uclidian>
{
    float dx = b.first - a.first;
    float dy = b.second - a.second;
        return sqrt(dx*dx + dy*dy); 
}

vector<Point> Astar(vector<vector<int>>& Map, Point start, Point end)
{
    vector<Point> neighbor_node = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}, {1, 1}, {1, -1}, {-1, 1}, {-1, -1}};
    set<Point> close_list;
    map<Point,Point> Parent_Node;
    map<Point,float> G;
    map<Point,float> F;
    priority_queue<pair<int,Point>,vector<pair<int,Point>>,sorting> openheap;

    G[start] = 0;
    F[start] = heruistic(start,end);
    openheap.push({F[start],start});

    while (!openheap.empty())
    {
        Point current =openheap.top().second;  
        openheap.pop();
        
        if (current == end)
        {
            vector<Point> path;
            path.emplace_back(end);
            while (Parent_Node.find(current) != Parent_Node.end())
            {
                path.emplace_back(current);
                current = Parent_Node[current];
            }
            path.emplace_back(start);
            return path;
        }
        close_list.insert(current);
        for (auto neighbors : neighbor_node)
        {
            int i = neighbors.first;
            int j = neighbors.second;
            Point neighbor(current.first + i ,current.second + j);

            float neighbor_G = G[current] + heruistic(current,neighbor);
            if (neighbor.first < 0 || neighbor.first >= Map.size() || neighbor.second < 0 || neighbor.second >= Map[0].size() || Map[neighbor.first][neighbor.second] == 1)
            {continue;}  
            if (close_list.find(neighbor) != close_list.end() && neighbor_G >= G[neighbor])
            {continue;}
            priority_queue<pair<int,Point>,vector<pair<int,Point>>, sorting>  backup = openheap; 
            bool found = true;
            while( !openheap.empty()) 
            {
                Point top = openheap.top().second;
                openheap.pop();
                if (top == neighbor)
                {
                    found = false;
                    break;
                }
            }
            openheap = backup;   
            if (neighbor_G < G[neighbor] || found)  
            {
                Parent_Node[neighbor] =current;
                G[neighbor] = neighbor_G;
                F[neighbor] = G[neighbor] + heruistic(neighbor,end);
                openheap.push({F[neighbor],neighbor});
            }
        }
    }

    return vector<Point>();
}
float find_min_x(vector<vector<float>>& map)
{
    float min_x = 1000000000;
    for (int i = 0; i < map.size(); i++)
    {
        if (map[i][0] < min_x)
        {
            min_x = map[i][0];
        }
    }
    return min_x;
}
float find_min_y(vector<vector<float>>& map)
{
    float min_y = 1000000000;
    for (int i = 0; i < map.size(); i++)
    {
        if (map[i][1] < min_y)
        {
            min_y = map[i][1];
        }
    }
    return min_y;
}
float find_max_x(vector<vector<float>>& map)
{
    float max_x = map[0][0];
    for (int i = 1; i < map.size(); i++)
    {
        if (map[i][0] > max_x)
        {
            max_x = map[i][0];
        }
    }
    return max_x;
}
float find_max_y(vector<vector<float>>& map)
{
    float max_y = map[0][0];
    for (int i = 1; i < map.size(); i++)
    {
        if (map[i][1] > max_y)
        {
            max_y = map[i][1];
        }
    }
    return max_y;
}
int main()
{
    LoadMap();
    float min_x = find_min_x(Map_Data);
    float min_y = find_min_y(Map_Data);
    float max_x = find_max_x(Map_Data);
    float max_y = find_max_y(Map_Data);
    int voxel_size = 10;
    int x_count = (max_x -min_x) / voxel_size;
    int y_count = (max_y -min_y) / voxel_size;
    cout<<x_count<<endl;
    cout<<y_count<<endl;

    vector<vector<int>> map(x_count,vector<int>(y_count,0));  //Obs Area Settings
    for (int i =40 ;  i < 80; i++ )
    {
        for (int j = 0; j < 48; j ++)
        {
            map[i][j] = 1;
        }
    }   

    Point start = {0,0};
    Point end = {98,0};
    vector<Point> result = Astar(map,start,end);

    for (int i = result.size()-1 ; i > 0; i--)
    {
        cout<<"("<<min_x+ result[i].first * voxel_size <<","<< min_y + result[i].second * voxel_size <<")"<<"\t"<<endl;
    }
    cout<<endl;
    return 0;
}

