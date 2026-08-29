## 距離空間

距離は二点の近さを実数で測る構造であり, 位相空間の代表的な具体例を与える.
点列の収束, Cauchy 列, 完備化を距離によって記述し, 後に導入する位相的な定義と比較する.

### 距離空間

Definition. **距離空間**
:   **集合 $`X`$ 上の距離** (*metric on a set $`X`$*) とは, 写像 $`d:X\times X\to\mathbb{R}`$ であって, **距離の公理** (*metric axioms*) と呼ばれる次の条件を満たすときいう:
    - **非負性**:<br><div style="margin-left: 2em;">任意の $`x,y\in X`$ に対して $`d(x,y)\geq 0`$,
    - **非退化性**:<br><div style="margin-left: 2em;">任意の $`x,y\in X`$ に対して $`x=y\iff d(x,y)=0`$,
    - **対称性**:<br><div style="margin-left: 2em;">任意の $`x,y\in X`$ に対して $`d(x,y)=d(y,x)`$,
    - **三角不等式**:<br><div style="margin-left: 2em;">任意の $`x,y,z\in X`$ に対して $`d(x,y)+d(y,z)\geq d(x,z)`$.

    集合 $`X`$ と $`X`$ 上の距離 $`d:X\times X\to\mathbb{R}`$ の組 $`(X,d)`$ を**距離空間** (*metric space*) といい, 集合 $`X`$ をこの距離空間の**台集合** (*underlying set*) という.

特に, 距離 $`d:X\times X\to\mathbb{R}`$ が条件
```math
\forall x,y,z\in X,\quad\max\{d(x,y),d(y,z)\}\geq d(x,z)
```
を満たすとき, $`d`$ は**非 Archimedes 的** (*non-Archimedean*) あるいは **超距離** (*ultrametric*) であるという.

Definition. **写像の連続性**
:   距離空間 $`(X, d_X), (Y, d_Y)`$ と写像 $`f:X\to Y`$ に対して, $`f`$ が**点 $`x_0\in X`$ で連続** (*continuous at point $`x_0\in X`$*) であるとは, 以下の条件を満たすときいう:
    ```math
    \forall\varepsilon>0,\exists\delta>0\text{ s.t. }\forall x\in X,d_X(x,x_0)\leq\delta\Rightarrow d_Y(f(x),f(x_0))\leq\varepsilon
    ```
    特に, 全ての $x_0\in X$ で連続な写像 $`f:X\to Y`$ を, **連続写像** (*continuous function*) といい, $`f:(X, d_X)\to (Y, d_Y)`$ と表す.

距離空間 $`(X, d_X), (Y, d_Y)`$ と全単射な写像 $`f:X\to Y`$ に対して, $`f`$ と $`f^{-1}`$ がともに連続写像となるとき, $`f`$ を**同相写像** (*homeomorphism*) という.
また, 距離空間 $`(X, d_X), (Y, d_Y)`$ の間に同相写像が存在するとき, $`(X, d_X)`$ と $`(Y, d_Y)`$ は**同相** (*homeomorphic*) であるといい, 
```math
(X, d_X)\cong(Y, d_Y)
```
と表す.

Example. 連続な全単射の逆写像が連続とは限らない例
:   写像
    ```math
    f:[0,2\pi)\longrightarrow S^1,\quad t\longmapsto(\cos t,\sin t)
    ```
    は連続な全単射である.
    しかし, $`t_n=2\pi-1/n`$ とすると $`f(t_n)\to f(0)`$ である一方, $`t_n`$ は $`0`$ に収束しない.
    よって $`f^{-1}`$ は $`f(0)`$ で連続でない.

集合 $`X`$ 上の距離 $`d_1,d_2`$ に対して, $`X`$ 上の恒等写像が距離空間 $`(X,d_1), (X,d_2)`$ の間の同相写像となるとき, $`d_1,d_2`$ は**距離として同値** (*equivalent of metrics*) であるという.

