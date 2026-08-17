## 圏論における普遍的性質

### 普遍射

普遍性は、ある特定の状況下において一意に射を定めるような抽象的性質であり、それが特定の構成を特徴づけるようなものをいう。
普遍性の具体例として、前述した直積や直和、等化子や余等化子、核や余核、極限や余極限、引き戻しや押し出しなどがある。

$T\colon\mathcal{A}\to\mathcal{B}$ を函手とし、$B$ を $\mathcal{B}$ の対象とする。
**$B$ から $T$ への普遍射** (*universal morphism from $B$ to $T$*) とは、対象 $A\in\mathcal{A}$ と射 $\phi\colon B\to T(A)$ の組 $(A,\phi)$ であって、**普遍性** (*universal property*) と呼ばれる以下の条件を満たす:

- 対象 $A^\prime\in\mathcal{A}$ と射 $\phi^\prime\colon B\to T(A^\prime)$ の組 $(A^\prime,\phi^\prime)$ に対して、**仲介射** (*mediating morphism*) と呼ばれる一意的な射 $m\colon A\to A^\prime$ が存在し $\phi^\prime=T(m)\circ\phi$ と分解される。

他方、**$T$ から $B$ への普遍射** (*universal morphism from $T$ to $B$*) とは、対象 $A\in\mathcal{A}$ と射 $\psi\colon T(A)\to B$ の組 $(A,\psi)$ であって、以下の普遍性を満たす:

- 対象 $A^\prime\in\mathcal{A}$ と射 $\psi^\prime\colon T(A^\prime)\to B$ の組 $(A^\prime,\psi^\prime)$ に対して、仲介射 $m\colon A^\prime\to A$ が存在し $\psi^\prime=\psi\circ T(m)$ と分解される。

### コンマ圏

