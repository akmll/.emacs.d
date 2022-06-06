;;; init-site-lisp.el --- Load manually installed packages
;;; Commentary:
;;; Code:

(require 'cl-lib)

(let ((site-lisp-dir (expand-file-name "site-lisp/" user-emacs-directory)))
  (push site-lisp-dir load-path)
  (let ((default-directory site-lisp-dir))
    (setq load-path
          (append
           (cl-remove-if-not #'file-directory-p
                             (directory-files (expand-file-name site-lisp-dir) t "^[^\\.]"))
           load-path))))

(provide 'init-site-lisp)
;;; init-site-lisp.el ends here
