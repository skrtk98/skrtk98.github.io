# Category Theory Notes

このリポジトリは、Markdown 原稿から3冊の数学ノートを HTML に変換し、GitHub Pages で公開する。

## 構成

- `manuscripts/`：公開する Markdown 原稿と共通章。
- `previewer/`：`@import`、KaTeX、TikZ の SVG 化を処理する変換器とブラウザプレビューワー。
- `site/`：`npm run build` が生成する HTML。直接編集しない。
- `TopologyFormalization/`：位相空間論の Lean 4 検証プロジェクト。

## 使い方

### 初回セットアップ

Node.js 20 以上と、TikZ の変換に使う `latex` および `dvisvgm` を用意する。

Ubuntu では次のコマンドで導入できる。

```bash
sudo apt-get update
sudo apt-get install -y dvisvgm texlive-latex-extra texlive-pictures
```

依存関係をインストールする。

```bash
npm ci
```

### ブラウザプレビュー

原稿を編集しながら確認する場合は、リポジトリのルートで次を実行する。

```bash
npm run preview
```

ブラウザで `http://localhost:4173/` を開く。

書籍の一覧から各書籍を選択できる。

プレビューワーは `manuscripts/` 以下の Markdown を監視し、ファイルを保存すると `site/` を再生成する。

ポート番号を変更する場合は `PORT` 環境変数を指定する。

```bash
PORT=8080 npm run preview
```

### HTML の生成

全冊を変換して `site/` を更新する場合は、次を実行する。

```bash
npm run build
```

`site/` 以下の HTML は生成物であるため、直接編集しない。

原稿の `@import` は変換時に再帰的に展開される。

`latex` の属性付きコードフェンス（`cmd=true` を含む）内の TikZ は LaTeX でコンパイルされ、SVG として HTML に埋め込まれる。

### 変換結果の検査

原稿を変換できることだけを確認する場合は、次を実行する。

```bash
npm run check
```

このコマンドは3冊を変換し、TikZ、数式、`@import` の処理に失敗した場合に終了コード1を返す。

### 旧コマンドとの対応

従来のコマンドを残した環境では、次のスクリプトも利用できる。

```bash
./scripts/sync-site.sh
```

このスクリプトは、外部の Crossnote 出力をコピーせず、`npm run build` を呼び出す。

## 公開手順

1. 原稿を編集する。
2. `npm run check` を実行し、3冊の変換が成功することを確認する。
3. `npm run build` を実行し、`site/` の差分が原稿の変更に対応していることを確認する。
4. `manuscripts/`、`previewer/`、`package.json`、`package-lock.json`、`site/` の意味のある変更をコミットして `main` に push する。
5. GitHub Actions が `npm ci` と `npm run build` を実行し、生成した `site/` を GitHub Pages にデプロイする。

初回のみ、リポジトリの **Settings → Pages → Build and deployment** で **GitHub Actions** を選択する。

## 公開 URL

- `/category-theory/`
- `/monoidal-category-theory/`
- `/enriched-category-theory/`
