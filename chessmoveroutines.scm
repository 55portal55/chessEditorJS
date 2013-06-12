
;;; Author: Rick Miskowski - www.richardmiskowski.com

(define (pawn-move board enpassant-target
  cell-lists sourcex sourcey piece-color)
  (if (white? piece-color)
    (begin
      (if (= sourcey 6)
        (if (and (no-piece? board sourcex 5)
                 (no-piece? board sourcex 4))
          (add-to-cell-list cell-lists sourcex sourcey sourcex 4)))
      (if (no-piece? board sourcex (- sourcey 1))
        (add-to-cell-list cell-lists sourcex sourcey sourcex (- sourcey 1)))
      ; try capture
      (if (opponent-piece? board piece-color (- sourcex 1) (- sourcey 1))
        (add-to-cell-list
          cell-lists sourcex sourcey (- sourcex 1) (- sourcey 1)))
      (if (opponent-piece? board piece-color (+ sourcex 1) (- sourcey 1))
        (add-to-cell-list
          cell-lists sourcex sourcey (+ sourcex 1) (- sourcey 1)))
      ; try en passant
      (if (and
            (= sourcey 3)
            (opponent-pawn? board piece-color (- sourcex 1) 3)
            (no-piece? board (- sourcex 1) 2)
            (no-piece? board (- sourcex 1) 1))
        (if (enpassant-target?
              enpassant-target
              (xcoord->algebraic (- sourcex 1))
              (ycoord->algebraic 2))
          (add-to-cell-list cell-lists sourcex sourcey (- sourcex 1) 2)))
      (if (and
            (= sourcey 3)
            (opponent-pawn? board piece-color (+ sourcex 1) 3)
            (no-piece? board (+ sourcex 1) 2)
            (no-piece? board (+ sourcex 1) 1))
        (if (enpassant-target?
              enpassant-target
              (xcoord->algebraic (+ sourcex 1))
              (ycoord->algebraic 2))
          (add-to-cell-list cell-lists sourcex sourcey (+ sourcex 1) 2)))
    )
    (begin ; black pawn
      (if (= sourcey 1)
        (if (and
              (no-piece? board sourcex 2)
              (no-piece? board sourcex 3))
          (add-to-cell-list cell-lists sourcex sourcey sourcex 3)))
      (if (no-piece? board sourcex (+ sourcey 1))
        (add-to-cell-list cell-lists sourcex sourcey sourcex (+ sourcey 1)))
      ; try capture
      (if (opponent-piece? board piece-color (- sourcex 1) (+ sourcey 1))
        (add-to-cell-list
          cell-lists sourcex sourcey (- sourcex 1) (+ sourcey 1)))
      (if (opponent-piece? board piece-color (+ sourcex 1) (+ sourcey 1))
        (add-to-cell-list
          cell-lists sourcex sourcey (+ sourcex 1) (+ sourcey 1)))
      ; try en passant
      (if (and
            (= sourcey 4)
            (opponent-pawn? board piece-color (- sourcex 1) 4)
            (no-piece? board (- sourcex 1) 5)
            (no-piece? board (- sourcex 1) 6))
        (if (enpassant-target?
              enpassant-target
              (xcoord->algebraic (- sourcex 1))
              (ycoord->algebraic 5))
          (add-to-cell-list cell-lists sourcex sourcey (- sourcex 1) 5)))
      (if (and
            (= sourcey 4)
            (opponent-pawn? board piece-color (+ sourcex 1) 4)
            (no-piece? board (+ sourcex 1) 5)
            (no-piece? board (+ sourcex 1) 6))
        (if (enpassant-target?
              enpassant-target
              (xcoord->algebraic (+ sourcex 1))
              (ycoord->algebraic 5))
          (add-to-cell-list cell-lists sourcex sourcey (+ sourcex 1) 5))))))

(define (knight-king-choice
  board cell-lists sourcex sourcey destx desty piece-color)
  (if (not (bad-coordinate? destx desty))
    (begin
      (if (no-piece? board destx desty)
        (add-to-cell-list cell-lists sourcex sourcey destx desty))
      (if (opponent-piece? board piece-color destx desty)
        (add-to-cell-list cell-lists sourcex sourcey destx desty)))))

(define (knight-move
  board cell-lists sourcex sourcey piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (- sourcex 1) (+ sourcey 2) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (- sourcex 2) (+ sourcey 1) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (- sourcex 2) (- sourcey 1) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (- sourcex 1) (- sourcey 2) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (+ sourcex 1) (- sourcey 2) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (+ sourcex 2) (- sourcey 1) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (+ sourcex 2) (+ sourcey 1) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (+ sourcex 1) (+ sourcey 2) piece-color))

