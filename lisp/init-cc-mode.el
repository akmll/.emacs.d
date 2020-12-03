;;; init-cc-mode.el --- Initialize C/C++ mode

;;; Commentary:
;;

;;; Code:

;; Initialize CC-mode style
(c-add-style "zap"
             '("bsd"
               (c-offsets-alist
                (inextern-lang . 0)
                (inline-open . 0)
                (innamespace . 0)
                )
               (c-basic-offset . 4)
               (c-tab-always-indent . nil)
               ))

(require-package 'ggtags)
(setq ggtags-enable-navigation-keys nil)

(require-package 'smart-tabs-mode)

(defun zap/c-mode-hook ()
  (local-set-key (kbd "M-f") 'c-forward-into-nomenclature)
  (local-set-key (kbd "M-b") 'c-backward-into-nomenclature)

  (setq tab-width 4)
  (setq c-basic-offset 4)
  ;; (setq indent-tabs-mode nil)
  (setq comment-column 40)

  (setq c-tab-always-indent nil)

  (c-set-style "zap")
  (smart-tabs-insinuate 'c 'c++ 'java 'javascript 'python 'ruby 'nxml)
  (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
    (ggtags-mode 1))
  )

(add-hook 'c-mode-common-hook 'zap/c-mode-hook)

(require-package 'cmake-mode)

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
