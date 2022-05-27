-- Comments above items refer to the symbol in the pret/poke* repos symbols file
GameSettings = {
	game = 0,
	gamename = "",
	pstats = 0,
	estats = 0,
	version = 0,
	-- Used in identifying the move levels for the Pokémon in the game
	versiongroup = 0,

	-- BattleSetup_StartWildBattle
	StartWildBattle = 0,
	-- sText_Trainer1SentOutPkmn
	TrainerSentOutPkmn = 0,
	-- BeginBattleIntro
	BeginBattleIntro = 0,
	-- ReturnFromBattleToOverworld
	ReturnFromBattleToOverworld = 0,
	-- sBattlerAbilities
	sBattlerAbilities = 0,
	-- ChooseMoveUsedParticle
	ChooseMoveUsedParticle = 0,
	-- gChosenMove
	gChosenMove = 0,
	-- gBattlerAttacker
	gBattlerAttacker = 0,
	-- TODO: These two items appear to be unused. If true, let's remove them.
	--lastusedabilityaddress = 0,
	--attackeraddress = 0,
	-- gBattlerPartyIndexes: each slot below is 2 bytes of the 8 byte total
	gBattlerPartyIndexesSelfSlotOne = 0,
	gBattlerPartyIndexesEnemySlotOne = 0,
	gBattlerPartyIndexesSelfSlotTwo = 0,
	gBattlerPartyIndexesEnemySlotTwo = 0,
	-- gBattleMons
	gBattleMons = 0,

	-- ShowPokemonSummaryScreen
	ShowPokemonSummaryScreen = 0,
	-- CalculateMonStats
	CalculateMonStats = 0,
	-- DisplayMonLearnedMove
	DisplayMonLearnedMove = 0,
	-- SwitchSelectedMons
	SwitchSelectedMons = 0,
	-- UpdatePoisonStepCounter
	UpdatePoisonStepCounter = 0,
	-- gText_WeHopeToSeeYouAgain
	WeHopeToSeeYouAgain = 0,
	-- DoPokeballSendOutAnimation
	DoPokeballSendOutAnimation = 0,

	-- BattleScript_DrizzleActivates
	BattleScriptDrizzleActivates = 0,
	-- BattleScript_SpeedBoostActivates
	BattleScriptSpeedBoostActivates = 0,
	-- BattleScript_TraceActivates
	BattleScriptTraceActivates = 0,
	-- BattleScript_RainDishActivates
	BattleScriptRainDishActivates = 0,
	-- BattleScript_SandstreamActivates
	BattleScriptSandstreamActivates = 0,
	-- BattleScript_ShedSkinActivates
	BattleScriptShedSkinActivates = 0,
	-- BattleScript_IntimidateActivates
	BattleScriptIntimidateActivates = 0,
	-- BattleScript_DroughtActivates
	BattleScriptDroughtActivates = 0,
	-- BattleScript_StickyHoldActivates
	BattleScriptStickyHoldActivates = 0,
	-- BattleScript_ColorChangeActivates
	BattleScriptColorChangeActivates = 0,
	-- BattleScript_RoughSkinActivates
	BattleScriptRoughSkinActivates = 0,
	-- BattleScript_CuteCharmActivates
	BattleScriptCuteCharmActivates = 0,
	-- BattleScript_SynchronizeActivates
	BattleScriptSynchronizeActivates = 0,

	-- gSaveblock1
	gSaveBlock1 = 0,
	-- gSaveBlock2Ptr
	gSaveBlock2ptr = 0,
	bagEncryptionKeyOffset = 0,
	bagPocket_Items = 0,
	bagPocket_Berries = 0,
	bagPocket_Items_Size = 0,
	bagPocket_Berries_Size = 0,
}
GameSettings.VERSIONS = {
	RS = 1,
	E = 2,
	FRLG = 3
}

