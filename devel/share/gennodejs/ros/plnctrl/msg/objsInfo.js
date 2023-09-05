// Auto-generated. Do not edit!

// (in-package plnctrl.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let objInfo = require('./objInfo.js');

//-----------------------------------------------------------

class objsInfo {
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
    // Serializes a message object of type objsInfo
    // Serialize message field [objNum]
    bufferOffset = _serializer.int32(obj.objNum, buffer, bufferOffset);
    // Serialize message field [data]
    // Serialize the length for message field [data]
    bufferOffset = _serializer.uint32(obj.data.length, buffer, bufferOffset);
    obj.data.forEach((val) => {
      bufferOffset = objInfo.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type objsInfo
    let len;
    let data = new objsInfo(null);
    // Deserialize message field [objNum]
    data.objNum = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [data]
    // Deserialize array length for message field [data]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.data[i] = objInfo.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 22 * object.data.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'plnctrl/objsInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '519e5ac559f94c92999b0c7095c3df57';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32       objNum
    objInfo[]   data
    
    ================================================================================
    MSG: plnctrl/objInfo
    int16           classes
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
    const resolved = new objsInfo(null);
    if (msg.objNum !== undefined) {
      resolved.objNum = msg.objNum;
    }
    else {
      resolved.objNum = 0
    }

    if (msg.data !== undefined) {
      resolved.data = new Array(msg.data.length);
      for (let i = 0; i < resolved.data.length; ++i) {
        resolved.data[i] = objInfo.Resolve(msg.data[i]);
      }
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

module.exports = objsInfo;
