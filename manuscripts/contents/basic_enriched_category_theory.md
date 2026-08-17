## 豊穣圏の基本事項

### 定義

Definition. モノイダル圏上の豊穣圏
:   $\mathfrak{M}$ をモノイダル圏とする。
    $\mathcal{A}$ が **$\mathfrak{M}$ 上の豊穣圏** (*enriched category over $\mathfrak{M}$*)、あるいは単に **$\mathfrak{M}$-圏** (*$\mathfrak{M}$-category*) とは、以下のデータからなる:

    - 対象の集まり $\operatorname{Ob}\mathcal{A}$;
    - 各対象 $a,b\in\operatorname{Ob}\mathcal{A}$ に対して $\mathfrak{M}$ の対象 $\mathcal{A}(a,b)\in\mathfrak{M}$;
    - 各対象 $a\in\operatorname{Ob}\mathcal{A}$ に対して $\mathfrak{M}$ の射 $\operatorname{id}_a\colon I\to\mathcal{A}(a,a)$;
    - 各対象 $a,b,c\in\operatorname{Ob}\mathcal{A}$ に対して $\mathfrak{M}$ の射 $(\otimes_{\mathcal{A}})_{ac}^{b}\colon\mathcal{A}(b,c)\otimes_{\mathfrak{M}}\mathcal{A}(a,b)\to\mathcal{A}(a,c)$;

    これらのデータは以下の公理をそれぞれ満たす:

    - **結合律**: 各 $a,b,c,d\in\mathcal{A}$ に対して、以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[xscale=3]
            \node (AC) at (0,2) { $(\mathcal{A}(c,d)\otimes\mathcal{A}(b,c))\otimes\mathcal{A}(a,b)$ };
            \node (CC) at (2,2) { $\mathcal{A}(c,d)\otimes(\mathcal{A}(b,c)\otimes\mathcal{A}(a,b))$ };
            \node (AB) at (0,1) { $\mathcal{A}(b,d)\otimes\mathcal{A}(a,b)$ };
            \node (CB) at (2,1) { $\mathcal{A}(c,d)\otimes\mathcal{A}(a,c)$ };
            \node (BA) at (1,0) { $\mathcal{A}(a,c)$ };
            \draw[->] (AC) to node[scale=.8,auto=left] { $\alpha$ } (CC);
            \draw[->] (AC) to node[scale=.8,auto=right] { $(\otimes_{\mathcal{A}})_{bd}^{c}\otimes\mathcal{A}(a,b)$ } (AB);
            \draw[->] (CC) to node[scale=.8,auto=left] { $\mathcal{A}(c,d)\otimes(\otimes_{\mathcal{A}})_{ac}^{b}$ } (CB);
            \draw[->] (AB) to node[scale=.8,auto=right] { $(\otimes_{\mathcal{A}})_{ad}^{b}$ } (BA);
            \draw[->] (CB) to node[scale=.8,auto=left] { $(\otimes_{\mathcal{A}})_{ad}^{c}$ } (BA);
        \end{tikzpicture}
    \end{document}
    ```
    - **単位律**: 各 $a,b\in\mathcal{A}$ に対して、以下の図式がそれぞれ可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[xscale=2]
            \node (AB) at (0,1) { $I\otimes\mathcal{A}(a,b)$ };
            \node (CB) at (2,1) { $\mathcal{A}(a,b)$ };
            \node (BA) at (1,0) { $\mathcal{A}(b,b)\otimes\mathcal{A}(a,b)$ };
            \draw[->] (AB) to node[scale=.8,auto=left] { $\lambda$ } (CB);
            \draw[->] (AB) to node[scale=.8,auto=right,pos=0.3] { $\operatorname{id}_b\otimes\mathcal{A}(a,b)$ } (BA);
            \draw[->] (BA) to node[scale=.8,auto=right,pos=.7] { $(\otimes_{\mathcal{A}})_{ab}^{b}$ } (CB);
        \end{tikzpicture}
        \quad
        \begin{tikzpicture}[xscale=2]
            \node (AB) at (0,1) { $\mathcal{A}(a,b)\otimes I$ };
            \node (CB) at (2,1) { $\mathcal{A}(a,b)$ };
            \node (BA) at (1,0) { $\mathcal{A}(a,b)\otimes\mathcal{A}(a,a)$ };
            \draw[->] (AB) to node[scale=.8,auto=left] { $\rho$ } (CB);
            \draw[->] (AB) to node[scale=.8,auto=right,pos=0.3] { $\mathcal{A}(a,b)\otimes\operatorname{id}_a$ } (BA);
            \draw[->] (BA) to node[scale=.8,auto=right,pos=.7] { $(\otimes_{\mathcal{A}})_{ab}^{a}$ } (CB);
        \end{tikzpicture}
    \end{document}
    ```

