;; Auto-generated. Do not edit!


(when (boundp 'gpsimu_pkg::gpsimu_msg)
  (if (not (find-package "GPSIMU_PKG"))
    (make-package "GPSIMU_PKG"))
  (shadow 'gpsimu_msg (find-package "GPSIMU_PKG")))
(unless (find-package "GPSIMU_PKG::GPSIMU_MSG")
  (make-package "GPSIMU_PKG::GPSIMU_MSG"))

(in-package "ROS")
;;//! \htmlinclude gpsimu_msg.msg.html


(defclass gpsimu_pkg::gpsimu_msg
  :super ros::object
  :slots (_heading _Position_E _Position_N _Position_U ))

(defmethod gpsimu_pkg::gpsimu_msg
  (:init
   (&key
    ((:heading __heading) 0.0)
    ((:Position_E __Position_E) 0.0)
    ((:Position_N __Position_N) 0.0)
    ((:Position_U __Position_U) 0.0)
    )
   (send-super :init)
   (setq _heading (float __heading))
   (setq _Position_E (float __Position_E))
   (setq _Position_N (float __Position_N))
   (setq _Position_U (float __Position_U))
   self)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:Position_E
   (&optional __Position_E)
   (if __Position_E (setq _Position_E __Position_E)) _Position_E)
  (:Position_N
   (&optional __Position_N)
   (if __Position_N (setq _Position_N __Position_N)) _Position_N)
  (:Position_U
   (&optional __Position_U)
   (if __Position_U (setq _Position_U __Position_U)) _Position_U)
  (:serialization-length
   ()
   (+
    ;; float32 _heading
    4
    ;; float32 _Position_E
    4
    ;; float32 _Position_N
    4
    ;; float32 _Position_U
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Position_E
       (sys::poke _Position_E (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Position_N
       (sys::poke _Position_N (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Position_U
       (sys::poke _Position_U (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _heading
     (setq _heading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Position_E
     (setq _Position_E (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Position_N
     (setq _Position_N (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Position_U
     (setq _Position_U (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get gpsimu_pkg::gpsimu_msg :md5sum-) "77440f548594fa764dfaeba6047008b5")
(setf (get gpsimu_pkg::gpsimu_msg :datatype-) "gpsimu_pkg/gpsimu_msg")
(setf (get gpsimu_pkg::gpsimu_msg :definition-)
      "float32 heading
float32 Position_E
float32 Position_N
float32 Position_U

")



(provide :gpsimu_pkg/gpsimu_msg "77440f548594fa764dfaeba6047008b5")