**コンマ圏** (*comma category*)
:   2つの函手 $\mathcal{A}\xrightarrow{F}\mathcal{C}\xleftarrow{G}\mathcal{B}$ に対して、以下のようにして定まる圏を **コンマ圏** (*comma category*) といい、$F/G$ あるいは $F\downarrow G$ と表す。

    - $\operatorname{Ob}(F/G)\coloneqq\{(A,B,f)\colon f\in\mathcal{C}(FA,GB)\}$ ;
    - 対象 $(A,B,f),(A^\prime,B^\prime,f^\prime)\in\operatorname{Ob}(F/G)$ の間の射 $(A,B,f)\to(A^\prime,B^\prime,f^\prime)$ は、射の組 $(A\xrightarrow{\alpha}A^\prime,B\xrightarrow{\beta}B^\prime)$ の組であって、次の図式が可換となるものである:

    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[xscale=1.5]
            \node (AA) at (0,0) { $FA^\prime$ };
            \node (AB) at (0,1) { $FA$ };
            \node (BA) at (1,0) { $GB^\prime$ };
            \node (BB) at (1,1) { $GB$ };
            \draw[->] (AB) to node[scale=.8,auto=left] { $f$ } (BB);
            \draw[->] (AA) to node[scale=.8,auto=left] { $f^\prime$ } (BA);
            \draw[->] (AB) to node[scale=.8,auto=right] { $F\alpha$ } (AA);
            \draw[->] (BB) to node[scale=.8,auto=left] { $G\beta$ } (BA);
        \end{tikzpicture}
    \end{document}
    ```

特に、$A\in\mathcal{A}$ による函手 $\mathcal{A}\xrightarrow{\operatorname{id}_{\mathcal{A}}}\mathcal{A}\xleftarrow{A}\{\ast\}$ のコンマ圏を **スライス圏** (*slice category*) と呼び、$\mathcal{A}/A$ と表し、函手 $\{\ast\}\xrightarrow{A}\mathcal{A}\xleftarrow{\operatorname{id}_{\mathcal{A}}}\mathcal{A}$ のコンマ圏を **コスライス圏** (*coslice category*) と呼び、$A/\mathcal{A}$ と表す。

函手の組 $\mathcal{A}\xrightarrow{F}\mathcal{C}\xleftarrow{G}\mathcal{B}$ によるコンマ圏 $F/G$ に対して、以下それぞれが成り立つ:

- $\mathcal{A}$ , $\mathcal{B}$ がともに完備かつ、$G$ が連続函手のとき、$F/G$ は完備となる。
- $\mathcal{A}$ , $\mathcal{B}$ がともに余完備かつ、$F$ が余連続函手のとき、$F/G$ は余完備となる。

また、コンマ圏は次のような普遍性を持つ。

Theorem.
:   函手の組 $\mathcal{A}\xrightarrow{F}\mathcal{C}\xleftarrow{G}\mathcal{B}$ に対して、函手の組 $\mathcal{A}\xleftarrow{P}F/G\xrightarrow{Q}\mathcal{B}$ と自然変換 $\theta\colon FP\implies GQ$ が次のように定まる:

    - 任意の対象 $(A,B,f)\in F/G$ に対して $P(A,B,f)\coloneqq A$ , $Q(A,B,f)\coloneqq B$ , $\theta_{(A,B,f)}\coloneqq f$ ;
    - 任意の射 $\mu=(A\xrightarrow{\alpha}A^\prime,B\xrightarrow{\beta}B^\prime)$ に対して、$P\mu\coloneqq \alpha$ , $Q\mu\coloneqq \beta$ ;

    これらは、以下の普遍性を持つ:

    - 圏 $\mathcal{X}$ と、函手の組 $\mathcal{A}\xleftarrow{P^\prime}\mathcal{X}\xrightarrow{Q^\prime}\mathcal{B}$ 、自然変換 $\theta^\prime\colon FP^\prime\implies GQ^\prime$ に対して、一意的な函手 $M\colon\mathcal{X}\to F/G$ が存在して、$P^\prime=P\circ M$ , $Q^\prime=Q\circ M$ , $\theta^\prime=\theta_M$ が成り立つ;

---

### モノ、エピ、セクション、リトラクション

射 $f\colon A\to B$ について、すべての対象 $X$ と任意の射 $x,x^\prime\colon X\to A$ に対して $f\circ x=f\circ x^\prime$ ならば $x=x^\prime$ が成り立つとき、$f$ は **単射** 、あるいは **モノ射** (*monomorphism*) 、**モニック射** (*monic morphism*) であるという。
他方、すべての対象 $Y$ と任意の射 $y,y^\prime\colon B\to Y$ に対して $y\circ f=y^\prime\circ f$ ならば $y=y^\prime$ が成り立つとき、$f$ は **全射** 、あるいは **エピ射** (*epimorphism*) 、**エピック射** (*epic morphism*) であるという。
特に、モノしかつエピな射を **バイ射** (*bimorphism*) と呼ぶ。

射 $f\colon A\to B$ , $g\colon B\to A$ について、$g\circ f=\operatorname{id}_A$ を満たすとき、$g$ は $f$ の **左逆** (*left inverse*) といい、$f$ は $g$ の **右逆** (*right inverse*) という。
$f$ の左逆射らのことを $f$ の **リトラクション** (*retraction*) といい、$g$ の右逆射らを $g$ の **断面** (*section*) という。

左可逆射(=左逆射を持つ射)はモノ射となるため、左可逆射は **分裂モノ射** (*split monomorphism*) と呼ばれている。
同様に、右可逆射(=右逆射を持つ射)はエピ射となるため、右可逆射は **分裂エピ射** (*split epimorphism*) と呼ばれている。
特に、同型射はバイ射となるため、バイ射が同型射となる圏は **バランスが取れている** 、あるいは単に **バランス** という。
また、あるフォークのイコライザーになる射はモノ射となるため、このような射は正則モノ射と呼ばれている。
あるフォークのコイコライザーになる射はエピ射となるため、このような射は正則エピ射と呼ばれている。

射 $f\colon A\to B$ について、すべての対象 $X$ と任意の射 $x,x^\prime\colon X\to A$ に対して $f\circ x=f\circ x^\prime$ を満たすとき、$f$ は **左零射** (*left zero morphism*) 、あるいは **定値射** (*constant morphism*) であるという。
他方、すべての対象 $Y$ と任意の射 $y,y^\prime\colon B\to Y$ に対して $y\circ f=y^\prime\circ f$ を満たすとき、$f$ は **右零射** (*right zero morphism*) 、あるいは **余定値射** (*coconstant morphism*) であるという。
特に、左零かつ右零な射を **零射** (*zero morphism*) といい、各射の集まり $\mathcal{A}(A,B)$ が零射を持つような圏を **零射を持つ圏** (*category with zero morphisms*) という。

対象 $I\in\mathcal{A}$ が **入射的** (*injective*) であるとは、函手 $\mathcal{A}({-},I)$ が任意のモノ射をエピ射に送るときいう。
他方、$P\in\mathcal{A}$ が **射影的** (*projective*) であるとは、函手 $\mathcal{A}(P,{-})$ が任意のエピ射をエピ射に送る(すなわち、函手 $\mathcal{A}(P,{-})$ はエピ射を保つ)

### 核，余核，像，余像

圏 $\mathcal{A}$ の射 $f\colon A\to B$ の **像** (*image*) とは、対象 $\operatorname{Im}{f}$ とモノ射 $i\colon\operatorname{Im}(f)\to B$ の組 $(\operatorname{Im}(f),i)$ であって、以下の普遍性を満たすものである:

- $f=i\circ\overline{f}$ なる射 $\overline{f}\colon A\to\operatorname{Im}(f)$ が存在する;
- $f=i^\prime\circ g$ を満たす任意のモノ射 $i^\prime\colon I^\prime\to B$ と射 $g\colon A\to I^\prime$ に対して、一意的な射 $m\colon\operatorname{Im}(f)\to I^\prime$ が存在して $i=i^\prime\circ m$ を満たす。

他方、圏 $\mathcal{A}$ の射 $f\colon A\to B$ の **余像** (*coimage*) とは、対象 $\operatorname{CoIm}{f}$ とエピ射 $s\colon A\to\operatorname{CoIm}{f}$ であって、以下の普遍性を満たすものである:

- $f=\underline{f}\circ s$ なる射 $\underline{f}\colon\operatorname{CoIm}{f}\to B$ が存在する;
- $f=g\circ s^\prime$ を満たす任意のエピ射 $s^\prime\colon A\to S^\prime$ と射 $g\colon S^\prime\to B$ に対して、一意的な射 $m\colon S^\prime\to\operatorname{CoIm}{f}$ が存在して $s=m\circ s^\prime$ を満たす。

零射を持つ圏 $\mathcal{A}$ の射 $f\colon A\to A^\prime$ の **核** (*kernel*) とは、対象 $\ker{f}$ と射の $k\colon\ker{f}\to A$ の組 $(\ker{f},k)$ であって、以下の普遍性を満たすものである:

- $f\circ k\colon \ker{f}\to A^\prime$ は零射となる;
- 対象 $K^\prime$ と射の $k^\prime\colon K^\prime\to A$ の組 $(K^\prime,k^\prime)$ であって、$f\circ k^\prime$ が零射となるものを任意にとったとき、一意的な射 $u\colon K^\prime\to\ker{f}$ が存在して $k^\prime=k\circ u$ と分解できる;

他方、零射を持つ圏 $\mathcal{A}$ の射 $f\colon A\to A^\prime$ の **余核** (*cokernel*) とは、対象 $\operatorname{coker}{f}$ と射の $q\colon A^\prime\to\operatorname{coker}{f}$ の組 $(\operatorname{coker}{f},q)$ であって、以下の普遍性を満たすものである:

- $q\circ f\colon A\to\operatorname{coker}{f}$ は零射となる;
- 対象 $Q^\prime$ と射の $q^\prime\colon A^\prime\to Q^\prime$ の組 $(Q^\prime,q^\prime)$ であって、$q^\prime\circ f$ が零射となるものを任意にとったとき、一意的な射 $u\colon\operatorname{coker}{f}\to Q^\prime$ が存在して $q^\prime=u\circ q$ と分解できる;

---

### 随伴

**随伴** (*adjunction*) とは、二つの圏の間で互いに対応する函手の特別な関係を示す概念である。随伴とは、ある圏から別の圏への一対の函手が、**最も自然な方法** で対応し合う関係を持つことを意味する。この関係は多くの数学的構造や変換に現れ、特に構造が最適に相互変換される場合に現れる。

随伴関係にある函手は、通常 **左随伴函手** と **右随伴函手** のペアで表される。この関係は、左随伴函手が一種の **生成** や **自由な構成** を行い、右随伴函手が **制約** や **評価** を行うという役割分担を持つことが多い。例えば、群論における自由群構成は左随伴函手の典型例で、集合を群にする **自由な** 方法を提供し、これに対して右随伴函手はその群の基礎集合を取り出す役割を果たす。

随伴を考えることで、数学的な構造や変換がどのように対応し合い、またどのように **最適な** 関係を持つかを理解することができる。随伴関係は、圏論の中で **最適な対応** を示す枠組みとして非常に強力であり、多様な数学の場面で現れる基本的な概念である。

函手の組 $\mathcal{A}\xrightleftarrows[G]{F}\mathcal{B}$ の **随伴** (*adjunction*) とは、以下の同値な定義によって与えられる:

- **Hom同型射による定義**: 自然同型 $\Phi\colon\mathcal{B}(F({-}),{-})\to\mathcal{A}({-},G({-}))$ のこと;
- **余単位--単位による定義**: 自然変換 $\eta\colon\operatorname{id}_{\mathcal{A}}\to GF$ , $\varepsilon\colon FG\to\operatorname{id}_{\mathcal{B}}$ であって、以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[xscale=1.5]
            \node (AB) at (0,1) { $F$ };
            \node (BA) at (1,0) { $F$ };
            \node (BB) at (1,1) { $FGF$ };
            \draw[->] (AB) to node[scale=.8,auto=left] { $F\eta$ } (BB);
            \draw[->] (AB) to node[scale=.8,auto=right] { $\operatorname{id}_F$ } (BA);
            \draw[->] (BB) to node[scale=.8,auto=left] { $\varepsilon F$ } (BA);
        \end{tikzpicture}
        \begin{tikzpicture}[xscale=1.5]
            \node (AB) at (0,1) { $G$ };
            \node (BA) at (1,0) { $G$ };
            \node (BB) at (1,1) { $GFG$ };
            \draw[->] (AB) to node[scale=.8,auto=left] { $\eta G$ } (BB);
            \draw[->] (AB) to node[scale=.8,auto=right] { $\operatorname{id}_G$ } (BA);
            \draw[->] (BB) to node[scale=.8,auto=left] { $G\varepsilon$ } (BA);
        \end{tikzpicture}
    \end{document}
    ```
    $\eta$ , $\varepsilon$ はこの随伴の **単位** (*unit*) ,  **余単位** (*counit*) と呼ぶ。

