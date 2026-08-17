## 圏論の基本事項

### 圏の定義

Definition. **圏** (*Category*)
:   $\mathcal{A}$ とは、以下のデータからなる:

    - $\mathcal{A}$ の対象の集まり $\operatorname{Ob}\mathcal{A}$;
    - 各 $A,B\in\operatorname{Ob}\mathcal{A}$ について、$A$ から $B$ への射あるいは矢印の集まり $\mathcal{A}(A,B)$;
    - 各 $A,B,C\in\operatorname{Ob}\mathcal{A}$ について、合成と呼ばれる写像 $\circ\colon\mathcal{A}(B,C)\times\mathcal{A}(A,B)\to\mathcal{A}(A,C)$;
    - 各 $A\in\operatorname{Ob}\mathcal{A}$ について、$A$ 上の恒等射と呼ばれる $\mathcal{A}(A,A)$ の元 $\operatorname{id}_A$;

    これらのデータは以下の2つの公理を満たすものである:

    - **結合律**: 任意の射 $f\colon A\to B$ , $g\colon B\to C$ , $h\colon C\to D$ に対して, $(h\circ g)\circ f=h\circ(g\circ f)$ が成り立つ;
    - **単位律**: 各 $A\in\operatorname{Ob}\mathcal{A}$ について、$A$ 上の恒等射と呼ばれる $\mathcal{A}(A,A)$ の元 $\operatorname{id}_A$;

    $A\in\operatorname{Ob}\mathcal{A}$ であるとき $A$ は $\mathcal{A}$ の対象であるといい、$A\in\mathcal{A}$ と表す。 $f\in\mathcal{A}(A,B)$ であるとき $f$ は $A$ から $B$ への射であるといい、$f\colon A\to B$ あるいは $A\xrightarrow{f}B$ と表す。

圏に対して、すべての対象の集まりとすべての射の集まりがともに集合となる(すなわち真のクラスとならない)とき、その圏は **小さい圏** あるいは **小圏** (*small category*) という。
また、各対象 $A,B$ に対して射の集まり $\operatorname{Hom}(A,B)$ が集合となるとき、その圏は **局所小圏** (*locally small category* )であるという。

圏 $\mathcal{A}$ について、$\mathcal{A}$ の **部分圏** (*subcategory*) とは圏であって対象の集まりが $\operatorname{Ob}\mathcal{A}$ の部分クラスかつ、各対象 $A,B$ の射の集まりも $\mathcal{A}(A,B)$ の部分クラスになっており、恒等射や射の合成が $\mathcal{A}$ と一致しているものである。
特に、射の集まりが $\mathcal{A}$ のそれと一致している場合、その部分圏を **充満部分圏** (*full subcategory*) という。

圏 $\mathcal{A}$ の対象 $A,A^\prime$ について、$gf=\operatorname{id}_A$ かつ $fg=\operatorname{id}_{A^\prime}$ を満たすような射 $f\colon A\to A^\prime$ , $g\colon A^\prime\to A$ が存在するとき、$A, A^\prime$ は $\mathcal{A}$ において **同型** (*isomorphic*) であるといい、$f$ および $g$ を **同型射** (*isomorphism*) という。

圏 $\mathcal{A}$ の対象 $I\in\mathcal{A}$ について、任意の対象 $X\in\mathcal{A}$ に対して唯一つの射 $I\to X$ が存在するとき、$I$ は $\mathcal{A}$ における **始対象** (*initial object*) であるという。
他方、対象 $T\in\mathcal{A}$ について、任意の対象 $X$ に対して唯一つの射 $X\to T$ が存在するとき、$T$ は $\mathcal{A}$ における **終対象** (*terminal object*) であるという。
特に、始対象かつ終対象な対象を **零対象** (*zero object*) といい、零対象を持つ圏を **点付き圏** (*pointed category*) と呼ぶ。
圏 $\mathcal{A}$ の双対圏 $\mathcal{A}^{\textrm{op}}$ とは、$\mathcal{A}$ と同じ対象を持つ圏であって、各対象 $A,B\in\mathcal{A}$ に対して $\mathcal{A}^{\textrm{op}}(A,B)=\mathcal{A}(B,A)$ となるようなものである。

