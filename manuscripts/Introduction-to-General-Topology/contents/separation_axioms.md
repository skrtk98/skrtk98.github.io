## 分離性

異なる点や閉集合を開近傍でどこまで区別できるかは, 位相空間の性質を大きく左右する.
分離公理を段階的に定め, 後の距離化, コンパクト化, 連続関数の構成で必要になる条件を区別する.

Definition. **分離公理**
:   位相空間 $`X`$ の近傍系 $`\mathcal{N}_X`$ と $`X`$ の部分集合 $`A,B`$ に対して次をそれぞれ定義する.
    1. $`A,B`$ が **位相的に識別可能** (*topologically distinguishable*) であるとは, 各 $`a\in A,b\in B`$ に対して
        ```math
        \mathcal{N}_X(a)\neq\mathcal{N}_X(b)
        ```
        であるときいう.
    2. $`A,B`$ が **分離される** (*separated*) とは, 
        ```math
        \overline{A}\cap B=A\cap\overline{B}=\emptyset
        ```
        であるときいう.
    3. $`A,B`$ が **近傍で分離される** (*separated by neighbourhoods*) とは, 次を満たすときいう:
        ```math
        \exists U\in\mathcal{N}_X[A],\exists V\in\mathcal{N}_X[B],\text{ s.t. }U\cap V=\emptyset.
        ```
    4. $`A,B`$ が **閉近傍で分離される** (*closed separated by neighbourhoods*) とは, 次を満たすときいう:
        ```math
        \exists U\in\mathcal{N}_X[A],\exists V\in\mathcal{N}_X[B],\text{ s.t. }\overline{U}\cap\overline{V}=\emptyset.
        ```
    5. $`A,B`$ が **函数で分離される** (*separated by a continuous function*) とは, $`X`$ 上の実数値連続写像 $`f`$ として $`f(A)=\{0\}`$ かつ $`f(B)=\{1\}`$ を満たすものが存在するときいう.
    6. $`A,B`$ が **函数でちょうど分離される** (*precisely separated by a continuous function*) とは, $`X`$ 上の実数値連続写像 $`f`$ として $`f^{-1}(\{0\})=A`$ かつ $`f^{-1}(\{1\})=B`$ を満たすものが存在するときいう.

Proposition. **分離概念の含意系列**
:   空でない部分集合 $`A,B\subseteq X`$ に対して, 次の含意が成り立つ.
    ```math
    \begin{aligned}
    &\text{函数でちょうど分離される}
    \Longrightarrow \text{函数で分離される}
    \Longrightarrow \text{近傍で分離される}\\
    &\Longrightarrow \text{分離される}
    \Longrightarrow \text{位相的に識別可能}
    \Longrightarrow \text{互いに素}.
    \end{aligned}
    ```

<u>proof.</u>
:   $`A=f^{-1}(\{0\})`$ かつ $`B=f^{-1}(\{1\})`$ を満たす連続写像 $`f`$ があれば, $`A,B`$ は空でないので $`f(A)=\{0\}`$ かつ $`f(B)=\{1\}`$ である.
    函数で分離する連続写像 $`f:X\to\mathbb R`$ に対して, $`U=f^{-1}((-1/2,1/2))`$ と $`V=f^{-1}((1/2,3/2))`$ とおけば, $`U,V`$ は互いに交わらない開集合で $`A\subseteq U`$, $`B\subseteq V`$ を満たす.
    $`A,B`$ が近傍で分離されるとし, $`U,V`$ を互いに交わらない近傍とする.
    $`p\in\overline A\cap B`$ なら $`V`$ は $`p`$ の近傍であるから $`V\cap A\neq\emptyset`$ となるが, $`A\subseteq U`$ と $`U\cap V=\emptyset`$ に反する.
    同様に $`A\cap\overline B=\emptyset`$ であるから, $`A,B`$ は分離される.
    $`a\in A`$ と $`b\in B`$ が同じ近傍系をもつなら, $`b\in\overline{\{a\}}`$ かつ $`a\in\overline{\{b\}}`$ である.
    したがって $`A,B`$ は分離されず, 対偶により分離される部分集合は位相的に識別可能である.
    位相的に識別可能な部分集合は共通点をもたない.

### 点同士の分離性

Definition. **Kolmogorov 空間**
:   位相空間 $`X`$ が **Kolmogorov 空間** (*Kolmogorov space*) であるとは, $`X`$ の任意の異なる 2 点が位相的に識別可能であるときいう.

これは古典的な $`\mathbf{T}_0`$ 公理に相当する.

