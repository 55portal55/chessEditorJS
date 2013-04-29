(define (set-first-click)
  ; only intended for js specific version
  #f)

(define (updateDisplay)
  ; only intended for js specific version
  #f)

(define (displayPlys)
  ; only intended for js specific version
  #f)

(define (updateDisplayAnalyze best-line)
  ; only intended for js specific version
  ; for sch display analysis data
  (display-line best-line)
  (my-display #\space)
  (my-display board-evaluation-count)
  (my-newline)
; (exit 0) ; debug in gambit scheme
  )

(define (number->string-kludge n)
  (inexact->exact (floor n)))
