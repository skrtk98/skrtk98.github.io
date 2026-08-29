## 位相空間と連続写像

距離が与えられない集合でも, 各点の近傍を指定すれば連続性と収束を定められる.
近傍系, 開集合, ネット, フィルターが同じ位相構造を別の形で表すことを利用して, 距離空間を越えた連続性を扱う.

### 位相構造

Definition. **近傍系**
:   **集合 $`X`$ 上の近傍系** (*neighbourhood system on a set $`X`$*) とは, 写像
    ```math
    \mathcal{N}:X\to\operatorname{Fil}(X)
    ```
    であって, 各 $`x\in X`$ に対して次の条件を満たすときいう:
    1. 任意の $`U\in\mathcal{N}(x)`$ に対して
        ```math
        x\in U.
        ```
    2. 任意の $`U\in\mathcal{N}(x)`$ に対して
        ```math
        \mathcal{N}^{-1}(U)=\{y\in X\mid U\in\mathcal{N}(y)\}\in\mathcal{N}(x)
        ```
    ただし $`\operatorname{Fil}(X)`$ は $`X`$ 上のフィルター全体の集合を表す.

集合 $`X`$ とその上の近傍系 $`\mathcal{N}`$ の組
```math
(X,\mathcal{N})
```
を **位相空間** (*topological space*) といい, $`X`$ をその **台集合** (*underlying set*) という.
位相空間 $`X`$ における台集合を $`X_0`$ と表し, 近傍系を $`\mathcal{N}_X`$ と表す.

Remark.
:   条件 2 は, 任意の $`U\in\mathcal{N}(x)`$ に対して, ある $`V\in\mathcal N(x)`$ が存在して
    ```math
    \forall y\in V,\quad U\in\mathcal{N}(y)
    ```
    となることと同値である.
    この条件が, 点ごとに独立に与えられたフィルター族を位相的な近傍系にする局所整合性条件である.

Definition. **近傍系の比較**
:   集合 $`X`$ 上の近傍系 $`\mathcal{u},\mathcal{U}`$ が, 各 $`x\in X`$ に対して $`\mathcal{u}(x)\subseteq\mathcal{U}(x)`$ であるとき, $`\mathcal{U}`$ は $`\mathcal{u}`$ より **強い** (*strong*) といい, $`\mathcal{u}`$ は $`\mathcal{U}`$ より **弱い** (*weak*) という.

Example. **離散位相と密着位相**
:   集合 $`X`$ 上の最も強い近傍系は
    ```math
    \mathcal{N}_{\mathrm{dis}}(x)\coloneqq{U\subseteq X\mid x\in U}
    ```
    であり, これによって定まる位相を **離散位相** (*discrete topology*) という.

    他方, 集合 $`X`$ 上の最も弱い近傍系は
    ```math
    \mathcal{N}_{\mathrm{ind}}(x)\coloneqq{X}
    ```
    であり, これによって定まる位相を **密着位相** (*indiscrete topology*) という.

Example. **補有限位相と補可算位相**
:   集合 $`X`$ 上の位相
    ```math
    \mathbf{O}_{\mathrm{cof}}=\{\emptyset\}\cup\{U\subseteq X\mid X\setminus U\text{ is finite}\}
    ```
    を **補有限位相** (*cofinite topology*) と呼ぶ.
    また, 位相
    ```math
    \mathbf{O}_{\mathrm{coc}}=\{\emptyset\}\cup\{U\subseteq X\mid X\setminus U\text{ is countable}\}
    ```
    を **補可算位相** (*cocountable topology*) と呼ぶ.

Proposition. **補有限位相と補可算位相の分離性**
:   無限集合 $`X`$ に補有限位相を与えると, $`X`$ は $`T_1`$ 空間であるが Hausdorff ではない.
    非可算集合 $`X`$ に補可算位相を与えても, $`X`$ は $`T_1`$ 空間であるが Hausdorff ではない.

<u>proof.</u>
:   一点集合の補集合は有限集合であり, 補有限位相では閉集合である.
    非可算集合上の補可算位相でも, 一点集合の補集合は可算集合であるから閉集合である.
    したがっていずれも $`T_1`$ 空間である.
    一方, 二つの空でない開集合の補集合はそれぞれ有限集合, または可算集合である.
    $`X`$ が無限集合, または非可算集合であるから, 二つの空でない開集合は交わる.
    よって異なる二点を交わらない開近傍で分離できず, Hausdorff ではない.

Definition. **近傍基**
:   **集合 $`X`$ 上の近傍基** (*neighbourhood basis on a set $`X`$*) とは, 写像
    ```math
    \mathcal{N}:X\to\operatorname{FilB}(X)
    ```
    であって, 各 $`x\in X`$ に対して次の条件を満たすときいう:
    1. 任意の $`U\in\mathcal{N}(x)`$ に対して
        ```math
        x\in U.
        ```
    2. 任意の $`U\in\mathcal{N}(x)`$ に対して次を満たす $`V\in\mathcal{N}(x)`$ が存在する:
        ```math
        \forall y\in V,\exists W\in\mathcal{N}(y)\text{ s.t. }W\subseteq U
        ```
    
    ただし $`\operatorname{FilB}(X)`$ は $`X`$ 上のフィルター基全体の集合を表す.

