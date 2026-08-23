/-
Copyright (c) 2026 Shun Ishida. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Shun Ishida
-/

import Mathlib

/-!
# 『位相空間論』の機械検証

原稿 `manuscripts/Introduction-to-General-Topology.md` の主張を、mathlib の定義で
形式化する。各定理には原稿中の見出しをコメントで対応付ける。
-/

namespace IntroductionToGeneralTopology

open Filter Set Topology

/-! ## 距離空間と収束 -/

/-- 原稿「一様連続写像は連続となる」。 -/
theorem uniformContinuous_continuous
    {X Y : Type*} [UniformSpace X] [UniformSpace Y] {f : X → Y}
    (hf : UniformContinuous f) : Continuous f :=
  hf.continuous

/-- 原稿「点列の極限の一意性」。 -/
theorem sequence_limit_unique
    {X : Type*} [TopologicalSpace X] [T2Space X]
    {u : ℕ → X} {a b : X}
    (ha : Tendsto u atTop (𝓝 a)) (hb : Tendsto u atTop (𝓝 b)) : a = b :=
  tendsto_nhds_unique ha hb

/-- 原稿「収束列は Cauchy 列」。 -/
theorem convergent_sequence_isCauchy
    {X : Type*} [PseudoMetricSpace X] {u : ℕ → X} {a : X}
    (hu : Tendsto u atTop (𝓝 a)) : CauchySeq u :=
  Metric.cauchySeq_iff.2 <| by
    intro ε hε
    obtain ⟨N, hN⟩ := (Metric.tendsto_atTop.1 hu) (ε / 2) (by linarith)
    exact ⟨N, fun m hm n hn ↦
      calc
        dist (u m) (u n) ≤ dist (u m) a + dist (u n) a := by
          simpa [dist_comm] using dist_triangle (u m) a (u n)
        _ < ε / 2 + ε / 2 := add_lt_add (hN m hm) (hN n hn)
        _ = ε := by ring⟩

/-! ## 連続写像 -/

