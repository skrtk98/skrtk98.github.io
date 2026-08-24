# Category Theory Notes

このリポジトリは、Markdown 原稿から3冊の数学ノートを HTML に変換し、GitHub Pages で公開する。

## 構成

- `manuscripts/`：公開する Markdown 原稿と共通章。
- `previewer/`：`@import`、KaTeX、TikZ の SVG 化を処理する変換器とブラウザプレビューワー。
- `site/`：`npm run build` が生成する HTML。直接編集しない。
- `TopologyFormalization/`：位相空間論の Lean 4 検証プロジェクト。

## ローカルでの確認

Node.js 20 以上と、TikZ の変換に使う `latex` および `dvisvgm` を用意する。

依存関係をインストールする。

```bash
npm ci
```

全冊を変換して `site/` を更新する。

```bash
npm run build
```

変換だけを検査する場合は、生成結果を確認したあとに次を実行する。

```bash
npm run check
```

原稿を編集しながらブラウザで確認する場合は、次を実行して `http://localhost:4173/` を開く。

```bash
npm run preview
```

プレビューワーは `manuscripts/` の Markdown を監視し、保存時に `site/` を再生成する。

## 公開手順

1. 原稿を編集し、`npm run check` で3冊の変換を確認する。
2. `npm run build` を実行し、`site/` の差分が原稿の変更に対応していることを確認する。
3. `manuscripts/`、`previewer/`、`package.json`、`package-lock.json`、`site/` の意味のある変更をコミットして `main` に push する。
4. GitHub Actions が `npm ci` と `npm run build` を実行し、生成した `site/` を GitHub Pages にデプロイする。

初回のみ、リポジトリの **Settings → Pages → Build and deployment** で **GitHub Actions** を選択する。

## 公開 URL

- `/category-theory/`
- `/monoidal-category-theory/`
- `/enriched-category-theory/`
