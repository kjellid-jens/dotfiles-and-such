
; - - - - - - - - - - EDITOR - - - - - - - - - - ;

; specify default window size
(add-to-list 'default-frame-alist '(width . 88)) ; character
(add-to-list 'default-frame-alist '(height . 53)) ; lines

; select theme
(load-theme 'misterioso t)

; set load path
(add-to-list 'load-path "~/.emacs.d/lisp")

; disable splash screen and startup message
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message "")

; enable line numbers
(global-linum-mode 1)

; set tab width and set tab mode to use spaces instead of tabs
(setq-default tab-width 4 indent-tabs-mode nil)

; set indent style to bsd
(setq-default c-basic-offset 4 c-default-style "bsd")

; enable auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

; show matching character pairs
(show-paren-mode t)

; enable ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
; enables ido to work with C-x C-f
(setq ido-everywhere t)

; remember cursor position when reopening files
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

; - - - - - - - - - - KEY BINDINGS - - - - - - - - - - ;

; auto indent with enter
(define-key global-map (kbd "RET") 'newline-and-indent)


; - - - - - - - - - - OS SPECIFIC - - - - - - - - - - ;

; windows
(if (eq system-type 'windows-nt)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  )

; osx
(if (eq system-type 'darwin)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  )

; - - - - - - - - - - PACKAGES - - - - - - - - - - ;

; add package sources
(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
      package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(package-initialize)

; enable smooth scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

; automatically detects code errors
; C-c ! n/p for next/previous error, C-c ! l for list of all errors
(add-hook 'after-init-hook #'global-flycheck-mode)

; automatically determines indentation settings
(require 'dtrt-indent)
(dtrt-indent-mode 1)

; automatically closes character pairs
(require 'autopair)
(autopair-global-mode)

; faster markup creation
; activate with C-j
(require 'emmet-mode)

; - - - - - - - - - - EVIL MODE - - - - - - - - - - ;

; makes emacs behave like vim
(require 'evil)
(evil-mode 1)

; enable and set <leader>
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")

; enables vim-like tabs
; (global-evil-tabs-mode t)

; enhanced statusline
(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)

; enables quickly adding, changing, and deleting of surrounding characters
; add with S<textobject> or gS<textobject> (visual mode), and with ys<textobject> or yS<textobject> (normal mode)
; change with cs<old-textobject><new-textobject>
; delete with ds<textobject>
(require 'evil-surround)
(global-evil-surround-mode 1)

; don't skip wrapped lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

; set easymotion activator
(evilem-default-keybindings "SPC")

; esc quits
(defun minibuffer-keyboard-quit ()
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

; set C-j/C-k to scroll up/down
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                                                (interactive)
                                                (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                                                (interactive)
                                                (evil-scroll-down nil)))
