# 位相空間論

## はじめに

位相空間論は, 点の間の距離そのものではなく, 点の近傍, 収束, 連続性を定める構造を扱う理論である.
距離空間では開球が近傍系を与えるが, 位相空間では開集合の族を公理として定めることで, 距離を指定せずに同じ問題を扱える.
この一般化によって, 積空間, 商空間, 関数空間のように単一の距離で表すことが自然でない対象にも, 連続写像と収束を共通の言葉で適用できる.

位相空間論で調べる対象は, 個々の点の座標や距離の値ではなく, 開集合と閉集合の配置で保たれる性質である.
連結性は空間が二つの開部分に分かれるかどうかを表し, コンパクト性は開被覆から有限部分被覆を選べるかどうかを表す.
分離公理は点や閉集合を近傍または連続実数値関数で分離できる条件を整理する.
これらの性質は連続写像でどのように保存されるかを通じて, 異なる構成から得られる空間を比較する基準となる.

点列は距離空間では収束を記述する基本的な道具であるが, 一般の位相空間では点列だけでは閉包や連続性を検出できない場合がある.
本書ではネットとフィルターを導入し, 任意の位相空間における収束, 集積点, コンパクト性を統一して記述する.
一様空間では点の近さを二点の組の近傍として扱い, Cauchy フィルター, 完備性, 完備化を距離空間から拡張する.

前半では集合と順序に関する準備の後, 距離空間から位相空間へ進み, 積, 余積, 商などの空間の構成を定める.
続いて分離性, 連結性, 可算性, 被覆と次元, コンパクト性を扱う.
後半では一様空間とゲージ空間を準備し, 距離化定理, Baire のカテゴリー定理, 局所コンパクト性, 一点コンパクト化, Stone-Čech コンパクト化を述べる.
最後に Urysohn の補題, Tietze の拡張定理, 分割の一を通じて正規性が連続関数の構成に果たす役割を示し, コンパクト開位相を備えた関数空間を扱う.

本書を読むためには, 集合, 写像, 実数の基本的な性質と初歩的な論理を仮定する.
選択公理は超フィルターやコンパクト性の議論で用いるため, 使用する箇所ではその役割を明記する.
定理の仮定は分離公理や可算性の条件に敏感であるため, 結論だけでなく仮定がどこで使われるかを追うことが必要である.

