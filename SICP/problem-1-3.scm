;code/problem-1-3.scm

(define (square x) (* x x))
(define (sum-of-squares x y)
    (+ (square x) (square y)))

(define (problem-1-3 x y z)
    (cond ((and (< x y) (< x z)) (sum-of-squares y z)) ;xが最小
          ((and (< y x) (< y z)) (sum-of-squares x z)) ;yが最小
          (else (sum-of-squares x y)) ))
#?=(problem-1-3 1 2 3)
;#?=(problem-1-3 2 1 3)
;#?=(problem-1-3 3 2 1)
