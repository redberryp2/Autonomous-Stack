;; Auto-generated. Do not edit!


(when (boundp 'morai_tutorial::test_msg)
  (if (not (find-package "MORAI_TUTORIAL"))
    (make-package "MORAI_TUTORIAL"))
  (shadow 'test_msg (find-package "MORAI_TUTORIAL")))
(unless (find-package "MORAI_TUTORIAL::TEST_MSG")
  (make-package "MORAI_TUTORIAL::TEST_MSG"))

(in-package "ROS")
;;//! \htmlinclude test_msg.msg.html


(defclass morai_tutorial::test_msg
  :super ros::object
  :slots (_data_a _data_b _data_c ))

(defmethod morai_tutorial::test_msg
  (:init
   (&key
    ((:data_a __data_a) 0)
    ((:data_b __data_b) 0)
    ((:data_c __data_c) 0)
    )
   (send-super :init)
   (setq _data_a (round __data_a))
   (setq _data_b (round __data_b))
   (setq _data_c (round __data_c))
   self)
  (:data_a
   (&optional __data_a)
   (if __data_a (setq _data_a __data_a)) _data_a)
  (:data_b
   (&optional __data_b)
   (if __data_b (setq _data_b __data_b)) _data_b)
  (:data_c
   (&optional __data_c)
   (if __data_c (setq _data_c __data_c)) _data_c)
  (:serialization-length
   ()
   (+
    ;; int16 _data_a
    2
    ;; int16 _data_b
    2
    ;; int16 _data_c
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _data_a
       (write-word _data_a s)
     ;; int16 _data_b
       (write-word _data_b s)
     ;; int16 _data_c
       (write-word _data_c s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _data_a
     (setq _data_a (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _data_b
     (setq _data_b (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _data_c
     (setq _data_c (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get morai_tutorial::test_msg :md5sum-) "36b5034dc307de7513c892457d2121f8")
(setf (get morai_tutorial::test_msg :datatype-) "morai_tutorial/test_msg")
(setf (get morai_tutorial::test_msg :definition-)
      "int16 data_a
int16 data_b
int16 data_c


")



(provide :morai_tutorial/test_msg "36b5034dc307de7513c892457d2121f8")


