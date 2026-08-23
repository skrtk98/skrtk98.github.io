# Lean による原稿の検証

`manuscripts/Introduction-to-General-Topology.md` の定理と命題を Lean 4 と mathlib で形式化するプロジェクトである。

```sh
lake update
lake exe cache get
lake build
```

原稿の見出しと Lean の宣言は、各宣言の docstring で対応付ける。
証明に `sorry`、`axiom`、`opaque` は用いない。

現在は、順序集合のイデアルとフィルター、距離空間の収束、連続写像、連結性、可算性、点列、コンパクト性、Lindelöf 性、Baire 性、局所コンパクト性、コンパクト化、正規性、分割の一、関数空間、距離化に関する 39 件を検証している。
対応する宣言は `TopologyFormalization/OrderFilters.lean` と `TopologyFormalization/GeneralTopology.lean` に置く。
全 165 件の位相空間論の主張を対象に、原稿の定義を mathlib の定義へ対応付けながら追加する。