(define (bishop-rook-branch-move
  board cell-lists 
  source branch piece-color)
  (if (not (null? branch))
    (let
      ((dest (car branch)))
      (if (opponent-piece-fast? board piece-color dest) 
        (add-to-cell-list-fast cell-lists source dest)
        (if (no-piece-fast? board dest)
          (begin
            (add-to-cell-list-fast cell-lists source dest)
            (bishop-rook-branch-move
              board cell-lists 
              source (cdr branch) piece-color)))))))

(define (bishop-move board cell-lists sourcex sourcey piece-color)
  (let
    ((source (xy->idx sourcex sourcey)))
    (let
      ((branch (vector-ref bishop-table source)))
      (bishop-rook-branch-move board cell-lists 
        source (car branch) piece-color)
      (bishop-rook-branch-move board cell-lists 
        source (cadr branch) piece-color)
      (bishop-rook-branch-move board cell-lists 
        source (cadr (cdr branch)) piece-color)
      (bishop-rook-branch-move board cell-lists 
        source (cadr (cddr branch)) piece-color))))

(define (rook-move board cell-lists sourcex sourcey piece-color)
  (let
    ((source (xy->idx sourcex sourcey)))
    (let
      ((branch (vector-ref rook-table source)))
      (bishop-rook-branch-move board cell-lists 
        source (car branch) piece-color)
      (bishop-rook-branch-move board cell-lists 
        source (cadr branch) piece-color)
      (bishop-rook-branch-move board cell-lists 
        source (cadr (cdr branch)) piece-color)
      (bishop-rook-branch-move board cell-lists 
        source (cadr (cddr branch)) piece-color))))

(define (queen-move board cell-lists sourcex sourcey piece-color)
  (bishop-move
    board cell-lists
    sourcex sourcey piece-color)
  (rook-move
    board cell-lists
    sourcex sourcey piece-color))