$\mathfrak{M}$-圏に対して、対象の集まりがともに集合となるとき、その圏は **小さい**、あるいは **小圏** (*small category*) という。

$\mathfrak{M}$-圏 $\mathcal{A}$ の **下部圏** (*underlying category*) とは、通常の圏であって $\mathcal{A}$ と同じ対象を持つが、射の集まり $\hom(a,b)$ が $\mathfrak{M}(I,\mathcal{A}(a,b))$ で定義されるような圏である。

以下は豊穣圏の例である。

| 豊穣圏 | モノイダル圏 | テンソル積 |
| --- | --- | --- |
| モノイドを離散圏とみなしたもの | 積 | 単位元 |
| 最大元を持つ交わり半束 | 交わり | 最大元 |
| 集合の圏 $\mathsf{Set}$ | 直積 | 単集合 |
| 位相空間の圏 $\mathsf{Top}$ | 直積 | 単集合 |
| 可換環 $R$ 上の加群の圏 $R\text{-}\mathsf{Mod}$ | 加群のテンソル積 | $R$ |
| 体 $k$ 上の線形空間の圏 $\mathsf{Vect}_k$ | テンソル積 | $k$ |
| Abel群の圏 $\mathsf{Abel}$ | Abel群のテンソル積 | $\mathbb{Z}$ |
| 圏 $\mathcal{C}$ 上の自己函手のなす圏 $\operatorname{End}{\mathcal{C}}$ | 函手の合成 | $\operatorname{id}_{\mathcal{C}}$ |
| 点付き位相空間の圏 $\mathsf{Top}_{\ast}$ | スマッシュ積 | 点付き0-次元球面 |
| 有限積を持つ圏 | 積 | 終対象 |

---

### 函手と自然変換

圏の間の函手の定義は、自然に豊穣圏の間の函手に拡張される。

