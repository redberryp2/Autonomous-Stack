; Auto-generated. Do not edit!


(cl:in-package plnctrl-msg)


;//! \htmlinclude fussInfo.msg.html

(cl:defclass <fussInfo> (roslisp-msg-protocol:ros-message)
  ((objNum
    :reader objNum
    :initarg :objNum
    :type cl:fixnum
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector plnctrl-msg:fusInfo)
   :initform (cl:make-array 0 :element-type 'plnctrl-msg:fusInfo :initial-element (cl:make-instance 'plnctrl-msg:fusInfo))))
)

(cl:defclass fussInfo (<fussInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <fussInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'fussInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name plnctrl-msg:<fussInfo> is deprecated: use plnctrl-msg:fussInfo instead.")))

(cl:ensure-generic-function 'objNum-val :lambda-list '(m))
(cl:defmethod objNum-val ((m <fussInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:objNum-val is deprecated.  Use plnctrl-msg:objNum instead.")
  (objNum m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <fussInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:data-val is deprecated.  Use plnctrl-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <fussInfo>) ostream)
  "Serializes a message object of type '<fussInfo>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'objNum)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'objNum)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <fussInfo>) istream)
  "Deserializes a message object of type '<fussInfo>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'objNum)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'objNum)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'plnctrl-msg:fusInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<fussInfo>)))
  "Returns string type for a message object of type '<fussInfo>"
  "plnctrl/fussInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'fussInfo)))
  "Returns string type for a message object of type 'fussInfo"
  "plnctrl/fussInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<fussInfo>)))
  "Returns md5sum for a message object of type '<fussInfo>"
  "80f20e09e9bf88e655f5e38cccf2953f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'fussInfo)))
  "Returns md5sum for a message object of type 'fussInfo"
  "80f20e09e9bf88e655f5e38cccf2953f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<fussInfo>)))
  "Returns full string definition for message of type '<fussInfo>"
  (cl:format cl:nil "uint16       objNum~%fusInfo[]   data~%~%================================================================================~%MSG: plnctrl/fusInfo~%int32           classes~%float32         posX~%float32         posY~%float32         posZ~%float32         size~%float32         distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'fussInfo)))
  "Returns full string definition for message of type 'fussInfo"
  (cl:format cl:nil "uint16       objNum~%fusInfo[]   data~%~%================================================================================~%MSG: plnctrl/fusInfo~%int32           classes~%float32         posX~%float32         posY~%float32         posZ~%float32         size~%float32         distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <fussInfo>))
  (cl:+ 0
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <fussInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'fussInfo
    (cl:cons ':objNum (objNum msg))
    (cl:cons ':data (data msg))
))
