(define x (list (list 1 2) (list 3 4)))

(define nil '())

(define (fringe items)
  (cond ((null? items) nil)
        ((not (pair? items)) (list items))
        (else
          (append (fringe (car items))
                  (fringe (cdr items))))))


(display (fringe x))
(newline)
(display (fringe (list x x)))
