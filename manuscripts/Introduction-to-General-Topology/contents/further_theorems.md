## 古典的な例と発展的な定理

この節では, 一般位相で用いられる古典的な例と, 一般化された距離化定理および積空間の定理をまとめる.
以下でいう Arhangel'skii の空間は単独の通称ではなく, 外延基, 弱基, p 空間, 点可算型などを用いて定義される空間の総称として扱う.

### Alexandroff 直線

Definition. **Alexandroff 直線**
:   順序集合 $`[0,\omega_1)\times[0,1)`$ に辞書式順序を入れ, 順序位相を与えた空間を閉長半直線と呼ぶ.
    閉長半直線を二つ用意し, 一方の順序を反転させて最小点同士を同一視した空間を **Alexandroff 直線** (*Alexandroff line* または *long line*) $`\mathbb L`$ と呼ぶ.

Proposition. **Alexandroff 直線の性質**
:   Alexandroff 直線 $`\mathbb L`$ は Hausdorff かつ局所ユークリッドであり, 局所コンパクトかつ可算コンパクトである.
    しかし $`\mathbb L`$ はコンパクトでも Lindelöf でもなく, 可分でも第二可算でも距離化可能でもない.[^alexandroff-line]

<u>proof.</u>
:   順序位相の性質から $`\mathbb L`$ は Hausdorff である.
    各点のまわりで座標 $`[0,1)`$ の有限部分区間だけを動かせば, その点の近傍は実数直線の開区間と同相になる.
    同じ構成により, 各点はコンパクトな閉区間を含む近傍を持つため, $`\mathbb L`$ は局所コンパクトである.
    可算部分集合が持つ第一座標の集合は $`\omega_1`$ において上に有界であるから, 可算部分集合は $`\mathbb L`$ のあるコンパクトな初期区間に含まれる.
    したがって $`\mathbb L`$ は可算コンパクトである.
    一方, 開初期区間からなる開被覆は有限部分被覆を持たないため $`\mathbb L`$ はコンパクトでない.
    可算コンパクトな Lindelöf 空間はコンパクトであるから, $`\mathbb L`$ は Lindelöf でない.
    また, 可算集合はある初期区間に含まれるため, その後方の開集合と交わらず, $`\mathbb L`$ は可分でない.
    第二可算空間は可分であるから $`\mathbb L`$ は第二可算でない.
    可算コンパクトな距離空間はコンパクトであるから, $`\mathbb L`$ は距離化可能でない.

### Line with two origins

Definition. **二つの原点をもつ直線**
:   $`\mathbb{R}\times\{0,1\}`$ において, $`x\neq0`$ に対して $`(x,0)`$ と $`(x,1)`$ を同一視する同値関係を入れる.
    この商集合に商位相を与えた空間を **二つの原点をもつ直線** (*Line with two origins*) と呼ぶ.
    $`(0,0)`$ と $`(0,1)`$ の同値類をそれぞれ $`0_0`$, $`0_1`$ と表す.

Proposition. **二つの原点をもつ直線の性質**
:   二つの原点をもつ直線は $`T_1`$ 空間かつ局所ユークリッドであるが, Hausdorff ではない.

<u>proof.</u>
:   商写像の定義から, $`0_0`$ と $`0_1`$ のそれぞれは通常の直線の開区間と同相な近傍を持つ.
    また, 各一点の逆像は一点または二点であるから, 各一点集合は閉集合であり, 空間は $`T_1`$ である.
    $`0_0`$ と $`0_1`$ の任意の開近傍は, 十分小さい非零実数 $`x`$ に対応する点を共有する.
    したがってこの二点を交わらない開近傍で分離できず, Hausdorff ではない.

### Homogeneous 空間

Definition. **Homogeneous 空間**
:   位相空間 $`X`$ が **Homogeneous** (*homogeneous*) であるとは, 任意の $`x,y\in X`$ に対して $`h(x)=y`$ を満たす自己同相写像 $`h:X\to X`$ が存在するときいう.

Proposition. **位相群の Homogeneous 性**
:   位相群 $`G`$ は Homogeneous である.

<u>proof.</u>
:   $`x,y\in G`$ をとる.
    左移動 $`L_{yx^{-1}}:G\to G`$, $`g\mapsto yx^{-1}g`$ は自己同相写像であり, $`L_{yx^{-1}}(x)=y`$ を満たす.

### Polish 空間

Definition. **Polish 空間**
:   位相空間 $`X`$ が **Polish** (*Polish space*) であるとは, $`X`$ の位相を生成する完備距離が存在し, かつ $`X`$ が可分であるときいう.[^polish-space]

Proposition. **Polish 空間の基本性質**
:   Polish 空間は第二可算かつ Baire 空間である.
    $`\mathbb{R}^n`$, 可算離散空間, Cantor 空間 $`2^{\mathbb{N}}`$, および Baire 空間 $`\mathbb{N}^{\mathbb{N}}`$ は Polish 空間である.

