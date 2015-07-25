
(define (square-list items)
  (define (iter things answer)
    (if (null? #?=things)
	#?=answer
	(iter (cdr things)
	      (cons (expt (car things) 2)
		    #?=answer))))
  (iter items nil))


(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons answer
                   (expt (car things) 2)))))
  (iter items nil))

(define (square-list-3 items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (append answer
                  (list (square (car things)))))))
  (iter items nil))



(define nil '())
(define (square x) (* x x))
(define a (list 1 2 3 4))
(newline)
(newline)
(display (square-list a))
(newline)
(display (square-list-2 a))
(newline)
(display (square-list-3 a))
