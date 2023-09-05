; Auto-generated. Do not edit!


(cl:in-package plnctrl-msg)


;//! \htmlinclude objsInfo.msg.html

(cl:defclass <objsInfo> (roslisp-msg-protocol:ros-message)
  ((objNum
    :reader objNum
    :initarg :objNum
    :type cl:integer
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector plnctrl-msg:objInfo)
   :initform (cl:make-array 0 :element-type 'plnctrl-msg:objInfo :initial-element (cl:make-instance 'plnctrl-msg:objInfo))))
)

(cl:defclass objsInfo (<objsInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <objsInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'objsInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name plnctrl-msg:<objsInfo> is deprecated: use plnctrl-msg:objsInfo instead.")))

(cl:ensure-generic-function 'objNum-val :lambda-list '(m))
(cl:defmethod objNum-val ((m <objsInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:objNum-val is deprecated.  Use plnctrl-msg:objNum instead.")
  (objNum m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <objsInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:data-val is deprecated.  Use plnctrl-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <objsInfo>) ostream)
  "Serializes a message object of type '<objsInfo>"
  (cl:let* ((signed (cl:slot-value msg 'objNum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <objsInfo>) istream)
  "Deserializes a message object of type '<objsInfo>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'objNum) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'plnctrl-msg:objInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<objsInfo>)))
  "Returns string type for a message object of type '<objsInfo>"
  "plnctrl/objsInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'objsInfo)))
  "Returns string type for a message object of type 'objsInfo"
  "plnctrl/objsInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<objsInfo>)))
  "Returns md5sum for a message object of type '<objsInfo>"
  "519e5ac559f94c92999b0c7095c3df57")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'objsInfo)))
  "Returns md5sum for a message object of type 'objsInfo"
  "519e5ac559f94c92999b0c7095c3df57")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<objsInfo>)))
  "Returns full string definition for message of type '<objsInfo>"
  (cl:format cl:nil "int32       objNum~%objInfo[]   data~%~%================================================================================~%MSG: plnctrl/objInfo~%int16           classes~%float32         posX~%float32         posY~%float32         posZ~%float32         size~%float32         distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'objsInfo)))
  "Returns full string definition for message of type 'objsInfo"
  (cl:format cl:nil "int32       objNum~%objInfo[]   data~%~%================================================================================~%MSG: plnctrl/objInfo~%int16           classes~%float32         posX~%float32         posY~%float32         posZ~%float32         size~%float32         distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <objsInfo>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <objsInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'objsInfo
    (cl:cons ':objNum (objNum msg))
    (cl:cons ':data (data msg))
))