Definition. **近傍基の比較**
:   集合 $`X`$ 上の近傍基 $`\mathcal{b},\mathcal{B}`$ が, 各 $`x\in X`$ に対して
    ```math
    \forall B\in\mathcal{b}(x),\exists B'\in\mathcal{B}(x)\text{ s.t. }B'\subseteq B
    ```
    であるとき, $`\mathcal{B}`$ は $`\mathcal{b}`$ より **強い** (*strong*) といい, $`\mathcal{b}`$ は $`\mathcal{B}`$ より **弱い** (*weak*) という.

Proposition. **近傍基の定める近傍**
:   集合 $`X`$ 上の近傍基 $`\mathcal{B}`$ に対して, 写像 $`\mathcal{U}:X\to2^{2^X}`$ を $`x\in X`$ に対して $`\mathcal{U}(x)`$ をフィルター基 $`\mathcal{B}(x)`$ の生成するフィルターとすると, $`\mathcal{U}`$ は $`X`$ 上の近傍系となる. $`\mathcal{U}`$ を $`\mathcal{B}`$ の生成する近傍系という.

<u>proof.</u>
:   近傍基の各元は基点を含むから, 生成されたフィルターの各元も基点を含む.
    また $`U\in\mathcal{U}(x)`$ なら, フィルター基の定義により $`B\in\mathcal{B}(x)`$ で $`B\subseteq U`$ となるものがある.
    近傍基の第二条件をこの $`B`$ に適用すると, ある $`C\in\mathcal{B}(x)`$ が存在して, 各 $`y\in C`$ について $`W_y\in\mathcal{B}(y)`$ かつ $`W_y\subseteq B\subseteq U`$ となる.
    $`C\in\mathcal{U}(x)`$ であり $`W_y\in\mathcal{U}(y)`$ であるから, 近傍系の公理が成り立つ.

Proposition. **集合の近傍**
:   集合 $`X`$ 上の近傍系 $`\mathcal{U}`$ に対して,
    ```math
    \mathcal{U}[A]\coloneqq\bigcap_{a\in A}\mathcal{U}(a),\quad A\subseteq X
    ```
    とすると, 次がそれぞれ成り立つ.
    - $`\mathcal{U}[\{x\}]=\mathcal{U}(x)`$ である.
    - $`\mathcal{U}[A]`$ は $`X`$ 上のフィルターである.
    - 各 $`U\in\mathcal{U}[A]`$ に対して $`A\subseteq U`$ である.

<u>proof.</u>
:   一点集合についての等式は定義から直ちに従う.
    $`\mathcal{U}[A]`$ はフィルターの共通部分であるから, 上方閉性と有限交叉閉性を満たしフィルターである.
    $`U\in\mathcal{U}[A]`$ なら任意の $`a\in A`$ について $`U\in\mathcal{U}(a)`$ である.
    近傍系の第一公理より $`a\in U`$ なので $`A\subseteq U`$ である.

### 写像の連続性

Definition. **写像の連続性**
:   位相空間 $`X, Y`$ と台集合の間の写像 $`f:X_0\to Y_0`$ に対して, $`f`$ が**点 $`x_0\in X`$ で連続** (*continuous at point $`x_0\in X`$*) であるとは,
    ```math
    \forall V\in\mathcal{N}_Y(f(x_0)),\quad f^{-1}(V)\in\mathcal{N}_X(x_0)
    ```
    が成り立つときいう. 特に, 全ての $x_0\in X$ で連続な写像 $`f:X_0\to Y_0`$ を, **連続写像** (*continuous function*) といい,
    ```math
    f:X\longrightarrow Y
    ```
    と表す.

以後, 位相空間 $`X, Y`$ に対して, 単に写像 $`X\to Y`$ といったとき台集合の間の写像 $`X_0\to Y_0`$ のこととする.

Proposition.
:   位相空間 $`X,Y,Z`$ と写像 $`f:X\to Y, g:Y\to Z`$ に対して, $`f`$ が 点 $`x_0\in X`$ で連続かつ $`g`$ が $`f(x_0)\in Y`$ で連続なとき, 合成写像 $`g\circ f:X\to Z`$ は $`x_0\in X`$ で連続である. 特に, $`f,g`$ がともに連続写像なとき, $`g\circ f`$ も連続写像となる.

<u>proof.</u>
:   $`g(f(x_0))`$ の任意の近傍 $`W`$ をとる.
    $`g`$ の $`f(x_0)`$ における連続性から, $`f(x_0)\in V`$ かつ $`g(V)\subseteq W`$ を満たす近傍 $`V`$ が存在する.
    $`f`$ の $`x_0`$ における連続性から, $`x_0\in U`$ かつ $`f(U)\subseteq V`$ を満たす近傍 $`U`$ が存在する.
    このとき $`(g\circ f)(U)\subseteq g(V)\subseteq W`$ である.
    よって $`g\circ f`$ は $`x_0`$ で連続である.

