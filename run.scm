
(define (read-token)
  (let
    ((symbol (read)))
    (if (not (eof-object? symbol))
      (if (symbol? symbol)
        (symbol->string symbol)
        symbol)))) ; presumably a number now

(define (run)
  (display-ascii-board (vector-ref move 0))
  (my-newline)
  (my-display "> ")
  (let
    ((token (read-token)))
    (if (not (eof-object? token))
      (begin
        (cond
          ((= (string-length token) 4)
            (make-move
              (algebraic->xcoord (string-ref token 0))
              (algebraic->ycoord (string-ref token 1))
              (algebraic->xcoord (string-ref token 2))
              (algebraic->ycoord (string-ref token 3))))
          ((string=? token "<")
            (goBackward))
          ((string=? token ">")
            (goForward))
          ((string=? token "<<")
            (gotoFirst))
          ((string=? token ">>")
            (gotoLast))
          ((string=? token "fen2pgn")
            (fen2pgn move-log 0 move-idx))
          ((string=? token "fen")
            (fen move-log))
          ((string=? token "examples")
            (setExample))
          ((string=? token "analyze")
            (analyze))
          ((string=? token "plies")
            (set! plys (read-token))) ; ???? check for number
          ((string=? token "new")
            (setNew)))
        (run)))))

(run)
