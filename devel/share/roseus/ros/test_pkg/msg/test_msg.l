;; Auto-generated. Do not edit!


(when (boundp 'test_pkg::test_msg)
  (if (not (find-package "TEST_PKG"))
    (make-package "TEST_PKG"))
  (shadow 'test_msg (find-package "TEST_PKG")))
(unless (find-package "TEST_PKG::TEST_MSG")
  (make-package "TEST_PKG::TEST_MSG"))

(in-package "ROS")
;;//! \htmlinclude test_msg.msg.html


(defclass test_pkg::test_msg
  :super ros::object
  :slots (_data_a _data_b _data_c ))

(defmethod test_pkg::test_msg
  (:init
   (&key
    ((:data_a __data_a) 0)
    ((:data_b __data_b) 0.0)
    ((:data_c __data_c) 0.0)
    )
   (send-super :init)
   (setq _data_a (round __data_a))
   (setq _data_b (float __data_b))
   (setq _data_c (float __data_c))
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
    ;; float32 _data_b
    4
    ;; float64 _data_c
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _data_a
       (write-word _data_a s)
     ;; float32 _data_b
       (sys::poke _data_b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _data_c
       (sys::poke _data_c (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _data_a
     (setq _data_a (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _data_b
     (setq _data_b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _data_c
     (setq _data_c (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get test_pkg::test_msg :md5sum-) "dee99328feda92f62e13175df4bb1f06")
(setf (get test_pkg::test_msg :datatype-) "test_pkg/test_msg")
(setf (get test_pkg::test_msg :definition-)
      "int16 data_a
float32 data_b
float64 data_c

")



(provide :test_pkg/test_msg "dee99328feda92f62e13175df4bb1f06")


