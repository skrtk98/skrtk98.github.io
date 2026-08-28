## 準備

位相に関する収束とコンパクト性は, フィルターや順序構造を用いると統一的に記述できる.
この節では, 集合, 順序集合上のイデアル, フィルターの基本事項を定める.

### 集合と基本演算

集合と写像に関する初歩的な事項を前提とする.
ここでは, 本書で繰り返し用いる集合演算と記法を定める.

集合 $`X,Y`$ に対して, $`X\subseteq Y`$ は $`X`$ の各元が $`Y`$ に属することを表す.
$`X\subsetneq Y`$ は $`X\subseteq Y`$ かつ $`X\neq Y`$ を表す.
元を持たない集合を $`\emptyset`$ と表す.

Definition. **集合族と集合演算**
:   $`X`$ の部分集合からなる集合を **$`X`$ の部分集合族** または単に **集合族** という.
    集合 $`\Lambda`$ と各 $`\lambda\in\Lambda`$ に対する集合 $`A_\lambda`$ があり, $`\mathcal A=\{A_\lambda\mid\lambda\in\Lambda\}`$ と書けるとき, $`\Lambda`$ を $`\mathcal A`$ の **添字集合** という.
    $`A,B\subseteq X`$ に対して,
    ```math
    A\cup B\coloneqq\{x\in X\mid x\in A\lor x\in B\},\qquad
    A\cap B\coloneqq\{x\in X\mid x\in A\land x\in B\},
    ```
    ```math
    A\setminus B\coloneqq\{x\in X\mid x\in A\land x\notin B\}
    ```
    と定め, それぞれ **和集合**, **共通部分**, **差集合** という.
    特に $`A\subseteq X`$ に対して $`A^\complement\coloneqq X\setminus A`$ を $`X`$ における $`A`$ の **補集合** という.

    $`X`$ の部分集合族 $`\mathcal A`$ に対して,
    ```math
    \bigcup\mathcal A\coloneqq\{x\in X\mid\exists A\in\mathcal A,\ x\in A\},\qquad
    \bigcap\mathcal A\coloneqq\{x\in X\mid\forall A\in\mathcal A,\ x\in A\}
    ```
    と定める.
    $`\mathcal A=\{A_\lambda\mid\lambda\in\Lambda\}`$ のとき, これらをそれぞれ $`\bigcup_{\lambda\in\Lambda}A_\lambda`$, $`\bigcap_{\lambda\in\Lambda}A_\lambda`$ と書く.
    この約束により, $`\bigcup\emptyset=\emptyset`$ および $`\bigcap\emptyset=X`$ である.

    $`A\cap B=\emptyset`$ のとき, $`A,B`$ は **互いに素** であるという.
    互いに素な集合族の和集合は, 必要に応じて $`\bigsqcup`$ を用いて **非交和** と書く.

Definition. **冪集合、直積集合、タグ付き和**
:   $`X`$ の部分集合全体からなる集合
    ```math
    \mathcal P(X)\coloneqq\{A\mid A\subseteq X\}
    ```
    を $`X`$ の **冪集合** という.
    本書では $`\mathcal P(X)`$ を $`2^X`$ とも表す.
    二つの集合 $`X,Y`$ に対して,
    ```math
    X\times Y\coloneqq\{(x,y)\mid x\in X,\ y\in Y\}
    ```
    を $`X`$ と $`Y`$ の **直積集合** という.
    集合族 $`(X_\lambda\mid\lambda\in\Lambda)`$ の **直積集合** を
    ```math
    \prod_{\lambda\in\Lambda}X_\lambda
    \coloneqq
    \left\{x:\Lambda\to\bigcup_{\lambda\in\Lambda}X_\lambda
    \mathrel{}\middle|\mathrel{}
    \forall\lambda\in\Lambda,\ x(\lambda)\in X_\lambda\right\},
    ```
    と定める.
    その標準射影を $`\pi_\lambda(x)\coloneqq x(\lambda)`$ と表す.

    一方, **タグ付き和** を
    ```math
    \coprod_{\lambda\in\Lambda}X_\lambda
    \coloneqq
    \{(x,\lambda)\mid \lambda\in\Lambda,\ x\in X_\lambda\}
    ```
    と定める.
    これは各 $`X_\lambda`$ の元に添字 $`\lambda`$ を付して区別する集合であり, 互いに素でない集合族に対しても定義される.
    標準入射を $`\iota_\lambda:X_\lambda\to\coprod_{\mu\in\Lambda}X_\mu`$, $`\iota_\lambda(x)\coloneqq(x,\lambda)`$ と表す.