2つの圏 $\mathcal{A},\mathcal{B}$ に対して、$\mathcal{A}$ と $\mathcal{B}$ の **直積圏** (*product category*) $\mathcal{A}\times\mathcal{B}$ とは、直積 $\operatorname{Ob}\mathcal{A}\times\operatorname{Ob}\mathcal{B}$ の各元を対象とし、射 $(A,B)\to(A^\prime,B^\prime)$ を、$\mathcal{A}$ と $\mathcal{B}$ のそれぞれの射の組 $(A\to A^\prime,B\to B^\prime)$ とする圏である。
他方、$\mathcal{A}$ と $\mathcal{B}$ の **直和圏** (*coproduct category*) $\mathcal{A}+\mathcal{B}$ とは、直和 $\operatorname{Ob}\mathcal{A}+\operatorname{Ob}\mathcal{B}$ の各元を対象とし、射 $X\to X^\prime$ は $X,X^\prime$ がともに $\mathcal{A}$ と $\mathcal{B}$ のどちらか一方の圏の対象であるときに限り定まり、射の集まりがちょうど $\mathcal{A}(X,X^\prime)$ あるいは $\mathcal{B}(X,X^\prime)$ のいずれかに等しくなる。

以下は圏の例である。

| 圏 | 対象 | 射 | 合成 |
| --- | --- | --- | --- |
| 半順序集合 $(X,\leq)$ | 集合 $X$ の点 | 順序関係 | 推移律 |
| 集合の圏 $\mathsf{Set}$ | 集合 | 写像 | 写像の合成 |
| 点付き集合の圏 $\mathsf{Set}_{\ast}$ | 基点と集合の組 | 基点を保つ写像 | 写像の合成 |
| 群の圏 $\mathsf{Grp}$ | 群 | 群準同型 | 写像の合成 |
| Abel群の圏 $\mathsf{Abel}$ | Abel群 | 群準同型 | 写像の合成 |
| 環の圏 $\mathsf{Ring}$ | 環 | 環準同型 | 写像の合成 |
| 可換環 $R$ 上の加群の圏 $R\text{-}\mathsf{Mod}$ | 可換環 $R$ 上の加群 | 加群準同型 | 写像の合成 |
| 体 $k$ 上の線形空間の圏 $\mathsf{Vect}_k$ | 体 $k$ 上の線形空間 | 線形写像 | 写像の合成 |
| 位相空間の圏 $\mathsf{Top}$ | 位相空間 | 連続写像 | 写像の合成 |
| 関係の圏 $\mathsf{Rel}$ | 集合 | 二項関係 | 関係の合成 |
| ホモトピー圏 $\mathsf{Ho(Top)}$ | 位相空間 | ホモトピー類 | ホモトピーの合成 |
| 函手圏 $[\mathcal{C},\mathcal{D}]$ | 圏 $\mathcal{C}$ から $\mathcal{D}$ への函手 | 自然変換 | 自然変換の合成 |
| 位相空間 $X$ 上の前層圏 $\mathsf{PSh}(X)$ | 開集合上の前層 | 前層の射(自然変換) | 自然変換の合成 |
| quasi-pseudometric space $(X,d)$ | 空間 $X$ の点 | 拡張正実数 $t\geq d(x,y)$ | 実数の加法 |
| 位相空間 $X$ | 空間 $X$ の点 | 道(path) | 道の連結 |

---

### 函手と自然変換

**函手** とは、圏論において、ある圏から別の圏への対応関係を定めるものである。圏論では、数学のさまざまな構造を抽象的に扱うため、異なる圏同士の関係を理解する必要がある。そのため、**函手** を考えることで、圏の間の対応を体系的に示し、構造を保ちながら対象と射を移すことができる。

