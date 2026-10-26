# Path of Exile 2: Uncut Gems, Support Categories, and Lineage Gems

Source Reference: PoE2DB (`https://poe2db.tw/us/`)

---

## 1. The Uncut Gem Progression System

In Path of Exile 2, monsters and quest rewards do not drop hundreds of specific skill gems like "Fireball Level 1" or "Heavy Strike Level 1". Instead, players receive **Uncut Gems**.

### Uncut Gem Tiers & Types:
* **Uncut Skill Gem (Tier / Level X):**
  * When right-clicked, opens the **Gemcutting UI**.
  * Allows the player to choose and carve *any* active skill gem available at or below that gem's tier.
* **Uncut Support Gem:**
  * Used to carve and obtain support gems matching the player's level requirement.
* **Uncut Spirit Gem:**
  * Specifically used to carve persistent auras, heralds, permanent summons, and reservation-based skills.

---

## 2. Gem Sockets & Leveling Progression
* **Sockets Are on the Gem:**
  * Active skill gems have built-in support sockets (up to 5 support sockets, creating a 6-link setup).
  * You upgrade the number of support sockets on an active gem using currency (*Jeweller's Orbs* in PoE 2), rather than modifying armor pieces.
* **Independent Gem Leveling:**
  * Gems level up via gameplay experience or by consuming higher-tier uncut gems to advance their base stats and scaling.

---

## 3. Support Gem Restrictions & Mutually Exclusive Categories
PoE2DB organizes support gems into restriction categories to prevent game-breaking combinations:
* **Exclusive Archetype Categories:** Support gems within the same category family cannot be stacked on the same active skill (e.g., you cannot link two different variants of primary projectile multipliers if they belong to the same exclusion tag).
* **Tag Matching Enforcement:** A support gem will only activate if the skill shares its tag prerequisite (refer to `knowledge_cache/raw/gems/poe2_tag_system_and_gem_interactions.md`).

---

## 4. Lineage Support Gems (Endgame Innovation)
* **Definition:** Rare, game-transforming support gems that drop exclusively from pinnacle bosses, high-tier Waystones, or unique endgame encounters.
* **The "One-Per-Character" Restriction:**
  * A character may only socket **ONE copy of any given Lineage Support** across all of their active skills at any one time.
  * You cannot duplicate a Lineage Support onto multiple skills in the same build.

---

## 5. Meta-Trigger Gems
* **Definition:** Meta gems hold active skill gems and support gems inside them to automatically trigger actions when conditions are met.
* **Examples:**
  * *Cast on Melee Stun:* Triggers socketed spells when the player stuns an enemy with a melee attack.
  * *Cast on Shock:* Triggers socketed lightning spells when inflicting shock.
* **Spirit Cost:** Meta-trigger setups reserve a portion of the player's **Spirit pool** to remain primed.
