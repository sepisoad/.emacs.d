;;; package --- init.el
;;; Commentary:
;;; @sepisoad Emacs init file

;;; Code:

;;; melpa

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(treemacs evil docker yaml-mode projectile flycheck ivy racket-mode janet-mode parinfer)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; core configs

(tool-bar-mode -1) ; hide toolbar
(menu-bar-mode -1) ; hide menubar
(scroll-bar-mode -1) ; hide scrollbar
(setq make-backup-files nil) ; stop creating ~ files
(set-default 'truncate-lines t) ; disable line wrap
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
(setq inhibit-startup-screen t) ; hide splash screen
(global-display-line-numbers-mode 1)
;;; theme config

(add-to-list 'custom-theme-load-path "/home/sepisoad/.emacs.d/themes")
(load-theme 'abyss t)
(setq custom-safe-themes t)
(show-paren-mode 1)

;; font config

(set-face-attribute 'default nil :font "Liga Monego")
(set-frame-font "Liga Monego 12" nil t)

(set-face-italic 'font-lock-comment-face nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(when window-system
  (set-fontset-font "fontset-default" '(#x600 . #x6ff) "Samim"))

(use-package ligature
  :load-path "ligature/"
  :config
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

;;; ivy

(ivy-mode 1)

;;; projectile

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;; sepisoad short functions
(defun DIR ()
  "Set the paragaph text direction."
  (interactive
    (let ((DIRX (read-string "which direction (rtl/ltr):")))
      (when (equal "rtl" DIRX)
        (setq bidi-paragraph-direction 'right-to-left))
      (when (equal "ltr" DIRX)
        (setq bidi-paragraph-direction 'left-to-right)))))

;;; racket-mode

(require 'racket-xp)
(add-hook 'racket-xp-mode-hook
  (lambda ()
    (remove-hook 'pre-redisplay-functions
		 #'racket-xp-pre-redisplay
		 t)))
(add-hook 'racket-mode-hook
  (lambda ()
	  (define-key racket-mode-map (kbd "<f5>") 'racket-run)
    (define-key racket-mode-map (kbd "<f12>") 'racket-xp-describe)
    (setq tab-always-indent 'complete)
    (setq racket-program "/home/sepisoad/.racket/bin/racket")))

;;; @SEPISOAD TODO:
;;; [ ] learn projectile
;;; [ ] learn elisp
;;; [ ] learn ivy
;;; [ ] learn flycheck

(provide 'init)
;;; init.el ends here



