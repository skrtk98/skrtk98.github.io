## モノイダル圏の基本事項

### 定義

圏 $\mathcal{M}$ 上の **モノイダル構造** (*monoidal structure*) とは、以下のデータからなる:

- **テンソル積** (*tensor product*) と呼ばれる函手 $\otimes\colon\mathcal{M}\times\mathcal{M}\to\mathcal{M}$;
- **単位対象** (*unit object*) あるいは **テンソル単位** (*tensor unit*) と呼ばれる対象 $I\in\operatorname{Ob}\mathcal{M}$
- **結合子** (*associator*) と呼ばれる自然同型 $\alpha\colon\otimes\circ(\otimes\times\operatorname{id}_{\mathcal{M}})\Rightarrow\otimes\circ(\operatorname{id}_{\mathcal{M}}\times\otimes)\colon\mathcal{M}\times\mathcal{M}\times\mathcal{M}\to\mathcal{M}$;
- **左単位子** (*left unitor*) と呼ばれる自然同型 $\lambda\colon{I_{\mathcal{M}}}\otimes\operatorname{id}_{\mathcal{M}}\Rightarrow\operatorname{id}_{\mathcal{M}}$;
- **右単位子** (*right unitor*) と呼ばれる自然同型 $\rho\colon\operatorname{id}_{\mathcal{M}}\otimes{I_{\mathcal{M}}}\Rightarrow\operatorname{id}_{\mathcal{M}}$;

$a,b,c\in\mathcal{M}$ による $(a,b,c)$ -成分 $\alpha_{abc}$ は $\mathcal{M}$ の射 $(a\otimes b)\otimes c\to a\otimes(b\otimes c)$ である。

これらのデータは、以下の公理を満たす:

- **結合律(associativity)**: 以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[xscale=5]
            \node (AA) at (0,0) { $a\otimes((b\otimes c)\otimes d)$ };
            \node (CA) at (2,0) { $a\otimes(b\otimes(c\otimes d))$ };
            \node (AB) at (0,1) { $(a\otimes(b\otimes c))\otimes d$ };
            \node (BB) at (1,1) { $((a\otimes b)\otimes c)\otimes d$ };
            \node (CB) at (2,1) { $(a\otimes b)\otimes(c\otimes d)$ };
            \draw[->] (AA) to node[scale=.8,auto=left] { $\operatorname{id}\otimes\alpha_{bcd}$ } (CA);
            \draw[->] (BB) to node[scale=.8,auto=right] { $\alpha_{abc}\otimes\operatorname{id}$ } (AB);
            \draw[->] (BB) to node[scale=.8,auto=left] { $\alpha_{a\otimes b,c,d}$ } (CB);
            \draw[->] (AB) to node[scale=.8,auto=right] { $\alpha_{a,b\otimes c,d}$ } (AA);
            \draw[->] (CB) to node[scale=.8,auto=right] { $\alpha_{a,b,c\otimes d}$ } (CA);
        \end{tikzpicture}
    \end{document}
    ```

- **単位律(unitality)**: 以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[xscale=3]
            \node (BA) at (1,0) { $a\otimes b$ };
            \node (AB) at (0,1) { $(a\otimes I)\otimes b$ };
            \node (CB) at (2,1) { $a\otimes (I\otimes b)$ };
            \draw[->] (AB) to node[scale=.8,auto=left] { $\rho_a\otimes b$ } (AB|-BA) to (BA);
            \draw[->] (CB) to node[scale=.8,auto=left] { $a\otimes\lambda_b$ } (CB|-BA) to (BA);
            \draw[->] (AB) to node[scale=.8,auto=left] { $\alpha_{a,I,b}$ } (CB);
        \end{tikzpicture}
    \end{document}
    ```

これらモノイダル構造に対して $\mathcal{M}$ を **下部圏** (*underlying category*) と呼び、下部圏とモノイダル構造の組 $(\mathcal{M},\otimes,I,\alpha,\lambda,\rho)$ を **モノイダル圏** (*monoidal category*) と呼ぶ。

