
"use strict";

let PlaceActionFeedback = require('./PlaceActionFeedback.js');
let PlaceActionResult = require('./PlaceActionResult.js');
let MoveGroupAction = require('./MoveGroupAction.js');
let PickupResult = require('./PickupResult.js');
let MoveGroupActionResult = require('./MoveGroupActionResult.js');
let PickupActionFeedback = require('./PickupActionFeedback.js');
let MoveGroupSequenceResult = require('./MoveGroupSequenceResult.js');
let PickupGoal = require('./PickupGoal.js');
let PlaceResult = require('./PlaceResult.js');
let PickupAction = require('./PickupAction.js');
let MoveGroupActionGoal = require('./MoveGroupActionGoal.js');
let PlaceGoal = require('./PlaceGoal.js');
let MoveGroupActionFeedback = require('./MoveGroupActionFeedback.js');
let MoveGroupFeedback = require('./MoveGroupFeedback.js');
let ExecuteTrajectoryResult = require('./ExecuteTrajectoryResult.js');
let MoveGroupSequenceGoal = require('./MoveGroupSequenceGoal.js');
let MoveGroupSequenceFeedback = require('./MoveGroupSequenceFeedback.js');
let ExecuteTrajectoryActionGoal = require('./ExecuteTrajectoryActionGoal.js');
let MoveGroupSequenceActionResult = require('./MoveGroupSequenceActionResult.js');
let MoveGroupSequenceAction = require('./MoveGroupSequenceAction.js');
let PlaceActionGoal = require('./PlaceActionGoal.js');
let PickupActionResult = require('./PickupActionResult.js');
let ExecuteTrajectoryActionResult = require('./ExecuteTrajectoryActionResult.js');
let PickupFeedback = require('./PickupFeedback.js');
let ExecuteTrajectoryGoal = require('./ExecuteTrajectoryGoal.js');
let PlaceFeedback = require('./PlaceFeedback.js');
let MoveGroupResult = require('./MoveGroupResult.js');
let MoveGroupSequenceActionFeedback = require('./MoveGroupSequenceActionFeedback.js');
let ExecuteTrajectoryFeedback = require('./ExecuteTrajectoryFeedback.js');
let ExecuteTrajectoryAction = require('./ExecuteTrajectoryAction.js');
let MoveGroupSequenceActionGoal = require('./MoveGroupSequenceActionGoal.js');
let PickupActionGoal = require('./PickupActionGoal.js');
let MoveGroupGoal = require('./MoveGroupGoal.js');
let ExecuteTrajectoryActionFeedback = require('./ExecuteTrajectoryActionFeedback.js');
let PlaceAction = require('./PlaceAction.js');
let PlanningSceneWorld = require('./PlanningSceneWorld.js');
let RobotState = require('./RobotState.js');
let BoundingVolume = require('./BoundingVolume.js');
let JointLimits = require('./JointLimits.js');
let CartesianPoint = require('./CartesianPoint.js');
let PlannerInterfaceDescription = require('./PlannerInterfaceDescription.js');
let Constraints = require('./Constraints.js');
let GenericTrajectory = require('./GenericTrajectory.js');
let TrajectoryConstraints = require('./TrajectoryConstraints.js');
let CostSource = require('./CostSource.js');
let PlanningScene = require('./PlanningScene.js');
let GripperTranslation = require('./GripperTranslation.js');
let MotionSequenceItem = require('./MotionSequenceItem.js');
let PlanningSceneComponents = require('./PlanningSceneComponents.js');
let DisplayTrajectory = require('./DisplayTrajectory.js');
let CartesianTrajectoryPoint = require('./CartesianTrajectoryPoint.js');
let KinematicSolverInfo = require('./KinematicSolverInfo.js');
let PositionIKRequest = require('./PositionIKRequest.js');
let CartesianTrajectory = require('./CartesianTrajectory.js');
let AllowedCollisionMatrix = require('./AllowedCollisionMatrix.js');
let ContactInformation = require('./ContactInformation.js');
let MotionPlanRequest = require('./MotionPlanRequest.js');
let PlaceLocation = require('./PlaceLocation.js');
let LinkPadding = require('./LinkPadding.js');
let Grasp = require('./Grasp.js');
let MotionPlanResponse = require('./MotionPlanResponse.js');
let ConstraintEvalResult = require('./ConstraintEvalResult.js');
let CollisionObject = require('./CollisionObject.js');
let MotionSequenceRequest = require('./MotionSequenceRequest.js');
let ObjectColor = require('./ObjectColor.js');
let PlannerParams = require('./PlannerParams.js');
let OrientationConstraint = require('./OrientationConstraint.js');
let VisibilityConstraint = require('./VisibilityConstraint.js');
let MoveItErrorCodes = require('./MoveItErrorCodes.js');
let AttachedCollisionObject = require('./AttachedCollisionObject.js');
let AllowedCollisionEntry = require('./AllowedCollisionEntry.js');
let MotionPlanDetailedResponse = require('./MotionPlanDetailedResponse.js');
let MotionSequenceResponse = require('./MotionSequenceResponse.js');
let PositionConstraint = require('./PositionConstraint.js');
let PlanningOptions = require('./PlanningOptions.js');
let JointConstraint = require('./JointConstraint.js');
let OrientedBoundingBox = require('./OrientedBoundingBox.js');
let WorkspaceParameters = require('./WorkspaceParameters.js');
let LinkScale = require('./LinkScale.js');
let DisplayRobotState = require('./DisplayRobotState.js');
let RobotTrajectory = require('./RobotTrajectory.js');

