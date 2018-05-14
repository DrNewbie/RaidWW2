-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/tweak_data/WeaponTweakData"

require(slot1)

slot2 = "lib/tweak_data/EquipmentsTweakData"

require(slot1)

slot2 = "lib/tweak_data/CharacterTweakData"

require(slot1)

slot2 = "lib/tweak_data/PlayerTweakData"

require(slot1)

slot2 = "lib/tweak_data/StatisticsTweakData"

require(slot1)

slot2 = "lib/tweak_data/LevelsTweakData"

require(slot1)

slot2 = "lib/tweak_data/GroupAITweakData"

require(slot1)

slot2 = "lib/tweak_data/DramaTweakData"

require(slot1)

slot2 = "lib/tweak_data/UpgradesTweakData"

require(slot1)

slot2 = "lib/tweak_data/HudIconsTweakData"

require(slot1)

slot2 = "lib/tweak_data/TipsTweakData"

require(slot1)

slot2 = "lib/tweak_data/BlackMarketTweakData"

require(slot1)

slot2 = "lib/tweak_data/CarryTweakData"

require(slot1)

slot2 = "lib/tweak_data/AttentionTweakData"

require(slot1)

slot2 = "lib/tweak_data/OperationsTweakData"

require(slot1)

slot2 = "lib/tweak_data/SkillTreeTweakData"

require(slot1)

slot2 = "lib/tweak_data/TimeSpeedEffectTweakData"

require(slot1)

slot2 = "lib/tweak_data/SoundTweakData"

require(slot1)

slot2 = "lib/tweak_data/EventsTweakData"

require(slot1)

slot2 = "lib/tweak_data/LootDropTweakData"

require(slot1)

slot2 = "lib/tweak_data/GuiTweakData"

require(slot1)

slot2 = "lib/tweak_data/GreedTweakData"

require(slot1)

slot2 = "lib/tweak_data/DLCTweakData"

require(slot1)

slot2 = "lib/tweak_data/InteractionTweakData"

require(slot1)

slot2 = "lib/tweak_data/VehicleTweakData"

require(slot1)

slot2 = "lib/tweak_data/MountedWeaponTweakData"

require(slot1)

slot2 = "lib/tweak_data/CommWheelTweakData"

require(slot1)

slot2 = "lib/tweak_data/BarrageTweakData"

require(slot1)

slot2 = "lib/tweak_data/AchievementTweakData"

require(slot1)

slot2 = "lib/tweak_data/ProjectilesTweakData"

require(slot1)

slot2 = "lib/tweak_data/DropLootTweakData"

require(slot1)

slot2 = "lib/tweak_data/CharacterCustomizationTweakData"

require(slot1)

slot2 = "lib/tweak_data/CampCustomizationTweakData"

require(slot1)

slot2 = "lib/tweak_data/ChallengeCardsTweakData"

require(slot1)

slot2 = "lib/tweak_data/ChallengeTweakData"

require(slot1)

slot2 = "lib/tweak_data/WeaponSkillsTweakData"

require(slot1)

slot2 = "lib/tweak_data/WarcryTweakData"

require(slot1)

slot2 = "lib/tweak_data/WeaponInventoryTweakData"

require(slot1)

slot2 = "lib/tweak_data/SubtitlesTweakData"

require(slot1)

slot2 = "lib/tweak_data/InputTweakData"

require(slot1)

slot2 = "lib/tweak_data/IntelTweakData"

require(slot1)

TweakData = TweakData or class()
TweakData.RELOAD = true
TweakData.RESPEC_COST_CONSTANT = 1
TweakData.RESPEC_RESET = 10
TweakData.DIFFICULTY_1 = 1
TweakData.DIFFICULTY_2 = 2
TweakData.DIFFICULTY_3 = 3
TweakData.DIFFICULTY_4 = 4
function TweakData:digest_tweak_data()
	self.digested_tables = {
		"experience_manager"
	}
	slot3 = self.digested_tables

	for i, digest_me in ipairs(slot2) do
		slot9 = self[digest_me]

		self.digest_recursive(slot7, self)
	end

	return 
end
function TweakData:digest_recursive(key, parent)
	local value = (parent and parent[key]) or key
	slot6 = value

	if type(slot5) == "table" then
		slot6 = value

		for index, data in pairs(slot5) do
			slot13 = value

			self.digest_recursive(slot10, self, index)
		end
	else
		slot6 = value

		if type(slot5) == "number" then
			slot8 = true
			parent[key] = Application.digest_value(slot5, Application, value)
		end
	end

	return 
end
function TweakData:get_value(...)
	local arg = {
		...
	}
	local value = self
	slot5 = arg

	for _, v in ipairs(slot4) do
		if not value[v] then
			return false
		end

		value = value[v]
	end

	slot5 = value

	if type(slot4) == "string" then
		slot7 = false

		return Application.digest_value(slot4, Application, value)
	else
		slot5 = value

		if type(slot4) == "table" then
			slot7 = inspect(slot8)
			slot10 = value

			Application.debug(slot4, Application, "TweakData:get_value() value was a table, is this correct? returning false!", inspect(arg))

			return false
		end
	end

	return value
end
function TweakData:get_raw_value(...)
	local arg = {
		...
	}
	local value = self
	local v = nil

	for i = 1, #arg, 1 do
		v = arg[i]

		if not value[v] then
			return nil, v, i
		end

		value = value[v]
	end

	return value
end
function TweakData:set_mode()
	if not Global.game_settings then
		return 
	end

	if Global.game_settings.single_player then
		slot3 = self

		self._set_singleplayer(slot2)
	else
		slot3 = self

		self._set_multiplayer(slot2)
	end

	return 
end
function TweakData:_set_singleplayer()
	slot3 = self.player

	self.player._set_singleplayer(slot2)

	return 
end
function TweakData:_set_multiplayer()
	slot3 = self.player

	self.player._set_multiplayer(slot2)

	return 
end
function TweakData:set_difficulty(value)
	if not value then
		slot4 = "[TweakData:set_difficulty] is nil"

		debug_pause(slot3)

		return 
	end

	Global.game_settings.difficulty = value

	if Global.game_settings.difficulty == "difficulty_1" then
		slot4 = self

		self._set_difficulty_1(slot3)
	elseif Global.game_settings.difficulty == "difficulty_2" then
		slot4 = self

		self._set_difficulty_2(slot3)
	elseif Global.game_settings.difficulty == "difficulty_3" then
		slot4 = self

		self._set_difficulty_3(slot3)
	elseif Global.game_settings.difficulty == "difficulty_4" then
		slot4 = self

		self._set_difficulty_4(slot3)
	else
		slot5 = value

		debug_pause(slot3, "[TweakData][set_difficulty()] Setting invalid difficulty: ")
	end

	return 
end
function TweakData:_set_difficulty_1()
	slot3 = self.player

	self.player._set_difficulty_1(slot2)

	slot3 = self.character

	self.character._set_difficulty_1(slot2)

	slot3 = self.weapon

	self.weapon._set_difficulty_1(slot2)

	slot4 = self

	self.group_ai.init(slot2, self.group_ai)

	slot4 = self

	self.barrage.init(slot2, self.barrage)

	self.difficulty_name_id = self.difficulty_name_ids.difficulty_1

	return 
end
function TweakData:_set_difficulty_2()
	slot3 = self.player

	self.player._set_difficulty_2(slot2)

	slot3 = self.character

	self.character._set_difficulty_2(slot2)

	slot3 = self.weapon

	self.weapon._set_difficulty_2(slot2)

	slot4 = self

	self.group_ai.init(slot2, self.group_ai)

	slot4 = self

	self.barrage.init(slot2, self.barrage)

	self.difficulty_name_id = self.difficulty_name_ids.difficulty_2

	return 
end
function TweakData:_set_difficulty_3()
	slot3 = self.player

	self.player._set_difficulty_3(slot2)

	slot3 = self.character

	self.character._set_difficulty_3(slot2)

	slot3 = self.weapon

	self.weapon._set_difficulty_3(slot2)

	slot4 = self

	self.group_ai.init(slot2, self.group_ai)

	slot4 = self

	self.barrage.init(slot2, self.barrage)

	self.difficulty_name_id = self.difficulty_name_ids.difficulty_3

	return 
end
function TweakData:_set_difficulty_4()
	slot3 = self.player

	self.player._set_difficulty_4(slot2)

	slot3 = self.character

	self.character._set_difficulty_4(slot2)

	slot3 = self.weapon

	self.weapon._set_difficulty_4(slot2)

	slot4 = self

	self.group_ai.init(slot2, self.group_ai)

	slot4 = self

	self.barrage.init(slot2, self.barrage)

	self.difficulty_name_id = self.difficulty_name_ids.difficulty_4

	return 
end
function TweakData:number_of_difficulties()
	return #self.difficulties
end
function TweakData:difficulty_to_index(difficulty)
	slot5 = difficulty

	return table.index_of(slot3, self.difficulties)
end
function TweakData:index_to_difficulty(index)
	return self.difficulties[index]
end
function TweakData:get_difficulty_string_name_from_index(index)
	slot5 = index
	local difficulty_index_name = self.index_to_difficulty(slot3, self)

	return self.difficulty_name_ids[difficulty_index_name]
end
function TweakData:permission_to_index(permission)
	slot5 = permission

	return table.index_of(slot3, self.permissions)
end
function TweakData:index_to_permission(index)
	return self.permissions[index]
end
function TweakData:server_state_to_index(state)
	slot5 = state

	return table.index_of(slot3, self.server_states)
end
function TweakData:index_to_server_state(index)
	return self.server_states[index]
end
function TweakData:menu_sync_state_to_index(state)
	if not state then
		return false
	end

	slot4 = self.menu_sync_states

	for i, menu_sync in ipairs(slot3) do
		if menu_sync == state then
			return i
		end
	end

	return 
end
function TweakData:index_to_menu_sync_state(index)
	return self.menu_sync_states[index]
