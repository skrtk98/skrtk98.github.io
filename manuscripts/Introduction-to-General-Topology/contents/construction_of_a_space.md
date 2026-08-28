## 空間の構成

新しい位相空間は, 既知の空間を積, 余積, 商, 部分空間として組み合わせることで得られる.
ここでは連続写像に関する最弱位相と最強位相を使い, それらの構成を統一して記述する.

### 積と余積

Definition. **積空間**
:   位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ に対して, 台集合の直積による標準射影 $`\pi_\lambda:\prod_{\lambda\in\Lambda}(X_\lambda)_0\to(X_\lambda)_0`$ により
    ```math
    \mathbf{S}\coloneqq\bigcup_{\lambda\in\Lambda}\{\pi_\lambda^{-1}(G_\lambda)\mid G_\lambda\in\mathbf{O}_{X_\lambda}\}
    ```
    として, $`\mathbf{S}`$ により生成される開集合系を $`\mathbf{O}`$ とする. このとき, 開集合系 $`\mathbf{O}`$ により定まる位相空間を, 位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ による **積空間** (*product space*) といい
    ```math
    \prod_{\lambda\in\Lambda}X_\lambda
    ```
    と表す.

Proposition. **積空間の近傍系**
:   積空間 $`Y=\prod_{\lambda\in\Lambda}X_\lambda`$ の点 $`y`$ に対して
    ```math
    \mathcal N^{\times}(y)\coloneqq
    \left\{U\subseteq Y\mathrel{}\middle|\mathrel{}
    \begin{array}{l}
    \exists F\subseteq\Lambda,\ F\text{ is finite},\ \exists(U_\lambda)_{\lambda\in F},\\
    \left(\forall\lambda\in F,\ U_\lambda\in\mathcal N_{X_\lambda}(\pi_\lambda(y))\right)\ \land\\
    \displaystyle\bigcap_{\lambda\in F}\pi_\lambda^{-1}(U_\lambda)\subseteq U
    \end{array}\right\}
    ```
    と定めると, $`\mathcal N^{\times}`$ は積空間の近傍系となる.
    ただし, $`F=\emptyset`$ のときの共通部分は $`Y`$ とする.

<u>proof.</u>
:   まず $`\mathcal N^{\times}(y)`$ が $`Y`$ 上のフィルターであることを示す.
    $`U\in\mathcal N^{\times}(y)`$ を表す有限集合 $`F`$ と近傍族 $`(U_\lambda)_{\lambda\in F}`$ をとる.
    各 $`U_\lambda`$ は $`\pi_\lambda(y)`$ を含むため, その逆像の共通部分は $`y`$ を含む.
    よって $`y\in U`$ である.
    二つの元 $`U,V\in\mathcal N^{\times}(y)`$ を表す有限集合の和をとり, 共通する座標では対応する近傍を交わらせれば, $`U\cap V\in\mathcal N^{\times}(y)`$ となる.
    また, $`U\subseteq W`$ かつ $`U\in\mathcal N^{\times}(y)`$ なら同じ円筒集合が $`W`$ を表すため, $`W\in\mathcal N^{\times}(y)`$ である.
    したがって $`\mathcal N^{\times}(y)`$ はフィルターである.
    次に近傍系の局所性を示す.
    $`U\in\mathcal N^{\times}(y)`$ をとり, $`B=\bigcap_{\lambda\in F}\pi_\lambda^{-1}(U_\lambda)\subseteq U`$ となる表示を選ぶ.
    各因子の近傍系の局所性により, $`V_\lambda\in\mathcal N_{X_\lambda}(\pi_\lambda(y))`$ を
    ```math
    \forall z\in V_\lambda,\quad U_\lambda\in\mathcal N_{X_\lambda}(z)
    ```
    となるように選べる.
    $`V=\bigcap_{\lambda\in F}\pi_\lambda^{-1}(V_\lambda)`$ とおくと $`V\in\mathcal N^{\times}(y)`$ である.
    $`z\in V`$ なら各 $`U_\lambda`$ は $`\pi_\lambda(z)`$ の近傍であるから, $`B\in\mathcal N^{\times}(z)`$ となる.
    $`B\subseteq U`$ と近傍系の上方閉性から $`U\in\mathcal N^{\times}(z)`$ が従う.
    よって $`\mathcal N^{\times}`$ は積空間の近傍系である.

