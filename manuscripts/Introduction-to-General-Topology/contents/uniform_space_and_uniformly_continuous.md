## 一様空間と一様連続写像

位相は各点の近傍を扱うが, 異なる点で同じ尺度を用いる近さまでは記録しない.
一様構造は二点の組の近さを近縁系で指定し, 一様連続性, Cauchy 性, 関数列の一様収束を距離なしで定める.

### 一様構造

Definition. **近縁系**
:   **集合 $`X`$ 上の近縁系** (*entourage system on a set $`X`$*) とは, $`X`$ 上の二項関係の族 $`\mathbf{E}`$ であって次の条件を満たすときいう:
    - $`\mathbf{E}`$ は $`X\times X`$ 上のフィルターである.
    - 任意の $`U\in\mathbf{E}`$ に対して $`\Delta(X)\subseteq U`$.
    - 任意の $`U\in\mathbf{E}`$ に対して $`U^{-1}\in\mathbf{E}`$.
    - 任意の $`U\in\mathbf{E}`$ に対して $`V\circ V\subseteq U`$ を満たす $`V\in\mathbf{E}`$ が存在する.

集合 $`X`$ とその上の近縁系 $`\mathbf{E}`$ の組
```math
(X,\mathbf{E})
```
を **一様空間** (*uniform space*) といい, $`X`$ をその **台集合** (*underlying set*) という.
一様空間 $`X`$ における台集合を $`X_0`$ と表し, 近縁系を $`\mathbf{E}_X`$ と表す.

Definition. **近縁基**
:   **集合 $`X`$ 上の近縁基** (*entourage basis on a set $`X`$*) とは, $`X`$ 上の二項関係の族 $`\mathbf{E}`$ であって次の条件を満たすときいう:
    - $`\mathbf{E}`$ は $`X\times X`$ 上のフィルター基である.
    - 任意の $`U\in\mathbf{E}`$ に対して $`\Delta(X)\subseteq U`$.
    - 任意の $`U\in\mathbf{E}`$ に対して $`V\subseteq U^{-1}`$ を満たす $`V\in\mathbf{E}`$ が存在する.
    - 任意の $`U\in\mathbf{E}`$ に対して $`V\circ V\subseteq U`$ を満たす $`V\in\mathbf{E}`$ が存在する.

Proposition. **近縁基の定める近縁系**
:   集合 $`X`$ 上の近縁基を $`X\times X`$ 上のフィルター基として生成されるフィルター は $`X`$ の近縁系となる. これを **近縁基の定める近縁系** という.

<u>proof.</u>
:   生成フィルターの各元は近縁基の元を含むので, 対角集合を含む.
    $`U`$ が生成フィルターに属すれば, ある基の元 $`B\subseteq U`$ がある.
    基の逆関係に関する条件から $`C\subseteq B^{-1}\subseteq U^{-1}`$ となる基の元 $`C`$ があり, $`U^{-1}`$ は生成フィルターに属する.
    同様に $`D\circ D\subseteq B\subseteq U`$ となる基の元 $`D`$ がある.
    よって近縁系のすべての公理が成り立つ.

Definition. **近縁準基**
:   **集合 $`X`$ 上の近縁準基** (*entourage subbasis on a set $`X`$*) とは, $`X`$ 上の二項関係の族 $`\mathbf{E}`$ であって次の条件を満たすときいう:
    - $`\mathbf{E}`$ は $`X\times X`$ の有限交叉性をもつ部分集合族である.
    - 任意の $`U\in\mathbf{E}`$ に対して $`\Delta(X)\subseteq U`$.
    - 任意の $`U\in\mathbf{E}`$ に対して $`V\subseteq U^{-1}`$ を満たす $`V\in\mathbf{E}`$ が存在する.
    - 任意の $`U\in\mathbf{E}`$ に対して $`V\circ V\subseteq U`$ を満たす $`V\in\mathbf{E}`$ が存在する.

Proposition. **近縁準基の定める近縁基**
:   集合 $`X`$ 上の近縁準基を $`X\times X`$ の有限交叉性をもつ部分集合族として生成されるフィルター は $`X`$ の近縁基となる. これを **近縁準基の定める近縁基** という.