end
function TweakData:init()
	self.difficulties = {
		"difficulty_1",
		"difficulty_2",
		"difficulty_3",
		"difficulty_4"
	}
	self.hardest_difficulty = {
		id = 4
	}
	self.difficulty_level_locks = {
		0,
		0,
		0,
		0,
		0,
		80
	}
	self.permissions = {
		"public",
		"friends_only",
		"private"
	}
	self.server_states = {
		"in_lobby",
		"loading",
		"in_game"
	}
	self.menu_sync_states = {
		"crimenet",
		"skilltree",
		"options",
		"lobby",
		"blackmarket",
		"blackmarket_weapon",
		"blackmarket_mask",
		"payday"
	}
	self.difficulty_name_ids = {
		difficulty_1 = "menu_difficulty_1",
		difficulty_2 = "menu_difficulty_2",
		difficulty_3 = "menu_difficulty_3",
		difficulty_4 = "menu_difficulty_4"
	}
	slot3 = HudIconsTweakData
	self.hud_icons = HudIconsTweakData.new("menu_difficulty_4")
	slot4 = self
	self.weapon = WeaponTweakData.new("menu_difficulty_4", WeaponTweakData)
	slot3 = EquipmentsTweakData
	self.equipments = EquipmentsTweakData.new("menu_difficulty_4")
	slot3 = PlayerTweakData
	self.player = PlayerTweakData.new("menu_difficulty_4")
	slot4 = self
	self.character = CharacterTweakData.new("menu_difficulty_4", CharacterTweakData)
	slot3 = CharacterCustomizationTweakData
	self.character_customization = CharacterCustomizationTweakData.new("menu_difficulty_4")
	slot3 = CampCustomizationTweakData
	self.camp_customization = CampCustomizationTweakData.new("menu_difficulty_4")
	slot3 = StatisticsTweakData
	self.statistics = StatisticsTweakData.new("menu_difficulty_4")
	slot3 = LevelsTweakData
	self.levels = LevelsTweakData.new("menu_difficulty_4")
	slot3 = OperationsTweakData
	self.operations = OperationsTweakData.new("menu_difficulty_4")
	slot4 = self
	self.group_ai = GroupAITweakData.new("menu_difficulty_4", GroupAITweakData)
	slot3 = DramaTweakData
	self.drama = DramaTweakData.new("menu_difficulty_4")
	slot3 = UpgradesTweakData
	self.upgrades = UpgradesTweakData.new("menu_difficulty_4")
	slot3 = GuiTweakData
	self.gui = GuiTweakData.new("menu_difficulty_4")
	slot4 = self
	self.skilltree = SkillTreeTweakData.new("menu_difficulty_4", SkillTreeTweakData)
	slot3 = TipsTweakData
	self.tips = TipsTweakData.new("menu_difficulty_4")
	slot4 = self
	self.blackmarket = BlackMarketTweakData.new("menu_difficulty_4", BlackMarketTweakData)
	slot4 = self
	self.carry = CarryTweakData.new("menu_difficulty_4", CarryTweakData)
	slot3 = AttentionTweakData
	self.attention = AttentionTweakData.new("menu_difficulty_4")
	slot3 = TimeSpeedEffectTweakData
	self.timespeed = TimeSpeedEffectTweakData.new("menu_difficulty_4")
	slot3 = SoundTweakData
	self.sound = SoundTweakData.new("menu_difficulty_4")
	slot3 = EventsTweakData
	self.events = EventsTweakData.new("menu_difficulty_4")
	slot4 = self
	self.lootdrop = LootDropTweakData.new("menu_difficulty_4", LootDropTweakData)
	slot4 = self
	self.drop_loot = DropLootTweakData.new("menu_difficulty_4", DropLootTweakData)
	slot4 = self
	self.dlc = DLCTweakData.new("menu_difficulty_4", DLCTweakData)
	slot4 = self
	self.interaction = InteractionTweakData.new("menu_difficulty_4", InteractionTweakData)
	slot4 = self
	self.vehicle = VehicleTweakData.new("menu_difficulty_4", VehicleTweakData)
	slot4 = self
	self.mounted_weapon = MountedWeaponTweakData.new("menu_difficulty_4", MountedWeaponTweakData)
	slot4 = self
	self.comm_wheel = CommWheelTweakData.new("menu_difficulty_4", CommWheelTweakData)
	slot4 = self
	self.barrage = BarrageTweakData.new("menu_difficulty_4", BarrageTweakData)
	slot4 = self
	self.achievement = AchievementTweakData.new("menu_difficulty_4", AchievementTweakData)
	slot4 = self
	self.projectiles = ProjectilesTweakData.new("menu_difficulty_4", ProjectilesTweakData)
	slot4 = self
	self.challenge = ChallengeTweakData.new("menu_difficulty_4", ChallengeTweakData)
	slot4 = self
	self.weapon_skills = WeaponSkillsTweakData.new("menu_difficulty_4", WeaponSkillsTweakData)
	slot4 = self
	self.warcry = WarcryTweakData.new("menu_difficulty_4", WarcryTweakData)
	slot4 = self
	self.challenge_cards = ChallengeCardsTweakData.new("menu_difficulty_4", ChallengeCardsTweakData)
	slot4 = self
	self.weapon_inventory = WeaponInventoryTweakData.new("menu_difficulty_4", WeaponInventoryTweakData)
	slot4 = self
	self.subtitles = SubtitlesTweakData.new("menu_difficulty_4", SubtitlesTweakData)
	slot4 = self
	self.input = InputTweakData.new("menu_difficulty_4", InputTweakData)
	slot4 = self
	self.intel = IntelTweakData.new("menu_difficulty_4", IntelTweakData)
	slot3 = GreedTweakData
	self.greed = GreedTweakData.new("menu_difficulty_4")
	self.criminals = {
		character_names = {
			"russian",
			"german",
			"british",
			"american"
		},
		character_nations = {
			"british",
			"russian",
			"american",
			"german"
		},
		character_nation_name = {}
	}
	self.criminals.character_nation_name.russian = {
		char_name = "Kurgan",
		flag_name = "ico_flag_russian"
	}
	self.criminals.character_nation_name.german = {
		char_name = "Wolfgang",
		flag_name = "ico_flag_german"
	}
	self.criminals.character_nation_name.british = {
		char_name = "Sterling",
		flag_name = "ico_flag_british"
	}
	self.criminals.character_nation_name.american = {
		char_name = "Rivet",
		flag_name = "ico_flag_american"
	}
	self.criminals.characters = {
		{
			name = "german",
			static_data = {
				voice = "ger",
				color_id = 1,
				ai_character_id = "ai_german",
				mask_id = 1,
				ssuffix = "l"
			}
		},
		{
			name = "russian",
			static_data = {
				voice = "rus",
				color_id = 2,
				ai_character_id = "ai_russian",
				mask_id = 2,
				ssuffix = "c"
			}
		},
		{
			name = "american",
			static_data = {
				voice = "amer",
				color_id = 3,
				ai_character_id = "ai_american",
				mask_id = 3,
				ssuffix = "a"
			}
		},
		{
			name = "british",
			static_data = {
				voice = "brit",
				color_id = 4,
				ai_character_id = "ai_british",
				mask_id = 4,
				ssuffix = "b"
			}
		}
	}
	self.criminals.loud_teleport_distance_treshold = 3000
	self.EFFECT_QUALITY = 0.5
	slot4 = "X360"

	if SystemInfo.platform(3000) == Idstring(SystemInfo) then
		self.EFFECT_QUALITY = 0.5
	else
		slot4 = "PS3"

		if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
			self.EFFECT_QUALITY = 0.5
		end
	end

	slot3 = self

	self.set_scale(slot2)

	self.states = {
		title = {}
	}
	self.states.title.ATTRACT_VIDEO_DELAY = 60
	self.menu = {
		BRIGHTNESS_CHANGE = 0.05,
		MIN_BRIGHTNESS = 0.5,
		MAX_BRIGHTNESS = 1.5,
		MUSIC_CHANGE = 10,
		MIN_MUSIC_VOLUME = 0,
		MAX_MUSIC_VOLUME = 100,
		VOICE_OVER_CHANGE = 10,
		MIN_VOICE_OVER_VOLUME = 0,
		MAX_VOICE_OVER_VOLUME = 100,
		SFX_CHANGE = 10,
		MIN_SFX_VOLUME = 0,
		MAX_SFX_VOLUME = 100,
		VOICE_CHANGE = 0.05,
		MIN_VOICE_VOLUME = 0,
		MAX_VOICE_VOLUME = 1
	}
	slot3 = self

	self.set_menu_scale(1)

	slot5 = 102
	local orange = Vector3(1, 204, 161) / 255
	slot6 = 151
	local green = Vector3(204, 194, 252) / 255
	slot7 = 89
	local brown = Vector3(194, 178, 104) / 255
	slot8 = 204
	local blue = Vector3(178, 120, 183) / 255
	slot9 = 1
	local team_ai = Vector3(120, 0.2, 0.8)
	self.peer_vector_colors = {
		green,
		blue,
		brown,
		orange,
		team_ai
	}
	self.peer_colors = {
		"mrgreen",
		"mrblue",
		"mrbrown",
		"mrorange",
		"mrai"
	}
	slot11 = self.peer_vector_colors[1]
	slot11 = self.peer_vector_colors[2]
	slot11 = self.peer_vector_colors[3]
	slot11 = self.peer_vector_colors[4]
	slot11 = self.peer_vector_colors[5]
	self.chat_colors = {
		Color(self.peer_vector_colors[1].unpack(slot10)),
		Color(self.peer_vector_colors[2].unpack(slot10)),
		Color(self.peer_vector_colors[3].unpack(slot10)),
		Color(self.peer_vector_colors[4].unpack(slot10)),
		Color(self.peer_vector_colors[5].unpack(slot10))
	}
	self.screen_colors = {}
	slot12 = 255
	self.screen_colors.text = Color(0.8, 255, 255, 255) / 255
	slot12 = 255
	self.screen_colors.resource = Color(0.8, 255, 77, 198) / 255
	slot12 = 51
	self.screen_colors.important_1 = Color(0.8, 255, 255, 51) / 255
	slot12 = 51
	self.screen_colors.important_2 = Color(0.8, 125, 255, 51) / 255
	slot12 = 255
	self.screen_colors.item_stage_1 = Color(0.8, 255, 255, 255) / 255
	slot12 = 128
	self.screen_colors.item_stage_2 = Color(0.8, 255, 89, 115) / 255
	slot12 = 38
	self.screen_colors.item_stage_3 = Color(0.8, 255, 23, 33) / 255
	slot12 = 0
	self.screen_colors.button_stage_1 = Color(0.8, 255, 0, 0) / 255
	slot12 = 50
	self.screen_colors.button_stage_2 = Color(0.8, 255, 255, 50) / 255
	slot12 = 240
	self.screen_colors.button_stage_3 = Color(0.8, 240, 240, 240) / 255
	slot12 = 182
	self.screen_colors.crimenet_lines = Color(0.8, 255, 127, 157) / 255
	slot12 = 0
	self.screen_colors.risk = Color(0.8, 255, 255, 204) / 255
	slot12 = 122
	self.screen_colors.friend_color = Color(0.8, 255, 41, 204) / 255
	slot12 = 240
	self.screen_colors.regular_color = Color(0.8, 255, 41, 150) / 255
	slot12 = 51
	self.screen_colors.pro_color = Color(0.8, 255, 255, 51) / 255
	slot12 = 0
	self.screen_colors.dlc_color = Color(0.8, 255, 255, 212) / 255
	slot12 = 255
	self.screen_colors.skill_color = Color(0.8, 255, 77, 198) / 255
	slot9 = "4ca6ff"
	self.screen_colors.ghost_color = Color(0.8)
	slot12 = 255
	self.screen_colors.extra_bonus_color = Color(0.8, 255, 255, 255) / 255
	slot12 = 254
	self.screen_colors.community_color = Color(0.8, 255, 59, 174) / 255
	slot12 = 0
	self.screen_colors.challenge_completed_color = Color(0.8, 255, 255, 168) / 255
	slot12 = 51
	self.screen_colors.heat_cold_color = Color(0.8, 255, 255, 51) / 255
	slot9 = "ff7f00"
	self.screen_colors.heat_warm_color = Color(0.8)
	slot12 = 255
	self.screen_colors.heat_standard_color = Color(0.8, 255, 255, 255) / 255
	self.screen_colors.heat_color = self.screen_colors.heat_standard_color
	slot12 = 125
	self.screen_colors.stats_positive = Color(0.8, 255, 191, 221) / 255
	slot12 = 99
	self.screen_colors.stats_negative = Color(0.8, 255, 254, 93) / 255
	slot12 = 76
	self.screen_colors.stats_mods = Color(0.8, 255, 229, 229) / 255

	if Global.test_new_colors then
		slot8 = self.screen_colors

		for i, d in pairs(slot7) do
			self.screen_colors[i] = Color.purple
		end
	end

	if Global.old_colors_purple then
		self.screen_color_white = Color.purple
		self.screen_color_red = Color.purple
		self.screen_color_green = Color.purple
		self.screen_color_grey = Color.purple
		self.screen_color_light_grey = Color.purple
		self.screen_color_blue = Color.purple
		self.screen_color_blue_selected = Color.purple
		self.screen_color_blue_highlighted = Color.purple
		self.screen_color_blue_noselected = Color.purple
		self.screen_color_yellow = Color.purple
		self.screen_color_yellow_selected = Color.purple
		self.screen_color_yellow_noselected = Color.purple
	else
		slot10 = 1
		self.screen_color_white = Color(slot7, 1, 1)
		slot10 = 0.21176470588235294
		self.screen_color_red = Color(slot7, 0.7137254901960784, 0.24705882352941178)
		slot10 = 0.5176470588235295
		self.screen_color_green = Color(slot7, 0.12549019607843137, 1)
		slot10 = 0.39215686274509803
		self.screen_color_grey = Color(slot7, 0.39215686274509803, 0.39215686274509803)
		slot10 = 0.7843137254901961
		self.screen_color_light_grey = Color(slot7, 0.7843137254901961, 0.7843137254901961)
		slot10 = 1
		self.screen_color_blue = Color(slot7, 0.30196078431372547, 0.7764705882352941)
		slot10 = 1
		self.screen_color_blue_selected = Color(slot7, 0.30196078431372547, 0.7764705882352941)
		slot9 = 0.75
		self.screen_color_blue_highlighted = self.screen_color_blue_selected.with_alpha(slot7, self.screen_color_blue_selected)
		slot9 = 0.5
		self.screen_color_blue_noselected = self.screen_color_blue_selected.with_alpha(slot7, self.screen_color_blue_selected)
		slot10 = 0.17647058823529413
		self.screen_color_yellow = Color(slot7, 0.8627450980392157, 0.6745098039215687)
		slot10 = 0
		self.screen_color_yellow_selected = Color(slot7, 1, 0.8)
		slot10 = 0.0784313725490196
		self.screen_color_yellow_noselected = Color(slot7, 0.7333333333333333, 0.42745098039215684)
	end

	self.dialog = {
		WIDTH = 400,
		HEIGHT = 300,
		PADDING = 30,
		BUTTON_PADDING = 5,
		BUTTON_SPACING = 10,
		FONT = self.menu.default_font,
		BG_COLOR = self.menu.default_menu_background_color
	}
	slot12 = 1
	self.dialog.TITLE_TEXT_COLOR = Color(slot8, 1, 1, 1)
	self.dialog.TEXT_COLOR = self.menu.default_font_row_item_color
	slot12 = 0.5
	self.dialog.BUTTON_BG_COLOR = Color(slot8, 0, 0.5, 0.5)
	self.dialog.BUTTON_TEXT_COLOR = self.menu.default_font_row_item_color
	self.dialog.SELECTED_BUTTON_BG_COLOR = self.menu.default_font_row_item_color
	self.dialog.SELECTED_BUTTON_TEXT_COLOR = self.menu.default_hightlight_row_item_color
	self.dialog.TITLE_SIZE = self.menu.topic_font_size
	self.dialog.TEXT_SIZE = self.menu.dialog_text_font_size
	self.dialog.BUTTON_SIZE = self.menu.dialog_title_font_size
	self.dialog.TITLE_TEXT_SPACING = 20
	self.dialog.BUTTON_TEXT_SPACING = 3
	self.dialog.DEFAULT_PRIORITY = 1
	self.dialog.MINIMUM_DURATION = 2
	self.dialog.DURATION_PER_CHAR = 0.07
	self.hud = {}
	slot8 = self

	self.set_hud_values(0.07)

	self.gui = self.gui or {}
	self.gui.BOOT_SCREEN_LAYER = 1
	self.gui.TITLE_SCREEN_LAYER = 1
	self.gui.MENU_LAYER = 200
	self.gui.MENU_COMPONENT_LAYER = 300
	self.gui.ATTRACT_SCREEN_LAYER = 400
	self.gui.LOADING_SCREEN_LAYER = 1000
	self.gui.CRIMENET_CHAT_LAYER = 1000
	self.gui.DIALOG_LAYER = 1100
	self.gui.MOUSE_LAYER = 1200
	self.overlay_effects = {}
	slot14 = 0
	slot11 = TimerManager
	self.overlay_effects.spectator = {
		blend_mode = "normal",
		fade_out = 2,
		play_paused = true,
		fade_in = 3,
		color = Color(slot10, 1, 0, 0),
		timer = TimerManager.main("color")
	}
	slot14 = 0
	slot11 = TimerManager
	self.overlay_effects.level_fade_in = {
		blend_mode = "normal",
		sustain = 1,
		play_paused = true,
		fade_in = 0,
		fade_out = 3,
		color = Color("timer", 1, 0, 0),
		timer = TimerManager.game("color")
	}
	slot14 = 0
	slot11 = TimerManager
	self.overlay_effects.fade_in = {
		blend_mode = "normal",
		sustain = 0,
		play_paused = true,
		fade_in = 0,
		fade_out = 3,
		color = Color("timer", 1, 0, 0),
		timer = TimerManager.main("color")
	}
	slot14 = 0
	slot11 = TimerManager
	self.overlay_effects.fade_out = {
		blend_mode = "normal",
		sustain = 30,
		play_paused = true,
		fade_in = 3,
		fade_out = 0,
		color = Color("timer", 1, 0, 0),
		timer = TimerManager.main("color")
	}
	slot14 = 0
	slot11 = TimerManager
	self.overlay_effects.fade_out_permanent = {
		blend_mode = "normal",
		fade_out = 0,
		play_paused = true,
		fade_in = 1,
		color = Color("timer", 1, 0, 0),
		timer = TimerManager.main("color")
	}
	slot14 = 0
	slot11 = TimerManager
	self.overlay_effects.fade_out_in = {
		blend_mode = "normal",
		sustain = 1,
		play_paused = true,
		fade_in = 1,
		fade_out = 1,
		color = Color("timer", 1, 0, 0),
		timer = TimerManager.main("color")
	}
	slot14 = 0
	slot11 = TimerManager
	self.overlay_effects.element_fade_in = {
		blend_mode = "normal",
		sustain = 0,
		play_paused = true,
		fade_in = 0,
		fade_out = 3,
		color = Color("timer", 1, 0, 0),
		timer = TimerManager.main("color")
	}
	slot11 = TimerManager
	self.overlay_effects.element_fade_out = {
		blend_mode = "normal",
		sustain = 0,
		play_paused = true,
		fade_in = 3,
		fade_out = 0,
		color = Color("timer", 1, 0, 0),
		timer = TimerManager.main("color")
	}
	slot11 = 1
	local d_color = Color("element_fade_out", 0.75, 1, 1)
	local d_sustain = 0.1
	local d_fade_out = 0.9
	self.overlay_effects.damage = {
		blend_mode = "add",
		fade_in = 0,
		sustain = d_sustain,
		fade_out = d_fade_out,
		color = d_color
	}
	slot16 = 0
	slot16 = 0
	self.overlay_effects.damage_left = {
		blend_mode = "add",
		fade_in = 0,
		orientation = "horizontal",
		sustain = d_sustain,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			0,
			d_color,
			0.1,
			d_color,
			0.15,
			Color().with_alpha(0, Color()),
			1,
			Color().with_alpha(0, Color())
		}
	}
	slot16 = 0
	slot16 = 0
	self.overlay_effects.damage_right = {
		blend_mode = "add",
		fade_in = 0,
		orientation = "horizontal",
		sustain = d_sustain,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			1,
			d_color,
			0.9,
			d_color,
			0.85,
			Color().with_alpha(0, Color()),
			0,
			Color().with_alpha(0, Color())
		}
	}
	slot16 = 0
	slot16 = 0
	self.overlay_effects.damage_up = {
		blend_mode = "add",
		fade_in = 0,
		orientation = "vertical",
		sustain = d_sustain,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			0,
			d_color,
			0.1,
			d_color,
			0.15,
			Color().with_alpha(0, Color()),
			1,
			Color().with_alpha(0, Color())
		}
	}
	slot16 = 0
	slot16 = 0
	self.overlay_effects.damage_down = {
		blend_mode = "add",
		fade_in = 0,
		orientation = "vertical",
		sustain = d_sustain,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			1,
			d_color,
			0.9,
			d_color,
			0.85,
			Color().with_alpha(0, Color()),
			0,
			Color().with_alpha(0, Color())
		}
	}
	slot17 = 1
	self.overlay_effects.maingun_zoomed = {
		blend_mode = "add",
		fade_in = 0,
		sustain = 0,
		fade_out = 0.4,
		color = Color("gradient_points", 0.1, 1, 1)
	}
	slot17 = 0
	slot14 = TimerManager
	slot17 = 0
	self.overlay_effects.fade_out_e3_demo = {
		text_to_upper = true,
		sustain = 20,
		blend_mode = "normal",
		fade_in = 3,
		text_blend_mode = "add",
		fade_out = 0,
		font = "fonts/font_large_mf",
		text = [[
Great job, Raid gang!

You've reached the end of our PAX EAST demo.
]],
		font_size = 44,
		play_paused = true,
		color = Color("color", 1, 0, 0),
		timer = TimerManager.main("color"),
		text_color = Color("timer", 255, 255, 204) / 255
	}
	self.materials = {}
	slot12 = "concrete"
	slot12 = Idstring()
	self.materials[Idstring().key()] = "concrete"
	slot12 = "ceramic"
	slot12 = Idstring("concrete")
	self.materials[Idstring("concrete").key("concrete")] = "ceramic"
	slot12 = "marble"
	slot12 = Idstring("ceramic")
	self.materials[Idstring("ceramic").key("ceramic")] = "marble"
	slot12 = "flesh"
	slot12 = Idstring("marble")
	self.materials[Idstring("marble").key("marble")] = "flesh"
	slot12 = "parket"
	slot12 = Idstring("flesh")
	self.materials[Idstring("flesh").key("flesh")] = "parket"
	slot12 = "sheet_metal"
	slot12 = Idstring("parket")
	self.materials[Idstring("parket").key("parket")] = "sheet_metal"
	slot12 = "iron"
	slot12 = Idstring("sheet_metal")
	self.materials[Idstring("sheet_metal").key("sheet_metal")] = "iron"
	slot12 = "wood"
	slot12 = Idstring("iron")
	self.materials[Idstring("iron").key("iron")] = "wood"
	slot12 = "gravel"
	slot12 = Idstring("wood")
	self.materials[Idstring("wood").key("wood")] = "gravel"
	slot12 = "cloth"
	slot12 = Idstring("gravel")
	self.materials[Idstring("gravel").key("gravel")] = "cloth"
	slot12 = "cloth_no_decal"
	slot12 = Idstring("cloth")
	self.materials[Idstring("cloth").key("cloth")] = "cloth"
	slot12 = "cloth_stuffed"
	slot12 = Idstring("cloth")
	self.materials[Idstring("cloth").key("cloth")] = "cloth_stuffed"
	slot12 = "dirt"
	slot12 = Idstring("cloth_stuffed")
	self.materials[Idstring("cloth_stuffed").key("cloth_stuffed")] = "dirt"
	slot12 = "grass"
	slot12 = Idstring("dirt")
	self.materials[Idstring("dirt").key("dirt")] = "grass"
	slot12 = "carpet"
	slot12 = Idstring("grass")
	self.materials[Idstring("grass").key("grass")] = "carpet"
	slot12 = "metal"
	slot12 = Idstring("carpet")
	self.materials[Idstring("carpet").key("carpet")] = "metal"
	slot12 = "glass_breakable"
	slot12 = Idstring("metal")
	self.materials[Idstring("metal").key("metal")] = "glass_breakable"
	slot12 = "glass_unbreakable"
	slot12 = Idstring("glass_breakable")
	self.materials[Idstring("glass_breakable").key("glass_breakable")] = "glass_unbreakable"
	slot12 = "glass_no_decal"
	slot12 = Idstring("glass_unbreakable")
	self.materials[Idstring("glass_unbreakable").key("glass_unbreakable")] = "glass_unbreakable"
	slot12 = "rubber"
	slot12 = Idstring("glass_unbreakable")
	self.materials[Idstring("glass_unbreakable").key("glass_unbreakable")] = "rubber"
	slot12 = "plastic"
	slot12 = Idstring("rubber")
	self.materials[Idstring("rubber").key("rubber")] = "plastic"
	slot12 = "asphalt"
	slot12 = Idstring("plastic")
	self.materials[Idstring("plastic").key("plastic")] = "asphalt"
	slot12 = "foliage"
	slot12 = Idstring("asphalt")
	self.materials[Idstring("asphalt").key("asphalt")] = "foliage"
	slot12 = "stone"
	slot12 = Idstring("foliage")
	self.materials[Idstring("foliage").key("foliage")] = "stone"
	slot12 = "sand"
	slot12 = Idstring("stone")
	self.materials[Idstring("stone").key("stone")] = "sand"
	slot12 = "thin_layer"
	slot12 = Idstring("sand")
	self.materials[Idstring("sand").key("sand")] = "thin_layer"
	slot12 = "no_decal"
	slot12 = Idstring("thin_layer")
	self.materials[Idstring("thin_layer").key("thin_layer")] = "silent_material"
	slot12 = "plaster"
	slot12 = Idstring("silent_material")
	self.materials[Idstring("silent_material").key("silent_material")] = "plaster"
	slot12 = "no_material"
	slot12 = Idstring("plaster")
	self.materials[Idstring("plaster").key("plaster")] = "no_material"
	slot12 = "paper"
	slot12 = Idstring("no_material")
	self.materials[Idstring("no_material").key("no_material")] = "paper"
	slot12 = "metal_hollow"
	slot12 = Idstring("paper")
	self.materials[Idstring("paper").key("paper")] = "metal_hollow"
	slot12 = "metal_chassis"
	slot12 = Idstring("metal_hollow")
	self.materials[Idstring("metal_hollow").key("metal_hollow")] = "metal_chassis"
	slot12 = "metal_catwalk"
	slot12 = Idstring("metal_chassis")
	self.materials[Idstring("metal_chassis").key("metal_chassis")] = "metal_catwalk"
	slot12 = "hardwood"
	slot12 = Idstring("metal_catwalk")
	self.materials[Idstring("metal_catwalk").key("metal_catwalk")] = "hardwood"
	slot12 = "fence"
	slot12 = Idstring("hardwood")
	self.materials[Idstring("hardwood").key("hardwood")] = "fence"
	slot12 = "steel"
	slot12 = Idstring("fence")
	self.materials[Idstring("fence").key("fence")] = "steel"
	slot12 = "steel_no_decal"
	slot12 = Idstring("steel")
	self.materials[Idstring("steel").key("steel")] = "steel"
	slot12 = "tile"
	slot12 = Idstring("steel")
	self.materials[Idstring("steel").key("steel")] = "tile"
	slot12 = "water_deep"
	slot12 = Idstring("tile")
	self.materials[Idstring("tile").key("tile")] = "water_deep"
	slot12 = "water_puddle"
	slot12 = Idstring("water_deep")
	self.materials[Idstring("water_deep").key("water_deep")] = "water_puddle"
	slot12 = "water_shallow"
	slot12 = Idstring("water_puddle")
	self.materials[Idstring("water_puddle").key("water_puddle")] = "water_shallow"
	slot12 = "shield"
	slot12 = Idstring("water_shallow")
	self.materials[Idstring("water_shallow").key("water_shallow")] = "shield"
	slot12 = "heavy_swat_steel_no_decal"
	slot12 = Idstring("shield")
	self.materials[Idstring("shield").key("shield")] = "shield"
	slot12 = "glass"
	slot12 = Idstring("shield")
	self.materials[Idstring("shield").key("shield")] = "glass"
	slot12 = "metalsheet"
	slot12 = Idstring("glass")
	self.materials[Idstring("glass").key("glass")] = "metalsheet"
	slot12 = "mud"
	slot12 = Idstring("metalsheet")
	self.materials[Idstring("metalsheet").key("metalsheet")] = "mud"
	slot12 = "puddle"
	slot12 = Idstring("mud")
	self.materials[Idstring("mud").key("mud")] = "puddle"
	slot12 = "water"
	slot12 = Idstring("puddle")
	self.materials[Idstring("puddle").key("puddle")] = "water"
	slot12 = "car"
	slot12 = Idstring("water")
	self.materials[Idstring("water").key("water")] = "car"
	slot12 = "brick"
	slot12 = Idstring("car")
	self.materials[Idstring("car").key("car")] = "brick"
	slot12 = "helmet"
	slot12 = Idstring("brick")
	self.materials[Idstring("brick").key("brick")] = "metalsheet"
	slot12 = "snow"
	slot12 = Idstring("metalsheet")
	self.materials[Idstring("metalsheet").key("metalsheet")] = "snow"
	slot12 = "ice"
	slot12 = Idstring("snow")
	self.materials[Idstring("snow").key("snow")] = "ice_thick"
	slot12 = "flamer_metal"
	slot12 = Idstring("ice_thick")
	self.materials[Idstring("ice_thick").key("ice_thick")] = "flamer_metal"
	self.screen = {
		fadein_delay = 1
	}
	self.experience_manager = {
		level_failed_multiplier = 0.01,
		human_player_multiplier = {
			1,
			1.2,
			1.3,
			1.4
		},
		level_diff_max_multiplier = 2,
		difficulty_multiplier = {}
	}
	self.experience_manager.difficulty_multiplier[TweakData.DIFFICULTY_1] = 1
	self.experience_manager.difficulty_multiplier[TweakData.DIFFICULTY_2] = 2
	self.experience_manager.difficulty_multiplier[TweakData.DIFFICULTY_3] = 5
	self.experience_manager.difficulty_multiplier[TweakData.DIFFICULTY_4] = 10
	local multiplier = 1
	local level_xp_requirements = {
		0,
		1200,
		1440,
		1728,
		2074,
		2488,
		2986,
		3583,
		4300,
		5160,
		6192,
		7430,
		8916,
		10254,
		11381,
		12520,
		13771,
		15149,
		16664,
		18330,
		20163,
		22179,
		24397,
		26837,
		29520,
		32472,
		35720,
		39292,
		43221,
		47543,
		52297,
		57527,
		63280,
		69608,
		80049,
		92056,
		105864,
		121744,
		140006,
		161007
	}
	self.experience_manager.levels = {}

	for i = 1, #level_xp_requirements, 1 do
		self.experience_manager.levels[i] = {
			points = level_xp_requirements[i] * multiplier
		}
	end

	local exp_step_start = 5
	local exp_step_end = 193
	local exp_step = 1 / (exp_step_end - exp_step_start)

	for i = 146, exp_step_end, 1 do
		slot22 = 22000 * exp_step * (i - exp_step_start) - 6000
		self.experience_manager.levels[i] = {
			points = math.round("round") * multiplier
		}
	end

	self.pickups = {}
	slot19 = "units/pickups/pickup_bank_manager_key/pickup_bank_manager_key"
	self.pickups.bank_manager_key = {
		unit = Idstring(slot18)
	}
	slot19 = "units/pickups/pickup_chavez_key/pickup_chavez_key"
	self.pickups.chavez_key = {
		unit = Idstring("unit")
	}
	slot19 = "units/pickups/pickup_drill/pickup_drill"
	self.pickups.drill = {
		unit = Idstring("unit")
	}
	slot19 = "units/pd2_dlc_red/pickups/gen_pku_keycard_outlined/gen_pku_keycard_outlined"
	self.pickups.keycard_outlined = {
		unit = Idstring("unit")
	}
	slot19 = "units/pd2_dlc_casino/props/cas_prop_keycard/cas_prop_keycard"
	self.pickups.hotel_room_key = {
		unit = Idstring("unit")
	}
	slot19 = "units/pd2_dlc_jolly/pickups/gen_pku_rambo/gen_pku_rambo"
	self.pickups.pku_rambo = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/equipment/equip_safe_key_chain/equip_safe_key_chain"
	self.pickups.equip_safe_key_chain = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_health_big_beam"
	self.pickups.health_big_beam = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_health_medium_beam"
	self.pickups.health_medium_beam = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_health_small_beam"
	self.pickups.health_small_beam = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_ammo_big_beam"
	self.pickups.ammo_big_beam = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_ammo_medium_beam"
	self.pickups.ammo_medium_beam = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_ammo_small_beam"
	self.pickups.ammo_small_beam = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_granade_big_beam"
	self.pickups.grenade_big_beam = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_granade_medium_beam"
	self.pickups.grenade_medium_beam = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_granade_small_beam"
	self.pickups.grenade_small_beam = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_health_big"
	self.pickups.health_big = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_health_medium"
	self.pickups.health_medium = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_health_small"
	self.pickups.health_small = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_ammo_big"
	self.pickups.ammo_big = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_ammo_medium"
	self.pickups.ammo_medium = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_ammo_small"
	self.pickups.ammo_small = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_granade_big"
	self.pickups.grenade_big = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_granade_medium"
	self.pickups.grenade_medium = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_health_ammo_granade/pku_granade_small"
	self.pickups.grenade_small = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_gold_bars/pku_gold_bar"
	self.pickups.gold_bar_small = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/pickups/pku_gold_bars/pku_gold_bars"
	self.pickups.gold_bar_medium = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/props/props_wooden_crate_01/props_wooden_crate_scrap_parts"
	self.pickups.scrap = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/props/props_enigma_machine_part/props_enigma_machine_part_01"
	self.pickups.enigma_part_01 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/props/props_enigma_machine_part/props_enigma_machine_part_02"
	self.pickups.enigma_part_02 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/props/props_enigma_machine_part/props_enigma_machine_part_03"
	self.pickups.enigma_part_03 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/props/props_enigma_machine_part/props_enigma_machine_part_04"
	self.pickups.enigma_part_04 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/props/props_enigma_machine_part/props_enigma_machine_part_05"
	self.pickups.enigma_part_05 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/equipment/equip_officer_documents/equip_officer_documents_01"
	self.pickups.officer_documents_01 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/equipment/equip_officer_documents/equip_officer_documents_02"
	self.pickups.officer_documents_02 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/equipment/equip_officer_documents/equip_officer_documents_03"
	self.pickups.officer_documents_03 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/equipment/equip_officer_documents/equip_officer_documents_04"
	self.pickups.officer_documents_04 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/equipment/equip_officer_documents/equip_officer_documents_05"
	self.pickups.officer_documents_05 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/props/props_car_keys/props_car_keys_01"
	self.pickups.car_key_01 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/props/props_car_keys/props_car_keys_02"
	self.pickups.car_key_02 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/props/props_car_keys/props_car_keys_03"
	self.pickups.car_key_03 = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/props/props_bank_door_keys_01/props_bank_door_keys_01"
	self.pickups.bank_door_key = {
		unit = Idstring("unit")
	}
	slot19 = "units/vanilla/equipment/equip_code_book/equip_code_book_active"
	slot17 = Idstring("unit")
	self.pickups.code_book = {
		unit = slot17
	}
	self.danger_zones = {
		0.6,
		0.5,
		0.35,
		0.1
	}
	self.contour = {
		character = {}
	}
	slot20 = 0.5
	self.contour.character.standard_color = Vector3(slot17, 0.1, 1)
	slot20 = 1
	self.contour.character.friendly_color = Vector3(slot17, 0.2, 0.8)
	slot20 = 0
	self.contour.character.downed_color = Vector3(slot17, 1, 0.5)
	slot20 = 0.1
	self.contour.character.dead_color = Vector3(slot17, 1, 0.1)
	slot20 = 0.2
	self.contour.character.dangerous_color = Vector3(slot17, 0.6, 0.2)
	slot20 = 0.1
	self.contour.character.more_dangerous_color = Vector3(slot17, 1, 0.1)
	self.contour.character.standard_opacity = 0
	slot20 = 0.2
	self.contour.character.ghost_warcry = Vector3(slot17, 0.6, 0.2)
	slot20 = 0
	self.contour.character.sharpshooter_warcry = Vector3(slot17, 1, 0)
	self.contour.character_interactable = {}
	slot20 = 0
	self.contour.character_interactable.standard_color = Vector3(slot17, 1, 0.5)
	slot20 = 1
	self.contour.character_interactable.selected_color = Vector3(slot17, 1, 1)
	self.contour.interactable = {}
	slot20 = 0
	self.contour.interactable.standard_color = Vector3(slot17, 1, 0.5)
	slot20 = 1
	self.contour.interactable.selected_color = Vector3(slot17, 1, 1)
	self.contour.contour_off = {}
	slot20 = 0
	self.contour.contour_off.standard_color = Vector3(slot17, 0, 0)
	slot20 = 0
	self.contour.contour_off.selected_color = Vector3(slot17, 0, 0)
	self.contour.contour_off.standard_opacity = 0
	self.contour.deployable = {}
	slot20 = 0.5
	self.contour.deployable.standard_color = Vector3(slot17, 0.1, 1)
	slot20 = 1
	self.contour.deployable.selected_color = Vector3(slot17, 1, 1)
	slot20 = 1
	self.contour.deployable.active_color = Vector3(slot17, 0.1, 0.5)
	slot20 = 0.1
	self.contour.deployable.interact_color = Vector3(slot17, 0.1, 1)
	slot20 = 0.1
	self.contour.deployable.disabled_color = Vector3(slot17, 1, 0.1)
	self.contour.upgradable = {}
	slot20 = 1
	self.contour.upgradable.standard_color = Vector3(slot17, 0.1, 0.5)
	slot20 = 1
	self.contour.upgradable.selected_color = Vector3(slot17, 1, 1)
	self.contour.pickup = {}
	slot20 = 0.5
	self.contour.pickup.standard_color = Vector3(slot17, 0.1, 1)
	slot20 = 1
	self.contour.pickup.selected_color = Vector3(slot17, 1, 1)
	self.contour.pickup.standard_opacity = 1
	self.contour.interactable_icon = {}
	slot20 = 0
	self.contour.interactable_icon.standard_color = Vector3(slot17, 0, 0)
	slot20 = 0
	self.contour.interactable_icon.selected_color = Vector3(slot17, 0, 1)
	self.contour.interactable_icon.standard_opacity = 0
	self.contour.interactable_look_at = {}
	slot20 = 0
	self.contour.interactable_look_at.standard_color = Vector3(slot17, 0, 0)
	slot20 = 1
	self.contour.interactable_look_at.selected_color = Vector3(slot17, 1, 1)
	self.music = {
		camp = {}
	}
	self.music.camp.start = "music_camp"
	self.music.flakturm = {
		start = "music_level_flakturm",
		include_in_shuffle = true
	}
	self.music.train_yard = {
		start = "music_level_trainyard",
		include_in_shuffle = true
	}
	self.music.reichsbank = {
		start = "music_level_treasury",
		include_in_shuffle = true
	}
	self.music.radio_defense = {
		start = "music_radio_defense",
		include_in_shuffle = true
	}
	self.music.ger_bridge = {
		start = "music_level_bridge",
		include_in_shuffle = true
	}
	self.music.castle = {
		start = "music_level_castle",
		include_in_shuffle = true
	}
	self.music.forest_gumpy = {
		start = "consumable_level_music_one",
		include_in_shuffle = true
	}
	slot18 = self.music.flakturm
	self.music.default = deep_clone(slot17)
	self.music.soundbank_list = {}
	self.voiceover = {
		idle_delay = 5,
		idle_rnd_delay = 60,
		idle_cooldown = 30
	}
	self.voting = {
		timeout = 30,
		cooldown = 50,
		restart_delay = 5
	}
	self.dot_types = {
		poison = {
			damage_class = "PoisonBulletBase",
			dot_damage = 2,
			dot_length = 10,
			hurt_animation_chance = 0.5
		}
	}
	slot16 = self

	self.set_mode("poison")

	if Global.game_settings and Global.game_settings.difficulty then
		slot17 = Global.game_settings.difficulty

		self.set_difficulty(slot15, self)
	end

	slot16 = self

	self.digest_tweak_data(slot15)

	return 
