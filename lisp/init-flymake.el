;;; init-flymake.el --- Initialize flymake for error checking

;;; Commentary:
;;

(require 'flymake)
(with-eval-after-load 'flymake
  (global-set-key (kbd "M-N") 'flymake-goto-next-error)
  (global-set-key (kbd "M-P") 'flymake-goto-prev-error))

(provide 'init-flymake)

;;; init-flymake.el ends here
