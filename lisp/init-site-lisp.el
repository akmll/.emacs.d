;;; init-site-lisp.el --- Load manually installed packages
;;; Commentary:
;;; Code:

(defun load-site-lisp (dir)
  (require 'autoload)
  (let ((generated-autoload-file (expand-file-name "site-lisp-autoload.el" dir)))
    (dolist (dir (directory-files dir t "^[^.]"))
      (when (file-directory-p dir)
        (byte-recompile-directory dir 0)
        (update-directory-autoloads dir)))
    (add-to-list 'load-path dir)
    (load generated-autoload-file t t)))

(load-site-lisp (expand-file-name "site-lisp/" user-emacs-directory))

(provide 'init-site-lisp)
;;; init-site-lisp.el ends here
