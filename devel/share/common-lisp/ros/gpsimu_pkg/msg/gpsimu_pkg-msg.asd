
(cl:in-package :asdf)

(defsystem "gpsimu_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "INS" :depends-on ("_package_INS"))
    (:file "_package_INS" :depends-on ("_package"))
    (:file "gpsimu_msg" :depends-on ("_package_gpsimu_msg"))
    (:file "_package_gpsimu_msg" :depends-on ("_package"))
  ))