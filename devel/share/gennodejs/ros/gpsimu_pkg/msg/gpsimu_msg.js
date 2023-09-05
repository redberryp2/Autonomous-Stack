// Auto-generated. Do not edit!

// (in-package gpsimu_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class gpsimu_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.heading = null;
      this.Position_E = null;
      this.Position_N = null;
      this.Position_U = null;
    }
    else {
      if (initObj.hasOwnProperty('heading')) {
        this.heading = initObj.heading
      }
      else {
        this.heading = 0.0;
      }
      if (initObj.hasOwnProperty('Position_E')) {
        this.Position_E = initObj.Position_E
      }
      else {
        this.Position_E = 0.0;
      }
      if (initObj.hasOwnProperty('Position_N')) {
        this.Position_N = initObj.Position_N
      }
      else {
        this.Position_N = 0.0;
      }
      if (initObj.hasOwnProperty('Position_U')) {
        this.Position_U = initObj.Position_U
      }
      else {
        this.Position_U = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gpsimu_msg
    // Serialize message field [heading]
    bufferOffset = _serializer.float32(obj.heading, buffer, bufferOffset);
    // Serialize message field [Position_E]
    bufferOffset = _serializer.float32(obj.Position_E, buffer, bufferOffset);
    // Serialize message field [Position_N]
    bufferOffset = _serializer.float32(obj.Position_N, buffer, bufferOffset);
    // Serialize message field [Position_U]
    bufferOffset = _serializer.float32(obj.Position_U, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gpsimu_msg
    let len;
    let data = new gpsimu_msg(null);
    // Deserialize message field [heading]
    data.heading = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Position_E]
    data.Position_E = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Position_N]
    data.Position_N = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Position_U]
    data.Position_U = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gpsimu_pkg/gpsimu_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '77440f548594fa764dfaeba6047008b5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 heading
    float32 Position_E
    float32 Position_N
    float32 Position_U
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gpsimu_msg(null);
    if (msg.heading !== undefined) {
      resolved.heading = msg.heading;
    }
    else {
      resolved.heading = 0.0
    }

    if (msg.Position_E !== undefined) {
      resolved.Position_E = msg.Position_E;
    }
    else {
      resolved.Position_E = 0.0
    }

    if (msg.Position_N !== undefined) {
      resolved.Position_N = msg.Position_N;
    }
    else {
      resolved.Position_N = 0.0
    }

    if (msg.Position_U !== undefined) {
      resolved.Position_U = msg.Position_U;
    }
    else {
      resolved.Position_U = 0.0
    }

    return resolved;
    }
};

module.exports = gpsimu_msg;
