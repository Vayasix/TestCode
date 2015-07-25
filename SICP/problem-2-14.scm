(define (make-interval a b) (cons a b)) 
(define (upper-bound interval) (max (car interval) (cdr interval))) 
(define (lower-bound interval) (min (car interval) (cdr interval))) 
(define (center i) (/ (+ (upper-bound i) (lower-bound i)) 2)) 
  
;; Percent is between 0 and 100.0 
(define (make-center-percent c pct) 
  (let ((width (* c (/ pct 100.0)))) 
	(make-interval (- c width) (+ c width)))) 


(define (percent-tolerance i) 
  (let ((center (/ (+ (upper-bound i) (lower-bound i)) 2.0)) 
		(width (/ (- (upper-bound i) (lower-bound i)) 2.0))) 
	(* (/ width center) 100))) 
  

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
				 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (upper-bound x) (lower-bound y))
				 (- (lower-bound x) (upper-bound y))))

(define (mul-interval x y) 
  (let ((p1 (* (lower-bound x) (lower-bound y))) 
        (p2 (* (lower-bound x) (upper-bound y))) 
        (p3 (* (upper-bound x) (lower-bound y))) 
		(p4 (* (upper-bound x) (upper-bound y)))) 
	(make-interval (min p1 p2 p3 p4) 
                   (max p1 p2 p3 p4)))) 

(define (div-interval x y)
  (mul-interval x (make-interval (/ 1.0 (upper-bound y))
								 (/ 1.0 (lower-bound y)))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
				(add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))))


(define A (make-interval 92 94))
(define B (make-interval 123 129))
(define C (make-center-percent 93 0.4))
(define D (make-center-percent 126 0.2))

#?=(par1 A B)
#?=(par2 A B)
#?=(par1 C D)
#?=(par2 C D)
(newline)
#?=(div-interval A A)
#?=(div-interval A B)