<u>proof.</u>
:   有限交叉性により有限交叉全体はフィルター基をなす.
    各有限交叉に含まれる近縁準基の元について, 逆関係の条件と合成の平方根条件を有限回適用し, それらの共通部分を取る.
    得られる有限交叉は, 元の有限交叉の逆関係に含まれ, その自己合成も元の有限交叉に含まれる.
    対角集合を含むことも同様に従うので, 前命題の意味で近縁基となる.

Proposition.
:   距離空間 $`X`$ において, $`X`$ 上の二項関係の族 $`\mathbf{E}`$ を
    ```math
    \mathbf{E}\coloneqq\{d_X^{-1}([0,r))\mid r>0\}
    ```
    とすると, $`\mathbf{E}`$ は $`X`$ 上の近縁基となる. このとき, $`\mathbf{E}`$ により距離空間 $`X`$ を適宜一様空間とみなす.

<u>proof.</u>
:   対角上では距離が $`0`$ であるから, 各元は対角集合を含む.
    逆関係に移しても距離の対称性により同じ集合である.
    $`0<s<r/2`$ とすれば, 三角不等式から
    ```math
    d^{-1}([0,s))\circ d^{-1}([0,s))\subseteq d^{-1}([0,r))
    ```
    となる.
    また二つの半径に対して小さい方を取れば有限交叉条件も満たされる.

Theorem. **近縁系の定める位相**
:   一様空間 $`X`$ に対して, 写像 $`\mathcal{U}:X\to2^{2^X}`$ を
    ```math
    \mathcal{U}(x)\coloneqq\{U(x)\mid U\in\mathbf{E}_X\},\quad x\in X
    ```
    とすると, $`\mathcal{U}`$ は $`X`$ 上の近傍基となる. このとき, $`\mathcal{U}`$ により定める位相を $`(X,\Phi)`$ における **一様位相** (*uniform topology*) という.

<u>proof.</u>
:   任意の近縁 $`U`$ は対角集合を含むので $`x\in U(x)`$ である.
    近縁系のフィルター性から, 二つの球近傍の交叉にはその二つの近縁の交叉による球近傍が含まれる.
    $`V\circ V\subseteq U`$ を満たす近縁 $`V`$ を取ると, $`y\in V(x)`$ に対して $`V[y]\subseteq U(x)`$ である.
    よって球近傍は近傍基の局所性の条件も満たす.

### 写像の一様連続性

Definition. **写像の一様連続性**
:   一様空間 $`X,Y`$ と 写像 $`f:X\to Y`$ に対して, $`f`$ が**一様連続** (*uniformly continuous*) であるとは, $`Y`$ の任意の近縁 $`U`$ に対して, 次を満たす $`X`$ の近縁 $`V`$ が存在するときいう.
    ```math
    \forall a,b\in X,(a,b)\in V\Rightarrow(f(a),f(b))\in U
    ```
    一様連続な写像を, **一様連続写像** (*uniformly continuous function*) という.

特に, $`f`$ が全単射であり $`f,f^{-1}`$ がともに一様連続であるとき, $`f`$ を **一様同型写像** (*uniform isomorphism*) といい, 一様同型が存在するような一様空間を **一様同型** (*uniform isomorphic*) という.

Proposition. **一様連続性の特徴づけ**
:   一様空間 $`X,Y`$ と 写像 $`f:X\to Y`$ に対して, 以下同値である.
    1. $`f`$ は一様連続である.
    2. $`Y`$ の任意の近縁 $`U`$ に対して, $`(f\times f)^{-1}(U)=\{(a,b)\mid(f(a),f(b))\in U\}`$ は $`X`$ の近縁となる.

<u>proof.</u>
:   $`f`$ が一様連続であり $`U`$ を $`Y`$ の近縁とする.
    定義から, ある $`X`$ の近縁 $`V`$ が存在して $`(f\times f)(V)\subseteq U`$ となる.
    従って $`V\subseteq(f\times f)^{-1}(U)`$ である.
    近縁系の上方閉性から $`(f\times f)^{-1}(U)`$ は近縁である.
    逆に条件 2 を仮定すれば, 各 $`U`$ に対し $`V=(f\times f)^{-1}(U)`$ を選べば一様連続性の定義を満たす.

Proposition. **一様連続写像の連続性**
:   一様連続写像は連続である.

