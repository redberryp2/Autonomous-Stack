cmake_minimum_required(VERSION 3.0.2)
project(test_pkg)


find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  nav_msgs
  geometry_msgs
  message_generation
)

find_package(cmake_modules REQUIRED)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

## find_package(Eigen REQUIRED)

## include_directories(${Eigen_INCLUDE_DIRS})

add_message_files(
	DIRECTORY msg
	FILES
	test_msg.msg
)

generate_messages(
DEPENDENCIES
   DEPENDENCIES
   geometry_msgs
   nav_msgs
   std_msgs
 )
 
 catkin_package(
  CATKIN_DEPENDS 
  ## DEPENDS Eigen
  roscpp
  std_msgs
  nav_msgs
  geometry_msgs
  message_runtime
)

include_directories(
 include 
 ${catkin_INCLUDE_DIRS}
)

add_executable(pub src/pub_src.cpp)
target_link_libraries(pub ${catkin_LIBRARIES})

add_executable(sub src/sub_src.cpp)
target_link_libraries(sub ${catkin_LIBRARIES})
