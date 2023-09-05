;; Auto-generated. Do not edit!


(when (boundp 'plnctrl::objsInfo)
  (if (not (find-package "PLNCTRL"))
    (make-package "PLNCTRL"))
  (shadow 'objsInfo (find-package "PLNCTRL")))
(unless (find-package "PLNCTRL::OBJSINFO")
  (make-package "PLNCTRL::OBJSINFO"))

(in-package "ROS")
;;//! \htmlinclude objsInfo.msg.html


(defclass plnctrl::objsInfo
  :super ros::object
  :slots (_objNum _data ))

(defmethod plnctrl::objsInfo
  (:init
   (&key
    ((:objNum __objNum) 0)
    ((:data __data) ())
    )
   (send-super :init)
   (setq _objNum (round __objNum))
   (setq _data __data)
   self)
  (:objNum
   (&optional __objNum)
   (if __objNum (setq _objNum __objNum)) _objNum)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; int32 _objNum
    4
    ;; plnctrl/objInfo[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _objNum
       (write-long _objNum s)
     ;; plnctrl/objInfo[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _objNum
     (setq _objNum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; plnctrl/objInfo[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance plnctrl::objInfo :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get plnctrl::objsInfo :md5sum-) "519e5ac559f94c92999b0c7095c3df57")
(setf (get plnctrl::objsInfo :datatype-) "plnctrl/objsInfo")
(setf (get plnctrl::objsInfo :definition-)
      "int32       objNum
objInfo[]   data

================================================================================
MSG: plnctrl/objInfo
int16           classes
float32         posX
float32         posY
float32         posZ
float32         size
float32         distance

")



(provide :plnctrl/objsInfo "519e5ac559f94c92999b0c7095c3df57")