<u>proof.</u>
:   一様連続写像 $`f:X\to Y`$ と $`x\in X`$ をとる.
    $`f(x)`$ の近傍 $`O`$ に対し, 一様位相の近傍基の性質から $`U[f(x)]\subseteq O`$ となる $`Y`$ の近縁 $`U`$ をとれる.
    一様連続性により, $`(f\times f)(V)\subseteq U`$ となる $`X`$ の近縁 $`V`$ がある.
    $`V(x)`$ は $`x`$ の近傍であり, $`y\in V(x)`$ なら $`f(y)\in U[f(x)]\subseteq O`$ である.
    よって $`f`$ は $`x`$ で連続である.

Theorem.
:   コンパクトな一様空間から一様空間への連続写像は一様連続となる.

<u>proof.</u>
:   連続写像 $`f:X\to Y`$ をとる.
    $`X`$ がコンパクトなら, 対角集合 $`\Delta_X\subseteq X\times X`$ はコンパクトである.
    写像 $`f\times f:X\times X\to Y\times Y`$ は連続であり, $`\Delta_X`$ を $`\Delta_Y`$ へ写す.
    したがって $`Y`$ の任意の近縁 $`U`$ は $`\Delta_Y`$ の近傍であり, その逆像 $`(f\times f)^{-1}(U)`$ は $`\Delta_X`$ の近傍である.
    コンパクト一様空間では対角集合の近傍は近縁を含むので, $`(f\times f)^{-1}(U)`$ は $`X`$ の近縁である.
    一様連続性の特徴づけより $`f`$ は一様連続である.

### Cauchy フィルターと完備性

距離空間では Cauchy 列によって, 極限が空間内に存在するかを問うた.
一様空間では点列だけでは一般の収束を捉えきれないため, 近縁によって十分小さくなるフィルターを用いる.

Definition. **分離一様空間**
:   一様空間 $`X`$ が **分離的** (*separated*) であるとは,
    ```math
    \bigcap_{U\in\mathbf{E}_X}U=\Delta(X)
    ```
    が成り立つときいう.

Proposition. **分離性の特徴づけ**
:   一様空間 $`X`$ に対して, 以下は同値である.
    1. $`X`$ は分離的である.
    2. $`X`$ の一様位相は Hausdorff である.
    3. 一様収束するフィルターの極限は高々一つである.

<u>proof.</u>
:   (1) を仮定し $`x\neq y`$ とする.
    ある近縁 $`U`$ は $`(x,y)`$ を含まない.
    $`V\circ V\subseteq U`$ となる対称近縁 $`V`$ に対して $`V(x)`$ と $`V[y]`$ は交わらないので, 一様位相は Hausdorff である.
    Hausdorff 空間では収束フィルターの極限は高々一つだから (2)$`\Rightarrow`$(3) が従う.
    逆に $`x\neq y`$ がすべての近縁に属するなら, 球近傍の記述から $`x`$ と $`y`$ の近傍フィルターは一致する.
    この共通の近傍フィルターは $`x`$ と $`y`$ の双方へ収束する.
    (3) に反するので (3)$`\Rightarrow`$(1) である.

Definition. **Cauchy フィルター**
:   一様空間 $`X`$ 上のフィルター $`\mathcal{F}`$ が **Cauchy** (*Cauchy*) であるとは, 任意の近縁 $`U\in\mathbf{E}_X`$ に対して
    ```math
    A\times A\subseteq U
    ```
    を満たす $`A\in\mathcal{F}`$ が存在するときいう.

    すなわち, $`\mathcal{F}`$ に属するある集合を任意の一様な精度で選べるほど, フィルターが一つの点の周りへ集中していることを表す.

Proposition.
:   一様空間 $`X`$ 上の収束フィルターは Cauchy フィルターである.
    また, Cauchy フィルターの任意の細分も Cauchy フィルターである.

