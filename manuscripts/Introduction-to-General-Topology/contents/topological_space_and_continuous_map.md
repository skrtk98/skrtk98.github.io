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

Definition. **近傍系の強弱**
:   集合 $`X`$ 上の近傍系 $`\mathcal{u},\mathcal{U}`$ が, 各 $`x\in X`$ に対して $`\mathcal{u}(x)\subseteq\mathcal{U}(x)`$ であるとき, $`\mathcal{U}`$ は $`\mathcal{u}`$ より **強い** (*strong*) といい, $`\mathcal{u}`$ は $`\mathcal{U}`$ より **弱い** (*week*) という.

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

Definition. **近傍系の強弱**
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
    が成り立つときいう. 特に, 全ての $x_0\in X$ で連続な写像 $`f:X_0\to Y_0`$ を, **連続写像** (*Continuous function*) といい,
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

Definition. **順序位相**
:   線型順序集合 $`(X,\leq)`$ に対して, 開区間と開半直線からなる集合族
    ```math
    \mathcal{B}_{\leq}
    =\{(a,b)\mid a,b\in X, a<b\}
    \cup\{(-\infty,b)\mid b\in X\}
    \cup\{(a,\infty)\mid a\in X\}
    ```
    を開基として生成される位相を $`X`$ の **順序位相** (*order topology*) と呼ぶ.
    ここで
    ```math
    (a,b)=\{x\in X\mid a<x<b\},\quad
    (-\infty,b)=\{x\in X\mid x<b\},\quad
    (a,\infty)=\{x\in X\mid a<x\}
    ```
    と定める.

Proposition. **順序位相の Hausdorff 性**
:   順序位相を備えた線型順序集合 $`X`$ は Hausdorff 空間である.

<u>proof.</u>
:   異なる二点 $`x,y\in X`$ をとり, $`x<y`$ としてよい.
    $`x<z<y`$ を満たす $`z\in X`$ が存在するなら, $`(-\infty,z)`$ と $`(z,\infty)`$ はそれぞれ $`x`$ と $`y`$ を含む交わらない開集合である.
    そのような $`z`$ が存在しないなら, $`(-\infty,y)`$ と $`(x,\infty)`$ が $`x`$ と $`y`$ の交わらない開近傍となる.
    よって $`X`$ は Hausdorff 空間である.

Example. **順序位相の例**
:   実数全体に通常の大小関係による順序位相を与えると, 通常の実数直線が得られる.
    順序数 $`\omega_1`$ に順序位相を与えた空間は, 局所コンパクト性と可算コンパクト性を持つ非可算な例である.
    Alexandroff 直線も, 閉長半直線に順序位相を与える構成から定まる.

Definition. **線型連続体**
:   線型順序集合 $`(X,\leq)`$ が **線型連続体** (*linear continuum*) であるとは, 次の条件を満たすときいう.
    1. $`x<y`$ ならば, $`x<z<y`$ を満たす $`z\in X`$ が存在する.
    2. 空でなく上に有界な任意の部分集合 $`A\subseteq X`$ が $`X`$ において上限をもつ.
    線型連続体に順序位相を与えた空間を線型連続体空間とも呼ぶ.

Example. **線型連続体の例**
:   $`\mathbb R`$, 任意の実数閉区間 $`[a,b]`$, および長直線は線型連続体である.
    一方, $`\mathbb Q`$ は上限性を満たさず, $`\mathbb Z`$ は順序密度を満たさない.

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
位相空間 $`X`$ の開集合系き $`\mathbf{O}`$ に対して, $`G\in\mathbf{O}`$ を **位相空間 $`X`$ の開集合** (*open set on a $`X`$*) といい, $`F^\complement=X_0\setminus F\in\mathbf{O}`$ となる $`F`$ を **位相空間 $`X`$ の閉集合** (*closed set on a $`X`$*) という.

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

### 位相空間上のネット

Definition. **有向集合**
:   前順序集合 $`(\Lambda,\leq)`$ が **有向集合** (*directed set*) であるとは, 任意の $`a,b\in\Lambda`$ に対して $`a\leq c`$ かつ $`b\leq c`$ を満たす $`c\in\Lambda`$ が存在するときいう.

Definition. **ネット**
:   集合 $`X`$ と有向集合 $`(\Lambda,\leq)`$ に対して, 写像 $`\Lambda\to X,\lambda\mapsto x_\lambda`$ を $`(\Lambda,\leq)`$ によって添字付けられた **$`X`$ のネット** (*net in $`X`$*) といい, $`(x_\lambda)_{\lambda\in\Lambda}`$ と表す.

