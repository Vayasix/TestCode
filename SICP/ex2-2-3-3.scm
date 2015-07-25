
; n = 6のとき
(define (enumerate-interval low high)
  (if (> low high) 
	nil
	(cons low (enumerate-interval (+ low 1) high))))

(define nil '())
(define / newline)
(define d display)


(d
(map (lambda (i)
	   (enumerate-interval 1 (- i 1)))
	 (enumerate-interval 1 6))
)

(/)
;対(i, j)を生成する
(d
(map (lambda (i)
	   (map (lambda (j) (list i j))
			(enumerate-interval 1 (- i 1))))
	 (enumerate-interval 1 6))
)



(/)

(define (accumulate op initial seq)
  (if (null? seq)
    initial
    (op (car seq)
        (accumulate op initial (cdr seq)))))

;appendでアキュムレーとする
(define x
(accumulate append
            nil
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 6)))
)

(/)
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

;ここからprime-sum?のメソッド
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
  (= 0 (remainder b a)))

(display (filter prime-sum? x))


;これらの段取りを全て一つにまとめると以下
;->flatmap
;->filter
;->make-pair
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                 (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 n)))))
(/)
(display (prime-sum-pairs 6))

(/)



;ここから順列生成問題
(define (permutations s)
  (if (null? s)
    (list nil)
    (flatmap (lambda (x) 
               (map (lambda (p) (cons x p))
                    (permutations (remove x s))))
             s)))


(define (remove item seq)
  (filter (lambda (x) (not (= x item)))
          seq))


(display (permutations (list 1 2 3)))
