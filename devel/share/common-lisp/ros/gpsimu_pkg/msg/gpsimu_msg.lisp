; Auto-generated. Do not edit!


(cl:in-package gpsimu_pkg-msg)


;//! \htmlinclude gpsimu_msg.msg.html

(cl:defclass <gpsimu_msg> (roslisp-msg-protocol:ros-message)
  ((heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0)
   (Position_E
    :reader Position_E
    :initarg :Position_E
    :type cl:float
    :initform 0.0)
   (Position_N
    :reader Position_N
    :initarg :Position_N
    :type cl:float
    :initform 0.0)
   (Position_U
    :reader Position_U
    :initarg :Position_U
    :type cl:float
    :initform 0.0))
)

(cl:defclass gpsimu_msg (<gpsimu_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gpsimu_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gpsimu_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gpsimu_pkg-msg:<gpsimu_msg> is deprecated: use gpsimu_pkg-msg:gpsimu_msg instead.")))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <gpsimu_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gpsimu_pkg-msg:heading-val is deprecated.  Use gpsimu_pkg-msg:heading instead.")
  (heading m))

(cl:ensure-generic-function 'Position_E-val :lambda-list '(m))
(cl:defmethod Position_E-val ((m <gpsimu_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gpsimu_pkg-msg:Position_E-val is deprecated.  Use gpsimu_pkg-msg:Position_E instead.")
  (Position_E m))

(cl:ensure-generic-function 'Position_N-val :lambda-list '(m))
(cl:defmethod Position_N-val ((m <gpsimu_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gpsimu_pkg-msg:Position_N-val is deprecated.  Use gpsimu_pkg-msg:Position_N instead.")
  (Position_N m))

(cl:ensure-generic-function 'Position_U-val :lambda-list '(m))
(cl:defmethod Position_U-val ((m <gpsimu_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gpsimu_pkg-msg:Position_U-val is deprecated.  Use gpsimu_pkg-msg:Position_U instead.")
  (Position_U m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gpsimu_msg>) ostream)
  "Serializes a message object of type '<gpsimu_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Position_E))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Position_N))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Position_U))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gpsimu_msg>) istream)
  "Deserializes a message object of type '<gpsimu_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Position_E) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Position_N) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Position_U) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gpsimu_msg>)))
  "Returns string type for a message object of type '<gpsimu_msg>"
  "gpsimu_pkg/gpsimu_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gpsimu_msg)))
  "Returns string type for a message object of type 'gpsimu_msg"
  "gpsimu_pkg/gpsimu_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gpsimu_msg>)))
  "Returns md5sum for a message object of type '<gpsimu_msg>"
  "77440f548594fa764dfaeba6047008b5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gpsimu_msg)))
  "Returns md5sum for a message object of type 'gpsimu_msg"
  "77440f548594fa764dfaeba6047008b5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gpsimu_msg>)))
  "Returns full string definition for message of type '<gpsimu_msg>"
  (cl:format cl:nil "float32 heading~%float32 Position_E~%float32 Position_N~%float32 Position_U~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gpsimu_msg)))
  "Returns full string definition for message of type 'gpsimu_msg"
  (cl:format cl:nil "float32 heading~%float32 Position_E~%float32 Position_N~%float32 Position_U~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gpsimu_msg>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gpsimu_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'gpsimu_msg
    (cl:cons ':heading (heading msg))
    (cl:cons ':Position_E (Position_E msg))
    (cl:cons ':Position_N (Position_N msg))
    (cl:cons ':Position_U (Position_U msg))
))
