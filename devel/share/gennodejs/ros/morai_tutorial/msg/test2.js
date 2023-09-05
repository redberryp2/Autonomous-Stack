// Auto-generated. Do not edit!

// (in-package morai_tutorial.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class test2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ok = null;
      this.point_x = null;
      this.point_z = null;
    }
    else {
      if (initObj.hasOwnProperty('ok')) {
        this.ok = initObj.ok
      }
      else {
        this.ok = false;
      }
      if (initObj.hasOwnProperty('point_x')) {
        this.point_x = initObj.point_x
      }
      else {
        this.point_x = 0;
      }
      if (initObj.hasOwnProperty('point_z')) {
        this.point_z = initObj.point_z
      }
      else {
        this.point_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type test2
    // Serialize message field [ok]
    bufferOffset = _serializer.bool(obj.ok, buffer, bufferOffset);
    // Serialize message field [point_x]
    bufferOffset = _serializer.int32(obj.point_x, buffer, bufferOffset);
    // Serialize message field [point_z]
    bufferOffset = _serializer.float32(obj.point_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type test2
    let len;
    let data = new test2(null);
    // Deserialize message field [ok]
    data.ok = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [point_x]
    data.point_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [point_z]
    data.point_z = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_tutorial/test2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9898456a3461836f8bb89662ffdfc4b6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool ok
    int32 point_x
    float32 point_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new test2(null);
    if (msg.ok !== undefined) {
      resolved.ok = msg.ok;
    }
    else {
      resolved.ok = false
    }

    if (msg.point_x !== undefined) {
      resolved.point_x = msg.point_x;
    }
    else {
      resolved.point_x = 0
    }

    if (msg.point_z !== undefined) {
      resolved.point_z = msg.point_z;
    }
    else {
      resolved.point_z = 0.0
    }

    return resolved;
    }
};

module.exports = test2;
