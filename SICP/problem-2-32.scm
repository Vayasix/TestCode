;集合は相異る要素のリストで表現出来る. また, 集合のすべての部分集合の集合を, リストのリストで表現出来る. 例えば集合が(1 2 3)の時, すべての部分集合の集合は(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))である. 集合の部分集合の集合を作り出す手続きの次の定義を完成し, なぜうまくいくか, 明快に説明せよ.

(define nil '())

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(display (subsets (list 1 2 3)))
(newline)
(display (subsets '()))
(newline)
(display (subsets '(3)))
(newline)
(display (subsets '(2 3)))
(newline)
(display (subsets '(1 2 3)))
