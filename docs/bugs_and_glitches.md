
## Multi-player battle engine


### Perish Song and Spikes can leave a Pokémon with 0 HP and not faint

([Video](https://www.youtube.com/watch?v=1IiPWw5fMf8&t=85))

**Fix:** Edit `CheckFaint_PlayerThenEnemy` and `CheckFaint_EnemyThenPlayer` in [engine/battle/core.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/core.asm):

```diff
 	jp HandleEncore

+HasAnyoneFainted:
+	call HasPlayerFainted
+	jp nz, HasEnemyFainted
+	ret
+
 CheckFaint_PlayerThenEnemy:
-; BUG: Perish Song and Spikes can leave a Pokemon with 0 HP and not faint (see docs/bugs_and_glitches.md)
+.faint_loop
+	call .Function
+	ret c
+	call HasAnyoneFainted
+	ret nz
+	jr .faint_loop
+
+.Function:
 	call HasPlayerFainted
 	jr nz, .PlayerNotFainted
 	call HandlePlayerMonFaint
 	...
```

```diff
 CheckFaint_EnemyThenPlayer:
-; BUG: Perish Song and Spikes can leave a Pokemon with 0 HP and not faint (see docs/bugs_and_glitches.md)
+.faint_loop
+	call .Function
+	ret c
+	call HasAnyoneFainted
+	ret nz
+	jr .faint_loop
+
+.Function:
 	call HasEnemyFainted
 	jr nz, .EnemyNotFainted
 	call HandleEnemyMonFaint
 	...
```


### Thick Club and Light Ball can make (Special) Attack wrap around above 1024

([Video](https://www.youtube.com/watch?v=rGqu3d3pdok&t=450))

**Fix:** Edit `SpeciesItemBoost` in [engine/battle/effect_commands.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/effect_commands.asm):

```diff
 ; Double the stat
-; BUG: Thick Club and Light Ball can make (Special) Attack wrap around above 1024 (see docs/bugs_and_glitches.md)
 	sla l
 	rl h
+
+	ld a, HIGH(MAX_STAT_VALUE)
+	cp h
+	jr c, .cap
+	ret nz
+	ld a, LOW(MAX_STAT_VALUE)
+	cp l
+	ret nc
+
+.cap
+	ld hl, MAX_STAT_VALUE
 	ret
```


### Metal Powder can increase damage taken with boosted (Special) Defense

([Video](https://www.youtube.com/watch?v=rGqu3d3pdok&t=450))

**Fix:** Edit [engine/battle/effect_commands.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/effect_commands.asm):

```diff
 DittoMetalPowder:
 	...

-; BUG: Metal Powder can increase damage taken with boosted (Special) Defense (see docs/bugs_and_glitches.md)
-	ld a, c
-	srl a
-	add c
-	ld c, a
-	ret nc
-
-	srl b
-	ld a, b
-	and a
-	jr nz, .done
-	inc b
-.done
-	scf
-	rr c
+	ld h, b
+	ld l, c
+	srl b
+	rr c
+	add hl, bc
+	ld b, h
+	ld c, l
+
+	ld a, HIGH(MAX_STAT_VALUE)
+	cp b
+	jr c, .cap
+	ret nz
+	ld a, LOW(MAX_STAT_VALUE)
+	cp c
+	ret nc
+
+.cap
+	ld bc, MAX_STAT_VALUE
 	ret
```

```diff
 PlayerAttackDamage:
 	...

 .done
+	push hl
+	call DittoMetalPowder
+	pop hl

 	call TruncateHL_BC

 	ld a, [wBattleMonLevel]
 	ld e, a
-	call DittoMetalPowder

 	ld a, 1
 	and a
 	ret
```

```diff
 EnemyAttackDamage:
 	...

 .done
+	push hl
+	call DittoMetalPowder
+	pop hl

 	call TruncateHL_BC

 	ld a, [wBattleMonLevel]
 	ld e, a
-	call DittoMetalPowder

 	ld a, 1
 	and a
 	ret
```


### Reflect and Light Screen can make (Special) Defense wrap around above 1024

This bug existed for all battles in Gold and Silver, and was only fixed for single-player battles in Crystal to preserve link compatibility.

**Fix:** Edit `TruncateHL_BC` in [engine/battle/effect_commands.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/effect_commands.asm):

```diff
 .finish
-; BUG: Reflect and Light Screen can make (Special) Defense wrap around above 1024 (see docs/bugs_and_glitches.md)
-	ld a, [wLinkMode]
-	cp LINK_COLOSSEUM
-	jr z, .done
 ; If we go back to the loop point,
 ; it's the same as doing this exact
 ; same check twice.
 	ld a, h
 	or b
 	jr nz, .loop

-.done
 	ld b, l
 	ret
```

(This fix also affects Thick Club, Light Ball, and Metal Powder, as described above, but their specific fixes in the above bugs allow more accurate damage calculations.)


### Moves with a 100% secondary effect chance will not trigger it in 1/256 uses

([Video](https://www.youtube.com/watch?v=mHkyO5T5wZU&t=206))

**Fix:** Edit `BattleCommand_EffectChance` in [engine/battle/effect_commands.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/effect_commands.asm):

```diff
 .got_move_chance
-; BUG: Moves with a 100% secondary effect chance will not trigger it in 1/256 uses (see docs/bugs_and_glitches.md)
-	call BattleRandom
+	ld a, [hl]
+	sub 100 percent
+	; If chance was 100%, RNG won't be called (carry not set)
+	; Thus chance will be subtracted from 0, guaranteeing a carry
+	call c, BattleRandom
 	cp [hl]
 	pop hl
 	ret c

 .failed
 	ld a, 1
 	ld [wEffectFailed], a
 	and a
 	ret
```

**Compatibility preservation:** If you wish to keep compatibility with standard Pokémon Crystal, you can disable the fix during link battles by also applying the following edit in the same place:

```diff
+	ld a, [wLinkMode]
+	cp LINK_COLOSSEUM
+	scf ; Force RNG to be called
+	jr z, .nofix ; Don't apply fix in link battles, for compatibility
 	ld a, [hl]
 	sub 100 percent
 	; If chance was 100%, RNG won't be called (carry not set)
 	; Thus chance will be subtracted from 0, guaranteeing a carry
+.nofix
 	call c, BattleRandom
```

### Belly Drum sharply boosts Attack even with under 50% HP

([Video](https://www.youtube.com/watch?v=zuCLMikWo4Y))

**Fix:** Edit `BattleCommand_BellyDrum` in [engine/battle/move_effects/belly_drum.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/move_effects/belly_drum.asm):

```diff
 BattleCommand_BellyDrum:
-; BUG: Belly Drum sharply boosts Attack even with under 50% HP (see docs/bugs_and_glitches.md)
-	call BattleCommand_AttackUp2
-	ld a, [wAttackMissed]
-	and a
-	jr nz, .failed
-
 	callfar GetHalfMaxHP
 	callfar CheckUserHasEnoughHP
 	jr nc, .failed
+
+	push bc
+	call BattleCommand_AttackUp2
+	pop bc
+	ld a, [wAttackMissed]
+	and a
+	jr nz, .failed
```


### Berserk Gene's confusion lasts for 256 turns or the previous Pokémon's confusion count

([Video](https://youtube.com/watch?v=Pru3mohq20A))

**Fix:** Edit `HandleBerserkGene` in [engine/battle/core.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/core.asm):

```diff
 HandleBerserkGene:
 	...
-; BUG: Berserk Gene's confusion lasts for 256 turns or the previous Pokémon's confusion count (see docs/bugs_and_glitches.md)
 	ld a, BATTLE_VARS_SUBSTATUS3
 	call GetBattleVarAddr
 	push af
 	set SUBSTATUS_CONFUSED, [hl]
+	ldh a, [hBattleTurn]
+	and a
+	ld hl, wPlayerConfuseCount
+	jr z, .set_confuse_count
+	ld hl, wEnemyConfuseCount
+.set_confuse_count
+	call BattleRandom
+	and %11
+	add 2
+	ld [hl], a
 	ld a, BATTLE_VARS_MOVE_ANIM
 	call GetBattleVarAddr
 	...
```

This makes the Berserk Gene use the regular confusion duration (2–5 turns).


### Confusion damage is affected by type-boosting items and Explosion/Self-Destruct doubling

([Video](https://twitter.com/crystal_rby/status/874626362287562752))

**Fix:**

First, edit [wram.asm](https://github.com/pret/pokecrystal/blob/master/wram.asm):

```diff
 wTurnEnded:: db

-	ds 1
+wIsConfusionDamage:: db

 wPlayerStats::
```

Then edit four routines in [engine/battle/effect_commands.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/effect_commands.asm):

```diff
 HitSelfInConfusion:
 	...
 	call TruncateHL_BC
 	ld d, 40
 	pop af
 	ld e, a
+	ld a, TRUE
+	ld [wIsConfusionDamage], a
 	ret
```

```diff
 BattleCommand_DamageCalc:
 ; Return a damage value for move power d, player level e, enemy defense c and player attack b.
-; BUG: Confusion damage is affected by type-boosting items and Explosion/Self-Destruct doubling (see docs/bugs_and_glitches.md)
 	...
 .skip_zero_damage_check
+	xor a ; Not confusion damage
+	ld [wIsConfusionDamage], a
+	; fallthrough
+
+ConfusionDamageCalc:
 ; Minimum defense value is 1.
 	ld a, c
 	and a
 	jr nz, .not_dividing_by_zero
 	ld c, 1
 .not_dividing_by_zero

 	...

 ; Item boosts
+
+; Item boosts don't apply to confusion damage
+	ld a, [wIsConfusionDamage]
+	and a
+	jr nz, .DoneItem
+
 	call GetUserItem

 	...
```

```diff
 CheckEnemyTurn:
 	...

 	ld hl, HurtItselfText
 	call StdBattleTextbox

 	call HitSelfInConfusion
-	call BattleCommand_DamageCalc
+	call ConfusionDamageCalc
 	call BattleCommand_LowerSub

 	...
```

```diff
 HitConfusion:
 	ld hl, HurtItselfText
 	call StdBattleTextbox

 	xor a
 	ld [wCriticalHit], a

 	call HitSelfInConfusion
-	call BattleCommand_DamageCalc
+	call ConfusionDamageCalc
 	call BattleCommand_LowerSub
```


### Moves that lower Defense can do so after breaking a Substitute

([Video](https://www.youtube.com/watch?v=OGwKPRJLaaI))

This bug affects Acid, Iron Tail, and Rock Smash.

**Fix:** Edit `DefenseDownHit` in [data/moves/effects.asm](https://github.com/pret/pokecrystal/blob/master/data/moves/effects.asm):

```diff
 DefenseDownHit:
 	checkobedience
 	usedmovetext
 	doturn
 	critical
 	damagestats
 	damagecalc
 	stab
 	damagevariation
 	checkhit
 	effectchance
 	hittarget
 	failuretext
 	checkfaint
 	criticaltext
 	supereffectivetext
 	checkfaint
 	buildopponentrage
-; BUG: Moves that lower Defense can do so after breaking a Substitute (see docs/bugs_and_glitches.md)
-	effectchance
 	defensedown
 	statdownmessage
 	endmove
```


### Counter and Mirror Coat still work if the opponent uses an item

([Video](https://www.youtube.com/watch?v=uRYyzKRatFk))

**Fix:** Edit `BattleCommand_Counter` in [engine/battle/move_effects/counter.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/move_effects/counter.asm) and `BattleCommand_MirrorCoat` in [engine/battle/move_effects/mirror_coat.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/move_effects/mirror_coat.asm):

```diff
-; BUG: Counter and Mirror Coat still work if the opponent uses an item (see docs/bugs_and_glitches.md)
 	ld hl, wCurDamage
 	ld a, [hli]
 	or [hl]
-	ret z
+	jr z, .failed
```

Add this to the end of each file:

```diff
+.failed
+	ld a, 1
+	ld [wEffectFailed], a
+	and a
+	ret
```


### A Disabled but PP Up–enhanced move may not trigger Struggle

([Video](https://www.youtube.com/watch?v=1v9x4SgMggs))

**Fix:** Edit `CheckPlayerHasUsableMoves` in [engine/battle/core.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/core.asm):

```diff
 .done
-; BUG: A Disabled but PP Up–enhanced move may not trigger Struggle (see docs/bugs_and_glitches.md)
-	and a
+	and PP_MASK
 	ret nz

 .force_struggle
 	ld hl, BattleText_MonHasNoMovesLeft
 	call StdBattleTextbox
 	ld c, 60
 	call DelayFrames
 	xor a
 	ret
```


### A Pokémon that fainted from Pursuit will have its old status condition when revived

([Video](https://www.youtube.com/watch?v=tiRvw-Nb2ME))

**Fix:** Edit `PursuitSwitch` in [engine/battle/core.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/core.asm):

```diff
-; BUG: A Pokémon that fainted from Pursuit will have its old status condition when revived (see docs/bugs_and_glitches.md)
 	ld a, $f0
 	ld [wCryTracks], a
 	ld a, [wBattleMonSpecies]
 	call PlayStereoCry
+	ld a, [wCurBattleMon]
+	push af
 	ld a, [wLastPlayerMon]
+	ld [wCurBattleMon], a
+	call UpdateFaintedPlayerMon
+	pop af
+	ld [wCurBattleMon], a
-	ld c, a
-	ld hl, wBattleParticipantsNotFainted
-	ld b, RESET_FLAG
-	predef SmallFarFlagAction
 	call PlayerMonFaintedAnimation
 	ld hl, BattleText_MonFainted
 	jr .done_fainted
```


### Lock-On and Mind Reader don't always bypass Fly and Dig

This bug affects Attract, Curse, Foresight, Mean Look, Mimic, Nightmare, Spider Web, Transform, and stat-lowering effects of moves like String Shot or Bubble during the semi-invulnerable turn of Fly or Dig.

**Fix:** Edit `CheckHiddenOpponent` in [engine/battle/effect_commands.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/effect_commands.asm):

```diff
 CheckHiddenOpponent:
-; BUG: Lock-On and Mind Reader don't always bypass Fly and Dig (see docs/bugs_and_glitches.md)
+	ld a, BATTLE_VARS_SUBSTATUS5_OPP
+	call GetBattleVar
+	cpl
+	and 1 << SUBSTATUS_LOCK_ON
+	ret z
+
 	ld a, BATTLE_VARS_SUBSTATUS3_OPP
 	call GetBattleVar
 	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
 	ret
```


### Beat Up can desynchronize link battles

([Video](https://www.youtube.com/watch?v=202-iAsrIa8))

**Fix:** Edit `BattleCommand_BeatUp` in [engine/battle/move_effects/beat_up.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/move_effects/beat_up.asm):

```diff
 .got_mon
-; BUG: Beat Up can desynchronize link battles (see docs/bugs_and_glitches.md)
 	ld a, [wCurBeatUpPartyMon]
 	ld hl, wPartyMonNicknames
 	call GetNickname
 	ld a, MON_HP
 	call GetBeatupMonLocation
 	ld a, [hli]
 	or [hl]
 	jp z, .beatup_fail ; fainted
 	ld a, [wCurBeatUpPartyMon]
 	ld c, a
 	ld a, [wCurBattleMon]
-	cp [hl]
+	cp c
 	ld hl, wBattleMonStatus
 	jr z, .active_mon
 	ld a, MON_STATUS
 	call GetBeatupMonLocation
 .active_mon
 	ld a, [hl]
 	and a
 	jp nz, .beatup_fail
```


### Beat Up works incorrectly with only one Pokémon in the party

This bug prevents the rest of Beat Up's effect from being executed if the player or enemy only has one Pokémon in their party while using it. It prevents Substitute from being raised and King's Rock from working.

**Fix:** Edit `BattleCommand_EndLoop` in [engine/battle/effect_commands.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/effect_commands.asm):

```diff
 .only_one_beatup
-; BUG: Beat Up works incorrectly with only one Pokémon in the party (see docs/bugs_and_glitches.md)
 	ld a, BATTLE_VARS_SUBSTATUS3
 	call GetBattleVarAddr
 	res SUBSTATUS_IN_LOOP, [hl]
-	call BattleCommand_BeatUpFailText
-	jp EndMoveEffect
+	ret
```

**Cosmetic fix:** This fix does not break compatibility, but it only affects what's shown on the screen for the patched game.

```diff
 .only_one_beatup
 ; BUG: Beat Up works incorrectly with only one Pokemon in the party (see docs/bugs_and_glitches.md)
 	ld a, BATTLE_VARS_SUBSTATUS3
 	call GetBattleVarAddr
 	res SUBSTATUS_IN_LOOP, [hl]
 	call BattleCommand_BeatUpFailText
+	call BattleCommand_RaiseSub
 	jp EndMoveEffect
```


### Beat Up may fail to raise Substitute

*Fixing this cosmetic bug will* **not** *break link battle compatibility.*

This bug prevents Substitute from being raised if Beat Up was blocked by Protect or Detect.

**Fix:** Edit `BattleCommand_FailureText` in [engine/battle/effect_commands.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/effect_commands.asm).

```diff
-; BUG: Beat Up may fail to raise Substitute (see docs/bugs_and_glitches.md)
 	cp EFFECT_MULTI_HIT
 	jr z, .multihit
 	cp EFFECT_DOUBLE_HIT
 	jr z, .multihit
 	cp EFFECT_POISON_MULTI_HIT
 	jr z, .multihit
+	cp EFFECT_BEAT_UP
+	jr z, .multihit
 	jp EndMoveEffect

 .multihit
 	call BattleCommand_RaiseSub
 	jp EndMoveEffect
```


### Beat Up may trigger King's Rock even if it failed

**Fix:** Edit `BattleCommand_BeatUpFailText` in [engine/battle/move_effects/beat_up.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/move_effects/beat_up.asm):

```diff
 BattleCommand_BeatUpFailText:
-; BUG: Beat Up may trigger King's Rock even if it failed (see docs/bugs_and_glitches.md)
 	ld a, [wBeatUpHitAtLeastOnce]
 	and a
 	ret nz
+
+	inc a
+	ld [wAttackMissed], a

 	jp PrintButItFailed
```


### Present damage is incorrect in link battles

([Video](https://www.youtube.com/watch?v=XJaQoKtrEuw))

This bug existed for all battles in Gold and Silver, and was only fixed for single-player battles in Crystal to preserve link compatibility.

**Fix:** Edit `BattleCommand_Present` in [engine/battle/move_effects/present.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/move_effects/present.asm):

```diff
 BattleCommand_Present:
-; BUG: Present damage is incorrect in link battles (see docs/bugs_and_glitches.md)
-	ld a, [wLinkMode]
-	cp LINK_COLOSSEUM
-	jr z, .colosseum_skippush
 	push bc
 	push de
-.colosseum_skippush
-
 	call BattleCommand_Stab
-
-	ld a, [wLinkMode]
-	cp LINK_COLOSSEUM
-	jr z, .colosseum_skippop
 	pop de
 	pop bc
-.colosseum_skippop
```


### Return and Frustration deal no damage when the user's happiness is low or high, respectively

This happens because the user's happiness (or 255 − happiness for Frustration) is multiplied by 10 and divided by 25, which rounds down to zero when the happiness is 0–2 (or 253–255 for Frustration).

**Fix:**

Edit [engine/battle/move_effects/return.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/move_effects/return.asm):

```diff
 BattleCommand_HappinessPower:
-; BUG: Return and Frustration deal no damage when the user's happiness is low or high, respectively (see docs/bugs_and_glitches.md)
 	...
 	call Multiply
 	ld a, 25
 	ldh [hDivisor], a
 	ld b, 4
 	call Divide
 	ldh a, [hQuotient + 3]
+	and a
+	jr nz, .done
+	inc a
+.done
 	ld d, a
 	pop bc
 	ret
```

And edit [engine/battle/move_effects/frustration.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/move_effects/frustration.asm):

```diff
 BattleCommand_FrustrationPower:
-; BUG: Return and Frustration deal no damage when the user's happiness is low or high, respectively (see docs/bugs_and_glitches.md)
 	...
 	call Multiply
 	ld a, 25
 	ldh [hDivisor], a
 	ld b, 4
 	call Divide
 	ldh a, [hQuotient + 3]
+	and a
+	jr nz, .done
+	inc a
+.done
 	ld d, a
 	pop bc
 	ret
```


### Dragon Scale, not Dragon Fang, boosts Dragon-type moves

**Fix:** Edit `ItemAttributes` in [data/items/attributes.asm](https://github.com/pret/pokecrystal/blob/master/data/items/attributes.asm):

```diff
-; BUG: Dragon Scale, not Dragon Fang, boosts Dragon-type moves (see docs/bugs_and_glitches.md)
 ; DRAGON_FANG
-	item_attribute 100, HELD_NONE, 0, CANT_SELECT, ITEM, ITEMMENU_NOUSE, ITEMMENU_NOUSE
+	item_attribute 100, HELD_DRAGON_BOOST, 10, CANT_SELECT, ITEM, ITEMMENU_NOUSE, ITEMMENU_NOUSE
 ...
 ; DRAGON_SCALE
-	item_attribute 2100, HELD_DRAGON_BOOST, 10, CANT_SELECT, ITEM, ITEMMENU_NOUSE, ITEMMENU_NOUSE
+	item_attribute 2100, HELD_NONE, 0, CANT_SELECT, ITEM, ITEMMENU_NOUSE, ITEMMENU_NOUSE
```


### Switching out or switching against a Pokémon with max HP below 4 freezes the game

This happens because switching involves calculating a percentage of maximum enemy HP. Directly calculating *HP* × 100 / *max HP* would require a two-byte denominator, so instead the game calculates *HP* × 25 / (*max HP* / 4), since even a maximum HP of 999 divided by 4 is 249, which fits in one byte. However, if the maximum HP is below 4 this will divide by 0, which enters an infinite loop in `_Divide`.

**Fix:** First, edit `SendOutMonText` in [engine/battle/core.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/core.asm):

```diff
-; BUG: Switching out or switching against a Pokémon with max HP below 4 freezes the game (see docs/bugs_and_glitches.md)
 	; compute enemy health remaining as a percentage
 	xor a
 	ldh [hMultiplicand + 0], a
 	ld hl, wEnemyMonHP
 	ld a, [hli]
 	ld [wEnemyHPAtTimeOfPlayerSwitch], a
 	ldh [hMultiplicand + 1], a
 	ld a, [hl]
 	ld [wEnemyHPAtTimeOfPlayerSwitch + 1], a
 	ldh [hMultiplicand + 2], a
-	ld a, 25
-	ldh [hMultiplier], a
-	call Multiply
 	ld hl, wEnemyMonMaxHP
 	ld a, [hli]
 	ld b, [hl]
-	srl a
-	rr b
-	srl a
-	rr b
+	ld c, 100
+	and a
+	jr z, .shift_done
+.shift
+	rra
+	rr b
+	srl c
+	and a
+	jr nz, .shift
+.shift_done
+	ld a, c
+	ldh [hMultiplier], a
+	call Multiply
 	ld a, b
 	ld b, 4
 	ldh [hDivisor], a
 	call Divide
```

Then edit `WithdrawMonText` in the same file:

```diff
 	; compute enemy health lost as a percentage
 	ld hl, wEnemyMonHP + 1
 	ld de, wEnemyHPAtTimeOfPlayerSwitch + 1
 	ld b, [hl]
 	dec hl
 	ld a, [de]
 	sub b
 	ldh [hMultiplicand + 2], a
 	dec de
 	ld b, [hl]
 	ld a, [de]
 	sbc b
 	ldh [hMultiplicand + 1], a
-	ld a, 25
-	ldh [hMultiplier], a
-	call Multiply
 	ld hl, wEnemyMonMaxHP
 	ld a, [hli]
 	ld b, [hl]
-	srl a
-	rr b
-	srl a
-	rr b
+	ld c, 100
+	and a
+	jr z, .shift_done
+.shift
+	rra
+	rr b
+	srl c
+	and a
+	jr nz, .shift
+.shift_done
+	ld a, c
+	ldh [hMultiplier], a
+	call Multiply
 	ld a, b
 	ld b, 4
 	ldh [hDivisor], a
 	call Divide
```

This changes both calculations to *HP* × (100 / *N*) / (*max HP* / *N*) for the smallest necessary *N*, which will be at least 1, so it avoids dividing by zero and is also more accurate.


### Moves that do damage and increase your stats do not increase stats after a KO

`BattleCommand_CheckFaint` "ends the move effect if the opponent faints", and these moves attempt to raise the user's stats *after* `checkfaint`. Note that fixing this can lead to stats being increased at the end of battle, but will not have any negative effects.

**Fix:** Edit [data/moves/effects.asm](https://github.com/pret/pokecrystal/blob/master/data/moves/effects.asm):

```diff
 DefenseUpHit:
 	...
 	criticaltext
 	supereffectivetext
-; BUG: Moves that do damage and increase your stats do not increase stats after a KO (see docs/bugs_and_glitches.md)
+	defenseup
+	statupmessage
 	checkfaint
 	buildopponentrage
-	defenseup
-	statupmessage
 	endmove

 AttackUpHit:
 	...
 	criticaltext
 	supereffectivetext
+	attackup
+	statupmessage
 	checkfaint
 	buildopponentrage
-	attackup
-	statupmessage
 	endmove

 AllUpHit:
 	...
 	criticaltext
 	supereffectivetext
+	allstatsup
 	checkfaint
 	buildopponentrage
-	allstatsup
 	endmove
```


### HP bar animation is slow for high HP

*Fixing this cosmetic bug will* **not** *break link battle compatibility.*

([Video](https://www.youtube.com/watch?v=SE-BfsFgZVM))

**Fix:** Edit `LongAnim_UpdateVariables` in [engine/battle/anim_hp_bar.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/anim_hp_bar.asm):

```diff
-; BUG: HP bar animation is slow for high HP (see docs/bugs_and_glitches.md)
 	call ComputeHPBarPixels
+	ld a, e
 	pop bc
 	pop de
 	pop hl
-	ld a, e
 	ld hl, wCurHPBarPixels
 	cp [hl]
 	jr z, .loop
 	ld [hl], a
 	and a
 	ret
```


### HP bar animation off-by-one error for low HP

*Fixing this cosmetic bug will* **not** *break link battle compatibility.*

([Video](https://www.youtube.com/watch?v=9KyNVIZxJvI))

**Fix:** Edit `ShortHPBar_CalcPixelFrame` in [engine/battle/anim_hp_bar.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/anim_hp_bar.asm):

```diff
 	ld b, 0
 .loop
-; BUG: HP bar animation off-by-one error for low HP (see docs/bugs_and_glitches.md)
 	ld a, l
 	sub HP_BAR_LENGTH_PX
 	ld l, a
 	ld a, h
 	sbc $0
 	ld h, a
+	jr z, .done
 	jr c, .done
 	inc b
 	jr .loop
```


## Single-player battle engine


### A Transformed Pokémon can use Sketch and learn otherwise unobtainable moves

([Video](https://www.youtube.com/watch?v=AFiBxAOkCGI))

**Fix:** Edit `BattleCommand_Sketch` in [engine/battle/move_effects/sketch.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/move_effects/sketch.asm):

```diff
-; If the opponent is transformed, fail.
-; BUG: A Transformed Pokémon can use Sketch and learn otherwise unobtainable moves (see docs/bugs_and_glitches.md)
+; If the user is transformed, fail.
-	ld a, BATTLE_VARS_SUBSTATUS5_OPP
+	ld a, BATTLE_VARS_SUBSTATUS5
 	call GetBattleVarAddr
 	bit SUBSTATUS_TRANSFORMED, [hl]
 	jp nz, .fail
```


### PRZ and BRN stat reductions don't apply to switched Pokémon

This does not affect link battles or Battle Tower battles because those jump from `LoadEnemyMon` to `InitEnemyMon`, which already calls `ApplyStatusEffectOnEnemyStats`.

**Fix:** Edit `LoadEnemyMon` in [engine/battle/core.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/core.asm):

```diff
 	ld hl, wEnemyMonStats
 	ld de, wEnemyStats
 	ld bc, NUM_EXP_STATS * 2
 	call CopyBytes

-; BUG: PRZ and BRN stat reductions don't apply to switched Pokémon (see docs/bugs_and_glitches.md)
+	call ApplyStatusEffectOnEnemyStats
 	ret
```


### Glacier Badge may not boost Special Defense depending on the value of Special Attack

Pryce's dialog ("That BADGE will raise the SPECIAL stats of POKéMON.") implies that Glacier Badge is intended to boost both Special Attack and Special Defense, but the Special Defense boost will not happen unless the unboosted Special Attack stat is 206–432, or 661 or above.

**Fix:** Edit `BadgeStatBoosts.CheckBadge` in [engine/battle/core.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/core.asm):

```diff
 .CheckBadge:
-; BUG: Glacier Badge may not boost Special Defense depending on the value of Special Attack (see docs/bugs_and_glitches.md)
 	ld a, b
 	srl b
+	push af
 	call c, BoostStat
+	pop af
 	inc hl
 	inc hl
 ; Check every other badge.
 	srl b
 	dec c
 	jr nz, .CheckBadge
 	srl a
 	call c, BoostStat
 	ret
```


### "Smart" AI encourages Mean Look if its own Pokémon is badly poisoned

([Video](https://www.youtube.com/watch?v=cygMO-zHTls))

**Fix:** Edit `AI_Smart_MeanLook` in [engine/battle/ai/scoring.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/ai/scoring.asm):

```diff
 ; 80% chance to greatly encourage this move if the enemy is badly poisoned.
-; BUG: "Smart" AI encourages Mean Look if its own Pokémon is badly poisoned (see docs/bugs_and_glitches.md)
-	ld a, [wEnemySubStatus5]
+	ld a, [wPlayerSubStatus5]
 	bit SUBSTATUS_TOXIC, a
 	jr nz, .asm_38e26
```


### "Smart" AI discourages Conversion2 after the first turn

**Fix:** Edit `AI_Smart_Conversion2` in [engine/battle/ai/scoring.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/ai/scoring.asm):

```diff
 AI_Smart_Conversion2:
-; BUG: "Smart" AI discourages Conversion2 after the first turn (see docs/bugs_and_glitches.md)
 	ld a, [wLastPlayerMove]
 	and a
-	jr nz, .discourage
+	jr z, .discourage
```


### "Smart" AI does not encourage Solar Beam, Flame Wheel, or Moonlight during Sunny Day

**Fix:** Edit `SunnyDayMoves` in [data/battle/ai/sunny_day_moves.asm](https://github.com/pret/pokecrystal/blob/master/data/battle/ai/sunny_day_moves.asm):

```diff
 SunnyDayMoves:
-; BUG: "Smart" AI does not encourage Solar Beam, Flame Wheel, or Moonlight during Sunny Day (see docs/bugs_and_glitches.md)
 	db FIRE_PUNCH
 	db EMBER
 	db FLAMETHROWER
+	db SOLARBEAM
 	db FIRE_SPIN
 	db FIRE_BLAST
+	db FLAME_WHEEL
 	db SACRED_FIRE
 	db MORNING_SUN
 	db SYNTHESIS
+	db MOONLIGHT
 	db -1 ; end
```


### AI does not discourage Future Sight when it's already been used

**Fix:** Edit `AI_Redundant` in [engine/battle/ai/redundant.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/ai/redundant.asm):

```diff
 .FutureSight:
-; BUG: AI does not discourage Future Sight when it's already been used (see docs/bugs_and_glitches.md)
-	ld a, [wEnemyScreens]
-	bit 5, a
+	ld a, [wEnemyFutureSightCount]
+	and a
 	ret
```


### AI makes a false assumption about `CheckTypeMatchup`

**Fix:** Edit `BattleCheckTypeMatchup` in [engine/battle/effect_commands.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/effect_commands.asm):

```diff
 BattleCheckTypeMatchup:
 	ld hl, wEnemyMonType1
 	ldh a, [hBattleTurn]
 	and a
-	jr z, CheckTypeMatchup
+	jr z, .get_type
 	ld hl, wBattleMonType1
+.get_type
+	ld a, BATTLE_VARS_MOVE_TYPE
+	call GetBattleVar ; preserves hl, de, and bc
 	; fallthrough
 CheckTypeMatchup:
-; BUG: AI makes a false assumption about CheckTypeMatchup (see docs/bugs_and_glitches.md)
 	push hl
 	push de
 	push bc
-	ld a, BATTLE_VARS_MOVE_TYPE
-	call GetBattleVar
 	ld d, a
 	...
```


### AI use of Full Heal or Full Restore does not cure Nightmare status

([Video](https://www.youtube.com/watch?v=rGqu3d3pdok&t=322))

**Fix:** Edit `AI_HealStatus` in [engine/battle/ai/items.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/ai/items.asm):

```diff
 AI_HealStatus:
-; BUG: AI use of Full Heal or Full Restore does not cure Nightmare status (see docs/bugs_and_glitches.md)
 	ld a, [wCurOTMon]
 	ld hl, wOTPartyMon1Status
 	ld bc, PARTYMON_STRUCT_LENGTH
 	call AddNTimes
 	xor a
 	ld [hl], a
 	ld [wEnemyMonStatus], a
+	ld hl, wEnemySubStatus1
+	res SUBSTATUS_NIGHTMARE, [hl]
 	ld hl, wEnemySubStatus5
 	res SUBSTATUS_TOXIC, [hl]
 	ret
```


### AI use of Full Heal does not cure confusion status

**Fix:** Edit `EnemyUsedFullRestore`, and `AI_HealStatus` in [engine/battle/ai/items.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/ai/items.asm):

```diff
 EnemyUsedFullRestore:
-; BUG: AI use of Full Heal does not cure confusion status (see docs/bugs_and_glitches.md)
 	call AI_HealStatus
 	ld a, FULL_RESTORE
 	ld [wCurEnemyItem], a
-	ld hl, wEnemySubStatus3
-	res SUBSTATUS_CONFUSED, [hl]
- 	xor a
- 	ld [wEnemyConfuseCount], a
 	; fallthrough
```

```diff
 AI_HealStatus:
 ; BUG: AI use of Full Heal or Full Restore does not cure Nightmare status (see docs/bugs_and_glitches.md)
 	ld a, [wCurOTMon]
 	ld hl, wOTPartyMon1Status
 	ld bc, PARTYMON_STRUCT_LENGTH
 	call AddNTimes
 	xor a
 	ld [hl], a
 	ld [wEnemyMonStatus], a
+	ld [wEnemyConfuseCount], a
+	ld hl, wEnemySubStatus3
+	res SUBSTATUS_CONFUSED, [hl]
 	ld hl, wEnemySubStatus5
 	res SUBSTATUS_TOXIC, [hl]
 	ret
```

### AI might use its base reward value as an item

In the `AI_TryItem` routine, an item pointer is set to `wEnemyTrainerItem1` and then increments to `wEnemyTrainerItem2` to see if either of the AI's items are in the `AI_Items` list. However, if the AI has used its first item (or its first one is `ITEM_NONE`) and hasn't used its second item, the item pointer can increment from `wEnemyTrainerItem2` to `wEnemyTrainerBaseReward`. If the value at this address then matches an item in the `AI_Items` list, the AI could mistakenly use it.

**Fix:** Edit `AI_TryItem` in [engine/battle/ai/items.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/ai/items.asm):

```diff
 AI_TryItem:
  	...
 	ld a, [wTrainerClass]
 	dec a
 	ld hl, TrainerClassAttributes + TRNATTR_AI_ITEM_SWITCH
 	ld bc, NUM_TRAINER_ATTRIBUTES
 	call AddNTimes
 	ld b, h
 	ld c, l
 	ld hl, AI_Items
-; BUG: AI might use its base reward value as an item (see docs/bugs_and_glitches.md)
-	ld de, wEnemyTrainerItem1
 .loop
+	ld de, wEnemyTrainerItem1
 	ld a, [hl]
 	and a
 	inc a
 	ret z
```


### Wild Pokémon can always Teleport regardless of level difference

**Fix:** Edit `BattleCommand_Teleport` in [engine/battle/move_effects/teleport.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/move_effects/teleport.asm):

```diff
 .loop_enemy
-; BUG: Wild Pokémon can always Teleport regardless of level difference (see docs/bugs_and_glitches.md)
+; If a random number >= player level / 4, Teleport will succeed
 	call BattleRandom
 	cp c
 	jr nc, .loop_enemy
 	; b = player level / 4
 	srl b
 	srl b
 	cp b
-	jr nc, .run_away
+	jr c, .failed
```


### `RIVAL2` has lower DVs than `RIVAL1`

`RIVAL1` is battled throughout the game. `RIVAL2` is battled at Indigo Plateau, and would not be expected to have worse DVs.

**Fix:** Edit `TrainerClassDVs` in [data/trainers/dvs.asm](https://github.com/pret/pokecrystal/blob/master/data/trainers/dvs.asm):

```diff
 	dn 13, 13, 13, 13 ; RIVAL1
 	...
-; BUG: RIVAL2 has lower DVs than RIVAL1 (see docs/bugs_and_glitches.md)
-	dn  9,  8,  8,  8 ; RIVAL2
+	dn 13, 13, 13, 13 ; RIVAL2
```


### Credits sequence changes move selection menu behavior

([Video](https://www.youtube.com/watch?v=vjFUo6Jr4po&t=438))

To select a move in battle, you have to press and release the Up or Down buttons. However, after playing the credits sequence, holding down either button will continuously scroll through the moves.

**Fix:** Edit `Credits` in [engine/movie/credits.asm](https://github.com/pret/pokecrystal/blob/master/engine/movie/credits.asm):

```diff
-; BUG: Credits sequence changes move selection menu behavior (see docs/bugs_and_glitches.md)
 	ldh a, [hVBlank]
 	push af
 	ld a, $5
 	ldh [hVBlank], a
+	ldh a, [hInMenu]
+	push af
 	ld a, TRUE
 	ldh [hInMenu], a

 	...

 	ldh [hLCDCPointer], a
 	ldh [hBGMapAddress], a
+	pop af
+	ldh [hInMenu], a
 	pop af
 	ldh [hVBlank], a
 	pop af
 	ldh [rSVBK], a
```

The `[hInMenu]` value determines this button behavior. However, the battle moves menu doesn't actually set `[hInMenu]` to anything, so either behavior *may* have been intentional. The default 0 prevents continuous scrolling; a value of 1 allows it. (The Japanese release sets it to 0.)

**Optional fix:** To explicitly set a `[hInMenu]` for the moves menu, edit `BattleTurn` in [engine/battle/core.asm](https://github.com/pret/pokecrystal/blob/master/engine/battle/core.asm):

```diff
 BattleTurn:
+	ldh a, [hInMenu]
+	push af
+	ld a, 1 ; or "xor a" for the value 0
+	ldh [hInMenu], a
+
 .loop

 	...

 	jp .loop

 .quit
+	pop af
+	ldh [hInMenu], a
 	ret
```
