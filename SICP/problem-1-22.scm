(use srfi-19)

(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time)))

(define (start-prime-test n start-time)
  (if (prime? n)
	(report-prime (time-difference (current-time) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;最小の序数を求める
(define (smallest-divisor n)
  (find-divisor n 2))

;除数を求める処理
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))

;除数かどうかの判断処理
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))


;指定範囲の連続する奇整数について素数性を調べる
(define (search-for-primes start end)
  (cond ((even? start) (search-for-primes (+ start 1) end))
        ((> start end) #f)
        (else
         (begin
           (time-prime-test start)
           (search-for-primes (+ start 2) end)))))
(define (even? n)
  (= (remainder n 2) 0))

#?=(search-for-primes 1000 1020)