特に, 非負整数全体は大小関係により有向集合となるため, それにより添字付けられたネットを **点列** (*sequence of points*) という.

Definition. **部分ネット**
:   有向集合 $`(\Lambda,\leq_\Lambda)`$ に対して, $`X`$ のネット $`x=(x_\lambda)_{\lambda\in\Lambda}`$ の **部分ネット** (*subnet*) とは, 有向集合 $`(I,\leq_I)`$ で添字付けられた $`X`$ のネット $`y=(y_i)_{i\in I}`$ であって, 以下を満たす写像 $`s:I\to\Lambda`$ が存在するときいう:
    - $`y=x\circ s`$. (i.e. $`\forall i\in I,y_i=x_{s(i)}`$)
    - **単調性**: 任意の $`i,i'\in I`$ に対して $`i\leq_I i'`$ ならば $`s(i)\leq_\Lambda s(i')`$.
    - **共終性**: 任意の $`\lambda\in\Lambda`$ に対して $`\lambda\leq_\Lambda s(i)`$ を満たす $`i\in I`$ が存在する.

点列 $`(x_n)`$ の **部分点列** (*subsequence of points*) とは, 点列 $`(y_n)`$ であって, 以下を満たす非負整数全体からそれ自体への写像 $`s`$ が存在するときいう:
- $`y=x\circ s`$. (i.e. $`\forall i\in I,y_i=x_{s(i)}`$)
- **狭義単調性**: 任意の非負整数 $`m,n`$ に対して $`m<n`$ ならば $`s(m)<s(n)`$.
- **共終性**: 任意の非負整数 $`n`$ に対して $`n\leq s(m)`$ を満たす非負整数 $`m`$ が存在する.

Definition. **eventually in, frequently in**
:   集合 $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ と部分集合 $`A\subseteq X`$ に対して,
    - **$`(x_\lambda)_{\lambda\in\Lambda}`$ is eventually in $`A`$** $`\mathrel{\overset{\text{def}}{\iff}}`$ $`\exists\lambda_0\in\Lambda\text{ s.t. }\forall\lambda\in\Lambda,\lambda_0\leq\lambda\Rightarrow x_\lambda\in A`$.
    - **$`(x_\lambda)_{\lambda\in\Lambda}`$ is frequently in $`A`$** $`\mathrel{\overset{\text{def}}{\iff}}`$ $`\forall\lambda\in\Lambda,\exists\lambda_0\in\Lambda\text{ s.t. }\lambda\leq\lambda_0\land x_{\lambda_0}\in A`$.

定義より明らかに, $`(x_\lambda)_{\lambda\in\Lambda}`$ is eventually in $`A`$ $`\Rightarrow`$ $`(x_\lambda)_{\lambda\in\Lambda}`$ is frequently in $`A`$ である.

Proposition.
:   $`(x_\lambda)_{\lambda\in\Lambda}`$ is eventually in $`A`$ $`\iff`$ $`(x_\lambda)_{\lambda\in\Lambda}`$ is not frequently in $`X\setminus A`$

<u>proof.</u>
:   ある添字以後すべての項が $`A`$ に属することは, その添字以後に $`X\setminus A`$ の項が存在しないことと同値である.
    これは「$`X\setminus A`$ に頻繁に属する」の否定そのものである.

Definition. **普遍ネット**
:   集合 $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ が **普遍ネット** (*universal net*) あるいは **超ネット** (*ultranet*) であるとは, 任意の $`A\subseteq X`$ に対して次のいずれかの条件が成り立つときいう:
    - $`(x_\lambda)_{\lambda\in\Lambda}`$ is eventually in $`A`$
    - $`(x_\lambda)_{\lambda\in\Lambda}`$ is eventually in $`X\setminus A`$

Theorem. **普遍部分ネットの存在**
:   任意のネットに対して普遍ネットであるような部分ネットが存在する.

<u>proof.</u>
:   ネットの尾部集合全体が生成するフィルターを $`\mathcal F`$ とする.
    超フィルター補題により $`\mathcal F`$ を細分する超フィルター $`\mathcal M`$ が存在する.
    フィルター基からネットを作る標準構成を $`\mathcal M`$ に適用すると, 得られるネットは元のネットの部分ネットとなる.
    超フィルターの補集合による特徴づけから, 任意の部分集合 $`A`$ について $`A\in\mathcal M`$ または $`A^\complement\in\mathcal M`$ が成り立つ.
    これは対応するネットが $`A`$ または $`A^\complement`$ に最終的に属することを意味する.
    よってこの部分ネットは普遍ネットである.

