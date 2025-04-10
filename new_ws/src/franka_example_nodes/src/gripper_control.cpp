#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>
#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>
#include <moveit_visual_tools/moveit_visual_tools.h>
#include <franka_gripper/GraspAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <fstream>
#include <string>
#include <sstream>
namespace rvt = rviz_visual_tools;

const double tau = 2 * M_PI; // The circle constant tau = 2*pi. One tau is one rotation in radians.

class Manipulator
{
public:
  Manipulator();
  bool goToPose(geometry_msgs::Pose target_pose);
  bool goToPoseCartesian(geometry_msgs::Pose target_pose);
  void grab();
  void release();
  void printCurrentState();
  geometry_msgs::Pose getCurrentPose();
  void addObjectToWorkspace(geometry_msgs::Pose object_pose, float x_dim, float y_dim, float z_dim);
  geometry_msgs::Pose transformPose(const geometry_msgs::Pose &pose, const std::string &from_frame, const std::string &to_frame);
  // std::string Manipulator::getEndEffectorLink() const;
  geometry_msgs::Pose scan();

private:
  static const std::string PLANNING_GROUP; // Define the static constant outside the class
  moveit::planning_interface::MoveGroupInterface move_group_interface;
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup *joint_model_group;
  moveit_visual_tools::MoveItVisualTools visual_tools;
  actionlib::SimpleActionClient<franka_gripper::GraspAction> gripper_client;
  std::vector<moveit_msgs::CollisionObject> collision_objects;
  tf2_ros::Buffer tf_buffer;
  tf2_ros::TransformListener tf_listener;
};

const std::string Manipulator::PLANNING_GROUP = "panda_arm"; // Initialization outside the class

Manipulator::Manipulator()
    : move_group_interface(PLANNING_GROUP),
      visual_tools("panda_link0"), // Initialize visual tools and move_group_interface here
      gripper_client("/franka_gripper/grasp", true),
      tf_buffer(ros::Duration(10.0)),
      tf_listener(tf_buffer)
{
  visual_tools.deleteAllMarkers();
  visual_tools.loadRemoteControl();

  ROS_INFO_NAMED("tutorial", "Planning frame: %s", move_group_interface.getPlanningFrame().c_str());
  ROS_INFO_NAMED("tutorial", "End effector link: %s", move_group_interface.getEndEffectorLink().c_str());
  ROS_INFO_NAMED("tutorial", "Available Planning Groups:");

  std::copy(move_group_interface.getJointModelGroupNames().begin(),
            move_group_interface.getJointModelGroupNames().end(),
            std::ostream_iterator<std::string>(std::cout, ", "));

  joint_model_group = move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  collision_objects.clear();
  visual_tools.trigger();
}
geometry_msgs::Pose Manipulator::transformPose(const geometry_msgs::Pose &pose_camera,
                                               const std::string &from_frame,
                                               const std::string &to_frame)
{
  const float cos45 = 0.70710678118f; // cos(45 degrees)
  const float sin45 = 0.70710678118f; // sin(45 degrees)

  // Apply the 2D rotation matrix for rotating around the Z-axis

  geometry_msgs::Pose pose_calibrated;
  geometry_msgs::PoseStamped pose_stamped;

  pose_calibrated.position.x = pose_camera.position.x + 0.01;
  pose_calibrated.position.y = pose_camera.position.y - 0.08;
  pose_calibrated.position.z = pose_camera.position.z - 0.11;

  pose_stamped.pose.position.x = pose_calibrated.position.x * cos45 - pose_calibrated.position.y * sin45;
  pose_stamped.pose.position.y = pose_calibrated.position.x * sin45 + pose_calibrated.position.y * cos45;
  pose_stamped.pose.position.z = pose_calibrated.position.z; // No change to the z-component during rotation around Z-axis

  pose_stamped.pose.orientation = pose_camera.orientation;

  pose_stamped.header.frame_id = from_frame;
  // pose_stamped.header.stamp = ros::Time::now();

  geometry_msgs::PoseStamped transformed_pose;

  try
  {
    tf_buffer.transform(pose_stamped, transformed_pose, to_frame);
    ROS_INFO("Transformed pose from %s to %s", from_frame.c_str(), to_frame.c_str());
    return transformed_pose.pose;
  }
  catch (tf2::TransformException &ex)
  {
    ROS_ERROR("Transform failed: %s", ex.what());
    // Return original pose if transformation fails
    return pose_camera;
  }
}

