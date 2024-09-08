;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     emacs-lisp
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t)
     git
     helm
     multiple-cursors
     (org :variables
          ;; See https://github.com/Somelauw/evil-org-mode/blob/master/doc/keythemes.org
          ;; This will add todo keybindings, so I can use t on a TODO heading
          org-want-todo-bindings t
          ;; spacemacs requires this to load the org-roam layer so use-package
          ;; org-roam below works
          org-enable-roam-support t
          org-enable-transclusion-support t
          )
     spell-checking
     version-control
     pdf
     python
     ;; in ~/.emacs.d/private
     table-manipulation
     ;; bookmarks
     bm
     ;; SLY is Common Lisp IDE, this is a spacemacs layer for it
     ;; See https://github.com/programingship/common-lisp-sly
     ;; I cloned that git repo into ~/.emacs.d/private
     common-lisp-sly
     )

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      helm-org-rifle
                                      helm-org
                                      helm-rg
                                      org-super-agenda
                                      rainbow-mode
                                      wgrep-helm
                                      org-roam
                                      org-noter
                                      math-preview
                                      org-ql
                                      org-transclusion
                                      vulpea
                                      org-modern
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         spacemacs-dark
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Hack"
                               :size 10.0
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; Bug in latest version of f and emacs29: this is required to avoid an error about undefined define-short-documentation-group
  (require 'shortdoc)
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)