Definition. **ネットの収束**
:   位相空間 $`X`$ と $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ と 点 $`x\in X`$ に対して, 条件
    ```math
    \forall U\in\mathcal{N}_X(x),(x_\lambda)_{\lambda\in\Lambda}\text{ is eventually in }U
    ```
    を満たすとき, $`x`$ を **ネット $`(x_n)`$ の極限点** (*limit point of a net $`(x_n)`$*) といい, 極限の存在するネットは**収束する** (*converge*) といい, 収束しないネットは**発散する** (*diverge*) という.

Definition. **ネットの堆積**
:   位相空間 $`X`$ と $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ と 点 $`x\in X`$ に対して, 条件
    ```math
    \forall U\in\mathcal{N}_X(x),(x_\lambda)_{\lambda\in\Lambda}\text{ is frequently in }U
    ```
    を満たすとき, $`x`$ を **ネット $`(x_n)`$ の堆積点** (*cluster point of a net $`(x_n)`$*) という.

Theorem. **堆積点の特徴づけ**
:   位相空間 $`X`$ と $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`x`$ は $`(x_n)`$ の堆積点である.
    2. $`(x_n)`$ の部分ネットで $`x`$ に収束するものが存在する.

<u>proof.</u>
:   (2) から (1) は, 部分ネットの共終性により明らかである.
    逆に (1) を仮定する.
    添字集合を, $`x`$ の近傍 $`U`$ と添字 $`\lambda`$ の組であって $`x_\lambda\in U`$ を満たすもの全体とする.
    近傍の縮小と元の添字集合の有向性を併せた順序を入れると, 堆積点の条件によりこれは有向集合となる.
    第二成分への射影は元の添字集合への単調共終写像であり, その合成ネットは任意の近傍 $`U`$ に最終的に属する.
    よって得られる部分ネットは $`x`$ に収束する.

Theorem.
:   位相空間 $`X`$ と部分集合 $`A\subseteq X`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`x\in\overline{A}`$.
    2. $`x`$ に収束する $`A`$ のネットが存在する.

<u>proof.</u>
:   $`x\in\overline A`$ なら, $`x`$ の近傍 $`U`$ ごとに一点 $`a_U\in U\cap A`$ を選ぶ.
    近傍を逆包含で順序づければ有向集合となり, ネット $`U\mapsto a_U`$ は $`A`$ 内にあって $`x`$ に収束する.
    逆に $`A`$ 内のネットが $`x`$ に収束すれば, 任意の $`x`$ の近傍はそのネットのある項を含むので $`A`$ と交わる.
    よって $`x\in\overline A`$ である.

Theorem.
:   位相空間 $`X,Y`$ と写像 $`f:X\to Y`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`f`$ は $`x`$ で連続である.
    2. $`x`$ に収束する任意のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ に対して, ネット $`(f(x_\lambda))_{\lambda\in\Lambda}`$ は $`f(x)`$ へ収束する.

<u>proof.</u>
:   $`f`$ が $`x`$ で連続なら, $`f(x)`$ の任意の近傍 $`V`$ の逆像は $`x`$ の近傍である.
    $`x_\lambda\to x`$ なら, その逆像に最終的に属するので $`f(x_\lambda)`$ は $`V`$ に最終的に属する.
    逆に (2) で $`f`$ が連続でないと仮定すると, ある $`f(x)`$ の近傍 $`V`$ について $`f^{-1}(V)`$ は $`x`$ の近傍でない.
    各 $`x`$ の近傍 $`U`$ から $`U\setminus f^{-1}(V)`$ の一点を選ぶネットは $`x`$ に収束するが, その像は $`V`$ に入らない.
    これは (2) に矛盾する.

### Arens-Fort 空間

Definition. **Arens-Fort 空間**
:   集合
    ```math
    A=(\mathbb N\times\mathbb N)\cup\{\infty\}
    ```
    に次の位相を入れる.
    $`\mathbb N\times\mathbb N`$ の各点は孤立点とし, $`\infty`$ の近傍は $`\infty`$ を含み, 各 $`n\in\mathbb N`$ に対してある $`m_n`$ が存在して
    ```math
    \{(n,m)\mid m\geq m_n\}\subseteq U
    ```
    を満たす集合 $`U`$ とする.
    この空間を **Arens-Fort 空間** (*Arens-Fort space*) と呼ぶ.

Proposition. **Arens-Fort 空間の性質**
:   Arens-Fort 空間は可算 Hausdorff 空間であり, $`\infty`$ で第一可算でない.
    また, コンパクトではない.

