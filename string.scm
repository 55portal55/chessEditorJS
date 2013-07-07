;;; to overcome the lack of mutable strings in scheme2js

(define (my-make-string s)
  (list->vector (string->list s)))

(define (my-string-copy s)
  (list->vector (vector->list s)))

(define (my-string-set! s idx val)
  (vector-set! s idx val))

(define (my-string-ref s idx)
  (vector-ref s idx))

(define (my-string=? s1 s2)
  (string=? (list->string (vector->list s1))
            (list->string (vector->list s2))))
