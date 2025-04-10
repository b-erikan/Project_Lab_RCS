# Install script for directory: /home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/src/moveit/moveit_planners/chomp/chomp_optimizer_adapter

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install" TYPE PROGRAM FILES "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install" TYPE PROGRAM FILES "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/setup.bash;/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install" TYPE FILE FILES
    "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/setup.bash"
    "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/setup.sh;/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install" TYPE FILE FILES
    "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/setup.sh"
    "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/setup.zsh;/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install" TYPE FILE FILES
    "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/setup.zsh"
    "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/install" TYPE FILE FILES "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/.rosinstall")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/moveit_chomp_optimizer_adapter.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_chomp_optimizer_adapter/cmake" TYPE FILE FILES
    "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/moveit_chomp_optimizer_adapterConfig.cmake"
    "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/catkin_generated/installspace/moveit_chomp_optimizer_adapterConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_chomp_optimizer_adapter" TYPE FILE FILES "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/src/moveit/moveit_planners/chomp/chomp_optimizer_adapter/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_chomp_optimizer_adapter" TYPE FILE FILES "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/src/moveit/moveit_planners/chomp/chomp_optimizer_adapter/chomp_optimizer_adapter_plugin_description.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so.1.1.16" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so.1.1.16")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so.1.1.16"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/devel/.private/moveit_chomp_optimizer_adapter/lib/libmoveit_chomp_optimizer_adapter.so.1.1.16")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so.1.1.16" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so.1.1.16")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so.1.1.16"
         OLD_RPATH "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/devel/.private/moveit_core/lib:/opt/ros/noetic/lib/x86_64-linux-gnu:/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/devel/.private/geometric_shapes/lib:/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/devel/.private/srdfdom/lib:/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/devel/.private/chomp_motion_planner/lib:/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so.1.1.16")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/devel/.private/moveit_chomp_optimizer_adapter/lib/libmoveit_chomp_optimizer_adapter.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so"
         OLD_RPATH "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/devel/.private/moveit_core/lib:/opt/ros/noetic/lib/x86_64-linux-gnu:/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/devel/.private/geometric_shapes/lib:/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/devel/.private/srdfdom/lib:/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/devel/.private/chomp_motion_planner/lib:/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmoveit_chomp_optimizer_adapter.so")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/gtest/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/sysgen/Project_Lab_P5/Project_Lab_CAS/new_ws/build/moveit_chomp_optimizer_adapter/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