bool Manipulator::goToPose(geometry_msgs::Pose target_pose)
{
  
      moveit::core::RobotStatePtr current_state = move_group_interface.getCurrentState();
      moveit::core::RobotState start_state(*current_state);
      move_group_interface.setStartState(start_state);
      // List of planners to try (in order of preference)
      std::vector<std::string> planners = {"RRTConnect","LBKPIECE","BiTRRT", "TRRT"};
    
      for (int attempt = 0; attempt < 4; attempt++) {
          // Try different planners for each attempt
          std::string planner = planners[attempt % planners.size()];
          double planning_time = 5.0 * (attempt + 1);  // Increase planning time with each attempt
          
          ROS_INFO("Planning attempt %d using %s planner with %f seconds timeout", 
                   attempt + 1, planner.c_str(), planning_time);
          
          // Set up planner parameters
          move_group_interface.setPlannerId(planner);
          move_group_interface.setPlanningTime(planning_time);
          move_group_interface.clearPoseTarget();
          move_group_interface.setPoseTarget(target_pose);
          
          // For later attempts, try increasing the allowed goal tolerance slightly
          if (attempt > 0) {
              double tolerance = 0.01 * attempt;  // Increase by 1cm per attempt
              move_group_interface.setGoalPositionTolerance(tolerance);
              move_group_interface.setGoalOrientationTolerance(0.1 * attempt);  // In radians
          }
          
          // Plan with collision avoidance
          moveit::planning_interface::MoveGroupInterface::Plan my_plan;
          bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
          
          if (success) {
              // Visualize the plan
              visual_tools.deleteAllMarkers();
              visual_tools.publishAxisLabeled(target_pose, "pose1");
              visual_tools.publishText(target_pose, "Pose Goal", rvt::WHITE, rvt::XLARGE);
              visual_tools.publishTrajectoryLine(my_plan.trajectory_, joint_model_group);
              visual_tools.trigger();
              
              // Execute the motion
              move_group_interface.setMaxVelocityScalingFactor(0.1);
              move_group_interface.setMaxAccelerationScalingFactor(0.1);
              
              ROS_INFO("Found collision-free path using %s planner on attempt %d", 
                       planner.c_str(), attempt + 1);
              move_group_interface.execute(my_plan);
              return true;
          }
          
          ROS_WARN("Attempt %d failed to find a collision-free path", attempt + 1);
      }
      
      ROS_ERROR("All planning attempts failed, could not find collision-free path to target");
      return false; 
/* 
  move_group_interface.clearPoseTarget();
  move_group_interface.setPlanningTime(30.0);
  move_group_interface.setPoseTarget(target_pose);
  moveit::planning_interface::MoveGroupInterface::Plan my_plan;

  bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);

  if (success)
  {
    
    visual_tools.publishAxisLabeled(target_pose, "pose1");

    geometry_msgs::Pose text_pose;
    visual_tools.publishText(text_pose, "Pose Goal", rvt::WHITE, rvt::XLARGE);
    visual_tools.publishTrajectoryLine(my_plan.trajectory_, joint_model_group);
    visual_tools.trigger();
    // std::cin.get();
    move_group_interface.setMaxVelocityScalingFactor(0.1);
    move_group_interface.setMaxAccelerationScalingFactor(0.1);
    move_group_interface.execute(my_plan);
  }

  return success;*/
}

