;; Auto-generated. Do not edit!


(when (boundp 'plnctrl::coeff)
  (if (not (find-package "PLNCTRL"))
    (make-package "PLNCTRL"))
  (shadow 'coeff (find-package "PLNCTRL")))
(unless (find-package "PLNCTRL::COEFF")
  (make-package "PLNCTRL::COEFF"))

(in-package "ROS")
;;//! \htmlinclude coeff.msg.html


(defclass plnctrl::coeff
  :super ros::object
  :slots (_Slope _Yintercept ))

(defmethod plnctrl::coeff
  (:init
   (&key
    ((:Slope __Slope) 0.0)
    ((:Yintercept __Yintercept) 0.0)
    )
   (send-super :init)
   (setq _Slope (float __Slope))
   (setq _Yintercept (float __Yintercept))
   self)
  (:Slope
   (&optional __Slope)
   (if __Slope (setq _Slope __Slope)) _Slope)
  (:Yintercept
   (&optional __Yintercept)
   (if __Yintercept (setq _Yintercept __Yintercept)) _Yintercept)
  (:serialization-length
   ()
   (+
    ;; float32 _Slope
    4
    ;; float32 _Yintercept
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Slope
       (sys::poke _Slope (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Yintercept
       (sys::poke _Yintercept (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Slope
     (setq _Slope (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Yintercept
     (setq _Yintercept (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get plnctrl::coeff :md5sum-) "79d5a347fa4ceb9a6b9ec816e2ae7406")
(setf (get plnctrl::coeff :datatype-) "plnctrl/coeff")
(setf (get plnctrl::coeff :definition-)
      "float32    Slope
float32    Yintercept

")



(provide :plnctrl/coeff "79d5a347fa4ceb9a6b9ec816e2ae7406")


