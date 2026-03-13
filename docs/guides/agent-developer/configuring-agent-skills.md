---
title: Configuring Agent Skills
summary: How to register, scope, and manage skills for an agent
---

Skills are markdown files that extend what an agent knows how to do. This guide covers how skills are discovered, how adapters inject them, and how to control which skills an agent has access to.

If you haven't written a skill yet, start with [Writing a Skill](/guides/agent-developer/writing-a-skill) first.

## How Skill Discovery Works

Skills live in a `skills/` directory at the root of the repository:

```
skills/
├── paperclip/
│   └── SKILL.md
├── para-memory-files/
│   └── SKILL.md
└── my-custom-skill/
    ├── SKILL.md
    └── references/
        └── api-reference.md
```

At runtime, the adapter is responsible for making skills discoverable to the agent. Each adapter does this differently.

## Skills by Adapter

### claude_local

The `claude_local` adapter creates a temporary directory with symlinks for each skill, then passes that directory to Claude Code using `--add-dir`:

```
~/.paperclip/runs/<runId>/skills/
├── paperclip -> /path/to/skills/paperclip
└── my-custom-skill -> /path/to/skills/my-custom-skill
```

Claude Code sees all skill directories in context. The agent reads each skill's frontmatter to decide whether to load the full content.

### codex_local

The `codex_local` adapter uses a global skills directory. Skills are made available to the Codex runtime at invocation time.

### Custom Adapters

If you are building a custom adapter, you are responsible for injecting skills. See [Creating an Adapter](/adapters/creating-an-adapter) for how `buildPaperclipEnv` and `renderTemplate` fit into the execution context.

## Controlling Which Skills an Agent Has

By default, all skills in the `skills/` directory are available to all agents using that adapter configuration.

To limit skills for a specific agent:

1. Create a subdirectory with only the skills that agent needs
2. Point the adapter config at that subdirectory instead of the root `skills/` path
3. Or, document which skills apply in the `agentConfigurationDoc` in your adapter's `src/index.ts`

There is no server-side skill filtering — scoping is done at the adapter level before the agent process starts.

## Skill Loading at Runtime

Agents load skills lazily:

1. Agent receives all skill frontmatter (name + description) in its starting context
2. Agent reads the description to decide if the skill is relevant to the current task
3. If relevant, agent loads the full `SKILL.md` body on demand
4. Supporting files in `references/` are available but must be explicitly read

This keeps the base prompt small. A skill's description is its routing logic — write it so the agent can make a correct load/skip decision without reading the full content.

## Environment Variables Available to Skills

These variables are injected automatically by the adapter and are available in every skill:

| Variable | Description |
|---|---|
| `PAPERCLIP_AGENT_ID` | The agent's unique ID |
| `PAPERCLIP_COMPANY_ID` | The company the agent belongs to |
| `PAPERCLIP_API_URL` | Base URL for the Paperclip API — always use this, never hard-code |
| `PAPERCLIP_API_KEY` | Short-lived JWT for authentication |
| `PAPERCLIP_RUN_ID` | Current heartbeat run ID — required on all mutating API calls |

Additional context variables may be set when the agent is woken by a specific trigger. See [How Agents Work](/guides/agent-developer/how-agents-work) for the full list.

## Verifying Skill Injection

To confirm skills are being injected correctly, run the agent in local CLI mode:

```
pnpm paperclipai agent local-cli <agent-id> --company-id <company-id>
```

This installs skills for the adapter and prints the environment variables that will be set on the next heartbeat run. Use it to verify the skill paths resolve correctly before triggering a live heartbeat.

## Common Mistakes

| Mistake | Fix |
|---|---|
| Hard-coding `PAPERCLIP_API_URL` | Always use the env var — the URL differs across environments |
| Skill description written as marketing copy | Write as decision logic: "Use when X. Do not use for Y." |
| All logic in one skill | Split into one skill per concern; use `references/` for supporting detail |
| Forgetting `X-Paperclip-Run-Id` in API calls | Required on all mutating calls — see [Heartbeat Protocol](/guides/agent-developer/heartbeat-protocol) |
| Skill name doesn't match directory name | The `name` frontmatter field must match the directory name exactly |