Proposition.
:   位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ の積空間 $`X=\prod_{\lambda\in\Lambda}X_\lambda`$ に対して, 次がそれぞれ成り立つ.
    - 各射影 $`\pi_\lambda:X\to X_\lambda`$ は連続かつ開写像である.
    - 位相空間 $`Y`$ と写像 $`f:Y\to X`$ に対して以下同値.
        1. $`f`$ は連続である.
        2. 各 $`\lambda\in\Lambda`$ に対して $`\pi_\lambda\circ f:Y\to X_\lambda`$ は連続である.

<u>proof.</u>
:   積位相の生成元 $`\pi_\lambda^{-1}(G)`$ は $`G\subseteq X_\lambda`$ が開集合なら開集合である.
    したがって $`\pi_\lambda`$ は連続である.
    $`X`$ の開集合 $`U`$ は有限個の生成元の共通部分の和として表せるので, $`\pi_\lambda(U)`$ が開集合であることを有限交叉の場合に示せばよい.
    空でない基本開集合 $`B=\bigcap_{i=1}^n\pi_{\lambda_i}^{-1}(G_i)`$ をとる.
    $`\lambda`$ がこの有限個の添字に現れるときは, $`\pi_\lambda(B)`$ はその $`\lambda`$ に対応する $`G_i`$ たちの共通部分であり, そうでないときは $`\pi_\lambda(B)=X_\lambda`$ である.
    実際, $`B`$ の点を一つ固定し, $`\lambda`$ 座標だけを任意の許された点に置き換えればよい.
    $`B`$ が空ならその射影も空であるから, いずれの場合も $`\pi_\lambda(B)`$ は開集合である.
    よって射影は開写像である.
    $`f`$ が連続なら, 射影との合成 $`\pi_\lambda\circ f`$ も連続である.
    逆にすべての $`\pi_\lambda\circ f`$ が連続なら, 積位相の部分基の逆像
    ```math
    f^{-1}\bigl(\pi_\lambda^{-1}(G)\bigr)=(\pi_\lambda\circ f)^{-1}(G)
    ```
    が開集合である.
    連続性は部分基の逆像が開集合であることと同値なので, $`f`$ は連続である.

Proposition. **有限個の位相空間の積空間**
:   位相空間の有限列 $`(X_i\mid i=1,2,\ldots,n)`$ に対して,
    ```math
    \left\{\prod_{i=1}^{n}G_i\mathrel{}\middle|\mathrel{}G_i\in\mathbf{O}_{X_i},i=1,\ldots,n\right\}
    ```
    は積空間 $`\prod_{\lambda\in\Lambda}X_\lambda`$ の開基となる.

<u>proof.</u>
:   積位相の部分基は, 一つの座標だけを開集合で制限した円筒集合である.
    有限個の部分基の共通部分は, 各座標について現れる開集合の共通部分を $`G_i`$ とおくことで
    ```math
    \prod_{i=1}^{n}G_i
    ```
    と表せる.
    制限されない座標では $`G_i=X_i`$ とおけばよい.
    逆に, 各 $`G_i`$ が開集合なら $`\prod_iG_i`$ は各座標の円筒集合の有限交叉である.
    したがってこの族は積位相の開基である.

### 箱位相

Definition. **箱位相**
:   位相空間の族 $`(X_\lambda)_{\lambda\in\Lambda}`$ に対して, 直積集合 $`\prod_{\lambda\in\Lambda}X_\lambda`$ の部分集合
    ```math
    \prod_{\lambda\in\Lambda}U_\lambda
    ```
    ただし各 $`U_\lambda`$ は $`X_\lambda`$ の開集合, を開基とする位相を **箱位相** (*box topology*) と呼ぶ.

Proposition. **箱位相と積位相**
:   箱位相は積位相より細かい.
    添字集合 $`\Lambda`$ が有限であるとき, 箱位相と積位相は一致する.
    無限個の因子に対しては, 一般に両者は一致しない.

<u>proof.</u>
:   積位相の基本開集合は有限個の座標だけを制限する.
    これは箱位相の基本開集合で, 制限しない座標に $`U_\lambda=X_\lambda`$ を選んだものに等しい.
    よって積位相は箱位相に含まれる.
    添字集合が有限なら, 箱位相の基本開集合も有限個の座標条件の共通部分であるから, 積位相に含まれる.
    無限積では無限個の座標を同時に制限する箱型集合が現れるため, 一般には一致しない.

