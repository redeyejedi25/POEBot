# Path of Exile 2: Core Mechanics Reference

## 1. The Spirit Resource System & Strict Separation from Mana
* **Definition**: Spirit is a dedicated persistent resource (base cap typically 100, expandable via gear, scepters, and passives).
* **Usage**: Spirit is reserved for persistent buffs, auras, heralds, permanent minions, and meta-triggers.
* **Separation from Mana**: In PoE 2, auras and summons no longer reserve a percentage of your maximum Mana. Mana is strictly used for casting active skills and attacking.

### 1.1 Mana Problems vs. Spirit Problems: Two Completely Independent Systems
Mana sustain and Spirit reservation are two completely independent systems operating on separate resource pools. Auras and permanent summons reserve Spirit, never Mana. Therefore, expanding Spirit capacity does **nothing** for your mana sustain, and increasing Mana recovery does not expand Spirit capacity.

#### A. Mana Problems = Skill Cost & Sustain
If a character runs out of blue resource when spamming skills or attacks during combat, that is a **pure Mana problem**. Spirit will not help here at all.
* **How to fix Mana in PoE 2:**
  * **Mana Flasks:** Timing and flask charge generation.
  * **Mana Regeneration Rate:** Stacking flat mana regen or `% increased Mana Regeneration Rate` on gear/passives.
  * **Mana Leech:** Siphoning mana back through attack damage.
  * **Mana on Hit / Mana on Kill:** Weapon affixes, jewels, and passive nodes that return flat mana per strike or kill.
  * **Reduced Mana Cost of Skills:** Passive nodes and gem modifiers that lower the actual cost per cast.

#### B. Spirit Problems = Reservation Cap
If a player wants to activate an aura, summon more permanent minions, or socket an automated trigger gem, but gets the error **"Not enough Spirit"**, that is a **Spirit capacity problem**. Mana has zero effect on this.
* **How to fix Spirit in PoE 2:**
  * **Equipping a Scepter / Shield:** Scepters provide flat `+Spirit` (e.g., `+30 Maximum Spirit`).
  * **Gear Affixes:** Rolling flat Spirit on jewelry (amulets) or body armour.
  * **Spirit Passives on the Tree:** Allocating nodes that grant flat or percentage Spirit.
  * **Campaign Boss Rewards:** Completing specific side quests that grant permanent Spirit books.
  * **Deactivating an Aura or Summon:** Sacrificing one buff/minion to fit another.

#### C. AI Evaluation Rule: Avoiding the Hallucination Trap
When evaluating user questions regarding resource starvation:
* **WRONG (Hallucination):** *"Get more Spirit on your scepter or unreserve an aura to free up mana."*
* **CORRECT:** *"Spirit does not affect your mana pool or skill costs. To sustain mana, you need Mana on Hit, Mana Leech passives, Mana Regeneration Rate, or a higher recovery Mana Flask."*

## 2. Dodge Roll
* **Mechanics**: Every character has access to a dedicated dodge roll (spacebar by default).
* **Collision & Vulnerability**: Dodge roll provides collision avoidance (you can roll through packs of monsters). While it does not make you completely invulnerable to all damage, it breaks projectile tracking and gives invulnerability frames against specific melee swings and telegraph strikes.
* **Animation Canceling**: You can cancel active attack and cast animations early by initiating a dodge roll.

## 3. Skill Gem & Socket System Overhaul
* **Gems Socket into the Gem Screen**: Equipment pieces (body armour, helmets, boots, gloves) no longer roll gem sockets.
* **Skill Gem Sockets**: Sockets now exist directly on the Skill Gems themselves. Active skill gems have up to 5 support gem sockets built-in.
* **Gem Cutting**: Uncut Gems drop as loot. Players right-click an Uncut Gem to select and cut any skill gem available for their current level.
* **No Fusing/Chromatics for 6-Links**: You no longer need thousands of Orbs of Fusing to get a 6-link setup.

## 4. Dual-Spec Weapon Swapping & Passive Skill Allocation
* **Automatic Swapping**: Using a skill bound to Weapon Set 2 automatically swaps your active weapon set with no latency.
* **Weapon-Specific Passive Points**: Players earn specialized weapon passive points on the passive tree that apply only when the corresponding weapon set is active (e.g., allocating Frost damage when your Cold Staff is active, and Fire damage when swapping to your Fire Scepter).

## 5. Stumble, Stun & Freeze Meters
* **Boss Meters**: Bosses have visible buildup meters under their health bars for crowd control effects (Freeze, Stun, Stumble).
* **Diminishing Returns & Predictability**: Instead of random chance-based freezing or stunning, consistent hits build the meter until the boss becomes incapacitated, allowing for tactical burst windows.