特に、結合子、左単位子および右単位子が恒等なモノイダル圏を **厳格モノイダル圏** (*strict monoidal category*) と呼ぶ。

モノイダル圏 $\mathcal{M}$ に対して、$x\otimes^{\operatorname{rev}}y\coloneqq y\otimes x$ により、積を反転させたモノイダル圏 $\mathcal{M}^{\operatorname{rev}}$ が定義できる。これを **反転モノイダル圏** (*reverse monoidal category*) と呼ぶ。

以下はモノイダル圏の例である。

| 圏 | テンソル積 | 単位対象 |
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

任意の有限個の対象の積が存在するような圏を **カルテシアン圏** (*cartesian category*) という。特に、カルテシアン圏 $\mathcal{C}$ であって各対象 $A\in\mathcal{C}$ に対して函手 ${-}\times A\colon\mathcal{C}\to\mathcal{C}$ が右随伴 $[A,{-}]\colon\mathcal{C}\to\mathcal{C}$ を持つような圏を **カルテシアン閉圏** (*cartesian closed category*) という。

---

### モノイダル函手とモノイダル自然変換

モノイダル圏 $\mathcal{M},\mathcal{N}$ の間の **ラックスモノイダル函手** (*lax monoidal functor*)、あるいは単に **モノイダル函手** (*monoidal functor*) とは、以下のデータからなる:

- 下部圏の間の函手 $T\colon\mathcal{M}_0\to\mathcal{N}_0$;
- **劣加法手** (*subadditator*) と呼ばれる自然変換 $\eta\colon T(-)\otimes T(-)\Rightarrow T({-}\otimes{-})$;
- **単位手** (*unitor*) と呼ばれる $\mathcal{N}$ の射 $\mu\colon I_\mathcal{N}\to T(I_\mathcal{M})$;

これらのデータは、以下の公理を満たす:

- **結合律(associativity)**: 以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[xscale=4.5]
                \node (A) at (0,2) { $(T(a)\otimes T(b))\otimes T(c)$ };
                \node (B) at (1,2) { $T(a)\otimes(T(b)\otimes T(c))$ };
                \node (C) at (0,1) { $T(a\otimes b)\otimes T(c)$ };
                \node (D) at (1,1) { $T(a)\otimes T(b\otimes c)$ };
                \node (E) at (0,0) { $T((a\otimes b)\otimes c)$ };
                \node (F) at (1,0) { $T(a\otimes(b\otimes c))$ };
                \draw[->] (A) to node[scale=.8,auto=left] { $\alpha_{\mathcal{N}}$ } (B);
                \draw[->] (A) to node[scale=.8,auto=right] { $\eta_{a,b}\otimes T(c)$ } (C);
                \draw[->] (B) to node[scale=.8,auto=left] { $T(a)\otimes\eta_{b,c}$ } (D);
                \draw[->] (C) to node[scale=.8,auto=right] { $\eta_{a\otimes b,c}$ } (E);
                \draw[->] (D) to node[scale=.8,auto=left] { $\eta_{a,b\otimes c}$ } (F);
                \draw[->] (E) to node[scale=.8,auto=left] { $T(\alpha_{\mathcal{M}})$ } (F);
        \end{tikzpicture}
    \end{document}
    ```

- **単位律(unitality)**: 以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[xscale=3.5,auto=left]
                \node (A) at (0,1) { $T(a)\otimes I_\mathcal{N}$ };
                \node (B) at (1,1) { $T(a)\otimes T(I_\mathcal{M})$ };
                \node (C) at (0,0) { $T(a)$ };
                \node (D) at (1,0) { $T(a\otimes I_\mathcal{M})$ };
                \draw[->] (A) to node[scale=.8,auto=left] { $T(a)\otimes\mu$ } (B);
                \draw[->] (A) to node[scale=.8,auto=left] { $\rho_{\mathcal{N}}$ } (C);
                \draw[->] (D) to node[scale=.8,auto=left] { $T(\rho_{\mathcal{M}})$ } (C);
                \draw[->] (B) to node[scale=.8,auto=left] { $\eta_{a,I_\mathcal{M}}$ } (D);
        \end{tikzpicture}
        \begin{tikzpicture}[xscale=3.5]
                \node (A) at (0,1) { $I_\mathcal{N}\otimes T(a)$ };
                \node (B) at (1,1) { $T(I_\mathcal{M})\otimes T(a)$ };
                \node (C) at (0,0) { $T(a)$ };
                \node (D) at (1,0) { $T(I_\mathcal{M}\otimes a)$ };
                \draw[->] (A) to node[scale=.8,auto=left] { $\mu\otimes T(a)$ } (B);
                \draw[->] (A) to node[scale=.8,auto=left] { $\lambda_{\mathcal{N}}$ } (C);
                \draw[->] (D) to node[scale=.8,auto=left] { $T(\lambda_{\mathcal{M}})$ } (C);
                \draw[->] (B) to node[scale=.8,auto=left] { $\eta_{I_\mathcal{M},a}$ } (D);
        \end{tikzpicture}
    \end{document}
    ```

