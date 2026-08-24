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

universe u

namespace IntroductionToGeneralTopology

open Filter Set Topology

/-! ## 距離空間と収束 -/

/-- 原稿「一様連続写像は連続となる」。 -/
theorem uniformContinuous_continuous
    {X Y : Type*} [UniformSpace X] [UniformSpace Y] {f : X → Y}
    (hf : UniformContinuous f) : Continuous f :=
  hf.continuous

/-- 原稿「一様連続性の特徴づけ」の近縁フィルターによる定式化。 -/
theorem uniformContinuous_iff_uniformity_le_comap
    {X Y : Type*} {uX : UniformSpace X} {uY : UniformSpace Y} {f : X → Y} :
    @UniformContinuous X Y uX uY f ↔ uX ≤ UniformSpace.comap f uY :=
  uniformContinuous_iff_le_comap

/-- 原稿「同程度連続な写像列の各点収束は連続写像をなす」のフィルター版。 -/
theorem equicontinuous_pointwise_limit_continuous
    {I X Y : Type*} [TopologicalSpace X] [UniformSpace Y]
    {F : I → X → Y} {f : X → Y} {l : Filter I} [NeBot l]
    (hF : Tendsto F l (𝓝 f)) (hEq : Equicontinuous F) :
    Continuous f :=
  hF.continuous_of_equicontinuous hEq

/-- 原稿「Heine--Borel の被覆定理の類似」で使う、コンパクト定義域上の一様収束判定。 -/
theorem equicontinuous_tendstoUniformly_iff_pointwise
    {I X Y : Type*} [TopologicalSpace X] [UniformSpace Y] [CompactSpace X]
    {F : I → X → Y} {f : X → Y} (hEq : Equicontinuous F) (l : Filter I) :
    Tendsto (UniformFun.ofFun ∘ F) l (𝓝 (UniformFun.ofFun f)) ↔
      Tendsto F l (𝓝 f) :=
  hEq.tendsto_uniformFun_iff_pi l f

/-- 原稿「Heine--Borel の被覆定理の類似」の Arzelà--Ascoli 型のコンパクト性判定。 -/
theorem arzelaAscoli_isCompact_of_equicontinuous
    {X Y : Type*} [TopologicalSpace X] [UniformSpace Y]
    (S : Set C(X, Y)) (hPointwiseCompact : IsCompact (ContinuousMap.toFun '' S))
    (hEq : Equicontinuous ((↑) : S → X → Y)) :
    IsCompact S :=
  ArzelaAscoli.isCompact_of_equicontinuous S hPointwiseCompact hEq

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

/-- 原稿「距離による完備性との整合性」の Cauchy 列に関する ε--N 特徴づけ。 -/
theorem metric_cauchySeq_iff
    {X : Type*} [PseudoMetricSpace X] {u : ℕ → X} :
    CauchySeq u ↔ ∀ ε > 0, ∃ N, ∀ m ≥ N, ∀ n ≥ N, dist (u m) (u n) < ε :=
  Metric.cauchySeq_iff

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

/-- 原稿「連続性」の開集合の逆像による保存。 -/
theorem continuous_preimage_isOpen
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {f : X → Y} (hf : Continuous f) {U : Set Y} (hU : IsOpen U) :
    IsOpen (f ⁻¹' U) :=
  hU.preimage hf

/-- 原稿「点での連続性」の近傍系による特徴づけ。 -/
theorem continuousAt_iff_preimage_nhds
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {f : X → Y} {x : X} :
    ContinuousAt f x ↔ ∀ V ∈ 𝓝 (f x), f ⁻¹' V ∈ 𝓝 x :=
  continuousAt_def

/-- 原稿「連続性」の各点での連続性による特徴づけ。 -/
theorem continuous_iff_forall_continuousAt
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] {f : X → Y} :
    Continuous f ↔ ∀ x : X, ContinuousAt f x :=
  continuous_iff_continuousAt

/-- 原稿「連続写像の合成」の点ごとの形。 -/
theorem continuousAt_comp
    {X Y Z : Type*} [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    {f : X → Y} {g : Y → Z} {x : X}
    (hf : ContinuousAt f x) (hg : ContinuousAt g (f x)) :
    ContinuousAt (g ∘ f) x :=
  hg.comp hf

/-! ## 連結性 -/

/-- 原稿「連結空間の連続全射像」。 -/
theorem connected_continuous_surjective_image
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [ConnectedSpace X] {f : X → Y} (hf : Continuous f) (hs : Function.Surjective f) :
    ConnectedSpace Y :=
  connectedSpace_iff_univ.2 <| by
    rw [← Set.range_eq_univ.2 hs]
    simpa only [Set.image_univ] using isConnected_univ.image f hf.continuousOn

/-- 原稿「連結性の特徴づけ」の空でなさと前連結性による定式化。 -/
theorem connectedSpace_iff_preconnected_nonempty
    (X : Type*) [TopologicalSpace X] :
    ConnectedSpace X ↔ PreconnectedSpace X ∧ Nonempty X :=
  connectedSpace_iff X

/-- 原稿「弧状連結なら連結である」。 -/
theorem pathConnected_connected
    {X : Type*} [TopologicalSpace X] [PathConnectedSpace X] : ConnectedSpace X :=
  inferInstance

/-- 原稿「道の性質」の弧状連結性の二点間の道による特徴づけ。 -/
theorem pathConnectedSpace_iff_nonempty_joined
    {X : Type*} [TopologicalSpace X] :
    PathConnectedSpace X ↔ Nonempty X ∧ ∀ x y : X, Joined x y :=
  pathConnectedSpace_iff X

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

/-- 原稿「開集合は点列開であり閉集合は点列閉」の閉集合側。 -/
theorem isClosed_isSeqClosed
    {X : Type*} [TopologicalSpace X] {A : Set X} (hA : IsClosed A) :
    IsSeqClosed A :=
  hA.isSeqClosed

/-- 原稿「列型空間」の点列閉集合による特徴づけ。 -/
theorem isSeqClosed_iff_isClosed_of_sequential
    {X : Type*} [TopologicalSpace X] [SequentialSpace X] {A : Set X} :
    IsSeqClosed A ↔ IsClosed A :=
  isSeqClosed_iff_isClosed

/-- 原稿「列型空間の特徴づけ」の連続性による定式化。 -/
theorem continuous_iff_seqContinuous_of_sequential
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] [SequentialSpace X]
    {f : X → Y} : Continuous f ↔ SeqContinuous f :=
  continuous_iff_seqContinuous

