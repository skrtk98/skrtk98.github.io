#!/usr/bin/env bash
set -euo pipefail

# Copy the three HTML files exported by Crossnote into the GitHub Pages artifact.
# The default preserves the current local workflow; an alternative output directory
# can be passed as the first argument.
source_dir="${1:-../Introduction-to-Category-Theory/outputs}"

declare -A books=(
  [Introduction-to-Category-Theory.html]=category-theory
  [Introduction-to-Monoidal-Category-Theory.html]=monoidal-category-theory
  [Introduction-to-Enriched-Categor-over-Monoidal-base-Theory.html]=enriched-category-theory
)

for filename in "${!books[@]}"; do
  source_file="$source_dir/$filename"
  destination="site/${books[$filename]}/index.html"

  if [[ ! -f "$source_file" ]]; then
    echo "Export not found: $source_file" >&2
    exit 1
  fi

  install -D -m 0644 "$source_file" "$destination"

  # Crossnote emits this path as though every book had its own fonts directory.
  # The combined site keeps a single shared copy at /fonts instead.
  sed -i "s@url('fonts/SourceHanSerif-Regular.otf')@url('../fonts/SourceHanSerif-Regular.otf')@g" "$destination"
done

echo "Updated the three books in site/. Review with: git diff -- site"