Definition. **像と逆像**
:   写像 $`f:X\to Y`$ と部分集合 $`A\subseteq X`$, $`B\subseteq Y`$ に対して,
    ```math
    f(A)\coloneqq\{f(x)\mid x\in A\},\qquad
    f^{-1}(B)\coloneqq\{x\in X\mid f(x)\in B\}
    ```
    をそれぞれ $`A`$ の **像** と $`B`$ の **逆像** という.

Proposition. **像、逆像と集合演算**
:   写像 $`f:X\to Y`$, $`X`$ の部分集合族 $`(A_\lambda\mid\lambda\in\Lambda)`$, および $`Y`$ の部分集合族 $`(B_\lambda\mid\lambda\in\Lambda)`$ に対して,
    ```math
    f\left(\bigcup_{\lambda\in\Lambda}A_\lambda\right)
    =\bigcup_{\lambda\in\Lambda}f(A_\lambda),\qquad
    f\left(\bigcap_{\lambda\in\Lambda}A_\lambda\right)
    \subseteq\bigcap_{\lambda\in\Lambda}f(A_\lambda),
    ```
    ```math
    f^{-1}\left(\bigcup_{\lambda\in\Lambda}B_\lambda\right)
    =\bigcup_{\lambda\in\Lambda}f^{-1}(B_\lambda),\qquad
    f^{-1}\left(\bigcap_{\lambda\in\Lambda}B_\lambda\right)
    =\bigcap_{\lambda\in\Lambda}f^{-1}(B_\lambda),
    ```
    ```math
    f^{-1}(B^\complement)=f^{-1}(B)^\complement
    ```
    が成り立つ.
    ただし補集合はそれぞれ $`Y`$ および $`X`$ における補集合である.
    像に関する共通部分の包含は, 一般には等式にならない.

Proof.
:   像の和集合に関する等式は, 左辺の元がある $`A_\lambda`$ に属する元の像であることと同値である.
    共通部分については, $`x`$ がすべての $`A_\lambda`$ に属すれば $`f(x)`$ がすべての $`f(A_\lambda)`$ に属すため, 包含関係を得る.
    逆像については, $`x\in X`$ が各辺に属することを $`f(x)`$ が対応する $`B_\lambda`$ に属することへ書き直せばよい.
    和集合, 共通部分, 補集合の定義から, 表示した三つの等式が従う.

Definition. **同値関係と商集合**
:   集合 $`X`$ 上の二項関係 $`\sim`$ が, 任意の $`x,y,z\in X`$ に対して
    ```math
    x\sim x,\qquad x\sim y\Longrightarrow y\sim x,\qquad
    x\sim y\land y\sim z\Longrightarrow x\sim z
    ```
    を満たすとき, $`\sim`$ を **同値関係** という.
    $`x\in X`$ に対して
    ```math
    [x]_\sim\coloneqq\{y\in X\mid y\sim x\}
    ```
    を $`x`$ の **同値類** といい,
    ```math
    X/{\sim}\coloneqq\{[x]_\sim\mid x\in X\}
    ```
    を **商集合** という.
    写像 $`\pi:X\to X/{\sim}`$, $`x\mapsto[x]_\sim`$ を標準的な **商射影** と呼ぶ.

### 順序集合のイデアルとフィルター

Definition. **イデアル**
:   半順序集合 $`(P,\leq)`$ における **イデアル基** (*ideal basis*) とは, $`P`$ の空でない部分集合 $`I`$ であって次を満たす:
    ```math
    \forall x,y\in I,\exists z\in I\text{ s.t. }x\leq z\land y\leq z
    ```
    特に, 下方に閉じているイデアル基を **イデアル** (*ideal*) という.

特に, $`(P,\leq)`$ における **極大イデアル** (maximal ideal) あるいは **超イデアル** (*ultraideal*) とは, $`(P,\leq)`$ のイデアル $`M\subsetneq P`$ であって, $`(P,\leq)`$ の任意のイデアル $`I`$ が $`I\subseteq M`$ であれば $`M=I`$ となるときいう.

Definition. **フィルター**
:   半順序集合 $`(P,\leq)`$ における **フィルター基** (*filter basis*) とは, $`P`$ の空でない部分集合 $`F`$ であって次を満たす:
    ```math
    \forall x,y\in F,\exists z\in F\text{ s.t. }z\leq x\land z\leq y
    ```
    特に, 上方に閉じているフィルター基を **フィルター** (*filter*) という.

特に, $`(P,\leq)`$ における **極大フィルター** (maximal filter) あるいは **超フィルター** (*ultrafilter*) とは, $`(P,\leq)`$ の真のフィルター $`M\subsetneq P`$ であって, 任意のフィルター $`F`$ に対し $`M\subseteq F\subsetneq P`$ ならば $`M=F`$ となるものをいう.

