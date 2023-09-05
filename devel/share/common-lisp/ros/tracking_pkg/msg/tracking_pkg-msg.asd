
(cl:in-package :asdf)

(defsystem "tracking_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CtrlCmd" :depends-on ("_package_CtrlCmd"))
    (:file "_package_CtrlCmd" :depends-on ("_package"))
  ))