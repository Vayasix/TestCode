区間の幅（width）は上限と下限の差の半分である。幅は区間で規定した数の不確かさの量である。

算術演算のあるものには、2つの区間から作った結果の幅は、引数の幅だけの関数であり、他のものには、結果の幅は引数の区間の幅の関数にはならない。

2つの区間の和（または差）の幅は、足されるべき（または引かれるべき）区間の幅だけの関数であることを示せ。

乗算と除算についてはこれが成り立たないことを例で示せ。


【解答】

定義から順序立てて考えていこう。まずは *-bound 演算を適用した値を、見やすさの為に次のように定義する。

(lower-bound x)         → x_l
(upper-bound x)         → x_u
(lower-bound y)         → y_l
(upper-bound y)         → y_u
xの区間の幅 = x_u - x_l → dx
yの区間の幅 = y_u - y_l → dy
まずは加算演算から。

;区間オブジェクトの和算
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))
上の手続きによって、make-interval が生成する区間は、

(x_l + y_l , x_u + y_u)
この区間の幅は次のように記述できる。

区間の幅 = (x_u + y_u) - (x_l + y_l)
         = (x_u - x_l) + (y_u - y_l)
         = dx + dy
同様に減算も同じ考え方をすると、

;区間オブジェクトの減算
(define (sub-interval x y)
    (make-interval (- (upper-bound x) (lower-bound y))
		   (- (lower-bound x) (upper-bound y))))
区間 = (x_u - y_l , x_l - y_u)
区間の幅を求めると、

区間の幅 = (x_l - y_u) - (x_u - y_l)
         = - (x_u - x_l) - (y_u - y_l)
         = - dx - dy
※2010/04/03追記

やっべ～、乗算と除算やるの忘れてた。。

まずは乗算から。

問題の解き方としては、「生成される区間の幅が、x、y の区間の幅だけに依存しない」、

即ち、「dx、dy だけで表現できない」ケースを１つでも示せれば命題を満たすことになる。

;区間オブジェクトの乗算
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
区間の幅を求めるには、p1～p4 がどう表現できるかを調べる必要がある。

というわけでやってみよう。

p1 = x_l * y_l
p2 = x_l * y_u
p3 = x_u * y_l
p4 = x_u * y_u
１つでも例を提示できればよいので、一番単純な x、y の区間が共に正の領域の区間であるケースを考えると、

p1～p4 の最小値 = p1 = x_l * y_l
p1～p4 の最大値 = p4 = x_u * y_u
従って、

区間 = (x_l * y_l , x_u * y_u)
区間の幅を求めると、

区間の幅 = (x_u * y_u) - (x_l * y_l)
         = ... dx, dy のみの表現に変換できない。。
故に命題は示せた。

次は除算。

;区間オブジェクトの除算
(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))
次のように新しい変数を定義しよう。

y'_l = 1 / y_u
y'_u = 1 / y_l
y' = (y'_l . y'_u)
こいつを使って 上述のケースにおける mul-interval を評価すると、

区間の幅 = (x_u * y'_u) - (x_l * y'_l)
更に y'_l、y'_u の表現を y_l、y_u の表現に戻してやる。

区間の幅 = (x_u * (1/y_u)) - (x_l * (1/y_l))
これも、dx、dy のみの表現に変換できないので命題は示せたことになる。
