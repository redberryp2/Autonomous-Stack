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

class signalInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Num = null;
      this.sign = null;
    }
    else {
      if (initObj.hasOwnProperty('Num')) {
        this.Num = initObj.Num
      }
      else {
        this.Num = 0;
      }
      if (initObj.hasOwnProperty('sign')) {
        this.sign = initObj.sign
      }
      else {
        this.sign = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type signalInfo
    // Serialize message field [Num]
    bufferOffset = _serializer.int32(obj.Num, buffer, bufferOffset);
    // Serialize message field [sign]
    bufferOffset = _arraySerializer.int32(obj.sign, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type signalInfo
    let len;
    let data = new signalInfo(null);
    // Deserialize message field [Num]
    data.Num = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sign]
    data.sign = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.sign.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'plnctrl/signalInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e2c6a5b3e819033d8f5f070abbb98dda';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 Num
    int32[] sign
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new signalInfo(null);
    if (msg.Num !== undefined) {
      resolved.Num = msg.Num;
    }
    else {
      resolved.Num = 0
    }

    if (msg.sign !== undefined) {
      resolved.sign = msg.sign;
    }
    else {
      resolved.sign = []
    }

    return resolved;
    }
};

module.exports = signalInfo;
