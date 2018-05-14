-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
RaidExperienceManager = RaidExperienceManager or class()
slot5 = true
RaidExperienceManager.LEVEL_CAP = Application.digest_value(slot2, Application, 40)
RaidExperienceManager.THOUSAND_SEPARATOR = "."
RaidExperienceManager.VERSION = 87
RaidExperienceManager.XP_MIGRATION_VERSION_LIST = {
	85,
	86
}
RaidExperienceManager.SCRIPT_XP_EVENT_STEALTH = "stealth_bonus"
function RaidExperienceManager:init()
	slot3 = self

	self._setup(slot2)

	return 
end
function RaidExperienceManager:xp_migration_needed(version)
	for i = 1, #RaidExperienceManager.XP_MIGRATION_VERSION_LIST, 1 do
		if RaidExperienceManager.XP_MIGRATION_VERSION_LIST[i] == version then
			return true
		end
	end

	return false
end
function RaidExperienceManager:_setup()
	self._total_levels = #tweak_data.experience_manager.levels

	if not Global.experience_manager then
		Global.experience_manager = {}
		slot6 = true
		Global.experience_manager.total = Application.digest_value(slot3, Application, 0)
		slot6 = true
		Global.experience_manager.level = Application.digest_value(slot3, Application, 1)
		Global.experience_manager.total_xp_for_level = {}
		local total_xp = 0
		slot7 = false

		for i_level = 1, Application.digest_value(Application, Application, RaidExperienceManager.LEVEL_CAP), 1 do
			slot12 = "points"
			total_xp = total_xp + tweak_data.get_value(slot7, tweak_data, "experience_manager", "levels", i_level)
			slot8 = Global.experience_manager.total_xp_for_level
			slot13 = true

			table.insert(slot7, Application.digest_value("levels", Application, total_xp))
		end
	end

	self._global = Global.experience_manager

	if not self._global.next_level_data then
		slot4 = 2

		self._set_next_level_data(slot2, self)
	end

	self._global.mission_xp = {}

	return 
end
function RaidExperienceManager:get_script_xp_events()
	local events = {}
	slot5 = RaidExperienceManager.SCRIPT_XP_EVENT_STEALTH

	table.insert(slot3, events)

	return events
end
function RaidExperienceManager:_set_next_level_data(level)
	if self._total_levels < level then
		slot4 = "Reached the level cap"

		print(slot3)

		return 
	end

	local level_data = tweak_data.experience_manager.levels[level]
	self._global.next_level_data = {}
	slot6 = level_data.points

	self._set_next_level_data_points(, self)

	slot6 = 0

	self._set_next_level_data_current_points(, self)

	return 
end
function RaidExperienceManager:get_total_xp_for_level(level)
	if not level or level < 1 then
		slot6 = level

		Application.error(slot3, Application, "[RaidExperienceManager:get_total_xp_for_level] level passed in is below 1: ")

		level = 1
	else
		slot6 = false

		if Application.digest_value(slot3, Application, RaidExperienceManager.LEVEL_CAP) < level then
			slot6 = level

			Application.error(slot3, Application, "[RaidExperienceManager:get_total_xp_for_level] level passed in is above max: ")

			slot6 = false
			level = Application.digest_value(slot3, Application, RaidExperienceManager.LEVEL_CAP)
		end
	end

	slot6 = false
	local xp = Application.digest_value(slot3, Application, Global.experience_manager.total_xp_for_level[level])

	return xp
end
function RaidExperienceManager:next_level_data_points()
end
function RaidExperienceManager:_set_next_level_data_points(value)
	self._global.next_level_data.points = value

	return 
end
function RaidExperienceManager:next_level_data_current_points()
end
function RaidExperienceManager:_set_next_level_data_current_points(value)
	slot7 = true
	self._global.next_level_data.current_points = Application.digest_value(slot4, Application, value)

	return 
end
function RaidExperienceManager:next_level_data()
	slot4 = self
	slot4 = self

	return {
		points = self.next_level_data_points(slot3),
		current_points = self.next_level_data_current_points(slot3)
	}
