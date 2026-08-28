## コンパクト性

コンパクト性は, 任意の開被覆から有限個だけを選んでも空間を覆えるという有限性の条件である.
この条件は連続写像, フィルター, 点列, 関数空間における収束を結び付けるため, その変種と保存性を比較する.

### コンパクト空間

Definition. **コンパクト空間**
:   位相空間 $`X`$ が **コンパクト性を持つ** (*compactness*) とは, $`X`$ の任意の開被覆が有限な部分被覆を持つときいう. コンパクト性を持つ位相空間を **コンパクト空間** (*compact space*) という.

### Noether 空間

Definition. **Noether 空間**
:   位相空間 $`X`$ が **Noether 空間** (*Noetherian space*) であるとは, $`X`$ の閉集合の任意の降鎖
    ```math
    F_0\supseteq F_1\supseteq F_2\supseteq\cdots
    ```
    がある段階で安定する, すなわちある $`m`$ が存在して $`F_m=F_{m+1}=\cdots`$ となるときいう.
    同値に, 開集合の任意の昇鎖が安定する.

Theorem. **Noether 性と遺伝的コンパクト性**
:   位相空間 $`X`$ に対して, 次は同値である.
    1. $`X`$ は Noether 空間である.
    2. $`X`$ の任意の開集合はコンパクトである.
    3. $`X`$ の任意の部分空間はコンパクトである.

<u>proof.</u>
:   Noether 空間の任意の部分集合は, 誘導位相に関して Noether 空間である.
    実際, 部分空間の閉集合の降鎖を全空間の閉集合との共通部分で表し, 全空間の降鎖条件を適用すればよい.
    よって $`(1)\Rightarrow(3)`$ が成り立つ.
    $`(3)\Rightarrow(2)`$ は開集合を部分空間とみれば従う.
    $`(2)\Rightarrow(1)`$ の対偶を示す.
    安定しない開集合の昇鎖 $`U_0\subsetneq U_1\subsetneq\cdots`$ があれば, $`U=\bigcup_{n\geq0}U_n`$ は開集合である.
    族 $`(U_n)_{n\geq0}`$ は $`U`$ の開被覆であるが, 昇鎖が安定しないため有限部分被覆をもたない.
    したがって $`U`$ はコンパクトでなく, (2) に反する.

Remark.
:   Hausdorff Noether 空間は有限離散空間である.
    実際, Noether 空間はコンパクトであり, Hausdorff 空間ではコンパクト部分集合が閉である.
    よってすべての部分集合が閉となり, 空間は離散である.

Theorem. **コンパクト性と同値な命題**
:   位相空間 $`X`$ に対して以下同値.
    1. $`X`$ はコンパクト空間である.
    2. $`X`$ の有限交叉性をもつ部分集合族 $`\mathbf{F}`$ に対して $`\bigcap_{F\in\mathbf{F}}\overline{F}\neq\emptyset`$ となる.
    3. $`X`$ 上の任意のフィルターは堆積点を持つ. すなわち, フィルター $`\mathbf{F}`$ に対して $`\bigcap_{F\in\mathbf{F}}\overline{F}\neq\emptyset`$ となる.
    4. $`X`$ 上の任意のフィルターは収束する細分を持つ.
    5. $`X`$ 上の任意の極大フィルターは収束する.

<u>proof.</u>
:   $`(1)\Rightarrow(2)`$ を示す.
    有限交叉性を持つ族 $`\mathbf F`$ に対して $`\bigcap_{F\in\mathbf F}\overline F=\emptyset`$ と仮定すると, $`\{X\setminus\overline F\mid F\in\mathbf F\}`$ は開被覆である.
    有限部分被覆をとると, 対応する有限個の $`F`$ の交叉は空となり, 有限交叉性に矛盾する.

    $`(2)\Rightarrow(3)`$ は, フィルターに属する集合族が有限交叉性を持つことから従う.
    実際, 得られる点はフィルターのすべての元の閉包に属するので堆積点である.
    $`(3)\Rightarrow(4)`$ では, フィルター $`\mathcal F`$ の堆積点を $`x`$ とする.
    $`\mathcal F\cap\mathcal N(x)`$ は真のフィルターであり, $`\mathcal F`$ を細分して $`x`$ に収束する.
    $`(4)\Rightarrow(5)`$ は直ちに従う.

    最後に $`(5)\Rightarrow(1)`$ を示す.
    有限部分被覆を持たない開被覆 $`\mathcal U`$ があると仮定する.
    閉集合族 $`\{X\setminus U\mid U\in\mathcal U\}`$ は有限交叉性を持つので, それを含む極大フィルター $`\mathcal M`$ が存在する.
    仮定から $`\mathcal M`$ はある $`x\in X`$ に収束する.
    ある $`U\in\mathcal U`$ が $`x`$ を含むが, $`U`$ は収束フィルターに属する一方で $`X\setminus U`$ も $`\mathcal M`$ に属する.
    これは空集合が $`\mathcal M`$ に属することを意味し矛盾する.
    よってすべての開被覆は有限部分被覆を持つ.

Proposition. **コンパクト性の連続全射像による保存**
:   コンパクト空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ もコンパクト空間となる.

<u>proof.</u>
:   $`Y`$ の開被覆 $`\mathcal{V}`$ をとる.
    連続性により, $`\{f^{-1}(V)\mid V\in\mathcal{V}\}`$ は $`X`$ の開集合族である.
    $`f`$ が全射であるから, この族は $`X`$ を被覆する.
    $`X`$ のコンパクト性により, $`V_1,\ldots,V_n\in\mathcal{V}`$ が存在して
    ```math
    X=f^{-1}(V_1)\cup\cdots\cup f^{-1}(V_n)
    ```
    となる.
    全射性から $`Y=V_1\cup\cdots\cup V_n`$ である.
    よって $`\mathcal{V}`$ は有限部分被覆を持つ.