<u>proof.</u>
:   可分距離空間は第二可算である.
    Polish 空間は完備距離空間でもあるから, Baire のカテゴリー定理により Baire 空間である.

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
:   逆方向では, 局所距離化可能な近傍の開被覆を局所有限細分し, 各細分上の距離を１の分割で組み合わせる.
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

### Borges-Okuyama の定理

Definition. **M 空間**
:   $`X`$ が **M 空間** (*M-space*) であるとは, 開被覆列 $`(\mathcal U_n)`$ が存在し, 各 $`x_n\in\operatorname{St}(x,\mathcal U_n)`$ を選んだ列が常に集積点を持つときいう.

Definition. **$`G_\delta`$ 対角線**
:   対角線 $`\Delta_X=\{(x,x)\mid x\in X\}`$ が $`X\times X`$ の可算個の開集合の共通部分であるとき, $`X`$ は $`G_\delta`$ 対角線を持つという.

Theorem. **Borges-Okuyama の距離化定理**
:   $`X`$ が距離化可能であることと, $`X`$ がパラコンパクト M 空間であり $`G_\delta`$ 対角線を持つことは同値である.

<u>proof.</u>
:   M 空間の被覆列と $`G_\delta`$ 対角線を表す開集合列を組み合わせ, 点を分離する可算開被覆列を構成する.
    パラコンパクト性により局所有限細分をとり, Nagata-Smirnov 型の距離化構成を適用する.[^borges-okuyama]

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
    逆方向は Stone-Čech コンパクト化の関数延長性と積空間の正規性から局所有限細分を構成する Tamano の議論による.[^tamano]

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

[^sorgenfrey]: J. R. Munkres, *Topology*, §17, §31. §17 は Sorgenfrey 直線の基本性質を, §31 は Sorgenfrey 平面の標準的な反例を扱う.
[^michael]: E. Michael, “The product of a normal space and a metric space need not be normal”, *Bulletin of the American Mathematical Society* 69 (1963), 375--376, [DOI: 10.1090/S0002-9904-1963-10931-3](https://doi.org/10.1090/S0002-9904-1963-10931-3).
[^alexandroff-line]: 本文では, 辞書式順序で構成される標準的な long line を「Alexandroff 直線」と呼んでいる. 構成と性質については [Long line](https://en.wikipedia.org/wiki/Long_line_(topology)) を参照.
[^polish-space]: A. S. Kechris, *Classical Descriptive Set Theory*, §3.
[^smirnov-metrization]: Munkres, *Topology*, §42.
[^point-countable-type]: J. E. Vaughan, “Spaces of countable and point-countable type”, *Transactions of the American Mathematical Society* 151 (1970), 341--351, [DOI: 10.1090/S0002-9947-1970-0266157-6](https://doi.org/10.1090/S0002-9947-1970-0266157-6).
[^arhangelskii-p]: A. V. Arhangel'skii, “On a class of spaces containing all metric and all locally bicompact spaces”, *Mat. Sb.* 67 (1965), 55--88. 原論文は “On a class of spaces containing all metric and all bicompact spaces”, *Dokl. Akad. Nauk SSSR* 151 (1963), 751--754 としても確認できる.
[^borges-okuyama]: C. R. Borges, “On stratifiable spaces”, *Pacific Journal of Mathematics* 17 (1966), 1--16, [DOI: 10.2140/PJM.1966.17.1](https://doi.org/10.2140/PJM.1966.17.1); A. Okuyama, “On metrizability of M-spaces”, *Proceedings of the Japan Academy* 40 (1964), 176--179, [DOI: 10.3792/pja/1195522799](https://doi.org/10.3792/pja/1195522799).
[^morita]: K. Morita, “Products of normal spaces with metric spaces”, *Mathematische Annalen* 154 (1964), 365--382, [EuDML](https://eudml.org/doc/161169).
[^tamano]: H. Tamano, “On paracompactness”, *Pacific Journal of Mathematics* 10 (1960), 1043--1047, [DOI: 10.2140/pjm.1960.10.1043](https://doi.org/10.2140/pjm.1960.10.1043).
[^glicksberg]: W. Banaszczyk and E. Martín-Peinador, “The Glicksberg Theorem on Weakly Compact Sets for Nuclear Groups”, *Annals of the New York Academy of Sciences* 788 (1996), 34--39, DOI: 10.1111/j.1749-6632.1996.tb36794.x, [本文PDF](https://www.mat.ucm.es/~peinador/ElenaMartinPeinador/docs/PpalesPublic/Glicksberg1996.pdf). この論文は Glicksberg の定理そのものの原論文ではなく, 局所コンパクト Hausdorff 可換群に関する定理を核群へ拡張した論文であり, 要旨で原定理の主張を明記している.
[^smirnov-compactification]: N. Bourbaki, *General Topology*, Ch. IX; S. A. Naimpally and B. D. Warrack, *Proximity Spaces*, Cambridge University Press, 1970, Chs. 2--3. 後者は近接空間のコンパクト化と Smirnov コンパクト化を直接扱う.