end
function TweakData:get_dot_type_data(type)
	return self.dot_types[type]
end
function TweakData:_execute_reload_clbks()
	if self._reload_clbks then
		slot3 = self._reload_clbks

		for key, clbk_data in pairs(slot2) do
			if clbk_data.func then
				slot8 = clbk_data.clbk_object

				clbk_data.func(slot7)
			end
		end
	end

	return 
end
function TweakData:add_reload_callback(object, func)
	self._reload_clbks = self._reload_clbks or {}
	slot6 = {
		clbk_object = object,
		func = func
	}

	table.insert(slot4, self._reload_clbks)

	return 
end
function TweakData:remove_reload_callback(object)
	if self._reload_clbks then
		slot4 = self._reload_clbks

		for i, k in ipairs(slot3) do
			if k.clbk_object == object then
				slot10 = i

				table.remove(slot8, self._reload_clbks)

				return 
			end
		end
	end

	return 
end
function TweakData:set_scale()
	slot3 = SystemInfo
	slot3 = SystemInfo.language(slot2)
	local lang_key = SystemInfo.language(slot2).key(slot2)
	local lang_mods = {}
	slot5 = "german"
	slot5 = Idstring(slot4)
	lang_mods[Idstring(slot4).key(slot4)] = {
		small = 1,
		level_up_text_kern = -1.5,
		objectives_text_kern = -1,
		sd_menu_border_multiplier = 0.9,
		kit_desc_large = 0.9,
		sd_w_interact_multiplier = 1.55,
		menu_logo_multiplier = 0.9,
		large = 0.9,
		sd_large = 0.9,
		sd_small = 0.9,
		w_interact_multiplier = 1.65,
		stats_upgrade_kern = -1
	}
	slot5 = "french"
	slot5 = Idstring()
	lang_mods[Idstring().key()] = {
		small = 1,
		sd_large = 0.9,
		level_up_text_kern = -1.5,
		sd_level_up_font_multiplier = 0.9,
		stats_upgrade_kern = -1,
		sd_w_interact_multiplier = 1.3,
		kit_desc_large = 0.9,
		subtitle_multiplier = 0.85,
		large = 0.9,
		victory_screen_kern = -0.5,
		sd_small = 0.95,
		w_interact_multiplier = 1.4,
		objectives_text_kern = -0.8
	}
	slot5 = "italian"
	slot5 = Idstring()
	lang_mods[Idstring().key()] = {
		small = 1,
		large = 1,
		sd_large = 1,
		kit_desc_large = 0.9,
		sd_small = 1,
		sd_w_interact_multiplier = 1.5,
		w_interact_multiplier = 1.35,
		objectives_text_kern = -0.8
	}
	slot5 = "spanish"
	slot5 = Idstring()
	lang_mods[Idstring().key()] = {
		level_up_text_kern = -1.5,
		victory_title_multiplier = 0.9,
		objectives_text_kern = -0.8,
		sd_level_up_font_multiplier = 0.9,
		kit_desc_large = 0.9,
		server_list_font_multiplier = 0.9,
		sd_large = 1,
		small = 1,
		objectives_desc_text_kern = 0,
		sd_menu_border_multiplier = 0.85,
		sd_w_interact_multiplier = 1.5,
		menu_logo_multiplier = 0.9,
		large = 1,
		upgrade_menu_kern = -1.25,
		sd_small = 0.9,
		w_interact_multiplier = 1.6,
		stats_upgrade_kern = -1
	}
	local lang_l_mod = (lang_mods[lang_key] and lang_mods[lang_key].large) or 1
	local lang_s_mod = (lang_mods[lang_key] and lang_mods[lang_key].small) or 1
	local lang_lsd_mod = (lang_mods[lang_key] and lang_mods[lang_key].sd_large) or 1
	local lang_ssd_mod = (lang_mods[lang_key] and lang_mods[lang_key].sd_large) or 1
	local sd_menu_border_multiplier = (lang_mods[lang_key] and lang_mods[lang_key].sd_menu_border_multiplier) or 1
	local stats_upgrade_kern = (lang_mods[lang_key] and lang_mods[lang_key].stats_upgrade_kern) or 0
	local level_up_text_kern = (lang_mods[lang_key] and lang_mods[lang_key].level_up_text_kern) or 0
	local victory_screen_kern = lang_mods[lang_key] and lang_mods[lang_key].victory_screen_kern
	local upgrade_menu_kern = lang_mods[lang_key] and lang_mods[lang_key].upgrade_menu_kern
	local mugshot_name_kern = lang_mods[lang_key] and lang_mods[lang_key].mugshot_name_kern
	local menu_logo_multiplier = (lang_mods[lang_key] and lang_mods[lang_key].menu_logo_multiplier) or 1
	local objectives_text_kern = lang_mods[lang_key] and lang_mods[lang_key].objectives_text_kern
	local objectives_desc_text_kern = lang_mods[lang_key] and lang_mods[lang_key].objectives_desc_text_kern
	local kit_desc_large = (lang_mods[lang_key] and lang_mods[lang_key].kit_desc_large) or 1
	local sd_level_up_font_multiplier = (lang_mods[lang_key] and lang_mods[lang_key].sd_level_up_font_multiplier) or 1
	local sd_w_interact_multiplier = (lang_mods[lang_key] and lang_mods[lang_key].sd_w_interact_multiplier) or 1
	local w_interact_multiplier = (lang_mods[lang_key] and lang_mods[lang_key].w_interact_multiplier) or 1
	local server_list_font_multiplier = (lang_mods[lang_key] and lang_mods[lang_key].server_list_font_multiplier) or 1
	local victory_title_multiplier = lang_mods[lang_key] and lang_mods[lang_key].victory_title_multiplier
	local subtitle_multiplier = (lang_mods[lang_key] and lang_mods[lang_key].subtitle_multiplier) or 1
	local res = RenderSettings.resolution
	self.sd_scale = {
		is_sd = true,
		title_image_multiplier = 0.6,
		menu_logo_multiplier = 0.575 * menu_logo_multiplier,
		menu_border_multiplier = 0.6 * sd_menu_border_multiplier,
		default_font_multiplier = 0.6 * lang_lsd_mod,
		small_font_multiplier = 0.8 * lang_ssd_mod,
		lobby_info_font_size_scale_multiplier = 0.65,
		lobby_name_font_size_scale_multiplier = 0.6,
		server_list_font_size_multiplier = 0.55,
		multichoice_arrow_multiplier = 0.7,
		align_line_padding_multiplier = 0.4,
		menu_arrow_padding_multiplier = 0.5,
		briefing_text_h_multiplier = 0.5,
		experience_bar_multiplier = 0.825,
		hud_equipment_icon_multiplier = 0.65,
		hud_default_font_multiplier = 0.7,
		hud_ammo_clip_multiplier = 0.75,
		hud_ammo_clip_large_multiplier = 0.5,
		hud_health_multiplier = 0.75,
		hud_mugshot_multiplier = 0.75,
		hud_assault_image_multiplier = 0.5,
		hud_crosshair_offset_multiplier = 0.75,
		hud_objectives_pad_multiplier = 0.65,
		experience_upgrade_multiplier = 0.75,
		level_up_multiplier = 0.7,
		next_upgrade_font_multiplier = 0.75,
		level_up_font_multiplier = 0.51 * sd_level_up_font_multiplier,
		present_multiplier = 0.75,
		lobby_info_offset_multiplier = 0.7,
		info_padding_multiplier = 0.4,
		loading_challenge_bar_scale = 0.8,
		button_layout_multiplier = 0.7,
		subtitle_pos_multiplier = 0.7,
		subtitle_font_multiplier = 0.65,
		subtitle_lang_multiplier = subtitle_multiplier,
		default_font_kern = 0,
		stats_upgrade_kern = stats_upgrade_kern or 0,
		level_up_text_kern = level_up_text_kern or 0,
		victory_screen_kern = victory_screen_kern or -0.5,
		upgrade_menu_kern = upgrade_menu_kern or 0,
		mugshot_name_kern = mugshot_name_kern or -1,
		objectives_text_kern = objectives_text_kern or 0,
		objectives_desc_text_kern = objectives_desc_text_kern or 0,
		kit_description_multiplier = 0.8 * lang_ssd_mod,
		chat_multiplier = 0.68,
		chat_menu_h_multiplier = 0.34,
		w_interact_multiplier = 0.8 * sd_w_interact_multiplier,
		victory_title_multiplier = (victory_title_multiplier and victory_title_multiplier * 0.95) or 1
	}
	self.scale = {
		is_sd = false,
		title_image_multiplier = 1,
		menu_logo_multiplier = 1,
		menu_border_multiplier = 1,
		default_font_multiplier = 1 * lang_l_mod,
		small_font_multiplier = 1 * lang_s_mod,
		lobby_info_font_size_scale_multiplier = 1 * lang_l_mod,
		lobby_name_font_size_scale_multiplier = 1 * lang_l_mod,
		server_list_font_size_multiplier = 1 * lang_l_mod * server_list_font_multiplier,
		multichoice_arrow_multiplier = 1,
		align_line_padding_multiplier = 1,
		menu_arrow_padding_multiplier = 1,
		briefing_text_h_multiplier = 1 * lang_s_mod,
		experience_bar_multiplier = 1,
		hud_equipment_icon_multiplier = 1,
		hud_default_font_multiplier = 1 * lang_l_mod,
		hud_ammo_clip_multiplier = 1,
		hud_health_multiplier = 1,
		hud_mugshot_multiplier = 1,
		hud_assault_image_multiplier = 1,
		hud_crosshair_offset_multiplier = 1,
		hud_objectives_pad_multiplier = 1,
		experience_upgrade_multiplier = 1,
		level_up_multiplier = 1,
		next_upgrade_font_multiplier = 1 * lang_l_mod,
		level_up_font_multiplier = 1 * lang_l_mod,
		present_multiplier = 1,
		lobby_info_offset_multiplier = 1,
		info_padding_multiplier = 1,
		loading_challenge_bar_scale = 1,
		button_layout_multiplier = 1,
		subtitle_pos_multiplier = 1,
		subtitle_font_multiplier = 1 * lang_l_mod,
		subtitle_lang_multiplier = subtitle_multiplier,
		default_font_kern = 0,
		stats_upgrade_kern = stats_upgrade_kern or 0,
		level_up_text_kern = 0,
		victory_screen_kern = victory_screen_kern or 0,
		upgrade_menu_kern = 0,
		mugshot_name_kern = 0,
		objectives_text_kern = objectives_text_kern or 0,
		objectives_desc_text_kern = objectives_desc_text_kern or 0,
		kit_description_multiplier = 1 * kit_desc_large,
		chat_multiplier = 1,
		chat_menu_h_multiplier = 1,
		w_interact_multiplier = 1 * w_interact_multiplier,
		victory_title_multiplier = victory_title_multiplier or 1
	}

	return 
