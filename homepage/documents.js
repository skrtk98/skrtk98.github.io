// Each manuscript lives in its own repository and is published as a project site under this domain.
export const documents = [
  {
    group: "category",
    title: "速習圏論",
    href: "Category-Theory/Introduction-to-Category-Theory/",
    description: "対象と射、関手、自然変換、普遍性から圏論の基礎をたどる。",
  },
  {
    group: "category",
    title: "速習モノイダル圏論",
    href: "Category-Theory/Introduction-to-Monoidal-Category-Theory/",
    description: "モノイダル構造と、その上で展開される圏論を学ぶ。",
  },
  {
    group: "category",
    title: "速習モノイダル基底上の豊穣圏論",
    href: "Category-Theory/Introduction-to-Enriched-Categor-over-Monoidal-base-Theory/",
    description: "モノイダル圏を基底とする豊穣圏の基本概念を整理する。",
  },
  {
    group: "topology",
    title: "位相空間論",
    href: "Introduction-to-General-Topology/",
    description: "位相空間と連続写像から、収束、コンパクト性、距離化へ。",
  },
  {
    group: "topology",
    title: "分離公理の反例",
    href: "Introduction-to-General-Topology/Counterexamples-in-Separation-Axioms/",
    description: "具体的な反例を通して、分離公理の条件と関係を考える。",
  },
  {
    group: "algebra",
    title: "線形代数学入門",
    href: "Introduction-to-Linear-Algebra/",
    description: "数ベクトルと行列から、線形空間と線形写像、ベクトルの計量へ。",
  },
  {
    group: "analysis",
    title: "関数解析学",
    href: "Introduction-to-Functional-Analysis/",
    description: "Banach 空間、線形作用素、線形汎関数を扱う。",
  },
];

// Old URLs from the time when every manuscript was published from this repository.
export const redirects = {
  "Introduction-to-Category-Theory": "Category-Theory/Introduction-to-Category-Theory/",
  "Introduction-to-Monoidal-Category-Theory": "Category-Theory/Introduction-to-Monoidal-Category-Theory/",
  "Introduction-to-Enriched-Categor-over-Monoidal-base-Theory": "Category-Theory/Introduction-to-Enriched-Categor-over-Monoidal-base-Theory/",
  "Counterexamples-in-Separation-Axioms": "Introduction-to-General-Topology/Counterexamples-in-Separation-Axioms/",
};