bool Manipulator::goToPoseCartesian(geometry_msgs::Pose target_pose)
{
  // Get the current pose of the robot
  move_group_interface.clearPoseTarget();
  geometry_msgs::Pose current_pose = move_group_interface.getCurrentPose().pose;

  // Define waypoints for the Cartesian path (start from the current pose)
  std::vector<geometry_msgs::Pose> waypoints;
  waypoints.push_back(current_pose); // Add the current pose as the start point
  waypoints.push_back(target_pose);  // Add the target pose as the end point

  // Compute the Cartesian path
  moveit::planning_interface::MoveGroupInterface::Plan cartesian_plan;
  const double jump_threshold = 0; // Set to 0.0 to prevent any jump (can be adjusted)
  const double eef_step = 0.005;   // Step size for the end effector (in meters)

  moveit::core::RobotStatePtr current_state = move_group_interface.getCurrentState();
  moveit::core::RobotState start_state(*current_state);
  move_group_interface.setStartState(start_state);

  // Plan the Cartesian path
  move_group_interface.computeCartesianPath(waypoints, eef_step, jump_threshold, cartesian_plan.trajectory_);

  // Execute the plan
  bool success = (cartesian_plan.trajectory_.joint_trajectory.points.size() > 0);
  if (success)
  {
    // visual_tools.publishTrajectoryLine(cartesian_plan.trajectory_, joint_model_group);
    // visual_tools.trigger();
    move_group_interface.setMaxVelocityScalingFactor(0.1);
    move_group_interface.setMaxAccelerationScalingFactor(0.1);
    move_group_interface.execute(cartesian_plan.trajectory_);
  }

  return success;
}

