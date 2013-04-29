(define (bubble-sort x gt?)
  (letrec (
    (fix (lambda (f i)
      (if (equal? i (f i))
        i
        (fix f (f i)))))

    (sort (lambda (l)
      (if (or (null? l) (null? (cdr l)))
        l
        (if (gt? (car l) (cadr l))
          (cons (cadr l) (sort (cons (car l) (cddr l))))
          (cons (car l) (sort (cdr l))))))))

  (fix sort x)))