Definition. **$`\mathbf{T}_1`$ 空間**
:   位相空間 $`X`$ が **$`\mathbf{T}_1`$ 空間** (*$`\mathbf{T}_1`$ space*) であるとは, $`X`$ の任意の異なる 2 点が分離されるときいう.

$`\mathbf{T}_1`$ 空間は古典的には **Fréchet 空間** (*Fréchet space*) または **到達可能空間** (*accessible space*) と呼ばれることがある。ただし現代では "Fréchet space" が関数解析における Fréchet–Urysohn 性を指す場合も多いため, 本書では $`\mathbf{T}_1`$ 空間を主名称とする.

Definition. **前正則空間**
:   位相空間 $`X`$ が **前正則** (*preregular*) であるとは, $`X`$ の任意の位相的に識別可能な 2 点が近傍で分離されるときいう.

Definition. **Hausdorff 空間**
:   位相空間 $`X`$ が **Hausdorff 空間** (*Hausdorff space*) であるとは, $`X`$ の任意の異なる 2 点が近傍で分離されるときいう.

これは古典的な $`\mathbf{T}_2`$ 公理に相当する.

Definition. **Urysohn 空間**
:   位相空間 $`X`$ が **Urysohn 空間** (*Urysohn space*) であるとは, $`X`$ の任意の異なる 2 点が閉近傍で分離されるときいう.

古典的には $`\mathbf{T}_{2\frac12}`$ 公理と呼ばれることがある.

### 点と閉集合の分離

Definition. **正則**
:   位相空間 $`X`$ が **正則** (*regular*) であるとは, $`X`$ の任意の点 $`x`$ と任意の閉集合 $`F`$ が $`x\notin F`$ ならば $`\{x\},F`$ は近傍で分離されるときいう.

Definition. **完全正則**
:   位相空間 $`X`$ が **完全正則** (*completely regular*) であるとは, $`X`$ の任意の点 $`x`$ と任意の閉集合 $`F`$ が $`x\notin F`$ ならば $`\{x\},F`$ は函数で分離されるときいう.

### 閉集合同士の分離

Definition. **正規**
:   位相空間 $`X`$ が **正規** (*normal*) であるとは, 任意の閉集合 $`F,E`$ に対して, $`F\cap E=\emptyset`$ ならば $`F,E`$ は近傍で分離されるときいう.

Theorem. **Urysohn の補題**
:   正規 $`\mathbf{T}_1`$ 空間 $`X`$ の互いに交わらない閉集合 $`A,B`$ に対して, 連続写像
    ```math
    f:X\longrightarrow[0,1]
    ```
    であって $`f(A)=\{0\}`$ および $`f(B)=\{1\}`$ を満たすものが存在する.

<u>proof.</u>
:   正規性により, 閉集合 $`C`$ とそれを含む開集合 $`U`$ に対して
    ```math
    C\subseteq V\subseteq\overline{V}\subseteq U
    ```
    を満たす開集合 $`V`$ を選べる.
    この操作を二進有理数 $`r\in[0,1]`$ に沿って帰納的に適用すると, 開集合族 $`(U_r)`$ を
    ```math
    A\subseteq U_0,\qquad \overline{U_r}\subseteq U_s\quad(r<s),\qquad \overline{U_r}\cap B=\emptyset
    ```
    となるように構成できる.
    次で写像 $`f:X\to[0,1]`$ を定める.
    ```math
    f(x)\coloneqq\inf\{r\in\mathbb{D}\cap[0,1]\mid x\in U_r\},
    ```
    ただし集合が空の場合は $`f(x)=1`$ とする.
    入れ子条件から, 任意の $`t\in[0,1]`$ に対して $`f^{-1}([0,t))`$ と $`f^{-1}((t,1])`$ は開集合である.
    よって $`f`$ は連続である.
    構成により $`A`$ 上では $`f=0`$, $`B`$ 上では $`f=1`$ である.

Corollary. **正規 Hausdorff 空間の完全正則性**
:   正規 $`\mathbf{T}_1`$ 空間は完全正則である.

<u>proof.</u>
:   $`x\in X`$ と $`x`$ を含まない閉集合 $`F`$ をとる.
    $`\mathbf{T}_1`$ 性により $`\{x\}`$ は閉集合であり, $`\{x\}`$ と $`F`$ は互いに交わらない.
    Urysohn の補題から, $`f(x)=0`$ かつ $`f(F)=\{1\}`$ を満たす連続写像 $`f:X\to[0,1]`$ が存在する.
    したがって $`\{x\}`$ と $`F`$ は函数で分離され, $`X`$ は完全正則である.

