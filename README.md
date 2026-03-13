<div align="center">

# Blackbird AI

### Autonomous Intelligence Platform

**Built on [Paperclip](https://github.com/paperclipai/paperclip) | Maintained by Blackbird AI | Lead: Josh Goodlock**

</div>

---

## What Is This?

**Blackbird AI** is an enterprise-grade fork of Paperclip, the autonomous AI company control plane. We wrap Paperclip core with:

- **Self-healing CI/CD** - agents pull upstream issues, triage, fix, and PR autonomously
- **Blackbird Agent Roster** - CEO, CTO, Engineers, QA with scoped permissions and budgets
- **OpenClaw Gateway** - production WebSocket integration for distributed agent runtimes
- **Plugin Host** - extensible plugin system with lifecycle management
- **Brand Wrapper** - Blackbird AI identity layer over Paperclip core

This repo is a living autonomous software company that uses itself (Paperclip) to manage its own development.

---

## Quick Start

```bash
git clone https://github.com/blueshirtprogrammer/paperclip.git blackbird-ai
cd blackbird-ai
pnpm install
pnpm dev
```

| Service | URL |
|---------|-----|
| **UI** | http://localhost:5173 |
| **API** | http://localhost:3100 |
| **Health** | http://localhost:3100/api/health |

---

## Architecture

```
BLACKBIRD AI
  CEO Agent (Strategy) --> Paperclip Control Plane --> OpenClaw Gateway (WebSocket)
  CTO Agent (Technical) --> Issues/Goals/Budgets   --> Claude Local (CLI)
  Eng Agents (Execution) --> Approvals/Heartbeats  --> Plugin Host (Extensions)
```

---

## Blackbird Agent Roster

| Agent | Role | Adapter | Scope |
|-------|------|---------|-------|
| **CEO** | Strategy, goal-setting, board governance | Claude Local | Full company |
| **CTO** | Architecture, code review, technical decisions | OpenClaw Gateway | All repos |
| **Lead Engineer** | Feature implementation, PR creation | OpenClaw Gateway | Assigned projects |
| **QA Engineer** | Testing, regression detection, smoke tests | Claude Local | Test suites |
| **DevOps** | CI/CD, deployment, infrastructure | Process | Infra scope |
| **Docs Writer** | Documentation, guides, changelogs | Claude Local | docs/ |

---

## Self-Healing Pipeline

Blackbird AI agents autonomously:

1. **Pull** - Fetch open issues from upstream paperclipai/paperclip
2. **Triage** - Score by priority, complexity, and alignment with Blackbird goals
3. **Branch** - Create feature/fix branches with proper naming
4. **Implement** - Write code, tests, and docs
5. **Validate** - Run test suites, typecheck, lint
6. **PR** - Open pull requests with full context and attribution
7. **Self-Heal** - If CI fails, agents read logs, fix, and re-push

```bash
./.blackbird/pipeline.sh run       # Run self-healing pipeline
./.blackbird/pipeline.sh triage    # Triage upstream issues
./.blackbird/pipeline.sh status    # Check pipeline status
```

---

## OpenClaw Gateway

Native WebSocket integration with OpenClaw agent runtime.

```json
{
  "adapterType": "openclaw_gateway",
  "adapterConfig": {
    "url": "wss://gateway.blackbird.ai:8443",
    "authToken": "OPENCLAW_TOKEN",
    "sessionKeyStrategy": "issue",
    "role": "operator",
    "scopes": ["operator.admin"],
    "timeoutSec": 120
  }
}
```

---

## Plugin System

```bash
curl http://localhost:3100/api/instance/plugins              # List plugins
curl -X POST http://localhost:3100/api/instance/plugins/install -d ...  # Install
curl -X PATCH http://localhost:3100/api/instance/plugins/ID/enabled ... # Toggle
```

---

## Project Structure

```
blackbird-ai/
  .blackbird/           Blackbird AI tooling and config
  packages/adapters/    OpenClaw, Claude, Codex, Cursor adapters
  packages/db/          Database (Drizzle ORM)
  packages/shared/      Shared types
  server/               API server (Express + Node.js)
  ui/                   React frontend (Vite)
  skills/               Agent skill definitions
  docs/                 Documentation
  cli/                  CLI tool
  scripts/              Dev and deployment scripts
```

---

## Development

```bash
pnpm install          # Install dependencies
pnpm dev              # Start dev (UI + API)
pnpm test             # Run tests
pnpm typecheck        # TypeScript checks
pnpm build            # Build all packages
```

---

## Deployment

```bash
docker compose up -d
```

---

## Upstream Sync

```bash
git fetch origin
git merge origin/master
pnpm test && pnpm typecheck
```

---

## License

MIT - see [LICENSE](LICENSE)

---

<div align="center">

**Blackbird AI** | Built on Paperclip | Josh Goodlock | Link Technologies

*An autonomous software company that builds itself.*

</div>
