(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
		((not (pair? tree)) 
		 (if (odd? tree) (square tree) 0))
		(else
		  (+ (sum-odd-squares (car tree))
			 (sum-odd-squares (cdr tree))))))

(define (square x) (* x x))
(define nil '())

(define (even-fibs n)
  (define (next k)
	(if (> k n)
	  nil
	  (let ((f (fib k)))
		(if (even? f)
		  (cons f (next (+ k 1)))
		  (next (+ k 1))))))
  (next 0))


(define (filter predicate seq)
  (cond ((null? seq) nil)
		((predicate (car seq))
		 (cons (car seq)
			   (filter predicate (cdr seq))))
		(else (filter predicate (cdr seq)))))

(define (accumulate op initial seq)
  (if (null? seq)
	initial
	(op (car seq)
		(accumulate op initial (cdr seq)))))

(define (enumerate-interval low high)
  (if (> low high)
	nil
	(cons low (enumerate-interval (+ low 1) high))))


(define (enumerate-tree tree)
  (cond ((null? tree) nil)
		((not (pair? tree)) (list tree))
		(else (append (enumerate-tree (car tree))
					  (enumerate-tree (cdr tree))))))


(define (sum-odd-squares tree)
  (accumulate +
			  0
			  (map square
				   (filter odd?
						   (enumerate-tree tree)))))

(define (even-fibs n)
  (accumulate cons
			  nil
			  (filter even?
				   (map fibonacci
						(enumerate-interval 0 n)))))


(define (list-fib-squares n)
  (accumulate cons
			  nil
			  (map square
				   (map fibonacci
						(enumerate-interval 0 n)))))



(define (fibonacci n)
    (cond ((= n 0) 0) 
		  ((= n 1) 1)
		  (else 
			(+ (fibonacci (- n 2)) 
			   (fibonacci (- n 1))))))

(define (fibo cn n)
  (if (> cn n)
	nil
	(cons (fibonacci cn)
		  (fibo (+ cn 1) n))))

(define (fib n)
  (fibo 0 n))



;並びの中の奇数の二乗の積の計算に使える:
(define (product-of-squares-of-odd-elements seq)
  (accumulate *
			  1
			  (map square
				   (filter odd? seq))))
  

(define tree (list 1 2 3 4 5 6 7))

(display (sum-odd-squares tree))
(newline)
(display (even-fibs 10))
(newline)
(display (list-fib-squares 10))
(newline)
(display (product-of-squares-of-odd-elements tree))
(newline)

