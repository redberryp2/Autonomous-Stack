;; Auto-generated. Do not edit!


(when (boundp 'plnctrl::fusInfo)
  (if (not (find-package "PLNCTRL"))
    (make-package "PLNCTRL"))
  (shadow 'fusInfo (find-package "PLNCTRL")))
(unless (find-package "PLNCTRL::FUSINFO")
  (make-package "PLNCTRL::FUSINFO"))

(in-package "ROS")
;;//! \htmlinclude fusInfo.msg.html


(defclass plnctrl::fusInfo
  :super ros::object
  :slots (_classes _posX _posY _posZ _size _distance ))

(defmethod plnctrl::fusInfo
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
    ;; int32 _classes
    4
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
     ;; int32 _classes
       (write-long _classes s)
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
   ;; int32 _classes
     (setq _classes (sys::peek buf ptr- :integer)) (incf ptr- 4)
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

(setf (get plnctrl::fusInfo :md5sum-) "60517df6681971a7511b4a41ebdc61e5")
(setf (get plnctrl::fusInfo :datatype-) "plnctrl/fusInfo")
(setf (get plnctrl::fusInfo :definition-)
      "int32           classes
float32         posX
float32         posY
float32         posZ
float32         size
float32         distance

")



(provide :plnctrl/fusInfo "60517df6681971a7511b4a41ebdc61e5")


