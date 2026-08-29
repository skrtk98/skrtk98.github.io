## コンパクト化

局所コンパクト Hausdorff 空間では一点コンパクト化を構成でき, Tychonoff 空間では Stone-Čech コンパクト化が有界連続関数の延長を特徴づける.

### 一点コンパクト化

Definition. **一点コンパクト化**
:   非コンパクトな局所コンパクト Hausdorff 空間 $`X`$ と $`X`$ に属さない一点 $`\infty`$ に対して,
    ```math
    X^+\coloneqq X\sqcup\{\infty\}
    ```
    とおく.
    $`U\subseteq X^+`$ が開であるとは, $`U\cap X`$ が $`X`$ で開であり, かつ $`\infty\in U`$ ならば $`X\setminus(U\cap X)`$ がコンパクトであることとする.
    この位相空間 $`X^+`$ を $`X`$ の **一点コンパクト化** (*one-point compactification*) という.

Theorem. **一点コンパクト化の性質**
:   $`X^+`$ はコンパクト Hausdorff 空間である.
    $`X`$ は $`X^+`$ の稠密な開部分空間であり, $`X^+\setminus X=\{\infty\}`$ である.

<u>proof.</u>
:   $`X^+`$ の開被覆をとり, $`\infty`$ を含む被覆要素を $`U`$ とする.
    定義から $`K=X\setminus(U\cap X)`$ はコンパクトである.
    被覆の残りは $`K`$ の開被覆を与えるので, 有限部分被覆を持つ.
    これに $`U`$ を加えると $`X^+`$ の有限部分被覆となる.
    よって $`X^+`$ はコンパクトである.

    $`X`$ の異なる二点は $`X`$ の Hausdorff 性により $`X^+`$ においても分離できる.
    $`x\in X`$ に対して, 局所コンパクト性から $`x\in V\subseteq K`$ を満たす開集合 $`V\subseteq X`$ とコンパクト集合 $`K\subseteq X`$ を選べる.
    $`V`$ と $`X^+\setminus K`$ はそれぞれ $`x`$ と $`\infty`$ の交わらない開近傍である.
    よって $`X^+`$ は Hausdorff である.

    $`X=X^+\setminus\{\infty\}`$ であることは集合の構成から従う.
    $`X`$ は定義により開集合である.
    $`\infty`$ の任意の近傍 $`U`$ が $`X`$ と交わらないとすると $`U=\{\infty\}`$ となり, 定義から $`X`$ はコンパクトとなる.
    これは仮定に反する.
    よって $`X`$ は $`X^+`$ に稠密である.

Theorem. **一点コンパクト化の一意性**
:   コンパクト Hausdorff 空間 $`K`$ が $`X`$ を稠密な開部分空間として含み, $`K\setminus X`$ が一点からなるならば, $`K`$ は $`X^+`$ と $`X`$ 上恒等な同相写像によって同相である.

<u>proof.</u>
:   $`K\setminus X=\{p\}`$ とおく.
    写像 $`h:X^+\to K`$ を $`x\in X`$ では $`h(x)=x`$, $`h(\infty)=p`$ と定める.
    これは全単射であり, $`X`$ 上では恒等写像である.
    $`X`$ 上での連続性は仮定から明らかである.
    $`p`$ の開近傍 $`W\subseteq K`$ をとると, $`K\setminus W`$ はコンパクトであり $`X`$ に含まれる.
    したがって $`h^{-1}(W)`$ は $`\infty`$ を含み, その $`X`$ における補集合はコンパクトである.
    一点コンパクト化の定義から $`h^{-1}(W)`$ は開である.
    よって $`h`$ は連続である.
    $`X^+`$ はコンパクトで $`K`$ は Hausdorff なので, 連続全単射 $`h`$ は同相写像である.
    $`X`$ 上恒等であるような写像は $`\infty`$ の像も $`p`$ に限られるから, この同相写像は一意である.

Example.
:   $`\mathbb{R}^n`$ の一点コンパクト化は $`n`$ 次元球面 $`S^n`$ と同相である.
    立体射影がこの同相を与える.

### Stone-Čech コンパクト化

Definition. **Stone-Čech コンパクト化**
:   Tychonoff 空間 $`X`$ の **Stone-Čech コンパクト化** とは, コンパクト Hausdorff 空間 $`\beta X`$ と稠密埋め込み $`\iota:X\to\beta X`$ の組であって, 任意のコンパクト Hausdorff 空間 $`K`$ と連続写像 $`f:X\to K`$ に対して, 連続写像 $`\overline{f}:\beta X\to K`$ が一意に存在して
    ```math
    \overline{f}\circ\iota=f
    ```
    を満たすものをいう.

Theorem. **Stone-Čech コンパクト化の存在と一意性**
:   任意の Tychonoff 空間は Stone-Čech コンパクト化を持つ.
    Stone-Čech コンパクト化は $`X`$ 上恒等な同相写像を除いて一意である.

