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
RESUME="${RESUME:-/Users/dm3n/Desktop/O-1A/Daniel Edgar Resume.pdf}"
OUT="${OUT:-/Users/dm3n/Desktop/O-1A/Itinerary + portfolio.pdf}"
TEMP_DIR=$(mktemp -d /tmp/o1a-itinerary.XXXXXX)
trap 'rm -rf "$TEMP_DIR"' EXIT

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

echo "==> Extracting the one-page resume (the source PDF has a blank export page)"
pdfseparate -f 1 -l 1 "$RESUME" "$TEMP_DIR/resume-%d.pdf"

echo "==> Merging portfolio + resume -> Itinerary + portfolio.pdf"
pdfunite "${REPO}/${TEX}.pdf" "$TEMP_DIR/resume-1.pdf" "$OUT"

PAGES=$(pdfinfo "$OUT" 2>/dev/null | awk '/Pages/{print $2}')
echo "==> Done. Rebuilt: $OUT (${PAGES} pages)"
