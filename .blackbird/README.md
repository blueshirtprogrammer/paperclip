# 🪶 Operation Blackbird — Project Paperclip

> **Codename:** Operation Blackbird  
> **Project:** Project Paperclip  
> **Team:** Blackbird AI  
> **Project Lead:** Josh Goodlock  
> **Link Technologies:** openclaw × paperclipai  

---

## 🎯 Mission

Blackbird AI is a contribution force operating at the intersection of **openclaw** and **paperclipai**. Our goal is to systematically identify, implement, and push high-value contributions to the paperclipai/paperclip repository — crediting all work to the Blackbird AI team under the leadership of Josh Goodlock.

---

## 🗂️ Selected Issues

### 🔴 HIGH PRIORITY — Features
| # | Issue | Status |
|---|-------|--------|
| #803 | Archive/unarchive for projects and agents | 🟡 Queued |
| #770 | Declarative workflow pipelines with conditional routing | 🟡 Queued |
| #767 | Cross-agent long-term memory store | 🟡 Queued |
| #768 | Shared pipeline state for cross-agent data sharing | 🟡 Queued |
| #728 | Remote nodes for distributed agent execution | 🟡 Queued |
| #702 | Plugin host foundation with settings surface | 🟡 Queued |
| #708 | Agent performance analytics (KPIs, trends, efficiency) | 🟡 Queued |

### 🟡 MEDIUM PRIORITY — Features
| # | Issue | Status |
|---|-------|--------|
| #766 | Pipeline-step approvals (human-in-the-loop) | 🟡 Queued |
| #765 | Dismiss failed runs from inbox | 🟡 Queued |
| #757 | User menu with sign out (authenticated mode) | 🟡 Queued |
| #756 | Company-wide heartbeat time scale slider | 🟡 Queued |
| #690 | Qwen Code CLI adapter (qwen_local) | 🟡 Queued |
| #681 | Non-image MIME types in attachments API | 🟡 Queued |

### 🟢 LOW PRIORITY — Features
| # | Issue | Status |
|---|-------|--------|
| #755 | Browser notifications when tab is backgrounded | 🟡 Queued |
| #742 | Zero-config remote access / built-in tunnel | 🟡 Queued |

### 📚 Docs
| # | Issue | Status |
|---|-------|--------|
| #749 | How to configure agent skills (missing docs) | 🔴 High |
| #792 | zh-CN localization batch 2 | 🟡 Queued |
| #791 | zh-CN localization batch 1 | 🟡 Queued |
| #688 | Simplified + traditional Chinese docs | 🟡 Queued |

### 🔌 Skills
| # | Issue | Status |
|---|-------|--------|
| #749 | Agent skills configuration | 🔴 High |
| #702 | Plugin host foundation (skills surface) | 🔴 High |

---

## 🛠️ Contribution Workflow

```bash
# 1. List all selected issues
./.blackbird/contribute.sh list

# 2. Start work on an issue
./.blackbird/contribute.sh push 803 feature

# 3. Implement changes, then commit with attribution
./.blackbird/contribute.sh commit 803 "feat: add archive/unarchive for projects and agents"

# 4. Push and open PR
git push origin blackbird/issue-803
# Open PR at: https://github.com/paperclipai/paperclip/compare/blackbird/issue-803
```

---

## 🤝 Attribution Standard

Every commit and PR from Blackbird AI includes:

```
Co-authored by Blackbird AI (openclaw x paperclipai)
Project Lead: Josh Goodlock
Operation: Blackbird | Project: Paperclip
```

---

## 📁 Structure

```
.blackbird/
├── README.md                  ← This file
├── config.json                ← Team + org config
├── contribution-force.json    ← Issue selection + priorities
├── contribute.sh              ← Contribution Force CLI
├── issues/                    ← Per-issue work directories
│   └── issue-NNN/meta.json
├── features/                  ← Feature implementations
├── docs/                      ← Documentation contributions
├── skills/                    ← Skill/plugin contributions
└── templates/                 ← PR/commit templates
```

---

## 👥 Team

| Role | Name |
|------|------|
| Project Lead | **Josh Goodlock** |
| AI Team | **Blackbird AI** |
| Org Link | **openclaw × paperclipai** |

---

*Operation Blackbird — Blackbird AI — openclaw × paperclipai*
