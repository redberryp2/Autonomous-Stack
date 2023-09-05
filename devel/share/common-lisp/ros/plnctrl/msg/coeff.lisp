; Auto-generated. Do not edit!


(cl:in-package plnctrl-msg)


;//! \htmlinclude coeff.msg.html

(cl:defclass <coeff> (roslisp-msg-protocol:ros-message)
  ((Slope
    :reader Slope
    :initarg :Slope
    :type cl:float
    :initform 0.0)
   (Yintercept
    :reader Yintercept
    :initarg :Yintercept
    :type cl:float
    :initform 0.0))
)

(cl:defclass coeff (<coeff>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <coeff>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'coeff)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name plnctrl-msg:<coeff> is deprecated: use plnctrl-msg:coeff instead.")))

(cl:ensure-generic-function 'Slope-val :lambda-list '(m))
(cl:defmethod Slope-val ((m <coeff>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:Slope-val is deprecated.  Use plnctrl-msg:Slope instead.")
  (Slope m))

(cl:ensure-generic-function 'Yintercept-val :lambda-list '(m))
(cl:defmethod Yintercept-val ((m <coeff>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader plnctrl-msg:Yintercept-val is deprecated.  Use plnctrl-msg:Yintercept instead.")
  (Yintercept m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <coeff>) ostream)
  "Serializes a message object of type '<coeff>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Slope))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Yintercept))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <coeff>) istream)
  "Deserializes a message object of type '<coeff>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Slope) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Yintercept) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<coeff>)))
  "Returns string type for a message object of type '<coeff>"
  "plnctrl/coeff")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'coeff)))
  "Returns string type for a message object of type 'coeff"
  "plnctrl/coeff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<coeff>)))
  "Returns md5sum for a message object of type '<coeff>"
  "79d5a347fa4ceb9a6b9ec816e2ae7406")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'coeff)))
  "Returns md5sum for a message object of type 'coeff"
  "79d5a347fa4ceb9a6b9ec816e2ae7406")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<coeff>)))
  "Returns full string definition for message of type '<coeff>"
  (cl:format cl:nil "float32    Slope~%float32    Yintercept~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'coeff)))
  "Returns full string definition for message of type 'coeff"
  (cl:format cl:nil "float32    Slope~%float32    Yintercept~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <coeff>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <coeff>))
  "Converts a ROS message object to a list"
  (cl:list 'coeff
    (cl:cons ':Slope (Slope msg))
    (cl:cons ':Yintercept (Yintercept msg))
))
