;; Auto-generated. Do not edit!


(when (boundp 'morai_tutorial::test2)
  (if (not (find-package "MORAI_TUTORIAL"))
    (make-package "MORAI_TUTORIAL"))
  (shadow 'test2 (find-package "MORAI_TUTORIAL")))
(unless (find-package "MORAI_TUTORIAL::TEST2")
  (make-package "MORAI_TUTORIAL::TEST2"))

(in-package "ROS")
;;//! \htmlinclude test2.msg.html


(defclass morai_tutorial::test2
  :super ros::object
  :slots (_ok _point_x _point_z ))

(defmethod morai_tutorial::test2
  (:init
   (&key
    ((:ok __ok) nil)
    ((:point_x __point_x) 0)
    ((:point_z __point_z) 0.0)
    )
   (send-super :init)
   (setq _ok __ok)
   (setq _point_x (round __point_x))
   (setq _point_z (float __point_z))
   self)
  (:ok
   (&optional (__ok :null))
   (if (not (eq __ok :null)) (setq _ok __ok)) _ok)
  (:point_x
   (&optional __point_x)
   (if __point_x (setq _point_x __point_x)) _point_x)
  (:point_z
   (&optional __point_z)
   (if __point_z (setq _point_z __point_z)) _point_z)
  (:serialization-length
   ()
   (+
    ;; bool _ok
    1
    ;; int32 _point_x
    4
    ;; float32 _point_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _ok
       (if _ok (write-byte -1 s) (write-byte 0 s))
     ;; int32 _point_x
       (write-long _point_x s)
     ;; float32 _point_z
       (sys::poke _point_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _ok
     (setq _ok (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _point_x
     (setq _point_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _point_z
     (setq _point_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get morai_tutorial::test2 :md5sum-) "9898456a3461836f8bb89662ffdfc4b6")
(setf (get morai_tutorial::test2 :datatype-) "morai_tutorial/test2")
(setf (get morai_tutorial::test2 :definition-)
      "bool ok
int32 point_x
float32 point_z

")



(provide :morai_tutorial/test2 "9898456a3461836f8bb89662ffdfc4b6")


