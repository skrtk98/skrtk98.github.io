# Personal Mathematical Documents

このリポジトリは、個人的な数学の教科書的資料を含む静的ドキュメントを Markdown 原稿として管理し、GitHub Pages で公開する。

## 構成

- `manuscripts/`：公開する Markdown 原稿と、原稿から参照する共通章。
- `previewer/`：Markdown、KaTeX、TikZ を HTML に変換する CLI とブラウザプレビューワー。
- `site/`：`npm run build` が生成する GitHub Pages 用 HTML。直接編集しない。
- `build/preview-site/`：`npm run preview` が生成するローカルプレビュー用 HTML。公開対象ではない。
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

トップページには `manuscripts/` 以下のすべての Markdown ファイルが一覧表示される。

プレビューワーは `manuscripts/` 以下を再帰的に走査し、すべての Markdown ファイルをトップページに一覧表示する。

各項目には、先頭にあるレベル1見出しを表示名として使う。

レベル1見出しがないファイルは、相対パスを表示名として使う。

`manuscripts/` に新しい Markdown ファイルを追加して保存すると、そのファイルも一覧とプレビュー対象に自動的に追加される。

プレビュー用 HTML は `build/preview-site/` に生成するため、公開用の `site/` には影響しない。

ポート番号を変更する場合は `PORT` 環境変数を指定する。

```bash
PORT=8080 npm run preview
```

### HTML の生成

`manuscripts/` 直下の Markdown を公開用 HTML に変換して `site/` を更新する場合は、次を実行する。

```bash
npm run build
```

`site/` 以下の HTML は公開用の生成物であるため、直接編集しない。

原稿の `@import` は変換時に再帰的に展開される。

`latex` の属性付きコードフェンス（`cmd=true` を含む）内の TikZ は LaTeX でコンパイルされ、SVG として HTML に埋め込まれる。

各ドキュメントの見出しから目次を自動生成し、本文の冒頭に表示する。

### 変換結果の検査

原稿を変換できることだけを確認する場合は、次を実行する。

```bash
npm run check
```

このコマンドは公開対象の Markdown を変換し、TikZ、数式、`@import` の処理に失敗した場合に終了コード1を返す。

### 旧コマンドとの対応

従来のコマンドを残した環境では、次のスクリプトも利用できる。

```bash
./scripts/sync-site.sh
```

このスクリプトは、外部の Crossnote 出力をコピーせず、`npm run build` を呼び出す。

## 公開手順

1. `manuscripts/` 直下に Markdown 原稿を追加または編集する。
2. `npm run check` を実行し、公開対象の変換が成功することを確認する。
3. `npm run build` を実行し、`site/` の差分が原稿の変更に対応していることを確認する。
4. `manuscripts/`、`previewer/`、`package.json`、`package-lock.json`、`site/` の意味のある変更をコミットして `main` に push する。
5. GitHub Actions が `npm ci` と `npm run build` を実行し、生成した `site/` を GitHub Pages にデプロイする。

初回のみ、リポジトリの **Settings → Pages → Build and deployment** で **GitHub Actions** を選択する。

## 公開 URL

GitHub Pages のトップページから、`manuscripts/` 直下の各 Markdown 原稿を開く。

公開 URL は、原稿ファイル名から `.md` を除いた名前を使う。

- `/Introduction-to-Category-Theory/`
- `/Introduction-to-Monoidal-Category-Theory/`
- `/Introduction-to-Enriched-Categor-over-Monoidal-base-Theory/`