Proposition. **コンパクト性の閉部分空間への遺伝**
:   コンパクト空間 $`X`$ の閉部分空間 $`F`$ もコンパクト空間となる.

<u>proof.</u>
:   $`F`$ の開被覆 $`\mathcal{U}`$ をとる.
    各 $`U\in\mathcal{U}`$ を $`X`$ の開集合として選ぶと, $`\mathcal{U}\cup\{X\setminus F\}`$ は $`X`$ の開被覆となる.
    $`X`$ のコンパクト性から有限部分被覆が存在する.
    そこから $`X\setminus F`$ を除けば, 残る有限個の集合は $`F`$ を被覆する.
    よって $`F`$ はコンパクトである.

Proposition. **Hausdorff 空間のコンパクト部分集合**
:   Hausdorff 空間のコンパクトな部分集合は閉集合となる.

<u>proof.</u>
:   Hausdorff 空間 $`X`$ のコンパクト部分集合 $`K`$ と $`x\in X\setminus K`$ をとる.
    各 $`y\in K`$ に対して, $`x\in U_y`$, $`y\in V_y`$, $`U_y\cap V_y=\emptyset`$ を満たす開集合 $`U_y,V_y`$ が存在する.
    $`\{V_y\mid y\in K\}`$ は $`K`$ の開被覆であるから, ある $`y_1,\ldots,y_n\in K`$ に対して $`K\subseteq V_{y_1}\cup\cdots\cup V_{y_n}`$ となる.
    $`U=U_{y_1}\cap\cdots\cap U_{y_n}`$ とおくと, $`U`$ は $`x`$ の開近傍である.
    さらに $`U\cap K=\emptyset`$ であるから $`U\subseteq X\setminus K`$ である.
    よって $`X\setminus K`$ は開集合であり, $`K`$ は閉集合である.

Theorem. **Heine–Borel の被覆定理の類似**
:   コンパクト距離空間 $`K`$ 上の連続複素数値写像の集合 $`S\subseteq C(K,\mathbb{C})`$ に対して, $`S`$ が一様ノルムによりコンパクトであることと, $`S`$ が閉集合かつ各点ごとに有界かつ同程度連続であることは同値である.

<u>proof.</u>
:   $`S`$ が一様ノルムでコンパクトなら, 評価写像 $`f\mapsto f(x)`$ の連続性から各点有界であり, 有限個の一様ノルム球で被覆することで同程度連続性も従う.
    逆に $`S`$ が各点有界かつ同程度連続であるとする.
    任意の $`\varepsilon>0`$ に対し, 同程度連続性と $`K`$ のコンパクト性から有限集合 $`E\subseteq K`$ を選び, 各 $`x\in K`$ がある $`e\in E`$ に対して $`|f(x)-f(e)|<\varepsilon/3`$ をすべての $`f\in S`$ について満たすようにできる.
    評価値の集合 $`\{(f(e))_{e\in E}\mid f\in S\}`$ は有限次元空間で有界なので全有界である.
    その有限 $`\varepsilon/3`$-近似を上の不等式と合わせると, $`S`$ は一様ノルムで全有界となる.
    $`C(K,\mathbb C)`$ は一様ノルムで完備であり, $`S`$ は閉集合だから完備でもある.
    よって $`S`$ はコンパクトである.

Theorem. **Dini の定理**
:   コンパクト空間 $`X`$ に対して, 連続写像の列 $`(f_n:X\to\mathbb{R})_{n\in\mathbb N}`$ が
    1. $`(f_n)`$ はある連続写像 $`f:X\to\mathbb{R}`$ に各点収束する.
    2. $`(f_n)`$ は単調増加列である. (i.e. $`f_n(x)\leq f_{n+1}(x),x\in X,n\in\mathbb N`$)

    を満たすとき, $`(f_n)`$ は $`f`$ に一様収束する.

<u>proof.</u>
:   各 $`x\in X`$ で $`f_n(x)\uparrow f(x)`$ であるから, $`f-f_n\geq0`$ である.
    $`\varepsilon>0`$ に対し
    ```math
    U_n\coloneqq\{x\in X\mid f(x)-f_n(x)<\varepsilon\}
    ```
    とおく.
    各 $`U_n`$ は開集合であり, 点ごとの収束から $`(U_n)_{n\geq1}`$ は $`X`$ の開被覆となる.
    単調性より $`U_n\subseteq U_{n+1}`$ である.
    コンパクト性から有限部分被覆が存在し, その添字の最大値を $`N`$ とすれば $`U_N=X`$ となる.
    よって任意の $`x\in X`$ に対して $`0\leq f(x)-f_N(x)<\varepsilon`$ であり, 単調性からすべての $`n\geq N`$ について同じ不等式が成り立つ.
    したがって $`f_n`$ は $`f`$ に一様収束する.

Theorem. **Tychonoff の定理**
:   すべて空でない位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ に対して, 以下同値.
    1. 各 $`X_\lambda`$ はコンパクト空間である.
    2. 積空間 $`\prod_{\lambda\in\Lambda}X_\lambda`$ はコンパクト空間である.

