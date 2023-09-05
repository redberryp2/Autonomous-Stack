; Auto-generated. Do not edit!


(cl:in-package plnctrl-msg)


;//! \htmlinclude totalInfo.msg.html

(cl:defclass <totalInfo> (roslisp-msg-protocol:ros-message)
  ((State
    :reader State
    :initarg :State
    :type cl:integer
    :initform 0)
   (isStop
    :reader isStop
    :initarg :isStop
    :type cl:boolean
    :initform cl:nil)
   (Speed
    :reader Speed
    :initarg :Speed
    :type cl:float
    :initform 0.0)
   (Yaw
    :reader Yaw
    :initarg :Yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass totalInfo (<totalInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <totalInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'totalInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name plnctrl-msg:<totalInfo> is deprecated: use plnctrl-msg:totalInfo instead.")))

(cl:ensure-generic-function 'State-val :lambda-list '(m))
(cl:defmethod State-val ((m <totalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:State-val is deprecated.  Use plnctrl-msg:State instead.")
  (State m))

(cl:ensure-generic-function 'isStop-val :lambda-list '(m))
(cl:defmethod isStop-val ((m <totalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:isStop-val is deprecated.  Use plnctrl-msg:isStop instead.")
  (isStop m))

(cl:ensure-generic-function 'Speed-val :lambda-list '(m))
(cl:defmethod Speed-val ((m <totalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:Speed-val is deprecated.  Use plnctrl-msg:Speed instead.")
  (Speed m))

(cl:ensure-generic-function 'Yaw-val :lambda-list '(m))
(cl:defmethod Yaw-val ((m <totalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:Yaw-val is deprecated.  Use plnctrl-msg:Yaw instead.")
  (Yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <totalInfo>) ostream)
  "Serializes a message object of type '<totalInfo>"
  (cl:let* ((signed (cl:slot-value msg 'State)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isStop) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <totalInfo>) istream)
  "Deserializes a message object of type '<totalInfo>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'State) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'isStop) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Yaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<totalInfo>)))
  "Returns string type for a message object of type '<totalInfo>"
  "plnctrl/totalInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'totalInfo)))
  "Returns string type for a message object of type 'totalInfo"
  "plnctrl/totalInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<totalInfo>)))
  "Returns md5sum for a message object of type '<totalInfo>"
  "307b323c71a6beac17cb6e2b5ec8260e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'totalInfo)))
  "Returns md5sum for a message object of type 'totalInfo"
  "307b323c71a6beac17cb6e2b5ec8260e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<totalInfo>)))
  "Returns full string definition for message of type '<totalInfo>"
  (cl:format cl:nil "int32 	State~%bool 	isStop~%float32 Speed~%float32 Yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'totalInfo)))
  "Returns full string definition for message of type 'totalInfo"
  (cl:format cl:nil "int32 	State~%bool 	isStop~%float32 Speed~%float32 Yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <totalInfo>))
  (cl:+ 0
     4
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <totalInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'totalInfo
    (cl:cons ':State (State msg))
    (cl:cons ':isStop (isStop msg))
    (cl:cons ':Speed (Speed msg))
    (cl:cons ':Yaw (Yaw msg))
))