(define (king-move board castle-allowed cell-lists sourcex sourcey piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (+ sourcex 1) (+ sourcey 1) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (+ sourcex 1) sourcey piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (+ sourcex 1) (- sourcey 1) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey sourcex (- sourcey 1) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (- sourcex 1) (- sourcey 1) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (- sourcex 1) sourcey piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey (- sourcex 1) (+ sourcey 1) piece-color)
  (knight-king-choice
    board cell-lists
    sourcex sourcey sourcex (+ sourcey 1) piece-color)

  ; castleing moves

  (if (white? piece-color)
    (begin
      (if (and
        (char=? (my-string-ref castle-allowed 0) #\K) ; kingside castle allowed
        (= sourcex 4) (= sourcey 7)
        (no-piece? board 5 7) (no-piece? board 6 7)
        (piece-and-color? board 7 7 #\W #\R))
        (add-to-cell-list cell-lists sourcex sourcey 6 7))
      (if (and
        (char=? (my-string-ref castle-allowed 1) #\Q) ; queenside castle allowed
        (= sourcex 4) (= sourcey 7)
        (no-piece? board 3 7) (no-piece? board 2 7) (no-piece? board 1 7)
        (piece-and-color? board 0 7 #\W #\R))
        (add-to-cell-list cell-lists sourcex sourcey 2 7)))
    (begin ; black
      (if (and
        (char=? (my-string-ref castle-allowed 2) #\k) ; kingside castle allowed
        (= sourcex 4) (= sourcey 0)
        (no-piece? board 5 0) (no-piece? board 6 0)
        (piece-and-color? board 7 0 #\B #\R))
        (add-to-cell-list cell-lists sourcex sourcey 6 0))
      (if (and
        (char=? (my-string-ref castle-allowed 3) #\q) ; queenside castle allowed
        (= sourcex 4) (= sourcey 0)
        (no-piece? board 3 0) (no-piece? board 2 0) (no-piece? board 1 0)
        (piece-and-color? board 0 0 #\B #\R))
        (add-to-cell-list cell-lists sourcex sourcey 2 0)))))

(define (current-move-is-enpassant?
  board enpassant-target cell-lists sourcex sourcey destx desty)
  (let
    ((piece-type (get-piece-type board sourcex sourcey)))
    (if (and
      (char=? piece-type #\P)
      (char=? (xcoord->algebraic destx) (my-string-ref enpassant-target 0))
      (char=? (ycoord->algebraic desty) (my-string-ref enpassant-target 1)))
      (destination-in-cell-lists? cell-lists (xy->idx destx desty))
      #f)))

(define (set-enpassant-target
  board enpassant-target sourcex sourcey destx desty)
  (let
    ((x #\.)
     (y #\.))
    (let
      ((piece-type (get-piece-type board sourcex sourcey))
       (piece-color (get-piece-color board sourcex sourcey)))
      (if (char=? piece-type #\P)
        (if (white? piece-color)
          (begin
            (if (and (= sourcey 6) (= desty 4))
              (begin
                (set! x (xcoord->algebraic destx))
                (set! y (ycoord->algebraic 5)))))
          (begin ; black
            (if (and (= sourcey 1) (= desty 3))
              (begin
                (set! x (xcoord->algebraic destx))
                (set! y (ycoord->algebraic 2)))))))
      (update-enpassant-target enpassant-target x y))))

(define (possible-piece-move
  board castle-allowed enpassant-target cell-lists sourcex sourcey)
  (let
    ((piece-type (get-piece-type board sourcex sourcey))
     (piece-color (get-piece-color board sourcex sourcey)))
    (if (char=? piece-type #\P)
      (pawn-move
        board enpassant-target cell-lists
        sourcex sourcey piece-color)
      (if (char=? piece-type #\N)
        (knight-move
          board cell-lists
          sourcex sourcey piece-color)
        (if (char=? piece-type #\B)
          (bishop-move
            board cell-lists
            sourcex sourcey piece-color)
          (if (char=? piece-type #\R)
            (rook-move
              board cell-lists
              sourcex sourcey piece-color)
              (if (char=? piece-type #\Q)
                (queen-move
                  board cell-lists
                  sourcex sourcey piece-color)
                (if (char=? piece-type #\K)
                  (king-move
                    board castle-allowed cell-lists
                    sourcex sourcey piece-color)))))))))

(define (legal-move?
  board castle-allowed enpassant-target enpassant sourcex sourcey destx desty)
  (let
    ((attacks (make-cell-lists)))
    (init-cell-lists attacks)
    (possible-piece-move board castle-allowed enpassant-target
      attacks sourcex sourcey)
    (vector-set! enpassant 0
      (current-move-is-enpassant?
        board enpassant-target attacks sourcex sourcey destx desty))
    (set-enpassant-target
      board enpassant-target sourcex sourcey destx desty)
    (destination-in-cell-lists? attacks (xy->idx destx desty))))

(define (all-attacks board castle-allowed enpassant-target
  cell-lists pieces-color)
  (do ((y 0 (+ y 1))) ((= y 8))
    (do ((x 0 (+ x 1))) ((= x 8))
      (if (char=? pieces-color (get-piece-color board x y))
        (possible-piece-move board castle-allowed enpassant-target
          cell-lists x y)))))

(define (mark-piece board enpassant sourcex sourcey destx desty)
  (let
    ((piece (get-piece board sourcex sourcey))
     (piece-color (get-piece-color board sourcex sourcey)))
    (set-piece! board destx desty piece)
    (set-piece! board sourcex sourcey #\.)
    (if enpassant
      (if (char=? piece-color #\W)
        (set-piece! board destx (+ desty 1) #\.)
        (set-piece! board destx (- desty 1) #\.))))) ; black pawn

(define (update-castle-allowed board castle-allowed sourcex sourcey) 
  (let
    ((piece-type (get-piece-type board sourcex sourcey))
     (piece-color (get-piece-color board sourcex sourcey)))
    (if (char=? piece-type #\K)
      (if (char=? piece-color #\W)
        (begin
          (my-string-set! castle-allowed 0 #\.) ; moving white king
          (my-string-set! castle-allowed 1 #\.)) ; moving white king
        (begin
          (my-string-set! castle-allowed 2 #\.) ; moving black king
          (my-string-set! castle-allowed 3 #\.))) ; moving black king
      (if (char=? piece-type #\R)
        (if (char=? piece-color #\W)
          (if (and (= sourcex 7) (= sourcey 7))
            (my-string-set! castle-allowed 0 #\.) ; moving white kingside rook
            (if (and (= sourcex 0) (= sourcey 7))
              (my-string-set! castle-allowed 1 #\.))) ; moving white qside rook
          (if (and (= sourcex 7) (= sourcey 0))
            (my-string-set! castle-allowed 2 #\.) ; moving black kingside rook
            (if (and (= sourcex 0) (= sourcey 0))
              (my-string-set! castle-allowed 3 #\.)))))))) ; moving black qside rook

(define (move-rook-if-castling board sourcex sourcey destx desty)
  (let
    ((piece-type (get-piece-type board sourcex sourcey))
     (piece-color (get-piece-color board sourcex sourcey))
     (dummy #f))
    (if (char=? piece-type #\K)
      (if (char=? piece-color #\W)
        (begin
          (if (and (= sourcex 4) (= sourcey 7) (= destx 6) (= desty 7))
            (mark-piece board dummy 7 7 5 7) ; white castle kingside
            (if (and (= sourcex 4) (= sourcey 7) (= destx 2) (= desty 7))
              (mark-piece board dummy 0 7 3 7)))) ; white castle queenside
        (begin ; black king
          (if (and (= sourcex 4) (= sourcey 0) (= destx 6) (= desty 0))
            (mark-piece board dummy 7 0 5 0) ; black castle kingside
            (if (and (= sourcex 4) (= sourcey 0) (= destx 2) (= desty 0))
              (mark-piece board dummy 0 0 3 0)))))))) ; black castle queenside

(define (mark-promotion board destx desty promote-piece)
  (if (not (char=? promote-piece #\.))
    (set-piece! board destx desty promote-piece)))

(define (attacks-by-same-type-piece
  piece-type color
  sourcex sourcey destx desty
  board all-white-attacks all-black-attacks)
  (let
    ((count 0)
     (alll-attacks '())
     (dest (xy->idx destx desty)))
    (if (char=? color #\W)
      (set! alll-attacks all-white-attacks)
      (set! alll-attacks all-black-attacks))
    (let
      ((attack-count (get-cell-list-count alll-attacks dest)))
      (do ((i 0 (+ i 1))) ((= i attack-count))
        (let
          ((x (idx->x (get-coordinate alll-attacks dest i)))
           (y (idx->y (get-coordinate alll-attacks dest i))))
          (if (char=? (get-piece-type board x y) piece-type)
            (set! count (+ count 1)))))
      (if (= count 1) ; only one piece of same type moves to destination
        0
        (begin
          (set! count 0)
          (do ((i 0 (+ i 1))) ((= i attack-count))
            (let
              ((x (idx->x (get-coordinate alll-attacks dest i)))
               (y (idx->y (get-coordinate alll-attacks dest i))))
              (if (char=? (get-piece-type board x y) piece-type)
                (if (= x sourcex)
                  (set! count (+ count 1))))))
          (if (= count 1) ; only one piece of same type on source file
            1
            (begin
              (set! count 0)
              (do ((i 0 (+ i 1))) ((= i attack-count))
                (let
                  ((x (idx->x (get-coordinate alll-attacks dest i)))
                   (y (idx->y (get-coordinate alll-attacks dest i))))
                  (if (char=? (get-piece-type board x y) piece-type)
                    (if (= y sourcey)
                      (set! count (+ count 1))))))
              (if (= count 1) ; only one piece of same type on source row
                2
                3)))))))) ; must specify source file and row

(define (in-check color board all-white-attacks all-black-attacks)
  (let
    ((alll-attacks '())
     (king #\K)
     (king-idx 0))
    ; locate king
    (if (char=? color #\B)
      (set! king #\k))
    (do ((i 0 (+ i 1))) ((= i BOARD-SIZE))
      (if (char=? (my-string-ref board i) king)
        (set! king-idx i)))
    (set! color (opposite-color color))
    (if (char=? color #\W)
      (set! alll-attacks all-white-attacks)
      (set! alll-attacks all-black-attacks))
    (> (get-cell-list-count alll-attacks king-idx) 0)))

(define (print-algebraic
  board1 castle-allowed1 enpassant-target1
  board2 castle-allowed2 enpassant-target2
  move-number
  piece-type color
  sourcex sourcey destx desty
  attack promotion-piece)
  (let
    ((x1 (xcoord->algebraic sourcex))
     (y1 (ycoord->algebraic sourcey))
     (x2 (xcoord->algebraic destx))
     (y2 (ycoord->algebraic desty))
     (castle 0)
     (all-white-attacks (make-cell-lists))
     (all-black-attacks (make-cell-lists)))

    (init-cell-lists all-white-attacks)
    (init-cell-lists all-black-attacks)

    (all-attacks board1 castle-allowed1 enpassant-target1 all-white-attacks #\W)
    (all-attacks board1 castle-allowed1 enpassant-target1 all-black-attacks #\B)

   (if (= (remainder move-number 2) 0) ; white move
     (begin
       (my-display (+ (quotient move-number 2) 1))
       (my-display ". ")))

  (if (char=? piece-type #\K)
    (if (and (char=? x1 #\e) (char=? y1 #\1))
      (if (and (char=? x2 #\g) (char=? y2 #\1))
        (set! castle 1) ; kingside castle
        (if (and (char=? x2 #\c) (char=? y2 #\1))
          (set! castle 2))) ; queenside castle
      (if (and (char=? x1 #\e) (char=? y1 #\8))
        (if (and (char=? x2 #\g) (char=? y2 #\8))
          (set! castle 1) ; kingside castle
          (if (and (char=? x2 #\c) (char=? y2 #\8))
            (set! castle 2)))))) ; queenside castle

  (if (= castle 1) ; kingside castle
    (my-display "O-O")
    (if (= castle 2) ; queenside castle
      (my-display "O-O-O")
      (begin
        (if (not (char=? piece-type #\P))
          (let
            ((return-value (attacks-by-same-type-piece
              piece-type color sourcex sourcey destx desty
              board1 all-white-attacks all-black-attacks)))
            (if (= return-value 0)
              (begin
                (set! x1 #\0)
                (set! y1 #\0))
              (if (= return-value 1)
                (set! y1 #\0)
                (if (= return-value 2)
                  (set! x1 #\0))))
        
            (my-display piece-type))
          (begin ; else pawn
            (set! y1 #\0)
            (if (not attack)
              (set! x1 #\0))))

        (if (not (char=? x1 #\0))
          (my-display x1))
        (if (not (char=? y1 #\0))
          (my-display y1))
        (if attack (my-display "x"))
        (my-display x2)
        (my-display y2)
        (if (not (char=? promotion-piece #\.))
          (begin
            (my-display "=")
            (my-display (char-upcase promotion-piece)))))))

  ; test for check

  (init-cell-lists all-white-attacks)
  (init-cell-lists all-black-attacks)

  (all-attacks board2 castle-allowed2 enpassant-target2 all-white-attacks #\W)
  (all-attacks board2 castle-allowed2 enpassant-target2 all-black-attacks #\B)

  (if (in-check ; ???? do checkmate too
       (opposite-color color)
       board2 all-white-attacks all-black-attacks)
    (my-display "+"))))

(define (chess-move-inner
  board color castle-allowed enpassant-target
  half-move-clock full-move
  sourcex sourcey destx desty promote-piece)
  (if (not (char=? color (get-piece-color board sourcex sourcey)))
    #f ; fail
    (let
      ((enpassant (make-vector 1)))
      (vector-set! enpassant 0 #f)
      (if (legal-move?
        board castle-allowed enpassant-target enpassant
        sourcex sourcey destx desty)
        (begin
          (update-castle-allowed board castle-allowed sourcex sourcey) 
          (move-rook-if-castling board sourcex sourcey destx desty)
          (mark-piece board (vector-ref enpassant 0)
            sourcex sourcey destx desty)
          (mark-promotion board destx desty promote-piece)
          #t)
        #f)))) ; fail

(define (chess-move
  board color castle-allowed enpassant-target
  half-move-clock full-move
  sourcex sourcey destx desty promote-piece)
  (let
    ((board2 (my-string-copy board))
     (castle-allowed2 (my-string-copy castle-allowed))
     (enpassant-target2 (my-string-copy enpassant-target)))
    (if (chess-move-inner
      board2 color castle-allowed2 enpassant-target2
      half-move-clock full-move
      sourcex sourcey destx desty promote-piece)
      (let
        ((all-white-attacks (make-cell-lists))
         (all-black-attacks (make-cell-lists)))
        (init-cell-lists all-white-attacks)
        (init-cell-lists all-black-attacks)
        (all-attacks
          board2 castle-allowed2 enpassant-target2 all-white-attacks #\W)
        (all-attacks
          board2 castle-allowed2 enpassant-target2 all-black-attacks #\B)
        (if (in-check
             color
             board2 all-white-attacks all-black-attacks)
      ; (if #f
          #f ; in check after trying to move
          ; otherwise make the move for real
          (chess-move-inner
            board color castle-allowed enpassant-target
            half-move-clock full-move
            sourcex sourcey destx desty promote-piece)))
      #f))) ; fail
