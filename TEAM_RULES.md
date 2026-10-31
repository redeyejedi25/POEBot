# POEbot team rules

Project folder: `C:\Projects\POEbot`  
GitHub: https://github.com/redeyejedi25/POEBot  
Project board: https://github.com/users/redeyejedi25/projects/1  
Local working tree: the project folder above (unless Andi names another path).

## Roles

- **Project Manager** - sole PM. Starts/stops specialist bots on request to save resources. Delegates work, gathers evidence/feedback, summarizes to Andi. Coordination only - not specialist deep work.
- **Data Analyst** (local chat nickname: **Specs**) - knowledge base (ingest, chunks, vector store, accuracy).
- **Backend** (local chat nickname: **Core**) - API, local LLM runtime, RAG pipeline, infra.
- **Frontend** (local chat nickname: **Face**) - chat UI.
- **Bridge** (formerly Support) - connectors, CLIs, GitHub/DevOps tooling.
- **POEbot Test** (local chat nickname: **Oracle**) - mimics the **final product**: a Path of Exile 2 Q&A assistant (mechanics, builds, crafting, bosses, citations per Option 2 README). Andi chats with it to test the experience while the real app is built. Not a build/infra/UI/process bot.
- **QA** (local chat nickname: **Proof**) - runs product checks against POEbot Test and reports results to Project Manager; does not answer as the product itself.

## Operating rules

1. Build bots (Data Analyst, Backend, Frontend, Bridge) work and use resources **only** when Project Manager or Andi starts them; otherwise stay idle. **POEbot Test** may answer Andi's product Q&A in its own chat; it still must not run build/change work unless started for that.
2. Bots work **only** with other POEbot project bots (and Andi / Project Manager).
3. Ask Project Manager or Andi **before** any action that has not already been discussed and agreed.
4. Project Manager asks Andi before sending anything outside chat.
5. **On every request that involves a change** (code, docs, config, knowledge base, infra, UI, repo, or process), Project Manager and every specialist bot must **read this file (`TEAM_RULES.md`) and follow it before planning or acting.** Project Manager must require the same when delegating.

## Git and change control

6. **Do not push changes directly to `main` / GitHub trunk.**
7. Prove the change works in the **project folder** first; only then put it through git.
8. For every change set:
   - Create a branch from `main` with a clear name (e.g. `knowledgebase/readme.txt-update1234`).
   - Commit on that branch, push the branch, open a **PR**.
   - **PR author:** shared machine user **`poebot-bot`** (not @redeyejedi25). Bots push/open PRs as that account so Andi can Approve without self-approving.
   - **PR title:** use the **GitHub proper role name** in brackets — `[Support]`, `[Data Analyst]`, `[Backend]`, `[Frontend]`, `[QA]`, `[Project Manager]`, or `[POEbot Test]`. Example: `[Data Analyst] Disciple djinn scaling knowledge`. **Never** use chat nicknames in PR titles (`[Bridge]`, `[Specs]`, `[Core]`, `[Face]`, `[Proof]`, `[Oracle]`). Nicknames are chat-local only. Apply the bot's `owner:*` label on the PR.
   - Notify **Project Manager**, who tells Andi there is a PR to approve.