/-- 原稿「連続写像の合成」。 -/
theorem continuous_comp
    {X Y Z : Type*} [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    {f : X → Y} {g : Y → Z} (hf : Continuous f) (hg : Continuous g) :
    Continuous (g ∘ f) :=
  hg.comp hf

/-- 原稿「連続性の開集合による特徴づけ」。 -/
theorem continuous_iff_preimage_isOpen
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] {f : X → Y} :
    Continuous f ↔ ∀ s : Set Y, IsOpen s → IsOpen (f ⁻¹' s) :=
  continuous_def

/-! ## 連結性 -/

/-- 原稿「連結空間の連続全射像」。 -/
theorem connected_continuous_surjective_image
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [ConnectedSpace X] {f : X → Y} (hf : Continuous f) (hs : Function.Surjective f) :
    ConnectedSpace Y :=
  connectedSpace_iff_univ.2 <| by
    rw [← Set.range_eq_univ.2 hs]
    simpa only [Set.image_univ] using isConnected_univ.image f hf.continuousOn

/-- 原稿「弧状連結なら連結である」。 -/
theorem pathConnected_connected
    {X : Type*} [TopologicalSpace X] [PathConnectedSpace X] : ConnectedSpace X :=
  inferInstance

/-! ## コンパクト性 -/

/-- 原稿「コンパクト性の連続全射像による保存」。 -/
theorem compact_continuous_surjective_image
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [CompactSpace X] {f : X → Y} (hf : Continuous f) (hs : Function.Surjective f) :
    CompactSpace Y :=
  ⟨by
    rw [← Set.range_eq_univ.2 hs]
    simpa only [Set.image_univ] using isCompact_univ.image hf⟩

/-- 原稿「コンパクト性の閉部分空間への遺伝」。 -/
theorem compact_closed_subspace
    {X : Type*} [TopologicalSpace X] [CompactSpace X] {s : Set X}
    (hs : IsClosed s) : CompactSpace s :=
  isCompact_iff_compactSpace.mp <| by
    simpa using (isCompact_univ.inter_right hs)

/-- 原稿「Hausdorff 空間のコンパクト部分集合」。 -/
theorem compact_set_isClosed
    {X : Type*} [TopologicalSpace X] [T2Space X] {s : Set X}
    (hs : IsCompact s) : IsClosed s :=
  hs.isClosed

/-- 原稿「コンパクト性から Lindelöf 性」。 -/
theorem compact_lindelof
    {X : Type*} [TopologicalSpace X] [CompactSpace X] : LindelofSpace X :=
  inferInstance

/-- 原稿「Lindelöf 性の連続全射像による保存」。 -/
theorem lindelof_continuous_surjective_image
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [LindelofSpace X] {f : X → Y} (hf : Continuous f) (hs : Function.Surjective f) :
    LindelofSpace Y :=
  LindelofSpace.of_continuous_surjective hf hs

/-- 原稿「Lindelöf 性の閉部分空間への遺伝」。 -/
theorem lindelof_closed_subspace
    {X : Type*} [TopologicalSpace X] [LindelofSpace X] {s : Set X}
    (hs : IsClosed s) : LindelofSpace s :=
  isLindelof_iff_lindelofSpace.mp hs.isLindelof

/-- 原稿「第二可算性から Lindelöf 性」。 -/
theorem secondCountable_lindelof
    {X : Type*} [TopologicalSpace X] [SecondCountableTopology X] : LindelofSpace X :=
  inferInstance

/-- 原稿「第二可算空間は可分である」。 -/
theorem secondCountable_separable
    {X : Type*} [TopologicalSpace X] [SecondCountableTopology X] :
    TopologicalSpace.SeparableSpace X :=
  inferInstance

/-- 原稿「第一可算空間は列型空間である」。 -/
theorem firstCountable_sequential
    {X : Type*} [TopologicalSpace X] [FirstCountableTopology X] : SequentialSpace X :=
  inferInstance

/-! ## Baire 空間とコンパクト化 -/

/-- 原稿「Baire のカテゴリー定理」。 -/
theorem complete_metric_baire
    {X : Type*} [PseudoMetricSpace X] [CompleteSpace X] : BaireSpace X :=
  inferInstance

/-- 原稿「局所コンパクト空間の Baire 性」。 -/
theorem t2_locallyCompact_baire
    {X : Type*} [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X] : BaireSpace X :=
  inferInstance

/-- 原稿「局所コンパクト性の閉部分空間への遺伝」。 -/
theorem locallyCompact_closed_subspace
    {X : Type*} [TopologicalSpace X] [LocallyCompactSpace X] {s : Set X}
    (hs : IsClosed s) : LocallyCompactSpace s :=
  hs.locallyCompactSpace

/-- 原稿「一点コンパクト化の性質」のコンパクト性。 -/
theorem onePoint_compact
    {X : Type*} [TopologicalSpace X] : CompactSpace (OnePoint X) :=
  inferInstance

/-- 原稿「一点コンパクト化の性質」の Hausdorff 性。 -/
theorem onePoint_t2
    {X : Type*} [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X] : T2Space (OnePoint X) :=
  inferInstance

/-- 原稿「一点コンパクト化の性質」の稠密性。 -/
theorem onePoint_denseRange_coe
    {X : Type*} [TopologicalSpace X] [NoncompactSpace X] :
    DenseRange ((↑) : X → OnePoint X) :=
  OnePoint.denseRange_coe

/-- 原稿「Stone--Čech コンパクト化の存在」のコンパクト Hausdorff 性。 -/
theorem stoneCech_compact_t2
    {X : Type*} [TopologicalSpace X] : CompactSpace (StoneCech X) ∧ T2Space (StoneCech X) :=
  ⟨inferInstance, inferInstance⟩

/-- 原稿「Stone--Čech コンパクト化の存在」の標準写像の連続性と稠密性。 -/
theorem stoneCech_unit_continuous_dense
    {X : Type*} [TopologicalSpace X] :
    Continuous (stoneCechUnit : X → StoneCech X) ∧
      DenseRange (stoneCechUnit : X → StoneCech X) :=
  ⟨continuous_stoneCechUnit, denseRange_stoneCechUnit⟩

/-- 原稿「Stone--Čech コンパクト化」の普遍性。 -/
theorem stoneCech_universal
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] [T2Space Y] [CompactSpace Y]
    {f : X → Y} (hf : Continuous f) :
    ∃ g : StoneCech X → Y, Continuous g ∧ g ∘ stoneCechUnit = f :=
  ⟨stoneCechExtend hf, continuous_stoneCechExtend hf, stoneCechExtend_extends hf⟩