Proposition. 距離の変換
:   集合 $`X`$ 上の距離 $`d`$ と, 写像 $`f:\mathbb{R}_{\geq0}\to\mathbb{R}_{\geq0}`$ をとる.
    $`f`$ が $`f(0)=0`$ で劣加法的な狭義単調増加写像なら, 合成写像 $`f\circ d`$ は $`X`$ 上の距離となる.
    特に $`f`$ が連続写像であれば, $`d`$ と $`f\circ d`$ は距離として同値となる.

<u>proof.</u>
:   $`d_f\coloneqq f\circ d`$ とおく.
    $`f`$ の狭義単調性と $`f(0)=0`$ より, $`d_f(x,y)=0`$ と $`d(x,y)=0`$ は同値である.
    非負性と対称性も直ちに従う.
    三角不等式 $`d(x,z)\leq d(x,y)+d(y,z)`$ と単調性および劣加法性から
    ```math
    d_f(x,z)
    \leq f(d(x,y)+d(y,z))
    \leq d_f(x,y)+d_f(y,z)
    ```
    を得る.
    したがって $`d_f`$ は距離である.

    $`f`$ が原点で連続なら, 任意の $`\varepsilon>0`$ に対して $`f(\delta)<\varepsilon`$ となる $`\delta>0`$ を選べるので, 恒等写像 $`(X,d)\to(X,d_f)`$ は連続である.
    逆に $`\varepsilon>0`$ に対して $`\eta=f(\varepsilon)>0`$ とおくと, $`d_f(x,y)<\eta`$ ならば狭義単調性により $`d(x,y)<\varepsilon`$ である.
    よって逆向きの恒等写像も連続であり, 二つの距離は同値である.

Definition. **距離を保つ写像**
:   距離空間 $`(X, d_X), (Y, d_Y)`$ と写像 $`f:X\to Y`$ に対して, $`f`$ が**距離を保つ** (*distance preserving*) とは, 以下の条件を満たすときいう:
    ```math
    \forall x,y\in X,d_X(x,y)=d_Y(f(x),f(y))
    ```
    距離を保つ写像を **等長写像** (*isometry*) といい, 全単射な等長写像 $`X\to Y`$ が存在する距離空間 $`(X, d_X), (Y, d_Y)`$ を距離空間として **等長** (*isometric*) という.

Definition. **写像の一様連続性**
:   距離空間 $`(X, d_X), (Y, d_Y)`$ と写像 $`f:X\to Y`$ に対して, $`f`$ が**一様連続** (*uniformly continuous*) であるとは, 以下の条件を満たすときいう:
    ```math
    \forall\varepsilon>0,\exists\delta>0\text{ s.t. }\forall x,y\in X,d_X(x,y)\leq\delta\Rightarrow d_Y(f(x),f(y))\leq\varepsilon
    ```
    一様連続な写像を **一様連続写像** (*uniformly continuous function*) といい, 全単射な写像 $`f:X\to Y`$ として $`f,f^{-1}`$ がともに一様連続となるとき距離空間 $`(X, d_X), (Y, d_Y)`$ を距離空間として **一様同型** (*uniformly isomorphic*) という.

Proposition.
:   一様連続写像は連続となる.

<u>proof.</u>
:   $`x_0\in X`$ と $`\varepsilon>0`$ を固定する.
    一様連続性から, 任意の $`x,y\in X`$ に対して
    ```math
    d_X(x,y)\leq\delta\Rightarrow d_Y(f(x),f(y))\leq\varepsilon
    ```
    を満たす $`\delta>0`$ が存在する.
    ここで $`y=x_0`$ とおけば, $`d_X(x,x_0)\leq\delta`$ ならば $`d_Y(f(x),f(x_0))\leq\varepsilon`$ となる.
    したがって $`f`$ は $`x_0`$ で連続である.
    $`x_0`$ は任意であったから, $`f`$ は連続である.

