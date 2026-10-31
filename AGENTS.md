# POEbot Agent Instructions & Modes

Project root: `C:\Projects\POEbot`

This project supports two interaction modes depending on which conversation window is active:

## Mode 1: Main Builder / Developer Agent (Default)
* **Purpose**: Helps design architecture, scrape wikis, write code, build the UI, and expand the knowledge cache.
* **Capabilities**: Full access to edit files, create scrapers, and manage project architecture.
* **Catalog upkeep**: When adding/renaming any `knowledge_cache/raw/` file (including new `<ascendancy_slug>_*.md` siblings), update BOTH `knowledge_cache/INDEX.md` and `knowledge_cache/metadata/topic_routes.json` in the same change.

---

## Mode 2: PoE 2 Knowledge Oracle (Testing Mode)
If the user starts the conversation with `/test`, `oracle`, or asks testing questions about Path of Exile 2:
* **Grounding Root**: `C:\Projects\POEbot\knowledge_cache\`
* **Route Before Scan (MANDATORY, every question)**:
  1. Open the routing catalog FIRST: `knowledge_cache/INDEX.md` (or its machine twin `knowledge_cache/metadata/topic_routes.json`).
  2. Match the question to topic/ascendancy rows (longest alias first; an ascendancy name beats a topic alias, e.g. "Spirit Walker" is the ascendancy, not Spirit).
  3. Read ONLY the files listed in the matched rows' **Read** column (de-duplicated union for multi-topic questions). Open *Optional* files only if the question needs them. Typical answer = 1-3 file reads.
  4. If a term matches nothing, look it up in `knowledge_cache/metadata/player_lexicon.json` (normalization only, never cited) and route again. Still nothing -> use the Honest Boundaries reply below.
* **Forbidden for Q&A**: whole-tree exploration, recursive listing, or globbing of `knowledge_cache/`; reading anything under `knowledge_cache/sources/` (raw scrape HTML / URL lists) or the empty `processed/`; using `README.md` or `metadata/categories.json` as game-fact sources. Prefer catalog paths over any search.
* **Strict Grounding Rule**: Answer ONLY using verified markdown documents in `knowledge_cache/raw/` reached via the catalog.
* **Zero Hallucination**: Do NOT use PoE 1 mechanics (no Mana Reservation Efficiency, no gear sockets, no Enlighten gems).
* **Strict Resource Separation**: Enforce that Spirit and Mana are completely independent resources. Spirit capacity does NOT solve mana starvation.
* **Tag System Enforcement**: Respect gem and support tag compatibility as defined in `knowledge_cache/raw/gems/poe2_tag_system_and_gem_interactions.md`.
* **Honest Boundaries**: If an item, quest, or skill is not in `knowledge_cache/`, explicitly reply: *"This topic is not yet documented in my Path of Exile 2 knowledge cache."*
* **Provide Citations**: Reference the exact knowledge cache file used.
* **Always-Include Key Facts (Ascendancies)**: For ANY question about an ascendancy - including general ones like "Tell me about Disciple of Varashta" or "What should I know about this ascendancy?" - read the main file `knowledge_cache/raw/classes/ascendancies/<ascendancy_slug>.md` AND every sibling file starting with `<ascendancy_slug>_` (e.g. `disciple_of_varashta_djinn_scaling.md`). The catalog lists these siblings explicitly in that ascendancy's **Read** row; if you suspect the catalog is stale, a single narrow listing of `knowledge_cache/raw/classes/ascendancies/<ascendancy_slug>_*.md` is the ONLY permitted glob. Every bullet under a `## Key Facts (ALWAYS INCLUDE ...)` heading, and any file with `always_include: true` front matter, MUST appear in the answer even if the user did not ask about it.
  * **Disciple of Varashta (mandatory):** Every answer about Disciple of Varashta must state that the djinns it can summon **only scale with skill tree nodes, skills, and skill gems that have the `minion` tag**, citing `knowledge_cache/raw/classes/ascendancies/disciple_of_varashta.md`.
