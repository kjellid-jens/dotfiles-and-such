
; - - - - - - - - - - EDITOR - - - - - - - - - - ;

; specify default window size
(add-to-list 'default-frame-alist '(width . 88)) ; character
(add-to-list 'default-frame-alist '(height . 56)) ; lines

; select theme
(load-theme 'misterioso t)

; enable line numbers
(global-linum-mode 1)

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

(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
      package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(package-initialize)

; - - - - - - - - - - EVIL MODE - - - - - - - - - - ;

; turn on evil mode
(require 'evil)
(evil-mode 1)
