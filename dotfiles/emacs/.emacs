;(set-foreground-color "white");
;(set-background-color "black");

(setq-default indent-tabs-mode nil);
(setq default-tab-width 4);
;(setq scroll-step 1);

;;colors and syntax highlighting
;(cond ((fboundp 'global-font-lock-mode)
       ;; Turn on font-lock in all modes that support it
;       (global-font-lock-mode t)
       ;; Maximum colors
;       (setq font-lock-maximum-decoration t)))

; (autoload 'python-mode "python-mode" "Python Mode." t)
; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;(load-file "~/.emacs.d/fontlock.el")

;; iswitchb
;(iswitchb-mode 1)
;(setq iswitchb-default-method 'samewindow)

(require 'tramp)
;(setq tramp-default-method "sshx")
;(setq tramp-default-user "USER_NAME"
;      tramp-default-host "BOUNCE_BOX")
;(add-to-list 'tramp-default-proxies-alist
;             '("ns1" nil "/sshx:USER_NAME@BOUNCE_BOX@DOMAIN_NAME.COM:"))

;(put 'narrow-to-region 'disabled nil)

;Display Column Number
(setq column-number-mode t)

;Cisco Router Mode
(autoload 'cisco-router-mode "~/.emacs.d/cisco-router-mode.el" "Major mode for Cisco Routers." t)

(provide 'emacs-init)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "~/.emacs.d/groovy-mode.el" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
;(add-hook 'groovy-mode-hook
;          '(lambda ()
;             (require 'groovy-electric)
;             (groovy-electric-mode)))

;;; Backups
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; Save all tempfiles in $TMPDIR/emacs$UID/
    (defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
    (setq backup-directory-alist
        `((".*" . ,emacs-tmp-dir)))
    (setq auto-save-file-name-transforms
        `((".*" ,emacs-tmp-dir t)))
    (setq auto-save-list-file-prefix
        emacs-tmp-dir)

;; Bring groovy indentation to 4 spaces
(defun my-c-mode-hook () 
   (setq indent-tabs-mode nil 
         c-basic-offset 4)) 
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;; helm
;; [Facultative] Only if you have installed async.
(add-to-list 'load-path "~/.emacs.d/async")
(add-to-list 'load-path "~/.emacs.d/helm")
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)