Example. 連続だが一様連続でない写像の例
:   写像 $`f:\mathbb{R}\to\mathbb{R}`$, $`f(x)=x^2`$ は連続であるが一様連続ではない.
    実際, $`x_n=n`$, $`y_n=n+1/n`$ とすると $`|x_n-y_n|\to0`$ であるが,
    ```math
    |f(x_n)-f(y_n)|=2+1/n^2
    ```
    は $`0`$ に収束しない.

### 点列

距離空間 $`(X,d)`$ の **点列** (*sequence of points*) を, 非負整数全体から $`X`$ への写像 $`n\mapsto p_n`$ として定義し, $`(p_n)_{n\geq0}`$ あるいは単に $`(p_n)`$ と表す.

Definition. **点列の収束性**
:   距離空間 $`(X,d)`$ の点列 $`(p_n)`$ と点 $`p\in X`$ に対して, 条件
    ```math
    \forall\varepsilon>0,\exists N\in\mathbb N\text{ s.t. }\forall n\in\mathbb N[N\leq n\Rightarrow d(p_n,p)\leq\varepsilon]
    ```
    を満たすとき, $`p`$ を **列 $`(p_n)`$ の極限** (*limit of a sequence $`(p_n)`$*) といい, 極限の存在する列は**収束する** (*converge*) といい, 収束しない列は**発散する** (*diverge*) という.

Proposition. **点列の極限の一意性**
:   距離空間 $`(X,d)`$ の点列 $`(p_n)`$ は, 収束すればその極限は一意的である.

<u>proof.</u>
:   $`p_n\to p`$ かつ $`p_n\to q`$ と仮定する.
    $`p\neq q`$ ならば $`d(p,q)>0`$ である.
    $`\varepsilon=d(p,q)/3`$ とおく.
    収束の定義から, ある $`N_p,N_q`$ が存在して, $`n\geq N_p`$ ならば $`d(p_n,p)\leq\varepsilon`$, $`n\geq N_q`$ ならば $`d(p_n,q)\leq\varepsilon`$ となる.
    $`n\geq\max\{N_p,N_q\}`$ をとると, 三角不等式より
    ```math
    d(p,q)\leq d(p,p_n)+d(p_n,q)\leq2\varepsilon=\frac{2}{3}d(p,q)<d(p,q)
    ```
    となり矛盾する.
    よって $`p=q`$ である.

このことから, 収束点列 $`(p_n)`$ の極限を $`\lim(p_n)`$ あるいは $`\lim_{n\to\infty}p_n`$ と表す.

Definition. **同程度連続**
:   距離空間 $`(X,d_X),(Y,d_Y)`$ と写像の族 $`f=\{f_\lambda:X\to Y\mid\lambda\in\Lambda\}`$ に対して, $`f`$ が**同程度連続** (*equicontinuous*) であるとは, 任意の $`\varepsilon>0,x\in X`$ に対して, ある $`\delta>0`$ が存在して, 任意の $`\lambda\in\Lambda`$ と $`x'\in X`$ に対して $`d_X(x,x')\leq\delta`$ ならば $`d_Y(f_\lambda(x),f_\lambda(x'))\leq\varepsilon`$ であるときいう.

Proposition. **同程度連続な写像列の各点収束は連続写像をなす**
:   距離空間 $`(X,d_X),(Y,d_Y)`$ と同程度連続な写像列 $`(f_n:X\to Y)`$ と写像 $`f:X\to Y`$ に対して, 任意の $`x\in X`$ に対して $`f_n(x)\to f(x),\,(n\to\infty)`$ であれば, $`f`$ は連続となる.