<u>proof.</u>
:   選択公理により, 非空な因子の族の積は非空であり, 各射影 $`\pi_\lambda:\prod_\mu X_\mu\to X_\lambda`$ は連続全射である.
    よって $`(2)\Rightarrow(1)`$ はコンパクト性の連続全射像による保存から従う.
    $`(1)\Rightarrow(2)`$ を示す.
    積空間上の超フィルター $`\mathcal{U}`$ をとる.
    各射影による像 $`(\pi_\lambda)_*\mathcal{U}`$ は $`X_\lambda`$ 上の超フィルターである.
    仮定より各 $`\lambda`$ に対して, この超フィルターが収束する点 $`x_\lambda\in X_\lambda`$ をとれる.
    $`x=(x_\lambda)_{\lambda\in\Lambda}`$ とおく.
    積位相の近傍基は有限個の座標条件で定まる円筒集合からなる.
    各座標への像が $`x_\lambda`$ に収束するので, そのような有限個の座標条件の逆像はすべて $`\mathcal{U}`$ に属する.
    フィルターの有限交叉性により, $`\mathcal{U}`$ は $`x`$ に収束する.
    すべての超フィルターが収束するから, 積空間はコンパクトである.

### Lindelöf 空間

Definition. **Lindelöf 空間**
:   位相空間 $`X`$ が **Lindelöf 性を持つ** (*Lindelöfness*) とは, $`X`$ の任意の開被覆が可算な部分被覆を持つときいう. Lindelöf 性を持つ位相空間を **Lindelöf 空間** (*Lindelöf space*) という.

Proposition. **Lindelöf 性の連続全射像による保存**
:   Lindelöf 空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ も Lindelöf 空間となる.

<u>proof.</u>
:   $`Y`$ の開被覆 $`\mathcal{V}`$ をとる.
    $`\{f^{-1}(V)\mid V\in\mathcal{V}\}`$ は $`X`$ の開被覆である.
    $`X`$ の Lindelöf 性から, ある可算部分族 $`\{V_n\mid n\in\mathbb{N}\}\subseteq\mathcal{V}`$ が存在して
    ```math
    X=\bigcup_{n\in\mathbb{N}}f^{-1}(V_n)
    ```
    となる.
    $`f`$ の全射性により $`Y=\bigcup_{n\in\mathbb{N}}V_n`$ である.
    よって $`Y`$ は Lindelöf 空間である.

Proposition. **Lindelöf 性の閉部分空間への遺伝**
:   Lindelöf 空間 $`X`$ の閉部分空間 $`F`$ も Lindelöf 空間となる.

<u>proof.</u>
:   $`F`$ の開被覆 $`\mathcal{U}`$ をとる.
    各 $`U\in\mathcal{U}`$ を $`X`$ の開集合として選ぶと, $`\mathcal{U}\cup\{X\setminus F\}`$ は $`X`$ の開被覆である.
    $`X`$ の Lindelöf 性から可算部分被覆が存在する.
    そこから $`X\setminus F`$ を除けば, 残る可算個の集合が $`F`$ を被覆する.
    よって $`F`$ は Lindelöf 空間である.

Proposition. **第二可算性から Lindelöf 性**
:   第二可算な位相空間は Lindelöf 空間となる.

<u>proof.</u>
:   可算な開基を $`\mathcal{B}`$ とし, $`X`$ の開被覆 $`\mathcal{U}`$ をとる.
    $`\mathcal{B}`$ のうち, ある $`U\in\mathcal{U}`$ に含まれるもの全体を $`\mathcal{B}'`$ とする.
    $`\mathcal{B}'`$ は可算である.
    $`x\in X`$ に対して $`x\in U`$ となる $`U\in\mathcal{U}`$ を選ぶと, 開基の性質から $`x\in B\subseteq U`$ を満たす $`B\in\mathcal{B}`$ が存在する.
    この $`B`$ は $`\mathcal{B}'`$ に属する.
    よって各 $`B\in\mathcal{B}'`$ について $`B\subseteq U_B`$ となる $`U_B\in\mathcal{U}`$ を一つ選べば, $`\{U_B\mid B\in\mathcal{B}'\}`$ は $`\mathcal{U}`$ の可算部分被覆である.
    したがって $`X`$ は Lindelöf 空間である.

Proposition. **正則 Lindelöf 空間の正規性**
:   正則な Lindelöf 空間は正規空間となる.

<u>proof.</u>
:   互いに交わらない閉集合 $`A,B\subseteq X`$ をとる.
    正則性により, 各 $`a\in A`$ に対して $`a\in U_a`$ かつ $`\overline{U_a}\cap B=\emptyset`$ を満たす開集合 $`U_a`$ を選べる.
    $`A`$ は Lindelöf 空間の閉部分空間なので Lindelöf であり, この被覆から可算部分被覆 $`(U_n)_{n\in\mathbb{N}}`$ をとれる.
    同様に, $`B`$ を被覆し $`\overline{V_n}\cap A=\emptyset`$ を満たす可算列の開集合 $`(V_n)_{n\in\mathbb{N}}`$ をとれる.
    次で定める集合は開集合である.
    ```math
    U=\bigcup_{n\in\mathbb{N}}\left(U_n\setminus\bigcup_{i\leq n}\overline{V_i}\right),\qquad
    V=\bigcup_{n\in\mathbb{N}}\left(V_n\setminus\bigcup_{i\leq n}\overline{U_i}\right).
    ```
    $`A\subseteq U`$ と $`B\subseteq V`$ は, それぞれ $`A\cap\overline{V_i}=\emptyset`$ と $`B\cap\overline{U_i}=\emptyset`$ から従う.
    $`x\in U_n\setminus\bigcup_{i\leq n}\overline{V_i}`$ と $`x\in V_m\setminus\bigcup_{i\leq m}\overline{U_i}`$ が同時に成り立つと仮定する.
    $`n\leq m`$ なら後者は $`x\notin\overline{U_n}`$ を, $`m\leq n`$ なら前者は $`x\notin\overline{V_m}`$ を与え, いずれも矛盾である.
    よって $`U\cap V=\emptyset`$ であり, $`X`$ は正規空間である.

