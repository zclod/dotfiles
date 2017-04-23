;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
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
     ;; ----------------------------------------------------------------
     ;; IDE

     helm
     (gtags :variables gtags-enable-by-default t) ;;funziona solo con helm

     auto-completion
     git
     syntax-checking
     ;; ----------------------------------------------------------------
     ;; Languages
     emacs-lisp
     html
     python
     javascript
     haskell
     markdown
     yaml
     latex
     ;; ----------------------------------------------------------------
     ;; Misc

     ;; org-mode layer with evil bindings
     org
     ;; http requests made easy
     restclient
     ;; irc client
     erc
     ;; nix integration
     nixos

     ;; improve dired navigation
     (ranger :variables
             ranger-override-dired t
             ranger-cleanup-on-disable t
             )
     ;; ----------------------------------------------------------------
     )

   dotspacemacs-additional-packages '(
                                      ;; Themes
                                      solarized-theme
                                      ;; Misc
                                      crosshairs
                                      )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(
                         solarized-dark
                         spacemacs-dark
                         )
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Inconsolata"
                               :size 25
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()

  ;;  __   __  _______  _______  ______      ___   __    _  ___   _______
  ;; |  | |  ||       ||       ||    _ |    |   | |  |  | ||   | |       |
  ;; |  | |  ||  _____||    ___||   | ||    |   | |   |_| ||   | |_     _|
  ;; |  |_|  || |_____ |   |___ |   |_||_   |   | |       ||   |   |   |
  ;; |       ||_____  ||    ___||    __  |  |   | |  _    ||   |   |   |
  ;; |       | _____| ||   |___ |   |  | |  |   | | | |   ||   |   |   |
  ;; |_______||_______||_______||___|  |_|  |___| |_|  |__||___|   |___|

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
  ;; ----------------------------------------------------------------
  )

(defun dotspacemacs/user-config ()
  ;;  __   __  _______  _______  ______      _______  _______  __    _  _______  ___   _______
  ;; |  | |  ||       ||       ||    _ |    |       ||       ||  |  | ||       ||   | |       |
  ;; |  | |  ||  _____||    ___||   | ||    |       ||   _   ||   |_| ||    ___||   | |    ___|
  ;; |  |_|  || |_____ |   |___ |   |_||_   |       ||  | |  ||       ||   |___ |   | |   | __
  ;; |       ||_____  ||    ___||    __  |  |      _||  |_|  ||  _    ||    ___||   | |   ||  |
  ;; |       | _____| ||   |___ |   |  | |  |     |_ |       || | |   ||   |    |   | |   |_| |
  ;; |_______||_______||_______||___|  |_|  |_______||_______||_|  |__||___|    |___| |_______|

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
   ;; unordered escape sequence
   evil-escape-key-sequence "jk"
   evil-escape-unordered-key-sequence t
   )
  ;; ----------------------------------------------------------------
  ;; Keybinding
  ;; remove pair of parents
  (spacemacs/set-leader-keys "jp" 'sp-splice-sexp)
  ;; toggle vertical highlight
  (spacemacs/set-leader-keys "thv" 'column-highlight-mode)
  ;; ----------------------------------------------------------------
  ;; emmet-mode
  ;; tab to expand snippet in normal mode
  (evil-define-key 'normal emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
  (evil-define-key 'normal emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)
  ;; ----------------------------------------------------------------
  ;; Haskell
  (add-to-list 'exec-path "~/.local/bin/")
  (add-hook 'haskell-mode-hook (lambda() (flycheck-select-checker 'haskell-hlint)))
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
