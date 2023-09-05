
"use strict";

let ObjectStatus = require('./ObjectStatus.js');
let ObjectStatusList = require('./ObjectStatusList.js');
let TrafficLight = require('./TrafficLight.js');
let SyncModeSetGear = require('./SyncModeSetGear.js');
let IntersectionStatus = require('./IntersectionStatus.js');
let ERP42Info = require('./ERP42Info.js');
let GetTrafficLightStatus = require('./GetTrafficLightStatus.js');
let SyncModeRemoveObject = require('./SyncModeRemoveObject.js');
let VehicleSpecIndex = require('./VehicleSpecIndex.js');
let SyncModeCtrlCmd = require('./SyncModeCtrlCmd.js');
let PREvent = require('./PREvent.js');
let ScenarioLoad = require('./ScenarioLoad.js');
let WaitForTick = require('./WaitForTick.js');
let PRStatus = require('./PRStatus.js');
let MoraiSimProcHandle = require('./MoraiSimProcHandle.js');
let MoraiTLIndex = require('./MoraiTLIndex.js');
let RadarDetections = require('./RadarDetections.js');
let Lamps = require('./Lamps.js');
let EgoVehicleStatus = require('./EgoVehicleStatus.js');
let SyncModeAddObject = require('./SyncModeAddObject.js');
let SyncModeScenarioLoad = require('./SyncModeScenarioLoad.js');
let CtrlCmd = require('./CtrlCmd.js');
let IntscnTL = require('./IntscnTL.js');
let CollisionData = require('./CollisionData.js');
let SyncModeInfo = require('./SyncModeInfo.js');
let GhostMessage = require('./GhostMessage.js');
let MapSpec = require('./MapSpec.js');
let VehicleSpec = require('./VehicleSpec.js');
let RadarDetection = require('./RadarDetection.js');
let MapSpecIndex = require('./MapSpecIndex.js');
let NpcGhostInfo = require('./NpcGhostInfo.js');
let EventInfo = require('./EventInfo.js');
let MoraiTLInfo = require('./MoraiTLInfo.js');
let SaveSensorData = require('./SaveSensorData.js');
let MultiEgoSetting = require('./MultiEgoSetting.js');
let MoraiSrvResponse = require('./MoraiSrvResponse.js');
let SyncModeCmdResponse = require('./SyncModeCmdResponse.js');
let MoraiSimProcStatus = require('./MoraiSimProcStatus.js');
let SensorPosControl = require('./SensorPosControl.js');
let WaitForTickResponse = require('./WaitForTickResponse.js');
let PRCtrlCmd = require('./PRCtrlCmd.js');
let IntersectionControl = require('./IntersectionControl.js');
let GPSMessage = require('./GPSMessage.js');
let SetTrafficLight = require('./SetTrafficLight.js');
let SyncModeCmd = require('./SyncModeCmd.js');
let SyncModeResultResponse = require('./SyncModeResultResponse.js');
let NpcGhostCmd = require('./NpcGhostCmd.js');
let VehicleCollisionData = require('./VehicleCollisionData.js');
let DdCtrlCmd = require('./DdCtrlCmd.js');
let VehicleCollision = require('./VehicleCollision.js');
let ReplayInfo = require('./ReplayInfo.js');

module.exports = {
  ObjectStatus: ObjectStatus,
  ObjectStatusList: ObjectStatusList,
  TrafficLight: TrafficLight,
  SyncModeSetGear: SyncModeSetGear,
  IntersectionStatus: IntersectionStatus,
  ERP42Info: ERP42Info,
  GetTrafficLightStatus: GetTrafficLightStatus,
  SyncModeRemoveObject: SyncModeRemoveObject,
  VehicleSpecIndex: VehicleSpecIndex,
  SyncModeCtrlCmd: SyncModeCtrlCmd,
  PREvent: PREvent,
  ScenarioLoad: ScenarioLoad,
  WaitForTick: WaitForTick,
  PRStatus: PRStatus,
  MoraiSimProcHandle: MoraiSimProcHandle,
  MoraiTLIndex: MoraiTLIndex,
  RadarDetections: RadarDetections,
  Lamps: Lamps,
  EgoVehicleStatus: EgoVehicleStatus,
  SyncModeAddObject: SyncModeAddObject,
  SyncModeScenarioLoad: SyncModeScenarioLoad,
  CtrlCmd: CtrlCmd,
  IntscnTL: IntscnTL,
  CollisionData: CollisionData,
  SyncModeInfo: SyncModeInfo,
  GhostMessage: GhostMessage,
  MapSpec: MapSpec,
  VehicleSpec: VehicleSpec,
  RadarDetection: RadarDetection,
  MapSpecIndex: MapSpecIndex,
  NpcGhostInfo: NpcGhostInfo,
  EventInfo: EventInfo,
  MoraiTLInfo: MoraiTLInfo,
  SaveSensorData: SaveSensorData,
  MultiEgoSetting: MultiEgoSetting,
  MoraiSrvResponse: MoraiSrvResponse,
  SyncModeCmdResponse: SyncModeCmdResponse,
  MoraiSimProcStatus: MoraiSimProcStatus,
  SensorPosControl: SensorPosControl,
  WaitForTickResponse: WaitForTickResponse,
  PRCtrlCmd: PRCtrlCmd,
  IntersectionControl: IntersectionControl,
  GPSMessage: GPSMessage,
  SetTrafficLight: SetTrafficLight,
  SyncModeCmd: SyncModeCmd,
  SyncModeResultResponse: SyncModeResultResponse,
  NpcGhostCmd: NpcGhostCmd,
  VehicleCollisionData: VehicleCollisionData,
  DdCtrlCmd: DdCtrlCmd,
  VehicleCollision: VehicleCollision,
  ReplayInfo: ReplayInfo,
};
