(define (btree-count lst)
  (cond
    ((null? lst) 0)
    ((number? (car lst))
      (+ 1 (btree-count (cdr lst))))
    ((pair? (car lst))
      (+ (btree-count (car lst)) (btree-count (cdr lst))))
    (else
      (btree-count (cdr lst)))))

(define (btree-get-max lst n)
  (if (null? lst)
    n
    (if (> (car lst) n)
      (btree-get-max (cdr lst) (car lst))
      (btree-get-max (cdr lst) n))))

(define (btree-get-sum lst)
  (if (null? lst)
    0.0
    (+ (btree-get-sum (cdr lst)) (car lst))))

(define (btree-correct-accumulate-sum lst)
  (reverse (cons 100.0 (reverse (cdr lst)))))

(define (btree-accumulate-sum lst sum)
  (if (null? lst)
    '()
    (cons sum (btree-accumulate-sum (cdr lst) (+ sum (car lst))))))

(define (btree-select-random-child n r lst)
  (if (null? lst) ;  cant really happen
    0
    (if (< r (car lst))
      n
      (btree-select-random-child (+ n 1) r (cdr lst)))))

(define (btree-make-node value)
  (list value '()))

(define (btree-get-node-value node)
  (car node))

(define (btree-get-children node)
  (cadr node))

(define (btree-has-children? node)
  (not (null? (btree-get-children node))))

(define (btree-get-children-values children)
  (if (null? children)
    '()
    (let
      ((child (car children)))
      (cons (btree-get-node-value child)
            (btree-get-children-values (cdr children))))))

(define (btree-get-children-weights children)
  (if (null? children)
    '()
    (let
      ((child (car children)))
      (cons (+ 1 (btree-count (btree-get-children child)))
            (btree-get-children-weights (cdr children))))))

(define (map-weights weights m)
  (if (null? weights)
    '()
    (cons (/ (car weights) m) (map-weights (cdr weights) m))))

(define (btree-normalize-weights weights)
  (let
    ((m (btree-get-sum weights)))
    (map-weights weights m)))

(define (btree-node-equal? node1 node2)
  (equal? (btree-get-node-value node1)
     (btree-get-node-value node2)))

(define (btree-member? node children)
  (if (null? children)
    #f
    (if (btree-node-equal? node (car children))
      children
      (btree-member? node (cdr children)))))

(define (btree-insert-child-node! node child-node)
  (let
    ((children (btree-get-children node)))
    (if (null? children)
      (set-car! (cdr node) (list child-node)) ; set first child
      (let
        ((children (cons child-node children))) ; insert to head of children
        (set-car! (cdr node) children)))))

(define (btree-make-line tree list-of-values)
  (if (null? list-of-values)
    tree
    (let
      ((node (btree-make-node (car list-of-values))))
      (btree-insert-child-node! tree node)
      (btree-make-line node (cdr list-of-values))
      tree)))

(define (btree-add-line tree line)
  (if (not (null? line))
    (let
      ((line-children (btree-get-children line))
       (tree-children (btree-get-children tree)))
      (if (not (null? line-children))
        (let
          ((line-child (car line-children)))
          (let
            ((match (btree-member? line-child tree-children)))
            (if match
              (btree-add-line (car match) line-child)
              (btree-insert-child-node! tree line-child))))))))

(define (btree-find-line tree line)
  (if (null? line)
    '()
    (let
      ((line-children (btree-get-children line))
       (tree-children (btree-get-children tree)))
      (if (null? line-children)
        (let
          ((subtree-children (btree-get-children tree)))
          (if (null? subtree-children) ; line not found
            '()
            (let
              ((children-values (btree-get-children-values subtree-children))
               (n (btree-select-random-child
                 0
                 (random)
                 (btree-correct-accumulate-sum
                   (btree-accumulate-sum
                     (btree-normalize-weights
                       (btree-get-children-weights subtree-children))
                     0.0)))))
              (list-ref children-values n))))
        (let
          ((line-child (car line-children)))
          (let
            ((match (btree-member? line-child tree-children)))
            (if match
              (btree-find-line (car match) line-child)
              '())))))))
