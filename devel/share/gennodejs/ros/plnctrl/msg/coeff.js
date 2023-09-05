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

class coeff {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Slope = null;
      this.Yintercept = null;
    }
    else {
      if (initObj.hasOwnProperty('Slope')) {
        this.Slope = initObj.Slope
      }
      else {
        this.Slope = 0.0;
      }
      if (initObj.hasOwnProperty('Yintercept')) {
        this.Yintercept = initObj.Yintercept
      }
      else {
        this.Yintercept = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type coeff
    // Serialize message field [Slope]
    bufferOffset = _serializer.float32(obj.Slope, buffer, bufferOffset);
    // Serialize message field [Yintercept]
    bufferOffset = _serializer.float32(obj.Yintercept, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type coeff
    let len;
    let data = new coeff(null);
    // Deserialize message field [Slope]
    data.Slope = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Yintercept]
    data.Yintercept = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'plnctrl/coeff';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '79d5a347fa4ceb9a6b9ec816e2ae7406';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32    Slope
    float32    Yintercept
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new coeff(null);
    if (msg.Slope !== undefined) {
      resolved.Slope = msg.Slope;
    }
    else {
      resolved.Slope = 0.0
    }

    if (msg.Yintercept !== undefined) {
      resolved.Yintercept = msg.Yintercept;
    }
    else {
      resolved.Yintercept = 0.0
    }

    return resolved;
    }
};

module.exports = coeff;
