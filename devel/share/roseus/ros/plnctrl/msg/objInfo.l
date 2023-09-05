;; Auto-generated. Do not edit!


(when (boundp 'plnctrl::objInfo)
  (if (not (find-package "PLNCTRL"))
    (make-package "PLNCTRL"))
  (shadow 'objInfo (find-package "PLNCTRL")))
(unless (find-package "PLNCTRL::OBJINFO")
  (make-package "PLNCTRL::OBJINFO"))

(in-package "ROS")
;;//! \htmlinclude objInfo.msg.html


(defclass plnctrl::objInfo
  :super ros::object
  :slots (_classes _posX _posY _posZ _size _distance ))

(defmethod plnctrl::objInfo
  (:init
   (&key
    ((:classes __classes) 0)
    ((:posX __posX) 0.0)
    ((:posY __posY) 0.0)
    ((:posZ __posZ) 0.0)
    ((:size __size) 0.0)
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _classes (round __classes))
   (setq _posX (float __posX))
   (setq _posY (float __posY))
   (setq _posZ (float __posZ))
   (setq _size (float __size))
   (setq _distance (float __distance))
   self)
  (:classes
   (&optional __classes)
   (if __classes (setq _classes __classes)) _classes)
  (:posX
   (&optional __posX)
   (if __posX (setq _posX __posX)) _posX)
  (:posY
   (&optional __posY)
   (if __posY (setq _posY __posY)) _posY)
  (:posZ
   (&optional __posZ)
   (if __posZ (setq _posZ __posZ)) _posZ)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; int16 _classes
    2
    ;; float32 _posX
    4
    ;; float32 _posY
    4
    ;; float32 _posZ
    4
    ;; float32 _size
    4
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _classes
       (write-word _classes s)
     ;; float32 _posX
       (sys::poke _posX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _posY
       (sys::poke _posY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _posZ
       (sys::poke _posZ (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _size
       (sys::poke _size (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _classes
     (setq _classes (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _posX
     (setq _posX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _posY
     (setq _posY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _posZ
     (setq _posZ (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _size
     (setq _size (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get plnctrl::objInfo :md5sum-) "d2cef7aa5802a9817bbcec1ed7df06d6")
(setf (get plnctrl::objInfo :datatype-) "plnctrl/objInfo")
(setf (get plnctrl::objInfo :definition-)
      "int16           classes
float32         posX
float32         posY
float32         posZ
float32         size
float32         distance

")



(provide :plnctrl/objInfo "d2cef7aa5802a9817bbcec1ed7df06d6")


