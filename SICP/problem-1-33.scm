(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b) 
	null-value
	(if (filter a)
	  (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))
	  (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter)))))

(define (smallest-div n)
  (define (divides? a b)
	(= 0 (remainder b a)))
  (define (find-div n test)
	(cond ((> (sq test) n) n) 
		  ((divides? test n) test)
		  (else (find-div n (+ test 1)))))
  (find-div n 2))

(define (prime? n)
  (if (= n 1)
	#f
	(= n (smallest-div n))))

(define (sum-of-prime-squares a b)
  (filtered-accumulate + 0 sq a inc b prime?))

(define (gcd m n)
  (cond ((< m n) (gcd n m))
		((= n 0) m)
		(else (gcd n (remainder m n)))))

(define (relative-prime? m n)
  (= (gcd m n) 1))

(define (product-of-relative-primes n)
  (define (filter x)
	(relative-prime? x n))
  (filtered-accumulate * 1 identity 1 inc n filter))

(define (inc x) (+ x 1))
(define (identity x) x)
(define (sq x) (* x x))

(display (product-of-relative-primes 10))
(newline)
(display (sum-of-prime-squares 1 5))
