# Category Theory Notes

このリポジトリは、次の3冊を一つの GitHub Pages サイトとして公開するためのリリース用リポジトリです。

- [速習圏論](site/category-theory/index.html)
- [速習モノイダル圏論](site/monoidal-category-theory/index.html)
- [速習モノイダル基底上の豊穣圏論](site/enriched-category-theory/index.html)

原稿は `manuscripts/` に集約しています。各書籍の公開 HTML は `site/` にあり、GitHub Actions がこのディレクトリを GitHub Pages にデプロイします。

## リリース手順

1. `manuscripts/` の原稿を Crossnote で HTML にエクスポートする。
2. エクスポートした3ファイルを、従来どおり `~/proj/Introduction-to-Category-Theory/outputs/` に置く（別の出力先を使う場合も可）。
3. このリポジトリで次を実行する。

   ```bash
   ./scripts/sync-site.sh
   # 別の出力先を使う場合
   # ./scripts/sync-site.sh /path/to/outputs
   ```

4. `site/` と `manuscripts/` の変更を同じコミットで push する。

`main` または `master` への push で3冊が同時に公開されます。最初の公開前に、リポジトリの **Settings → Pages → Build and deployment** で **GitHub Actions** を選択してください。

各ページが使用する Source Han Serif フォントも、`site/fonts/` に共有で配置されます。

## 公開 URL

サイトのトップページから各書籍を開けます。

- `/category-theory/`
- `/monoidal-category-theory/`
- `/enriched-category-theory/`
