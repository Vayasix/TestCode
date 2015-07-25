(define (scale-tree tree factor)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(define nil '())

(define (scale-tree-mapver tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-treetree)
           (scale-tree-mapver sub-tree factor)
           (* sub-tree factor)))
       tree))


(display x)
(newline)
(display (scale-tree x 10))
(newline)
(display (scale-tree-mapver x 10))
