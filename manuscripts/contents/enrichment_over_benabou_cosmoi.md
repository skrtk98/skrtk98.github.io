## Benabou cosmos 上の豊穣圏

完備かつ余完備な対称閉モノイダル圏を **Benabou cosmos** という。

$\mathfrak{M}$ を Benabou cosmos とすると、閉性による随伴
$$
 {-}\otimes A\dashv[A,{-}]
$$
で得られる $[A,B]$ を Hom 対象とすることで、$\mathfrak{M}$ は $\mathfrak{M}$-圏となる。

以後、$\mathfrak{M}$ を Benabou cosmos とし、$\mathfrak{M}$ 自身を $\mathfrak{M}$-圏として扱う。

### エンドとコエンド

まず、$\mathfrak{M}$ におけるエンド、コエンドを定義する。

$\mathcal{C}$ を $\mathfrak{M}$-圏とする。対象 $d\in\mathfrak{M}$ と $\mathfrak{M}$-函手
$$
 T\colon\mathcal{C}^{\mathrm{op}}\otimes\mathcal{C}\to\mathfrak{M}
$$
に対して、$d$ における $T$ の **楔** (*wedge from $d$ to $T$*) とは、$\mathfrak{M}$ の射の族
$$
 \alpha=\left(d\xrightarrow{\alpha_c}T(c,c)\right)
$$
であって、次の図式が可換となるものをいう。

```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools,amssymb}
\usepackage{tikz}
\usetikzlibrary{arrows,arrows.meta,positioning,calc}
\begin{document}
    \begin{tikzpicture}[xscale=4]
        \node (AA) at (0,0) { $[T(b,b),T(a,b)]$ };
        \node (AB) at (0,1) { $\mathcal{C}(a,b)$ };
        \node (BA) at (1,0) { $[d,T(a,b)]$ };
        \node (BB) at (1,1) { $[T(a,a),T(a,b)]$ };
        \draw[->] (AA) to node[scale=.8,auto=right] { $[\alpha_b,T(a,b)]$ } (BA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $T(a,-)_{ab}$ } (BB);
        \draw[->] (AB) to node[scale=.8,auto=right] { $T(-,b)_{ba}$ } (AA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $[\alpha_a,T(a,b)]$ } (BA);
    \end{tikzpicture}
\end{document}
```

$T\colon\mathcal{C}^{\mathrm{op}}\otimes\mathcal{C}\to\mathfrak{M}$ を $\mathfrak{M}$-函手とする。$T$ の **普遍楔** とは、楔
$$
 \pi=\left(e\xrightarrow{\pi_c}T(c,c)\right)
$$
であって、任意の楔 $\alpha=\left(d\xrightarrow{\alpha_c}T(c,c)\right)$ に対して、射 $h\colon d\to e$ が一意的に存在し、$\alpha_c=\pi_c\circ h$ と分解されるものをいう。このとき、$e$ を $T$ の **エンド** といい、
$$
 \int_{c\in\mathcal{C}}T(c,c)
$$
と表す。

一般の $\mathfrak{M}$-圏 $\mathcal{D}$ に対しては、$\mathfrak{M}$-函手
$$
 T\colon\mathcal{C}^{\mathrm{op}}\otimes\mathcal{C}\to\mathcal{D}
$$
に対して
$$
 \int_{c\in\mathcal{C}}\mathcal{D}(-,T(c,c))\colon\mathcal{D}^{\mathrm{op}}\to\mathfrak{M}
$$
を表現する対象を $T$ のエンドという。これを $\int_{c\in\mathcal{C}}T(c,c)$ と表す。他方、
$$
 \int_{c\in\mathcal{C}}\mathcal{D}(T(c,c),-)\colon\mathcal{D}\to\mathfrak{M}
$$
を表現する対象を $T$ の **コエンド** といい、$\int^{c\in\mathcal{C}}T(c,c)$ と表す。定義より、
$$
 \mathcal{D}\left(d,\int_{c\in\mathcal{C}}T(c,c)\right)
 \cong \int_{c\in\mathcal{C}}\mathcal{D}(d,T(c,c)),
 \qquad
 \mathcal{D}\left(\int^{c\in\mathcal{C}}T(c,c),d\right)
 \cong \int_{c\in\mathcal{C}}\mathcal{D}(T(c,c),d)
$$
が成り立つ。

### 函手圏と豊穣米田の補題

$\mathfrak{M}$-圏 $\mathcal{C},\mathcal{D}$ の間の函手圏 $\operatorname{Func}(\mathcal{C},\mathcal{D})$ は通常の圏であった。通常の圏の場合に成り立つ同型
$$
 \operatorname{Func}(\mathcal{C},\mathcal{D})(F,G)
 \cong \int_{c\in\mathcal{C}}\mathcal{D}(Fc,Gc)
$$
に倣って、函手のなす $\mathfrak{M}$-圏 $\lbrack\mathcal{C},\mathcal{D}\rbrack$ を
$$
 \lbrack\mathcal{C},\mathcal{D}\rbrack(F,G)
 \cong \int_{c\in\mathcal{C}}\mathcal{D}(Fc,Gc)
$$
で定める。この圏の下部圏は $\operatorname{Func}(\mathcal{C},\mathcal{D})$ である。

