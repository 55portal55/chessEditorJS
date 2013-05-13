
(define random-number 17)

(define (random) ; return 0.0 >= n < 1.0
  (set! random-number (remainder (* random-number 4001) 8009))
  (/ (remainder random-number 1000) 1000.0))

(random)