Definition. **余積空間**
:   位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ に対して, 台集合のタグ付き和による標準入射 $`\iota_\lambda:(X_\lambda)_0\to\coprod_{\lambda\in\Lambda}(X_\lambda)_0`$ により
    ```math
    \mathbf{O}\coloneqq\left\{G\subseteq\coprod_{\lambda\in\Lambda}(X_\lambda)_0\mathrel{}\middle|\mathrel{}\forall\lambda\in\Lambda,\ \iota_\lambda^{-1}(G)\in\mathbf{O}_{X_\lambda}\right\}
    ```
    とすると, $`\mathbf{O}`$ は $`\coprod_{\lambda\in\Lambda}(X_\lambda)_0`$ の開集合系となる. このとき, 開集合系 $`\mathbf{O}`$ により定まる位相空間を, 位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ による **余積空間** (*coproduct space*) といい
    ```math
    \coprod_{\lambda\in\Lambda}X_\lambda
    ```
    と表す.

Proposition. **余積空間の近傍系**
:   余積空間 $`Y=\coprod_{\lambda\in\Lambda}X_\lambda`$ の点 $`y`$ に対して
    ```math
    \mathcal N^{\amalg}(y)\coloneqq
    \left\{U\subseteq Y\mathrel{}\middle|\mathrel{}
    \exists\lambda\in\Lambda,\exists x\in X_\lambda,
    \ y=\iota_\lambda(x)\ \land
    \iota_\lambda^{-1}(U)\in\mathcal N_{X_\lambda}(x)\right\}
    ```
    と定めると, $`\mathcal N^{\amalg}`$ は余積空間の近傍系となる.

<u>proof.</u>
:   タグ付き和の表示の一意性により, 各 $`y\in Y`$ はただ一つの $`\lambda`$ と $`x\in X_\lambda`$ によって $`y=\iota_\lambda(x)`$ と表される.
    したがって $`\mathcal N^{\amalg}(y)`$ は, $`\iota_\lambda^{-1}`$ による $`\mathcal N_{X_\lambda}(x)`$ の逆像として記述できる.
    逆像は包含関係と有限交叉を保つので, $`\mathcal N^{\amalg}(y)`$ はフィルターである.
    また $`\iota_\lambda^{-1}(U)`$ が $`x`$ の近傍なら, 近傍系の第一公理により $`x\in\iota_\lambda^{-1}(U)`$ である.
    よって $`y\in U`$ となる.
    $`U\in\mathcal N^{\amalg}(y)`$ をとる.
    $`\iota_\lambda^{-1}(U)`$ は $`x`$ の近傍であるから, $`x`$ を含む $`X_\lambda`$ の開集合 $`V_\lambda`$ で $`V_\lambda\subseteq\iota_\lambda^{-1}(U)`$ となるものを選べる.
    $`V=\iota_\lambda(V_\lambda)`$ は余積空間で開集合であり, $`y\in V\subseteq U`$ を満たす.
    任意の $`z\in V`$ に対して $`V`$ は $`z`$ の近傍で $`V\subseteq U`$ であるから, $`U\in\mathcal N^{\amalg}(z)`$ となる.
    よって近傍系の局所性が成り立つ.

Proposition. **余積空間の標準入射と普遍性**
:   位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ の余積空間 $`Y=\coprod_{\lambda\in\Lambda}X_\lambda`$ に対して, 次が成り立つ.
    - 各標準入射 $`\iota_\lambda:X_\lambda\to Y`$ は開埋め込みである.
    - 位相空間 $`Z`$ と写像 $`f:Y\to Z`$ に対して以下同値.
        1. $`f`$ は連続である.
        2. 各 $`\lambda\in\Lambda`$ に対して $`f\circ\iota_\lambda:X_\lambda\to Z`$ は連続である.

<u>proof.</u>
:   余積の定義から, $`G\subseteq Y`$ が開集合であることは, すべての $`\lambda`$ に対して $`\iota_\lambda^{-1}(G)`$ が $`X_\lambda`$ で開集合であることと同値である.
    よって $`\iota_\lambda`$ は連続である.
    また $`\iota_\lambda(X_\lambda)`$ は各成分のタグだけからなる開集合であり, $`\iota_\lambda`$ の逆写像はこの開部分空間上で連続である.
    したがって $`\iota_\lambda`$ は開埋め込みである.
    $`f`$ が連続なら, 各 $`f\circ\iota_\lambda`$ は連続写像の合成として連続である.
    逆にすべての $`f\circ\iota_\lambda`$ が連続なら, 任意の開集合 $`G\subseteq Z`$ に対して
    ```math
    \iota_\lambda^{-1}\bigl(f^{-1}(G)\bigr)=(f\circ\iota_\lambda)^{-1}(G)
    ```
    が各 $`\lambda`$ で開集合となる.
    余積の定義から $`f^{-1}(G)`$ は $`Y`$ で開集合である.
    よって $`f`$ は連続である.

