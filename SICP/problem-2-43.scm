(define (queens board-size)
  (define queen-cols-count 0)
  (define (queen-cols k)
	(set! queen-cols-count (+ 1 queen-cols-count))
	(print "queen-cols k:" k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (print "filter positions: " positions)(safe? k positions))
         (flatmap
		   (lambda (new-row)
			 (print " map new-row:" new-row)
			 (map (lambda (rest-of-queens)
					(print " flat-map rests-of-queens:" rest-of-queens)
					(adjoin-position new-row k rest-of-queens))
				  (queen-cols (- k 1))))
		   (enumerate-interval 1 board-size)))))
  (queen-cols board-size)
  (print queen-cols-count))

(define (safe? k lis)
  (if (null? lis)
      #t
      (let loop ((head (car lis))
		 (body (cdr lis))
		 (count 1))
	(cond ((null? body) #t)
	      ((or (= head (car body))
		   (= head (+ (car body) count))
		   (= head (- (car body) count)))
	       #f)
	      (else
	       (loop head (cdr body) (+ 1 count)))))))

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))


(define empty-board ())
(define nil ())
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (enumerate-interval low high)
  (if (> low high)
	nil
	(cons low (enumerate-interval (+ low 1) high))))
(define (accumulate op initial seq)
  (if (null? seq)
	initial
	(op (car seq)
		(accumulate op initial (cdr seq)))))


(display (queens 4))
(newline)
(newline)
(newline)
;(display (queens 8))
(newline)
(newline)