Definition. **同相写像**
:   位相空間 $`X,Y`$ と全単射な写像 $`f:X\to Y`$ に対して, $`f`$ と $`f^{-1}`$ がともに連続写像となるとき, $`f`$ を**同相写像** (*homeomorphism*) という.
    また, 位相空間 $`X,Y`$ の間に同相写像が存在するとき, $`X`$ と $`Y`$ は**同相** (*homeomorphic*) であるといい, 
    ```math
    X\cong Y
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

### 開集合系

Definition. **開集合系**
:   **集合 $`X`$ 上の開集合系** (*open sets on a set $`X`$*) とは, $`X`$ の部分集合族 $`\mathbf{O}`$ であって次の条件を満たすときいう:
    - $`\emptyset,X\in\mathbf{O}`$,
    - $`G,H\in\mathbf{O}`$ に対して $`G\cap H\in\mathbf{O}`$,
    - $`\mathbf{S}\subseteq\mathbf{O}`$ に対して $`\bigcup\mathbf{S}\in\mathbf{O}`$.

Definition. **開基**
:   **集合 $`X`$ 上の開基** (*open basis on a set $`X`$*) とは, $`X`$ の部分集合族 $`\mathbf{B}`$ であって次の条件を満たすときいう:
    - $`X=\bigcup\mathbf{B}_0`$ を満たす $`\mathbf{B}_0\subseteq\mathbf{B}`$ が存在する.
    - $`G,H\in\mathbf{B}`$ に対して, $`G\cap H=\bigcup\mathbf{B}_0`$ を満たす $`\mathbf{B}_0\subseteq\mathbf{B}`$ が存在する.

Definition. **開基の強弱**
:   集合 $`X`$ 上の開基 $`\mathbf{B}_1,\mathbf{B}_2`$ が条件
    ```math
    \forall G\in\mathbf{B}_1,\exists H\in\mathbf{B}_2\text{ s.t. }H\subseteq G
    ```
    を満たすとき, $`\mathbf{B}_2`$ は $`\mathbf{B}_1`$ より **強い** (*strong*) といい, $`\mathbf{B}_1`$ は $`\mathbf{B}_2`$ より **弱い** (*weak*) という.

Proposition. **部分集合族から開基の生成**
:   集合 $`X`$ の部分集合族 $`\mathbf{S}`$ に対して, 
    ```math
    \mathbf{B}\coloneqq\left\{\bigcap_{i=1}^{N}S_i\mathrel{}\middle|\mathrel{}S_i\in\mathbf{S}\ (1\leq i\leq N),\ N\in\mathbf{Z}_{\geq0}\right\},
    \qquad \bigcap_{i=1}^{0}S_i\coloneqq X
    ```
    は $`X`$ 上の開基となる. 特に, $`\mathbf{S}`$ が開基であれば $`\mathbf{B}`$ と $`\mathbf{S}`$ の生成する開集合系は一致する.
    $`\mathbf{B}`$ を $`\mathbf{S}`$ の生成する開基という.

<u>proof.</u>
:   空交叉を許せば $`X\in\mathbf{B}`$ であるから, $`\mathbf{B}`$ は $`X`$ を被覆する.
    $`\mathbf{B}`$ の二つの元はそれぞれ $`\mathbf{S}`$ の有限部分族の交叉である.
    その共通部分は二つの有限部分族の和集合にわたる交叉であり, 再び $`\mathbf{B}`$ の元である.
    従って $`\mathbf{B}`$ は開基の公理を満たす.
    $`\mathbf{S}`$ 自身が開基なら, その有限交叉は $`\mathbf{S}`$ の元の合併で表せるので, $`\mathbf{B}`$ が生成する開集合系は $`\mathbf{S}`$ が生成するものと一致する.

Proposition. **開基から開集合系の生成**
:   集合 $`X`$ 上の開基 $`\mathbf{B}`$ に対して, 
    ```math
    \mathbf{O}\coloneqq\left\{\bigcup\mathbf{B}'\mathrel{}\middle|\mathrel{}\mathbf{B}'\subseteq\mathbf{B}\right\}
    ```
    は $`X`$ 上の開集合系となる. 特に, $`\mathbf{B}`$ が開集合系であれば $`\mathbf{O}=\mathbf{B}`$ となる.
    $`\mathbf{O}`$ を $`\mathbf{B}`$ の生成する開集合系という.

<u>proof.</u>
:   $`\emptyset`$ は空な部分族の合併であり, $`X`$ は開基を被覆する部分族の合併であるから, ともに $`\mathbf{O}`$ に属する.
    任意合併については合併をまとめればよい.
    $`U=\bigcup\mathbf{B}_1`$, $`V=\bigcup\mathbf{B}_2`$ とすると, 開基の交叉条件より各 $`B_1\cap B_2`$ は $`\mathbf{B}`$ の部分族の合併である.
    したがって $`U\cap V=\bigcup_{B_1\in\mathbf{B}_1,B_2\in\mathbf{B}_2}(B_1\cap B_2)`$ も $`\mathbf{B}`$ の元の合併であり, $`\mathbf{O}`$ に属する.

集合 $`X`$ の部分集合族 $`\mathbf{S}`$ に対して, $`\mathbf{B}`$ を $`\mathbf{S}`$ の生成する開基とし $`\mathbf{O}`$ を $`\mathbf{B}`$ の生成する開集合系としたとき, $`\mathbf{O}`$ を $`\mathbf{S}`$ の生成する開集合系というと, 次が成り立つ.

Proposition.
:   集合 $`X`$ の部分集合族 $`\mathbf{S}`$ の生成する開集合系 $`\mathbf{O}`$ は, $`\mathbf{S}`$ を含むような開集合系のうち最も弱い開集合系である.

<u>proof.</u>
:   $`\mathbf{S}`$ の各元は一元族の有限交叉であるため, 生成開基に属し, 従って $`\mathbf{O}`$ に属する.
    一方 $`\mathbf{S}\subseteq\mathbf{O}'`$ を満たす任意の開集合系 $`\mathbf{O}'`$ をとる.
    $`\mathbf{O}'`$ は有限交叉で閉じているから生成開基のすべての元を含む.
    さらに任意合併で閉じているから, それらの合併である $`\mathbf{O}`$ のすべての元を含む.
   よって $`\mathbf{O}\subseteq\mathbf{O}'`$ であり, $`\mathbf{O}`$ は最も弱い.