このとき、$F\dashv G$ と表し、$F$ は $G$ の **左随伴** (*left adjoint*) 、あるいは $G$ は $F$ の **右随伴** (*right adjoint*) と呼ぶ。

随伴における余単位--単位の三角図式から、函手 $F\colon\mathcal{A}\to\mathcal{B}$ に対して、以下同値となる:

- $F$ が左随伴を持つ。
- 各 $B\in\mathcal{B}$ に対して $B$ から $F$ への普遍射が存在する。

随伴函手の代表的な例として、**自由函手** (*free functor*) と **忘却函手** (*forgetful functor*) が挙げられる。自由函手は、ある構造を持たない対象に対して最も **自由な** 構造を与える函手であり、その構造は必要最小限の制約を満たしつつ追加される。たとえば、集合に群構造を与える自由群函手がこの典型例である。一方、忘却函手は、対象の持つ構造の一部を **忘れる** 操作を行い、より単純な構造を持つ圏へ対象を写す函手である。例えば、群の圏 $\mathsf{Grp}$ から集合の圏 $\mathsf{Set}$ への忘却函手は、群をその台集合へと移す操作を意味する。
自由函手と忘却函手の間に存在する随伴関係は、**最も自然な** 方法で構造を与えたり、取り除いたりする手法を提供する。この関係性を理解するために、いくつかの具体例を挙げる。

- **アーベル化**: アーベル群の圏 $\mathsf{Ab}$ から群の圏 $\mathsf{Grp}$ への忘却函手は、可換性という構造を忘れる操作である。この函手の左随伴は **群のアーベル化** と呼ばれる。群 $G$ に対して、その交換子部分群 $[G, G]$ により商を取ることで得られるアーベル群 $G^{\mathrm{ab}} = G/[G, G]$ が対応する。アーベル化は、群の基本的な性質を維持しつつ可換性を強制するため、代数的トポロジーやホモロジー代数で広く用いられている。

- **Grothendieck構成**: アーベル群の圏 $\mathsf{Ab}$ から可換モノイドの圏 $\mathsf{CMon}$ への忘却函手は、アーベル群から逆元の存在という性質を忘れる。この函手の左随伴は **Grothendieck構成** と呼ばれ、可換モノイド $M$ に対してそのGrothendieck群 $K(M)$ を対応させる。 $K(M)$ は $M$ を埋め込む最小のアーベル群として構成されるものであり、半環や可換モノイドの圏での研究に応用されている。

- **環の構成**: 環の圏 $\mathsf{Ring}$ から集合の圏 $\mathsf{Set}$ への忘却函手は、環の構造を忘れてその台集合を得る操作である。この函手の左随伴は、集合 $X$ に対してその各元を変数とする $\mathbb{Z}$ 係数の多項式環 $\mathbb{Z}[X]$ を対応させる。これは、形式的な演算を導入することで集合に代数的構造を与える典型例であり、代数幾何や数論において基本的な道具立てを提供するものである。

- **距離空間の完備化**: 完備距離空間の圏 $\mathsf{CMet}$ から一般距離空間の圏 $\mathsf{Met}$ への忘却函手は、空間が持つ完備性という性質を忘れる操作である。この函手の左随伴は **距離空間の完備化** と呼ばれ、距離空間 $(X, d)$ をその完備空間への埋め込み $(\widehat{X}, \hat{d})$ に対応させる。例えば、実数 $\mathbb{R}$ は有理数 $\mathbb{Q}$ の完備化として得られるため、この構造は解析学の基礎において重要な役割を果たす。

- **Stone-Čechのコンパクト化**: コンパクトハウスドルフ空間の圏 $\mathsf{CHaus}$ から位相空間の圏 $\mathsf{Top}$ への忘却函手は、空間が持つコンパクト性やハウスドルフ性を忘れる操作である。この函手の左随伴は **Stone-Čechのコンパクト化** と呼ばれ、位相空間 $X$ をその普遍的なコンパクトハウスドルフ空間 $\beta X$ に対応させる。この構成は、位相空間論や関数解析における重要なツールとして広く知られている。

---

### 表現可能函手と米田の補題

$\mathcal{C}$ を局所小圏とする。
$\mathcal{C}$ 上の集合値共変函手(resp. 集合値反変函手) $F$ の
**$F$ の表現** (*representation of $F$*) とは、対象 $X\in\mathcal{C}$ と自然同型 $\theta\colon F\to\mathcal{C}(X,{-})$ (resp. $\theta\colon F\to\mathcal{C}({-},X)$ )の組 $(X,\theta)$ である。
函手 $F$ の表現 $(X,\theta)$ が存在するとき、函手 $F$ を **表現可能函手** (*representable functor*) といい、$X$ を **$F$ の表現対象** (*representing object for $F$*) という。
函手の表現が存在するとき、次に述べる **米田の補題** によりその表現対象は一意的である。
Theorem. **米田の補題** (*Yoneda lemma*)
:   $\mathcal{A}$ を局所小圏とする。
    任意の函手 $X\colon\mathcal{A}^{\textrm{op}}\to\mathsf{Set}$ と対象 $A\in\mathcal{A}$ に対して
    次の同型が存在する:
    $$
    [\mathcal{A}^{\textrm{op}},\mathsf{Set}](\mathcal{A}({-},A),X)\cong XA
    $$
    さらに、この同型は $X$ と $A$ について自然である。

$\mathcal{A}$ を局所小圏とし、$\mathcal{y}_{\mathcal{A}}\colon\mathcal{A}\to[\mathcal{A}^{\textrm{op}},\mathsf{Set}]$ を $\mathcal{y}_{\mathcal{A}}A=\mathcal{A}({-},A)$ で定まる函手とすると、次の系が成り立つ。

