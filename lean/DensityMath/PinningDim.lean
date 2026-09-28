/-
# 观察点钉扎 · 维数语义的线性承重层 (2026-09-28)
钉扎档层级表"维数语义面"（2 点→线 1 维/3 点→面 2 维/4 点→架 3 维+手性）的 Lean 形式级——
观察点钉扎线最大剩余结构增量 (诚实边界 6 的维数语义面清偿·物理对应面维持)。
对应: papers/钉扎维数语义_预注册_v0.1.md (定理群跑前锁定·T-D2 实例件按降级条款移出挂账) +
  papers/观察点钉扎层级_开放推演_v0.1.md (§三层级表·主人原话+涡外推) +
  papers/观察点钉扎层级_ObservationNet推广_v0.1.md (DualityNet.lean 25 件序结构面·本件续其维数语义面)。
内容 (五定理群·预注册判定矩阵落"一般式+手性自证"组合·T-D2 具体点实例件降级挂账):
  T-D1 钉扎维数定理 (一般式): k 点仿射独立族的钉扎维数 (vectorSpan finrank) = k−1
    ——层级表"连线(1 维)/面(2 维)/架(3 维)"的仿射几何承载 (Mathlib 现成件桥接重述·承重非掠美);
  T-D1c 钉扎维数上界 (不要求仿射独立): k 点钉扎维数 ≤ k−1
    ——层级表"单调下降"的维数面承载 (与 ObservationNet 序结构面对接);
  T-D3 饱和定理 (一般式): k = finrank+1 点仿射独立 ⟹ vectorSpan = ⊤
    ("静架显化完成·再加观察点不新增维数"——与 ObservationNet 饱和判据对接·Mathlib 桥接);
  T-D4a 旋转保手性: det M = 1 ⟹ det(M·A) = det A (四面体边向量阵·手性不变量在 SO(3) 不变);
  T-D4b 镜像变手性: det M = −1 ⟹ det(M·A) = −det A ("面的镜向不可读"的代数根源
    ——O(3) 两连通分支对手性不变量的两样行为);
  T-D4c 手性良定面: 边向量阵 A 可逆 ⟹ det A ≠ 0 (手性不变量在非退化四面体上良定)。
诚实边界:
  ① 仿射几何承载=数学标准内容 (T-D1/T-D3 为 Mathlib 现成件的语义桥接重述)——体系增量在
     钉扎语义对接 (层级表锚到仿射包维数) 与手性代数 (T-D4 自证);
  ② 手性承载=det 符号在 O(3) 两分支的行为——"不可读"的物理语义 (观察通道为何读不到 det
     符号) 不入域内 (操作内核承载·DimensionAxioms 同款);
  ③ 3 点情形手性缺席=面无 det 不变量 (2×2 边向量阵非方阵)——构造性事实如实标注非另立定理;
  ④ 物理层级表 (两体 SO(3)→SO(2) 约化) 留实例化层——诚实边界 6 的物理对应面不清偿;
  ⑤ T-D2 具体点实例件 (0,e1,e2,e3 仿射独立·subtype 判据) 编译预算内未闭合·按预注册降级
     条款移出本件挂账 (一般式 T-D1/T-D3 不依赖实例·语义承载不变);
  ⑥ 与 DualityNet.lean 的对接为语义层 (序结构面 25 件+本件维数语义面) 非形式依赖
     (独立代数件·增量扩域纪律)。
零 sorry (桥接重述+自证直积)。
-/
import Mathlib

namespace PinningDim

open Module Set AffineSubspace

/-! ## T-D1 钉扎维数定理（一般式·Mathlib 桥接重述） -/

/-- T-D1: 钉扎维数定理——k 个仿射独立观察点的钉扎维数（vectorSpan 的 finrank）= k−1。
层级表语义承载：2 点→连线 1 维/3 点→面 2 维/4 点→架 3 维（"显化的静"的维数）。 -/
theorem pinning_dim {d : ℕ} {ι : Type*} [Fintype ι] {p : ι → (Fin d → ℝ)}
    (hi : AffineIndependent ℝ p) {n : ℕ} (hc : Fintype.card ι = n + 1) :
    finrank ℝ (vectorSpan ℝ (Set.range p)) = n :=
  hi.finrank_vectorSpan hc

/-- T-D1c: 钉扎维数上界（一般点族·不要求仿射独立）——k 点钉扎维数 ≤ k−1
（层级表"单调下降"的维数面承载·与 ObservationNet 序结构面对接）。 -/
theorem pinning_dim_le {d : ℕ} {ι : Type*} [Fintype ι] (p : ι → (Fin d → ℝ)) {n : ℕ}
    (hc : Fintype.card ι = n + 1) :
    finrank ℝ (vectorSpan ℝ (Set.range p)) ≤ n := by
  have h := finrank_vectorSpan_image_finset_le ℝ p Finset.univ (by
    simpa [Fintype.card_fin] using hc)
  rw [Finset.coe_image, Finset.coe_univ, Set.image_univ] at h
  simpa using h

/-! ## T-D3 饱和定理（一般式·Mathlib 桥接） -/

/-- T-D3: 饱和——d 维空间中 k=finrank+1 个仿射独立观察点 ⟹ 钉扎维数空间全满（⊤）。
"静架显化完成·再加观察点不新增维数"（与 ObservationNet 饱和判据对接）。 -/
theorem saturate {d : ℕ} {ι : Type*} [Fintype ι] {p : ι → (Fin d → ℝ)}
    (hi : AffineIndependent ℝ p)
    (hc : Fintype.card ι = finrank ℝ (Fin d → ℝ) + 1) :
    vectorSpan ℝ (Set.range p) = ⊤ :=
  hi.vectorSpan_eq_top_of_card_eq_finrank_add_one hc

/-! ## T-D4 手性代数（det 符号=手性不变量·自证） -/

/-- T-D4a: 旋转保手性——det M = 1 ⟹ det(M·A) = det A。
四面体边向量阵 A 的 det 符号=手性；旋转群 SO(3)（det=+1 分支）不改手性。 -/
theorem chirality_rot_preserve {M A : Matrix (Fin 3) (Fin 3) ℝ}
    (hM : Matrix.det M = 1) :
    Matrix.det (M * A) = Matrix.det A := by
  rw [Matrix.det_mul, hM, one_mul]

/-- T-D4b: 镜像变手性——det M = −1 ⟹ det(M·A) = −det A。
O(3) 的 det=−1 分支（含镜面反射）翻转手性——"面的镜向不可读"的代数根源。 -/
theorem chirality_mirror_flip {M A : Matrix (Fin 3) (Fin 3) ℝ}
    (hM : Matrix.det M = -1) :
    Matrix.det (M * A) = -Matrix.det A := by
  rw [Matrix.det_mul, hM]
  ring

/-- T-D4c: 手性良定面——边向量阵可逆 ⟹ det ≠ 0（手性不变量在非退化四面体上良定；
可逆=仿射独立的方阵形态）。 -/
theorem chirality_welldef {A : Matrix (Fin 3) (Fin 3) ℝ} (hA : IsUnit A.det) :
    A.det ≠ 0 := by
  exact IsUnit.ne_zero hA

end PinningDim