void Manipulator::release()
{
  franka_gripper::GraspGoal goal;
  goal.width = 0.08; // Open gripper to a width of 8 cm (adjust based on your needs)
  // goal.force = 0.0; // Apply 10 N of force
  goal.speed = 0.1; // Speed at which to open
  goal.epsilon.inner = 0.005;
  goal.epsilon.outer = 0.005;

  // Send goal to the gripper action server
  gripper_client.sendGoal(goal);
  gripper_client.waitForResult(ros::Duration(10.0)); // Wait for 10 seconds for the result

  if (gripper_client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
  {
    ROS_INFO("Object released!");
  }
  else
  {
    ROS_ERROR("Failed to open gripper");
  }
}

void Manipulator::grab()
{
  franka_gripper::GraspGoal goal;
  franka_gripper::GraspAction grasp;
  goal.width = 0.045; // Close gripper to a width of 0 (completely closed)
  goal.force = 100.0; // Apply 100 N of force to grasp
  goal.speed = 0.05;  // Speed at which to close
  goal.epsilon.inner = 0.005;
  goal.epsilon.outer = 0.005;

  // Send goal to the gripper action server
  gripper_client.sendGoal(goal);
  gripper_client.waitForResult(ros::Duration(10.0)); // Wait for 10 seconds for the result

  if (gripper_client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
  {
    ROS_INFO("Object grabbed!");
  }
  else
  {
    ROS_ERROR("Failed to close gripper");
  }
}

void Manipulator::printCurrentState()
{
  // Get the current pose of the robot
  geometry_msgs::Pose current_pose = move_group_interface.getCurrentPose().pose;

  // Print the current position
  ROS_INFO("Current Position: [x: %.2f, y: %.2f, z: %.2f]", current_pose.position.x, current_pose.position.y, current_pose.position.z);

  // Print the current orientation (quaternion)
  ROS_INFO("Current Orientation (Quaternion): [x: %.2f, y: %.2f, z: %.2f, w: %.2f]",
           current_pose.orientation.x, current_pose.orientation.y, current_pose.orientation.z, current_pose.orientation.w);
}

void Manipulator::addObjectToWorkspace(geometry_msgs::Pose object_pose, float x_dim, float y_dim, float z_dim)
{

  moveit_msgs::CollisionObject collision_object;
  collision_object.header.frame_id = move_group_interface.getPlanningFrame();

  // Create a unique ID for each object
  static int object_count = 0;
  std::string object_id = "box" + std::to_string(++object_count);
  collision_object.id = object_id;

  shape_msgs::SolidPrimitive primitive;
  primitive.type = primitive.BOX;
  primitive.dimensions.resize(3);
  primitive.dimensions[primitive.BOX_X] = x_dim;
  primitive.dimensions[primitive.BOX_Y] = y_dim;
  primitive.dimensions[primitive.BOX_Z] = z_dim;

  collision_object.primitives.push_back(primitive);
  collision_object.primitive_poses.push_back(object_pose);
  collision_object.operation = collision_object.ADD;

  // Create a vector with just this new object
  std::vector<moveit_msgs::CollisionObject> new_collision_object;
  new_collision_object.push_back(collision_object);

  // Add just the new object to the planning scene
  planning_scene_interface.addCollisionObjects(new_collision_object);

  // Optional: Store the new object in your class's collision_objects vector for tracking
  collision_objects.push_back(collision_object);

  visual_tools.trigger();
  return;

  /*
  moveit_msgs::CollisionObject collision_object;
  collision_object.header.frame_id = move_group_interface.getPlanningFrame();

  // The id of the object is used to identify it.
  collision_object.id = "box1";
  shape_msgs::SolidPrimitive primitive;
  primitive.type = primitive.BOX;
  primitive.dimensions.resize(3);
  primitive.dimensions[primitive.BOX_X] = x_dim;
  primitive.dimensions[primitive.BOX_Y] = y_dim;
  primitive.dimensions[primitive.BOX_Z] = z_dim;

  collision_object.primitives.push_back(primitive);
  collision_object.primitive_poses.push_back(object_pose);
  collision_object.operation = collision_object.ADD;

  collision_objects.push_back(collision_object);
  planning_scene_interface.addCollisionObjects(collision_objects);
  visual_tools.trigger();
  return; */
}
geometry_msgs::Pose Manipulator::getCurrentPose()
{
  // Get the current pose of the robot
  geometry_msgs::Pose current_pose = move_group_interface.getCurrentPose().pose;
  return current_pose;
}

/*std::string Manipulator::getEndEffectorLink() const
{
  return move_group_interface.getEndEffectorLink();
}*/

struct PositionData
{
  // Quaternion (x, y, z, w)
  double qx, qy, qz, qw;

  // Position (x, y, z)
  double px, py, pz;

  // Number of samples
  int samples;
};

geometry_msgs::Pose Manipulator::scan()
{
  geometry_msgs::Pose scanned_pose;

  std::string filename = "/tmp/quaternion_average.txt";
  std::ifstream file(filename);
  if (!file.is_open())
  {
    throw std::runtime_error("Could not open file: " + filename);
  }

  PositionData data;
  std::string line;

  // Read quaternion line (starts with Q)
  if (std::getline(file, line))
  {
    std::istringstream iss(line);
    std::string prefix;
    iss >> prefix;

    if (prefix != "Q")
    {
      throw std::runtime_error("Invalid format: Expected Q for quaternion line");
    }

    if (!(iss >> scanned_pose.orientation.w >> scanned_pose.orientation.x >> scanned_pose.orientation.y >> scanned_pose.orientation.z))
    {
      // std::cout << "Raw line: [" << line << "]" << std::endl;
      throw std::runtime_error("Failed to parse quaternion values");
    }
  }
  else
  {
    throw std::runtime_error("File is empty or could not read quaternion line");
  }

  // Read position line (starts with P)
  if (std::getline(file, line))
  {
    std::istringstream iss(line);
    std::string prefix;
    iss >> prefix;

    if (prefix != "P")
    {
      throw std::runtime_error("Invalid format: Expected P for position line");
    }

    if (!(iss >> scanned_pose.position.x >> scanned_pose.position.y >> scanned_pose.position.z))
    {
      throw std::runtime_error("Failed to parse position values");
    }
  }
  else
  {
    throw std::runtime_error("Could not read position line");
  }

  // Read samples line (starts with S)
  if (std::getline(file, line))
  {
    std::istringstream iss(line);
    std::string prefix;
    iss >> prefix;

    if (prefix != "S")
    {
      throw std::runtime_error("Invalid format: Expected S for samples line");
    }

    if (!(iss >> data.samples))
    {
      throw std::runtime_error("Failed to parse sample count");
    }
  }
  else
  {
    throw std::runtime_error("Could not read samples line");
  }
  scanned_pose.position.z = 0.475;
  scanned_pose.orientation.x = 0;
  scanned_pose.orientation.y = 0;
  scanned_pose.orientation.z = 0;
  scanned_pose.orientation.w = 1;

  file.close();

  std::cout << "Position (x,y,z): " << scanned_pose.position.x << ", " << scanned_pose.position.y << ", "
            << scanned_pose.position.z << std::endl;
  std::cout << "Position (w,x,y,z): " << scanned_pose.orientation.w << ", " << scanned_pose.orientation.x << ", " << scanned_pose.orientation.y << ", "
            << scanned_pose.orientation.z << std::endl;
  std::cout << "Samples: " << data.samples << std::endl;
  return scanned_pose;
}

// Example usage

int main(int argc, char **argv)
{
  std::string base_frame = "panda_link0";
  std::string camera_frame = "panda_link8";

  ros::init(argc, argv, "franka_example_nodes");
  ros::NodeHandle node_handle;

  ros::AsyncSpinner spinner(1);
  spinner.start();
  Manipulator arm;
  geometry_msgs::Pose box_location;
  geometry_msgs::Pose above_box_location;
  geometry_msgs::Pose hole_location;
  geometry_msgs::Pose place_holder;
  geometry_msgs::Pose home_pose;
  geometry_msgs::Pose scan_pose;
  geometry_msgs::Pose obstacle_pose;

  arm.printCurrentState();

  ros::Duration(3).sleep();

  scan_pose.orientation.x = 1;
  scan_pose.orientation.y = 0.0;
  scan_pose.orientation.z = 0.0;
  scan_pose.orientation.w = 0.0;
  scan_pose.position.x = 0.35;
  scan_pose.position.y = 0.35;
  scan_pose.position.z = 0.5;

  hole_location.position.x = 0.27;
  hole_location.position.y = 0.63;
  hole_location.position.z = 0.15;//0.015;
  hole_location.orientation.w=0;
  hole_location.orientation.x=1;
  hole_location.orientation.y=0;
  hole_location.orientation.z=0;

  place_holder=hole_location;
  place_holder.position.z=0.01;
  place_holder.orientation.w = 0.9239;
  place_holder.orientation.x = 0;
  place_holder.orientation.y = 0;
  place_holder.orientation.z = -0.3827;
  
  arm.addObjectToWorkspace(place_holder, 0.10, 0.18, 0.01);

  char ch;
  std::cout << "Add the obstacle to the workspace? (y / n): ";
  std::cin >> ch;

  if (ch == 'y' || ch == 'Y')
  {
    std::cout << "Obstacle added!\n"
              << std::endl;
    obstacle_pose = scan_pose;
    obstacle_pose.position.z = 0.1;
    obstacle_pose.orientation.w = 0.9239;
    obstacle_pose.orientation.x = 0;
    obstacle_pose.orientation.y = -0;
    obstacle_pose.orientation.z = -0.3827;
    arm.addObjectToWorkspace(obstacle_pose, 0.06, 0.17, 0.18);
  }

  // First scan
  arm.goToPose(scan_pose);
  ROS_INFO("Scanning 1st attempt...");
  // arm.release();
  ros::Duration(7).sleep();
  box_location = arm.scan();
  box_location.position.y += 0.08;
  box_location = arm.transformPose(box_location, camera_frame, base_frame);
  ros::Duration(1).sleep();
  above_box_location = box_location;
  above_box_location.position.z = 0.475;

  arm.goToPose(above_box_location);

  // Second scan
  ROS_INFO("Scanning 2nd attempt...");
  ros::Duration(7).sleep();
  box_location = arm.scan();
  box_location.position.y += 0.08;
  box_location = arm.transformPose(box_location, camera_frame, base_frame);
  ros::Duration(1).sleep();
  above_box_location = box_location;
  above_box_location.position.z = 0.475;

  arm.goToPose(above_box_location);

  // Third scan
  ROS_INFO("Scanning 3rd attempt...");
  ros::Duration(7).sleep();
  box_location = arm.scan();
  box_location = arm.transformPose(box_location, camera_frame, base_frame);
  box_location.position.z += 0.10;
  ros::Duration(1).sleep();
  arm.goToPose(box_location);
  ros::Duration(1).sleep();
  // std::cin.get();
  box_location.position.z -= 0.10;
  //ros::Duration(1).sleep();
  arm.goToPose(box_location);
  ros::Duration(1).sleep();
  arm.grab();
  ros::Duration(1).sleep();
  //arm.goToPose(scan_pose);
  //ros::Duration(2).sleep();

  arm.goToPose(hole_location);
  ros::Duration(1).sleep();

  arm.release();
  ros::Duration(1).sleep();

  // arm.goToPose(obstacle_pose);
  // ros::Duration(1).sleep();
  arm.goToPose(scan_pose);
  ros::Duration(1).sleep();
  // std::cin.get();

  return 0;
}
