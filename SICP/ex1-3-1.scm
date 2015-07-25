(define (sum-integers a b)
  (if (> a b)
	0
	(+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
	0
	(+ (cube a) (sum-cubes (+ a 1) b))))
(define (cube a) (* a a a))


(define (pi-sum a b)
  (if (> a b)
	0
	(+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))



(define (sum term a next b)
  (if (> a b)
	0
	(+ (term a) (sum term (next a) next b))))


(define (pi-sum a b)
  (define (pi-term x)
	(/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
	(+ x 4))
  (sum pi-term a pi-next b))


(define (inc n) (+ n 1))

(define (identity x) x)


(define (sum-integers a b)
  (sum identity a inc b))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))




(display (sum-integers 1 5))
(newline)
(display (sum-cubes 1 4))
(newline)
(display (* 8 (pi-sum 1 1000)))
(newline)
(display (integral cube 0 1 0.01))
(newline)
