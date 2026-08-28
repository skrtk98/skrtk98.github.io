## 距離化定理

距離化定理は, 与えられた位相がある距離から得られるための条件を与える.
被覆の細分, 分離性, 可算性を用いて位相から擬距離を構成し, それが距離になる条件を調べる.

### 被覆の正規性

Proposition.
:   距離空間 $`(X,d_X)`$ と $`\varepsilon>0`$ に対して, 被覆 $`\mathbf{U}_\varepsilon=\{B_\varepsilon(x)\mid x\in X\}`$ とすると, 次がそれぞれ成り立つ.
    1. $`x\in X`$, $`\delta>0`$, 正整数 $`m`$ に対して, $`\mathbf{U}_\varepsilon^m(B_\delta(x))\subseteq B_{\delta+2m\varepsilon}(x)`$.
    2. $`\mathbf{U}_\varepsilon^\varDelta\leq\mathbf{U}_{2\varepsilon},\quad\mathbf{U}_\varepsilon^\ast\leq\mathbf{U}_{3\varepsilon}`$

<u>proof.</u>
:   (1) は隣接する二つの半径 $`\varepsilon`$ の球が交わるとき, その中心間の距離が $`2\varepsilon`$ 未満であることを三角不等式から用い, 鎖の長さについて帰納法を行えば従う.
    (2) について, $`B_\varepsilon(y)`$ が $`B_\varepsilon(x)`$ と交われば
    $`d(x,y)<2\varepsilon`$ であり, $`B_\varepsilon(y)\subseteq B_{3\varepsilon}(x)`$ である.
    これにより星細分の包含が従い, 重心細分の包含はその部分の場合である.

Definition. **被覆の正規性** (Cf. J. W. Tukey)
:   集合 $`X`$ の被覆列 $`(\mathbf{U}_n\mid n\in\mathbb N)`$ が **正規被覆列** (*normal sequence of covers*) であるとは, 各 $`n`$ に対して
    ```math
    \mathbf{U}_{n+1}\leq^\ast\mathbf{U}_n
    ```
    が成り立つときいう. また, 位相空間 $`X`$ の開被覆 $`\mathbf{U}`$ が **正規** (*normal*) であるとは, $`\mathbf{U}_1\leq\mathbf{U}`$ を満たす正規開被覆列 $`(\mathbf{U}_n\mid n\in\mathbb N)`$ が存在する時いい, 正規な開被覆を **正規被覆** (*normal covering*) という.

$`\mathbf{U}^\varDelta\leq\mathbf{U}^\ast`$ より
```math
\mathbf{U}\leq^\ast\mathbf{V}\Rightarrow\mathbf{U}\leq^\varDelta\mathbf{V}
```
なため正規被覆列 $`(\mathbf{U}_n\mid n\in\mathbb N)`$ は各 $`n`$ に対して
```math
\mathbf{U}_{n+1}\leq^\varDelta\mathbf{U}_n
```
を満たす.
また次の命題により, 上記のような条件を満たす被覆列から正規被覆列を取り出すこともできる.

Proposition.
:   集合 $`X`$ の被覆列 $`(\mathbf{U}_n\mid n\in\mathbb N)`$ が各 $`n`$ に対して
    ```math
    \mathbf{U}_{n+1}\leq^\varDelta\mathbf{U}_n
    ```
    を満たすとき, 被覆列 $`(\mathbf{U}_{2n}\mid n\in\mathbb N)`$ は正規被覆列となる.

<u>proof.</u>
:   仮定を二回適用すると
    ```math
    \mathbf U_{2n+2}\leq^\varDelta\mathbf U_{2n+1}\leq^\varDelta\mathbf U_{2n}
    ```
    を得る.
    二段の重心細分は星細分を与えるので $`\mathbf U_{2n+2}\leq^\ast\mathbf U_{2n}`$ である.
    これは偶数番目の部分列が正規被覆列であることを意味する.