特に、$\mu$ が同型なとき **正規モノイダル函手** (*normal monoidal functor*) といい、$\eta,\mu$ がともに同型なとき **強モノイダル函手** (*strong monoidal functor*)、$\eta,\mu$ がともに恒等なとき **厳格モノイダル函手** (*strict monoidal functor*) という。

ラックスモノイダル函手 $F,G\colon\mathcal{M}\to\mathcal{N}$ の間の自然変換 $\sigma\colon F\Rightarrow G$ が以下の可換図式をそれぞれ満たすとき、**モノイダル自然変換** (*monoidal natural transformation*) と呼ぶ:
<div style="text-align: center;">

```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools}
\usepackage{tikz}
\begin{document}
    \begin{tikzpicture}[xscale=4.0]
        \node (AA) at (0,0) { $F(a\otimes b)$ };
        \node (BA) at (1,0) { $G(a\otimes b)$ };
        \node (AB) at (0,1) { $F(a)\otimes F(b)$ };
        \node (BB) at (1,1) { $G(a)\otimes G(b)$ };
        \draw[->] (AA) to node[scale=.8,auto=left] { $\sigma_{a\otimes b}$ } (BA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\sigma_a\otimes\sigma_b$ } (BB);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\eta_{a,b}^{(F)}$ } (AA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\eta_{a,b}^{(G)}$ } (BA);
    \end{tikzpicture}
    \begin{tikzpicture}[xscale=2.0]
        \node (BA) at (1,0) { $I_{\mathcal{N}}$ };
        \node (AB) at (0,1) { $F(I_{\mathcal{M}})$ };
        \node (CB) at (2,1) { $G(I_{\mathcal{M}})$ };
        \draw[->] (BA) to (BA-|AB) to node[scale=.8,auto=right] { $\mu^{(F)}$ } (AB);
        \draw[->] (BA) to (BA-|CB) to node[scale=.8,auto=right] { $\mu^{(G)}$ } (CB);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\sigma_{I_{\mathcal{M}}}$ } (CB);
    \end{tikzpicture}
\end{document}
```

</div>

モノイダル圏 $\mathcal{M},\mathcal{N}$ に対して、$\mathcal{M}$ から $\mathcal{N}$ へのラックスモノイダル函手とその間のモノイダル自然変換からなる圏を $\mathsf{Mon}(\mathcal{M},\mathcal{N})$ とすると、$\mathsf{Mon}(\mathcal{M},\mathcal{N})$ は、点ごとの積によりモノイダル圏となる。

モノイダル圏と厳格モノイダル圏の間には次のような関係がある。

Proposition.
:   任意のモノイダル圏に対して、モノイダル圏同値であるような厳格モノイダル圏が存在し、その対応は自然である。

次の命題の意味で、**モノイダル圏はすべて厳格であると仮定してよい** と言われることがある。

