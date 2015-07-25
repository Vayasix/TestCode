"
(define (square x) (* x x))

(define (expand base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expand base (/ exp 2) m)) m))
        (else
          (remainder (* base (expand base (- exp 1) m)) m))))

(define (fermat-test-v2 n)
  (define (try-it a)
    (= (expand a n n) a))
  (define (check a)
    (if (= a 1)
      #t
      (and (try-it a)
           (check (- a 1)))))
  (check (- n 1)))

(display ""fermat-test-v2"")
(newline)
(display ""Cormichael numbers:"")
(newline)
(display ""561,1105,1729,2465,2821,6601"")
   (newline)
   (display (fermat-test-v2 561))  ;; => #t
   (display (fermat-test-v2 1105)) ;; => #t
   (display (fermat-test-v2 1729)) ;; => #t
   (display (fermat-test-v2 2465)) ;; => #t
   (display (fermat-test-v2 2821)) ;; => #t
   (display (fermat-test-v2 6601)) ;; => #t
   (newline)
"
 (define (square x) (* x x)) 
  
 (define (expmod base exp m) 
   (cond ((= exp 0) 1) 
         ((even? exp) 
          (remainder (square (expmod base (/ exp 2) m)) 
                     m)) 
         (else 
          (remainder (* base (expmod base (- exp 1) m)) 
                     m))))         
 (define true #t)
 (define false #f)

 (define (full-fermat-prime? n) 
   (define (iter a n) 
     (if (= a n) true 
         (if (= (expmod a n n) a) (iter (+ a 1) n) false))) 
   (iter 1 n)) 
  
 (define (test-fermat-prime n expected) 
   (define (report-result n result expected) 
     (newline) 
     (display n) 
     (display ": ") 
     (display result) 
     (display ": ") 
     (display (if (eq? result expected) "OK" "FOOLED"))) 
   (report-result n (full-fermat-prime? n) expected)) 
  
 (test-fermat-prime 2 true) 
 (test-fermat-prime 13 true) 
 (test-fermat-prime 14 false) 
  
 (test-fermat-prime 561 false)  ; Carmichael number 
 (test-fermat-prime 1105 false) ; Carmichael number 
 (test-fermat-prime 1729 false) ; Carmichael number 
 (test-fermat-prime 2465 false) ; Carmichael number 
 (test-fermat-prime 2821 false) ; Carmichael number 
 (test-fermat-prime 6601 false) ; Carmichael number 
 