end
function RaidExperienceManager:debug_add_points(points)
	slot6 = true

	self.add_points(slot3, self, points)

	return 
end
function RaidExperienceManager:mission_xp_award(event)
	slot5 = event

	table.insert(slot3, self._global.mission_xp)

	return 
end
function RaidExperienceManager:clear_mission_xp()
	self._global.mission_xp = {}

	return 
end
function RaidExperienceManager:add_loot_redeemed_xp(xp)

	-- Decompilation error in this vicinity:
	if not self._loot_redeemed_xp then
		self._loot_redeemed_xp = 0
	end

	self._loot_redeemed_xp = self._loot_redeemed_xp + xp

	return 
end
function RaidExperienceManager:clear_loot_redeemed_xp()
	self._loot_redeemed_xp = nil

	return 
end
function RaidExperienceManager:set_loot_bonus_xp(amount)
	self._loot_bonus_xp = amount

	return 
end
function RaidExperienceManager:clear_loot_bonus_xp()
	self._loot_bonus_xp = nil

	return 
end
function RaidExperienceManager:calculate_exp_brakedown(mission_id, operation_id, success)
	local exp_table = {
		additive = {},
		multiplicative = {}
	}
	local base_id = operation_id or mission_id
	local event_additive = {
		id = "xp_additive_event"
	}

	if operation_id then
		slot11 = game_state_machine
		slot11 = game_state_machine.current_state(game_state_machine)
		slot10 = mission_id
		slot10 = game_state_machine.current_state(game_state_machine.current_state(game_state_machine).job_data(game_state_machine).events_index)

		if table.index_of(slot8, game_state_machine.current_state(game_state_machine).job_data(game_state_machine).events_index) == #game_state_machine.current_state(game_state_machine.current_state(game_state_machine).job_data(game_state_machine).events_index).job_data(game_state_machine.current_state(game_state_machine).job_data(game_state_machine).events_index).events_index then
			local operation_additive = {
				id = "xp_additive_operation",
				amount = tweak_data.operations.missions[operation_id].xp
			}
			slot11 = operation_additive

			table.insert(slot9, exp_table.additive)
		end

		event_additive.amount = tweak_data.operations.missions[operation_id].events[mission_id].xp
	else
		event_additive.amount = tweak_data.operations.missions[mission_id].xp
	end

	slot10 = event_additive

	table.insert(slot8, exp_table.additive)

	if self._loot_bonus_xp then
		local bonus_xp_additive = {
			id = "menu_loot_screen_bonus_xp_points",
			amount = self._loot_bonus_xp
		}
		slot11 = bonus_xp_additive

		table.insert(slot9, exp_table.additive)

		slot10 = self

		self.clear_loot_bonus_xp(slot9)
	end

	local card_additive = {
		id = "xp_additive_card"
	}
	slot10 = game_state_machine
	slot10 = game_state_machine.current_state(slot9)
	card_additive.amount = game_state_machine.current_state(slot9).card_bonus_xp(slot9)
	slot11 = card_additive

	table.insert(slot9, exp_table.additive)

	if self._loot_redeemed_xp then
		local loot_redeemed = {
			id = "xp_additive_loot_redeemed",
			amount = self._loot_redeemed_xp
		}
		slot12 = loot_redeemed

		table.insert(slot10, exp_table.additive)
	end

	if not success then
		local event_fail_multiplicative = {
			id = "xp_multiplicative_event_fail"
		}
		slot13 = "level_failed_multiplier"
		event_fail_multiplicative.amount = tweak_data.get_value(slot10, tweak_data, "experience_manager") - 1
		slot12 = event_fail_multiplicative

		table.insert(slot10, exp_table.multiplicative)
	end

	if tweak_data.operations.missions[base_id].stealth_bonus then
		slot11 = RaidExperienceManager.SCRIPT_XP_EVENT_STEALTH

		if table.contains(slot9, self._global.mission_xp) then
			local stealth_multiplicative = {
				id = "xp_multiplicative_stealth",
				amount = tweak_data.operations.missions[base_id].stealth_bonus - 1
			}
			slot12 = stealth_multiplicative

			table.insert(slot10, exp_table.multiplicative)
		end
	end

	local card_multiplicative = {
		id = "xp_multiplicative_card"
	}
	slot11 = game_state_machine
	slot11 = game_state_machine.current_state(slot10)
	card_multiplicative.amount = game_state_machine.current_state(slot10).card_xp_multiplier(slot10) - 1

	table.insert(slot10, exp_table.multiplicative)

	local num_players_multiplicative = {
		id = "xp_multiplicative_num_players"
	}
	slot14 = "human_player_multiplier"
	num_players_multiplicative.amount = tweak_data.get_value(exp_table.multiplicative, tweak_data, "experience_manager", managers.criminals.get_num_player_criminals(slot16)) - 1
	slot13 = num_players_multiplicative

	table.insert(exp_table.multiplicative, exp_table.multiplicative)

	local difficulty_multiplicative = {
		id = "xp_multiplicative_difficulty"
	}
	slot15 = "difficulty_multiplier"
	slot19 = game_state_machine._current_state._difficulty or Global.game_settings.difficulty
	difficulty_multiplicative.amount = tweak_data.get_value(card_multiplicative, tweak_data, "experience_manager", tweak_data.difficulty_to_index(managers.criminals, tweak_data)) - 1
	slot14 = difficulty_multiplicative

	table.insert(card_multiplicative, exp_table.multiplicative)

	local level_difference_multiplicative = {
		id = "xp_multiplicative_level_difference"
	}
	slot19 = "level_diff_max_multiplier"
	slot19 = self
	level_difference_multiplicative.amount = math.lerp(exp_table.multiplicative, 1, tweak_data.get_value(self.player_level_difference(tweak_data) / (self.level_cap(self) - 1), tweak_data, "experience_manager")) - 1
	slot15 = level_difference_multiplicative

	table.insert(exp_table.multiplicative, exp_table.multiplicative)

	return exp_table
