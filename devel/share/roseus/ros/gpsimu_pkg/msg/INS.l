;; Auto-generated. Do not edit!


(when (boundp 'gpsimu_pkg::INS)
  (if (not (find-package "GPSIMU_PKG"))
    (make-package "GPSIMU_PKG"))
  (shadow 'INS (find-package "GPSIMU_PKG")))
(unless (find-package "GPSIMU_PKG::INS")
  (make-package "GPSIMU_PKG::INS"))

(in-package "ROS")
;;//! \htmlinclude INS.msg.html


(defclass gpsimu_pkg::INS
  :super ros::object
  :slots (_heading _latitude _longitude _altitude ))

(defmethod gpsimu_pkg::INS
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
    ;; float32 _latitude
    4
    ;; float32 _longitude
    4
    ;; float32 _altitude
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _heading
     (setq _heading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _latitude
     (setq _latitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _longitude
     (setq _longitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _altitude
     (setq _altitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get gpsimu_pkg::INS :md5sum-) "5fc7451370d24ecdce043ba9dc43b353")
(setf (get gpsimu_pkg::INS :datatype-) "gpsimu_pkg/INS")
(setf (get gpsimu_pkg::INS :definition-)
      "float32 heading
float32 latitude
float32 longitude
float32 altitude

")



(provide :gpsimu_pkg/INS "5fc7451370d24ecdce043ba9dc43b353")