end
function TweakData:set_menu_scale()
	local lang_mods_def = {}
	slot4 = "german"
	slot4 = Idstring(slot3)
	lang_mods_def[Idstring(slot3).key(slot3)] = {
		challenges_font_size = 1,
		topic_font_size = 0.8,
		upgrades_font_size = 1,
		mission_end_font_size = 1
	}
	slot4 = "french"
	slot4 = Idstring()
	lang_mods_def[Idstring().key()] = {
		challenges_font_size = 1,
		topic_font_size = 1,
		upgrades_font_size = 1,
		mission_end_font_size = 1
	}
	slot4 = "italian"
	slot4 = Idstring()
	lang_mods_def[Idstring().key()] = {
		challenges_font_size = 1,
		topic_font_size = 1,
		upgrades_font_size = 1,
		mission_end_font_size = 0.95
	}
	slot4 = "spanish"
	slot4 = Idstring()
	lang_mods_def[Idstring().key()] = {
		challenges_font_size = 0.95,
		topic_font_size = 0.95,
		upgrades_font_size = 1,
		mission_end_font_size = 1
	}
	slot4 = SystemInfo
	slot4 = SystemInfo.language()
	local lang_mods = lang_mods_def[SystemInfo.language().key()] or {
		challenges_font_size = 1,
		topic_font_size = 1,
		upgrades_font_size = 1,
		mission_end_font_size = 1
	}
	local scale_multiplier = self.scale.default_font_multiplier
	local small_scale_multiplier = self.scale.small_font_multiplier
	self.menu.default_font = "fonts/font_medium_shadow_mf"
	self.menu.default_font_no_outline = "fonts/font_medium_noshadow_mf"
	slot8 = self.menu.default_font
	self.menu.default_font_id = Idstring(slot7)
	slot8 = self.menu.default_font_no_outline
	self.menu.default_font_no_outline_id = Idstring(slot7)
	self.menu.small_font = "fonts/font_small_shadow_mf"
	self.menu.small_font_size = 14 * small_scale_multiplier
	self.menu.small_font_noshadow = "fonts/font_small_noshadow_mf"
	self.menu.medium_font = "fonts/font_medium_shadow_mf"
	self.menu.medium_font_no_outline = "fonts/font_medium_noshadow_mf"
	self.menu.meidum_font_size = 24 * scale_multiplier
	self.menu.pd2_massive_font = "fonts/font_large_mf"
	slot8 = self.menu.pd2_massive_font
	self.menu.pd2_massive_font_id = Idstring(slot7)
	self.menu.pd2_massive_font_size = 80
	self.menu.pd2_large_font = "fonts/font_large_mf"
	slot8 = self.menu.pd2_large_font
	self.menu.pd2_large_font_id = Idstring(slot7)
	self.menu.pd2_large_font_size = 44
	self.menu.pd2_medium_large_font = "fonts/font_large_mf"
	slot8 = self.menu.pd2_large_font
	self.menu.pd2_medium_large_font_id = Idstring(slot7)
	self.menu.pd2_medium_large_font_size = 30
	self.menu.pd2_medium_font = "fonts/font_medium_mf"
	slot8 = self.menu.pd2_medium_font
	self.menu.pd2_medium_font_id = Idstring(slot7)
	self.menu.pd2_medium_font_size = 24
	self.menu.pd2_small_font = "fonts/font_small_mf"
	slot8 = self.menu.pd2_small_font
	self.menu.pd2_small_font_id = Idstring(slot7)
	self.menu.pd2_small_font_size = 20
	self.menu.pd2_smaller_font = "fonts/font_smaller_mf"
	slot8 = self.menu.pd2_smaller_font
	self.menu.pd2_smaller_font_id = Idstring(slot7)
	self.menu.pd2_smaller_font_size = 10
	self.menu.default_font_size = 24 * scale_multiplier
	self.menu.default_font_row_item_color = Color.black
	self.menu.default_hightlight_row_item_color = Color.white
	slot11 = 0.396078431372549
	self.menu.default_menu_background_color = Color(slot7, 1, 0.3254901960784314, 0.37254901960784315)
	slot11 = 0
	self.menu.highlight_background_color_left = Color(slot7, 1, 1, 0.6588235294117647)
	slot11 = 0
	self.menu.highlight_background_color_right = Color(slot7, 1, 1, 0.6588235294117647)
	slot11 = 0.5
	self.menu.default_disabled_text_color = Color(slot7, 1, 0.5, 0.5)
	slot11 = 0
	self.menu.arrow_available = Color(slot7, 1, 1, 0.6588235294117647)
	slot11 = 0.5
	self.menu.arrow_unavailable = Color(slot7, 1, 0.5, 0.5)
	slot11 = 0.5
	self.menu.arrow_unavailable = Color(slot7, 1, 0.5, 0.5)
	slot10 = 0
	self.menu.upgrade_locked_color = Color(slot7, 0.75, 0)
	slot10 = 0.5
	self.menu.upgrade_not_aquired_color = Color(slot7, 0.5, 0.5)
	self.menu.awarded_challenge_color = self.menu.default_font_row_item_color
	slot11 = 0
	self.menu.raid_red = Color(slot7, 1, 0.7843137254901961, 0)
	self.menu.dialog_title_font_size = 28 * self.scale.small_font_multiplier
	self.menu.dialog_text_font_size = 24 * self.scale.small_font_multiplier
	self.menu.info_padding = 10 * self.scale.info_padding_multiplier
	self.menu.topic_font_size = 32 * scale_multiplier * lang_mods.topic_font_size
	slot11 = 0
	self.menu.main_menu_background_color = Color(lang_mods.topic_font_size, 1, 0, 0)
	self.menu.stats_font_size = 24 * scale_multiplier
	self.menu.customize_controller_size = 21 * scale_multiplier
	self.menu.server_list_font_size = 22 * self.scale.server_list_font_size_multiplier
	self.menu.challenges_font_size = 24 * scale_multiplier * lang_mods.challenges_font_size
	self.menu.upgrades_font_size = 24 * scale_multiplier * lang_mods.upgrades_font_size
	self.menu.multichoice_font_size = 24 * scale_multiplier
	self.menu.mission_end_font_size = 20 * scale_multiplier * lang_mods.mission_end_font_size
	self.menu.sd_mission_end_font_size = 14 * small_scale_multiplier * lang_mods.mission_end_font_size
	self.menu.lobby_info_font_size = 22 * self.scale.lobby_info_font_size_scale_multiplier
	self.menu.lobby_name_font_size = 22 * self.scale.lobby_name_font_size_scale_multiplier
	self.menu.loading_challenge_progress_font_size = 22 * small_scale_multiplier
	self.menu.loading_challenge_name_font_size = 22 * small_scale_multiplier
	self.menu.upper_saferect_border = 64 * self.scale.menu_border_multiplier
	self.menu.border_pad = 8 * self.scale.menu_border_multiplier
	self.menu.kit_description_font_size = 14 * self.scale.kit_description_multiplier
	self.load_level = {
		briefing_text = {
			h = 192 * self.scale.briefing_text_h_multiplier
		},
		upper_saferect_border = self.menu.upper_saferect_border,
		border_pad = self.menu.border_pad,
		stonecold_small_logo = "guis/textures/game_small_logo"
	}

	return 