### Tietze の拡張定理

Theorem. **Tietze の拡張定理**
:   正規 $`\mathbf{T}_1`$ 空間 $`X`$ の閉部分集合 $`A`$ と連続写像 $`f:A\to[-1,1]`$ に対して, 連続写像 $`\overline{f}:X\to[-1,1]`$ が存在して
    ```math
    \overline{f}|_A=f
    ```
    を満たす.

<u>proof.</u>
:   $`[-1,1]`$ が実数の順序凸な閉区間であることを用いる Tietze の拡張補題を適用する.
    補題は, 閉部分空間上の連続写像 $`h:A\to\mathbb R`$ が区間 $`[-1,1]`$ に値を取るなら, 全空間上の連続写像 $`g:X\to\mathbb R`$ で同じ区間に値を取り, $`g|_A=h`$ となるものを与える.
    したがって $`h=f`$ とすれば, 求める $`\overline f`$ が得られる.

Corollary.
:   正規 $`\mathbf{T}_1`$ 空間の閉部分集合上の任意の連続実数値関数は, 全空間上の連続実数値関数へ延長できる.

<u>proof.</u>
:   まず有界値の場合を示す.
    $`|f|\leq1`$ としてよい.
    残差 $`r_0=f`$ に対し, $`r_n`$ が定まったとき
    ```math
    r_n^{-1}(({-}\infty,-1/3]),\qquad r_n^{-1}([1/3,\infty))
    ```
    は $`A`$ の互いに素な閉集合である.
    Urysohn の補題から, 絶対値が高々 $`1/3`$ でありこの二つの集合上でそれぞれ $`-1/3,1/3`$ を取る連続関数 $`g_n:X\to\mathbb R`$ を選べる.
    $`r_{n+1}=r_n-g_n|_A`$ とおけば $`|r_{n+1}|\leq(2/3)|r_n|`$ となる.
    適切な定数倍を各段階に施して得る級数 $`\sum_n g_n`$ は一様収束し, その和は $`A`$ 上で $`f`$ に一致する.
    一般の実数値関数についても, 同じ近似を各段階の残差の大きさに応じて行う Tietze の逐次近似法により連続延長を得る.
    すなわち有界性は各近似項にのみ必要であり, 元の $`f`$ の有界性は仮定しない.

### $`1`$ の分割

Definition. **$`1`$ の分割**
:   位相空間 $`X`$ の開被覆 $`\mathcal{N}_X`$ に **従属する $`1`$ の分割** (*partition of unity subordinate to $`\mathcal{N}_X`$*) とは, 連続写像の族
    ```math
    (\varphi_i:X\to[0,1]\mid i\in I)
    ```
    であって, 次を満たすものをいう.
    - 族 $`(\operatorname{supp}\varphi_i\mid i\in I)`$ は局所有限である.
    - 各 $`i\in I`$ に対して, $`\operatorname{supp}\varphi_i\subseteq U_i`$ となる $`U_i\in\mathcal{N}_X`$ が存在する.
    - 各 $`x\in X`$ に対して,
        ```math
        \sum_{i\in I}\varphi_i(x)=1
        ```
        が成り立つ.

    ここで $`\operatorname{supp}\varphi`$ は $`\{x\in X\mid\varphi(x)\neq0\}`$ の閉包である.

Theorem. **$`1`$ の分割の存在定理**
:   パラコンパクト Hausdorff 空間の任意の開被覆には従属する $`1`$ の分割が存在する.

<u>proof.</u>
:   開被覆 $`\mathcal{N}_X`$ をとる.
    パラコンパクト Hausdorff 空間は正規である.
    縮小補題を二度適用し, $`X`$ を被覆する局所有限な開族 $`(W_i)_{i\in I}`$ と開族 $`(V_i)_{i\in I}`$ および $`U_i\in\mathcal{N}_X`$ を
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
    よって $`(\varphi_i)_{i\in I}`$ は $`\mathcal{N}_X`$ に従属する $`1`$ の分割である.

Remark.
:   局所有限性により, 各点の近傍では上の和の非零項が有限個しかない.
    そのため $`1`$ の分割は局所的な連続関数を一つの連続関数へ貼り合わせる道具になる.

Theorem. **遺伝的正規性の特徴づけ**
:   位相空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は遺伝的正規である. すなわち, $`X`$ の任意の部分空間は正規である.
    2. 任意の部分集合 $`A,B`$ に対して $`A,B`$ が分離されるならば $`A,B`$ は近傍で分離される.

