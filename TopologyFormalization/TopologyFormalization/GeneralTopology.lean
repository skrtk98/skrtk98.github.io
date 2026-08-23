/-
Copyright (c) 2026 Shun Ishida. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Shun Ishida
-/

import Mathlib
import Mathlib.Topology.UniformSpace.Completion
import Mathlib.Topology.MetricSpace.Completion
import Mathlib.Topology.MetricSpace.Sequences

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

/-! ## 可算コンパクト性 -/

/-- 原稿「可算コンパクト性の連続全射像による保存」。 -/
theorem countablyCompact_continuous_surjective_image
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] [CountablyCompactSpace X]
    {f : X → Y} (hf : Continuous f) (hs : Function.Surjective f) :
    CountablyCompactSpace Y := by
  constructor
  rw [← Set.range_eq_univ.2 hs]
  simpa only [Set.image_univ] using
    CountablyCompactSpace.isCountablyCompact_univ.image hf

/-- 原稿「可算コンパクト性の閉部分空間への遺伝」。 -/
theorem countablyCompact_closed_subspace
    {X : Type*} [TopologicalSpace X] [CountablyCompactSpace X] {s : Set X}
    (hs : IsClosed s) : IsCountablyCompact s :=
  hs.isCountablyCompact

/-- 原稿「コンパクト性から可算コンパクト性」。 -/
theorem compact_countablyCompact
    {X : Type*} [TopologicalSpace X] [CompactSpace X] : CountablyCompactSpace X :=
  inferInstance

/-! ## Lindelöf 性 -/

/-- 原稿「正則 Lindelöf 空間の正規性」。 -/
theorem regular_lindelof_normal
    {X : Type*} [TopologicalSpace X] [RegularSpace X] [LindelofSpace X] : NormalSpace X :=
  inferInstance

/-! ## 点列コンパクト性 -/

/-- 原稿「点列コンパクト性の連続全射像による保存」。 -/
theorem seqCompact_continuous_surjective_image
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] [SeqCompactSpace X]
    {f : X → Y} (hf : Continuous f) (hs : Function.Surjective f) : SeqCompactSpace Y := by
  constructor
  rw [← Set.range_eq_univ.2 hs]
  simpa only [Set.image_univ] using isSeqCompact_univ.image hf.seqContinuous

/-! ## 積空間 -/

/-- 原稿「Tychonoff の定理」のコンパクト性を保つ向き。 -/
theorem compact_pi
    {ι : Type*} {X : ι → Type*} [∀ i, TopologicalSpace (X i)]
    [∀ i, CompactSpace (X i)] : CompactSpace (∀ i, X i) :=
  inferInstance

/-! ## 開基 -/

/-- 原稿「部分集合族から開基の生成」。 -/
theorem subbasis_generates_basis
    {X : Type*} [t : TopologicalSpace X] (S : Set (Set X))
    (ht : t = TopologicalSpace.generateFrom S) :
    TopologicalSpace.IsTopologicalBasis
      ((fun F : Set (Set X) ↦ ⋂₀ F) '' {F : Set (Set X) | F.Finite ∧ F ⊆ S}) :=
  TopologicalSpace.isTopologicalBasis_of_subbasis ht

/-- 原稿「開基から開集合系の生成」の点ごとの特徴づけ。 -/
theorem basis_isOpen_iff
    {X : Type*} [TopologicalSpace X] {B : Set (Set X)}
    (hB : TopologicalSpace.IsTopologicalBasis B) {U : Set X} :
    IsOpen U ↔ ∀ x ∈ U, ∃ V ∈ B, x ∈ V ∧ V ⊆ U :=
  hB.isOpen_iff

/-! ## 誘導位相と余誘導位相 -/

/-- 原稿「誘導位相の連続写像による特徴づけ」。 -/
theorem continuous_to_induced_iff
    {A X Y : Type*} {tA : TopologicalSpace A} {tY : TopologicalSpace Y}
    {f : X → Y} {g : A → X} :
    Continuous[tA, TopologicalSpace.induced f tY] g ↔ Continuous[tA, tY] (f ∘ g) :=
  continuous_induced_rng

/-- 原稿「余誘導位相の連続写像による特徴づけ」。 -/
theorem continuous_from_coinduced_iff
    {X Y A : Type*} {tX : TopologicalSpace X} {tA : TopologicalSpace A}
    {f : X → Y} {g : Y → A} :
    Continuous[TopologicalSpace.coinduced f tX, tA] g ↔ Continuous[tX, tA] (g ∘ f) :=
  continuous_coinduced_dom

/-! ## 局所コンパクト性 -/

