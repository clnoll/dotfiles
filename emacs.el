(package-initialize)
(add-to-list 'exec-path "/opt/homebrew/bin")
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

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
  (add-hook 'magit-mode-hook (lambda () (magit-delta-mode +1))))

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

(require 'server)
(unless (server-running-p) (server-start))


;; (setq mac-command-modifier 'super)
;; (setq mac-option-modifier 'meta)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(dash helm-projectile magit-delta paredit undo-tree)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