遺伝的正規空間は古典的には **全部分正規空間** (*completely normal space*) と呼ばれる.

<u>proof.</u>
:   (1) を仮定し, 分離された部分集合 $`A,B\subseteq X`$ をとる.
    $`S=A\cup B`$ に誘導した位相では $`A,B`$ は互いに素な閉集合である.
    よって, $`S`$ が正規であることから, $`S`$ の互いに素な開近傍が存在する.
    $`A,B`$ が分離されていることを用いる標準的な分離集合補題により, $`X`$ 内の互いに素な開近傍が得られる.
    したがって $`A,B`$ は $`X`$ でも近傍分離される.
    逆に (2) を仮定する.
    任意の部分空間 $`S\subseteq X`$ の互いに素な閉集合 $`C,D`$ をとると, $`\overline C\cap D=C\cap\overline D=\emptyset`$ である.
    よって $`C,D`$ は $`X`$ で分離され, (2) により $`X`$ 内で近傍分離される.
    その近傍を $`S`$ と交わらせれば $`S`$ における $`C,D`$ の近傍分離となる.
    従ってすべての部分空間が正規である.

Definition. **完全正規**
:   位相空間 $`X`$ が **完全正規** (*perfectly normal*) であるとは, 任意の閉集合 $`F,E`$ に対して, $`F\cap E=\emptyset`$ ならば $`F,E`$ は函数でちょうど分離されるときいう.

Theorem. **完全正規 (perfectly normal)**
:   位相空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は完全正規である.
    2. $`X`$ は正規であり, 任意の閉集合が $`G_\delta`$ 集合となる.

<u>proof.</u>
:   (1) なら函数による分離は近傍による分離を与えるので $`X`$ は正規である.
    閉集合 $`F`$ を空集合と函数でちょうど分離する関数を $`f:X\to[0,1]`$ とすると, 定義により $`F=f^{-1}(1)`$ である.
    $`g=1-f`$ とおけば $`F=g^{-1}(0)`$ である.
    よって
    ```math
    F=\bigcap_{n\geq1}g^{-1}([0,1/n))
    ```
    であり, $`F`$ は $`G_\delta`$ である.
    逆に (2) を仮定する.
    閉集合 $`F`$ ごとに, $`F`$ の $`G_\delta`$ 表示と Urysohn の補題を組み合わせ, $`F`$ を $`[0,1]`$ 値連続関数の零集合として表す.
    この構成は, 各段階の関数を $`2^{-n}`$ で重み付けした一様収束級数である.
    $`x\notin F`$ なら表示を与える開集合の少なくとも一つから外れるため, 対応する項が正となり, 級数の値も正となる.
    したがって $`u^{-1}(0)=F`$ となる連続関数 $`u:X\to[0,1]`$ が得られる.
    互いに素な閉集合 $`F,E`$ に対して $`u^{-1}(0)=F`$, $`v^{-1}(0)=E`$ を選ぶと, $`u+v`$ はどの点でも正である.
    よって $`h=u/(u+v)`$ は連続で, $`h^{-1}(0)=F`$ かつ $`h^{-1}(1)=E`$ となる.

Proposition. **正則性の近傍閉包による特徴づけ**
:   位相空間 $`X`$ が正則であることと, 任意の開集合 $`U`$ と点 $`x\in U`$ に対して
    ```math
    \exists V\in\mathbf O_X\quad
    x\in V\subseteq\overline{V}\subseteq U
    ```
    を満たす開集合 $`V`$ が存在することは同値である.

<u>proof.</u>
:   $`X`$ が正則であるとする.
    $`x\in U`$ ならば, $`\{x\}`$ と閉集合 $`X\setminus U`$ は近傍で分離される.
    したがって, $`x\in V`$ かつ $`X\setminus U\subseteq W`$ を満たす互いに交わらない開集合 $`V,W`$ が存在する.
    $`V\subseteq X\setminus W`$ であり, $`X\setminus W`$ は閉集合であるから, $`\overline V\subseteq X\setminus W\subseteq U`$ である.
    逆に, $`x\notin F`$ を満たす閉集合 $`F`$ と点 $`x`$ をとる.
    $`U=X\setminus F`$ とおき, 仮定から $`x\in V\subseteq\overline V\subseteq U`$ を満たす開集合 $`V`$ をとる.
    $`X\setminus\overline V`$ は $`F`$ の開近傍であり, $`V`$ と交わらない.
    よって $`\{x\}`$ と $`F`$ は近傍で分離される.

