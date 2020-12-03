;;; init-ui.el --- Intialize UI releated configurations

;;; Commentary:
;;; Code:

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 "%b"))))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

(require-package 'disable-mouse)

;; windows related
(add-hook 'after-init-hook 'winner-mode)

(require-package 'switch-window)
(setq-default switch-window-shortcut-style 'alphabet)
(setq-default switch-window-timeout nil)
(global-set-key (kbd "C-x o") 'switch-window)

(eval-when-compile (require 'cl))
;; When splitting window, show (other-buffer) in the new window
(defun split-window-func-with-other-buffer (split-function)
  (lexical-let ((func split-function))
    (lambda (&optional arg)
      (interactive)
      (funcall func)
      (let ((target-window (next-window)))
	(set-window-buffer (next-window) (other-buffer))
	(unless arg
	  (select-window target-window))))))`

(global-set-key (kbd "C-x 2") (split-window-func-with-other-buffer 'split-window-vertically))
(global-set-key (kbd "C-x 3") (split-window-func-with-other-buffer 'split-window-horizontally))

(provide 'init-ui)
;;; init-ui.el ends here
