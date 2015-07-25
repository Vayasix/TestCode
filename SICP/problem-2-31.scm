(define (square-tree tree)
  (tree-map square tree))

(define (tree-map proc tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))

(define (tree-map-mapver proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (tree-map-mapver proc sub-tree)
           (proc sub-tree)))
       tree))


