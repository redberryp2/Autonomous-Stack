cmake_minimum_required(VERSION 3.0.2)
project(msg_tutorial)

find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  roscpp
  std_msgs
  message_generation
)

add_message_files(
  FILES
  nameyear.msg
)

generate_messages(
  DEPENDENCIES
  geometry_msgs
  std_msgs
)


catkin_package(
  CATKIN_DEPENDS 
  std_msgs
  geometry_msgs
  message_runtime
)

