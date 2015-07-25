;consの定義
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
;car は対が2で割り切れなくなるまで2で割る回数を返す
(define (car c)
  (define (iter x count)
	(if (> (abs (remainder x 2)) 0)
	  count
	  (iter (/ x 2) (+ count 1))))
  (iter c 0))
;同様にcdr は３について
(define (cdr c)
  (define (iter x count)
	(if (> (abs (remainder x 3)) 0)
	  count
	  (iter (/ x 3) (+ count 1))))
  (iter c 0))

;car & cdr をもう一段、抽象化
(define (pair c n)
  (define (iter x count)
	(if (> (abs (remainder x n)) 0)
	  count
	  (iter (/ x n) (+ count 1))))
  (iter c 0))

(define (car c)
  (pair c 2))
(define (cdr c)
  (pair c 3))