function GameSettings.initialize()
	local gamecode = memory.read_u32_be(0x0000AC, "ROM")
	local gameversion = memory.read_u32_be(0x0000BC, "ROM")
	print("gamecode: " .. gamecode .. "; gameversion: " .. gameversion)
	local pstats = { 0x3004360, 0x20244EC, 0x2024284, 0x3004290, 0x2024190, 0x20241E4 } -- Player stats
	local estats = { 0x30045C0, 0x2024744, 0x202402C, 0x30044F0, 0x20243E8, 0x2023F8C } -- Enemy stats

	if gamecode == 0x42504545 then
		print("Emerald ROM Detected")
		GameSettings.game = GameSettings.VERSIONS.E
		GameSettings.gamename = "Pokemon Emerald (U)"
		GameSettings.version = GameSettings.VERSIONS.E
		GameSettings.versiongroup = 1

		-- Symbols file found at https://raw.githubusercontent.com/pret/pokeemerald/symbols/pokeemerald.sym
		GameSettings.StartWildBattle = 0x080b0698
		GameSettings.TrainerSentOutPkmn = 0x085cbbe7
		GameSettings.BeginBattleIntro = 0x08039ECC
		GameSettings.ReturnFromBattleToOverworld = 0x0803DF70
		GameSettings.sBattlerAbilities = 0x0203aba4
		GameSettings.ChooseMoveUsedParticle = 0x0814f8f8
		GameSettings.gChosenMove = 0x020241EC
		GameSettings.gBattlerAttacker = 0x0202420B
		GameSettings.gBattlerPartyIndexesSelfSlotOne = 0x0202406E
		GameSettings.gBattlerPartyIndexesEnemySlotOne = 0x02024070
		GameSettings.gBattlerPartyIndexesSelfSlotTwo = 0x02024072
		GameSettings.gBattlerPartyIndexesEnemySlotTwo = 0x02024074
		GameSettings.gBattleMons = 0x02024084

		GameSettings.ShowPokemonSummaryScreen = 0x081bf8ec
		GameSettings.CalculateMonStats = 0x08068d0c
		GameSettings.DisplayMonLearnedMove = 0x081b7910
		GameSettings.SwitchSelectedMons = 0x081b3938
		GameSettings.UpdatePoisonStepCounter = 0x0809cb94
		GameSettings.WeHopeToSeeYouAgain = 0x082727db
		GameSettings.DoPokeballSendOutAnimation = 0x080753e8

		GameSettings.BattleScriptDrizzleActivates = 0x082db430
		GameSettings.BattleScriptSpeedBoostActivates = 0x082db444
		GameSettings.BattleScriptTraceActivates = 0x082db452
		GameSettings.BattleScriptRainDishActivates = 0x082db45c
		GameSettings.BattleScriptSandstreamActivates = 0x082db470
		GameSettings.BattleScriptShedSkinActivates = 0x082db484
		GameSettings.BattleScriptIntimidateActivates = 0x082db4c1
		GameSettings.BattleScriptDroughtActivates = 0x082db52a
		GameSettings.BattleScriptStickyHoldActivates = 0x082db63f
		GameSettings.BattleScriptColorChangeActivates = 0x082db64d
		GameSettings.BattleScriptRoughSkinActivates = 0x082db654
		GameSettings.BattleScriptCuteCharmActivates = 0x082db66f
		GameSettings.BattleScriptSynchronizeActivates = 0x082db67f

		GameSettings.gSaveBlock1 = 0x02025a00
		GameSettings.gSaveBlock2ptr = 0x03005d90
		GameSettings.bagEncryptionKeyOffset = 0xAC
		GameSettings.bagPocket_Items = GameSettings.gSaveBlock1 + 0x560
		GameSettings.bagPocket_Berries = GameSettings.gSaveBlock1 + 0x790
		GameSettings.bagPocket_Items_Size = 30
		GameSettings.bagPocket_Berries_Size = 46

	elseif gamecode == 0x42505245 and gameversion == 0x01670000 then
		print("Firered v1.1 ROM Detected")
		GameSettings.game = GameSettings.VERSIONS.FRLG
		GameSettings.gamename = "Pokemon FireRed (U)"
		GameSettings.version = GameSettings.VERSIONS.FRLG
		GameSettings.versiongroup = 2

		-- Symbols file found at https://raw.githubusercontent.com/pret/pokefirered/symbols/pokefirered_rev1.sym
		GameSettings.StartWildBattle = 0x0807f718
		GameSettings.TrainerSentOutPkmn = 0x083fd421
		GameSettings.BeginBattleIntro = 0x080123d4
		GameSettings.ReturnFromBattleToOverworld = 0x08015b6c
		GameSettings.sBattlerAbilities = 0x02039a30
		GameSettings.ChooseMoveUsedParticle = 0x080d86dc
		GameSettings.gChosenMove = 0x02023d4c
		GameSettings.gBattlerAttacker = 0x02023d6b
		GameSettings.gBattlerPartyIndexesSelfSlotOne = 0x02023bce
		GameSettings.gBattlerPartyIndexesEnemySlotOne = 0x02023bd0
		GameSettings.gBattlerPartyIndexesSelfSlotTwo = 0x02023bcd2
		GameSettings.gBattlerPartyIndexesEnemySlotTwo = 0x02023bd4
		GameSettings.gBattleMons = 0x02023be4

		GameSettings.ShowPokemonSummaryScreen = 0x08134570
		GameSettings.CalculateMonStats = 0x0803e490
		GameSettings.DisplayMonLearnedMove = 0x0812687c
		GameSettings.SwitchSelectedMons = 0x08122ed4
		GameSettings.UpdatePoisonStepCounter = 0x0806d7b0
		GameSettings.WeHopeToSeeYouAgain = 0x081a5589
		GameSettings.DoPokeballSendOutAnimation = 0x0804a94c

		GameSettings.BattleScriptDrizzleActivates = 0x081d92ef
		GameSettings.BattleScriptSpeedBoostActivates = 0x081d9303
		GameSettings.BattleScriptTraceActivates = 0x081d9311
		GameSettings.BattleScriptRainDishActivates = 0x081d931b
		GameSettings.BattleScriptSandstreamActivates = 0x081d932f
		GameSettings.BattleScriptShedSkinActivates = 0x081d9343
		GameSettings.BattleScriptIntimidateActivates = 0x081d9380
		GameSettings.BattleScriptDroughtActivates = 0x081d93e9
		GameSettings.BattleScriptStickyHoldActivates = 0x081d94fe
		GameSettings.BattleScriptColorChangeActivates = 0x081d950c
		GameSettings.BattleScriptRoughSkinActivates = 0x081d9513
		GameSettings.BattleScriptCuteCharmActivates = 0x081d952e
		GameSettings.BattleScriptSynchronizeActivates = 0x081d953e

		GameSettings.gSaveBlock1 = 0x0202552c
		GameSettings.gSaveBlock2ptr = 0x0300500c
		GameSettings.bagEncryptionKeyOffset = 0xF20
		GameSettings.bagPocket_Items = GameSettings.gSaveBlock1 + 0x310
		GameSettings.bagPocket_Berries = GameSettings.gSaveBlock1 + 0x54c
		GameSettings.bagPocket_Items_Size = 42
		GameSettings.bagPocket_Berries_Size = 43

	elseif gamecode == 0x42505245 and gameversion == 0x00680000 then
		print("Firered v1.0 ROM Detected")
		GameSettings.game = GameSettings.VERSIONS.FRLG
		GameSettings.gamename = "Pokemon FireRed (U)"
		GameSettings.version = GameSettings.VERSIONS.FRLG
		GameSettings.versiongroup = 2

		-- Symbols file found at https://raw.githubusercontent.com/pret/pokefirered/symbols/pokefirered.sym
		GameSettings.StartWildBattle = 0x0807f704
		GameSettings.TrainerSentOutPkmn = 0x083fd3b1
		GameSettings.BeginBattleIntro = 0x080123c0
		GameSettings.ReturnFromBattleToOverworld = 0x08015b58
		GameSettings.sBattlerAbilities = 0x02039a30
		GameSettings.ChooseMoveUsedParticle = 0x080d86c8
		GameSettings.gChosenMove = 0x02023d4c
		GameSettings.gBattlerAttacker = 0x02023d6b
		GameSettings.gBattlerPartyIndexesSelfSlotOne = 0x02023bce
		GameSettings.gBattlerPartyIndexesEnemySlotOne = 0x02023bd0
		GameSettings.gBattlerPartyIndexesSelfSlotTwo = 0x02023bcd2
		GameSettings.gBattlerPartyIndexesEnemySlotTwo = 0x02023bd4
		GameSettings.ShowPokemonSummaryScreen = 0x081344f8
		GameSettings.gBattleMons = 0x02023be4

		GameSettings.CalculateMonStats = 0x0803e47c
		GameSettings.DisplayMonLearnedMove = 0x08126804
		GameSettings.SwitchSelectedMons = 0x08122e5c
		GameSettings.UpdatePoisonStepCounter = 0x0806d79c
		GameSettings.WeHopeToSeeYouAgain = 0x081a5511
		GameSettings.DoPokeballSendOutAnimation = 0x0804a938

		GameSettings.BattleScriptDrizzleActivates = 0x081d927f
		GameSettings.BattleScriptSpeedBoostActivates = 0x081d9293
		GameSettings.BattleScriptTraceActivates = 0x081d92a1
		GameSettings.BattleScriptRainDishActivates = 0x081d92ab
		GameSettings.BattleScriptSandstreamActivates = 0x081d92bf
		GameSettings.BattleScriptShedSkinActivates = 0x081d92d3
		GameSettings.BattleScriptIntimidateActivates = 0x081d9310
		GameSettings.BattleScriptDroughtActivates = 0x081d9379
		GameSettings.BattleScriptStickyHoldActivates = 0x081d948e
		GameSettings.BattleScriptColorChangeActivates = 0x081d949c
		GameSettings.BattleScriptRoughSkinActivates = 0x081d94a3
		GameSettings.BattleScriptCuteCharmActivates = 0x081d94be
		GameSettings.BattleScriptSynchronizeActivates = 0x081d94ce

		GameSettings.gSaveBlock1 = 0x0202552c
		GameSettings.gSaveBlock2ptr = 0x0300500c
		GameSettings.bagEncryptionKeyOffset = 0xF20
		GameSettings.bagPocket_Items = GameSettings.gSaveBlock1 + 0x310
		GameSettings.bagPocket_Berries = GameSettings.gSaveBlock1 + 0x54c
		GameSettings.bagPocket_Items_Size = 42
		GameSettings.bagPocket_Berries_Size = 43

	elseif gamecode == 0x42504745 and gameversion == 0x01800000 then
		print("Leaf Green v1.1 ROM Detected")
		GameSettings.game = GameSettings.VERSIONS.FRLG
		GameSettings.gamename = "Pokemon LeafGreen (U)"
		GameSettings.version = GameSettings.VERSIONS.FRLG
		GameSettings.versiongroup = 2

		-- Symbols file found at https://raw.githubusercontent.com/pret/pokefirered/symbols/pokeleafgreen_rev1.sym
		GameSettings.StartWildBattle = 0x0807f6ec
		GameSettings.TrainerSentOutPkmn = 0x083fd25d
		GameSettings.BeginBattleIntro = 0x080123d4
		GameSettings.ReturnFromBattleToOverworld = 0x08015b6c
		GameSettings.sBattlerAbilities = 0x02039a30
		GameSettings.ChooseMoveUsedParticle = 0x080d86b0
		GameSettings.gChosenMove = 0x02023d4c
		GameSettings.gBattlerAttacker = 0x02023d6b
		GameSettings.gBattlerPartyIndexesSelfSlotOne = 0x02023bce
		GameSettings.gBattlerPartyIndexesEnemySlotOne = 0x02023bd0
		GameSettings.gBattlerPartyIndexesSelfSlotTwo = 0x02023bcd2
		GameSettings.gBattlerPartyIndexesEnemySlotTwo = 0x02023bd4
		GameSettings.gBattleMons = 0x02023be4

		GameSettings.ShowPokemonSummaryScreen = 0x08134548
		GameSettings.CalculateMonStats = 0x0803e490
		GameSettings.DisplayMonLearnedMove = 0x08126854
		GameSettings.SwitchSelectedMons = 0x08122eac
		GameSettings.UpdatePoisonStepCounter = 0x0806d7b0
		GameSettings.WeHopeToSeeYouAgain = 0x081a5565
		GameSettings.DoPokeballSendOutAnimation = 0x0804a94c

		GameSettings.BattleScriptDrizzleActivates = 0x081d92cb
		GameSettings.BattleScriptSpeedBoostActivates = 0x081d92df
		GameSettings.BattleScriptTraceActivates = 0x081d92ed
		GameSettings.BattleScriptRainDishActivates = 0x081d92f7
		GameSettings.BattleScriptSandstreamActivates = 0x081d930b
		GameSettings.BattleScriptShedSkinActivates = 0x081d931f
		GameSettings.BattleScriptIntimidateActivates = 0x081d935c
		GameSettings.BattleScriptDroughtActivates = 0x081d93c5
		GameSettings.BattleScriptStickyHoldActivates = 0x081d94da
		GameSettings.BattleScriptColorChangeActivates = 0x081d94e8
		GameSettings.BattleScriptRoughSkinActivates = 0x081d94ef
		GameSettings.BattleScriptCuteCharmActivates = 0x081d950a
		GameSettings.BattleScriptSynchronizeActivates = 0x081d951a

		GameSettings.gSaveBlock1 = 0x0202552c
		GameSettings.gSaveBlock2ptr = 0x0300500c
		GameSettings.bagEncryptionKeyOffset = 0xF20
		GameSettings.bagPocket_Items = GameSettings.gSaveBlock1 + 0x310
		GameSettings.bagPocket_Berries = GameSettings.gSaveBlock1 + 0x54c
		GameSettings.bagPocket_Items_Size = 42
		GameSettings.bagPocket_Berries_Size = 43

	elseif gamecode == 0x42504745 and gameversion == 0x00810000 then
		print("Leaf Green v1.0 ROM Detected")
		GameSettings.game = GameSettings.VERSIONS.FRLG
		GameSettings.gamename = "Pokemon LeafGreen (U)"
		GameSettings.version = GameSettings.VERSIONS.FRLG
		GameSettings.versiongroup = 2

		-- Symbols file found at https://raw.githubusercontent.com/pret/pokefirered/symbols/pokeleafgreen.sym
		GameSettings.StartWildBattle = 0x0807f6d8
		GameSettings.TrainerSentOutPkmn = 0x083fd1ed
		GameSettings.BeginBattleIntro = 0x080123c0
		GameSettings.ReturnFromBattleToOverworld = 0x08015b58
		GameSettings.sBattlerAbilities = 0x02039a30
		GameSettings.ChooseMoveUsedParticle = 0x080d869c
		GameSettings.gChosenMove = 0x02023d4c
		GameSettings.gBattlerAttacker = 0x02023d6b
		GameSettings.gBattlerPartyIndexesSelfSlotOne = 0x02023bce
		GameSettings.gBattlerPartyIndexesEnemySlotOne = 0x02023bd0
		GameSettings.gBattlerPartyIndexesSelfSlotTwo = 0x02023bcd2
		GameSettings.gBattlerPartyIndexesEnemySlotTwo = 0x02023bd4
		GameSettings.gBattleMons = 0x02023be4

		GameSettings.ShowPokemonSummaryScreen = 0x081344d0
		GameSettings.CalculateMonStats = 0x0803e47c
		GameSettings.DisplayMonLearnedMove = 0x081267dc
		GameSettings.SwitchSelectedMons = 0x08122e34
		GameSettings.UpdatePoisonStepCounter = 0x0806d79c
		GameSettings.WeHopeToSeeYouAgain = 0x081a54ed
		GameSettings.DoPokeballSendOutAnimation = 0x0804a938

		GameSettings.BattleScriptDrizzleActivates = 0x081d925b
		GameSettings.BattleScriptSpeedBoostActivates = 0x081d926f
		GameSettings.BattleScriptTraceActivates = 0x081d927d
		GameSettings.BattleScriptRainDishActivates = 0x081d9287
		GameSettings.BattleScriptSandstreamActivates = 0x081d929b
		GameSettings.BattleScriptShedSkinActivates = 0x081d92af
		GameSettings.BattleScriptIntimidateActivates = 0x081d92ec
		GameSettings.BattleScriptDroughtActivates = 0x081d9355
		GameSettings.BattleScriptStickyHoldActivates = 0x081d946a
		GameSettings.BattleScriptColorChangeActivates = 0x081d9478
		GameSettings.BattleScriptRoughSkinActivates = 0x081d947f
		GameSettings.BattleScriptCuteCharmActivates = 0x081d949a
		GameSettings.BattleScriptSynchronizeActivates = 0x081d94aa

		GameSettings.gSaveBlock1 = 0x0202552c
		GameSettings.gSaveBlock2ptr = 0x0300500c
		GameSettings.bagEncryptionKeyOffset = 0xF20
		GameSettings.bagPocket_Items = GameSettings.gSaveBlock1 + 0x310
		GameSettings.bagPocket_Berries = GameSettings.gSaveBlock1 + 0x54c
		GameSettings.bagPocket_Items_Size = 42
		GameSettings.bagPocket_Berries_Size = 43

	elseif gamecode == 0x41585645 and gameversion == 0x01400000 then
		print("Ruby v1.1 ROM Detected")
		GameSettings.game = GameSettings.VERSIONS.RS
		GameSettings.gamename = "Pokemon Ruby (U)"
		GameSettings.version = GameSettings.VERSIONS.RS
		GameSettings.versiongroup = 1

		-- Symbols file found at https://raw.githubusercontent.com/pret/pokeruby/symbols/pokeruby_rev1.sym
		GameSettings.StartWildBattle = 0x08081a20
		GameSettings.TrainerSentOutPkmn = 0x083fd1ed -- Finding some different names for symbols here... BattleText_SentOutSingle1?
		GameSettings.BeginBattleIntro = 0x080123c0 -- StartBattleIntroAnim?
		GameSettings.ReturnFromBattleToOverworld = 0x08015b58
		GameSettings.sBattlerAbilities = 0x02039a30 -- ???
		GameSettings.ChooseMoveUsedParticle = 0x080d869c
		GameSettings.gChosenMove = 0x02023d4c
		GameSettings.gBattlerAttacker = 0x02023d6b
		GameSettings.gBattlerPartyIndexesSelfSlotOne = 0x02023bce
		GameSettings.gBattlerPartyIndexesEnemySlotOne = 0x02023bd0
		GameSettings.gBattlerPartyIndexesSelfSlotTwo = 0x02023bcd2
		GameSettings.gBattlerPartyIndexesEnemySlotTwo = 0x02023bd4
		GameSettings.gBattleMons = 0x02023be4

		GameSettings.ShowPokemonSummaryScreen = 0x081344d0
		GameSettings.CalculateMonStats = 0x0803e47c
		GameSettings.DisplayMonLearnedMove = 0x081267dc -- BattleText_LearnedMove?
		GameSettings.SwitchSelectedMons = 0x08122e34 -- ???
		GameSettings.UpdatePoisonStepCounter = 0x0806d79c
		GameSettings.WeHopeToSeeYouAgain = 0x081a54ed -- gText_NurseJoy_WeHopeToSeeYouAgain
		GameSettings.DoPokeballSendOutAnimation = 0x0804a938 -- StartSendOutMonAnimation? or maybe SendOutMonAnimation?

		GameSettings.BattleScriptDrizzleActivates = 0x081d925b
		GameSettings.BattleScriptSpeedBoostActivates = 0x081d926f
		GameSettings.BattleScriptTraceActivates = 0x081d927d
		GameSettings.BattleScriptRainDishActivates = 0x081d9287
		GameSettings.BattleScriptSandstreamActivates = 0x081d929b
		GameSettings.BattleScriptShedSkinActivates = 0x081d92af
		GameSettings.BattleScriptIntimidateActivates = 0x081d92ec -- ??? Not there with other battle scripts... maybe BattleScript_AbilityNoSpecificStatLoss? That doesn't make sense to me though...
		GameSettings.BattleScriptDroughtActivates = 0x081d9355
		GameSettings.BattleScriptStickyHoldActivates = 0x081d946a -- BattleScript_NoItemSteal?
		GameSettings.BattleScriptColorChangeActivates = 0x081d9478
		GameSettings.BattleScriptRoughSkinActivates = 0x081d947f
		GameSettings.BattleScriptCuteCharmActivates = 0x081d949a
		GameSettings.BattleScriptSynchronizeActivates = 0x081d94aa

		GameSettings.gSaveBlock1 = 0x0202552c
		GameSettings.gSaveBlock2ptr = 0x0300500c -- Probably gUnknown_03004828 since it is 8 bytes after gFlashMemoryPresent, like in Emerald?
		GameSettings.bagEncryptionKeyOffset = 0xF20
		GameSettings.bagPocket_Items = GameSettings.gSaveBlock1 + 0x310
		GameSettings.bagPocket_Berries = GameSettings.gSaveBlock1 + 0x54c
		GameSettings.bagPocket_Items_Size = 30
		GameSettings.bagPocket_Berries_Size = 46

		-- elseif gamecode == 0x41585645 and gameversion == 0x00410000 then
		-- 	print("Ruby v1.0 ROM Detected")
		-- 	GameSettings.game = GameSettings.VERSIONS.RS
		-- 	GameSettings.gamename = "Pokemon Ruby (U)"
		-- 	GameSettings.version = GameSettings.VERSIONS.RS
		-- 	GameSettings.versiongroup = 1

		-- 	-- Symbols file found at https://raw.githubusercontent.com/pret/pokeruby/symbols/pokeruby.sym
		-- 	GameSettings.StartWildBattle = 0x08081a00
		-- 	GameSettings.TrainerSentOutPkmn = 0x083fd1ed -- Finding some different names for symbols here... BattleText_SentOutSingle1?
		-- 	GameSettings.BeginBattleIntro = 0x080123c0 -- StartBattleIntroAnim?
		-- 	GameSettings.ReturnFromBattleToOverworld = 0x08015b58
		-- 	GameSettings.sBattlerAbilities = 0x02039a30 -- ???
		-- 	GameSettings.ChooseMoveUsedParticle = 0x080d869c
		-- 	GameSettings.gChosenMove = 0x02023d4c
		-- 	GameSettings.gBattlerAttacker = 0x02023d6b
		-- 	GameSettings.gBattlerPartyIndexesSelfSlotOne = 0x02023bce
		-- 	GameSettings.gBattlerPartyIndexesEnemySlotOne = 0x02023bd0
		-- 	GameSettings.gBattlerPartyIndexesSelfSlotTwo = 0x02023bcd2
		-- 	GameSettings.gBattlerPartyIndexesEnemySlotTwo = 0x02023bd4
		-- 	GameSettings.gBattleMons = 0x02023be4

		-- 	GameSettings.ShowPokemonSummaryScreen = 0x081344d0
		-- 	GameSettings.CalculateMonStats = 0x0803e47c
		-- 	GameSettings.DisplayMonLearnedMove = 0x081267dc -- BattleText_LearnedMove?
		-- 	GameSettings.SwitchSelectedMons = 0x08122e34 -- ???
		-- 	GameSettings.UpdatePoisonStepCounter = 0x0806d79c
		-- 	GameSettings.WeHopeToSeeYouAgain = 0x081a54ed -- gText_NurseJoy_WeHopeToSeeYouAgain
		-- 	GameSettings.DoPokeballSendOutAnimation = 0x0804a938 -- StartSendOutMonAnimation? or maybe SendOutMonAnimation?

		-- 	GameSettings.BattleScriptDrizzleActivates = 0x081d925b
		-- 	GameSettings.BattleScriptSpeedBoostActivates = 0x081d926f
		-- 	GameSettings.BattleScriptTraceActivates = 0x081d927d
		-- 	GameSettings.BattleScriptRainDishActivates = 0x081d9287
		-- 	GameSettings.BattleScriptSandstreamActivates = 0x081d929b
		-- 	GameSettings.BattleScriptShedSkinActivates = 0x081d92af
		-- 	GameSettings.BattleScriptIntimidateActivates = 0x081d92ec -- ??? Not there with other battle scripts... maybe BattleScript_AbilityNoSpecificStatLoss? That doesn't make sense to me though...
		-- 	GameSettings.BattleScriptDroughtActivates = 0x081d9355
		-- 	GameSettings.BattleScriptStickyHoldActivates = 0x081d946a -- BattleScript_NoItemSteal?
		-- 	GameSettings.BattleScriptColorChangeActivates = 0x081d9478
		-- 	GameSettings.BattleScriptRoughSkinActivates = 0x081d947f
		-- 	GameSettings.BattleScriptCuteCharmActivates = 0x081d949a
		-- 	GameSettings.BattleScriptSynchronizeActivates = 0x081d94aa

		-- 	GameSettings.gSaveBlock1 = 0x0202552c
		-- 	GameSettings.gSaveBlock2ptr = 0x0300500c -- Probably gUnknown_03004828 since it is 8 bytes after gFlashMemoryPresent, like in Emerald?
		-- 	GameSettings.bagEncryptionKeyOffset = 0xF20
		-- 	GameSettings.bagPocket_Items = GameSettings.gSaveBlock1 + 0x310
		-- 	GameSettings.bagPocket_Berries = GameSettings.gSaveBlock1 + 0x54c
		-- 	GameSettings.bagPocket_Items_Size = 30
		-- 	GameSettings.bagPocket_Berries_Size = 46

		-- elseif gamecode == 0x41585045 and gameversion == 0x01540000 then
		-- 	print("Sapphire v1.1 ROM Detected")
		-- 	GameSettings.game = GameSettings.VERSIONS.RS
		-- 	GameSettings.gamename = "Pokemon Sapphire (U)"
		-- 	GameSettings.version = GameSettings.VERSIONS.RS
		-- 	GameSettings.versiongroup = 1

		-- 	-- Symbols file found at https://raw.githubusercontent.com/pret/pokeruby/symbols/pokeruby.sym
		-- 	GameSettings.StartWildBattle = 0x08081a00
		-- 	GameSettings.TrainerSentOutPkmn = 0x083fd1ed -- Finding some different names for symbols here... BattleText_SentOutSingle1?
		-- 	GameSettings.BeginBattleIntro = 0x080123c0 -- StartBattleIntroAnim?
		-- 	GameSettings.ReturnFromBattleToOverworld = 0x08015b58
		-- 	GameSettings.sBattlerAbilities = 0x02039a30 -- ???
		-- 	GameSettings.ChooseMoveUsedParticle = 0x080d869c
		-- 	GameSettings.gChosenMove = 0x02023d4c
		-- 	GameSettings.gBattlerAttacker = 0x02023d6b
		-- 	GameSettings.gBattlerPartyIndexesSelfSlotOne = 0x02023bce
		-- 	GameSettings.gBattlerPartyIndexesEnemySlotOne = 0x02023bd0
		-- 	GameSettings.gBattlerPartyIndexesSelfSlotTwo = 0x02023bcd2
		-- 	GameSettings.gBattlerPartyIndexesEnemySlotTwo = 0x02023bd4
		-- 	GameSettings.gBattleMons = 0x02023be4

		-- 	GameSettings.ShowPokemonSummaryScreen = 0x081344d0
		-- 	GameSettings.CalculateMonStats = 0x0803e47c
		-- 	GameSettings.DisplayMonLearnedMove = 0x081267dc -- BattleText_LearnedMove?
		-- 	GameSettings.SwitchSelectedMons = 0x08122e34 -- ???
		-- 	GameSettings.UpdatePoisonStepCounter = 0x0806d79c
		-- 	GameSettings.WeHopeToSeeYouAgain = 0x081a54ed -- gText_NurseJoy_WeHopeToSeeYouAgain
		-- 	GameSettings.DoPokeballSendOutAnimation = 0x0804a938 -- StartSendOutMonAnimation? or maybe SendOutMonAnimation?

		-- 	GameSettings.BattleScriptDrizzleActivates = 0x081d925b
		-- 	GameSettings.BattleScriptSpeedBoostActivates = 0x081d926f
		-- 	GameSettings.BattleScriptTraceActivates = 0x081d927d
		-- 	GameSettings.BattleScriptRainDishActivates = 0x081d9287
		-- 	GameSettings.BattleScriptSandstreamActivates = 0x081d929b
		-- 	GameSettings.BattleScriptShedSkinActivates = 0x081d92af
		-- 	GameSettings.BattleScriptIntimidateActivates = 0x081d92ec -- ??? Not there with other battle scripts... maybe BattleScript_AbilityNoSpecificStatLoss? That doesn't make sense to me though...
		-- 	GameSettings.BattleScriptDroughtActivates = 0x081d9355
		-- 	GameSettings.BattleScriptStickyHoldActivates = 0x081d946a -- BattleScript_NoItemSteal?
		-- 	GameSettings.BattleScriptColorChangeActivates = 0x081d9478
		-- 	GameSettings.BattleScriptRoughSkinActivates = 0x081d947f
		-- 	GameSettings.BattleScriptCuteCharmActivates = 0x081d949a
		-- 	GameSettings.BattleScriptSynchronizeActivates = 0x081d94aa

		-- 	GameSettings.gSaveBlock1 = 0x0202552c
		-- 	GameSettings.gSaveBlock2ptr = 0x0300500c -- Probably gUnknown_03004828 since it is 8 bytes after gFlashMemoryPresent, like in Emerald?
		-- 	GameSettings.bagEncryptionKeyOffset = 0xF20
		-- 	GameSettings.bagPocket_Items = GameSettings.gSaveBlock1 + 0x310
		-- 	GameSettings.bagPocket_Berries = GameSettings.gSaveBlock1 + 0x54c
		-- 	GameSettings.bagPocket_Items_Size = 30
		-- 	GameSettings.bagPocket_Berries_Size = 46

		-- elseif gamecode == 0x41585045 and gameversion == 0x00550000 then
		-- 	print("Sapphire v1.0 ROM Detected")
		-- 	GameSettings.game = GameSettings.VERSIONS.RS
		-- 	GameSettings.gamename = "Pokemon Sapphire (U)"
		-- 	GameSettings.version = GameSettings.VERSIONS.RS
		-- 	GameSettings.versiongroup = 1

		-- 	-- Symbols file found at https://raw.githubusercontent.com/pret/pokeruby/symbols/pokeruby.sym
		-- 	GameSettings.StartWildBattle = 0x08081a00
		-- 	GameSettings.TrainerSentOutPkmn = 0x083fd1ed -- Finding some different names for symbols here... BattleText_SentOutSingle1?
		-- 	GameSettings.BeginBattleIntro = 0x080123c0 -- StartBattleIntroAnim?
		-- 	GameSettings.ReturnFromBattleToOverworld = 0x08015b58
		-- 	GameSettings.sBattlerAbilities = 0x02039a30 -- ???
		-- 	GameSettings.ChooseMoveUsedParticle = 0x080d869c
		-- 	GameSettings.gChosenMove = 0x02023d4c
		-- 	GameSettings.gBattlerAttacker = 0x02023d6b
		-- 	GameSettings.gBattlerPartyIndexesSelfSlotOne = 0x02023bce
		-- 	GameSettings.gBattlerPartyIndexesEnemySlotOne = 0x02023bd0
		-- 	GameSettings.gBattlerPartyIndexesSelfSlotTwo = 0x02023bcd2
		-- 	GameSettings.gBattlerPartyIndexesEnemySlotTwo = 0x02023bd4
		-- 	GameSettings.gBattleMons = 0x02023be4

		-- 	GameSettings.ShowPokemonSummaryScreen = 0x081344d0
		-- 	GameSettings.CalculateMonStats = 0x0803e47c
		-- 	GameSettings.DisplayMonLearnedMove = 0x081267dc -- BattleText_LearnedMove?
		-- 	GameSettings.SwitchSelectedMons = 0x08122e34 -- ???
		-- 	GameSettings.UpdatePoisonStepCounter = 0x0806d79c
		-- 	GameSettings.WeHopeToSeeYouAgain = 0x081a54ed -- gText_NurseJoy_WeHopeToSeeYouAgain
		-- 	GameSettings.DoPokeballSendOutAnimation = 0x0804a938 -- StartSendOutMonAnimation? or maybe SendOutMonAnimation?

		-- 	GameSettings.BattleScriptDrizzleActivates = 0x081d925b
		-- 	GameSettings.BattleScriptSpeedBoostActivates = 0x081d926f
		-- 	GameSettings.BattleScriptTraceActivates = 0x081d927d
		-- 	GameSettings.BattleScriptRainDishActivates = 0x081d9287
		-- 	GameSettings.BattleScriptSandstreamActivates = 0x081d929b
		-- 	GameSettings.BattleScriptShedSkinActivates = 0x081d92af
		-- 	GameSettings.BattleScriptIntimidateActivates = 0x081d92ec -- ??? Not there with other battle scripts... maybe BattleScript_AbilityNoSpecificStatLoss? That doesn't make sense to me though...
		-- 	GameSettings.BattleScriptDroughtActivates = 0x081d9355
		-- 	GameSettings.BattleScriptStickyHoldActivates = 0x081d946a -- BattleScript_NoItemSteal?
		-- 	GameSettings.BattleScriptColorChangeActivates = 0x081d9478
		-- 	GameSettings.BattleScriptRoughSkinActivates = 0x081d947f
		-- 	GameSettings.BattleScriptCuteCharmActivates = 0x081d949a
		-- 	GameSettings.BattleScriptSynchronizeActivates = 0x081d94aa

		-- 	GameSettings.gSaveBlock1 = 0x0202552c
		-- 	GameSettings.gSaveBlock2ptr = 0x0300500c -- Probably gUnknown_03004828 since it is 8 bytes after gFlashMemoryPresent, like in Emerald?
		-- 	GameSettings.bagEncryptionKeyOffset = 0xF20
		-- 	GameSettings.bagPocket_Items = GameSettings.gSaveBlock1 + 0x310
		-- 	GameSettings.bagPocket_Berries = GameSettings.gSaveBlock1 + 0x54c
		-- 	GameSettings.bagPocket_Items_Size = 30
		-- 	GameSettings.bagPocket_Berries_Size = 46

	else
		GameSettings.game = 0
		GameSettings.gamename = "Unsupported game"
		GameSettings.encountertable = 0
	end

	if GameSettings.game > 0 then
		GameSettings.pstats = pstats[GameSettings.game]
		GameSettings.estats = estats[GameSettings.game]
	end
end
