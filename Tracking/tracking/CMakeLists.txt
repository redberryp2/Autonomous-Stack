cmake_minimum_required(VERSION 3.0.2)
project(tracking)
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  nav_msgs
  roscpp
  rospy
  std_msgs
  message_generation
)
find_package(cmake_modules REQUIRED)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
find_package(Eigen REQUIRED)
include_directories(${Eigen_INCLUDE_DIRS})

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  init.msg
)


generate_messages(
  DEPENDENCIES
  geometry_msgs#   nav_msgs#   std_msgs
)

catkin_package(
 DEPENDS Eigen

 INCLUDE_DIRS include
 LIBRARIES tracking
 CATKIN_DEPENDS geometry_msgs nav_msgs roscpp rospy std_msgs message_runtime
#  DEPENDS system_lib
)

include_directories(
include
  ${catkin_INCLUDE_DIRS}
)

add_executable(lqr
  src/LQR2.cpp
  # src/LQR.cpp
  # src/lqr_speed_steer_control.cpp
  # src/cubic_spline_planner.cpp
)
target_link_libraries(lqr ${catkin_LIBRARIES} ${Eigen_LIBRARIES})