Proposition. **正規性の近傍閉包による特徴づけ**
:   位相空間 $`X`$ が正規であることと, 任意の閉集合 $`F`$ と開集合 $`U`$ に対して
    ```math
    F\subseteq U\quad\Longrightarrow\quad
    \exists V\in\mathbf O_X\quad
    F\subseteq V\subseteq\overline{V}\subseteq U
    ```
    が成り立つことは同値である.

<u>proof.</u>
:   $`X`$ が正規で, $`F\subseteq U`$ とする.
    $`F`$ と閉集合 $`X\setminus U`$ は近傍で分離されるから, $`F\subseteq V`$ と $`X\setminus U\subseteq W`$ を満たす互いに交わらない開集合 $`V,W`$ が存在する.
    $`V\subseteq X\setminus W`$ から $`\overline V\subseteq X\setminus W\subseteq U`$ が得られる.
    逆に, 互いに交わらない閉集合 $`F,E`$ をとる.
    $`U=X\setminus E`$ に対して仮定を適用すると, $`F\subseteq V\subseteq\overline V\subseteq X\setminus E`$ を満たす開集合 $`V`$ が存在する.
    $`X\setminus\overline V`$ は $`E`$ の開近傍であり, $`V`$ と交わらない.
    よって $`X`$ は正規である.

Proposition. **完全正規性と零点集合**
:   位相空間 $`X`$ が完全正規であることと, $`X`$ の任意の閉集合がある連続写像 $`u:X\to\mathbb R`$ の零点集合 $`u^{-1}(\{0\})`$ となることは同値である.

<u>proof.</u>
:   $`X`$ が完全正規で, $`F`$ が閉集合であるとする.
    $`F`$ と空集合を函数でちょうど分離する連続写像 $`f:X\to[0,1]`$ をとると, $`F=f^{-1}(\{0\})`$ である.
    逆に, 任意の閉集合が零点集合であると仮定する.
    互いに交わらない閉集合 $`F,E`$ に対して, $`u^{-1}(\{0\})=F`$ かつ $`v^{-1}(\{0\})=E`$ を満たす連続写像 $`u,v:X\to\mathbb R`$ をとる.
    $`F\cap E=\emptyset`$ だから $`|u|+|v|`$ は $`X`$ 上で正である.
    ```math
    h=\frac{|u|}{|u|+|v|}
    ```
    とおけば $`h`$ は連続で, $`h^{-1}(\{0\})=F`$ かつ $`h^{-1}(\{1\})=E`$ を満たす.
    よって $`X`$ は完全正規である.

Proposition. **Hausdorff 性と対角線**
:   位相空間 $`X`$ が Hausdorff 空間であることと, 対角線
    ```math
    \Delta_X=\{(x,x)\mid x\in X\}
    ```
    が積空間 $`X\times X`$ の閉集合であることは同値である.
    さらに, Hausdorff 空間 $`X`$ と位相空間 $`A`$ に対して, 任意の連続写像 $`f,g:A\to X`$ の等化集合 $`\{a\in A\mid f(a)=g(a)\}`$ は $`A`$ の閉集合であり, $`f`$ のグラフは $`A\times X`$ の閉集合である.

<u>proof.</u>
:   $`X`$ が Hausdorff で, $`(x,y)\notin\Delta_X`$ とする.
    $`x\neq y`$ だから, $`x\in U`$, $`y\in V`$ を満たす互いに交わらない開集合 $`U,V`$ が存在する.
    $`U\times V`$ は $`(x,y)`$ の開近傍で $`\Delta_X`$ と交わらない.
    よって $`\Delta_X`$ は閉集合である.
    逆に, $`x\neq y`$ とする.
    $`(x,y)\notin\Delta_X`$ であるから, 対角線の閉性により $`(x,y)`$ の開近傍 $`U\times V`$ で $`U\cap V=\emptyset`$ を満たすものが存在する.
    したがって $`X`$ は Hausdorff である.
    連続写像 $`(f,g):A\to X\times X`$ による $`\Delta_X`$ の逆像が等化集合であるから, 等化集合は閉集合である.
    グラフの閉性は, $`f(a)\neq y`$ を満たす $`(a,y)\in A\times X`$ に対して, Hausdorff 性と $`f`$ の連続性から $`a`$ の開近傍 $`U`$ と $`y`$ の開近傍 $`V`$ を $`f(U)\cap V=\emptyset`$ となるように選べることから従う.

