(define nil '())
(define (square x) (* x x))


(define (map proc items)
  (if (null? items)
	nil
	(cons (proc (car items))
		  (map proc (cdr items)))))

(define x (list 1 2 3 4 5))

(display (map square x))
(newline)

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
		((predicate (car sequence))
		 (cons (car sequence)
			   (filter predicate (cdr sequence))))
		(else (filter predicate (cdr sequence)))))

(display (filter odd? x))
(newline)

(define (accumulate op initial sequence)
  (if (null? sequence)
	initial
	(op (car sequence)
		(accumulate op initial (cdr sequence)))))

(display (accumulate + 0 x))
(newline)
(display (accumulate * 1 x))
(newline)

(define (enumerate-interval low high)
  (if (> low high)
	nil
	(cons low (enumerate-interval (+ low 1) high))))

(display (enumerate-interval 2 7))
(newline)

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
		((not (pair? tree)) (list tree))
		(else
		  (append (enumerate-tree (car tree))
				  (enumerate-tree (cdr tree))))))

(display (enumerate-tree (list 1 (list 2 (list 3 4)) 5)))

(newline)

(define (sum-odd-squares tree)
  (accumulate + 0 (map square (filter odd? (enumerate-tree tree)))))

(define (even-fibs n)
  (accumulate cons nil (filter even? (map fib (enumerate-interval 0 n)))))


(define (list-fib-squaresn n)
  (accumulate cons nil (map square (map fib (enumerate-interval 0 n)))))

(display (list-fib-squaresn 10))
(newline)

(define (product-of-squares-of-odd-elements sequence)
  (accumulate * 1 (map square (filter odd? sequence))))

(display (product-of-squares-of-odd-elements x))

(newline)


;(define (salary-of-highest-paid-programmer records)
 ; (accumulate max 0 (map salary (filter programmer? records))))