end
function RaidExperienceManager:player_level_difference()
	slot3 = self
	local my_level = self.current_level(slot2)
	local min_level = my_level
	local max_level = my_level
	slot8 = managers.network
	slot8 = managers.network.session(slot7)

	for _, peer in pairs(managers.network.session(slot7).peers(slot7)) do
		slot11 = peer
		local level = peer.level(slot10)

		if level < min_level then
			min_level = level
		elseif max_level < level then
			max_level = level
		end
	end

	return max_level - min_level
end
function RaidExperienceManager:on_loot_drop_xp(value_id)
	slot7 = value_id
	local amount = tweak_data.get_value(slot3, tweak_data, "experience_manager", "loot_drop_value") or 0
	slot7 = false

	self.add_points(slot4, self, amount)

	return 
end
function RaidExperienceManager:add_points(points, is_debug)
	if not is_debug then
		slot5 = managers.platform

		if managers.platform.presence(slot4) ~= "Playing" then
			slot5 = managers.platform

			if managers.platform.presence(slot4) ~= "Mission_end" then
				return 
			end
		end
	end

	if points <= 0 then
		return 
	end

	slot5 = managers.dlc

	if not managers.dlc.has_full_game(slot4) then
		slot5 = self

		if 10 <= self.current_level(slot4) then
			slot8 = self
			slot6 = self.total(slot7) + points

			self._set_total(slot4, self)

			slot6 = 0

			self._set_next_level_data_current_points(slot4, self)

			slot6 = points

			managers.statistics.aquired_money(slot4, managers.statistics)

			return points
		end
	end

	slot6 = self

	if self.level_cap(self) <= self.current_level(slot4) then
		slot8 = self
		slot6 = self.total(slot7) + points

		self._set_total(slot4, self)

		return points
	end

	slot6 = self
	local points_left = self.next_level_data_points(slot4) - self.next_level_data_current_points(self)

	if points < points_left then
		slot9 = self
		slot7 = self.total(slot8) + points

		self._set_total(slot5, self)

		slot9 = self
		slot7 = self.next_level_data_current_points(slot8) + points

		self._set_next_level_data_current_points(slot5, self)

		return 
	end

	slot9 = self
	slot7 = self.total(slot8) + points_left

	self._set_total(slot5, self)

	slot9 = self
	slot7 = self.next_level_data_current_points(slot8) + points_left

	self._set_next_level_data_current_points(slot5, self)

	slot6 = self

	self._level_up(slot5)

	slot8 = is_debug

	return self.add_points(slot5, self, points - points_left)
