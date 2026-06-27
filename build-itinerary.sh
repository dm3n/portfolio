#!/usr/bin/env bash
# ============================================================
# Rebuild the O-1A "Itinerary + portfolio.pdf".
#
# It is the compiled technical portfolio (Daniel_Edgar_Technical_Portfolio.tex)
# with the resume appended. There is no other source file: edit the .tex, run
# this, and the Desktop O-1A PDF is regenerated.
#
# Usage:  ./build-itinerary.sh
# ============================================================
set -euo pipefail

REPO="/Users/dm3n/Projects/daniel-edgar-ai-portfolio"
TEX="Daniel_Edgar_Technical_Portfolio"
RESUME="/Users/dm3n/Desktop/O-1A/Daniel Edgar Resume.pdf"
OUT="/Users/dm3n/Desktop/O-1A/Itinerary + portfolio.pdf"

cd "$REPO"

echo "==> Compiling ${TEX}.tex (two passes)"
pdflatex -interaction=nonstopmode -halt-on-error "${TEX}.tex" >/dev/null
pdflatex -interaction=nonstopmode -halt-on-error "${TEX}.tex" >/dev/null

echo "==> Cleaning LaTeX build artifacts"
rm -f "${TEX}.aux" "${TEX}.log" "${TEX}.out" "${TEX}.toc"

if [[ ! -f "$RESUME" ]]; then
  echo "ERROR: resume not found at: $RESUME" >&2
  exit 1
fi

echo "==> Merging portfolio + resume -> Itinerary + portfolio.pdf"
pdfunite "${REPO}/${TEX}.pdf" "$RESUME" "$OUT"

PAGES=$(pdfinfo "$OUT" 2>/dev/null | awk '/Pages/{print $2}')
echo "==> Done. Rebuilt: $OUT (${PAGES} pages)"
