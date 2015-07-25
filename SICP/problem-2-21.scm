(define (square-list items)
  (if (null? items)
      '()
      (cons (expt (car items) 2)
	    (square-list (cdr items)))))

(define (square-list-2 items)
  (map (lambda (item) (expt item 2)) items))

(define a (list 1 2 3 4))

(display (square-list a))