Definition. **函手** (*Functor*)
:   圏 $\mathcal{A}$ , $\mathcal{B}$ に対して、$\mathcal{A}$ から $\mathcal{B}$ への **共変函手** (*covariant functor*) $F\colon\mathcal{A}\to\mathcal{B}$ とは、以下のデータからなる:

    - 写像 $\operatorname{Ob}{F}\colon\operatorname{Ob}\mathcal{A}\to\operatorname{Ob}\mathcal{B}$;
    - 各 $A,A^\prime\in\mathcal{A}$ に対して写像 $F_{A,A^\prime}\colon\mathcal{A}(A,A^\prime)\to\mathcal{B}(FA,FA^\prime)$;

    これらのデータは以下の2つの公理を満たすものである:

    - **合成を保つ**: $\mathcal{A}$ の射の列 $A\xrightarrow{f}A^\prime\xrightarrow{f^\prime}A^{\prime\prime}$ に対して $F(f^\prime\circ f)= F(f^\prime)\circ F(f)$;
    - **単位射を保つ**: $\mathcal{A}$ の単位射 $\operatorname{Ob}_A$ に対して $F(\operatorname{Ob}_A)=\operatorname{Ob}_{FA}$;

    また、$\mathcal{A}^{\textrm{op}}$ から $\mathcal{B}$ への共変函手を **反変函手** (*contravariant functor*) という。

    $\operatorname{Ob}{F}(A)$ を $F(A)$ 、あるいは $FA$ と略す。 $F_{A,A^\prime}(f)$ を $F(f)$ 、あるいは $Ff$ と略す。

対象の間の写像の合成と、射対象の間の写像の合成によって函手の合成が得られる:
$$
\operatorname{Ob}(GF)\coloneqq\operatorname{Ob}{G}\circ\operatorname{Ob}{F},\quad
(GF)_{AA^\prime}\coloneqq G_{FA,FA^\prime}\circ F_{AA^\prime}
$$
定義から、函手の合成が結合的であることは明らかである。
また、対象の間の恒等写像と射の間の恒等写像からなる恒等函手はこの合成において単位的である。

2つの圏 $\mathcal{A},\mathcal{B}$ に対して、函手の組 $\mathcal{A}\xrightleftarrows[G]{F}\mathcal{B}$ として $GF=\operatorname{Ob}_{\mathcal{A}}$ かつ $FG=\operatorname{Ob}_{\mathcal{B}}$ を満たすものが存在するとき、$\mathcal{A}$ と $\mathcal{B}$ は **圏同型** (*isomorphism of categories*) という。

函手 $F\colon\mathcal{A}\to\mathcal{B}$ について、各 $F_{AA^\prime}\colon\mathcal{A}(A,A^\prime)\to\mathcal{B}(FA,FA^\prime)$ が単射(resp. 全射)であるとき $F$ を **忠実函手** (*faithful functor*) (resp.  **充満函手** (*full functor*) )という。
特に、充満かつ忠実な函手を **充満忠実** (*fully faithful*) という。
他方、$F$ について任意の $b\in\mathcal{B}$ に対して同型 $Fa\cong b$ が成り立つような $a\in\mathcal{A}$ が存在するとき、$F$ は **本質的全射** (*essentially surjective*) という。
事実として、本質的全射かつ充満忠実であれば圏同型となる。

**自然変換** とは、二つの函手がどのように異なる圏間で **一致** しているかを示す概念である。函手は圏同士を対応させるものだが、複数の函手が同じ圏から別の圏へ対応する場合、それらの函手がどれほど似ているかを示す方法が必要になる。自然変換は、そのような **違いの具合** を形式的に捉えるために考えられる。

