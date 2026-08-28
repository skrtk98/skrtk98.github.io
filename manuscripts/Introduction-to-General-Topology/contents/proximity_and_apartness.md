## 近接と遠隔

位相は, 部分集合どうしの関係によっても記述できる.
本稿では, 対称性を要求しない準近接関係を出発点とし, 対称な近接関係とその双対である準遠隔関係を定める.

Definition. **準近接関係**
:   集合 $`X`$ 上の二項関係 $`\delta\subseteq2^X\times2^X`$ が **準近接関係** (*quasi-proximity relation*) であるとは, 任意の $`A,B,C,E\subseteq X`$ に対して次の条件を満たすこととする.
    - $`A\mathrel{\delta}B`$ ならば $`A\neq\emptyset`$ かつ $`B\neq\emptyset`$ である.
    - $`A\cap B\neq\emptyset`$ ならば $`A\mathrel{\delta}B`$ である.
    - $`(A\cup B)\mathrel{\delta}C`$ であることと, $`A\mathrel{\delta}C`$ または $`B\mathrel{\delta}C`$ であることは同値である.
    - $`A\mathrel{\delta}(B\cup C)`$ であることと, $`A\mathrel{\delta}B`$ または $`A\mathrel{\delta}C`$ であることは同値である.
    - $`\neg(A\mathrel{\delta}B)`$ ならば, ある $`E\subseteq X`$ が存在して $`\neg(A\mathrel{\delta}E)`$ かつ $`\neg(B\mathrel{\delta}(X\setminus E))`$ である.

    対称性 $`A\mathrel{\delta}B\Longleftrightarrow B\mathrel{\delta}A`$ は仮定しない.
    最後の条件は Efremovič 型の強公理である.

Definition. **Lodato 型準近接関係**
:   集合 $`X`$ 上の二項関係 $`\delta`$ が **Lodato 型準近接関係** (*Lodato-type quasi-proximity relation*) であるとは, 最初の四つの公理と, 任意の $`A,B,C\subseteq X`$ に対する
    ```math
    \operatorname{cl}_{\delta}(C)\coloneqq\{x\in X\mid\{x\}\mathrel{\delta}C\}
    ```
    によって定まる閉包に関して
    ```math
    A\mathrel{\delta}B
    \quad\text{かつ}\quad
    B\subseteq\operatorname{cl}_{\delta}(C)
    \quad\Longrightarrow\quad
    A\mathrel{\delta}C
    ```
    が成り立つこととする.
    Efremovič 型の強公理は仮定しない.

Proposition. **Lodato 型準近接関係から得られる閉包作用素**
:   Lodato 型準近接関係 $`\delta`$ に対して, $`\operatorname{cl}_{\delta}:2^X\to2^X`$ は閉包作用素である.

<u>proof.</u>
:   第一の公理から $`\operatorname{cl}_{\delta}(\emptyset)=\emptyset`$ が成り立つ.
    第二の公理から $`C\subseteq\operatorname{cl}_{\delta}(C)`$ が成り立つ.
    第三または第四の公理から有限和保存性が成り立つ.
    $`x\in\operatorname{cl}_{\delta}(\operatorname{cl}_{\delta}(C))`$ とすると $`\{x\}\mathrel{\delta}\operatorname{cl}_{\delta}(C)`$ である.
    Lodato 型の公理を適用すれば $`\{x\}\mathrel{\delta}C`$ となる.
    よって冪等性が成り立つ.

Definition. **位相的 Lodato 型準近接関係**
:   Lodato 型準近接関係 $`\delta`$ が **位相的** (*topological*) であるとは, 任意の $`A,B\subseteq X`$ に対して
    ```math
    A\mathrel{\delta}B
    \quad\Longleftrightarrow\quad
    A\cap\operatorname{cl}_{\delta}(B)\neq\emptyset
    ```
    が成り立つこととする.

Theorem. **位相構造と位相的 Lodato 型準近接関係の対応**
:   集合 $`X`$ 上の位相構造と, $`X`$ 上の位相的 Lodato 型準近接関係は一対一に対応する.
    位相 $`\mathcal O`$ に対応する Lodato 型準近接関係は
    ```math
    A\mathrel{\delta_{\mathcal O}}B
    \quad\Longleftrightarrow\quad
    A\cap\overline{B}^{\mathcal O}\neq\emptyset
    ```
    で与えられる.
    Lodato 型準近接関係 $`\delta`$ に対応する位相は, 閉包作用素 $`\operatorname{cl}_{\delta}`$ が定める位相である.

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
    逆に位相的 Lodato 型準近接関係 $`\delta`$ に対応する閉包作用素から得られる位相の閉包を $`\operatorname{cl}_{\delta}`$ とすると, 位相性の定義から元の $`\delta`$ が復元される.
    以上により二つの対応は互いに逆である.

