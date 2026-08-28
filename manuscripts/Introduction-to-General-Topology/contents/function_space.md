## 関数空間

連続写像の集合そのものに位相を入れると, パラメータに依存する写像や積空間上の写像を一つの空間として扱える.
コンパクト開位相はコンパクト部分集合上での値の振る舞いを記録し, 局所コンパクト Hausdorff 空間に対する指数法則を与える.

### コンパクト開位相

Definition. **コンパクト開位相**
:   位相空間 $`X,Y`$ に対して, $`X`$ から $`Y`$ への連続写像全体の集合を $`C(X,Y)`$ と表す.
    $`K\subseteq X`$ をコンパクト集合, $`U\subseteq Y`$ を開集合として,
    ```math
    [K,U]\coloneqq\{f\in C(X,Y)\mid f(K)\subseteq U\}
    ```
    とおく.
    この形の集合を準基として $`C(X,Y)`$ に入る位相を **コンパクト開位相** (*compact-open topology*) といい, この位相を備えた空間を $`C_k(X,Y)`$ と表す.

Proposition. **評価写像**
:   $`X`$ が局所コンパクト Hausdorff 空間ならば, 評価写像
    ```math
    \operatorname{ev}:C_k(X,Y)\times X\longrightarrow Y,
    \quad(f,x)\longmapsto f(x)
    ```
    は連続である.

<u>proof.</u>
:   $`(f_0,x_0)`$ と $`f_0(x_0)`$ の開近傍 $`U`$ をとる.
    $`f_0^{-1}(U)`$ は $`x_0`$ の開近傍である.
    局所コンパクト性から, $`x_0\in V\subseteq K\subseteq f_0^{-1}(U)`$ を満たす開集合 $`V`$ とコンパクト集合 $`K`$ を選べる.
    $`[K,U]`$ は $`f_0`$ のコンパクト開近傍であり, $`V`$ は $`x_0`$ の近傍である.
    $`f\in[K,U]`$ と $`x\in V`$ ならば $`x\in K`$ であるから $`f(x)\in U`$ となる.
    よって評価写像は $`(f_0,x_0)`$ で連続であり, この点は任意である.

Theorem. **指数法則**
:   $`X`$ を局所コンパクト Hausdorff 空間とする.
    任意の位相空間 $`Z,Y`$ と連続写像 $`f:Z\times X\to Y`$ に対して,
    ```math
    \widetilde{f}:Z\longrightarrow C_k(X,Y),
    \quad z\longmapsto(x\longmapsto f(z,x))
    ```
    は連続である.
    逆に連続写像 $`g:Z\to C_k(X,Y)`$ から
    ```math
    (z,x)\longmapsto g(z)(x)
    ```
    によって連続写像 $`Z\times X\to Y`$ を得る.
    この二つの対応は互いに逆であり, $`Z`$ と $`Y`$ に関して自然である.

<u>proof.</u>
:   $`f:Z\times X\to Y`$ を連続とする.
    $`\widetilde{f}`$ の連続性は準基 $`[K,U]`$ の逆像を調べればよい.
    $`z_0\in\widetilde{f}^{-1}([K,U])`$ とすると, $`f(\{z_0\}\times K)\subseteq U`$ である.
    $`K`$ はコンパクトであり $`f^{-1}(U)`$ は開であるから, 管状近傍補題により $`z_0`$ の開近傍 $`W`$ が存在して
    ```math
    f(W\times K)\subseteq U
    ```
    となる.
    よって $`W\subseteq\widetilde{f}^{-1}([K,U])`$ であり, $`\widetilde{f}`$ は連続である.

    逆に $`g:Z\to C_k(X,Y)`$ が連続ならば, 非カリー化写像は評価写像との合成
    ```math
    Z\times X\xrightarrow{g\times\operatorname{id}_X}C_k(X,Y)\times X
    \xrightarrow{\operatorname{ev}}Y
    ```
    であるから連続である.
    カリー化と非カリー化を順に適用すると各点で元の値へ戻るため, 二つの対応は互いに逆である.
    合成との可換性を各点で確認すれば, 自然性も従う.

Remark.
:   任意の位相空間 $`X`$ に対してこの指数対象が存在するわけではないので, 圏 $`\mathbf{Top}`$ は Cartesian 閉圏ではない.
    局所コンパクト Hausdorff 空間を定義域に限れば, コンパクト開位相が指数対象を与える.

### コンパクト生成空間

Definition. **コンパクト生成空間**
:   Hausdorff 空間 $`X`$ が **コンパクト生成** (*compactly generated*) であるとは, 部分集合 $`A\subseteq X`$ が閉であることと, 任意のコンパクト Hausdorff 空間 $`K`$ および連続写像 $`f:K\to X`$ に対して $`f^{-1}(A)`$ が閉であることが同値になるときいう.

Remark.
:   コンパクト生成弱 Hausdorff 空間の圏では, 積と関数空間を適切に取り直すことで Cartesian 閉な圏を得る.
    この圏はホモトピー論で, 写像空間を持つ圏として広く用いられる.
