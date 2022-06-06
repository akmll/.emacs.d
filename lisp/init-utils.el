;;; init-utils.el --- Provides utilities for initialization

;;; Commentary:
;;; Code:

(defun insert-current-date ()
  (interactive)
  (insert (format-time-string "%Y/%m/%d")))

(defun insert-current-time ()
  (interactive)
  (insert (format-time-string "%H:%M:%S")))

(provide 'init-utils)

;;; init-utils.el ends here
