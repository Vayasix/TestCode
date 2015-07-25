;  https://github.com/t4ku/SICP-with-Comments-Ja/blob/master/ch1_abstractions_with_procedures/1-2-6_testing_for_primality.scm

(define (expmod base exp m)
  (cond ((= exp 0) 1)
		((even? exp)
		 (remainder (square (expmod base (/ exp 2) m)) m))
		(else 
		  (remainder (* base (expmod base (- exp 1) m)) m))))

(use srfi-27)
(define (fermat-test n)
  (define (try-it a)
	(= (expmod a n n) a))
  (try-it (random-integer n)))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
		((fermat-test n) (fast-prime? n (- times 1)))
		(else #f)))
(define (square x) (* x x))

#?= (fast-prime? 487 10)