<u>proof.</u>
:   $`\mathcal F`$ が $`x`$ に収束するとする.
    任意の近縁 $`U`$ に対し, 一様構造の公理から $`V\circ V\subseteq U`$ となる対称な近縁 $`V`$ をとれる.
    収束性より $`V(x)=\{y\mid(x,y)\in V\}`$ は $`\mathcal F`$ に属する.
    $`a,b\in V(x)`$ なら対称性から $`(a,x),(x,b)\in V`$ であり, $`(a,b)\in V\circ V\subseteq U`$ である.
    よって $`V(x)\times V(x)\subseteq U`$ であり, $`\mathcal F`$ は Cauchy である.

    $`\mathcal G`$ が $`\mathcal F`$ の細分であるとする.
    $`\mathcal F`$ が Cauchy であれば, 各近縁 $`U`$ に対して $`A\times A\subseteq U`$ となる $`A\in\mathcal F`$ がある.
    細分の定義から $`A\in\mathcal G`$ でもあるので, 同じ $`A`$ が $`\mathcal G`$ の Cauchy 条件を満たす.

Proposition. **距離空間の場合**
:   距離空間 $`(X,d)`$ に距離の定める一様構造を入れる.
    このとき, フィルター $`\mathcal{F}`$ が一様空間として Cauchy であることと, 任意の $`\varepsilon>0`$ に対して直径が $`\varepsilon`$ 未満の集合が $`\mathcal{F}`$ に属することは同値である.

<u>proof.</u>
:   距離一様構造の近縁は $`\{(x,y)\mid d(x,y)<\varepsilon\}`$ を基として持つ.
    $`A\times A`$ がこの近縁に含まれることは, 任意の $`a,b\in A`$ に対して $`d(a,b)<\varepsilon`$、すなわち $`A`$ の直径が $`\varepsilon`$ 未満であることと同値である.
    よって二つの Cauchy 条件は一致する.

Definition. **完備一様空間**
:   一様空間 $`X`$ が **完備** (*complete*) であるとは, $`X`$ 上の任意の Cauchy フィルターが収束するときいう.
    完備な一様空間を **完備一様空間** (*complete uniform space*) という.

Theorem. **距離による完備性との整合性**
:   距離空間 $`(X,d)`$ に距離の定める一様構造を入れる.
    このとき, 一様空間としての完備性と距離空間としての完備性は同値である.

<u>proof.</u>
:   距離 Cauchy 列が生成する尾部フィルターは, 前命題により Cauchy フィルターである.
    一様完備性からこのフィルターが収束すれば, 元の列も同じ点へ収束する.
    逆に距離空間として完備とする.
    Cauchy フィルターから直径が $`2^{-n}`$ 未満となる集合を順に選び, その中から点 $`x_n`$ を取る.
    この列は距離 Cauchy 列であるからある $`x\in X`$ に収束する.
    フィルターの Cauchy 条件とこの収束を用いると, フィルターの各近傍は $`x`$ の任意の近傍を含む.
    よって元のフィルターも $`x`$ に収束し, 一様空間として完備である.

### 一様完備化

Definition. **一様埋め込み**
:   一様連続な単射 $`i:X\to Y`$ が **一様埋め込み** (*uniform embedding*) であるとは, $`i`$ が $`X`$ と部分一様空間 $`i(X)`$ の間の一様同型となるときいう.

Definition. **一様完備化**
:   分離一様空間 $`X`$ の **一様完備化** (*uniform completion*) とは, 完備分離一様空間 $`\widehat{X}`$ と一様埋め込み
    ```math
    \iota:X\longrightarrow\widehat{X}
    ```
    の組であって, $`\iota(X)`$ が $`\widehat{X}`$ で稠密となるものをいう.

Theorem. **一様完備化の存在と一意性**
:   任意の分離一様空間は一様完備化を持つ.
    二つの一様完備化 $`(\widehat{X},\iota)`$, $`(\widehat{X}',\iota')`$ の間には,
    ```math
    h\circ\iota=\iota'
    ```
    を満たす一意的な一様同型 $`h:\widehat{X}\to\widehat{X}'`$ が存在する.

