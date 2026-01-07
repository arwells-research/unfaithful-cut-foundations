#!/usr/bin/env bash
# File: tools/build.sh
#
# Build script for unfaithful-cut-foundations.
# - Uses latexmk if available (recommended).
# - Falls back to manual pdflatex+biber loop.
#
# Usage:
#   bash tools/build.sh
#   bash tools/build.sh clean
#
set -euo pipefail

MAIN_TEX="unfaithful_cut_foundations.tex"
OUTDIR="build"

cmd_exists() { command -v "$1" >/dev/null 2>&1; }

ensure_dir() {
  mkdir -p "$OUTDIR"
}

do_clean() {
  echo "Cleaning build artifacts..."
  rm -rf "$OUTDIR"
  # Also remove common aux files in repo root (optional but helpful)
  rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.out *.run.xml *.toc *.synctex.gz
  find sections appendices -maxdepth 1 -type f \( -name "*.aux" -o -name "*.log" -o -name "*.out" \) -delete 2>/dev/null || true
  echo "Clean complete."
}

build_with_latexmk() {
  echo "Building with latexmk..."
  latexmk \
  -lualatex \
  -interaction=nonstopmode \
  -halt-on-error \
  -file-line-error \
  -outdir="$OUTDIR" \
  -jobname="unfaithful_cut_foundations" \
  "$MAIN_TEX"
  echo "Build complete: $OUTDIR/unfaithful_cut_foundations.pdf"
}

build_manual() {
  echo "latexmk not found; building manually (pdflatex + biber)..."
  ensure_dir

  # First pass (generates .aux/.bcf)
  pdflatex \
    -interaction=nonstopmode \
    -halt-on-error \
    -file-line-error \
    -output-directory="$OUTDIR" \
    "$MAIN_TEX"

  # Bibliography (biblatex)
  if cmd_exists biber; then
    biber "$OUTDIR/unfaithful_cut_foundations"
  else
    echo "ERROR: biber not found, but biblatex is configured in $MAIN_TEX." >&2
    echo "Install biber or switch to natbib/bibtex." >&2
    exit 1
  fi

  # Two more passes for refs
  pdflatex \
    -interaction=nonstopmode \
    -halt-on-error \
    -file-line-error \
    -output-directory="$OUTDIR" \
    "$MAIN_TEX"

  pdflatex \
    -interaction=nonstopmode \
    -halt-on-error \
    -file-line-error \
    -output-directory="$OUTDIR" \
    "$MAIN_TEX"

  echo "Build complete: $OUTDIR/unfaithful_cut_foundations.pdf"
}

main() {
  if [[ "${1:-}" == "clean" ]]; then
    do_clean
    exit 0
  fi

  if [[ ! -f "$MAIN_TEX" ]]; then
    echo "ERROR: main TeX file not found: $MAIN_TEX" >&2
    exit 1
  fi

  ensure_dir

  if cmd_exists latexmk; then
    build_with_latexmk
  else
    build_manual
  fi
}

main "${1:-}"