# Personal Mathematical Documents

<https://skrtk98.github.io/> のトップページを管理する。

原稿は原稿ごとのリポジトリで管理し、各リポジトリが `https://skrtk98.github.io/<リポジトリ名>/` に GitHub Pages として公開する。
このリポジトリは、それらへのリンク一覧と、旧 URL からの転送ページだけを公開する。

## 原稿のリポジトリ

| リポジトリ | 公開 URL | 内容 |
|---|---|---|
| [Category-Theory](https://github.com/skrtk98/Category-Theory) | `/Category-Theory/` | 速習圏論、速習モノイダル圏論、速習モノイダル基底上の豊穣圏論 |
| [Introduction-to-General-Topology](https://github.com/skrtk98/Introduction-to-General-Topology) | `/Introduction-to-General-Topology/` | 位相空間論、分離公理の反例、Lean 4 による検証 |
| [Introduction-to-Linear-Algebra](https://github.com/skrtk98/Introduction-to-Linear-Algebra) | `/Introduction-to-Linear-Algebra/` | 線形代数学入門 |
| [Introduction-to-Functional-Analysis](https://github.com/skrtk98/Introduction-to-Functional-Analysis) | `/Introduction-to-Functional-Analysis/` | 関数解析学 |
| [math-notes-previewer](https://github.com/skrtk98/math-notes-previewer) | なし | 原稿を HTML に変換する CLI とプレビューワー |

2026-10-23 までは、すべての原稿をこのリポジトリで管理していた。
分割前の履歴はこのリポジトリの履歴に残っており、各原稿のリポジトリにも該当するファイルの履歴を引き継いでいる。

## 構成

- `homepage/documents.js`：トップページに載せる原稿の一覧と、旧 URL から新 URL への転送先。
- `homepage/homepage.js`、`homepage/homepage.css`：トップページの HTML と CSS。
- `homepage/build.js`：トップページと転送ページを `site/` に生成する。
- `homepage/THIRD_PARTY_LICENSES.md`：トップページが参考にしたデジタル庁デザインシステムの出典とライセンス。

## 原稿を追加する

1. 原稿のリポジトリを作り、`math-notes-previewer` の README に従って GitHub Pages に公開する。
2. `homepage/documents.js` に、表示名、公開 URL、説明を追加する。
3. `npm run build` を実行し、`site/index.html` を確認する。
4. `main` に push すると、GitHub Actions が `site/` を生成して公開する。`site/` はコミットしない。

## 旧 URL

次の URL は、分割後の公開先へ転送する。

- `/Introduction-to-Category-Theory/` → `/Category-Theory/Introduction-to-Category-Theory/`
- `/Introduction-to-Monoidal-Category-Theory/` → `/Category-Theory/Introduction-to-Monoidal-Category-Theory/`
- `/Introduction-to-Enriched-Categor-over-Monoidal-base-Theory/` → `/Category-Theory/Introduction-to-Enriched-Categor-over-Monoidal-base-Theory/`
- `/Counterexamples-in-Separation-Axioms/` → `/Introduction-to-General-Topology/Counterexamples-in-Separation-Axioms/`

`/Introduction-to-General-Topology/` は URL を変えずに、同名のリポジトリから公開する。
