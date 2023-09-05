# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "plnctrl: 5 messages, 0 services")

set(MSG_I_FLAGS "-Iplnctrl:/home/autonav/catkin_ws/src/plnctrl/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Ivisualization_msgs:/opt/ros/noetic/share/visualization_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(plnctrl_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg" NAME_WE)
add_custom_target(_plnctrl_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "plnctrl" "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg" ""
)

get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg" NAME_WE)
add_custom_target(_plnctrl_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "plnctrl" "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg" ""
)

get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg" NAME_WE)
add_custom_target(_plnctrl_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "plnctrl" "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg" ""
)

get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg" NAME_WE)
add_custom_target(_plnctrl_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "plnctrl" "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg" "plnctrl/objInfo"
)

get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg" NAME_WE)
add_custom_target(_plnctrl_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "plnctrl" "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/plnctrl
)
_generate_msg_cpp(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/plnctrl
)
_generate_msg_cpp(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/plnctrl
)
_generate_msg_cpp(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/plnctrl
)
_generate_msg_cpp(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/plnctrl
)

### Generating Services

### Generating Module File
_generate_module_cpp(plnctrl
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/plnctrl
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(plnctrl_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(plnctrl_generate_messages plnctrl_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_cpp _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_cpp _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_cpp _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_cpp _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_cpp _plnctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(plnctrl_gencpp)
add_dependencies(plnctrl_gencpp plnctrl_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS plnctrl_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/plnctrl
)
_generate_msg_eus(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/plnctrl
)
_generate_msg_eus(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/plnctrl
)
_generate_msg_eus(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/plnctrl
)
_generate_msg_eus(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/plnctrl
)

### Generating Services

### Generating Module File
_generate_module_eus(plnctrl
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/plnctrl
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(plnctrl_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(plnctrl_generate_messages plnctrl_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_eus _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_eus _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_eus _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_eus _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_eus _plnctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(plnctrl_geneus)
add_dependencies(plnctrl_geneus plnctrl_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS plnctrl_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/plnctrl
)
_generate_msg_lisp(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/plnctrl
)
_generate_msg_lisp(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/plnctrl
)
_generate_msg_lisp(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/plnctrl
)
_generate_msg_lisp(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/plnctrl
)

### Generating Services

### Generating Module File
_generate_module_lisp(plnctrl
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/plnctrl
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(plnctrl_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(plnctrl_generate_messages plnctrl_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_lisp _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_lisp _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_lisp _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_lisp _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_lisp _plnctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(plnctrl_genlisp)
add_dependencies(plnctrl_genlisp plnctrl_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS plnctrl_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/plnctrl
)
_generate_msg_nodejs(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/plnctrl
)
_generate_msg_nodejs(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/plnctrl
)
_generate_msg_nodejs(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/plnctrl
)
_generate_msg_nodejs(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/plnctrl
)

### Generating Services

### Generating Module File
_generate_module_nodejs(plnctrl
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/plnctrl
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(plnctrl_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(plnctrl_generate_messages plnctrl_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_nodejs _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_nodejs _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_nodejs _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_nodejs _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_nodejs _plnctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(plnctrl_gennodejs)
add_dependencies(plnctrl_gennodejs plnctrl_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS plnctrl_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/plnctrl
)
_generate_msg_py(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/plnctrl
)
_generate_msg_py(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/plnctrl
)
_generate_msg_py(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/plnctrl
)
_generate_msg_py(plnctrl
  "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/plnctrl
)

### Generating Services

### Generating Module File
_generate_module_py(plnctrl
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/plnctrl
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(plnctrl_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(plnctrl_generate_messages plnctrl_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/CtrlCmd.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_py _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/GNSSInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_py _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_py _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/objsInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_py _plnctrl_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/autonav/catkin_ws/src/plnctrl/msg/signalInfo.msg" NAME_WE)
add_dependencies(plnctrl_generate_messages_py _plnctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(plnctrl_genpy)
add_dependencies(plnctrl_genpy plnctrl_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS plnctrl_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/plnctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/plnctrl
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(plnctrl_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(plnctrl_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET visualization_msgs_generate_messages_cpp)
  add_dependencies(plnctrl_generate_messages_cpp visualization_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/plnctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/plnctrl
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(plnctrl_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(plnctrl_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET visualization_msgs_generate_messages_eus)
  add_dependencies(plnctrl_generate_messages_eus visualization_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/plnctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/plnctrl
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(plnctrl_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(plnctrl_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET visualization_msgs_generate_messages_lisp)
  add_dependencies(plnctrl_generate_messages_lisp visualization_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/plnctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/plnctrl
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(plnctrl_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(plnctrl_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET visualization_msgs_generate_messages_nodejs)
  add_dependencies(plnctrl_generate_messages_nodejs visualization_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/plnctrl)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/plnctrl\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/plnctrl
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(plnctrl_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(plnctrl_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET visualization_msgs_generate_messages_py)
  add_dependencies(plnctrl_generate_messages_py visualization_msgs_generate_messages_py)
endif()
