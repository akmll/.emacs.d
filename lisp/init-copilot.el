;;; init-copilot.el --- Provide github-copilot  -*- lexical-binding: t; -*-

;;; Commentary:
;;

(use-package copilot
  :ensure t
  :if (executable-find "copilot-language-server")
  :hook (prog-mode)
  :diminish
  :bind (:map copilot-completion-map
              ("C-i" . 'copilot-accept-completion)
              ("C-<tab>" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion))
  )

(provide 'init-copilot)

;;; init-copilot.el ends here
