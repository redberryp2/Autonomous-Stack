; Auto-generated. Do not edit!


(cl:in-package plnctrl-msg)


;//! \htmlinclude objInfo.msg.html

(cl:defclass <objInfo> (roslisp-msg-protocol:ros-message)
  ((classes
    :reader classes
    :initarg :classes
    :type cl:fixnum
    :initform 0)
   (posX
    :reader posX
    :initarg :posX
    :type cl:float
    :initform 0.0)
   (posY
    :reader posY
    :initarg :posY
    :type cl:float
    :initform 0.0)
   (posZ
    :reader posZ
    :initarg :posZ
    :type cl:float
    :initform 0.0)
   (size
    :reader size
    :initarg :size
    :type cl:float
    :initform 0.0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass objInfo (<objInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <objInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'objInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name plnctrl-msg:<objInfo> is deprecated: use plnctrl-msg:objInfo instead.")))

(cl:ensure-generic-function 'classes-val :lambda-list '(m))
(cl:defmethod classes-val ((m <objInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:classes-val is deprecated.  Use plnctrl-msg:classes instead.")
  (classes m))

(cl:ensure-generic-function 'posX-val :lambda-list '(m))
(cl:defmethod posX-val ((m <objInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:posX-val is deprecated.  Use plnctrl-msg:posX instead.")
  (posX m))

(cl:ensure-generic-function 'posY-val :lambda-list '(m))
(cl:defmethod posY-val ((m <objInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:posY-val is deprecated.  Use plnctrl-msg:posY instead.")
  (posY m))

(cl:ensure-generic-function 'posZ-val :lambda-list '(m))
(cl:defmethod posZ-val ((m <objInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:posZ-val is deprecated.  Use plnctrl-msg:posZ instead.")
  (posZ m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <objInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:size-val is deprecated.  Use plnctrl-msg:size instead.")
  (size m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <objInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:distance-val is deprecated.  Use plnctrl-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <objInfo>) ostream)
  "Serializes a message object of type '<objInfo>"
  (cl:let* ((signed (cl:slot-value msg 'classes)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'posX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'posY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'posZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'size))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <objInfo>) istream)
  "Deserializes a message object of type '<objInfo>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'classes) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'posX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'posY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'posZ) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'size) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<objInfo>)))
  "Returns string type for a message object of type '<objInfo>"
  "plnctrl/objInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'objInfo)))
  "Returns string type for a message object of type 'objInfo"
  "plnctrl/objInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<objInfo>)))
  "Returns md5sum for a message object of type '<objInfo>"
  "d2cef7aa5802a9817bbcec1ed7df06d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'objInfo)))
  "Returns md5sum for a message object of type 'objInfo"
  "d2cef7aa5802a9817bbcec1ed7df06d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<objInfo>)))
  "Returns full string definition for message of type '<objInfo>"
  (cl:format cl:nil "int16           classes~%float32         posX~%float32         posY~%float32         posZ~%float32         size~%float32         distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'objInfo)))
  "Returns full string definition for message of type 'objInfo"
  (cl:format cl:nil "int16           classes~%float32         posX~%float32         posY~%float32         posZ~%float32         size~%float32         distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <objInfo>))
  (cl:+ 0
     2
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <objInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'objInfo
    (cl:cons ':classes (classes msg))
    (cl:cons ':posX (posX msg))
    (cl:cons ':posY (posY msg))
    (cl:cons ':posZ (posZ msg))
    (cl:cons ':size (size msg))
    (cl:cons ':distance (distance msg))
))
