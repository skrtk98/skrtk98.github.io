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
最後に Urysohn の補題, Tietze の拡張定理, １の分割を通じて正規性が連続関数の構成に果たす役割を示し, コンパクト開位相を備えた関数空間を扱う.

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

@import "contents/preliminaries.md"

---

@import "contents/introduction_to_metric_space.md"

---

@import "contents/topological_space_and_continuous_map.md"

---

@import "contents/construction_of_a_space.md"

---

@import "contents/separation_axioms.md"

---

@import "contents/connectedness.md"

---

@import "contents/topological_invariant.md"

---

@import "contents/axiom_of_countability.md"

---

@import "contents/covering_and_topological_dimension.md"

---

@import "contents/compactness.md"

---

@import "contents/the_axiom_of_choice_in_general_topology.md"

---

@import "contents/proximity_and_apartness.md"

---

@import "contents/uniform_space_and_uniformly_continuous.md"

---

@import "contents/gauge_space.md"

---

@import "contents/metrization_theorem.md"

---

@import "contents/baire_space.md"

---

@import "contents/compactification.md"

---

@import "contents/function_space.md"

---

@import "contents/further_theorems.md"