Corollary.
:   $\mathcal{y}_{\mathcal{A}}\colon\mathcal{A}\to[\mathcal{A}^{\textrm{op}},\mathsf{Set}]$ は充満忠実な函手である。

また、前層 $X$ の表現は前層の普遍元と等しい。

Definition.
:   前層 $X\colon\mathcal{A}^{\textrm{op}}\to\mathsf{Set}$ に対して、$A\in\mathcal{A}$ と $u\in X(A)$ の組 $(A,u)$ を $X$ の元という。
    $X$ の元のうち、以下の普遍性を満たすものを $X$ の普遍元という。

    - **普遍元の普遍性**: $X$ の普遍元 $(A,u)$ とは、任意の $X$ の元 $(B,x)$ に対して $(X\overline{x})(u)=x$ を満たすような $\mathcal{A}$ の射 $\overline{x}\colon B\to A$ が存在するときいう。

また、左随伴を持つような集合値函手は表現可能である。

Theorem.
:   $F\colon\mathcal{A}\to\mathsf{Set}$ が左随伴を持つとき、$F$ は表現可能である。

### エンドとコエンド

函手 $F\colon\mathcal{C}^{\textrm{op}}\times\mathcal{C}\to\mathcal{D}$ と $d\in\mathcal{D}$ に対して、**$d$ における $F$ の楔** (*wedge from $d$ to $S$*) とは、以下の図式が可換となるような $c\in\mathcal{C}$ で添字付けられた $\mathcal{D}$ の射 $\alpha_c\colon d\to F(c,c)$ の族のことである:
```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools}
\usepackage{tikz}
\begin{document}
    \begin{tikzpicture}[xscale=3]
        \node (AA) at (0,0) { $F(c^\prime,c^\prime)$ };
        \node (AB) at (0,1) { $d$ };
        \node (BA) at (1,0) { $F(c,c^\prime)$ };
        \node (BB) at (1,1) { $F(c,c)$ };
        \draw[->] (AB) to node[scale=.8,auto=left] { $\alpha_c$ } (BB);
        \draw[->] (AA) to node[scale=.8,auto=right] { $F(f,\operatorname{id})$ } (BA);
        \draw[->] (AB) to node[scale=.8,auto=right] { $\alpha_{c^\prime}$ } (AA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $F(\operatorname{id},f)$ } (BA);
    \end{tikzpicture}
\end{document}
```
函手 $F\colon\mathcal{C}^{\textrm{op}}\times\mathcal{C}\to\mathcal{D}$ と $d\in\mathcal{D}$ に対して、$\alpha$ を $d$ における $F$ の楔として普遍的なものを **$F$ のエンド** (*end*) と呼ぶ。
すなわち、任意の楔( $\beta_c\colon d^\prime\to F(c,c))$ に対して、一意的な射 $\pi_\beta\colon d\to d^\prime$ が存在して、$\alpha_c=\beta_C\circ\pi_\beta$ が成り立つときいう。

楔の双対概念を **余楔** (*coslash*) と呼び、エンドの双対概念を **コエンド** (*coend*) と呼ぶ。

$F$ のエンド、コエンドを $\int_{c\in\mathcal{C}}F(c,c)$ 、$\int^{c\in\mathcal{C}}F(c,c)$ と表す。

Theorem.
:   $\mathcal{A},\mathcal{B}$ を小圏とする。
    このとき、任意の函手 $F,G\colon\mathcal{A}\to\mathcal{B}$ に対して、以下の同型が成り立つ:
    $$
    [\mathcal{A},\mathcal{B}](F,G)\cong\int_{A\in\mathcal{A}}\mathcal{B}(FA,GA)
    $$

解析学における二重積分の逐次計算に関する定理としてFubiniの定理があるが、エンドに対してもその圏論的類似が成り立つ。

