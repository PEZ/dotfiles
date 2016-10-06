(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;;(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

(defun iinst (package)
  (unless (package-installed-p package)
    (package-install package)))

;;(package-list-packages)

(iinst 'paredit)
(iinst 'clojure-mode)
(iinst 'cider)
(iinst 'cider-eval-sexp-fu)
(iinst 'aggressive-indent)
(iinst 'company)
(iinst 'projectile)
(iinst 'find-file-in-project)
(iinst 'magit)
(iinst 'magit-popup)
(iinst 'yaml-mode)
(iinst 'dockerfile-mode)
(iinst 'edn)
(iinst 'clj-refactor)
(iinst 'expand-region)
;;(iinst 'cljsbuild-mode)
;;(iinst 'rainbow-delimiters)

(require 'company)
(require 'clojure-mode)
(require 'cider)
(require 'cider-eldoc)
(require 'eldoc)

(require 'expand-region)
(global-set-key (kbd "C-'") 'er/expand-region)


(global-company-mode)
(add-hook 'after-init-hook 'global-company-mode)

(setq cider-repl-wrap-history t)
(setq cider-repl-pretty-printing t)

(setq cider-repl-history-size 100000)
(setq cider-repl-history-file "~/.replhistory")

(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'clojure-repl-mode-hook #'eldoc-mode)
(add-hook 'clojure-mode-hook  #'aggressive-indent-mode)

(add-hook 'cljsbuild-mode-hook #'paredit-mode)

;;In order for Emacs to recognise .boot files as valid Clojure source code, include the following in your .init file.
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
;;To recognize script files using shebang:
(add-to-list 'magic-mode-alist '(".* boot" . clojure-mode))

;;from naked emacs blog post
(blink-cursor-mode 0)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message "linus")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(cider-stacktrace-print-length 10)
 '(cider-stacktrace-print-level 10)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "bad832ac33fcbce342b4d69431e7393701f0823a3820f6030ccc361edd2a4be4" "21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" default)))
 '(fringe-mode (quote (0)) nil (fringe))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "nil" :slant normal :weight normal :height 120 :width normal)))))


;; get rid of .somefile~ and other trash in your repo folders.

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(setq tab-width 2)

 ;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])
(put 'erase-buffer 'disabled nil)

(put 'dired-find-alternate-file 'disabled nil)

(global-set-key (kbd "C-x f") 'find-file-in-project)

(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-mode))


(defun restart-traktor ()
  (interactive)
  (cider-insert-in-repl "(traktor.user/reset)" t))

(global-set-key (kbd "C-c C-s") 'restart-traktor)

(defun browse-to-log ()
  (interactive)
  (browse-url-chromium "https://localhost:9443/d/dblog"))

(global-set-key (kbd "C-c C-d C-l") 'browse-to-log)

(defun browse-to-forslag ()
  (interactive)
  (browse-url-chromium "https://localhost:9443/sv/lana/min-ansokan/forslag"))

(global-set-key (kbd "C-c C-d C-f") 'browse-to-forslag)

(defun run-all-tests ()
  (interactive)
  (cider-insert-in-repl "(clojure.test/run-all-tests #\"traktor.*|youple.*\")" t))

(global-set-key (kbd "C-c C-d ,") 'run-all-tests)

(push "~/.emacs.d/lisp" load-path)

(require 'find-file-in-project)
(require 's)

;; No need to be stingy
(setq ffip-limit 4096)

;; Use full project path for ffip

(defun ffip-project-files ()
  "Return an alist of all filenames in the project and their path."
  (let ((file-alist nil))
    (mapcar (lambda (file)
              (let ((file-cons (cons (s-chop-prefix (file-truename (ffip-project-root)) (expand-file-name file))
                                     (expand-file-name file))))
                (add-to-list 'file-alist file-cons)
                file-cons))
            (split-string (shell-command-to-string
                           (format "find %s -type f \\( %s \\) %s | head -n %s"
                                   (or ffip-project-root
                                       (ffip-project-root)
                                       (error "No project root found"))
                                   (ffip-join-patterns)
                                   ffip-find-options
                                   ffip-limit))))))

;; Helper methods to create local settings

(defun ffip--create-exclude-find-options (names)
  (mapconcat (lambda (name)
               (concat "-not -regex \".*" name ".*\"")) names " "))


(defun ffip-local-excludes (&rest names)
  "Given a set of names, will exclude results with those names in the path."
  (set (make-local-variable 'ffip-find-options)
       (ffip--create-exclude-find-options names)))

(defun ffip-local-patterns (&rest patterns)
  "An exhaustive list of file name patterns to look for."
  (set (make-local-variable 'ffip-patterns) patterns))

;; Function to create new functions that look for a specific pattern
(defun ffip-create-pattern-file-finder (&rest patterns)
  (lexical-let ((patterns patterns))
    (lambda ()
      (interactive)
      (let ((ffip-patterns patterns))
        (find-file-in-project)))))

;; Default excludes - override with ffip-local-excludes

(setq-default ffip-find-options
              (ffip--create-exclude-find-options
               '("/target"
                 "/out"
                 "/overlays"
                 "/build"
                 "/dist"
                 "/resources/public/js/compiled"
		 "/resources/public/js/modules"
		 "/frontlyft/js/compiled/"
                 "/.repl"
                 "/.tmp")))

(provide 'setup-ffip)
