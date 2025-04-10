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
2. Install libfranka:
```bash
   cd ~/catkin_ws/src
git clone --recursive https://github.com/frankaemika/libfranka.git
cd libfranka
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .
sudo make install
   ```
3. Install franka_ros!:
   ```bash
   cd ~/catkin_ws/src
git clone --recursive https://github.com/frankaemika/franka_ros.git

   ```

4. Clone this repository into your catkin workspace:
   ```bash
   cd ~/catkin_ws/src
   git clone https://github.com/b-erikan/Project_Lab_RCS.git
   ```

5. Build the package:
   ```bash
   cd ~/catkin_ws
   catkin_make
   ```

6. Source your workspace:
   ```bash
   source ~/catkin_ws/devel/setup.bash
   ```

## Usage

2. Ensure Franka Control Interface (FCI) is enabled.

2. Launch the Franka robot drivers and MoveIt:
   ```bash
   # First launch the robot and MoveIt 
   roslaunch panda_moveit_config franka_control.launch robot_ip := (your robot ip) load_gripper := True
   ```

3. Run the gripper control node:
   ```bash
   rosrun franka_example_nodes gripper_control
   ```


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
