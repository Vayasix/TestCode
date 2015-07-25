
(define (enumerate-interval low high)
  (if (> low high) 
	nil
	(cons low (enumerate-interval (+ low 1) high))))
(define nil '())

;test
(display (enumerate-interval 1 4))

(newline)

(display "test")
;test
(newline)
(display
  (map (lambda (i)
		 (map (lambda (j) (list i j))
			  (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 6)))

(newline)

(display
  (map (lambda (i)
		 (map (lambda (j) (list j i))
			  (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 6)))

(newline)


(display 
  (map (lambda (i)
		 (map (lambda (j) (list i j))
			  (enumerate-interval (+ i 1) 6)))
	   (enumerate-interval 1 6)))
(newline)


(display
  (map (lambda (i)
		 (map (lambda (j) (list j i))
			  (enumerate-interval (+ i 1) 6)))
	   (enumerate-interval 1 6)))

(newline)


(display "test finish")
(newline)
(newline)





(define (accumulate op initial sequence)
  (if (null? sequence)
	initial
	(op (car sequence)
		(accumulate op initial (cdr sequence)))))

(define (unique-paires j i)
  (accumulate append
			'()
			(map (lambda (x)
				   (map (lambda (y)
						  (list x y))
						(enumerate-interval (+ x 1) i)))
				 (enumerate-interval j i))))

;test
(display (unique-paires 1 4))

(newline)









(define (prime-sum-pairs n)
  (map make-pair-sum
	   (filter prime-sum?
			   (flatmap
				 (lambda (i)
				   (map (lambda (j) (list i j))
						(enumerate-interval 1 (- i 1))))
				 (enumerate-interval 1 n)))))

;以下必要な部品
(use srfi-1)
(define (make-pair-sum pair)
  (let ((i (car pair))
		(j (cadr pair)))
	(list i j (+ i j))))


(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))

(define (square x) (* x x))
(define (divides? a b)
  (= (remainder b a) 0))


(define (prime-sum-pairs n)
  (map make-pair-sum
	   (filter prime-sum?
			   (unique-paires 1 n))))






(newline)
;output
(display (prime-sum-pairs 4))
(newline)