Theorem. **Fubini の定理** (*Fubini's theorem*)
:   $\mathcal{A},\mathcal{B}$ を小圏とし、$T\colon(\mathcal{A}\times\mathcal{B})^{\textrm{op}}\times(\mathcal{A}\times\mathcal{B})\to\mathsf{Set}$ を函手とする。
    任意の $B,B^\prime\in\mathcal{B}$ に対しエンド $\int_{A\in\mathcal{A}}T(A,B,A,B^\prime)$ が存在するとき、対の同型のいずれか片側が存在するときに限り成り立つ:
    $$
    \int_{(A,B)\in\mathcal{A}\times\mathcal{B}}T(A,B,A,B)\cong\int_{B\in\mathcal{B}}\int_{A\in\mathcal{A}}T(A,B,A,B)
    $$

---

### 極限、余極限

#### 具体的な極限の例

Definition. 3.2. **積**
:   $\mathcal{A}$ を圏、$\Lambda$ を集合、$(A_\lambda)_{\lambda\in\Lambda}$ を $\mathcal{A}$ の対象の族とする。
    $(A_\lambda)_{\lambda\in\Lambda}$ の **積** (*product*) とは、$\mathcal{A}$ の対象 $\prod_{\lambda\in\Lambda}A_\lambda$ と射影と呼ばれる射 $\pi_\lambda\colon\prod_{\lambda\in\Lambda}A_\lambda\to A_\lambda$ の族 $\pi=(\pi_{\lambda})$ の組 $(\prod_{\lambda\in\Lambda}A_\lambda,\pi)$ であって、以下の普遍性を満たすものである:

    - **積の普遍性**: $\mathcal{A}$ の対象 $P$ と射 $\theta_\lambda\colon P\to A_\lambda$ の族 $(\theta_\lambda)$ に対して、一意的な射 $\overline{\theta}\colon P\to\prod_{\lambda\in\Lambda}A_\lambda$ が存在して、$\theta_\lambda=\overline{\theta}\circ\pi_\lambda$ と分解される。
    
    このとき、$\theta_\lambda$ を $\overline{\theta}$ の $\lambda$ -成分といい、$\overline{\theta}$ を $(\theta_\lambda)$ と書くこととする。

    特に、$\Lambda$ が有限集合 $\{1,2,\ldots,N\}$ であるとき、**$N$ -項積** (*$N$ -ary product*) とよばれ $\prod_{j=1}^{N}A_j$ あるいは $A_1\times\ldots\times A_N$ と表される。
    
    $\mathcal{A}^{\textrm{op}}$ における積を、$\mathcal{A}$ における **余積** (*coproduct*) といい、$\coprod_{\lambda\in\Lambda}A_\lambda$ で表す。

任意の有限個の対象の積が存在するような圏を **カルテシアン圏** (*cartesian category*) という。特に、カルテシアン圏 $\mathcal{C}$ であって各対象 $A\in\mathcal{C}$ に対して函手 ${-}\times A\colon\mathcal{C}\to\mathcal{C}$ が右随伴 $[A,{-}]\colon\mathcal{C}\to\mathcal{C}$ を持つような圏を **カルテシアン閉圏** (*cartesian closed category*) という。

Definition. 3.3. **等化子**
:   圏 $\mathcal{A}$ における図式 $A\underset{t}{\overset{s}{\rightrightarrows}}B$ に対して、図式 $Z\xrightarrow{\theta}A\underset{t}{\overset{s}{\rightrightarrows}}B$ が $s\theta=t\theta$ を満たすとき **フォーク** (*folk*) と呼ぶ。
    図式 $A\underset{t}{\overset{s}{\rightrightarrows}}B$ の **等化子** (*equalizer*) とは、フォーク $Z\xrightarrow{\text{eq}}A\underset{t}{\overset{s}{\rightrightarrows}}B$ であって、以下の普遍性を満たすものである:

    - **フォークの普遍性**: 任意のフォーク $Z\xrightarrow{\theta}A\underset{t}{\overset{s}{\rightrightarrows}}B$ に対して、一意的な射 $\overline{\theta}\colon Z\to E$ が存在して、$\theta=\textup{eq}\circ\overline{\theta}$ と分解される。

    $\mathcal{A}^{\textrm{op}}$ における等化子を、$\mathcal{A}$ における **余等化子** (*coequalizer*) と呼ぶ。

Definition. **引き戻し**
:   圏 $\mathcal{A}$ における図式 $A\xrightarrow{s}C\xleftarrow{t}B$ の **引き戻し** (*pullback*) 、あるいは **ファイバー積** (*fibered product*) とは、圏 $\mathcal{A}$ における可換図式
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[baseline=(T.base)]
            \node (T) at (0,.5) {\phantom{T}};
            \node (P) at (0,1) { $P$ };
            \node (A) at (0,0) { $A$ };
            \node (C) at (1,0) { $C$ };
            \node (B) at (1,1) { $B$ };
            \draw[->] (A) to node[scale=.8,auto=right] { $s$ } (C);
            \draw[->] (B) to node[scale=.8,auto=left] { $t$ } (C);
            \draw[->] (P) to node[scale=.8,auto=right] { $\pi_1$ } (A);
            \draw[->] (P) to node[scale=.8,auto=left] { $\pi_2$ } (B);
        \end{tikzpicture}
    \end{document}
    ```
    であって、以下の普遍性を満たすものである:

    - **引き戻しの普遍性**: 任意の可換図式
        ```latex {cmd=true latex_zoom=300% hide=true}
        \documentclass{standalone}
        \usepackage{mathrsfs,mathtools}
        \usepackage{tikz}
        \begin{document}
            \begin{tikzpicture}[baseline=(T.base)]
                \node (T) at (0,.5) {\phantom{T}};
                \node (P) at (0,1) { $P$ };
                \node (A) at (0,0) { $A$ };
                \node (C) at (1,0) { $C$ };
                \node (B) at (1,1) { $B$ };
                \draw[->] (A) to node[scale=.8,auto=right] { $s$ } (C);
                \draw[->] (B) to node[scale=.8,auto=left] { $t$ } (C);
                \draw[->] (P) to node[scale=.8,auto=right] { $\theta_1$ } (A);
                \draw[->] (P) to node[scale=.8,auto=left] { $\theta_2$ } (B);
            \end{tikzpicture}
        \end{document}
        ```
        に対して、一意的な射 $\theta\colon Z\to P$ が存在して、$\theta_j=\pi_j\circ\theta$ ( $j=1,2$ )と分解される。

    $\mathcal{A}^{\textrm{op}}$ における引き戻しを、$\mathcal{A}$ における **押し出し** (*pushout*) 、あるいは **ファイバー余積** (*fibered coproduct*) という。

#### 集合の圏の場合

$\mathcal{A}=\mathsf{Set}$ における積および余積は、集合の直積および直和である。すなわち次のように計算できる:
$$
\prod_{\lambda\in\Lambda}A_\lambda=\{(a_\lambda)_{\lambda\in\Lambda}\colon a_\lambda\in A_\lambda,\forall\lambda\in\Lambda\}
,\quad
\coprod_{\lambda\in\Lambda}A_\lambda=\{(\lambda,a_\lambda)\colon\lambda\in\Lambda,a_\lambda\in A_\lambda\}
$$

また、図式 $A\underset{t}{\overset{s}{\rightrightarrows}}B$ の等化子は、$A$ の部分集合 $\{a\in A\colon s(a)=t(a)\}$ と包含写像 $E\hookrightarrow A$ の組であり、他方、図式 $A\underset{t}{\overset{s}{\rightrightarrows}}B$ の余等化子は、条件 **$\forall a\in A,s(a)\simeq t(a)$** で生成される $B$ 上の同値関係 $\simeq$ による商集合 $B/\simeq$ と商写像 $B\twoheadrightarrow B/\simeq$ の組である。
さらに、図式 $A\xrightarrow{s}C\xleftarrow{t}B$ の引き戻しは $、A\times B$ の部分集合 $P=\{(a,b)\colon s(a)=t(b)\}$ と各成分への射影 $P\ni (a,b)\mapsto a\in A$ , $E\ni (a,b)\mapsto b\in B$ の組であり、他方、図式 $A\xleftarrow{s}C\xrightarrow{t}B$ 押し出しは条件 **$\forall c\in C,s(c)\simeq t(c)$** で生成される $A\sqcup B$ 上の同値関係 $\simeq$ による商集合 $A\sqcup B/\simeq$ と商写像 $A\sqcup B\twoheadrightarrow A\sqcup B/\simeq$ と直和への射影 $A\to A\sqcup B$ , $B\to A\sqcup B$ の合成射の組である。

---

#### 極限の定義

函手 $D\colon\mathbf{I}\to\mathcal{A}$ を **$\mathbf{I}$ 型図式** (*diagram of shape $\mathbf{I}$*) と呼び、$\mathbf{I}$ を **添字圏** (*index category*) と呼ぶ。
$\mathbf{I}$ 上の図式 $D$ に対して、**$D$ への錐** (*corn*) とは、対象 $A\in\mathcal{A}$ と $J\in\mathbf{I}$ で添字付けられた $\mathcal{A}$ の射 $A\xrightarrow{\phi_J}D(J)$ の族 $\phi=(\phi_J\colon J\in\mathbf{I})$ の組 $(A,\phi)$ であって、$\mathbf{I}$ の各射 $t\colon J\to J^\prime$ に対して以下の図式が可換となる:
```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools}
\usepackage{tikz}
\begin{document}
    \begin{tikzpicture}
        \node (DJ) at (0,0) { $DJ$ };
        \node (DJP) at (2,0) { $DJ^\prime$ };
        \node (A) at (1,1) { $A$ };
        \draw[->] (A) to node[scale=.8,auto=right] { $\phi_J$ } (DJ);
        \draw[->] (A) to node[scale=.8,auto=left] { $\phi_{J^\prime}$ } (DJP);
        \draw[->] (DJ) to node[scale=.8,auto=right] { $Dt$ } (DJP);
    \end{tikzpicture}