Proposition. **コンパクト性から Lindelöf 性**
:   コンパクト空間は Lindelöf 空間となる.

<u>proof.</u>
:   コンパクト空間の任意の開被覆は有限部分被覆を持つ.
    有限集合は可算であるから, この有限部分被覆は可算部分被覆でもある.
    よってコンパクト空間は Lindelöf 空間である.

Theorem.
:   距離空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は Lindelöf 空間である.
    2. $`X`$ は第二可算である.
    3. $`X`$ は可分である.

<u>proof.</u>
:   $`(2)\Rightarrow(1)`$ は第二可算性から Lindelöf 性への命題である.
    $`(1)\Rightarrow(3)`$ を示す.
    各正整数 $`n`$ に対して半径 $`1/n`$ の開球全体は $`X`$ の開被覆である.
    Lindelöf 性から各 $`n`$ について可算部分被覆を選び, その中心全体を $`D_n`$ とおく.
    $`D=\bigcup_{n\geq1}D_n`$ は可算である.
    空でない開集合 $`U`$ と $`x\in U`$ をとり, $`B(x,\varepsilon)\subseteq U`$ となる $`\varepsilon>0`$ を選ぶ.
    $`2/n<\varepsilon`$ となる $`n`$ をとれば, $`x`$ を覆う $`D_n`$ を中心とする半径 $`1/n`$ の球がある.
    その中心 $`d`$ は $`d(x,d)<1/n<\varepsilon`$ を満たすので $`d\in D\cap U`$ である.
    よって $`D`$ は稠密である.

    $`(3)\Rightarrow(2)`$ を示す.
    可算稠密部分集合を $`D`$ とする.
    $`d\in D`$ と正の有理数 $`q`$ に対する開球 $`B(d,q)`$ 全体は可算である.
    $`x\in U`$ と $`U`$ が開なら, $`B(x,\varepsilon)\subseteq U`$ となる $`\varepsilon>0`$ をとれる.
    $`0<q<\varepsilon/2`$ となる有理数 $`q`$ を選び, 稠密性から $`d(x,d)<q`$ を満たす $`d\in D`$ をとる.
    三角不等式より $`x\in B(d,q)\subseteq B(x,2q)\subseteq U`$ である.
    従ってこれらの球は可算な開基をなす.

### 可算コンパクト空間

Definition. **可算コンパクト空間**
:   位相空間 $`X`$ が **可算コンパクト性を持つ** (*Countably compactness*) とは, $`X`$ の任意の可算開被覆が有限な部分被覆を持つときいう. 可算コンパクト性を持つ位相空間を **可算コンパクト空間** (*Countably compact space*) という.

Theorem. **可算コンパクト性と同値な命題**
:   $`\mathbf{T}_1`$ 位相空間 $`X`$ に対して以下同値.
    1. $`X`$ は可算コンパクト空間である.
    2. $`X`$ の有限交叉性をもつ可算部分集合族 $`\mathbf{F}`$ に対して $`\bigcap_{F\in\mathbf{F}}\overline{F}\neq\emptyset`$ となる.
    3. $`X`$ のすべての可算無限集合は集積点を持つ.

<u>proof.</u>
:   (1)$`\Rightarrow`$(2) はコンパクト性の場合と同様に, 閉包の補集合から得られる可算開被覆へ可算コンパクト性を適用すれば従う.
    (2)$`\Rightarrow`$(3) とする.
    可算無限集合を相異なる点列 $`\{a_n\mid n\in\mathbb N\}`$ として列挙し, 尾部 $`F_n=\{a_k\mid k\geq n\}`$ を考える.
    この族は有限交叉性を持つので, ある $`x\in\bigcap_n\overline{F_n}`$ が存在する.
    $`x=a_k`$ である場合には $`n>k`$ を選べば $`x\notin F_n`$ である.
    したがって $`x`$ の任意の近傍は $`F_n`$ と交わり, その交点は $`x`$ と異なる.
    $`x`$ が列の項でない場合も同じ結論が直ちに成り立つ.
    よって $`x`$ は $`A`$ の集積点である.
    (3)$`\Rightarrow`$(1) は, 有限部分被覆を持たない可算開被覆 $`(U_n)`$ があれば, 増大被覆 $`V_n=U_0\cup\cdots\cup U_n`$ の各補集合から点 $`x_n\notin V_n`$ を選ぶことで示す.
    $`\{x_n\mid n\in\mathbb N\}`$ は無限であり, その集積点はある $`U_N`$ に属する.
    しかし $`n\geq N`$ なら $`x_n\notin V_n\supseteq U_N`$ であるから, $`U_N`$ はこの集合の集積点を持てず矛盾する.

Proposition. **可算コンパクト性の連続全射像による保存**
:   可算コンパクト空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ も可算コンパクト空間となる.

<u>proof.</u>
:   $`Y`$ の可算開被覆 $`\{V_n\mid n\in\mathbb{N}\}`$ をとる.
    連続性より $`\{f^{-1}(V_n)\mid n\in\mathbb{N}\}`$ は $`X`$ の可算開被覆である.
    $`X`$ の可算コンパクト性から, ある有限集合 $`I\subseteq\mathbb{N}`$ が存在して
    ```math
    X=\bigcup_{n\in I}f^{-1}(V_n)
    ```
    となる.
    $`f`$ は全射なので $`Y=\bigcup_{n\in I}V_n`$ である.
    よって $`Y`$ は可算コンパクト空間である.