<u>proof.</u>
:   $`X`$ 上の Cauchy フィルターのうち極小なもの全体を考え, 二つの極小 Cauchy フィルターが共通の Cauchy 細分を持つとき同一視する.
    この商集合を $`\widehat X`$ とする.
    近縁 $`U`$ ごとに, 代表する Cauchy フィルターが $`U`$ に関して近いという条件を商へ移すことで, $`\widehat X`$ に一様構造を入れる.
    各 $`x\in X`$ をその近傍フィルターの極小 Cauchy 細分へ送る写像 $`\iota:X\to\widehat X`$ は一様埋め込みであり, Cauchy フィルターの定義からその像は稠密である.
    $`\widehat X`$ 上の Cauchy フィルターは代表フィルターの合成によって極小 Cauchy フィルターへ収束するので, $`\widehat X`$ は完備である.
    分離性は同値関係で零距離のフィルターを同一視したことから従う.

    次に二つの完備化をとる.
    $`\iota':X\to\widehat X'`$ は一様連続であり $`\widehat X'`$ は完備分離一様空間なので, 稠密な一様埋め込み $`\iota`$ を通じて一意な一様連続写像 $`h:\widehat X\to\widehat X'`$ に延長される.
    同様に $`\iota`$ は $`h':\widehat X'\to\widehat X`$ に延長される.
    $`h'\circ h`$ と恒等写像は稠密部分集合 $`\iota(X)`$ 上で一致するから一意性により一致する.
    同様に $`h\circ h'`$ も恒等写像である.
    よって $`h`$ は一様同型であり, 延長の一意性からこの条件を満たす一様同型は一意である.

Theorem. **一様完備化の普遍性**
:   $`(\widehat{X},\iota)`$ を分離一様空間 $`X`$ の一様完備化とする.
    完備分離一様空間 $`Y`$ と一様連続写像 $`f:X\to Y`$ に対して, 一様連続写像 $`\widehat{f}:\widehat{X}\to Y`$ が一意に存在して
    ```math
    \widehat{f}\circ\iota=f
    ```
    を満たす.

<u>proof.</u>
:   $`z\in\widehat X`$ をとる.
    稠密性により $`z`$ に収束する $`X`$ のフィルターをとると, その $`\iota`$ による像は Cauchy フィルターである.
    一様連続性からその $`f`$ による像も $`Y`$ の Cauchy フィルターとなる.
    $`Y`$ の完備性によりこのフィルターは収束するので, その極限を $`\widehat f(z)`$ と定める.
    分離性により極限は一意であり, 一様連続性は近縁の引き戻しによって $`\widehat f`$ に移る.
    特に $`z=\iota(x)`$ では定義したフィルターは $`x`$ に収束するので $`\widehat f(\iota(x))=f(x)`$ である.
    二つの延長があれば, それらは稠密部分集合 $`\iota(X)`$ 上で一致する連続写像である.
    分離空間への連続写像は稠密部分集合上の値で決まるから, 二つの延長は一致する.

Remark. **Cauchy フィルターによる構成**
:   一様完備化は, $`X`$ 上の Cauchy フィルターを, 共通の Cauchy 細分を持つという関係で同一視して構成できる.
    埋め込み $`\iota`$ は点 $`x\in X`$ を $`x`$ の近傍フィルターへ送る.
    この構成では, $`\widehat{X}`$ の各点が $`X`$ の中で収束先を持たなかった Cauchy 的な振る舞いを表す.

Example.
:   有理数全体 $`\mathbb{Q}`$ は通常の距離から定まる一様構造では完備でない.
    その一様完備化は実数全体 $`\mathbb{R}`$ であり, 標準的な包含 $`\mathbb{Q}\hookrightarrow\mathbb{R}`$ が稠密一様埋め込みとなる.

### 一様被覆系

Definition. **一様被覆系**
:   集合 $`X`$ 上の被覆の族 $`\Phi`$ に対して, 次をそれぞれ定義する.
    - $`\Phi`$ が **$`X`$ 上の一様被覆系の準基** (*subbasis of uniform covers*) であるとは, 任意の $`\mathcal{G}\in\Phi`$ に対して $`\mathcal{G}`$ の重心細分となるような $`\mathcal{H}\in\Phi`$ が存在するときいう.
    - $`\Phi`$ が **$`X`$ 上の一様被覆系の基** (*basis of uniform covers*) であるとは, $`\Phi`$ は一様被覆系の準基であって, $`\Phi`$ が細分関係によりフィルター基であるときいう.
    - $`\Phi`$ が **$`X`$ 上の一様被覆系** (*uniform covers*) であるとは, $`\Phi`$ は一様被覆系の基であって, $`\Phi`$ が細分関係により上方閉であるときいう. (すなわち, $`\Phi`$ は細分関係によりフィルターとなる)