\end{document}
```
$D$ の錐のうち普遍性を満たすものを **$D$ の極限** (*limit*) といい、$\lim{D}$ あるいは $\varprojlim{D}$ と表す。
すなわち、$\lim{D}$ とは $D$ の錐 $(L,\lambda)$ であって、任意の $D$ の錐 $(A,\phi)$ に対して、一意的な射 $u\colon A\to L$ が存在して各 $\phi_J$ が $\phi_J=\lambda_J\circ u$ と分解できる。

他方、$\mathbf{I}$ 上の図式 $D$ に対して、**$D$ からの余錐** (*cocorn*) とは、対象 $A\in\mathcal{A}$ と $J\in\mathbf{I}$ で添字付けられた $\mathcal{A}$ の射 $D(J)\xrightarrow{\phi_J}A$ の族 $\phi$ の組 $(A,\phi)$ であって、$\mathbf{I}$ の各射 $t\colon J\to J^\prime$ に対して以下の図式が可換となる:
```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools}
\usepackage{tikz}
\begin{document}
    \begin{tikzpicture}
        \node (DJ) at (0,1) { $DJ$ };
        \node (DJP) at (2,1) { $DJ^\prime$ };
        \node (A) at (1,0) { $A$ };
        \draw[->] (DJ) to node[scale=.8,auto=right] { $\phi_J$ } (A);
        \draw[->] (DJP) to node[scale=.8,auto=left] { $\phi_{J^\prime}$ } (A);
        \draw[->] (DJ) to node[scale=.8,auto=left] { $Dt$ } (DJP);
    \end{tikzpicture}
