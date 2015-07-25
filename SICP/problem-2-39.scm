(define (old_reverse items)
  (define (iter items result)
	(if (null? items)
	  result
	  (iter (cdr items)
			(cons (car items) result))))
  (iter items nil))
(define nil '())

(define (new_reverse_1 sequence)
  (fold-right (lambda (x y)
				(append y (list x)))
			  nil
			  sequence))

(define (new_reverse_2 sequence)
  (fold-left (lambda (x y)
			   (cons y x))
			 nil
			 sequence))

(define seq (list 1 2 3 4 5))

(display (new_reverse_1 seq))
(newline)
(display (new_reverse_2 seq))

;append は、つなげる二つの引数の１つめがlist構造であればいい
;cons は、２つめがlist構造であれば、そのまま結合
;以下例
;gosh> (append (list 3 2) 1)
;   (3 2 . 1)
;gosh> (cons (list 3 2) 1)
;	((3 2) . 1)
;gosh> (cons 3 (list 2 1))
;	(3 2 1)

