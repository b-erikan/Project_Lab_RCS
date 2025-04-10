# Franka Emika Panda Robot Control System

This repository contains ROS-based control software for the Franka Emika Panda robot arm, focusing on pick-and-place operations with integrated vision-based object detection.

## Overview

The system enables a Franka Emika Panda robot to:
- Scan for objects using a camera mounted on the end-effector
- Process position data from the camera
- Plan and execute collision-free motion paths
- Grip and release objects with the Franka gripper
- Place objects at designated target positions

## System Requirements

### Hardware
- Franka Emika Panda robot arm
- Franka gripper
- Camera system (mounted on the end-effector)

### Software Dependencies
- ROS (Robot Operating System)
- MoveIt! motion planning framework
- Franka ROS packages
- TF2 (Transform Library)
- ActionLib

## Package Dependencies

The following ROS packages are required:
- `moveit_core`
- `moveit_commander`
- `moveit_ros_planning_interface`
- `moveit_visual_tools`
- `roscpp`
- `geometry_msgs`
- `moveit_msgs`
- `shape_msgs`
- `std_msgs`
- `sensor_msgs`
- `franka_gripper`
- `action_lib`
- `libfranka`
- `tf2`
- `tf2_ros`
- `tf2_geometry_msgs`

## Installation

1. Install MoveIt!:
   ```bash
   sudo apt install ros-<distro>-moveit
   ```
2. Clone this repository into your catkin workspace:
   ```bash
   cd ~/catkin_ws/src
   git clone https://github.com/b-erikan/Project_Lab_RCS.git
   ```

3. Build the package:
   ```bash
   cd ~/catkin_ws
   catkin_make
   ```

4. Source your workspace:
   ```bash
   source ~/catkin_ws/devel/setup.bash
   ```

## Usage

1. Ensure Franka Control Interface (FCI) is enabled.

2. Launch the Franka robot drivers and MoveIt:
   ```bash
   # First launch the robot and MoveIt 
   roslaunch panda_moveit_config franka_control.launch robot_ip := (your robot ip) load_gripper := True
   ```

3. Run the gripper control node:
   ```bash
   rosrun franka_example_nodes gripper_control
   ```


Modules and Their Roles
------------------------

1. MoveIt (moveit/move_group_interface, moveit/planning_scene_interface)
   - Used for high-level motion planning.
   - The MoveGroupInterface manages goal states, planners, and execution.
   - PlanningSceneInterface manages the world state, including collision objects.

2. Franka Gripper Action (franka_gripper/GraspAction, MoveItSimpleControllerManager)
   - Provides gripper control (grasp and release actions).
   - Enables direct actionlib communication with the Franka Gripper.

3. TF2 (tf2_ros/Buffer, tf2_ros/TransformListener)
   - Handles real-time transformation between coordinate frames.
   - Used to get the object pose in the robot base frame from the camera frame.

4. Geometry and Messages (geometry_msgs, moveit_msgs)
   - Used for defining poses, orientation, and movement requests.
   - moveit_msgs manages planning and trajectory execution results.

5. Visual Tools (moveit_visual_tools)
   - Provides real-time visualization in RViz for poses, paths, and markers.
   - Enhances debugging and user feedback during path planning.

6. Actionlib (actionlib/client/simple_action_client)
   - Handles communication with asynchronous action servers like the Franka Gripper.

7. Standard ROS Utilities (ros/ros.h, ros/duration.h)
   - Provides timing, logging, and node initialization support.

8. Standard C++ Libraries (iostream, vector, memory)
   - Used for general-purpose logic, memory management, and input/output.


## Features

### Manipulator Class

The main `Manipulator` class provides the following capabilities:

- **Motion Planning**:
  - `goToPose()`: Plan and execute motion to a target pose
  - `goToPoseCartesian()`: Plan and execute Cartesian path to a target pose
  
- **Gripper Control**:
  - `grab()`: Close the gripper to grasp objects
  - `release()`: Open the gripper to release objects
  
- **Object Perception**:
  - `scan()`: Read position data from the camera system
  - `transformPose()`: Transform poses between different coordinate frames
  
- **Collision Management**:
  - `addObjectToWorkspace()`: Add collision objects to the planning scene

### Vision System

The system processes camera data through a file-based approach:
- Reads calibrated position data from `/tmp/quaternion_average.txt`
- Formats expected: quaternion (orientation), position coordinates, and sample count

### Planning Strategies

The system implements multiple planning approaches:
- Uses various MoveIt planners (RRTConnect, LBKPIECE, BiTRRT, TRRT)
- Attempts multiple planning strategies with increasing timeouts
- Adjusts goal tolerance for challenging positions

## Workflow

The main pick-and-place workflow:

1. Initialize the robot and planning scene
2. Add workspace objects (including obstacles)
3. Move to scanning position
4. Scan for object (three attempts for increased precision)
5. Move above detected object
6. Grasp the object
7. Transport to target position
8. Release the object
9. Return to home position



## Contributors

Ahmet Berke Erikan