Definition. **近接関係**
:   Lodato 型準近接関係 $`\delta`$ が対称であるとき, $`\delta`$ を **近接関係** (*proximity relation*) といい, $`(X,\delta)`$ を **近接空間** (*proximity space*) という.
    すなわち, 任意の $`A,B\subseteq X`$ に対して
    ```math
    A\mathrel{\delta}B\quad\Longleftrightarrow\quad B\mathrel{\delta}A
    ```
    が成り立つ.
    近接関係は対称な Lodato 型準近接関係である.

Definition. **近傍関係**
:   近接関係 $`\delta`$ に対して, $`A,B\subseteq X`$ が **近傍関係にある** (*neighbourhood relation*) とは
    ```math
    A\mathrel{\ll_{\delta}}B
    \quad\Longleftrightarrow\quad
    \neg\bigl(A\mathrel{\delta}(X\setminus B)\bigr)
    ```
    が成り立つこととする.
    $`A\mathrel{\ll_{\delta}}B`$ を, $`A`$ が $`B`$ の **近接近傍** (*proximal neighbourhood*) であるという.

Proposition. **位相から得られる近傍関係**
:   位相 $`\mathcal O`$ から定まる近接関係 $`\delta_{\mathcal O}`$ と, その位相の近傍系 $`\mathcal N_{\mathcal O}`$ に対して
    ```math
    A\mathrel{\ll_{\delta_{\mathcal O}}}B
    \quad\Longleftrightarrow\quad
    A\subseteq B^{\circ}
    \quad\Longleftrightarrow\quad
    B\in\bigcap_{a\in A}\mathcal N_{\mathcal O}(a)
    ```
    が成り立つ.

<u>proof.</u>
:   $`\delta_{\mathcal O}`$ の定義から
    ```math
    A\mathrel{\ll_{\delta_{\mathcal O}}}B
    \quad\Longleftrightarrow\quad
    A\cap\overline{X\setminus B}^{\mathcal O}=\emptyset
    \quad\Longleftrightarrow\quad
    A\subseteq X\setminus\overline{X\setminus B}^{\mathcal O}=B^{\circ}
    ```
    である.
    また, $`B\in\mathcal N_{\mathcal O}(a)`$ であることは $`a\in B^{\circ}`$ と同値であるから,
    ```math
    A\subseteq B^{\circ}
    \quad\Longleftrightarrow\quad
    B\in\bigcap_{a\in A}\mathcal N_{\mathcal O}(a)
    ```
    が成り立つ.

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
:   準近接関係または Lodato 型準近接関係 $`\delta`$ に対して, $`A,B\subseteq X`$ が **準遠隔関係にある** (*quasi-apartness*) とは
    ```math
    A\mathrel{\phi_{\delta}}B\quad\Longleftrightarrow\quad\neg(A\mathrel{\delta}B)
    ```
    が成り立つこととする.
    $`\phi_{\delta}`$ は $`\delta`$ の双対である.

Definition. **遠隔関係**
:   近接関係 $`\delta`$ の準遠隔関係 $`\phi_{\delta}`$ を **遠隔関係** (*apartness relation*) という.
    近接関係が対称であるから, 遠隔関係も対称である.

Proposition. **準近接関係と準遠隔関係の双対性**
:   準近接関係または Lodato 型準近接関係 $`\delta`$ とその準遠隔関係 $`\phi_{\delta}`$ に対して, 次が成り立つ.
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
    公理の選択には文献による差があるため, 本稿では Efremovič 型の強公理を含む一般の準近接関係と, それとは別の公理系をもつ Lodato 型準近接関係を区別する.[^proximity]
    準近接関係は一般に対称でないため, その双対である準遠隔関係も一般に対称でない.
    構成的数学でいう apartness relation は別の公理系を持つため, 準遠隔関係と同一視しない.

[^proximity]: 古典的な近接空間とそのコンパクト化については S. A. Naimpally and B. D. Warrack, *Proximity Spaces*, Cambridge University Press, 1970, および Yu. M. Smirnov, “On proximity spaces”, *Mat. Sb.* 31 (1952), 543--574 を参照. 準近接関係と近傍関係の概念整理については [proximity space](https://ncatlab.org/nlab/show/proximity%2Bspace) を, 構成的数学における apartness relation については D. Bridges and L. Vîță, *Apartness and Uniformity: A Constructive Development*, Springer, 2011 を参照する. J. Galton, “Applications of near sets”, *Proceedings of the 2011 IEEE International Conference on Fuzzy Systems*, 2011 は near set の応用を扱う文献であり, 本稿の準近接関係の公理系の直接の出典ではない.