\end{document}
```
$D$ の余錐のうち普遍性を満たすものを **$D$ の余極限** (*colimit*) といい、$\operatorname*{colim}{D}$ あるいは $\varinjlim{D}$ と表す。
すなわち、$\operatorname*{colim}{D}$ とは $D$ の余錐 $(L,\lambda)$ であって、任意の $D$ の余錐 $(A,\phi)$ に対して、一意的な射 $u\colon L\to A$ が存在して各 $\phi_J$ が $\phi_J=u\circ\lambda_J$ と分解できる。

$D\colon\mathbf{I}\to\mathcal{A}$ の余極限は、$D^{\textrm{op}}$ の極限という意味で双対になっている。

圏 $\mathcal{A}$ と小圏 $\mathbf{I}$ に対して、$\mathcal{A}$ における任意の $\mathbf{I}$ 型図式が極限を持つとき、$\mathcal{A}$ は $\mathbf{I}$ 型極限を持つという。

Theorem.
:   小圏 $\mathbf{I},\mathbf{J}$ に対して、局所小圏 $\mathcal{C}$ が $\mathbf{I}$ 型および $\mathbf{J}$ 型極限を持つとき、任意の函手 $D\colon\mathbf{I}\times\mathbf{J}\to\mathcal{C}$ に対して同型 $\lim_{\mathbf{I}}\lim_{\mathbf{J}}D\cong\lim_{\mathbf{I}\times\mathbf{J}}D\cong\lim_{\mathbf{J}}\lim_{\mathbf{I}}D$ が成り立つ。
    特に、$\mathcal{C}$ は $\mathbf{I}\times\mathbf{J}$ 型極限を持つ。

任意の小圏 $\mathbf{I}$ と $\mathbf{I}$ 型極限(resp. 余極限)を持つ圏を、**完備** (*complete*)  (resp.  **余完備** (*cocomplete*) )という。
また、任意の有限圏 $\mathbf{I}$ と $\mathbf{I}$ 型極限(resp. 余極限)を持つ圏を、**有限完備** (*finite complete*)  (resp.  **余有限完備** (*finite cocomplete*) )という。

Theorem.
:   圏 $\mathcal{C}$ に対して、次がそれぞれ成り立つ:

    - $\mathcal{C}$ が任意の積とイコライザを持つならば、$\mathcal{C}$ は完備である。
    - $\mathcal{C}$ が二項積と終対象とイコライザを持つならば、$\mathcal{C}$ は有限完備である。

函手 $F\colon\mathcal{A}\to\mathcal{B}$ が **$\mathbf{I}$ 上連続** (*continuous of shape $\mathbf{I}$*) であるとは、任意の図式 $D\colon\mathbf{I}\to\mathcal{A}$ に対して、極限の普遍性から導かれる自然な射 $F(\lim{D})\to\lim(F\circ D)$ が同型となるときいう。
また、任意の小圏上で連続な函手を **連続函手** (*continuous functor*) という。
双対的に、**$\mathbf{I}$ 上連続** (*cocontinuous of shape $\mathbf{I}$*) と **余連続函手** (*cocontinuous functor*) が定義される。

Theorem. **表現可能函手は極限を保存する**
:   局所小圏 $\mathcal{A}$ と $A\in\mathcal{A}$ に対して、函手 $\mathcal{A}(A,-)\colon\mathcal{A}\to\mathsf{Set}$ は連続である。

Theorem. **随伴は極限および余極限を保つ**
:   函手の組 $\mathcal{A}\xrightleftarrows[G]{F}\mathcal{B}$ が随伴 $F\dashv G$ であるとき、$F$ は余連続、$G$ は連続である。

Theorem. **一般随伴関手定理**
:   $\mathcal{C}$ が局所小かつ完備な圏であるとき、函手 $F\colon\mathcal{C}\to\mathcal{D}$ が左随伴を持つ必要十分条件は、$F$ が連続函手であって以下の条件を満たすことである。

    - **開集合条件**: 各対象 $D\in\mathcal{D}$ に対して、ある集合 $I$ とそれを添字とする射の族 $(f_i\colon D\to F(C_i))_{i\in I}$ が存在して、すべての射 $h\colon D\to GC$ はある $i\in I$ , $t\colon C_i\to C$ により $h=Gt\circ f_i$ と分解される。

---

#### 重み付き極限の定義

極限および余極限は、対角函手 $\Delta$ により特徴付けることができる。ここで、対角函手
$$
\Delta\colon\mathcal{C}\to[\mathbf{I},\mathcal{C}]
$$
とは、次のように構成される函手である:

- $\mathcal{C}$ の対象 $X$ に対して、函手 $\Delta(X)\colon\mathbf{I}\to\mathcal{C}$ は常に $X$ の値をとる定値函手である:
  - $\mathbf{I}$ の対象 $A$ に対して、$\Delta(X)(A)\coloneqq X$ ,
  - $\mathbf{I}$ の射 $f\colon A\to B$ に対して、$\Delta(X)(f)\coloneqq\operatorname{id}_X$ .
- $\mathcal{C}$ の射 $p\colon X\to Y$ に対して、自然変換 $\Delta(p)\colon\Delta(X)\implies\Delta(Y)$ は、$\mathbf{I}$ の対象 $A$ に対して、$\Delta(p)_A\coloneqq p$ である。

対角函手により、極限と余極限の定義は次の形に言い直すことができる:

- $F\colon\mathbf{I}\to\mathcal{C}$ の極限は $\Delta$ から $F$ への普遍射のことである。
- $F\colon\mathbf{I}\to\mathcal{C}$ の余極限は $F$ から $\Delta$ への普遍射のことである。

この特徴付けにより、極限をより一般化することができる。

図式 $F\colon\mathbf{I}\to\mathcal{C}$ の極限 $\lim{F}$ は同型
$$
\mathcal{C}(-,\lim{F})
\cong\lim\mathcal{C}(-,F)
\cong\mathsf{Set}(\operatorname{pt},\lim\mathcal{C}(-,F))
\cong[\mathbf{I},\mathsf{Set}](\Delta\operatorname{pt},\mathcal{C}(-,F))
$$
により、函手 $[\mathbf{I},\mathsf{Set}](\Delta\operatorname{pt},\mathcal{C}(-,F))$ の表現として特徴付けれるため、$\Delta\operatorname{pt}\colon\mathbf{I}\to\mathsf{Set}$ を一般の函手 $W\colon\mathbf{I}\to\mathsf{Set}$ とすることで、極限の定義を一般化することができる。

Definition.
:   函手 $W\colon\mathbf{I}\to\mathsf{Set}$ , $F\colon\mathbf{I}\to\mathcal{C}$ に対して、各 $a\in\mathcal{C}$ で函手
    $$
    [\mathbf{I},\mathsf{Set}](W,\mathcal{C}(a,T{-}))\colon\mathcal{C}\to\mathsf{Set}
    $$
    が表現可能なとき、これを表現する対象を **$W$ に関する $F$ 上の重み付き極限** (*weighted limit over a functor $F$ with respect to a weight $W$*) といい、$\operatorname{lim}^WF$ と表す。
    すなわち、$a\in\mathcal{C}$ について次の自然な同型が存在する:
    $$
    [\mathbf{I},\mathsf{Set}](W,\mathcal{C}(a,T{-}))\cong\mathcal{C}(a,\operatorname{lim}^WF)
    $$

他方、余極限についても同様の操作により重み付き余極限の定義を得ることができる。

図式 $F\colon\mathbf{I}\to\mathcal{C}$ の余極限 $\operatorname*{colim}{F}$ は同型
$$
\mathcal{C}(\operatorname*{colim}{F},{-})
\cong\lim\mathcal{C}(F,{-})
\cong\mathsf{Set}(\operatorname{pt},\lim\mathcal{C}(F,{-}))
\cong[\mathbf{I},\mathsf{Set}](\Delta\operatorname{pt},\mathcal{C}(F,{-}))
$$
により、函手 $[\mathbf{I},\mathsf{Set}](\Delta\operatorname{pt},\mathcal{C}(F,{-}))$ の表現として特徴付けれるため、$\Delta\operatorname{pt}\colon\mathbf{I}\to\mathsf{Set}$ を一般の函手 $W\colon\mathbf{I}\to\mathsf{Set}$ とすることで、余極限の定義を一般化することができる。

Definition.
:   函手 $W\colon\mathbf{I}^{\textrm{op}}\to\mathsf{Set}$ , $F\colon\mathbf{I}\to\mathcal{C}$ に対して、各 $a\in\mathcal{C}$ で函手
    $$
    [\mathbf{I}^{\textrm{op}},\mathsf{Set}](W,\mathcal{C}(T{-},a))\colon\mathcal{C}^{\textrm{op}}\to\mathsf{Set}
    $$
    が表現可能なとき、これを表現する対象を **$W$ に関する $F$ 上の重み付き余極限** (*weighted colimit over a functor $F$ with respect to a weight $W$*) といい、$\operatorname{colim}^WF$ と表す。
    すなわち、$a\in\mathcal{C}$ について次の自然な同型が存在する:
    $$
    [\mathbf{I}^{\textrm{op}},\mathsf{Set}](W,\mathcal{C}(T{-},a))\cong\mathcal{C}(\operatorname{colim}^WF,a)
    $$

エンドおよびコエンドは、重み付き極限および重み付き余極限により表現することができる。

Theorem.
:   $F\colon\mathcal{C}^{\textrm{op}}\times\mathcal{C}\to\mathcal{D}$ について次の自然な同型が存在する:
    $$
    \int_{C}F(C,C)\cong\operatorname{lim}^{\operatorname{Hom}_\mathcal{C}}F
    ,\quad
    \int^{C}F(C,C)\cong\operatorname{colim}^{\operatorname{Hom}_{\mathcal{C}^{\textrm{op}}}}F
    $$

---

### Kan拡張

**Kan拡張** (*Kan extension*) は、圏論における一般的な拡張の概念で、函手をある圏から別の圏へ **最も自然な方法** で延長するための枠組みである。Kan拡張を考えることで、ある圏から他の圏へ写す函手が、どのようにして元の圏の情報を保持しつつ、より大きな圏に広がるかを捉えることができる。
Kan拡張は、**ある範囲で定義された構造をどのように拡張できるか** という問題を解決するための道具でもある。数学では、元の対象や構造を保ちながら新たな設定に適応させたい場面が多く、このときKan拡張を用いることで **最適な拡張** や **普遍的な拡張** を実現できる。Kan拡張には **左Kan拡張** と **右Kan拡張** があり、それぞれ異なる性質を持つが、いずれも圏論的な **最も自然な拡張** を提供するものとなっている。

函手 $\mathcal{D}\xleftarrow{F}\mathcal{C}\xrightarrow{E}\mathcal{U}$ に対して、**$F$ に沿った $E$ の左Kan拡張** (*left Kan extension*) とは、函手 $K\colon\mathcal{D}\to\mathcal{U}$ と自然変換 $\eta\colon E\implies K\circ F$ の組 $(K,\eta)$ であって、以下の普遍性を満たすものである:

- 函手 $S\colon\mathcal{D}\to\mathcal{U}$ と自然変換 $\theta\colon E\implies S\circ F$ の組 $(S,\theta)$ に対して、一意的な自然変換 $\tau\colon K\implies S$ が存在して $\theta = \tau_F\circ\eta$ を満たす。即ち次の等式が成り立つ。
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{amsmath,mathrsfs,mathtools}
    \usepackage{tikz}
    \usetikzlibrary{cd, intersections, calc, arrows, arrows.meta, positioning}
    \begin{document}
        \tikz[xscale=2,baseline=(T)]{
            \coordinate (T) at (0,.5);
            \node (C) at (0,0) { $\mathcal{C}$ };
            \node (D) at (0,1) { $\mathcal{D}$ };
            \node (U) at (1,0) { $\mathcal{U}$ };
            \draw[->] (C) to node[scale=.8,auto=left] { $F$ } (D);
            \draw[->] (C) to node[scale=.8,auto=right] { $E$ } (U);
            \draw[->] (D) to node[scale=.8,auto=right] { $K$ } (U);
            \draw[->] (D) to [out=15, in=110] node[scale=.8,auto=left] (S) { $S$ } (U);
            \draw[-{implies},double distance=1.5pt,shorten >=4pt,shorten <=4pt] ( $(C)!.2!(U)$ ) to node[scale=.8,auto=left] { $\eta$ } ( $(D)!.2!(U)$ );
            \draw[-{implies},densely dotted,double distance=1.5pt,shorten >=3pt,shorten <=3pt] ( $(D)!0.4!(U)$ ) to node[scale=.8,auto=right] { $\tau$ } ( $(D)!0.7!(S)$ );
        }
        =
        \tikz[xscale=2,baseline=(T)]{
            \coordinate (T) at (0,.5);
            \node (C) at (0,0) { $\mathcal{C}$ };
            \node (D) at (0,1) { $\mathcal{D}$ };
            \node (U) at (1,0) { $\mathcal{U}$ };
            \draw[->] (C) to node[scale=.8,auto=left] { $F$ } (D);
            \draw[->] (C) to node[scale=.8,auto=right] { $E$ } (U);
            \draw[->] (D) to [out=15, in=110] node[scale=.8,auto=left] (S) { $S$ } (U);
            \draw[-{implies},double distance=1.5pt,shorten >=0pt,shorten <=4pt] ( $(C)!.3!(U)$ ) to node[scale=.8,auto=right] { $\theta$ } ( $(D)!.3!(U)$ );
        }
    \end{document}
    ```