Proposition. **近傍基の定める開基**
:   集合 $`X`$ 上の近傍基 $`\mathcal{B}`$ とその生成する近傍系 $`\mathcal{U}`$ に対して, $`X`$ の部分集合族 $`\beta`$ を
    ```math
    \beta\coloneqq\{B\subseteq X\mid\forall x\in B,B\in\mathcal{U}(x)\}
    ```
    とすると, $`\beta`$ は $`X`$ 上の開基であり, $`\beta`$ の生成する位相と $`\mathcal{B}`$ の生成する位相は一致する.

<u>proof.</u>
:   $`x\in X`$ と $`U\in\mathcal{U}(x)`$ を取る.
    近傍系の公理より $`V\in\mathcal{U}(x)`$ であって, 各 $`y\in V`$ に対し $`U\in\mathcal{U}(y)`$ を満たすものがある.
    $`G\coloneqq\{y\in X\mid U\in\mathcal{U}(y)\}`$ とおくと $`V\subseteq G`$ であるから $`G\in\mathcal{U}(x)`$ である.
    また $`y\in G`$ に対して同じ公理を $`U\in\mathcal{U}(y)`$ に適用すると, ある $`W\in\mathcal{U}(y)`$ が $`W\subseteq G`$ を満たす.
    よって $`G\in\mathcal{U}(y)`$ であり, $`G\in\beta`$ である.
    したがって $`\beta`$ は各点で近傍基となり, 開基の公理を満たす.
    さらに上の構成は $`\mathcal{U}(x)`$ の任意の元を含む $`\beta`$ の元を与えるので, $`\beta`$ の生成する近傍系は $`\mathcal{U}`$ と一致する.

Proposition. **開基の定める近傍基**
:   集合 $`X`$ 上の開基 $`\beta`$ に対して, 写像 $`\mathcal{B}:X\to2^{2^X}`$ を
    ```math
    \mathcal{B}(x)\coloneqq\{B\in\beta\mid x\in B\},\quad x\in X
    ```
    とすると, $`\mathcal{B}`$ は $`X`$ 上の近傍基であり, $`\beta`$ の生成する位相と $`\mathcal{B}`$ の生成する位相は一致する.

<u>proof.</u>
:   開基が $`X`$ を被覆するので $`\mathcal{B}(x)`$ は空でない.
    $`B_1,B_2\in\mathcal{B}(x)`$ に対して, 開基の交叉条件から $`x`$ を含み $`B_1\cap B_2`$ に含まれる基の元が存在する.
    よって各 $`\mathcal{B}(x)`$ はフィルター基である.
    さらに $`B\in\mathcal{B}(x)`$ とすると, $`B`$ は開集合なので各 $`y\in B`$ に対して $`B\in\mathcal{B}(y)`$ である.
    これが近傍基の二条件を与える.
    したがってこの近傍基から得る開集合は, ちょうど $`\beta`$ の元の合併である.

位相空間 $`X`$ と台集合 $`X_0`$ 上の開集合系 $`\mathbf{O}`$ に対して, $`\mathbf{O}`$ の生成する近傍系が $`X`$ の近傍系 $`\mathcal{N}_X`$ と一致するとき $`\mathbf{O}`$ を位相空間 $`X`$ の開集合系という.
位相空間 $`X`$ の開集合系 $`\mathbf{O}`$ に対して, $`G\in\mathbf{O}`$ を **位相空間 $`X`$ の開集合** (*open set on $`X`$*) といい, $`F^\complement=X_0\setminus F\in\mathbf{O}`$ となる $`F`$ を **位相空間 $`X`$ の閉集合** (*closed set on $`X`$*) という.

Lemma.
:   位相空間 $`X,Y`$ と写像 $`f:X\to Y`$ と $`x_0\in X`$ に対して, 以下同値.
    1. $`f`$ は $`x_0`$ で連続である.
    2. $`f(x_0)`$ を含むような任意の開集合 $`G\subseteq Y`$ に対して $`f^{-1}(G)`$ は $`x_0`$ の近傍である.

<u>proof.</u>
:   $`f`$ が $`x_0`$ で連続であるとする.
    $`f(x_0)\in G`$ かつ $`G`$ が開であれば, $`G`$ は $`f(x_0)`$ の近傍である.
    連続性から $`f^{-1}(G)`$ は $`x_0`$ の近傍となる.

    逆に条件 2 を仮定する.
    $`f(x_0)`$ の任意の近傍 $`V`$ は, $`f(x_0)\in G\subseteq V`$ を満たす開集合 $`G`$ を含む.
    条件 2 により $`f^{-1}(G)`$ は $`x_0`$ の近傍であり, $`f^{-1}(G)\subseteq f^{-1}(V)`$ である.
    よって $`f^{-1}(V)`$ は $`x_0`$ の近傍である.
    したがって $`f`$ は $`x_0`$ で連続である.

Theorem. **連続性の開集合による特徴づけ**
:   位相空間 $`X,Y`$ と写像 $`f:X\to Y`$ に対して, 以下同値.
    1. $`f`$ は連続である.
    2. 任意の開集合 $`G\subseteq Y`$ に対して $`f^{-1}(G)`$ は $`X`$ の開集合である.