end
function TweakData:set_hud_values()
	local lang_mods_def = {}
	slot4 = "german"
	slot4 = Idstring(slot3)
	lang_mods_def[Idstring(slot3).key(slot3)] = {
		active_objective_title_font_size = 0.9,
		next_player_font_size = 0.85,
		present_mid_text_font_size = 0.8,
		location_font_size = 1,
		stats_challenges_font_size = 0.7,
		hint_font_size = 0.9
	}
	slot4 = "french"
	slot4 = Idstring()
	lang_mods_def[Idstring().key()] = {
		active_objective_title_font_size = 1,
		next_player_font_size = 0.85,
		present_mid_text_font_size = 1,
		location_font_size = 1,
		stats_challenges_font_size = 1,
		hint_font_size = 0.825
	}
	slot4 = "italian"
	slot4 = Idstring()
	lang_mods_def[Idstring().key()] = {
		active_objective_title_font_size = 1,
		next_player_font_size = 0.85,
		present_mid_text_font_size = 1,
		location_font_size = 1,
		stats_challenges_font_size = 1,
		hint_font_size = 1
	}
	slot4 = "spanish"
	slot4 = Idstring()
	lang_mods_def[Idstring().key()] = {
		active_objective_title_font_size = 1,
		next_player_font_size = 0.85,
		present_mid_text_font_size = 1,
		location_font_size = 0.7,
		stats_challenges_font_size = 1,
		hint_font_size = 1
	}
	slot4 = SystemInfo
	slot4 = SystemInfo.language()
	local lang_mods = lang_mods_def[SystemInfo.language().key()] or {
		active_objective_title_font_size = 1,
		next_player_font_size = 1,
		present_mid_text_font_size = 1,
		location_font_size = 1,
		stats_challenges_font_size = 1,
		hint_font_size = 1
	}
	self.hud.large_font = "fonts/font_large"
	self.hud.medium_kern = 1.7
	self.hud.medium_font = "fonts/font_medium_mf"
	self.hud.medium_font_noshadow = "fonts/font_medium_mf"
	self.hud.small_font = "fonts/font_small_mf"
	self.hud.font_pf_handbook_small_shadow = "fonts/pf_handbook_small_shadow"
	self.hud.font_pf_handbook_medium_shadow = "fonts/pf_handbook_medium_shadow"
	self.hud.font_stratum_medium = "fonts/stratum_medium"
	self.hud.font_pf_fuel_pro_32 = "fonts/pf_fuel_pro_32"
	self.hud.font_pf_fuel_pro_64 = "fonts/pf_fuel_pro_64"
	self.hud.font_pf_fuel_pro_32_shadow = "fonts/pf_fuel_pro_32_shadow"
	self.hud.small_font_size = 14 * self.scale.small_font_multiplier
	self.hud.location_font_size = 28 * self.scale.hud_default_font_multiplier * lang_mods.location_font_size
	self.hud.assault_title_font_size = 30 * self.scale.hud_default_font_multiplier
	self.hud.default_font_size = 32 * self.scale.hud_default_font_multiplier
	self.hud.present_mid_text_font_size = 32 * self.scale.hud_default_font_multiplier * lang_mods.present_mid_text_font_size
	self.hud.timer_font_size = 40 * self.scale.hud_default_font_multiplier
	self.hud.medium_deafult_font_size = 28 * self.scale.hud_default_font_multiplier
	self.hud.ammo_font_size = 30 * self.scale.hud_default_font_multiplier
	self.hud.weapon_ammo_font_size = 24 * self.scale.hud_default_font_multiplier
	self.hud.name_label_font_size = 24 * self.scale.hud_default_font_multiplier
	self.hud.small_name_label_font_size = 17 * self.scale.hud_default_font_multiplier
	self.hud.equipment_font_size = 24 * self.scale.hud_default_font_multiplier
	self.hud.hint_font_size = 28 * self.scale.hud_default_font_multiplier * lang_mods.hint_font_size
	self.hud.active_objective_title_font_size = 24 * self.scale.hud_default_font_multiplier * lang_mods.active_objective_title_font_size
	self.hud.completed_objective_title_font_size = 20 * self.scale.hud_default_font_multiplier
	self.hud.upgrade_awarded_font_size = 26 * self.scale.hud_default_font_multiplier
	self.hud.next_upgrade_font_size = 14 * self.scale.next_upgrade_font_multiplier
	self.hud.level_up_font_size = 32 * self.scale.level_up_font_multiplier
	self.hud.next_player_font_size = 24 * self.scale.hud_default_font_multiplier * lang_mods.next_player_font_size
	self.hud.stats_challenges_font_size = 32 * self.scale.hud_default_font_multiplier * lang_mods.stats_challenges_font_size
	self.hud.chatinput_size = 22 * self.scale.hud_default_font_multiplier
	self.hud.chatoutput_size = 14 * self.scale.small_font_multiplier
	slot9 = 0
	self.hud.prime_color = Color(lang_mods.stats_challenges_font_size, 1, 1, 0.6588235294117647)
	slot9 = 0
	self.hud.suspicion_color = Color(lang_mods.stats_challenges_font_size, 1, 0.7137254901960784, 0)
	slot9 = 0
	self.hud.detected_color = Color(lang_mods.stats_challenges_font_size, 1, 0.7137254901960784, 0)
	slot8 = 0
	self.hud.accent_orange = Color(lang_mods.stats_challenges_font_size, 0.7843137254901961, 0.5098039215686274)
	self.menu.default_changeable_text_color = self.hud.accent_orange

	return 