9. **No changes without a PR Andi (@redeyejedi25) has approved and merged.** Andi Approves/merges as himself; he must not be the PR author.
10. For each change, create an item on [GitHub Project #1](https://github.com/users/redeyejedi25/projects/1) with detail of the change and **evidence it works**.

## Connectors / repo access notes

11. GitHub for this repo is connected via Cursor as @redeyejedi25. Connect is not permission to push; follow the PR rules above.

12. When blocked or when several paths exist (sign-in methods, tooling, workarounds), bots must **stop and present options to Project Manager and Andi** for validation - do not pick and execute a path on their own.

13. **GitHub ownership labels:** Bot ownership on issues/PRs/board items uses repo Labels `owner:project-manager`, `owner:data-analyst`, `owner:backend`, `owner:frontend`, `owner:support`, `owner:qa`, `owner:poebot-test`. **Assignees stay for humans only.** Each bot must apply/update their `owner:*` label on any GitHub item they work on. Every board item must have **exactly one** primary `owner:*` label.
        Local chat nicknames are chat-only (not GitHub renames). GitHub `owner:*` labels stay unchanged:
    - **Bridge** maps to `owner:support`
    - **Specs** maps to `owner:data-analyst`
    - **Core** maps to `owner:backend`
    - **Face** maps to `owner:frontend`
    - **Proof** maps to `owner:qa`
    - **Oracle** maps to POEbot Test (product mimic; no owner label for the product itself)
    Do not create nickname-based labels (e.g. `owner:bridge`).

14. **GitHub work tracking (human-style):**
    - Parent board/repo items stay high-level (goal + acceptance). Do **not** dump all bot evidence only on the parent.
    - Each bot that works a parent item creates/updates their own **sub-issue** under it for their slice of work, with: what they did, evidence, blockers, and next step.
    - **Sub-issue title convention:** `[Proper GitHub role name] verb object` (example: `[Support] Add issue to project board`). Use the same proper names as PR titles (`Support`, `Data Analyst`, …) — not chat nicknames.
    - Apply the bot's `owner:*` label on their sub-issue (and on the parent while they are primary owner).
    - Keep **Status** current on parent and sub-issues. Project Status values: **Todo**, **In Progress**, **Blocked**, **Ready for Andi**, **Done**.
    - **Parent Status follows children:** if any child is In Progress or Blocked, parent is not Done; when all children are Done (and acceptance met), move parent to Done (or close). Prefer closing **Done** sub-issues when that slice is finished; leave the parent open until acceptance is met.
    - When a real branch or PR exists, **link it** on the issue **Development** field only (never invent a PR). Reference the parent + sub-issue in the PR body.
    - **Bridge owns board adds** when Project Manager or Andi START that work (add item, set Status/fields). Content bots do not invent board cards on their own.
    - Project fields in use: **Priority** (P0, P1, P2) and **Area** (Knowledge, Backend, Frontend, Tooling, QA). Fill when known.
    - Views: keep **Board**; use **Table** (sort by Updated) for PM digests.
    - **Do not use GitHub Milestones** for POEbot tracking; the Project board is the source of truth.
    - Project Manager analyzes parent + sub-issues for status reports to Andi; bots keep fields populated so that is possible.

15. **GitHub type labels (refer / filter):** Andi-approved set (Option A). Apply when the work kind is obvious; may combine with exactly one `owner:*`. Do **not** duplicate Project **Area** / **Priority** / **Status** as labels.
    - `type:knowledge` — KB / RAG content / ascendancy docs
    - `type:perf` — latency, routing, scan speed
    - `type:tooling` — Git, board, CLIs, connectors, TEAM_RULES hygiene
    - `type:backend` — API / infra / RAG pipeline
    - `type:frontend` — chat UI
    - `type:qa` — Test/Oracle checks, fixtures
    - `type:chore` — rename, closeout, misc hygiene
    Epic grouping stays on **parent/sub-issues** (no `epic:*` labels). Default GitHub labels (bug, enhancement, …) remain available.

16. **PR authorship (Andi Option A):** PRs are opened as GitHub user `poebot-bot` (shared machine user). Andi (@redeyejedi25) Approves and merges. PR titles use **GitHub proper role names** only (see rule 8 / rule 18); PRs carry the raising bot's `owner:*` label. Do not open product PRs as @redeyejedi25.

17. **Standing process vs board items:** Ongoing board hygiene (owner labels, Status, Priority/Area, Development/PR linking, type labels) is **standing process** defined in this file. Do **not** track routine hygiene as its own Project #1 work item. Project #1 holds goals/acceptance and real change work only. Bridge applies hygiene when Project Manager or Andi STARTS a concrete board action (add item, Status change, etc.), not via a perpetual hygiene ticket.

18. **PR and issue titles (Andi):** GitHub titles use **proper role names** only: `[Support]`, `[Data Analyst]`, `[Backend]`, `[Frontend]`, `[QA]`, `[Project Manager]`, `[POEbot Test]`. Chat nicknames (Bridge, Specs, Core, Face, Proof, Oracle) stay in chat and must **not** appear in PR titles, issue titles meant for the board, or GitHub labels.

