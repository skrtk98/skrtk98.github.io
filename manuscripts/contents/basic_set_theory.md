## 集合と写像

論理記号について最低限説明する。
命題 $p,q$ について、**$p$ が成り立たない、あるいは $p$ が成り立つならば $q$ が成り立つ** ことを $p\implies q$ 、あるいは $q\impliedby p$ で表す。
特に、$p\implies q$ かつ $q\implies p$ のとき $p\iff q$ と表し、$p$ と $q$ は **同値** であるという。

1以上の整数を特に自然数と呼ぶことにする。
いくつかの **ものからなる集まり** を **集合** といい、$x$ が集合 $A$ の要素であることを $x\in A$ と表し、**$x$ は $A$ の元**、あるいは **$x$ は $A$ に属する** という。

以下は、いくつかの代表的な集合を表すのに用いる記号である:

$\mathbb{N}$ :自然数全体の集合, $\mathbb{Z}$ :整数全体の集合, $\mathbb{Q}$ :有理数全体の集合, $\mathbb{R}$ :実数全体の集合

集合の要素を具体的に列挙する表現を **外延的記法** と呼ぶ。具体的な例として、要素 $a,b,c,d$ のみを持つ集合を考えたとき、その外延的表記は $\{a,b,c,d\}$ となる。

他方、ある条件 $P$ を満たすような $x$ の全体を $\left\{x\colon xは条件Pを満たす\right\}$ と表し、この表現を **内包的記法** という。
特に考える $x$ をある集合 $A$ の要素に限定する場合、その全体を $\left\{x\in A\colon xは条件Pを満たす\right\}$ と表す。

2つの集合 $A,B$ に対して、$A$ のすべての元が $B$ に属するとき、**$A$ は $B$ の部分集合** である、あるいは **$A$ は $B$ に含まれる** といい、$A\subseteq B$ あるいは $B\supseteq A$ と表す。
特に、$A$ が $B$ に含まれており、かつ $B$ が $A$ に含まれているとき **$A$ と $B$ は等しい** といい $A=B$ と表す。
 **空集合** は名前の通り **空っぽの集合** のことで、具体的には **いかなる要素も持たない集合** であり、記号として $\emptyset$ を用いる。
空集合 $\emptyset$ は任意の集合の部分集合となっている。

2つの集合 $A,B$ に対して、$A$ と $B$ のいずれかに属する要素からなる集合を $A$ と $B$ の **和集合** といい、$A\cup B$ で表す。
$A$ と $B$ の両方に属する要素からなる集合を **$A$ と $B$ の共通部分** といい、$A\cap B$ で表す。
$A$ の要素のうち $B$ に含まれないもの全体からなる集合を **$A$ と $B$ の差集合** といい、$A\setminus B$ で表す。
特に、$A\cap B\neq\emptyset$ であるとき $A$ と $B$ は **交わっている** といい、$A\cap B=\emptyset$ のとき **$A$ と $B$ は交わっていない**、あるいは **互いに素** であるという。

集合 $A$ から集合 $B$ への写像 $f$ とは、$A$ の任意の要素 $x$ に対して $B$ の要素 $y$ がただ一つ対応するような対応付けのことであり、$y$ を **$x$ における $f$ の値**、あるいは **$f$ による $x$ の像** といい $y=f(x)$ と表す。
$f$ によって $A$ の要素 $x$ が $B$ の要素 $y$ に写されることを $f\colon x\mapsto y$ で表す。
また、$f$ が $A$ から $B$ への写像であることを $f\colon A\to B$ と表し、$A$ を $f$ の **定義域** あるは **始域** といい、$B$ を $f$ の **値域** あるいは **終域** という。

写像 $f\colon A\to B$ が条件 **$\forall a,a^\prime\in A(f(a)=f(a^\prime)\implies a=a^\prime)$** を満たすとき、$f$ は **単射** であるという。
また、$f$ が条件 **$\forall b\in B,\exists a\in A(b=f(a))$** を満たすとき、$f$ は **全射** であるという。
特に、全射かつ単射な場合を **全単射** という。

集合 $A$ , $B$ に対して、全単射な写像 $f\colon A\to B$ が存在するとき、$A$ と $B$ は **集合として同型** あるいは **同型な集合** であるといい、$A\cong B$ と表す。

写像 $f\colon A\to B$ と部分集合 $X\subseteq A,Y\subseteq B$ に対して $f$ の $X$ による像を $f(X)=\{f(x)\colon x\in X\}$ とし $f$ の $Y$ による逆像を $f^{-1}(Y)=\{x\in X\colon f(x)\in Y\}$ とするとき、次がそれぞれ成り立つ:

- $f(\bigcup_{\lambda\in\Lambda}X_\lambda)=\bigcup_{\lambda\in\Lambda}f(X_\lambda)$;  $f(\bigcap_{\lambda\in\Lambda}X_\lambda)\subseteq\bigcap_{\lambda\in\Lambda}f(X_\lambda)$;
- $f^{-1}(\bigcup_{\lambda\in\Lambda}Y_\lambda)=\bigcup_{\lambda\in\Lambda}f^{-1}(Y_\lambda)$;  $f^{-1}(\bigcap_{\lambda\in\Lambda}Y_\lambda)=\bigcap_{\lambda\in\Lambda}f^{-1}(Y_\lambda)$;
- $X\subseteq X^\prime\implies f(X)\subseteq f(X^\prime)$;
- $Y\subseteq Y^\prime\implies f^{-1}(Y)\subseteq f^{-1}(Y^\prime)$;
- $f(X)\subseteq Y\iff X\subseteq f^{-1}(Y)$;
- $X\subseteq f^{-1}(f(X))$  (等号成立条件: $f$ が単射)
- $f(f^{-1}(Y))\subseteq Y$  (等号成立条件: $Y\subseteq\image{f}$ )

Definition. **Grothendieck 宇宙** (*Grothendieck universe*)
:   **Grothendieck 宇宙** (*Grothendieck universe*) とは次の性質をもつ集合 $\mathfrak{U}$ のことである。

    -  $\mathfrak{U}$ は推移的である。(i.e. $x\in\mathfrak{U}$ と $y\in x$ に対して $y\in\mathfrak{U}$ である)
    -  $x,y\in\mathfrak{U}$ に対して $\{x,y\}\in\mathfrak{U}$ である。
    -  $x\in\mathfrak{U}$ に対して $x$ の冪集合 $\mathfrak{P}(x)$ は $\mathfrak{P}(x)\in\mathfrak{U}$ を満たす。
    -  $I\in\mathfrak{U}$ によって添字付けられた $\mathfrak{U}$ の元の族 $\{x_i\}_{i\in I}$ に対して $\bigcup_{i\in I}x_i\in\mathfrak{U}$ となる。
