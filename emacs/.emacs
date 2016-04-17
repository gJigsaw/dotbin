;; require package so that at startup, we can check for and
;; install packages that aren't already installed.
(require 'package)

;; Include all package archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("elpy" . "http://jorgenschaefer.github.io/packages/")))

(package-refresh-contents)
(package-initialize)

(add-to-list 'load-path "/Users/jigsaw/.emacs.d/Modes/Dockerfile/")
;(require 'dockerfile-mode)
;(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode.el))


;; OSX Copy-Paste Functionality
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)


;(global-linum-mode t)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-attribute 'default nil :height 150)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Fill Column Indicator
(unless (package-installed-p 'fill-column-indicator)
  (package-install 'fill-column-indicator))
(require 'fill-column-indicator)
(setq fci-rule-width 2)
(setq fci-rule-color "darkblue")
(setq fci-rule-column 100)

(unless (package-installed-p 'column-enforce-mode)
  (package-install 'column-enforce-mode))
(require 'column-enforce-mode)
(column-enforce-mode t)
(setq column-enforce-column '100)

;; use spaces instead of tab character when I press the tab key
(setq-default indent-tabs-mode nil)

;; enable line and column numbering in the mode-line
(line-number-mode 1)
(column-number-mode 1)

;; disable emacs menubar, toolbar, scrollbar
(menu-bar-mode -1)
;(toggle-scroll-bar -1)
(tool-bar-mode -1)


;; auto-complete
(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete))
(require 'auto-complete-config)

;; rainbow-delimiters
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

;; Paredit
(unless (package-installed-p 'paredit)
  (package-install 'paredit))

;;helm mode
(unless (package-installed-p 'helm)
  (package-install 'helm))
(require 'helm-config)
(helm-mode 1)
(setq helm-ff-auto-update-initial-value 1)
(define-key global-map [remap find-filne] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
(define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)


;; Clojure
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'auto-complete-mode)
(add-hook 'clojure-mode-hook 'electric-indent-mode +1)
(setq clojure-defun-style-default-indent t)


;; cider
(unless (package-installed-p 'cider)
  (package-install 'cider))
(setq nrepl-hide-special-buffers t)
(setq cider-auto-select-error-buffer nil)
(setq cider-lein-command "/usr/local/bin/lein")
(setq cider-repl-result-prefix ";; => ")
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'electric-indent-mode +1)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(projectile-global-mode t)
(global-set-key (kbd "C-c h") 'helm-projectile)

;;(setq projectile-completion-system 'grizzl)

;; helm-projectile
(unless (package-installed-p 'helm-projectile)
  (package-install 'helm-projectile))

;; magit
;;(unless (package-installed-p 'magit)
;;  (package-install 'magit))
;;(global-set-key (kbd "C-x g") 'magit-status)

;;Wind move
;; (when (fboundp 'windmove-default-keybindings)
;;   (windmove-default-keybindings 'meta))

;;   (add-hook 'emacs-lisp-mode-hook
;;     (lambda ()
;;       (paredit-mode t)

;;       (turn-on-eldoc-mode)
;;       (eldoc-add-command
;;        'paredit-backward-delete
;;        'paredit-close-round)

;;       (local-set-key (kbd "RET") 'electrify-return-if-match)
;;       (eldoc-add-command 'electrify-return-if-match)

;;       (show-paren-mode t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin")))
 '(markdown-command "/usr/local/bin/markdown")
 '(python-check-command
   "/Users/jasongreen/Coding/VirtualEnvironments/sandbox3/bin/pyflakes")
 '(safe-local-variable-values (quote ((docker-image-name . "base")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;YAML mode
(unless (package-installed-p 'yaml-mode)
  (package-install 'yaml-mode))
;(yaml-mode)

;;Powerline
(unless (package-installed-p 'powerline)
  (package-install 'powerline))
(require 'powerline)
(setq powerline-color1 "#222")
(setq powerline-color2 "#444")
(setq powerline-arrow-shape 'curve)
(powerline-default-theme)

;;Python
(unless (package-installed-p 'elpy)
  (package-install 'elpy))
(elpy-enable)
;(elpy-use-ipython)
;(add-hook 'python-mode-hook 'fci-mode)
;(add-hook 'python-mode-hook 'before-save-hook 'require-final-newline t)

;;(elpy-clean-modeline)
(setq elpy-rpc-backend "jedi")
;(put 'downcase-region 'disabled nil)
;(put 'upcase-region 'disabled nil)
;; (when (executable-find "ipython")
;;   (setq
;;    python-shell-interpreter "ipython"
;;    python-shell-interpreter-args ""
;;    python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;    python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;    python-shell-completion-setup-code
;;    "from IPython.core.completerlib import module_completion"
;;    python-shell-completion-module-string-code
;;    "';'.join(module_completion('''%s'''))\n"
;;    python-shell-completion-string-code
;;    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

;; More Jedi
;(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:complete-on-dot t)                 ; optional

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(server-start t)

;; expand region
(unless (package-installed-p 'expand-region)
  (package-install 'expand-region))
(global-set-key (kbd "C-=") 'er/expand-region)

;; Solarized Color Theme
(unless (package-installed-p 'color-theme-solarized)
  (package-install 'color-theme-solarized))
(load-theme 'solarized-dark)



;;
;; Custom keybindings
;;
;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)
;; M-x without meta
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
;; kill lines backward
(global-set-key (kbd "C-<backspace>") (lambda ()
                                        (interactive)
                                        (kill-line 0)
                                        (indent-according-to-mode)))
;; Scrolling within a buffer
(defun scroll-down-one-line ()
  "Scroll down one line."
  (interactive)
  (scroll-down 1))
(defun scroll-up-one-line ()
  "Scroll up one line."
  (interactive)
  (scroll-up 1))
(global-set-key "\C-c\C-p" 'scroll-down-one-line)
(global-set-key "\C-c\C-n" 'scroll-up-one-line)
;; Scrolling between buffers
(global-set-key "\M-n"  'next-buffer)
(global-set-key "\M-p"  'previous-buffer)
(global-set-key "\C-x\C-n" 'next-buffer)
(global-set-key "\C-x\C-p" 'previous-buffer)


;; Enable Python Code Folding (Hide & Show)
(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-c -") 'hs-toggle-hiding)
(global-set-key (kbd "C-c (") 'hs-show-all)
(global-set-key (kbd "C-c )") 'hs-hide-all)
(global-set-key (kbd "C-c [") 'hs-show-block)
(global-set-key (kbd "C-c ]") 'hs-hide-block)
