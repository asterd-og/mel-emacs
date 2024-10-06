(defvar mel-types nil "mel types")
(setq mel-types
  '("char" "short" "int" "long" "unsigned" "signed" "void" "bool"
    "u8" "i8" "u16" "i16" "u32" "i32" "u64" "i64" "f32" "f64"))

(defvar mel-keywords nil "mel keywords")
(setq mel-keywords
  '("if" "else" "while" "import" "for" "fn" "var" "ret" "break"
    "continue" "switch" "case" "default" "struct" "packed" "extern" "align"
    "sizeof" "enum"))

(defvar mel-constants nil "mel constants")
(setq mel-constants
  '("true" "false"))

(defun mel-font-lock ()
  (list `("//.*" . font-lock-comment-face)
        `("/\\*\\(?:[^*]\\|\\*+[^)*]\\)*\\*+/" . font-lock-comment-face)
        `(,(regexp-opt mel-types 'symbols) . font-lock-type-face)
        `(,(regexp-opt mel-constants 'symbols) . font-lock-constant-face)
        `(,(regexp-opt mel-keywords 'symbols) . font-lock-keyword-face)
        `("\\([a-zA-Z_][a-zA-Z_0-9]*\\)\\s-*(" (1 font-lock-function-name-face))
        `("\\b[a-zA-Z_][a-zA-Z_0-9]*\\b" . font-lock-variable-name-face)
        `("\"([^\"\\]*(?:\\.[^\"\\]*)*)\"" . font-lock-string-face)
        `("'.'" . 'font-lock-string-face)
        `("(0x[0-9a-fA-F]+|[0-9]+(?:\.[0-9]+)?)" . font-lock-number-face)))

(define-derived-mode mel-mode fundamental-mode "mel mode"
  "Simple major mode for editing Mel files."
  (setq-local font-lock-defaults '(mel-font-lock)))

(provide 'mel-mode)
