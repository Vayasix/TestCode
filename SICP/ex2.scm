(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))

#?= (prime? 47)

(find-divisor 47 2)
->((> (square 2) 47) 47)
->((divides? 2 47) 2)
->((else (find-divisor 47 (+ 2 1))))●
->(find-divisor 47 3)

