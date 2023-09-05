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

class test_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data_a = null;
      this.data_b = null;
      this.data_c = null;
    }
    else {
      if (initObj.hasOwnProperty('data_a')) {
        this.data_a = initObj.data_a
      }
      else {
        this.data_a = 0;
      }
      if (initObj.hasOwnProperty('data_b')) {
        this.data_b = initObj.data_b
      }
      else {
        this.data_b = 0;
      }
      if (initObj.hasOwnProperty('data_c')) {
        this.data_c = initObj.data_c
      }
      else {
        this.data_c = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type test_msg
    // Serialize message field [data_a]
    bufferOffset = _serializer.int16(obj.data_a, buffer, bufferOffset);
    // Serialize message field [data_b]
    bufferOffset = _serializer.int16(obj.data_b, buffer, bufferOffset);
    // Serialize message field [data_c]
    bufferOffset = _serializer.int16(obj.data_c, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type test_msg
    let len;
    let data = new test_msg(null);
    // Deserialize message field [data_a]
    data.data_a = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [data_b]
    data.data_b = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [data_c]
    data.data_c = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_tutorial/test_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '36b5034dc307de7513c892457d2121f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 data_a
    int16 data_b
    int16 data_c
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new test_msg(null);
    if (msg.data_a !== undefined) {
      resolved.data_a = msg.data_a;
    }
    else {
      resolved.data_a = 0
    }

    if (msg.data_b !== undefined) {
      resolved.data_b = msg.data_b;
    }
    else {
      resolved.data_b = 0
    }

    if (msg.data_c !== undefined) {
      resolved.data_c = msg.data_c;
    }
    else {
      resolved.data_c = 0
    }

    return resolved;
    }
};

module.exports = test_msg;
