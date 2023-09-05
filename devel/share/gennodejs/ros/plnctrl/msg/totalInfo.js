// Auto-generated. Do not edit!

// (in-package plnctrl.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class totalInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.State = null;
      this.isStop = null;
      this.Speed = null;
      this.Yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('State')) {
        this.State = initObj.State
      }
      else {
        this.State = 0;
      }
      if (initObj.hasOwnProperty('isStop')) {
        this.isStop = initObj.isStop
      }
      else {
        this.isStop = false;
      }
      if (initObj.hasOwnProperty('Speed')) {
        this.Speed = initObj.Speed
      }
      else {
        this.Speed = 0.0;
      }
      if (initObj.hasOwnProperty('Yaw')) {
        this.Yaw = initObj.Yaw
      }
      else {
        this.Yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type totalInfo
    // Serialize message field [State]
    bufferOffset = _serializer.int32(obj.State, buffer, bufferOffset);
    // Serialize message field [isStop]
    bufferOffset = _serializer.bool(obj.isStop, buffer, bufferOffset);
    // Serialize message field [Speed]
    bufferOffset = _serializer.float32(obj.Speed, buffer, bufferOffset);
    // Serialize message field [Yaw]
    bufferOffset = _serializer.float32(obj.Yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type totalInfo
    let len;
    let data = new totalInfo(null);
    // Deserialize message field [State]
    data.State = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [isStop]
    data.isStop = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [Speed]
    data.Speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Yaw]
    data.Yaw = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'plnctrl/totalInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '307b323c71a6beac17cb6e2b5ec8260e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 	State
    bool 	isStop
    float32 Speed
    float32 Yaw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new totalInfo(null);
    if (msg.State !== undefined) {
      resolved.State = msg.State;
    }
    else {
      resolved.State = 0
    }

    if (msg.isStop !== undefined) {
      resolved.isStop = msg.isStop;
    }
    else {
      resolved.isStop = false
    }

    if (msg.Speed !== undefined) {
      resolved.Speed = msg.Speed;
    }
    else {
      resolved.Speed = 0.0
    }

    if (msg.Yaw !== undefined) {
      resolved.Yaw = msg.Yaw;
    }
    else {
      resolved.Yaw = 0.0
    }

    return resolved;
    }
};

module.exports = totalInfo;
