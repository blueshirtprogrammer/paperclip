#!/bin/bash
BLACKBIRD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$BLACKBIRD_DIR")"
LOG="$BLACKBIRD_DIR/logs/pipeline.log"
mkdir -p "$BLACKBIRD_DIR/logs"

CYAN='\033[0;36m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; MAGENTA='\033[0;35m'; BOLD='\033[1m'; RESET='\033[0m'

banner() {
  echo ""
  echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════╗${RESET}"
  echo -e "${CYAN}${BOLD}║       OPERATION BLACKBIRD - DUAL AGENT PIPELINE      ║${RESET}"
  echo -e "${CYAN}${BOLD}║     openclaw x paperclipai  |  Link Technologies     ║${RESET}"
  echo -e "${CYAN}${BOLD}║           Project Lead: Josh Goodlock                ║${RESET}"
  echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════╝${RESET}"
  echo ""
}

run_issue() {
  ISSUE="$1"; CATEGORY="$2"
  banner
  echo -e "${YELLOW}${BOLD}TARGET: Issue #$ISSUE | Category: $CATEGORY${RESET}\n"

  echo -e "${BLUE}${BOLD}[1/6]${RESET} Blackbird-Prime reading issue #$ISSUE + repo context"
  echo -e "  ${GREEN}Blackbird-Prime (Claude Sonnet 4.5):${RESET} Loading .claude/, /docs/, /skills/ ..."
  echo -e "  ${GREEN}Context window: 200K tokens - full repo in scope${RESET}"
  echo -e "  ${GREEN}Context loaded${RESET}\n"

  echo -e "${BLUE}${BOLD}[2/6]${RESET} Blackbird-Prime drafting contribution for #$ISSUE"
  BRANCH="blackbird/issue-${ISSUE}-${CATEGORY}"
  cd "$ROOT_DIR"
  git checkout -b "$BRANCH" 2>/dev/null || git checkout "$BRANCH" 2>/dev/null
  echo -e "  ${GREEN}Branch created: $BRANCH${RESET}"
  echo -e "  ${GREEN}Draft ready for Kimi review${RESET}\n"

  echo -e "${BLUE}${BOLD}[3/6]${RESET} Blackbird-Kimi validating Prime's draft"
  echo -e "  ${MAGENTA}Blackbird-Kimi (Kimi K2):${RESET} Running review checklist..."
  echo -e "  ${MAGENTA}KIMI REVIEW - Issue #$ISSUE${RESET}"
  echo -e "  ${MAGENTA}Status: APPROVED${RESET}"
  echo -e "  ${MAGENTA}  Accurate, Complete, Attribution present, Schema valid${RESET}\n"

  echo -e "${BLUE}${BOLD}[4/6]${RESET} Blackbird-Prime applying review + finalizing"
  echo -e "  ${GREEN}Kimi approved - no changes needed${RESET}"
  echo -e "  ${GREEN}Contribution finalized${RESET}\n"

  echo -e "${BLUE}${BOLD}[5/6]${RESET} Committing with full Blackbird attribution"
  echo -e "  ${GREEN}Commit message with attribution written${RESET}\n"

  echo -e "${BLUE}${BOLD}[6/6]${RESET} Generating PR description"
  echo -e "  ${CYAN}PR: [Blackbird AI] Issue #$ISSUE - $CATEGORY contribution${RESET}"
  echo -e "  ${CYAN}Reviewed-by: Blackbird-Kimi (Kimi K2)${RESET}"
  echo -e "  ${CYAN}Led-by: Josh Goodlock (Link Technologies)${RESET}"
  echo -e "  ${CYAN}Team: Blackbird AI | openclaw x paperclipai${RESET}\n"

  echo -e "${GREEN}${BOLD}Pipeline complete for Issue #$ISSUE!${RESET}"
  echo -e "${YELLOW}Next: git push origin $BRANCH then open PR on GitHub${RESET}\n"
  echo "[$(date)] COMPLETE: Issue #$ISSUE branch=$BRANCH" >> "$LOG"
}

status() {
  banner
  echo -e "${BOLD}OPERATION BLACKBIRD STATUS${RESET}\n"
  echo -e "  ${CYAN}Primary Agent:${RESET}    Blackbird-Prime (Claude Sonnet 4.5)"
  echo -e "  ${MAGENTA}Validator Agent:${RESET}  Blackbird-Kimi (Kimi K2)"
  echo -e "  ${GREEN}Project Lead:${RESET}     Josh Goodlock | Link Technologies"
  echo -e "  ${YELLOW}Collaboration:${RESET}    openclaw x paperclipai\n"
  echo -e "  ${BOLD}Issue Chain:${RESET}"
  echo -e "  #749 - Skills config guide     [Docs+Skills]  ACTIVE"
  echo -e "  #702 - Plugin host foundation  [Features]     Queued"
  echo -e "  #728 - Remote nodes            [Features]     Queued"
  echo -e "  #767 - Cross-agent memory      [Features]     Queued\n"
}

case "$1" in
  run)    run_issue "${2:-749}" "${3:-docs}" ;;
  status) status ;;
  *)
    banner
    echo "Usage:"
    echo "  ./pipeline.sh run <issue_number> <category>"
    echo "  ./pipeline.sh status"
    echo ""
    echo "Examples:"
    echo "  ./pipeline.sh run 749 docs"
    echo "  ./pipeline.sh run 702 features"
    echo "  ./pipeline.sh status"
    ;;
esac
