
(cl:in-package :asdf)

(defsystem "morai_tutorial-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CtrlCmd" :depends-on ("_package_CtrlCmd"))
    (:file "_package_CtrlCmd" :depends-on ("_package"))
    (:file "test2" :depends-on ("_package_test2"))
    (:file "_package_test2" :depends-on ("_package"))
    (:file "test_msg" :depends-on ("_package_test_msg"))
    (:file "_package_test_msg" :depends-on ("_package"))
  ))