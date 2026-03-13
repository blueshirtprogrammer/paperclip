# Blackbird AI Issue Triage Report
**Project:** paperclipai/paperclip  
**Date:** $(date)  
**Lead:** Josh Goodlock (Link Technologies)

---

## 🐛 BUGS (13 open)

| # | Title | Priority | Complexity |
|---|-------|----------|------------|
| 809 | Comments on rejected hires don't get read/responded | HIGH | Medium |
| 799 | Comment-triggered wakes resume prior session without proper context | HIGH | High |
| 773 | Fail to run `edit` file tool once, counts as whole session fail | MEDIUM | Low |
| 751 | Missing error message when saving OpenAI API key | MEDIUM | Low |
| 748 | Claude run fails with "context window limit" | HIGH | Medium |

## ✨ FEATURES (13 open)

| # | Title | Priority | Complexity |
|---|-------|----------|------------|
| 795 | Publish Docker image to Docker Hub | HIGH | Low |
| 775 | Add PicoClaw local adapter support | MEDIUM | High |
| 764 | Cross-agent long-term memory store | HIGH | High |
| 763 | Shared pipeline state (cross-agent context) | HIGH | Medium |
| 762 | Pipeline-step approvals (interrupt points) | MEDIUM | Medium |

## 🎯 SKILLS (1 open)

| # | Title | Priority |
|---|-------|----------|
| 749 | How to configure agent skills? | LOW |

---

## Recommended Attack Order

### Phase 1: Quick Wins (Week 1)
1. **#773** - Tool failure bug (Low complexity, high impact)
2. **#751** - Error message bug (Quick fix)
3. **#795** - Docker Hub publishing (CI/CD expertise)

### Phase 2: Core Bugs (Week 2-3)
4. **#809** - Hire comment handling
5. **#799** - Session resume context
6. **#748** - Context window handling

### Phase 3: Features (Week 4-6)
7. **#763** - Shared pipeline state
8. **#762** - Pipeline-step approvals
9. **#775** - PicoClaw adapter

### Phase 4: Advanced (Week 7+)
10. **#764** - Cross-agent memory (High architectural impact)

