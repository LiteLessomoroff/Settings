(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'package)


(setq auto-save-default nil)
(setq make-backup-files nil)

(require 'windmove)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Always load newest byte code
(setq load-prefer-newer t)

;; quit Emacs directly even if there are running processes
(setq confirm-kill-processes nil)

; make ibuffer default
(defalias 'list-buffers 'ibuffer)
(setq bs-default-configuration "all")




(defun .emacs-open ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun .my-org-open ()
  (interactive)
  (find-file "~/my.org"))

(defun .go-current ()
  (interactive)
  (find-file "h:/home/Dev/Go/project1/main.go"))

(defun nodeEditorInsured__folder ()
  (interactive)
  (dired "H:/HOME/WorkProjects/SOgaz/SmNskService/NodeEditorInsured")
  )

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))


(global-nlinum-mode)

;;; third-party packages
;(use-package dracula-theme
;  :ensure t
;  :config
;  (load-theme 'dracula t))

;(load-theme 'spacemacs-dark t)
;(load-theme 'moe-dark t)
(load-theme 'ample t)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(use-package elec-pair
  :config
  (electric-pair-mode +1))

(use-package calendar
  :config
  ;; weeks in Bulgaria start on Monday
  (setq calendar-week-start-day 1))

;; highlight the current line
(use-package hl-line
  :config
  (global-hl-line-mode +1))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(use-package avy
  :ensure t
  :bind (("C-;" . avy-goto-char-timer))
  :config
  (setq avy-background t))

;; hippie expand is dabbrev expand on steroids
(use-package hippie-exp
  :bind ([remap dabbrev-expand] . hippie-expand)
  :commands (hippie-expand)
  :custom
  (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'"))
  :config
  (setq hippie-expand-try-functions-list
        '(try-expand-dabbrev
          try-expand-dabbrev-all-buffers
          try-expand-dabbrev-from-kill
          try-complete-lisp-symbol-partially
          try-complete-lisp-symbol
          try-complete-file-name-partially
          try-complete-file-name
          try-expand-all-abbrevs
          try-expand-list
          try-expand-line)))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 1.1)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode)
  (diminish 'company-mode))

;(use-package python-ts-mode
;  :hook ((python-ts-mode . eglot-ensure)
;	 (python-ts-mode . company-mode)
;	 )
;  :mode(("\\.py\\'" . python-ts-mode))
;  )

(use-package elpy
  :ensure t
  :init
  (elpy-enable))
;(pyenv-mode)
(setq python-shell-interpreter "c:/Program Files/Python312/python.exe"
      python-shell-interpreter-args "-i")

(use-package dired
  :config
  ;; dired - reuse current buffer by pressing 'a'
  (put 'dired-find-alternate-file 'disabled nil)

  ;; always delete and copy recursively
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)

  ;; if there is a dired buffer displayed in the next window, use its
  ;; current subdir, instead of the current subdir of this d ired buffer
  (setq dired-dwim-target t)

  ;; enable some really cool extensions like C-x C-j(dired-jump)
  (require 'dired-x))

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)


;(prefer-coding-system 'utf-8)
;(set-default-coding-systems 'utf-8)
;(set-terminal-coding-system 'utf-8)
;(set-keyboard-coding-system 'utf-8)

;(setq js-comint-program-command "G:/Program Files/NodeJS/node.exe")
;(add-hook 'js2-mode-hook
;            (lambda ()
;              (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
;              (local-set-key (kbd "C-c b") 'js-send-buffer)))



;(use-package lsp-mode)
;(add-hook 'prog-mode-hook #'lsp)

;(use-package dap-mode
;  :config
;  (dap-auto-configure-mode)
;  :bind
;  (("<f7>" . dap-step-in)
;   ("<f8>" . dap-next)
;   ("<f9>" . dap-continue)))
;(require 'dap-firefox)

 (use-package ergoemacs-mode
      :ensure t
      :bind (("S-SPC" . " ")	    ;shift space should be a space	 
    	 ("C-<delete>" . kill-word))	
      :init
          (setq ergoemacs-ignore-prev-global nil) 
          (setq ergoemacs-theme nil)
          (setq ergoemacs-keyboard-layout "us")
          (ergoemacs-mode 1)
      )

(define-key ergoemacs-override-keymap (kbd "M-`") nil)
(define-key ergoemacs-override-keymap (kbd "M-ё") nil)
(define-key ergoemacs-override-keymap (kbd "M-q") nil)
(define-key ergoemacs-override-keymap (kbd "M-e") nil)
(define-key ergoemacs-override-keymap (kbd "M-й") nil)
(define-key ergoemacs-override-keymap (kbd "M-у") nil)
(define-key ergoemacs-override-keymap (kbd "M-<up>") nil)
(define-key ergoemacs-override-keymap (kbd "M-<left>") nil)
(define-key ergoemacs-override-keymap (kbd "M-<down>") nil)
(define-key ergoemacs-override-keymap (kbd "M-<right>") nil)
(define-key ergoemacs-override-keymap (kbd "M-/") nil)
(define-key ergoemacs-override-keymap (kbd "M-r") nil)
(define-key ergoemacs-override-keymap (kbd "M-к") nil)

(define-key elpy-mode-map (kbd "M-<right>") nil)
(define-key elpy-mode-map (kbd "M-<left>") nil)
(define-key elpy-mode-map (kbd "M-<up>") nil)
(define-key elpy-mode-map (kbd "M-<down>") nil)

(global-set-key (kbd "<f5>") 'bs-show)
(global-set-key (kbd "C-h л") 'describe-key)
(global-set-key (kbd "M-q") 'split-window-horizontally)
(global-set-key (kbd "M-й") 'split-window-horizontally)
(global-set-key (kbd "M-e") 'split-window-vertically)
(global-set-key (kbd "M-у") 'split-window-vertically)
(global-set-key (kbd "M-`") 'execute-extended-command)
(global-set-key (kbd "M-ё") 'execute-extended-command)
(global-set-key (kbd "M-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-S-<up>") 'enlarge-window)
(global-set-key (kbd "M-S-<down>") 'shrink-window)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-`") 'execute-extended-command)
(global-set-key (kbd "M-ё") 'execute_extended_command)
(global-set-key (kbd "M-/") #'hippie-expand)
(global-set-key (kbd "s-/") #'hippie-expand)
(global-set-key (kbd "C-ы") #'save-buffer)
(global-set-key (kbd "C-м") #'yank)
(global-set-key (kbd "C-я") #'undo)
(global-set-key (kbd "M-C-S-<up>") 'move-line-up)
(global-set-key (kbd "M-C-S-<down>") 'move-line-down)
(define-key global-map (kbd "M-r") 'replace-string)
(define-key global-map (kbd "M-к") 'replace-string)

;;GOlang section
;;1)go install golang.org/x/tools/gopls@latest
(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)

(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(lsp-register-custom-settings
 '(("gopls.completeUnimported" t t)
   ("gopls.staticcheck" t t)))

(setq-default eglot-workspace-configuration
    '((:gopls .
        ((staticcheck . t)
         (matcher . "CaseSensitive")))))

(add-hook 'before-save-hook
    (lambda ()
        (call-interactively 'eglot-code-action-organize-imports))
    nil t)



(set-frame-font "Inconsolata-g 11" nil t)

(if (window-system)
    (progn (set-frame-height (selected-frame) 44)
           (set-frame-width (selected-frame) 160)))


;(use-package omnisharp
;  :after company
;  :config
;  (add-hook 'csharp-mode-hook 'omnisharp-mode)
;  (add-to-list 'company-backends 'company-omnisharp))

;(define-key omnisharp-mode-map (kbd ".") 'omnisharp-add-dot-and-auto-complete)
;(define-key omnisharp-mode-map (kbd "<S-SPC>") 'omnisharp-auto-complete)
;(add-hook 'csharp-mode-hook 'flycheck-mode)

;(use-package yasnippet
;  :config
;  (yas-global-mode 1))
;(yas-global-mode 1)
;(sql-ms '("" "" "localhost" "exp_reg")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flymake-go cargo cargo-mode flycheck-rust go-mode rust-mode pyenv-mode yasnippet-snippets web-mode use-package sqlformat spacemacs-theme solarized-theme rustic projectile nlinum-hl moe-theme magit lua-mode js2-mode js-comint format-all flyspell-correct ergoemacs-mode elpy easy-kill dracula-theme diminish dap-mode auto-complete ample-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
