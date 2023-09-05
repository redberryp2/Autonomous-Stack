;; Auto-generated. Do not edit!


(when (boundp 'msg_tutorial::nameyear)
  (if (not (find-package "MSG_TUTORIAL"))
    (make-package "MSG_TUTORIAL"))
  (shadow 'nameyear (find-package "MSG_TUTORIAL")))
(unless (find-package "MSG_TUTORIAL::NAMEYEAR")
  (make-package "MSG_TUTORIAL::NAMEYEAR"))

(in-package "ROS")
;;//! \htmlinclude nameyear.msg.html


(defclass msg_tutorial::nameyear
  :super ros::object
  :slots (_name _year ))

(defmethod msg_tutorial::nameyear
  (:init
   (&key
    ((:name __name) "")
    ((:year __year) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _year (round __year))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:year
   (&optional __year)
   (if __year (setq _year __year)) _year)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int16 _year
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int16 _year
       (write-word _year s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int16 _year
     (setq _year (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get msg_tutorial::nameyear :md5sum-) "a9d7ce781d868659bc667665f71834f8")
(setf (get msg_tutorial::nameyear :datatype-) "msg_tutorial/nameyear")
(setf (get msg_tutorial::nameyear :definition-)
      "string name
int16 year
")



(provide :msg_tutorial/nameyear "a9d7ce781d868659bc667665f71834f8")