module.exports = {
  PlaceActionFeedback: PlaceActionFeedback,
  PlaceActionResult: PlaceActionResult,
  MoveGroupAction: MoveGroupAction,
  PickupResult: PickupResult,
  MoveGroupActionResult: MoveGroupActionResult,
  PickupActionFeedback: PickupActionFeedback,
  MoveGroupSequenceResult: MoveGroupSequenceResult,
  PickupGoal: PickupGoal,
  PlaceResult: PlaceResult,
  PickupAction: PickupAction,
  MoveGroupActionGoal: MoveGroupActionGoal,
  PlaceGoal: PlaceGoal,
  MoveGroupActionFeedback: MoveGroupActionFeedback,
  MoveGroupFeedback: MoveGroupFeedback,
  ExecuteTrajectoryResult: ExecuteTrajectoryResult,
  MoveGroupSequenceGoal: MoveGroupSequenceGoal,
  MoveGroupSequenceFeedback: MoveGroupSequenceFeedback,
  ExecuteTrajectoryActionGoal: ExecuteTrajectoryActionGoal,
  MoveGroupSequenceActionResult: MoveGroupSequenceActionResult,
  MoveGroupSequenceAction: MoveGroupSequenceAction,
  PlaceActionGoal: PlaceActionGoal,
  PickupActionResult: PickupActionResult,
  ExecuteTrajectoryActionResult: ExecuteTrajectoryActionResult,
  PickupFeedback: PickupFeedback,
  ExecuteTrajectoryGoal: ExecuteTrajectoryGoal,
  PlaceFeedback: PlaceFeedback,
  MoveGroupResult: MoveGroupResult,
  MoveGroupSequenceActionFeedback: MoveGroupSequenceActionFeedback,
  ExecuteTrajectoryFeedback: ExecuteTrajectoryFeedback,
  ExecuteTrajectoryAction: ExecuteTrajectoryAction,
  MoveGroupSequenceActionGoal: MoveGroupSequenceActionGoal,
  PickupActionGoal: PickupActionGoal,
  MoveGroupGoal: MoveGroupGoal,
  ExecuteTrajectoryActionFeedback: ExecuteTrajectoryActionFeedback,
  PlaceAction: PlaceAction,
  PlanningSceneWorld: PlanningSceneWorld,
  RobotState: RobotState,
  BoundingVolume: BoundingVolume,
  JointLimits: JointLimits,
  CartesianPoint: CartesianPoint,
  PlannerInterfaceDescription: PlannerInterfaceDescription,
  Constraints: Constraints,
  GenericTrajectory: GenericTrajectory,
  TrajectoryConstraints: TrajectoryConstraints,
  CostSource: CostSource,
  PlanningScene: PlanningScene,
  GripperTranslation: GripperTranslation,
  MotionSequenceItem: MotionSequenceItem,
  PlanningSceneComponents: PlanningSceneComponents,
  DisplayTrajectory: DisplayTrajectory,
  CartesianTrajectoryPoint: CartesianTrajectoryPoint,
  KinematicSolverInfo: KinematicSolverInfo,
  PositionIKRequest: PositionIKRequest,
  CartesianTrajectory: CartesianTrajectory,
  AllowedCollisionMatrix: AllowedCollisionMatrix,
  ContactInformation: ContactInformation,
  MotionPlanRequest: MotionPlanRequest,
  PlaceLocation: PlaceLocation,
  LinkPadding: LinkPadding,
  Grasp: Grasp,
  MotionPlanResponse: MotionPlanResponse,
  ConstraintEvalResult: ConstraintEvalResult,
  CollisionObject: CollisionObject,
  MotionSequenceRequest: MotionSequenceRequest,
  ObjectColor: ObjectColor,
  PlannerParams: PlannerParams,
  OrientationConstraint: OrientationConstraint,
  VisibilityConstraint: VisibilityConstraint,
  MoveItErrorCodes: MoveItErrorCodes,
  AttachedCollisionObject: AttachedCollisionObject,
  AllowedCollisionEntry: AllowedCollisionEntry,
  MotionPlanDetailedResponse: MotionPlanDetailedResponse,
  MotionSequenceResponse: MotionSequenceResponse,
  PositionConstraint: PositionConstraint,
  PlanningOptions: PlanningOptions,
  JointConstraint: JointConstraint,
  OrientedBoundingBox: OrientedBoundingBox,
  WorkspaceParameters: WorkspaceParameters,
  LinkScale: LinkScale,
  DisplayRobotState: DisplayRobotState,
  RobotTrajectory: RobotTrajectory,
};