Theorem.
:   位相空間 $`X,Y`$ の間の連続写像 $`f`$ と $`Y`$ の開被覆 $`\mathbf{U},\mathbf{V}`$ に対して, 次がそれぞれ成り立つ.
    1. $`\mathbf{U}\leq^\ast\mathbf{V}`$ ならば $`f^{-1}(\mathbf{U})\leq^\ast f^{-1}(\mathbf{V})`$.
    2. $`\mathbf{U}`$ が正規被覆ならば $`f^{-1}(\mathbf{U})`$ も正規被覆である.

<u>proof.</u>
:   逆像は合併・交叉・包含を保つ.
    したがって $`\mathbf U`$ の各元の星を含む $`\mathbf V`$ の元を引き戻せば, その逆像は $`f^{-1}(\mathbf U)`$ の対応する星を含む.
    これで (1) が従う.
    $`(\mathbf U_n)`$ が $`\mathbf U`$ に従属する正規開被覆列なら, (1) より $`(f^{-1}(\mathbf U_n))`$ は $`f^{-1}(\mathbf U)`$ に従属する正規開被覆列である.
    よって (2) が従う.

集合 $`X`$ に対して写像 $`d:X\times X\to\mathbb{R}`$ が $`x,y,z\in X`$ に対して条件
1. $`d(x,y)\geq0`$.
2. $`d(x,x)=0`$.
3. $`d(x,y)=d(y,x)`$.
4. $`d(x,y)+d(y,z)\geq d(x,z)`$.
を満たすとき, $`d`$ を **$`X`$ 上の擬距離** (*pseudometric on $`X`$*) といい組 $`(X,d)`$ を **擬距離空間** (*pseudometric space*) という.
定義より明らかに, 距離は擬距離となる. 距離空間と同様, 擬距離空間に対して開球により位相を導入することで, 適宜位相空間として扱う.

Theorem. **距離等化**
:   $`X`$ 上の擬距離 $`d`$ に対して二項関係 $`\sim`$ を
    ```math
    x\sim y\mathrel{\overset{\text{def}}{\iff}}d(x,y)=0
    ```
    とすると, これは同値関係となる. このとき $`X^\ast\coloneqq X/\sim`$ とし写像 $`d^\ast:X^\ast\times X^\ast\to\mathbb{R}`$ を
    ```math
    d^\ast([x],[y])\coloneqq d(x,y)
    ```
    とすると, $`d^\ast`$ は $`X^\ast`$ 上の距離となる.
    このとき, 自然な射影 $`\pi:X\to X^\ast`$ により $`\pi^{-1}(\pi(A))=A`$ を満たす部分集合 $`A\in2^X`$ に対して, $`A`$ が $`(X,d)`$ の開集合であることと $`\pi(A)`$ が $`(X^\ast,d^\ast)`$ の開集合であることが同値となる.

<u>proof.</u>
:   反射性と対称性は擬距離の対応する公理から直ちに従う.
    $`d(x,y)=0`$ と $`d(y,z)=0`$ なら, 三角不等式により $`d(x,z)=0`$ であるから, $`\sim`$ は推移的である.
    また $`x\sim x'`$, $`y\sim y'`$ に対して三角不等式を二度用いると
    ```math
    |d(x,y)-d(x',y')|\leq d(x,x')+d(y,y')=0
    ```
    を得る.
    よって $`d^\ast`$ は代表元に依存しない.
    非負性・対称性・三角不等式は代表元での対応する性質から従う.
    $`d^\ast([x],[y])=0`$ なら $`x\sim y`$ であり $`[x]=[y]`$ なので, $`d^\ast`$ は距離である.

    次に $`A`$ が飽和していると仮定する.
    $`x\in A`$ と $`B_r(x)\subseteq A`$ なら
    ```math
    \pi(B_r(x))=B_r(\pi(x))
    ```
    である.
    実際, 両辺の所属条件はいずれも $`d(x,y)<r`$ に等しい.
    したがって $`A`$ が開なら $`\pi(A)`$ は開である.
    逆に $`\pi(A)`$ が開なら, 射影の逆像として $`A=\pi^{-1}(\pi(A))`$ は開である.
    
距離空間 $`(X^\ast,d^\ast)`$ を擬距離空間 $`(X,d)`$ の **距離等化** (*metric identification*) という.

