# Path of Exile 2: The Skill Tag System & Gem Compatibility Architecture

Source Reference: https://poe2skills.com/skill and PoE2DB

---

## 1. Overview: Why Tags Are the Fundamental Ground Truth
In Path of Exile 2, every **Active Skill Gem**, **Support Gem**, **Meta Gem**, and **Passive Tree Node** is governed by a strict **Tag Taxonomy**. 

Standard LLMs frequently make mistakes by assuming any support gem can support any skill, or that general damage passives scale any ability. In PoE 2:
1. **Support Gems can ONLY socket into and modify an Active Skill Gem if the Active Gem possesses the required compatible tags.**
2. **Passive Points, Modifiers, and Gear Affixes strictly scale skills that match their specific tags.**
3. **If a skill lacks a tag, that modifier provides exactly 0% benefit**, regardless of how intuitive it might seem.

---

## 2. Core Tag Taxonomy & Categories

### A. Action & Delivery Archetypes (Mutually Exclusive or Behavioral)
* `Attack`: The skill calculates damage based on weapon stats, weapon base damage, and local weapon attack speed. Scales with "Attack Speed", "Attack Damage", and weapon damage modifiers.
* `Spell`: The skill has its own base damage, cast time, and critical strike chance rolled on the gem itself. Scales with "Cast Speed", "Spell Damage", and gem level, NOT weapon base attack speed or weapon flat damage (unless "added damage to spells").
* `Cast`: Identifies a spell or activation requiring a casting animation.
* `Melee`: Strikes or close-quarters abilities requiring melee weapons.
* `Strike`: Single-target or frontal cone melee attacks. Interacts with strike-range and additional target modifiers.
* `Slam`: Heavy, slower area-of-effect ground attacks. Interacts with exert mechanics and slam damage modifiers.
* `Projectile`: Moves through 2D/3D space with velocity. Interacts with fork, pierce, chain, additional projectiles, and projectile speed.
* `AoE` (Area of Effect): Covers an area on the ground or in space. Scales with "Area of Effect" radius and "Area Damage".
* `Channelling`: Continuously held skills with staging or ramping costs/effects. Cannot be supported by standard repetition gems (e.g. Multistrike/Spell Echo).

### B. PoE 2 Weapon & Ammunition Specific Tags
* `Ammunition`: Specific to Crossbow mechanics where loaded bolts dictate firing behavior.
* `Grenade`: Explosive munitions with delayed detonation or contact triggers.
* `Hazard`: Environmental or ground-based zone traps/obstacles placed during combat.
* `Quarterstaff`, `Bow`, `Crossbow`, `Flail`, `Mace`, `Axe`, `Sword`, `Dagger`, `Scepter`, `Staff`, `Wand`: Weapon-type restrictive tags. An attack skill tagged with `Quarterstaff` cannot be used with a Bow.

### C. Damage & Elemental Tags
* `Physical`, `Fire`, `Cold`, `Lightning`, `Chaos`:
  * Every damaging skill has one or more damage tags indicating its native types.
  * *Conversion Rule:* If a skill natively has `Physical` and 50% is converted to `Fire`, it gains the `Fire` tag. It now benefits from both "Increased Physical Damage" AND "Increased Fire Damage" (scaled additively or across steps according to conversion order).

### D. Entity & Autonomous Tags
* `Minion`: Summons autonomous allies (skeletons, zombies, beasts) that fight for you.
  * **Critical Mechanic:** Minions are separate entities. Modifiers on your gear or tree stating "Increased Spell Damage" or "Increased Cast Speed" DO NOT apply to minions, even if the skill gem is tagged `Spell` and `Minion`. Only modifiers specifically stating "Minion Damage", "Minion Speed", or support gems with the `Minion` tag affect them.
* `Totem`: Stationary entities that channel or cast a skill on your behalf.
* `Companion`: Specific persistent animal or beast allies (e.g., Huntress / Druid mechanics).

### E. Utility, Buff & Debuff Tags
* `Aura`: Persistent radius effect reserving resources (Spirit in PoE 2).
* `Buff`: Temporary positive state granted to the player or allies.
* `Curse` / `Hex` / `Mark`: Debuffs applied to enemies reducing their stats or granting on-hit rewards.
* `Duration`: Any skill with an expiration timer (e.g., ground effects, temporary buffs). Scales with "Increased Skill Effect Duration".
* `Persistent`: Ongoing reservation skills that stay active until toggled off.

### F. Meta & Trigger Tags
* `Meta`: Specialized gems in PoE 2 that hold other active skills to trigger them automatically (e.g., "Cast on Shock", "Cast on Melee Stun").

---

## 3. Strict Rules of Support Gem Compatibility

### Rule 1: The Tag Match Prerequisite
A Support Gem's text defines what it can support by referencing tags:
* **Example - *Multiple Projectiles Support*:**
  * Supported Tag Required: `Projectile`.
  * **Valid:** *Spark* (`Spell`, `Projectile`, `Lightning`), *Ice Shot* (`Attack`, `Projectile`, `Cold`, `Bow`).
  * **Invalid:** *Ground Slam* (`Attack`, `AoE`, `Melee`, `Slam`). *Multiple Projectiles* will do nothing and cannot be linked.

### Rule 2: Attack vs. Spell Separation
* *Faster Attacks Support* requires `Attack`. It will NEVER speed up a skill tagged `Spell` (e.g., *Fireball*).
* *Faster Casting Support* requires `Spell` or `Cast`. It will NEVER speed up an ability tagged `Attack` (e.g., *Cleave*).

### Rule 3: The AoE & Strike Paradox
* If a skill is tagged `Melee`, `Strike`, and `Single Target` without the `AoE` tag:
  * An *Increased Area of Effect Support* will provide **NO** benefit.
  * Only after linking a support or choosing a passive that grants AoE splash behavior can Area modifiers apply.

---

## 4. How Passive Skill Points Interact With Tags

When evaluating passive nodes on the tree:
1. **Single-Tag Multipliers:**
   * Node: `+12% increased Fire Damage`
   * Applies to: Any skill possessing the `Fire` tag (both Spells and Attacks).
2. **Compound-Tag Multipliers (Restricted):**
   * Node: `+15% increased Melee Physical Damage`
   * Applies to: Only skills that have BOTH the `Melee` AND `Physical` tags on an `Attack`.
   * Does NOT apply to: *Ethereal Knives* (which is `Spell`, `Physical`, `Projectile` — lacks `Melee`).
3. **Weapon Swap Passives (PoE 2 Innovation):**
   * Certain passive clusters only apply while a specific weapon set is active.
   * If an active skill switches you to Weapon Set 2 (`Quarterstaff`), only passive nodes assigned to Weapon Set 2 apply to that attack's tags.

---

## 5. Practical Cheat-Sheet for AI Query Evaluation

When an AI analyzes a user's question about gem links or build viability:
1. **Extract all tags** of the primary active skill gem (e.g., `[Attack, Melee, Strike, Lightning]`).
2. **Inspect candidate support gems**: Check each support gem's "Supports skills with..." clause against the extracted tags.
3. **Flag Incompatibilities immediately**: If the user asks *"Can I link Spell Echo to Sunder?"*, the AI must immediately answer:
   * **No**, because *Sunder* is an `Attack` (`Melee`, `Slam`), whereas *Spell Echo* strictly supports skills with the `Spell` tag.
