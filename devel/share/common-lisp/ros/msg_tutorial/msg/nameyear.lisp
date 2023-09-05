; Auto-generated. Do not edit!


(cl:in-package msg_tutorial-msg)


;//! \htmlinclude nameyear.msg.html

(cl:defclass <nameyear> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (year
    :reader year
    :initarg :year
    :type cl:fixnum
    :initform 0))
)

(cl:defclass nameyear (<nameyear>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <nameyear>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'nameyear)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msg_tutorial-msg:<nameyear> is deprecated: use msg_tutorial-msg:nameyear instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <nameyear>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msg_tutorial-msg:name-val is deprecated.  Use msg_tutorial-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'year-val :lambda-list '(m))
(cl:defmethod year-val ((m <nameyear>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msg_tutorial-msg:year-val is deprecated.  Use msg_tutorial-msg:year instead.")
  (year m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <nameyear>) ostream)
  "Serializes a message object of type '<nameyear>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'year)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <nameyear>) istream)
  "Deserializes a message object of type '<nameyear>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'year) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<nameyear>)))
  "Returns string type for a message object of type '<nameyear>"
  "msg_tutorial/nameyear")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nameyear)))
  "Returns string type for a message object of type 'nameyear"
  "msg_tutorial/nameyear")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<nameyear>)))
  "Returns md5sum for a message object of type '<nameyear>"
  "a9d7ce781d868659bc667665f71834f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'nameyear)))
  "Returns md5sum for a message object of type 'nameyear"
  "a9d7ce781d868659bc667665f71834f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<nameyear>)))
  "Returns full string definition for message of type '<nameyear>"
  (cl:format cl:nil "string name~%int16 year~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'nameyear)))
  "Returns full string definition for message of type 'nameyear"
  (cl:format cl:nil "string name~%int16 year~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <nameyear>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <nameyear>))
  "Converts a ROS message object to a list"
  (cl:list 'nameyear
    (cl:cons ':name (name msg))
    (cl:cons ':year (year msg))
))
