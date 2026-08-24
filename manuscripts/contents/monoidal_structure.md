## モノイダル圏の付加構造

### 組紐と対称性

$\mathfrak{M}$ がモノイダル圏とする
$\mathfrak{M}$ 上の **組紐** (*braiding*) とは、以下の図式を満たすような自然同型 $\beta=\{\beta_{xy}\colon x\otimes y\to y\otimes x\}_{x,y\in\mathfrak{M}}$ のことである:
```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools}
\usepackage{tikz}
\begin{document}
    \begin{tikzpicture}[xscale=2.5]
        \node (AA) at (0,0) { $(y\otimes x)\otimes z$ };
        \node (BA) at (1,0) { $y\otimes (x\otimes z)$ };
        \node (CA) at (2,0) { $y\otimes (z\otimes x)$ };
        \node (AB) at (0,1) { $(x\otimes y)\otimes z$ };
        \node (BB) at (1,1) { $x\otimes (y\otimes z)$ };
        \node (CB) at (2,1) { $(y\otimes z)\otimes x$ };
        \draw[->] (AA) to node[scale=.8,auto=left] { $\alpha_{yxz}$ } (BA);
        \draw[->] (BA) to node[scale=.8,auto=left] { $\operatorname{id}\otimes\gamma_{xz}$ } (CA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\alpha_{xyz}$ } (BB);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\gamma_{x,y\otimes z}$ } (CB);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\gamma_{xy}\otimes\operatorname{id}$ } (AA);
        \draw[->] (CB) to node[scale=.8,auto=left] { $\alpha_{yzx}$ } (CA);
    \end{tikzpicture}
    \begin{tikzpicture}[xscale=2.5]
        \node (AA) at (0,0) { $x\otimes (z\otimes y)$ };
        \node (BA) at (1,0) { $(x\otimes z)\otimes y$ };
        \node (CA) at (2,0) { $(z\otimes x)\otimes y$ };
        \node (AB) at (0,1) { $x\otimes (y\otimes z)$ };
        \node (BB) at (1,1) { $(x\otimes y)\otimes z$ };
        \node (CB) at (2,1) { $z\otimes (x\otimes y)$ };
        \draw[->] (AA) to node[scale=.8,auto=left] { $\alpha^{-1}_{xzy}$ } (BA);
        \draw[->] (BA) to node[scale=.8,auto=left] { $\gamma_{xz}\otimes\operatorname{id}$ } (CA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\alpha^{-1}_{xyz}$ } (BB);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\gamma_{x\otimes y,z}$ } (CB);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\operatorname{id}\otimes\gamma_{yz}$ } (AA);
        \draw[->] (CB) to node[scale=.8,auto=left] { $\alpha^{-1}_{zxy}$ } (CA);
    \end{tikzpicture}
\end{document}
```
すなわち、組紐とは $\mathfrak{M}$ から $\mathfrak{M}^{\operatorname{rev}}$ への強モノイダル函手であって、対象の間の対応が恒等写像となっている。

組紐を備えたモノイダル圏を **組紐付きモノイダル圏** (*braided monoidal category*) という。

### 対称性

組紐付きモノイダル圏 $\mathfrak{M}$ の組紐 $\beta$ が任意の $x,y\in\mathfrak{M}$ に対して $\beta_{yx}\circ\beta_{xy}=\operatorname{id}_{x\otimes y}$ を満たす
とき、$\mathfrak{M}$ を **対称モノイダル圏** (*symmetric monoidal category*) という。

### 双対性

モノイダル圏 $\mathfrak{M}$ の対象 $x$ について、$x$ の **右双対** (*right dual*) とは、対象 $y\in\mathfrak{M}$ と2つの射 $\operatorname{ev}\colon y\otimes x\to I$ 、$\operatorname{coev}\colon I\to x\otimes y$ の組 $(y,\operatorname{ev},\operatorname{coev})$ であって、以下の三角図式を満たすときいう:
```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools}
\usepackage{tikz}
\begin{document}
    \begin{tikzpicture}[xscale=3]
        \node (AA) at (0,0) { $x$ };
        \node (AB) at (0,1) { $x$ };
        \node (BA) at (1,0) { $x\otimes(y\otimes x)$ };
        \node (BB) at (1,1) { $(x\otimes y)\otimes x$ };
        \draw[->] (BA) to node[scale=.8,auto=right] { $x\otimes\operatorname{ev}$ } (AA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\operatorname{coev}\otimes x$ } (BB);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\operatorname{id}_{x}$ } (AA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\alpha_{xyx}$ } (BA);
    \end{tikzpicture}
    \begin{tikzpicture}[xscale=3]
        \node (AA) at (0,0) { $y$ };
        \node (AB) at (0,1) { $y$ };
        \node (BA) at (1,0) { $y\otimes(x\otimes y)$ };
        \node (BB) at (1,1) { $(y\otimes x)\otimes y$ };
        \draw[->] (BB) to node[scale=.8,auto=right] { $\operatorname{ev}\otimes y$ } (AB);
        \draw[->] (AA) to node[scale=.8,auto=left] { $y\otimes\operatorname{coev}$ } (BA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\operatorname{id}_{y}$ } (AA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\alpha_{yxy}$ } (BA);
    \end{tikzpicture}
\end{document}
```
このとき、$y$ を **$x$ の右双対対象** (*right dual object of $x$*) といい、$\operatorname{ev}$ 、$\operatorname{coev}$ をそれぞれ **評価射** (*evaluation morphism*) 、**余評価射** (*coevaluation morphism*) という。

右双対をもつような対象のことを **右双対化可能対象** (*right dualizable object*) 、あるいは **右剛対象** (*right rigid object*) という。