<u>proof.</u>
:   $`\infty`$ と孤立点 $`(n,m)`$ を分離するには, $`\infty`$ の近傍からその点を除けばよい.
    したがって空間は Hausdorff である.
    $`\mathbb N\times\mathbb N`$ と一点の和であるから可算でもある.
    $`\infty`$ の可算近傍基 $`(U_k)_{k\geq0}`$ が存在すると仮定する.
    各 $`k`$ に対して, $`U_k`$ の $`k`$ 行に含まれる点 $`(k,m_k)`$ を一つ選ぶ.
    $`V=A\setminus\{(k,m_k)\mid k\in\mathbb N\}`$ は $`\infty`$ の近傍であるが, どの $`U_k`$ も $`V`$ に含まれない.
    これは $`(U_k)`$ が近傍基であることに反する.
    最後に, $`U=A\setminus\{(n,0)\mid n\in\mathbb N\}`$ と各一点集合 $`\{(n,0)\}`$ からなる開被覆を考える.
    $`U`$ と有限個の一点集合では $`A`$ を覆えないから, $`A`$ はコンパクトでない[^arens-fort].

### 位相空間上のフィルター

Definition. **有限交叉性**
:   集合 $`X`$ の部分集合族 $`\mathcal{F}`$ が **有限交叉性** (*finite intersection property*) を持つとは, $`\mathcal{F}`$ に属する任意の有限個の集合 $`F_i`$ ($`i=1,2,\ldots,n`$) に対して $`\bigcap_{i=1}^{n}F_i\neq\emptyset`$ を満たすときいう.

半順序集合 $`(2^X,\subseteq)`$ のフィルター(基)であって $`\emptyset`$ を含まないものを $`X`$ 上のフィルター(基)と呼び, 半順序集合 $`(2^X,\subseteq)`$ による細分関係をフィルター(基)同士の順序として導入する. 特に, $`X`$ 上のフィルター $`\mathcal{F},\mathcal{G}`$ に対して以下同値となる:
1. $`\mathcal{G}`$ は $`\mathcal{F}`$ の細分である.
2. 包含関係 $`\mathcal{F}\subseteq\mathcal{G}`$ が成り立つ.

Definition. **フィルターの両立**
:   $`X`$ 上のフィルター $`\mathcal{F},\mathcal{G}`$ に対して, 条件
    ```math
    \forall F\in\mathcal{F},\forall G\in\mathcal{G},F\cap G\neq\emptyset
    ```
    を満たすとき, $`\mathcal{F}`$ と $`\mathcal{G}`$ は両立しているという.

Proposition.
:   $`X`$ 上のフィルター $`\mathcal{F},\mathcal{G}`$ に対して, 以下同値:
    1. $`\mathcal{F}`$ と $`\mathcal{G}`$ は両立している.
    2. $`\mathcal{F}`$ と $`\mathcal{G}`$ は共通の細分を持つ.

<u>proof.</u>
:   (1) を仮定する.
    $`\{F\cap G\mid F\in\mathcal{F},G\in\mathcal{G}\}`$ は空集合を含まないフィルター基である.
    その生成するフィルターは $`\mathcal{F}`$ と $`\mathcal{G}`$ の共通細分となる.
    逆に共通細分 $`\mathcal{H}`$ があるなら, 任意の $`F\in\mathcal{F}`$ と $`G\in\mathcal{G}`$ はともに $`\mathcal{H}`$ に属する.
    したがって $`F\cap G\in\mathcal{H}`$ であり, フィルターの真性から $`F\cap G\neq\emptyset`$ である.

Definition.
:   両立している $`X`$ 上のフィルター $`\mathcal{F},\mathcal{G}`$ の **交わり** (*meet*) とは, $`X`$ 上のフィルター $`\mathcal{F}\wedge\mathcal{G}`$ であって, 次で定まる.
    ```math
    \mathcal{F}\wedge\mathcal{G}\coloneqq\{H\subseteq X\mid \exists F\in\mathcal{F},\exists G\in\mathcal{G},F\cap G\subseteq H\}
    ```
    これは $`\mathcal{F}`$ と $`\mathcal{G}`$ の共通細分のうち, 包含関係で最小のものである.

Proposition. **有限交叉族の生成するフィルター基**
:   集合 $`X`$ と有限交叉性を持つ $`X`$ の部分集合族 $`\mathcal{F}`$ に対して, $`X`$ の部分集合族 $`\mathcal{F}^\ast`$ を
    ```math
    \mathcal{F}^\ast\coloneqq\left\{\bigcap_{i=1}^{n}F_i\mathrel{}\middle|\mathrel{}F_i\in\mathcal{F}(i=1,2,\ldots,n),n\in\mathbf{Z}_{\geq1}\right\}
    ```
    とすると, $`\mathcal{F}^\ast`$ は $`\mathcal{F}`$ を含み有限交叉に閉じた最小のフィルター基となる.