本書の標準的な参考文献として, 一般位相の基礎からコンパクト性と分離性までを体系的に扱う森田[1](#reference-1)および児玉と永見[2](#reference-2), フィルターと積空間を含む古典的な構成を詳述する Kelley[3](#reference-3)を挙げる.
本文で証明を省略する場合や別の流儀を参照したい場合には, これらを参照されたい.

$`1`$ 以上の整数を特に自然数と呼ぶこととし, いくつかの代表的な集合の記号を以下で定める:
$`\mathbb{N}`$ :自然数全体の集合, $`\mathbb{Z}`$ :整数全体の集合, $`\mathbb{Q}`$ :有理数全体の集合, $`\mathbb{R}`$ :実数全体の集合

参考文献
:   <a id="reference-1"></a>1. 森田紀一著, 位相空間論, 岩波全書 331, 岩波書店, 1981年11月.
    <a id="reference-2"></a>2. 児玉之宏, 永見啓応著, 位相空間論, 岩波書店, 1974年8月.
    <a id="reference-3"></a>3. John L. Kelley 著, 児玉之宏訳, 位相空間論, 数学叢書 2, 吉岡書店, 1968年5月.
    <a id="reference-4"></a>4. nLab authors, *nLab*, https://ncatlab.org/.

---

## 準備

位相に関する収束とコンパクト性は, フィルターや順序構造を用いると統一的に記述できる.
この節では, 後で用いる選択公理と, 順序集合上のイデアルおよびフィルターの基本事項を定める.

### 集合と基本演算

集合と写像に関する初歩的な事項を前提とする.
ここでは, 本書で繰り返し用いる集合演算と記法を定める.

集合 $`X,Y`$ に対して, $`X\subseteq Y`$ は $`X`$ の各元が $`Y`$ に属することを表す.
$`X\subsetneq Y`$ は $`X\subseteq Y`$ かつ $`X\neq Y`$ を表す.
元を持たない集合を $`\emptyset`$ と表す.

Definition. **集合族と集合演算**
:   $`X`$ の部分集合からなる集合を **$`X`$ の部分集合族** または単に **集合族** という.
    集合 $`\Lambda`$ と各 $`\lambda\in\Lambda`$ に対する集合 $`A_\lambda`$ があり, $`\mathcal A=\{A_\lambda\mid\lambda\in\Lambda\}`$ と書けるとき, $`\Lambda`$ を $`\mathcal A`$ の **添字集合** という.
    $`A,B\subseteq X`$ に対して,
    ```math
    A\cup B\coloneqq\{x\in X\mid x\in A\lor x\in B\},\qquad
    A\cap B\coloneqq\{x\in X\mid x\in A\land x\in B\},
    ```
    ```math
    A\setminus B\coloneqq\{x\in X\mid x\in A\land x\notin B\}
    ```
    と定め, それぞれ **和集合**, **共通部分**, **差集合** という.
    特に $`A\subseteq X`$ に対して $`A^\complement\coloneqq X\setminus A`$ を $`X`$ における $`A`$ の **補集合** という.

    $`X`$ の部分集合族 $`\mathcal A`$ に対して,
    ```math
    \bigcup\mathcal A\coloneqq\{x\in X\mid\exists A\in\mathcal A,\ x\in A\},\qquad
    \bigcap\mathcal A\coloneqq\{x\in X\mid\forall A\in\mathcal A,\ x\in A\}
    ```
    と定める.
    $`\mathcal A=\{A_\lambda\mid\lambda\in\Lambda\}`$ のとき, これらをそれぞれ $`\bigcup_{\lambda\in\Lambda}A_\lambda`$, $`\bigcap_{\lambda\in\Lambda}A_\lambda`$ と書く.
    この約束により, $`\bigcup\emptyset=\emptyset`$ および $`\bigcap\emptyset=X`$ である.

    $`A\cap B=\emptyset`$ のとき, $`A,B`$ は **互いに素** であるという.
    互いに素な集合族の和集合は, 必要に応じて $`\bigsqcup`$ を用いて **非交和** と書く.

Definition. **冪集合、直積集合、タグ付き和**
:   $`X`$ の部分集合全体からなる集合
    ```math
    \mathcal P(X)\coloneqq\{A\mid A\subseteq X\}
    ```
    を $`X`$ の **冪集合** という.
    本書では $`\mathcal P(X)`$ を $`2^X`$ とも表す.
    二つの集合 $`X,Y`$ に対して,
    ```math
    X\times Y\coloneqq\{(x,y)\mid x\in X,\ y\in Y\}
    ```
    を $`X`$ と $`Y`$ の **直積集合** という.
    集合族 $`(X_\lambda\mid\lambda\in\Lambda)`$ の **直積集合** を
    ```math
    \prod_{\lambda\in\Lambda}X_\lambda
    \coloneqq
    \left\{x:\Lambda\to\bigcup_{\lambda\in\Lambda}X_\lambda
    \mathrel{}\middle|\mathrel{}
    \forall\lambda\in\Lambda,\ x(\lambda)\in X_\lambda\right\},
    ```
    と定める.
    その標準射影を $`\pi_\lambda(x)\coloneqq x(\lambda)`$ と表す.

    一方, **タグ付き和** を
    ```math
    \coprod_{\lambda\in\Lambda}X_\lambda
    \coloneqq
    \{(x,\lambda)\mid \lambda\in\Lambda,\ x\in X_\lambda\}
    ```
    と定める.
    これは各 $`X_\lambda`$ の元に添字 $`\lambda`$ を付して区別する集合であり, 互いに素でない集合族に対しても定義される.
    標準入射を $`\iota_\lambda:X_\lambda\to\coprod_{\mu\in\Lambda}X_\mu`$, $`\iota_\lambda(x)\coloneqq(x,\lambda)`$ と表す.

Definition. **像と逆像**
:   写像 $`f:X\to Y`$ と部分集合 $`A\subseteq X`$, $`B\subseteq Y`$ に対して,
    ```math
    f(A)\coloneqq\{f(x)\mid x\in A\},\qquad
    f^{-1}(B)\coloneqq\{x\in X\mid f(x)\in B\}
    ```
    をそれぞれ $`A`$ の **像** と $`B`$ の **逆像** という.

Proposition. **像、逆像と集合演算**
:   写像 $`f:X\to Y`$, $`X`$ の部分集合族 $`(A_\lambda\mid\lambda\in\Lambda)`$, および $`Y`$ の部分集合族 $`(B_\lambda\mid\lambda\in\Lambda)`$ に対して,
    ```math
    f\left(\bigcup_{\lambda\in\Lambda}A_\lambda\right)
    =\bigcup_{\lambda\in\Lambda}f(A_\lambda),\qquad
    f\left(\bigcap_{\lambda\in\Lambda}A_\lambda\right)
    \subseteq\bigcap_{\lambda\in\Lambda}f(A_\lambda),
    ```
    ```math
    f^{-1}\left(\bigcup_{\lambda\in\Lambda}B_\lambda\right)
    =\bigcup_{\lambda\in\Lambda}f^{-1}(B_\lambda),\qquad
    f^{-1}\left(\bigcap_{\lambda\in\Lambda}B_\lambda\right)
    =\bigcap_{\lambda\in\Lambda}f^{-1}(B_\lambda),
    ```
    ```math
    f^{-1}(B^\complement)=f^{-1}(B)^\complement
    ```
    が成り立つ.
    ただし補集合はそれぞれ $`Y`$ および $`X`$ における補集合である.
    像に関する共通部分の包含は, 一般には等式にならない.

Proof.
:   像の和集合に関する等式は, 左辺の元がある $`A_\lambda`$ に属する元の像であることと同値である.
    共通部分については, $`x`$ がすべての $`A_\lambda`$ に属すれば $`f(x)`$ がすべての $`f(A_\lambda)`$ に属すため, 包含関係を得る.
    逆像については, $`x\in X`$ が各辺に属することを $`f(x)`$ が対応する $`B_\lambda`$ に属することへ書き直せばよい.
    和集合, 共通部分, 補集合の定義から, 表示した三つの等式が従う.

Definition. **同値関係と商集合**
:   集合 $`X`$ 上の二項関係 $`\sim`$ が, 任意の $`x,y,z\in X`$ に対して
    ```math
    x\sim x,\qquad x\sim y\Longrightarrow y\sim x,\qquad
    x\sim y\land y\sim z\Longrightarrow x\sim z
    ```
    を満たすとき, $`\sim`$ を **同値関係** という.
    $`x\in X`$ に対して
    ```math
    [x]_\sim\coloneqq\{y\in X\mid y\sim x\}
    ```
    を $`x`$ の **同値類** といい,
    ```math
    X/{\sim}\coloneqq\{[x]_\sim\mid x\in X\}
    ```
    を **商集合** という.
    写像 $`\pi:X\to X/{\sim}`$, $`x\mapsto[x]_\sim`$ を標準的な **商射影** と呼ぶ.

### 選択公理

Axiom. **選択公理**
:   空でない集合からなる集合族 $`\Sigma`$ に対して, 各 $`S\in\Sigma`$ ごとに $`f(S)\in S`$ となるような写像 $`f:\Sigma\to\bigcup\Sigma`$ が存在する.

Theorem. **選択公理と同値な命題**
:   以下, 選択公理と同値:
    1. **Zermelo の整列可能定理**<br>任意の集合は整列可能である.
    2. **Zorn の補題**<br>順序集合に対して, 任意の全順序部分集合が有界ならば極大元が存在する.
    3. **Tukey の補題**<br>有限性を満たす空でない任意の集合族は包含関係に関する極大元を持つ.

<u>proof.</u>
:   選択公理から整列可能定理は, 選択関数で未選択部分から元を一つずつ取り出す超限再帰により得られる.
    整列可能定理を用いると, 鎖の上界を順に付け加える再帰から Zorn の補題が従う.
    逆に Zorn の補題を, 各 $`S\in\Sigma`$ で高々一つの値を取る部分選択関数の包含順序に適用する.
    極大な部分選択関数の定義域が $`\Sigma`$ 全体でなければ値を一つ追加できるので, 極大性に反する.
    よって選択関数が得られる.
    Tukey の補題は有限性を満たす部分族の包含順序に Zorn の補題を適用して得られ, 同じ部分選択関数の族は有限性を満たすので Tukey の補題からも選択公理が従う.

### 順序集合のイデアルとフィルター

Definition. **イデアル**
:   半順序集合 $`(P,\leq)`$ における **イデアル基** (*ideal basis*) とは, $`P`$ の空でない部分集合 $`I`$ であって次を満たす:
    ```math
    \forall x,y\in I,\exists z\in I\text{ s.t. }x\leq z\land y\leq z
    ```
    特に, 下方に閉じているイデアル基を **イデアル** (*ideal*) という.

特に, $`(P,\leq)`$ における **極大イデアル** (maximal ideal) あるいは **超イデアル** (*ultraideal*) とは, $`(P,\leq)`$ のイデアル $`M\subsetneq P`$ であって, $`(P,\leq)`$ の任意のイデアル $`I`$ が $`I\subseteq M`$ であれば $`M=I`$ となるときいう.

Definition. **フィルター**
:   半順序集合 $`(P,\leq)`$ における **フィルター基** (*filter basis*) とは, $`P`$ の空でない部分集合 $`F`$ であって次を満たす:
    ```math
    \forall x,y\in F,\exists z\in F\text{ s.t. }z\leq x\land z\leq y
    ```
    特に, 上方に閉じているフィルター基を **フィルター** (*filter*) という.

特に, $`(P,\leq)`$ における **極大フィルター** (maximal filter) あるいは **超フィルター** (*ultrafilter*) とは, $`(P,\leq)`$ の真のフィルター $`M\subsetneq P`$ であって, 任意のフィルター $`F`$ に対し $`M\subseteq F\subsetneq P`$ ならば $`M=F`$ となるものをいう.

Proposition. **イデアル基の生成するイデアル**
:   半順序集合 $`(P,\leq)`$ のイデアル基 $`I`$ に対して, $`P`$ の部分集合 $`\overline{I}`$ を
    ```math
    \overline{I}\coloneqq\{x\in P\mid\exists i\in I\text{ s.t. }x\leq i\}
    ```
    とすると, $`\overline{I}`$ は $`I`$ を含むイデアルであって最も弱いものである.

<u>proof.</u>
:   まず $`I\subseteq\overline{I}`$ である.
    実際, $`i\in I`$ に対して $`i\leq i`$ であるから $`i\in\overline{I}`$ となる.

    $`x,y\in\overline{I}`$ をとる.
    ある $`i,j\in I`$ が $`x\leq i`$ と $`y\leq j`$ を満たす.
    $`I`$ がイデアル基であるから, $`i\leq k`$ と $`j\leq k`$ を満たす $`k\in I`$ が存在する.
    したがって $`x\leq k`$ および $`y\leq k`$ であり, $`k\in\overline{I}`$ である.
    よって $`\overline{I}`$ はイデアル基である.

    $`x\in\overline{I}`$ と $`y\leq x`$ をとる.
    $`x\leq i`$ となる $`i\in I`$ が存在するので, 推移律から $`y\leq i`$ である.
    よって $`y\in\overline{I}`$ であり, $`\overline{I}`$ は下方に閉じている.

    最後に, $`I`$ を含む任意のイデアル $`J`$ をとる.
    $`x\in\overline{I}`$ ならば $`x\leq i`$ となる $`i\in I`$ が存在する.
    $`i\in J`$ と $`J`$ の下方閉性から $`x\in J`$ が従う.
    したがって $`\overline{I}\subseteq J`$ である.

Proposition. **フィルター基の生成するフィルター**
:   半順序集合 $`(P,\leq)`$ のフィルター基 $`F`$ に対して, $`P`$ の部分集合 $`\overline{F}`$ を
    ```math
    \overline{F}\coloneqq\{x\in P\mid\exists f\in F\text{ s.t. }f\leq x\}
    ```
    とすると, $`\overline{F}`$ は $`F`$ を含むフィルターであって最も弱いものである.

<u>proof.</u>
:   $`f\in F`$ に対して $`f\leq f`$ であるから $`F\subseteq\overline{F}`$ である.

    $`x,y\in\overline{F}`$ をとる.
    ある $`f,g\in F`$ が $`f\leq x`$ と $`g\leq y`$ を満たす.
    $`F`$ がフィルター基であるから, $`h\leq f`$ と $`h\leq g`$ を満たす $`h\in F`$ が存在する.
    このとき $`h\leq x`$ と $`h\leq y`$ であるから $`h\in\overline{F}`$ である.
    よって $`\overline{F}`$ はフィルター基である.

    $`x\in\overline{F}`$ と $`x\leq y`$ をとる.
    $`f\leq x`$ となる $`f\in F`$ が存在し, 推移律から $`f\leq y`$ となる.
    よって $`y\in\overline{F}`$ であり, $`\overline{F}`$ は上方に閉じている.

    $`F`$ を含む任意のフィルター $`G`$ に対して, $`x\in\overline{F}`$ ならば $`f\leq x`$ となる $`f\in F`$ が存在する.
    $`f\in G`$ と $`G`$ の上方閉性から $`x\in G`$ が従う.
    したがって $`\overline{F}\subseteq G`$ である.

Proposition. **細分関係**
:   半順序集合 $`(P,\leq)`$ に対して, $`2^P`$ における二項関係 $`\trianglelefteq`$ を
    ```math
    A\trianglelefteq B\mathrel{\overset{\text{def}}{\iff}}\forall a\in A,\exists b\in B\text{ s.t. }a\leq b,\quad A,B\in2^P
    ```
    とすると, $`\trianglelefteq`$ は $`2^P`$ 上の前順序となる. このとき $`\trianglelefteq`$ を $`(P,\leq)`$ による細分関係という.

<u>proof.</u>
:   任意の $`A\subseteq P`$ と $`a\in A`$ に対して $`a\leq a`$ である.
    よって $`A\trianglelefteq A`$ であり, この関係は反射的である.

    $`A\trianglelefteq B`$ および $`B\trianglelefteq C`$ を仮定する.
    $`a\in A`$ に対して, ある $`b\in B`$ が $`a\leq b`$ を満たす.
    さらに, ある $`c\in C`$ が $`b\leq c`$ を満たす.
    半順序の推移律から $`a\leq c`$ である.
    よって $`A\trianglelefteq C`$ であり, この関係は推移的である.

---

## 距離空間

距離は二点の近さを実数で測る構造であり, 位相空間の代表的な具体例を与える.
点列の収束, Cauchy 列, 完備化を距離によって記述し, 後に導入する位相的な定義と比較する.

### 距離空間

Definition. **距離空間**
:   **集合 $`X`$ 上の距離** (*metric on a set $`X`$*) とは, 写像 $`d:X\times X\to\mathbb{R}`$ であって, **距離の公理** (*metric axioms*) と呼ばれる次の条件を満たすときいう:
    - **非負性**:<br><div style="margin-left: 2em;">任意の $`x,y\in X`$ に対して $`d(x,y)\geq 0`$,
    - **非退化性**:<br><div style="margin-left: 2em;">任意の $`x,y\in X`$ に対して $`x=y\iff d(x,y)=0`$,
    - **対称性**:<br><div style="margin-left: 2em;">任意の $`x,y\in X`$ に対して $`d(x,y)=d(y,x)`$,
    - **三角不等式**:<br><div style="margin-left: 2em;">任意の $`x,y,z\in X`$ に対して $`d(x,y)+d(y,z)\geq d(x,z)`$.

    集合 $`X`$ と $`X`$ 上の距離 $`d:X\times X\to\mathbb{R}`$ の組 $`(X,d)`$ を**距離空間** (*metric space*) といい, 集合 $`X`$ をこの距離空間の**台集合** (*underlying set*) という.

特に, 距離 $`d:X\times X\to\mathbb{R}`$ が条件
```math
\forall x,y,z\in X,\quad\max\{d(x,y),d(y,z)\}\geq d(x,z)
```
を満たすとき, $`d`$ は**非 Archimedes 的** (*non-Archimedean*) あるいは **超距離** (*ultrametric*) であるという.

Definition. **写像の連続性**
:   距離空間 $`(X, d_X), (Y, d_Y)`$ と写像 $`f:X\to Y`$ に対して, $`f`$ が**点 $`x_0\in X`$ で連続** (*continuous at point $`x_0\in X`$*) であるとは, 以下の条件を満たすときいう:
    ```math
    \forall\varepsilon>0,\exists\delta>0\text{ s.t. }\forall x\in X,d_X(x,x_0)\leq\delta\Rightarrow d_Y(f(x),f(x_0))\leq\varepsilon
    ```
    特に, 全ての $x_0\in X$ で連続な写像 $`f:X\to Y`$ を, **連続写像** (*Continuous function*) といい, $`f:(X, d_X)\to (Y, d_Y)`$ と表す.

距離空間 $`(X, d_X), (Y, d_Y)`$ と全単射な写像 $`f:X\to Y`$ に対して, $`f`$ と $`f^{-1}`$ がともに連続写像となるとき, $`f`$ を**同相写像** (*homeomorphism*) という.
また, 距離空間 $`(X, d_X), (Y, d_Y)`$ の間に同相写像が存在するとき, $`(X, d_X)`$ と $`(Y, d_Y)`$ は**同相** (*homeomorphic*) であるといい, 
```math
(X, d_X)\cong(Y, d_Y)
```
と表す.

Example. 連続な全単射の逆写像が連続とは限らない例
:   写像
    ```math
    f:[0,2\pi)\longrightarrow S^1,\quad t\longmapsto(\cos t,\sin t)
    ```
    は連続な全単射である.
    しかし, $`t_n=2\pi-1/n`$ とすると $`f(t_n)\to f(0)`$ である一方, $`t_n`$ は $`0`$ に収束しない.
    よって $`f^{-1}`$ は $`f(0)`$ で連続でない.

集合 $`X`$ 上の距離 $`d_1,d_2`$ に対して, $`X`$ 上の恒等写像が距離空間 $`(X,d_1), (X,d_2)`$ の間の同相写像となるとき, $`d_1,d_2`$ は**距離として同値** (*equivalent of metrics*) であるという.

Proposition. 距離の変換
:   集合 $`X`$ 上の距離 $`d`$ と, 写像 $`f:\mathbb{R}_{\geq0}\to\mathbb{R}_{\geq0}`$ をとる.
    $`f`$ が $`f(0)=0`$ で劣加法的な狭義単調増加写像なら, 合成写像 $`f\circ d`$ は $`X`$ 上の距離となる.
    特に $`f`$ が連続写像であれば, $`d`$ と $`f\circ d`$ は距離として同値となる.

<u>proof.</u>
:   $`d_f\coloneqq f\circ d`$ とおく.
    $`f`$ の狭義単調性と $`f(0)=0`$ より, $`d_f(x,y)=0`$ と $`d(x,y)=0`$ は同値である.
    非負性と対称性も直ちに従う.
    三角不等式 $`d(x,z)\leq d(x,y)+d(y,z)`$ と単調性および劣加法性から
    ```math
    d_f(x,z)
    \leq f(d(x,y)+d(y,z))
    \leq d_f(x,y)+d_f(y,z)
    ```
    を得る.
    したがって $`d_f`$ は距離である.

    $`f`$ が原点で連続なら, 任意の $`\varepsilon>0`$ に対して $`f(\delta)<\varepsilon`$ となる $`\delta>0`$ を選べるので, 恒等写像 $`(X,d)\to(X,d_f)`$ は連続である.
    逆に $`\varepsilon>0`$ に対して $`\eta=f(\varepsilon)>0`$ とおくと, $`d_f(x,y)<\eta`$ ならば狭義単調性により $`d(x,y)<\varepsilon`$ である.
    よって逆向きの恒等写像も連続であり, 二つの距離は同値である.

Definition. **距離を保つ写像**
:   距離空間 $`(X, d_X), (Y, d_Y)`$ と写像 $`f:X\to Y`$ に対して, $`f`$ が**距離を保つ** (*distance preserving*) とは, 以下の条件を満たすときいう:
    ```math
    \forall x,y\in X,d_X(x,y)=d_Y(f(x),f(y))
    ```
    距離を保つ写像を **等長写像** (*isometry*) といい, 全単射な等長写像 $`X\to Y`$ が存在する距離空間 $`(X, d_X), (Y, d_Y)`$ を距離空間として **等長** (*isometric*) という.

Definition. **写像の一様連続性**
:   距離空間 $`(X, d_X), (Y, d_Y)`$ と写像 $`f:X\to Y`$ に対して, $`f`$ が**一様連続** (*uniformly continuous*) であるとは, 以下の条件を満たすときいう:
    ```math
    \forall\varepsilon>0,\exists\delta>0\text{ s.t. }\forall x,y\in X,d_X(x,y)\leq\delta\Rightarrow d_Y(f(x),f(y))\leq\varepsilon
    ```
    一様連続な写像を **一様連続写像** (*uniformly continuous function*) といい, 全単射な写像 $`f:X\to Y`$ として $`f,f^{-1}`$ がともに一様連続となるとき距離空間 $`(X, d_X), (Y, d_Y)`$ を距離空間として **一様同型** (*uniformly isomorphic*) という.

Proposition.
:   一様連続写像は連続となる.

<u>proof.</u>
:   $`x_0\in X`$ と $`\varepsilon>0`$ を固定する.
    一様連続性から, 任意の $`x,y\in X`$ に対して
    ```math
    d_X(x,y)\leq\delta\Rightarrow d_Y(f(x),f(y))\leq\varepsilon
    ```
    を満たす $`\delta>0`$ が存在する.
    ここで $`y=x_0`$ とおけば, $`d_X(x,x_0)\leq\delta`$ ならば $`d_Y(f(x),f(x_0))\leq\varepsilon`$ となる.
    したがって $`f`$ は $`x_0`$ で連続である.
    $`x_0`$ は任意であったから, $`f`$ は連続である.

Example. 連続だが一様連続でない写像の例
:   写像 $`f:\mathbb{R}\to\mathbb{R}`$, $`f(x)=x^2`$ は連続であるが一様連続ではない.
    実際, $`x_n=n`$, $`y_n=n+1/n`$ とすると $`|x_n-y_n|\to0`$ であるが,
    ```math
    |f(x_n)-f(y_n)|=2+1/n^2
    ```
    は $`0`$ に収束しない.

### 点列

距離空間 $`(X,d)`$ の **点列** (*sequence of points*) を, 非負整数全体から $`X`$ への写像 $`n\mapsto p_n`$ として定義し, $`(p_n)_{n\geq0}`$ あるいは単に $`(p_n)`$ と表す.

Definition. **点列の収束性**
:   距離空間 $`(X,d)`$ の点列 $`(p_n)`$ と点 $`p\in X`$ に対して, 条件
    ```math
    \forall\varepsilon>0,\exists N=0,1,2,\ldots\text{ s.t. }\forall n [N\leq n\Rightarrow d(p_n,p)\leq\varepsilon]
    ```
    を満たすとき, $`p`$ を **列 $`(p_n)`$ の極限** (*limit of a sequence $`(p_n)`$*) といい, 極限の存在する列は**収束する** (*converge*) といい, 収束しない列は**発散する** (*diverge*) という.

Proposition. **点列の極限の一意性**
:   距離空間 $`(X,d)`$ の点列 $`(p_n)`$ は, 収束すればその極限は一意的である.

<u>proof.</u>
:   $`p_n\to p`$ かつ $`p_n\to q`$ と仮定する.
    $`p\neq q`$ ならば $`d(p,q)>0`$ である.
    $`\varepsilon=d(p,q)/3`$ とおく.
    収束の定義から, ある $`N_p,N_q`$ が存在して, $`n\geq N_p`$ ならば $`d(p_n,p)\leq\varepsilon`$, $`n\geq N_q`$ ならば $`d(p_n,q)\leq\varepsilon`$ となる.
    $`n\geq\max\{N_p,N_q\}`$ をとると, 三角不等式より
    ```math
    d(p,q)\leq d(p,p_n)+d(p_n,q)\leq2\varepsilon=\frac{2}{3}d(p,q)<d(p,q)
    ```
    となり矛盾する.
    よって $`p=q`$ である.

このことから, 収束点列 $`(p_n)`$ の極限を $`\lim(p_n)`$ あるいは $`\lim_{n\to\infty}p_n`$ と表す.

Definition. **同程度連続**
:   距離空間 $`(X,d_X),(Y,d_Y)`$ と写像の族 $`f=\{f_\lambda:X\to Y\mid\lambda\in\Lambda\}`$ に対して, $`f`$ が**同程度連続** (*equicontinuous*) であるとは, 任意の $`\varepsilon>0,x\in X`$ に対して, ある $`\delta>0`$ が存在して, 任意の $`\lambda\in\Lambda`$ と $`x'\in X`$ に対して $`d_X(x,x')\leq\delta`$ ならば $`d_Y(f_\lambda(x),f_\lambda(x'))\leq\varepsilon`$ であるときいう.

Proposition. **同程度連続な写像列の各点収束は連続写像をなす**
:   距離空間 $`(X,d_X),(Y,d_Y)`$ と同程度連続な写像列 $`(f_n:X\to Y)`$ と写像 $`f:X\to Y`$ に対して, 任意の $`x\in X`$ に対して $`f_n(x)\to f(x),\,(n\to\infty)`$ であれば, $`f`$ は連続となる.

<u>proof.</u>
:   $`x_0\in X`$ と $`\varepsilon>0`$ をとる.
    同程度連続性から, 任意の $`n`$ と $`x`$ に対して
    ```math
    d_X(x,x_0)\leq\delta\Rightarrow d_Y(f_n(x),f_n(x_0))\leq\varepsilon/3
    ```
    を満たす $`\delta>0`$ が存在する.
    $`d_X(x,x_0)\leq\delta`$ となる $`x`$ を固定する.
    $`f_n(x)\to f(x)`$ および $`f_n(x_0)\to f(x_0)`$ であるから, ある $`n`$ が存在して
    ```math
    d_Y(f(x),f_n(x))\leq\varepsilon/3,\qquad
    d_Y(f_n(x_0),f(x_0))\leq\varepsilon/3
    ```
    となる.
    三角不等式より
    ```math
    d_Y(f(x),f(x_0))
    \leq d_Y(f(x),f_n(x))+d_Y(f_n(x),f_n(x_0))+d_Y(f_n(x_0),f(x_0))
    \leq\varepsilon
    ```
    である.
    よって $`f`$ は $`x_0`$ で連続であり, $`x_0`$ は任意であったから $`f`$ は連続である.

### 完備性

距離空間 $`(X,d)`$ の点列 $`(p_n)`$ が条件
```math
\forall\epsilon>0,\exists N=0,1,2,\ldots\text{ s.t. }\forall m,n [N\leq m,n\Rightarrow d(p_m,p_n)\leq\varepsilon]
```
を満たすとき, $`(p_n)`$ を **Cauchy 列** (*Cauchy sequence*) という.

Proposition. **収束列は Cauchy 列**
:   収束点列は Cauchy 列となる.

<u>proof.</u>
:   $`p_n\to p`$ とし, $`\varepsilon>0`$ をとる.
    収束の定義から, $`n\geq N`$ ならば $`d(p_n,p)\leq\varepsilon/2`$ となる $`N`$ が存在する.
    $`m,n\geq N`$ に対して三角不等式から
    ```math
    d(p_m,p_n)\leq d(p_m,p)+d(p,p_n)\leq\frac{\varepsilon}{2}+\frac{\varepsilon}{2}=\varepsilon
    ```
    となる.
    したがって $`(p_n)`$ は Cauchy 列である.

距離空間 $`(X,d)`$ の任意の Cauchy 列 $`(p_n)`$ が収束点列になるとき, $`(X,d)`$ は **完備** (*complete*) といい, 完備な距離空間を **完備距離空間** (*complete metric space*) という.

Definition. **完備化**
:   距離空間 $`(X,d_X)`$ に対して, 完備距離空間 $`\overline{(X,d_X)}=(\overline{X},\overline{d_X})`$ と等長埋め込み $`\iota:(X,d_X)\to\overline{(X,d_X)}`$ が次の条件を満たすとする.
    - $`\iota(X)`$ は完備距離空間 $`\overline{(X,d_X)}`$ で稠密である.
    - 任意の完備距離空間 $`(Y,d_Y)`$ と任意の一様連続写像 $`r:(X,d_X)\to(Y,d_Y)`$ に対して, 一様連続写像 $`\overline{r}:\overline{(X,d_X)}\to(Y,d_Y)`$ が一意的に存在して $`r=\overline{r}\circ\iota`$ が成り立つ.

    このとき, 組 $`(\overline{(X,d_X)},\iota)`$ を距離空間 $`(X,d_X)`$ の **完備化** (*completion*) という.

Theorem. **完備化の一意性**
:   距離空間 $`(X,d_X)`$ の完備化 $`(C,\iota), (C',\iota')`$ に対して, $`\iota'=f\circ\iota`$ を満たす等長同型写像 $`f:C\to C'`$ が一意的に存在する.

<u>proof.</u>
:   完備化の普遍性を $`\iota':X\to C'`$ に適用すると, 一意な一様連続写像 $`f:C\to C'`$ で $`f\circ\iota=\iota'`$ を満たすものを得る.
    同様に $`g:C'\to C`$ で $`g\circ\iota'=\iota`$ を満たすものを得る.
    $`g\circ f`$ と恒等写像は $`\iota(X)`$ 上で一致するから, 普遍性の一意性により $`g\circ f=\mathrm{id}_C`$ である.
    同様に $`f\circ g=\mathrm{id}_{C'}`$ である.
    したがって $`f`$ は一様同型である.
    任意の $`c,d\in C`$ に対して $`\iota(X)`$ の列 $`\iota(x_n)\to c`$, $`\iota(y_n)\to d`$ を取る.
    $`f\circ\iota=\iota'`$ と距離関数の連続性から
    ```math
    d_{C'}(f(c),f(d))
    =\lim_n d_{C'}(\iota'(x_n),\iota'(y_n))
    =\lim_n d_X(x_n,y_n)
    =d_C(c,d)
    ```
    となるので, $`f`$ は等長写像である.
    一意性も普遍性の一意性から従う.

距離空間 $`(X,d)`$ の Cauchy 列全体を $`C`$ とすると, $`C`$ 上の二項関係 $`\sim`$ を
```math
(p_n)\sim(q_n)\mathrel{\overset{\text{def}}{\iff}}\lim_{n\to\infty}d(p_n,q_n)=0
```
と定義すると, $`\sim`$ は $`C`$ 上の同値関係となる.
このとき, 商集合 $`C/\sim`$ への射影を $`\pi:C\to C/\sim`$ とする.
さらに定数列 $`(x,x,\ldots)`$ の同値類を用いて
```math
\iota:X\longrightarrow C/\sim,\qquad
\iota(x)=\pi((x,x,\ldots))
```
と定める.
次が成り立つ.

Lemma.
:   写像 $`\hat{d}:C/\sim\times C/\sim\to\mathbb{R}`$ を 距離空間 $`(X,d)`$ の Cauchy 列 $`p=(p_n),q=(q_n)`$ に対して
    ```math
    \hat{d}(\pi(p),\pi(q))=\lim_{n\to\infty}d(p_n,q_n)
    ```
    と定めることができる.

<u>proof.</u>
:   Cauchy 列 $`p,q`$ に対して実数列 $`d(p_n,q_n)`$ は Cauchy 列である.
    実数の完備性からその極限が存在する.
    $`p\sim p'`$ と $`q\sim q'`$ なら三角不等式より
    ```math
    |d(p_n,q_n)-d(p'_n,q'_n)|\leq d(p_n,p'_n)+d(q_n,q'_n)
    ```
    であり, 右辺は $`0`$ に収束する.
    従って極限は代表元に依らず, $`\hat d`$ は well-defined である.

Lemma.
:   $`\hat{d}`$ は $`C/\sim`$ 上の距離となる.

<u>proof.</u>
:   非負性と対称性は各 $`d(p_n,q_n)`$ の対応する性質から極限をとれば従う.
    三角不等式も各 $`n`$ についての三角不等式の極限から従う.
    $`\hat d(\pi(p),\pi(q))=0`$ であることは定義により $`d(p_n,q_n)\to0`$, すなわち $`p\sim q`$ と同値である.
    これは $`\pi(p)=\pi(q)`$ と同値なので, 同一性の公理も成り立つ.

Lemma.
:   写像 $`\iota:X\to C/\sim`$ は等長埋め込みである.

<u>proof.</u>
:   $`x,y\in X`$ に対して, 定数列の定義から
    ```math
    \hat d(\iota(x),\iota(y))=\lim_{n\to\infty}d(x,y)=d(x,y)
    ```
    である.
    よって $`\iota`$ は距離を保ち, 特に単射かつ連続である.

Lemma.
:   距離空間 $`(C/\sim,\hat{d})`$ は完備である.

<u>proof.</u>
:   $`C/\sim`$ の Cauchy 列 $`(\pi(p^k))_{k\geq0}`$ をとる.
    Cauchy 性から, 添字を取り直して
    ```math
    \hat d(\pi(p^k),\pi(p^{k+1}))<2^{-k-2}
    ```
    となるものとしてよい.
    各 $`k`$ について, $`m_k`$ を帰納的に選ぶ.
    $`m_k`$ は $`p^k`$ と $`p^{k+1}`$ の尾部の距離が $`2^{-k-3}`$ 未満となる位置より後ろに取り,
    次の段階では $`m_{k+1}>m_k`$ かつ $`p^{k+1}`$ の $`m_k`$ 以後の項同士の距離が $`2^{-k-3}`$ 未満となるように取る.
    $`q_k=p^k_{m_k}`$ とおく.
    代表列の Cauchy 性と上の選択条件から $`d(q_k,q_{k+1})<2^{-k-2}`$ である.
    したがって三角不等式を有限回用いると, 任意の $`r>s`$ に対して
    ```math
    d(q_s,q_r)<\sum_{k=s}^{r-1}2^{-k-2}+2^{-s-1}<2^{-s}
    ```
    となる.
    したがって $`(q_k)`$ は $`X`$ の Cauchy 列である.
    同じ対角選択を, $`p^k`$ の尾部と $`q`$ の尾部を比較する形で行うと,
    ```math
    \hat d(\pi(q),\pi(p^k))\leq 2^{-k}
    ```
    を得る.
    よって $`\pi(q)`$ はもとの Cauchy 列 $`(\pi(p^k))`$ の極限である.
    よって $`C/\sim`$ は完備である.

Theorem. **完備化の存在性**
:   距離空間 $`(C/\sim,\hat{d})`$ と標準埋め込み $`\iota:X\to C/\sim`$ の組 $`((C/\sim,\hat{d}),\iota)`$ は $`(X,d_X)`$ の完備化となる.

<u>proof.</u>
:   前の補題により $`C/\sim`$ は完備であり, $`\iota`$ は等長埋め込みである.
    任意の Cauchy 列 $`p=(p_n)`$ に対して, $`\hat d(\iota(p_n),\pi(p))\to0`$ である.
    従って $`\iota(X)`$ は稠密である.
    完備距離空間 $`Y`$ への一様連続写像 $`r:X\to Y`$ に対して, $`\overline r(\pi(p))=\lim_n r(p_n)`$ と定める.
    一様連続性は Cauchy 列を Cauchy 列へ送るので極限は存在し, 同値な代表列では同じ極限を持つため well-defined である.
    この写像は $`r`$ を延長し, 稠密性と $`Y`$ の Hausdorff 性から一意である.

Proposition. **極限写像の定義域の拡張**
:   距離空間 $`(X,d_X)`$ と 完備距離空間 $`(Y,d_Y)`$ と同程度連続な写像列 $`(f_n:X\to Y)`$ に対して, $`(X,d_X)`$ のある稠密な部分集合 $`D`$ における各点 $`x\in X`$ で $`Y`$ の点列 $`(f_n(x))`$ が収束するならば, 点列 $`(f_n(x))`$ は任意の $`x\in X`$ に対して収束し, 極限写像は連続である.

<u>proof.</u>
:   $`x\in X`$ と $`\varepsilon>0`$ をとる.
    等連続性により, すべての $`n`$ に対して
    ```math
    d_X(x,z)<\delta\Longrightarrow d_Y(f_n(x),f_n(z))<\varepsilon/3
    ```
    を満たす $`\delta>0`$ をとれる.
    $`D`$ の稠密性から $`d_X(x,z)<\delta`$ を満たす $`z\in D`$ を選ぶ.
    仮定より $`(f_n(z))`$ は収束し, 特に Cauchy 列である.
    従って十分大きい $`m,n`$ に対して $`d_Y(f_m(z),f_n(z))<\varepsilon/3`$ である.
    三角不等式から
    ```math
    d_Y(f_m(x),f_n(x))
    \leq d_Y(f_m(x),f_m(z))+d_Y(f_m(z),f_n(z))+d_Y(f_n(z),f_n(x))
    <\varepsilon
    ```
    となる.
    よって $`(f_n(x))`$ は Cauchy 列であり, $`Y`$ の完備性により収束する.
    これで各点での極限写像 $`f`$ が定まる.
    元の列は等連続であり, いま全点収束が示されたので, 等連続列の点ごとの極限の連続性に関する前の命題から $`f`$ は連続である.

---

## 位相空間と連続写像

距離が与えられない集合でも, 各点の近傍を指定すれば連続性と収束を定められる.
近傍系, 開集合, ネット, フィルターが同じ位相構造を別の形で表すことを利用して, 距離空間を越えた連続性を扱う.

### 位相構造

Definition. **近傍系**
:   **集合 $`X`$ 上の近傍系** (*neighbourhood system on a set $`X`$*) とは, 写像
    ```math
    \mathcal{N}:X\to\operatorname{Fil}(X)
    ```
    であって, 各 $`x\in X`$ に対して次の条件を満たすときいう:
    1. 任意の $`U\in\mathcal{N}(x)`$ に対して
        ```math
        x\in U.
        ```
    2. 任意の $`U\in\mathcal{N}(x)`$ に対して
        ```math
        \mathcal{N}^{-1}(U)=\{y\in X\mid U\in\mathcal{N}(y)\}\in\mathcal{N}(x)
        ```
    ただし $`\operatorname{Fil}(X)`$ は $`X`$ 上のフィルター全体の集合を表す.

集合 $`X`$ とその上の近傍系 $`\mathcal{N}`$ の組
```math
(X,\mathcal{N})
```
を **位相空間** (*topological space*) といい, $`X`$ をその **台集合** (*underlying set*) という.
位相空間 $`X`$ における台集合を $`X_0`$ と表し, 近傍系を $`\mathcal{N}_X`$ と表す.

Remark.
:   条件 2 は, 任意の $`U\in\mathcal{N}(x)`$ に対して, ある $`V\in\mathcal N(x)`$ が存在して
    ```math
    \forall y\in V,\quad U\in\mathcal{N}(y)
    ```
    となることと同値である.
    この条件が, 点ごとに独立に与えられたフィルター族を位相的な近傍系にする局所整合性条件である.

Definition. **近傍系の強弱**
:   集合 $`X`$ 上の近傍系 $`\mathcal{u},\mathcal{U}`$ が, 各 $`x\in X`$ に対して $`\mathcal{u}(x)\subseteq\mathcal{U}(x)`$ であるとき, $`\mathcal{U}`$ は $`\mathcal{u}`$ より **強い** (*strong*) といい, $`\mathcal{u}`$ は $`\mathcal{U}`$ より **弱い** (*week*) という.

Example. **離散位相と密着位相**
:   集合 $`X`$ 上の最も強い近傍系は
    ```math
    \mathcal{N}_{\mathrm{dis}}(x)\coloneqq{U\subseteq X\mid x\in U}
    ```
    であり, これによって定まる位相を **離散位相** (*discrete topology*) という.

    他方, 集合 $`X`$ 上の最も弱い近傍系は
    ```math
    \mathcal{N}_{\mathrm{ind}}(x)\coloneqq{X}
    ```
    であり, これによって定まる位相を **密着位相** (*indiscrete topology*) という.

Definition. **近傍基**
:   **集合 $`X`$ 上の近傍基** (*neighbourhood basis on a set $`X`$*) とは, 写像
    ```math
    \mathcal{N}:X\to\operatorname{FilB}(X)
    ```
    であって, 各 $`x\in X`$ に対して次の条件を満たすときいう:
    1. 任意の $`U\in\mathcal{N}(x)`$ に対して
        ```math
        x\in U.
        ```
    2. 任意の $`U\in\mathcal{N}(x)`$ に対して次を満たす $`V\in\mathcal{N}(x)`$ が存在する:
        ```math
        \forall y\in V,\exists W\in\mathcal{N}(y)\text{ s.t. }W\subseteq U
        ```
    
    ただし $`\operatorname{FilB}(X)`$ は $`X`$ 上のフィルター基全体の集合を表す.

Definition. **近傍系の強弱**
:   集合 $`X`$ 上の近傍基 $`\mathcal{b},\mathcal{B}`$ が, 各 $`x\in X`$ に対して
    ```math
    \forall B\in\mathcal{b}(x),\exists B'\in\mathcal{B}(x)\text{ s.t. }B'\subseteq B
    ```
    であるとき, $`\mathcal{B}`$ は $`\mathcal{b}`$ より **強い** (*strong*) といい, $`\mathcal{b}`$ は $`\mathcal{B}`$ より **弱い** (*weak*) という.

Proposition. **近傍基の定める近傍**
:   集合 $`X`$ 上の近傍基 $`\mathcal{B}`$ に対して, 写像 $`\mathcal{U}:X\to2^{2^X}`$ を $`x\in X`$ に対して $`\mathcal{U}(x)`$ をフィルター基 $`\mathcal{B}(x)`$ の生成するフィルターとすると, $`\mathcal{U}`$ は $`X`$ 上の近傍系となる. $`\mathcal{U}`$ を $`\mathcal{B}`$ の生成する近傍系という.

<u>proof.</u>
:   近傍基の各元は基点を含むから, 生成されたフィルターの各元も基点を含む.
    また $`U\in\mathcal{U}(x)`$ なら, フィルター基の定義により $`B\in\mathcal{B}(x)`$ で $`B\subseteq U`$ となるものがある.
    近傍基の第二条件をこの $`B`$ に適用すると, ある $`C\in\mathcal{B}(x)`$ が存在して, 各 $`y\in C`$ について $`W_y\in\mathcal{B}(y)`$ かつ $`W_y\subseteq B\subseteq U`$ となる.
    $`C\in\mathcal{U}(x)`$ であり $`W_y\in\mathcal{U}(y)`$ であるから, 近傍系の公理が成り立つ.

Proposition. **集合の近傍**
:   集合 $`X`$ 上の近傍系 $`\mathcal{U}`$ に対して,
    ```math
    \mathcal{U}[A]\coloneqq\bigcap_{a\in A}\mathcal{U}(a),\quad A\subseteq X
    ```
    とすると, 次がそれぞれ成り立つ.
    - $`\mathcal{U}[\{x\}]=\mathcal{U}(x)`$ である.
    - $`\mathcal{U}[A]`$ は $`X`$ 上のフィルターである.
    - 各 $`U\in\mathcal{U}[A]`$ に対して $`A\subseteq U`$ である.

<u>proof.</u>
:   一点集合についての等式は定義から直ちに従う.
    $`\mathcal{U}[A]`$ はフィルターの共通部分であるから, 上方閉性と有限交叉閉性を満たしフィルターである.
    $`U\in\mathcal{U}[A]`$ なら任意の $`a\in A`$ について $`U\in\mathcal{U}(a)`$ である.
    近傍系の第一公理より $`a\in U`$ なので $`A\subseteq U`$ である.

### 写像の連続性

Definition. **写像の連続性**
:   位相空間 $`X, Y`$ と台集合の間の写像 $`f:X_0\to Y_0`$ に対して, $`f`$ が**点 $`x_0\in X`$ で連続** (*continuous at point $`x_0\in X`$*) であるとは,
    ```math
    \forall V\in\mathcal{N}_Y(f(x_0)),\quad f^{-1}(V)\in\mathcal{N}_X(x_0)
    ```
    が成り立つときいう. 特に, 全ての $x_0\in X$ で連続な写像 $`f:X_0\to Y_0`$ を, **連続写像** (*Continuous function*) といい,
    ```math
    f:X\longrightarrow Y
    ```
    と表す.

以後, 位相空間 $`X, Y`$ に対して, 単に写像 $`X\to Y`$ といったとき台集合の間の写像 $`X_0\to Y_0`$ のこととする.

Proposition.
:   位相空間 $`X,Y,Z`$ と写像 $`f:X\to Y, g:Y\to Z`$ に対して, $`f`$ が 点 $`x_0\in X`$ で連続かつ $`g`$ が $`f(x_0)\in Y`$ で連続なとき, 合成写像 $`g\circ f:X\to Z`$ は $`x_0\in X`$ で連続である. 特に, $`f,g`$ がともに連続写像なとき, $`g\circ f`$ も連続写像となる.

<u>proof.</u>
:   $`g(f(x_0))`$ の任意の近傍 $`W`$ をとる.
    $`g`$ の $`f(x_0)`$ における連続性から, $`f(x_0)\in V`$ かつ $`g(V)\subseteq W`$ を満たす近傍 $`V`$ が存在する.
    $`f`$ の $`x_0`$ における連続性から, $`x_0\in U`$ かつ $`f(U)\subseteq V`$ を満たす近傍 $`U`$ が存在する.
    このとき $`(g\circ f)(U)\subseteq g(V)\subseteq W`$ である.
    よって $`g\circ f`$ は $`x_0`$ で連続である.

Definition. **同相写像**
:   位相空間 $`X,Y`$ と全単射な写像 $`f:X\to Y`$ に対して, $`f`$ と $`f^{-1}`$ がともに連続写像となるとき, $`f`$ を**同相写像** (*homeomorphism*) という.
    また, 位相空間 $`X,Y`$ の間に同相写像が存在するとき, $`X`$ と $`Y`$ は**同相** (*homeomorphic*) であるといい, 
    ```math
    X\cong Y
    ```
    と表す.

Example. 連続な全単射の逆写像が連続とは限らない例
:   写像
    ```math
    f:[0,2\pi)\longrightarrow S^1,\quad t\longmapsto(\cos t,\sin t)
    ```
    は連続な全単射である.
    しかし, $`t_n=2\pi-1/n`$ とすると $`f(t_n)\to f(0)`$ である一方, $`t_n`$ は $`0`$ に収束しない.
    よって $`f^{-1}`$ は $`f(0)`$ で連続でない.

### 開集合系

Definition. **開集合系**
:   **集合 $`X`$ 上の開集合系** (*open sets on a set $`X`$*) とは, $`X`$ の部分集合族 $`\mathbf{O}`$ であって次の条件を満たすときいう:
    - $`\emptyset,X\in\mathbf{O}`$,
    - $`G,H\in\mathbf{O}`$ に対して $`G\cap H\in\mathbf{O}`$,
    - $`\mathbf{S}\subseteq\mathbf{O}`$ に対して $`\bigcup\mathbf{S}\in\mathbf{O}`$.

Definition. **開基**
:   **集合 $`X`$ 上の開基** (*open basis on a set $`X`$*) とは, $`X`$ の部分集合族 $`\mathbf{B}`$ であって次の条件を満たすときいう:
    - $`X=\bigcup\mathbf{B}_0`$ を満たす $`\mathbf{B}_0\subseteq\mathbf{B}`$ が存在する.
    - $`G,H\in\mathbf{B}`$ に対して, $`G\cap H=\bigcup\mathbf{B}_0`$ を満たす $`\mathbf{B}_0\subseteq\mathbf{B}`$ が存在する.

Definition. **開基の強弱**
:   集合 $`X`$ 上の開基 $`\mathbf{B}_1,\mathbf{B}_2`$ が条件
    ```math
    \forall G\in\mathbf{B}_1,\exists H\in\mathbf{B}_2\text{ s.t. }H\subseteq G
    ```
    を満たすとき, $`\mathbf{B}_2`$ は $`\mathbf{B}_1`$ より **強い** (*strong*) といい, $`\mathbf{B}_1`$ は $`\mathbf{B}_2`$ より **弱い** (*weak*) という.

Proposition. **部分集合族から開基の生成**
:   集合 $`X`$ の部分集合族 $`\mathbf{S}`$ に対して, 
    ```math
    \mathbf{B}\coloneqq\left\{\bigcap_{i=1}^{N}S_i\mathrel{}\middle|\mathrel{}S_i\in\mathbf{S}\ (1\leq i\leq N),\ N\in\mathbf{Z}_{\geq0}\right\},
    \qquad \bigcap_{i=1}^{0}S_i\coloneqq X
    ```
    は $`X`$ 上の開基となる. 特に, $`\mathbf{S}`$ が開基であれば $`\mathbf{B}`$ と $`\mathbf{S}`$ の生成する開集合系は一致する.
    $`\mathbf{B}`$ を $`\mathbf{S}`$ の生成する開基という.

<u>proof.</u>
:   空交叉を許せば $`X\in\mathbf{B}`$ であるから, $`\mathbf{B}`$ は $`X`$ を被覆する.
    $`\mathbf{B}`$ の二つの元はそれぞれ $`\mathbf{S}`$ の有限部分族の交叉である.
    その共通部分は二つの有限部分族の和集合にわたる交叉であり, 再び $`\mathbf{B}`$ の元である.
    従って $`\mathbf{B}`$ は開基の公理を満たす.
    $`\mathbf{S}`$ 自身が開基なら, その有限交叉は $`\mathbf{S}`$ の元の合併で表せるので, $`\mathbf{B}`$ が生成する開集合系は $`\mathbf{S}`$ が生成するものと一致する.

Proposition. **開基から開集合系の生成**
:   集合 $`X`$ 上の開基 $`\mathbf{B}`$ に対して, 
    ```math
    \mathbf{O}\coloneqq\left\{\bigcup\mathbf{B}'\mathrel{}\middle|\mathrel{}\mathbf{B}'\subseteq\mathbf{B}\right\}
    ```
    は $`X`$ 上の開集合系となる. 特に, $`\mathbf{B}`$ が開集合系であれば $`\mathbf{O}=\mathbf{B}`$ となる.
    $`\mathbf{O}`$ を $`\mathbf{B}`$ の生成する開集合系という.

<u>proof.</u>
:   $`\emptyset`$ は空な部分族の合併であり, $`X`$ は開基を被覆する部分族の合併であるから, ともに $`\mathbf{O}`$ に属する.
    任意合併については合併をまとめればよい.
    $`U=\bigcup\mathbf{B}_1`$, $`V=\bigcup\mathbf{B}_2`$ とすると, 開基の交叉条件より各 $`B_1\cap B_2`$ は $`\mathbf{B}`$ の部分族の合併である.
    したがって $`U\cap V=\bigcup_{B_1\in\mathbf{B}_1,B_2\in\mathbf{B}_2}(B_1\cap B_2)`$ も $`\mathbf{B}`$ の元の合併であり, $`\mathbf{O}`$ に属する.

集合 $`X`$ の部分集合族 $`\mathbf{S}`$ に対して, $`\mathbf{B}`$ を $`\mathbf{S}`$ の生成する開基とし $`\mathbf{O}`$ を $`\mathbf{B}`$ の生成する開集合系としたとき, $`\mathbf{O}`$ を $`\mathbf{S}`$ の生成する開集合系というと, 次が成り立つ.

Proposition.
:   集合 $`X`$ の部分集合族 $`\mathbf{S}`$ の生成する開集合系 $`\mathbf{O}`$ は, $`\mathbf{S}`$ を含むような開集合系のうち最も弱い開集合系である.

<u>proof.</u>
:   $`\mathbf{S}`$ の各元は一元族の有限交叉であるため, 生成開基に属し, 従って $`\mathbf{O}`$ に属する.
    一方 $`\mathbf{S}\subseteq\mathbf{O}'`$ を満たす任意の開集合系 $`\mathbf{O}'`$ をとる.
    $`\mathbf{O}'`$ は有限交叉で閉じているから生成開基のすべての元を含む.
    さらに任意合併で閉じているから, それらの合併である $`\mathbf{O}`$ のすべての元を含む.
    よって $`\mathbf{O}\subseteq\mathbf{O}'`$ であり, $`\mathbf{O}`$ は最も弱い.

Proposition. **近傍基の定める開基**
:   集合 $`X`$ 上の近傍基 $`\mathcal{B}`$ とその生成する近傍系 $`\mathcal{U}`$ に対して, $`X`$ の部分集合族 $`\beta`$ を
    ```math
    \beta\coloneqq\{B\subseteq X\mid\forall x\in B,B\in\mathcal{U}(x)\}
    ```
    とすると, $`\beta`$ は $`X`$ 上の開基であり, $`\beta`$ の生成する位相と $`\mathcal{B}`$ の生成する位相は一致する.

<u>proof.</u>
:   $`x\in X`$ と $`U\in\mathcal{U}(x)`$ を取る.
    近傍系の公理より $`V\in\mathcal{U}(x)`$ であって, 各 $`y\in V`$ に対し $`U\in\mathcal{U}(y)`$ を満たすものがある.
    $`G\coloneqq\{y\in X\mid U\in\mathcal{U}(y)\}`$ とおくと $`V\subseteq G`$ であるから $`G\in\mathcal{U}(x)`$ である.
    また $`y\in G`$ に対して同じ公理を $`U\in\mathcal{U}(y)`$ に適用すると, ある $`W\in\mathcal{U}(y)`$ が $`W\subseteq G`$ を満たす.
    よって $`G\in\mathcal{U}(y)`$ であり, $`G\in\beta`$ である.
    したがって $`\beta`$ は各点で近傍基となり, 開基の公理を満たす.
    さらに上の構成は $`\mathcal{U}(x)`$ の任意の元を含む $`\beta`$ の元を与えるので, $`\beta`$ の生成する近傍系は $`\mathcal{U}`$ と一致する.

Proposition. **開基の定める近傍基**
:   集合 $`X`$ 上の開基 $`\beta`$ に対して, 写像 $`\mathcal{B}:X\to2^{2^X}`$ を
    ```math
    \mathcal{B}(x)\coloneqq\{B\in\beta\mid x\in B\},\quad x\in X
    ```
    とすると, $`\mathcal{B}`$ は $`X`$ 上の近傍基であり, $`\beta`$ の生成する位相と $`\mathcal{B}`$ の生成する位相は一致する.

<u>proof.</u>
:   開基が $`X`$ を被覆するので $`\mathcal{B}(x)`$ は空でない.
    $`B_1,B_2\in\mathcal{B}(x)`$ に対して, 開基の交叉条件から $`x`$ を含み $`B_1\cap B_2`$ に含まれる基の元が存在する.
    よって各 $`\mathcal{B}(x)`$ はフィルター基である.
    さらに $`B\in\mathcal{B}(x)`$ とすると, $`B`$ は開集合なので各 $`y\in B`$ に対して $`B\in\mathcal{B}(y)`$ である.
    これが近傍基の二条件を与える.
    したがってこの近傍基から得る開集合は, ちょうど $`\beta`$ の元の合併である.

位相空間 $`X`$ と台集合 $`X_0`$ 上の開集合系 $`\mathbf{O}`$ に対して, $`\mathbf{O}`$ の生成する近傍系が $`X`$ の近傍系 $`\mathcal{N}_X`$ と一致するとき $`\mathbf{O}`$ を位相空間 $`X`$ の開集合系という.
位相空間 $`X`$ の開集合系き $`\mathbf{O}`$ に対して, $`G\in\mathbf{O}`$ を **位相空間 $`X`$ の開集合** (*open set on a $`X`$*) といい, $`F^\complement=X_0\setminus F\in\mathbf{O}`$ となる $`F`$ を **位相空間 $`X`$ の閉集合** (*closed set on a $`X`$*) という.

Lemma.
:   位相空間 $`X,Y`$ と写像 $`f:X\to Y`$ と $`x_0\in X`$ に対して, 以下同値.
    1. $`f`$ は $`x_0`$ で連続である.
    2. $`f(x_0)`$ を含むような任意の開集合 $`G\subseteq Y`$ に対して $`f^{-1}(G)`$ は $`x_0`$ の近傍である.

<u>proof.</u>
:   $`f`$ が $`x_0`$ で連続であるとする.
    $`f(x_0)\in G`$ かつ $`G`$ が開であれば, $`G`$ は $`f(x_0)`$ の近傍である.
    連続性から $`f^{-1}(G)`$ は $`x_0`$ の近傍となる.

    逆に条件 2 を仮定する.
    $`f(x_0)`$ の任意の近傍 $`V`$ は, $`f(x_0)\in G\subseteq V`$ を満たす開集合 $`G`$ を含む.
    条件 2 により $`f^{-1}(G)`$ は $`x_0`$ の近傍であり, $`f^{-1}(G)\subseteq f^{-1}(V)`$ である.
    よって $`f^{-1}(V)`$ は $`x_0`$ の近傍である.
    したがって $`f`$ は $`x_0`$ で連続である.

Theorem. **連続性の開集合による特徴づけ**
:   位相空間 $`X,Y`$ と写像 $`f:X\to Y`$ に対して, 以下同値.
    1. $`f`$ は連続である.
    2. 任意の開集合 $`G\subseteq Y`$ に対して $`f^{-1}(G)`$ は $`X`$ の開集合である.

<u>proof.</u>
:   $`f`$ が連続ならば, 任意の $`x\in X`$ に前の補題を適用して条件 2 を得る.

    逆に条件 2 を仮定する.
    $`x\in X`$ と $`f(x)`$ を含む開集合 $`G`$ をとると, $`f^{-1}(G)`$ は開集合であり $`x`$ を含むので $`x`$ の近傍である.
    前の補題により $`f`$ は $`x`$ で連続である.
    $`x`$ は任意であったから $`f`$ は連続である.

したがって、通常の「開集合の逆像が開集合」という条件は、近傍系による連続性の大域的な特徴づけとして得られる。

### 部分空間, 開写像, 閉写像, 商写像, 埋め込み

連続性は開集合の逆像を扱う条件である.
部分空間は部分集合へ元の位相を制限する構成である.
開写像と閉写像はそれぞれ開集合と閉集合の像を扱い, 商写像と埋め込みは位相を押し出す場合と部分空間へ取り込む場合を記述する.

Definition. **部分空間**
:   位相空間 $`X`$ と部分集合 $`S\subseteq X_0`$ に対して,
    ```math
    \mathbf O_S\coloneqq\{G\cap S\mid G\in\mathbf O_X\}
    ```
    は $`S`$ 上の開集合系となる.
    この開集合系を備えた $`S`$ を $`X`$ の **部分空間** といい, $`S`$ に入るこの位相を **部分空間位相** または **相対位相** という.

Definition. **開写像と閉写像**
:   位相空間の間の写像 $`f:X\to Y`$ が, 任意の開集合 $`G\subseteq X`$ に対して $`f(G)`$ が $`Y`$ で開となるとき **開写像** (*open map*) という.
    任意の閉集合 $`F\subseteq X`$ に対して $`f(F)`$ が $`Y`$ で閉となるとき **閉写像** (*closed map*) という.

Definition. **商写像**
:   全射連続写像 $`q:X\to Y`$ が **商写像** (*quotient map*) であるとは,
    ```math
    \mathbf O_Y=\{G\subseteq Y\mid q^{-1}(G)\in\mathbf O_X\}
    ```
    が成り立つときいう.

Definition. **位相的埋め込み**
:   連続単射 $`e:X\to Y`$ が **位相的埋め込み** (*topological embedding*) であるとは, $`e:X\to e(X)`$ が, $`e(X)`$ に $`Y`$ の部分空間位相を入れたとき同相写像となるときいう.

Proposition. **埋め込みと商写像の特徴づけ**
:   位相空間 $`X,Y`$ の間の連続写像 $`f:X\to Y`$ に対して, 次が成り立つ.
    1. $`f`$ が全射であるならば, $`f`$ が商写像であることと,
        ```math
        \mathbf O_Y=\{G\subseteq Y\mid f^{-1}(G)\in\mathbf O_X\}
        ```
        が成り立つことは同値である.
    2. $`f`$ が単射であるならば, $`f`$ が位相的埋め込みであることと,
        ```math
        \mathbf O_X=\{f^{-1}(G)\mid G\in\mathbf O_Y\}
        ```
        が成り立つことは同値である.

<u>proof.</u>
:   $`f`$ が全射である場合, 商写像の定義は
    ```math
    \mathbf O_Y=\{G\subseteq Y\mid f^{-1}(G)\in\mathbf O_X\}
    ```
    を要求する.
    よって (1) は商写像の定義そのものである.
    次に $`f`$ が単射である場合を考える.
    $`f`$ が埋め込みであると仮定する.
    $`f:X\to f(X)`$ は同相写像であるから, 任意の $`U\in\mathbf O_X`$ に対して $`f(U)`$ は $`f(X)`$ の開集合である.
    部分空間位相の定義により, ある $`G\in\mathbf O_Y`$ が存在して $`f(U)=G\cap f(X)`$ となる.
    単射性から $`U=f^{-1}(G)`$ であり, $`\mathbf O_X\subseteq\{f^{-1}(G)\mid G\in\mathbf O_Y\}`$ が得られる.
    逆に $`G\in\mathbf O_Y`$ なら $`f^{-1}(G)`$ は $`f`$ の連続性により $`X`$ で開集合である.
    よって集合の等式 (2) が成り立つ.
    逆に (2) を仮定する.
    $`f`$ の連続性から, $`f:X\to f(X)`$ は連続である.
    任意の $`U\in\mathbf O_X`$ に対して (2) により $`U=f^{-1}(G)`$ となる $`G\in\mathbf O_Y`$ が存在する.
    単射性から $`f(U)=G\cap f(X)`$ であり, $`f(U)`$ は $`f(X)`$ の開集合である.
    したがって $`f:X\to f(X)`$ は開写像であり, 連続全単射の逆写像は連続となる.
    よって $`f:X\to f(X)`$ は同相写像であり, $`f`$ は位相的埋め込みである.

Proposition. **開写像または閉写像による同相性**
:   全単射な連続写像 $`f:X\to Y`$ が開写像または閉写像であれば, $`f`$ は同相写像である.

Proof.
:   $`f`$ が開写像なら, $`Y`$ の開集合 $`G`$ に対して $`f^{-1}(G)`$ は開であり, その $`f^{-1}`$ による逆像は $`f(f^{-1}(G))=G`$ である.
    よって $`f^{-1}`$ は連続である.
    $`f`$ が閉写像の場合も, $`Y`$ の閉集合の逆像が $`X`$ で閉となることを同様に示せる.
    したがっていずれの場合も $`f`$ とその逆写像は連続であり, $`f`$ は同相写像である.

### 開核と閉包

Definition. **開核作用素**
:   **集合 $`X`$ 上の開核作用素** (*interior operator on a set $`X`$*) とは, 写像 $`i:2^X\to2^X`$ であって次の条件を満たすときいう:
    - $`i(X)=X`$.
    - 任意の $`A\in 2^X`$ に対して $`i(A)\subseteq A`$.
    - 任意の $`A\in 2^X`$ に対して $`i(i(A))=i(A)`$.
    - 任意の $`A,B\in2^X`$ に対して $`i(A\cap B)=i(A)\cap i(B)`$.

Theorem. **開核作用素の定める位相構造**
:   集合 $`X`$ 上の開核作用素 $`i`$ に対して, $`X`$ 上の写像 $`\mathcal{N}:X\to\operatorname{Fil}(X)`$ を
    ```math
    \mathcal{N}(x)\coloneqq\{U\subseteq X\mid x\in i(U)\}
    ```
    とすると, $`\mathcal{N}`$ は $`X`$ 上の近傍系となる. $`\mathcal{N}`$ を $`i`$ の生成する近傍系といい, 位相空間 $`(X,\mathcal{N})`$ を $`i`$ の生成する位相空間という.

<u>proof.</u>
:   まず $`i`$ は単調である.
    実際, $`A\subseteq B`$ なら $`A=A\cap B`$ であるから
    $`i(A)=i(A)\cap i(B)\subseteq i(B)`$ となる.
    $`i(X)=X`$ より $`X\in\mathcal{N}(x)`$ である.
    $`U,V\in\mathcal{N}(x)`$ なら $`x\in i(U)\cap i(V)=i(U\cap V)`$ であり, $`U\cap V\in\mathcal{N}(x)`$ である.
    $`U\in\mathcal{N}(x)`$ と $`U\subseteq V`$ なら単調性から $`x\in i(V)`$ となる.
    また $`x\in i(U)`$ なら $`i(U)\subseteq U`$ より $`x\in U`$ である.
    最後に $`U\in\mathcal{N}(x)`$ とすると, 冪等性から $`i(U)\in\mathcal{N}(x)`$ である.
    各 $`y\in i(U)`$ について $`i(U)\subseteq U`$ だから $`U\in\mathcal{N}(y)`$ となる.
    以上で近傍系の局所性の公理も満たされる.

Definition. **閉包作用素**
:   **集合 $`X`$ 上の閉包作用素** (*closure operator on a set $`X`$*) とは, 写像 $`c:2^X\to2^X`$ であって次の条件を満たすときいう:
    - $`c(\emptyset)=\emptyset`$.
    - 任意の $`A\in 2^X`$ に対して $`A\subseteq c(A)`$.
    - 任意の $`A\in 2^X`$ に対して $`c(c(A))=c(A)`$.
    - 任意の $`A,B\in2^X`$ に対して $`c(A\cup B)=c(A)\cup c(B)`$.

Proposition. **開核作用素と閉包作用素の関係**
:   集合 $`X`$ 上の閉包作用素 $`c`$ に対して, 写像 $`i:2^X\to2^X`$ を
    ```math
    i(A)=X\setminus c(X\setminus A),\quad A\in2^X
    ```
    とすると, $`i`$ は $`X`$ 上の開核作用素となる.
    $`i`$ を $`c`$ の定める開核作用素という.

<u>proof.</u>
:   $`c(\emptyset)=\emptyset`$ より $`i(X)=X\setminus c(\emptyset)=X`$ である.
    膨張性 $`X\setminus A\subseteq c(X\setminus A)`$ の補集合をとれば $`i(A)\subseteq A`$ を得る.
    冪等性から
    ```math
    i(i(A))=X\setminus c\bigl(X\setminus(X\setminus c(X\setminus A))\bigr)
    =X\setminus c(c(X\setminus A))=i(A)
    ```
    となる.
    また De Morgan の法則と有限合併保存性から
    ```math
    \begin{aligned}
    i(A\cap B)
    &=X\setminus c((X\setminus A)\cup(X\setminus B))\\
    &=X\setminus\bigl(c(X\setminus A)\cup c(X\setminus B)\bigr)\\
    &=i(A)\cap i(B).
    \end{aligned}
    ```
    よって $`i`$ は開核作用素のすべての公理を満たす.

$`X`$ 上の閉包作用素 $`c`$ と $`c`$ の定める開核作用素 $`i`$ に対して, $`i`$ の生成する位相空間を $`c`$ の生成する位相空間という.

Theorem. **位相構造の定める開核作用素**
:   集合 $`X`$ 上の近傍系 $`\mathcal{N}`$ に対して, 写像 $`(-)^\circ:2^X\to2^X`$ を
    ```math
    A^\circ\coloneqq\{x\in X\mid A\in\mathcal{N}(x)\}
    ```
    とすると, $`(-)^\circ`$ は $`X`$ 上の開核作用素となり, $`(-)^\circ`$ の定める近傍系は $`\mathcal{N}`$ と一致する. $`(-)^\circ`$ を位相空間 $`(X,\mathcal{N})`$ の定める開核作用素という.

<u>proof.</u>
:   $`X\in\mathcal{N}(x)`$ が任意の $`x`$ に対して成り立つので $`X^\circ=X`$ である.
    $`x\in A^\circ`$ なら $`A\in\mathcal{N}(x)`$ であり, 近傍系の第一公理から $`x\in A`$ である.
    よって $`A^\circ\subseteq A`$ である.
    $`x\in A^\circ`$ とする.
    近傍系の局所性の公理から, $`V\in\mathcal{N}(x)`$ であって各 $`y\in V`$ に対して $`A\in\mathcal{N}(y)`$ を満たすものがある.
    このとき $`V\subseteq A^\circ`$ だから $`A^\circ\in\mathcal{N}(x)`$ であり, $`x\in(A^\circ)^\circ`$ である.
    逆の包含は $`A^\circ\subseteq A`$ と単調性から従うので, 開核は冪等である.
    また $`A\cap B\in\mathcal{N}(x)`$ はフィルターの公理により $`A,B\in\mathcal{N}(x)`$ と同値である.
    よって $`(A\cap B)^\circ=A^\circ\cap B^\circ`$ である.
    $`i(A)=A^\circ`$ として定める近傍系は, 定義から $`A\in\mathcal{N}(x)`$ と $`x\in i(A)`$ が同値であるため, 元の $`\mathcal{N}`$ に一致する.

位相空間 $`X`$ に対して, 点 $`x\in X`$ が部分集合 $`A\subseteq X`$ の **内点** (*interior point*) であるとは, $`x\in A^\circ`$ であるときいう.
他方, 点 $`x`$ が $`A^\complement=X\setminus A`$ の内点であるとき, 点 $`x`$ を $`A`$ の **外点** (*exterior point*) という.
さらに, 点 $`x`$ が $`A`$ の内点でないかつ外点でないとき, 点 $`x`$ を $`A`$ の **境界点** (*boundary point*) という.

Theorem. **位相構造の定める閉包作用素**
:   集合 $`X`$ 上の近傍系 $`\mathcal{N}`$ に対して, 写像 $`\overline{(-)}:2^X\to2^X`$ を
    ```math
    \overline{A}\coloneqq\{x\in X\mid\forall U\in\mathcal{N}(x),U\cap A\neq\emptyset\}
    ```
    とすると, $`\overline{(-)}`$ は $`X`$ 上の閉包作用素となり, $`\overline{(-)}`$ の定める近傍系は $`\mathcal{N}`$ と一致する. $`\overline{(-)}`$ を位相空間 $`(X,\mathcal{N})`$ の定める閉包作用素という.

<u>proof.</u>
:   空集合はどの近傍とも交わらないから $`\overline{\emptyset}=\emptyset`$ である.
    $`x\in A`$ なら任意の $`x`$ の近傍は $`x`$ を含むので $`A`$ と交わる.
    よって $`A\subseteq\overline{A}`$ である.
    $`x\notin\overline{A}`$ なら, $`A`$ と交わらない近傍 $`U\in\mathcal{N}(x)`$ がある.
    局所性により $`V\in\mathcal{N}(x)`$ であって各 $`y\in V`$ に対して $`U\in\mathcal{N}(y)`$ を満たすものを取れる.
    このとき $`V\cap\overline{A}=\emptyset`$ である.
    実際, $`y\in V`$ なら $`U`$ は $`y`$ の近傍で $`U\cap A=\emptyset`$ なので $`y\notin\overline{A}`$ である.
    したがって $`x\notin\overline{\overline{A}}`$ であり, 膨張性と合わせて冪等性が従う.
    $`x\notin\overline{A}`$ かつ $`x\notin\overline{B}`$ なら, それぞれ $`A,B`$ と交わらない $`x`$ の近傍 $`U,V`$ がある.
    $`U\cap V`$ は $`A\cup B`$ と交わらない近傍であるから, 対偶により
    $`\overline{A\cup B}\subseteq\overline{A}\cup\overline{B}`$ を得る.
    逆の包含は単調性から従うので, 有限和保存性が成り立つ.
    最後に, 閉包作用素から得る開核は $`i(U)=X\setminus\overline{X\setminus U}`$ である.
    $`x\in i(U)`$ は $`X\setminus U`$ と交わらない $`x`$ の近傍が存在することと同値であり, これは上方閉性により $`U\in\mathcal{N}(x)`$ と同値である.
    したがって再構成される近傍系は $`\mathcal{N}`$ に一致する.

位相空間 $`X`$ に対して, 点 $`x\in X`$ が部分集合 $`A\subseteq X`$ の **触点** (*adherent point*) であるとは, $`x\in\overline{A}`$ であるときいう.
他方, 点 $`x`$ が $`A\setminus\{x\}`$ の触点であるとき, 点 $`x`$ を $`A`$ の **集積点** (*accumulation point*) という.
さらに, 点 $`x`$ が $`A`$ の集積点でないとき 点 $`x`$ を $`A`$ の **孤立点** (*isolated point*) という.

Definition.
:   位相空間 $`X`$ の部分集合 $`A\in2^X`$ の境界点全体を $`\partial A`$ とし, これを $`A`$ の境界という.

Proposition.
:   このとき, 次がそれぞれ成り立つ.
    - $`\overline{A}=A^\circ\sqcup\partial{A}`$,
    - $`\partial{A}=\overline{A}\cap\overline{A^\complement}`$,
    - $`\overline{A\cap B}\subseteq\overline{A}\cap\overline{B}`$ であり, $`\partial{A}\cap\partial{B}=\emptyset`$ であれば等号が成り立つ.

<u>proof.</u>
:   境界の定義から $`\partial A=\overline A\setminus A^\circ`$ である.
    $`A^\circ\subseteq\overline A`$ であるから, 第一式が従う.
    また $`x\in\partial A`$ であることは, $`x`$ の任意の近傍が $`A`$ と $`A^\complement`$ の双方と交わることと同値である.
    これは第二式に等しい.
    単調性から $`\overline{A\cap B}\subseteq\overline A\cap\overline B`$ である.
    逆に $`x\in\overline A\cap\overline B`$ とし $`\partial A\cap\partial B=\emptyset`$ を仮定する.
    $`x`$ は $`A`$ と $`B`$ の双方の閉包に属するから, それぞれの内点または境界点である.
    境界点の場合には他方の境界点ではないので他方の内点である.
    したがって任意の $`x`$ の近傍を必要なら他方の内部に含まれる近傍と交叉させれば, $`A\cap B`$ と交わる近傍を得る.
    よって $`x\in\overline{A\cap B}`$ であり, 等号が成り立つ.

### 距離の誘導する位相

Definition. **開球**
:   距離空間 $`X`$ の点 $`x\in X`$ と $`r>0`$ に対して,
    ```math
    B_r(x)\coloneqq\{y\in X\mid d_X(x,y) < r\}
    ```
    を, **点 $`x`$ を中心とする半径 $`r`$ の開球** (*open ball of radius $`r`$ centered at a point $`x`$*) という.

Proposition. **距離の定める位相構造**
:   距離空間 $`X`$ に対して, $`X`$ の台集合上の近傍基 $`\mathcal{B}`$ を
    ```math
    \mathcal{B}(x)\coloneqq\{B_r(x)\mid r>0\},\quad x\in X
    ```
    を満たすものが存在する.

<u>proof.</u>
:   各 $`x`$ における正半径の開球全体は $`x`$ を含む.
    二つの開球 $`B_r(x),B_s(x)`$ に対し, $`t=\min(r,s)>0`$ とおけば
    ```math
    B_t(x)\subseteq B_r(x)\cap B_s(x)
    ```
    である.
    よって各点で有限交叉に関して有向であり, フィルター基をなす.
    $`y\in B_r(x)`$ に対して $`s=r-d(x,y)>0`$ とおけば, 三角不等式から
    ```math
    B_s(y)\subseteq B_r(x)
    ```
    となる.
    したがってこのフィルター基は近傍基の公理を満たし, 所望の近傍系を生成する.

上記の近傍基により生成される位相構造を **$`(X,d)`$ の距離位相** (*metric topology on $`(X,d)`$*) という.

Proposition. **距離位相による連続性の整合性**
:   距離空間 $`X,Y`$ と写像 $`f:X\to Y`$ に対して以下同値:
    1. $`f`$ は距離空間の間の連続写像である.
    2. 距離位相により $`f`$ は位相空間の間の連続写像である.

<u>proof.</u>
:   距離空間における連続性は, 任意の $`x\in X`$ と $`\varepsilon>0`$ に対して
    ```math
    d_X(x,y)<\delta\Longrightarrow d_Y(f(x),f(y))<\varepsilon
    ```
    を満たす $`\delta>0`$ が存在することとして定義される.
    これは開球 $`B_\delta(x)`$ の像が $`B_\varepsilon(f(x))`$ に含まれるということである.
    開球はそれぞれ距離位相の近傍基なので, これは近傍による位相的連続性の定義と同値である.

以後, 距離空間には距離位相による位相構造が備わっているとして, 適宜位相空間として扱えることとする.

位相空間 $`X`$ に対して, $`X`$ の台集合上の距離 $`d`$ が存在して距離空間 $`(X,d)`$ が位相空間 $`X`$ と同相になるとき, $`X`$ は **距離化可能** (*metrizable*) であるといい, 距離化可能な位相空間を **距離化可能空間** (*metrizable space*) という.

### 位相空間上のネット

Definition. **有向集合**
:   前順序集合 $`(\Lambda,\leq)`$ が **有向集合** (*directed set*) であるとは, 任意の $`a,b\in\Lambda`$ に対して $`a\leq c`$ かつ $`b\leq c`$ を満たす $`c\in\Lambda`$ が存在するときいう.

Definition. **ネット**
:   集合 $`X`$ と有向集合 $`(\Lambda,\leq)`$ に対して, 写像 $`\Lambda\to X,\lambda\mapsto x_\lambda`$ を $`(\Lambda,\leq)`$ によって添字付けられた **$`X`$ のネット** (*net in $`X`$*) といい, $`(x_\lambda)_{\lambda\in\Lambda}`$ と表す.

特に, 非負整数全体は大小関係により有向集合となるため, それにより添字付けられたネットを **点列** (*sequence of points*) という.

Definition. **部分ネット**
:   有向集合 $`(\Lambda,\leq_\Lambda)`$ に対して, $`X`$ のネット $`x=(x_\lambda)_{\lambda\in\Lambda}`$ の **部分ネット** (*subnet*) とは, 有向集合 $`(I,\leq_I)`$ で添字付けられた $`X`$ のネット $`y=(y_i)_{i\in I}`$ であって, 以下を満たす写像 $`s:I\to\Lambda`$ が存在するときいう:
    - $`y=x\circ s`$. (i.e. $`\forall i\in I,y_i=x_{s(i)}`$)
    - **単調性**: 任意の $`i,i'\in I`$ に対して $`i\leq_I i'`$ ならば $`s(i)\leq_\Lambda s(i')`$.
    - **共終性**: 任意の $`\lambda\in\Lambda`$ に対して $`\lambda\leq_\Lambda s(i)`$ を満たす $`i\in I`$ が存在する.

点列 $`(x_n)`$ の **部分点列** (*subsequence of points*) とは, 点列 $`(y_n)`$ であって, 以下を満たす非負整数全体からそれ自体への写像 $`s`$ が存在するときいう:
- $`y=x\circ s`$. (i.e. $`\forall i\in I,y_i=x_{s(i)}`$)
- **狭義単調性**: 任意の非負整数 $`m,n`$ に対して $`m<n`$ ならば $`s(m)<s(n)`$.
- **共終性**: 任意の非負整数 $`n`$ に対して $`n\leq s(m)`$ を満たす非負整数 $`m`$ が存在する.

Definition. **eventually in, frequently in**
:   集合 $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ と部分集合 $`A\subseteq X`$ に対して,
    - **$`(x_\lambda)_{\lambda\in\Lambda}`$ is eventually in $`A`$** $`\mathrel{\overset{\text{def}}{\iff}}`$ $`\exists\lambda_0\in\Lambda\text{ s.t. }\forall\lambda\in\Lambda,\lambda_0\leq\lambda\Rightarrow x_\lambda\in A`$.
    - **$`(x_\lambda)_{\lambda\in\Lambda}`$ is frequently in $`A`$** $`\mathrel{\overset{\text{def}}{\iff}}`$ $`\forall\lambda\in\Lambda,\exists\lambda_0\in\Lambda\text{ s.t. }\lambda\leq\lambda_0\land x_{\lambda_0}\in A`$.

定義より明らかに, $`(x_\lambda)_{\lambda\in\Lambda}`$ is eventually in $`A`$ $`\Rightarrow`$ $`(x_\lambda)_{\lambda\in\Lambda}`$ is frequently in $`A`$ である.

Proposition.
:   $`(x_\lambda)_{\lambda\in\Lambda}`$ is eventually in $`A`$ $`\iff`$ $`(x_\lambda)_{\lambda\in\Lambda}`$ is not frequently in $`X\setminus A`$

<u>proof.</u>
:   ある添字以後すべての項が $`A`$ に属することは, その添字以後に $`X\setminus A`$ の項が存在しないことと同値である.
    これは「$`X\setminus A`$ に頻繁に属する」の否定そのものである.

Definition. **普遍ネット**
:   集合 $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ が **普遍ネット** (*universal net*) あるいは **超ネット** (*ultranet*) であるとは, 任意の $`A\subseteq X`$ に対して次のいずれかの条件が成り立つときいう:
    - $`(x_\lambda)_{\lambda\in\Lambda}`$ is eventually in $`A`$
    - $`(x_\lambda)_{\lambda\in\Lambda}`$ is eventually in $`X\setminus A`$

Theorem. **普遍部分ネットの存在**
:   任意のネットに対して普遍ネットであるような部分ネットが存在する.

<u>proof.</u>
:   ネットの尾部集合全体が生成するフィルターを $`\mathcal F`$ とする.
    超フィルター補題により $`\mathcal F`$ を細分する超フィルター $`\mathcal M`$ が存在する.
    フィルター基からネットを作る標準構成を $`\mathcal M`$ に適用すると, 得られるネットは元のネットの部分ネットとなる.
    超フィルターの補集合による特徴づけから, 任意の部分集合 $`A`$ について $`A\in\mathcal M`$ または $`A^\complement\in\mathcal M`$ が成り立つ.
    これは対応するネットが $`A`$ または $`A^\complement`$ に最終的に属することを意味する.
    よってこの部分ネットは普遍ネットである.

Definition. **ネットの収束**
:   位相空間 $`X`$ と $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ と 点 $`x\in X`$ に対して, 条件
    ```math
    \forall U\in\mathcal{N}_X(x),(x_\lambda)_{\lambda\in\Lambda}\text{ is eventually in }U
    ```
    を満たすとき, $`x`$ を **ネット $`(x_n)`$ の極限点** (*limit point of a net $`(x_n)`$*) といい, 極限の存在するネットは**収束する** (*converge*) といい, 収束しないネットは**発散する** (*diverge*) という.

Definition. **ネットの堆積**
:   位相空間 $`X`$ と $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ と 点 $`x\in X`$ に対して, 条件
    ```math
    \forall U\in\mathcal{N}_X(x),(x_\lambda)_{\lambda\in\Lambda}\text{ is frequently in }U
    ```
    を満たすとき, $`x`$ を **ネット $`(x_n)`$ の堆積点** (*cluster point of a net $`(x_n)`$*) という.

Theorem. **堆積点の特徴づけ**
:   位相空間 $`X`$ と $`X`$ のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`x`$ は $`(x_n)`$ の堆積点である.
    2. $`(x_n)`$ の部分ネットで $`x`$ に収束するものが存在する.

<u>proof.</u>
:   (2) から (1) は, 部分ネットの共終性により明らかである.
    逆に (1) を仮定する.
    添字集合を, $`x`$ の近傍 $`U`$ と添字 $`\lambda`$ の組であって $`x_\lambda\in U`$ を満たすもの全体とする.
    近傍の縮小と元の添字集合の有向性を併せた順序を入れると, 堆積点の条件によりこれは有向集合となる.
    第二成分への射影は元の添字集合への単調共終写像であり, その合成ネットは任意の近傍 $`U`$ に最終的に属する.
    よって得られる部分ネットは $`x`$ に収束する.

Theorem.
:   位相空間 $`X`$ と部分集合 $`A\subseteq X`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`x\in\overline{A}`$.
    2. $`x`$ に収束する $`A`$ のネットが存在する.

<u>proof.</u>
:   $`x\in\overline A`$ なら, $`x`$ の近傍 $`U`$ ごとに一点 $`a_U\in U\cap A`$ を選ぶ.
    近傍を逆包含で順序づければ有向集合となり, ネット $`U\mapsto a_U`$ は $`A`$ 内にあって $`x`$ に収束する.
    逆に $`A`$ 内のネットが $`x`$ に収束すれば, 任意の $`x`$ の近傍はそのネットのある項を含むので $`A`$ と交わる.
    よって $`x\in\overline A`$ である.

Theorem.
:   位相空間 $`X,Y`$ と写像 $`f:X\to Y`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`f`$ は $`x`$ で連続である.
    2. $`x`$ に収束する任意のネット $`(x_\lambda)_{\lambda\in\Lambda}`$ に対して, ネット $`(f(x_\lambda))_{\lambda\in\Lambda}`$ は $`f(x)`$ へ収束する.

<u>proof.</u>
:   $`f`$ が $`x`$ で連続なら, $`f(x)`$ の任意の近傍 $`V`$ の逆像は $`x`$ の近傍である.
    $`x_\lambda\to x`$ なら, その逆像に最終的に属するので $`f(x_\lambda)`$ は $`V`$ に最終的に属する.
    逆に (2) で $`f`$ が連続でないと仮定すると, ある $`f(x)`$ の近傍 $`V`$ について $`f^{-1}(V)`$ は $`x`$ の近傍でない.
    各 $`x`$ の近傍 $`U`$ から $`U\setminus f^{-1}(V)`$ の一点を選ぶネットは $`x`$ に収束するが, その像は $`V`$ に入らない.
    これは (2) に矛盾する.

### 位相空間上のフィルター

Definition. **有限交叉性**
:   集合 $`X`$ の部分集合族 $`\mathcal{F}`$ が **有限交叉性** (*finite intersection property*) を持つとは, $`\mathcal{F}`$ に属する任意の有限個の集合 $`F_i`$ ($`i=1,2,\ldots,n`$) に対して $`\bigcap_{i=1}^{n}F_i\neq\emptyset`$ を満たすときいう.

半順序集合 $`(2^X,\subseteq)`$ のフィルター(基)であって $`\emptyset`$ を含まないものを $`X`$ 上のフィルター(基)と呼び, 半順序集合 $`(2^X,\subseteq)`$ による細分関係をフィルター(基)同士の順序として導入する. 特に, $`X`$ 上のフィルター $`\mathcal{F},\mathcal{G}`$ に対して以下同値となる:
1. $`\mathcal{G}`$ は $`\mathcal{F}`$ の細分である.
2. 包含関係 $`\mathcal{F}\subseteq\mathcal{G}`$ が成り立つ.

Definition. **フィルターの両立**
:   $`X`$ 上のフィルター $`\mathcal{F},\mathcal{G}`$ に対して, 条件
    ```math
    \forall F\in\mathcal{F},\forall G\in\mathcal{G},F\cap G\neq\emptyset
    ```
    を満たすとき, $`\mathcal{F}`$ と $`\mathcal{G}`$ は両立しているという.

Proposition.
:   $`X`$ 上のフィルター $`\mathcal{F},\mathcal{G}`$ に対して, 以下同値:
    1. $`\mathcal{F}`$ と $`\mathcal{G}`$ は両立している.
    2. $`\mathcal{F}`$ と $`\mathcal{G}`$ は共通の細分を持つ.

<u>proof.</u>
:   (1) を仮定する.
    $`\{F\cap G\mid F\in\mathcal{F},G\in\mathcal{G}\}`$ は空集合を含まないフィルター基である.
    その生成するフィルターは $`\mathcal{F}`$ と $`\mathcal{G}`$ の共通細分となる.
    逆に共通細分 $`\mathcal{H}`$ があるなら, 任意の $`F\in\mathcal{F}`$ と $`G\in\mathcal{G}`$ はともに $`\mathcal{H}`$ に属する.
    したがって $`F\cap G\in\mathcal{H}`$ であり, フィルターの真性から $`F\cap G\neq\emptyset`$ である.

Definition.
:   両立している $`X`$ 上のフィルター $`\mathcal{F},\mathcal{G}`$ の **交わり** (*meet*) とは, $`X`$ 上のフィルター $`\mathcal{F}\wedge\mathcal{G}`$ であって, 次で定まる.
    ```math
    \mathcal{F}\wedge\mathcal{G}\coloneqq\{H\subseteq X\mid \exists F\in\mathcal{F},\exists G\in\mathcal{G},F\cap G\subseteq H\}
    ```
    これは $`\mathcal{F}`$ と $`\mathcal{G}`$ の共通細分のうち, 包含関係で最小のものである.

Proposition. **有限交叉族の生成するフィルター基**
:   集合 $`X`$ と有限交叉性を持つ $`X`$ の部分集合族 $`\mathcal{F}`$ に対して, $`X`$ の部分集合族 $`\mathcal{F}^\ast`$ を
    ```math
    \mathcal{F}^\ast\coloneqq\left\{\bigcap_{i=1}^{n}F_i\mathrel{}\middle|\mathrel{}F_i\in\mathcal{F}(i=1,2,\ldots,n),n\in\mathbf{Z}_{\geq1}\right\}
    ```
    とすると, $`\mathcal{F}^\ast`$ は $`\mathcal{F}`$ を含み有限交叉に閉じた最小のフィルター基となる.

<u>proof.</u>
:   $`\mathcal{F}`$ の元は $`n=1`$ として $`\mathcal{F}^\ast`$ に属する.
    また有限個の有限交叉の交わりは, 指標を併せれば再び $`\mathcal{F}^\ast`$ の元である.
    有限交叉性によりその元は空でないので, $`\mathcal{F}^\ast`$ はフィルター基である.
    さらに $`\mathcal{F}`$ を含み有限交叉に閉じた任意の集合族は, 有限回の交わりを取ることで $`\mathcal{F}^\ast`$ のすべての元を含む.
    したがって最小性が従う.

有限交叉性を持つ $`X`$ の部分集合族 $`\mathcal{F}`$ の生成するフィルター基 $`\mathcal{F}^\ast`$ に対して, $`\mathcal{F}^\ast`$ の生成するフィルターを $`\langle\mathcal{F}\rangle`$ と表し, これを $`\mathcal{F}`$ の生成するフィルターと呼ぶ. すなわち
```math
\langle\mathcal{F}\rangle
 =\{H\subseteq X\mid\exists F\in\mathcal{F}^\ast, F\subseteq H\}.
```
これは $`\mathcal{F}`$ を含むフィルターのうち包含関係で最小のものである. 特に, 空でない部分集合 $`A\subseteq X`$ のみからなる集合族 $`\{A\}`$ の生成するフィルター $`\langle\{A\}\rangle`$ を $`A`$ が生成する単項フィルターという.

Theorem. **超フィルターの存在**
:   集合 $`X`$ の空でない部分集合 $`A`$ に対して, $`A`$ を含むような $`X`$ 上の超フィルターが存在する.

<u>proof.</u>
:   $`A`$ を含む真のフィルター全体を包含関係で順序づける.
    空でない $`A`$ が生成する単項フィルターはこの集合に属するから, この順序集合は空でない.
    鎖 $`\{\mathcal{F}_i\}_{i\in I}`$ の和集合はフィルターの公理を満たし, 空集合を含まない.
    実際, 有限個の要素は鎖の比較可能性によって一つの $`\mathcal{F}_i`$ に同時に属する.
    よって Zorn の補題により極大元 $`\mathcal{M}`$ が存在する.
    この $`\mathcal{M}`$ は $`A`$ を含む超フィルターである.

Proposition. **超フィルターの特徴づけ**
:   集合 $`X`$ 上のフィルター $`\mathcal{M}`$ に対して, 以下同値.
    1. $`\mathcal{M}`$ は超フィルターである.
    2. 任意の $`A\in2^X`$ に対して, 各 $`M\in\mathcal{M}`$ で $`A\cap M\neq\emptyset`$ であれば $`A\in\mathcal{M}`$ である.
    3. 任意の $`A,B\subseteq X`$ に対して, $`A\cup B\in\mathcal{M}`$ ならば $`A\in\mathcal{M}`$ または $`B\in\mathcal{M}`$ である.
    4. 任意の $`A\in2^X`$ に対して, $`A\in\mathcal{M}`$ あるいは $`A^\complement\in\mathcal{M}`$ である.

<u>proof.</u>
:   (1)$`\Rightarrow`$(2) を示す.
    $`A`$ が各 $`M\in\mathcal{M}`$ と交わるなら, $`\mathcal{M}\cup\{A\}`$ は有限交叉性を持つ.
    これが生成するフィルターは $`\mathcal{M}`$ の細分であるから, 極大性より $`A\in\mathcal{M}`$ である.
    (2)$`\Rightarrow`$(3) とする.
    $`A\cup B\in\mathcal{M}`$ で $`A\notin\mathcal{M}`$ なら, (2) の対偶からある $`M\in\mathcal{M}`$ が $`A\cap M=\emptyset`$ を満たす.
    このとき $`(A\cup B)\cap M\in\mathcal{M}`$ かつ $`(A\cup B)\cap M\subseteq B`$ だから $`B\in\mathcal{M}`$ である.
    (3)$`\Rightarrow`$(4) は $`X=A\cup A^\complement\in\mathcal{M}`$ を (3) に適用すればよい.
    (4)$`\Rightarrow`$(1) とする.
    $`\mathcal{M}`$ の真の細分 $`\mathcal{G}`$ があると仮定し, $`A\in\mathcal{G}\setminus\mathcal{M}`$ を取る.
    (4) より $`A^\complement\in\mathcal{M}\subseteq\mathcal{G}`$ となり, $`\emptyset=A\cap A^\complement\in\mathcal{G}`$ は矛盾である.
    したがって $`\mathcal{M}`$ は超フィルターである.

Definition. **フィルターの制限と拡張**
:   集合 $`X`$ と空でない部分集合 $`A\subseteq X`$ に対して, 次がそれぞれ成り立つ.
    - $`X`$ 上のフィルター $`\mathcal{F}`$ が $`A\in\mathcal{F}`$ であれば
      ```math
      \mathcal{F}|_A\coloneqq\{B\subseteq A\mid\exists F\in\mathcal{F},F\cap A\subseteq B\}
      ```
      は $`A`$ 上のフィルターである. $`\mathcal{F}|_A`$ を $`\mathcal{F}`$ の $`A`$ への制限と呼ぶ.
    - $`A`$ 上のフィルター $`\mathcal{G}`$ に対して集合族 $`\hat{\mathcal{G}}\coloneqq\{F\in2^X\mid\exists G\in\mathcal{G}\text{ s.t. }G\subseteq F\}`$ は $`X`$ 上のフィルターである. $`\hat{\mathcal{G}}`$ を $`\mathcal{G}`$ の $`X`$ への拡張と呼ぶ.

    さらに, 対応 $`\mathcal{F}\mapsto\mathcal{F}|_A`$, $`\mathcal{G}\mapsto\hat{\mathcal{G}}`$ はそれぞれ $`A`$ を含む $`X`$ 上のフィルター全体と $`A`$ 上のフィルター全体の写像となり, 制限と拡張は互いに逆写像となる.

以後, この対応により $`A`$ を含む $`X`$ 上のフィルターと $`A`$ 上のフィルターを同一視する.

Proposition. **フィルターの像**
:   集合 $`X`$ 上のフィルター $`\mathcal{F}`$ と写像 $`f:X\to Y`$ に対して, $`\mathcal{F}`$ の $`f`$ による像
    ```math
    f[\mathcal{F}]\coloneqq\{G\in2^Y\mid f^{-1}(G)\in\mathcal{F}\}
    ```
    は $`Y`$ 上のフィルターである. 特に $`\mathcal{F}`$ が超フィルターであれば $`f[\mathcal{F}]`$ も超フィルターである.

<u>proof.</u>
:   逆像は全体集合と有限交叉を保ち, 包含関係を保つ.
    したがって表示した集合族はフィルターの三公理を満たし, 空集合を含まない.
    $`\mathcal{F}`$ が超フィルターであり $`B\subseteq Y`$ を取る.
    $`f^{-1}(B)`$ とその補集合 $`f^{-1}(B^\complement)`$ のいずれか一方は $`\mathcal{F}`$ に属する.
    よって $`B`$ または $`B^\complement`$ が $`f[\mathcal{F}]`$ に属する.
    超フィルターの特徴づけから $`f[\mathcal{F}]`$ は超フィルターである.

Definition. **フィルターの収束**
:   位相空間 $`X`$ と $`X`$ 上のフィルター $`\mathcal{F}`$ と 点 $`x\in X`$ に対して, $`\mathcal{F}`$ が $`x`$ の近傍系 $`\mathcal{N}_X(x)`$ の細分となるとき, $`x`$ を **フィルター $`\mathcal{F}`$ の極限点** (*limit point of a filter $`\mathcal{F}`$*) といい, 極限の存在するフィルターは**収束する** (*converge*) といい, 収束しないフィルターは**発散する** (*diverge*) という.

Definition. **フィルターの堆積**
:   位相空間 $`X`$ と $`X`$ 上のフィルター $`\mathcal{F}`$ と 点 $`x\in X`$ に対して, $`\mathcal{F}`$ が $`x`$ の近傍系 $`\mathcal{N}_X(x)`$ と両立するとき, $`x`$ を **フィルター $`\mathcal{F}`$ の堆積点** (*cluster point of a filter $`\mathcal{F}`$*) という.

フィルター基 $`\mathcal{F}`$ に対して, $`\mathcal{F}`$ の極限点（それぞれ堆積点）を $`\mathcal{F}`$ の生成するフィルターの極限点（それぞれ堆積点）とする.

Theorem. **堆積点の特徴づけ**
:   位相空間 $`X`$ と $`X`$ 上のフィルター $`\mathcal{F}`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`x`$ は $`\mathcal{F}`$ の堆積点である.
    2. $`\mathcal{F}`$ の細分で $`x`$ に収束するものが存在する.

<u>proof.</u>
:   (1) を仮定する.
    $`\mathcal{F}`$ と $`\mathcal{N}_X(x)`$ の交わりはフィルターであり, 両者の共通細分である.
    これは $`\mathcal{F}`$ の細分であって $`\mathcal{N}_X(x)`$ の細分でもあるから, $`x`$ に収束する.
    逆に $`\mathcal{G}`$ が $`\mathcal{F}`$ の細分で $`x`$ に収束するとする.
    任意の $`F\in\mathcal{F}`$ と $`U\in\mathcal{N}_X(x)`$ はともに $`\mathcal{G}`$ に属するため, $`F\cap U\neq\emptyset`$ である.
    よって $`\mathcal{F}`$ と $`\mathcal{N}_X(x)`$ は両立し, $`x`$ は堆積点である.

Theorem.
:   位相空間 $`X`$ と部分集合 $`A\subseteq X`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`x\in\overline{A}`$.
    2. $`x`$ に収束する $`A`$ 上のフィルターが存在する.

<u>proof.</u>
:   $`x\in\overline{A}`$ は, 任意の $`x`$ の近傍が $`A`$ と交わることと同値である.
    これは単項フィルター $`\langle\{A\}\rangle`$ と $`\mathcal{N}_X(x)`$ の両立と同値である.
    前定理より, $`\langle\{A\}\rangle`$ の細分で $`x`$ に収束するフィルターが存在することと同値である.
    このフィルターは $`A`$ を含むから, 制限により $`A`$ 上の収束フィルターを与える.
    逆向きは, $`A`$ 上のフィルターを $`X`$ 上へ拡張して前定理を逆向きに適用すれば従う.

Theorem.
:   位相空間 $`X`$ に対して, $`X`$ 上のフィルター $`\mathcal{F}`$ の堆積点全体は $`\bigcap_{F\in\mathcal{F}}\overline{F}`$ と一致する.

<u>proof.</u>
:   $`x`$ が $`\mathcal{F}`$ の堆積点であることは, 任意の $`F\in\mathcal{F}`$ と任意の $`x`$ の近傍が交わることと同値である.
    これは任意の $`F\in\mathcal{F}`$ に対して $`x\in\overline{F}`$ と同値であり, 結論が従う.

Theorem.
:   位相空間 $`X,Y`$ と写像 $`f:X\to Y`$ と 点 $`x\in X`$ に対して, 以下同値:
    1. $`f`$ は $`x`$ で連続である.
    2. $`x`$ に収束する $`X`$ 上の任意のフィルター $`\mathcal{F}`$ に対して, $`\mathcal{F}`$ の $`f`$ による像 $`f[\mathcal{F}]`$ は $`f(x)`$ へ収束する.

<u>proof.</u>
:   (1) は $`f^{-1}(V)\in\mathcal{N}_X(x)`$ が任意の $`V\in\mathcal{N}_Y(f(x))`$ に対して成り立つことと同値である.
    $`\mathcal{F}`$ が $`x`$ に収束すれば $`f^{-1}(V)\in\mathcal{F}`$ となり, 定義から $`V\in f[\mathcal{F}]`$ である.
    よって (2) が従う.
    逆に (2) で $`\mathcal{F}=\mathcal{N}_X(x)`$ と置けば, $`f[\mathcal{N}_X(x)]`$ は $`f(x)`$ に収束する.
    これは上の近傍による連続性の条件そのものである.

### フィルターとネットの相互変換

Proposition. **ネットの生成するフィルター基**
:   位相空間 $`X`$ と $`X`$ のネット $`p=(p_\lambda)_{\lambda\in\Lambda}`$ に対して,
    ```math
    \mathcal{F}\coloneqq\{F_\lambda\mid\lambda\in\Lambda\},\quad
    F_\lambda\coloneqq\{p_j\mid j\in\Lambda,\lambda\leq j\}
    ```
    とすると, $`\mathcal{F}`$ は $`X`$ 上のフィルター基であり, $`x\in X`$ に対して以下同値:
    1. $`(p_\lambda)_{\lambda\in\Lambda}`$ は $`x`$ に収束する.
    2. $`\mathcal{F}`$ は $`x`$ に収束する.

    $`\mathcal{F}`$ をネット $`p=(p_\lambda)_{\lambda\in\Lambda}`$ の生成するフィルター基といい, $`\varphi(p)`$ と表す.

<u>proof.</u>
:   各 $`F_\lambda`$ は $`p_\lambda`$ を含むので空でない.
    $`\lambda,\mu\in\Lambda`$ に対して両者の上界 $`\nu`$ を取れば $`F_\nu\subseteq F_\lambda\cap F_\mu`$ である.
    よって $`\mathcal{F}`$ はフィルター基である.
    $`p`$ が $`x`$ に収束することは, 任意の $`x`$ の近傍 $`U`$ に対してある $`\lambda`$ が存在し $`F_\lambda\subseteq U`$ となることと同値である.
    これは, $`U`$ が $`\mathcal{F}`$ の生成するフィルターに属することと同値である.

Proposition. **フィルター基の生成するネット**
:   位相空間 $`X`$ と $`X`$ 上のフィルター基 $`\mathcal{F}`$ に対して,
    ```math
    \Lambda\coloneqq\{(a,A)\mid a\in A\in\mathcal{F}\},\quad
    (a,A)\leq(b,B)\mathrel{\overset{\text{def}}{\iff}}B\subseteq A
    ```
    とすると, $`(\Lambda,\leq)`$ は有向集合となる. このとき, 写像 $`p:\Lambda\to X`$ を $`p_{(a,A)}\coloneqq a`$ とすると $`p`$ は $`X`$ のネットであり, $`x\in X`$ に対して以下同値:
    1. $`\mathcal{F}`$ は $`x`$ に収束する.
    2. $`(p_{(a,A)})`$ は $`x`$ に収束する.

    $`(p_{(a,A)})`$ をフィルター基 $`\mathcal{F}`$ の生成するネットといい, $`\psi(\mathcal{F})`$ と表す.

<u>proof.</u>
:   二つの添字 $`(a,A),(b,B)`$ に対して, フィルター基の条件から $`C\in\mathcal{F}`$ かつ $`C\subseteq A\cap B`$ を取れる.
    $`c\in C`$ を選べば $`(c,C)`$ は両者の上界であり, $`\Lambda`$ は有向集合である.
    $`\mathcal{F}`$ が $`x`$ に収束し, $`U`$ を $`x`$ の近傍とする.
    ある $`A\in\mathcal{F}`$ が $`A\subseteq U`$ を満たすので, $`(a,A)`$ より後の添字 $`(b,B)`$ では $`B\subseteq A`$ かつ $`p_{(b,B)}=b\in U`$ となる.
    よってネットは $`x`$ に収束する.
    逆にネットが $`x`$ に収束し, $`U`$ を $`x`$ の近傍とする.
    ある $`(a,A)`$ より後のすべての項が $`U`$ に属する.
    任意の $`b\in A`$ に対し $`(b,A)`$ は $`(a,A)`$ より後であるから $`b\in U`$ である.
    よって $`A\subseteq U`$ であり, $`\mathcal{F}`$ は $`x`$ に収束する.

Proposition. **ネットとフィルター基の合成**
:   集合 $`X`$ のネット $`p=(p_\lambda)_{\lambda\in\Lambda}`$ に対して, $`(\psi\circ\varphi)(p)`$ は $`p`$ の部分ネットとなる.

<u>proof.</u>
:   $`\varphi(p)`$ の要素は尾部集合 $`F_\lambda`$ である.
    厳密には添字を $`(p_j,F_\lambda,j)`$ ($`j\geq\lambda`$) に持ち上げる.
    二つのこのような添字には, もとの有向性によって両方の $`j`$ と $`\lambda`$ より後の共通上界を取れる.
    この持ち上げた有向集合は $`(\psi\circ\varphi)(p)`$ の添字集合への共終な写像を持ち, $`j`$ への射影は $`\Lambda`$ への単調共終写像である.
    対応する値は常に $`p_j`$ なので, $`(\psi\circ\varphi)(p)`$ は共終な再添字付けを除いて $`p`$ の部分ネットである.

Proposition. **フィルター基とネットの合成**
:   集合 $`X`$ 上のフィルター基 $`\mathcal{F}`$ に対して, $`\mathcal{F}=(\varphi\circ\psi)(\mathcal{F})`$ となる.

<u>proof.</u>
:   $`A\in\mathcal{F}`$ と $`a\in A`$ を取る.
    ネット $`\psi(\mathcal{F})`$ における添字 $`(a,A)`$ の尾部の値全体は $`A`$ に一致する.
    実際, それより後の添字 $`(b,B)`$ では $`B\subseteq A`$ なので $`b\in A`$ である.
    逆に任意の $`b\in A`$ に対して $`(b,A)`$ は $`(a,A)`$ より後にあり, その値は $`b`$ である.
    よって得られる尾部集合全体はちょうど $`\mathcal{F}`$ である.

### 特別な部分集合

Definition.
:   位相空間 $`X`$ の部分集合 $`A\in2^X`$ の集積点全体を $`A^d`$ とし, これを $`A`$ の**導来集合** (*derived set*) という.
    $`A\subseteq A^d`$ な $`A`$ を **自己稠密集合** (*dense-in-itself set*) といい, 特に $`A=A^d`$ な $`A`$ を **完全集合** (*perfect set*) という.

Definition. **正則開集合**
:   位相空間 $`X`$ に対して, 開集合 $`G`$ が $`\overline{G}^\circ=G`$ を満たすとき, $`G`$ を **正則開集合** (*regular open set*) という.

Definition. **稠密と疎**
:   位相空間 $`X`$ に対して, 部分集合 $`S\in2^X`$ が $`X=\overline{S}`$ を満たすとき $`S`$ は $`X`$ において **稠密** (*dense*) であるという.
    他方, 部分集合 $`S\in2^X`$ が $`\overline{S}^\circ=\emptyset`$ を満たすとき, $`S`$ は $`X`$ における **疎集合** (*nowhere dense set*) という.

Definition. **痩集合**
:   位相空間 $`X`$ の部分集合 $`S`$ が $`X`$ の疎集合の可算和で表現できるとき **痩せている** (*meager in $`X`$*) といい, 痩せている集合を **痩集合** (*meager set*) あるいは **第一類集合** (*set of the first category*) という. 他方, 痩集合でない集合を **非痩集合** (*nonmeager set*) あるいは **第二類集合** (*set of the second category*) という.
    特に, 位相空間 $`X`$ の台集合自体が痩せているとき, $`X`$ を **痩空間** (*meager space*) あるいは第一類空間という. 他方, 痩空間でない位相空間を **非痩空間** (*nonmeager space*) あるいは第二類空間という.
    また, 補集合 $`S^\complement=X\setminus S`$ が痩せているような集合 $`S`$ を **補痩である** (*comeager*) あるいは **残留的である** (*residual*) という.

---

## 空間の構成

新しい位相空間は, 既知の空間を積, 余積, 商, 部分空間として組み合わせることで得られる.
ここでは連続写像に関する最弱位相と最強位相を使い, それらの構成を統一して記述する.

### 積と余積

Definition. **積空間**
:   位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ に対して, 台集合の直積による標準射影 $`\pi_\lambda\colon\prod_{\lambda\in\Lambda}(X_\lambda)_0\to(X_\lambda)_0`$ により
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
    - 各射影 $`\pi_\lambda\colon X\to X_\lambda`$ は連続かつ開写像である.
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

Definition. **余積空間**
:   位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ に対して, 台集合のタグ付き和による標準入射 $`\iota_\lambda\colon(X_\lambda)_0\to\coprod_{\lambda\in\Lambda}(X_\lambda)_0`$ により
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
    - 各標準入射 $`\iota_\lambda\colon X_\lambda\to Y`$ は開埋め込みである.
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

---

## 分離性

異なる点や閉集合を開近傍でどこまで区別できるかは, 位相空間の性質を大きく左右する.
分離公理を段階的に定め, 後の距離化, コンパクト化, 連続関数の構成で必要になる条件を区別する.

Definition. **分離公理**
:   位相空間 $`X`$ の近傍系 $`\mathcal{U}`$ と $`X`$ の部分集合 $`A,B`$ に対して次をそれぞれ定義する.
    1. $`A,B`$ が **位相的に識別可能** (*topologically distinguishable*) であるとは, 各 $`a\in A,b\in B`$ に対して
        ```math
        \mathcal{U}(a)\neq\mathcal{U}(b)
        ```
        であるときいう.
    2. $`A,B`$ が **分離される** (*separated*) とは, 
        ```math
        \overline{A}\cap B=A\cap\overline{B}=\emptyset
        ```
        であるときいう.
    3. $`A,B`$ が **近傍で分離される** (*separated by neighbourhoods*) とは, 次を満たすときいう:
        ```math
        \exists U\in\mathcal{U}[A],\exists V\in\mathcal{U}[B],\text{ s.t. }U\cap V=\emptyset.
        ```
    4. $`A,B`$ が **閉近傍で分離される** (*closed separated by neighbourhoods*) とは, 次を満たすときいう:
        ```math
        \exists U\in\mathcal{U}[A],\exists V\in\mathcal{U}[B],\text{ s.t. }\overline{U}\cap\overline{V}=\emptyset.
        ```
    5. $`A,B`$ が **函数で分離される** (*separated by a continuous function*) とは, $`X`$ 上の実数値連続写像 $`f`$ として $`f(A)=\{0\}`$ かつ $`f(B)=\{1\}`$ を満たすものが存在するときいう.
    6. $`A,B`$ が **函数でちょうど分離される** (*precisely separated by a continuous function*) とは, $`X`$ 上の実数値連続写像 $`f`$ として $`f^{-1}(\{0\})=A`$ かつ $`f^{-1}(\{1\})=B`$ を満たすものが存在するときいう.

Proposition. **分離概念の含意系列**
:   空でない部分集合 $`A,B\subseteq X`$ に対して, 次の含意が成り立つ.
    ```math
    \begin{aligned}
    &\text{函数でちょうど分離される}
    \Longrightarrow \text{函数で分離される}
    \Longrightarrow \text{近傍で分離される}\\
    &\Longrightarrow \text{分離される}
    \Longrightarrow \text{位相的に識別可能}
    \Longrightarrow A\cap B=\emptyset.
    \end{aligned}
    ```

<u>proof.</u>
:   $`A=f^{-1}(\{0\})`$ かつ $`B=f^{-1}(\{1\})`$ を満たす連続写像 $`f`$ があれば, $`A,B`$ は空でないので $`f(A)=\{0\}`$ かつ $`f(B)=\{1\}`$ である.
    函数で分離する連続写像 $`f:X\to\mathbb R`$ に対して, $`U=f^{-1}((-1/2,1/2))`$ と $`V=f^{-1}((1/2,3/2))`$ とおけば, $`U,V`$ は互いに交わらない開集合で $`A\subseteq U`$, $`B\subseteq V`$ を満たす.
    $`A,B`$ が近傍で分離されるとし, $`U,V`$ を互いに交わらない近傍とする.
    $`p\in\overline A\cap B`$ なら $`V`$ は $`p`$ の近傍であるから $`V\cap A\neq\emptyset`$ となるが, $`A\subseteq U`$ と $`U\cap V=\emptyset`$ に反する.
    同様に $`A\cap\overline B=\emptyset`$ であるから, $`A,B`$ は分離される.
    $`a\in A`$ と $`b\in B`$ が同じ近傍系をもつなら, $`b\in\overline{\{a\}}`$ かつ $`a\in\overline{\{b\}}`$ である.
    したがって $`A,B`$ は分離されず, 対偶により分離される部分集合は位相的に識別可能である.
    位相的に識別可能な部分集合は共通点をもたない.

### 点同士の分離性

Definition. **Kolmogorov 空間**
:   位相空間 $`X`$ が **Kolmogorov 空間** (*Kolmogorov space*) であるとは, $`X`$ の任意の異なる 2 点が位相的に識別可能であるときいう.

これは古典的な $`\mathbf{T}_0`$ 公理に相当する.

Definition. **$`\mathbf{T}_1`$ 空間**
:   位相空間 $`X`$ が **$`\mathbf{T}_1`$ 空間** (*$`\mathbf{T}_1`$ space*) であるとは, $`X`$ の任意の異なる 2 点が分離されるときいう.

$`\mathbf{T}_1`$ 空間は古典的には **Fréchet 空間** (*Fréchet space*) または **到達可能空間** (*accessible space*) と呼ばれることがある。ただし現代では "Fréchet space" が関数解析における Fréchet–Urysohn 性を指す場合も多いため, 本書では $`\mathbf{T}_1`$ 空間を主名称とする.

Definition. **前正則空間**
:   位相空間 $`X`$ が **前正則** (*preregular*) であるとは, $`X`$ の任意の位相的に識別可能な 2 点が近傍で分離されるときいう.

Definition. **Hausdorff 空間**
:   位相空間 $`X`$ が **Hausdorff 空間** (*Hausdorff space*) であるとは, $`X`$ の任意の異なる 2 点が近傍で分離されるときいう.

これは古典的な $`\mathbf{T}_2`$ 公理に相当する.

Definition. **Urysohn 空間**
:   位相空間 $`X`$ が **Urysohn 空間** (*Urysohn space*) であるとは, $`X`$ の任意の異なる 2 点が閉近傍で分離されるときいう.

古典的には $`\mathbf{T}_{2\frac12}`$ 公理と呼ばれることがある.

### 点と閉集合の分離

Definition. **正則**
:   位相空間 $`X`$ が **正則** (*regular*) であるとは, $`X`$ の任意の点 $`x`$ と任意の閉集合 $`F`$ が $`x\notin F`$ ならば $`\{x\},F`$ は近傍で分離されるときいう.

Definition. **完全正則**
:   位相空間 $`X`$ が **完全正則** (*completely regular*) であるとは, $`X`$ の任意の点 $`x`$ と任意の閉集合 $`F`$ が $`x\notin F`$ ならば $`\{x\},F`$ は函数で分離されるときいう.

### 閉集合同士の分離

Definition. **正規**
:   位相空間 $`X`$ が **正規** (*normal*) であるとは, 任意の閉集合 $`F,E`$ に対して, $`F\cap E=\emptyset`$ ならば $`F,E`$ は近傍で分離されるときいう.

Theorem. **Urysohn の補題**
:   正規 $`\mathbf{T}_1`$ 空間 $`X`$ の互いに交わらない閉集合 $`A,B`$ に対して, 連続写像
    ```math
    f:X\longrightarrow[0,1]
    ```
    であって $`f(A)=\{0\}`$ および $`f(B)=\{1\}`$ を満たすものが存在する.

<u>proof.</u>
:   正規性により, 閉集合 $`C`$ とそれを含む開集合 $`U`$ に対して
    ```math
    C\subseteq V\subseteq\overline{V}\subseteq U
    ```
    を満たす開集合 $`V`$ を選べる.
    この操作を二進有理数 $`r\in[0,1]`$ に沿って帰納的に適用すると, 開集合族 $`(U_r)`$ を
    ```math
    A\subseteq U_0,\qquad \overline{U_r}\subseteq U_s\quad(r<s),\qquad \overline{U_r}\cap B=\emptyset
    ```
    となるように構成できる.
    次で写像 $`f:X\to[0,1]`$ を定める.
    ```math
    f(x)\coloneqq\inf\{r\in\mathbb{D}\cap[0,1]\mid x\in U_r\},
    ```
    ただし集合が空の場合は $`f(x)=1`$ とする.
    入れ子条件から, 任意の $`t\in[0,1]`$ に対して $`f^{-1}([0,t))`$ と $`f^{-1}((t,1])`$ は開集合である.
    よって $`f`$ は連続である.
    構成により $`A`$ 上では $`f=0`$, $`B`$ 上では $`f=1`$ である.

Corollary. **正規 Hausdorff 空間の完全正則性**
:   正規 $`\mathbf{T}_1`$ 空間は完全正則である.

<u>proof.</u>
:   $`x\in X`$ と $`x`$ を含まない閉集合 $`F`$ をとる.
    $`\mathbf{T}_1`$ 性により $`\{x\}`$ は閉集合であり, $`\{x\}`$ と $`F`$ は互いに交わらない.
    Urysohn の補題から, $`f(x)=0`$ かつ $`f(F)=\{1\}`$ を満たす連続写像 $`f:X\to[0,1]`$ が存在する.
    したがって $`\{x\}`$ と $`F`$ は函数で分離され, $`X`$ は完全正則である.

### Tietze の拡張定理

Theorem. **Tietze の拡張定理**
:   正規 $`\mathbf{T}_1`$ 空間 $`X`$ の閉部分集合 $`A`$ と連続写像 $`f:A\to[-1,1]`$ に対して, 連続写像 $`\overline{f}:X\to[-1,1]`$ が存在して
    ```math
    \overline{f}|_A=f
    ```
    を満たす.

<u>proof.</u>
:   $`[-1,1]`$ が実数の順序凸な閉区間であることを用いる Tietze の拡張補題を適用する.
    補題は, 閉部分空間上の連続写像 $`h:A\to\mathbb R`$ が区間 $`[-1,1]`$ に値を取るなら, 全空間上の連続写像 $`g:X\to\mathbb R`$ で同じ区間に値を取り, $`g|_A=h`$ となるものを与える.
    したがって $`h=f`$ とすれば, 求める $`\overline f`$ が得られる.

Corollary.
:   正規 $`\mathbf{T}_1`$ 空間の閉部分集合上の任意の連続実数値関数は, 全空間上の連続実数値関数へ延長できる.

<u>proof.</u>
:   まず有界値の場合を示す.
    $`|f|\leq1`$ としてよい.
    残差 $`r_0=f`$ に対し, $`r_n`$ が定まったとき
    ```math
    r_n^{-1}(({-}\infty,-1/3]),\qquad r_n^{-1}([1/3,\infty))
    ```
    は $`A`$ の互いに素な閉集合である.
    Urysohn の補題から, 絶対値が高々 $`1/3`$ でありこの二つの集合上でそれぞれ $`-1/3,1/3`$ を取る連続関数 $`g_n:X\to\mathbb R`$ を選べる.
    $`r_{n+1}=r_n-g_n|_A`$ とおけば $`|r_{n+1}|\leq(2/3)|r_n|`$ となる.
    適切な定数倍を各段階に施して得る級数 $`\sum_n g_n`$ は一様収束し, その和は $`A`$ 上で $`f`$ に一致する.
    一般の実数値関数についても, 同じ近似を各段階の残差の大きさに応じて行う Tietze の逐次近似法により連続延長を得る.
    すなわち有界性は各近似項にのみ必要であり, 元の $`f`$ の有界性は仮定しない.

### 分割の一

Definition. **分割の一**
:   位相空間 $`X`$ の開被覆 $`\mathcal{U}`$ に **従属する分割の一** (*partition of unity subordinate to $`\mathcal{U}`$*) とは, 連続写像の族
    ```math
    (\varphi_i:X\to[0,1]\mid i\in I)
    ```
    であって, 次を満たすものをいう.
    - 族 $`(\operatorname{supp}\varphi_i\mid i\in I)`$ は局所有限である.
    - 各 $`i\in I`$ に対して, $`\operatorname{supp}\varphi_i\subseteq U_i`$ となる $`U_i\in\mathcal{U}`$ が存在する.
    - 各 $`x\in X`$ に対して,
        ```math
        \sum_{i\in I}\varphi_i(x)=1
        ```
        が成り立つ.

    ここで $`\operatorname{supp}\varphi`$ は $`\{x\in X\mid\varphi(x)\neq0\}`$ の閉包である.

Theorem. **分割の一の存在定理**
:   パラコンパクト Hausdorff 空間の任意の開被覆には従属する分割の一が存在する.

<u>proof.</u>
:   開被覆 $`\mathcal{U}`$ をとる.
    パラコンパクト Hausdorff 空間は正規である.
    縮小補題を二度適用し, $`X`$ を被覆する局所有限な開族 $`(W_i)_{i\in I}`$ と開族 $`(V_i)_{i\in I}`$ および $`U_i\in\mathcal{U}`$ を
    ```math
    \overline{W_i}\subseteq V_i,\qquad \overline{V_i}\subseteq U_i
    ```
    となるように選ぶ.
    Urysohn の補題から, 各 $`i`$ に対して連続写像 $`\psi_i:X\to[0,1]`$ を
    ```math
    \psi_i|_{\overline{W_i}}=1,\qquad \psi_i|_{X\setminus V_i}=0
    ```
    となるように選べる.
    このとき $`\operatorname{supp}\psi_i\subseteq\overline{V_i}\subseteq U_i`$ であり, 必要な従属性が得られる.
    支持の族は局所有限であるから, 各点の近傍では有限個の $`\psi_i`$ だけが非零である.
    したがって
    ```math
    \psi(x)\coloneqq\sum_{i\in I}\psi_i(x)
    ```
    は連続である.
    $`(V_i)`$ が被覆であることから $`\psi(x)>0`$ が全ての $`x\in X`$ で成り立つ.
    $`\varphi_i(x)=\psi_i(x)/\psi(x)`$ とおく.
    この族は局所有限であり, 各 $`\operatorname{supp}\varphi_i`$ は $`U_i`$ に含まれる.
    さらに各点で $`\sum_i\varphi_i(x)=1`$ である.
    よって $`(\varphi_i)_{i\in I}`$ は $`\mathcal{U}`$ に従属する分割の一である.

Remark.
:   局所有限性により, 各点の近傍では上の和の非零項が有限個しかない.
    そのため分割の一は局所的な連続関数を一つの連続関数へ貼り合わせる道具になる.

Theorem. **遺伝的正規性の特徴づけ**
:   位相空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は遺伝的正規である. すなわち, $`X`$ の任意の部分空間は正規である.
    2. 任意の部分集合 $`A,B`$ に対して $`A,B`$ が分離されるならば $`A,B`$ は近傍で分離される.

遺伝的正規空間は古典的には **全部分正規空間** (*completely normal space*) と呼ばれる.

<u>proof.</u>
:   (1) を仮定し, 分離された部分集合 $`A,B\subseteq X`$ をとる.
    $`S=A\cup B`$ に誘導した位相では $`A,B`$ は互いに素な閉集合である.
    よって, $`S`$ が正規であることから, $`S`$ の互いに素な開近傍が存在する.
    $`A,B`$ が分離されていることを用いる標準的な分離集合補題により, $`X`$ 内の互いに素な開近傍が得られる.
    したがって $`A,B`$ は $`X`$ でも近傍分離される.
    逆に (2) を仮定する.
    任意の部分空間 $`S\subseteq X`$ の互いに素な閉集合 $`C,D`$ をとると, $`\overline C\cap D=C\cap\overline D=\emptyset`$ である.
    よって $`C,D`$ は $`X`$ で分離され, (2) により $`X`$ 内で近傍分離される.
    その近傍を $`S`$ と交わらせれば $`S`$ における $`C,D`$ の近傍分離となる.
    従ってすべての部分空間が正規である.

Definition. **完全正規**
:   位相空間 $`X`$ が **完全正規** (*perfectly normal*) であるとは, 任意の閉集合 $`F,E`$ に対して, $`F\cap E=\emptyset`$ ならば $`F,E`$ は函数でちょうど分離されるときいう.

Theorem. **完全正規 (perfectly normal)**
:   位相空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は完全正規である.
    2. $`X`$ は正規であり, 任意の閉集合が $`G_\delta`$ 集合となる.

<u>proof.</u>
:   (1) なら函数による分離は近傍による分離を与えるので $`X`$ は正規である.
    閉集合 $`F`$ を空集合と函数でちょうど分離する関数を $`f:X\to[0,1]`$ とすると, 定義により $`F=f^{-1}(1)`$ である.
    $`g=1-f`$ とおけば $`F=g^{-1}(0)`$ である.
    よって
    ```math
    F=\bigcap_{n\geq1}g^{-1}([0,1/n))
    ```
    であり, $`F`$ は $`G_\delta`$ である.
    逆に (2) を仮定する.
    閉集合 $`F`$ ごとに, $`F`$ の $`G_\delta`$ 表示と Urysohn の補題を組み合わせ, $`F`$ を $`[0,1]`$ 値連続関数の零集合として表す.
    この構成は, 各段階の関数を $`2^{-n}`$ で重み付けした一様収束級数である.
    $`x\notin F`$ なら表示を与える開集合の少なくとも一つから外れるため, 対応する項が正となり, 級数の値も正となる.
    したがって $`u^{-1}(0)=F`$ となる連続関数 $`u:X\to[0,1]`$ が得られる.
    互いに素な閉集合 $`F,E`$ に対して $`u^{-1}(0)=F`$, $`v^{-1}(0)=E`$ を選ぶと, $`u+v`$ はどの点でも正である.
    よって $`h=u/(u+v)`$ は連続で, $`h^{-1}(0)=F`$ かつ $`h^{-1}(1)=E`$ となる.

Proposition. **正則性の近傍閉包による特徴づけ**
:   位相空間 $`X`$ が正則であることと, 任意の開集合 $`U`$ と点 $`x\in U`$ に対して
    ```math
    \exists V\in\mathbf O_X\quad
    x\in V\subseteq\overline{V}\subseteq U
    ```
    を満たす開集合 $`V`$ が存在することは同値である.

<u>proof.</u>
:   $`X`$ が正則であるとする.
    $`x\in U`$ ならば, $`\{x\}`$ と閉集合 $`X\setminus U`$ は近傍で分離される.
    したがって, $`x\in V`$ かつ $`X\setminus U\subseteq W`$ を満たす互いに交わらない開集合 $`V,W`$ が存在する.
    $`V\subseteq X\setminus W`$ であり, $`X\setminus W`$ は閉集合であるから, $`\overline V\subseteq X\setminus W\subseteq U`$ である.
    逆に, $`x\notin F`$ を満たす閉集合 $`F`$ と点 $`x`$ をとる.
    $`U=X\setminus F`$ とおき, 仮定から $`x\in V\subseteq\overline V\subseteq U`$ を満たす開集合 $`V`$ をとる.
    $`X\setminus\overline V`$ は $`F`$ の開近傍であり, $`V`$ と交わらない.
    よって $`\{x\}`$ と $`F`$ は近傍で分離される.

Proposition. **正規性の近傍閉包による特徴づけ**
:   位相空間 $`X`$ が正規であることと, 任意の閉集合 $`F`$ と開集合 $`U`$ に対して
    ```math
    F\subseteq U\quad\Longrightarrow\quad
    \exists V\in\mathbf O_X\quad
    F\subseteq V\subseteq\overline{V}\subseteq U
    ```
    が成り立つことは同値である.

<u>proof.</u>
:   $`X`$ が正規で, $`F\subseteq U`$ とする.
    $`F`$ と閉集合 $`X\setminus U`$ は近傍で分離されるから, $`F\subseteq V`$ と $`X\setminus U\subseteq W`$ を満たす互いに交わらない開集合 $`V,W`$ が存在する.
    $`V\subseteq X\setminus W`$ から $`\overline V\subseteq X\setminus W\subseteq U`$ が得られる.
    逆に, 互いに交わらない閉集合 $`F,E`$ をとる.
    $`U=X\setminus E`$ に対して仮定を適用すると, $`F\subseteq V\subseteq\overline V\subseteq X\setminus E`$ を満たす開集合 $`V`$ が存在する.
    $`X\setminus\overline V`$ は $`E`$ の開近傍であり, $`V`$ と交わらない.
    よって $`X`$ は正規である.

Proposition. **完全正規性と零点集合**
:   位相空間 $`X`$ が完全正規であることと, $`X`$ の任意の閉集合がある連続写像 $`u:X\to\mathbb R`$ の零点集合 $`u^{-1}(\{0\})`$ となることは同値である.

<u>proof.</u>
:   $`X`$ が完全正規で, $`F`$ が閉集合であるとする.
    $`F`$ と空集合を函数でちょうど分離する連続写像 $`f:X\to[0,1]`$ をとると, $`F=f^{-1}(\{0\})`$ である.
    逆に, 任意の閉集合が零点集合であると仮定する.
    互いに交わらない閉集合 $`F,E`$ に対して, $`u^{-1}(\{0\})=F`$ かつ $`v^{-1}(\{0\})=E`$ を満たす連続写像 $`u,v:X\to\mathbb R`$ をとる.
    $`F\cap E=\emptyset`$ だから $`|u|+|v|`$ は $`X`$ 上で正である.
    ```math
    h=\frac{|u|}{|u|+|v|}
    ```
    とおけば $`h`$ は連続で, $`h^{-1}(\{0\})=F`$ かつ $`h^{-1}(\{1\})=E`$ を満たす.
    よって $`X`$ は完全正規である.

Proposition. **Hausdorff 性と対角線**
:   位相空間 $`X`$ が Hausdorff 空間であることと, 対角線
    ```math
    \Delta_X=\{(x,x)\mid x\in X\}
    ```
    が積空間 $`X\times X`$ の閉集合であることは同値である.
    さらに, Hausdorff 空間 $`X`$ と位相空間 $`A`$ に対して, 任意の連続写像 $`f,g:A\to X`$ の等化集合 $`\{a\in A\mid f(a)=g(a)\}`$ は $`A`$ の閉集合であり, $`f`$ のグラフは $`A\times X`$ の閉集合である.

<u>proof.</u>
:   $`X`$ が Hausdorff で, $`(x,y)\notin\Delta_X`$ とする.
    $`x\neq y`$ だから, $`x\in U`$, $`y\in V`$ を満たす互いに交わらない開集合 $`U,V`$ が存在する.
    $`U\times V`$ は $`(x,y)`$ の開近傍で $`\Delta_X`$ と交わらない.
    よって $`\Delta_X`$ は閉集合である.
    逆に, $`x\neq y`$ とする.
    $`(x,y)\notin\Delta_X`$ であるから, 対角線の閉性により $`(x,y)`$ の開近傍 $`U\times V`$ で $`U\cap V=\emptyset`$ を満たすものが存在する.
    したがって $`X`$ は Hausdorff である.
    連続写像 $`(f,g):A\to X\times X`$ による $`\Delta_X`$ の逆像が等化集合であるから, 等化集合は閉集合である.
    グラフの閉性は, $`f(a)\neq y`$ を満たす $`(a,y)\in A\times X`$ に対して, Hausdorff 性と $`f`$ の連続性から $`a`$ の開近傍 $`U`$ と $`y`$ の開近傍 $`V`$ を $`f(U)\cap V=\emptyset`$ となるように選べることから従う.

Proposition. **分離性の部分空間への遺伝**
:   位相空間 $`X`$ が $`\mathbf{T}_0`$, $`\mathbf{T}_1`$, Hausdorff, Urysohn, 正則, または完全正則であるならば, 任意の部分空間 $`S\subseteq X`$ も同じ性質をもつ.

<u>proof.</u>
:   $`S`$ における開集合と閉集合は, それぞれ $`X`$ の開集合または閉集合との共通部分で表される.
    $`\mathbf{T}_0`$, $`\mathbf{T}_1`$, Hausdorff, Urysohn の各性質については, 点を分離する開集合または閉近傍を $`S`$ と交わらせればよい.
    正則性について, $`F`$ を $`S`$ の閉集合, $`x\in S\setminus F`$ とする.
    $`F=S\cap\overline F^{X}`$ であるから $`x\notin\overline F^{X}`$ であり, $`X`$ の正則性から $`\{x\}`$ と $`\overline F^{X}`$ を分離する近傍をとれる.
    それらを $`S`$ と交わらせると, $`\{x\}`$ と $`F`$ の分離近傍が得られる.
    完全正則性についても同様に $`\overline F^{X}`$ を用い, $`X`$ 上の分離函数を $`S`$ へ制限すればよい.

Proposition. **分離性の積空間への遺伝**
:   位相空間族 $`(X_\lambda)_{\lambda\in\Lambda}`$ の各空間が $`\mathbf{T}_0`$, $`\mathbf{T}_1`$, Hausdorff, Urysohn, 正則, または完全正則であるならば, 積空間 $`\prod_{\lambda\in\Lambda}X_\lambda`$ も同じ性質をもつ.

<u>proof.</u>
:   二点 $`x,y`$ が異なるならば, ある添字 $`\lambda`$ に対して $`x_\lambda\neq y_\lambda`$ である.
    $`\mathbf{T}_0`$, $`\mathbf{T}_1`$, Hausdorff, Urysohn の各性質について, この座標における分離集合または分離近傍の逆像をとれば, 積空間における同じ分離が得られる.
    正則性について, $`x\in U`$ を満たす積空間の開集合 $`U`$ をとる.
    積位相の開基から, 有限集合 $`L\subseteq\Lambda`$ と開集合 $`U_\lambda\subseteq X_\lambda`$ によって定まる基本開集合 $`B`$ が存在して $`x\in B\subseteq U`$ となる.
    各 $`\lambda\in L`$ に対して $`x_\lambda\in V_\lambda\subseteq\overline{V_\lambda}\subseteq U_\lambda`$ をとり, $`\lambda\notin L`$ では $`V_\lambda=X_\lambda`$ とおく.
    基本開集合 $`V=\prod_\lambda V_\lambda`$ は $`x\in V\subseteq\overline V\subseteq B\subseteq U`$ を満たす.
    よって正則性の近傍閉包による特徴づけから, 積空間は正則である.
    完全正則性について, $`x\in U`$ を満たす基本開近傍 $`B\subseteq U`$ をとり, $`L`$ をその有限な支持とする.
    $`L=\emptyset`$ の場合は, 定数函数 $`f=0`$ が $`x`$ と空集合を函数で分離する.
    $`L\neq\emptyset`$ の場合, 各 $`\lambda\in L`$ に対して, $`x_\lambda`$ と $`X_\lambda\setminus U_\lambda`$ を分離する連続函数 $`f_\lambda:X_\lambda\to[0,1]`$ をとる.
    ```math
    f(z)=\max_{\lambda\in L}f_\lambda(z_\lambda)
    ```
    と定めると, $`f`$ は連続で $`f(x)=0`$ である.
    $`z\notin B`$ ならばある $`\lambda\in L`$ に対して $`z_\lambda\notin U_\lambda`$ であるから $`f(z)=1`$ となる.
    したがって $`f`$ は $`x`$ と $`X\setminus U`$ を函数で分離し, 積空間は完全正則である.

Remark. **正規性の積空間による保存に関する注意**
:   正規性は各因子から任意の積空間へ一般には遺伝しない.
    したがって, 上の命題で正規性を列挙せず, 正規空間の積に関する主張を用いる場合は追加の仮定を明記する.

### Kolmogorov 商

2 点 $`x,y`$ が位相的に識別可能でないとき $`x\sim y`$ として定めたとき, この関係 $`\sim`$ を**位相的不可識別性** (*topological indistinguishability*) と呼ぶ.

Proposition.
:   位相的不可識別性は同値関係である.

<u>proof.</u>
:   任意の点の近傍系は自分自身と一致するから反射的である.
    近傍系の一致は対称的であり, また $`\mathcal{N}(x)=\mathcal{N}(y)`$ と $`\mathcal{N}(y)=\mathcal{N}(z)`$ なら $`\mathcal{N}(x)=\mathcal{N}(z)`$ なので推移的である.
    よって位相的不可識別性は同値関係である.

Definition. **Kolmogorov 商**
:   位相空間 $`X`$ に対して, 位相的不可識別性 $`\sim`$ による商空間 $`X/\sim`$ を $`X`$ の **Kolmogorov 商** (*Kolmogorov quotient*) といい, $`\operatorname{KQ}X`$ と表す.

Theorem. **Kolmogorov 商の普遍性**
:   位相空間 $`X`$ の Kolmogorov 商 $`X_0`$ は Kolmogorov 空間となる.
    さらに任意の Kolmogorov 空間 $`Y`$ と連続写像 $`f:X\to Y`$ に対して, 連続写像 $`\overline{f}:\operatorname{KQ}X\to Y`$ が一意的に存在して $`f=\overline{f}\circ\pi`$ が成り立つ. ただし, $`\pi:X\to\operatorname{KQ}X`$ は商写像である.

<u>proof.</u>
:   $`X`$ の二点が商で同じ点に移ることは, それらの近傍系が一致することを意味する.
    商空間の開集合は逆像で特徴づけられるので, 商の異なる二点はある開集合によって区別される.
    したがって $`\operatorname{KQ}X`$ は $`T_0`$ 空間である.

    次に連続写像 $`f:X\to Y`$ をとる.
    $`x\sim x'`$ と仮定する.
    もし $`f(x)\neq f(x')`$ なら, $`Y`$ の $`T_0`$ 性から $`f(x),f(x')`$ の一方だけを含む開集合 $`G`$ がある.
    しかし $`f^{-1}(G)`$ は $`x,x'`$ の一方だけを含む開集合となり, $`x\sim x'`$ に反する.
    よって $`f`$ は同値類上定数である.
    従って
    ```math
    \overline f([x])\coloneqq f(x)
    ```
    は well-defined であり, $`f=\overline f\circ\pi`$ を満たす.
    $`\pi`$ は商写像であるから, $`\overline f\circ\pi=f`$ の連続性は $`\overline f`$ の連続性を含意する.
    最後に $`\pi`$ は全射なので, この等式を満たす二つの写像はすべての同値類で一致する.
    よって $`\overline f`$ は一意である.

この定理より対応 $`X\mapsto\operatorname{KQ}X`$ は, 位相空間から Kolmogorov 空間への反射とみなせる.

### $`\mathbf{T}_0`$-reflection と弱い分離性

Definition. **対称的空間**
:   位相空間 $`X`$ が **対称的** (*symmetric*) であるとは, 任意の 2 点 $`x,y`$ が位相的に識別可能 ならば $`x,y`$ は分離されるときいう.

Proposition. **対称的**
:   位相空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は対称的である.
    2. $`X`$ の Kolmogorov 商 は $`\mathbf{T}_1`$ 空間である.

<u>proof.</u>
:   位相的に識別不能な点を同一視しているため, Kolmogorov 商では異なる二点は識別可能である.
    対称性は, 識別可能な二点が互いの閉包に入らないこと, すなわち特殊化順序が対称であることと同値である.
    この性質は Kolmogorov 商へ移る.
    Kolmogorov 商は $`T_0`$ であり, $`T_0`$ 性と特殊化順序の対称性は $`T_1`$ 性と同値である.
    よって条件 1 から条件 2 が従う.
    逆に商が $`T_1`$ なら, 商で異なる二点は互いの閉包に入らない.
    商写像の逆像をとれば, 元の空間で識別可能な二点も分離される.
    よって $`X`$ は対称的である.

Proposition.
:   位相空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は前正則である.
    2. $`X`$ の Kolmogorov 商 は Hausdorff 空間である.

<u>proof.</u>
:   前正則性とは, 位相的に識別可能な二点が近傍で分離されるという性質である.
    Kolmogorov 商では異なる二点がちょうど識別可能な二点に対応する.
    商写像の定義から, 商における二点の交わらない近傍は元の空間で対応する同値類を分離する飽和開近傍に持ち上がる.
    逆に元の空間での分離近傍は商に降下する.
    したがって前正則性は Kolmogorov 商の Hausdorff 性と同値である.

古典的には前正則性を $`\mathbf{R}_1`$ 公理と呼ぶことがある.

Definition. **弱 Urysohn 性**
:   位相空間 $`X`$ が **弱 Urysohn 性**を持つとは, $`X`$ の任意の 2 点 $`x,y`$ が位相的に識別可能 ならば $`x,y`$ は閉近傍で分離されるときいう.

この名称は本書での便宜的なものであり, 古典的な記号では $`R_{1\frac12}`$ と表されることがある.

Proposition.
:   位相空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は弱 Urysohn 性を持つ.
    2. $`X`$ の Kolmogorov 商 は Urysohn 空間である.

<u>proof.</u>
:   Kolmogorov 商では, 異なる二点はちょうど元の空間で識別可能な二点に対応する.
    商での閉近傍による分離を商写像で引き戻せば, 元の空間での閉近傍による分離を得る.
    逆に元の空間で識別可能な二点を閉近傍で分離できれば, 同値類で飽和した近傍を用いる標準的な飽和化によりその分離は商へ降下する.
    したがって二つの条件は同値である.

### 名前付き $`\mathbf{T}_0`$-分離空間

Definition. **Vietoris 空間**
:   正則かつ Kolmogorov な位相空間を **Vietoris 空間** (*Vietoris space*) という.

同値に, 正則 Hausdorff 空間である.

古典的には $`\mathbf{T}_3`$ 空間と呼ばれる.

Definition. **Tychonoff 空間**
:   完全正則かつ Kolmogorov な位相空間を **Tychonoff 空間** (*Tychonoff space*) という.

同値に, 完全正則 Hausdorff 空間である.

古典的には $`\mathbf{T}_{3\frac12}`$ 空間と呼ばれる.

Definition. **Tietze 空間**
:   正規かつ $`\mathbf{T}_1`$ な位相空間を **Tietze 空間** (*Tietze space*) という.

同値に, 正規 Hausdorff 空間である.

古典的には $`\mathbf{T}_4`$ 空間と呼ばれる.

Definition. **$`\mathbf{T}_5`$ 空間**
:   遺伝的正規かつ $`\mathbf{T}_1`$ な位相空間を $`\mathbf{T}_5`$ 空間という.

古典的には **全部分正規 Hausdorff** (*completely normal Hausdorff space*) とも呼ばれる.

Definition. **$`\mathbf{T}_6`$ 空間**
:   完全正規かつ $`\mathbf{T}_1`$ な位相空間を $`\mathbf{T}_6`$ 空間という.

古典的には **完全正規 Hausdorff** (*perfectly normal Hausdorff space*) とも呼ばれる.

### 古典的分離公理との対応

古典的な $`\mathbf{T}_n`$ 記法は, 以上の名前付き性質を次のように組み合わせたものとして理解できる.

| 古典記号 | 現代的な記述 |
| --- | --- |
| $`\mathbf{T}_0`$ | Kolmogorov |
| $`\mathbf{T}_1`$ | $`\mathbf{T}_1`$ |
| $`\mathbf{T}_2`$ | Hausdorff |
| $`\mathbf{T}_{2\frac{1}{2}}`$ | Urysohn |
| $`\mathbf{T}_3`$ | regular + $`\mathbf{T}_0`$ |
| $`\mathbf{T}_{3\frac{1}{2}}`$ | completely regular + $`\mathbf{T}_0`$ |
| $`\mathbf{T}_4`$ | normal + $`\mathbf{T}_1`$ |
| $`\mathbf{T}_5`$ | hereditarily normal + $`\mathbf{T}_1`$ |
| $`\mathbf{T}_6`$ | perfectly normal + $`\mathbf{T}_1`$ |

この表から分かるように, $`\mathbf{T}_0,\mathbf{T}_1,\mathbf{T}_2,\dots`$ は一種類の分離条件を単純に段階的に強めた系列ではない.

実際,

- $`\mathbf{T}_0,\mathbf{T}_1,\mathbf{T}_2`$ は主として点同士の分離,
- regularity は点と閉集合の分離,
- complete regularity は連続函数による点と閉集合の分離,
- normality は閉集合同士の分離,
- hereditary normality は normality の遺伝性,
- perfect normality は normality に閉集合の $`G_\delta`$ 性を加えた条件,

という異なる方向の強化を含んでいる.

したがって, 本書では $`\mathbf{T}_n`$ を分離性の基本定義としては用いず, 名前付きの分離性を基本概念とし, $`\mathbf{T}_n`$ はそれらの古典的な組合せを表す記法として扱う.

---

## 連結性

連結性は, 空間が二つの互いに交わらない開集合へ分解できるかを測る性質である.
点と部分集合の到達可能性を表す連結成分と弧状連結性も, この開集合による定義から導く.

### 連結空間

Definition. **連結空間**
:   位相空間 $`X`$ が **不連結** (*disconnected*) であるとは, 次を満たす開集合 $`G,H`$ が存在する時言う:
    ```math
    G\cup H=X,\quad G\cap H=\emptyset,\quad G\neq\emptyset,\quad H\neq\emptyset
    ```
    位相空間が不連結でないとき **連結** (*connected*) であるといい, 連結な位相空間を **連結空間** (*connected space*) という.

位相空間の部分集合が, 相対位相により連結空間になるとき **連結集合** (*connected set*) という.

Theorem. **連結性の特徴づけ**
:   位相空間 $`X`$ に対して, 以下同値:
    1. $`X`$ は連結である.
    2. 開かつ閉な部分集合は $`\emptyset`$ か $`X`$ のみである.
    3. 2 点離散空間 $`B`$ に対して, 連続な全射 $`X\to B`$ は存在しない.

<u>proof.</u>
:   $`X`$ が不連結であることは, 互いに交わらない空でない開集合 $`U,V`$ が $`X=U\cup V`$ を満たすことである.
    このとき $`U=X\setminus V`$ であるから $`U`$ は開かつ閉であり, $`\emptyset`$ と $`X`$ のいずれでもない.
    逆にこのような開かつ閉な集合 $`U`$ があれば, $`U`$ と $`X\setminus U`$ は不連結分解を与える.
    よって条件 1 と条件 2 は同値である.

    条件 2 を仮定し, 連続全射 $`f:X\to B`$ が存在するとする.
    $`B`$ の各一点集合は開かつ閉であるから, その逆像は $`X`$ の開かつ閉な集合である.
    全射性により二つの逆像はともに空でなく, 条件 2 に矛盾する.

    最後に条件 2 が成り立たないとする.
    $`\emptyset\neq U\neq X`$ となる開かつ閉な集合 $`U`$ に対して, $`U`$ 上で一方の点を, $`X\setminus U`$ 上で他方の点をとる写像 $`X\to B`$ は連続かつ全射である.
    よって条件 3 も条件 2 と同値である.

Theorem.
:   位相空間 $`X,Y`$ に対して, $`X`$ が連結かつ全射な連続写像 $`X\to Y`$ が存在するなら, $`Y`$ も連結となる.

<u>proof.</u>
:   連続全射写像を $`f:X\to Y`$ とする.
    $`Y`$ が不連結であると仮定し, 互いに交わらない空でない開集合 $`U,V`$ で $`Y=U\cup V`$ となるものをとる.
    $`f`$ の連続性から $`f^{-1}(U),f^{-1}(V)`$ は開集合である.
    全射性から両者は空でなく, また互いに交わらず和が $`X`$ となる.
    これは $`X`$ の連結性に矛盾する.
    よって $`Y`$ は連結である.

Theorem.
:   位相空間 $`X,Y`$ と商写像 $`f:X\to Y`$ が以下の 2 つの条件
    - $`Y`$ は連結,
    - 各 $`y\in Y`$ に対して $`f^{-1}(\{y\})\subseteq X`$ は連結集合
    を満たすとき, $`X`$ は連結となる.

<u>proof.</u>
:   $`X`$ が不連結であると仮定し, 互いに交わらない空でない開かつ閉な集合 $`A,B`$ で $`X=A\cup B`$ となるものをとる.
    各ファイバー $`f^{-1}(\{y\})`$ は連結であるから, $`A`$ と $`B`$ の両方に交わることはない.
    したがって
    ```math
    f^{-1}(f(A))=A,\qquad f^{-1}(f(B))=B
    ```
    である.
    $`f`$ は商写像であるから, $`f(A)`$ と $`f(B)`$ は $`Y`$ の開かつ閉な集合である.
    全射性からこれらは互いに交わらず, その和は $`Y`$ である.
    さらに $`A,B`$ は空でないので $`f(A),f(B)`$ も空でない.
    これは $`Y`$ の連結性に矛盾する.
    よって $`X`$ は連結である.

Theorem. **中間値の定理**
:   連結空間 $`X`$ と連続写像 $`f:X\to\mathbb{R}`$ に対して, $`f(a)<f(b)`$ なる $`a,b\in X`$ に対して次が成り立つ.
    ```math
    \forall t\in[f(a),f(b)],\exists c\in X\text{ s.t. }f(c)=t
    ```

<u>proof.</u>
:   連結空間の連続像 $`f(X)`$ は $`\mathbb{R}`$ の連結部分集合である.
    実数直線の連結部分集合は区間であるから, $`f(a),f(b)\in f(X)`$ かつ $`f(a)<f(b)`$ より
    ```math
    [f(a),f(b)]\subseteq f(X)
    ```
    となる.
    よって各 $`t\in[f(a),f(b)]`$ は $`f(c)=t`$ を満たすある $`c\in X`$ を持つ.

Proposition. **連結集合の貼り合わせ**
:   位相空間 $`X`$ の連結集合の族 $`\mathcal{C}`$ が条件
    ```math
    \exists C_0\in\mathcal{C}\text{ s.t. }\forall C\in\mathcal{C},C\cap C_0\neq\emptyset
    ```
    を満たすとき, $`\bigcup\mathcal{C}`$ は $`X`$ の連結集合となる.

<u>proof.</u>
:   $`C_0\in\mathcal{C}`$ を仮定の集合とする.
    $`\bigcup\mathcal{C}`$ が互いに交わらない二つの空でない相対開集合 $`U,V`$ に分解されると仮定する.
    $`C_0`$ は連結であるから $`C_0\subseteq U`$ または $`C_0\subseteq V`$ である.
    対称性により $`C_0\subseteq U`$ としてよい.
    任意の $`C\in\mathcal{C}`$ は $`C\cap C_0\neq\emptyset`$ を満たすので, $`C\cap U\neq\emptyset`$ である.
    $`C`$ の連結性から $`C\subseteq U`$ となる.
    したがって $`\bigcup\mathcal{C}\subseteq U`$ となり, $`V`$ が空でないことに矛盾する.
    よって $`\bigcup\mathcal{C}`$ は連結である.

Definition. **局所連結空間**
:   位相空間 $`X`$ が **局所連結** (*locally connected*) であるとは, 任意の点 $`x\in X`$ とその任意の開近傍 $`U`$ に対して,
    ```math
    x\in V\subseteq U
    ```
    を満たす連結な開集合 $`V`$ が存在するときいう.
    局所連結な位相空間を **局所連結空間** (*locally connected space*) という.

Theorem. **局所連結性の性質**
:   位相空間 $`X,Y`$ に対して, $`X`$ が局所連結かつ開商写像 $`X\to Y`$ が存在するなら, $`Y`$ も局所連結となる.

<u>proof.</u>
:   開商写像を $`q:X\to Y`$ とし, $`y\in Y`$ とその開近傍 $`W`$ をとる.
    $`x\in q^{-1}(y)`$ を一つ選ぶ.
    $`q^{-1}(W)`$ は $`x`$ の開近傍であるから, 局所連結性により $`x`$ を含む連結な開集合 $`U`$ で $`U\subseteq q^{-1}(W)`$ をとれる.
    $`q`$ が開写像なので $`q(U)`$ は $`y`$ を含む開集合である.
    また $`U`$ は連結であり連続像は連結であるから, $`q(U)`$ は連結である.
    $`q(U)\subseteq W`$ であるので, $`Y`$ は局所連結である.

### 連結成分

Definition. **連結成分**
:   位相空間 $`X`$ に対して, $`X`$ 上の二項関係 $`\sim`$ を
    - $`x\sim y`$ $`\mathrel{\overset{\text{def}}{\iff}}`$ $`x,y\in C`$ となる $`X`$ の連結集合 $`C`$ が存在する
    
    として定義すると $`\sim`$ は同値関係となる.
    このとき, 点 $`x\in X`$ の **連結成分** (*connected component*) を $`x\in\Gamma`$ を満たす商集合 $`X/\sim`$ の要素 $`\Gamma`$ として定義する.

Theorem. **連結成分の性質**
:   位相空間 $`X`$ の点 $`x\in X`$ の連結成分を $`\Gamma`$ は, 点 $`x`$ を含む $`X`$ の連結集合のうち最大のものであり, かつ閉集合である.

<u>proof.</u>
:   $`x`$ を含む連結集合すべての合併を $`C_x`$ とおく.
    それらは一点集合 $`\{x\}`$ と交わるから, 連結集合の貼り合わせにより $`C_x`$ は連結である.
    定義より $`x`$ を含む任意の連結集合は $`C_x`$ に含まれるので, $`C_x`$ は最大であり連結成分に等しい.
    閉包 $`\overline{C_x}`$ は連結である.
    しかも $`x\in C_x\subseteq\overline{C_x}`$ であるから, 最大性により $`\overline{C_x}\subseteq C_x`$ を得る.
    逆の包含は常に成り立つので $`\overline{C_x}=C_x`$ である.
    よって連結成分は閉集合である.

Definition. **完全不連結空間**
:   各連結成分がすべて 1 点のみからなるような位相空間を **完全不連結空間** (*totally disconnected space*) という.

### 弧状連結

Definition. **道**
:   位相空間 $`X`$ の点 $`a,b\in X`$ に対して, **$`a`$ から $`b`$ への道** (*path from $`a`$ to $`b`$*) とは, $`f(0)=a`$ かつ $`f(1)=b`$ を満たすような連続写像 $`f\colon[0,1]\toX`$ のことである.
    このとき, $`a`$ をこの道の始点, $`b`$ をこの道の終点という.

Definition. **道連結**
:   位相空間が **道連結** (*path-connected*) であるとは, 任意の 2 点の間に道が存在するときいう. 道連結な位相空間を **道連結空間** (*path-connected space*) という.
    特に, 弧状連結空間であって任意の 2 点の間に道として埋め込みであるようなものが存在するとき, **弧連結** (*arcwise connected*) であるといい, そのような位相空間を **弧連結空間** (*arcwise connected space*) という.

Theorem. **道の性質**
:   位相空間 $`X`$ に対して次がそれぞれ成り立つ.
    - 始点と終点が一致するような道は存在する.
    - $`a`$ から $`b`$ への道 $`f`$ に対して, 写像 $`\overline{f}:[0,1]\to X`$ を
        ```math
        \overline{f}(t)\coloneqq f(1-t),\quad 0\leq t\leq 1
        ```
        とすると, $`\overline{f}`$ は $`b`$ から $`a`$ への道となる. これを $`f`$ の逆道という.
    - $`a`$ から $`b`$ への道 $`f`$ と $`b`$ から $`c`$ への道 $`g`$ に対して, 写像 $`f\ast g:[0,1]\to X`$ を
        ```math
        (f\ast g)(t)\coloneqq
        \begin{cases}
        f(2t),&0\leq t\leq 1/2.\\
        g(2t-1),&1/2< t\leq 1.
        \end{cases}
        ```
        とすると, $`f\ast g`$ は $`a`$ から $`c`$ への道となる. これは $`f`$ と $`g`$ の合成道という.

<u>proof.</u>
:   定数写像 $`[0,1]\to X`$, $`t\mapsto a`$ は連続であり, 始点と終点はいずれも $`a`$ である.
    逆道については写像 $`r(t)=1-t`$ が連続であり, $`\overline f=f\circ r`$ は連続である.
    また $`\overline f(0)=f(1)=b`$, $`\overline f(1)=f(0)=a`$ である.
    合成道は二つの閉区間 $`[0,1/2]`$, $`[1/2,1]`$ 上で連続である.
    中点では $`f(1)=b=g(0)`$ なので貼り合わせ補題から $`f\ast g`$ は連続である.
    定義より $`(f\ast g)(0)=f(0)=a`$ と $`(f\ast g)(1)=g(1)=c`$ である.

Theorem.
:   道連結なら連結である.

<u>proof.</u>
:   弧状連結空間 $`X`$ が不連結であると仮定し, 互いに交わらない空でない開集合 $`U,V`$ で $`X=U\cup V`$ となるものをとる.
    $`a\in U`$ と $`b\in V`$ を選ぶ.
    弧状連結性から $`a`$ から $`b`$ への道 $`f:[0,1]\to X`$ が存在する.
    このとき $`f^{-1}(U)`$ と $`f^{-1}(V)`$ は $`[0,1]`$ の互いに交わらない空でない開集合であり, その和は $`[0,1]`$ である.
    これは区間 $`[0,1]`$ の連結性に矛盾する.
    よって $`X`$ は連結である.

### 既約空間

Definition. **既約空間**
:   位相空間 $`X`$ が **既約** (*irreducible*) あるいは **超連結** (*hyperconnected*) であるとは, $`X`$ の任意の真部分閉集合 $`F,E`$ に対して $`F\cup E\neq X`$ となるときいう.

位相空間の部分集合が, 相対位相により既約空間になるとき **既約集合** (*irreducible set*) という.

Proposition. **既約空間の特徴づけ**
:   位相空間 $`X`$ に対して以下同値:
    1. $`X`$ は既約である.
    2. 任意の空でない開集合 $`G, H`$ に対して, $`G\cap H\neq\emptyset`$ となる.
    3. 任意の空でない開集合 $`G`$ は $`X`$ において稠密である.
    4. 任意の開集合は連結である.

<u>proof.</u>
:   条件 1 が成り立つとする.
    空でない開集合 $`G,H`$ が交わらないなら, $`X\setminus G`$ と $`X\setminus H`$ は真の閉集合であり, その合併は $`X`$ である.
    これは条件 1 に矛盾する.
    逆に二つの真の閉集合 $`F,E`$ が $`X`$ を被覆するなら, 補集合 $`X\setminus F,X\setminus E`$ は交わらない空でない開集合となる.
    よって条件 1 と条件 2 は同値である.

    開集合 $`G`$ が稠密であることは, 任意の空でない開集合 $`H`$ が $`G`$ と交わることと同値である.
    従って条件 2 と条件 3 は同値である.

    条件 2 を仮定する.
    開集合 $`O`$ が不連結なら, $`O`$ の二つの空でない相対開部分集合は $`X`$ の二つの空でない開集合との交叉として書ける.
    それらは $`O`$ 内で交わらないため, 条件 2 に矛盾する.
    よって任意の開集合は連結である.
    逆に条件 2 が失敗すれば, 交わらない空でない開集合 $`G,H`$ の合併 $`G\cup H`$ は不連結な開集合である.
    よって条件 4 も同値である.

Definition. **既約成分**
:   位相空間 $`X`$ に対して, $`X`$ 上の二項関係 $`\sim`$ を
    - $`x\sim y`$ $`\iff`$ $`x,y\in I`$ となる $`X`$ の既約集合 $`I`$ が存在する
    
    として定義すると $`\sim`$ は同値関係となる.
    このとき, 点 $`x\in X`$ の **既約成分** (*irreducible component*) を $`x\in I`$ を満たす商集合 $`X/\sim`$ の要素 $`I`$ として定義する.

Theorem. **既約成分の性質**
:   位相空間 $`X`$ の点 $`x\in X`$ の既約成分を $`I`$ は, 点 $`x`$ を含む $`X`$ の既約集合のうち極大のものであり, かつ閉集合である.

<u>proof.</u>
:   $`x`$ を含む既約集合すべての合併を $`I_x`$ とおく.
    それらはすべて $`x`$ を含むので, 任意の二つの空でない相対開集合が交わるという既約性の特徴づけから $`I_x`$ は既約である.
    定義より $`x`$ を含む任意の既約集合は $`I_x`$ に含まれるから, $`I_x`$ は極大であり既約成分に等しい.
    既約集合の閉包は既約である.
    実際, 閉包内の二つの空でない開集合はそれぞれ元の既約集合と交わり, 既約性から両者も交わる.
    したがって $`\overline{I_x}`$ は $`x`$ を含む既約集合であり, 極大性から $`\overline{I_x}\subseteq I_x`$ である.
    逆の包含と合わせて $`I_x=\overline{I_x}`$ となるので, 既約成分は閉集合である.

---

## 位相不変量

位相不変量は, 同相写像で保存される空間の量または代数的対象である.
基数不変量は開集合族や被覆の大きさを測り, 代数的不変量は連続写像のホモトピー類から空間の構造を記録する.

### 基数不変量

Definition. **位相的密度**
:   位相空間 $`X`$ の稠密な部分集合の濃度のうち最小のものを, $`X`$ の **位相的密度** (*topological density*) あるいは単に **密度** (*density*) という.

Definition. **位相的指標**
:   位相空間 $`X`$ の点 $`x\in X`$ に対して, $`x`$ の近傍基の濃度のうち最小のものを, $`X`$ の点 $`x`$ における **位相的指標** (*topological character*) あるいは単に **指標** (*character*) という.
    また, $`X`$ の各点における位相的指標の上限(最小上界)を $`X`$ の位相的指標あるいは単に指標という.

Definition. **位相的荷重**
:   位相空間 $`X`$ の開基の濃度のうち最小のものを, $`X`$ の **位相的荷重** (*topological weight*) あるいは単に **荷重** (*weight*) という.

Definition. **network weight**
:   位相空間 X のネットワークとは, 任意の開集合 U と点 x∈U に対して x∈N⊆U を満たす部分集合 N を含む集合族である.
    ネットワークの濃度の最小値を nw(X) と表し, network weight と呼ぶ.

Definition. **Lindelöf 度数**
:   位相空間 X の任意の開被覆が濃度高々 κ の部分被覆を持つような基数の最小値を L(X) と表し, Lindelöf 度数 (*Lindelöf number*) と呼ぶ.
    L(X)≤ℵ₀ であることは Lindelöf 性と同値である.

Definition. **弱被覆度数**
:   位相空間 X の任意の開被覆が, 合併の閉包が X となる濃度高々 κ の部分族を持つような基数の最小値を wc(X) と表す.
    定義から wc(X)≤L(X) が成り立つ.

Definition. **cellularity**
:   位相空間 X の互いに素な非空開集合からなる族の濃度の上限を c(X) と表し, cellularity と呼ぶ.

Definition. **spread と extent**
:   位相空間 X の離散部分空間の濃度の上限を spread s(X) と呼ぶ.
    離散かつ閉じた部分空間の濃度の上限を extent e(X) と呼ぶ.
    これらは e(X)≤s(X) を満たす.

Definition. **tightness**
:   位相空間 X の tightness t(X) とは, 任意の A⊆X と x∈cl(A) に対して, |B|≤κ, B⊆A, x∈cl(B) を満たす B が存在するような基数 κ の最小値である.

Proposition. **基数不変量の基本不等式**
:   任意の位相空間 X に対して wc(X)≤d(X)≤w(X), nw(X)≤w(X), t(X)≤χ(X)≤w(X), および e(X)≤s(X) が成り立つ.
    局所コンパクト Hausdorff 空間では nw(X)=w(X) である.

<u>proof.</u>
:   開基はネットワークであり, 近傍基は閉包を検出するため t(X)≤χ(X) が従う.
    他の不等式は定義から得られる.
    局所コンパクト Hausdorff 空間では, コンパクト部分集合上のネットワークを開集合へ拡張できるため network weight と weight が一致する.

### 可算公理

Definition. **可分空間**
:   位相空間 $`X`$ が **可分** (*separable*) であるとは, $`X`$ の位相的密度が高々可算であるときいう.
    可分な位相空間を **可分空間** (*separable space*) という.

Definition. **第一可算空間**
:   位相空間 $`X`$ が **第一可算** (*first-countable*) であるとは, $`X`$ の位相的指標が高々可算であるときいう.
    第一可算な位相空間を **第一可算空間** (*first-countable space*) という.
    第一可算であるための条件を **第一可算公理** (*first axiom of countability*) という.

Definition. **第二可算空間**
:   位相空間 $`X`$ が **第二可算** (*second-countable*) であるとは, $`X`$ の位相的荷重が高々可算であるときいう.
    第二可算な位相空間を **第二可算空間** (*second-countable space*) という.
    第二可算であるための条件を **第二可算公理** (*second axiom of countability*) という.

Proposition.
:   第二可算空間は可分である.

<u>proof.</u>
:   $`X`$ の可算な開基を $`\mathcal{B}`$ とする.
    空集合でない各 $`B\in\mathcal{B}`$ から一点 $`x_B\in B`$ を選び, これらの点全体を $`D`$ とする.
    $`\mathcal{B}`$ は可算であるから $`D`$ も可算である.
    空でない開集合 $`U\subseteq X`$ をとると, 開基の性質により $`B\in\mathcal{B}`$ で $`\emptyset\neq B\subseteq U`$ を満たすものが存在する.
    このとき $`x_B\in D\cap U`$ である.
    よって $`D`$ は稠密であり, $`X`$ は可分である.

### 代数的不変量

Definition. **ホモトピー群**
:   点付き位相空間 (X,x₀) と整数 n≥1 に対して, n 次元球面 Sⁿ から X への基点を保つ写像のホモトピー類全体を πₙ(X,x₀) と表し, n 次ホモトピー群 (*homotopy group*) と呼ぶ.
    n=1 の場合を基本群 π₁(X,x₀) と呼ぶ.

Definition. **特異ホモロジー群**
:   位相空間 X と可換群 G に対して, n 次特異鎖群 Cₙ(X;G) を n 単体から X への連続写像を生成元とする自由 G 加群とし, 境界写像 ∂ₙ を面の交代和で定める.
    n 次特異ホモロジー群 (*singular homology group*) を Hₙ(X;G)=ker ∂ₙ / im ∂ₙ₊₁ と定める.

Definition. **特異コホモロジー群**
:   特異鎖複体に対して n 次コチェイン群を Cⁿ(X;G)=Hom(Cₙ(X;ℤ),G) とし, 境界写像の双対からコ境界写像 δⁿ を定める.
    n 次特異コホモロジー群 (*singular cohomology group*) を Hⁿ(X;G)=ker δⁿ / im δⁿ⁻¹ と定める.

Theorem. **代数的不変量の同相不変性**
:   同相写像 f:X→Y は, 任意の基点と係数群に対して基本群, ホモトピー群, ホモロジー群, コホモロジー群の同型を誘導する.
    基点を変える場合, これらの同型は基点を結ぶ道の選択に依存しうるが, 道で結ばれた基点では非標準的な同型が存在する.

<u>proof.</u>
:   f と f⁻¹ の合成は恒等写像であり, それぞれが誘導するホモトピー類, 鎖写像, コ鎖写像の合成も恒等写像に一致する.
    したがって各誘導写像は逆写像を持ち, 対応する群の同型となる.

---

## 被覆と次元

開被覆は局所的な情報を空間全体へ配置するための道具であり, 細分はその情報をより細かくする操作である.
局所有限性と被覆の操作を整備して, コンパクト性, パラコンパクト性, 次元論で用いる被覆の制御を記述する.

### 局所有限性

Definition. **局所有限性**
:   位相空間 $`X`$ の部分集合族 $`\sigma`$ が **局所有限** (*locally finite*) であるとは, 任意の点 $`x\in X`$ に対して, $`x\in G`$ であって集合族 $`\{S\in\sigma\mid S\cap G\neq\emptyset\}`$ が有限集合となるような開集合 $`G`$ が存在するときいう.

Definition. **星有限性**
:   位相空間 $`X`$ の部分集合族 $`\sigma`$ が **星有限** (*star finite*) であるとは, 任意の $`A\in\sigma`$ に対して集合族 $`\{S\in\sigma\mid S\cap A\neq\emptyset\}`$ が有限集合となるときいう.

Proposition.
:   位相空間 $`X,Y`$ と $`Y`$ の部分集合族 $`\sigma`$ と連続写像 $`f:X\to Y`$ に対して, $`\sigma`$ が局所有限なら $`\{f^{-1}(S)\mid S\in\sigma\}`$ もまた局所有限となる.

<u>proof.</u>
:   $`x\in X`$ をとる.
    $`\sigma`$ の局所有限性から, $`f(x)`$ の開近傍 $`V`$ であって $`V`$ と交わる $`\sigma`$ の元が有限個しかないものが存在する.
    連続性により $`f^{-1}(V)`$ は $`x`$ の開近傍である.
    $`f^{-1}(V)`$ が $`f^{-1}(S)`$ と交わるならば $`V\cap S\neq\emptyset`$ である.
    よって $`f^{-1}(V)`$ と交わる逆像は有限個しかない.
    $`x`$ は任意であるから, 逆像の族は局所有限である.

Proposition.
:   位相空間 $`X`$ の部分集合族 $`\sigma`$ が局所有限であれば, $`\overline{\sigma}\coloneqq\{\overline{S}\mid S\in\sigma\}`$ もまた局所有限となり, $`\bigcup\overline{\sigma}\subseteq\overline{\bigcup\sigma}`$ が成り立つ.

<u>proof.</u>
:   $`x\in X`$ をとり, $`\sigma`$ と交わる元が有限個しかない $`x`$ の開近傍 $`G`$ をとる.
    $`G\cap\overline{S}\neq\emptyset`$ ならば, $`G`$ が開であることから $`G\cap S\neq\emptyset`$ である.
    したがって $`G`$ と交わる $`\overline{\sigma}`$ の元も有限個しかない.
    よって $`\overline{\sigma}`$ は局所有限である.

    各 $`S\in\sigma`$ は $`\bigcup\sigma`$ の部分集合であるから, 閉包の単調性により $`\overline{S}\subseteq\overline{\bigcup\sigma}`$ である.
    $`S`$ について合併をとれば $`\bigcup\overline{\sigma}\subseteq\overline{\bigcup\sigma}`$ を得る.

Definition. **位数**
:   集合 $`X`$ の部分集合族 $`\sigma`$ に対して, $`\sigma`$ の **点 $`x\in X`$ における位数** (*order of a point $`x\in X`$*) を集合族 $`\{S\in\sigma\mid x\in S\}`$ の濃度とし, $`\operatorname{ord}_x\sigma`$ と表す.
    また, $`\sigma`$ の**位数** (*order*) を各点での位数の上限とし, $`\operatorname{ord}\sigma`$ と表す.
    特に, 各点での位数が高々可算であるとき $`\sigma`$ は**点可算** (*pointwise countable*) といい, 各点での位数が有限であるとき $`\sigma`$ は**点有限** (*pointwise finite*) という.

### 被覆

Definition. **被覆**
:   **集合 $`X`$ の被覆** (*covering of a set $`X`$*) とは, $`X`$ の部分集合族 $`\mathbf{C}`$ であって $`X=\bigcup\mathbf{C}`$ を満たすときいう.
    また, 基数 $`\kappa`$ に対して濃度が高々 $`\kappa`$ となる被覆を **$`\kappa`$-被覆** ($`\kappa`$-covering) といい, 特に $`\aleph_0`$-被覆を **可算被覆** (*countable covering*) といい, 有限基数 $`\kappa`$ による $`\kappa`$-被覆を **有限被覆** (*finite covering*) という.

特に, 位相空間 $`X`$ の **開被覆** (*open covering*) とは, $`X`$ の開集合からなる $`X`$ の被覆のこととする. 他方, 位相空間 $`X`$ の **閉被覆** (*closed covering*) とは, $`X`$ の閉集合からなる $`X`$ の被覆のこととする.

集合 $`X`$ の被覆 $`\mathbf{C}_1,\mathbf{C}_2`$ が $`\mathbf{C}_1\subseteq\mathbf{C}_2`$ を満たすとき, $`\mathbf{C}_1`$ を $`\mathbf{C}_2`$ の **部分被覆** (*subcovering*) という.

### 細分関係

集合 $`X`$ に対して, 包含関係による半順序集合 $`(2^X,\subseteq)`$ による細分関係を $`\leq`$ とすると次が成り立つ:
```math
\mathbf{G}\leq\mathbf{H}\iff\forall G\in\mathbf{G},\exists H\in\mathbf{H}\text{ s.t. }G\subseteq H
```
この細分関係により, $`X`$ の被覆全体は完備束となる. すなわち, 被覆の列 $`(\mathbf{C}_\lambda\mid\lambda\in\Lambda)`$ に対して, 結びと交わり
```math
\bigvee_{\lambda\in\Lambda}\mathbf{C}_\lambda=\left\{\bigcup_{\lambda\in\Lambda}U_\lambda\mathrel{}\middle|\mathrel{}U_\lambda\in\mathbf{C}_\lambda,\lambda\in\Lambda\right\}
,\quad
\bigwedge_{\lambda\in\Lambda}\mathbf{C}_\lambda=\left\{\bigcap_{\lambda\in\Lambda}U_\lambda\mathrel{}\middle|\mathrel{}U_\lambda\in\mathbf{C}_\lambda,\lambda\in\Lambda\right\}
```
はそれぞれ $`X`$ の被覆となる.

Definition. **星型集合**
:   集合 $`X`$ の被覆 $`\mathbf{U}`$ と部分集合 $`A\subseteq X`$ に対して, 
    ```math
    \mathbf{U}(A)\coloneqq\bigcup\{U\in\mathbf{U}\mid U\cap A\neq\emptyset\}
    ```
    を **$`\mathbf{U}`$ における $`A`$ の星** (*star of a set $`A`$ in a cover $`\mathbf{U}`$*) という.
    特に, $`A`$ が 1 点 $`x\in X`$ のみからなる集合のときは, $`\mathbf{U}(x)`$ と表す.
    また正整数 $`n`$ に対して,
    ```math
    \mathbf{U}^n\coloneqq\left\{\bigcup_{i=1}^{n}U_i\mathrel{}\middle|\mathrel{}U_i\in\mathbf{U},U_i\cap U_{i+1}\neq\emptyset\right\},\quad \mathbf{U}^0=2^X
    ```
    とする.

Proposition.
:   集合 $`X`$ の被覆 $`\mathbf{U},\mathbf{V}`$ と 正整数 $`m,n`$ に対して, $`\mathbf{U}^{mn}=(\mathbf{U}^m)^n`$.

<u>proof.</u>
:   左辺の元は, 隣り合うものが交わる $`mn`$ 個の $`\mathbf U`$ の元の合併である.
    これらを連続する $`m`$ 個ずつの $`n`$ 個のブロックに分けると, 各ブロックは $`\mathbf U^m`$ の元であり, 隣り合うブロックも交わる.
    したがって左辺は $`(\mathbf U^m)^n`$ に含まれる.
    逆に $`(\mathbf U^m)^n`$ の鎖を各ブロックの $`m`$ 個の鎖へ展開すれば, 隣り合うものが交わる $`mn`$ 個の $`\mathbf U`$ の元の鎖を得る.
    よって両者は一致する.

Proposition.
:   集合 $`X`$ の被覆 $`\mathbf{U}`$ と $`A\in2^X`$ に対して $`\mathbf{U}(A)=\bigcup_{a\in A}\mathbf{U}(a)`$.

<u>proof.</u>
:   $`x\in\mathbf U(A)`$ であることは, $`x\in U`$ かつ $`U\cap A\neq\emptyset`$ となる $`U\in\mathbf U`$ が存在することと同値である.
    後者はある $`a\in A`$ が $`a\in U`$ を満たすことと同値であり, これは $`x\in\mathbf U(a)`$ を意味する.
    したがって $`x\in\bigcup_{a\in A}\mathbf U(a)`$ と同値であり, 求める等式が従う.

Proposition.
:   集合 $`X`$ の被覆 $`\mathbf{U},\mathbf{V}`$ と $`A,B\in2^X`$ が $`\mathbf{U}\leq\mathbf{V}`$ かつ $`A\subseteq B`$ ならば $`\mathbf{U}(A)\subseteq\mathbf{V}(B)`$.

<u>proof.</u>
:   $`x\in\mathbf U(A)`$ とする.
    ある $`U\in\mathbf U`$ と $`a\in A\cap U`$ が存在して $`x\in U`$ である.
    細分の仮定から $`U\subseteq V`$ となる $`V\in\mathbf V`$ をとれる.
    $`a\in A\subseteq B`$ なので $`V\cap B\neq\emptyset`$ であり, $`x\in V\subseteq\mathbf V(B)`$ である.

Proposition.
:   集合 $`X`$ の被覆 $`\mathbf{U},\mathbf{V}`$ と $`x,y\in X`$ に対して, $`x\in\mathbf{U}(y)\iff y\in\mathbf{U}(x)`$.

<u>proof.</u>
:   $`x\in\mathbf U(y)`$ は $`x,y\in U`$ を満たす $`U\in\mathbf U`$ が存在することと同値である.
    この条件は $`x,y`$ に関して対称であるから, $`y\in\mathbf U(x)`$ と同値である.

Proposition.
:   集合 $`X`$ の被覆 $`\mathbf{U},\mathbf{V}`$ と $`A,B\in2^X`$ に対して次がそれぞれ成り立つ.
    1. 正整数 $`m`$ に対して, $`A\cap\mathbf{U}^m(B)\neq\emptyset\iff\mathbf{U}^m(A)\cap B\neq\emptyset`$.
    2. 正整数 $`m,n`$ に対して, $`\mathbf{U}^{m+n}(A)=\mathbf{U}^m(\mathbf{U}^n(A))`$.

<u>proof.</u>
:   (1) は, $`\mathbf{U}`$ の元の鎖を逆順にしても隣接する集合の交わりが保たれることから従う.
    実際, $`A`$ の点と $`B`$ の点を結ぶ長さ $`m`$ の鎖があることは, 同じ鎖を逆向きに読んで $`B`$ の点と $`A`$ の点を結ぶことと同値である.
    (2) の左辺の鎖を最初の $`n`$ 個と残りの $`m`$ 個に分けると, 中間の星を経由して右辺の元となる.
    逆に右辺の二つの鎖を接続すれば長さ $`m+n`$ の鎖となる.

Definition. **重心細分と星型細分**
:   集合 $`X`$ の被覆 $`\mathbf{U},\mathbf{V}`$ に対して,
    ```math
    \mathbf{U}^\varDelta\coloneqq\{\mathbf{U}(x)\mid x\in X\},\quad
    \mathbf{U}^\ast\coloneqq\{\mathbf{U}(U)\mid U\in\mathbf{U}\}
    ```
    とし, $`\leq`$ を被覆同士の細分関係として
    ```math
    \mathbf{U}\leq^\varDelta\mathbf{V}\mathrel{\overset{\text{def}}{\iff}}\mathbf{U}^\varDelta\leq\mathbf{V},\quad
    \mathbf{U}\leq^\ast\mathbf{V}\mathrel{\overset{\text{def}}{\iff}}\mathbf{U}^\ast\leq\mathbf{V}
    ```
    とする. このとき, $`\leq^\varDelta`$ を **重心細分** (*barycentric refinement*) といい, $`\leq^\ast`$ を **星細分** (*star refinement*) という.

Proposition.
:   集合 $`X`$ の被覆 $`\mathbf{U}`$ と $`A\in2^X`$ に対して, $`\mathbf{U}^2(A)=\mathbf{U}^\varDelta(A)`$ かつ $`\mathbf{U}^3(A)=\mathbf{U}^\ast(A)`$ が成り立つ.

<u>proof.</u>
:   $`x\in\mathbf U(A)`$ であることは, $`A`$ と交わる $`U\in\mathbf U`$ が $`x`$ を含むことと同値である.
    したがって二段の鎖は, ある点 $`x`$ を中心とする $`\mathbf U(x)`$ に入ることと同値であり, 前半の等式を得る.
    同様に三段の鎖は, $`A`$ と交わる一つの $`U\in\mathbf U`$ の星 $`\mathbf U(U)`$ に入ることと同値である.
    これは後半の等式である.

Proposition.
:   集合 $`X`$ の被覆 $`\mathbf{U}`$ に対して, $`\mathbf{U}\leq\mathbf{U}^\varDelta\leq\mathbf{U}^\ast\leq(\mathbf{U}^\varDelta)^\varDelta=\{\mathbf{U}^2(x)\mid x\in X\}`$ が成り立つ.

<u>proof.</u>
:   $`x\in U`$ ならば $`U\subseteq\mathbf U(x)`$ であるから, 最初の細分関係が従う.
    また $`\mathbf U(x)`$ は $`x`$ を含む任意の $`U`$ の星に含まれるので, 第二の関係が従う.
    最後の関係と等式は, 前の命題を $`A=\{x\}`$ に適用して得られる.

Proposition.
:   位相空間 $`X`$ の開被覆 $`\mathbf{U}`$ と部分集合 $`A\in2^X`$ に対して, $`\overline{A}\subseteq\mathbf{U}(A)`$ となる.

<u>proof.</u>
:   $`x\in\overline A`$ をとる.
    被覆性から $`x\in U`$ となる $`U\in\mathbf U`$ がある.
    $`U`$ は開集合で $`x`$ の近傍であるから, $`x\in\overline A`$ より $`U\cap A\neq\emptyset`$ である.
    よって $`U`$ は $`\mathbf U(A)`$ の合併に現れ, $`x\in U\subseteq\mathbf U(A)`$ を得る.

### 帰納次元と被覆次元

位相次元は, 空間を小さい開集合で覆ったときに, それらの重なりをどこまで減らせるかを測る不変量である.
小さい帰納次元と大きな帰納次元は境界の次元を再帰的に測り, Lebesgue 被覆次元は開被覆の重なりの次数を測る.
一般の位相空間ではこれらは一致しないことがあるため, 各定理では分離性と可算性の仮定を明記する.

以下, 空集合の次元を $`-1`$ とし, $`n`$ は $`0`$ 以上の整数とする.
部分集合 $`V\subseteq X`$ の境界を
```math
\partial V\coloneqq\overline V\setminus V^\circ
```
と表す.

Definition. **被覆の次数**
:   集合 $`X`$ の被覆 $`\mathcal U`$ が **次数高々 $`n`$** (*of order at most $`n`$*) であるとは, 任意の相異なる $`n+2`$ 個の元 $`U_0,\ldots,U_{n+1}\in\mathcal U`$ に対して
    ```math
    U_0\cap\cdots\cap U_{n+1}=\emptyset
    ```
    が成り立つことをいう.
    これは各点が高々 $`n+1`$ 個の被覆要素に属することと同値である.

Definition. **Lebesgue 被覆次元**
:   位相空間 $`X`$ が **Lebesgue 被覆次元高々 $`n`$** (*of Lebesgue covering dimension at most $`n`$*) であるとは, 任意の有限開被覆が次数高々 $`n`$ の有限開細分をもつときにいう.
    この条件を満たす最小の $`n`$ を $`\dim X`$ と表し, そのような $`n`$ がなければ $`\dim X=\infty`$ と表す.

次数高々 $`0`$ の被覆の相異なる要素は互いに交わらない.
したがって $`\dim X=0`$ は, 任意の有限開被覆を有限な互いに素な開被覆へ細分できることを意味する.

Definition. **小さい帰納次元**
:   正則 $`\mathbf T_1`$ 空間 $`X`$ に対して, **小さい帰納次元高々 $`n`$** (*small inductive dimension at most $`n`$*) を次で帰納的に定める.
    - $`\operatorname{ind}X\leq-1`$ であることは $`X=\emptyset`$ を意味する.
    - $`n\geq0`$ のとき, $`\operatorname{ind}X\leq n`$ であることは, 任意の $`x\in X`$ と任意の $`x`$ の開近傍 $`U`$ に対して
        ```math
        x\in V\subseteq\overline V\subseteq U,
        \qquad \operatorname{ind}\partial V\leq n-1
        ```
        を満たす開集合 $`V`$ が存在することをいう.

    この条件を満たす最小の $`n`$ を $`\operatorname{ind}X`$ と表す.
    小さい帰納次元は, 一点の近傍をより小さな近傍で囲む際に現れる境界の次元を測る.

Definition. **大きな帰納次元**
:   正規 $`\mathbf T_1`$ 空間 $`X`$ に対して, **大きな帰納次元高々 $`n`$** (*large inductive dimension at most $`n`$*) を次で帰納的に定める.
    - $`\operatorname{Ind}X\leq-1`$ であることは $`X=\emptyset`$ を意味する.
    - $`n\geq0`$ のとき, $`\operatorname{Ind}X\leq n`$ であることは, 任意の閉集合 $`F\subseteq X`$ とそれを含む開集合 $`U`$ に対して
        ```math
        F\subseteq V\subseteq\overline V\subseteq U,
        \qquad \operatorname{Ind}\partial V\leq n-1
        ```
        を満たす開集合 $`V`$ が存在することをいう.

    この条件を満たす最小の $`n`$ を $`\operatorname{Ind}X`$ と表す.
    小さい帰納次元では一点を分離するのに対し, 大きな帰納次元では閉集合全体を分離する.

Proposition. **次元の同相不変性**
:   $`h:X\to Y`$ が同相写像ならば, Lebesgue 被覆次元が定義される任意の $`X,Y`$ について
    ```math
    \dim X=\dim Y
    ```
    が成り立つ.
    さらに $`X,Y`$ が正則 $`\mathbf T_1`$ 空間なら $`\operatorname{ind}X=\operatorname{ind}Y`$ であり, 正規 $`\mathbf T_1`$ 空間なら $`\operatorname{Ind}X=\operatorname{Ind}Y`$ である.

<u>proof.</u>
:   $`Y`$ の有限開被覆を $`h^{-1}`$ で引き戻すと, $`X`$ の有限開被覆を得る.
    $`X`$ で次数高々 $`n`$ の有限開細分を取り, それを $`h`$ で移せば, 元の被覆の次数高々 $`n`$ の有限開細分となる.
    $`h^{-1}`$ に同じ議論を適用すると $`\dim X=\dim Y`$ が従う.

    同相写像は開集合, 閉集合, 閉包, 内部を保つので, $`h(\partial V)=\partial h(V)`$ が成り立つ.
    小さい帰納次元と大きな帰納次元の帰納的定義にこの対応を適用し, $`n`$ に関する帰納法を行えば, 残りの二つの等式が得られる.

Theorem. **零次元空間の特徴づけ**
:   可分距離化可能空間 $`X`$ について, 次は同値である.
    1. $`\dim X=0`$.
    2. $`X`$ は開かつ閉である集合からなる基をもつ.
    3. $`\operatorname{ind}X=0`$.
    4. $`\operatorname{Ind}X=0`$.

<u>proof.</u>
:   可分距離化可能空間に対する次元一致定理から, (1), (3), (4) は同値である.
    可閉基をもつことと $`\operatorname{ind}X=0`$ との同値性は, 可算な基を用いて境界を順に除く構成により示される.[1](#reference-1), [2](#reference-2)

Theorem. **帰納次元と被覆次元の一致定理**
:   可分距離化可能空間 $`X`$ について,
    ```math
    \operatorname{ind}X=\dim X=\operatorname{Ind}X
    ```
    が成り立つ.

<u>proof.</u>
:   この定理の証明は, 可算な局所有限開被覆を用いて被覆の次数を制御する構成と, 境界の次元についての帰納法を組み合わせる.
    被覆次元から帰納次元への不等式では, 被覆の細分を選んで一点または閉集合の近傍の境界を低次元にする.
    逆向きの不等式では, 境界の次元を一段ずつ下げる近傍を可算な基に沿って選び, それらから低い次数の開細分を構成する.
    詳細は[1](#reference-1)および[2](#reference-2)を参照されたい.[^dimension-scope]

Theorem. **Euclid 空間と基本的な多様体の次元**
:   $`n\geq0`$ に対して,
    ```math
    \dim\mathbb R^n
    =\dim[0,1]^n
    =\dim S^n
    =n
    ```
    が成り立つ.
    したがって可分距離化可能であるこれらの空間では, 二つの帰納次元も $`n`$ に等しい.

<u>proof.</u>
:   上からの不等式は, 格子による小立方体の開被覆を十分に細かく取り, 重なりの次数を $`n`$ 以下に制御して得る.
    下からの不等式には, $`n`$ 次元立方体の対向する面を同時に低次元の細分で分離できないことを用いる.
    この障害は Brouwer の不動点定理またはその同値な被覆定理から導かれる.
    $`S^n`$ については半球による分解と局所座標を用いる.[1](#reference-1), [2](#reference-2)

Theorem. **部分空間, 閉和, 積に対する次元不等式**
:   $`X,Y`$ を可分距離化可能空間とする.
    次が成り立つ.
    1. 部分空間 $`A\subseteq X`$ に対して, $`\dim A\leq\dim X`$.
    2. 閉部分空間 $`A,B\subseteq X`$ が $`X=A\cup B`$ を満たすならば,
        ```math
        \dim X\leq\max\{\dim A,\dim B\}.
        ```
    3. $`\dim X,\dim Y<\infty`$ ならば,
        ```math
        \dim(X\times Y)\leq\dim X+\dim Y.
        ```

<u>proof.</u>
:   (1) では, 距離空間の被覆次元に対する制限補題を用いる.
    この補題は, $`A`$ の有限開被覆を X の開集合へ持ち上げ, 距離関数 $`d(x,A)`$ のレベル集合で境界を調整してから, X の低次数細分を A に制限できることを述べる.
    補題を $`\dim X\leq n`$ に適用すると, A の任意の有限開被覆が次数高々 $`n`$ の有限開細分を持つため, $`\dim A\leq\dim X`$ を得る.
    (2) では $`A`$ と $`B`$ 上で低い次数の細分を構成し, 正規性によりそれらを近傍へ拡張して貼り合わせる.
    (3) では $`X`$ と $`Y`$ の細分を直積して得られる被覆をさらに細分し, 重なりの次数を二つの次元の和で抑える.
    各構成で用いる局所有限細分の詳細は[1](#reference-1)および[2](#reference-2)を参照されたい.[^dimension-scope]

Corollary. **Euclid 空間の直積**
:   $`m,n\geq0`$ に対して,
    ```math
    \dim(\mathbb R^m\times\mathbb R^n)=m+n
    ```
    が成り立つ.

<u>proof.</u>
:   標準的な同相写像 $`\mathbb R^m\times\mathbb R^n\cong\mathbb R^{m+n}`$ と次元の同相不変性から従う.

#### 有限次元空間の埋込み

Remark. **ネーベリング＝ポントリャーギンの定理**
:   可分距離化可能空間 $`X`$ について, $`\dim X<\infty`$ であることと, ある $`m\geq0`$ および同相埋込み $`X\to\mathbb R^m`$ が存在することは同値である.[^nobeling-pontryagin]
    順方向は次の埋込み定理を用い, 逆方向は Euclid 空間の被覆次元と部分空間への遺伝性を用いる.

Remark. **メンガー＝ネーベリングの定理（1932）**
:   コンパクト距離空間 $`X`$ が $`\dim X\leq n`$ を満たすならば, 同相埋込み
    ```math
    X\longrightarrow\mathbb R^{2n+1}
    ```
    が存在する.[^menger-nobeling]
    標準的な証明は $`C(X,\mathbb R^{2n+1})`$ の一様ノルム位相で埋込みを与える写像が稠密な $`G_\delta`$ 部分集合をなすことを示す.
    次数を制御した開細分で座標写像を摂動し, Baire のカテゴリー定理で同時に単射となる写像を選ぶ.

#### 立方体の被覆と色つき被覆

Remark. **ルベーグ被覆定理**
:   $`I^n=[0,1]^n`$ の有限閉被覆 $`D_1,\ldots,D_r`$ をとる.
    どの $`D_j`$ も, いずれの座標方向についても相対する二つの面 $`\{x\mid x_i=0\}`$ と $`\{x\mid x_i=1\}`$ の両方と交わらないと仮定する.
    このとき相異なる $`n+1`$ 個の添字 $`j_0,\ldots,j_n`$ が存在して
    ```math
    D_{j_0}\cap\cdots\cap D_{j_n}\neq\emptyset
    ```
    となる.[^lebesgue-covering]
    文献の証明は被覆を十分に細かい格子の立方体的被覆へ移し, fusion construction による組合せ的交叉定理を適用してから, 格子幅を極限へ送る.

Definition. **離散な開族**
:   位相空間 $`X`$ の部分集合族 $`\mathcal V`$ が **離散な開族** (*discrete open family*) であるとは, 各元が開集合であり, 任意の $`x\in X`$ が高々一つの $`V\in\mathcal V`$ と交わる開近傍をもつことをいう.

Remark. **色つき次元に関するオストランドの定理**
:   距離化可能空間 $`X`$ と $`n\geq0`$ について, $`\dim X\leq n`$ であることは次と同値である.[^ostrand]
    任意の局所有限開被覆 $`\mathcal U`$ に対し, 離散な開族の列 $`\mathcal V_1,\mathcal V_2,\ldots`$ を選べて, 各 $`\mathcal V_i`$ が $`\mathcal U`$ を細分し, 任意の相異なる $`n+1`$ 個の添字 $`i_1,\ldots,i_{n+1}`$ に対して $`\mathcal V_{i_1}\cup\cdots\cup\mathcal V_{i_{n+1}}`$ が $`X`$ を覆うことである.
    添字を色とみなせば, 任意の $`n+1`$ 色だけで被覆になるように, 被覆を互いに交わらない色の族へ分けられることを表す.
    順方向の証明は局所有限細分を縮小して色ごとの離散な開族を帰納的に構成し, 逆方向は一組の $`n+1`$ 色を選んで次数高々 $`n`$ の細分を得る.[^ostrand]

[^dimension-scope]: 定理の陳述は標準的な可分距離化可能空間の場合に限った. より一般の正規空間または距離化可能空間では, 三つの次元の間に別の不等式や一致定理が現れる.
[^nobeling-pontryagin]: R. Engelking, *Theory of Dimensions, Finite and Infinite*, Heldermann Verlag, 1995, 定理 1.11.4 と歴史的注記. 一般次元の場合の埋込み定理を Nöbeling, Pontryagin-Tolstowa, Lefschetz が 1931 年に証明したことが記録されている.
[^menger-nobeling]: G. Nöbeling, "Über eine n-dimensionale Universalmenge im $`\mathbb R^{2n+1}`$", *Mathematische Annalen* 104 (1931), 71--80. 1932 年刊の K. Menger, *Kurventheorie* はこの結果を含む古典的文献である.
[^lebesgue-covering]: N. V. Ivanov, "Cubes and cubical chains and cochains", 2019, Lebesgue first covering theorem.
[^ostrand]: P. A. Ostrand, "Dimension of metric spaces and Hilbert's problem 13", *Bulletin of the American Mathematical Society* 71 (1965), 619--622, DOI: 10.1090/S0002-9904-1965-11363-5.

---

## コンパクト性

コンパクト性は, 任意の開被覆から有限個だけを選んでも空間を覆えるという有限性の条件である.
この条件は連続写像, フィルター, 点列, 関数空間における収束を結び付けるため, その変種と保存性を比較する.

### コンパクト空間

Definition. **コンパクト空間**
:   位相空間 $`X`$ が **コンパクト性を持つ** (*compactness*) とは, $`X`$ の任意の開被覆が有限な部分被覆を持つときいう. コンパクト性を持つ位相空間を **コンパクト空間** (*compact space*) という.

Theorem. **コンパクト性と同値な命題**
:   位相空間 $`X`$ に対して以下同値.
    1. $`X`$ はコンパクト空間である.
    2. $`X`$ の有限交叉性をもつ部分集合族 $`\mathbf{F}`$ に対して $`\bigcap_{F\in\mathbf{F}}\overline{F}\neq\emptyset`$ となる.
    3. $`X`$ 上の任意のフィルターは堆積点を持つ. すなわち, フィルター $`\mathbf{F}`$ に対して $`\bigcap_{F\in\mathbf{F}}\overline{F}\neq\emptyset`$ となる.
    4. $`X`$ 上の任意のフィルターは収束する細分を持つ.
    5. $`X`$ 上の任意の極大フィルターは収束する.

<u>proof.</u>
:   $`(1)\Rightarrow(2)`$ を示す.
    有限交叉性を持つ族 $`\mathbf F`$ に対して $`\bigcap_{F\in\mathbf F}\overline F=\emptyset`$ と仮定すると, $`\{X\setminus\overline F\mid F\in\mathbf F\}`$ は開被覆である.
    有限部分被覆をとると, 対応する有限個の $`F`$ の交叉は空となり, 有限交叉性に矛盾する.

    $`(2)\Rightarrow(3)`$ は, フィルターに属する集合族が有限交叉性を持つことから従う.
    実際, 得られる点はフィルターのすべての元の閉包に属するので堆積点である.
    $`(3)\Rightarrow(4)`$ では, フィルター $`\mathcal F`$ の堆積点を $`x`$ とする.
    $`\mathcal F\cap\mathcal N(x)`$ は真のフィルターであり, $`\mathcal F`$ を細分して $`x`$ に収束する.
    $`(4)\Rightarrow(5)`$ は直ちに従う.

    最後に $`(5)\Rightarrow(1)`$ を示す.
    有限部分被覆を持たない開被覆 $`\mathcal U`$ があると仮定する.
    閉集合族 $`\{X\setminus U\mid U\in\mathcal U\}`$ は有限交叉性を持つので, それを含む極大フィルター $`\mathcal M`$ が存在する.
    仮定から $`\mathcal M`$ はある $`x\in X`$ に収束する.
    ある $`U\in\mathcal U`$ が $`x`$ を含むが, $`U`$ は収束フィルターに属する一方で $`X\setminus U`$ も $`\mathcal M`$ に属する.
    これは空集合が $`\mathcal M`$ に属することを意味し矛盾する.
    よってすべての開被覆は有限部分被覆を持つ.

Proposition. **コンパクト性の連続全射像による保存**
:   コンパクト空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ もコンパクト空間となる.

<u>proof.</u>
:   $`Y`$ の開被覆 $`\mathcal{V}`$ をとる.
    連続性により, $`\{f^{-1}(V)\mid V\in\mathcal{V}\}`$ は $`X`$ の開集合族である.
    $`f`$ が全射であるから, この族は $`X`$ を被覆する.
    $`X`$ のコンパクト性により, $`V_1,\ldots,V_n\in\mathcal{V}`$ が存在して
    ```math
    X=f^{-1}(V_1)\cup\cdots\cup f^{-1}(V_n)
    ```
    となる.
    全射性から $`Y=V_1\cup\cdots\cup V_n`$ である.
    よって $`\mathcal{V}`$ は有限部分被覆を持つ.

Proposition. **コンパクト性の閉部分空間への遺伝**
:   コンパクト空間 $`X`$ の閉部分空間 $`F`$ もコンパクト空間となる.

<u>proof.</u>
:   $`F`$ の開被覆 $`\mathcal{U}`$ をとる.
    各 $`U\in\mathcal{U}`$ を $`X`$ の開集合として選ぶと, $`\mathcal{U}\cup\{X\setminus F\}`$ は $`X`$ の開被覆となる.
    $`X`$ のコンパクト性から有限部分被覆が存在する.
    そこから $`X\setminus F`$ を除けば, 残る有限個の集合は $`F`$ を被覆する.
    よって $`F`$ はコンパクトである.

Proposition. **Hausdorff 空間のコンパクト部分集合**
:   Hausdorff 空間のコンパクトな部分集合は閉集合となる.

<u>proof.</u>
:   Hausdorff 空間 $`X`$ のコンパクト部分集合 $`K`$ と $`x\in X\setminus K`$ をとる.
    各 $`y\in K`$ に対して, $`x\in U_y`$, $`y\in V_y`$, $`U_y\cap V_y=\emptyset`$ を満たす開集合 $`U_y,V_y`$ が存在する.
    $`\{V_y\mid y\in K\}`$ は $`K`$ の開被覆であるから, ある $`y_1,\ldots,y_n\in K`$ に対して $`K\subseteq V_{y_1}\cup\cdots\cup V_{y_n}`$ となる.
    $`U=U_{y_1}\cap\cdots\cap U_{y_n}`$ とおくと, $`U`$ は $`x`$ の開近傍である.
    さらに $`U\cap K=\emptyset`$ であるから $`U\subseteq X\setminus K`$ である.
    よって $`X\setminus K`$ は開集合であり, $`K`$ は閉集合である.

Theorem. **Heine–Borel の被覆定理の類似**
:   コンパクト距離空間 $`K`$ 上の連続複素数値写像の集合 $`S\subseteq C(K,\mathbb{C})`$ に対して, $`S`$ が一様ノルムによりコンパクトであることと, $`S`$ が閉集合かつ各点ごとに有界かつ同程度連続であることは同値である.

<u>proof.</u>
:   $`S`$ が一様ノルムでコンパクトなら, 評価写像 $`f\mapsto f(x)`$ の連続性から各点有界であり, 有限個の一様ノルム球で被覆することで同程度連続性も従う.
    逆に $`S`$ が各点有界かつ同程度連続であるとする.
    任意の $`\varepsilon>0`$ に対し, 同程度連続性と $`K`$ のコンパクト性から有限集合 $`E\subseteq K`$ を選び, 各 $`x\in K`$ がある $`e\in E`$ に対して $`|f(x)-f(e)|<\varepsilon/3`$ をすべての $`f\in S`$ について満たすようにできる.
    評価値の集合 $`\{(f(e))_{e\in E}\mid f\in S\}`$ は有限次元空間で有界なので全有界である.
    その有限 $`\varepsilon/3`$-近似を上の不等式と合わせると, $`S`$ は一様ノルムで全有界となる.
    $`C(K,\mathbb C)`$ は一様ノルムで完備であり, $`S`$ は閉集合だから完備でもある.
    よって $`S`$ はコンパクトである.

Theorem. **Dini の定理**
:   コンパクト空間 $`X`$ に対して, 連続写像の列 $`(f_n:X\to\mathbb{R})_{n=1,2,\ldots}`$ が
    1. $`(f_n)`$ はある連続写像 $`f:X\to\mathbb{R}`$ に各点収束する.
    2. $`(f_n)`$ は単調増加列である. (i.e. $`f_n(x)\leq f_{n+1}(x),x\in X,n=1,2,\ldots`$)

    を満たすとき, $`(f_n)`$ は $`f`$ に一様収束する.

<u>proof.</u>
:   各 $`x\in X`$ で $`f_n(x)\uparrow f(x)`$ であるから, $`f-f_n\geq0`$ である.
    $`\varepsilon>0`$ に対し
    ```math
    U_n\coloneqq\{x\in X\mid f(x)-f_n(x)<\varepsilon\}
    ```
    とおく.
    各 $`U_n`$ は開集合であり, 点ごとの収束から $`(U_n)_{n\geq1}`$ は $`X`$ の開被覆となる.
    単調性より $`U_n\subseteq U_{n+1}`$ である.
    コンパクト性から有限部分被覆が存在し, その添字の最大値を $`N`$ とすれば $`U_N=X`$ となる.
    よって任意の $`x\in X`$ に対して $`0\leq f(x)-f_N(x)<\varepsilon`$ であり, 単調性からすべての $`n\geq N`$ について同じ不等式が成り立つ.
    したがって $`f_n`$ は $`f`$ に一様収束する.

Theorem. **Tychonoff の定理**
:   すべて空でない位相空間の列 $`(X_\lambda\mid\lambda\in\Lambda)`$ に対して, 以下同値.
    1. 各 $`X_\lambda`$ はコンパクト空間である.
    2. 積空間 $`\prod_{\lambda\in\Lambda}X_\lambda`$ はコンパクト空間である.

<u>proof.</u>
:   選択公理により, 非空な因子の族の積は非空であり, 各射影 $`\pi_\lambda:\prod_\mu X_\mu\to X_\lambda`$ は連続全射である.
    よって $`(2)\Rightarrow(1)`$ はコンパクト性の連続全射像による保存から従う.
    $`(1)\Rightarrow(2)`$ を示す.
    積空間上の超フィルター $`\mathcal{U}`$ をとる.
    各射影による像 $`(\pi_\lambda)_*\mathcal{U}`$ は $`X_\lambda`$ 上の超フィルターである.
    仮定より各 $`\lambda`$ に対して, この超フィルターが収束する点 $`x_\lambda\in X_\lambda`$ をとれる.
    $`x=(x_\lambda)_{\lambda\in\Lambda}`$ とおく.
    積位相の近傍基は有限個の座標条件で定まる円筒集合からなる.
    各座標への像が $`x_\lambda`$ に収束するので, そのような有限個の座標条件の逆像はすべて $`\mathcal{U}`$ に属する.
    フィルターの有限交叉性により, $`\mathcal{U}`$ は $`x`$ に収束する.
    すべての超フィルターが収束するから, 積空間はコンパクトである.

### Lindelöf 空間

Definition. **Lindelöf 空間**
:   位相空間 $`X`$ が **Lindelöf 性を持つ** (*Lindelöfness*) とは, $`X`$ の任意の開被覆が可算な部分被覆を持つときいう. Lindelöf 性を持つ位相空間を **Lindelöf 空間** (*Lindelöf space*) という.

Proposition. **Lindelöf 性の連続全射像による保存**
:   Lindelöf 空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ も Lindelöf 空間となる.

<u>proof.</u>
:   $`Y`$ の開被覆 $`\mathcal{V}`$ をとる.
    $`\{f^{-1}(V)\mid V\in\mathcal{V}\}`$ は $`X`$ の開被覆である.
    $`X`$ の Lindelöf 性から, ある可算部分族 $`\{V_n\mid n\in\mathbb{N}\}\subseteq\mathcal{V}`$ が存在して
    ```math
    X=\bigcup_{n\in\mathbb{N}}f^{-1}(V_n)
    ```
    となる.
    $`f`$ の全射性により $`Y=\bigcup_{n\in\mathbb{N}}V_n`$ である.
    よって $`Y`$ は Lindelöf 空間である.

Proposition. **Lindelöf 性の閉部分空間への遺伝**
:   Lindelöf 空間 $`X`$ の閉部分空間 $`F`$ も Lindelöf 空間となる.

<u>proof.</u>
:   $`F`$ の開被覆 $`\mathcal{U}`$ をとる.
    各 $`U\in\mathcal{U}`$ を $`X`$ の開集合として選ぶと, $`\mathcal{U}\cup\{X\setminus F\}`$ は $`X`$ の開被覆である.
    $`X`$ の Lindelöf 性から可算部分被覆が存在する.
    そこから $`X\setminus F`$ を除けば, 残る可算個の集合が $`F`$ を被覆する.
    よって $`F`$ は Lindelöf 空間である.

Proposition. **第二可算性から Lindelöf 性**
:   第二可算な位相空間は Lindelöf 空間となる.

<u>proof.</u>
:   可算な開基を $`\mathcal{B}`$ とし, $`X`$ の開被覆 $`\mathcal{U}`$ をとる.
    $`\mathcal{B}`$ のうち, ある $`U\in\mathcal{U}`$ に含まれるもの全体を $`\mathcal{B}'`$ とする.
    $`\mathcal{B}'`$ は可算である.
    $`x\in X`$ に対して $`x\in U`$ となる $`U\in\mathcal{U}`$ を選ぶと, 開基の性質から $`x\in B\subseteq U`$ を満たす $`B\in\mathcal{B}`$ が存在する.
    この $`B`$ は $`\mathcal{B}'`$ に属する.
    よって各 $`B\in\mathcal{B}'`$ について $`B\subseteq U_B`$ となる $`U_B\in\mathcal{U}`$ を一つ選べば, $`\{U_B\mid B\in\mathcal{B}'\}`$ は $`\mathcal{U}`$ の可算部分被覆である.
    したがって $`X`$ は Lindelöf 空間である.

Proposition. **正則 Lindelöf 空間の正規性**
:   正則な Lindelöf 空間は正規空間となる.

<u>proof.</u>
:   互いに交わらない閉集合 $`A,B\subseteq X`$ をとる.
    正則性により, 各 $`a\in A`$ に対して $`a\in U_a`$ かつ $`\overline{U_a}\cap B=\emptyset`$ を満たす開集合 $`U_a`$ を選べる.
    $`A`$ は Lindelöf 空間の閉部分空間なので Lindelöf であり, この被覆から可算部分被覆 $`(U_n)_{n\in\mathbb{N}}`$ をとれる.
    同様に, $`B`$ を被覆し $`\overline{V_n}\cap A=\emptyset`$ を満たす可算列の開集合 $`(V_n)_{n\in\mathbb{N}}`$ をとれる.
    次で定める集合は開集合である.
    ```math
    U=\bigcup_{n\in\mathbb{N}}\left(U_n\setminus\bigcup_{i\leq n}\overline{V_i}\right),\qquad
    V=\bigcup_{n\in\mathbb{N}}\left(V_n\setminus\bigcup_{i\leq n}\overline{U_i}\right).
    ```
    $`A\subseteq U`$ と $`B\subseteq V`$ は, それぞれ $`A\cap\overline{V_i}=\emptyset`$ と $`B\cap\overline{U_i}=\emptyset`$ から従う.
    $`x\in U_n\setminus\bigcup_{i\leq n}\overline{V_i}`$ と $`x\in V_m\setminus\bigcup_{i\leq m}\overline{U_i}`$ が同時に成り立つと仮定する.
    $`n\leq m`$ なら後者は $`x\notin\overline{U_n}`$ を, $`m\leq n`$ なら前者は $`x\notin\overline{V_m}`$ を与え, いずれも矛盾である.
    よって $`U\cap V=\emptyset`$ であり, $`X`$ は正規空間である.

Proposition. **コンパクト性から Lindelöf 性**
:   コンパクト空間は Lindelöf 空間となる.

<u>proof.</u>
:   コンパクト空間の任意の開被覆は有限部分被覆を持つ.
    有限集合は可算であるから, この有限部分被覆は可算部分被覆でもある.
    よってコンパクト空間は Lindelöf 空間である.

Theorem.
:   距離空間 $`X`$ に対して, 以下同値.
    1. $`X`$ は Lindelöf 空間である.
    2. $`X`$ は第二可算である.
    3. $`X`$ は可分である.

<u>proof.</u>
:   $`(2)\Rightarrow(1)`$ は第二可算性から Lindelöf 性への命題である.
    $`(1)\Rightarrow(3)`$ を示す.
    各正整数 $`n`$ に対して半径 $`1/n`$ の開球全体は $`X`$ の開被覆である.
    Lindelöf 性から各 $`n`$ について可算部分被覆を選び, その中心全体を $`D_n`$ とおく.
    $`D=\bigcup_{n\geq1}D_n`$ は可算である.
    空でない開集合 $`U`$ と $`x\in U`$ をとり, $`B(x,\varepsilon)\subseteq U`$ となる $`\varepsilon>0`$ を選ぶ.
    $`2/n<\varepsilon`$ となる $`n`$ をとれば, $`x`$ を覆う $`D_n`$ を中心とする半径 $`1/n`$ の球がある.
    その中心 $`d`$ は $`d(x,d)<1/n<\varepsilon`$ を満たすので $`d\in D\cap U`$ である.
    よって $`D`$ は稠密である.

    $`(3)\Rightarrow(2)`$ を示す.
    可算稠密部分集合を $`D`$ とする.
    $`d\in D`$ と正の有理数 $`q`$ に対する開球 $`B(d,q)`$ 全体は可算である.
    $`x\in U`$ と $`U`$ が開なら, $`B(x,\varepsilon)\subseteq U`$ となる $`\varepsilon>0`$ をとれる.
    $`0<q<\varepsilon/2`$ となる有理数 $`q`$ を選び, 稠密性から $`d(x,d)<q`$ を満たす $`d\in D`$ をとる.
    三角不等式より $`x\in B(d,q)\subseteq B(x,2q)\subseteq U`$ である.
    従ってこれらの球は可算な開基をなす.

### 可算コンパクト空間

Definition. **可算コンパクト空間**
:   位相空間 $`X`$ が **可算コンパクト性を持つ** (*Countably compactness*) とは, $`X`$ の任意の可算開被覆が有限な部分被覆を持つときいう. 可算コンパクト性を持つ位相空間を **可算コンパクト空間** (*Countably compact space*) という.

Theorem. **可算コンパクト性と同値な命題**
:   $`\mathbf{T}_1`$ 位相空間 $`X`$ に対して以下同値.
    1. $`X`$ は可算コンパクト空間である.
    2. $`X`$ の有限交叉性をもつ可算部分集合族 $`\mathbf{F}`$ に対して $`\bigcap_{F\in\mathbf{F}}\overline{F}\neq\emptyset`$ となる.
    3. $`X`$ のすべての可算無限集合は集積点を持つ.

<u>proof.</u>
:   (1)$`\Rightarrow`$(2) はコンパクト性の場合と同様に, 閉包の補集合から得られる可算開被覆へ可算コンパクト性を適用すれば従う.
    (2)$`\Rightarrow`$(3) とする.
    可算無限集合を相異なる点列 $`\{a_n\mid n\in\mathbb N\}`$ として列挙し, 尾部 $`F_n=\{a_k\mid k\geq n\}`$ を考える.
    この族は有限交叉性を持つので, ある $`x\in\bigcap_n\overline{F_n}`$ が存在する.
    $`x=a_k`$ である場合には $`n>k`$ を選べば $`x\notin F_n`$ である.
    したがって $`x`$ の任意の近傍は $`F_n`$ と交わり, その交点は $`x`$ と異なる.
    $`x`$ が列の項でない場合も同じ結論が直ちに成り立つ.
    よって $`x`$ は $`A`$ の集積点である.
    (3)$`\Rightarrow`$(1) は, 有限部分被覆を持たない可算開被覆 $`(U_n)`$ があれば, 増大被覆 $`V_n=U_0\cup\cdots\cup U_n`$ の各補集合から点 $`x_n\notin V_n`$ を選ぶことで示す.
    $`\{x_n\mid n\in\mathbb N\}`$ は無限であり, その集積点はある $`U_N`$ に属する.
    しかし $`n\geq N`$ なら $`x_n\notin V_n\supseteq U_N`$ であるから, $`U_N`$ はこの集合の集積点を持てず矛盾する.

Proposition. **可算コンパクト性の連続全射像による保存**
:   可算コンパクト空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ も可算コンパクト空間となる.

<u>proof.</u>
:   $`Y`$ の可算開被覆 $`\{V_n\mid n\in\mathbb{N}\}`$ をとる.
    連続性より $`\{f^{-1}(V_n)\mid n\in\mathbb{N}\}`$ は $`X`$ の可算開被覆である.
    $`X`$ の可算コンパクト性から, ある有限集合 $`I\subseteq\mathbb{N}`$ が存在して
    ```math
    X=\bigcup_{n\in I}f^{-1}(V_n)
    ```
    となる.
    $`f`$ は全射なので $`Y=\bigcup_{n\in I}V_n`$ である.
    よって $`Y`$ は可算コンパクト空間である.

Proposition. **可算コンパクト性の閉部分空間への遺伝**
:   可算コンパクト空間 $`X`$ の閉部分空間 $`F`$ も可算コンパクト空間となる.

<u>proof.</u>
:   $`F`$ の可算開被覆 $`\{U_n\mid n\in\mathbb{N}\}`$ をとる.
    各 $`U_n`$ を $`X`$ の開集合として選べば, $`F`$ の閉性から
    ```math
    \{U_n\mid n\in\mathbb{N}\}\cup\{X\setminus F\}
    ```
    は $`X`$ の可算開被覆となる.
    したがって有限部分被覆をとれる.
    それを $`F`$ と交わらせると, $`X\setminus F`$ は寄与しないから, 有限個の $`U_n`$ が $`F`$ を被覆する.
    よって $`F`$ は可算コンパクト空間である.

Proposition. **コンパクト性から可算コンパクト性**
:   コンパクト空間は可算コンパクト空間となる.

<u>proof.</u>
:   可算開被覆は特に開被覆である.
    コンパクト性により有限部分被覆を持つから, 可算コンパクト性の定義を満たす.

Definition. **弱可算コンパクト空間**
:   位相空間 $`X`$ が **弱可算コンパクト性を持つ** (*weakly Countably compactness*) あるいは **極限点コンパクト性を持つ** (*limit point compactness*) とは, $`X`$ の任意の無限部分集合が集積点を持つときいう. 弱可算コンパクト性を持つ位相空間を **弱可算コンパクト空間** (*weakly Countably compact space*) あるいは **極限点コンパクト空間** (*limit point compact space*) という.

Proposition. **弱可算コンパクト性の連続全射像による保存**
:   $`T_1`$ 弱可算コンパクト空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ も弱可算コンパクト空間となる.

<u>proof.</u>
:   $`Y`$ の無限部分集合 $`A`$ をとる.
    全射性により各 $`a\in A`$ に対して $`f(x_a)=a`$ となる $`x_a\in X`$ を一つ選ぶ.
    $`B=\{x_a\mid a\in A\}`$ は無限集合なので, 仮定から集積点 $`x\in X`$ を持つ.
    任意の $`f(x)`$ の近傍 $`V`$ に対して $`f^{-1}(V)`$ は $`x`$ の近傍である.
    $`f(x)\in A`$ なら, それに対応する $`x_{f(x)}`$ は高々一つである.
    $`x_{f(x)}\neq x`$ の場合には, $`T_1`$ 性から $`X\setminus\{x_{f(x)}\}`$ は $`x`$ の近傍である.
    これを $`f^{-1}(V)`$ と交わらせれば, 集積点の定義により $`B`$ の別の点を得る.
    $`x_{f(x)}=x`$ の場合も, 集積点の定義から $`x`$ と異なる $`B`$ の点を得る.
    $`f(x)\notin A`$ の場合には, 最初から $`f^{-1}(V)\setminus\{x\}`$ 内の任意の $`B`$ の点でよい.
    したがっていずれの場合にも, $`V`$ 内に $`f(x)`$ と異なる $`A`$ の点がある.
    したがって $`V\setminus\{f(x)\}`$ は $`A`$ と交わる.
    すなわち $`f(x)`$ は $`A`$ の集積点である.

Proposition. **コンパクト性から弱可算コンパクト性**
:   コンパクト空間は弱可算コンパクト空間となる.

<u>proof.</u>
:   無限部分集合 $`A\subseteq X`$ が集積点を持たないと仮定する.
    各 $`x\in X`$ について, $`(U_x\setminus\{x\})\cap A=\emptyset`$ を満たす $`x`$ の開近傍 $`U_x`$ をとれる.
    $`\{U_x\mid x\in X\}`$ は開被覆なので, コンパクト性から有限部分被覆 $`U_{x_1},\ldots,U_{x_m}`$ を持つ.
    しかし各 $`U_{x_i}`$ は高々一つの $`A`$ の点しか含まないので, $`A\subseteq\{x_1,\ldots,x_m\}`$ となる.
    これは $`A`$ が無限であることに反する.
    よって $`A`$ は集積点を持ち, $`X`$ は弱可算コンパクト空間である.

Theorem.
:   距離空間 $`X`$ に対して, 以下同値.
    1. $`X`$ はコンパクト空間である.
    2. $`X`$ は弱可算コンパクト空間である.
    3. $`X`$ は点列コンパクト空間である.

<u>proof.</u>
:   (1)$`\Rightarrow`$(2) は直前の命題による.
    (2)$`\Rightarrow`$(3) は, 点列が有限個の値しか取らなければ定値部分列を持ち, そうでなければその値の集合の集積点に収束する部分列を距離球を半径 $`1/n`$ として順に選ぶことで従う.
    (3)$`\Rightarrow`$(1) では, まず $`X`$ が全有界であることを示す.
    そうでなければ, ある $`\varepsilon>0`$ に対して互いの距離が $`\varepsilon`$ 以上である点列を帰納的に作れ, これは収束部分列を持たない.
    また Cauchy 列は収束部分列を持ち, Cauchy 性から列全体がその極限に収束するので $`X`$ は完備である.
    完備かつ全有界な距離空間はコンパクトであるから結論を得る.

### パラコンパクト空間

Definition. **パラコンパクト空間**
:   位相空間 $`X`$ が **パラコンパクト性を持つ** (*paracompactness*) とは, $`X`$ の任意の開被覆が局所有限な開細分を持つときいう. パラコンパクト性を持つ位相空間を **パラコンパクト空間** (*paracompact space*) という.

### 擬コンパクト空間

Definition. **擬コンパクト空間**
:   位相空間 $`X`$ が **擬コンパクト性を持つ** (*pseudocompactness*) とは, 任意の連続写像 $`X\to\mathbb{R}`$ の像が有界なときいう. 擬コンパクト性を持つ位相空間を **擬コンパクト空間** (*pseudocompact space*) という.

Proposition. **擬コンパクト性の連続全射像による保存**
:   擬コンパクト空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ も擬コンパクト空間となる.

<u>proof.</u>
:   任意の連続写像 $`g:Y\to\mathbb{R}`$ をとる.
    合成 $`g\circ f:X\to\mathbb{R}`$ は連続であるから, $`X`$ の擬コンパクト性よりその像は有界である.
    $`f`$ は全射なので $`g(Y)=(g\circ f)(X)`$ である.
    よって $`g(Y)`$ は有界であり, $`Y`$ は擬コンパクトである.

Proposition. **正規擬コンパクト性の閉部分空間への遺伝**
:   $`\mathbf{T}_1`$ 正規かつ擬コンパクトな空間 $`X`$ の閉部分空間 $`F`$ も $`\mathbf{T}_1`$ 正規かつ擬コンパクトとなる.

<u>proof.</u>
:   閉部分空間は正規性を遺伝する.
    $`F`$ 上の連続関数 $`f:F\to\mathbb{R}`$ をとる.
    Tietze の拡張定理により, $`f`$ は連続関数 $`\widetilde f:X\to\mathbb{R}`$ に拡張される.
    $`X`$ の擬コンパクト性から $`\widetilde f(X)`$ は有界である.
    $`f(F)\subseteq\widetilde f(X)`$ なので $`f(F)`$ も有界である.
    よって $`F`$ は擬コンパクトである.

Proposition. **可算コンパクト性から擬コンパクト性**
:   可算コンパクト空間は擬コンパクト空間となる.

<u>proof.</u>
:   連続関数 $`f:X\to\mathbb{R}`$ が有界でないと仮定する.
    このとき
    ```math
    \left\{f^{-1}((-n,n))\mathrel{\middle|}n\in\mathbb{N}\right\}
    ```
    は $`X`$ の可算開被覆である.
    しかし有限部分族は, 添字の最大値を $`N`$ とすれば $`f^{-1}((-N,N))`$ に含まれるため, $`f`$ の非有界性から $`X`$ を被覆しない.
    これは可算コンパクト性に反する.
    よってすべての連続実数値関数は有界であり, $`X`$ は擬コンパクトである.

Proposition. **弱可算コンパクト性から可算コンパクト性**
:   $`\mathbf{T}_1`$ な弱可算コンパクト空間は可算コンパクト空間となる.

<u>proof.</u>
:   $`T_1`$ 空間では, 可算コンパクト性と「任意の可算無限部分集合が集積点を持つ」という性質は同値である.
    弱可算コンパクト性はより強く任意の無限部分集合についてこの性質を課している.
    したがって可算コンパクト性が従う.

### 点列コンパクト空間

Definition. **点列コンパクト空間**
:   位相空間 $`X`$ が **点列コンパクト性を持つ** (*sequentially compactness*) とは, $`X`$ の任意の点列が収束する部分列を持つときいう. 点列コンパクト性を持つ位相空間を **点列コンパクト空間** (*sequentially compact space*) という.

Proposition. **点列コンパクト性の連続全射像による保存**
:   点列コンパクト空間 $`X`$ と位相空間 $`Y`$ に対して, 全射連続写像 $`f:X\to Y`$ が存在すれば, $`Y`$ も点列コンパクト空間となる.

<u>proof.</u>
:   $`Y`$ の任意の点列 $`(y_n)`$ をとる.
    全射性から $`f(x_n)=y_n`$ を満たす $`x_n\in X`$ を各 $`n`$ について選ぶ.
    $`X`$ の点列コンパクト性より, ある部分列 $`(x_{n_k})`$ が $`x\in X`$ に収束する.
    連続性から $`(y_{n_k})=(f(x_{n_k}))`$ は $`f(x)`$ に収束する.
    よって $`Y`$ は点列コンパクト空間である.

Theorem. **Bolzano–Weierstrass の定理**
:   $`\mathbb{R}^n`$ の有界点列は収束する部分列をもつ.

<u>proof.</u>
:   有界点列 $`(x_k)`$ は, ある閉球 $`\overline B(0,R)`$ に含まれる.
    Heine-Borel の定理により $`\overline B(0,R)`$ はコンパクトである.
    距離空間ではコンパクト集合は点列コンパクトであるから, $`(x_k)`$ は収束する部分列を持つ.

corollary. **点列コンパクト性定理 (Bolzano–Weierstrass の定理と同値な定式化)**
:   $`\mathbb{R}^n`$ の部分集合が点列コンパクトであるための必要十分条件は, それが有界閉集合であることである.

<u>proof.</u>
:   有界閉集合 $`A`$ はあるコンパクト閉球の閉部分集合であるからコンパクトであり, 従って点列コンパクトである.
    逆に $`A`$ が点列コンパクトなら, $`x\in\overline A`$ に対して $`x`$ へ収束する $`A`$ 内の点列を取れる.
    この列は $`A`$ 内で収束する部分列を持ち, 距離空間での極限の一意性からその極限は $`x`$ である.
    よって $`x\in A`$ であり, $`A`$ は閉集合である.
    また $`A`$ が有界でないなら, $`\lVert x_n\rVert>n`$ を満たす点列を選べるが, これは収束部分列を持たないので矛盾する.
    よって $`A`$ は有界閉集合である.
    コンパクトな距離空間の部分集合は閉かつ有界であるので, $`A`$ は有界閉集合である.

### メタコンパクト空間

局所有限性は各点のある近傍で被覆の元を有限個に抑える条件であるのに対し, 点有限性は各点そのものを含む元の数だけを抑える条件である.
メタコンパクト性はこの後者を任意の開被覆に課す性質であり, パラコンパクト性より弱いが, 被覆の重なりを制御するために十分な場面が多い.

Definition. **メタコンパクト空間**
:   位相空間 $`X`$ が **メタコンパクト性を持つ** (*metacompactness*) とは, $`X`$ の任意の開被覆が点有限な開細分を持つときいう.
    メタコンパクト性を持つ位相空間を **メタコンパクト空間** (*metacompact space*) という.

Definition. **可算メタコンパクト空間**
:   位相空間 $`X`$ が **可算メタコンパクト性を持つ** (*countably metacompactness*) とは, $`X`$ の任意の可算開被覆が点有限な開細分を持つときいう. 可算メタコンパクト性を持つ位相空間を **可算メタコンパクト空間** (*countably metacompact space*) という.

Proposition. **パラコンパクト性からメタコンパクト性**
:   パラコンパクト空間はメタコンパクト空間である.

<u>proof.</u>
:   局所有限な族は点有限である.
    実際, $`x`$ の局所有限性を与える近傍は, $`x`$ を含む族の元をすべて含むからである.
    よって各開被覆が局所有限な開細分を持つなら, それは点有限な開細分でもある.

Remark.
:   コンパクト空間と距離空間はパラコンパクトであるからメタコンパクトである.
    また, コンパクト空間 $`K`$ とメタコンパクト空間 $`X`$ に対して $`K\times X`$ はメタコンパクトである.
    逆向きの含意は一般には成り立たず, メタコンパクト性はパラコンパクト性を真に弱める条件である.[^metacompact]

### 直交コンパクト空間

点有限性をさらに緩めると, 一点を含む被覆の元すべての共通部分が近傍を含むことだけを要求する条件が得られる.
この条件で被覆を細分できることを直交コンパクト性という.

Definition. **内部保存族**
:   位相空間 $`X`$ の部分集合族 $`\mathcal V`$ が **内部保存** (*interior-preserving*) であるとは, 任意の $`x\in X`$ に対して
    ```math
    \bigcap\{V\in\mathcal V\mid x\in V\}
    ```
    が $`x`$ の開近傍となるときいう.
    ここで $`\mathcal V`$ は被覆であるため, この交わりを取る集合族は空でない.

Definition. **直交コンパクト空間**
:   位相空間 $`X`$ が **直交コンパクト性を持つ** (*orthocompactness*) とは, $`X`$ の任意の開被覆が内部保存な開細分を持つときいう.
    直交コンパクト性を持つ位相空間を **直交コンパクト空間** (*orthocompact space*) という.

Definition. **可算直交コンパクト空間**
:   位相空間 $`X`$ が **可算直交コンパクト性を持つ** (*countably orthocompactness*) とは, $`X`$ の任意の可算開被覆が内部保存な開細分を持つときいう.

Proposition. **点有限族は内部保存である**
:   点有限な開集合族は内部保存である.

<u>proof.</u>
:   $`x\in X`$ をとる.
    点有限性により $`x`$ を含む族の元は有限個であり, それらの共通部分は開集合である.
    これは $`x`$ を含むので, 内部保存性の条件を満たす.

Corollary. **メタコンパクト性から直交コンパクト性**
:   メタコンパクト空間は直交コンパクト空間である.
    同様に, 可算メタコンパクト空間は可算直交コンパクト空間である.

<u>proof.</u>
:   点有限な開細分をとり, 直前の命題を適用する.

Proposition. **閉部分空間への遺伝**
:   直交コンパクト空間の閉部分空間は直交コンパクト空間である.
    同様に, 可算直交コンパクト性も閉部分空間へ遺伝する.

<u>proof.</u>
:   $`F`$ を直交コンパクト空間 $`X`$ の閉部分空間とし, $`F`$ の開被覆を $`\{U_i\cap F\mid i\in I\}`$ と書く.
    これに $`X\setminus F`$ を加えた $`X`$ の開被覆の内部保存な開細分をとる.
    $`F`$ と交わる元だけを $`F`$ に制限すれば, 元の被覆の開細分である.
    各点での共通部分も $`F`$ における開近傍へ制限されるので, この細分は内部保存である.

Remark.
:   コンパクト空間, パラコンパクト空間, メタコンパクト空間はすべて直交コンパクトである.
    さらに, 直交コンパクト空間 $`X`$ について $`X\times[0,1]`$ が直交コンパクトであることと, $`X`$ が可算メタコンパクトであることは同値である.[^orthocompact]

### 実コンパクト空間

実コンパクト性は, 連続実数値関数が空間をどこまで座標として記述できるかを表す性質である.
コンパクト化が有界連続関数を用いるのに対し, 実コンパクト化ではすべての実数値連続関数を用いる.

Definition. **実コンパクト空間**
:   Tychonoff 空間 $`X`$ が **実コンパクト** (*realcompact*) であるとは, 次の同値な条件を満たすときいう.
    1. ある集合 $`I`$ に対して $`X`$ が積空間 $`\mathbb R^I`$ の閉部分空間と同相である.
    2. 評価写像 $`e_X:X\to\mathbb R^{C(X,\mathbb R)}`$ の像が閉じている.

Definition. **実コンパクト化**
:   $`C(X,\mathbb R)`$ を $`X`$ 上の連続実数値関数全体とする.
    Tychonoff 空間 $`X`$ の評価写像
    ```math
    e_X:X\longrightarrow\mathbb R^{C(X,\mathbb R)},\qquad
    e_X(x)(f)=f(x)
    ```
    の像の閉包を $`\nu X`$ と書き, **実コンパクト化** (*Hewitt realcompactification*) という.
    評価写像は埋め込みであるから, 以下では $`X`$ を $`\nu X`$ の稠密部分空間とみなす.

Proposition. **基本例と閉部分空間への遺伝**
:   コンパクト Hausdorff 空間は実コンパクトである.
    また, 実コンパクト空間の閉部分空間は実コンパクトである.

<u>proof.</u>
:   コンパクト Hausdorff 空間では $`e_X(X)`$ はコンパクトであり, Hausdorff 空間 $`\mathbb R^{C(X,\mathbb R)}`$ では閉じている.
    よって実コンパクト性の第二の特徴づけから $`X`$ は実コンパクトである.
    $`X`$ が $`\mathbb R^I`$ の閉部分空間と同相で $`F`$ が $`X`$ で閉じていれば, $`F`$ は $`\mathbb R^I`$ の閉部分空間と同相である.

Remark.
:   Lindelöf な Tychonoff 空間は実コンパクトである.
    また Tychonoff 空間について, コンパクトであることは実コンパクトかつ擬コンパクトであることと同値である.
    この特徴づけにより, 実コンパクト性はコンパクト性から有界性だけを取り除いた性質として位置づけられる.[^realcompact]

### 局所コンパクト空間

Definition. **局所コンパクト空間**
:   Hausdorff 空間 $`X`$ が **局所コンパクト** (*locally compact*) であるとは, 任意の点 $`x\in X`$ がコンパクトな近傍を持つときいう.

Proposition. **局所コンパクト性の近傍による特徴づけ**
:   Hausdorff 空間 $`X`$ に対して, 以下は同値である.
    1. $`X`$ は局所コンパクトである.
    2. 任意の $`x\in X`$ とその開近傍 $`U`$ に対して,
        ```math
        x\in V\subseteq\overline{V}\subseteq U
        ```
        かつ $`\overline{V}`$ がコンパクトとなる開集合 $`V`$ が存在する.

<u>proof.</u>
:   $`(1)\Rightarrow(2)`$ を示す.
    $`x\in U`$ とし, $`x`$ のコンパクト近傍 $`K`$ をとる.
    Hausdorff 空間ではコンパクト集合は閉であるから, $`K`$ は閉集合である.
    部分空間 $`K`$ はコンパクト Hausdorff 空間なので正規である.
    コンパクト近傍の定義から $`x\in O\subseteq K`$ を満たす $`X`$ の開集合 $`O`$ をとる.
    $`K\cap U\cap O`$ は $`K`$ における $`x`$ の開近傍であるから, 正規性により
    ```math
    x\in V\subseteq\overline{V}^{,K}\subseteq K\cap U
    ```
    を満たす $`K`$ での開集合 $`V`$ をとれる.
    $`V\subseteq O`$ であり $`O\subseteq K`$ なので, $`V`$ は $`X`$ の開集合でもある.
    $`K`$ が閉であることから $`\overline{V}^{,X}=\overline{V}^{,K}`$ である.
    よって所望の条件を満たし, 閉部分集合 $`\overline{V}`$ はコンパクトである.

    $`(2)\Rightarrow(1)`$ は $`U=X`$ とおけばよい.
    このとき得られるコンパクト集合 $`\overline{V}`$ は $`x`$ の近傍である.

Proposition. **局所コンパクト性の閉部分空間への遺伝**
:   局所コンパクト Hausdorff 空間の閉部分空間は局所コンパクト Hausdorff 空間である.

<u>proof.</u>
:   局所コンパクト Hausdorff 空間 $`X`$ の閉部分集合 $`F`$ と $`x\in F`$ をとる.
    $`x`$ は $`X`$ においてコンパクトな近傍 $`K`$ を持つ.
    $`F\cap K`$ は $`K`$ の閉部分集合であるからコンパクトである.
    $`K`$ に含まれる $`x`$ の開近傍 $`U`$ をとれば, $`U\cap F`$ は $`F\cap K`$ に含まれる $`x`$ の $`F`$ における開近傍である.
    よって $`F\cap K`$ は $`x`$ のコンパクト近傍である.
    $`x`$ は任意であり, Hausdorff 性は部分空間へ遺伝するから $`F`$ は局所コンパクト Hausdorff 空間である.

[^metacompact]: nLab authors, “metacompact space”, *nLab*; “Metacompact space”, *Wikipedia*.
[^orthocompact]: nLab authors, “orthocompact space”, *nLab*; “Orthocompact space”, *Wikipedia*; B. M. Scott, “Towards a product theory for orthocompactness”, *Studies in Topology*, 1975, 517--537.
[^realcompact]: “Realcompact space”, *Wikipedia*; L. Gillman and M. Jerison, *Rings of Continuous Functions*, Springer-Verlag, 1976.

---

## 近接と遠隔

位相は, 部分集合どうしの関係によっても記述できる.
本稿では, 対称性を要求しない準近接関係を出発点とし, 対称な近接関係とその双対である準遠隔関係を定める.

Definition. **準近接関係**
:   集合 $`X`$ 上の二項関係 $`\delta\subseteq2^X\times2^X`$ が **準近接関係** (*quasi-proximity relation*) であるとは, 任意の $`A,B,C\subseteq X`$ に対して次の条件を満たすこととする.
    - $`A\mathrel{\delta}B`$ ならば $`A\neq\emptyset`$ かつ $`B\neq\emptyset`$ である.
    - $`A\cap B\neq\emptyset`$ ならば $`A\mathrel{\delta}B`$ である.
    - $`(A\cup B)\mathrel{\delta}C`$ であることと, $`A\mathrel{\delta}C`$ または $`B\mathrel{\delta}C`$ であることは同値である.
    - $`A\mathrel{\delta}(B\cup C)`$ であることと, $`A\mathrel{\delta}B`$ または $`A\mathrel{\delta}C`$ であることは同値である.
    - $`A\mathrel{\delta}B`$ かつ $`B\subseteq\operatorname{cl}_{\delta}(C)`$ ならば $`A\mathrel{\delta}C`$ である.

    ここで
    ```math
    \operatorname{cl}_{\delta}(C)\coloneqq\{x\in X\mid\{x\}\mathrel{\delta}C\}
    ```
    とおく.
    最後の条件は Lodato 型の公理である.

Proposition. **準近接関係から得られる閉包作用素**
:   準近接関係 $`\delta`$ に対して, $`\operatorname{cl}_{\delta}:2^X\to2^X`$ は閉包作用素である.

<u>proof.</u>
:   第一の公理から $`\operatorname{cl}_{\delta}(\emptyset)=\emptyset`$ が成り立つ.
    第二の公理から $`C\subseteq\operatorname{cl}_{\delta}(C)`$ が成り立つ.
    第三または第四の公理から有限和保存性が成り立つ.
    $`x\in\operatorname{cl}_{\delta}(\operatorname{cl}_{\delta}(C))`$ とすると $`\{x\}\mathrel{\delta}\operatorname{cl}_{\delta}(C)`$ である.
    Lodato 型の公理を適用すれば $`\{x\}\mathrel{\delta}C`$ となる.
    よって冪等性が成り立つ.

Definition. **位相的準近接関係**
:   準近接関係 $`\delta`$ が **位相的** (*topological*) であるとは, 任意の $`A,B\subseteq X`$ に対して
    ```math
    A\mathrel{\delta}B
    \quad\Longleftrightarrow\quad
    A\cap\operatorname{cl}_{\delta}(B)\neq\emptyset
    ```
    が成り立つこととする.

Theorem. **位相構造と位相的準近接関係の対応**
:   集合 $`X`$ 上の位相構造と, $`X`$ 上の位相的準近接関係は一対一に対応する.
    位相 $`\mathcal O`$ に対応する準近接関係は
    ```math
    A\mathrel{\delta_{\mathcal O}}B
    \quad\Longleftrightarrow\quad
    A\cap\overline{B}^{\mathcal O}\neq\emptyset
    ```
    で与えられる.
    準近接関係 $`\delta`$ に対応する位相は, 閉包作用素 $`\operatorname{cl}_{\delta}`$ が定める位相である.

<u>proof.</u>
:   位相 $`\mathcal O`$ から定めた $`\delta_{\mathcal O}`$ に対して, $`\operatorname{cl}_{\delta_{\mathcal O}}(B)=\overline B^{\mathcal O}`$ が成り立つ.
    実際,
    ```math
    x\in\operatorname{cl}_{\delta_{\mathcal O}}(B)
    \quad\Longleftrightarrow\quad
    \{x\}\cap\overline B^{\mathcal O}\neq\emptyset
    \quad\Longleftrightarrow\quad
    x\in\overline B^{\mathcal O}
    ```
    である.
    したがって $`\delta_{\mathcal O}`$ は位相的である.
    また $`A\mathrel{\delta_{\mathcal O}}B`$ かつ $`B\subseteq\operatorname{cl}_{\delta_{\mathcal O}}(C)`$ ならば $`A\cap\overline B^{\mathcal O}\neq\emptyset`$ かつ $`\overline B^{\mathcal O}\subseteq\overline C^{\mathcal O}`$ であるから, $`A\mathrel{\delta_{\mathcal O}}C`$ である.
    逆に位相的準近接関係 $`\delta`$ に対応する閉包作用素から得られる位相の閉包を $`\operatorname{cl}_{\delta}`$ とすると, 位相性の定義から元の $`\delta`$ が復元される.
    以上により二つの対応は互いに逆である.

Definition. **近接関係**
:   準近接関係 $`\delta`$ が対称であるとき, $`\delta`$ を **近接関係** (*proximity relation*) といい, $`(X,\delta)`$ を **近接空間** (*proximity space*) という.
    すなわち, 任意の $`A,B\subseteq X`$ に対して
    ```math
    A\mathrel{\delta}B\quad\Longleftrightarrow\quad B\mathrel{\delta}A
    ```
    が成り立つ.
    近接関係は準近接関係の特別な場合である.

Proposition. **閉包の共通部分による近接関係**
:   $`\mathbf{T}_1`$ 空間 $`X`$ に対して
    ```math
    A\mathrel{\delta_X^{\mathrm s}}B
    \quad\Longleftrightarrow\quad
    \overline A\cap\overline B\neq\emptyset
    ```
    と定めると, $`\delta_X^{\mathrm s}`$ は近接関係である.

<u>proof.</u>
:   空でない閉包の共通部分を持つという条件は対称である.
    空集合との関係, 交差性, 有限和に関する条件は閉包の基本性質から従う.
    $`\mathbf{T}_1`$ 性から $`\operatorname{cl}_{\delta_X^{\mathrm s}}(C)=\overline C`$ である.
    $`A\mathrel{\delta_X^{\mathrm s}}B`$ かつ $`B\subseteq\operatorname{cl}_{\delta_X^{\mathrm s}}(C)`$ とする.
    このとき $`\overline B\subseteq\overline C`$ であるから, $`\overline A\cap\overline C\neq\emptyset`$ となる.
    よって Lodato 型の公理も成り立つ.

Definition. **準遠隔関係**
:   準近接関係 $`\delta`$ に対して, $`A,B\subseteq X`$ が **準遠隔関係にある** (*quasi-far*) とは
    ```math
    A\mathrel{\phi_{\delta}}B\quad\Longleftrightarrow\quad\neg(A\mathrel{\delta}B)
    ```
    が成り立つこととする.
    $`\phi_{\delta}`$ は $`\delta`$ の双対である.

Definition. **遠隔関係**
:   近接関係 $`\delta`$ の準遠隔関係 $`\phi_{\delta}`$ を **遠隔関係** (*far relation*) という.
    近接関係が対称であるから, 遠隔関係も対称である.

Proposition. **準近接関係と準遠隔関係の双対性**
:   準近接関係 $`\delta`$ とその準遠隔関係 $`\phi_{\delta}`$ に対して, 次が成り立つ.
    1. $`A\mathrel{\phi_{\delta}}B`$ ならば $`A\cap B=\emptyset`$ である.
    2. $`(A\cup B)\mathrel{\phi_{\delta}}C`$ であることと, $`A\mathrel{\phi_{\delta}}C`$ かつ $`B\mathrel{\phi_{\delta}}C`$ であることは同値である.
    3. $`A\mathrel{\phi_{\delta}}(B\cup C)`$ であることと, $`A\mathrel{\phi_{\delta}}B`$ かつ $`A\mathrel{\phi_{\delta}}C`$ であることは同値である.

<u>proof.</u>
:   第一の主張は交差性の対偶である.
    第二と第三の主張は, 準近接関係の有限和に関する公理を否定することで得られる.

Theorem. **位相構造と標準準遠隔関係の対応**
:   位相 $`\mathcal O`$ に対して
    ```math
    A\mathrel{\phi_{\mathcal O}}B
    \quad\Longleftrightarrow\quad
    A\cap\overline B^{\mathcal O}=\emptyset
    ```
    と定めると, $`\phi_{\mathcal O}`$ は $`\delta_{\mathcal O}`$ に双対な準遠隔関係である.
    この対応から $`\mathcal O`$ を復元できる.

<u>proof.</u>
:   $`\phi_{\mathcal O}`$ は定義から $`\delta_{\mathcal O}`$ の補関係である.
    また
    ```math
    \overline B^{\mathcal O}
    =\{x\in X\mid\neg(\{x\}\mathrel{\phi_{\mathcal O}}B)\}
    ```
    であるから, 準遠隔関係から閉包作用素を復元できる.
    閉包作用素から位相を復元する定理により, $`\mathcal O`$ が復元される.

Remark.
:   文献では, 対称性を除いた近接関係を quasi-proximity と呼ぶ.
    公理の選択には文献による差があるため, 本稿では有限和の両側保存性と Lodato 型の公理を含む準近接関係を採用する.[^proximity]
    準近接関係は一般に対称でないため, その双対である準遠隔関係も一般に対称でない.
    構成的数学でいう apartness relation は別の公理系を持つため, 準遠隔関係と同一視しない.

[^proximity]: S. A. Naimpally and B. D. Warrack, *Proximity Spaces*, Cambridge University Press, 1970; J. Galton, “Applications of near sets”, *Proceedings of the 2011 IEEE International Conference on Fuzzy Systems*, 2011; D. Bridges and L. Vîţă, *Apartness and Uniformity: A Constructive Development*, Springer, 2011.
---

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
    \mathcal{U}(x)\coloneqq\{U[x]\mid U\in\mathbf{E}_X\},\quad x\in X
    ```
    とすると, $`\mathcal{U}`$ は $`X`$ 上の近傍基となる. このとき, $`\mathcal{U}`$ により定める位相を $`(X,\Phi)`$ における **一様位相** (*uniform topology*) という.

<u>proof.</u>
:   任意の近縁 $`U`$ は対角集合を含むので $`x\in U[x]`$ である.
    近縁系のフィルター性から, 二つの球近傍の交叉にはその二つの近縁の交叉による球近傍が含まれる.
    $`V\circ V\subseteq U`$ を満たす近縁 $`V`$ を取ると, $`y\in V[x]`$ に対して $`V[y]\subseteq U[x]`$ である.
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
    $`V[x]`$ は $`x`$ の近傍であり, $`y\in V[x]`$ なら $`f(y)\in U[f(x)]\subseteq O`$ である.
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
    $`V\circ V\subseteq U`$ となる対称近縁 $`V`$ に対して $`V[x]`$ と $`V[y]`$ は交わらないので, 一様位相は Hausdorff である.
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
    収束性より $`V[x]=\{y\mid(x,y)\in V\}`$ は $`\mathcal F`$ に属する.
    $`a,b\in V[x]`$ なら対称性から $`(a,x),(x,b)\in V`$ であり, $`(a,b)\in V\circ V\subseteq U`$ である.
    よって $`V[x]\times V[x]\subseteq U`$ であり, $`\mathcal F`$ は Cauchy である.

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
    \Psi\coloneqq\left\{\bigwedge_{i=0}^{n}\mathcal{G}_i\mathrel{}\middle|\mathrel{}\mathcal{G}_0,\ldots,\mathcal{G}_n\in\Phi,(n=0,1,2,\ldots)\right\}
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
:   近縁 $`U`$ ごとの球被覆 $`\{U[x]\mid x\in X\}`$ は被覆である.
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

---

## ゲージ空間

一つの距離ではなく, 複数の擬距離を同時に用いると, 一様構造を数値的に記述できる場合がある.
ゲージ空間と準ゲージ空間は, 対称性を持つ一様構造と対称性を仮定しない準一様構造を距離族で表す.

**集合 $`X`$ 上の準擬距離** (*quasi-pseudometric on a set $`X`$*) とは, 写像 $`d:X\times X\to\mathbb{R}`$ であって, 次の条件を満たすときいう:
- 任意の $`x,y\in X`$ に対して $`d(x,y)\geq 0`$.
- 任意の $`x\in X`$ に対して $`d(x,x)=0`$.
- 任意の $`x,y,z\in X`$ に対して $`d(x,y)+d(y,z)\geq d(x,z)`$.

集合 $`X`$ と $`X`$ 上の準擬距離 $`d`$ の組 $`(X,d)`$ を **準擬距離空間** (*quasi-pseudometric space*) という.
特に, 各 $`x,y\in X`$ に対して $`d(x,y)=d(y,x)`$ となるような準擬距離 $`d`$ を **$`X`$ 上の擬距離** (*pseudometric on $`X`$*) といい, 集合 $`X`$ と $`X`$ 上の擬距離 $`d`$ の組 $`(X,d)`$ を **擬距離空間** (*pseudometric space*) という.

Definition. **準ゲージ空間**
:    **集合 $`X`$ の準ゲージ** (quasi-gauge on a set $`X`$) を $`X`$ 上の準擬距離の集合のこととして定義し, 集合 $`X`$ と $`X`$ の準ゲージ $`D`$ の組 $`(X,D)`$ を **準ゲージ空間** (*quasi-gauge space*) という.
    同様にして, $`X`$ 上の擬距離の集合を $`X`$ のゲージ (*gauge on $`X`$*) と呼び, 集合 $`X`$ と $`X`$ のゲージ $`D`$ の組 $`(X,D)`$ を **ゲージ空間** (*gauge space*) という.

Definition. **準近縁系**
:   **集合 $`X`$ 上の準近縁系** (*quasi-entourage system on a set $`X`$*) とは, $`X`$ 上の二項関係の族 $`\mathbf{E}`$ であって次の条件を満たすときいう:
    - $`\mathbf{E}`$ は $`X\times X`$ 上のフィルターである.
    - 任意の $`U\in\mathbf{E}`$ に対して $`\Delta(X)\subseteq U`$.
    - 任意の $`U\in\mathbf{E}`$ に対して $`V\circ V\subseteq U`$ を満たす $`V\in\mathbf{E}`$ が存在する.

Theorem.
:   すべての位相空間は準一様化可能である.

<u>proof.</u>
:   位相空間 $`X`$ の各開集合 $`G`$ に対して
    ```math
    U_G\coloneqq(G\times G)\cup((X\setminus G)\times X)
    ```
    とおく.
    有限個のこの形の関係の共通部分で生成されるフィルターを $`\mathbf E`$ とする.
    対角は各 $`U_G`$ に含まれ, また $`U_G\circ U_G\subseteq U_G`$ であるから, $`\mathbf E`$ は準近縁系である.
    $`x\in G`$ なら $`U_G[x]=G`$ であるため, この準近縁系が誘導する位相は元の位相以上に細かい.
    一方, 有限交叉に対応する近縁球はいずれも開集合であるから逆の包含も成り立つ.
    よって元の位相が再現される.

Theorem. 準擬距離と準近縁系の両立
:   集合 $`X`$ と $`X`$ 上の準擬距離 $`d`$ と $`X`$ 上の準近縁系 $`\mathbf{E}`$ に対して, 以下同値.
    1. $`d`$ は $`(X,\mathbf{E})\times(X,\mathbf{E})`$ 上の一様連続写像となる.
    2. 任意の $`r>0`$ に対して $`d^{-1}([0,r))=\{(x,y)\in X\times X\mid d(x,y)<r\}\in\mathbf{E}`$.

<u>proof.</u>
:   実数の近縁基を $`\{(s,t)\mid |s-t|<r\}`$ として考える.
    準擬距離の三角不等式により, $`d`$ の値が十分小さく変わるようにすることは, 各部分距離集合 $`d^{-1}([0,r))`$ が近縁であることと同値である.
    したがって直積から実数への一様連続性の逆像条件は (2) に正確に一致する.

Theorem. **準ゲージの定める準近縁系**
:   集合 $`X`$ の準ゲージ $`D`$ に対して,
    ```math
    \{d^{-1}([0,r))\mid d\in D,\ r>0\}
    ```
    は準近縁系の準基となる. この準近縁系の準基の生成する準近縁系を **準ゲージ $`D`$ の生成する準近縁系** という.

<u>proof.</u>
:   有限個の条件 $`d_i(x,y)<r_i`$ の共通部分は, $`r=\min_i r_i/2`$ とすれば各条件を二回合成しても保つ.
    実際, $`d_i(x,z)\leq d_i(x,y)+d_i(y,z)<r_i`$ である.
    各関係は対角を含み, 有限交叉と上方閉包を取ればフィルターになる.
    よって準近縁系の公理がすべて満たされる.

準近縁系の準基の生成する準近縁系の定義から, 準ゲージ $`D`$ の生成する準近縁系 $`\mathbf{E}`$ は各 $`d\in D`$ が $`(X,\mathbf{E})\times(X,\mathbf{E})`$ 上の一様連続写像となるもののうち最も弱いものである.

Theorem. **準近縁系の定める準ゲージ**
:   集合 $`X`$ 上の準近縁系 $`\mathbf{E}`$ に対して, $`X`$ 上の準擬距離 $`d`$ として直積一様空間 $`(X,\mathbf{E})\times(X,\mathbf{E})`$ 上の一様連続なもの全体を $`D`$ とすると, $`D`$ は $`X`$ 上の準ゲージであって, $`D`$ によって定まる準近縁系は $`\mathbf{E}`$ と一致する. これを **準近縁系 $`\mathbf{E}`$ の生成する準ゲージ** という.

<u>proof.</u>
:   $`d`$ が一様連続なら, 直前の定理からその各距離球は $`\mathbf E`$ に属する.
    従って $`D`$ の生成する準近縁系は $`\mathbf E`$ より粗い.
    逆に $`U\in\mathbf E`$ をとり, $`V_{n+1}\circ V_{n+1}\circ V_{n+1}\subseteq V_n`$ かつ $`V_0\subseteq U`$ となる近縁列を選ぶ.
    この列から鎖の重みの下限を取る標準的な準擬距離化構成により, 一様連続な準擬距離 $`d_U`$ で $`\{d_U<1\}\subseteq U`$ を得る.
    したがって各 $`U`$ は $`D`$ の距離球を含み, 逆の細分関係も成り立つ.

---

## 列型空間

点列は収束を扱いやすいが, 一般の位相空間では点列だけで閉集合や連続性を検出できない.
列型空間は, 点列による収束が位相を完全に決定する空間を切り出し, 距離空間との関係を明確にする.

位相空間 $`X`$ の部分集合 $`F`$ が **点列閉** (*sequentially closed*) であるとは, $`F`$ 内の任意の収束点列 $`(p_n)`$ の任意の極限点 $`x`$ に対して $`x\in F`$ が成り立つときいう. 補集合が点列閉となる集合を **点列開** (*sequentially open*) であるという.

Proposition.
:   位相空間 $`X`$ の部分集合 $`G`$ が点列開であることと, 次が同値:
    - $`X`$ の任意の収束点列 $`(p_n)`$ に対して, $`(p_n)`$ の極限点が $`G`$ に含まれるならば, ある非負整数 $`N\geq 0`$ が存在して $`n\geq N`$ なる整数 $`n`$ に対して $`p_n\in G`$ となる.

<u>proof.</u>
:   $`G`$ が点列開であることは $`X\setminus G`$ が点列閉であることと同値である.
    これは, $`p_n\to p\in G`$ であって無限個の項が $`X\setminus G`$ に属するなら, それらを抜き出した部分列が $`p`$ に収束して点列閉性に矛盾することと同値である.
    部分列を抜き出せないことは, ある段階以後すべての項が $`G`$ に属することに等しい.

Proposition.
:   位相空間 $`X`$ において, 開集合は点列開であり閉集合は点列閉である.

<u>proof.</u>
:   開集合 $`G`$ と $`G`$ に収束する点列 $`(p_n)`$ をとる.
    極限 $`p`$ は $`G`$ に属し, $`G`$ は $`p`$ の近傍である.
    収束の定義から, ある $`N`$ が存在して $`n\geq N`$ ならば $`p_n\in G`$ となる.
    よって $`G`$ は点列開である.
    補集合をとると, 閉集合は点列閉である.

Definition.
:   位相空間 $`X`$ が **列型空間** (*sequential space*) であるとは, 任意の点列開集合が開となるときいう.

Proposition.
:   位相空間 $`X`$ が列型空間であることと, 任意の点列閉集合が閉であることは同値である.

<u>proof.</u>
:   部分集合 $`F\subseteq X`$ が点列閉であることは, 補集合 $`X\setminus F`$ が点列開であることと同値である.
    同様に $`F`$ が閉であることは, $`X\setminus F`$ が開であることと同値である.
    したがって「任意の点列開集合が開である」という列型空間の定義は, 「任意の点列閉集合が閉である」という条件と同値である.

第一可算空間は列型空間であるが, 第一可算でない列型空間も存在する.

補可算位相を備えた非可算集合は列型でない空間の例であり, しばしば非可算集合上の補可算位相は列離散 (sequentially discrete) であるといわれる.

Proposition. **列型空間の特徴づけ**
:   位相空間 $`X`$ に対して以下同値:
    1. $`X`$ は列型空間である.
    2. $`X`$ は第一可算空間の商である.
    3. $`X`$ は距離空間の商である.
    4. 任意の $`Y`$ と写像 $`f:X\to Y`$ に対して, $`f`$ が連続写像となることと $`x\in X`$ に収束する点列 $`(p_n)`$ に対して $`Y`$ の点列 $`(f(p_n))`$ は必ず $`f(x)`$ へ収束することは同値である.

<u>proof.</u>
:   (3)$`\Rightarrow`$(2) は距離空間が第一可算であることから従う.
    第一可算空間では閉包の各点をそこへ収束する点列で検出できるので, 商写像の像では点列閉集合が閉集合となる.
    したがって (2)$`\Rightarrow`$(1) である.
    (1)$`\Rightarrow`$(3) は Franklin の構成による.
    $`X`$ のすべての収束点列を互いに素な収束列のコピーとして取り, その余積空間から極限と各項を元の点へ送る写像を考える.
    この余積空間は距離化可能であり, $`X`$ が列型であることはこの写像が商写像となることと同値である.
    最後に, 連続写像は点列の極限を保つ.
    逆に点列の極限をすべて保つ写像 $`f`$ に対し, $`f^{-1}(F)`$ は任意の閉集合 $`F\subseteq Y`$ について点列閉である.
    (1) によりこれは閉集合なので $`f`$ は連続であり, (4) が従う.

位相空間 $`X`$ の部分集合 $`S`$ に対して, $`S`$ 内の収束点列の極限点の全体を $`[S]_{\text{seq}}`$ とすることで写像 $`[-]_{\text{seq}}:2^X\to 2^X`$ とすると, 次を満たす:
- $`A\subseteq[A]_{\text{seq}}\subseteq\overline{A}`$.
- $`[\emptyset]_{\text{seq}}=\emptyset`$.
- $`[A\cup B]_{\text{seq}}=[A]_{\text{seq}}\cup[B]_{\text{seq}}`$.

特に, 任意の部分集合 $`S`$ に対して $`[S]_{\text{seq}}=\overline{S}`$ が成り立つような位相空間を **Fréchet–Urysohn 空間** (*Fréchet–Urysohn space*) という.

Fréchet–Urysohn 空間と遺伝的列型空間は同値となる. 特に, 第一可算空間は Fréchet–Urysohn 空間である.

列型空間の圏 $`\mathbf{Seq}`$ を位相空間の圏 $`\mathbf{Top}`$ の充満部分圏として定めると, $`\mathbf{Seq}`$ は $`\mathbf{Top}`$ における余積と商について閉じていることから $`\mathbf{Top}`$ の余反射的部分圏であり, 特に距離化可能空間の圏の余反射包 (すなわち, 距離か可能空間の圏を部分圏として含み, 余積と商について閉じているような位相空間のクラスのうち最も小さいもの) となる.
$`\mathbf{Seq}`$ は $`\mathbf{Top}`$ とは異なる積を持ち, それにより Cartesian 閉圏となる.

---

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
:   集合 $`X`$ の被覆列 $`(\mathbf{U}_n\mid n=1,2,\ldots)`$ が **正規被覆列** (*normal sequence of covers*) であるとは, 各 $`n`$ に対して
    ```math
    \mathbf{U}_{n+1}\leq^\ast\mathbf{U}_n
    ```
    が成り立つときいう. また, 位相空間 $`X`$ の開被覆 $`\mathbf{U}`$ が **正規** (*normal*) であるとは, $`\mathbf{U}_1\leq\mathbf{U}`$ を満たす正規開被覆列 $`(\mathbf{U}_n\mid n=1,2,\ldots)`$ が存在する時いい, 正規な開被覆を **正規被覆** (*normal covering*) という.

$`\mathbf{U}^\varDelta\leq\mathbf{U}^\ast`$ より
```math
\mathbf{U}\leq^\ast\mathbf{V}\Rightarrow\mathbf{U}\leq^\varDelta\mathbf{V}
```
なため正規被覆列 $`(\mathbf{U}_n\mid n=1,2,\ldots)`$ は各 $`n`$ に対して
```math
\mathbf{U}_{n+1}\leq^\varDelta\mathbf{U}_n
```
を満たす.
また次の命題により, 上記のような条件を満たす被覆列から正規被覆列を取り出すこともできる.

Proposition.
:   集合 $`X`$ の被覆列 $`(\mathbf{U}_n\mid n=1,2,\ldots)`$ が各 $`n`$ に対して
    ```math
    \mathbf{U}_{n+1}\leq^\varDelta\mathbf{U}_n
    ```
    を満たすとき, 被覆列 $`(\mathbf{U}_{2n}\mid n=1,2,\ldots)`$ は正規被覆列となる.

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
:   集合 $`X`$ の正規被覆列 $`(\mathbf{U}_n\mid n=1,2,\ldots)`$ に対して, $`X`$ 上の擬距離 $`d`$ として次を満たすものが存在する:
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

---

## Baire 空間とカテゴリー

痩集合は可算個の閉疎集合の和として表される, 位相的に小さい部分集合である.
Baire のカテゴリー定理は, 完備性または局所コンパクト性があれば空間全体をそのような集合で尽くせないことを示す.

### Baire 性の定義と特徴づけ

Definition. **Baire 空間**
:   位相空間 $`X`$ が **Baire 空間** (*Baire space*) であるとは, $`X`$ の任意の可算個の稠密開集合 $`G_0,G_1,\ldots`$ に対して
    ```math
    \bigcap_{n=0}^{\infty}G_n
    ```
    が稠密であるときいう.

Proposition. **Baire 性の特徴づけ**
:   位相空間 $`X`$ に対して, 以下は同値である.
    1. $`X`$ は Baire 空間である.
    2. $`X`$ の空でない開集合は痩集合でない.
    3. $`X`$ の任意の可算個の閉疎集合の和集合は内点を持たない.

<u>proof.</u>
:   $`(1)\Rightarrow(2)`$ を示す.
    空でない開集合 $`O`$ が $`O\subseteq\bigcup_n F_n`$ を満たす閉疎集合列 $`(F_n)`$ をもつと仮定する.
    $`G_n=X\setminus F_n`$ は稠密開集合であるから, Baire 性より $`\bigcap_nG_n`$ は稠密である.
    これは空でない開集合 $`O`$ と交わるが, $`O\subseteq\bigcup_nF_n`$ に反する.

    $`(2)\Rightarrow(3)`$ を示す.
    $`\bigcup_nF_n`$ が内点を持つなら, その内部は空でない開集合であり可算個の閉疎集合の合併の部分集合である.
    痩集合の部分集合も痩集合なので, 条件 2 に矛盾する.

    $`(3)\Rightarrow(1)`$ を示す.
    稠密開集合列 $`(G_n)`$ に対し $`F_n=X\setminus G_n`$ とおく.
    各 $`F_n`$ は閉であり, $`G_n`$ の稠密性から内点を持たないので閉疎である.
    条件 3 により $`\bigcup_nF_n`$ は内点を持たない.
    その補集合 $`\bigcap_nG_n`$ は稠密であり, $`X`$ は Baire 空間である.

### Baire のカテゴリー定理

Theorem. **完備距離空間の Baire 性**
:   完備距離空間は Baire 空間である.

<u>proof.</u>
:   完備距離空間 $`X`$ の稠密開集合列 $`(G_n)_{n\geq0}`$ と空でない開集合 $`O`$ をとる.
    $`O\cap G_0`$ は空でない開集合であるから, その閉包が $`O\cap G_0`$ に含まれ, 半径が $`1`$ 未満である閉球 $`K_0`$ を選べる.
    帰納的に, $`K_n`$ を選んだとする.
    $`\operatorname{int}(K_n)\cap G_{n+1}`$ は空でない開集合であるから, その閉包がこれに含まれ, 半径が $`2^{-n-1}`$ 未満である閉球 $`K_{n+1}`$ を選べる.
    この構成により
    ```math
    K_{n+1}\subseteq K_n\cap G_{n+1}
    ```
    であり, $`K_n`$ の半径は $`0`$ に収束する.

    各 $`K_n`$ の中心を $`x_n`$ とする.
    列 $`(x_n)`$ は Cauchy 列であるから, 完備性によりある $`x\in X`$ に収束する.
    任意の $`n`$ に対して列の後尾は $`K_n`$ に含まれ, $`K_n`$ は閉であるから $`x\in K_n`$ である.
    したがって $`x\in O\cap\bigcap_{n\geq0}G_n`$ である.
    任意の空でない開集合 $`O`$ がこの共通部分と交わるので, $`\bigcap_{n\geq0}G_n`$ は稠密である.

### 局所コンパクト空間の Baire 性

Theorem. **局所コンパクト空間の Baire 性**
:   局所コンパクト Hausdorff 空間は Baire 空間である.

<u>proof.</u>
:   稠密開集合列 $`(G_n)_{n\geq0}`$ と空でない開集合 $`O`$ をとる.
    局所コンパクト性の近傍による特徴づけから, 空でない開集合の内部にコンパクトな閉包を持つ非空開集合を選べる.
    これを $`O\cap G_0`$ に適用して, 非空開集合 $`V_0`$ で $`\overline{V_0}\subseteq O\cap G_0`$ かつ $`\overline{V_0}`$ がコンパクトなものを選ぶ.
    帰納的に $`V_n`$ を選んだ後, $`V_n\cap G_{n+1}`$ に同じ性質を適用して
    ```math
    \overline{V_{n+1}}\subseteq V_n\cap G_{n+1}
    ```
    となる非空開集合 $`V_{n+1}`$ を選ぶ.

    コンパクト集合 $`\overline{V_0}`$ の閉部分集合列 $`\overline{V_n}`$ は有限交叉性を持つ.
    よってコンパクト性から $`\bigcap_{n\geq0}\overline{V_n}\neq\emptyset`$ である.
    この共通部分の任意の点は $`O`$ と全ての $`G_n`$ に属する.
    よって $`\bigcap_{n\geq0}G_n`$ は稠密である.

### 例

Example. **有理数全体は Baire 空間でない**
:   有理数全体 $`\mathbb{Q}`$ は可算であり, 各一点集合は $`\mathbb{Q}`$ で閉かつ内点を持たない.
    したがって $`\mathbb{Q}`$ は可算個の閉疎集合の和集合であり, Baire 空間ではない.

Remark.
:   Baire のカテゴリー定理における「小さい」は測度 $`0`$ とは異なる.
    たとえば実数全体の有理数部分集合は可算で測度 $`0`$ かつ痩集合であるが, 一般には二つの概念は一致しない.

---

## コンパクト化

局所コンパクト Hausdorff 空間では一点コンパクト化を構成でき, Tychonoff 空間では Stone-Čech コンパクト化が有界連続関数の延長を特徴づける.

### 一点コンパクト化

Definition. **一点コンパクト化**
:   非コンパクトな局所コンパクト Hausdorff 空間 $`X`$ と $`X`$ に属さない一点 $`\infty`$ に対して,
    ```math
    X^+\coloneqq X\sqcup\{\infty\}
    ```
    とおく.
    $`U\subseteq X^+`$ が開であるとは, $`U\cap X`$ が $`X`$ で開であり, かつ $`\infty\in U`$ ならば $`X\setminus(U\cap X)`$ がコンパクトであることとする.
    この位相空間 $`X^+`$ を $`X`$ の **一点コンパクト化** (*one-point compactification*) という.

Theorem. **一点コンパクト化の性質**
:   $`X^+`$ はコンパクト Hausdorff 空間である.
    $`X`$ は $`X^+`$ の稠密な開部分空間であり, $`X^+\setminus X=\{\infty\}`$ である.

<u>proof.</u>
:   $`X^+`$ の開被覆をとり, $`\infty`$ を含む被覆要素を $`U`$ とする.
    定義から $`K=X\setminus(U\cap X)`$ はコンパクトである.
    被覆の残りは $`K`$ の開被覆を与えるので, 有限部分被覆を持つ.
    これに $`U`$ を加えると $`X^+`$ の有限部分被覆となる.
    よって $`X^+`$ はコンパクトである.

    $`X`$ の異なる二点は $`X`$ の Hausdorff 性により $`X^+`$ においても分離できる.
    $`x\in X`$ に対して, 局所コンパクト性から $`x\in V\subseteq K`$ を満たす開集合 $`V\subseteq X`$ とコンパクト集合 $`K\subseteq X`$ を選べる.
    $`V`$ と $`X^+\setminus K`$ はそれぞれ $`x`$ と $`\infty`$ の交わらない開近傍である.
    よって $`X^+`$ は Hausdorff である.

    $`X=X^+\setminus\{\infty\}`$ であることは集合の構成から従う.
    $`X`$ は定義により開集合である.
    $`\infty`$ の任意の近傍 $`U`$ が $`X`$ と交わらないとすると $`U=\{\infty\}`$ となり, 定義から $`X`$ はコンパクトとなる.
    これは仮定に反する.
    よって $`X`$ は $`X^+`$ に稠密である.

Theorem. **一点コンパクト化の一意性**
:   コンパクト Hausdorff 空間 $`K`$ が $`X`$ を稠密な開部分空間として含み, $`K\setminus X`$ が一点からなるならば, $`K`$ は $`X^+`$ と $`X`$ 上恒等な同相写像によって同相である.

<u>proof.</u>
:   $`K\setminus X=\{p\}`$ とおく.
    写像 $`h:X^+\to K`$ を $`x\in X`$ では $`h(x)=x`$, $`h(\infty)=p`$ と定める.
    これは全単射であり, $`X`$ 上では恒等写像である.
    $`X`$ 上での連続性は仮定から明らかである.
    $`p`$ の開近傍 $`W\subseteq K`$ をとると, $`K\setminus W`$ はコンパクトであり $`X`$ に含まれる.
    したがって $`h^{-1}(W)`$ は $`\infty`$ を含み, その $`X`$ における補集合はコンパクトである.
    一点コンパクト化の定義から $`h^{-1}(W)`$ は開である.
    よって $`h`$ は連続である.
    $`X^+`$ はコンパクトで $`K`$ は Hausdorff なので, 連続全単射 $`h`$ は同相写像である.
    $`X`$ 上恒等であるような写像は $`\infty`$ の像も $`p`$ に限られるから, この同相写像は一意である.

Example.
:   $`\mathbb{R}^n`$ の一点コンパクト化は $`n`$ 次元球面 $`S^n`$ と同相である.
    立体射影がこの同相を与える.

### Stone-Čech コンパクト化

Definition. **Stone-Čech コンパクト化**
:   Tychonoff 空間 $`X`$ の **Stone-Čech コンパクト化** とは, コンパクト Hausdorff 空間 $`\beta X`$ と稠密埋め込み $`\iota:X\to\beta X`$ の組であって, 任意のコンパクト Hausdorff 空間 $`K`$ と連続写像 $`f:X\to K`$ に対して, 連続写像 $`\overline{f}:\beta X\to K`$ が一意に存在して
    ```math
    \overline{f}\circ\iota=f
    ```
    を満たすものをいう.

Theorem. **Stone-Čech コンパクト化の存在と一意性**
:   任意の Tychonoff 空間は Stone-Čech コンパクト化を持つ.
    Stone-Čech コンパクト化は $`X`$ 上恒等な同相写像を除いて一意である.

<u>proof.</u>
:   存在については, $`X`$ から $`[0,1]`$ への連続写像全体を添字とする積空間への評価写像を用いる.
    Tychonoff 性によりこの評価写像は埋め込みであり, その像の閉包は Tychonoff の定理によりコンパクト Hausdorff である.
    各座標関数の延長から, この閉包は Stone-Čech の普遍性を満たす.

    一意性を示す.
    $`(\beta X,\iota)`$ と $`(\beta'X,\iota')`$ を二つの Stone-Čech コンパクト化とする.
    普遍性を $`\iota':X\to\beta'X`$ に適用すると, 連続写像 $`F:\beta X\to\beta'X`$ で $`F\circ\iota=\iota'`$ を満たすものが一意に存在する.
    同様に連続写像 $`G:\beta'X\to\beta X`$ で $`G\circ\iota'=\iota`$ を満たすものが一意に存在する.
    $`G\circ F`$ と恒等写像は稠密部分集合 $`\iota(X)`$ 上で一致する.
    値域 $`\beta X`$ は Hausdorff であるから, 連続写像の一致集合は閉であり, 稠密性から $`G\circ F=\operatorname{id}_{\beta X}`$ となる.
    同様に $`F\circ G=\operatorname{id}_{\beta'X}`$ である.
    よって $`F`$ は $`X`$ 上恒等な同相写像であり, その一意性も普遍性から従う.

Proposition. **有界実数値関数による特徴づけ**
:   Tychonoff 空間 $`X`$ のコンパクト化 $`\iota:X\to K`$ が Stone-Čech コンパクト化であるための必要十分条件は, 任意の連続写像 $`f:X\to[0,1]`$ が $`K`$ 上の連続写像へ一意に延長できることである.

<u>proof.</u>
:   $`K=\beta X`$ が Stone-Čech コンパクト化なら, $`[0,1]`$ はコンパクト Hausdorff 空間であるから普遍性を適用できる.
    したがって各 $`f:X\to[0,1]`$ は連続写像 $`\overline f:\beta X\to[0,1]`$ へ延長される.
    二つの延長は稠密部分集合 $`X`$ 上で一致し, 値域が Hausdorff なので一致する.

    逆にこの延長性を仮定する.
    任意のコンパクト Hausdorff 空間 $`Y`$ と連続写像 $`g:X\to Y`$ をとる.
    コンパクト Hausdorff 空間は Tychonoff 空間なので, $`Y`$ はその $`[0,1]`$ 値連続関数全体による評価写像
    ```math
    e:Y\longrightarrow[0,1]^{C(Y,[0,1])}
    ```
    で埋め込まれる.
    各座標 $`h\circ g:X\to[0,1]`$ は仮定により $`K`$ 上へ一意に延長される.
    それらを並べると連続写像 $`G:K\to[0,1]^{C(Y,[0,1])}`$ が得られ, $`G\circ\iota=e\circ g`$ である.
    $`e(Y)`$ はコンパクトゆえ閉であり, $`G^{-1}(e(Y))`$ は稠密集合 $`\iota(X)`$ を含む閉集合であるから $`K`$ 全体である.
    従って $`G`$ は $`e(Y)`$ に値を持ち, $`e^{-1}\circ G:K\to Y`$ が $`g`$ の連続延長となる.
    稠密性によりこの延長は一意であるので, $`K`$ は Stone-Čech コンパクト化の普遍性を満たす.

Remark.
:   一点コンパクト化は余剰点を一つだけ加える最小の形のコンパクト化である.
    Stone-Čech コンパクト化は有界連続関数をすべて延長できるという普遍性によって定まり, 一般には一点コンパクト化より大きい.

---

Theorem. **分割の一の存在定理**
:   パラコンパクト Hausdorff 空間の任意の開被覆には従属する分割の一が存在する.

<u>proof.</u>
:   開被覆 $`\mathcal{U}`$ をとる.
    パラコンパクト Hausdorff 空間は正規である.
    縮小補題を二度適用し, X を被覆する局所有限な開族 $`(W_i)_{i\in I}`$ と開族 $`(V_i)_{i\in I}`$ および $`U_i\in\mathcal{U}`$ を
    ```math
    \overline{W_i}\subseteq V_i,\qquad \overline{V_i}\subseteq U_i
    ```
    となるように選ぶ.

    Urysohn の補題から, 各 $`i`$ に対して連続写像 $`\psi_i:X\to[0,1]`$ を
    ```math
    \psi_i|_{\overline{W_i}}=1,\qquad \psi_i|_{X\setminus V_i}=0
    ```
    となるように選べる.
    このとき $`\operatorname{supp}\psi_i\subseteq\overline{V_i}\subseteq U_i`$ であり, 必要な従属性が得られる.
    支持の族は局所有限であるから, 各点の近傍では有限個の $`\psi_i`$ だけが非零である.
    したがって
    ```math
    \psi(x)\coloneqq\sum_{i\in I}\psi_i(x)
    ```
    は連続である.
    $`(V_i)`$ が被覆であることから $`\psi(x)>0`$ が全ての $`x\in X`$ で成り立つ.

    $`\varphi_i(x)=\psi_i(x)/\psi(x)`$ とおく.
    この族は局所有限であり, 各 $`\operatorname{supp}\varphi_i`$ は $`U_i`$ に含まれる.
    さらに各点で $`\sum_i\varphi_i(x)=1`$ である.
    よって $`(\varphi_i)_{i\in I}`$ は $`\mathcal{U}`$ に従属する分割の一である.

Remark.
:   局所有限性により, 各点の近傍では上の和の非零項が有限個しかない.
    そのため分割の一は局所的な連続関数を一つの連続関数へ貼り合わせる道具になる.

---

## 古典的な例と発展的な定理

この節では, 一般位相で用いられる古典的な例と, 一般化された距離化定理および積空間の定理をまとめる.
以下でいう Arhangel'skii の空間は単独の通称ではなく, 外延基, 弱基, p 空間, 点可算型などを用いて定義される空間の総称として扱う.

### Sorgenfrey 直線と Michael 直線

Definition. **Sorgenfrey 直線**
:   実数集合に半開区間 [a,b) を基底として生成される位相を Sorgenfrey 位相といい, この空間を **Sorgenfrey 直線** (*Sorgenfrey line*) $`\mathbb S`$ と表す.

Proposition. **Sorgenfrey 直線の性質**
:   $`\mathbb S`$ は Hausdorff, 正則, 第一可算, 可分, Lindelöf かつパラコンパクトであるが, 第二可算でも距離化可能でもない.
    Sorgenfrey 平面 $`\mathbb S\times\mathbb S`$ は Lindelöf でない.

<u>proof.</u>
:   $`[x,x+1/n)`$ は $`x`$ の可算近傍基を与え, 有理数全体は稠密である.
    半開区間の端点を用いる分離構成から Hausdorff 性と正則性が得られる.
    第二可算性を仮定すると半開区間の左端点を可算個で検出できることに矛盾し, 可分距離空間が第二可算であることから距離化可能性も否定される.
    平面の非 Lindelöf 性は $`{(x,-x)\mid x\in\mathbb R}`$ が閉かつ離散であることから従う.[^sorgenfrey]

Definition. **Michael 直線**
:   実数集合に通常の開区間と無理数の一点集合を生成元として生成される位相を入れた空間を **Michael 直線** (*Michael line*) $`\mathbb M`$ という.

Remark.
:   Michael 直線では有理数点は通常の近傍を持ち, 無理数点は孤立点である.
    この差により, 個々の空間の性質と $`\mathbb M`$ を因子とする積空間の Lindelöf 性や正規性が異なる振る舞いを示す.[^michael]

### Smirnov の距離化定理

Theorem. **Smirnov の距離化定理**
:   位相空間 $`X`$ が距離化可能であることと, $`X`$ がパラコンパクト Hausdorff 空間であり, 各点が距離化可能な部分空間を含む近傍を持つことは同値である.

<u>proof.</u>
:   逆方向では, 局所距離化可能な近傍の開被覆を局所有限細分し, 各細分上の距離を分割の一で組み合わせる.
    得られた擬距離は Hausdorff 性により距離となり, 元の位相を生成する.[^smirnov-metrization]

### 可縮空間

Definition. **ホモトピー**
:   位相空間 $`X,Y`$ と連続写像 $`f,g:X\to Y`$ に対して, 連続写像 $`H:X\times[0,1]\to Y`$ が $`H(x,0)=f(x)`$ および $`H(x,1)=g(x)`$ を満たすとき, $`H`$ を $`f`$ から $`g`$ への **ホモトピー** (*homotopy*) といい, $`f\simeq g`$ と表す.

Definition. **可縮空間**
:   位相空間 $`X`$ が **可縮** (*contractible*) であるとは, ある点 $`x_0\in X`$ に対して恒等写像 $`\operatorname{id}_X`$ と定値写像 $`c_{x_0}:X\to X`$ がホモトピックであるときいう.
    すなわち, 連続写像 $`H:X\times[0,1]\to X`$ で $`H(x,0)=x`$ および $`H(x,1)=x_0`$ を満たすものが存在する.

Proposition. **可縮性の特徴づけ**
:   位相空間 $`X`$ が可縮であることと, $`X`$ が一点空間とホモトピー同値であることは同値である.

<u>proof.</u>
:   可縮性を与えるホモトピーと, 点の包含写像 $`i:\{*\}\to X`$ および定値写像 $`c:X\to\{*\}`$ をとる.
    $`c\circ i`$ は一点空間の恒等写像に一致し, $`i\circ c`$ は $`\operatorname{id}_X`$ とホモトピックである.
    逆に, 一点空間とのホモトピー同値から $`\operatorname{id}_X`$ と定値写像のホモトピーが得られる.

Proposition. **可縮空間の基本例**
:   凸集合 $`C`$ を実ベクトル空間の部分空間とみなすと, $`C`$ は可縮である.
    特に, $`\mathbb R^n`$, 開球, 閉球, および任意の星型集合は可縮である.

<u>proof.</u>
:   $`x_0\in C`$ をとる.
    凸性から $`H(x,t)=(1-t)x+tx_0`$ は $`C`$ に値を持つ連続写像であり, $`H(x,0)=x`$ および $`H(x,1)=x_0`$ を満たす.
    星型集合の場合も, 星の中心を $`x_0`$ とすれば同じ式で証明できる.

Proposition. **可縮空間の積**
:   可縮空間 $`X,Y`$ の積空間 $`X\times Y`$ は可縮である.

<u>proof.</u>
:   $`H_X`$ と $`H_Y`$ をそれぞれの可縮性を与えるホモトピーとする.
    このとき $`H((x,y),t)=(H_X(x,t),H_Y(y,t))`$ は $`X\times Y`$ から $`(x_0,y_0)`$ へのホモトピーを与える.

### Arhangel'skii の空間

Definition. **外延基**
:   $`A\subseteq X`$ に対する $`X`$ の開集合族 $`\mathcal E`$ が **外延基** (*external base*) であるとは, 任意の相対開集合 $`U\subseteq A`$ と $`x\in U`$ に対して $`x\in E`$ かつ $`E\cap A\subseteq U`$ を満たす $`E\in\mathcal E`$ が存在することをいう.

Definition. **弱基**
:   $`\mathcal B=\bigcup_{x\in X}\mathcal B_x`$ が **弱基** (*weak base*) であるとは, 各 $`\mathcal B_x`$ が $`x`$ を含み有限交叉で閉じ, $`U`$ が開であることと「各 $`x\in U`$ に対して $`x\in B\subseteq U`$ を満たす $`B\in\mathcal B_x`$ が存在すること」が同値となることをいう.

Definition. **点可算型**
:   Tychonoff 空間 $`X`$ が **点可算型** (*point-countable type*) であるとは, 各 $`x\in X`$ が, $`X`$ において可算な文字を持つコンパクト部分空間 $`K`$ に含まれるときいう.

Theorem. **Arhangel'skii の外延基定理**
:   点可算型の空間では, 各点を含む可算文字のコンパクト部分空間が存在する.
    コンパクト空間, 第一可算空間, 局所コンパクト空間, および Arhangel'skii の p 空間は点可算型である.[^point-countable-type]

Definition. **Arhangel'skii の p 空間**
:   Tychonoff 空間 $`X`$ が **p 空間** (*p-space*) であるとは, あるコンパクト化における可算個の開集合の閉包の交叉が $`X`$ の各点の近傍として振る舞う可算交叉条件を満たすときいう.

Theorem. **Arhangel'skii の p 空間定理**
:   パラコンパクト Tychonoff 空間 $`X`$ が p 空間であることと, $`X`$ が距離空間への perfect 写像を持つことは同値である.[^arhangelskii-p]

### Borges--Okuyama の定理

Definition. **M 空間**
:   $`X`$ が **M 空間** (*M-space*) であるとは, 開被覆列 $`(\mathcal U_n)`$ が存在し, 各 $`x_n\in\operatorname{St}(x,\mathcal U_n)`$ を選んだ列が常に集積点を持つときいう.

Definition. **G_delta 対角線**
:   対角線 $`\Delta_X=\{(x,x)\mid x\in X\}`$ が $`X\times X`$ の可算個の開集合の共通部分であるとき, $`X`$ は G_delta 対角線を持つという.

Theorem. **Borges--Okuyama の距離化定理**
:   $`X`$ が距離化可能であることと, $`X`$ がパラコンパクト M 空間であり G_delta 対角線を持つことは同値である.

<u>proof.</u>
:   M 空間の被覆列と G_delta 対角線を表す開集合列を組み合わせ, 点を分離する可算開被覆列を構成する.
    パラコンパクト性により局所有限細分をとり, Nagata--Smirnov 型の距離化構成を適用する.[^borges-okuyama]

### Morita 空間と積の正規性

Definition. **Morita 空間**
:   正規空間 $`X`$ が **Morita 空間** であるとは, 任意の距離空間 $`Y`$ に対して $`X\times Y`$ が正規となるための Morita 型の被覆縮小条件を満たすことをいう.
    文献ではこの条件を正規 Morita P 空間と呼ぶ.

Theorem. **Morita の積定理**
:   正規 Morita P 空間 $`X`$ であることと, 任意の距離空間 $`Y`$ に対して $`X\times Y`$ が正規であることは同値である.[^morita]

### Whitehead 弱位相と Tamano の定理

Definition. **Whitehead 弱位相**
:   閉被覆 $`\mathcal F`$ に対し, $`A\subseteq X`$ が閉であることを「任意の $`F\in\mathcal F`$ について $`A\cap F`$ が $`F`$ で閉であること」として定める位相を Whitehead 弱位相という.
    閉包保存的な被覆が任意の部分族に対して同じ判定を与える場合を遺伝的弱位相, または Morita 弱位相という.

Theorem. **Tamano の定理**
:   Hausdorff 空間 $`X`$ について, $`X`$ がパラコンパクトであること, $`X`$ が Tychonoff で $`X\times\beta X`$ が正規であること, 任意のコンパクト Hausdorff 空間 $`K`$ に対して $`X\times K`$ が正規であることは同値である.

<u>proof.</u>
:   $`K=\beta X`$ をとることで一方向が得られる.
    逆方向は Stone--Čech コンパクト化の関数延長性と積空間の正規性から局所有限細分を構成する Tamano の議論による.[^tamano]

### Glicksberg の定理

Definition. **局所コンパクト可換群の弱位相**
:   局所コンパクト Hausdorff 可換群 $`G`$ の連続指標全体を $`\widehat G`$ とし, これらを連続にする最弱の群位相を $`G^+`$ と表す.

Theorem. **Glicksberg の定理**
:   局所コンパクト Hausdorff 可換群 $`G`$ の元の位相でコンパクトな部分集合と, 弱位相 $`G^+`$ でコンパクトな部分集合は一致する.[^glicksberg]

### Smirnov コンパクト化

Definition. **Smirnov コンパクト化**
:   分離一様空間 $`(X,\mathbf E)`$ の有界一様連続写像全体による評価写像の像の閉包を $`\mathbf E`$ に関する **Smirnov コンパクト化** (*Smirnov compactification*) と呼ぶ.
    すなわち $`X`$ を $`[0,1]^{\operatorname{BUC}(X,[0,1])}`$ に評価写像で埋め込み, その像の閉包をとる.

Theorem. **Smirnov コンパクト化の普遍性**
:   有界一様連続写像は Smirnov コンパクト化へ一意に連続延長する.
    Smirnov コンパクト化は, その一様構造に関してこの延長性を持つ最小のコンパクト化である.[^smirnov-compactification]

[^sorgenfrey]: J. R. Munkres, *Topology*, §17.
[^michael]: E. Michael, “The product of a normal space and a metric space”, *Bull. Amer. Math. Soc.* 54 (1948), 540--542.
[^smirnov-metrization]: Munkres, *Topology*, §42.
[^point-countable-type]: J. E. Vaughan, “Spaces of countable and point-countable type”, *Trans. Amer. Math. Soc.* 151 (1970), 341--351.
[^arhangelskii-p]: A. V. Arhangel'skii, “On a class of spaces containing all metric and all locally compact spaces”, *Mat. Sb.* 67 (1965), 55--88.
[^borges-okuyama]: C. R. Borges, “On stratifiable spaces”, *Pacific J. Math.* 17 (1966), 1--16; A. Okuyama, “On metrizability of M-spaces”, *Proc. Japan Acad.* 40 (1964), 176--179.
[^morita]: K. Morita, “Products of normal spaces with metric spaces”, *Math. Ann.* 154 (1964), 365--382.
[^tamano]: H. Tamano, “On paracompactness”, *Pacific J. Math.* 10 (1960), 1043--1047.
[^glicksberg]: W. Banaszczyk and E. Martín-Peinador, “The Glicksberg theorem on weakly compact sets for nuclear groups”, 1996.
[^smirnov-compactification]: N. Bourbaki, *General Topology*, Ch. IX.

## 関数空間

連続写像の集合そのものに位相を入れると, パラメータに依存する写像や積空間上の写像を一つの空間として扱える.
コンパクト開位相はコンパクト部分集合上での値の振る舞いを記録し, 局所コンパクト Hausdorff 空間に対する指数法則を与える.

### コンパクト開位相

Definition. **コンパクト開位相**
:   位相空間 $`X,Y`$ に対して, $`X`$ から $`Y`$ への連続写像全体の集合を $`C(X,Y)`$ と表す.
    $`K\subseteq X`$ をコンパクト集合, $`U\subseteq Y`$ を開集合として,
    ```math
    [K,U]\coloneqq\{f\in C(X,Y)\mid f(K)\subseteq U\}
    ```
    とおく.
    この形の集合を準基として $`C(X,Y)`$ に入る位相を **コンパクト開位相** (*compact-open topology*) といい, この位相を備えた空間を $`C_k(X,Y)`$ と表す.

Proposition. **評価写像**
:   $`X`$ が局所コンパクト Hausdorff 空間ならば, 評価写像
    ```math
    \operatorname{ev}:C_k(X,Y)\times X\longrightarrow Y,
    \quad(f,x)\longmapsto f(x)
    ```
    は連続である.

<u>proof.</u>
:   $`(f_0,x_0)`$ と $`f_0(x_0)`$ の開近傍 $`U`$ をとる.
    $`f_0^{-1}(U)`$ は $`x_0`$ の開近傍である.
    局所コンパクト性から, $`x_0\in V\subseteq K\subseteq f_0^{-1}(U)`$ を満たす開集合 $`V`$ とコンパクト集合 $`K`$ を選べる.
    $`[K,U]`$ は $`f_0`$ のコンパクト開近傍であり, $`V`$ は $`x_0`$ の近傍である.
    $`f\in[K,U]`$ と $`x\in V`$ ならば $`x\in K`$ であるから $`f(x)\in U`$ となる.
    よって評価写像は $`(f_0,x_0)`$ で連続であり, この点は任意である.

Theorem. **指数法則**
:   $`X`$ を局所コンパクト Hausdorff 空間とする.
    任意の位相空間 $`Z,Y`$ と連続写像 $`f:Z\times X\to Y`$ に対して,
    ```math
    \widetilde{f}:Z\longrightarrow C_k(X,Y),
    \quad z\longmapsto(x\longmapsto f(z,x))
    ```
    は連続である.
    逆に連続写像 $`g:Z\to C_k(X,Y)`$ から
    ```math
    (z,x)\longmapsto g(z)(x)
    ```
    によって連続写像 $`Z\times X\to Y`$ を得る.
    この二つの対応は互いに逆であり, $`Z`$ と $`Y`$ に関して自然である.

<u>proof.</u>
:   $`f:Z\times X\to Y`$ を連続とする.
    $`\widetilde{f}`$ の連続性は準基 $`[K,U]`$ の逆像を調べればよい.
    $`z_0\in\widetilde{f}^{-1}([K,U])`$ とすると, $`f(\{z_0\}\times K)\subseteq U`$ である.
    $`K`$ はコンパクトであり $`f^{-1}(U)`$ は開であるから, 管状近傍補題により $`z_0`$ の開近傍 $`W`$ が存在して
    ```math
    f(W\times K)\subseteq U
    ```
    となる.
    よって $`W\subseteq\widetilde{f}^{-1}([K,U])`$ であり, $`\widetilde{f}`$ は連続である.

    逆に $`g:Z\to C_k(X,Y)`$ が連続ならば, 非カリー化写像は評価写像との合成
    ```math
    Z\times X\xrightarrow{g\times\operatorname{id}_X}C_k(X,Y)\times X
    \xrightarrow{\operatorname{ev}}Y
    ```
    であるから連続である.
    カリー化と非カリー化を順に適用すると各点で元の値へ戻るため, 二つの対応は互いに逆である.
    合成との可換性を各点で確認すれば, 自然性も従う.

Remark.
:   任意の位相空間 $`X`$ に対してこの指数対象が存在するわけではないので, 圏 $`\mathbf{Top}`$ は Cartesian 閉圏ではない.
    局所コンパクト Hausdorff 空間を定義域に限れば, コンパクト開位相が指数対象を与える.

### コンパクト生成空間

Definition. **コンパクト生成空間**
:   Hausdorff 空間 $`X`$ が **コンパクト生成** (*compactly generated*) であるとは, 部分集合 $`A\subseteq X`$ が閉であることと, 任意のコンパクト Hausdorff 空間 $`K`$ および連続写像 $`f:K\to X`$ に対して $`f^{-1}(A)`$ が閉であることが同値になるときいう.

Remark.
:   コンパクト生成弱 Hausdorff 空間の圏では, 積と関数空間を適切に取り直すことで Cartesian 閉な圏を得る.
    この圏はホモトピー論で, 写像空間を持つ圏として広く用いられる.