Definition. 豊穣函手
:   $\mathfrak{M}$-圏 $\mathcal{A}$, $\mathcal{B}$ に対して、$\mathcal{A}$ から $\mathcal{B}$ への **豊穣函手** (*enriched functor*)、あるいは $\mathfrak{M}$-函手 $F\colon\mathcal{A}\to\mathcal{B}$ とは、以下のデータからなる:
    
    - 対象の間の写像 $\operatorname{Ob}{F}\colon\operatorname{Ob}\mathcal{A}\to\operatorname{Ob}\mathcal{B}$  ( $\operatorname{Ob}{F}$ の $A\in\mathcal{A}$ における値を $F(A)$ あるいは $FA$ と表す);
    - 各 $A,A^\prime\in\mathcal{A}$ について、射対象の間の $\mathfrak{M}$ の射 $F_{A,A^\prime}\colon\mathcal{A}(A,A^\prime)\to\mathcal{B}(FA,FA^\prime)$  ( $F_{A,A^\prime}$ の $f\colon A\to A^\prime$ における値を $F(f)$ あるいは $Ff$ と表す);

    これらのデータは以下の2つの公理を満たすものである:
    
    - **合成を保つ**: 各 $a,b,c\in\mathcal{A}$ に対して、以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \usetikzlibrary{arrows,arrows.meta,positioning,calc}
    \begin{document}
            \begin{tikzpicture}[xscale=5]
                \node (AA) at (0,0) { $\mathcal{A}(a,c)$ };
                \node (AB) at (0,1) { $\mathcal{A}(b,c)\otimes\mathcal{A}(a,b)$ };
                \node (BA) at (1,0) { $\mathcal{B}(Fa,Fc)$ };
                \node (BB) at (1,1) { $\mathcal{B}(Fb,Fc)\otimes\mathcal{B}(Fa,Fb)$ };
                \draw[->] (AB) to node[scale=.8,auto=right] { $(\otimes_{\mathcal{A}})_{ac}^b$ } (AA);
                \draw[->] (BB) to node[scale=.8,auto=left] { $(\otimes_{\mathcal{B}})_{Fa,Fc}^{Fb}$ } (BA);
                \draw[->] (AB) to node[scale=.8,auto=left] { $F_{bc}\otimes F_{ab}$ } (BB);
                \draw[->] (AA) to node[scale=.8,auto=left] { $F_{ac}$ } (BA);
            \end{tikzpicture}
    \end{document}
    ```
    - **恒等射を保つ**: 各 $a\in\mathcal{A}$ に対して、以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \usetikzlibrary{arrows,arrows.meta,positioning,calc}
    \begin{document}
            \begin{tikzpicture}[xscale=2]
                \node (AB) at (0,1) { $I$ };
                \node (BB) at (1,1) { $\mathcal{A}(a,a)$ };
                \node (BA) at (1,0) { $\mathcal{B}(Fa,Fa)$ };
                \draw[->] (AB) to node[scale=.8,auto=left] { $\operatorname{id}_a$ } (BB);
                \draw[->] (AB) to node[scale=.8,auto=right] { $\operatorname{id}_{Fa}$ } (BA);
                \draw[->] (BB) to node[scale=.8,auto=left] { $F_{aa}$ } (BA);
            \end{tikzpicture}
    \end{document}
    ```

函手の合成とは、対象の間の写像の合成と、射対象の間の写像の合成によって得られる。

$\mathfrak{M}$-函手は、下部圏の間の函手を誘導する。ただし、下部圏の函手が常に豊穣函手へ持ち上がるとは限らず、射対象の構造を保つ射 $F_{a,b}$ が別途必要である。

自然変換も同様にして定義できる。