Proposition. **一様被覆系の準基から基の生成**
:   $`X`$ 上の一様被覆系の準基 $`\Phi`$ に対して, $`\Psi`$ を
    ```math
    \Psi\coloneqq\bigcup_{n\in\mathbb N}\left\{\bigwedge_{i=1}^{n}\mathcal{G}_i\mathrel{}\middle|\mathrel{}\mathcal{G}_1,\ldots,\mathcal{G}_n\in\Phi\right\}
    ```
    とすると, $`\Psi`$ は $`X`$ 上の一様被覆系の基となる.

<u>proof.</u>
:   有限個の有限交わりの交わりは再び $`\Phi`$ の元の有限交わりであるから, $`\Psi`$ は細分関係でフィルター基となる.
    各 $`\mathcal G_i`$ の重心細分を $`\mathcal H_i\in\Phi`$ として取り, その有限交わりを取れば $`\bigwedge_i\mathcal G_i`$ の重心細分となる.
    よって $`\Psi`$ は一様被覆系の基である.

Proposition. **一様被覆系の基から系の生成**
:   $`X`$ 上の一様被覆系の基 $`\Phi`$ を細分関係による上方閉包をとったものを $`\Psi`$ とすると, $`\Psi`$ は $`X`$ 上の一様被覆系となる.

<u>proof.</u>
:   上方閉包は定義により上方閉である.
    $`\Phi`$ がフィルター基であることから, $`\Psi`$ は細分関係で有限交わりに閉じている.
    また $`\Phi`$ の重心細分条件はより粗い被覆を許しても保たれる.
    よって $`\Psi`$ は一様被覆系である.

Proposition. **近縁系の定める一様被覆系**
:   集合 $`X`$ 上の近縁系 $`\mathbf{E}`$ に対して, $`X`$ 上の被覆の族 $`\Phi`$ を
    ```math
    \Phi\coloneqq\left\{\mathbf{U}\mathrel{}\middle|\mathrel{}\exists U\in\mathbf{E}\text{ s.t. }\{U(x)\mid x\in X\}\leq\mathbf{U}\right\}
    ```
    とすると, $`\Phi`$ は $`X`$ 上の一様被覆系となる. $`\Phi`$ を $`\mathbf{E}`$ の定める一様被覆系という.

<u>proof.</u>
:   近縁 $`U`$ ごとの球被覆 $`\{U(x)\mid x\in X\}`$ は被覆である.
    近縁系の有限交叉性は, これらの被覆の共通細分を与える.
    $`V\circ V\subseteq U`$ を満たす近縁 $`V`$ を取ると, $`V`$ の球被覆は $`U`$ の球被覆の重心細分となる.
    したがって表示した上方閉包は一様被覆系の公理を満たす.

以後, 一様空間 $`X`$ の近縁系 $`\mathbf{E}_X`$ の定める一様被覆系を $`\Phi_X`$ とする.

Proposition. **一様被覆系の定める近縁系**
:   集合 $`X`$ 上の一様被覆系 $`\Phi`$ に対して, $`X`$ 上の二項関係の族 $`\mathbf{E}`$ を
    ```math
    \mathbf{E}\coloneqq\left\{U\mathrel{}\middle|\mathrel{}\exists\mathbf{U}\in\Phi\text{ s.t. }\bigcup_{S\in\mathbf{U}}S\times S\subseteq U\right\}
    ```
    とすると, $`\mathbf{E}`$ は $`X`$ 上の近縁系となる. $`\mathbf{E}`$ を $`\Phi`$ の定める近縁系という.

<u>proof.</u>
:   各被覆の集合 $`\bigcup_{S\in\mathbf U}S\times S`$ は対角集合を含む.
    被覆の共通細分はこの関係の有限交叉に対応し, 上方閉性は近縁系の上方閉性を与える.
    被覆の重心細分条件は逆関係と合成の平方根条件を与える.
    よって $`\mathbf E`$ は近縁系である.

Proposition.
:   集合 $`X`$ 上の近縁系 $`\mathbf{E}`$ の生成する一様被覆系 $`\Phi`$ に対して, $`\Phi`$ の生成する近縁系は $`\mathbf{E}`$ と一致する.

<u>proof.</u>
:   近縁 $`U`$ の球被覆から作る関係は $`U`$ の適当な縮小を含み, 一方で $`U`$ に含まれる.
    近縁の平方根条件を用いて両方向の包含を得るので, 二つの近縁系は一致する.