/-- 原稿「局所コンパクト性の近傍による特徴づけ」のコンパクト近傍部分。 -/
theorem locallyCompact_compact_nhds
    {X : Type*} [TopologicalSpace X] [LocallyCompactSpace X]
    {x : X} {U : Set X} (hU : U ∈ 𝓝 x) :
    ∃ K ∈ 𝓝 x, K ⊆ U ∧ IsCompact K :=
  local_compact_nhds hU

/-! ## 開核と閉包 -/

/-- 原稿「開核作用素と閉包作用素の関係」の位相空間での実現。 -/
theorem closure_compl_interior_compl
    {X : Type*} [TopologicalSpace X] (s : Set X) :
    closure s = (interior sᶜ)ᶜ :=
  closure_eq_compl_interior_compl

/-! ## Kolmogorov 商 -/

/-- 原稿「Kolmogorov 商の普遍性」の分離性。 -/
theorem kolmogorov_quotient_t0
    {X : Type*} [TopologicalSpace X] : T0Space (SeparationQuotient X) :=
  inferInstance

/-- 商写像を通る写像の連続性による普遍性。 -/
theorem quotient_continuous_iff
    {X Q Y : Type*} [TopologicalSpace X] [TopologicalSpace Q] [TopologicalSpace Y]
    {π : X → Q} (hπ : Topology.IsQuotientMap π) {g : Q → Y} :
    Continuous g ↔ Continuous (g ∘ π) :=
  hπ.continuous_iff

/-! ## 連結性 -/

/-- 原稿「中間値の定理」。 -/
theorem intermediate_value
    {X : Type*} [TopologicalSpace X] [ConnectedSpace X]
    {f : X → ℝ} (hf : Continuous f) {a b : X} {t : ℝ}
    (ht : t ∈ Icc (f a) (f b)) : ∃ c : X, f c = t := by
  rcases intermediate_value_univ a b hf ht with ⟨c, hc⟩
  exact ⟨c, hc⟩

/-- 原稿「連結成分の性質」の連結性。 -/
theorem connected_component_connected
    {X : Type*} [TopologicalSpace X] (x : X) : IsConnected (connectedComponent x) :=
  isConnected_connectedComponent

/-- 原稿「連結成分の性質」の最大性。 -/
theorem connected_subset_component
    {X : Type*} [TopologicalSpace X] {x : X} {s : Set X}
    (hs : IsConnected s) (hx : x ∈ s) : s ⊆ connectedComponent x :=
  hs.subset_connectedComponent hx

/-- 原稿「連結成分の性質」の閉性。 -/
theorem connected_component_isClosed
    {X : Type*} [TopologicalSpace X] (x : X) : IsClosed (connectedComponent x) :=
  isClosed_connectedComponent

/-! ## 既約性 -/

/-- 原稿「既約空間の特徴づけ」の稠密開集合による定式化。 -/
theorem preirreducible_open_dense_iff
    (X : Type*) [TopologicalSpace X] :
    PreirreducibleSpace X ↔ ∀ s : Set X, IsOpen s → s.Nonempty → Dense s :=
  preirreducibleSpace_iff_open_dense X

/-! ## 距離空間の可算性 -/

/-- 原稿「距離空間での Lindelöf 性・第二可算性・可分性」の可分性から第二可算性への向き。 -/
theorem metric_separable_secondCountable
    {X : Type*} [PseudoMetricSpace X] [TopologicalSpace.SeparableSpace X] :
    SecondCountableTopology X :=
  inferInstance

/-! ## 一様完備化 -/

/-- 原稿「一様完備化の存在」の完備性。 -/
theorem uniform_completion_complete
    {X : Type*} [UniformSpace X] : CompleteSpace (UniformSpace.Completion X) :=
  inferInstance

/-- 原稿「一様完備化の存在」の分離性。 -/
theorem uniform_completion_t0
    {X : Type*} [UniformSpace X] : T0Space (UniformSpace.Completion X) :=
  inferInstance

/-- 原稿「一様完備化の存在」の稠密な標準写像。 -/
theorem uniform_completion_dense
    {X : Type*} [UniformSpace X] : DenseRange ((↑) : X → UniformSpace.Completion X) :=
  UniformSpace.Completion.denseRange_coe

/-- 原稿「一様完備化の普遍性」の存在部分。 -/
theorem uniform_completion_extension
    {X Y : Type*} [UniformSpace X] [UniformSpace Y] [T0Space Y] [CompleteSpace Y]
    {f : X → Y} (hf : UniformContinuous f) :
    ∃ g : UniformSpace.Completion X → Y, UniformContinuous g ∧
      ∀ x : X, g (x : UniformSpace.Completion X) = f x :=
  ⟨UniformSpace.Completion.extension f, UniformSpace.Completion.uniformContinuous_extension,
    fun x ↦ UniformSpace.Completion.extension_coe hf x⟩