<u>proof.</u>
:   $`x_0\in X`$ と $`\varepsilon>0`$ をとる.
    同程度連続性から, 任意の $`n`$ と $`x`$ に対して
    ```math
    d_X(x,x_0)\leq\delta\Rightarrow d_Y(f_n(x),f_n(x_0))\leq\varepsilon/3
    ```
    を満たす $`\delta>0`$ が存在する.
    $`d_X(x,x_0)\leq\delta`$ となる $`x`$ を固定する.
    $`f_n(x)\to f(x)`$ および $`f_n(x_0)\to f(x_0)`$ であるから, ある $`n`$ が存在して
    ```math
    d_Y(f(x),f_n(x))\leq\varepsilon/3,\qquad
    d_Y(f_n(x_0),f(x_0))\leq\varepsilon/3
    ```
    となる.
    三角不等式より
    ```math
    d_Y(f(x),f(x_0))
    \leq d_Y(f(x),f_n(x))+d_Y(f_n(x),f_n(x_0))+d_Y(f_n(x_0),f(x_0))
    \leq\varepsilon
    ```
    である.
    よって $`f`$ は $`x_0`$ で連続であり, $`x_0`$ は任意であったから $`f`$ は連続である.

### 完備性

距離空間 $`(X,d)`$ の点列 $`(p_n)`$ が条件
```math
\forall\epsilon>0,\exists N\in\mathbb N\text{ s.t. }\forall m,n\in\mathbb N[N\leq m,n\Rightarrow d(p_m,p_n)\leq\varepsilon]
```
を満たすとき, $`(p_n)`$ を **Cauchy 列** (*Cauchy sequence*) という.

Proposition. **収束列は Cauchy 列**
:   収束点列は Cauchy 列となる.

<u>proof.</u>
:   $`p_n\to p`$ とし, $`\varepsilon>0`$ をとる.
    収束の定義から, $`n\geq N`$ ならば $`d(p_n,p)\leq\varepsilon/2`$ となる $`N`$ が存在する.
    $`m,n\geq N`$ に対して三角不等式から
    ```math
    d(p_m,p_n)\leq d(p_m,p)+d(p,p_n)\leq\frac{\varepsilon}{2}+\frac{\varepsilon}{2}=\varepsilon
    ```
    となる.
    したがって $`(p_n)`$ は Cauchy 列である.

距離空間 $`(X,d)`$ の任意の Cauchy 列 $`(p_n)`$ が収束点列になるとき, $`(X,d)`$ は **完備** (*complete*) といい, 完備な距離空間を **完備距離空間** (*complete metric space*) という.

Definition. **完備化**
:   距離空間 $`(X,d_X)`$ に対して, 完備距離空間 $`\overline{(X,d_X)}=(\overline{X},\overline{d_X})`$ と等長埋め込み $`\iota:(X,d_X)\to\overline{(X,d_X)}`$ が次の条件を満たすとする.
    - $`\iota(X)`$ は完備距離空間 $`\overline{(X,d_X)}`$ で稠密である.
    - 任意の完備距離空間 $`(Y,d_Y)`$ と任意の一様連続写像 $`r:(X,d_X)\to(Y,d_Y)`$ に対して, 一様連続写像 $`\overline{r}:\overline{(X,d_X)}\to(Y,d_Y)`$ が一意的に存在して $`r=\overline{r}\circ\iota`$ が成り立つ.

    このとき, 組 $`(\overline{(X,d_X)},\iota)`$ を距離空間 $`(X,d_X)`$ の **完備化** (*completion*) という.

Theorem. **完備化の一意性**
:   距離空間 $`(X,d_X)`$ の完備化 $`(C,\iota), (C',\iota')`$ に対して, $`\iota'=f\circ\iota`$ を満たす等長同型写像 $`f:C\to C'`$ が一意的に存在する.

<u>proof.</u>
:   完備化の普遍性を $`\iota':X\to C'`$ に適用すると, 一意な一様連続写像 $`f:C\to C'`$ で $`f\circ\iota=\iota'`$ を満たすものを得る.
    同様に $`g:C'\to C`$ で $`g\circ\iota'=\iota`$ を満たすものを得る.
    $`g\circ f`$ と恒等写像は $`\iota(X)`$ 上で一致するから, 普遍性の一意性により $`g\circ f=\mathrm{id}_C`$ である.
    同様に $`f\circ g=\mathrm{id}_{C'}`$ である.
    したがって $`f`$ は一様同型である.
    任意の $`c,d\in C`$ に対して $`\iota(X)`$ の列 $`\iota(x_n)\to c`$, $`\iota(y_n)\to d`$ を取る.
    $`f\circ\iota=\iota'`$ と距離関数の連続性から
    ```math
    d_{C'}(f(c),f(d))
    =\lim_n d_{C'}(\iota'(x_n),\iota'(y_n))
    =\lim_n d_X(x_n,y_n)
    =d_C(c,d)
    ```
    となるので, $`f`$ は等長写像である.
    一意性も普遍性の一意性から従う.