<u>proof.</u>
:   $`f`$ が連続ならば, 任意の $`x\in X`$ に前の補題を適用して条件 2 を得る.

    逆に条件 2 を仮定する.
    $`x\in X`$ と $`f(x)`$ を含む開集合 $`G`$ をとると, $`f^{-1}(G)`$ は開集合であり $`x`$ を含むので $`x`$ の近傍である.
    前の補題により $`f`$ は $`x`$ で連続である.
    $`x`$ は任意であったから $`f`$ は連続である.

したがって、通常の「開集合の逆像が開集合」という条件は、近傍系による連続性の大域的な特徴づけとして得られる。

### 部分空間, 開写像, 閉写像, 商写像, 埋め込み

連続性は開集合の逆像を扱う条件である.
部分空間は部分集合へ元の位相を制限する構成である.
開写像と閉写像はそれぞれ開集合と閉集合の像を扱い, 商写像と埋め込みは位相を押し出す場合と部分空間へ取り込む場合を記述する.

Definition. **部分空間**
:   位相空間 $`X`$ と部分集合 $`S\subseteq X_0`$ に対して,
    ```math
    \mathbf O_S\coloneqq\{G\cap S\mid G\in\mathbf O_X\}
    ```
    は $`S`$ 上の開集合系となる.
    この開集合系を備えた $`S`$ を $`X`$ の **部分空間** といい, $`S`$ に入るこの位相を **部分空間位相** または **相対位相** という.

Definition. **開写像と閉写像**
:   位相空間の間の写像 $`f:X\to Y`$ が, 任意の開集合 $`G\subseteq X`$ に対して $`f(G)`$ が $`Y`$ で開となるとき **開写像** (*open map*) という.
    任意の閉集合 $`F\subseteq X`$ に対して $`f(F)`$ が $`Y`$ で閉となるとき **閉写像** (*closed map*) という.

Definition. **商写像**
:   全射連続写像 $`q:X\to Y`$ が **商写像** (*quotient map*) であるとは,
    ```math
    \mathbf O_Y=\{G\subseteq Y\mid q^{-1}(G)\in\mathbf O_X\}
    ```
    が成り立つときいう.

Definition. **位相的埋め込み**
:   連続単射 $`e:X\to Y`$ が **位相的埋め込み** (*topological embedding*) であるとは, $`e:X\to e(X)`$ が, $`e(X)`$ に $`Y`$ の部分空間位相を入れたとき同相写像となるときいう.

Proposition. **埋め込みと商写像の特徴づけ**
:   位相空間 $`X,Y`$ の間の連続写像 $`f:X\to Y`$ に対して, 次が成り立つ.
    1. $`f`$ が全射であるならば, $`f`$ が商写像であることと,
        ```math
        \mathbf O_Y=\{G\subseteq Y\mid f^{-1}(G)\in\mathbf O_X\}
        ```
        が成り立つことは同値である.
    2. $`f`$ が単射であるならば, $`f`$ が位相的埋め込みであることと,
        ```math
        \mathbf O_X=\{f^{-1}(G)\mid G\in\mathbf O_Y\}
        ```
        が成り立つことは同値である.

<u>proof.</u>
:   $`f`$ が全射である場合, 商写像の定義は
    ```math
    \mathbf O_Y=\{G\subseteq Y\mid f^{-1}(G)\in\mathbf O_X\}
    ```
    を要求する.
    よって (1) は商写像の定義そのものである.
    次に $`f`$ が単射である場合を考える.
    $`f`$ が埋め込みであると仮定する.
    $`f:X\to f(X)`$ は同相写像であるから, 任意の $`U\in\mathbf O_X`$ に対して $`f(U)`$ は $`f(X)`$ の開集合である.
    部分空間位相の定義により, ある $`G\in\mathbf O_Y`$ が存在して $`f(U)=G\cap f(X)`$ となる.
    単射性から $`U=f^{-1}(G)`$ であり, $`\mathbf O_X\subseteq\{f^{-1}(G)\mid G\in\mathbf O_Y\}`$ が得られる.
    逆に $`G\in\mathbf O_Y`$ なら $`f^{-1}(G)`$ は $`f`$ の連続性により $`X`$ で開集合である.
    よって集合の等式 (2) が成り立つ.
    逆に (2) を仮定する.
    $`f`$ の連続性から, $`f:X\to f(X)`$ は連続である.
    任意の $`U\in\mathbf O_X`$ に対して (2) により $`U=f^{-1}(G)`$ となる $`G\in\mathbf O_Y`$ が存在する.
    単射性から $`f(U)=G\cap f(X)`$ であり, $`f(U)`$ は $`f(X)`$ の開集合である.
    したがって $`f:X\to f(X)`$ は開写像であり, 連続全単射の逆写像は連続となる.
    よって $`f:X\to f(X)`$ は同相写像であり, $`f`$ は位相的埋め込みである.

Proposition. **開写像または閉写像による同相性**
:   全単射な連続写像 $`f:X\to Y`$ が開写像または閉写像であれば, $`f`$ は同相写像である.

Proof.
:   $`f`$ が開写像なら, $`Y`$ の開集合 $`G`$ に対して $`f^{-1}(G)`$ は開であり, その $`f^{-1}`$ による逆像は $`f(f^{-1}(G))=G`$ である.
    よって $`f^{-1}`$ は連続である.
    $`f`$ が閉写像の場合も, $`Y`$ の閉集合の逆像が $`X`$ で閉となることを同様に示せる.
    したがっていずれの場合も $`f`$ とその逆写像は連続であり, $`f`$ は同相写像である.

### 開核と閉包