end
function RaidExperienceManager:_level_up()
	slot6 = self
	slot4 = self.current_level(slot5) + 1

	self._set_current_level(slot2, self)

	slot6 = self
	slot4 = self.current_level(slot5) + 1

	self._set_next_level_data(slot2, self)

	slot3 = managers.player
	local player = managers.player.player_unit(slot2)

	if player then
		slot4 = player
		slot4 = player.base(slot3)

		player.base(slot3).replenish(slot3)
	end

	slot4 = managers.progression

	if managers.progression.operations_state(slot3) == ProgressionManager.OPERATIONS_STATE_LOCKED then
		slot4 = self

		if tweak_data.operations.progression.operations_unlock_level <= self.current_level(slot3) then
			slot5 = ProgressionManager.OPERATIONS_STATE_PENDING

			managers.progression.set_operations_state(slot3, managers.progression)
		end
	end

	slot4 = managers.skilltree
	slot7 = self

	managers.skilltree.apply_automatic_unlocks_for_level(slot3, self.current_level(slot6))

	slot4 = managers.skilltree
	slot7 = self

	managers.skilltree.create_breadcrumbs_for_level(slot3, self.current_level(slot6))

	slot4 = self

	self._check_achievements(slot3)

	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot5 = "sync_character_level"
		slot8 = self

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), self.current_level(slot7))
	end

	slot4 = managers.hud
	slot7 = self

	managers.hud.set_player_level(slot3, self.current_level(slot6))

	return 
end
function RaidExperienceManager:_check_achievements()
	local achievements = tweak_data.achievement.levels
	local current_level = self.current_level(slot3)
	slot5 = achievements

	for _, achievement_def in ipairs(self) do
		if achievement_def.level <= current_level then
			slot11 = achievement_def.achievement

			managers.achievment.award(slot9, managers.achievment)
		end
	end

	return 
end
function RaidExperienceManager:current_level()
end
function RaidExperienceManager:_set_current_level(value)

	-- Decompilation error in this vicinity:
	local current_level = self.current_level(slot3)
	slot6 = 0
	value = math.max(self, value)
	slot8 = true
	self._global.level = Application.digest_value(value, Application, value)
	slot5 = self

	self.update_progress(Application.digest_value(value, Application, value))

	if current_level < 40 and value == 40 then
		slot5 = managers.statistics

		managers.statistics.leveled_character_to_40(slot4)
	end

	return 
end
function RaidExperienceManager:total()
	slot5 = false

	return Application.digest_value(slot2, Application, self._global.total)
end
function RaidExperienceManager:_set_total(value)
	slot7 = true
	self._global.total = Application.digest_value(slot4, Application, value)

	return 
end
function RaidExperienceManager:experience_string(xp)
	slot8 = xp
	local total = tostring(math.round(math.abs(slot7)))
	slot5 = total
	local reverse = string.reverse(math.round)
	local s = ""
	slot8 = reverse

	for i = 1, string.len(slot7), 1 do

		-- Decompilation error in this vicinity:
		slot9 = s
		slot14 = i
		slot10 = string.sub(slot11, reverse, i)
		slot14 = 3
		slot13 = reverse
		s = slot9 .. slot10 .. ((i ~= string.len(slot12) and RaidExperienceManager.THOUSAND_SEPARATOR) or "")
	end

	slot7 = s

	return string.reverse(slot6)
end
function RaidExperienceManager:get_difficulty_multiplier(difficulty)
	slot7 = difficulty
	local multiplier = tweak_data.get_value(slot3, tweak_data, "experience_manager", "difficulty_multiplier")

	return multiplier or 0