Proposition. **分離性の部分空間への遺伝**
:   位相空間 $`X`$ が $`\mathbf{T}_0`$, $`\mathbf{T}_1`$, Hausdorff, Urysohn, 正則, または完全正則であるならば, 任意の部分空間 $`S\subseteq X`$ も同じ性質をもつ.

<u>proof.</u>
:   $`S`$ における開集合と閉集合は, それぞれ $`X`$ の開集合または閉集合との共通部分で表される.
    $`\mathbf{T}_0`$, $`\mathbf{T}_1`$, Hausdorff, Urysohn の各性質については, 点を分離する開集合または閉近傍を $`S`$ と交わらせればよい.
    正則性について, $`F`$ を $`S`$ の閉集合, $`x\in S\setminus F`$ とする.
    $`F=S\cap\overline F^{X}`$ であるから $`x\notin\overline F^{X}`$ であり, $`X`$ の正則性から $`\{x\}`$ と $`\overline F^{X}`$ を分離する近傍をとれる.
    それらを $`S`$ と交わらせると, $`\{x\}`$ と $`F`$ の分離近傍が得られる.
    完全正則性についても同様に $`\overline F^{X}`$ を用い, $`X`$ 上の分離函数を $`S`$ へ制限すればよい.

Proposition. **分離性の積空間への遺伝**
:   位相空間族 $`(X_\lambda)_{\lambda\in\Lambda}`$ の各空間が $`\mathbf{T}_0`$, $`\mathbf{T}_1`$, Hausdorff, Urysohn, 正則, または完全正則であるならば, 積空間 $`\prod_{\lambda\in\Lambda}X_\lambda`$ も同じ性質をもつ.

<u>proof.</u>
:   二点 $`x,y`$ が異なるならば, ある添字 $`\lambda`$ に対して $`x_\lambda\neq y_\lambda`$ である.
    $`\mathbf{T}_0`$, $`\mathbf{T}_1`$, Hausdorff, Urysohn の各性質について, この座標における分離集合または分離近傍の逆像をとれば, 積空間における同じ分離が得られる.
    正則性について, $`x\in U`$ を満たす積空間の開集合 $`U`$ をとる.
    積位相の開基から, 有限集合 $`L\subseteq\Lambda`$ と開集合 $`U_\lambda\subseteq X_\lambda`$ によって定まる基本開集合 $`B`$ が存在して $`x\in B\subseteq U`$ となる.
    各 $`\lambda\in L`$ に対して $`x_\lambda\in V_\lambda\subseteq\overline{V_\lambda}\subseteq U_\lambda`$ をとり, $`\lambda\notin L`$ では $`V_\lambda=X_\lambda`$ とおく.
    基本開集合 $`V=\prod_\lambda V_\lambda`$ は $`x\in V\subseteq\overline V\subseteq B\subseteq U`$ を満たす.
    よって正則性の近傍閉包による特徴づけから, 積空間は正則である.
    完全正則性について, $`x\in U`$ を満たす基本開近傍 $`B\subseteq U`$ をとり, $`L`$ をその有限な支持とする.
    $`L=\emptyset`$ の場合は, 定数函数 $`f=0`$ が $`x`$ と空集合を函数で分離する.
    $`L\neq\emptyset`$ の場合, 各 $`\lambda\in L`$ に対して, $`x_\lambda`$ と $`X_\lambda\setminus U_\lambda`$ を分離する連続函数 $`f_\lambda:X_\lambda\to[0,1]`$ をとる.
    ```math
    f(z)=\max_{\lambda\in L}f_\lambda(z_\lambda)
    ```
    と定めると, $`f`$ は連続で $`f(x)=0`$ である.
    $`z\notin B`$ ならばある $`\lambda\in L`$ に対して $`z_\lambda\notin U_\lambda`$ であるから $`f(z)=1`$ となる.
    したがって $`f`$ は $`x`$ と $`X\setminus U`$ を函数で分離し, 積空間は完全正則である.

Remark. **正規性の積空間による保存に関する注意**
:   正規性は各因子から任意の積空間へ一般には遺伝しない.
    したがって, 上の命題で正規性を列挙せず, 正規空間の積に関する主張を用いる場合は追加の仮定を明記する.

### Kolmogorov 商

2 点 $`x,y`$ が位相的に識別可能でないとき $`x\sim y`$ として定めたとき, この関係 $`\sim`$ を**位相的不可識別性** (*topological indistinguishability*) と呼ぶ.

Proposition.
:   位相的不可識別性は同値関係である.