/-- 原稿「列型空間の特徴づけ」の商写像による保存方向。 -/
theorem quotient_sequentialSpace
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] [SequentialSpace X]
    {f : X → Y} (hf : Topology.IsQuotientMap f) : SequentialSpace Y :=
  hf.sequentialSpace

/-! ## Baire 空間とコンパクト化 -/

/-- 原稿「Baire のカテゴリー定理」。 -/
theorem complete_metric_baire
    {X : Type*} [PseudoMetricSpace X] [CompleteSpace X] : BaireSpace X :=
  inferInstance

/-- 原稿「局所コンパクト空間の Baire 性」。 -/
theorem t2_locallyCompact_baire
    {X : Type*} [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X] : BaireSpace X :=
  inferInstance

/-- 原稿「Baire のカテゴリー定理」の稠密開集合による定式化。 -/
theorem dense_iInter_of_isOpen_dense
    {X : Type*} [TopologicalSpace X] [BaireSpace X] {G : ℕ → Set X}
    (hG_open : ∀ n, IsOpen (G n)) (hG_dense : ∀ n, Dense (G n)) :
    Dense (⋂ n, G n) :=
  dense_iInter_of_isOpen_nat hG_open hG_dense

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

/-- 原稿「Stone--Čech コンパクト化の存在と一意性」の延長の一意性。 -/
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

/-- 原稿「Tietze の拡張定理」の値域を保つ形。 -/
theorem tietze_extension_Icc
    {X : Type*} [TopologicalSpace X] [NormalSpace X] {s : Set X}
    (hs : IsClosed s) (f : C(s, ℝ))
    (hf : ∀ x, f x ∈ Set.Icc (-1 : ℝ) 1) :
    ∃ g : C(X, ℝ), (∀ x, g x ∈ Set.Icc (-1 : ℝ) 1) ∧ g.restrict s = f :=
  f.exists_restrict_eq_forall_mem_of_closed hf ⟨-1, by simp⟩ hs

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

-- 原稿の Kolmogorov 性、正則性、第二可算性は、それぞれ `T0Space`、`RegularSpace`、
-- `SecondCountableTopology` で表す。
/-- 原稿「Urysohn の距離化定理」。 -/
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

/-- 原稿「可算コンパクト性と同値な命題」の無限集合による定式化。 -/
theorem countablyCompact_iff_infinite_subset_has_accPt
    {X : Type*} [TopologicalSpace X] [T1Space X] :
    CountablyCompactSpace X ↔
      ∀ A : Set X, A.Infinite → ∃ x ∈ Set.univ, AccPt x (Filter.principal A) := by
  rw [← isCountablyCompact_univ_iff]
  simpa using
    (isCountablyCompact_iff_infinite_subset_has_accPt (E := X) (A := Set.univ))

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

/-- 原稿「可算コンパクト性と同値な命題」の列型空間における方向。 -/
theorem sequential_countablyCompact_seqCompact
    {X : Type*} [TopologicalSpace X] [SequentialSpace X] [CountablyCompactSpace X] :
    SeqCompactSpace X :=
  inferInstance

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

/-- 原稿「誘導位相の構成」における標準写像の連続性。 -/
theorem continuous_to_induced
    {X Y : Type*} {f : X → Y} {tY : TopologicalSpace Y} :
    Continuous[TopologicalSpace.induced f tY, tY] f :=
  continuous_induced_dom

/-- 原稿「余誘導位相の連続写像による特徴づけ」。 -/
theorem continuous_from_coinduced_iff
    {X Y A : Type*} {tX : TopologicalSpace X} {tA : TopologicalSpace A}
    {f : X → Y} {g : Y → A} :
    Continuous[TopologicalSpace.coinduced f tX, tA] g ↔ Continuous[tX, tA] (g ∘ f) :=
  continuous_coinduced_dom

/-- 原稿「余誘導位相の構成」における標準写像の連続性。 -/
theorem continuous_from_coinduced
    {X Y : Type*} {f : X → Y} {tX : TopologicalSpace X} :
    Continuous[tX, TopologicalSpace.coinduced f tX] f :=
  continuous_coinduced_rng

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

/-- 原稿「商空間」の商写像を通る連続性による普遍性。 -/
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

/-- 原稿「局所連結性の性質」の近傍による特徴づけ。 -/
theorem locallyConnected_iff_connected_nhds
    {X : Type*} [TopologicalSpace X] :
    LocallyConnectedSpace X ↔ ∀ x : X, ∀ U ∈ 𝓝 x,
      ∃ V ∈ 𝓝 x, IsPreconnected V ∧ V ⊆ U :=
  locallyConnectedSpace_iff_connected_subsets

/-- 原稿「局所連結性の性質」の連結成分の開性。 -/
theorem connectedComponent_isOpen_of_locallyConnected
    {X : Type*} [TopologicalSpace X] [LocallyConnectedSpace X] (x : X) :
    IsOpen (connectedComponent x) :=
  isOpen_connectedComponent

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

/-- 原稿「コンパクト性と同値な命題」の超フィルターによる特徴づけ。 -/
theorem isCompact_iff_ultrafilter_converges
    {X : Type*} [TopologicalSpace X] (K : Set X) :
    IsCompact K ↔ ∀ F : Ultrafilter X, (F : Filter X) ≤ Filter.principal K →
      ∃ x ∈ K, (F : Filter X) ≤ 𝓝 x :=
  isCompact_iff_ultrafilter_le_nhds

/-- 原稿「コンパクト性」の有限開被覆による特徴づけ。 -/
theorem isCompact_iff_finite_open_subcover
    {X : Type u} [TopologicalSpace X] (K : Set X) :
    IsCompact K ↔ ∀ {ι : Type u} (U : ι → Set X), (∀ i, IsOpen (U i)) →
      K ⊆ ⋃ i, U i → ∃ t : Finset ι, K ⊆ ⋃ i ∈ t, U i :=
  isCompact_iff_finite_subcover

