(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  ((> (square test-divisor) n) n)
  ((divides? test-divisor n) test-divisor)
  (else (find-divisor n (next test-divisor))))

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

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

(define (next x)
  (if (= x 2)
    3
    (+ x 2)))

(timed-prime-test 1009)