距離空間 $`(X,d)`$ の Cauchy 列全体を $`C`$ とすると, $`C`$ 上の二項関係 $`\sim`$ を
```math
(p_n)\sim(q_n)\mathrel{\overset{\text{def}}{\iff}}\lim_{n\to\infty}d(p_n,q_n)=0
```
と定義すると, $`\sim`$ は $`C`$ 上の同値関係となる.
このとき, 商集合 $`C/\sim`$ への射影を $`\pi:C\to C/\sim`$ とする.
さらに定数列 $`(x,x,\ldots)`$ の同値類を用いて
```math
\iota:X\longrightarrow C/\sim,\qquad
\iota(x)=\pi((x,x,\ldots))
```
と定める.
次が成り立つ.

Lemma.
:   写像 $`\hat{d}:C/\sim\times C/\sim\to\mathbb{R}`$ を 距離空間 $`(X,d)`$ の Cauchy 列 $`p=(p_n),q=(q_n)`$ に対して
    ```math
    \hat{d}(\pi(p),\pi(q))=\lim_{n\to\infty}d(p_n,q_n)
    ```
    と定めることができる.

<u>proof.</u>
:   Cauchy 列 $`p,q`$ に対して実数列 $`d(p_n,q_n)`$ は Cauchy 列である.
    実数の完備性からその極限が存在する.
    $`p\sim p'`$ と $`q\sim q'`$ なら三角不等式より
    ```math
    |d(p_n,q_n)-d(p'_n,q'_n)|\leq d(p_n,p'_n)+d(q_n,q'_n)
    ```
    であり, 右辺は $`0`$ に収束する.
    従って極限は代表元に依らず, $`\hat d`$ は well-defined である.

Lemma.
:   $`\hat{d}`$ は $`C/\sim`$ 上の距離となる.

<u>proof.</u>
:   非負性と対称性は各 $`d(p_n,q_n)`$ の対応する性質から極限をとれば従う.
    三角不等式も各 $`n`$ についての三角不等式の極限から従う.
    $`\hat d(\pi(p),\pi(q))=0`$ であることは定義により $`d(p_n,q_n)\to0`$, すなわち $`p\sim q`$ と同値である.
    これは $`\pi(p)=\pi(q)`$ と同値なので, 同一性の公理も成り立つ.

Lemma.
:   写像 $`\iota:X\to C/\sim`$ は等長埋め込みである.

<u>proof.</u>
:   $`x,y\in X`$ に対して, 定数列の定義から
    ```math
    \hat d(\iota(x),\iota(y))=\lim_{n\to\infty}d(x,y)=d(x,y)
    ```
    である.
    よって $`\iota`$ は距離を保ち, 特に単射かつ連続である.

Lemma.
:   距離空間 $`(C/\sim,\hat{d})`$ は完備である.