/-! ## 超フィルター -/

/-- 原稿「フィルターの両立」の `mathlib` における形。 -/
theorem filters_compatible_iff_inf_neBot
    {X : Type*} (F G : Filter X) :
    NeBot (F ⊓ G) ↔ ∀ ⦃s t : Set X⦄, s ∈ F → t ∈ G → (s ∩ t).Nonempty :=
  by
    constructor
    · intro h s t hs ht
      exact Filter.inf_neBot_iff.mp h hs ht
    · intro h
      exact Filter.inf_neBot_iff.mpr fun s hs t ht ↦ h hs ht

/-- 原稿「超フィルターの存在」の `mathlib` における形。 -/
theorem ultrafilter_exists_mem
    {X : Type*} {A : Set X} (hA : A.Nonempty) :
    ∃ F : Ultrafilter X, A ∈ (F : Filter X) := by
  obtain ⟨F, hF⟩ := Filter.exists_ultrafilter_iff.mpr hA.principal_neBot
  exact ⟨F, (Filter.le_principal_iff.mp hF)⟩

/-- 原稿「普遍部分ネットの存在」の超フィルターによる定式化。 -/
theorem exists_ultrafilter_refining
    {X : Type*} {F : Filter X} [NeBot F] :
    ∃ U : Ultrafilter X, (U : Filter X) ≤ F :=
  Filter.exists_ultrafilter_iff.mpr inferInstance

/-- 原稿「超フィルターの特徴づけ」(4) の `mathlib` における形。 -/
theorem ultrafilter_mem_or_compl_mem
    {X : Type*} (F : Ultrafilter X) (A : Set X) :
    A ∈ (F : Filter X) ∨ Aᶜ ∈ (F : Filter X) :=
  F.mem_or_compl_mem A

/-- 原稿「フィルターの像」で使う、真のフィルターの像の真性。 -/
theorem filter_map_neBot
    {X Y : Type*} (F : Filter X) [NeBot F] (f : X → Y) :
    NeBot (Filter.map f F) :=
  NeBot.map (by infer_instance) f

/-- 原稿「フィルターの像」の超フィルターの場合。 -/
theorem ultrafilter_map_mem_iff
    {X Y : Type*} (F : Ultrafilter X) (f : X → Y) (B : Set Y) :
    B ∈ (Ultrafilter.map f F : Filter Y) ↔ f ⁻¹' B ∈ (F : Filter X) :=
  Ultrafilter.mem_map

/-! ## フィルターの堆積点 -/

/-- 原稿「堆積点の特徴づけ」のフィルター順序による定式化。 -/
theorem clusterPt_iff_exists_refinement
    {X : Type*} [TopologicalSpace X] {F : Filter X} {x : X} :
    ClusterPt x F ↔ ∃ G : Filter X, NeBot G ∧ G ≤ F ∧ G ≤ 𝓝 x := by
  constructor
  · intro h
    change NeBot (𝓝 x ⊓ F) at h
    exact ⟨𝓝 x ⊓ F, h, inf_le_right, inf_le_left⟩
  · rintro ⟨G, hG, hGF, hGx⟩
    change NeBot (𝓝 x ⊓ F)
    exact hG.mono (le_inf hGx hGF)

/-- 原稿「フィルターの堆積点全体」の特徴づけ。 -/
theorem clusterPt_iff_forall_mem_closure
    {X : Type*} [TopologicalSpace X] {F : Filter X} {x : X} :
    ClusterPt x F ↔ ∀ s ∈ F, x ∈ closure s :=
  _root_.clusterPt_iff_forall_mem_closure

/-- 原稿「連続性のフィルターによる特徴づけ」。 -/
theorem continuousAt_iff_tendsto_filter
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] {f : X → Y} {x : X} :
    ContinuousAt f x ↔ ∀ F : Filter X, F ≤ 𝓝 x → Tendsto f F (𝓝 (f x)) := by
  constructor
  · intro hf F hF
    exact hf.mono_left hF
  · intro hf
    exact hf (𝓝 x) le_rfl

/-! ## 開球と境界 -/

/-- 原稿「距離の定める位相構造」の開球近傍基。 -/
theorem metric_nhds_basis_ball
    {X : Type*} [PseudoMetricSpace X] (x : X) :
    (𝓝 x).HasBasis (0 < ·) (Metric.ball x) :=
  Metric.nhds_basis_ball

/-- 原稿「境界」の第一式。 -/
theorem closure_eq_interior_union_frontier
    {X : Type*} [TopologicalSpace X] (A : Set X) :
    closure A = interior A ∪ frontier A :=
  _root_.closure_eq_interior_union_frontier A

/-- 原稿「境界」の第二式。 -/
theorem frontier_eq_closure_inter_closure
    {X : Type*} [TopologicalSpace X] (A : Set X) :
    frontier A = closure A ∩ closure Aᶜ :=
  _root_.frontier_eq_closure_inter_closure

/-- 原稿「境界」の閉包に関する包含。 -/
theorem closure_inter_subset
    {X : Type*} [TopologicalSpace X] (A B : Set X) :
    closure (A ∩ B) ⊆ closure A ∩ closure B :=
  _root_.closure_inter_subset

/-! ## フィルター基とネット -/

/-- 原稿のフィルター基による収束判定。 -/
theorem tendsto_iff_filter_bases
    {X Y I J : Type*} {F : Filter X} {G : Filter Y} {f : X → Y}
    {p : I → Prop} {s : I → Set X} {q : J → Prop} {t : J → Set Y}
    (hF : F.HasBasis p s) (hG : G.HasBasis q t) :
    Tendsto f F G ↔ ∀ j, q j → ∃ i, p i ∧ ∀ x ∈ s i, f x ∈ t j :=
  hF.tendsto_iff hG

/-- 原稿「連結成分の性質」で用いる、連結集合の閉包の連結性。 -/
theorem connected_closure
    {X : Type*} [TopologicalSpace X] {A : Set X} (hA : IsConnected A) :
    IsConnected (closure A) :=
  hA.closure