Theorem. **位相空間の直和分解**
:   位相空間 $`X`$ と, $`X`$ の開集合からなる直和分解 $`\{G_\lambda\mid\lambda\in\Lambda\}`$ に対して, 余積空間
    ```math
    \coprod_{\lambda\in\Lambda}G_\lambda
    ```
    は $`X`$ と同相となる.

<u>proof.</u>
:   各 $`G_\lambda`$ を $`X`$ の部分空間とみなし, 標準入射を包含写像 $`j_\lambda:G_\lambda\to X`$ とする.
    直和分解は互いに素な集合の族で $`X=\bigcup_{\lambda\in\Lambda}G_\lambda`$ を満たすから, 写像
    ```math
    h:\coprod_{\lambda\in\Lambda}G_\lambda\longrightarrow X,\qquad h\circ\iota_\lambda=j_\lambda
    ```
    は一意に定まり, 全単射である.
    各 $`j_\lambda`$ は部分空間の包含写像として連続であるから, 余積の普遍性により $`h`$ は連続である.
    逆写像 $`h^{-1}`$ の連続性を示す.
    余積の定義により, $`W\subseteq\coprod_\lambda G_\lambda`$ が開集合であることは各 $`\iota_\lambda^{-1}(W)`$ が $`G_\lambda`$ で開集合であることと同値である.
    $`W`$ を開集合とすると, 各 $`\iota_\lambda^{-1}(W)`$ は $`X`$ の開集合 $`O_\lambda`$ と $`G_\lambda`$ の共通部分で表せる.
    $`G_\lambda`$ 自身が $`X`$ で開集合であるため, $`\iota_\lambda^{-1}(W)`$ は $`X`$ でも開集合である.
    したがって, 各 $`\iota_\lambda^{-1}(W)`$ を $`X`$ の部分集合と同一視すれば,
    ```math
    h(W)=\bigcup_{\lambda\in\Lambda}\iota_\lambda^{-1}(W)
    ```
    は $`X`$ で開集合である.
    よって $`h^{-1}`$ は連続であり, $`h`$ は同相写像である.

### 商と等化

Definition. **商空間**
:   位相空間 $`X`$ と集合 $`Y`$ と全射な写像 $`f:X\to Y`$ に対して, $`Y`$ の部分集合族
    ```math
    \mathbf{O}_f\coloneqq\{G\subseteq Y\mid f^{-1}(G)\in\mathbf{O}_X\}
    ```
    は $`Y`$ の開集合系となる. このとき $`\mathbf{O}_f`$ により定まる位相空間を, $`f`$ による **商空間** (*quotient space*) といい $`X_f`$ と表す.

Proposition. **商空間と商写像の特徴づけ**
:   全射連続写像 $`q:X\to Y`$ による商空間 $`X_q`$ に対して, $`X_q`$ と $`Y`$ は同じ台集合を持つ.
    このとき, 標準的な恒等写像
    ```math
    \operatorname{id}:X_q\longrightarrow Y
    ```
    が同相写像であることと, $`q`$ が商写像であることは同値である.

<u>proof.</u>
:   商空間の定義により, $`X_q`$ の開集合系は
    ```math
    \mathbf O_{X_q}=\{G\subseteq Y\mid q^{-1}(G)\in\mathbf O_X\}
    ```
    である.
    標準的な恒等写像は全単射であり, それと逆写像がともに連続であることは $`\mathbf O_{X_q}=\mathbf O_Y`$ と同値である.
    この開集合系の等式は, 商写像の定義と同値である.
    よって標準的な恒等写像が同相写像であることと $`q`$ が商写像であることは同値である.

Definition. **等化空間**
:   位相空間 $`X`$ と $`X_0`$ 上の同値関係 $`\sim`$ に対して, 同値関係による射影 $`\pi:X_0\to X_0/\sim`$ による商空間 $`X_\pi`$ を, $`\sim`$ による **等化空間** (*identification space*) といい $`X/\sim`$ と表す.

また, 位相空間 $`X`$ の部分集合 $`A`$ に対して, $`A`$ の点を同一視して(一点に縮めて)得られる空間 $`X/A`$ とは,
- **$`A`$ が空でないとき**: 同値関係 $`\sim_A\coloneqq\Delta(X)\cup(A\times A)`$ による等化空間
- **$`A`$ が空なとき**: $`\infty`$ を $`X`$ の点でない形式的な点として $`X`$ と密着空間 $`\{\infty\}`$ の余積空間

として定義する.

Proposition. **等化写像の基本性質**
:   等化空間 $`X/\sim`$ の標準射影
    ```math
    \pi:X\longrightarrow X/\sim
    ```
    は連続全射かつ商写像である.

