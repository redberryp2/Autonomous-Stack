cmake_minimum_required(VERSION 3.0.2)
project(Tracking_pkg)


find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  geometry_msgs
  message_generation
)

find_package(cmake_modules REQUIRED)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

find_package(Eigen REQUIRED)

include_directories(${Eigen_INCLUDE_DIRS})

add_message_files(
	DIRECTORY msg
	FILES
	CtrlCmd.msg
)

generate_messages(
DEPENDENCIES
   DEPENDENCIES
   geometry_msgs
   std_msgs
 )
 
 catkin_package(
  CATKIN_DEPENDS 
   DEPENDS Eigen
  roscpp
  std_msgs
  geometry_msgs
  message_runtime
)

include_directories(
 include 
 ${catkin_INCLUDE_DIRS}
)

add_executable(con src/path_tracking.cpp)
target_link_libraries(con ${catkin_LIBRARIES})