Theorem.
:   集合 $`X`$ の正規被覆列 $`(\mathbf{U}_n\mid n\in\mathbb N)`$ に対して, $`X`$ 上の擬距離 $`d`$ として次を満たすものが存在する:
    - $`y\in\mathbf{U}_n(x)\Rightarrow d(x,y)<2^{-n+2}`$.
    - $`d(x,y)<2^{-n}\Rightarrow y\in\mathbf{U}_n(x)`$.

したがって, 正規被覆列は距離による近さを復元する.
ただし擬距離では異なる点の距離が $`0`$ となりうるため, 位相を距離化するには点を区別する条件も必要である.

<u>proof.</u>
:   各 $`\mathbf U_n`$ を星細分列になるように取り直す.
    $`x=x_0,\ldots,x_k=y`$ であり, 各隣接対 $`(x_{i-1},x_i)`$ が $`\mathbf U_{n_i}`$ のある元に同時に属するとき, この鎖の長さを $`\sum_i2^{-n_i}`$ と定める.
    そのような鎖の長さの下限を $`d(x,y)`$ とおく.
    鎖の連結により三角不等式が従い, 長さ $`0`$ の自明鎖から $`d(x,x)=0`$ である.
    星細分の条件を二進の鎖に繰り返し適用する Frink の補題により, $`\mathbf U_n(x)`$ 内の二点は上から示した長さで結べ, 逆に長さが $`2^{-n}`$ 未満の鎖は $`\mathbf U_n(x)`$ 内に留まる.
    これが二つの不等式を与える.

Theorem. **Urysohn の距離化定理**
:   Kolmogorov かつ正則で第二可算な位相空間 $`X`$ は距離化可能である.

    特に, 正則第二可算空間は可算な開基から可算な正規被覆列を構成できる.
    上の定理で得られる擬距離は Kolmogorov 性により距離となり, 元の位相を誘導する.

<u>proof.</u>
:   $`X`$ の可算な開基を $`(B_n)_{n\geq0}`$ とする.
    正則性と第二可算性から $`X`$ は正規である.
    正則性を各基の要素に適用して, 閉包が別の基の要素に含まれる可算個の組
    ```math
    \overline{B_i}\subseteq B_j
    ```
    を選ぶことができる.
    これらの組は点と閉集合を分離するのに十分である.

    各組に対して Urysohn の補題を適用し, 連続写像 $`u_n:X\to[0,1]`$ を選ぶ.
    これらをまとめた写像
    ```math
    e:X\longrightarrow[0,1]^{\mathbb{N}},\qquad e(x)=(u_n(x))_{n\geq0}
    ```
    は点を分離し, 開基も逆像で復元するので埋め込みである.

    可算積 $`[0,1]^{\mathbb{N}}`$ には
    ```math
    d(a,b)\coloneqq\sum_{n=0}^{\infty}2^{-n-1}|a_n-b_n|
    ```
    で定まる距離があり, その位相は積位相と一致する.
    $`X`$ 上に $`d_X(x,y)=d(e(x),e(y))`$ とおく.
    $`e`$ が単射であるから $`d_X`$ は距離である.
    $`e`$ が埋め込みであることから, $`d_X`$ の誘導する位相は元の位相と一致する.

### ヒルベルト立方体

Definition. **ヒルベルト立方体**
:   単位閉区間 $`[0,1]`$ の可算積
    ```math
    Q=[0,1]^{\mathbb N}
    ```
    に積位相を入れた空間を **ヒルベルト立方体** (*Hilbert cube*) と呼ぶ.
    $`Q`$ は一般の積空間 $`[0,1]^I`$ のうち, 添字集合が可算な場合にあたる.

Proposition. **ヒルベルト立方体の基本性質**
:   ヒルベルト立方体 $`Q`$ はコンパクト Hausdorff 空間, 可分距離空間, 完備距離空間である.
    また, $`Q`$ は可縮であり, 距離
    ```math
    d(x,y)=\sum_{n=0}^{\infty}2^{-n-1}|x_n-y_n|
    ```
    は積位相を誘導する.