/-- Stone--Čech 普遍性における延長の一意性。 -/
theorem stoneCech_extension_unique
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] [T2Space Y] [CompactSpace Y]
    {f : X → Y} (hf : Continuous f) {g : StoneCech X → Y} (hg : Continuous g)
    (hgf : g ∘ stoneCechUnit = f) : g = stoneCechExtend hf := by
  apply stoneCech_hom_ext hg (continuous_stoneCechExtend hf)
  rw [hgf, stoneCechExtend_extends]

/-! ## 正規性と連続関数 -/

/-- 原稿「Urysohn の補題」。 -/
theorem urysohn_lemma
    {X : Type*} [TopologicalSpace X] [NormalSpace X] {s t : Set X}
    (hs : IsClosed s) (ht : IsClosed t) (hst : Disjoint s t) :
    ∃ f : C(X, ℝ), EqOn f 0 s ∧ EqOn f 1 t ∧ ∀ x, f x ∈ Icc (0 : ℝ) 1 :=
  exists_continuous_zero_one_of_isClosed hs ht hst

/-- 原稿「Tietze の拡張定理」。 -/
theorem tietze_extension
    {X : Type*} [TopologicalSpace X] [NormalSpace X] {s : Set X}
    (hs : IsClosed s) (f : C(s, ℝ)) : ∃ g : C(X, ℝ), g.restrict s = f :=
  f.exists_restrict_eq hs

/-- 原稿「分割の一の存在定理」。 -/
theorem partition_of_unity_exists
    {X ι : Type*} [TopologicalSpace X] [NormalSpace X] [ParacompactSpace X]
    (U : ι → Set X) (hU_open : ∀ i, IsOpen (U i)) (hU_cover : Set.univ ⊆ ⋃ i, U i) :
    ∃ φ : PartitionOfUnity ι X Set.univ, φ.IsSubordinate U :=
  PartitionOfUnity.exists_isSubordinate isClosed_univ U hU_open hU_cover

/-! ## 関数空間 -/

/-- 原稿「評価写像」。 -/
theorem compactOpen_evaluation_continuous
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [LocallyCompactSpace X] [T2Space X] :
    Continuous (fun p : C(X, Y) × X ↦ p.1 p.2) :=
  continuous_eval

/-- 原稿「指数法則」のカリー化の向き。 -/
theorem compactOpen_curry_continuous
    {X Y Z : Type*} [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    [LocallyCompactSpace X] {f : Z × X → Y} (hf : Continuous f) :
    Continuous (fun z : Z ↦ (ContinuousMap.curry ⟨f, hf⟩) z) :=
  (ContinuousMap.curry ⟨f, hf⟩).continuous

/-- 原稿「指数法則」の非カリー化の向き。 -/
theorem compactOpen_uncurry_continuous
    {X Y Z : Type*} [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    [LocallyCompactSpace X] {g : Z → C(X, Y)} (hg : Continuous g) :
    Continuous (fun p : Z × X ↦ g p.1 p.2) :=
  continuous_eval.comp <| hg.prodMap continuous_id

/-! ## 距離化 -/

/-- 原稿「Urysohn の距離化定理」。

原稿の Kolmogorov 性、正則性、第二可算性は、それぞれ `T0Space`、`RegularSpace`、
`SecondCountableTopology` で表す。
-/
theorem urysohn_metrization
    {X : Type*} [TopologicalSpace X] [T0Space X] [RegularSpace X]
    [SecondCountableTopology X] : TopologicalSpace.MetrizableSpace X :=
  inferInstance

end IntroductionToGeneralTopology
