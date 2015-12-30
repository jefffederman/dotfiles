(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) 

(require 'evil)
(evil-mode t)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if not.
  Return a list of installed packages or nil for every skipped package."
  (mapcar 
    (lambda (package)
      (if (package-installed-p package)
        nil
        (if (y-or-n-p (format "Package %s is missing. Install it? " package))
          (package-install package)
        package)))
  packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'evil
                          'projectile
                          'magit
                          'helm
                          'alchemist
                          'company)

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Load solarized
(add-to-list 'custom-theme-load-path' "~/.emacs.d/emacs-color-theme-solarized/")
(customize-set-variable 'frame-background-mode 'dark)
(setq solarized-broken-srgb nil)
(load-theme 'solarized t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 160 :family "Menlo"))))
)
