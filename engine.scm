;;; the Schematic chess engine

;;; Author: Rick Miskowski - www.richardmiskowski.com

;;; nobody said efficiency was the number one concern

(define INFINITY 100000000)
(define HALF-INFINITY 50000000)

(define (get-board move)
  (vector-ref move 0))

(define (get-color move)
  (vector-ref move 1))

(define (try-engine-pawn-promotion move sourcex sourcey destx desty) 
 ; the engine always promotes a pawn to a queen
  (if (char=? (get-piece-type (get-board move) sourcex sourcey) #\P)
    (if (= desty 0)
      (vector-set! move 10 #\Q)
      (if (= desty 7)
        (vector-set! move 10 #\q)))))

(define (make-engine-move move sourcex sourcey destx desty) 
  (try-engine-pawn-promotion move sourcex sourcey destx desty) 
  (chess-move-inner ; allows king capture - ignores checks
    (get-board move) ; board
    (get-color move) ; color
    (vector-ref move 2) ; castle-allowed
    (vector-ref move 3) ; enpassant-target
    (vector-ref move 4) ; half-move-clock
    (vector-ref move 5) ; full-move
    sourcex
    sourcey
    destx
    desty
    (vector-ref move 10))) ; promote-piece

(define (get-material color board)
  (let
    ((balance 0))
    (do ((i 0 (+ i 1))) ((= i BOARD-SIZE))
      (let
        ((piece (my-string-ref board i)))
        (set! balance (+ balance
          (cadr (assoc piece '(
            (#\. 0)
            (#\p -1)
            (#\P 1)
            (#\n -3)
            (#\N 3)
            (#\b -3)
            (#\B 3)
            (#\r -5)
            (#\R 5)
            (#\q -9)
            (#\Q 9)
            (#\k -99999)
            (#\K 99999))))))))
    (if (char=? color #\B)
      (set! balance (- balance)))
    balance))

(define (count-attacks attacks)
  (let
    ((count 0))
    (do ((i 0 (+ i 1))) ((= i (vector-length attacks)))
      (set! count (+ count (get-cell-list-count attacks i))))
    count))
          
(define (get-mobility color move)
  (let
    ((attacks (make-cell-lists))
     (attacks-opposite (make-cell-lists)))
    (init-cell-lists attacks)
    (init-cell-lists attacks-opposite)
    (all-attacks
      (get-board move) ; board
      (vector-ref move 2) ; castle-allowed
      (vector-ref move 3) ; enpassant-target
      attacks
      color)
    (all-attacks
      (get-board move) ; board
      (vector-ref move 2) ; castle-allowed
      (vector-ref move 3) ; enpassant-target
      attacks-opposite
      (opposite-color color))
    (let
      ((value
        (- (count-attacks attacks)
           (count-attacks attacks-opposite))))
      value)))

(define board-evaluation-count 0) ; count of boards evaluated

(define (get-heuristic-value color move)
  (set! board-evaluation-count (+ board-evaluation-count 1)) 
  (let
    ((heuristic-value
      (+
        (* 100 (get-material color (get-board move)))
        (get-mobility color move))))
    heuristic-value))

(define (piece-value-of piece)
  (cadr (assoc piece '(
    (#\. 0)
    (#\p 1)
    (#\P 1)
    (#\n 3)
    (#\N 3)
    (#\b 3)
    (#\B 3)
    (#\r 5)
    (#\R 5)
    (#\q 9)
    (#\Q 9)
    (#\k 50000000) ; HALF-INFINITY
    (#\K 50000000)))))

(define (get-smallest-attacker square board attacks)
  (let
    ((number-of-attackers (get-cell-list-count attacks square)))
    (if (= number-of-attackers 0)
      -1
      (let
        ((piece-value INFINITY)
         (attacker-coordinate -1))
        (let loop ((i (- (get-cell-list-count attacks square) 1)))
          (if (>= i 0)
            (let
              ((coordinate (get-coordinate attacks square i)))
              (let
                ((x (idx->x coordinate))
                 (y (idx->y coordinate)))
                (if (< (piece-value-of (get-piece board x y)) piece-value)
                  (begin
                    (set! piece-value
                      (piece-value-of (get-piece board x y)))
                    (set! attacker-coordinate coordinate)))
                (loop (- i 1))))))
        attacker-coordinate))))

(define (see square move attacks) ; static exchange evaluation
  (let
    ((board (get-board move))
     (color (get-color move)))
    (let
      ((value 0)
       (smallest-attacker (get-smallest-attacker square board attacks)))
      (if (not (= smallest-attacker -1))
        ; skip if the square not attacked anymore by this side
        (let
          ((sourcex (idx->x smallest-attacker))
           (sourcey (idx->y smallest-attacker))
           (destx (idx->x square))
           (desty (idx->y square)))
          (let
            ((captured-piece (get-piece board destx desty)))
            (let
              ((move (copy-move move)))
              (make-engine-move move sourcex sourcey destx desty) 
              (let
                ((attacks (make-cell-lists)))
                (set! color (opposite-color color)) ; change to opposite color
                (vector-set! move 1 color) ; update move color
                (init-cell-lists attacks)
                (all-attacks
                  (get-board move) ; board
                  (vector-ref move 2) ; castle-allowed
                  (vector-ref move 3) ; enpassant-target
                  attacks
                  color)
                (set! value
                  (max 0
                    (- (piece-value-of captured-piece)
                       (see square move attacks)))))))))
      value)))

(define (king-value-or-more x)
  (if (> x 9)
    x
    0))

(define (piece-order piece)
  (cadr (assoc piece '(
    (#\. 0)
    (#\p 5)
    (#\P 5)
    (#\n 5)
    (#\N 5)
    (#\b 4)
    (#\B 4)
    (#\r 3)
    (#\R 3)
    (#\q 2)
    (#\Q 2)
    (#\k 0)
    (#\K 0)))))

(define (get-max-attacked board color attacks)
  (let
    ((max-attacked 0)) ; default 
    (do ((i 0 (+ i 1))) ((= i BOARD-SIZE))
      (if (not (= (get-cell-list-count attacks i) 0))
        (let
          ((x (idx->x i))
           (y (idx->y i)))
          (let
            ((piece (get-piece board x y)))
            (if (opponent-piece? board color x y)
              (set! max-attacked (max max-attacked ; for now only do king attacks 
                (king-value-or-more (piece-value-of piece)))))))))
    max-attacked))

(define (max-attacked-value coord move)
  ; see if the move results in an attack. get the maximum piece if so.
  (let
    ((board (get-board move))
     (color (get-color move)))
    (let
      ((sourcex (car coord))
       (sourcey (cadr coord))
       (destx (car (cddr coord)))
       (desty (car (cddr (cdr coord)))))
      (let
        ((move (copy-move move)))
        (make-engine-move move sourcex sourcey destx desty) 
        (let
          ((attacks (make-cell-lists)))
          ; now that we moved the piece to destination see if the piece
          ; attacks opponent.
          (init-cell-lists attacks)
          (possible-piece-move
            (get-board move) ; board 
            (vector-ref move 2) ; castle-allowed
            (vector-ref move 3) ; enpassant-target
            attacks
            destx desty)
          (+
            (piece-order (get-piece board sourcex sourcey))
            (/ (get-mobility (opposite-color color) move) 20.0)
            (* 10 (get-max-attacked board color attacks))))))))

(define (attacking-a-piece? board attacks square)
  (not (no-piece? board (idx->x square) (idx->y square))))

(define (filt-attacks move move-list attacks)
  (if (null? move-list)
    '()
    (let
      ((board (get-board move))
       (coord (car move-list)))
      (let
        ((square (xy->idx (car (cddr coord)) (car (cdr (cddr coord))))))
        (if (attacking-a-piece? board attacks square)
          (cons (cons (* 100 (see square move attacks)) coord)
            (filt-attacks move (cdr move-list) attacks))
          (cons (cons (max-attacked-value coord move) coord)
    ;     (cons (cons 0 coord)
            (filt-attacks move (cdr move-list) attacks)))))))

(define (king-in-check? king-sourcex king-sourcey king-dest-idx color move)
; is the king moving into check
  (if (char=? (get-piece-type
                (get-board move) king-sourcex king-sourcey)
              #\K)
    (if (char=? (get-piece-type-fast
                  (get-board move) king-dest-idx)
                #\K)
      #f ; can capture opponent king regardless of whether it results in check
      (let
        ((opposite-attacks (make-cell-lists)))
        (init-cell-lists opposite-attacks)
        (all-attacks
          (get-board move) ; board
          (vector-ref move 2) ; castle-allowed
          (vector-ref move 3) ; enpassant-target
          opposite-attacks
          (opposite-color color))
        (> (get-cell-list-count opposite-attacks king-dest-idx) 0)))
    #f))

(define (display-children-inner x) ; debug routine
  (if (not (null? x))
    (let
      ((child (car x)))
      (display-coordinate child)
      (my-display #\space)
      (display-children-inner (cdr x)))))

(define (display-children x)
  (display-children-inner x)
  x)

(define (remove-checks x move color)
  ; remove king moves that go into check
  (if (null? x)
    '()
    (let
      ((coord (car x)))
      (if (king-in-check?
            (car coord)
            (cadr coord)
            (xy->idx (car (cddr coord))
                     (car (cdr (cddr coord))))
            color move) ; drop the child
        (remove-checks (cdr x) move color)
        (cons coord (remove-checks (cdr x) move color))))))

(define (dummy-2 x y) x) ; bypasses sort

(define (get-child-move-list move color)
  (let
    ((attacks (make-cell-lists)))
    (set! color (opposite-color color)) ; change to opposite color
    (vector-set! move 1 color) ; update move color - very much a side effect
    (init-cell-lists attacks)
    (all-attacks
      (get-board move) ; board
      (vector-ref move 2) ; castle-allowed
      (vector-ref move 3) ; enpassant-target
      attacks
      color)
    (let
      ((child-move-list '()))
      (do ((i 0 (+ i 1))) ((= i (vector-length attacks)))
        (do ((j 0 (+ j 1))) ((= j (get-cell-list-count attacks i)))
          (set! child-move-list
            (cons (list (idx->x (get-coordinate attacks i j))
                        (idx->y (get-coordinate attacks i j))
                        (idx->x i) ; ok
                        (idx->y i))
                  child-move-list))))
      (let
        ((lst (merge-sort 
      ; ((lst (dummy-2 
                (filt-attacks move 
                  (remove-checks child-move-list move color)
                  attacks)
                (lambda (x y) (< (car x) (car y))))))
;       (display-children
          lst
;       )
))))

(define (display-coordinate x)
  (if (pair? x)
    (let
      ((value (car x))
       (sourcex (cadr x))
       (sourcey (car (cddr x)))
       (destx (car (cdr (cddr x))))
       (desty (car (cddr (cddr x)))))
      (my-display value)
      (my-display #\space)
      (my-display (integer->char (+ sourcex (char->integer #\a))))
      (my-display (- 8 sourcey))
      (my-display (integer->char (+ destx (char->integer #\a))))
      (my-display (- 8 desty)))))

(define (no-king? move color)
  (let
    ((board (get-board move))
     (king-piece #\K)
     (king-idx 0))
    (if (char=? color #\B)
      (set! king-piece #\k))
    (do ((i 0 (+ i 1))) ((= i BOARD-SIZE))
      (if (char=? (my-string-ref board i) king-piece)
        (set! king-idx i)))
    (= king-idx 0)))

(define (display-coordinates coordinates)
  (if (not (null? coordinates))
    (let
      ((coordinate (car coordinates)))
      (display-coordinate coordinate)
      (my-display #\space)
      (display-coordinates (cdr coordinates)))))

(define (display-line line)
  (my-display (car line))
  (my-display #\space)
  (display-coordinates (cadr line)))

(define (probe-depth result depth)
  (if (= depth 0)
    (begin
      (my-display depth) (my-display #\space)
      (display-line result) (my-newline))))

(define (make-line x y) (list x y))

(define (get-line x) (cadr x))

(define (value-of-result x) (car x))

(define (alpha-beta move coordinate alpha beta depth)
  (let
    ((sourcex (cadr coordinate))
     (sourcey (cadr (cdr coordinate)))
     (destx (cadr (cddr coordinate)))
     (desty (cadr (cddr (cdr coordinate)))))
    (let
      ((color (get-color move)))
      (let
        ((move (copy-move move)))
        (make-engine-move move sourcex sourcey destx desty) 
        (if (no-king? move (opposite-color color)) ; wins outright
          (make-line (+ (- INFINITY) 10000) '())
          (if (= depth plys)
            (make-line 
              (- (get-heuristic-value color move))
              '())
            (let
              ((child-move-list (get-child-move-list move color))
               (best-line '()))
              (if (null? child-move-list) ; no possible move - stalemate
                (make-line
                  (get-heuristic-value color move)
                  '())
                (begin
                  (let loop ((children child-move-list)
                             (searching #t))
                    (if (and (not (null? children)) searching)
                      (let*
                       ((child (car children))
                        (result
                          (alpha-beta
                            move
                            child
                            (- beta)
                            (- alpha)
                            (+ depth 1)))
                        (new-value (- (value-of-result result))))
                     ; (probe-depth result depth) ; trace action
                       (if (> new-value beta)
                         (begin
                           (set! beta new-value)
                           (set! best-line (cons child (get-line result)))))
                       (if (>= beta alpha)
                         (set! searching #f))
                       (loop (cdr children) searching)))) ; next child
                  (make-line beta best-line))))))))))