end
function TweakData:resolution_changed()
	slot3 = self

	self.set_scale(slot2)

	slot3 = self

	self.set_menu_scale(slot2)

	slot3 = self

	self.set_hud_values(slot2)

	return 
end

if (not tweak_data or tweak_data.RELOAD) and managers.dlc then
	local reload = tweak_data and tweak_data.RELOAD
	local reload_clbks = tweak_data and tweak_data._reload_clbks
	slot4 = TweakData
	tweak_data = TweakData.new(slot3)
	tweak_data._reload_clbks = reload_clbks

	if reload then
		slot4 = tweak_data

		tweak_data._execute_reload_clbks(slot3)
	end
end

function TweakData:get_controller_help_coords()

	-- Decompilation error in this vicinity:
	slot3 = managers.controller
	local coords = {
		normal = {},
		vehicle = {}
	}
	slot5 = "PS3"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		coords.normal.left_thumb = {
			vertical = "top",
			y = 255,
			id = "menu_button_sprint",
			align = "right",
			x = 195
		}
		coords.normal.left = {
			vertical = "top",
			y = 280,
			id = "menu_button_move",
			align = "right",
			x = 195
		}
		coords.normal.right_thumb = {
			vertical = "top",
			y = 255,
			id = "menu_button_melee",
			align = "left",
			x = 319
		}
		coords.normal.right = {
			vertical = "top",
			y = 280,
			id = "menu_button_look",
			align = "left",
			x = 319
		}
		coords.normal.triangle = {
			id = "menu_button_switch_weapon",
			align = "left",
			x = 511,
			y = 112
		}
		coords.normal.square = {
			id = "menu_button_reload",
			align = "left",
			x = 511,
			y = 214
		}
		coords.normal.circle = {
			id = "menu_button_crouch",
			align = "left",
			x = 511,
			y = 146
		}
		coords.normal.cross = {
			id = "menu_button_jump",
			align = "left",
			x = 511,
			y = 178
		}
		coords.normal.r2_trigger = {
			id = "menu_button_shout",
			align = "left",
			x = 511,
			y = 8
		}
		coords.normal.r1_trigger = {
			id = "menu_button_fire_weapon",
			align = "left",
			x = 511,
			y = 36
		}
		coords.normal.l2_trigger = {
			id = "menu_button_deploy",
			align = "right",
			x = 0,
			y = 8
		}
		coords.normal.l1_trigger = {
			id = "menu_button_aim_down_sight",
			align = "right",
			x = 0,
			y = 36
		}
		coords.normal.start = {
			vertical = "bottom",
			y = 0,
			id = "menu_button_ingame_menu",
			align = "left",
			x = 280
		}
		coords.normal.back = {
			vertical = "bottom",
			y = 0,
			id = "menu_button_stats_screen",
			align = "right",
			x = 230
		}
		coords.normal.d_down = {
			vertical = "center",
			y = 171,
			id = "menu_button_weapon_gadget_bipod",
			align = "right",
			x = 0
		}
		coords.normal.d_left = {
			vertical = "center",
			y = 145,
			id = "menu_button_throw_grenade",
			align = "right",
			x = 0
		}
		coords.normal.d_right = {
			vertical = "center",
			y = 87,
			id = "menu_button_weapon_firemode",
			align = "right",
			x = 0
		}
		coords.vehicle.left_thumb = {
			vertical = "top",
			y = 255,
			id = "menu_button_unassigned",
			align = "right",
			x = 195
		}
		coords.vehicle.left = {
			vertical = "top",
			y = 280,
			id = "menu_button_steering",
			align = "right",
			x = 195
		}
		coords.vehicle.right_thumb = {
			vertical = "top",
			y = 255,
			id = "menu_button_vehicle_rear_camera",
			align = "left",
			x = 319
		}
		coords.vehicle.right = {
			vertical = "top",
			y = 280,
			id = "menu_button_unassigned",
			align = "left",
			x = 319
		}
		coords.vehicle.triangle = {
			id = "menu_button_unassigned",
			align = "left",
			x = 511,
			y = 112
		}
		coords.vehicle.square = {
			id = "menu_button_vehicle_change_camera",
			align = "left",
			x = 511,
			y = 214
		}
		coords.vehicle.circle = {
			id = "menu_button_vehicle_shooting_stance",
			align = "left",
			x = 511,
			y = 146
		}
		coords.vehicle.cross = {
			id = "menu_button_handbrake",
			align = "left",
			x = 511,
			y = 178
		}
		coords.vehicle.r2_trigger = {
			id = "menu_button_unassigned",
			align = "left",
			x = 511,
			y = 8
		}
		coords.vehicle.r1_trigger = {
			id = "menu_button_accelerate",
			align = "left",
			x = 511,
			y = 36
		}
		coords.vehicle.l2_trigger = {
			id = "menu_button_unassigned",
			align = "right",
			x = 0,
			y = 8
		}
		coords.vehicle.l1_trigger = {
			id = "menu_button_brake",
			align = "right",
			x = 0,
			y = 36
		}
		coords.vehicle.start = {
			vertical = "bottom",
			y = 0,
			id = "menu_button_ingame_menu",
			align = "left",
			x = 280
		}
		coords.vehicle.back = {
			vertical = "bottom",
			y = 0,
			id = "menu_button_stats_screen",
			align = "right",
			x = 230
		}
		coords.vehicle.d_down = {
			vertical = "center",
			y = 171,
			id = "menu_button_unassigned",
			align = "right",
			x = 0
		}
		coords.vehicle.d_left = {
			vertical = "center",
			y = 145,
			id = "menu_button_unassigned",
			align = "right",
			x = 0
		}
		coords.vehicle.d_right = {
			vertical = "center",
			y = 87,
			id = "menu_button_unassigned",
			align = "right",
			x = 0
		}
	else
		slot5 = "PS4"

		if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
			coords.normal.left_thumb = {
				vertical = "top",
				y = 255,
				id = "menu_button_sprint",
				align = "right",
				x = 199
			}
			coords.normal.left = {
				vertical = "top",
				y = 280,
				id = "menu_button_move",
				align = "right",
				x = 199
			}
			coords.normal.right_thumb = {
				vertical = "top",
				y = 255,
				id = "menu_button_melee",
				align = "left",
				x = 313
			}
			coords.normal.right = {
				vertical = "top",
				y = 280,
				id = "menu_button_look",
				align = "left",
				x = 313
			}
			coords.normal.triangle = {
				id = "menu_button_switch_weapon",
				align = "left",
				x = 511,
				y = 104
			}
			coords.normal.circle = {
				id = "menu_button_crouch",
				align = "left",
				x = 511,
				y = 128
			}
			coords.normal.cross = {
				id = "menu_button_jump",
				align = "left",
				x = 511,
				y = 153
			}
			coords.normal.square = {
				id = "menu_button_reload",
				align = "left",
				x = 511,
				y = 181
			}
			coords.normal.r1_trigger = {
				id = "menu_button_fire_weapon",
				align = "left",
				x = 511,
				y = 10
			}
			coords.normal.r2_trigger = {
				id = "menu_button_shout",
				align = "left",
				x = 511,
				y = 55
			}
			coords.normal.l1_trigger = {
				id = "menu_button_aim_down_sight",
				align = "right",
				x = 0,
				y = 10
			}
			coords.normal.l2_trigger = {
				id = "menu_button_deploy",
				align = "right",
				x = 0,
				y = 55
			}
			coords.normal.start = {
				vertical = "bottom",
				y = 0,
				id = "menu_button_ingame_menu",
				align = "right",
				x = 219
			}
			coords.normal.back = {
				vertical = "bottom",
				y = 0,
				id = "menu_button_stats_screen",
				align = "left",
				x = 328
			}
			coords.normal.d_left = {
				vertical = "center",
				y = 128,
				id = "menu_button_throw_grenade",
				align = "right",
				x = 0
			}
			coords.normal.d_down = {
				vertical = "center",
				y = 153,
				id = "menu_button_weapon_gadget_bipod",
				align = "right",
				x = 0
			}
			coords.normal.d_right = {
				vertical = "center",
				y = 181,
				id = "menu_button_weapon_firemode",
				align = "right",
				x = 0
			}
			coords.vehicle.left_thumb = {
				vertical = "top",
				y = 255,
				id = "menu_button_unassigned",
				align = "right",
				x = 199
			}
			coords.vehicle.left = {
				vertical = "top",
				y = 280,
				id = "menu_button_steering",
				align = "right",
				x = 199
			}
			coords.vehicle.right_thumb = {
				vertical = "top",
				y = 255,
				id = "menu_button_vehicle_rear_camera",
				align = "left",
				x = 313
			}
			coords.vehicle.right = {
				vertical = "top",
				y = 280,
				id = "menu_button_unassigned",
				align = "left",
				x = 313
			}
			coords.vehicle.triangle = {
				id = "menu_button_unassigned",
				align = "left",
				x = 511,
				y = 104
			}
			coords.vehicle.circle = {
				id = "menu_button_vehicle_shooting_stance",
				align = "left",
				x = 511,
				y = 128
			}
			coords.vehicle.cross = {
				id = "menu_button_handbrake",
				align = "left",
				x = 511,
				y = 153
			}
			coords.vehicle.square = {
				id = "menu_button_vehicle_change_camera",
				align = "left",
				x = 511,
				y = 181
			}
			coords.vehicle.r1_trigger = {
				id = "menu_button_accelerate",
				align = "left",
				x = 511,
				y = 10
			}
			coords.vehicle.r2_trigger = {
				id = "menu_button_unassigned",
				align = "left",
				x = 511,
				y = 55
			}
			coords.vehicle.l1_trigger = {
				id = "menu_button_brake",
				align = "right",
				x = 0,
				y = 10
			}
			coords.vehicle.l2_trigger = {
				id = "menu_button_unassigned",
				align = "right",
				x = 0,
				y = 55
			}
			coords.vehicle.start = {
				vertical = "bottom",
				y = 0,
				id = "menu_button_ingame_menu",
				align = "right",
				x = 219
			}
			coords.vehicle.back = {
				vertical = "bottom",
				y = 0,
				id = "menu_button_stats_screen",
				align = "left",
				x = 328
			}
			coords.vehicle.d_left = {
				vertical = "center",
				y = 128,
				id = "menu_button_unassigned",
				align = "right",
				x = 0
			}
			coords.vehicle.d_down = {
				vertical = "center",
				y = 153,
				id = "menu_button_unassigned",
				align = "right",
				x = 0
			}
			coords.vehicle.d_right = {
				vertical = "center",
				y = 181,
				id = "menu_button_unassigned",
				align = "right",
				x = 0
			}
		else
			slot5 = "XB1"

			if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
				coords.normal.left_thumb = {
					vertical = "bottom",
					y = 78,
					id = "menu_button_sprint",
					align = "right",
					x = 0
				}
				coords.normal.left = {
					vertical = "top",
					y = 78,
					id = "menu_button_move",
					align = "right",
					x = 0
				}
				coords.normal.right_thumb = {
					vertical = "top",
					y = 276,
					id = "menu_button_melee",
					align = "center",
					x = 302
				}
				coords.normal.right = {
					vertical = "top",
					y = 301,
					id = "menu_button_look",
					align = "center",
					x = 302
				}
				coords.normal.y = {
					id = "menu_button_switch_weapon",
					align = "left",
					x = 512,
					y = 57
				}
				coords.normal.x = {
					id = "menu_button_reload",
					align = "left",
					x = 512,
					y = 140
				}
				coords.normal.b = {
					id = "menu_button_crouch",
					align = "left",
					x = 512,
					y = 85
				}
				coords.normal.a = {
					id = "menu_button_jump",
					align = "left",
					x = 512,
					y = 113
				}
				coords.normal.right_shoulder = {
					id = "menu_button_shout",
					align = "center",
					x = 390,
					y = -10
				}
				coords.normal.right_trigger = {
					id = "menu_button_fire_weapon",
					align = "left",
					x = 512,
					y = 18
				}
				coords.normal.left_shoulder = {
					id = "menu_button_deploy",
					align = "right",
					x = 180,
					y = -10
				}
				coords.normal.left_trigger = {
					id = "menu_button_aim_down_sight",
					align = "right",
					x = 0,
					y = 18
				}
				coords.normal.start = {
					vertical = "bottom",
					y = -25,
					id = "menu_button_ingame_menu",
					align = "left",
					x = 288
				}
				coords.normal.back = {
					vertical = "bottom",
					y = -25,
					id = "menu_button_stats_screen",
					align = "right",
					x = 235
				}
				coords.normal.d_down = {
					vertical = "center",
					y = 193,
					id = "menu_button_weapon_gadget_bipod",
					align = "right",
					x = 0
				}
				coords.normal.d_left = {
					vertical = "center",
					y = 158,
					id = "menu_button_throw_grenade",
					align = "right",
					x = 0
				}
				coords.normal.d_right = {
					vertical = "center",
					y = 266,
					id = "menu_button_weapon_firemode",
					align = "right",
					x = 270
				}
				coords.vehicle.left_thumb = {
					vertical = "bottom",
					y = 78,
					id = "menu_button_unassigned",
					align = "right",
					x = 0
				}
				coords.vehicle.left = {
					vertical = "top",
					y = 78,
					id = "menu_button_steering",
					align = "right",
					x = 0
				}
				coords.vehicle.right_thumb = {
					vertical = "top",
					y = 276,
					id = "menu_button_vehicle_rear_camera",
					align = "center",
					x = 302
				}
				coords.vehicle.right = {
					vertical = "top",
					y = 301,
					id = "menu_button_unassigned",
					align = "center",
					x = 302
				}
				coords.vehicle.y = {
					id = "menu_button_unassigned",
					align = "left",
					x = 512,
					y = 57
				}
				coords.vehicle.x = {
					id = "menu_button_vehicle_change_camera",
					align = "left",
					x = 512,
					y = 140
				}
				coords.vehicle.b = {
					id = "menu_button_vehicle_shooting_stance",
					align = "left",
					x = 512,
					y = 85
				}
				coords.vehicle.a = {
					id = "menu_button_handbrake",
					align = "left",
					x = 512,
					y = 113
				}
				coords.vehicle.right_shoulder = {
					id = "menu_button_unassigned",
					align = "center",
					x = 390,
					y = -10
				}
				coords.vehicle.right_trigger = {
					id = "menu_button_accelerate",
					align = "left",
					x = 512,
					y = 18
				}
				coords.vehicle.left_shoulder = {
					id = "menu_button_unassigned",
					align = "right",
					x = 180,
					y = -10
				}
				coords.vehicle.left_trigger = {
					id = "menu_button_brake",
					align = "right",
					x = 0,
					y = 18
				}
				coords.vehicle.start = {
					vertical = "bottom",
					y = -25,
					id = "menu_button_ingame_menu",
					align = "left",
					x = 288
				}
				coords.vehicle.back = {
					vertical = "bottom",
					y = -25,
					id = "menu_button_stats_screen",
					align = "right",
					x = 235
				}
				coords.vehicle.d_down = {
					vertical = "center",
					y = 193,
					id = "menu_button_unassigned",
					align = "right",
					x = 0
				}
				coords.vehicle.d_left = {
					vertical = "center",
					y = 158,
					id = "menu_button_unassigned",
					align = "right",
					x = 0
				}
				coords.vehicle.d_right = {
					vertical = "center",
					y = 266,
					id = "menu_button_unassigned",
					align = "right",
					x = 270
				}
			else
				coords.normal.left_thumb = {
					vertical = "bottom",
					y = 138,
					id = "menu_button_sprint",
					align = "right",
					x = 0
				}
				coords.normal.left = {
					vertical = "top",
					y = 138,
					id = "menu_button_move",
					align = "right",
					x = 0
				}
				coords.normal.right_thumb = {
					vertical = "top",
					y = 256,
					id = "menu_button_melee",
					align = "left",
					x = 302
				}
				coords.normal.right = {
					vertical = "top",
					y = 281,
					id = "menu_button_look",
					align = "left",
					x = 302
				}
				coords.normal.y = {
					id = "menu_button_switch_weapon",
					align = "left",
					x = 512,
					y = 97
				}
				coords.normal.x = {
					id = "menu_button_reload",
					align = "left",
					x = 512,
					y = 180
				}
				coords.normal.b = {
					id = "menu_button_crouch",
					align = "left",
					x = 512,
					y = 125
				}
				coords.normal.a = {
					id = "menu_button_jump",
					align = "left",
					x = 512,
					y = 153
				}
				coords.normal.right_shoulder = {
					id = "menu_button_shout",
					align = "left",
					x = 512,
					y = 49
				}
				coords.normal.right_trigger = {
					id = "menu_button_fire_weapon",
					align = "left",
					x = 512,
					y = 19
				}
				coords.normal.left_shoulder = {
					id = "menu_button_deploy",
					align = "right",
					x = 0,
					y = 49
				}
				coords.normal.left_trigger = {
					id = "menu_button_aim_down_sight",
					align = "right",
					x = 0,
					y = 19
				}
				coords.normal.start = {
					vertical = "bottom",
					y = 0,
					id = "menu_button_ingame_menu",
					align = "left",
					x = 288
				}
				coords.normal.back = {
					vertical = "bottom",
					y = 0,
					id = "menu_button_stats_screen",
					align = "right",
					x = 223
				}
				coords.normal.d_down = {
					vertical = "center",
					y = 243,
					id = "menu_button_weapon_gadget_bipod",
					align = "right",
					x = 0
				}
				coords.normal.d_left = {
					vertical = "center",
					y = 208,
					id = "menu_button_throw_grenade",
					align = "right",
					x = 0
				}
				coords.normal.d_right = {
					vertical = "top",
					y = 256,
					id = "menu_button_weapon_firemode",
					align = "right",
					x = 226
				}
				slot5 = "WIN32"

				if SystemInfo.platform() == Idstring(SystemInfo) then
					coords.normal.d_up = {
						vertical = "center",
						y = 174,
						id = "menu_button_push_to_talk",
						align = "right",
						x = 0
					}
				end

				coords.vehicle.left_thumb = {
					vertical = "bottom",
					y = 138,
					id = "menu_button_unassigned",
					align = "right",
					x = 0
				}
				coords.vehicle.left = {
					vertical = "top",
					y = 138,
					id = "menu_button_steering",
					align = "right",
					x = 0
				}
				coords.vehicle.right_thumb = {
					vertical = "top",
					y = 256,
					id = "menu_button_vehicle_rear_camera",
					align = "left",
					x = 302
				}
				coords.vehicle.right = {
					vertical = "top",
					y = 281,
					id = "menu_button_unassigned",
					align = "left",
					x = 302
				}
				coords.vehicle.y = {
					id = "menu_button_unassigned",
					align = "left",
					x = 512,
					y = 97
				}
				coords.vehicle.x = {
					id = "menu_button_vehicle_change_camera",
					align = "left",
					x = 512,
					y = 180
				}
				coords.vehicle.b = {
					id = "menu_button_vehicle_shooting_stance",
					align = "left",
					x = 512,
					y = 125
				}
				coords.vehicle.a = {
					id = "menu_button_handbrake",
					align = "left",
					x = 512,
					y = 153
				}
				coords.vehicle.right_shoulder = {
					id = "menu_button_unassigned",
					align = "left",
					x = 512,
					y = 49
				}
				coords.vehicle.right_trigger = {
					id = "menu_button_accelerate",
					align = "left",
					x = 512,
					y = 19
				}
				coords.vehicle.left_shoulder = {
					id = "menu_button_unassigned",
					align = "right",
					x = 0,
					y = 49
				}
				coords.vehicle.left_trigger = {
					id = "menu_button_brake",
					align = "right",
					x = 0,
					y = 19
				}
				coords.vehicle.start = {
					vertical = "bottom",
					y = 0,
					id = "menu_button_ingame_menu",
					align = "left",
					x = 288
				}
				coords.vehicle.back = {
					vertical = "bottom",
					y = 0,
					id = "menu_button_stats_screen",
					align = "right",
					x = 223
				}
				coords.vehicle.d_down = {
					vertical = "center",
					y = 243,
					id = "menu_button_unassigned",
					align = "right",
					x = 0
				}
				coords.vehicle.d_left = {
					vertical = "center",
					y = 208,
					id = "menu_button_unassigned",
					align = "right",
					x = 0
				}
				coords.vehicle.d_right = {
					vertical = "top",
					y = 256,
					id = "menu_button_unassigned",
					align = "right",
					x = 226
				}
				slot5 = "WIN32"

				if SystemInfo.platform() == Idstring(SystemInfo) then
					coords.vehicle.d_up = {
						vertical = "center",
						y = 174,
						id = "menu_button_unassigned",
						align = "right",
						x = 0
					}
				end
			end
		end
	end

	if managers.user then
		slot5 = "southpaw"

		if managers.user.get_setting(slot3, managers.user) then
			local tmp = coords.normal.menu_button_move
			coords.normal.menu_button_move = coords.normal.menu_button_look
			coords.normal.menu_button_look = tmp
		end
	end

	return coords
end

return 
