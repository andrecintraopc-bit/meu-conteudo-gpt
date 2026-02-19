#!/usr/bin/env bash
set -euo pipefail

OUT="portal-pc/index/INDEX.md"

echo "# Portal PC — INDEX (Consolidado)" > "$OUT"
echo "" >> "$OUT"
echo "Gerado em: $(date '+%Y-%m-%d %H:%M:%S')" >> "$OUT"
echo "" >> "$OUT"
echo "## Lista de conversas" >> "$OUT"
echo "" >> "$OUT"

for f in portal-pc/conversas/*.md; do
  [ -e "$f" ] || continue
  base=$(basename "$f")
  echo "- [$base](../conversas/$base)" >> "$OUT"
done

echo "" >> "$OUT"
echo "## Conteúdo (concatenado)" >> "$OUT"
echo "" >> "$OUT"

for f in portal-pc/conversas/*.md; do
  [ -e "$f" ] || continue
  echo "---" >> "$OUT"
  echo "" >> "$OUT"
  cat "$f" >> "$OUT"
  echo "" >> "$OUT"
done

echo "OK: $OUT"
