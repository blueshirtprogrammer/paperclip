#!/bin/bash
# ============================================
# BLACKBIRD AI — CONTRIBUTION FORCE CLI
# Operation Blackbird | Project Paperclip
# Project Lead: Josh Goodlock
# Team: Blackbird AI (openclaw x paperclipai)
# ============================================

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BLACKBIRD_DIR="$REPO_DIR/.blackbird"
CONFIG="$BLACKBIRD_DIR/contribution-force.json"
ATTRIBUTION="Co-authored by Blackbird AI (openclaw x paperclipai)\nProject Lead: Josh Goodlock"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

banner() {
  echo -e "${CYAN}${BOLD}"
  echo "  ██████╗ ██╗      █████╗  ██████╗██╗  ██╗██████╗ ██╗██████╗ ██████╗ "
  echo "  ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██║██╔══██╗██╔══██╗"
  echo "  ██████╔╝██║     ███████║██║     █████╔╝ ██████╔╝██║██████╔╝██║  ██║"
  echo "  ██╔══██╗██║     ██╔══██║██║     ██╔═██╗ ██╔══██╗██║██╔══██╗██║  ██║"
  echo "  ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗██████╔╝██║██║  ██║██████╔╝"
  echo "  ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═════╝ "
  echo ""
  echo "  🪶  OPERATION BLACKBIRD  |  PROJECT PAPERCLIP  |  openclaw × paperclipai"
  echo "  👤  Project Lead: Josh Goodlock  |  Team: Blackbird AI"
  echo -e "${RESET}"
}

list_issues() {
  echo -e "${BOLD}${YELLOW}=== AVAILABLE ISSUES BY CATEGORY ===${RESET}\n"
  echo -e "${BLUE}[FEATURES]${RESET}"
  python3 -c "
import json
with open('$CONFIG') as f:
    c = json.load(f)
for i in c['selected_issues']['features']:
    p = '🔴' if i['priority']=='high' else ('🟡' if i['priority']=='medium' else '🟢')
    print(f\"  {p} #{i['number']:4d} | {i['priority'].upper():6} | {i['title']}\")
"
  echo -e "\n${BLUE}[DOCS]${RESET}"
  python3 -c "
import json
with open('$CONFIG') as f:
    c = json.load(f)
for i in c['selected_issues']['docs']:
    p = '🔴' if i['priority']=='high' else ('🟡' if i['priority']=='medium' else '🟢')
    print(f\"  {p} #{i['number']:4d} | {i['priority'].upper():6} | {i['title']}\")
"
  echo -e "\n${BLUE}[SKILLS]${RESET}"
  python3 -c "
import json
with open('$CONFIG') as f:
    c = json.load(f)
for i in c['selected_issues']['skills']:
    p = '🔴' if i['priority']=='high' else ('🟡' if i['priority']=='medium' else '🟢')
    print(f\"  {p} #{i['number']:4d} | {i['priority'].upper():6} | {i['title']}\")
"
}

push_issue() {
  ISSUE_NUM=$1
  CATEGORY=$2
  BRANCH="blackbird/issue-${ISSUE_NUM}"

  echo -e "${CYAN}🪶 Spinning up contribution for Issue #${ISSUE_NUM}...${RESET}"
  
  cd "$REPO_DIR"
  git checkout master 2>/dev/null || git checkout main 2>/dev/null
  git pull origin master 2>/dev/null || git pull origin main 2>/dev/null
  git checkout -b "$BRANCH"

  # Create work directory for this issue
  mkdir -p "$BLACKBIRD_DIR/issues/issue-${ISSUE_NUM}"
  cat > "$BLACKBIRD_DIR/issues/issue-${ISSUE_NUM}/meta.json" << JSON
{
  "issue": $ISSUE_NUM,
  "category": "$CATEGORY",
  "branch": "$BRANCH",
  "team": "Blackbird AI",
  "lead": "Josh Goodlock",
  "attribution": "openclaw x paperclipai",
  "status": "in-progress",
  "started": "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
}
JSON

  echo -e "${GREEN}✅ Branch created: ${BRANCH}${RESET}"
  echo -e "${YELLOW}📁 Work dir: .blackbird/issues/issue-${ISSUE_NUM}/${RESET}"
  echo -e "${CYAN}💡 Now implement your changes, then run:${RESET}"
  echo -e "   ${BOLD}./contribute.sh commit ${ISSUE_NUM} \"your commit message\"${RESET}"
}

commit_issue() {
  ISSUE_NUM=$1
  MSG=$2
  BRANCH="blackbird/issue-${ISSUE_NUM}"
  
  cd "$REPO_DIR"
  git add -A
  git commit -m "${MSG}

Resolves #${ISSUE_NUM}

${ATTRIBUTION}

Operation: Blackbird | Project: Paperclip
Team: Blackbird AI | Lead: Josh Goodlock
Link: openclaw x paperclipai"

  echo -e "${GREEN}✅ Committed with full Blackbird attribution!${RESET}"
  echo -e "${CYAN}📤 Push with: git push origin ${BRANCH}${RESET}"
  echo -e "${CYAN}🔗 Then open PR at: https://github.com/paperclipai/paperclip/compare/${BRANCH}${RESET}"
}

# MAIN
banner

case "$1" in
  list)     list_issues ;;
  push)     push_issue "$2" "${3:-feature}" ;;
  commit)   commit_issue "$2" "$3" ;;
  *)
    echo -e "${BOLD}Usage:${RESET}"
    echo "  ./contribute.sh list               — list all selected issues"
    echo "  ./contribute.sh push <issue#> <category>  — start work on an issue"
    echo "  ./contribute.sh commit <issue#> \"msg\"     — commit with attribution"
    echo ""
    list_issues
    ;;
esac