/-- 原稿「一様完備化の普遍性」の一意性部分。 -/
theorem uniform_completion_extension_unique
    {X Y : Type*} [UniformSpace X] [UniformSpace Y] [T0Space Y] [CompleteSpace Y]
    {f : X → Y} (hf : UniformContinuous f) {g : UniformSpace.Completion X → Y}
    (hg : UniformContinuous g) (h : ∀ x : X, f x = g (x : UniformSpace.Completion X)) :
    UniformSpace.Completion.extension f = g :=
  UniformSpace.Completion.extension_unique hf hg h

/-! ## Kolmogorov 商と分離性 -/

/-- 原稿「対称的」の mathlib における `R₀` による定式化。 -/
theorem kolmogorov_quotient_t1_iff_r0
    {X : Type*} [TopologicalSpace X] : T1Space (SeparationQuotient X) ↔ R0Space X :=
  SeparationQuotient.t1Space_iff

/-- 原稿「前正則性」の mathlib における `R₁` による定式化。 -/
theorem kolmogorov_quotient_t2_iff_r1
    {X : Type*} [TopologicalSpace X] : T2Space (SeparationQuotient X) ↔ R1Space X :=
  SeparationQuotient.t2Space_iff

/-! ## Cauchy フィルター -/

/-- 原稿「収束フィルターは Cauchy フィルター」のフィルター順序による定式化。 -/
theorem convergent_filter_isCauchy
    {X : Type*} [UniformSpace X] {F : Filter X} [NeBot F] {x : X}
    (hF : F ≤ 𝓝 x) : Cauchy F :=
  cauchy_nhds.mono hF

/-- 原稿「Cauchy フィルターの細分も Cauchy フィルター」。 -/
theorem cauchy_filter_refinement
    {X : Type*} [UniformSpace X] {F G : Filter X} [NeBot G]
    (hF : Cauchy F) (hGF : G ≤ F) : Cauchy G :=
  hF.mono hGF

/-! ## 一様連続性 -/

/-- 原稿「コンパクトな一様空間からの連続写像は一様連続」。 -/
theorem compact_uniformContinuous
    {X Y : Type*} [UniformSpace X] [UniformSpace Y] [CompactSpace X]
    {f : X → Y} (hf : Continuous f) : UniformContinuous f :=
  CompactSpace.uniformContinuous_of_continuous hf

/-! ## コンパクト性 -/

/-- 原稿「コンパクト性と同値な命題」の極大フィルターによる方向。 -/
theorem compact_ultrafilter_converges
    {X : Type*} [TopologicalSpace X] [CompactSpace X] (F : Ultrafilter X) :
    ∃ x : X, (↑F : Filter X) ≤ 𝓝 x := by
  obtain ⟨x, -, hx⟩ := isCompact_univ.ultrafilter_le_nhds F (by simp)
  exact ⟨x, hx⟩

/-! ## 距離空間の完備化 -/

/-- 原稿「完備化の存在性」の標準埋め込みが等長であること。 -/
theorem metric_completion_coe_isometry
    {X : Type*} [PseudoMetricSpace X] :
    Isometry ((↑) : X → UniformSpace.Completion X) :=
  UniformSpace.Completion.coe_isometry

/-! ## 距離位相 -/

/-- 原稿「距離位相による連続性の整合性」の ε--δ 定式化。 -/
theorem metric_continuous_iff
    {X Y : Type*} [PseudoMetricSpace X] [PseudoMetricSpace Y] {f : X → Y} :
    Continuous f ↔ ∀ x : X, ∀ ε > 0, ∃ δ > 0, ∀ y : X,
      dist y x < δ → dist (f y) (f x) < ε :=
  Metric.continuous_iff

/-! ## Stone--Čech コンパクト化 -/

/-- 原稿「有界実数値関数による特徴づけ」の必要性。 -/
theorem stoneCech_interval_extension
    {X : Type*} [TopologicalSpace X] {f : X → Set.Icc (0 : ℝ) 1}
    (hf : Continuous f) :
    ∃ g : StoneCech X → Set.Icc (0 : ℝ) 1, Continuous g ∧ g ∘ stoneCechUnit = f :=
  stoneCech_universal hf

/-! ## Bolzano--Weierstrass -/

/-- 原稿「Bolzano--Weierstrass の定理」の proper 距離空間での形。 -/
theorem bolzano_weierstrass
    {X : Type*} [PseudoMetricSpace X] [ProperSpace X] {s : Set X}
    (hs : Bornology.IsBounded s) {u : ℕ → X} (hu : ∀ n, u n ∈ s) :
    ∃ a ∈ closure s, ∃ φ : ℕ → ℕ, StrictMono φ ∧ Tendsto (u ∘ φ) atTop (𝓝 a) :=
  tendsto_subseq_of_bounded hs hu

end IntroductionToGeneralTopology
