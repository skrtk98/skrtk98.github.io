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

### Cantor 空間

Definition. **Cantor 空間**
:   $`2=\{0,1\}`$ に離散位相を入れ, 積空間
    ```math
    2^{\mathbb N}=\prod_{n\in\mathbb N}2
    ```
    を **Cantor 空間** と呼ぶ.
    これと同相な空間も Cantor 空間と呼ぶ.

Proposition. **Cantor 空間の基本性質**
:   Cantor 空間 $`C`$ はコンパクト, Hausdorff, 距離化可能, 可分, 零次元であり, 孤立点をもたない.
    特に $`C`$ は完全不連結で, 濃度は $`2^{\aleph_0}`$ である.

<u>proof.</u>
:   各因子 $`2`$ はコンパクト Hausdorff であるから, Tychonoff の定理により $`C`$ はコンパクト Hausdorff である.
    有限個の座標を指定する集合
    ```math
    [s]=\{x\in 2^{\mathbb N}\mid x|_{\{0,\ldots,n-1\}}=s\}
    ```
    は開かつ閉であり, これらが可算基をなす.
    よって $`C`$ は第二可算かつ零次元であり, Urysohn の距離化定理から距離化可能である.
    任意の基本開集合では指定されていない座標を変更できるので, どの点も孤立しない.
    各二進列が異なる点を与えることから $`|C|=2^{\aleph_0}`$ である.

Theorem. **Cantor 空間の特徴づけ**
:   位相空間 $`X`$ が非空, コンパクト, Hausdorff, 距離化可能, 零次元, かつ孤立点をもたないならば, $`X`$ は Cantor 空間と同相である.

<u>proof.</u>
:   $`X`$ の各点を含む直径が $`2^{-n}`$ 未満の有限個の互いに素な開かつ閉集合へ, 帰納的に細分する.
    これらの細分を二分木として整理すると, 各点 $`x\in X`$ に対して二進列 $`(a_n(x))_{n\geq0}`$ が定まる.
    孤立点がないことにより各段階で必要な細分を選べ, コンパクト性により得られる写像は全射となる.
    直径が $`0`$ に収束することからこの写像は単射であり, コンパクト空間から Hausdorff 空間への連続全単射は同相写像である.
    したがって $`X\cong2^{\mathbb N}`$ である[^cantor-space].

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

Remark. **Nöbeling＝Pontryagin の定理**
:   可分距離化可能空間 $`X`$ について, $`\dim X<\infty`$ であることと, ある $`m\geq0`$ および同相埋込み $`X\to\mathbb R^m`$ が存在することは同値である.[^nobeling-pontryagin]
    順方向は次の埋込み定理を用い, 逆方向は Euclid 空間の被覆次元と部分空間への遺伝性を用いる.

Remark. **Menger＝Nöbeling の定理（1932）**
:   コンパクト距離空間 $`X`$ が $`\dim X\leq n`$ を満たすならば, 同相埋込み
    ```math
    X\longrightarrow\mathbb R^{2n+1}
    ```
    が存在する.[^menger-nobeling]
    標準的な証明は $`C(X,\mathbb R^{2n+1})`$ の一様ノルム位相で埋込みを与える写像が稠密な $`G_\delta`$ 部分集合をなすことを示す.
    次数を制御した開細分で座標写像を摂動し, Baire のカテゴリー定理で同時に単射となる写像を選ぶ.

#### 立方体の被覆と色つき被覆

Remark. **Lebesgue 被覆定理**
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

Remark. **色つき次元に関する Ostrand の定理**
:   距離化可能空間 $`X`$ と $`n\geq0`$ について, $`\dim X\leq n`$ であることは次と同値である.[^ostrand]
    任意の局所有限開被覆 $`\mathcal U`$ に対し, 離散な開族の列 $`\mathcal V_1,\mathcal V_2,\ldots`$ を選べて, 各 $`\mathcal V_i`$ が $`\mathcal U`$ を細分し, 任意の相異なる $`n+1`$ 個の添字 $`i_1,\ldots,i_{n+1}`$ に対して $`\mathcal V_{i_1}\cup\cdots\cup\mathcal V_{i_{n+1}}`$ が $`X`$ を覆うことである.
    添字を色とみなせば, 任意の $`n+1`$ 色だけで被覆になるように, 被覆を互いに交わらない色の族へ分けられることを表す.
    順方向の証明は局所有限細分を縮小して色ごとの離散な開族を帰納的に構成し, 逆方向は一組の $`n+1`$ 色を選んで次数高々 $`n`$ の細分を得る.[^ostrand]

[^dimension-scope]: 定理の陳述は標準的な可分距離化可能空間の場合に限った. より一般の正規空間または距離化可能空間では, 三つの次元の間に別の不等式や一致定理が現れる.
[^nobeling-pontryagin]: R. Engelking, *Theory of Dimensions, Finite and Infinite*, Heldermann Verlag, 1995, 定理 1.11.4 と歴史的注記. 一般次元の場合の埋込み定理を Nöbeling, Pontryagin-Tolstowa, Lefschetz が 1931 年に証明したことが記録されている.
[^menger-nobeling]: G. Nöbeling, "Über eine n-dimensionale Universalmenge im $`\mathbb R^{2n+1}`$", *Mathematische Annalen* 104 (1931), 71--80. 1932 年刊の K. Menger, *Kurventheorie* はこの結果を含む古典的文献である.
[^lebesgue-covering]: N. V. Ivanov, "Cubes and cubical chains and cochains", 2019, Lebesgue first covering theorem.
[^ostrand]: P. A. Ostrand, "Dimension of metric spaces and Hilbert's problem 13", *Bulletin of the American Mathematical Society* 71 (1965), 619--622, DOI: 10.1090/S0002-9904-1965-11363-5.