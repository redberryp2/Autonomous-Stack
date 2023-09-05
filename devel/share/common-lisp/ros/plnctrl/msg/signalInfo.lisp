; Auto-generated. Do not edit!


(cl:in-package plnctrl-msg)


;//! \htmlinclude signalInfo.msg.html

(cl:defclass <signalInfo> (roslisp-msg-protocol:ros-message)
  ((Num
    :reader Num
    :initarg :Num
    :type cl:integer
    :initform 0)
   (sign
    :reader sign
    :initarg :sign
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass signalInfo (<signalInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <signalInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'signalInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name plnctrl-msg:<signalInfo> is deprecated: use plnctrl-msg:signalInfo instead.")))

(cl:ensure-generic-function 'Num-val :lambda-list '(m))
(cl:defmethod Num-val ((m <signalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:Num-val is deprecated.  Use plnctrl-msg:Num instead.")
  (Num m))

(cl:ensure-generic-function 'sign-val :lambda-list '(m))
(cl:defmethod sign-val ((m <signalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:sign-val is deprecated.  Use plnctrl-msg:sign instead.")
  (sign m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <signalInfo>) ostream)
  "Serializes a message object of type '<signalInfo>"
  (cl:let* ((signed (cl:slot-value msg 'Num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sign))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'sign))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <signalInfo>) istream)
  "Deserializes a message object of type '<signalInfo>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sign) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sign)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<signalInfo>)))
  "Returns string type for a message object of type '<signalInfo>"
  "plnctrl/signalInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'signalInfo)))
  "Returns string type for a message object of type 'signalInfo"
  "plnctrl/signalInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<signalInfo>)))
  "Returns md5sum for a message object of type '<signalInfo>"
  "e2c6a5b3e819033d8f5f070abbb98dda")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'signalInfo)))
  "Returns md5sum for a message object of type 'signalInfo"
  "e2c6a5b3e819033d8f5f070abbb98dda")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<signalInfo>)))
  "Returns full string definition for message of type '<signalInfo>"
  (cl:format cl:nil "int32 Num~%int32[] sign~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'signalInfo)))
  "Returns full string definition for message of type 'signalInfo"
  (cl:format cl:nil "int32 Num~%int32[] sign~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <signalInfo>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sign) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <signalInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'signalInfo
    (cl:cons ':Num (Num msg))
    (cl:cons ':sign (sign msg))
))
