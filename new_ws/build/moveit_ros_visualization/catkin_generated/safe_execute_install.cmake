execute_process(COMMAND "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_ros_visualization/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_ros_visualization/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