<u>proof.</u>
:   $`\pi`$ は同値類をその類へ送る写像であるから全射である.
    等化空間の開集合系の定義により, $`G\subseteq X/\sim`$ が開集合であることと $`\pi^{-1}(G)`$ が $`X`$ で開集合であることは同値である.
    したがって $`\pi`$ は連続であり, 商写像の定義も満たす.

Proposition. **等化空間の写像の普遍性**
:   位相空間 $`Y`$ と写像 $`f:X\to Y`$ が
    ```math
    x\sim x'\Longrightarrow f(x)=f(x')
    ```
    を満たすとする.
    このとき, $`f=\overline f\circ\pi`$ を満たす写像
    ```math
    \overline f:X/\sim\longrightarrow Y
    ```
    が一意に存在する.
    さらに $`f`$ が連続であることと $`\overline f`$ が連続であることは同値である.

<u>proof.</u>
:   $`[x]\in X/\sim`$ に対して $`\overline f([x])=f(x)`$ と定める.
    $`x\sim x'`$ なら仮定により $`f(x)=f(x')`$ であるから, この定義は同値類の代表元に依存しない.
    定義から $`f=\overline f\circ\pi`$ が成り立つ.
    $`\pi`$ は全射なので, この等式を満たす写像は一意である.
    $`\overline f`$ が連続なら, $`f=\overline f\circ\pi`$ は連続写像の合成として連続である.
    逆に $`f`$ が連続で $`G\subseteq Y`$ が開集合なら,
    ```math
    \pi^{-1}\bigl(\overline f^{-1}(G)\bigr)=f^{-1}(G)
    ```
    は $`X`$ で開集合である.
    $`\pi`$ が商写像であるから $`\overline f^{-1}(G)`$ は $`X/\sim`$ で開集合となり, $`\overline f`$ は連続である.

Proposition. **等化空間と飽和集合**
:   $`A\subseteq X`$ に対して, 次は同値である.
    1. $`A`$ は同値関係 $`\sim`$ の各同値類を含むか, まったく含まない.
    2. $`A=\pi^{-1}(\pi(A))`$ である.
    さらに, $`X/\sim`$ の部分集合 $`B`$ と飽和集合 $`A`$ の対応
    ```math
    B\longmapsto\pi^{-1}(B),\qquad A\longmapsto\pi(A)
    ```
    は互いに逆であり, $`B`$ が開集合であることと $`\pi^{-1}(B)`$ が $`X`$ で開集合であることは同値である.

<u>proof.</u>
:   $`A`$ が同値類の合併であるなら, $`x\in\pi^{-1}(\pi(A))`$ から $`a\in A`$ で $`x\sim a`$ となるものが得られ, $`x\in A`$ である.
    逆包含は $`x\in A`$ なら $`\pi(x)\in\pi(A)`$ であることから従う.
    したがって (1) から (2) が得られる.
    (2) を仮定すると, $`x\in A`$ と $`x\sim x'`$ に対して $`\pi(x')=\pi(x)\in\pi(A)`$ であるから $`x'\in A`$ となる.
    よって (2) から (1) が得られる.
    任意の $`B\subseteq X/\sim`$ に対して $`\pi(\pi^{-1}(B))=B`$ は $`\pi`$ の全射性から成り立つ.
    また $`A`$ が飽和なら (2) により $`\pi^{-1}(\pi(A))=A`$ である.
    よって二つの対応は互いに逆である.
    最後の開集合の同値は等化空間の開集合系の定義から従う.

Definition. **接着空間**
:   位相空間 $`X,Y`$, 部分空間 $`A\subseteq Y`$, 連続写像 $`f:A\to X`$, 包含写像 $`i:A\to Y`$ に対して, 余積空間 $`X\coprod Y`$ 上の最小の同値関係 $`\sim_f`$ を
    ```math
    \iota_X(f(a))\sim_f\iota_Y(i(a))\qquad(a\in A)
    ```
    を満たすものとして定める.
    このとき等化空間
    ```math
    X\cup_fY\coloneqq(X\coprod Y)/\sim_f
    ```
    を $`f`$ による $`Y`$ の $`X`$ への **接着空間** (*attaching space*) と呼ぶ.
    標準射影を $`q:X\coprod Y\to X\cup_fY`$ とし,
    ```math
    j_X=q\circ\iota_X:X\to X\cup_fY,\qquad
    j_Y=q\circ\iota_Y:Y\to X\cup_fY
    ```
    とおく.

Proposition. **接着空間の標準写像**
:   接着空間の標準写像 $`j_X,j_Y`$ は連続であり,
    ```math
    j_X\circ f=j_Y\circ i
    ```
    を満たす.

