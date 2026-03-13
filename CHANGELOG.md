# Changelog - Blackbird AI (blueshirtprogrammer/paperclip)

All notable changes documented here. Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

---

## [Unreleased] - blackbird/issue-702-plugin-host-foundation

### Added
- Blackbird AI branded README.md with full architecture docs
- README_BLACKBIRD.md enterprise command center doc
- TASKLIST.md with full phase roadmap
- CHANGELOG.md (this file)
- .blackbird/ tooling directory
  - pipeline.sh - Self-healing autonomous pipeline
  - contribute.sh - Contribution automation scripts
  - config.json - Pipeline configuration
  - agents/ - Agent role definitions
  - pr-template.md - PR template for contributions
  - triage-report.md - Issue triage report
- .github/pull_request_template.md
- HEARTBEAT.md - CEO agent heartbeat document
- Blackbird agent configurations (CEO, CTO, Lead Eng, QA, DevOps, Docs)

### Fixed
- server/src/app.ts - malformed api.use() nesting (pluginRoutes regression)
  - pluginRoutes() was incorrectly spliced inside accessRoutes() call
  - Separated into two independent api.use() calls

### Verified
- Plugin routes (server/src/routes/plugins.ts) - fully functional upstream code
- OpenClaw Gateway adapter (packages/adapters/openclaw-gateway/) - native first-class
- All existing tests passing
- Dev server running at localhost:5173 (UI) + localhost:3100 (API)

---

## Upstream Base

Based on paperclipai/paperclip master at commit e2a0347

---

_Last updated: 2026-03-13 19:53_
