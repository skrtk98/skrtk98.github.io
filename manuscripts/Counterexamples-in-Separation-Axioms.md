# 分離公理の反例

この補遺では、分離公理の間の含意が逆向きには成り立たないことを示す代表的な位相空間をまとめる。
本文の `Introduction-to-General-Topology.md` で用いた分離公理の定義を前提とし、ここでは各例で必要な性質だけを確認する。
「すべての反例」とは、すべての既知の反例を列挙するという意味ではなく、主要な非含意、部分空間に関する非遺伝性、積に関する非保存性を代表する例を収録するという意味である。
本文の分離性の節に現れる含意の反例を一覧した補足資料として、本稿を参照できる。

## 用語と含意の規約

本文では、`正則`、`完全正則`、`正規` にそれぞれ $`T_1`$ 公理を暗黙に含めない。
したがって、古典的な記号との対応は

```math
\begin{aligned}
&T_0=\text{Kolmogorov},\\
&T_1=\text{全ての一点集合が閉},\\
&T_2=\text{Hausdorff},\\
&T_3=\text{正則かつ }T_0,\\
&T_{3\frac12}=\text{完全正則かつ }T_0,\\
&T_4=\text{正規かつ }T_1
\end{aligned}
```

である。
本文では、異なる点が互いに素な閉近傍をもつ空間を Urysohn 空間と呼ぶ。
文献によってはこの性質を完全 Hausdorff 空間または $`T_{2\frac12}`$ 空間と呼び、連続実数値函数による点の分離を Urysohn 空間と呼ぶ場合もあるため、用語ではなく性質を確認する必要がある[^steen-seebach]。

この規約のもとで、典型的な含意は次である。

```math
\text{遺伝的正規 Hausdorff}
\Longrightarrow \text{正規 Hausdorff}
\Longrightarrow \text{Tychonoff}
\Longrightarrow \text{正則 Hausdorff}
\Longrightarrow \text{Hausdorff}
\Longrightarrow T_1
\Longrightarrow T_0.
```

ここで、正則かつ $`T_0`$ なら Hausdorff であり、正規かつ $`T_1`$ なら正則である。
以下の例は、図式に現れる矢印の多くを逆転できないことを示す。

## $`T_0`$ だが $`T_1`$ でない空間

### シェルピンスキー空間

集合 $`S=\{0,1\}`$ に

```math
\mathcal{T}=\{\emptyset,\{0\},S\}
```

を入れた空間をシェルピンスキー空間と呼ぶ。

任意の異なる点は開集合 $`\{0\}`$ によって位相的に識別できる。
一方、点 $`0`$ の任意の開近傍は点 $`1`$ を含むため、$`0`$ と $`1`$ を開近傍で分離できない。
また、$`\{1\}`$ は閉集合ではない。
したがってシェルピンスキー空間は $`T_0`$ だが $`T_1`$ ではない。

この空間は正規性の定義を $`T_1`$ なしで採用すると正規である。
実際、互いに素な閉集合は高々一方しか空でないため、分離条件は空集合を含む開集合で満たされる。
しかし、点 $`0`$ と閉集合 $`\{1\}`$ は互いに素な開近傍をもたない。
したがって、正規性から正則性を導くには $`T_1`$ 仮定が必要である。

### Overlapping interval topology

集合 $`X=[-1,1]`$ に、

```math
[-1,b)\quad (b>0),\qquad (a,1]\quad (a<0)
```

を準基とする位相を入れる。
この位相を overlapping interval topology と呼ぶ[^overlapping-interval]。

任意の空でない開集合は $`0`$ を含む。
したがって $`X\setminus\{0\}`$ は開集合でなく、$`\{0\}`$ は閉集合でない。
よってこの空間は $`T_1`$ でない。
一方、異なる二点の一方を含み他方を含まない生成元を選べるため、この空間は $`T_0`$ である。
この例は、$`T_0`$ から $`T_1`$ への含意を逆転できないことを、シェルピンスキー空間とは異なる無限空間で示す。

## $`T_1`$ だが Hausdorff でない空間

### 補有限位相

無限集合 $`X`$ に、

```math
\mathcal{T}=\{\emptyset\}\cup\{U\subseteq X\mid X\setminus U\text{ が有限}\}
```

を入れる。
一点集合の補集合は開であるから、この空間は $`T_1`$ である。
しかし、二つの空でない開集合の補集合はともに有限であり、$`X`$ が無限であることから二つの開集合は必ず交わる。
よって二点を互いに素な開近傍で分離できず、Hausdorff ではない。

### 補可算位相

非可算集合 $`X`$ に、補集合が高々可算となる集合を開集合とする補可算位相を入れる。
これは同じ理由で $`T_1`$ だが Hausdorff でない。
補有限位相と補可算位相は、分離性と可算性を混同できないことも示している。