<u>proof.</u>
:   $`\mathcal{F}`$ の元は $`n=1`$ として $`\mathcal{F}^\ast`$ に属する.
    また有限個の有限交叉の交わりは, 指標を併せれば再び $`\mathcal{F}^\ast`$ の元である.
    有限交叉性によりその元は空でないので, $`\mathcal{F}^\ast`$ はフィルター基である.
    さらに $`\mathcal{F}`$ を含み有限交叉に閉じた任意の集合族は, 有限回の交わりを取ることで $`\mathcal{F}^\ast`$ のすべての元を含む.
    したがって最小性が従う.

有限交叉性を持つ $`X`$ の部分集合族 $`\mathcal{F}`$ の生成するフィルター基 $`\mathcal{F}^\ast`$ に対して, $`\mathcal{F}^\ast`$ の生成するフィルターを $`\langle\mathcal{F}\rangle`$ と表し, これを $`\mathcal{F}`$ の生成するフィルターと呼ぶ. すなわち
```math
\langle\mathcal{F}\rangle
 =\{H\subseteq X\mid\exists F\in\mathcal{F}^\ast, F\subseteq H\}.
```
これは $`\mathcal{F}`$ を含むフィルターのうち包含関係で最小のものである. 特に, 空でない部分集合 $`A\subseteq X`$ のみからなる集合族 $`\{A\}`$ の生成するフィルター $`\langle\{A\}\rangle`$ を $`A`$ が生成する単項フィルターという.

Theorem. **超フィルターの存在**
:   集合 $`X`$ の空でない部分集合 $`A`$ に対して, $`A`$ を含むような $`X`$ 上の超フィルターが存在する.

<u>proof.</u>
:   $`A`$ を含む真のフィルター全体を包含関係で順序づける.
    空でない $`A`$ が生成する単項フィルターはこの集合に属するから, この順序集合は空でない.
    鎖 $`\{\mathcal{F}_i\}_{i\in I}`$ の和集合はフィルターの公理を満たし, 空集合を含まない.
    実際, 有限個の要素は鎖の比較可能性によって一つの $`\mathcal{F}_i`$ に同時に属する.
    よって Zorn の補題により極大元 $`\mathcal{M}`$ が存在する.
    この $`\mathcal{M}`$ は $`A`$ を含む超フィルターである.

Proposition. **超フィルターの特徴づけ**
:   集合 $`X`$ 上のフィルター $`\mathcal{M}`$ に対して, 以下同値.
    1. $`\mathcal{M}`$ は超フィルターである.
    2. 任意の $`A\in2^X`$ に対して, 各 $`M\in\mathcal{M}`$ で $`A\cap M\neq\emptyset`$ であれば $`A\in\mathcal{M}`$ である.
    3. 任意の $`A,B\subseteq X`$ に対して, $`A\cup B\in\mathcal{M}`$ ならば $`A\in\mathcal{M}`$ または $`B\in\mathcal{M}`$ である.
    4. 任意の $`A\in2^X`$ に対して, $`A\in\mathcal{M}`$ あるいは $`A^\complement\in\mathcal{M}`$ である.

<u>proof.</u>
:   (1)$`\Rightarrow`$(2) を示す.
    $`A`$ が各 $`M\in\mathcal{M}`$ と交わるなら, $`\mathcal{M}\cup\{A\}`$ は有限交叉性を持つ.
    これが生成するフィルターは $`\mathcal{M}`$ の細分であるから, 極大性より $`A\in\mathcal{M}`$ である.
    (2)$`\Rightarrow`$(3) とする.
    $`A\cup B\in\mathcal{M}`$ で $`A\notin\mathcal{M}`$ なら, (2) の対偶からある $`M\in\mathcal{M}`$ が $`A\cap M=\emptyset`$ を満たす.
    このとき $`(A\cup B)\cap M\in\mathcal{M}`$ かつ $`(A\cup B)\cap M\subseteq B`$ だから $`B\in\mathcal{M}`$ である.
    (3)$`\Rightarrow`$(4) は $`X=A\cup A^\complement\in\mathcal{M}`$ を (3) に適用すればよい.
    (4)$`\Rightarrow`$(1) とする.
    $`\mathcal{M}`$ の真の細分 $`\mathcal{G}`$ があると仮定し, $`A\in\mathcal{G}\setminus\mathcal{M}`$ を取る.
    (4) より $`A^\complement\in\mathcal{M}\subseteq\mathcal{G}`$ となり, $`\emptyset=A\cap A^\complement\in\mathcal{G}`$ は矛盾である.
    したがって $`\mathcal{M}`$ は超フィルターである.

