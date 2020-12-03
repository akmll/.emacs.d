;;; init-site-lisp.el --- Load manually installed packages
;;; Commentary:
;;; Code:

(require 'cl-lib)
(let ((site-lisp-dir (expand-file-name "site-lisp/" user-emacs-directory)))
  (let* ((default-directory site-lisp-dir))
    (progn
      (setq load-path
	    (append
	     (cl-remove-if-not
	      (lambda (dir) (file-directory-p dir))
	      (directory-files (expand-file-name site-lisp-dir) t "^[^\\.]"))
	     load-path)))))

(provide 'init-site-lisp)
;;; init-site-lisp.el ends here
