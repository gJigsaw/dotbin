
; Jason's .Emacs file

; follow symlinks by defalt
(setq vc-follow-symlinks t)

; Disable menu bar
(menu-bar-mode -1)

; Address Pixelbook's alt-backspace to delete binding
;    Dsabled once I found crosh preferences under Ctrl-Shitf-p 
;    and then checked the "Alt-Backspace is Meta-Backspace" checkbox
;(global-set-key (kbd "<deletechar>") 'backward-kill-word)

; Docker
;(add-to-list 'load-path "~/.emacs.d/Modes/Dockerfile")
;(require 'dockerfile-mode)
;(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
