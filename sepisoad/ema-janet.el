;;; this is a better janet syntax highlighting for emacs (major mode)

(setq ema-janet-syntax-highlight
      '(("defn\\|defmacro\\|defn-\\|defmacro-" . font-lock-function-name-face)))

(define-derived-mode ema-janet-mode fundamental-mode "emajanet"
  (setq font-lock-defaults '(ema-janet-syntax-highlight))
