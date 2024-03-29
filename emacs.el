(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(use-package helm)
(use-package projectile)
(use-package helm-projectile)

(use-package emacs
  :bind (([(super s)] . save-buffer)))

(use-package magit
  :config
  (setq magit-diff-refine-hunk 'all)
  ;; :bind (:map magit-status-mode-map
  ;; 	      ([down] . next-line)
  ;; 	      ([up] . previous-line))
  )

(use-package xterm-color)

(use-package magit-delta
  :after magit
  :config
  (add-to-list 'magit-delta-delta-args "--light")
  (add-to-list 'magit-delta-delta-args "--no-gitconfig")
  (add-hook 'magit-mode-hook (lambda () (magit-delta-mode +1)))
  (setq magit-delta-delta-executable "~/bin/delta"))

(defun dan/magit-kill-buffers ()
  (interactive)
  (mapc (lambda (buffer)
          (and (string-match-p "magit" (buffer-name buffer))
               (kill-buffer buffer)))
        (buffer-list))
  (magit-status))


;; Hack to extend magit-delta colors to right margin.
;; Delete this if not using light (GitHub) theme.
(with-eval-after-load 'magit-delta
    (set-face-attribute 'magit-diff-added-highlight nil
              :background "#d0ffd0")
    (set-face-attribute 'magit-diff-added nil
              :background "#d0ffd0")
    (set-face-attribute 'magit-diff-removed-highlight nil
              :background "#ffe0e0")
    (set-face-attribute 'magit-diff-removed nil
              :background "#ffe0e0"))

(add-hook 'magit-delta-mode-hook
            (lambda ()
              (setq face-remapping-alist
                    (seq-difference face-remapping-alist
                                    '((magit-diff-removed . default)
                                      (magit-diff-removed-highlight . default)
                                      (magit-diff-added . default)
                                      (magit-diff-added-highlight . default))))))
;; end hack
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package undo-tree
  :config
  (undo-tree-mode 1))

(load-file "~/src/3p/dan-emacs-config/lib.el")

(require 'server)
(unless (server-running-p) (server-start))


(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)


;; appearance
;; (load-theme 'railscasts t)
(set-cursor-color "red")
(blink-cursor-mode -1)
(tool-bar-mode -1)
(defun dan/set-show-paren-style ()
  (show-paren-mode t)
  (setq show-paren-delay .125)
  (setq show-paren-style 'parenthesis)
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold)
  (set-face-background 'show-paren-match (face-background 'default))
  (set-face-attribute 'show-paren-match nil :foreground "red"))
(dan/set-show-paren-style)
(setq-default cursor-type 'bar)
(setq ring-bell-function (lambda () nil))

;;; scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq linum-delay t)
(setq scroll-conservatively 10000)

;; projectile and helm
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq helm-full-frame t)
(setq dan/ignored-patterns nil)



;; multiple cursors
(advice-add 'mc/edit-lines :before (lambda (&rest args) (previous-logical-line 1 nil)))

;; misc configuration
(setq vc-follow-symlinks t)
(global-linum-mode 1)
(setq truncate-lines t)
(setq make-backup-files nil)
(delete-selection-mode)
(setq create-lockfiles nil)
(use-package emacs
  :bind (([super s] . save-buffer)
	 ([(super v)] . yank)))

;; latex
(defun dan/latex-mode-hook-fn ()
  (interactive)
  (dan/setup-paired-characters)
  (local-set-key "\C-c\C-c" 'dan/save-even-if-not-modified)
  (dan/set-up-outline-minor-mode "\\(\\\\sub\\|\\\\section\\)")
  (dan/latex-watch))
(add-hook 'latex-mode-hook 'dan/latex-mode-hook-fn)

;; (setq exec-path
;;       (append '("/usr/local/texlive/2016basic/bin/x86_64-darwin") exec-path))


;; mode hooks
(require 'scheme)
(defun lisp-modes-hook-fn ()
  (paredit-mode))

(add-hook 'emacs-lisp-mode-hook 'lisp-modes-hook-fn)
(add-hook 'scheme-mode-hook 'lisp-modes-hook-fn)

(defun dan/minibuffer-setup-hook-fn ()
  (when (eq this-command 'eval-expression)
    (setq completion-at-point-functions '(lisp-completion-at-point t))
    (local-set-key [tab] 'complete-symbol)
    (paredit-mode 1)))
(add-hook 'minibuffer-setup-hook 'dan/minibuffer-setup-hook-fn)

(defun cnoll-kill-line ()
  (interactive)
  (beginning-of-line)
  (kill-line))

;; Hack to make tab indent the region when the region is active, and
;; maintain the active region afterwards.
(advice-add 'indent-for-tab-command :after
	    (lambda (&rest args)
	      (when (eq last-command 'indent-for-tab-command)
		(exchange-point-and-mark))))
(setq indent-region-function 'dan/indent-shift-right)


(defun python-hook-function ()
  (jedi:setup)
  (flycheck-mode))

(add-hook 'python-mode-hook 'python-hook-function)


;; C
(defun c-hook-function ()
  (setq c-basic-offset 4))
(add-hook 'c-mode-hook 'c-hook-function)


;; JavaScript
(defun js-hook-function ()
  (setq js-basic-offset 2))
(add-hook 'js-mode-hook 'js-hook-function)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(magit-delta magit rust-mode eglot xterm-color libgit dockerfile-mode go-mode helm-swoop markdown-mode paredit undo-tree yasnippet use-package railscasts-theme helm-projectile))
 '(warning-suppress-types '((mule) (mule))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