Definition. 豊穣自然変換
:   $\mathcal{A}$, $\mathcal{B}$ を $\mathfrak{M}$-圏、$F,G\colon\mathcal{A}\to\mathcal{B}$ を $\mathfrak{M}$-函手とする。
    このとき、$\mathfrak{M}$-自然変換 $\theta\colon F\Rightarrow G$ とは、$\mathfrak{M}$ の射の族 $\left(I\xrightarrow{\theta_a}\mathcal{B}(Fa,Ga)\right)_{a\in\mathcal{A}}$ であって、次の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \usetikzlibrary{arrows,arrows.meta,positioning,calc}
    \begin{document}
        \begin{tikzpicture}[xscale=2]
            \node (AB) at (0,1) { $\mathcal{A}(a,b)$ };
            \node (BA) at (.5,0) { $\mathcal{A}(a,b)\otimes I$ };
            \node (BC) at (.5,2) { $I\otimes\mathcal{A}(a,b)$ };
            \node (CA) at (2.5,0) { $\mathcal{B}(Ga,Gb)\otimes\mathcal{B}(Fa,Ga)$ };
            \node (CC) at (2.5,2) { $\mathcal{B}(Fb,Gb)\otimes\mathcal{B}(Fa,Fb)$ };
            \node (DB) at (3,1) { $\mathcal{B}(Fa,Gb)$ };
            \draw[->] (AB) to node[scale=.8,auto=right,pos=.2] { $\rho^{-1}$ } (BA);
            \draw[->] (AB) to node[scale=.8,auto=left,pos=.2] { $\lambda^{-1}$ } (BC);
            \draw[->] (BA) to node[scale=.8,auto=right] { $G_{ab}\otimes\theta_a$ } (CA);
            \draw[->] (BC) to node[scale=.8,auto=left] { $\theta_b\otimes F_{ab}$ } (CC);
            \draw[->] (CA) to node[scale=.8,auto=right,pos=.8] {comp.} (DB);
            \draw[->] (CC) to node[scale=.8,auto=left,pos=.8] {comp.} (DB);
        \end{tikzpicture}
    \end{document}
    ```

通常の圏論と同様にして、$\mathfrak{M}$-圏 $\mathcal{C},\mathcal{D}$ の間の函手圏を $\operatorname{Func}(\mathcal{C},\mathcal{D})$ とする。

---

### 加群射と函手圏

$\mathfrak{M},\mathfrak{N}$ をモノイダル圏とする。

圏 $C$ 上の **$(\mathfrak{M},\mathfrak{N})$-作用** とは、強モノイダル函手 $\varphi\colon\mathfrak{N}^{\mathrm{rev}}\times\mathfrak{M}\to\operatorname{End}{C}$ のことである。
このとき、圏 $C$ と作用 $\varphi$ の組 $(C,\varphi)$ を $(\mathfrak{M},\mathfrak{N})$-加群という。

特に、単位的な弱2-圏を $\boldsymbol{1}$ としたとき、$(\boldsymbol{1},\mathfrak{M})$-作用を右 $\mathfrak{M}$ 作用と呼び、$(\mathfrak{M},\boldsymbol{1})$-作用を左 $\mathfrak{M}$ 作用と呼ぶ。

$(\mathfrak{M},\mathfrak{N})$-加群 $\mathcal{C}=(C,\varphi)$ に対して、$v\in\mathfrak{M},w\in\mathfrak{N},a\in M$ に対して $\varphi(w,v)(a)$ を $v\odot a\odot w$ と表す.

$(\mathfrak{M},\mathfrak{N})$-加群 $\mathcal{C},\mathcal{D}$ の間の **加群射** (*module morphism*) とは、函手 $F\colon\mathcal{C}\to\mathcal{D}$ であって、以下の図式が可換となる:

```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools,amssymb}
\usepackage{tikz}
\usetikzlibrary{arrows,arrows.meta,positioning,calc}
\begin{document}
    \begin{tikzpicture}[xscale=4]
        \node (AA) at (0,0) { $\operatorname{End}\mathcal{D}$ };
        \node (AB) at (0,1) { $\mathfrak{N}^{\mathrm{rev}}\times\mathfrak{M}$ };
        \node (BA) at (1,0) { $\operatorname{Func}(\mathcal{C},\mathcal{D})$ };
        \node (BB) at (1,1) { $\operatorname{End}\mathcal{C}$ };
        \draw[->] (AB) to node[scale=.8,auto=left] { $\mathcal{C}$-action} (BB);
        \draw[->] (AB) to node[scale=.8,auto=right] { $\mathcal{D}$-action} (AA);
        \draw[->] (AA) to node[scale=.8,auto=left] { $(-)\circ F$ } (BA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $F\circ(-)$ } (BA);
    \end{tikzpicture}
