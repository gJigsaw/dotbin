
; Jason's .Emacs file

; follow symlinks by defalt
(setq vc-follow-symlinks t)

; Disable menu bar
(menu-bar-mode -1)

; Address Pixelbook's alt-backspace to delete binding
(global-set-key (kbd "<deletechar>") 'backward-kill-word)

; Docker
;(add-to-list 'load-path "~/.emacs.d/Modes/Dockerfile")
;(require 'dockerfile-mode)
;(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