<u>proof.</u>
:   各因子 $`[0,1]`$ はコンパクト Hausdorff であるから, Tychonoff の定理により $`Q`$ はコンパクト Hausdorff である.
    有限個の座標だけを指定する区間の族は可算基をなす.
    よって $`Q`$ は第二可算かつ正則であり, Urysohn の距離化定理により距離化可能である.
    上の級数は一様収束し, 積位相を誘導する距離を与える.
    コンパクト距離空間は完備である.
    さらに, $`H:Q\times[0,1]\to Q`$ を
    ```math
    H(x,t)=(1-t)x+t(0,0,\ldots)
    ```
    と定めれば, $`H(x,0)=x`$, $`H(x,1)=(0,0,\ldots)`$ であるから, $`Q`$ は可縮である.

Theorem. **ヒルベルト立方体への埋込み**
:   可分距離空間はヒルベルト立方体 $`Q`$ に位相的に埋め込める.

<u>proof.</u>
:   可分距離空間は第二可算であり, Hausdorff かつ正則である.
    したがって Urysohn の距離化定理の証明で構成した写像
    ```math
    e:X\longrightarrow[0,1]^{\mathbb N}=Q
    ```
    は埋め込みである.

Theorem. **Nagata-Smirnov の距離化定理**
:   Hausdorff 正則空間 $`X`$ が距離化可能であるための必要十分条件は, $`X`$ が $`\sigma`$ 局所有限な開基を持つことである.

<u>proof.</u>
:   距離空間では, 半径 $`2^{-n}`$ の球から局所有限な開細分を各 $`n`$ について取れる.
    それらを合わせれば $`\sigma`$ 局所有限な開基となる.
    逆に開基を $`\mathcal B=\bigcup_n\mathcal B_n`$ とし, 各 $`\mathcal B_n`$ を局所有限とする.
    正則性により各基の要素の閉包をより大きい基の要素に入れるよう細分し, この細分を段階ごとに正規被覆列へ組み直す.
    局所有限性は各点の近傍に現れる条件を有限個に保つため, 得られた正規被覆列は元の開基と同じ位相を定める.
    前の正規被覆列の距離化定理から擬距離を得る.
    Hausdorff 性と基の分離性により異なる二点はある段階で別の被覆要素に分かれるので, この擬距離は零点を持たない.
    従って距離となり, 元の位相を誘導する.

Corollary. **可算基による距離化**
:   Hausdorff 正則空間 $`X`$ が可算な開基を持つならば, $`X`$ は距離化可能である.

    実際, 可算な開基は $`\sigma`$ 局所有限な開基である.
    この系は Urysohn の距離化定理の直接の系である.

<u>proof.</u>
:   Hausdorff 空間は Kolmogorov 空間である.
    仮定より $`X`$ は正則かつ第二可算であるから, Urysohn の距離化定理を適用できる.
    よって $`X`$ は距離化可能である.

Theorem. **一様構造による距離化**
:   Hausdorff 一様空間 $`X`$ が可算な近縁基を持つならば, $`X`$ の一様構造はある距離から定まる.

    このとき, その距離が誘導する位相は元の一様位相と一致する.

<u>proof.</u>
:   可算近縁基から, 対称な近縁の減少列 $`(V_n)_{n\geq0}`$ で
    ```math
    V_{n+1}\circ V_{n+1}\circ V_{n+1}\subseteq V_n
    ```
    を満たし, なお近縁基となるものを選ぶ.
    $`x=x_0,\ldots,x_k=y`$ で各 $`(x_{i-1},x_i)\in V_{n_i}`$ となる鎖について重み $`\sum_i2^{-n_i}`$ を与え, その下限を $`d(x,y)`$ とおく.
    鎖の反転と連結から $`d`$ は対称で三角不等式を満たす.
    Frink の補題により
    ```math
    V_n\subseteq\{(x,y)\mid d(x,y)<2^{-n+2}\},\qquad
    \{(x,y)\mid d(x,y)<2^{-n}\}\subseteq V_n
    ```
    が成り立つ.
    よって距離近縁系と元の近縁系は同じ基を持つ.
    Hausdorff 性から $`\bigcap_nV_n=\Delta(X)`$ であり, $`d(x,y)=0`$ は $`x=y`$ を含意するので $`d`$ は距離である.
    同じ近縁系は同じ一様位相を誘導する.