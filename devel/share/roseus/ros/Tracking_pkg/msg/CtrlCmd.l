;; Auto-generated. Do not edit!


(when (boundp 'Tracking_pkg::CtrlCmd)
  (if (not (find-package "TRACKING_PKG"))
    (make-package "TRACKING_PKG"))
  (shadow 'CtrlCmd (find-package "TRACKING_PKG")))
(unless (find-package "TRACKING_PKG::CTRLCMD")
  (make-package "TRACKING_PKG::CTRLCMD"))

(in-package "ROS")
;;//! \htmlinclude CtrlCmd.msg.html


(defclass Tracking_pkg::CtrlCmd
  :super ros::object
  :slots (_longlCmdType _accel _brake _steering _velocity _acceleration ))

(defmethod Tracking_pkg::CtrlCmd
  (:init
   (&key
    ((:longlCmdType __longlCmdType) 0)
    ((:accel __accel) 0.0)
    ((:brake __brake) 0.0)
    ((:steering __steering) 0.0)
    ((:velocity __velocity) 0.0)
    ((:acceleration __acceleration) 0.0)
    )
   (send-super :init)
   (setq _longlCmdType (round __longlCmdType))
   (setq _accel (float __accel))
   (setq _brake (float __brake))
   (setq _steering (float __steering))
   (setq _velocity (float __velocity))
   (setq _acceleration (float __acceleration))
   self)
  (:longlCmdType
   (&optional __longlCmdType)
   (if __longlCmdType (setq _longlCmdType __longlCmdType)) _longlCmdType)
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:brake
   (&optional __brake)
   (if __brake (setq _brake __brake)) _brake)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:acceleration
   (&optional __acceleration)
   (if __acceleration (setq _acceleration __acceleration)) _acceleration)
  (:serialization-length
   ()
   (+
    ;; int32 _longlCmdType
    4
    ;; float64 _accel
    8
    ;; float64 _brake
    8
    ;; float64 _steering
    8
    ;; float64 _velocity
    8
    ;; float64 _acceleration
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _longlCmdType
       (write-long _longlCmdType s)
     ;; float64 _accel
       (sys::poke _accel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _brake
       (sys::poke _brake (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steering
       (sys::poke _steering (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _acceleration
       (sys::poke _acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _longlCmdType
     (setq _longlCmdType (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _accel
     (setq _accel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _brake
     (setq _brake (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steering
     (setq _steering (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _acceleration
     (setq _acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get Tracking_pkg::CtrlCmd :md5sum-) "718f1a493f1a335da59a19f673d82bb4")
(setf (get Tracking_pkg::CtrlCmd :datatype-) "Tracking_pkg/CtrlCmd")
(setf (get Tracking_pkg::CtrlCmd :definition-)
      "int32 longlCmdType

float64 accel
float64 brake
float64 steering

float64 velocity
float64 acceleration


")



(provide :Tracking_pkg/CtrlCmd "718f1a493f1a335da59a19f673d82bb4")