<u>proof.</u>
:   $`q`$ と余積の標準入射 $`\iota_X,\iota_Y`$ は連続であるから, それらの合成 $`j_X,j_Y`$ も連続である.
    $`a\in A`$ に対して $`\iota_X(f(a))\sim_f\iota_Y(i(a))`$ であるから, 商空間への射影を合成すれば $`j_X(f(a))=j_Y(i(a))`$ となる.
    よって示す等式が成り立つ.

Proposition. **接着空間の普遍性**
:   位相空間 $`Z`$ と連続写像 $`g:X\to Z`$, $`h:Y\to Z`$ が
    ```math
    g\circ f=h\circ i
    ```
    を満たすとする.
    このとき
    ```math
    u:X\cup_fY\to Z,\qquad u\circ j_X=g,\quad u\circ j_Y=h
    ```
    を満たす連続写像 $`u`$ が一意に存在する.

<u>proof.</u>
:   余積の普遍性により, $`g,h`$ から連続写像 $`k:X\coprod Y\to Z`$ で
    ```math
    k\circ\iota_X=g,\qquad k\circ\iota_Y=h
    ```
    を満たすものが一意に存在する.
    仮定 $`g\circ f=h\circ i`$ により, $`k`$ は $`\sim_f`$ の各同値類上で一定である.
    等化空間の写像の普遍性から, $`k=u\circ q`$ を満たす写像 $`u:X\cup_fY\to Z`$ が一意に存在する.
    $`q`$ は商写像で $`k`$ は連続であるから, $`u`$ は連続である.
    $`j_X=q\circ\iota_X`$, $`j_Y=q\circ\iota_Y`$ と $`k\circ\iota_X=g`$, $`k\circ\iota_Y=h`$ から, $`u\circ j_X=g`$ と $`u\circ j_Y=h`$ が従う.

Proposition. **接着空間の開集合**
:   部分集合 $`W\subseteq X\cup_fY`$ に対して, 以下同値.
    1. $`W`$ は接着空間で開集合である.
    2. $`j_X^{-1}(W)`$ は $`X`$ で開集合であり, $`j_Y^{-1}(W)`$ は $`Y`$ で開集合である.

<u>proof.</u>
:   $`q`$ は商写像であるから, $`W`$ が開集合であることと $`q^{-1}(W)`$ が $`X\coprod Y`$ で開集合であることは同値である.
    余積空間の開集合の特徴づけにより, $`q^{-1}(W)`$ が開集合であることは $`\iota_X^{-1}(q^{-1}(W))`$ と $`\iota_Y^{-1}(q^{-1}(W))`$ がそれぞれ開集合であることと同値である.
    これら二つの集合は $`j_X^{-1}(W)`$ と $`j_Y^{-1}(W)`$ に等しいから, (1) と (2) は同値である.

Proposition. **空集合に沿う接着**
:   $`A=\emptyset`$ のとき, 接着空間 $`X\cup_fY`$ は余積空間 $`X\coprod Y`$ と同相である.

<u>proof.</u>
:   $`A=\emptyset`$ なら $`\sim_f`$ は恒等関係である.
    したがって商写像 $`q:X\coprod Y\to X\cup_fY`$ は台集合上の全単射である.
    $`q`$ は商写像であり, 恒等関係による商空間の開集合系は余積空間の開集合系と一致する.
    よって $`q`$ は同相写像である.

Proposition. **同相写像に沿う接着**
:   $`f:A\to X`$ が同相写像であるとき, 標準写像 $`j_Y:Y\to X\cup_fY`$ は同相写像である.

<u>proof.</u>
:   $`j_Y`$ は連続である.
    $`f`$ が全射であるから, $`j_Y`$ は全射である.
    $`j_Y(a)=j_Y(a')`$ なら, 接着関係の定義と $`f`$ の単射性から $`a=a'`$ となるので, $`j_Y`$ は単射である.
    $`W\subseteq Y`$ を開集合とする.
    $`j_Y(W)`$ の $`j_Y`$ による逆像は $`W`$ で開集合であり, $`j_X`$ による逆像は $`f(W\cap A)`$ である.
    $`A`$ は $`Y`$ の部分空間で, $`f`$ は同相写像であるから, $`f(W\cap A)`$ は $`X`$ で開集合である.
    接着空間の開集合の特徴づけにより $`j_Y(W)`$ は開集合である.
    よって $`j_Y`$ は開写像であり, 全単射連続写像の逆写像も連続である.
    したがって $`j_Y`$ は同相写像である.