Definition. **フィルターの制限と拡張**
:   集合 $`X`$ と空でない部分集合 $`A\subseteq X`$ に対して, 次がそれぞれ成り立つ.
    - $`X`$ 上のフィルター $`\mathcal{F}`$ が $`A\in\mathcal{F}`$ であれば
      ```math
      \mathcal{F}|_A\coloneqq\{B\subseteq A\mid\exists F\in\mathcal{F},F\cap A\subseteq B\}
      ```
      は $`A`$ 上のフィルターである. $`\mathcal{F}|_A`$ を $`\mathcal{F}`$ の $`A`$ への制限と呼ぶ.
    - $`A`$ 上のフィルター $`\mathcal{G}`$ に対して集合族 $`\hat{\mathcal{G}}\coloneqq\{F\in2^X\mid\exists G\in\mathcal{G}\text{ s.t. }G\subseteq F\}`$ は $`X`$ 上のフィルターである. $`\hat{\mathcal{G}}`$ を $`\mathcal{G}`$ の $`X`$ への拡張と呼ぶ.

    さらに, 対応 $`\mathcal{F}\mapsto\mathcal{F}|_A`$, $`\mathcal{G}\mapsto\hat{\mathcal{G}}`$ はそれぞれ $`A`$ を含む $`X`$ 上のフィルター全体と $`A`$ 上のフィルター全体の写像となり, 制限と拡張は互いに逆写像となる.

以後, この対応により $`A`$ を含む $`X`$ 上のフィルターと $`A`$ 上のフィルターを同一視する.

Proposition. **フィルターの像**
:   集合 $`X`$ 上のフィルター $`\mathcal{F}`$ と写像 $`f:X\to Y`$ に対して, $`\mathcal{F}`$ の $`f`$ による像
    ```math
    f[\mathcal{F}]\coloneqq\{G\in2^Y\mid f^{-1}(G)\in\mathcal{F}\}
    ```
    は $`Y`$ 上のフィルターである. 特に $`\mathcal{F}`$ が超フィルターであれば $`f[\mathcal{F}]`$ も超フィルターである.

<u>proof.</u>
:   逆像は全体集合と有限交叉を保ち, 包含関係を保つ.
    したがって表示した集合族はフィルターの三公理を満たし, 空集合を含まない.
    $`\mathcal{F}`$ が超フィルターであり $`B\subseteq Y`$ を取る.
    $`f^{-1}(B)`$ とその補集合 $`f^{-1}(B^\complement)`$ のいずれか一方は $`\mathcal{F}`$ に属する.
    よって $`B`$ または $`B^\complement`$ が $`f[\mathcal{F}]`$ に属する.
    超フィルターの特徴づけから $`f[\mathcal{F}]`$ は超フィルターである.

Definition. **フィルターの収束**
:   位相空間 $`X`$ と $`X`$ 上のフィルター $`\mathcal{F}`$ と 点 $`x\in X`$ に対して, $`\mathcal{F}`$ が $`x`$ の近傍系 $`\mathcal{N}_X(x)`$ の細分となるとき, $`x`$ を **フィルター $`\mathcal{F}`$ の極限点** (*limit point of a filter $`\mathcal{F}`$*) といい, 極限の存在するフィルターは**収束する** (*converge*) といい, 収束しないフィルターは**発散する** (*diverge*) という.

Definition. **フィルターの堆積**
:   位相空間 $`X`$ と $`X`$ 上のフィルター $`\mathcal{F}`$ と 点 $`x\in X`$ に対して, $`\mathcal{F}`$ が $`x`$ の近傍系 $`\mathcal{N}_X(x)`$ と両立するとき, $`x`$ を **フィルター $`\mathcal{F}`$ の堆積点** (*cluster point of a filter $`\mathcal{F}`$*) という.

フィルター基 $`\mathcal{F}`$ に対して, $`\mathcal{F}`$ の極限点（それぞれ堆積点）を $`\mathcal{F}`$ の生成するフィルターの極限点（それぞれ堆積点）とする.

Theorem. **堆積点の特徴づけ**
:   位相空間 $`X`$ と $`X`$ 上のフィルター $`\mathcal{F}`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`x`$ は $`\mathcal{F}`$ の堆積点である.
    2. $`\mathcal{F}`$ の細分で $`x`$ に収束するものが存在する.

