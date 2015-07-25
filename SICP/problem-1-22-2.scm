(use srfi-19)
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (time-difference (current-time) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;最少の序数を求める
(define (smallest-divisor n)
  (find-divisor n 2))

;除数を求める処理
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

;除数かどうかの判別処理
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x)
  (* x x))

(define (search-for-primes idx max)
  (cond ((even? idx) (search-for-primes (+ idx 1) max))
        ((> idx max) #f)
        (else
         (begin
           (timed-prime-test idx)
           (search-for-primes (+ idx 2) max)))))


(search-for-primes 1000 1020)
(search-for-primes 10000 10040)
(search-for-primes 100000 100050)
(search-for-primes 1000000 1000050)