Definition. **写像錐**
:   位相空間 $`A`$ に対して, $`A\times\{0\}`$ から一点空間 $`\{\ast\}`$ への定数写像 $`c`$ による接着空間
    ```math
    CA\coloneqq\{\ast\}\cup_c(A\times[0,1])
    ```
    を $`A`$ の **写像錐** (*mapping cone*) と呼ぶ.

Proposition. **写像錐の商空間表示**
:   写像錐 $`CA`$ は
    ```math
    (A\times[0,1])/(A\times\{0\})
    ```
    と同相である.

<u>proof.</u>
:   $`\{\ast\}\cup_c(A\times[0,1])`$ の定義では, $`A\times\{0\}`$ のすべての点が一点 $`\ast`$ と同一視され, その他の点は同一視されない.
    したがって, この接着空間を作る同値関係は, $`A\times\{0\}`$ を一つの同値類とし, それ以外の点を一元類とする同値関係である.
    これは $`A\times\{0\}`$ を一点に縮める等化空間の同値関係と一致する.
    二つの空間は同じ商写像から得られるため, 標準的な恒等写像により同相である.

### 誘導と余誘導

Definition. **誘導位相**
:   集合 $`X`$ と位相空間の列 $`(Y_\lambda\mid\lambda\in\Lambda)`$ と写像列 $`f=(f_\lambda:X\to Y_\lambda\mid\lambda\in\Lambda)`$ に対して, 各 $`f_\lambda`$ が連続となるような $`X`$ の位相のうち最も弱いものを, $`f`$ による **誘導位相** (*induced topology*) あるいは **始位相** (*initial topology*), **射影位相** (*projective topology*) という.

Proposition. **誘導位相の構成**
:   集合 $`X`$ と位相空間の列 $`(Y_\lambda\mid\lambda\in\Lambda)`$ と写像列 $`f=(f_\lambda:X\to Y_\lambda\mid\lambda\in\Lambda)`$ に対して, $`X`$ の部分集合族
    ```math
    \bigcup_{\lambda\in\Lambda}\{f_\lambda^{-1}(G_\lambda)\mid G_\lambda\in\mathbf{O}_{Y_\lambda}\}
    ```
    から生成される開集合系は $`f`$ による誘導位相による開集合系と一致する.

<u>proof.</u>
:   この部分集合族の各元は, 対応する $`f_\lambda`$ による開集合の逆像である.
    したがって, これらを開集合とする位相ではすべての $`f_\lambda`$ が連続である.
    一方すべての $`f_\lambda`$ が連続となる任意の位相では, この部分集合族の各元は開である.
    その位相は有限交叉と任意合併で閉じているから, この部分集合族が生成するすべての開集合を含む.
    従ってこの生成位相が最も弱い.

Proposition.
:   集合 $`X`$ と位相空間の列 $`(Y_\lambda\mid\lambda\in\Lambda)`$ と位相空間 $`A`$ と写像 $`f:A\to X`$ と写像列 $`g=(g_\lambda:X\to Y_\lambda\mid\lambda\in\Lambda)`$ に対して, 以下同値:
    - $`g`$ による誘導位相により $`f`$ は $`A`$ 上の連続写像となる.
    - 各 $`\lambda\in\Lambda`$ に対して合成写像 $`g_\lambda\circ f`$ は $`A`$ から $`Y_\lambda`$ への連続写像となる.

<u>proof.</u>
:   $`f`$ が連続なら, 各 $`g_\lambda`$ は誘導位相の定義から連続なので, 合成の連続性により各 $`g_\lambda\circ f`$ は連続である.
    逆に各合成が連続とする.
    誘導位相の部分基の元 $`g_\lambda^{-1}(G)`$ の $`f`$ による逆像は $`(g_\lambda\circ f)^{-1}(G)`$ であり開である.
    部分基から生成される開集合の逆像も開なので, $`f`$ は連続である.

Definition. **余誘導位相**
:   位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ と集合 $`Y`$ と写像列 $`f=(f_\lambda:X_\lambda\to Y\mid\lambda\in\Lambda)`$ に対して, 各 $`f_\lambda`$ が連続となるような $`Y`$ の位相のうち最も強いものを, $`f`$ による **余誘導位相** (*coinduced topology*) あるいは **終位相** (*final topology*), **帰納位相** (*inductive topology*) という.

Proposition. **余誘導位相の構成**
:   位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ と集合 $`Y`$ と写像列 $`f=(f_\lambda:X_\lambda\to Y\mid\lambda\in\Lambda)`$ に対して,
    ```math
    \bigcap_{\lambda\in\Lambda}\{G\subseteq Y\mid f_\lambda^{-1}(G)\in\mathbf{O}_{X_\lambda}\}
    ```
    は, $`f`$ による余誘導位相と一致する.