/-! ## 可算性 -/

/-- 原稿「可算公理」の第二可算性から第一可算性が従うこと。 -/
theorem secondCountable_firstCountable
    {X : Type*} [TopologicalSpace X] [SecondCountableTopology X] :
    FirstCountableTopology X :=
  inferInstance

/-! ## コンパクト性 -/

/-- 原稿「Dini の定理」の `mathlib` における一様収束の形。 -/
theorem dini_tendstoUniformly
    {X : Type*} [TopologicalSpace X] [CompactSpace X]
    {F : ℕ → X → ℝ} {f : X → ℝ}
    (hF_cont : ∀ n, Continuous (F n)) (hF_mono : Monotone F)
    (hf : Continuous f) (hconv : ∀ x, Tendsto (F · x) atTop (𝓝 (f x))) :
    TendstoUniformly F f atTop :=
  Monotone.tendstoUniformly_of_forall_tendsto hF_cont hF_mono hf hconv

/-! ## 関数空間 -/

/-- 原稿「各点収束」の積位相による定式化。 -/
theorem tendsto_pi_iff
    {A : Type*} {S : Type*} {X : S → Type*} [∀ s, TopologicalSpace (X s)]
    {F : Filter A} {f : A → ∀ s, X s} {g : ∀ s, X s} :
    Tendsto f F (𝓝 g) ↔ ∀ s, Tendsto (fun a ↦ f a s) F (𝓝 (g s)) :=
  tendsto_pi_nhds

/-! ## 距離空間の完備化 -/

/-- 原稿「完備化の存在性」の標準埋め込みが等長であること。 -/
theorem metric_completion_coe_isometry
    {X : Type*} [PseudoMetricSpace X] :
    Isometry ((↑) : X → UniformSpace.Completion X) :=
  UniformSpace.Completion.coe_isometry

/-- 原稿「完備化の存在性」の完備性、稠密性、等長性。 -/
theorem metric_completion_complete_dense_isometric
    {X : Type*} [PseudoMetricSpace X] :
    CompleteSpace (UniformSpace.Completion X) ∧
      DenseRange ((↑) : X → UniformSpace.Completion X) ∧
      Isometry ((↑) : X → UniformSpace.Completion X) :=
  ⟨inferInstance, UniformSpace.Completion.denseRange_coe, metric_completion_coe_isometry⟩

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

/-! ## 基本的な開閉集合と連続像 -/

/-- 原稿「開集合系」の任意和に関する公理。 -/
theorem isOpen_iUnion_of_isOpen
    {X ι : Type*} [TopologicalSpace X] {U : ι → Set X}
    (hU : ∀ i, IsOpen (U i)) :
    IsOpen (⋃ i, U i) :=
  isOpen_iUnion hU

/-- 原稿「開集合系」の有限交叉に関する公理。 -/
theorem isOpen_inter_of_isOpen
    {X : Type*} [TopologicalSpace X] {U V : Set X}
    (hU : IsOpen U) (hV : IsOpen V) : IsOpen (U ∩ V) :=
  hU.inter hV

/-- 原稿「閉集合系」の任意交叉に関する公理。 -/
theorem isClosed_iInter_of_isClosed
    {X ι : Type*} [TopologicalSpace X] {F : ι → Set X}
    (hF : ∀ i, IsClosed (F i)) :
    IsClosed (⋂ i, F i) :=
  isClosed_iInter hF