---

### モノイド対象・余モノイド対象

モノイダル圏 $\mathcal{M}$ における **モノイド対象** (*monoid object*) とは、以下のデータからなる:

- 対象 $m\in\mathcal{M}$;
- **乗法** (*multiplication*) と呼ばれる $\mathcal{M}$ の射 $\mu\colon m\otimes m\to m$;
- **単位** (*unit*) と呼ばれる $\mathcal{M}$ の射 $\eta\colon I\to m$;

また、これらのデータは以下の公理を満たす:

- **結合律** (*associativity*): 以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[xscale=3]
            \node (AA) at (0,0) { $m\otimes m$ };
            \node (CA) at (2,0) { $m$ };
            \node (AB) at (0,1) { $(m\otimes m)\otimes m$ };
            \node (BB) at (1,1) { $m\otimes(m\otimes m)$ };
            \node (CB) at (2,1) { $m\otimes m$ };
            \draw[->] (AA) to node[scale=.8,auto=left] { $\mu$ } (CA);
            \draw[->] (AB) to node[scale=.8,auto=left] { $\mu\otimes m$ } (AA);
            \draw[->] (AB) to node[scale=.8,auto=left] { $\alpha$ } (BB);
            \draw[->] (BB) to node[scale=.8,auto=left] { $m\otimes\mu$ } (CB);
            \draw[->] (CB) to node[scale=.8,auto=left] { $\mu$ } (CA);
        \end{tikzpicture}
    \end{document}
    ```

- **単位律** (*unitality*): 以下の図式が可換となる:
    ```latex {cmd=true latex_zoom=300% hide=true}
    \documentclass{standalone}
    \usepackage{mathrsfs,mathtools}
    \usepackage{tikz}
    \begin{document}
        \begin{tikzpicture}[xscale=3]
            \node (BA) at (1,0) { $m$ };
            \node (AB) at (0,1) { $I\otimes m$ };
            \node (BB) at (1,1) { $m\otimes m$ };
            \node (CB) at (2,1) { $m\otimes I$ };
            \draw[->] (BB) to node[scale=.8,auto=left] { $\mu$ } (BA);
            \draw[->] (AB) to node[scale=.8,auto=right] { $\lambda$ } (BA);
            \draw[->] (CB) to node[scale=.8,auto=left] { $\rho$ } (BA);
            \draw[->] (AB) to node[scale=.8,auto=left] { $\eta\otimes m$ } (BB);
            \draw[->] (CB) to node[scale=.8,auto=right] { $m\otimes\eta$ } (BB);
        \end{tikzpicture}
    \end{document}
    ```

また、$\mathcal{M}^{\textrm{op}}$ [^opposite-monoid]におけるモノイド対象を $\mathcal{M}$ における **余モノイド対象** (*comonoid object*) と呼ぶ。

[^opposite-monoid]: 反転モノイダル圏 $\mathcal{M}^{\operatorname{rev}}$ でなく、通常の圏に対する双対圏のことである。代わりに $\mathcal{M}^{\operatorname{rev}}$ でモノイド対象を考えると、$\mathcal{M}$ のモノイド対象となってしまい、逆も然りである。

モノイダル圏 $\mathcal{M}$ におけるモノイド対象 $m,n$ に対して、$m$ から $n$ への\textbf{モノイド射}(\textbf{monoid morphism}) $f$ とは、$\mathcal{M}$ における射 $f\colon m\to n$ であって、以下の図式がそれぞれ可換となる:
```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools}
\usepackage{tikz}
\begin{document}
    \begin{tikzpicture}[xscale=3]
        \node (AA) at (0,0) { $m$ };
        \node (BA) at (1,0) { $n$ };
        \node (AB) at (0,1) { $m\otimes m$ };
        \node (BB) at (1,1) { $n\otimes n$ };
        \draw[->] (AA) to node[scale=.8,auto=left] { $f$ } (BA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $f\otimes f$ } (BB);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\mu_m$ } (AA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\mu_n$ } (BA);
    \end{tikzpicture}
    \begin{tikzpicture}[xscale=3]
        \node (BA) at (1,0) { $n$ };
        \node (AB) at (0,1) { $I$ };
        \node (BB) at (1,1) { $m$ };
        \draw[->] (AB) to node[scale=.8,auto=right] { $\eta_n$ } (BA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\eta_m$ } (BB);
        \draw[->] (BB) to node[scale=.8,auto=left] { $f$ } (BA);
    \end{tikzpicture}