<u>proof.</u>
:   任意の点の近傍系は自分自身と一致するから反射的である.
    近傍系の一致は対称的であり, また $`\mathcal{N}(x)=\mathcal{N}(y)`$ と $`\mathcal{N}(y)=\mathcal{N}(z)`$ なら $`\mathcal{N}(x)=\mathcal{N}(z)`$ なので推移的である.
    よって位相的不可識別性は同値関係である.

Definition. **Kolmogorov 商**
:   位相空間 $`X`$ に対して, 位相的不可識別性 $`\sim`$ による商空間 $`X/\sim`$ を $`X`$ の **Kolmogorov 商** (*Kolmogorov quotient*) といい, $`\operatorname{KQ}X`$ と表す.

Theorem. **Kolmogorov 商の普遍性**
:   位相空間 $`X`$ の Kolmogorov 商 $`X_0`$ は Kolmogorov 空間となる.
    さらに任意の Kolmogorov 空間 $`Y`$ と連続写像 $`f:X\to Y`$ に対して, 連続写像 $`\overline{f}:\operatorname{KQ}X\to Y`$ が一意的に存在して $`f=\overline{f}\circ\pi`$ が成り立つ. ただし, $`\pi:X\to\operatorname{KQ}X`$ は商写像である.

<u>proof.</u>
:   $`X`$ の二点が商で同じ点に移ることは, それらの近傍系が一致することを意味する.
    商空間の開集合は逆像で特徴づけられるので, 商の異なる二点はある開集合によって区別される.
    したがって $`\operatorname{KQ}X`$ は $`T_0`$ 空間である.

    次に連続写像 $`f:X\to Y`$ をとる.
    $`x\sim x'`$ と仮定する.
    もし $`f(x)\neq f(x')`$ なら, $`Y`$ の $`T_0`$ 性から $`f(x),f(x')`$ の一方だけを含む開集合 $`G`$ がある.
    しかし $`f^{-1}(G)`$ は $`x,x'`$ の一方だけを含む開集合となり, $`x\sim x'`$ に反する.
    よって $`f`$ は同値類上定数である.
    従って
    ```math
    \overline f([x])\coloneqq f(x)
    ```
    は well-defined であり, $`f=\overline f\circ\pi`$ を満たす.
    $`\pi`$ は商写像であるから, $`\overline f\circ\pi=f`$ の連続性は $`\overline f`$ の連続性を含意する.
    最後に $`\pi`$ は全射なので, この等式を満たす二つの写像はすべての同値類で一致する.
    よって $`\overline f`$ は一意である.

この定理より対応 $`X\mapsto\operatorname{KQ}X`$ は, 位相空間から Kolmogorov 空間への反射とみなせる.

### $`\mathbf{T}_0`$-reflection と弱い分離性

Definition. **対称的空間**
:   位相空間 $`X`$ が **対称的** (*symmetric*) であるとは, 任意の 2 点 $`x,y`$ が位相的に識別可能 ならば $`x,y`$ は分離されるときいう.

Proposition. **対称的**
:   位相空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は対称的である.
    2. $`X`$ の Kolmogorov 商 は $`\mathbf{T}_1`$ 空間である.

<u>proof.</u>
:   位相的に識別不能な点を同一視しているため, Kolmogorov 商では異なる二点は識別可能である.
    対称性は, 識別可能な二点が互いの閉包に入らないこと, すなわち特殊化順序が対称であることと同値である.
    この性質は Kolmogorov 商へ移る.
    Kolmogorov 商は $`T_0`$ であり, $`T_0`$ 性と特殊化順序の対称性は $`T_1`$ 性と同値である.
    よって条件 1 から条件 2 が従う.
    逆に商が $`T_1`$ なら, 商で異なる二点は互いの閉包に入らない.
    商写像の逆像をとれば, 元の空間で識別可能な二点も分離される.
    よって $`X`$ は対称的である.

Proposition.
:   位相空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は前正則である.
    2. $`X`$ の Kolmogorov 商 は Hausdorff 空間である.

<u>proof.</u>
:   前正則性とは, 位相的に識別可能な二点が近傍で分離されるという性質である.
    Kolmogorov 商では異なる二点がちょうど識別可能な二点に対応する.
    商写像の定義から, 商における二点の交わらない近傍は元の空間で対応する同値類を分離する飽和開近傍に持ち上がる.
    逆に元の空間での分離近傍は商に降下する.
    したがって前正則性は Kolmogorov 商の Hausdorff 性と同値である.

