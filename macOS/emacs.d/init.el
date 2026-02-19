;; init.el — minimal, modern-ish Emacs config (dark theme)

;; ----------------------------
;; Basic UI / behavior
;; ----------------------------
(setq inhibit-startup-message t
      ring-bell-function 'ignore
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      sentence-end-double-space nil
      indent-tabs-mode nil
      tab-width 2)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(save-place-mode 1)
(recentf-mode 1)

;; Make scrolling less jumpy
(setq scroll-conservatively 101
      scroll-margin 2)

;; Better yes/no prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; ----------------------------
;; Package setup
;; ----------------------------
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun ensure-package (pkg)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; ----------------------------
;; Dark theme (choose one)
;; ----------------------------
;; Option A: built-in theme (no downloads)
(load-theme 'wombat t)

;; Option B: a popular dark theme (uncomment to use)
;; (ensure-package 'modus-themes)
;; (load-theme 'modus-vivendi t)

;; Option C: another popular dark theme (uncomment to use)
;; (ensure-package 'doom-themes)
;; (load-theme 'doom-one t)

;; ----------------------------
;; Editing ergonomics
;; ----------------------------
(ensure-package 'which-key)
(which-key-mode 1)

(ensure-package 'company)
(global-company-mode 1)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 1)

(ensure-package 'magit)

;; Better minibuffer completion
(ensure-package 'vertico)
(vertico-mode 1)

(ensure-package 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides '((file (styles basic partial-completion))))

(ensure-package 'marginalia)
(marginalia-mode 1)

;; Helpful for discovering commands (optional)
(ensure-package 'consult)

;; ----------------------------
;; Convenience keybinds
;; ----------------------------
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-/")   'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