<u>proof.</u>
:   (1) を仮定する.
    $`\mathcal{F}`$ と $`\mathcal{N}_X(x)`$ の交わりはフィルターであり, 両者の共通細分である.
    これは $`\mathcal{F}`$ の細分であって $`\mathcal{N}_X(x)`$ の細分でもあるから, $`x`$ に収束する.
    逆に $`\mathcal{G}`$ が $`\mathcal{F}`$ の細分で $`x`$ に収束するとする.
    任意の $`F\in\mathcal{F}`$ と $`U\in\mathcal{N}_X(x)`$ はともに $`\mathcal{G}`$ に属するため, $`F\cap U\neq\emptyset`$ である.
    よって $`\mathcal{F}`$ と $`\mathcal{N}_X(x)`$ は両立し, $`x`$ は堆積点である.

Theorem.
:   位相空間 $`X`$ と部分集合 $`A\subseteq X`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`x\in\overline{A}`$.
    2. $`x`$ に収束する $`A`$ 上のフィルターが存在する.

<u>proof.</u>
:   $`x\in\overline{A}`$ は, 任意の $`x`$ の近傍が $`A`$ と交わることと同値である.
    これは単項フィルター $`\langle\{A\}\rangle`$ と $`\mathcal{N}_X(x)`$ の両立と同値である.
    前定理より, $`\langle\{A\}\rangle`$ の細分で $`x`$ に収束するフィルターが存在することと同値である.
    このフィルターは $`A`$ を含むから, 制限により $`A`$ 上の収束フィルターを与える.
    逆向きは, $`A`$ 上のフィルターを $`X`$ 上へ拡張して前定理を逆向きに適用すれば従う.

Theorem.
:   位相空間 $`X`$ に対して, $`X`$ 上のフィルター $`\mathcal{F}`$ の堆積点全体は $`\bigcap_{F\in\mathcal{F}}\overline{F}`$ と一致する.

<u>proof.</u>
:   $`x`$ が $`\mathcal{F}`$ の堆積点であることは, 任意の $`F\in\mathcal{F}`$ と任意の $`x`$ の近傍が交わることと同値である.
    これは任意の $`F\in\mathcal{F}`$ に対して $`x\in\overline{F}`$ と同値であり, 結論が従う.

Theorem.
:   位相空間 $`X,Y`$ と写像 $`f:X\to Y`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`f`$ は $`x`$ で連続である.
    2. $`x`$ に収束する $`X`$ 上の任意のフィルター $`\mathcal{F}`$ に対して, $`\mathcal{F}`$ の $`f`$ による像 $`f[\mathcal{F}]`$ は $`f(x)`$ へ収束する.

<u>proof.</u>
:   (1) は $`f^{-1}(V)\in\mathcal{N}_X(x)`$ が任意の $`V\in\mathcal{N}_Y(f(x))`$ に対して成り立つことと同値である.
    $`\mathcal{F}`$ が $`x`$ に収束すれば $`f^{-1}(V)\in\mathcal{F}`$ となり, 定義から $`V\in f[\mathcal{F}]`$ である.
    よって (2) が従う.
    逆に (2) で $`\mathcal{F}=\mathcal{N}_X(x)`$ と置けば, $`f[\mathcal{N}_X(x)]`$ は $`f(x)`$ に収束する.
    これは上の近傍による連続性の条件そのものである.

### フィルターとネットの相互変換

Proposition. **ネットの生成するフィルター基**
:   位相空間 $`X`$ と $`X`$ のネット $`p=(p_\lambda)_{\lambda\in\Lambda}`$ に対して,
    ```math
    \mathcal{F}\coloneqq\{F_\lambda\mid\lambda\in\Lambda\},\quad
    F_\lambda\coloneqq\{p_j\mid j\in\Lambda,\lambda\leq j\}
    ```
    とすると, $`\mathcal{F}`$ は $`X`$ 上のフィルター基であり, $`x\in X`$ に対して以下同値:
    1. $`(p_\lambda)_{\lambda\in\Lambda}`$ は $`x`$ に収束する.
    2. $`\mathcal{F}`$ は $`x`$ に収束する.

    $`\mathcal{F}`$ をネット $`p=(p_\lambda)_{\lambda\in\Lambda}`$ の生成するフィルター基といい, $`\varphi(p)`$ と表す.