右双対の(圏論的)双対概念を **左双対** (*left dual*) という。

右剛対象(resp. 左剛対象) $x\in\mathfrak{M}$ に対して $\mathfrak{M}$ における右双対(resp. 左双対)は同型を除いて一意的であるため、対象 $x\in\mathfrak{M}$ に対して、その右双対および左双対を $x^\ast$ 、${}^\ast{x}$ と表すこととする。

Example. 双対の具体例
:   体 $k$ 上の線形空間のなす圏 $\mathsf{Vect}_k$ は、$k$ 上のテンソル積により対称モノイダル圏となる。
    このとき、$k$ -線形空間 $X$ の( $\mathsf{Vect}_k$ における)双対とは、$X$ の $k$ 上の双対空間 $\hom(X,k)$ のことである。

### 閉性

モノイダル圏 $\mathfrak{M}$ の対象 $x$ に対して、函手 $x\otimes({-})\colon\mathfrak{M}\to\mathfrak{M}$ ; $a\mapsto x\otimes a$  (resp. 函手 $({-})\otimes x\colon\mathfrak{M}\to\mathfrak{M}$; $a\mapsto a\otimes x$ )を、$x$ による **左作用** (*left action*)  (resp. **右作用** (*right action*) )という。
特に、$\mathfrak{M}$ が対称であれば $x\otimes({-})$ 、$({-})\otimes x$ はそれぞれ両側作用(bi-action)という。

ここで、$x$ による左作用(resp. 右作用)が右随伴を持つとき、$x$ を **左閉対象** (*left closed object*)  (resp. **右閉対象** (*right closed object*) )といい、その右随伴を $x\dashrightarrow({-})$  (resp. $({-})\dashleftarrow x$ )と表す。

随伴 $x\otimes({-})\dashv x\dashrightarrow({-})$ の余単位を $\operatorname{ev}^x$ 、単位を $\operatorname{coev}^x$ で表し、それぞれ **評価射** (*evaluation morphism*) 、**余評価射** (*coevaluation morphism*) と呼ぶ.
$$
\operatorname{ev}^x\colon\operatorname{id}_{\mathfrak{M}}\Rightarrow x\dashrightarrow(x\otimes({-}))
,\quad
\operatorname{coev}^x\colon x\otimes(x\dashrightarrow({-}))\Rightarrow\operatorname{id}_{\mathfrak{M}}
$$
特に、左閉かつ右閉な対象を **両側閉対象** (*bi-closed object*) という。

左剛対象 $x$ の双対 $y$ に対して、$y\otimes({-})$ は $x\otimes({-})$ の右随伴となるため、$x$ は左閉対象でもある。
このことから、閉対象に対して **弱い双対** を考えることができる。
具体的には、左閉対象 $x\in\mathfrak{M}$ に対して、$x$ の **左弱双対** (*left weak dual*) ${}^\ast{x}$ を ${}^\ast{x}\coloneqq x\dashrightarrow I$ として定義する。
また、右閉対象 $x\in\mathfrak{M}$ に対しても同様にして **右弱双対** (*right weak dual*) $x^\ast$ を $x^\ast\coloneqq I\dashleftarrow x$ として定義する。

### 跡

モノイダル圏 $\mathfrak{M}$ の **右トレース** (*right trace*) とは、$a,b,x\in\mathfrak{M}$ で添字付けられた射
$$
\operatorname{tr}_R^x\colon\mathfrak{M}(a\otimes x,b\otimes x)\to\mathfrak{M}(a,b)
$$
の族であり、以下の公理を満たすときいう:

- **Tightening**: 任意の $a,b,c,d,x\in\mathfrak{M}$ 、$h\colon a\to b$ 、$f\colon b\otimes x\to c\otimes x$ 、$g\colon c\to d$ に対して次が成り立つ:
    $$
    \operatorname{tr}_R^x((g\otimes\operatorname{id}_x)\circ f\circ (h\otimes\operatorname{id}_x))=g\circ\operatorname{tr}_R^x(f)\circ h
    $$
- **Sliding**: 任意の $a,b,x,y\in\mathfrak{M}$ 、$f\colon a\otimes x\to b\otimes y$ 、$g\colon y\to x$ に対して次が成り立つ:
    $$
    \operatorname{tr}_R^x((\operatorname{id}_b\otimes g)\circ f)=\operatorname{tr}_R^y(f\circ(\operatorname{id}_a\otimes g))
    $$
- **Vanishing**: 任意の $a,b,x,y\in\mathfrak{M}$ 、$f\colon a\otimes x\otimes\to b\otimes x\otimes y$ に対して次が成り立つ:
    $$
    \operatorname{tr}_R^{x\otimes y}(f)=\operatorname{tr}_R^x(\operatorname{tr}_R^y(f)),\quad \operatorname{tr}_R^I(f)=f
    $$
- **Strength**: 任意の $a,b,c,d,x\in\mathfrak{M}$ 、$f\colon c\otimes x\to d\otimes x$ 、$g\colon x\to y$ に対して次が成り立つ:
    $$
    \operatorname{tr}_R^x(g\otimes f)=g\otimes\operatorname{tr}_R^x(f)
    $$

また、$\mathfrak{M}$ の **左トレース** (*left trace*) を $\mathfrak{M}^{\operatorname{rev}}$ における右トレースとして定義する。

Example.
:   - 有限次元ベクトル空間の圏は跡付きモノイダルである。モノイダル構造としてのトレースは行列のトレースのわずかな一般化になっている:
    $$
    \operatorname{tr}_{m,n}^p((a_{(i,k),(j,k')})_{(i,k),(j,k')\in m\times p\times n\times p})_{i,j}=\sum_{k=1}^p a_{(i,k),(j,k)}.
    $$