\end{document}
```

モノイド対象の例として、次が挙げられる:

- 集合の圏と集合の直積によるモノイダル圏 $(\mathsf{Set},\times,1)$ におけるモノイド対象は、通常の意味でのモノイドである。
- 位相空間の圏と空間の直積によるモノイダル圏 $(\mathsf{Top},\times,1)$ におけるモノイド対象は、位相モノイドになる。
- 可換環 $R$ に対して、$R$ -加群とその間の加群準同型のなす圏と加群のテンソル積によるモノイダル圏 $(R\text{-}\mathsf{Mod},\otimes_R,R)$ におけるモノイド対象は、$R$ -多元環となる。特に $R=\mathbb{Z}$ のとき $R\text{-}\mathsf{Mod}$ はアーベル群のなす圏 $\mathsf{Ab}$ となり、そのモノイド対象は環となる。
- 任意の圏 $\mathcal{C}$ に対し、その自己函手の圏 $\operatorname{End}\mathcal{C}$ は函手の合成および恒等函手の誘導するモノイド構造を持つ。このモノイド圏 $\operatorname{End}\mathcal{C}$ におけるモノイド対象は $\mathcal{C}$ のモナドである。

モノイダル圏 $\mathcal{M}$ のモノイド対象とその間のモノイド射は圏を構成する。また、$\mathcal{M}$ の余モノイド対象とその間のモノイド射も圏を構成する。

モノイド対象 $\mathbf{m}=(m,\mu,\eta)$ に対して、$\mathbf{m}$ 上の左加群とは対象 $n\in\mathcal{M}$ と射 $\lambda\colon m\otimes n\to n$ の組 $(n,\lambda)$ であって、次の２つの図式がそれぞれ可換となる:
```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools}
\usepackage{tikz}
\begin{document}
    \begin{tikzpicture}[xscale=3]
        \node (AA) at (0,0) { $m\otimes n$ };
        \node (BA) at (1,0) { $n$ };
        \node (AB) at (0,1) { $m\otimes m\otimes n$ };
        \node (BB) at (1,1) { $m\otimes n$ };
        \draw[->] (AA) to node[scale=.8,auto=left] { $\lambda$ } (BA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\operatorname{id}_m\otimes\lambda$ } (BB);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\mu\otimes\operatorname{id}_n$ } (AA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\lambda$ } (BA);
    \end{tikzpicture}
    \begin{tikzpicture}[xscale=3]
        \node (BA) at (1,0) { $n$ };
        \node (AB) at (0,1) { $I\otimes n$ };
        \node (BB) at (1,1) { $m\otimes n$ };
        \draw[->] (AB) to node[scale=.8,auto=right] { $\cong$ } (BA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\eta\otimes\operatorname{id}_n$ } (BB);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\lambda$ } (BA);
    \end{tikzpicture}
