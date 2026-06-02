#!/usr/bin/env bash
# ux-starter-kit installer
# Usage:
#   ./install.sh global    — install UX commands globally (~/.claude/commands/)
#   ./install.sh project   — scaffold a new project in the current directory

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
COMMANDS_SRC="$SCRIPT_DIR/.claude/commands"

# ─── GLOBAL INSTALL ────────────────────────────────────────────────────────────
install_global() {
  GLOBAL_CMD_DIR="$HOME/.claude/commands"
  mkdir -p "$GLOBAL_CMD_DIR"

  echo "Installing UX skills to $GLOBAL_CMD_DIR ..."
  cp "$COMMANDS_SRC"/ux-*.md "$GLOBAL_CMD_DIR/"

  echo ""
  echo "✅ Done. $(ls "$GLOBAL_CMD_DIR"/ux-*.md | wc -l | tr -d ' ') UX commands installed globally."
  echo ""
  echo "These commands are now available in ALL your Claude Code projects:"
  ls "$GLOBAL_CMD_DIR"/ux-*.md | xargs -I{} basename {} .md | sed 's/^/  \//'
  echo ""
  echo "To use them in any project, run 'setup-project' first:"
  echo "  cd /path/to/my-project"
  echo "  $SCRIPT_DIR/install.sh project"
}

# ─── PROJECT SCAFFOLD ──────────────────────────────────────────────────────────
scaffold_project() {
  TARGET="${1:-.}"

  echo "Scaffolding UX project structure in: $(realpath "$TARGET") ..."
  mkdir -p "$TARGET"

  # Copy project config files
  if [ ! -f "$TARGET/PROJECT_BRIEF.md" ]; then
    cp "$SCRIPT_DIR/PROJECT_BRIEF.md" "$TARGET/PROJECT_BRIEF.md"
    echo "  ✅ PROJECT_BRIEF.md — fill in your project details"
  else
    echo "  ⚠️  PROJECT_BRIEF.md already exists — not overwritten"
  fi

  if [ ! -f "$TARGET/CLAUDE.md" ]; then
    cp "$SCRIPT_DIR/CLAUDE.md" "$TARGET/CLAUDE.md"
    echo "  ✅ CLAUDE.md"
  fi

  # Copy .claude/settings.json for permission allowlist
  mkdir -p "$TARGET/.claude"
  if [ ! -f "$TARGET/.claude/settings.json" ]; then
    cp "$SCRIPT_DIR/.claude/settings.json" "$TARGET/.claude/settings.json"
    echo "  ✅ .claude/settings.json (permission allowlist)"
  fi

  # Optionally copy commands locally (if global install was not done)
  if [ "${2:-}" = "--with-commands" ]; then
    mkdir -p "$TARGET/.claude/commands"
    cp "$COMMANDS_SRC"/ux-*.md "$TARGET/.claude/commands/"
    echo "  ✅ .claude/commands/ ($(ls "$COMMANDS_SRC"/ux-*.md | wc -l | tr -d ' ') UX commands)"
  fi

  # Copy industry context files
  cp -r "$SCRIPT_DIR/industries" "$TARGET/industries"
  echo "  ✅ industries/ (7 domain context files)"

  # Create output folder structure
  OUTPUT_DIRS=(
    "outputs/prd-intake"
    "outputs/kickoff"
    "outputs/discovery"
    "outputs/empathy-maps"
    "outputs/research-reports"
    "outputs/mental-models"
    "outputs/personas"
    "outputs/journey-maps"
    "outputs/hmw-statements"
    "outputs/design-briefs"
    "outputs/inspiration"
    "outputs/sitemaps"
    "outputs/task-flows"
    "outputs/service-blueprints"
    "outputs/content"
    "outputs/wireframes"
    "outputs/hifi-specs"
    "outputs/design-system/tokens"
    "outputs/design-system/components"
    "outputs/design-qa"
    "outputs/handoff/screens"
    "outputs/changelogs"
    "outputs/accessibility"
    "outputs/measurement"
    "outputs/frontend/react"
    "outputs/frontend/angular"
    "client-inputs"
    "existing-ds"
    "inspiration/screenshots"
  )

  for dir in "${OUTPUT_DIRS[@]}"; do
    mkdir -p "$TARGET/$dir"
    touch "$TARGET/$dir/.gitkeep"
  done
  echo "  ✅ outputs/ structure (31 folders)"

  # Create client-inputs README
  cat > "$TARGET/client-inputs/README.md" << 'EOF'
# Client Inputs

Drop all client-provided files here before running `/ux-prd`.

Supported: PDF, Word (.docx), Excel (.xlsx), PowerPoint (.pptx), images (.png/.jpg/.webp), text, Markdown.

Naming prefixes (optional but helpful):
- `req_*` — requirements documents
- `research_*` — existing user research
- `data_*` — analytics or survey data
- `notes_*` — meeting notes or briefs
- `brand_*` — brand guidelines
- `ref_*` — reference screenshots
EOF

  # Create inspiration README
  cat > "$TARGET/inspiration/README.md" << 'EOF'
# Inspiration

Place visual references for the `/ux-inspire` command here.

- `screenshots/` — drop UI screenshots (prefix: color_, layout_, type_)
- `links.md` — add website URLs, Behance/Dribbble links
- `mood-board.md` — write a verbal visual direction
EOF
  touch "$TARGET/inspiration/screenshots/.gitkeep"
  echo '# Visual Inspiration Links' > "$TARGET/inspiration/links.md"

  echo ""
  echo "✅ Project scaffolded at: $(realpath "$TARGET")"
  echo ""
  echo "NEXT STEPS"
  echo "──────────"
  echo "1. Fill in PROJECT_BRIEF.md with your project details"
  echo "2. Drop client documents into client-inputs/"
  echo "3. Open Claude Code in this folder"
  echo "4. Run: /ux-prd"
}

# ─── ENTRY POINT ───────────────────────────────────────────────────────────────
case "${1:-help}" in
  global)
    install_global
    ;;
  project)
    scaffold_project "${2:-.}" "${3:-}"
    ;;
  *)
    echo "UX Starter Kit Installer"
    echo ""
    echo "Usage:"
    echo "  ./install.sh global              Install UX slash commands globally"
    echo "  ./install.sh project [path]      Scaffold UX project structure"
    echo "  ./install.sh project . --with-commands   Also copy commands locally"
    echo ""
    echo "Recommended workflow for a new project:"
    echo "  1. ./install.sh global           (once per machine)"
    echo "  2. ./install.sh project /path/to/my-project"
    echo "  3. Open /path/to/my-project in Claude Code"
    echo "  4. Run /ux-prd"
    ;;
esac