Proposition. **可算コンパクト性の閉部分空間への遺伝**
:   可算コンパクト空間 $`X`$ の閉部分空間 $`F`$ も可算コンパクト空間となる.

<u>proof.</u>
:   $`F`$ の可算開被覆 $`\{U_n\mid n\in\mathbb{N}\}`$ をとる.
    各 $`U_n`$ を $`X`$ の開集合として選べば, $`F`$ の閉性から
    ```math
    \{U_n\mid n\in\mathbb{N}\}\cup\{X\setminus F\}
    ```
    は $`X`$ の可算開被覆となる.
    したがって有限部分被覆をとれる.
    それを $`F`$ と交わらせると, $`X\setminus F`$ は寄与しないから, 有限個の $`U_n`$ が $`F`$ を被覆する.
    よって $`F`$ は可算コンパクト空間である.

Proposition. **コンパクト性から可算コンパクト性**
:   コンパクト空間は可算コンパクト空間となる.

<u>proof.</u>
:   可算開被覆は特に開被覆である.
    コンパクト性により有限部分被覆を持つから, 可算コンパクト性の定義を満たす.

Definition. **弱可算コンパクト空間**
:   位相空間 $`X`$ が **弱可算コンパクト性を持つ** (*weakly Countably compactness*) あるいは **極限点コンパクト性を持つ** (*limit point compactness*) とは, $`X`$ の任意の無限部分集合が集積点を持つときいう. 弱可算コンパクト性を持つ位相空間を **弱可算コンパクト空間** (*weakly Countably compact space*) あるいは **極限点コンパクト空間** (*limit point compact space*) という.

Proposition. **弱可算コンパクト性の連続全射像による保存**
:   $`T_1`$ 弱可算コンパクト空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ も弱可算コンパクト空間となる.

<u>proof.</u>
:   $`Y`$ の無限部分集合 $`A`$ をとる.
    全射性により各 $`a\in A`$ に対して $`f(x_a)=a`$ となる $`x_a\in X`$ を一つ選ぶ.
    $`B=\{x_a\mid a\in A\}`$ は無限集合なので, 仮定から集積点 $`x\in X`$ を持つ.
    任意の $`f(x)`$ の近傍 $`V`$ に対して $`f^{-1}(V)`$ は $`x`$ の近傍である.
    $`f(x)\in A`$ なら, それに対応する $`x_{f(x)}`$ は高々一つである.
    $`x_{f(x)}\neq x`$ の場合には, $`T_1`$ 性から $`X\setminus\{x_{f(x)}\}`$ は $`x`$ の近傍である.
    これを $`f^{-1}(V)`$ と交わらせれば, 集積点の定義により $`B`$ の別の点を得る.
    $`x_{f(x)}=x`$ の場合も, 集積点の定義から $`x`$ と異なる $`B`$ の点を得る.
    $`f(x)\notin A`$ の場合には, 最初から $`f^{-1}(V)\setminus\{x\}`$ 内の任意の $`B`$ の点でよい.
    したがっていずれの場合にも, $`V`$ 内に $`f(x)`$ と異なる $`A`$ の点がある.
    したがって $`V\setminus\{f(x)\}`$ は $`A`$ と交わる.
    すなわち $`f(x)`$ は $`A`$ の集積点である.

Proposition. **コンパクト性から弱可算コンパクト性**
:   コンパクト空間は弱可算コンパクト空間となる.

<u>proof.</u>
:   無限部分集合 $`A\subseteq X`$ が集積点を持たないと仮定する.
    各 $`x\in X`$ について, $`(U_x\setminus\{x\})\cap A=\emptyset`$ を満たす $`x`$ の開近傍 $`U_x`$ をとれる.
    $`\{U_x\mid x\in X\}`$ は開被覆なので, コンパクト性から有限部分被覆 $`U_{x_1},\ldots,U_{x_m}`$ を持つ.
    しかし各 $`U_{x_i}`$ は高々一つの $`A`$ の点しか含まないので, $`A\subseteq\{x_1,\ldots,x_m\}`$ となる.
    これは $`A`$ が無限であることに反する.
    よって $`A`$ は集積点を持ち, $`X`$ は弱可算コンパクト空間である.

Theorem.
:   距離空間 $`X`$ に対して, 以下同値.
    1. $`X`$ はコンパクト空間である.
    2. $`X`$ は弱可算コンパクト空間である.
    3. $`X`$ は点列コンパクト空間である.

<u>proof.</u>
:   (1)$`\Rightarrow`$(2) は直前の命題による.
    (2)$`\Rightarrow`$(3) は, 点列が有限個の値しか取らなければ定値部分列を持ち, そうでなければその値の集合の集積点に収束する部分列を距離球を半径 $`1/n`$ として順に選ぶことで従う.
    (3)$`\Rightarrow`$(1) では, まず $`X`$ が全有界であることを示す.
    そうでなければ, ある $`\varepsilon>0`$ に対して互いの距離が $`\varepsilon`$ 以上である点列を帰納的に作れ, これは収束部分列を持たない.
    また Cauchy 列は収束部分列を持ち, Cauchy 性から列全体がその極限に収束するので $`X`$ は完備である.
    完備かつ全有界な距離空間はコンパクトであるから結論を得る.

### パラコンパクト空間