\end{document}
```

他方、$\mathcal{M}^{\operatorname{rev}}$ における $\mathbf{m}$ 上の左加群を $\mathbf{m}$ 上の右加群という。

---

### モナド

圏 $\mathcal{C}$ 上の **モナド** (*monad*) とは、以下のデータからなる:

- 函手 $T\colon\mathcal{C}\to\mathcal{C}$;
- 自然変換 $\eta\colon\operatorname{id}_{\mathcal{C}}\Rightarrow T$;
- 自然変換 $\mu\colon T^2\Rightarrow T$;

これらのデータは、以下の図式をそれぞれ可換にする:
```latex {cmd=true latex_zoom=300% hide=true}
\documentclass{standalone}
\usepackage{mathrsfs,mathtools}
\usepackage{tikz}
\begin{document}
    \begin{tikzpicture}[xscale=2]
        \node (AA) at (0,0) { $T^2$ };
        \node (BA) at (1,0) { $T$ };
        \node (AB) at (0,1) { $T^3$ };
        \node (BB) at (1,1) { $T^2$ };
        \draw[->] (AA) to node[scale=.8,auto=left] { $\mu$ } (BA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\mu$ } (BA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $T\mu$ } (BB);
        \draw[->] (AB) to node[scale=.8,auto=right] { $\mu T$ } (AA);
    \end{tikzpicture}
    \begin{tikzpicture}[xscale=2]
        \node (AA) at (0,0) { $T^2$ };
        \node (BA) at (1,0) { $T$ };
        \node (AB) at (0,1) { $T$ };
        \node (BB) at (1,1) { $T^2$ };
        \draw[->] (AA) to node[scale=.8,auto=left] { $\mu$ } (BA);
        \draw[->] (BB) to node[scale=.8,auto=left] { $\mu$ } (BA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\eta T$ } (BB);
        \draw[->] (AB) to node[scale=.8,auto=right] { $T\eta$ } (AA);
        \draw[->] (AB) to node[scale=.8,auto=left] { $\operatorname{id}_T$ } (BA);
    \end{tikzpicture}
