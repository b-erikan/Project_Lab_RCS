; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude ExecuteTrajectoryResult.msg.html

(cl:defclass <ExecuteTrajectoryResult> (roslisp-msg-protocol:ros-message)
  ((error_code
    :reader error_code
    :initarg :error_code
    :type moveit_msgs-msg:MoveItErrorCodes
    :initform (cl:make-instance 'moveit_msgs-msg:MoveItErrorCodes)))
)

(cl:defclass ExecuteTrajectoryResult (<ExecuteTrajectoryResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecuteTrajectoryResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecuteTrajectoryResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<ExecuteTrajectoryResult> is deprecated: use moveit_msgs-msg:ExecuteTrajectoryResult instead.")))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <ExecuteTrajectoryResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:error_code-val is deprecated.  Use moveit_msgs-msg:error_code instead.")
  (error_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecuteTrajectoryResult>) ostream)
  "Serializes a message object of type '<ExecuteTrajectoryResult>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'error_code) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecuteTrajectoryResult>) istream)
  "Deserializes a message object of type '<ExecuteTrajectoryResult>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'error_code) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecuteTrajectoryResult>)))
  "Returns string type for a message object of type '<ExecuteTrajectoryResult>"
  "moveit_msgs/ExecuteTrajectoryResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecuteTrajectoryResult)))
  "Returns string type for a message object of type 'ExecuteTrajectoryResult"
  "moveit_msgs/ExecuteTrajectoryResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecuteTrajectoryResult>)))
  "Returns md5sum for a message object of type '<ExecuteTrajectoryResult>"
  "6a39f41e4bc445a437e9a0cabdd5ef5c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecuteTrajectoryResult)))
  "Returns md5sum for a message object of type 'ExecuteTrajectoryResult"
  "6a39f41e4bc445a437e9a0cabdd5ef5c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecuteTrajectoryResult>)))
  "Returns full string definition for message of type '<ExecuteTrajectoryResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# Error code - encodes the overall reason for failure~%MoveItErrorCodes error_code~%~%~%================================================================================~%MSG: moveit_msgs/MoveItErrorCodes~%int32 val~%~%# overall behavior~%int32 SUCCESS=1~%int32 FAILURE=99999~%~%int32 PLANNING_FAILED=-1~%int32 INVALID_MOTION_PLAN=-2~%int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3~%int32 CONTROL_FAILED=-4~%int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5~%int32 TIMED_OUT=-6~%int32 PREEMPTED=-7~%~%# planning & kinematics request errors~%int32 START_STATE_IN_COLLISION=-10~%int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11~%int32 START_STATE_INVALID=-26~%~%int32 GOAL_IN_COLLISION=-12~%int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13~%int32 GOAL_CONSTRAINTS_VIOLATED=-14~%int32 GOAL_STATE_INVALID=-27~%int32 UNRECOGNIZED_GOAL_TYPE=-28~%~%int32 INVALID_GROUP_NAME=-15~%int32 INVALID_GOAL_CONSTRAINTS=-16~%int32 INVALID_ROBOT_STATE=-17~%int32 INVALID_LINK_NAME=-18~%int32 INVALID_OBJECT_NAME=-19~%~%# system errors~%int32 FRAME_TRANSFORM_FAILURE=-21~%int32 COLLISION_CHECKING_UNAVAILABLE=-22~%int32 ROBOT_STATE_STALE=-23~%int32 SENSOR_INFO_STALE=-24~%int32 COMMUNICATION_FAILURE=-25~%int32 CRASH=-29~%int32 ABORT=-30~%~%# kinematics errors~%int32 NO_IK_SOLUTION=-31~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecuteTrajectoryResult)))
  "Returns full string definition for message of type 'ExecuteTrajectoryResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# Error code - encodes the overall reason for failure~%MoveItErrorCodes error_code~%~%~%================================================================================~%MSG: moveit_msgs/MoveItErrorCodes~%int32 val~%~%# overall behavior~%int32 SUCCESS=1~%int32 FAILURE=99999~%~%int32 PLANNING_FAILED=-1~%int32 INVALID_MOTION_PLAN=-2~%int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3~%int32 CONTROL_FAILED=-4~%int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5~%int32 TIMED_OUT=-6~%int32 PREEMPTED=-7~%~%# planning & kinematics request errors~%int32 START_STATE_IN_COLLISION=-10~%int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11~%int32 START_STATE_INVALID=-26~%~%int32 GOAL_IN_COLLISION=-12~%int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13~%int32 GOAL_CONSTRAINTS_VIOLATED=-14~%int32 GOAL_STATE_INVALID=-27~%int32 UNRECOGNIZED_GOAL_TYPE=-28~%~%int32 INVALID_GROUP_NAME=-15~%int32 INVALID_GOAL_CONSTRAINTS=-16~%int32 INVALID_ROBOT_STATE=-17~%int32 INVALID_LINK_NAME=-18~%int32 INVALID_OBJECT_NAME=-19~%~%# system errors~%int32 FRAME_TRANSFORM_FAILURE=-21~%int32 COLLISION_CHECKING_UNAVAILABLE=-22~%int32 ROBOT_STATE_STALE=-23~%int32 SENSOR_INFO_STALE=-24~%int32 COMMUNICATION_FAILURE=-25~%int32 CRASH=-29~%int32 ABORT=-30~%~%# kinematics errors~%int32 NO_IK_SOLUTION=-31~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecuteTrajectoryResult>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'error_code))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecuteTrajectoryResult>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecuteTrajectoryResult
    (cl:cons ':error_code (error_code msg))
))