Definition. **パラコンパクト空間**
:   位相空間 $`X`$ が **パラコンパクト性を持つ** (*paracompactness*) とは, $`X`$ の任意の開被覆が局所有限な開細分を持つときいう. パラコンパクト性を持つ位相空間を **パラコンパクト空間** (*paracompact space*) という.

### 擬コンパクト空間

Definition. **擬コンパクト空間**
:   位相空間 $`X`$ が **擬コンパクト性を持つ** (*pseudocompactness*) とは, 任意の連続写像 $`X\to\mathbb{R}`$ の像が有界なときいう. 擬コンパクト性を持つ位相空間を **擬コンパクト空間** (*pseudocompact space*) という.

Proposition. **擬コンパクト性の連続全射像による保存**
:   擬コンパクト空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ も擬コンパクト空間となる.

<u>proof.</u>
:   任意の連続写像 $`g:Y\to\mathbb{R}`$ をとる.
    合成 $`g\circ f:X\to\mathbb{R}`$ は連続であるから, $`X`$ の擬コンパクト性よりその像は有界である.
    $`f`$ は全射なので $`g(Y)=(g\circ f)(X)`$ である.
    よって $`g(Y)`$ は有界であり, $`Y`$ は擬コンパクトである.

Proposition. **正規擬コンパクト性の閉部分空間への遺伝**
:   $`\mathbf{T}_1`$ 正規かつ擬コンパクトな空間 $`X`$ の閉部分空間 $`F`$ も $`\mathbf{T}_1`$ 正規かつ擬コンパクトとなる.

<u>proof.</u>
:   閉部分空間は正規性を遺伝する.
    $`F`$ 上の連続関数 $`f:F\to\mathbb{R}`$ をとる.
    Tietze の拡張定理により, $`f`$ は連続関数 $`\widetilde f:X\to\mathbb{R}`$ に拡張される.
    $`X`$ の擬コンパクト性から $`\widetilde f(X)`$ は有界である.
    $`f(F)\subseteq\widetilde f(X)`$ なので $`f(F)`$ も有界である.
    よって $`F`$ は擬コンパクトである.

Proposition. **可算コンパクト性から擬コンパクト性**
:   可算コンパクト空間は擬コンパクト空間となる.

<u>proof.</u>
:   連続関数 $`f:X\to\mathbb{R}`$ が有界でないと仮定する.
    このとき
    ```math
    \left\{f^{-1}((-n,n))\mathrel{\middle|}n\in\mathbb{N}\right\}
    ```
    は $`X`$ の可算開被覆である.
    しかし有限部分族は, 添字の最大値を $`N`$ とすれば $`f^{-1}((-N,N))`$ に含まれるため, $`f`$ の非有界性から $`X`$ を被覆しない.
    これは可算コンパクト性に反する.
    よってすべての連続実数値関数は有界であり, $`X`$ は擬コンパクトである.

Proposition. **弱可算コンパクト性から可算コンパクト性**
:   $`\mathbf{T}_1`$ な弱可算コンパクト空間は可算コンパクト空間となる.

<u>proof.</u>
:   $`T_1`$ 空間では, 可算コンパクト性と「任意の可算無限部分集合が集積点を持つ」という性質は同値である.
    弱可算コンパクト性はより強く任意の無限部分集合についてこの性質を課している.
    したがって可算コンパクト性が従う.

### 点列コンパクト空間

Definition. **点列コンパクト空間**
:   位相空間 $`X`$ が **点列コンパクト性を持つ** (*sequentially compactness*) とは, $`X`$ の任意の点列が収束する部分列を持つときいう. 点列コンパクト性を持つ位相空間を **点列コンパクト空間** (*sequentially compact space*) という.

Proposition. **点列コンパクト性の連続全射像による保存**
:   点列コンパクト空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ も点列コンパクト空間となる.

<u>proof.</u>
:   $`Y`$ の任意の点列 $`(y_n)`$ をとる.
    全射性から $`f(x_n)=y_n`$ を満たす $`x_n\in X`$ を各 $`n`$ について選ぶ.
    $`X`$ の点列コンパクト性より, ある部分列 $`(x_{n_k})`$ が $`x\in X`$ に収束する.
    連続性から $`(y_{n_k})=(f(x_{n_k}))`$ は $`f(x)`$ に収束する.
    よって $`Y`$ は点列コンパクト空間である.

Theorem. **Bolzano–Weierstrass の定理**
:   $`\mathbb{R}^n`$ の有界点列は収束する部分列をもつ.

<u>proof.</u>
:   有界点列 $`(x_k)`$ は, ある閉球 $`\overline B(0,R)`$ に含まれる.
    Heine-Borel の定理により $`\overline B(0,R)`$ はコンパクトである.
    距離空間ではコンパクト集合は点列コンパクトであるから, $`(x_k)`$ は収束する部分列を持つ.

corollary. **点列コンパクト性定理 (Bolzano–Weierstrass の定理と同値な定式化)**
:   $`\mathbb{R}^n`$ の部分集合が点列コンパクトであるための必要十分条件は, それが有界閉集合であることである.

<u>proof.</u>
:   有界閉集合 $`A`$ はあるコンパクト閉球の閉部分集合であるからコンパクトであり, 従って点列コンパクトである.
    逆に $`A`$ が点列コンパクトなら, $`x\in\overline A`$ に対して $`x`$ へ収束する $`A`$ 内の点列を取れる.
    この列は $`A`$ 内で収束する部分列を持ち, 距離空間での極限の一意性からその極限は $`x`$ である.
    よって $`x\in A`$ であり, $`A`$ は閉集合である.
    また $`A`$ が有界でないなら, $`\lVert x_n\rVert>n`$ を満たす点列を選べるが, これは収束部分列を持たないので矛盾する.
    よって $`A`$ は有界閉集合である.
    コンパクトな距離空間の部分集合は閉かつ有界であるので, $`A`$ は有界閉集合である.