### 二原点直線

二つの実数直線 $`\mathbb{R}\times\{0,1\}`$ に対し、$`(x,0)\sim(x,1)`$ を $`x\neq0`$ のときに課した商空間を考える。
二つの原点の像をそれぞれ $`0_0,0_1`$ と呼ぶ。
この空間は局所的には実直線であり、一点集合が閉であるから $`T_1`$ である。
しかし、$`0_0`$ と $`0_1`$ の任意の開近傍は、原点以外の十分小さい実数の像を共有する。
したがって二原点は Hausdorff 分離できない。

## Hausdorff だが正則でない空間

### スリット円板位相

$`\mathbb{R}^2`$ の $`y`$ 軸を $`L=\{(0,y)\mid y\in\mathbb{R}\}`$ とし、補集合を $`P=\mathbb{R}^2\setminus L`$ とおく。
$`P`$ の点では通常のユークリッド開円板を近傍基とし、$`L`$ の点 $`z`$ では

```math
\{z\}\cup(P\cap D)
```

を近傍基とする。
ここで $`D`$ は $`z`$ を中心とするユークリッド開円板である。
この位相は slit disc topology と呼ばれる[^auckland-separation]。

異なる二点が $`L`$ 上にある場合は、それぞれの近傍から $`L`$ を除けば交わらないユークリッド円板を選べる。
一方が $`P`$ にある場合も、円板を十分小さく選ぶことで分離できる。
よってこの空間は Hausdorff である。

しかし $`L`$ は閉集合であり、$`L`$ と $`p=(1,0)`$ を分離する正則性の条件は満たされない。
実際、$`p`$ の任意のユークリッド近傍と $`L`$ の任意の近傍は、$`L`$ に近い $`P`$ の点を共有する。
したがって Hausdorff 性から正則性は従わない。

## 完全正則性と正規性の反例

### Niemytzki 平面

閉上半平面

```math
N=\{(x,y)\in\mathbb{R}^2\mid y\geq0\}
```

を考える。
内部の点ではユークリッド近傍を用い、境界点 $`(x,0)`$ では、$`(x,0)`$ に接し上半平面の内部に含まれる開円板 $`D`$ に対して

```math
\{(x,0)\}\cup D
```

を近傍基とする。
この空間を Niemytzki 平面または Moore 平面と呼ぶ。

Niemytzki 平面は Hausdorff かつ完全正則であるが、正規ではない。
完全正則性は境界点の接円板を用いて連続函数を構成することで示せる。
正規でないことは、境界上の有理点集合と無理点集合を互いに素な閉集合として取り、それらを開集合で分離できないことから示される[^auckland-separation][^steen-seebach]。
この例は、完全正則性から正規性を導けないことを示す。

### Tychonoff のコルク栓

正則 Hausdorff 空間だが完全正則でない空間の標準例として、Tychonoff のコルク栓がある。
これは削除した Tychonoff の板に二点を付加し、二点の近傍を板の二つの端に沿う尾部で定める構成である。
この構成は Hausdorff かつ正則であるが、連続実数値函数による点と閉集合の分離に失敗する[^steen-seebach][^waterloo-separation]。

この例の近傍系は記号を省略して記すと誤解を生じやすい。
したがって本稿では、完全な近傍基の定義と非完全正則性の証明を省略し、文献に基づく反例として位置付ける。

### Arens square

Arens square は、半正則かつ完全 Hausdorff であるが正則でない空間の反例として文献に現れる。
この例は、Hausdorff 性より強い点分離性から正則性が従わないことを示す候補である[^steen-seebach]。
ただし、原典の近傍系には誤植と解釈の差異が指摘され、修正版や簡約版では完全 Hausdorff 性が失われることがある[^arens-square]。
したがって、版を特定しないまま Arens square の性質を定理として引用してはならない。
本稿では、定義の版に依存するこの例を対応表の代表例には採用しない。

## 正規性と遺伝的正規性の反例

### Tychonoff の板

$`\omega_1`$ を最初の非可算順序数とし、$`\omega`$ を最初の無限順序数とする。
順序位相を入れた順序数区間の積

```math
T=[0,\omega_1]\times[0,\omega]
```

を Tychonoff の板と呼ぶ。

各順序数区間はコンパクト Hausdorff であるから、$`T`$ もコンパクト Hausdorff であり、したがって正規である。

点 $`(\omega_1,\omega)`$ を除いた空間

```math
T^*=T\setminus\{(\omega_1,\omega)\}
```

を考える。
$`T^*`$ の閉集合

```math
A=\{(\omega_1,n)\mid n<\omega\},\qquad
B=\{(\alpha,\omega)\mid \alpha<\omega_1\}
```