\end{document}
```

$(\mathfrak{M},\mathfrak{N})$-加群とその間の加群射からなる圏を $\operatorname{Mod}(\mathfrak{M},\mathfrak{N})$ とする.


Definition. **加群上の豊穣函手**
:   $\mathfrak{M}$-圏 $\mathcal{J}$ から左 $\mathfrak{M}$-加群 $C$ への $\mathfrak{M}$-函手とは、以下のデータからなる:
    - 写像 $\operatorname{Ob}{F}\colon\operatorname{Ob}\mathcal{J}\to\operatorname{Ob}{C}$;
    - 各 $a,b\in\mathcal{J}$ に対して $C$ の射 $F_{ab}\colon\mathcal{J}(a,b)\odot Fa\to Fb$;
    これらのデータは以下の公理を満たす:
    - **合成を保つ**: 以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \usetikzlibrary{arrows,arrows.meta,positioning,calc}
    \begin{document}
            \begin{tikzpicture}[xscale=5]
                \node (AA) at (0,0) { $\mathcal{J}(a,c)\odot Fa$ };
                \node (BA) at (1,0) { $Fc$ };
                \node (BB) at (1,1) { $\mathcal{J}(b,c)\odot Fb$ };
                \node (AC) at (0,2) { $(\mathcal{J}(b,c)\otimes\mathcal{J}(a,b))\odot Fa$ };
                \node (BC) at (1,2) { $\mathcal{J}(b,c)\odot(\mathcal{J}(a,b)\odot Fa)$ };
                \draw[->] (AA) to node[scale=.8,auto=right] { $F_{ac}$ } (BA);
                \draw[->] (BB) to node[scale=.8,auto=left] { $F_{bc}$ } (BA);
                \draw[->] (BC) to node[scale=.8,auto=left] { $\mathcal{J}(b,c)\odot F_{ab}$ } (BB);
                \draw[->] (AC) to node[scale=.8,auto=right] {comp.} (AA);
                \draw[->] (BC) to node[scale=.8,auto=right] { $\cong$ } (AC);
            \end{tikzpicture}
    \end{document}
    ```
    - **恒等射を保つ**: 以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \usetikzlibrary{arrows,arrows.meta,positioning,calc}
    \begin{document}
            \begin{tikzpicture}[xscale=5]
                \node (AB) at (0,1) { $I\odot Fa$ };
                \node (BA) at (1,0) { $Fa$ };
                \node (BB) at (1,1) { $\mathcal{J}(a,a)\odot Fa$ };
                \draw[->] (AB) to node[scale=.8,auto=right] {unitor.} (BA);
                \draw[->] (AB) to node[scale=.8,auto=left] { $\operatorname{id}_a$ } (BB);
                \draw[->] (BB) to node[scale=.8,auto=left] { $F_{aa}$ } (BA);
            \end{tikzpicture}
    \end{document}
    ```

Definition. **加群上の豊穣自然変換**
:   $\mathfrak{M}$-圏 $\mathfrak{J}$ から左 $\mathfrak{M}$-加群 $C$ への $\mathfrak{M}$-函手 $F,G\colon\mathcal{J}\to C$ に対して、$F$ から $G$ への $\mathfrak{M}$-自然変換とは、$C$ の射の族 $\theta=\left(\theta_a\colon Fa\to Ga\right)$ であって、任意の $a,b\in\mathcal{J}$ に対して以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \usetikzlibrary{arrows,arrows.meta,positioning,calc}
    \begin{document}
        \begin{tikzpicture}[xscale=3]
            \node (AA) at (0,0) { $Fb$ };
            \node (AB) at (0,1) { $\mathcal{J}(a,b)\odot Fa$ };
            \node (BA) at (1,0) { $Gb$ };
            \node (BB) at (1,1) { $\mathcal{J}(a,b)\odot Ga$ };
            \draw[->] (AA) to node[scale=.8,auto=left] { $\theta_b$ } (BA);
            \draw[->] (AB) to node[scale=.8,auto=left] { $\theta_a$ } (BB);
            \draw[->] (AB) to node[scale=.8,auto=right] { $F_{ab}$ } (AA);
            \draw[->] (BB) to node[scale=.8,auto=right] { $G_{ab}$ } (BA);
        \end{tikzpicture}
    \end{document}
    ```

$\mathfrak{M}$-圏 $\mathcal{J}$ から左 $\mathfrak{M}$-加群 $C$ への $\mathfrak{M}$-函手を対象とし、その間の $\mathfrak{M}$-自然変換を射とする圏を $\operatorname{Func}(\mathcal{J},C)$ とする。

---

### strict 2-category としての性質