end
function RaidExperienceManager:get_levels_gained_from_xp(xp)
	local next_level_data = self.next_level_data(slot3)
	slot6 = next_level_data.points - next_level_data.current_points
	local xp_needed_to_level = math.max(self, 1)
	slot7 = 1
	local level_gained = math.min(1, xp / xp_needed_to_level)
	slot8 = 0
	xp = math.max(xp / xp_needed_to_level, xp - xp_needed_to_level)
	slot7 = managers.experience
	local plvl = managers.experience.current_level(xp / xp_needed_to_level) + 1
	local level_data = nil

	while 0 < xp and plvl < self._total_levels do
		plvl = plvl + 1
		slot13 = "points"
		xp_needed_to_level = tweak_data.get_value(slot8, tweak_data, "experience_manager", "levels", plvl)
		slot10 = 1
		level_gained = level_gained + math.min(slot8, xp / xp_needed_to_level)
		slot10 = 0
		xp = math.max(slot8, xp - xp_needed_to_level)
	end

	return level_gained
end
function RaidExperienceManager:level_cap()
	slot5 = false

	return Application.digest_value(slot2, Application, self.LEVEL_CAP)
end
function RaidExperienceManager:reached_level_cap()
	slot4 = self

	return self.level_cap(self) <= self.current_level(slot2)
end
function RaidExperienceManager:get_total_xp_for_levels(level)
	local total_xp = 0

	for i_level = 1, level, 1 do
		slot13 = "points"
		total_xp = total_xp + tweak_data.get_value(slot8, tweak_data, "experience_manager", "levels", i_level)
	end

	return total_xp
end
function RaidExperienceManager:save(data)
	local state = {
		version = self._global.version,
		total = self._global.total,
		xp_gained = self._global.xp_gained,
		next_level_data = self._global.next_level_data,
		level = self._global.level
	}
	data.RaidExperienceManager = state

	return 
end
function RaidExperienceManager:load(data)
	slot4 = self

	self.reset(slot3)

	local state = data.RaidExperienceManager

	if state.version and state.version and state.version ~= RaidExperienceManager.VERSION then
		slot6 = state.version
	elseif state then
		self._global.version = state.version
		self._global.total = state.total
		self._global.xp_gained = state.xp_gained or state.total
		self._global.next_level_data = state.next_level_data
		slot3 = self._global

		if not state.level then
			slot8 = true
			slot4 = Application.digest_value(slot5, Application, 1)
		end

		slot3.level = slot4
		slot5 = self
		slot8 = self.current_level(slot9)
		slot11 = self

		self._set_current_level(slot4, math.min(slot7, self.level_cap(self)))
	end

	slot5 = managers.network.account

	managers.network.account.experience_loaded(slot4)

	slot5 = self

	self._check_achievements(slot4)

	return 
end
function RaidExperienceManager:reset()
	slot3 = managers.upgrades

	managers.upgrades.reset(slot2)

	slot3 = managers.player

	managers.player.reset(slot2)

	Global.experience_manager = nil
	slot3 = self

	self._setup(nil)

	slot3 = self

	self.update_progress(nil)

	return 
end
function RaidExperienceManager:update_progress()
	slot3 = managers.platform
	slot9 = self
	slot8 = 1

	managers.platform.set_progress(slot2, math.clamp(slot5, self.current_level(slot7) / self.level_cap(self), 0))

	return 
end
function RaidExperienceManager:chk_ask_use_backup(savegame_data, backup_savegame_data)
	local savegame_exp_total, backup_savegame_exp_total = nil
	local state = savegame_data.RaidExperienceManager

	if state then
		savegame_exp_total = state.total
	end

	state = backup_savegame_data.RaidExperienceManager

	if state then
		backup_savegame_exp_total = state.total
	end

	if savegame_exp_total and backup_savegame_exp_total then
		slot10 = false
		slot11 = false

		if Application.digest_value(slot7, Application, savegame_exp_total) < Application.digest_value(Application, Application, backup_savegame_exp_total) then
			return true
		end
	end

	return 
end

return 
