
(cl:in-package :asdf)

(defsystem "msg_tutorial-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "nameyear" :depends-on ("_package_nameyear"))
    (:file "_package_nameyear" :depends-on ("_package"))
  ))