;; Auto-generated. Do not edit!


(when (boundp 'plnctrl::signalInfo)
  (if (not (find-package "PLNCTRL"))
    (make-package "PLNCTRL"))
  (shadow 'signalInfo (find-package "PLNCTRL")))
(unless (find-package "PLNCTRL::SIGNALINFO")
  (make-package "PLNCTRL::SIGNALINFO"))

(in-package "ROS")
;;//! \htmlinclude signalInfo.msg.html


(defclass plnctrl::signalInfo
  :super ros::object
  :slots (_Num _sign ))

(defmethod plnctrl::signalInfo
  (:init
   (&key
    ((:Num __Num) 0)
    ((:sign __sign) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _Num (round __Num))
   (setq _sign __sign)
   self)
  (:Num
   (&optional __Num)
   (if __Num (setq _Num __Num)) _Num)
  (:sign
   (&optional __sign)
   (if __sign (setq _sign __sign)) _sign)
  (:serialization-length
   ()
   (+
    ;; int32 _Num
    4
    ;; int32[] _sign
    (* 4    (length _sign)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _Num
       (write-long _Num s)
     ;; int32[] _sign
     (write-long (length _sign) s)
     (dotimes (i (length _sign))
       (write-long (elt _sign i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _Num
     (setq _Num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _sign
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sign (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sign i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get plnctrl::signalInfo :md5sum-) "e2c6a5b3e819033d8f5f070abbb98dda")
(setf (get plnctrl::signalInfo :datatype-) "plnctrl/signalInfo")
(setf (get plnctrl::signalInfo :definition-)
      "int32 Num
int32[] sign


")



(provide :plnctrl/signalInfo "e2c6a5b3e819033d8f5f070abbb98dda")