### メタコンパクト空間

局所有限性は各点のある近傍で被覆の元を有限個に抑える条件であるのに対し, 点有限性は各点そのものを含む元の数だけを抑える条件である.
メタコンパクト性はこの後者を任意の開被覆に課す性質であり, パラコンパクト性より弱いが, 被覆の重なりを制御するために十分な場面が多い.

Definition. **メタコンパクト空間**
:   位相空間 $`X`$ が **メタコンパクト性を持つ** (*metacompactness*) とは, $`X`$ の任意の開被覆が点有限な開細分を持つときいう.
    メタコンパクト性を持つ位相空間を **メタコンパクト空間** (*metacompact space*) という.

Definition. **可算メタコンパクト空間**
:   位相空間 $`X`$ が **可算メタコンパクト性を持つ** (*countably metacompactness*) とは, $`X`$ の任意の可算開被覆が点有限な開細分を持つときいう. 可算メタコンパクト性を持つ位相空間を **可算メタコンパクト空間** (*countably metacompact space*) という.

Proposition. **パラコンパクト性からメタコンパクト性**
:   パラコンパクト空間はメタコンパクト空間である.

<u>proof.</u>
:   局所有限な族は点有限である.
    実際, $`x`$ の局所有限性を与える近傍は, $`x`$ を含む族の元をすべて含むからである.
    よって各開被覆が局所有限な開細分を持つなら, それは点有限な開細分でもある.

Remark.
:   コンパクト空間と距離空間はパラコンパクトであるからメタコンパクトである.
    また, コンパクト空間 $`K`$ とメタコンパクト空間 $`X`$ に対して $`K\times X`$ はメタコンパクトである.
    逆向きの含意は一般には成り立たず, メタコンパクト性はパラコンパクト性を真に弱める条件である.[^metacompact]

### 直交コンパクト空間

点有限性をさらに緩めると, 一点を含む被覆の元すべての共通部分が近傍を含むことだけを要求する条件が得られる.
この条件で被覆を細分できることを直交コンパクト性という.

Definition. **内部保存族**
:   位相空間 $`X`$ の部分集合族 $`\mathcal V`$ が **内部保存** (*interior-preserving*) であるとは, 任意の $`x\in X`$ に対して
    ```math
    \bigcap\{V\in\mathcal V\mid x\in V\}
    ```
    が $`x`$ の開近傍となるときいう.
    ここで $`\mathcal V`$ は被覆であるため, この交わりを取る集合族は空でない.

Definition. **直交コンパクト空間**
:   位相空間 $`X`$ が **直交コンパクト性を持つ** (*orthocompactness*) とは, $`X`$ の任意の開被覆が内部保存な開細分を持つときいう.
    直交コンパクト性を持つ位相空間を **直交コンパクト空間** (*orthocompact space*) という.

Definition. **可算直交コンパクト空間**
:   位相空間 $`X`$ が **可算直交コンパクト性を持つ** (*countably orthocompactness*) とは, $`X`$ の任意の可算開被覆が内部保存な開細分を持つときいう.

Proposition. **点有限族は内部保存である**
:   点有限な開集合族は内部保存である.

<u>proof.</u>
:   $`x\in X`$ をとる.
    点有限性により $`x`$ を含む族の元は有限個であり, それらの共通部分は開集合である.
    これは $`x`$ を含むので, 内部保存性の条件を満たす.

Corollary. **メタコンパクト性から直交コンパクト性**
:   メタコンパクト空間は直交コンパクト空間である.
    同様に, 可算メタコンパクト空間は可算直交コンパクト空間である.

<u>proof.</u>
:   点有限な開細分をとり, 直前の命題を適用する.

Proposition. **閉部分空間への遺伝**
:   直交コンパクト空間の閉部分空間は直交コンパクト空間である.
    同様に, 可算直交コンパクト性も閉部分空間へ遺伝する.

<u>proof.</u>
:   $`F`$ を直交コンパクト空間 $`X`$ の閉部分空間とし, $`F`$ の開被覆を $`\{U_i\cap F\mid i\in I\}`$ と書く.
    これに $`X\setminus F`$ を加えた $`X`$ の開被覆の内部保存な開細分をとる.
    $`F`$ と交わる元だけを $`F`$ に制限すれば, 元の被覆の開細分である.
    各点での共通部分も $`F`$ における開近傍へ制限されるので, この細分は内部保存である.

Remark.
:   コンパクト空間, パラコンパクト空間, メタコンパクト空間はすべて直交コンパクトである.
    さらに, 直交コンパクト空間 $`X`$ について $`X\times[0,1]`$ が直交コンパクトであることと, $`X`$ が可算メタコンパクトであることは同値である.[^orthocompact]

### 実コンパクト空間

実コンパクト性は, 連続実数値関数が空間をどこまで座標として記述できるかを表す性質である.
コンパクト化が有界連続関数を用いるのに対し, 実コンパクト化ではすべての実数値連続関数を用いる.

Definition. **実コンパクト空間**
:   Tychonoff 空間 $`X`$ が **実コンパクト** (*realcompact*) であるとは, 次の同値な条件を満たすときいう.
    1. ある集合 $`I`$ に対して $`X`$ が積空間 $`\mathbb R^I`$ の閉部分空間と同相である.
    2. 評価写像 $`e_X:X\to\mathbb R^{C(X,\mathbb R)}`$ の像が閉じている.

