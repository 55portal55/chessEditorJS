(define (merge left right gt?)
  (cond
   ((null? left) right)
   ((null? right) left)
   ((gt? (car left) (car right))
    (cons (car right)
          (merge left (cdr right) gt?)))
   (else
    (cons (car left)
          (merge (cdr left) right gt?)))))

(define (take l n gt?)
  (if (zero? n)
    (list)
    (cons (car l)
          (take (cdr l) (- n 1) gt?))))

(define (merge-sort l gt?)
  (let ((half (quotient (length l) 2)))
    (if (zero? half)
      l
      (merge (merge-sort (take      l half gt?) gt?)
             (merge-sort (list-tail l half) gt?)
             gt?))))