Proposition. **イデアル基の生成するイデアル**
:   半順序集合 $`(P,\leq)`$ のイデアル基 $`I`$ に対して, $`P`$ の部分集合 $`\overline{I}`$ を
    ```math
    \overline{I}\coloneqq\{x\in P\mid\exists i\in I\text{ s.t. }x\leq i\}
    ```
    とすると, $`\overline{I}`$ は $`I`$ を含むイデアルであって最も弱いものである.

<u>proof.</u>
:   まず $`I\subseteq\overline{I}`$ である.
    実際, $`i\in I`$ に対して $`i\leq i`$ であるから $`i\in\overline{I}`$ となる.

    $`x,y\in\overline{I}`$ をとる.
    ある $`i,j\in I`$ が $`x\leq i`$ と $`y\leq j`$ を満たす.
    $`I`$ がイデアル基であるから, $`i\leq k`$ と $`j\leq k`$ を満たす $`k\in I`$ が存在する.
    したがって $`x\leq k`$ および $`y\leq k`$ であり, $`k\in\overline{I}`$ である.
    よって $`\overline{I}`$ はイデアル基である.

    $`x\in\overline{I}`$ と $`y\leq x`$ をとる.
    $`x\leq i`$ となる $`i\in I`$ が存在するので, 推移律から $`y\leq i`$ である.
    よって $`y\in\overline{I}`$ であり, $`\overline{I}`$ は下方に閉じている.

    最後に, $`I`$ を含む任意のイデアル $`J`$ をとる.
    $`x\in\overline{I}`$ ならば $`x\leq i`$ となる $`i\in I`$ が存在する.
    $`i\in J`$ と $`J`$ の下方閉性から $`x\in J`$ が従う.
    したがって $`\overline{I}\subseteq J`$ である.

Proposition. **フィルター基の生成するフィルター**
:   半順序集合 $`(P,\leq)`$ のフィルター基 $`F`$ に対して, $`P`$ の部分集合 $`\overline{F}`$ を
    ```math
    \overline{F}\coloneqq\{x\in P\mid\exists f\in F\text{ s.t. }f\leq x\}
    ```
    とすると, $`\overline{F}`$ は $`F`$ を含むフィルターであって最も弱いものである.

<u>proof.</u>
:   $`f\in F`$ に対して $`f\leq f`$ であるから $`F\subseteq\overline{F}`$ である.

    $`x,y\in\overline{F}`$ をとる.
    ある $`f,g\in F`$ が $`f\leq x`$ と $`g\leq y`$ を満たす.
    $`F`$ がフィルター基であるから, $`h\leq f`$ と $`h\leq g`$ を満たす $`h\in F`$ が存在する.
    このとき $`h\leq x`$ と $`h\leq y`$ であるから $`h\in\overline{F}`$ である.
    よって $`\overline{F}`$ はフィルター基である.

    $`x\in\overline{F}`$ と $`x\leq y`$ をとる.
    $`f\leq x`$ となる $`f\in F`$ が存在し, 推移律から $`f\leq y`$ となる.
    よって $`y\in\overline{F}`$ であり, $`\overline{F}`$ は上方に閉じている.

    $`F`$ を含む任意のフィルター $`G`$ に対して, $`x\in\overline{F}`$ ならば $`f\leq x`$ となる $`f\in F`$ が存在する.
    $`f\in G`$ と $`G`$ の上方閉性から $`x\in G`$ が従う.
    したがって $`\overline{F}\subseteq G`$ である.

Proposition. **細分関係**
:   半順序集合 $`(P,\leq)`$ に対して, $`2^P`$ における二項関係 $`\trianglelefteq`$ を
    ```math
    A\trianglelefteq B\mathrel{\overset{\text{def}}{\iff}}\forall a\in A,\exists b\in B\text{ s.t. }a\leq b,\quad A,B\in2^P
    ```
    とすると, $`\trianglelefteq`$ は $`2^P`$ 上の前順序となる. このとき $`\trianglelefteq`$ を $`(P,\leq)`$ による細分関係という.

<u>proof.</u>
:   任意の $`A\subseteq P`$ と $`a\in A`$ に対して $`a\leq a`$ である.
    よって $`A\trianglelefteq A`$ であり, この関係は反射的である.

    $`A\trianglelefteq B`$ および $`B\trianglelefteq C`$ を仮定する.
    $`a\in A`$ に対して, ある $`b\in B`$ が $`a\leq b`$ を満たす.
    さらに, ある $`c\in C`$ が $`b\leq c`$ を満たす.
    半順序の推移律から $`a\leq c`$ である.
    よって $`A\trianglelefteq C`$ であり, この関係は推移的である.