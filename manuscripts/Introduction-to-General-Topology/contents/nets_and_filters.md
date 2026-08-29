## ネットとフィルター

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

Definition. **最終的に属することと頻繁に属すること**
:   集合 $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ と部分集合 $`A\subseteq X`$ に対して,
    - ネット $`(x_\lambda)_{\lambda\in\Lambda}`$ が $`A`$ に **最終的に属する** (*eventually in $`A`$*) とは, $`\mathrel{\overset{\text{def}}{\iff}}`$ $`\exists\lambda_0\in\Lambda\text{ s.t. }\forall\lambda\in\Lambda,\lambda_0\leq\lambda\Rightarrow x_\lambda\in A`$ が成り立つことをいう.
    - ネット $`(x_\lambda)_{\lambda\in\Lambda}`$ が $`A`$ に **頻繁に属する** (*frequently in $`A`$*) とは, $`\mathrel{\overset{\text{def}}{\iff}}`$ $`\forall\lambda\in\Lambda,\exists\lambda_0\in\Lambda\text{ s.t. }\lambda\leq\lambda_0\land x_{\lambda_0}\in A`$ が成り立つことをいう.

定義より, $`(x_\lambda)_{\lambda\in\Lambda}`$ が $`A`$ に最終的に属するならば, $`A`$ に頻繁に属する.

Proposition.
:   $`(x_\lambda)_{\lambda\in\Lambda}`$ が $`A`$ に最終的に属する $`\iff`$ $`(x_\lambda)_{\lambda\in\Lambda}`$ が $`X\setminus A`$ に頻繁には属さない.

<u>proof.</u>
:   ある添字以後すべての項が $`A`$ に属することは, その添字以後に $`X\setminus A`$ の項が存在しないことと同値である.
    これは「$`X\setminus A`$ に頻繁に属する」の否定そのものである.

Definition. **普遍ネット**
:   集合 $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ が **普遍ネット** (*universal net*) あるいは **超ネット** (*ultranet*) であるとは, 任意の $`A\subseteq X`$ に対して次のいずれかの条件が成り立つときいう:
    - $`(x_\lambda)_{\lambda\in\Lambda}`$ が $`A`$ に最終的に属する.
    - $`(x_\lambda)_{\lambda\in\Lambda}`$ が $`X\setminus A`$ に最終的に属する.

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
    \forall U\in\mathcal{N}_X(x),(x_\lambda)_{\lambda\in\Lambda}\text{ が }U\text{ に最終的に属する}
    ```
    を満たすとき, $`x`$ を **ネット $`(x_n)`$ の極限点** (*limit point of a net $`(x_n)`$*) といい, 極限の存在するネットは**収束する** (*converge*) といい, 収束しないネットは**発散する** (*diverge*) という.

Definition. **ネットの堆積**
:   位相空間 $`X`$ と $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ と 点 $`x\in X`$ に対して, 条件
    ```math
    \forall U\in\mathcal{N}_X(x),(x_\lambda)_{\lambda\in\Lambda}\text{ が }U\text{ に頻繁に属する}
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

Arens-Fort 空間は, 点列だけでは近傍構造を十分に検出できない例として, ネットを導入する動機を与える.

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

[^arens-fort]: L. A. Steen and J. A. Seebach, *Counterexamples in Topology*, 2nd ed., Example 104.
