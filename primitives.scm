; as they say : code now. optimize later.

(define BOARD-SIZE 64)

(define MAX-PIECES-PER-PLAYER 12)

(define (xy->idx x y)
  (+ (* y 8) x))

(define (idx->x idx)
  (remainder idx 8))

(define (idx->y idx)
  (quotient idx 8))

(define (xcoord->algebraic x)
  (integer->char (+ (char->integer #\a) x)))

(define (ycoord->algebraic y)
  (integer->char (- (+ (char->integer #\0) 8) y)))

(define (algebraic->xcoord x)
  (- (char->integer x) (char->integer #\a)))

(define (algebraic->ycoord y)
  (- 8 (- (char->integer y) (char->integer #\0))))

(define (set-cell-list-count! cell-lists i val)
  (vector-set! (vector-ref cell-lists i) 0 val))

(define (get-cell-list-count cell-lists i)
  (vector-ref (vector-ref cell-lists i) 0))

(define (set-cell-list-coordinate! cell-lists i count coordinate)
  (vector-set! (vector-ref (vector-ref cell-lists i) 1) count coordinate))

(define (get-coordinate cell-lists i j)
  (vector-ref (vector-ref (vector-ref cell-lists i) 1) j))

(define (init-cell-lists cell-lists)
  (do ((i 0 (+ i 1))) ((= i BOARD-SIZE))
    (set-cell-list-count! cell-lists i 0)))

(define (make-cell-list)
  (let
    ((cell-list (make-vector 2)))
    (vector-set! cell-list 0 0) ; initialize count to 0
    (vector-set! cell-list 1
      (make-vector MAX-PIECES-PER-PLAYER))
    cell-list))

(define (make-cell-lists)
  (let
    ((cell-lists (make-vector BOARD-SIZE)))
    (do ((i 0 (+ i 1))) ((= i BOARD-SIZE))
      (vector-set! cell-lists i (make-cell-list)))
    cell-lists)) 

(define (add-to-cell-list cell-lists sourcex sourcey destx desty)
  (let
    ((idx1 (xy->idx sourcex sourcey))
     (idx2 (xy->idx destx desty)))
    (let
      ((count (get-cell-list-count cell-lists idx2)))
      (set-cell-list-coordinate! cell-lists idx2 count idx1)
      (set-cell-list-count! cell-lists idx2 (+ count 1)))))

(define (add-to-cell-list-fast cell-lists source dest)
  (let
    ((count (get-cell-list-count cell-lists dest)))
    (set-cell-list-coordinate! cell-lists dest count source)
    (set-cell-list-count! cell-lists dest (+ count 1))))

(define (destination-in-cell-lists? cell-lists i)
  (> (get-cell-list-count cell-lists i) 0))

(define (bad-coordinate? x y)
  (or (< x 0) (> x 7) (< y 0) (> y 7)))

(define (get-piece board x y)
  (my-string-ref board (xy->idx x y)))

(define (get-piece-fast board idx)
  (my-string-ref board idx))

(define (set-piece! board x y piece)
  (my-string-set! board (xy->idx x y) piece))

(define (get-piece-type board x y)
  (let
    ((piece (get-piece board x y)))
    (if (char=? piece #\.)
      piece
      (if (char-lower-case? piece)
        (char-upcase piece)
        piece))))

(define (get-piece-type-fast board idx)
  (let
    ((piece (get-piece-fast board idx)))
    (if (char=? piece #\.)
      piece
      (if (char-lower-case? piece)
        (char-upcase piece)
        piece))))

(define (get-piece-color board x y)
  (let
    ((piece (get-piece board x y)))
    (if (char=? piece #\.)
      #\x
      (if (char-lower-case? piece)
        #\B
        #\W))))

(define (get-piece-color-fast board idx)
  (let
    ((piece (get-piece-fast board idx)))
    (if (char=? piece #\.)
      #\x
      (if (char-lower-case? piece)
        #\B
        #\W))))

(define (piece-and-color? board x y color piece)
  (and (char=? (get-piece-type board x y) piece)
       (char=? (get-piece-color board x y) color)))

(define (white? color)
  (char=? color #\W))

(define (opposite-color color)
  (if (char=? color #\W)
    #\B
    #\W))

(define (no-piece? board x y)
  (char=? (get-piece-type board x y) #\.))

(define (no-piece-fast? board idx)
  (char=? (get-piece-type-fast board idx) #\.))

(define (opponent-piece? board piece-color x y)
  (if (bad-coordinate? x y)
    #f
    (and
      (not (no-piece? board x y))
      (not (char=? (get-piece-color board x y) piece-color)))))

(define (opponent-piece-fast? board piece-color idx)
  (and
    (not (no-piece-fast? board idx))
    (not (char=? (get-piece-color-fast board idx) piece-color))))

(define (opponent-pawn? board piece-color x y)
  (if (bad-coordinate? x y)
    #f
    (and
      (char=? (get-piece-type board x y) #\P)
      (not (char=? (get-piece-color board x y) piece-color)))))

(define (enpassant-target? enpassant-target x y)
  (and
    (char=? (my-string-ref enpassant-target 0) x)
    (char=? (my-string-ref enpassant-target 1) y)))

(define (display-enpassant-target target)
  (my-display target))

(define (update-enpassant-target enpassant-target x y)
  (my-string-set! enpassant-target 0 x)
  (my-string-set! enpassant-target 1 y))

(define (copy-board board1 board2)
  (do ((i 0 (+ i 1))) ((= i BOARD-SIZE))
    (my-string-set! board2 i (my-string-ref board1 i))))

(define (display-position board enpassant-target promotion-piece)
  (my-display board)
  (my-display "  ")
  (display-enpassant-target enpassant-target)
  (my-display "  ")
  (my-display promotion-piece))

(define (display-ascii-board board)
  (do ((x 0 (+ x 1))) ((= x 8))
    (do ((y 0 (+ y 1))) ((= y 8))
      (my-display (my-string-ref board (xy->idx y x)))
      (my-display " "))
    (my-newline)))

(define (display-attack-board attacks)
  (do ((x 0 (+ x 1))) ((= x 8))
    (do ((y 0 (+ y 1))) ((= y 8))
      (my-display (get-cell-list-count attacks (xy->idx y x)))
      (my-display " "))
    (my-newline)))