$\mathfrak{M}$-圏を対象、$\mathfrak{M}$-函手を1-cell、$\mathfrak{M}$-自然変換を2-cellとしてstrict 2-category  $\mathfrak{M}\text{-}\operatorname{CAT}$ が定義されるため、2-categoryの一般論から随伴とKan拡張が定義される。
### 随伴と同値
$\mathfrak{M}$-函手の組 $\mathcal{A}\xrightleftarrows[G]{F}\mathcal{B}$ の **随伴** (*adjunction*) とは、$\mathfrak{M}$-自然変換 $\eta\colon\operatorname{id}_{\mathcal{A}}\to GF$, $\varepsilon\colon FG\to\operatorname{id}_{\mathcal{B}}$ であって、以下の図式がそれぞれ可換となる:
```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools,amssymb}
\usepackage{tikz}
\usetikzlibrary{arrows,arrows.meta,positioning,calc}
\begin{document}
    \begin{tikzpicture}[xscale=1.5]
        \node (AB) at (0,1) { $F$ };
        \node (BA) at (1,0) { $F$ };
        \node (BB) at (1,1) { $FGF$ };
        \draw[->] (AB) to node[scale=.8,auto=left] { $F\eta$ } (BB);
        \draw[->] (AB) to node[scale=.8,auto=right] { $\operatorname{id}_F$ } (BA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\varepsilon F$ } (BA);
    \end{tikzpicture}
    \qquad
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
$\eta$, $\varepsilon$ はこの随伴の **単位** (*unit*), **余単位** (*counit*) と呼ぶ。
このとき、$F\dashv G$ と表し、$F$ は $G$ の **左随伴** (*left adjoint*)、あるいは $G$ は $F$ の **右随伴** (*right adjoint*) と呼ぶ。

特に、単位および余単位が $\mathfrak{M}$-自然同型となるとき随伴 $F\dashv G$ は同値であるといい $F\simeq G$ と書く。
### Kan拡張
$\mathcal{C},\mathcal{D},\mathcal{U}$ を $\mathfrak{M}$-圏とし、$F\colon\mathcal{C}\to\mathcal{D}$, $E\colon\mathcal{C}\to\mathcal{U}$ を $\mathfrak{M}$-函手とする。
このとき、**$F$ に沿った $E$ の左Kan拡張** (*left Kan extension of  $E$  along  $F$*) とは、$E\in\operatorname{Func}(\mathcal{C},\mathcal{U})$ から $F^{-1}\colon\operatorname{Func}(\mathcal{D},\mathcal{U})\to\operatorname{Func}(\mathcal{C},\mathcal{U})$ への普遍射 $(F^\dagger E,\eta)$ のことである。
すなわち、以下の2条件を満たすものである。
- $F^\dagger E$ は $\mathfrak{M}$-函手 $\mathcal{D}\to\mathcal{U}$ であって、$\eta$ は $\mathfrak{M}$-自然変換 $E\Rightarrow F^{-1}(F^\dagger E)=F^\dagger E\circ F$ である。
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \usetikzlibrary{arrows,arrows.meta,positioning,calc}
    \begin{document}
            \begin{tikzpicture}[xscale=2,baseline=(T.base)]
                \coordinate (T) at (0,.5);
                \node (C) at (0,0) { $\mathcal{C}$ };
                \node (D) at (0,1) { $\mathcal{D}$ };
                \node (U) at (1,0) { $\mathcal{U}$ };
                \draw[->] (C) to node[scale=.8,auto=left] { $F$ } (D);
                \draw[->] (C) to node[scale=.8,auto=right] { $E$ } (U);
                \draw[->] (D) to node[scale=.8,auto=left,pos=.4] { $F^\dagger E$ } (U);
                \draw[-{implies},double distance=1.5pt,shorten >=4pt,shorten <=4pt] ( $(C)!.2!(U)$ ) to node[scale=.8,auto=left] { $\eta$ } ( $(D)!.2!(U)$ );
            \end{tikzpicture}
    \end{document}
    ```