Definition. **開核作用素**
:   **集合 $`X`$ 上の開核作用素** (*interior operator on a set $`X`$*) とは, 写像 $`i:2^X\to2^X`$ であって次の条件を満たすときいう:
    - $`i(X)=X`$.
    - 任意の $`A\in 2^X`$ に対して $`i(A)\subseteq A`$.
    - 任意の $`A\in 2^X`$ に対して $`i(i(A))=i(A)`$.
    - 任意の $`A,B\in2^X`$ に対して $`i(A\cap B)=i(A)\cap i(B)`$.

Theorem. **開核作用素の定める位相構造**
:   集合 $`X`$ 上の開核作用素 $`i`$ に対して, $`X`$ 上の写像 $`\mathcal{N}:X\to\operatorname{Fil}(X)`$ を
    ```math
    \mathcal{N}(x)\coloneqq\{U\subseteq X\mid x\in i(U)\}
    ```
    とすると, $`\mathcal{N}`$ は $`X`$ 上の近傍系となる. $`\mathcal{N}`$ を $`i`$ の生成する近傍系といい, 位相空間 $`(X,\mathcal{N})`$ を $`i`$ の生成する位相空間という.

<u>proof.</u>
:   まず $`i`$ は単調である.
    実際, $`A\subseteq B`$ なら $`A=A\cap B`$ であるから
    $`i(A)=i(A)\cap i(B)\subseteq i(B)`$ となる.
    $`i(X)=X`$ より $`X\in\mathcal{N}(x)`$ である.
    $`U,V\in\mathcal{N}(x)`$ なら $`x\in i(U)\cap i(V)=i(U\cap V)`$ であり, $`U\cap V\in\mathcal{N}(x)`$ である.
    $`U\in\mathcal{N}(x)`$ と $`U\subseteq V`$ なら単調性から $`x\in i(V)`$ となる.
    また $`x\in i(U)`$ なら $`i(U)\subseteq U`$ より $`x\in U`$ である.
    最後に $`U\in\mathcal{N}(x)`$ とすると, 冪等性から $`i(U)\in\mathcal{N}(x)`$ である.
    各 $`y\in i(U)`$ について $`i(U)\subseteq U`$ だから $`U\in\mathcal{N}(y)`$ となる.
    以上で近傍系の局所性の公理も満たされる.

Definition. **閉包作用素**
:   **集合 $`X`$ 上の閉包作用素** (*closure operator on a set $`X`$*) とは, 写像 $`c:2^X\to2^X`$ であって次の条件を満たすときいう:
    - $`c(\emptyset)=\emptyset`$.
    - 任意の $`A\in 2^X`$ に対して $`A\subseteq c(A)`$.
    - 任意の $`A\in 2^X`$ に対して $`c(c(A))=c(A)`$.
    - 任意の $`A,B\in2^X`$ に対して $`c(A\cup B)=c(A)\cup c(B)`$.

Proposition. **開核作用素と閉包作用素の関係**
:   集合 $`X`$ 上の閉包作用素 $`c`$ に対して, 写像 $`i:2^X\to2^X`$ を
    ```math
    i(A)=X\setminus c(X\setminus A),\quad A\in2^X
    ```
    とすると, $`i`$ は $`X`$ 上の開核作用素となる.
    $`i`$ を $`c`$ の定める開核作用素という.

<u>proof.</u>
:   $`c(\emptyset)=\emptyset`$ より $`i(X)=X\setminus c(\emptyset)=X`$ である.
    膨張性 $`X\setminus A\subseteq c(X\setminus A)`$ の補集合をとれば $`i(A)\subseteq A`$ を得る.
    冪等性から
    ```math
    i(i(A))=X\setminus c\bigl(X\setminus(X\setminus c(X\setminus A))\bigr)
    =X\setminus c(c(X\setminus A))=i(A)
    ```
    となる.
    また De Morgan の法則と有限合併保存性から
    ```math
    \begin{aligned}
    i(A\cap B)
    &=X\setminus c((X\setminus A)\cup(X\setminus B))\\
    &=X\setminus\bigl(c(X\setminus A)\cup c(X\setminus B)\bigr)\\
    &=i(A)\cap i(B).
    \end{aligned}
    ```
    よって $`i`$ は開核作用素のすべての公理を満たす.

$`X`$ 上の閉包作用素 $`c`$ と $`c`$ の定める開核作用素 $`i`$ に対して, $`i`$ の生成する位相空間を $`c`$ の生成する位相空間という.

Theorem. **位相構造の定める開核作用素**
:   集合 $`X`$ 上の近傍系 $`\mathcal{N}`$ に対して, 写像 $`(-)^\circ:2^X\to2^X`$ を
    ```math
    A^\circ\coloneqq\{x\in X\mid A\in\mathcal{N}(x)\}
    ```
    とすると, $`(-)^\circ`$ は $`X`$ 上の開核作用素となり, $`(-)^\circ`$ の定める近傍系は $`\mathcal{N}`$ と一致する. $`(-)^\circ`$ を位相空間 $`(X,\mathcal{N})`$ の定める開核作用素という.

