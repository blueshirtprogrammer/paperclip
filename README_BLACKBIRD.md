# Blackbird AI - Enterprise Fork README

**Codename:** Operation Blackbird
**Project:** Project Paperclip
**Team:** Blackbird AI
**Lead:** Josh Goodlock
**Stack:** openclaw x paperclipai

## Overview

This is the enterprise command center for Blackbird AI. We fork paperclipai/paperclip and extend it with:

- Autonomous agent roster (CEO, CTO, Engineers, QA, DevOps)
- Self-healing CI/CD pipeline
- OpenClaw Gateway integration
- Plugin host system
- Upstream issue triage and auto-fix

## How It Works

1. Paperclip runs locally at localhost:5173 (UI) and localhost:3100 (API)
2. Agents are hired through the Paperclip UI with specific roles and adapters
3. Issues flow in from upstream or are created internally
4. Agents pick up issues, branch, implement, test, and PR
5. If anything breaks, the self-healing pipeline detects and fixes

## Blackbird Tooling

- .blackbird/pipeline.sh - Autonomous pipeline runner
- .blackbird/contribute.sh - Contribution automation
- .blackbird/config.json - Pipeline configuration
- .blackbird/agents/ - Agent role definitions

## Key Branches

- master - Upstream sync
- blackbird/issue-702-plugin-host-foundation - Plugin system work
- blackbird/issue-749-docs - Documentation improvements

## Links

- Fork: https://github.com/blueshirtprogrammer/paperclip
- Upstream: https://github.com/paperclipai/paperclip