他方、**$F$ に沿った $E$ の右Kan拡張** (*right Kan extension*) とは、函手 $K\colon\mathcal{D}\to\mathcal{U}$ と自然変換 $\varepsilon\colon K\circ F\implies E$ の組 $(K,\eta)$ であって、以下の普遍性を満たすものである:

- 函手 $S\colon\mathcal{D}\to\mathcal{U}$ と自然変換 $\theta\colon S\circ F\implies E$ の組 $(S,\theta)$ に対して、一意的な自然変換 $\tau\colon S\implies K$ が存在して $\theta =\varepsilon\circ\tau_F$ を満たす。

$F$ に沿った $E$ の左Kan拡張により得られる函手を $F^\dagger E$ 、あるいは $\operatorname{Lan}_FE$ と表し、$F$ に沿った $E$ の右Kan拡張により得られる函手を $F^\ddagger E$ 、あるいは $\operatorname{Ran}_FE$ と表す。

函手 $F\colon\mathcal{C}\to\mathcal{D}$ により誘導される函手 ${-}\circ F\colon[\mathcal{D},\mathcal{U}]\to[\mathcal{C},\mathcal{U}]$ と普遍射の定義から、$F$ に沿った $E$ の左Kan拡張は $E\in[\mathcal{C},\mathcal{U}]$ から ${-}\circ F$ への普遍射のことである。
また、$F$ に沿った $E$ の右Kan拡張は ${-}\circ F$ から $E$ への普遍射のことである。

函手 $\mathcal{D}\xleftarrow{F}\mathcal{C}\xrightarrow{E}\mathcal{U}$ について、$\mathcal{C}$ が小圏でかつ $\mathcal{U}$ が余完備なとき、$F$ に沿った $E$ の左Kan拡張 $F^\dagger E$ は各点 $d\in\mathcal{D}$ ごとに以下のように計算できる:
$$
(F^\dagger E)(d)\cong\operatorname*{colim}_{Fx\to d\in(F/d)}E(x)\cong\operatorname{colim}^{\mathcal{D}(F{-},d)}E
$$
このように、Kan拡張が点ごとに計算できることを各点 Kan 拡張という。
双対として、$F$ に沿った $E$ の各点右Kan拡張は次のように計算できる:
$$
(F^\ddagger E)(d)\cong\lim_{d\to Fx\in(d/F)}E(x)\cong\operatorname{lim}^{\mathcal{D}(d,F{-})}E
$$

power objectおよびcopower objectの概念を用いれば、各点Kan拡張はエンド、コエンドで表現できる。

$\mathcal{C}$ を局所小圏とし、$a\in\mathcal{C}$ と $x\in\mathsf{Set}$ について、$x$ から $\mathcal{C}(a,{-})$ への普遍射を $x\to\mathcal{C}(a,a^\prime)$ としたとき $a^\prime$ を $a,x$ の **余冪対象** (*copower object*) といい $x\odot a$ で表す。
他方、$x$ から $\mathcal{C}({-},a)$ への普遍射を $x\to\mathcal{C}(a^\prime,a)$ としたとき $a^\prime$ を $a,x$ の **冪対象** (*power object*) といい、$x\oslash a$ で表す。
すなわち、普遍射の性質より以下の同型が成り立つ:
$$
\mathcal{C}(x\odot a,b)\cong\mathsf{Set}(x,\mathcal{C}(a,b)),\quad
\mathcal{C}(b,x\oslash a)\cong\mathsf{Set}(x,\mathcal{C}(b,a))
$$
このとき、函手 $\mathcal{D}\xleftarrow{F}\mathcal{C}\xrightarrow{E}\mathcal{C}$ に対して
それぞれのKan拡張が存在するときに限り次の同型が成り立つ:
$$
F^\dagger E = \int^{c\in\mathcal{C}}\mathcal{D}(Fc,{-})\odot Ec,\quad F^\ddagger E = \int_{c\in\mathcal{C}}\mathcal{D}({-},Fc)\oslash Ec
$$

特に、$\mathcal{C}=\mathsf{Set}$ のとき $x\odot a=x\times a$ かつ $x\oslash a=\mathsf{Set}(x,a)$ となる。

函手 $F\colon\mathcal{C}^{\textrm{op}}\to\mathsf{Set}$ に対して $F$ と $F$ の $\operatorname{id}_{\mathcal{C}}$ にそった右Kan拡張 $\operatorname{id}_{\mathcal{C}}^\ddagger F$ が同型 $F\cong\operatorname{id}_{\mathcal{C}}^\ddagger F$ であることを用いて米田の補題が証明できるが、$F$ の $\operatorname{id}_{\mathcal{C}}$ にそった左Kan拡張 $\operatorname{id}_{\mathcal{C}}^\dagger F$ も $F$ と同型であることを用いると、次の **余米田の補題** が得られる。

Theorem. **余米田の補題** (*co-Yoneda lemma*)
:   函手 $F\colon\mathcal{C}^{\textrm{op}}\to\mathsf{Set}$ に対して自然同型 $F\cong \int^{a\in\mathcal{C}}\mathcal{y}_{\mathcal{C}}(a)\times Fa$ が存在する。