Definition. **自然変換** (*Natural Transformation*)
:    函手 $F,G\colon\mathcal{A}\to\mathcal{B}$ に対して、**$F$ から $G$ への自然変換** (*natural transformation from $F$ to $G$*) $\alpha\colon F\Rightarrow G$ とは、$\operatorname{Ob}\mathcal{A}$ で添字付けられた $\mathcal{B}$ の射の族 $\left(FA\xrightarrow{\alpha_A}GA\right)_{A\in\mathcal{A}}$ であって, $\mathcal{A}$ の各射 $f\colon A\to A^\prime$ について、等式 $Gf\circ\alpha_A=\alpha_{A^\prime}\circ Ff$ が成り立つ。射 $\alpha_A$ を $\alpha$ の $A$ における成分と呼ぶ。

自然変換の合成として、垂直合成と水平合成の二種類がある。

Definition. **垂直合成** (*Vertical Composition*)
:    自然変換の列 $F\xRightarrow{\alpha}F^\prime\xRightarrow{\beta}F^{\prime\prime}\colon\mathcal{A}\to\mathcal{B}$ に対して、$\alpha$ と $\beta$ の **垂直合成** (*Vertical Composition*) $\beta\circ\alpha$ とは、$A\in\mathcal{A}$ における成分が $\beta_A\circ\alpha_A$ で与えられる自然変換である。

Definition. **水平合成** (*Horizontal Composition*)
:   自然変換の列
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools}
    \usepackage{tikz}
    \usetikzlibrary{cd, intersections, calc, arrows, arrows.meta, positioning}
    \begin{document}
        \tikz[baseline=(A.base),xscale=2,yscale=1.5]{
            \node (A) at (0,0) { $\mathcal{A}$ };
            \node (B) at (1,0) { $\mathcal{B}$ };
            \node (C) at (2,0) { $\mathcal{C}$ };
            \draw[->] (A) to [bend left] node[scale=.8,auto=left] (P) { $F$ } (B);
            \draw[->] (A) to [bend right] node[scale=.8,auto=right] (Q){ $F^\prime$ } (B);
            \draw[->] (B) to [bend left] node[scale=.8,auto=left] (X) { $G$ } (C);
            \draw[->] (B) to [bend right] node[scale=.8,auto=right] (Y) { $G^\prime$ } (C);
            \draw[-{implies},double distance=1.5pt,shorten >=2pt,shorten <=2pt] (P) to node[scale=.8,auto=left] { $\alpha$ } (Q);
            \draw[-{implies},double distance=1.5pt,shorten >=2pt,shorten <=2pt] (X) to node[scale=.8,auto=left] { $\beta$ } (Y);
        }
    \end{document}
    ```
    に対して、$\alpha$ と $\beta$ の **水平合成** (*Horizontal Composition*) とは、$A\in\mathcal{A}$ における成分が $\beta_{F^\prime A}\circ G\alpha_A=G^\prime\beta_A\circ\alpha_{FA}$ で与えられる自然変換である。

自然変換の垂直合成を合成操作とすることで、函手 $\mathcal{A}\to\mathcal{B}$ を対象に持ちその間の自然変換を射として圏が構成できる。
これを **$\mathcal{A}$ から $\mathcal{B}$ への函手圏** と呼び、$[\mathcal{A},\mathcal{B}]$ と表す。

 $[\mathcal{A},\mathcal{B}]$ における同型を **自然同型** (*natural isomorphism*) と呼び、函手 $F,G\colon\mathcal{A}\to\mathcal{B}$ が自然同型なとき、**$A\in\mathcal{A}$ について自然に $FA\cong GA$ である** という。
2つの圏 $\mathcal{A},\mathcal{B}$ に対して、函手の組 $\mathcal{A}\xrightleftarrows[G]{F}\mathcal{B}$ と自然同型 $\eta\colon\operatorname{Ob}_{\mathcal{A}}\to GF$ , $\varepsilon\colon FG\to\operatorname{Ob}_{\mathcal{B}}$ が存在するとき、$\mathcal{A}$ と $\mathcal{B}$ は **圏同値** (*equivalence of categories*) であるといい、$\mathcal{A}\simeq\mathcal{B}$ と表す。