は互いに素である。
$`A`$ の開近傍は、ある有限段階以降の縦の尾部を含み、$`B`$ の開近傍は、ある可算段階以前の横の尾部を含む。
$`\omega_1`$ の非可算性により、これらの尾部は必ず交わる。
したがって $`A`$ と $`B`$ は互いに素な開集合で分離できず、$`T^*`$ は正規でない。

ゆえに $`T`$ は正規だが遺伝的正規ではない。
同時に、正規性は閉部分空間へ遺伝しない。
さらに、角点 $`\{(\omega_1,\omega)\}`$ は $`T`$ で $`G_\delta`$ でないため、$`T`$ は完全正規でもない[^tychonoff-plank]。

### 閉順序数空間

順序位相を入れた閉区間 $`[0,\omega_1]`$ は遺伝的正規であるが、完全正規ではない。
実際、線型順序空間は遺伝的に正規である。
一方、$`\{\omega_1\}`$ は閉集合だが $`G_\delta`$ ではない。
可算個の $`\omega_1`$ の近傍を交わらせても、各近傍が含む尾部の共通部分には $`\omega_1`$ より小さい順序数が残るためである[^steen-seebach]。

この例は、遺伝的正規性から完全正規性を導くことができないことを示す。

## 部分空間と積空間に関する反例

### Sorgenfrey 直線の積

Sorgenfrey 直線は正規 Hausdorff 空間である。
しかし、その平方 $`S\times S`$ は正規でない。
これは正規性が積空間に保存されないことを示す古典的な反例である。
証明は、平方内の反対角線とその分離性を調べることで与えられる[^sorgenfrey]。

### 二原点直線と Tychonoff の板

二原点直線のように局所的性質がよくても、Hausdorff 性は大域的な近傍の交わりに依存する。
Tychonoff の板では、親空間がコンパクト Hausdorff である一方、角点を削除した部分空間が正規でない。
この対照は、局所的な Euclid 性やコンパクト性だけから分離公理の遺伝性を推測できないことを示す。

## 反例の対応表

| 反例 | 成り立つ性質 | 成り立たない性質 | 示す非含意 |
|---|---|---|---|
| シェルピンスキー空間 | $`T_0`$、正規 | $`T_1`$、正則 | $`T_0\not\Rightarrow T_1`$ |
| Overlapping interval topology | $`T_0`$ | $`T_1`$ | $`T_0\not\Rightarrow T_1`$ |
| 補有限位相 | $`T_1`$ | Hausdorff | $`T_1\not\Rightarrow T_2`$ |
| 二原点直線 | $`T_1`$、局所 Euclid | Hausdorff | 局所 Hausdorff 性から Hausdorff 性は従わない |
| スリット円板位相 | Hausdorff | 正則 | $`T_2\not\Rightarrow T_3`$ |
| Niemytzki 平面 | Tychonoff | 正規 | 完全正則 $`\not\Rightarrow`$ 正規 |
| Tychonoff のコルク栓 | 正則 Hausdorff | 完全正則 | 正則 $`\not\Rightarrow`$ 完全正則 |
| Tychonoff の板 | 正規 Hausdorff | 遺伝的正規、完全正規 | 正規 $`\not\Rightarrow`$ 遺伝的正規 |
| 閉順序数空間 | 遺伝的正規 | 完全正規 | 遺伝的正規 $`\not\Rightarrow`$ 完全正規 |
| Sorgenfrey 直線の平方 | 各因子は正規 | 積は正規でない | 正規性は有限積に保存されない |

## 参照文献

[^steen-seebach]: L. A. Steen and J. A. Seebach, *Counterexamples in Topology*, 2nd ed., Springer, 1978. [公開 PDF](https://www.rexresearch1.com/TopologyLibrary/CounterexamplesTopologySteen.pdf)

[^overlapping-interval]: Steen and Seebach, *Counterexamples in Topology*, Example 53. 定義と基本性質は [Overlapping interval topology](https://en.wikipedia.org/wiki/Overlapping_interval_topology) も参照。

[^auckland-separation]: University of Auckland, “Separation axioms”, [講義ノート PDF](https://www.math.auckland.ac.nz/~gauld/750-05/section2.pdf)。

[^waterloo-separation]: University of Waterloo, “Separation Axioms”, [講義ノート PDF](https://www.math.uwaterloo.ca/~randre/sets/revised1.pdf)。

[^tychonoff-plank]: [Tychonoff plank](https://web.math.ucsb.edu/~bigelow/books/counterexamples.pdf) の構成と非正規性の証明を参照。

[^sorgenfrey]: J. R. Munkres, *Topology*, §17。

[^arens-square]: Arens square の定義の問題と修正版については、[Is Arens square a Urysohn space?](https://math.stackexchange.com/questions/1715435/is-arens-square-a-urysohn-space) および Steen and Seebach, *Counterexamples in Topology*, Example 80 を参照。
