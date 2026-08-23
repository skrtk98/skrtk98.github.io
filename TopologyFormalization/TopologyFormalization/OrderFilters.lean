/-
Copyright (c) 2026 Shun Ishida. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Shun Ishida
-/

import Mathlib.Order.Basic

/-!
# 順序集合のイデアルとフィルター

原稿 `manuscripts/Introduction-to-General-Topology.md` の「順序集合のイデアルと
フィルター」に現れる、生成操作と細分関係を形式化する。
-/

namespace IntroductionToGeneralTopology

variable {P : Type*} [Preorder P]

/-- 原稿のイデアル基。 -/
def IsIdealBasis (I : Set P) : Prop :=
  I.Nonempty ∧ ∀ ⦃x y : P⦄, x ∈ I → y ∈ I → ∃ z ∈ I, x ≤ z ∧ y ≤ z

/-- 原稿のイデアル。 -/
def IsIdeal (I : Set P) : Prop :=
  IsIdealBasis I ∧ ∀ ⦃x y : P⦄, x ∈ I → y ≤ x → y ∈ I

/-- イデアル基が生成する下方閉包。 -/
def generatedIdeal (I : Set P) : Set P := {x | ∃ i ∈ I, x ≤ i}

/-- 原稿「イデアル基の生成するイデアル」の、生成集合がイデアルである部分。 -/
theorem generatedIdeal_isIdeal {I : Set P} (hI : IsIdealBasis I) :
    IsIdeal (generatedIdeal I) := by
  constructor
  · constructor
    · rcases hI.1 with ⟨i, hi⟩
      exact ⟨i, i, hi, le_rfl⟩
    · rintro x y ⟨i, hi, hxi⟩ ⟨j, hj, hyj⟩
      rcases hI.2 hi hj with ⟨z, hz, hiz, hjz⟩
      exact ⟨z, ⟨z, hz, le_rfl⟩, ⟨le_trans hxi hiz, le_trans hyj hjz⟩⟩
  · rintro x y ⟨i, hi, hxi⟩ hyx
    exact ⟨i, hi, le_trans hyx hxi⟩

/-- 原稿「イデアル基の生成するイデアル」の最小性。 -/
theorem generatedIdeal_least {I J : Set P} (hJ : IsIdeal J) (hIJ : I ⊆ J) :
    generatedIdeal I ⊆ J := by
  rintro x ⟨i, hi, hxi⟩
  exact hJ.2 (hIJ hi) hxi

/-- 原稿のフィルター基。 -/
def IsFilterBasis (F : Set P) : Prop :=
  F.Nonempty ∧ ∀ ⦃x y : P⦄, x ∈ F → y ∈ F → ∃ z ∈ F, z ≤ x ∧ z ≤ y

/-- 原稿のフィルター。 -/
def IsFilter (F : Set P) : Prop :=
  IsFilterBasis F ∧ ∀ ⦃x y : P⦄, x ∈ F → x ≤ y → y ∈ F

/-- フィルター基が生成する上方閉包。 -/
def generatedFilter (F : Set P) : Set P := {x | ∃ f ∈ F, f ≤ x}

/-- 原稿「フィルター基の生成するフィルター」の、生成集合がフィルターである部分。 -/
theorem generatedFilter_isFilter {F : Set P} (hF : IsFilterBasis F) :
    IsFilter (generatedFilter F) := by
  constructor
  · constructor
    · rcases hF.1 with ⟨f, hf⟩
      exact ⟨f, f, hf, le_rfl⟩
    · rintro x y ⟨f, hf, hfx⟩ ⟨g, hg, hgy⟩
      rcases hF.2 hf hg with ⟨z, hz, zf, zg⟩
      exact ⟨z, ⟨z, hz, le_rfl⟩, ⟨le_trans zf hfx, le_trans zg hgy⟩⟩
  · rintro x y ⟨f, hf, hfx⟩ hxy
    exact ⟨f, hf, le_trans hfx hxy⟩

/-- 原稿「フィルター基の生成するフィルター」の最小性。 -/
theorem generatedFilter_least {F G : Set P} (hG : IsFilter G) (hFG : F ⊆ G) :
    generatedFilter F ⊆ G := by
  rintro x ⟨f, hf, hfx⟩
  exact hG.2 (hFG hf) hfx

/-- 原稿の細分関係。 -/
def Refines (A B : Set P) : Prop := ∀ ⦃a : P⦄, a ∈ A → ∃ b ∈ B, a ≤ b

/-- 原稿「細分関係」の反射性。 -/
theorem refines_refl (A : Set P) : Refines A A := fun _ ha ↦ ⟨_, ha, le_rfl⟩

/-- 原稿「細分関係」の推移性。 -/
theorem refines_trans {A B C : Set P} (hAB : Refines A B) (hBC : Refines B C) :
    Refines A C := by
  intro a ha
  rcases hAB ha with ⟨b, hb, hab⟩
  rcases hBC hb with ⟨c, hc, hbc⟩
  exact ⟨c, hc, hab.trans hbc⟩

end IntroductionToGeneralTopology