また、自然な全単射
$$
 \mathfrak{M}\text{-}\mathsf{Cat}(\mathcal{A}\otimes\mathcal{B},\mathcal{C})
 \cong
 \mathfrak{M}\text{-}\mathsf{Cat}(\mathcal{A},\lbrack\mathcal{B},\mathcal{C}\rbrack)
$$
が存在する。したがって、$\operatorname{Hom}_{\mathcal{C}}\colon\mathcal{C}\otimes\mathcal{C}^{\mathrm{op}}\to\mathfrak{M}$ に対応する $\mathfrak{M}$-函手
$$
 y\colon\mathcal{C}\to\widehat{\mathcal{C}},
 \qquad
 \widehat{\mathcal{C}}=\lbrack\mathcal{C}^{\mathrm{op}},\mathfrak{M}\rbrack
$$
を豊穣米田函手と呼ぶ。

Theorem. **豊穣米田の補題**
:   $\mathcal{C}$ を $\mathfrak{M}$-圏とする。このとき、対象 $a\in\mathcal{C}$ と $\mathfrak{M}$-函手 $F\colon\mathcal{C}^{\mathrm{op}}\to\mathfrak{M}$ について、$\mathfrak{M}$ における自然な同型
    $$
     \widehat{\mathcal{C}}(y(a),F)\cong\operatorname{ev}(a,F)=F(a)
    $$
    が成り立つ。

### 重み付き極限と余極限

通常の圏における極限および余極限は、対角函手の左随伴および右随伴として特徴付けられる。しかし一般の豊穣圏の場合、対角函手を標準的に定義することができないため、重みを用いて定義する。

通常の圏論における図式 $F\colon J\to C$ の極限 $\lim F$ は、同型
$$
 C(-,\lim F)\cong\lim C(-,F)
 \cong [J,\mathsf{Set}](\Delta 1,C(-,F))
$$
によって特徴付けられる。ここで定値函手 $\Delta 1\colon J\to\mathsf{Set}$ を一般の函手 $W\colon J\to\mathsf{Set}$ に置き換えると、重み付き極限が得られる。

Definition. **重み付き極限**
:   $\mathfrak{M}$-函手 $W\colon\mathcal{J}\to\mathfrak{M}$ と $F\colon\mathcal{J}\to\mathcal{A}$ に対して、各 $a\in\mathcal{A}$ で
    $$
     \lbrack\mathcal{J},\mathfrak{M}\rbrack(W,\mathcal{A}(a,F-))\colon\mathcal{A}\to\mathfrak{M}
    $$
    が表現可能なとき、これを表現する対象を $W$ に関する $F$ 上の **重み付き極限** (*weighted limit*) といい、$\lim^W F$ と表す。すなわち、
    $$
     \lbrack\mathcal{J},\mathfrak{M}\rbrack(W,\mathcal{A}(a,F-))
     \cong \mathcal{A}(a,\lim^W F)
    $$
    が成り立つ。

Definition. **重み付き余極限**
:   $\mathfrak{M}$-函手 $W\colon\mathcal{J}^{\mathrm{op}}\to\mathfrak{M}$ と $F\colon\mathcal{J}\to\mathcal{A}$ に対して、各 $a\in\mathcal{A}$ で
    $$
     \lbrack\mathcal{J}^{\mathrm{op}},\mathfrak{M}\rbrack(W,\mathcal{A}(F-,a))\colon\mathcal{A}^{\mathrm{op}}\to\mathfrak{M}
    $$
    が表現可能なとき、これを表現する対象を $W$ に関する $F$ 上の **重み付き余極限** (*weighted colimit*) といい、$\operatorname{colim}^W F$ と表す。すなわち、
    $$
     \lbrack\mathcal{J}^{\mathrm{op}},\mathfrak{M}\rbrack(W,\mathcal{A}(F-,a))
     \cong \mathcal{A}(\operatorname{colim}^W F,a)
    $$
    が成り立つ。

### 各点 Kan 拡張

$\mathfrak{M}$-圏 $\mathcal{C},\mathcal{D},\mathcal{U}$、$\mathfrak{M}$-函手
$$
 F\colon\mathcal{C}\to\mathcal{D},\qquad
 E\colon\mathcal{C}\to\mathcal{U},\qquad
 T\colon\mathcal{D}\to\mathcal{U}
$$
を考える。

Definition. **各点左 Kan 拡張**
:   $T$ が $F$ に沿った $E$ の **各点左 Kan 拡張** (*pointwise left Kan extension*) であるとは、任意の $d\in\mathcal{D}$ と $u\in\mathcal{U}$ について自然な同型
    $$
     \mathcal{U}(Td,u)
     \cong
     \lbrack\mathcal{C}^{\mathrm{op}},\mathfrak{M}\rbrack
     \bigl(\mathcal{D}(F-,d),\mathcal{U}(E-,u)\bigr)
    $$
    が成り立つときをいう。これは形式的には
    $$
     Td\cong\operatorname{colim}^{\mathcal{D}(F-,d)}E
    $$
    ということである。

Theorem. **各点左 Kan 拡張は Kan 拡張である**
:   各点左 Kan 拡張は、通常の意味での $F$ に沿った $E$ の左 Kan 拡張となる。
