cmake_minimum_required(VERSION 3.0.2)
project(gpsimu_pkg)


find_package(catkin REQUIRED COMPONENTS
  tf
  roscpp
  rospy
  std_msgs
  sensor_msgs
  nav_msgs
  message_generation
)

#find_package(Boost REQUIRED COMPONENTS system)

find_package(cmake_modules REQUIRED)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

find_package(Eigen REQUIRED)

include_directories(${Eigen_INCLUDE_DIRS})

#catkin_python_setup()

add_message_files(
  FILES
  INS.msg  
  gpsimu_msg.msg
)

find_package(catkin REQUIRED)

include_directories(${catkin_INCLUDE_DIRS})

generate_messages(
  DEPENDENCIES
  sensor_msgs
  std_msgs
)

catkin_package(
  DEPENDS Eigen
  std_msgs
  nav_msgs
  sensor_msgs
  message_runtime
  message_generation
)


include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(gps src/gpsimu.cpp)

target_link_libraries(gps
  ${catkin_LIBRARIES}
  ${Eigen_LIBRARIES}
)