<u>proof.</u>
:   各 $`F_\lambda`$ は $`p_\lambda`$ を含むので空でない.
    $`\lambda,\mu\in\Lambda`$ に対して両者の上界 $`\nu`$ を取れば $`F_\nu\subseteq F_\lambda\cap F_\mu`$ である.
    よって $`\mathcal{F}`$ はフィルター基である.
    $`p`$ が $`x`$ に収束することは, 任意の $`x`$ の近傍 $`U`$ に対してある $`\lambda`$ が存在し $`F_\lambda\subseteq U`$ となることと同値である.
    これは, $`U`$ が $`\mathcal{F}`$ の生成するフィルターに属することと同値である.

Proposition. **フィルター基の生成するネット**
:   位相空間 $`X`$ と $`X`$ 上のフィルター基 $`\mathcal{F}`$ に対して,
    ```math
    \Lambda\coloneqq\{(a,A)\mid a\in A\in\mathcal{F}\},\quad
    (a,A)\leq(b,B)\mathrel{\overset{\text{def}}{\iff}}B\subseteq A
    ```
    とすると, $`(\Lambda,\leq)`$ は有向集合となる. このとき, 写像 $`p:\Lambda\to X`$ を $`p_{(a,A)}\coloneqq a`$ とすると $`p`$ は $`X`$ のネットであり, $`x\in X`$ に対して以下同値:
    1. $`\mathcal{F}`$ は $`x`$ に収束する.
    2. $`(p_{(a,A)})`$ は $`x`$ に収束する.

    $`(p_{(a,A)})`$ をフィルター基 $`\mathcal{F}`$ の生成するネットといい, $`\psi(\mathcal{F})`$ と表す.

<u>proof.</u>
:   二つの添字 $`(a,A),(b,B)`$ に対して, フィルター基の条件から $`C\in\mathcal{F}`$ かつ $`C\subseteq A\cap B`$ を取れる.
    $`c\in C`$ を選べば $`(c,C)`$ は両者の上界であり, $`\Lambda`$ は有向集合である.
    $`\mathcal{F}`$ が $`x`$ に収束し, $`U`$ を $`x`$ の近傍とする.
    ある $`A\in\mathcal{F}`$ が $`A\subseteq U`$ を満たすので, $`(a,A)`$ より後の添字 $`(b,B)`$ では $`B\subseteq A`$ かつ $`p_{(b,B)}=b\in U`$ となる.
    よってネットは $`x`$ に収束する.
    逆にネットが $`x`$ に収束し, $`U`$ を $`x`$ の近傍とする.
    ある $`(a,A)`$ より後のすべての項が $`U`$ に属する.
    任意の $`b\in A`$ に対し $`(b,A)`$ は $`(a,A)`$ より後であるから $`b\in U`$ である.
    よって $`A\subseteq U`$ であり, $`\mathcal{F}`$ は $`x`$ に収束する.

Proposition. **ネットとフィルター基の合成**
:   集合 $`X`$ のネット $`p=(p_\lambda)_{\lambda\in\Lambda}`$ に対して, $`(\psi\circ\varphi)(p)`$ は $`p`$ の部分ネットとなる.

<u>proof.</u>
:   $`\varphi(p)`$ の要素は尾部集合 $`F_\lambda`$ である.
    厳密には添字を $`(p_j,F_\lambda,j)`$ ($`j\geq\lambda`$) に持ち上げる.
    二つのこのような添字には, もとの有向性によって両方の $`j`$ と $`\lambda`$ より後の共通上界を取れる.
    この持ち上げた有向集合は $`(\psi\circ\varphi)(p)`$ の添字集合への共終な写像を持ち, $`j`$ への射影は $`\Lambda`$ への単調共終写像である.
    対応する値は常に $`p_j`$ なので, $`(\psi\circ\varphi)(p)`$ は共終な再添字付けを除いて $`p`$ の部分ネットである.

Proposition. **フィルター基とネットの合成**
:   集合 $`X`$ 上のフィルター基 $`\mathcal{F}`$ に対して, $`\mathcal{F}=(\varphi\circ\psi)(\mathcal{F})`$ となる.

<u>proof.</u>
:   $`A\in\mathcal{F}`$ と $`a\in A`$ を取る.
    ネット $`\psi(\mathcal{F})`$ における添字 $`(a,A)`$ の尾部の値全体は $`A`$ に一致する.
    実際, それより後の添字 $`(b,B)`$ では $`B\subseteq A`$ なので $`b\in A`$ である.
    逆に任意の $`b\in A`$ に対して $`(b,A)`$ は $`(a,A)`$ より後にあり, その値は $`b`$ である.
    よって得られる尾部集合全体はちょうど $`\mathcal{F}`$ である.

### 特別な部分集合

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