;; Auto-generated. Do not edit!


(when (boundp 'plnctrl::fussInfo)
  (if (not (find-package "PLNCTRL"))
    (make-package "PLNCTRL"))
  (shadow 'fussInfo (find-package "PLNCTRL")))
(unless (find-package "PLNCTRL::FUSSINFO")
  (make-package "PLNCTRL::FUSSINFO"))

(in-package "ROS")
;;//! \htmlinclude fussInfo.msg.html


(defclass plnctrl::fussInfo
  :super ros::object
  :slots (_objNum _data ))

(defmethod plnctrl::fussInfo
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
    ;; uint16 _objNum
    2
    ;; plnctrl/fusInfo[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _objNum
       (write-word _objNum s)
     ;; plnctrl/fusInfo[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _objNum
     (setq _objNum (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; plnctrl/fusInfo[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance plnctrl::fusInfo :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get plnctrl::fussInfo :md5sum-) "80f20e09e9bf88e655f5e38cccf2953f")
(setf (get plnctrl::fussInfo :datatype-) "plnctrl/fussInfo")
(setf (get plnctrl::fussInfo :definition-)
      "uint16       objNum
fusInfo[]   data

================================================================================
MSG: plnctrl/fusInfo
int32           classes
float32         posX
float32         posY
float32         posZ
float32         size
float32         distance

")



(provide :plnctrl/fussInfo "80f20e09e9bf88e655f5e38cccf2953f")