<u>proof.</u>
:   $`X\in\mathcal{N}(x)`$ が任意の $`x`$ に対して成り立つので $`X^\circ=X`$ である.
    $`x\in A^\circ`$ なら $`A\in\mathcal{N}(x)`$ であり, 近傍系の第一公理から $`x\in A`$ である.
    よって $`A^\circ\subseteq A`$ である.
    $`x\in A^\circ`$ とする.
    近傍系の局所性の公理から, $`V\in\mathcal{N}(x)`$ であって各 $`y\in V`$ に対して $`A\in\mathcal{N}(y)`$ を満たすものがある.
    このとき $`V\subseteq A^\circ`$ だから $`A^\circ\in\mathcal{N}(x)`$ であり, $`x\in(A^\circ)^\circ`$ である.
    逆の包含は $`A^\circ\subseteq A`$ と単調性から従うので, 開核は冪等である.
    また $`A\cap B\in\mathcal{N}(x)`$ はフィルターの公理により $`A,B\in\mathcal{N}(x)`$ と同値である.
    よって $`(A\cap B)^\circ=A^\circ\cap B^\circ`$ である.
    $`i(A)=A^\circ`$ として定める近傍系は, 定義から $`A\in\mathcal{N}(x)`$ と $`x\in i(A)`$ が同値であるため, 元の $`\mathcal{N}`$ に一致する.

位相空間 $`X`$ に対して, 点 $`x\in X`$ が部分集合 $`A\subseteq X`$ の **内点** (*interior point*) であるとは, $`x\in A^\circ`$ であるときいう.
他方, 点 $`x`$ が $`A^\complement=X\setminus A`$ の内点であるとき, 点 $`x`$ を $`A`$ の **外点** (*exterior point*) という.
さらに, 点 $`x`$ が $`A`$ の内点でないかつ外点でないとき, 点 $`x`$ を $`A`$ の **境界点** (*boundary point*) という.

Theorem. **位相構造の定める閉包作用素**
:   集合 $`X`$ 上の近傍系 $`\mathcal{N}`$ に対して, 写像 $`\overline{(-)}:2^X\to2^X`$ を
    ```math
    \overline{A}\coloneqq\{x\in X\mid\forall U\in\mathcal{N}(x),U\cap A\neq\emptyset\}
    ```
    とすると, $`\overline{(-)}`$ は $`X`$ 上の閉包作用素となり, $`\overline{(-)}`$ の定める近傍系は $`\mathcal{N}`$ と一致する. $`\overline{(-)}`$ を位相空間 $`(X,\mathcal{N})`$ の定める閉包作用素という.

<u>proof.</u>
:   空集合はどの近傍とも交わらないから $`\overline{\emptyset}=\emptyset`$ である.
    $`x\in A`$ なら任意の $`x`$ の近傍は $`x`$ を含むので $`A`$ と交わる.
    よって $`A\subseteq\overline{A}`$ である.
    $`x\notin\overline{A}`$ なら, $`A`$ と交わらない近傍 $`U\in\mathcal{N}(x)`$ がある.
    局所性により $`V\in\mathcal{N}(x)`$ であって各 $`y\in V`$ に対して $`U\in\mathcal{N}(y)`$ を満たすものを取れる.
    このとき $`V\cap\overline{A}=\emptyset`$ である.
    実際, $`y\in V`$ なら $`U`$ は $`y`$ の近傍で $`U\cap A=\emptyset`$ なので $`y\notin\overline{A}`$ である.
    したがって $`x\notin\overline{\overline{A}}`$ であり, 膨張性と合わせて冪等性が従う.
    $`x\notin\overline{A}`$ かつ $`x\notin\overline{B}`$ なら, それぞれ $`A,B`$ と交わらない $`x`$ の近傍 $`U,V`$ がある.
    $`U\cap V`$ は $`A\cup B`$ と交わらない近傍であるから, 対偶により
    $`\overline{A\cup B}\subseteq\overline{A}\cup\overline{B}`$ を得る.
    逆の包含は単調性から従うので, 有限和保存性が成り立つ.
    最後に, 閉包作用素から得る開核は $`i(U)=X\setminus\overline{X\setminus U}`$ である.
    $`x\in i(U)`$ は $`X\setminus U`$ と交わらない $`x`$ の近傍が存在することと同値であり, これは上方閉性により $`U\in\mathcal{N}(x)`$ と同値である.
    したがって再構成される近傍系は $`\mathcal{N}`$ に一致する.

位相空間 $`X`$ に対して, 点 $`x\in X`$ が部分集合 $`A\subseteq X`$ の **触点** (*adherent point*) であるとは, $`x\in\overline{A}`$ であるときいう.
他方, 点 $`x`$ が $`A\setminus\{x\}`$ の触点であるとき, 点 $`x`$ を $`A`$ の **集積点** (*accumulation point*) という.
さらに, 点 $`x`$ が $`A`$ の集積点でないとき 点 $`x`$ を $`A`$ の **孤立点** (*isolated point*) という.

Definition.
:   位相空間 $`X`$ の部分集合 $`A\in2^X`$ の境界点全体を $`\partial A`$ とし, これを $`A`$ の境界という.

Proposition.
:   このとき, 次がそれぞれ成り立つ.
    - $`\overline{A}=A^\circ\sqcup\partial{A}`$,
    - $`\partial{A}=\overline{A}\cap\overline{A^\complement}`$,
    - $`\overline{A\cap B}\subseteq\overline{A}\cap\overline{B}`$ であり, $`\partial{A}\cap\partial{B}=\emptyset`$ であれば等号が成り立つ.