\end{document}
```

$\eta$ 、$\mu$ はモナド $(T,\eta,\mu)$ の単位、合成と呼ばれる。

自己函手のなすモノイダル圏 $\operatorname{End}\mathcal{C}$ におけるモノイド対象は圏 $\mathcal{C}$ のモナドとなる。
双対として、モノイダル圏 $\operatorname{End}\mathcal{C}$ における余モノイド対象を圏 $\mathcal{C}$ の **余モナド** (*comonad*) と呼ぶ。

随伴函手はモナドを伴う。
すなわち、随伴 $F\dashv G\colon\mathcal{C}\to\mathcal{D}$ に対して、函手 $GF\colon\mathcal{C}\to\mathcal{C}$ はモナドになる。ここで、モナドの単位射 $\eta_X\colon X\to GF(X)$ は随伴の単位射とし、モナドの合成射 $\mu_X\colon GFGF(X)\to GF(X)$ は随伴の余単位射 $\varepsilon_Y\colon FG(Y)\to Y$ を用いて $G\varepsilon_{F(X)}$ で定まる。

また、全てのモナドは随伴函手の合成として表すことができる。圏 $\mathcal{C}$ 上のモナド $(T,\eta,\mu)$ に伴う特別な随伴として、Eilenberg-Moore圏 $\mathcal{C}^{T}$ とKleisli圏 $\mathcal{C}_{T}$ への随伴が知られている。

#### Eilenberg-Moore圏

圏 $\mathcal{C}$ 上のモナド $(T,\eta,\mu)$ に対して、$\mathcal{C}$ の対象 $A$ と射 $a\colon TA\to A$ の組を $T$ -代数という。また、$T$ -代数 $(A,a)$ , $(B,b)$ の間の射 $f\colon(A,a)\to(B,b)$ を、$b\circ Tf=f\circ a$ を満たす $\mathcal{C}$ の射 $f\colon A\to B$ で定める。
$T$ による **Eilenberg-Moore圏** (*Eilenberg-Moore category*) $\mathcal{C}^{T}$ とは、$T$ -代数とその間の射からなる圏である。

Eilenberg-Moore圏 $\mathcal{C}^{T}$ に対して、随伴となる函手 $F^T\colon\mathcal{C}\to\mathcal{C}^T$ と $U_{T}\colon\mathcal{C}^{T}\to\mathcal{C}$ は次のように定められる:

- $F^T(A)=(TA,\mu_A)$ , $f\in\mathcal{C}(A,B)$ に対して $F^T(f)=Tf$ ,
- $U^T(A,a)=A$ , $f\in\mathcal{C}^T((A,a),(B,b))$ に対して $U^T(f)=f$

定義から $U^{T}\circ F^{T}=T$ なため、$T$ は随伴 $F^{T}\dashv U^{T}$ に伴うモナドである。

Eilenberg-Moore圏とそれに伴う随伴は、任意の随伴 $F\dashv G\colon\mathcal{C}\to\mathcal{D}$ に対して $L\circ F=F^T$ かつ $U^T\circ L=G$ を満たす函手 $L\colon\mathcal{D}\to\mathcal{C}^T$ がただ1つ存在するという性質を持つ。

#### Kleisli圏

まず、Kleisliトリプルを定義する。

圏 $\mathcal{C}$ 上の **Kleisliトリプル** (*Kleisli triple*) とは、函手 $T\colon\mathcal{C}\to\mathcal{C}$ 、自然変換 $\eta\colon\operatorname{id}_\mathcal{C}\to T$ 、拡張演算子 $(-)^\ast\colon\mathcal{C}(A,TB)\to\mathcal{C}(TA,TB)$ の組 $(T,\eta,(-)^\ast)$ であって、以下の条件を満たす:

- $\eta_A^\ast=\operatorname{id}_{TA}$ ,
- $f\colon A\to TB$ に対して $f^\ast\circ\eta_A=f$ ,
- $f\colon A\to TB$ , $g\colon B\to TC$ に対して $g^\ast\circ f^\ast=(g^\ast\circ f)^\ast$

Kleisli圏は、このKleisliトリプルを用いて定義される。

圏 $\mathcal{C}$ 上のKleisliトリプル $(T,\eta,(-)^\ast)$ に対して、**Kleisli圏** (*Kleisli category*) $\mathcal{C}_T$ とは以下のデータからなる圏である:

- $\mathcal{C}_T$ の対象は、$\mathcal{C}$ の対象である,
- $\mathcal{C}_T$ の対象 $A,B$ に対して $\mathcal{C}_T(A,B)=\mathcal{C}(A,TB)$ である,
- $\mathcal{C}_T$ の射 $f\in\mathcal{C}_T(A,B)$ , $g\in\mathcal{C}_T(B,C)$ に対して合成 $g\cdot f$ は、$\mathcal{C}$ における合成 $g^\ast\circ f$ である

$\mathcal{C}$ 上のモナド $(T,\eta,\mu)$ に対して、拡張演算子 $(-)^\ast$ を $\mathcal{C}$ の射 $f\colon A\to TB$ に対して $f^\ast=\mu_B\circ Tf$ とすることで、Kleisliトリプル $(T,\eta,(-)^\ast)$ が定まる。
この対応により、$\mathcal{C}$ 上のモナドを与えることと $\mathcal{C}$ 上のKleisliトリプルを与えることは同値となる。

Kleisli圏 $\mathcal{C}_T$ に対して、随伴となる函手 $F_{T}\colon\mathcal{C}\to\mathcal{C}_T$ と $U_{T}\colon\mathcal{C}_{T}\to \mathcal{C}$ は次のように定められる:

- $F_T(A)=A$ , $f\in\mathcal{C}(A,B)$ に対して $F_T(f)=\eta_B\circ f$ ,
- $U_T(A)=TA$ , $f\in\mathcal{C}_T(A,B)$ に対して $U_T(f)=\mu_B\circ Tf$

定義から $U_{T}\circ F_{T}=T$ なため、$T$ は随伴 $F_{T}\dashv U_{T}$ に伴うモナドである。

Kleisli圏とそれに伴う随伴は、任意の随伴 $F\dashv G\colon\mathcal{C}\to\mathcal{D}$ に対して $K\circ F_T=F$ かつ $G\circ K=U_T$ を満たす函手 $K\colon\mathcal{C}_T\to\mathcal{D}$ がただ1つ存在するという性質を持つ。
