#include<iostream>
#include<sstream>
#include<string>
#include<vector>
#include<array>
#include<cmath>
#include"cubic_spline.h"


using namespace cpprobotics;

int main(){
  Vec_f x{-2.5, 0.0, 2.5, 5.0, 7.5, 3.0, -1.0};
  Vec_f y{0.7, -6,   5,   6.5, 0.0, 5.0, -2.0};
  Vec_f r_x;
  Vec_f r_y;
  Vec_f ryaw;
  Vec_f rcurvature;
  Vec_f rs;

  Spline2D csp_obj(x, y);
  for(float i=0; i<csp_obj.s.back(); i+=0.1){
    std::array<float, 2> point_ = csp_obj.calc_postion(i);
    r_x.push_back(point_[0]);
    r_y.push_back(point_[1]);
    ryaw.push_back(csp_obj.calc_yaw(i));
    rcurvature.push_back(csp_obj.calc_curvature(i));
    rs.push_back(i);
  }
};
