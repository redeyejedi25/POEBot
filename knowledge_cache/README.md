# Path of Exile 2 Knowledge Cache Architecture

This directory is the local knowledge repository for the **POEbot Assistant**. It organizes both raw reference material and processed, chunked data used to ground the AI model with accurate, hallucination-free Path of Exile 2 game facts.

---

## Directory Layout

```
knowledge_cache/
│
├── README.md                      # Overview & pipeline documentation (this file)
│
├── sources/                       # Lists of authoritative URLs, documentation, and scrapers
│   └── web_sources.txt            # Official wikis, database links, and patch note sources
│
├── raw/                           # Raw documents (Markdown/Text) before embedding
│   ├── mechanics/                 # Core mechanics (Spirit, Dodge Roll, Weapon Swapping, Defenses)
│   ├── classes/                   # Classes, passive tree specializations, and ascendancies
│   │   └── ascendancies/          # 22 dedicated files for each individual Ascendancy class and its nodes
│   ├── gems/                      # Active Skill Gems, Support Gems, and Spirit Reservations
│   ├── items_crafting/            # Runes, bases, prefixes/suffixes, and currency mechanics
│   ├── bosses_acts/               # Act guides, boss telegraphs, and damage type cheatsheets
│   └── endgame/                   # Waystones, Atlas progression, and Pinnacle boss encounters
│
├── processed/                     # Cleaned, standardized chunks ready for indexing / search
│   └── (Generated JSON/chunks with metadata tags)
│
└── metadata/                      # Schemas, category tags, and query normalization
    ├── categories.json            # Taxonomic categories used to tag chunks for targeted search
    └── player_lexicon.json        # Isolated synonym mapping dictionary (kept OUT of general context;
                                   # used strictly for query preprocessing/normalization)
```

---

## Data Ingestion & Query Normalization Flow

1. **Query Preprocessing (Player Lexicon)**:
   * When a player uses colloquial slang or PoE 1 carryover terms (e.g., *"How do I add rune sockets to my chest?"* or *"Where do I get T16 maps?"*), the query normalizer checks `metadata/player_lexicon.json` to map slang to official PoE 2 terminology (*"Augment Sockets"* / *"Waystones"*).
   * **Isolation Rule:** `player_lexicon.json` is never dumped into general prompt context; it acts purely as a translation lookup layer.
2. **Collection (`sources/` -> `raw/`)**:
   * Curated links in `sources/web_sources.txt` and databases like PoE2DB are saved as clean, pure Markdown files into their respective subfolders under `raw/`.
3. **Chunking & Tagging (`raw/` -> `processed/`)**:
   * Text is split by markdown headers into discrete chunks tagged with `metadata/categories.json`.
4. **Retrieval**:
   * The assistant retrieves the clean, authoritative documents from `raw/` or `processed/` and passes the exact facts to the AI model.
