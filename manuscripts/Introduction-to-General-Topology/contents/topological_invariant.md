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
:   位相空間 $`X`$ のネットワークとは, 任意の開集合 $`U`$ と点 $`x\in U`$ に対して $`x\in N\subseteq U`$ を満たす部分集合 $`N`$ を含む集合族である.
    ネットワークの濃度の最小値を $`nw(X)`$ と表し, **network weight** と呼ぶ.

Definition. **Lindelöf 度数**
:   位相空間 $`X`$ の任意の開被覆が濃度高々 $`\kappa`$ の部分被覆を持つような基数の最小値を $`L(X)`$ と表し, **Lindelöf 度数** (*Lindelöf number*) と呼ぶ.
    $`L(X)\leq\aleph_0`$ であることは Lindelöf 性と同値である.

Definition. **弱被覆度数**
:   位相空間 $`X`$ の任意の開被覆が, 合併の閉包が $`X`$ となる濃度高々 $`\kappa`$ の部分族を持つような基数の最小値を **弱被覆度数** といい $`wc(X)`$ と表す.
    定義から $`wc(X)\leq L(X)`$ が成り立つ.

Definition. **cellularity**
:   位相空間 $`X`$ の互いに素な非空開集合からなる族の濃度の上限を $`c(X)`$ と表し, **cellularity** と呼ぶ.

Definition. **spread と extent**
:   位相空間 $`X`$ の離散部分空間の濃度の上限を **spread** $`s(X)`$ と呼ぶ.
    離散かつ閉じた部分空間の濃度の上限を extent $`e(X)`$ と呼ぶ.
    これらは $`e(X)\leq s(X)`$ を満たす.

Definition. **tightness**
:   位相空間 $`X`$ の **tightness** $`t(X)`$ とは, 任意の $`A\subseteq X`$ と $`x\in\operatorname{cl}(A)`$ に対して, $`|B|\leq\kappa`$, $`B\subseteq A`$, $`x\in\operatorname{cl}(B)`$ を満たす $`B`$ が存在するような基数 $`\kappa`$ の最小値である.

Proposition. **基数不変量の基本不等式**
:   任意の位相空間 $`X`$ に対して $`wc(X)\leq d(X)\leq w(X)`$, $`nw(X)\leq w(X)`$, $`t(X)\leq\chi(X)\leq w(X)`$, および $`e(X)\leq s(X)`$ が成り立つ.
    局所コンパクト Hausdorff 空間では $`nw(X)=w(X)`$ である.

<u>proof.</u>
:   開基はネットワークであり, 近傍基は閉包を検出するため $`t(X)\leq\chi(X)`$ が従う.
    他の不等式は定義から得られる.
    局所コンパクト Hausdorff 空間では, コンパクト部分集合上のネットワークを開集合へ拡張できるため network weight と weight が一致する.

### 代数的不変量

Definition. **ホモトピー群**
:   点付き位相空間 $`(X,x_0)`$ と整数 $`n\geq 1`$ に対して, $`n`$ 次元球面 $`S^n`$ から $`X`$ への基点を保つ写像のホモトピー類全体を $`\pi_n(X,x_0)`$ と表し, **$`n`$ 次ホモトピー群** (*$`n`$-th homotopy group*) と呼ぶ.
    $`n=1`$ の場合を基本群 $`\pi_1(X,x_0)`$ と呼ぶ.

Definition. **特異ホモロジー群**
:   位相空間 $`X`$ と可換群 $`G`$ に対して, $`n`$ 次特異鎖群 $`C_n(X;G)`$ を $`n`$ 単体から $`X`$ への連続写像を生成元とする自由 $`G`$ 加群とし, 境界写像 $`\partial_n`$ を面の交代和で定める.
    **$`n`$ 次特異ホモロジー群** (*$`n`$-th singular homology group*) を $`H_n(X;G)=\ker\partial_n/\operatorname{im}\partial_{n+1}`$ と定める.

Definition. **特異コホモロジー群**
:   特異鎖複体に対して $`n`$ 次コチェイン群を $`C^n(X;G)=\operatorname{Hom}(C_n(X;\mathbb{Z}),G)`$ とし, 境界写像の双対からコ境界写像 $`\delta^n`$ を定める.
    **$`n`$ 次特異コホモロジー群** (*$`n`$-th singular cohomology group*) を $`H^n(X;G)=\ker\delta^n/\operatorname{im}\delta^{n-1}`$ と定める.

Theorem. **代数的不変量の同相不変性**
:   同相写像 $`f:X\to Y`$ は, 任意の基点と係数群に対して基本群, ホモトピー群, ホモロジー群, コホモロジー群の同型を誘導する.
    基点を変える場合, これらの同型は基点を結ぶ道の選択に依存しうるが, 道で結ばれた基点では非標準的な同型が存在する.

<u>proof.</u>
:   $`f`$ と $`f^{-1}`$ の合成は恒等写像であり, それぞれが誘導するホモトピー類, 鎖写像, コ鎖写像の合成も恒等写像に一致する.
    したがって各誘導写像は逆写像を持ち, 対応する群の同型となる.