- 任意の $\mathfrak{M}$-函手 $S\colon\mathcal{D}\to\mathcal{U}$ と $\mathfrak{M}$-自然変換 $\theta\colon E\Rightarrow S\circ F$ の組 $(S,\theta)$ に対して、$\mathfrak{M}$-自然変換 $\tau\colon F^\dagger E\Rightarrow S$ が一意的に存在して $\theta=\tau_F\circ\eta$ を満たす。即ち次の等式が成り立つ。
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \usetikzlibrary{arrows,arrows.meta,positioning,calc}
    \begin{document}
            \begin{tikzpicture}[xscale=2,baseline=(T.base)]
                \coordinate (T) at (0,.5);
                \node (C) at (0,0) { $\mathcal{C}$ };
                \node (D) at (0,1) { $\mathcal{D}$ };
                \node (U) at (1,0) { $\mathcal{U}$ };
                \draw[->] (C) to node[scale=.8,auto=left] { $F$ } (D);
                \draw[->] (C) to node[scale=.8,auto=right] { $E$ } (U);
                \draw[->] (D) to node[scale=.8,auto=right,pos=.6] { $F^\dagger E$ } (U);
                \draw[->] (D) to [out=15, in=110] node[scale=.8,auto=left] (S) { $S$ } (U);
                \draw[-{implies},double distance=1.5pt,shorten >=4pt,shorten <=4pt] ( $(C)!.2!(U)$ ) to node[scale=.8,auto=left] { $\eta$ } ( $(D)!.2!(U)$ );
                \draw[-{implies},densely dotted,double distance=1.5pt,shorten >=3pt,shorten <=3pt] ( $(D)!0.4!(U)$ ) to node[scale=.8,auto=right] { $\tau$ } ( $(D)!0.7!(S)$ );
            \end{tikzpicture}
            =
            \begin{tikzpicture}[xscale=2,baseline=(T.base)]
                \coordinate (T) at (0,.5);
                \node (C) at (0,0) { $\mathcal{C}$ };
                \node (D) at (0,1) { $\mathcal{D}$ };
                \node (U) at (1,0) { $\mathcal{U}$ };
                \draw[->] (C) to node[scale=.8,auto=left] { $F$ } (D);
                \draw[->] (C) to node[scale=.8,auto=right] { $E$ } (U);
                \draw[->] (D) to [out=15, in=110] node[scale=.8,auto=left] (S) { $S$ } (U);
                \draw[-{implies},double distance=1.5pt,shorten >=0pt,shorten <=4pt] ( $(C)!.3!(U)$ ) to node[scale=.8,auto=right] { $\theta$ } ( $(D)!.3!(U)$ );
            \end{tikzpicture}
    \end{document}
    ```
他方、$F^{-1}$ から $E$ への普遍射 $(F^\ddagger E,\varepsilon)$ を **$F$ に沿った $E$ の右Kan拡張** (*right Kan extension of  $E$  along  $F$*) という。

---

## 重み付き余極限と米田の補題

$\mathfrak{M}$-圏 $\mathcal{C}$ に対して、$P(\mathcal{C})=\operatorname{Func}\left(\mathcal{C}^{\mathrm{op}},\mathfrak{M}^\mathsf{rev}\right)$ とすると、$P(\mathcal{C})$ は左 $\mathfrak{M}$-加群となる。

Definition. **重み付き余錐**
:   $\mathcal{J}$ を $\mathfrak{M}$-圏とし、$\mathcal{A}$ を左 $\mathfrak{M}$-加群とする。
    このとき、$W\in P(\mathcal{J})$ と $F\colon\mathcal{J}\to\mathcal{A}$ に対して、**$F$ の $W$ で重み付けられた余錐** (*weighted cocorn over a functor  $F$  with respect to a weight  $W$*) とは、$\mathcal{A}$ の対象 $Z$ と $\mathcal{B}$ の射の族 $\theta=\left(W(j)\odot F(j)\xrightarrow{\theta_j}Z\right)$ の組 $(Z,\theta)$ であって、以下の可換図式を満たす:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \usetikzlibrary{arrows,arrows.meta,positioning,calc}
    \begin{document}
        \begin{tikzpicture}[xscale=4]
            \node (AA) at (0,0) { $W(k)\odot(J(j,k)\odot F(j))$ };
            \node (AC) at (0,2) { $(W(k)\otimes J(j,k))\odot F(j)$ };
            \node (BA) at (1,0) { $W(k)\odot F(k)$ };
            \node (BC) at (1,2) { $W(j)\odot F(j)$ };
            \node (BB) at (1,1) { $Z$ };
            \draw[->] (AA) to node[scale=.8,auto=left] { $\cong$ } (AC);
            \draw[->] (AA) to node[scale=.8,auto=right] {action} (BA);
            \draw[->] (AC) to node[scale=.8,auto=left] {action} (BC);
            \draw[->] (BA) to node[scale=.8,auto=right] { $\theta_k$ } (BB);
            \draw[->] (BC) to node[scale=.8,auto=left] { $\theta_j$ } (BB);
        \end{tikzpicture}
    \end{document}
    ```
    特に、余錐のうち普遍的なものを **$W$ に関する $F$ 上の重み付き余極限** (*weighted colimit over a functor  $F$  with respect to a weight  $W$*) という。
    すなわち、余極限は $F$ の $W$ で重み付けられた余錐 $(\operatorname*{colim}^WF,\alpha)$ であって、任意の余錐 $(Z,\theta)$ に対して射 $\pi\colon\operatorname*{colim}^WF\to Z$ が一意的に存在して次の図式を可換にする:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools,amssymb}
    \usepackage{tikz}
    \usetikzlibrary{arrows,arrows.meta,positioning,calc}
    \begin{document}
        \begin{tikzpicture}[xscale=3]
            \node (AA) at (0,0) { $\operatorname*{colim}^WF$ };
            \node (BA) at (1,0) { $Z$ };
            \node (AB) at (0,1) { $W(j)\odot F(j)$ };
            \draw[->] (AA) to node[scale=.8,auto=right] { $\pi$ } (BA);
            \draw[->] (AB) to node[scale=.8,auto=right] { $\alpha_j$ } (AA);
            \draw[->] (AB) to node[scale=.8,auto=left] { $\theta_j$ } (BA);
        \end{tikzpicture}
    \end{document}
    ```

Theorem. **米田の補題**
:   $m\in\mathfrak{M}$ について自然な同型
    $$
    P(\mathcal{C})(m\odot y(a),F)\cong\mathfrak{M}(m,F(a))
    $$
    が成り立つ。

### 各点豊穣 Kan 拡張

ここまでの定義から、豊穣 Kan 拡張を重み付き余極限として計算できる。$\mathfrak{M}$ を宇宙、$\mathcal{C},\mathcal{D}$ を小さい $\mathfrak{M}$-圏、$\mathcal{A}$ を余完備な左 $\mathfrak{M}$-加群とする。$\mathfrak{M}$-函手
$$
\mathcal{D}\xleftarrow{F}\mathcal{C}\xrightarrow{E}\mathcal{A}
$$
に対して、各点左 Kan 拡張が存在するなら、任意の $d\in\mathcal{D}$ について自然な同型
$$
(\operatorname{Lan}_{F}E)(d)
\cong \operatorname{colim}^{\mathcal{D}(F{-},d)}E
$$
が成り立つ。右辺の重みは、$c\mapsto\mathcal{D}(Fc,d)$ で定まる $\mathcal{C}^{\mathrm{op}}$ 上の $\mathfrak{M}$-函手である。

双対的に、$\mathcal{A}$ が完備で各点右 Kan 拡張が存在するなら、
$$
(\operatorname{Ran}_{F}E)(d)
\cong \operatorname{lim}^{\mathcal{D}(d,F{-})}E
$$
である。$\mathsf{Set}$ を基底に取ると、これらは通常の各点 Kan 拡張の公式
$$
(\operatorname{Lan}_{F}E)(d)\cong\operatorname*{colim}_{(Fc\to d)\in(F/d)}E(c)
$$
および右 Kan 拡張の公式に戻る。

この公式の意味は、$d$ における拡張値を、$F$ の像から $d$ へ向かう豊穣な射対象を重みとして集約することにある。したがって、Kan 拡張は基底のテンソル積と普遍性で決まる最も自然な延長である。
