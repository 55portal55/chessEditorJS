
;;; essential subset of display required by chessEditorJS

(define (display-char ch)
  (mywritechar ch))

(define (my-write-char ch)
  (mywritechar #\#)
  (mywritechar #\\)
  (mywritechar ch))

(define (display-string x)
  (do ((i 0 (+ i 1))) ((= i (string-length x)))
    (let
      ((c (string-ref x i)))
      (if (or (char=? c #\\) (char=? c #\"))
        (display-char #\\))
      (display-char c))))

(define (display-my-string x)
  (do ((i 0 (+ i 1))) ((= i (vector-length x)))
    (let
      ((c (vector-ref x i)))
      (if (or (char=? c #\\) (char=? c #\"))
        (display-char #\\))
      (display-char c))))

(define (display-number n)
  (display-string (number->string (number->string-kludge n))))

(define (my-display x)
  (cond
    ((char? x) (display-char x))
    ((string? x) (display-string x))
    ((number? x) (display-number x))
    ((vector? x) (display-my-string x))))

(define (my-write x)
  (cond
    ((char? x) (my-write-char x))
    ((string? x) (display-char #\") (display-string x) (display-char #\"))
    ((number? x) (display-number x))
    ((vector? x) (display-char #\") (display-my-string x) (display-char #\"))))

(define (my-newline)
  (display-char #\newline))