/-- 原稿「連続性」の閉集合による特徴づけの一方向。 -/
theorem continuous_preimage_isClosed
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {f : X → Y} (hf : Continuous f) {F : Set Y} (hF : IsClosed F) :
    IsClosed (f ⁻¹' F) :=
  hF.preimage hf

/-- 原稿「連結性」の連続像に関する集合版。 -/
theorem isConnected_continuous_image
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {A : Set X} (hA : IsConnected A) {f : X → Y} (hf : Continuous f) :
    IsConnected (f '' A) :=
  hA.image f hf.continuousOn

/-- 原稿「コンパクト性」の連続像に関する集合版。 -/
theorem isCompact_continuous_image
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {K : Set X} (hK : IsCompact K) {f : X → Y} (hf : Continuous f) :
    IsCompact (f '' K) :=
  hK.image hf

/-- 原稿「Hausdorff 空間のコンパクト部分集合」。 -/
theorem compact_subset_isClosed
    {X : Type*} [TopologicalSpace X] [T2Space X]
    {K : Set X} (hK : IsCompact K) : IsClosed K :=
  hK.isClosed

/-! ## 開核と閉包 -/

/-- 原稿「閉包作用素」の包含公理。 -/
theorem subset_closure_set
    {X : Type*} [TopologicalSpace X] (A : Set X) : A ⊆ closure A :=
  subset_closure

/-- 原稿「閉包作用素」の最小性。 -/
theorem closure_minimal_closed_superset
    {X : Type*} [TopologicalSpace X] {A F : Set X}
    (hAF : A ⊆ F) (hF : IsClosed F) : closure A ⊆ F :=
  closure_minimal hAF hF

/-- 原稿「閉包作用素」の閉性。 -/
theorem closure_isClosed
    {X : Type*} [TopologicalSpace X] (A : Set X) : IsClosed (closure A) :=
  isClosed_closure

/-- 原稿「開核作用素」の包含公理。 -/
theorem interior_subset_set
    {X : Type*} [TopologicalSpace X] (A : Set X) : interior A ⊆ A :=
  interior_subset

/-- 原稿「開核作用素」の最大性。 -/
theorem subset_interior_of_isOpen
    {X : Type*} [TopologicalSpace X] {U A : Set X}
    (hUA : U ⊆ A) (hU : IsOpen U) : U ⊆ interior A :=
  interior_maximal hUA hU

/-- 原稿「開核作用素」の開性。 -/
theorem interior_isOpen
    {X : Type*} [TopologicalSpace X] (A : Set X) : IsOpen (interior A) :=
  isOpen_interior

/-- 原稿「開集合と閉集合」の閉包による特徴づけ。 -/
theorem closure_eq_self_iff_isClosed
    {X : Type*} [TopologicalSpace X] (A : Set X) :
    closure A = A ↔ IsClosed A :=
  closure_eq_iff_isClosed

/-- 原稿「開集合と閉集合」の開核による特徴づけ。 -/
theorem interior_eq_self_iff_isOpen
    {X : Type*} [TopologicalSpace X] (A : Set X) :
    interior A = A ↔ IsOpen A :=
  interior_eq_iff_isOpen

/-- 原稿「閉包作用素」の有限和保存。 -/
theorem closure_union_set
    {X : Type*} [TopologicalSpace X] (A B : Set X) :
    closure (A ∪ B) = closure A ∪ closure B :=
  closure_union

/-- 原稿「開核作用素」の有限交叉保存。 -/
theorem interior_inter_set
    {X : Type*} [TopologicalSpace X] (A B : Set X) :
    interior (A ∩ B) = interior A ∩ interior B :=
  interior_inter

/-- 原稿「閉包作用素」の空集合保存。 -/
theorem closure_empty_set
    {X : Type*} [TopologicalSpace X] : closure (∅ : Set X) = ∅ :=
  closure_empty

/-- 原稿「開核作用素」の全体集合保存。 -/
theorem interior_univ_set
    {X : Type*} [TopologicalSpace X] : interior (Set.univ : Set X) = Set.univ :=
  interior_univ

/-- 原稿「閉包作用素」の全体集合保存。 -/
theorem closure_univ_set
    {X : Type*} [TopologicalSpace X] : closure (Set.univ : Set X) = Set.univ :=
  closure_univ

/-- 原稿「開核作用素」の空集合保存。 -/
theorem interior_empty_set
    {X : Type*} [TopologicalSpace X] : interior (∅ : Set X) = ∅ :=
  interior_empty

/-- 原稿「閉包作用素」の冪等性。 -/
theorem closure_idempotent
    {X : Type*} [TopologicalSpace X] (A : Set X) :
    closure (closure A) = closure A :=
  closure_closure

/-- 原稿「開核作用素」の冪等性。 -/
theorem interior_idempotent
    {X : Type*} [TopologicalSpace X] (A : Set X) :
    interior (interior A) = interior A :=
  interior_interior

/-- 原稿「閉包作用素」の単調性。 -/
theorem closure_mono_set
    {X : Type*} [TopologicalSpace X] {A B : Set X} (hAB : A ⊆ B) :
    closure A ⊆ closure B :=
  closure_mono hAB

/-- 原稿「開核作用素」の単調性。 -/
theorem interior_mono_set
    {X : Type*} [TopologicalSpace X] {A B : Set X} (hAB : A ⊆ B) :
    interior A ⊆ interior B :=
  interior_mono hAB

/-- 原稿「開核作用素と閉包作用素の関係」の補集合版その一。 -/
theorem closure_compl_eq_compl_interior
    {X : Type*} [TopologicalSpace X] (A : Set X) :
    closure Aᶜ = (interior A)ᶜ :=
  closure_compl

/-- 原稿「開核作用素と閉包作用素の関係」の補集合版その二。 -/
theorem interior_compl_eq_compl_closure
    {X : Type*} [TopologicalSpace X] (A : Set X) :
    interior Aᶜ = (closure A)ᶜ :=
  interior_compl

/-! ## 稠密性 -/

/-- 原稿「閉包の連続写像による挙動」。 -/
theorem continuous_image_closure_subset_closure_image
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {f : X → Y} (hf : Continuous f) (A : Set X) :
    f '' closure A ⊆ closure (f '' A) :=
  image_closure_subset_closure_image hf

/-- 原稿「稠密な写像の合成」。 -/
theorem denseRange_comp
    {A X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {f : A → X} {g : X → Y}
    (hf : DenseRange f) (hg : DenseRange g) (hgc : Continuous g) :
    DenseRange (g ∘ f) :=
  hg.comp hf hgc

/-- 原稿「稠密性」の閉包による特徴づけ。 -/
theorem dense_iff_closure_univ
    {X : Type*} [TopologicalSpace X] (A : Set X) :
    Dense A ↔ closure A = Set.univ :=
  dense_iff_closure_eq

/-! ## フィルターの像・逆像と収束 -/

/-- 原稿「フィルターによる連続性」で用いる収束の逆像による特徴づけ。 -/
theorem tendsto_iff_preimage_mem
    {X Y : Type*} {f : X → Y} {F : Filter X} {G : Filter Y} :
    Tendsto f F G ↔ ∀ V : Set Y, V ∈ G → f ⁻¹' V ∈ F :=
  Filter.tendsto_def

/-- 原稿「フィルターの像」の所属判定。 -/
theorem mem_filter_map_iff
    {X Y : Type*} {f : X → Y} {F : Filter X} {V : Set Y} :
    V ∈ Filter.map f F ↔ f ⁻¹' V ∈ F :=
  Filter.mem_map

/-- 原稿「フィルターの逆像」の所属判定。 -/
theorem mem_filter_comap_iff
    {X Y : Type*} {f : X → Y} {G : Filter Y} {U : Set X} :
    U ∈ Filter.comap f G ↔ ∃ V ∈ G, f ⁻¹' V ⊆ U :=
  Filter.mem_comap

/-- 原稿「ネットとフィルターの合成」に対応する収束の合成則。 -/
theorem tendsto_comp
    {X Y Z : Type*} {f : X → Y} {g : Y → Z}
    {F : Filter X} {G : Filter Y} {H : Filter Z}
    (hf : Tendsto f F G) (hg : Tendsto g G H) :
    Tendsto (g ∘ f) F H :=
  hg.comp hf

/-! ## 関数列の収束 -/

/-- 原稿「一様収束なら各点収束」のフィルターによる定式化。 -/
theorem tendstoUniformly_tendsto_at
    {I X Y : Type*} [UniformSpace Y]
    {F : I → X → Y} {f : X → Y} {l : Filter I}
    (hF : TendstoUniformly F f l) (x : X) :
    Tendsto (fun i ↦ F i x) l (𝓝 (f x)) :=
  hF.tendsto_at x

/-- 原稿「各点収束」で用いる積位相の評価写像の連続性。 -/
theorem continuous_pi_evaluation
    {S : Type*} {X : S → Type*} [∀ s, TopologicalSpace (X s)] (s : S) :
    Continuous (fun f : ∀ s, X s ↦ f s) :=
  continuous_apply s

/-! ## 距離位相の球 -/

/-- 原稿「距離の定める位相構造」の開球の開性。 -/
theorem metric_ball_isOpen
    {X : Type*} [PseudoMetricSpace X] (x : X) (r : ℝ) :
    IsOpen (Metric.ball x r) :=
  Metric.isOpen_ball

/-- 原稿「距離の定める位相構造」の閉球の閉性。 -/
theorem metric_closedBall_isClosed
    {X : Type*} [PseudoMetricSpace X] (x : X) (r : ℝ) :
    IsClosed (Metric.closedBall x r) :=
  Metric.isClosed_closedBall

/-- 原稿「距離の定める位相構造」の球の包含関係。 -/
theorem metric_ball_subset_closedBall
    {X : Type*} [PseudoMetricSpace X] (x : X) (r : ℝ) :
    Metric.ball x r ⊆ Metric.closedBall x r :=
  Metric.ball_subset_closedBall

/-! ## 距離空間におけるコンパクト性の同値 -/

/-- 原稿「コンパクト性から可算コンパクト性」の部分集合版。 -/
theorem isCompact_isCountablyCompact
    {X : Type*} [TopologicalSpace X] {K : Set X}
    (hK : IsCompact K) : IsCountablyCompact K :=
  hK.isCountablyCompact

/-- 原稿「距離空間でコンパクトなら点列コンパクト」の一般化。 -/
theorem isCompact_isSeqCompact
    {X : Type*} [TopologicalSpace X] [FirstCountableTopology X] {K : Set X}
    (hK : IsCompact K) : IsSeqCompact K :=
  hK.isSeqCompact

/-- 原稿「距離空間で点列コンパクトならコンパクト」の擬距離化可能空間版。 -/
theorem isSeqCompact_isCompact
    {X : Type*} [TopologicalSpace X] [TopologicalSpace.PseudoMetrizableSpace X]
    {K : Set X} (hK : IsSeqCompact K) : IsCompact K :=
  hK.isCompact

/-- 原稿「距離空間におけるコンパクト性の同値」の空間全体版。 -/
theorem seqCompact_compact
    {X : Type*} [TopologicalSpace X] [TopologicalSpace.PseudoMetrizableSpace X]
    [SeqCompactSpace X] : CompactSpace X :=
  ⟨SeqCompactSpace.isSeqCompact_univ.isCompact⟩

/-! ## 連結集合の貼り合わせ -/

/-- 原稿「連結集合の貼り合わせ」の二集合版。 -/
theorem isConnected_union_of_nonempty_inter
    {X : Type*} [TopologicalSpace X] {A B : Set X}
    (hAB : (A ∩ B).Nonempty) (hA : IsConnected A) (hB : IsConnected B) :
    IsConnected (A ∪ B) :=
  hA.union hAB hB

/-- 原稿「連結集合の貼り合わせ」の前連結版。 -/
theorem isPreconnected_union_of_mem
    {X : Type*} [TopologicalSpace X] {A B : Set X} {x : X}
    (hxA : x ∈ A) (hxB : x ∈ B)
    (hA : IsPreconnected A) (hB : IsPreconnected B) :
    IsPreconnected (A ∪ B) :=
  IsPreconnected.union x hxA hxB hA hB

/-- 原稿「連結成分の性質」の基点の所属。 -/
theorem mem_connectedComponent_self
    {X : Type*} [TopologicalSpace X] (x : X) : x ∈ connectedComponent x :=
  mem_connectedComponent

/-! ## 正規性と分離関数 -/

/-- 原稿「正規空間は完全正則」の `T₁` 版。 -/
theorem normal_t1_completelyRegular
    {X : Type*} [TopologicalSpace X] [NormalSpace X] [T1Space X] :
    CompletelyRegularSpace X :=
  inferInstance

/-- 原稿「完全正規 (perfectly normal)」の閉集合が $G_\delta$ となる方向。 -/
theorem perfectlyNormal_closed_isGDelta
    {X : Type*} [TopologicalSpace X] [PerfectlyNormalSpace X]
    {F : Set X} (hF : IsClosed F) : IsGδ F :=
  hF.isGδ

/-- 原稿「遺伝的正規性の特徴づけ」に関係する完全正規性の帰結。 -/
theorem perfectlyNormal_completelyNormal
    {X : Type*} [TopologicalSpace X] [PerfectlyNormalSpace X] :
    CompletelyNormalSpace X :=
  inferInstance

/-- 原稿「遺伝的正規性の特徴づけ」の部分空間による定式化。 -/
theorem completelyNormal_iff_hereditarilyNormal
    {X : Type*} [TopologicalSpace X] :
    CompletelyNormalSpace X ↔ ∀ s : Set X, NormalSpace s :=
  completelyNormalSpace_iff_forall_normalSpace

/-- 原稿「完全正規 (perfectly normal)」の閉集合による定式化。 -/
theorem perfectlyNormal_iff_normal_closed_isGDelta
    {X : Type*} [TopologicalSpace X] :
    PerfectlyNormalSpace X ↔
      NormalSpace X ∧ ∀ s : Set X, IsClosed s → IsGδ s := by
  constructor
  · intro h
    exact ⟨inferInstance, fun s hs => @IsClosed.isGδ X _ h s hs⟩
  · rintro ⟨hnormal, hgd⟩
    exact { toNormalSpace := hnormal, closed_gdelta := fun {s} hs => hgd s hs }

/-- 原稿「完全正規 (perfectly normal)」の零集合表示。 -/
theorem perfectlyNormal_iff_closed_is_zero_set
    {X : Type*} [TopologicalSpace X] :
    PerfectlyNormalSpace X ↔
      ∀ s : Set X, IsClosed s → ∃ f : C(X, ℝ),
        s = f ⁻¹' {0} ∧ ∀ x, f x ∈ Icc (0 : ℝ) 1 :=
  perfectlyNormalSpace_iff_forall_isClosed_preimage_zero

/-- 原稿「正規性」で使う閉集合と開集合の縮小補題。 -/
theorem normal_exists_open_closure_subset
    {X : Type*} [TopologicalSpace X] [NormalSpace X]
    {F U : Set X} (hF : IsClosed F) (hU : IsOpen U) (hFU : F ⊆ U) :
    ∃ V : Set X, IsOpen V ∧ F ⊆ V ∧ closure V ⊆ U :=
  normal_exists_closure_subset hF hU hFU

/-! ## Cauchy フィルターによる完備性 -/

/-- 原稿「Cauchy フィルター」の近縁による特徴づけ。 -/
theorem cauchy_filter_iff
    {X : Type*} [UniformSpace X] {F : Filter X} :
    Cauchy F ↔ NeBot F ∧ ∀ U ∈ uniformity X, ∃ A ∈ F, A ×ˢ A ⊆ U :=
  cauchy_iff

/-- 原稿「完備性」の Cauchy フィルターによる定式化。 -/
theorem complete_cauchy_filter_converges
    {X : Type*} [UniformSpace X] [CompleteSpace X]
    {F : Filter X} [NeBot F] (hF : Cauchy F) :
    ∃ x : X, F ≤ 𝓝 x :=
  cauchy_iff_exists_le_nhds.mp hF

/-! ## 局所有限族 -/

/-- 原稿「局所有限性の連続逆像による保存」。 -/
theorem locallyFinite_preimage_continuous
    {ι X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {S : ι → Set Y} {f : X → Y}
    (hS : LocallyFinite S) (hf : Continuous f) :
    LocallyFinite (fun i ↦ f ⁻¹' S i) :=
  hS.preimage_continuous hf

/-- 原稿「局所有限族の閉包」の局所有限性。 -/
theorem locallyFinite_closure
    {ι X : Type*} [TopologicalSpace X] {S : ι → Set X}
    (hS : LocallyFinite S) : LocallyFinite (fun i ↦ closure (S i)) :=
  hS.closure

/-- 原稿「局所有限族の閉包」で用いる閉包への包含。 -/
theorem iUnion_closure_subset_closure_iUnion
    {ι X : Type*} [TopologicalSpace X] (S : ι → Set X) :
    (⋃ i, closure (S i)) ⊆ closure (⋃ i, S i) := by
  intro x hx
  rw [Set.mem_iUnion] at hx
  rcases hx with ⟨i, hxi⟩
  exact closure_mono (Set.subset_iUnion S i) hxi

/-! ## 被覆と星型集合 -/

namespace Covering

/-- 原稿の被覆における部分集合の星。 -/
def star {X : Type*} (U : Set (Set X)) (A : Set X) : Set X :=
  ⋃₀ {V : Set X | V ∈ U ∧ (V ∩ A).Nonempty}

/-- 被覆の細分関係。 -/
def Refines {X : Type*} (U V : Set (Set X)) : Prop :=
  ∀ u ∈ U, ∃ v ∈ V, u ⊆ v

/-- 被覆性を点ごとに表した述語。 -/
def IsCover {X : Type*} (U : Set (Set X)) : Prop :=
  ∀ x : X, ∃ V ∈ U, x ∈ V

/-- 被覆の逆像。 -/
def preimage {X Y : Type*} (f : X → Y) (U : Set (Set Y)) : Set (Set X) :=
  {A : Set X | ∃ V ∈ U, A = f ⁻¹' V}

/-- 被覆の各元の星からなる被覆。 -/
def starCover {X : Type*} (U : Set (Set X)) : Set (Set X) :=
  {A : Set X | ∃ V ∈ U, A = star U V}

/-- 原稿「細分関係」の反射性。 -/
theorem refines_refl {X : Type*} (U : Set (Set X)) : Refines U U := by
  intro V hVU
  exact ⟨V, hVU, Set.Subset.rfl⟩

/-- 原稿「細分関係」の推移性。 -/
theorem refines_trans
    {X : Type*} {U V W : Set (Set X)}
    (hUV : Refines U V) (hVW : Refines V W) : Refines U W := by
  intro A hAU
  obtain ⟨B, hBV, hAB⟩ := hUV A hAU
  obtain ⟨C, hCW, hBC⟩ := hVW B hBV
  exact ⟨C, hCW, hAB.trans hBC⟩

/-- 原稿「星型集合」の所属条件の展開。 -/
theorem mem_star_iff
    {X : Type*} {U : Set (Set X)} {A : Set X} {x : X} :
    x ∈ star U A ↔ ∃ V ∈ U, (V ∩ A).Nonempty ∧ x ∈ V := by
  rw [star, Set.mem_sUnion]
  simp only [Set.mem_ofPred_eq]
  constructor
  · rintro ⟨V, ⟨hV, hVA⟩, hxV⟩
    exact ⟨V, hV, hVA, hxV⟩
  · rintro ⟨V, hV, hVA, hxV⟩
    exact ⟨V, ⟨hV, hVA⟩, hxV⟩

/-- 原稿「星型集合」の一点星による分解。 -/
theorem star_eq_iUnion_point
    {X : Type*} (U : Set (Set X)) (A : Set X) :
    star U A = ⋃ a ∈ A, star U ({a} : Set X) := by
  ext x
  constructor
  · rw [mem_star_iff]
    rintro ⟨V, hV, ⟨a, haV, haA⟩, hxV⟩
    rw [Set.mem_iUnion]
    refine ⟨a, ?_⟩
    rw [Set.mem_iUnion]
    refine ⟨haA, ?_⟩
    rw [mem_star_iff]
    exact ⟨V, hV, ⟨a, haV, rfl⟩, hxV⟩
  · rw [Set.mem_iUnion]
    rintro ⟨a, hxa⟩
    rw [Set.mem_iUnion] at hxa
    rcases hxa with ⟨haA, hxa⟩
    rw [mem_star_iff] at hxa ⊢
    rcases hxa with ⟨V, hV, ⟨z, hzV, hza⟩, hxV⟩
    have hza' : z = a := Set.mem_singleton_iff.mp hza
    subst z
    exact ⟨V, hV, ⟨a, hzV, haA⟩, hxV⟩

/-- 原稿「細分と星」の単調性。 -/
theorem star_mono_of_refines
    {X : Type*} {U V : Set (Set X)} {A B : Set X}
    (hUV : ∀ u ∈ U, ∃ v ∈ V, u ⊆ v) (hAB : A ⊆ B) :
    star U A ⊆ star V B := by
  intro x hx
  rw [mem_star_iff] at hx ⊢
  rcases hx with ⟨u, huU, ⟨a, hau, haA⟩, hxu⟩
  obtain ⟨v, hvV, huv⟩ := hUV u huU
  exact ⟨v, hvV, ⟨a, huv hau, hAB haA⟩, huv hxu⟩

/-- 原稿「星型集合」の集合引数に関する単調性。 -/
theorem star_mono_right
    {X : Type*} {U : Set (Set X)} {A B : Set X} (hAB : A ⊆ B) :
    star U A ⊆ star U B :=
  star_mono_of_refines (refines_refl U) hAB

/-- 原稿「一点星の対称性」。 -/
theorem mem_star_singleton_comm
    {X : Type*} (U : Set (Set X)) (x y : X) :
    x ∈ star U ({y} : Set X) ↔ y ∈ star U ({x} : Set X) := by
  constructor <;> intro h <;> rw [mem_star_iff] at h ⊢
  · rcases h with ⟨V, hV, ⟨z, hzV, hzy⟩, hxV⟩
    have hzy' : z = y := Set.mem_singleton_iff.mp hzy
    subst z
    exact ⟨V, hV, ⟨x, hxV, by simp⟩, hzV⟩
  · rcases h with ⟨V, hV, ⟨z, hzV, hzx⟩, hyV⟩
    have hzx' : z = x := Set.mem_singleton_iff.mp hzx
    subst z
    exact ⟨V, hV, ⟨y, hyV, by simp⟩, hzV⟩

/-- 原稿「開被覆に対する閉包の星への包含」。 -/
theorem closure_subset_star
    {X : Type*} [TopologicalSpace X] {U : Set (Set X)} {A : Set X}
    (hcover : ∀ x : X, ∃ V ∈ U, x ∈ V)
    (hopen : ∀ V ∈ U, IsOpen V) :
    closure A ⊆ star U A := by
  intro x hx
  obtain ⟨V, hVU, hxV⟩ := hcover x
  rw [mem_star_iff]
  exact ⟨V, hVU, (mem_closure_iff.mp hx V (hopen V hVU) hxV), hxV⟩

/-- 原稿「写像による星細分の保存」で用いる星と逆像の包含。 -/
theorem star_preimage_subset_preimage_star
    {X Y : Type*} {f : X → Y} {U : Set (Set Y)} {A : Set Y} :
    star (preimage f U) (f ⁻¹' A) ⊆ f ⁻¹' (star U A) := by
  intro x hx
  rw [mem_star_iff] at hx
  rcases hx with ⟨W, hW, ⟨z, hzW, hzA⟩, hxW⟩
  rcases hW with ⟨V, hVU, rfl⟩
  change f z ∈ V at hzW
  change f z ∈ A at hzA
  change f x ∈ V at hxW
  change f x ∈ star U A
  rw [mem_star_iff]
  exact ⟨V, hVU, ⟨f z, hzW, hzA⟩, hxW⟩

/-- 原稿「写像による星細分の保存」の被覆版。 -/
theorem starCover_preimage_refines
    {X Y : Type*} {f : X → Y} {U V : Set (Set Y)}
    (hUV : Refines (starCover U) V) :
    Refines (starCover (preimage f U)) (preimage f V) := by
  intro A hA
  rcases hA with ⟨W, hW, rfl⟩
  rcases hW with ⟨S, hSU, rfl⟩
  obtain ⟨V', hV'V, hSV'⟩ := hUV (star U S) ⟨S, hSU, rfl⟩
  refine ⟨f ⁻¹' V', ⟨V', hV'V, rfl⟩, ?_⟩
  exact (star_preimage_subset_preimage_star (f := f) (U := U) (A := S)).trans
    (Set.preimage_mono hSV')

/-- 原稿「星型細分」に現れる星被覆も被覆である。 -/
theorem isCover_starCover
    {X : Type*} {U : Set (Set X)} (hU : IsCover U) :
    IsCover (starCover U) := by
  intro x
  obtain ⟨V, hVU, hxV⟩ := hU x
  refine ⟨star U V, ⟨V, hVU, rfl⟩, ?_⟩
  rw [mem_star_iff]
  exact ⟨V, hVU, ⟨x, hxV, hxV⟩, hxV⟩

/-- 原稿「連続全射像・逆像の被覆操作」で用いる逆像被覆の被覆性。 -/
theorem isCover_preimage
    {X Y : Type*} {f : X → Y} {U : Set (Set Y)}
    (hU : IsCover U) :
    IsCover (preimage f U) := by
  intro x
  obtain ⟨V, hVU, hfxV⟩ := hU (f x)
  exact ⟨f ⁻¹' V, ⟨V, hVU, rfl⟩, hfxV⟩

end Covering

/-! ## 小さい帰納次元 -/

/-- 原稿「小さい帰納次元」の mathlib における次数高々 `n` の特徴づけ。 -/
theorem small_inductive_dimension_le_iff
    {X : Type*} [TopologicalSpace X] {n : ℕ} :
    smallInductiveDimension X ≤ n ↔ HasSmallInductiveDimensionLE X n :=
  smallInductiveDimension_le_iff

/-- 原稿「零次元空間の特徴づけ」の小さい帰納次元による可閉基の特徴づけ。 -/
theorem small_inductive_dimension_zero_iff_clopen_basis
    {X : Type*} [TopologicalSpace X] :
    HasSmallInductiveDimensionLE X 0 ↔
      TopologicalSpace.IsTopologicalBasis {U : Set X | IsClopen U} :=
  hasSmallInductiveDimensionLT_one_iff

/-- 原稿「小さい帰納次元」の空空間における値。 -/
theorem small_inductive_dimension_eq_bot_iff
    {X : Type*} [TopologicalSpace X] :
    smallInductiveDimension X = ⊥ ↔ IsEmpty X :=
  smallInductiveDimension_eq_bot

end IntroductionToGeneralTopology