<u>proof.</u>
:   右辺の集合族を $`\mathbf{O}`$ とおく.
    空集合と全体集合の逆像は開であり, 逆像は有限交叉および任意合併と可換するから, $`\mathbf{O}`$ は開集合系である.
    定義から各 $`f_\lambda`$ はこの位相に関して連続である.
    さらに, すべての $`f_\lambda`$ が連続となる任意の位相の開集合は各 $`f_\lambda`$ で引き戻すと開であるから $`\mathbf{O}`$ に属する.
    従って $`\mathbf{O}`$ はそのような位相のうち最も強い.

Proposition.
:   位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ と集合 $`Y`$ と位相空間 $`A`$ と写像列 $`f=(f_\lambda:X_\lambda\to Y\mid\lambda\in\Lambda)`$ と写像 $`g:Y\to A`$ に対して, 以下同値:
    - $`f`$ による余誘導位相により $`g`$ は $`A`$ への連続写像となる.
    - 各 $`\lambda\in\Lambda`$ に対して合成写像 $`g\circ f_\lambda`$ は $`X_\lambda`$ から $`A`$ への連続写像となる.

<u>proof.</u>
:   $`g`$ が連続なら各 $`f_\lambda`$ は余誘導位相の定義から連続なので, 合成は連続である.
    逆に各 $`g\circ f_\lambda`$ が連続とする.
    $`A`$ の開集合 $`G`$ に対し, $`(g\circ f_\lambda)^{-1}(G)=f_\lambda^{-1}(g^{-1}(G))`$ は各 $`\lambda`$ について開である.
    余誘導位相の構成から $`g^{-1}(G)`$ は開である.
    よって $`g`$ は連続である.

### 位相的性質

Definition. **位相的性質**
:   位相空間における性質 $`P`$ が **位相的性質** (*topological property*) あるいは **位相不変量** (*topological invariant*) であるとは, 任意の同相な位相空間 $`X,Y`$ に対して $`X`$ が $`P`$ を満たすことと $`Y`$ が $`P`$ を満たすことが同値となるときいう.

Definition. **局所的性質**
:   位相的性質 $`P`$ が **局所的** (*locally*) であるとは, 任意の位相空間 $`X`$ に対して次が同値なときいう:
    - $`X`$ は $`P`$ を満たす.
    - 任意の点 $`x\in X`$ の開近傍 $`x\in G`$ が存在し, 部分空間として $`P`$ を満たす.

    また, 位相空間 $`X`$ の任意の開部分空間が $`P`$ を満たすとき $`X`$ は **局所的に $`P`$** (*locally $`P`$*) であるという.

Definition. **遺伝的性質**
:   位相的性質 $`P`$ が **遺伝的** (*hereditary*) であるとは, 任意の位相空間 $`X`$ に対して次が同値なときいう:
    - $`X`$ は $`P`$ を満たす.
    - 位相空間 $`X`$ の任意の部分空間 $`S`$ は $`P`$ を満たす.

    また, 位相空間 $`X`$ の任意の部分空間が $`P`$ を満たすとき $`X`$ は **遺伝的に $`P`$** (*hereditary $`P`$*) であるという.

位相的性質 $`P`$ が **弱遺伝的** (*weakly hereditary*) であるとは, $`P`$ を満たすような任意の位相空間 $`X`$ に対して, その任意の閉部分空間 $`F`$ も $`P`$ を満たすときいう.

Definition. **乗法的性質**
:   $`\kappa`$ を基数とする.
    位相的性質 $`P`$ が **$`\kappa`$-乗法的** (*$`\kappa`$-multiplicative*) であるとは, $`P`$ を満たすような任意の位相空間の族 $`(X_j\mid j\in\kappa)`$ に対して, その積空間 $`\prod_{j\in\kappa}X_j`$ も $`P`$ を満たすときいう.
    特に $`P`$ が如何なる基数 $`\kappa`$ に対しても $`\kappa`$-乗法的であるとき単に乗法的であるという. また, $`\aleph_0`$-乗法的な位相的性質を **可算乗法的** (*countable multiplicative*) であるといい, 有限基数 $`\kappa`$ について $`\kappa`$-乗法的な位相的性質を **有限乗法的** (*finite multiplicative*) であるという.

Definition. **除法的性質**
:   位相的性質 $`P`$ が **除法的** (*divisible*) であるとは, $`P`$ を満たす任意の位相空間 $`X`$ と任意の全射写像 $`f:X\to Y`$ に対して, $`f`$ による商空間 $`Y`$ も $`P`$ を満たすときいう.