;; Wrap all my org config into one function
;;
;; I pasted in the elements to custom-set-variables from my previous .spacemacs
;; but they would disappear after I reloaded it. So I've put it here.
(defun dgraham/org-config ()
  ;; Org mode org files to scan
  ;;; This isn't recursive, but any more org files added to these
  ;;; directories will automatically be included in the agenda
  ;;; If you want both then do this:
  ;;;   (load-library "find-lisp")
  ;;;
  ;;;   (add-hook 'org-agenda-mode-hook (lambda ()
  ;;;   (setq org-agenda-files
  ;;;         (find-lisp-find-files "~/Dropbox/GTD/ActiveProjects" "\.org$"))
  ;;;   ))
  (setq org-directory (expand-file-name "~/owncloud/org"))
  ;; used before use-package's custom property
  (setq org-roam-directory (f-join org-directory "roam"))
  ;; put here because dgraham/org-roam-is-daily uses it and causes an error when
  ;; finding a node before loading org-roam-dailies
  (setq org-roam-dailies-directory (f-join org-roam-directory "journal"))
  ;; Put here to avoid org-roam from picking up template files as they have ID properties
  (setq dgraham/org-template-directory (f-join org-directory "templates"))
  (setq org-default-notes-file (f-join org-directory "inbox.org"))

  ;; I use a hook to add files here that contain TODOs
  (setq org-agenda-files (list (f-join org-directory "ast")))

  ;; Define this here for consistency across files
  (setq org-todo-keywords
        '(
          ;; TODO Workflow
          (sequence
           ;; Open states
           ;; The first letter in brackets is the shortcut when changing state
           ;; ! means add a timestamp, but no note
           ;; @ mean add a note with timestamp
           "TODO(t!)"
           "NEXT(n!)"
           "STARTED(s!)"
           ;; Here the @ means a timestamped note on entry to the state, while
           ;; on exit from the state as given by /, just add a timestamp, no
           ;; note
           "WAITING(w@/!)"
           "|"
           ;; Done states
           "DONE(d!)"
           "CANCELLED(c@)"
           "DEFERRED(f@)"
           )
          ;; Question workflow
          (sequence "OPEN(!)" "|" "ANSWERED(!)")
          )
        ) 

  (setq org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t)

  ;; TODO Priorities are A, B, C, and D, with A highest
  (setq org-priority-highest ?A
        org-priority-default ?B
        org-priority-lowest  ?D)

  ;; Enable org-indent-mode by default, which indents text according to level
  ;; and hides stars
  ;; On a per-file basis this can be turned off with
  ;; #+STARTUP: noindent
  (setq org-startup-indented t)

  ;; By default, org-refile will only consider top-level targets, change
  ;; this to consider up to 5 levels down. Helm will display this as a
  ;; long list
  (setq org-refile-targets '((org-agenda-files :maxlevel . 5)))

  ;; This must be off to allow helm create its list correctly
  (setq org-outline-path-complete-in-steps nil)

  ;; Create new parents
  (setq org-refile-allow-creating-parent-nodes 'confirm)

  ;; Put file name first, which also allows you to refile to a top-level
  ;; heading
  (setq org-refile-use-outline-path 'file)

  ;; This is needed to stop occurrences of underscore being interpreted
  ;; as subscripts (same for ^ as super-script)
  (setq org-use-sub-superscripts '{})
  (setq org-export-with-sub-superscripts '{})

  (setq org-capture-templates
        ;; Note the backtick so I cat use functions in constructing the list
        `(
          ("t" "Todo [inbox]" entry
           ;; inbox gets used as a bucket so don't put it under Tasks like work.org
           (file ,(concat org-directory "/inbox.org"))
           "* TODO %?\n:LOGBOOK:\n- State \"TODO\"       from            %U\n:END:\nCreated from %a.")
          ("w" "Todo [work]" entry
           (file+headline ,(concat org-directory "/ast/work.org") "One-Off Tasks")
           "* TODO %?\n:LOGBOOK:\n- State \"TODO\"       from            %U\n:END:\nCreated from %a.")
          ("a" "Acronym" entry
           (file+headline ,(concat org-roam-directory "/ast/20220317161021-glossary.org") "Acronyms")
           "* %^{Acronym}\n:PROPERTIES:\n:ID: %(org-id-new)\n:DESCRIPTION: %^{Description}\n:END:\n%?")
          ;; Reviews are here, not in org-roam capture
          ;; templates because I can't get :time-prompt to
          ;; work

          ;; Reviews are under a different category for two reasons:
          ;;   1. Although they are work based now, they should be for everything
          ;;   2. Leads to a nicer grouping of weekly, monthly, and yearly
          ("r" "Reviews")
          ("rw" "Weekly review" plain
           ; target
           ;; Make sure you manually create the folder with the year
           (file dgraham/org-capture-target-for-weekly-review)

           ; template
           (file ,(concat dgraham/org-template-directory "/reviews/weekly_review.org"))
          )
          ;;("rm" "Monthly review" plain
           ;; target
           ;; template
           ;;(file ,(concat dgraham/org-template-directory "/reviews/monthly_review.org"))
                                        ; )
          ;;("ry" "Yearly review" plain
          ;;(file ,(concat dgraham/org-template-directory "/reviews/yearly_review.org"))
          ;; )
          )
        )

  ;; When I add a TODO I want this recorded with a time stamp as then I know
  ;; when I created it
  (setq org-treat-insert-todo-heading-as-state-change t)

  ;; I have an org agenda layout with the TODOs as one buffer and the week
  ;; agenda as another, so I need to make them sticky to have both at once. I
  ;; have to refresh manually though
  ;;(customize-set-variable org-agenda-sticky t)

  ;; Put info on state changes of TODO keyword and CLOCK entries into the
  ;; LOGBOOK drawer.
  ;; No need to set org-clock-into-drawer as this sets it
  (setq org-log-into-drawer t)

  ;; Add notes when clocking out
  (setq org-log-note-clock-out t)

  ;; Before an image, add:
  ;; #+ATTR_ORG: :width 300px
  ;; or
  ;; #+ATTR_ORG: :width 50%
  ;;
  ;; To change the width of the image. If that property isn't given it will
  ;; display the image in it's original size
  (setq org-image-actual-width nil)

  ;;; From https://out-of-cheese-error.netlify.app/spacemacs-config
  ;;;
  ;;; Run command describe-char on the character to reveal the name, hex code
  ;;; and font used to render (Hack doesn't render these symbols and used Deja Vu
  ;;; Mono which looks horrible, so I installed Symbola).
  ;;;
  ;;; Use command insert-char then type the following names
  ;;; ballot box (#x2610)= ☐
  ;;; ballot box with check (#x2611) = ☑
  ;;; shadowed white circle (#x274d) = ❍
  ;;; #x means the number is in hex
  ;;; the two numbers below are a range, see
  ;;; http://www.fileformat.info/info/unicode/block/index.htm for ranges, this covers "Miscellaneous Symbols" and "Dingbats"
  (set-fontset-font t '(#x2600 . #x27bf) "Symbola")

  (add-hook 'org-mode-hook (lambda ()
			   "Beautify Org Checkbox Symbol"
			   (push '("[ ]" . "☐") prettify-symbols-alist)
			   (push '("[X]" . "☑" ) prettify-symbols-alist)
			   (push '("[-]" . "❍" ) prettify-symbols-alist)
			   (prettify-symbols-mode)))

  (add-hook 'org-mode-hook 'turn-on-auto-fill)

  ;; Make sure the checkbox blends in and doesn't have a weird box around it.
  ;; This assumes the zenburn theme.
  ;; org-checkbox face not loaded until org-faces is loaded
  (with-eval-after-load 'org-faces
      (set-face-attribute 'org-checkbox
                      nil
                      :background "#3F3F3F"
                      :foreground "#CC9393"
                      :box nil
                      )
      )

  ;; This requires the regex below to match the text to apply this face to
  (defface org-checkbox-done-text
    '((t (:foreground "#71696A")))
    "Face for the text part of a checked org-mode checkbox.")

  ;; From
  ;; https://jft.home.blog/2019/07/17/use-unicode-symbol-to-display-org-mode-checkboxes/
  ;; this is needed for the above face to work
  (font-lock-add-keywords
   'org-mode
   `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
      1 'org-checkbox-done-text prepend))
   'append)

  ;; Makes some things look nicer
  (setq org-pretty-entities t
        ;; show actually italicized text instead of /italicized text/
        org-hide-emphasis-markers t
        org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        )

  ;; Don't use bigger fonts for the headlines
  (setq zenburn-scale-org-headlines nil)

  (setq org-todo-keyword-faces
      '(
        ;; zenburn-red+2
       ("STARTED" . (:foreground "#ECB3B3" :weight bold)) 
       ;; zenburn-yellow
       ("WAITING" . (:foreground "#F0DFAF" :weight bold)) 
       ))

  ;; By default, org-store-link is SPC a o l and org-insert-link is , i l. Make
  ;; these both available under the major mode leader key (,)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "<" 'org-store-link)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode ">" 'org-insert-link)

  ;; Put helm-org-refile commands under , l (org-roam uses r)
  ;;
  ;; The m seems to be needed for the word rifle to be used as the name of the
  ;; key prefix, otherwise it just says prefix. See ~/.emacs.d/layers/+emacs/org/packages.el
  (spacemacs/declare-prefix-for-mode 'org-mode "ml" "rifle")
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "ll" 'helm-org-rifle)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "lk" 'helm-org-rifle-current-buffer)

  ;; helm-org integration
  ;; org-set-tags changed to org-set-tags-command, see https://github.com/emacs-helm/helm-org/issues/3
  (with-eval-after-load 'helm
    (add-to-list 'helm-completing-read-handlers-alist '(org-capture . helm-org-completing-read-tags))
    (add-to-list 'helm-completing-read-handlers-alist '(org-set-tags-command . helm-org-completing-read-tags))
    )

  ;; org-super-agenda layout - we need to set a custom agenda command because
  ;; org-super-agenda takes the items given to it by org-agenda-list or
  ;; org-todo-list etc. So to have both a week view with scheduled/deadline
  ;; tasks and then other todo items categorised, we need to run multiple agenda
  ;; commands
  (org-super-agenda-mode t)
  (setq org-agenda-custom-commands
        '(("u" "Super view"
           (
            (agenda "" (;; The default is week, but that has the problem that
                        ;; the same items appear in multiple days
                        (org-agenda-span 'day)
                        (org-super-agenda-groups
                         '(
                           (:discard
                            ;; Can't use variables or functions without some
                            ;; sort of escaping of data, which I don't know how
                            ;; to do
                            (:file-path "/home/dgraham/owncloud/org/[^/]*\.org$")
                            )
                           (:name "Today"
                                  :time-grid t
                                  :scheduled today
                                  :deadline today
                                  )
                           (:name "Overdue"
                                  :time-grid t
                                  :deadline past)
                           (:name "Re-schedule"
                                  :time-grid t
                                  :scheduled past)
                           (:name "Due Soon"
                                  :time-grid t
                                  :deadline future)
                           )))
                    ) ;; agenda
            (alltodo "" (
                         ;; Get rid of the default header "Global list of ..."
                         (org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          '(
                            (:discard
                             ;; Can't use variables or functions without some
                             ;; sort of escaping of data, which I don't know how
                             ;; to do
                             (:file-path "/home/dgraham/owncloud/org/[^/]*\.org$")
                             )
                            (:name " Next "
                                   :and ( 
                                         :todo "NEXT"
                                         :not (:tag "someday")
                                         )
                                   )
                            (:name " Started "
                                   :and ( 
                                         :todo "STARTED"
                                         :not (:tag "someday")
                                         )
                                   )
                            (:name " Waiting "
                                   :and (
                                         :todo "WAITING"
                                         :not (:tag "someday")
                                         )
                                   )
                            (:name " Waiting (Someday)"
                                   :and (
                                         :todo "WAITING"
                                         :tag "someday"
                                         )
                                   )
                            ;; If you don't have this all other items will be
                            ;; put into a separate category
                            (:discard (:anything t))
                            )))
                    ) ;; alltodo 
           ))) ;; org-agenda-custom-commands value
        )  ;; setq

  ;; Hide tags from the agenda view that match these tags
  ;; If you want to OR strings instead of \\| you can use:
  ;;  (regexp-opt '("tag1" "tag2" "tag3"))
  ;;(setq org-agenda-hide-tags-regexp (regexp-opt '("project" "question" "has_todo")))
  ;; Or just remove them all
  (setq org-agenda-remove-tags t)

  ;; Widen the category in the agenda views
  (setq org-agenda-prefix-format
        '((agenda . " %i %-20:c%?-12t% s")
          (todo . " %i %-20:c")
          (tags . " %i %-20:c")
          (search . " %i %-20:c")))


  ;; When storing and inserting links, use the existing ID (set by
  ;; org-id-get-create) as the link instead of the text of the headline
  (setq org-id-link-to-org-use-id 'use-existing)

  ;; Add an ID to every TODO, I don't exclude it from org-roam because I want
  ;; the two-way linking
  (advice-add 'org-insert-todo-heading :after #'org-id-get-create)

  ;;TODO: Add a hook or advice to add a CREATED property on the capture of a org-roam file

  ;; In combination with org-id-complete-link defined later, this allows
  ;; completion of headings with IDs when inserting a link
  (org-link-set-parameters "id"
                           :complete 'org-id-complete-link)

  ;; Define a new super group category for org-super-agenda and org-ql
  (org-super-agenda--def-auto-group project "their project name"
    :key-form (org-super-agenda--when-with-marker-buffer (org-super-agenda--get-marker item)
                (if (string= (buffer-name) "work.org")
                    ;; old project or one-off tasks or someday in work.org
                    (when (org-up-heading-safe) (org-get-heading 'notags 'notodo))
                  ;; new project in an org-roam node
                  (car (cdr (car (org-collect-keywords '("TITLE")))))
                ))) 
  ;; org-roam setup
  ;; I've done it using use-package because calling org-roam-db-autosync-mode
  ;; needs org-roam loaded first
  (use-package org-roam
    :ensure t
    :init 
    ;; In init, setq is needed
    (setq org-roam-v2-ack t)
    :bind
    (
     ("<f5>" . org-roam-dailies-goto-previous-note)
     ("<f6>" . org-roam-dailies-goto-next-note)
     )
    :custom
    ;; setq shouldn't be use as some of these variables might have custom setter
    (org-roam-completion-everywhere t)
    (org-roam-node-display-template 
     (concat "${title:*} ${description:*}"
             (propertize "${tags:10}" 'face 'org-tag)))
    (org-roam-capture-templates
     ;; Note this uses backtick instead of apostrophe because the file argument
     ;; used for org templates takes a string and I want to call the function
     ;; concat
     `(
       ;; All the following nodes will go in the ast directory, relative to org-roam-directory
       ("w" "Work")
       ;; Copied from the default value, added category to make it look nicer in
       ;; the agenda view
       ("wn" "Work note" plain
        ;; When the file name is not absolute, Org assumes it is relative to org-directory
        (file ,(concat dgraham/org-template-directory "/ast/note.org"))
        :if-new (file "ast/%<%Y%m%d%H%M%S>-${slug}.org")
        )
       ;;TODO: This adds an extra property drawer with ID so requires manual edit
       ("wi" "Work interview" plain
        ;; When the file name is not absolute, Org assumes it is relative to org-directory
        (file ,(concat dgraham/org-template-directory "/ast/interview.org"))
        ;; Just type the person's name and "Interview of" will be added in the right place
        :if-new (file "ast/%<%Y%m%d%H%M%S>-interview_of_${slug}.org")
        )
       ;; TODO: Add prompt for company and person, then compute ROAM_ALIASES as first name and first letter of last name
       ("wp" "Work person" plain
        "%?"
        :target (file+head "ast/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: person\n#+FILETAGS: person\n\n* Questions\n")
        :unnarrowed t
        )
       ("wm" "Work meeting" plain
        "%?"
        :target (file+head "ast/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: meeting\n#+FILETAGS: meeting\nA place to easily see all occurrences of this meeting as backlinks in the org roam buffer.") 
        :unnarrowed t
        )
       ("wj" "Work project" plain
        ;; When the file name is not absolute, Org assumes it is relative to org-directory
        (file ,(concat dgraham/org-template-directory "/ast/project.org"))
        ;; The title will have Project added to the end so don't type it
        :if-new (file "ast/%<%Y%m%d%H%M%S>-${slug}_project.org")
        )
       ("wa" "Work Area of Responsibility" plain
        ;; When the file name is not absolute, Org assumes it is relative to org-directory
        (file ,(concat dgraham/org-template-directory "/ast/aor.org"))
        ;; The title will have AoR added to the end so don't type it
        :if-new (file "ast/%<%Y%m%d%H%M%S>-${slug}_aor.org")
        )
       ;; All the following nodes will go in the personal directory, relative to org-roam-directory 
       ("p" "Personal")
       ("pn" "Personal note" plain
        "%?"
        :target (file+head "personal/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: personal\n")
        :unnarrowed t
        )
       ("pj" "Personal project" plain
        ;; When the file name is not absolute, Org assumes it is relative to org-directory
        (file ,(concat dgraham/org-template-directory "/personal/project.org"))
        ;; The title will have Project added to the end so don't type it
        :if-new (file "personal/%<%Y%m%d%H%M%S>-${slug}_project.org")
        )
       ;; Reviews are not here because this roam template variable doesn't
       ;; support using a function to defined the name of the node, which is
       ;; needed to set the date at which the review is for as that might not be
       ;; the current date
       )
     )
    (org-roam-dailies-capture-templates
     '(
       ("d" "default" entry
        "* %<%H:%M> - %?"
        :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n#+category: journal\n"))
       )
     )
    ;; org-roam-protocol uses this variable for templates not the normal one above
    (org-roam-capture-ref-templates
     '(
       ;; Using templates doesn't work properly, I get duplicate properties
       ("b" "Bookmark" plain
        "%?"
        :target (file+head "bookmarks/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: bookmark\n#+FILETAGS: bookmark\n\n#+BEGIN_QUOTE\n${body}\n#+END_QUOTE\n\n")
        :unnarrowed t
        )
       )
     )
    ;; :config keyword can be use to execute code after a package is loaded
    :config
    (org-roam-db-autosync-mode)
    ;; This needs to go into the config section because the ARGLIST uses a
    ;; default value of org-roam-node, which is only available after org-roam is
    ;; setup
    (cl-defmethod org-roam-node-description ((node org-roam-node))
      "Return the DESCRIPTION property for a node if it exists,
   otherwise nil"
      (cdr (assoc "DESCRIPTION" (org-roam-node-properties node)))
      )

    ;;TODO: I need to use the org-roam daily functionality before org-roam-dailies-directory is defined
    (cl-defmethod dgraham/org-roam-is-daily (node)
      "Return t if the node is a daily node, nil otherwise"
      (let* (
             (file-path (org-roam-node-file node))
             (full-dirname (f-full (f-dirname file-path)))
             (daily-dirname (f-full (f-join org-roam-directory org-roam-dailies-directory)))
             )
        (string= full-dirname daily-dirname)
        )
      )

    (cl-defmethod dgraham/org-roam-is-bookmark (node)
      "Return t if the node is a bookmark node, nil otherwise"
      (let* (
             (file-path (org-roam-node-file node))
             (full-dirname (f-full (f-dirname file-path)))
             (bookmark-dirname (f-full (f-join org-roam-directory "bookmarks")))
             )
        (string= full-dirname bookmark-dirname)
        )
      )

    (cl-defmethod dgraham/org-roam-node-is-visible (node)
      "Return t if the node is of a type that I want to find or insert, nil otherwise"
      (and (not (dgraham/org-roam-is-daily node))
           (not (dgraham/org-roam-is-bookmark node))
           (not (org-roam-node-todo node))
           )
      )

    (defun dgraham/org-roam-node-find ()
      "Find a org-roam node, but exclude dailies as you can do that
from org-roam-dailies-goto-date and exclude TODO nodes"
      (interactive)
      (org-roam-node-find nil nil
                          (lambda (node) (dgraham/org-roam-node-is-visible node))
                          )
      )

    (defun dgraham/org-roam-node-insert ()
      "Insert a org-roam node, but exclude dailies as that is not a
common thing to insert and exclude TODOs."
      (interactive)
      (org-roam-node-insert
       (lambda (node) (dgraham/org-roam-node-is-visible node))
       )
      )

    ;; Insert a link to a new node without opening it
    ;; Modified from https://systemcrafters.net/build-a-second-brain-in-emacs/5-org-roam-hacks/
    ;; Didn't need the ability to forward args on
    (defun dgraham/org-roam-node-insert-immediate ()
      (interactive)
      (let (
            (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                      '(:immediate-finish t))))
            )
        (dgraham/org-roam-node-insert)
        )
      )
    )  ;; use-package org-roam

  (use-package vulpea
    :ensure t
    ;; hook into org-roam-db-autosync-mode you wish to enable
    ;; persistence of meta values (see respective section in README to
    ;; find out what meta means)
    :hook (
           (org-roam-db-autosync-mode . vulpea-db-autosync-enable)
           ;; Add a special tag to a org-roam node if it contains a TODO so that
           ;; it the TODO is visible in org-agenda
           (find-file                 . vulpea-project-update-tag)
           (before-save               . vulpea-project-update-tag)
           )

    :config
    ;; From https://d12frosted.io/posts/2021-01-16-task-management-with-roam-vol5.html
    ;; As it's not in the vulpea package
    (defun vulpea-project-p ()
      "Return non-nil if current buffer has any todo entry.

TODO entries marked as done are ignored, meaning the this
function returns nil if current buffer contains only completed
tasks."
      (org-element-map
          (org-element-parse-buffer 'headline)
          'headline
        (lambda (h)
          (eq (org-element-property :todo-type h)
              'todo))
        nil 'first-match))                     

    (defun vulpea-project-update-tag ()
      "Update tag in the current buffer."
      (when (and (not (active-minibuffer-window))
                 (vulpea-buffer-p))
        (save-excursion
          (goto-char (point-min))
          (let* ((tags (vulpea-buffer-tags-get))
                 (original-tags tags))
            (if (vulpea-project-p)
                (setq tags (cons "has_todo" tags))
              (setq tags (remove "has_todo" tags)))

            ;; cleanup duplicates
            (setq tags (seq-uniq tags))

            ;; update tags if changed
            (when (or (seq-difference tags original-tags)
                      (seq-difference original-tags tags))
              (apply #'vulpea-buffer-tags-set tags))))))

    (defun vulpea-buffer-p ()
      "Return non-nil if the currently visited buffer is a note."
      (and buffer-file-name
           (string-prefix-p
            (expand-file-name (file-name-as-directory org-roam-directory))
            (file-name-directory buffer-file-name))))

    (defun vulpea-project-files ()
      "Return a list of note files containing 'has_todo' tag." ;
      (seq-uniq
       (seq-map
        #'car
        (org-roam-db-query
         [:select [nodes:file]
                  :from tags
                  :left-join nodes
                  :on (= tags:node-id nodes:id)
                  :where (like tag (quote "%\"has_todo\"%"))]))))

    ;; From a comment in the page above. Used to append rather than overwrite the
    ;; org-agenda-files variable
    (defun inject-vulpea-project-files (org-agenda-files--output)
      (append org-agenda-files--output (vulpea-project-files)))

    (advice-add 'org-agenda-files :filter-return #'inject-vulpea-project-files)
    ) ;; use-package vulpea

  (org-add-link-type "outlook" 'org-outlook-open)

  ;; Change and add missing dailies shortcuts
  (spacemacs/declare-prefix-for-mode 'org-mode "mrdc" "capture")
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rdcy" 'org-roam-dailies-capture-yesterday)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rdcc" 'org-roam-dailies-capture-today) ;; same key as header
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rdct" 'org-roam-dailies-capture-tomorrow)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rdcd" 'org-roam-dailies-capture-date)

  (spacemacs/declare-prefix-for-mode 'org-mode "mrdg" "goto")
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rdgy" 'org-roam-dailies-goto-yesterday)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rdgg" 'org-roam-dailies-goto-today) ;; same key as header
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rdgt" 'org-roam-dailies-goto-tomorrow)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rdgd" 'org-roam-dailies-goto-date)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rdgb" 'org-roam-dailies-goto-previous-note)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rdgf" 'org-roam-dailies-goto-next-note)

  ;; Use my own find node function that filters out dailies
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rf" 'dgraham/org-roam-node-find)

  ;; Swap insert bindings as most of the time I won't want to go to a new node
  ;; when inserting a link
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "ri" 'dgraham/org-roam-node-insert-immediate)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "rI" 'dgraham/org-roam-node-insert)

  ;; org-roam-dailies-goto-previous-note
  ;; org-roam-dailies-goto-next-note
  (spacemacs|define-transient-state org-roam-dailies
    :title "Org-roam Dailes transient state"
    :doc
    "
[_p_] previous note  [_n_] next note
"
    :bindings
    ("p" org-roam-dailies-goto-previous-note)
    ("n" org-roam-dailies-goto-next-note)
    )
  
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "r." 'spacemacs/org-roam-dailies-transient-state/body)

  (spacemacs/set-leader-keys-for-major-mode 'org-mode "/" 'dgraham/yank-link)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "@" 'dgraham/yank-link-href) 

  ;;TODO:Change this to be a layer after I move to dofiles repo
  ;;(load "~/.emacs.d/private/local/my-org-writing-mode/my-org-writing-mode.el")
  ) ;; dgraham/org-config

;; (defun dgraham/org-ql-views ()
;;   (let* (
;;          ;; Start date is today if today is Monday or the previous Monday
;;          (start-date (if (= 1 (nth 6 (decode-time))) (current-time) (org-read-date nil 'totime "-Mon")))
;;          (all-dates )
;;          (this-week-file-names )
;;          (files (->> (f--files 'org-roam-dailies-directory (equal (f-ext it) "org"))))
;;          )
;;     (org-ql-search files
;;       '(and (todo)
;;             (tags "PROJECT"))
;;       :super-groups '((:auto-category t)))
;;     )
;;   )

(defun dgraham/load-pss-mode ()
 "Defines my own mode for the Portable Test and Stimulus
Standard (PSS) DSL."
 (require 'generic-x)
 ;;(require 'regexp-opt)

 (define-generic-mode 'pss-mode
   ;; comments start with // TODO: How to do multi-line comments?
   '("//")
   ;; keywords - this is a simple way to associate these strings with the
   ;; font-lock-keyword-face
   '("package" "import" "export" "component" "action" "activity" "extend"
     "static" "const" "abstract"
     "struct" "typeof"
     "constraint" "rand" "with"
     "parallel" "sequence" "schedule"
     "lock" "share" "buffer" "stream" "state" "resource"
     "bind" "pool"
     "super" "exec" "pure" "function" "void" "type"
     "do" "if" "else" "foreach" "while"
     )
   ;; Here's how you can associate other faces
   ;; NOTE: We use the backtick to make sure that the result of regexp-opt is used i.e. a string
   `(
     (,(regexp-opt '("bit" "int" "bool" "enum" "string" "chandle") 'words) . 'font-lock-type-face)
     (,(regexp-opt '("input" "output" "inout" "ref") 'words) . 'font-lock-type-face)
     ("\<pss_top\>" . 'font-lock-builtin-face)
     )
   ;; Which file extensions to autoload this mode on
   '(".pss\\'")
   ;; FUNCTION-LIST
   nil
   "Major mode for the Portable Test and Stimulus Standard (PSS) DSL"
   )
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; Disassociate .f files with Fortran mode
  ;; Could do this instead:
  ;;
  ;;   (setq auto-mode-alist (remove (rassoc 'fortran-mode auto-mode-alist) auto-mode-alist))
  ;;
  ;; But this relies on .f pattern being first as rassoc will return the
  ;; first match, while there is another match between .for files and
  ;; Fortran mode, so this is more specific
  (setq auto-mode-alist (remove '("\\.[fF]\\'" . fortran-mode) auto-mode-alist))
  (setq auto-mode-alist (append '(("\\.tt$" . tt-mode)) auto-mode-alist))
  (setq auto-mode-alist (append '(("\\.tt2$" . tt-mode)) auto-mode-alist))
  (setq auto-mode-alist (append '(("\\.t$" . perl-mode)) auto-mode-alist))

  ;; All my org config in one function
  (dgraham/org-config)

  ;; Avoid emacs prompting every time you visit a file where there is a
  ;; .dir-locals.el in the directory hierarchy
  (put 'projectile-tags-command 'safe-local-variable (lambda (xx) t))

  ;; my-irun-log-hook defined below
  ;;TODO: This slows down opening a file horribly
  ;;(add-hook 'find-file-hook 'my-irun-log-hook)

  ;; Turn on colouring of parentheses and other brackets just for programming modes
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

  ;; Don't need to add tools from Homebrew onto exec-path or $PATH as it was
  ;; already on the $PATH when emacs was run

  ;; Get rid of "stty: standard input: Inappropriate ioctl for device"
  ;; errors when running shell-commnd by turning off reading ~/.mycshrc
  (setq shell-command-switch "-cf")

  (setq term-buffer-maximum-size 10000)

  (global-set-key (kbd "C-c e") 'eval-and-replace)

  ;; For the cases where subword-mode isn't enabled or like in verilog-mode
  ;; underscore has been made a word char, allow jumping to a subword
  (spacemacs/set-leader-keys "jW" 'evil-avy-goto-subword-1)

  ;; I use rg instead of ag now, but I don't think this is required as it's for
  ;; the helm-ag package
  (setq helm-ag-base-command "rg --line-number --no-heading --smart-case --color=always --hidden --follow %s %s %s")
  ;; This is what helm uses from the AG command when finding files
  (setq helm-grep-ag-command "rg --line-number --no-heading --smart-case --color=always --hidden --follow %s %s %s")

  (dgraham/load-pss-mode)

  ;; When using WSL, open URLs in Windows browser
  (let ((cmd-exe "/mnt/c/Windows/System32/cmd.exe")
        (cmd-args '("/c" "start")))
    (when (file-exists-p cmd-exe)
      (setq browse-url-generic-program  cmd-exe
            browse-url-generic-args     cmd-args
            browse-url-browser-function 'browse-url-generic))) 

  ;; This requires dotspacemacs-auto-resume-layouts to be true
  (when (string= (system-name) "DESKTOP-U4G2SJR")
    (add-hook 'persp-mode-hook
              (lambda ()
                (persp-switch "actions")))
    )

  ;; Add week numbers to the calendar
  ;; From https://stackoverflow.com/questions/21364948/how-to-align-the-calendar-with-week-number-as-the-intermonth-text
  (setq calendar-week-start-day 1)

  (setq calendar-intermonth-text
        '(propertize
          (format "%2d"
                  (car
                   (calendar-iso-from-absolute
                    (calendar-absolute-from-gregorian (list month day year)))))
          'font-lock-face 'font-lock-preprocessor-face))

  (setq calendar-intermonth-header
        (propertize "Wk" 'font-lock-face 'font-lock-preprocessor-face))
  
  (setq inferior-lisp-program "/usr/bin/sbcl")

  ;; This will automatically change font size depending on which monitor emacs
  ;; is on
  ;; This interrupts me when I'm in a elisp debugging session
  ;;(add-hook 'window-size-change-functions (lambda (frame) (dgraham/adjust-font-size-based-on-display)))
  ;;(add-hook 'after-focus-change-function #'dgraham/adjust-font-size-based-on-display)

  ;; For bookmarklet to save bookmark as org-roam node
  (require 'org-roam-protocol)
  )

;; Make sure that clicking on the X button of the window doesn't close
;; emacs without a prompt
(defadvice handle-delete-frame (around my-handle-delete-frame-advice activate)
  "Ask for confirmation before deleting the last frame"
  (let ((frame   (posn-window (event-start event)))
        (numfrs  (length (frame-list))))
    (when (or (> numfrs 1) (y-or-n-p "Really exit Emacs? "))
      ad-do-it)))

;; irun.log files can be large, so disable the undo history
(defun my-irun-log-hook ()
  ;; Need to use a regex as buffer-name can be prepended with extra
  ;; path info when the buffer name is not unique
  (when (string-match "^\\(i\\|x\\)run\\.log$" (buffer-name))
    ;; This disables the undo log and means we can't overwrite it
    (read-only-mode)
    ;; Reset any scaling
    (text-scale-increase 0)
    ;; The make the text smaller
    (text-scale-decrease 1)
    )
  )

(defun dgraham/perl-eval (beg end)
  "Run selected region as Perl code"
  (interactive "r")
  (shell-command-on-region beg end "perl")
  feeds the region to perl on STDIN
  )

(defun dgraham/copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))


;; From https://emacsredux.com/blog/2013/06/21/eval-and-replace/
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun dgraham/insert-meeting-headline ()
  (interactive)
  (helm :sources
    ;; This is a macro to make building a source list for a file easier
    ;; (helm-source-in-file underneath)
    (helm-build-in-file-source
      ;; Name of source 
      "Meetings"
      ;; The file where to get the strings, one per line
      (expand-file-name (f-join org-directory "ast/meeting_headlines.txt"))
      ;; What to do with the selected candidate(s)
      :action (helm-make-actions "Insert" (lambda (candidate) (insert candidate)))
      )
    )
  ) 

;; This is for yasnippet org-roam-daily-entry
(defun dgraham/select-meeting-headline ()
  (interactive)
  (helm :sources
        ;; This is a macro to make building a source list for a file easier
        ;; (helm-source-in-file underneath)
        (helm-build-in-file-source
            ;; Name of source 
            "Meetings"
            ;; The file where to get the strings, one per line
            (expand-file-name (f-join org-directory "ast/meeting_headlines.txt"))
          ;; What to do with the selected candidate(s)
          :action (helm-make-actions "Select" (lambda (candidate) (concat "" candidate)))
          )
        )
  ) 

;; This is used in yasnippet org-roam-daily-entry
(defun dgraham/format-decoded-time (time)
  (let* (
         (hour (decoded-time-hour time))
         (min (decoded-time-minute time))
         )
    (format "%02d:%02d" hour min)
    )
  )

;; This function exists in the Windows version of Emacs, but since I'm running
;; this through WSL it's the Linux version of Emacs, which doesn't have this
;; command
;; https://github.com/microsoft/WSL/issues/3907
(defun w32-shell-execute (operation document &optional parameters show-flag)
  (if (and operation (not (string= "open" operation)))
      (error "Don't know how to open %s" document)
    (call-process "/mnt/c/Windows/System32/cmd.exe" nil nil t "/c" "start" "\"\""
                  (concat ""
                          (replace-regexp-in-string "^/mnt/c/" "c:/" document)
                          "")
                  )
    )
  )

;; https://github.com/novoid/dot-emacs/blob/master/config.org#links-to-outlook-entities
(defun org-outlook-open (id)
  "Open the Outlook item identified by ID.  ID should be an Outlook GUID."
  ;; See my definition of this function above

  ;; You need to register outlook URL protocol handler in Windows, see
  ;; /mnt/c/Users/derek.graham/Documents/register_outlook_url_protocol.reg,
  ;; taken from
  ;; https://webcache.googleusercontent.com/search?q=cache:KFY1If26XpcJ:https://it.knightnet.org.uk/2014/06/outlook-2013-url-protocol-handler.html&cd=1&hl=en&ct=clnk&gl=uk&client=firefox-b-d]
  (w32-shell-execute "open" (concat "outlook:" id))
  ;; If this doesn't work then we'll need to call Outlook directly
  ;;(w32-shell-execute "open"
  ;;                   "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
  ;;                   (concat "/select " "outlook:" id))
  )

;; https://emacs.stackexchange.com/questions/63037/fast-way-to-copy-a-link-at-point-in-org-mode
;; This copies the org syntax for the link including the square brackets
(defun dgraham/yank-link ()
  (interactive)
  (let* ((context (org-element-context))
         (type (org-element-type context))
         (beg (org-element-property :begin context))
         (end (org-element-property :end context)))
    (when (eq type 'link)
      (copy-region-as-kill beg end))))

;; I created this to get the href
(defun dgraham/yank-link-href ()
  (interactive)
  (let* ((context (org-element-context))
         (type (org-element-type context))
         )
    (when (eq type 'link)
      (kill-new (org-element-property :raw-link context))))) 

;; You can call the following function on all existing TODO items in a file
;; with:

;;   (org-map-entries '(dgraham/add-excluded-id) "/TODO" 'file)

;; This will only match TODO headlines, not NEXT, STARTED, DONE, etc. I can't
;; find how to easily say "any TODO item". The / in MATCH is a shortcut to match
;; on TODO state, i.e. equivalent to "TODO=\"TODO\""
;;

;; You can use 'agenda for all files that are searched for building the agenda,
;; which for me is all files with TODO items

;; This calls the function on any TODO that doesn't have an ID already:

;;  (org-map-entries '(dgraham/add-excluded-id) "ID=\"\"/TODO|NEXT|STARTED|WAITING|DONE|CANCELLED|DEFFERED" 'file)

;; As this is advice-add'ed around a function that takes arguments, this has to
;; take the same number of args, but since we don't use them we can specify the
;; args like this to ignore them (the underscore tells the byte-compiler that
;; the args are deliberately ignored)
;;

;; My current thinking is not to use this function as it excludes it from the
;; database of two-way linking that org-roam maintains. It's useful to have
;; backlinks to everything, but I don't want it to appear when I want to go to a
;; note.
(defun dgraham/add-excluded-id (&rest _args)
  "Add an ID property to the TODO heading this is called on, but
ensure it is excluded by org-roam"
  (interactive)
  (org-id-get-create)
  (org-set-property "ROAM_EXCLUDE" "t")
  )

;; See https://emacs.stackexchange.com/questions/12391/insert-org-id-link-at-point-via-outline-path-completion
;;
;; This allows you to get completion on linking to headings (e.g. TODOs) with
;; IDs
(defun org-id-complete-link (&optional arg)
  "Create an id: link using completion"
  (concat "id:"
          (org-id-get-with-outline-path-completion)))

;; See https://emacs.stackexchange.com/questions/60690/change-font-size-globally-with-a-shortcut
;; focus-in-hook is obsolete, so I changed it
(defun dgraham/change-font-size (new-size)
  "Change the font size to the given value"
  (interactive "nNew font size: ")
  (set-face-attribute 'default nil :height (* 10 new-size))
  )

(defun dgraham/adjust-font-size-based-on-display ()
  (interactive)
  (let ((display-width (nth 3 (assq 'geometry (frame-monitor-attributes))))
        )
    (dgraham/change-font-size
     (cond ((<= display-width 1920) 12) ;; = Work laptop
           ((<= display-width 2560) 12) ;; UWHD
           ((<= display-width 4096) 10) ;; = my and work monitor
           )
     )
    )
  )

;; Used in org-capture template
;; E.g. (dgraham/format-string-from-prompt "%G-W%V")
(defun dgraham/format-time-string-from-prompt (string)
  "Pass a string that format-string understands but based upon the
date the user provides."
  (format-time-string string (org-read-date nil 'totime nil "Review date: "))
  )

(defun dgraham/org-capture-target-for-weekly-review ()
  (let* (
         (review-date (org-read-date nil 'totime nil "Review date: "))
         ;; %G is the ISO week year as there can be some seemingly odd
         ;; situations where the ISO week number doesn't match the Gregorian
         ;; date.
         (review-date-string (format-time-string "/reviews/%G/%G-W%V-weekly_review.org" review-date))
         )
    ;; time-prompt isn't recognised and neither is C-1 to org-capture, looking
    ;; at the source code, it uses this, but doesn't work either. However, I use
    ;; it in the template file to get the review date not the current date.
    (setq org-overriding-default-time review-date)
    (concat org-roam-directory review-date-string)
    )
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(helm-buffer-max-length nil)
 '(helm-descbinds-disable-which-key nil)
 '(ispell-dictionary "en_GB")
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.2 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-transclusion-exclude-elements '(property-drawer keyword))
 '(org-transclusion-extensions
   '(org-transclusion-src-lines org-transclusion-font-lock org-transclusion-indent-mode))
 '(package-selected-packages
   '(helm-sly common-lisp-snippets sly-macrostep sly-repl-ansi-color sly gnu-elpa-keyring-update bm org-modern evil-evilified-state holy-mode use-package magit-popup vulpea ac-ispell ace-jump-helm-line ace-link aggressive-indent auto-compile auto-complete auto-dictionary auto-highlight-symbol auto-yasnippet blacken browse-at-remote centered-cursor-mode clean-aindent-mode code-cells column-enforce-mode company-anaconda anaconda-mode cython-mode define-word devdocs dired-quick-sort drag-stuff dumb-jump editorconfig elisp-def elisp-slime-nav emr clang-format list-utils eval-sexp-fu evil-anzu anzu evil-args evil-cleverparens paredit evil-collection annalist evil-easymotion evil-escape evil-exchange evil-goggles evil-iedit-state iedit evil-indent-plus evil-lion evil-lisp-state evil-matchit evil-mc evil-nerd-commenter evil-numbers evil-org evil-snipe evil-surround evil-textobj-line evil-tutor evil-visual-mark-mode evil-visualstar expand-region eyebrowse fancy-battery flx-ido flx flycheck-elsa flycheck-package package-lint flycheck flyspell-correct-helm flyspell-correct fuzzy git-gutter-fringe fringe-helper git-gutter git-link git-messenger git-modes git-timemachine gitignore-templates gnuplot golden-ratio google-translate helm-ag helm-c-yasnippet helm-company company helm-descbinds helm-git-grep helm-ls-git helm-make helm-mode-manager helm-org helm-org-rifle helm-projectile helm-purpose helm-pydoc helm-rg helm-swoop helm-themes helm-xref helm helm-core help-fns+ highlight-indentation highlight-numbers parent-mode highlight-parentheses hl-todo htmlize hungry-delete importmagic epc ctable concurrent deferred indent-guide inspector link-hint live-py-mode lorem-ipsum macrostep math-preview multi-line shut-up nameless open-junk-file org-cliplink org-contrib org-download org-mime org-noter org-pomodoro alert log4e gntp org-present org-projectile org-category-capture org-rich-yank org-superstar orgit-forge orgit forge yaml markdown-mode ghub closql treepy overseer pkg-info epl paradox spinner password-generator pdf-view-restore pdf-tools tablist pip-requirements pipenv load-env-vars pippel poetry popup popwin py-isort pydoc pyenv-mode pythonic pylookup pytest pyvenv quickrun rainbow-delimiters rainbow-mode request restart-emacs smartparens smeargle space-doc spaceline-all-the-icons memoize spaceline all-the-icons powerline spacemacs-purpose-popwin spacemacs-whitespace-cleanup sphinx-doc string-edit-at-point string-inflection symbol-overlay symon term-cursor toc-org treemacs-evil treemacs-icons-dired treemacs-magit magit git-commit with-editor transient compat treemacs-persp persp-mode treemacs-projectile treemacs projectile cfrs hydra pfuture ace-window avy posframe undo-tree queue uuidgen vi-tilde-fringe vim-powerline volatile-highlights wgrep-helm wgrep window-purpose imenu-list winum writeroom-mode visual-fill-column ws-butler yapfify yasnippet-snippets yasnippet zenburn-theme async bind-map diminish dotenv-mode lv pcre2el bind-key which-key emacsql-sqlite org-roam org-transclusion org-ql nose helm-org-ql helm-bibtex org string-edit info+ hybrid-mode hide-comnt font-lock+ evil-unimpaired evil-ediff))
 '(verilog-indent-level 2)
 '(verilog-indent-level-behavioral 2)
 '(verilog-indent-level-declaration 2)
 '(verilog-indent-level-module 2)
 '(writeroom-width 90))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t)
 '(org-transclusion-fringe ((t (:foreground "magenta"))))
 '(org-transclusion-source-fringe ((t (:foreground "gold")))))
) 
