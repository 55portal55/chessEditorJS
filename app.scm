(define (init-move)
  (let
    ((move (make-vector 11)))
    (vector-set! move 0
      (my-make-string
        "rnbqkbnrpppppppp................................PPPPPPPPRNBQKBNR"))
    (vector-set! move 1 #\W)
    (vector-set! move 2 (my-make-string "KQkq"))
    (vector-set! move 3 (my-make-string ".."))
    (vector-set! move 4 0)
    (vector-set! move 5 0)
    (vector-set! move 6 0)
    (vector-set! move 7 0)
    (vector-set! move 8 0)
    (vector-set! move 9 0)
    (vector-set! move 10 #\.)
    move))

(define (copy-move src) 
  (let
    ((dest (make-vector 11)))
    (vector-set! dest 0
      (my-string-copy
        (vector-ref src 0)))
    (vector-set! dest 1
      (vector-ref src 1))
    (vector-set! dest 2
      (my-string-copy
        (vector-ref src 2)))
    (vector-set! dest 3
      (my-string-copy
        (vector-ref src 3)))
    (vector-set! dest 4
      (vector-ref src 4))
    (vector-set! dest 5
      (vector-ref src 5))
    (vector-set! dest 6
      (vector-ref src 6))
    (vector-set! dest 7
      (vector-ref src 7))
    (vector-set! dest 8
      (vector-ref src 8))
    (vector-set! dest 9
      (vector-ref src 9))
    (vector-set! dest 10
      (vector-ref src 10))
    dest))

(define move (init-move))
(define move-log (list (copy-move move)))
(define move-idx 0)

(define (make-move sourcex sourcey destx desty)
  (set! outputText "") ; ???? - sch doesnt use
  (set! board-evaluation-count 0)
  (if (chess-move
    (vector-ref move 0) ; board
    (vector-ref move 1) ; color
    (vector-ref move 2) ; castle-allowed
    (vector-ref move 3) ; enpassant-target
    (vector-ref move 4) ; half-move-clock
    (vector-ref move 5) ; full-move
    sourcex
    sourcey
    destx
    desty
    (vector-ref move 10)) ; promote-piece
    (begin
      (if (char=? (vector-ref move 1) #\W) ; set color for next move
        (vector-set! move 1 #\B)
        (vector-set! move 1 #\W))
      (vector-set! move 6 sourcex)
      (vector-set! move 7 sourcey)
      (vector-set! move 8 destx)
      (vector-set! move 9 desty)
      (set! move-log
        (reverse
          (cons (copy-move move)
                (list-tail
                  (reverse move-log)
                  (- (- (length move-log) 1) move-idx)))))
      (set! move-idx (+ move-idx 1)))
    (begin
      (my-display "bad move")
      (my-newline))))

(define (gotoMove n)
  (set-first-click)
  (if (< n 0)
    (set! n 0)
    (if (>= n (length move-log))
      (set! n (- (length move-log) 1))))
  (set! move-idx n)
  (set! move (copy-move (list-ref move-log move-idx))))

(define (goForward)
  (gotoMove (+ move-idx 1))
  (updateDisplay))

(define (goBackward)
  (gotoMove (- move-idx 1))
  (updateDisplay))

(define (gotoFirst)
  (gotoMove 0)
  (updateDisplay))

(define (gotoLast)
  (gotoMove (- (length move-log) 1))
  (updateDisplay))

(define plys 4)

(define (set-plys n)
  (set! plys n)
  (displayPlys))

(define (display-example)
  (set! move-log (clone-example example))
  (gotoMove (- (length move-log) 1))
  (updateDisplay))

(define (setExample)
  (display-example)
  (cond
    ((eq? example example1)
      (set! example example2)
      (set-plys 4))
    ((eq? example example2)
      (set! example example3)
      (set-plys 6))
    ((eq? example example3)
      (set! example example4)
      (set-plys 6))
    ((eq? example example4)
      (set! example example5)
      (set-plys 6))
    ((eq? example example5)
      (set! example example6)
      (set-plys 6))
    ((eq? example example6)
      (set! example example7)
      (set-plys 8))
    ((eq? example example7)
      (set! example example1)
      (set-plys 6))))

(define (setNew)
  (set! example example1)
  (set! move-log (clone-example example))
  (gotoMove (- (length move-log) 1))
  (updateDisplay))

(define (analyze)
  (let
    ((move (copy-move move)))
    (vector-set! move 1 (opposite-color (vector-ref move 1))) ; color
    (updateDisplayAnalyze
      (alpha-beta
         move
         (list 0 0 0 0 0) ; null move
         INFINITY
         (- INFINITY)
       0)))) ; depth. start at 0

(define (fen2pgn moves move-number move-idx)
  (if (< (length moves) 2)
    (my-newline)
    (let
      ((move1 (car moves))
       (move2 (cadr moves)))
      (if (= move-number move-idx)
        (begin
          (my-newline)
          (my-newline)))
      (let
        ((board1 (vector-ref move1 0))
         (castle-allowed1 (vector-ref move1 2))
         (enpassant-target1 (vector-ref move1 3))
         (board2 (vector-ref move2 0))
         (castle-allowed2 (vector-ref move1 2))
         (enpassant-target2 (vector-ref move2 3))
         (sourcex (vector-ref move2 6))
         (sourcey (vector-ref move2 7))
         (destx (vector-ref move2 8))
         (desty (vector-ref move2 9))
         (promotion-piece (vector-ref move2 10))
         (attack #f))
        (let
          ((piece-type (get-piece-type board1 sourcex sourcey))
           (color (get-piece-color board1 sourcex sourcey)))
          (if (not (no-piece? board1 destx desty))
            (if (not (char=? (get-piece-color board1 sourcex sourcey)
                             (get-piece-color board1 destx desty)))
              (set! attack #t)))
          (print-algebraic
            board1 castle-allowed1 enpassant-target1
            board2 castle-allowed2 enpassant-target2
            move-number
            piece-type color
            sourcex sourcey destx desty
            attack promotion-piece)
          (my-display " ")
          (fen2pgn (cdr moves) (+ move-number 1) move-idx))))))

(define (pawn-promotion board sourcex sourcey destx desty)
  (let
    ((piece-type (get-piece-type board sourcex sourcey))
     (piece-color (get-piece-color board sourcex sourcey))
     (castle-allowed (my-make-string "...."))
     (enpassant-target (my-make-string ".."))
     (enpassant (make-vector 1)))
    (if (char=? piece-type #\P)
      (if (and (char=? piece-color #\W)
               (= sourcey 1)
               (= desty 0)
               (legal-move?
                 board castle-allowed enpassant-target enpassant
                 sourcex sourcey destx desty))
        #\P
        (if (and (char=? piece-color #\B)
                 (= sourcey 6)
                 (= desty 7)
                 (legal-move?
                   board castle-allowed enpassant-target enpassant
                   sourcex sourcey destx desty))
          #\p
          #\.))
        #\.)))

(define (my-write-my-make-string x)
  (my-display "(my-make-string ") (my-write x) (my-display ")"))

(define (fen moves)
  (if (not (null? moves))
    (let
      ((move (car moves)))
      (my-display "(list->vector (list") (my-newline)
      (my-write-my-make-string (vector-ref move 0)) (my-newline)
      (my-write (vector-ref move 1)) (my-newline)
      (my-write-my-make-string (vector-ref move 2)) (my-newline)
      (my-write-my-make-string (vector-ref move 3)) (my-newline)
      (my-write (vector-ref move 4)) (my-newline)
      (my-write (vector-ref move 5)) (my-newline)
      (my-write (vector-ref move 6)) (my-newline)
      (my-write (vector-ref move 7)) (my-newline)
      (my-write (vector-ref move 8)) (my-newline)
      (my-write (vector-ref move 9)) (my-newline)
      (my-write (vector-ref move 10)) (my-newline)
      (my-display "))") (my-newline)
      (fen (cdr moves)))))

(define (doFen)
  (fen move-log))

(define (clone-example example)
  (if (null? example)
    '()
    (cons
      (copy-move (car example))
      (clone-example (cdr example)))))