<u>proof.</u>
:   $`C/\sim`$ の Cauchy 列 $`(\pi(p^k))_{k\geq0}`$ をとる.
    Cauchy 性から, 添字を取り直して
    ```math
    \hat d(\pi(p^k),\pi(p^{k+1}))<2^{-k-2}
    ```
    となるものとしてよい.
    各 $`k`$ について, $`m_k`$ を帰納的に選ぶ.
    $`m_k`$ は $`p^k`$ と $`p^{k+1}`$ の尾部の距離が $`2^{-k-3}`$ 未満となる位置より後ろに取り,
    次の段階では $`m_{k+1}>m_k`$ かつ $`p^{k+1}`$ の $`m_k`$ 以後の項同士の距離が $`2^{-k-3}`$ 未満となるように取る.
    $`q_k=p^k_{m_k}`$ とおく.
    代表列の Cauchy 性と上の選択条件から $`d(q_k,q_{k+1})<2^{-k-2}`$ である.
    したがって三角不等式を有限回用いると, 任意の $`r>s`$ に対して
    ```math
    d(q_s,q_r)<\sum_{k=s}^{r-1}2^{-k-2}+2^{-s-1}<2^{-s}
    ```
    となる.
    したがって $`(q_k)`$ は $`X`$ の Cauchy 列である.
    同じ対角選択を, $`p^k`$ の尾部と $`q`$ の尾部を比較する形で行うと,
    ```math
    \hat d(\pi(q),\pi(p^k))\leq 2^{-k}
    ```
    を得る.
    よって $`\pi(q)`$ はもとの Cauchy 列 $`(\pi(p^k))`$ の極限である.
    よって $`C/\sim`$ は完備である.

Theorem. **完備化の存在性**
:   距離空間 $`(C/\sim,\hat{d})`$ と標準埋め込み $`\iota:X\to C/\sim`$ の組 $`((C/\sim,\hat{d}),\iota)`$ は $`(X,d_X)`$ の完備化となる.

<u>proof.</u>
:   前の補題により $`C/\sim`$ は完備であり, $`\iota`$ は等長埋め込みである.
    任意の Cauchy 列 $`p=(p_n)`$ に対して, $`\hat d(\iota(p_n),\pi(p))\to0`$ である.
    従って $`\iota(X)`$ は稠密である.
    完備距離空間 $`Y`$ への一様連続写像 $`r:X\to Y`$ に対して, $`\overline r(\pi(p))=\lim_n r(p_n)`$ と定める.
    一様連続性は Cauchy 列を Cauchy 列へ送るので極限は存在し, 同値な代表列では同じ極限を持つため well-defined である.
    この写像は $`r`$ を延長し, 稠密性と $`Y`$ の Hausdorff 性から一意である.

Proposition. **極限写像の定義域の拡張**
:   距離空間 $`(X,d_X)`$ と 完備距離空間 $`(Y,d_Y)`$ と同程度連続な写像列 $`(f_n:X\to Y)`$ に対して, $`(X,d_X)`$ のある稠密な部分集合 $`D`$ における各点 $`x\in X`$ で $`Y`$ の点列 $`(f_n(x))`$ が収束するならば, 点列 $`(f_n(x))`$ は任意の $`x\in X`$ に対して収束し, 極限写像は連続である.

<u>proof.</u>
:   $`x\in X`$ と $`\varepsilon>0`$ をとる.
    等連続性により, すべての $`n`$ に対して
    ```math
    d_X(x,z)<\delta\Longrightarrow d_Y(f_n(x),f_n(z))<\varepsilon/3
    ```
    を満たす $`\delta>0`$ をとれる.
    $`D`$ の稠密性から $`d_X(x,z)<\delta`$ を満たす $`z\in D`$ を選ぶ.
    仮定より $`(f_n(z))`$ は収束し, 特に Cauchy 列である.
    従って十分大きい $`m,n`$ に対して $`d_Y(f_m(z),f_n(z))<\varepsilon/3`$ である.
    三角不等式から
    ```math
    d_Y(f_m(x),f_n(x))
    \leq d_Y(f_m(x),f_m(z))+d_Y(f_m(z),f_n(z))+d_Y(f_n(z),f_n(x))
    <\varepsilon
    ```
    となる.
    よって $`(f_n(x))`$ は Cauchy 列であり, $`Y`$ の完備性により収束する.
    これで各点での極限写像 $`f`$ が定まる.
    元の列は等連続であり, いま全点収束が示されたので, 等連続列の点ごとの極限の連続性に関する前の命題から $`f`$ は連続である.