Proposition.
:   集合 $`X`$ 上の一様被覆系 $`\Phi`$ の生成する近縁系 $`\mathbf{E}`$ に対して, $`\mathbf{E}`$ の生成する一様被覆系は $`\Phi`$ と一致する.

<u>proof.</u>
:   各 $`\mathbf U\in\Phi`$ から作る関係の球被覆は $`\mathbf U`$ を細分する.
    逆に, 近縁系の定義に現れる関係はある $`\mathbf U\in\Phi`$ から作られる関係を含むので, その球被覆は $`\mathbf U`$ より粗い.
    上方閉性により両者は同じ一様被覆系を生成する.

Proposition. **一様被覆系の定める位相**
:   集合 $`X`$ 上の一様被覆系 $`\Phi`$ に対して, 写像 $`\mathcal{N}:X\to2^{2^X}`$ を
    ```math
    \mathcal{N}(x)\coloneqq\{\mathbf{U}(x)\mid\mathbf{U}\in\Phi\},\quad x\in X
    ```
    とすると, $`\mathcal{N}`$ は $`X`$ 上の近傍基となる. 特に, 一様被覆系 $`\Phi`$ の定める近縁系の定める位相構造と $`\mathcal{N}`$ による位相構造は一致する.

<u>proof.</u>
:   被覆性により $`x\in\mathbf U(x)`$ である.
    共通細分は有限交叉に含まれる星を与え, 重心細分は近傍基の局所性の条件を与える.
    近縁系から得る球近傍と被覆の星近傍は上の相互変換で互いに細分し合うので, 生成される位相は一致する.

Proposition. **一様連続性の一様被覆による特徴づけ**
:   一様空間 $`X,Y`$ と 写像 $`f:X\to Y`$ に対して, 以下同値である.
    1. $`f`$ は一様連続である.
    2. 任意の $`\mathbf{V}\in\Phi_Y`$ に対して $`f^{-1}(\mathbf{V})\in\Phi_X`$ となる.

<u>proof.</u>
:   一様連続性は, 近縁球被覆の逆像がある近縁球被覆で細分されることと同値である.
    近縁系と一様被覆系の相互変換を用いると, これは任意の一様被覆の逆像が一様被覆となる条件 (2) に等しい.

### 写像列の収束

Proposition. **各点収束**
:   位相空間 $`X`$ と集合 $`S`$ と $`X^S`$ 上のネット $`(f_\lambda)_{\lambda\in\Lambda}`$ と $`f\in X^S`$ に対して, 以下同値.
    1. $`(f_\lambda)_{\lambda\in\Lambda}`$ は $`f`$ へ収束する.
    2. 各 $`c\in S`$ に対して, $`X`$ 上のネット $`(f_\lambda(c))_{\lambda\in\Lambda}`$ は $`X`$ の点 $`f(c)`$ に収束する.

<u>proof.</u>
:   関数空間 $`X^S`$ には積位相を入れる.
    各評価写像 $`\operatorname{ev}_c:X^S\to X`$ は連続なので, (1) から (2) が従う.
    逆に積位相の $`f`$ における近傍基は, 有限個の点 $`c_1,\ldots,c_n\in S`$ と各 $`f(c_i)`$ の近傍を指定して得られる.
    (2) により各座標条件は十分後のすべての $`f_\lambda`$ が満たす.
    有向性により有限個の添字の共通上界を取れば, それらの座標条件を同時に満たす.
    よって $`f_\lambda`$ は $`f`$ に収束する.

Definition. **一様収束**
:   一様空間 $`X`$ と集合 $`S`$ と $`X^S`$ 上のネット $`(f_\lambda)_{\lambda\in\Lambda}`$ と $`f\in X^S`$ に対して, **$`(f_\lambda)`$ が $`f`$ へ一様収束する** (*$`(f_\lambda)`$ converges uniformly to $`f`$*) とは, 任意の一様被覆 $`U\in\mathbf{E}_X`$ に対して $`\lambda_0\in\Lambda`$ が存在して次が成り立つ.
    ```math
    \forall\lambda\in\Lambda,\quad\lambda_0\leq\lambda\Rightarrow
    \forall s\in S,\ (f_\lambda(s),f(s))\in U
    ```