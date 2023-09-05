;; Auto-generated. Do not edit!


(when (boundp 'plnctrl::GNSSInfo)
  (if (not (find-package "PLNCTRL"))
    (make-package "PLNCTRL"))
  (shadow 'GNSSInfo (find-package "PLNCTRL")))
(unless (find-package "PLNCTRL::GNSSINFO")
  (make-package "PLNCTRL::GNSSINFO"))

(in-package "ROS")
;;//! \htmlinclude GNSSInfo.msg.html


(defclass plnctrl::GNSSInfo
  :super ros::object
  :slots (_heading _latitude _longitude _altitude ))

(defmethod plnctrl::GNSSInfo
  (:init
   (&key
    ((:heading __heading) 0.0)
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:altitude __altitude) 0.0)
    )
   (send-super :init)
   (setq _heading (float __heading))
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _altitude (float __altitude))
   self)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:altitude
   (&optional __altitude)
   (if __altitude (setq _altitude __altitude)) _altitude)
  (:serialization-length
   ()
   (+
    ;; float32 _heading
    4
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ;; float64 _altitude
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _heading
     (setq _heading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _altitude
     (setq _altitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get plnctrl::GNSSInfo :md5sum-) "9d7430197e46d53fe663cf5d6b910d2b")
(setf (get plnctrl::GNSSInfo :datatype-) "plnctrl/GNSSInfo")
(setf (get plnctrl::GNSSInfo :definition-)
      "float32     heading
float64     latitude
float64     longitude
float64     altitude

")



(provide :plnctrl/GNSSInfo "9d7430197e46d53fe663cf5d6b910d2b")