Definition. **実コンパクト化**
:   $`C(X,\mathbb R)`$ を $`X`$ 上の連続実数値関数全体とする.
    Tychonoff 空間 $`X`$ の評価写像
    ```math
    e_X:X\longrightarrow\mathbb R^{C(X,\mathbb R)},\qquad
    e_X(x)(f)=f(x)
    ```
    の像の閉包を $`\nu X`$ と書き, **実コンパクト化** (*Hewitt realcompactification*) という.
    評価写像は埋め込みであるから, 以下では $`X`$ を $`\nu X`$ の稠密部分空間とみなす.

Proposition. **基本例と閉部分空間への遺伝**
:   コンパクト Hausdorff 空間は実コンパクトである.
    また, 実コンパクト空間の閉部分空間は実コンパクトである.

<u>proof.</u>
:   コンパクト Hausdorff 空間では $`e_X(X)`$ はコンパクトであり, Hausdorff 空間 $`\mathbb R^{C(X,\mathbb R)}`$ では閉じている.
    よって実コンパクト性の第二の特徴づけから $`X`$ は実コンパクトである.
    $`X`$ が $`\mathbb R^I`$ の閉部分空間と同相で $`F`$ が $`X`$ で閉じていれば, $`F`$ は $`\mathbb R^I`$ の閉部分空間と同相である.

Remark.
:   Lindelöf な Tychonoff 空間は実コンパクトである.
    また Tychonoff 空間について, コンパクトであることは実コンパクトかつ擬コンパクトであることと同値である.
    この特徴づけにより, 実コンパクト性は連続実数値関数による閉埋込み性で記述されるコンパクト性の類似概念として位置づけられる.[^realcompact]

### 局所コンパクト空間

Definition. **局所コンパクト空間**
:   Hausdorff 空間 $`X`$ が **局所コンパクト** (*locally compact*) であるとは, 任意の点 $`x\in X`$ がコンパクトな近傍を持つときいう.

Proposition. **局所コンパクト性の近傍による特徴づけ**
:   Hausdorff 空間 $`X`$ に対して, 以下は同値である.
    1. $`X`$ は局所コンパクトである.
    2. 任意の $`x\in X`$ とその開近傍 $`U`$ に対して,
        ```math
        x\in V\subseteq\overline{V}\subseteq U
        ```
        かつ $`\overline{V}`$ がコンパクトとなる開集合 $`V`$ が存在する.

<u>proof.</u>
:   $`(1)\Rightarrow(2)`$ を示す.
    $`x\in U`$ とし, $`x`$ のコンパクト近傍 $`K`$ をとる.
    Hausdorff 空間ではコンパクト集合は閉であるから, $`K`$ は閉集合である.
    部分空間 $`K`$ はコンパクト Hausdorff 空間なので正規である.
    コンパクト近傍の定義から $`x\in O\subseteq K`$ を満たす $`X`$ の開集合 $`O`$ をとる.
    $`K\cap U\cap O`$ は $`K`$ における $`x`$ の開近傍であるから, 正規性により
    ```math
    x\in V\subseteq\overline{V}^{,K}\subseteq K\cap U
    ```
    を満たす $`K`$ での開集合 $`V`$ をとれる.
    $`V\subseteq O`$ であり $`O\subseteq K`$ なので, $`V`$ は $`X`$ の開集合でもある.
    $`K`$ が閉であることから $`\overline{V}^{,X}=\overline{V}^{,K}`$ である.
    よって所望の条件を満たし, 閉部分集合 $`\overline{V}`$ はコンパクトである.

    $`(2)\Rightarrow(1)`$ は $`U=X`$ とおけばよい.
    このとき得られるコンパクト集合 $`\overline{V}`$ は $`x`$ の近傍である.

Proposition. **局所コンパクト性の閉部分空間への遺伝**
:   局所コンパクト Hausdorff 空間の閉部分空間は局所コンパクト Hausdorff 空間である.

<u>proof.</u>
:   局所コンパクト Hausdorff 空間 $`X`$ の閉部分集合 $`F`$ と $`x\in F`$ をとる.
    $`x`$ は $`X`$ においてコンパクトな近傍 $`K`$ を持つ.
    $`F\cap K`$ は $`K`$ の閉部分集合であるからコンパクトである.
    $`K`$ に含まれる $`x`$ の開近傍 $`U`$ をとれば, $`U\cap F`$ は $`F\cap K`$ に含まれる $`x`$ の $`F`$ における開近傍である.
    よって $`F\cap K`$ は $`x`$ のコンパクト近傍である.
    $`x`$ は任意であり, Hausdorff 性は部分空間へ遺伝するから $`F`$ は局所コンパクト Hausdorff 空間である.

[^metacompact]: nLab authors, [“metacompact space”](https://ncatlab.org/nlab/show/metacompact%2Bspace), *nLab*. メタコンパクト性の定義とパラコンパクト性との含意関係を参照.
[^orthocompact]: nLab authors, [“orthocompact space”](https://ncatlab.org/nlab/show/orthocompact%2Bspace), *nLab*; B. M. Scott, “Towards a product theory for orthocompactness”, *Studies in Topology*, 1975, 517--537. Scott の論文が $`X\times[0,1]`$ と可算メタコンパクト性の同値性を扱う.
[^realcompact]: L. Gillman and M. Jerison, *Rings of Continuous Functions*, Springer-Verlag, 1976. 実コンパクト性の定義と, Tychonoff 空間におけるコンパクト性・実コンパクト性・擬コンパクト性の関係を参照.
