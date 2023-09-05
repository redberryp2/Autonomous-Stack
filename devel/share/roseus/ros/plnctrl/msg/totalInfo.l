;; Auto-generated. Do not edit!


(when (boundp 'plnctrl::totalInfo)
  (if (not (find-package "PLNCTRL"))
    (make-package "PLNCTRL"))
  (shadow 'totalInfo (find-package "PLNCTRL")))
(unless (find-package "PLNCTRL::TOTALINFO")
  (make-package "PLNCTRL::TOTALINFO"))

(in-package "ROS")
;;//! \htmlinclude totalInfo.msg.html


(defclass plnctrl::totalInfo
  :super ros::object
  :slots (_State _isStop _Speed _Yaw ))

(defmethod plnctrl::totalInfo
  (:init
   (&key
    ((:State __State) 0)
    ((:isStop __isStop) nil)
    ((:Speed __Speed) 0.0)
    ((:Yaw __Yaw) 0.0)
    )
   (send-super :init)
   (setq _State (round __State))
   (setq _isStop __isStop)
   (setq _Speed (float __Speed))
   (setq _Yaw (float __Yaw))
   self)
  (:State
   (&optional __State)
   (if __State (setq _State __State)) _State)
  (:isStop
   (&optional (__isStop :null))
   (if (not (eq __isStop :null)) (setq _isStop __isStop)) _isStop)
  (:Speed
   (&optional __Speed)
   (if __Speed (setq _Speed __Speed)) _Speed)
  (:Yaw
   (&optional __Yaw)
   (if __Yaw (setq _Yaw __Yaw)) _Yaw)
  (:serialization-length
   ()
   (+
    ;; int32 _State
    4
    ;; bool _isStop
    1
    ;; float32 _Speed
    4
    ;; float32 _Yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _State
       (write-long _State s)
     ;; bool _isStop
       (if _isStop (write-byte -1 s) (write-byte 0 s))
     ;; float32 _Speed
       (sys::poke _Speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Yaw
       (sys::poke _Yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _State
     (setq _State (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _isStop
     (setq _isStop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _Speed
     (setq _Speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Yaw
     (setq _Yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get plnctrl::totalInfo :md5sum-) "307b323c71a6beac17cb6e2b5ec8260e")
(setf (get plnctrl::totalInfo :datatype-) "plnctrl/totalInfo")
(setf (get plnctrl::totalInfo :definition-)
      "int32 	State
bool 	isStop
float32 Speed
float32 Yaw

")



(provide :plnctrl/totalInfo "307b323c71a6beac17cb6e2b5ec8260e")


