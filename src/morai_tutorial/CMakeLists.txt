cmake_minimum_required(VERSION 3.0.2)
project(morai_tutorial)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  message_generation
  roscpp
  std_msgs
)

find_package(cmake_modules REQUIRED)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

## find_package(Eigen REQUIRED)

## include_directories(${Eigen_INCLUDE_DIRS})

add_message_files(
	DIRECTORY msg
	FILES
	test_msg.msg
	test2.msg
)

generate_messages(
DEPENDENCIES
   DEPENDENCIES
   geometry_msgs
   std_msgs
 )
 
 catkin_package(
  CATKIN_DEPENDS 
  ## DEPENDS Eigen
  roscpp
  std_msgs
  geometry_msgs
  message_runtime
)

include_directories(
 include 
 ${catkin_INCLUDE_DIRS}
)

add_executable(pub2 src/pub.cpp)
target_link_libraries(pub2 ${catkin_LIBRARIES})

add_executable(sub2 src/sub.cpp)
target_link_libraries(sub2 ${catkin_LIBRARIES})

add_executable(pubsub src/subpub.cpp)
target_link_libraries(pubsub ${catkin_LIBRARIES})

add_executable(give src/control_car_for_data.cpp)
target_link_libraries(give ${catkin_LIBRARIES})

add_executable(receive src/receive_car_data.cpp)
target_link_libraries(receive ${catkin_LIBRARIES})

add_executable(track src/tracking_ex.cpp)
target_link_libraries(track ${catkin_LIBRARIES})

add_executable(gps2 src/gpsdata.cpp)
target_link_libraries(gps2 ${catkin_LIBRARIES})

add_executable(sinho src/get_sinho.cpp)
target_link_libraries(sinho ${catkin_LIBRARIES})

add_executable(track02 src/tracking02.cpp)
target_link_libraries(track02 ${catkin_LIBRARIES})

add_executable(map2 src/map_save.cpp)
target_link_libraries(map2 ${catkin_LIBRARIES})
