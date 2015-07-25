(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* h k))))
  (define (simpson-term k)
	(* (cond ((or (= k 0) (= k n)) 1)
			 ((odd? k) 4)
			 (else 2))
	   (yk k)))
  (* (/ h 3) (sum simpson-term 0 inc n)))

(define (sum term a next b)
  (if (> a b)
	0
	(+ (term a) (sum term (next a) next b))))

(define (cube x) (* x x x))
(define (inc x) (+ x 1))

(display (simpson-integral cube 0 1 100))
(newline)
(display (simpson-integral cube 0 1 1000))