<u>proof.</u>
:   存在については, $`X`$ から $`[0,1]`$ への連続写像全体を添字とする積空間への評価写像を用いる.
    Tychonoff 性によりこの評価写像は埋め込みであり, その像の閉包は Tychonoff の定理によりコンパクト Hausdorff である.
    各座標関数の延長から, この閉包は Stone-Čech の普遍性を満たす.

    一意性を示す.
    $`(\beta X,\iota)`$ と $`(\beta'X,\iota')`$ を二つの Stone-Čech コンパクト化とする.
    普遍性を $`\iota':X\to\beta'X`$ に適用すると, 連続写像 $`F:\beta X\to\beta'X`$ で $`F\circ\iota=\iota'`$ を満たすものが一意に存在する.
    同様に連続写像 $`G:\beta'X\to\beta X`$ で $`G\circ\iota'=\iota`$ を満たすものが一意に存在する.
    $`G\circ F`$ と恒等写像は稠密部分集合 $`\iota(X)`$ 上で一致する.
    値域 $`\beta X`$ は Hausdorff であるから, 連続写像の一致集合は閉であり, 稠密性から $`G\circ F=\operatorname{id}_{\beta X}`$ となる.
    同様に $`F\circ G=\operatorname{id}_{\beta'X}`$ である.
    よって $`F`$ は $`X`$ 上恒等な同相写像であり, その一意性も普遍性から従う.

Proposition. **有界実数値関数による特徴づけ**
:   Tychonoff 空間 $`X`$ のコンパクト化 $`\iota:X\to K`$ が Stone-Čech コンパクト化であるための必要十分条件は, 任意の連続写像 $`f:X\to[0,1]`$ が $`K`$ 上の連続写像へ一意に延長できることである.

<u>proof.</u>
:   $`K=\beta X`$ が Stone-Čech コンパクト化なら, $`[0,1]`$ はコンパクト Hausdorff 空間であるから普遍性を適用できる.
    したがって各 $`f:X\to[0,1]`$ は連続写像 $`\overline f:\beta X\to[0,1]`$ へ延長される.
    二つの延長は稠密部分集合 $`X`$ 上で一致し, 値域が Hausdorff なので一致する.

    逆にこの延長性を仮定する.
    任意のコンパクト Hausdorff 空間 $`Y`$ と連続写像 $`g:X\to Y`$ をとる.
    コンパクト Hausdorff 空間は Tychonoff 空間なので, $`Y`$ はその $`[0,1]`$ 値連続関数全体による評価写像
    ```math
    e:Y\longrightarrow[0,1]^{C(Y,[0,1])}
    ```
    で埋め込まれる.
    各座標 $`h\circ g:X\to[0,1]`$ は仮定により $`K`$ 上へ一意に延長される.
    それらを並べると連続写像 $`G:K\to[0,1]^{C(Y,[0,1])}`$ が得られ, $`G\circ\iota=e\circ g`$ である.
    $`e(Y)`$ はコンパクトゆえ閉であり, $`G^{-1}(e(Y))`$ は稠密集合 $`\iota(X)`$ を含む閉集合であるから $`K`$ 全体である.
    従って $`G`$ は $`e(Y)`$ に値を持ち, $`e^{-1}\circ G:K\to Y`$ が $`g`$ の連続延長となる.
    稠密性によりこの延長は一意であるので, $`K`$ は Stone-Čech コンパクト化の普遍性を満たす.

Remark.
:   一点コンパクト化は余剰点を一つだけ加える最小の形のコンパクト化である.
    Stone-Čech コンパクト化は有界連続関数をすべて延長できるという普遍性によって定まり, 一般には一点コンパクト化より大きい.

---

Theorem. **$`1`$ の分割の存在定理**
:   パラコンパクト Hausdorff 空間の任意の開被覆には従属する $`1`$ の分割が存在する.

<u>proof.</u>
:   開被覆 $`\mathcal{U}`$ をとる.
    パラコンパクト Hausdorff 空間は正規である.
    縮小補題を二度適用し, X を被覆する局所有限な開族 $`(W_i)_{i\in I}`$ と開族 $`(V_i)_{i\in I}`$ および $`U_i\in\mathcal{U}`$ を
    ```math
    \overline{W_i}\subseteq V_i,\qquad \overline{V_i}\subseteq U_i
    ```
    となるように選ぶ.

    Urysohn の補題から, 各 $`i`$ に対して連続写像 $`\psi_i:X\to[0,1]`$ を
    ```math
    \psi_i|_{\overline{W_i}}=1,\qquad \psi_i|_{X\setminus V_i}=0
    ```
    となるように選べる.
    このとき $`\operatorname{supp}\psi_i\subseteq\overline{V_i}\subseteq U_i`$ であり, 必要な従属性が得られる.
    支持の族は局所有限であるから, 各点の近傍では有限個の $`\psi_i`$ だけが非零である.
    したがって
    ```math
    \psi(x)\coloneqq\sum_{i\in I}\psi_i(x)
    ```
    は連続である.
    $`(V_i)`$ が被覆であることから $`\psi(x)>0`$ が全ての $`x\in X`$ で成り立つ.

    $`\varphi_i(x)=\psi_i(x)/\psi(x)`$ とおく.
    この族は局所有限であり, 各 $`\operatorname{supp}\varphi_i`$ は $`U_i`$ に含まれる.
    さらに各点で $`\sum_i\varphi_i(x)=1`$ である.
    よって $`(\varphi_i)_{i\in I}`$ は $`\mathcal{U}`$ に従属する $`1`$ の分割である.

Remark.
:   局所有限性により, 各点の近傍では上の和の非零項が有限個しかない.
    そのため $`1`$ の分割は局所的な連続関数を一つの連続関数へ貼り合わせる道具になる.