古典的には前正則性を $`\mathbf{R}_1`$ 公理と呼ぶことがある.

Definition. **弱 Urysohn 性**
:   位相空間 $`X`$ が **弱 Urysohn 性**を持つとは, $`X`$ の任意の 2 点 $`x,y`$ が位相的に識別可能 ならば $`x,y`$ は閉近傍で分離されるときいう.

この名称は本書での便宜的なものであり, 古典的な記号では $`R_{1\frac12}`$ と表されることがある.

Proposition.
:   位相空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は弱 Urysohn 性を持つ.
    2. $`X`$ の Kolmogorov 商 は Urysohn 空間である.

<u>proof.</u>
:   Kolmogorov 商では, 異なる二点はちょうど元の空間で識別可能な二点に対応する.
    商での閉近傍による分離を商写像で引き戻せば, 元の空間での閉近傍による分離を得る.
    逆に元の空間で識別可能な二点を閉近傍で分離できれば, 同値類で飽和した近傍を用いる標準的な飽和化によりその分離は商へ降下する.
    したがって二つの条件は同値である.

### 名前付き $`\mathbf{T}_0`$-分離空間

Definition. **Vietoris 空間**
:   正則かつ Kolmogorov な位相空間を **Vietoris 空間** (*Vietoris space*) という.

同値に, 正則 Hausdorff 空間である.

古典的には $`\mathbf{T}_3`$ 空間と呼ばれる.

Definition. **Tychonoff 空間**
:   完全正則かつ Kolmogorov な位相空間を **Tychonoff 空間** (*Tychonoff space*) という.

同値に, 完全正則 Hausdorff 空間である.

古典的には $`\mathbf{T}_{3\frac12}`$ 空間と呼ばれる.

Definition. **Tietze 空間**
:   正規かつ $`\mathbf{T}_1`$ な位相空間を **Tietze 空間** (*Tietze space*) という.

同値に, 正規 Hausdorff 空間である.

古典的には $`\mathbf{T}_4`$ 空間と呼ばれる.

Definition. **$`\mathbf{T}_5`$ 空間**
:   遺伝的正規かつ $`\mathbf{T}_1`$ な位相空間を $`\mathbf{T}_5`$ 空間という.

古典的には **全部分正規 Hausdorff** (*completely normal Hausdorff space*) とも呼ばれる.

Definition. **$`\mathbf{T}_6`$ 空間**
:   完全正規かつ $`\mathbf{T}_1`$ な位相空間を $`\mathbf{T}_6`$ 空間という.

古典的には **完全正規 Hausdorff** (*perfectly normal Hausdorff space*) とも呼ばれる.

### 古典的分離公理との対応

古典的な $`\mathbf{T}_n`$ 記法は, 以上の名前付き性質を次のように組み合わせたものとして理解できる.

| 古典記号 | 現代的な記述 |
| --- | --- |
| $`\mathbf{T}_0`$ | Kolmogorov |
| $`\mathbf{T}_1`$ | $`\mathbf{T}_1`$ |
| $`\mathbf{T}_2`$ | Hausdorff |
| $`\mathbf{T}_{2\frac{1}{2}}`$ | Urysohn |
| $`\mathbf{T}_3`$ | regular + $`\mathbf{T}_0`$ |
| $`\mathbf{T}_{3\frac{1}{2}}`$ | completely regular + $`\mathbf{T}_0`$ |
| $`\mathbf{T}_4`$ | normal + $`\mathbf{T}_1`$ |
| $`\mathbf{T}_5`$ | hereditarily normal + $`\mathbf{T}_1`$ |
| $`\mathbf{T}_6`$ | perfectly normal + $`\mathbf{T}_1`$ |

この表から分かるように, $`\mathbf{T}_0,\mathbf{T}_1,\mathbf{T}_2,\dots`$ は一種類の分離条件を単純に段階的に強めた系列ではない.

実際,

- $`\mathbf{T}_0,\mathbf{T}_1,\mathbf{T}_2`$ は主として点同士の分離,
- regularity は点と閉集合の分離,
- complete regularity は連続函数による点と閉集合の分離,
- normality は閉集合同士の分離,
- hereditary normality は normality の遺伝性,
- perfect normality は normality に閉集合の $`G_\delta`$ 性を加えた条件,

という異なる方向の強化を含んでいる.

したがって, 本書では $`\mathbf{T}_n`$ を分離性の基本定義としては用いず, 名前付きの分離性を基本概念とし, $`\mathbf{T}_n`$ はそれらの古典的な組合せを表す記法として扱う.