// Auto-generated. Do not edit!

// (in-package plnctrl.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let fusInfo = require('./fusInfo.js');

//-----------------------------------------------------------

class fussInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.objNum = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('objNum')) {
        this.objNum = initObj.objNum
      }
      else {
        this.objNum = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type fussInfo
    // Serialize message field [objNum]
    bufferOffset = _serializer.uint16(obj.objNum, buffer, bufferOffset);
    // Serialize message field [data]
    // Serialize the length for message field [data]
    bufferOffset = _serializer.uint32(obj.data.length, buffer, bufferOffset);
    obj.data.forEach((val) => {
      bufferOffset = fusInfo.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type fussInfo
    let len;
    let data = new fussInfo(null);
    // Deserialize message field [objNum]
    data.objNum = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [data]
    // Deserialize array length for message field [data]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.data[i] = fusInfo.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.data.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'plnctrl/fussInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '80f20e09e9bf88e655f5e38cccf2953f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16       objNum
    fusInfo[]   data
    
    ================================================================================
    MSG: plnctrl/fusInfo
    int32           classes
    float32         posX
    float32         posY
    float32         posZ
    float32         size
    float32         distance
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new fussInfo(null);
    if (msg.objNum !== undefined) {
      resolved.objNum = msg.objNum;
    }
    else {
      resolved.objNum = 0
    }

    if (msg.data !== undefined) {
      resolved.data = new Array(msg.data.length);
      for (let i = 0; i < resolved.data.length; ++i) {
        resolved.data[i] = fusInfo.Resolve(msg.data[i]);
      }
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

module.exports = fussInfo;
