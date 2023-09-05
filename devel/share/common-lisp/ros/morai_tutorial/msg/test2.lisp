; Auto-generated. Do not edit!


(cl:in-package morai_tutorial-msg)


;//! \htmlinclude test2.msg.html

(cl:defclass <test2> (roslisp-msg-protocol:ros-message)
  ((ok
    :reader ok
    :initarg :ok
    :type cl:boolean
    :initform cl:nil)
   (point_x
    :reader point_x
    :initarg :point_x
    :type cl:integer
    :initform 0)
   (point_z
    :reader point_z
    :initarg :point_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass test2 (<test2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <test2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'test2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_tutorial-msg:<test2> is deprecated: use morai_tutorial-msg:test2 instead.")))

(cl:ensure-generic-function 'ok-val :lambda-list '(m))
(cl:defmethod ok-val ((m <test2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_tutorial-msg:ok-val is deprecated.  Use morai_tutorial-msg:ok instead.")
  (ok m))

(cl:ensure-generic-function 'point_x-val :lambda-list '(m))
(cl:defmethod point_x-val ((m <test2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_tutorial-msg:point_x-val is deprecated.  Use morai_tutorial-msg:point_x instead.")
  (point_x m))

(cl:ensure-generic-function 'point_z-val :lambda-list '(m))
(cl:defmethod point_z-val ((m <test2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_tutorial-msg:point_z-val is deprecated.  Use morai_tutorial-msg:point_z instead.")
  (point_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <test2>) ostream)
  "Serializes a message object of type '<test2>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ok) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'point_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'point_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <test2>) istream)
  "Deserializes a message object of type '<test2>"
    (cl:setf (cl:slot-value msg 'ok) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'point_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'point_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<test2>)))
  "Returns string type for a message object of type '<test2>"
  "morai_tutorial/test2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test2)))
  "Returns string type for a message object of type 'test2"
  "morai_tutorial/test2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<test2>)))
  "Returns md5sum for a message object of type '<test2>"
  "9898456a3461836f8bb89662ffdfc4b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'test2)))
  "Returns md5sum for a message object of type 'test2"
  "9898456a3461836f8bb89662ffdfc4b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<test2>)))
  "Returns full string definition for message of type '<test2>"
  (cl:format cl:nil "bool ok~%int32 point_x~%float32 point_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'test2)))
  "Returns full string definition for message of type 'test2"
  (cl:format cl:nil "bool ok~%int32 point_x~%float32 point_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <test2>))
  (cl:+ 0
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <test2>))
  "Converts a ROS message object to a list"
  (cl:list 'test2
    (cl:cons ':ok (ok msg))
    (cl:cons ':point_x (point_x msg))
    (cl:cons ':point_z (point_z msg))
))
