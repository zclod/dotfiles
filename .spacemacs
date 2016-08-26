;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
    ;;  ___      _______  __   __  _______  ______    _______
    ;; |   |    |   _   ||  | |  ||       ||    _ |  |       |
    ;; |   |    |  |_|  ||  |_|  ||    ___||   | ||  |  _____|
    ;; |   |    |       ||       ||   |___ |   |_||_ | |_____
    ;; |   |___ |       ||_     _||    ___||    __  ||_____  |
    ;; |       ||   _   |  |   |  |   |___ |   |  | | _____| |
    ;; |_______||__| |__|  |___|  |_______||___|  |_||_______|

     ;; IDE
     auto-completion
     syntax-checking
     git
     ;; ----------------------------------------------------------------

     ;; Languages
     emacs-lisp
     html
     python
     javascript
     haskell
     markdown
     yaml
     ;; ----------------------------------------------------------------

     ;; Misc

     ;; org-mode layer with evil bindings
     org
     ;; http requests made easy
     restclient
     ;; irc client
     erc
     ;; windows management
     eyebrowse

     ;; improve dired navigation
     (ranger :variables
             ranger-override-dired t
             ranger-cleanup-on-disable t
             )
     ;; ----------------------------------------------------------------
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; Themes
                                      solarized-theme
                                      monokai-theme
                                      ;; moe-theme
                                      ;; Misc
                                      crosshairs
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    evil-search-highlight-persist
                                    )

   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(
                         solarized-dark
                         spacemacs-dark
                         )
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Inconsolata"
                               :size 25
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))


;;  __   __  _______  _______  ______      ___   __    _  ___   _______
;; |  | |  ||       ||       ||    _ |    |   | |  |  | ||   | |       |
;; |  | |  ||  _____||    ___||   | ||    |   | |   |_| ||   | |_     _|
;; |  |_|  || |_____ |   |___ |   |_||_   |   | |       ||   |   |   |
;; |       ||_____  ||    ___||    __  |  |   | |  _    ||   |   |   |
;; |       | _____| ||   |___ |   |  | |  |   | | | |   ||   |   |   |
;; |_______||_______||_______||___|  |_|  |___| |_|  |__||___|   |___|

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; ----------------------------------------------------------------
  ;; disable auto ssh/dns config that increase startup time
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;; set vim native search to use gn modifier
  (setq evil-search-module 'evil-search)
  )

;;  __   __  _______  _______  ______      _______  _______  __    _  _______  ___   _______
;; |  | |  ||       ||       ||    _ |    |       ||       ||  |  | ||       ||   | |       |
;; |  | |  ||  _____||    ___||   | ||    |       ||   _   ||   |_| ||    ___||   | |    ___|
;; |  |_|  || |_____ |   |___ |   |_||_   |       ||  | |  ||       ||   |___ |   | |   | __
;; |       ||_____  ||    ___||    __  |  |      _||  |_|  ||  _    ||    ___||   | |   ||  |
;; |       | _____| ||   |___ |   |  | |  |     |_ |       || | |   ||   |    |   | |   |_| |
;; |_______||_______||_______||___|  |_|  |_______||_______||_|  |__||___|    |___| |_______|

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


  ;; ----------------------------------------------------------------
  ;; Override defaults
  (setq-default
   ;; follow symlink when opening a file
   vc-follow-symlinks t

   ;; indentation
   evil-shift-round nil
   )
  ;; ----------------------------------------------------------------
  ;; Keybinding
  (spacemacs/set-leader-keys "jp" 'sp-splice-sexp)

  ;; ----------------------------------------------------------------
  ;; Haskell
  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
    "mht"  'ghc-show-type)
  (add-to-list 'exec-path "~/.local/bin/")
  (add-hook 'haskell-mode-hook 'haskell-indentation-mode)
  (defun haskell-indentation-advice ()
    (when (and (< 1 (line-number-at-pos))
               (save-excursion
                 (forward-line -1)
                 (string= "" (s-trim (buffer-substring (line-beginning-position) (line-end-position))))))
      (delete-region (line-beginning-position) (point))))

  (advice-add 'haskell-indentation-newline-and-indent
              :after 'haskell-indentation-advice)
  ;; -----------------------------------------------------------------
  ;; Theming

  ;; open gui client maximized
  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  ;; Highlights
  (setq col-highlight-vline-face-flag  t
        col-highlight-face             hl-line-face)
  (crosshairs-mode)

  ;; powerline theme
  (setq powerline-default-separator 'arrow)
  (spaceline-compile)

  ;; (set-terminal-parameter nil 'background-mode 'dark)
  ;; (set-frame-parameter nil 'background-mode 'dark)
  ;; (spacemacs/load-theme 'solarized)
  ;; (spacemacs/load-theme 'solarized-dark)
  ;; -----------------------------------------------------------------
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
