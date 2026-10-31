# POEbot Knowledge Cache - Routing Catalog (INDEX)

**Read this FIRST on every Q&A question.** Then open ONLY the files listed for the matched topic. Machine-readable twin: `metadata/topic_routes.json` (keep both in sync).

- Root: `C:\Projects\POEbot\knowledge_cache\` (all paths below are relative to it)
- Do NOT list/glob/recurse `knowledge_cache/` for Q&A. Do NOT use `sources/`, `../docs/` (e.g. COVERAGE.md), or empty `processed/` for answers.
- **Read** = required for that topic. *Optional* = only if the question needs it.
- Ascendancy questions: ALWAYS read the main file + every sibling listed (always-include Key Facts).
- Match the longest alias first; an ascendancy full name beats a topic alias ("Spirit Walker" -> ascendancy, not Spirit). Multi-topic questions: read the de-duplicated union of matched rows (typically 1-3 files).
- Unknown term? Check `metadata/player_lexicon.json` for the official name, then route again. If nothing matches: "This topic is not yet documented in my Path of Exile 2 knowledge cache."

## Topics

| Topic | Player aliases | Read | Optional |
|---|---|---|---|
| Spirit resource (reservation, separate from Mana) | spirit, reservation, reservation pool, aura mana, aura reservation, minion pool, mana vs spirit, mana starvation, auras, heralds | `raw/mechanics/poe2_core_mechanics.md` | `raw/gems/poe2_tag_system_and_gem_interactions.md` |
| Dodge Roll / active avoidance | dodge, dodge roll, roll | `raw/mechanics/poe2_core_mechanics.md`<br>`raw/mechanics/poe2_defenses_and_ailments.md` | - |
| Dual-spec weapon swapping & passive allocation per weapon set | weapon swap, weapon set, dual spec, passive tree | `raw/mechanics/poe2_core_mechanics.md` | `raw/classes/poe2_classes_and_ascendancies.md` |
| Stumble, Stun & Freeze meters | stun, stumble, freeze, heavy stun | `raw/mechanics/poe2_core_mechanics.md` | `raw/mechanics/poe2_defenses_and_ailments.md` |
| Skill gem & socket system overhaul | sockets, gem sockets, links, support sockets | `raw/mechanics/poe2_core_mechanics.md`<br>`raw/gems/poe2db_gems_and_supports.md` | - |
| Armour / Evasion / Deflection / Energy Shield | defense, defence, armour, armor, evasion, deflection, evasion buffer, glancing hit, energy shield, es, mitigation | `raw/mechanics/poe2_defenses_and_ailments.md` | - |
| Status ailments (buildup vs random chance) | ailments, ignite, shock, poison, bleed | `raw/mechanics/poe2_defenses_and_ailments.md` | - |
| Skill tag system & support compatibility | tag, tags, minion tag, scaling, supports compatible, attack vs spell, aoe, strike, passive interaction with tags | `raw/gems/poe2_tag_system_and_gem_interactions.md` | `raw/gems/poe2db_gems_and_supports.md` |
| Uncut gems, gem levels, support categories, lineage & meta gems | gem, gems, uncut gem, gem drop, blank gem, raw gem, gemcutting, support gem, lineage, meta gem, trigger | `raw/gems/poe2db_gems_and_supports.md` | `raw/gems/poe2_tag_system_and_gem_interactions.md` |
| Minion skills & minion scaling (tag rules) | minion, minions, summon, summoner, pets | `raw/gems/poe2_tag_system_and_gem_interactions.md`<br>`raw/mechanics/poe2_core_mechanics.md` | - |
| 12 base classes, attribute pairs, starting locations, weapon affinities | class, classes, base class, warrior, ranger, huntress, witch, sorceress, mercenary, monk, druid, marauder, duelist, templar, shadow, attributes | `raw/classes/poe2_classes_and_ascendancies.md` | `raw/classes/poe2_ascendancies_and_trials.md` |
| Ascendancy rules, point allocation, trials, full roster | ascendancy, ascendancies, ascend, trials, trial of the sekhemas, trial of chaos, ascendancy points, list of ascendancies | `raw/classes/poe2_ascendancies_and_trials.md` | `raw/classes/poe2_classes_and_ascendancies.md` |
| Currency orbs, crafting rules, gold, disenchanting | currency, crafting, craft, chaos orb, transmutation, augmentation, regal, exalted, gold, respec, respec currency, regret orbs, gambling, disenchant, shards | `raw/items_crafting/poe2db_currency_and_crafting.md` | `raw/items_crafting/poe2db_runes_and_soul_cores.md` |
| Augments: Runes, Soul Cores, Augment Sockets, Artificer's Orb | rune, runes, rune socket, item socket, gear socket, augment, augment socket, soul core, soul cores, socketables, artificer, artificer's orb, socket orb, enchants | `raw/items_crafting/poe2db_runes_and_soul_cores.md` | `raw/items_crafting/poe2db_currency_and_crafting.md` |
| Campaign acts, interludes, boss rules (health reset, CC meters) | campaign, act, acts, interlude, boss, bosses, boss fight, walkthrough | `raw/bosses_acts/poe2_campaign_and_boss_mechanics.md` | - |
| Waystones, Atlas, Precursor Towers & Tablets, Atlas passive tree | endgame, map, maps, mapping, map tier, waystone, waystones, atlas, tower, fog tower, precursor tower, tablet, precursor tablet, scarab, scarabs, map juice, atlas passives | `raw/endgame/poe2_endgame_waystones_and_atlas.md` | - |

## Ascendancies (22) - main file + `_*` siblings (ALWAYS read all listed)

Shared optional for all ascendancies (trials, point allocation, roster): `raw/classes/poe2_ascendancies_and_trials.md`

| Ascendancy | Base class | Aliases | Read (main + always-include siblings) |
|---|---|---|---|
| Acolyte of Chayula | Monk | acolyte of chayula, acolyte, chayula | `raw/classes/ascendancies/acolyte_of_chayula.md` |
| Amazon | Huntress | amazon | `raw/classes/ascendancies/amazon.md` |
| Blood Mage | Witch | blood mage, bloodmage | `raw/classes/ascendancies/blood_mage.md` |
| Chronomancer | Sorceress | chronomancer, chrono | `raw/classes/ascendancies/chronomancer.md` |
| Deadeye | Ranger | deadeye | `raw/classes/ascendancies/deadeye.md` |
| Disciple of Varashta | Sorceress | disciple of varashta, disciple, varashta, djinn, djinns | `raw/classes/ascendancies/disciple_of_varashta.md`<br>`raw/classes/ascendancies/disciple_of_varashta_djinn_scaling.md` **(always_include)** |
| Gemling Legionnaire | Mercenary | gemling legionnaire, gemling | `raw/classes/ascendancies/gemling_legionnaire.md` |
| Infernalist | Witch | infernalist | `raw/classes/ascendancies/infernalist.md` |
| Invoker | Monk | invoker | `raw/classes/ascendancies/invoker.md` |
| Lich | Witch | lich | `raw/classes/ascendancies/lich.md` |
| Martial Artist | Monk | martial artist | `raw/classes/ascendancies/martial_artist.md` |
| Oracle | Druid | oracle, oracle ascendancy | `raw/classes/ascendancies/oracle.md` |
| Pathfinder | Ranger | pathfinder | `raw/classes/ascendancies/pathfinder.md` |
| Ritualist | Huntress | ritualist | `raw/classes/ascendancies/ritualist.md` |
| Shaman | Druid | shaman | `raw/classes/ascendancies/shaman.md` |
| Smith of Kitava | Warrior | smith of kitava, smith, kitava | `raw/classes/ascendancies/smith_of_kitava.md` |
| Spirit Walker | Huntress | spirit walker, spiritwalker | `raw/classes/ascendancies/spirit_walker.md` |
| Stormweaver | Sorceress | stormweaver | `raw/classes/ascendancies/stormweaver.md` |
| Tactician | Mercenary | tactician | `raw/classes/ascendancies/tactician.md` |
| Titan | Warrior | titan | `raw/classes/ascendancies/titan.md` |
| Warbringer | Warrior | warbringer | `raw/classes/ascendancies/warbringer.md` |
| Witchhunter | Mercenary | witchhunter, witch hunter | `raw/classes/ascendancies/witchhunter.md` |

**Disciple of Varashta (mandatory key fact):** every answer, including general ones, must state that its djinns only scale with skill tree nodes, skills, and skill gems that have the `minion` tag (cite `raw/classes/ascendancies/disciple_of_varashta.md`).

## Base class -> ascendancy files

- **Monk:** Acolyte of Chayula, Invoker, Martial Artist
- **Huntress:** Amazon, Ritualist, Spirit Walker
- **Witch:** Blood Mage, Infernalist, Lich
- **Sorceress:** Chronomancer, Disciple of Varashta, Stormweaver
- **Ranger:** Deadeye, Pathfinder
- **Mercenary:** Gemling Legionnaire, Tactician, Witchhunter
- **Druid:** Oracle, Shaman
- **Warrior:** Smith of Kitava, Titan, Warbringer

Base-class questions: read `raw/classes/poe2_classes_and_ascendancies.md`; add the ascendancy files above only if the question asks about that class's ascendancies.

## Not for Q&A

- `README.md` - pipeline/architecture doc (builder use, not game facts)
- `metadata/categories.json` - chunk taxonomy (builder use)
- `metadata/player_lexicon.json` - query normalization only, never cited
- `sources/` - raw scrape HTML + URL lists (forbidden for answers)
- `../docs/` (incl. `docs/COVERAGE.md`) - team working notes / KB coverage analysis; never route or cite for Q&A
- `processed/` - empty placeholder

## Maintenance

When adding/renaming any `raw/` file (incl. new `<slug>_*.md` siblings), update BOTH this file and `metadata/topic_routes.json` in the same change.