<u>proof.</u>
:   境界の定義から $`\partial A=\overline A\setminus A^\circ`$ である.
    $`A^\circ\subseteq\overline A`$ であるから, 第一式が従う.
    また $`x\in\partial A`$ であることは, $`x`$ の任意の近傍が $`A`$ と $`A^\complement`$ の双方と交わることと同値である.
    これは第二式に等しい.
    単調性から $`\overline{A\cap B}\subseteq\overline A\cap\overline B`$ である.
    逆に $`x\in\overline A\cap\overline B`$ とし $`\partial A\cap\partial B=\emptyset`$ を仮定する.
    $`x`$ は $`A`$ と $`B`$ の双方の閉包に属するから, それぞれの内点または境界点である.
    境界点の場合には他方の境界点ではないので他方の内点である.
    したがって任意の $`x`$ の近傍を必要なら他方の内部に含まれる近傍と交叉させれば, $`A\cap B`$ と交わる近傍を得る.
    よって $`x\in\overline{A\cap B}`$ であり, 等号が成り立つ.

### 距離の誘導する位相

Definition. **開球**
:   距離空間 $`X`$ の点 $`x\in X`$ と $`r>0`$ に対して,
    ```math
    B_r(x)\coloneqq\{y\in X\mid d_X(x,y) < r\}
    ```
    を, **点 $`x`$ を中心とする半径 $`r`$ の開球** (*open ball of radius $`r`$ centered at a point $`x`$*) という.

Proposition. **距離の定める位相構造**
:   距離空間 $`X`$ に対して, $`X`$ の台集合上の近傍基 $`\mathcal{B}`$ を
    ```math
    \mathcal{B}(x)\coloneqq\{B_r(x)\mid r>0\},\quad x\in X
    ```
    を満たすものが存在する.

<u>proof.</u>
:   各 $`x`$ における正半径の開球全体は $`x`$ を含む.
    二つの開球 $`B_r(x),B_s(x)`$ に対し, $`t=\min(r,s)>0`$ とおけば
    ```math
    B_t(x)\subseteq B_r(x)\cap B_s(x)
    ```
    である.
    よって各点で有限交叉に関して有向であり, フィルター基をなす.
    $`y\in B_r(x)`$ に対して $`s=r-d(x,y)>0`$ とおけば, 三角不等式から
    ```math
    B_s(y)\subseteq B_r(x)
    ```
    となる.
    したがってこのフィルター基は近傍基の公理を満たし, 所望の近傍系を生成する.

上記の近傍基により生成される位相構造を **$`(X,d)`$ の距離位相** (*metric topology on $`(X,d)`$*) という.

Proposition. **距離位相による連続性の整合性**
:   距離空間 $`X,Y`$ と写像 $`f:X\to Y`$ に対して以下同値:
    1. $`f`$ は距離空間の間の連続写像である.
    2. 距離位相により $`f`$ は位相空間の間の連続写像である.

<u>proof.</u>
:   距離空間における連続性は, 任意の $`x\in X`$ と $`\varepsilon>0`$ に対して
    ```math
    d_X(x,y)<\delta\Longrightarrow d_Y(f(x),f(y))<\varepsilon
    ```
    を満たす $`\delta>0`$ が存在することとして定義される.
    これは開球 $`B_\delta(x)`$ の像が $`B_\varepsilon(f(x))`$ に含まれるということである.
    開球はそれぞれ距離位相の近傍基なので, これは近傍による位相的連続性の定義と同値である.

以後, 距離空間には距離位相による位相構造が備わっているとして, 適宜位相空間として扱えることとする.

位相空間 $`X`$ に対して, $`X`$ の台集合上の距離 $`d`$ が存在して距離空間 $`(X,d)`$ が位相空間 $`X`$ と同相になるとき, $`X`$ は **距離化可能** (*metrizable*) であるといい, 距離化可能な位相空間を **距離化可能空間** (*metrizable space*) という.

Definition.
:   位相空間 $`X`$ の部分集合 $`A\in2^X`$ の集積点全体を $`A^d`$ とし, これを $`A`$ の**導来集合** (*derived set*) という.
    $`A\subseteq A^d`$ な $`A`$ を **自己稠密集合** (*dense-in-itself set*) といい, 特に $`A=A^d`$ な $`A`$ を **完全集合** (*perfect set*) という.

Definition. **正則開集合**
:   位相空間 $`X`$ に対して, 開集合 $`G`$ が $`\overline{G}^\circ=G`$ を満たすとき, $`G`$ を **正則開集合** (*regular open set*) という.

Definition. **稠密と疎**
:   位相空間 $`X`$ に対して, 部分集合 $`S\in2^X`$ が $`X=\overline{S}`$ を満たすとき $`S`$ は $`X`$ において **稠密** (*dense*) であるという.
    他方, 部分集合 $`S\in2^X`$ が $`\overline{S}^\circ=\emptyset`$ を満たすとき, $`S`$ は $`X`$ における **疎集合** (*nowhere dense set*) という.

Definition. **痩集合**
:   位相空間 $`X`$ の部分集合 $`S`$ が $`X`$ の疎集合の可算和で表現できるとき **痩せている** (*meager in $`X`$*) といい, 痩せている集合を **痩集合** (*meager set*) あるいは **第一類集合** (*set of the first category*) という. 他方, 痩集合でない集合を **非痩集合** (*nonmeager set*) あるいは **第二類集合** (*set of the second category*) という.
    特に, 位相空間 $`X`$ の台集合自体が痩せているとき, $`X`$ を **痩空間** (*meager space*) あるいは第一類空間という. 他方, 痩空間でない位相空間を **非痩空間** (*nonmeager space*) あるいは第二類空間という.
    また, 補集合 $`S^\complement=X\setminus S`$ が痩せているような集合 $`S`$ を **補痩である** (*comeager*) あるいは **残留的である** (*residual*) という.
