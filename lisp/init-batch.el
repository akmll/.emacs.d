;;; init-batch.el --- Configure packages to edit batch scripts

;;; Commentary:
;;

(defun bat-async-run (&optional args)
  "Run a batch file asynchronously"
  (interactive (list (if current-prefix-arg
                         (read-from-minibuffer "Args: ")
                       nil)))
  (let ((file-name-to-run
         (if args
             (concat buffer-file-name " " args)
           (buffer-file-name)))
        (compilation-buffer-name-function
         (lambda (name-of-mode)
           (concat "*Run: <" (file-name-nondirectory (buffer-file-name)) ">*"))))
    (save-buffer)
    (compile file-name-to-run)))

(defun bat-async-run-args (args)
  "Run a batch file asynchronously"
  (interactive "sArgs: ")
  (bat-async-run args))

(require 'bat-mode)
(add-hook 'bat-mode-hook
          (lambda ()
            (define-key bat-mode-map (kbd "C-C C-c") 'bat-async-run)
            (define-key bat-mode-map (kbd "C-C C-a") 'bat-async-run-args)
            ))

(provide 'init-batch)

;;; init-batch.el ends here
