;;; init-utils.el --- Provides utilities for initialization

;;; Commentary:
;;; Code:

(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))


(defun zap/server-start ()
  (require 'server)
  (unless (server-running-p)
    (server-start)))

(provide 'init-utils)

;;; init-utils.el ends here
