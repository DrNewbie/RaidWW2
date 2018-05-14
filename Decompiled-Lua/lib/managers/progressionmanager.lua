ProgressionManager = ProgressionManager or class()
ProgressionManager.VERSION = 1
ProgressionManager.MISSION_STATE_LOCKED = "locked"
ProgressionManager.MISSION_STATE_OFFERED = "offered"
ProgressionManager.MISSION_STATE_UNLOCKED = "unlocked"
ProgressionManager.OPERATIONS_STATE_LOCKED = "locked"
ProgressionManager.OPERATIONS_STATE_PENDING = "pending"
ProgressionManager.OPERATIONS_STATE_UNLOCKED = "unlocked"
slot3 = "units/vanilla/props/props_camp_upgrades/props_camp_trophy_case/props_camp_trophy_case"
ProgressionManager.TROPHY_CASE_UNIT = Idstring(slot2)
ProgressionManager.TROPHY_DIFFICULTY_SEQUENCES = {
	"wood",
	"bronze",
	"silver",
	"gold"
}
ProgressionManager.TROPHY_MAX_ROTATION_OFFSET = 22
ProgressionManager.TROPHY_MAX_X_OFFSET = 8
ProgressionManager.TROPHY_MAX_Y_OFFSET = 5
ProgressionManager.get_instance = function ()
	if not Global.progression_manager then
		slot3 = ProgressionManager
		Global.progression_manager = ProgressionManager.new(slot2)
	end

	slot3 = ProgressionManager

	setmetatable(slot1, Global.progression_manager)

	return Global.progression_manager
end
ProgressionManager.init = function (self)
	self._mission_progression_completion_pending = false
	self._mission_progression_completed = false
	self._first_time_missions_unlocked = false
	self._operations_state = ProgressionManager.OPERATIONS_STATE_LOCKED
	self._unlock_cycles_completed = 0
	self._mission_unlock_timer = tweak_data.operations.progression.regular_unlock_cycle_duration
	self._mission_progression = {}
	slot3 = self

	self._setup(slot2)

	slot3 = self

	self._unlock_first_time_missions(slot2)

	return 
end
ProgressionManager.reset = function (self)
	slot3 = self

	self.init(slot2)

	return 
end
ProgressionManager._setup = function (self)
	slot3 = self

	self._setup_mission_states(slot2)

	return 
end
ProgressionManager._setup_mission_states = function (self)
	if not self._mission_progression[OperationsTweakData.JOB_TYPE_RAID] then
		self._mission_progression[OperationsTweakData.JOB_TYPE_RAID] = {}
	end

	slot3 = tweak_data.operations.progression.mission_groups

	for group_index, progression_group in pairs(slot2) do
		slot8 = progression_group

		for mission_index, mission_id in pairs(slot7) do
			if not self._mission_progression[OperationsTweakData.JOB_TYPE_RAID][mission_id] then
				self._mission_progression[OperationsTweakData.JOB_TYPE_RAID][mission_id] = {}

				if self._mission_progression_completed or self._mission_progression_completion_pending then
					slot15 = mission_id

					self._unlock_mission(slot12, self, OperationsTweakData.JOB_TYPE_RAID)
				else
					self._mission_progression[OperationsTweakData.JOB_TYPE_RAID][mission_id].state = ProgressionManager.MISSION_STATE_LOCKED
				end
			end
		end
	end

	if not self._mission_progression[OperationsTweakData.JOB_TYPE_OPERATION] then
		self._mission_progression[OperationsTweakData.JOB_TYPE_OPERATION] = {}
	end

	slot3 = tweak_data.operations.missions

	for mission_id, mission_data in pairs(slot2) do
		if mission_data.job_type and mission_data.job_type == OperationsTweakData.JOB_TYPE_OPERATION and not self._mission_progression[OperationsTweakData.JOB_TYPE_OPERATION][mission_id] then
			self._mission_progression[OperationsTweakData.JOB_TYPE_OPERATION][mission_id] = {}
			slot10 = mission_id

			self._unlock_mission(, self, OperationsTweakData.JOB_TYPE_OPERATION)
		end
	end

	return 
end
ProgressionManager._unlock_mission = function (self, job_type, mission_id)
	slot9 = mission_id
	slot6 = "[ProgressionManager][_unlock_mission] Unlocking mission " .. tostring(slot8)

	Application.trace(slot4, Application)

	self._mission_progression[job_type][mission_id].state = ProgressionManager.MISSION_STATE_UNLOCKED
	self._mission_progression[job_type][mission_id].difficulty_available = tweak_data.operations.progression.initially_unlocked_difficulty
	self._mission_progression[job_type][mission_id].difficulty_completed = 0

	return 
end
ProgressionManager._offer_mission = function (self, mission_id)
	slot8 = mission_id
	slot5 = "[ProgressionManager][_offer_mission] Offering mission " .. tostring(slot7)

	Application.trace(slot3, Application)

	self._mission_progression[OperationsTweakData.JOB_TYPE_RAID][mission_id].state = ProgressionManager.MISSION_STATE_OFFERED

	return 
end
ProgressionManager.mission_unlocked = function (self, job_type, mission_id)
	if self._mission_progression[job_type][mission_id] and self._mission_progression[job_type][mission_id].state == ProgressionManager.MISSION_STATE_UNLOCKED then
		return true
	end

	return false
end
ProgressionManager.have_pending_missions_to_unlock = function (self)
	slot3 = self._mission_progression

	for mission_type, mission_group in pairs(slot2) do
		slot8 = mission_group

		for mission_id, mission_data in pairs(slot7) do
			if mission_data.state == ProgressionManager.MISSION_STATE_OFFERED then
				return true
			end
		end
	end

	return false
end
ProgressionManager.pending_missions_to_unlock = function (self)
	local pending_missions = {}
	slot4 = self._mission_progression

	for mission_type, mission_group in pairs(slot3) do
		slot9 = mission_group

		for mission_id, mission_data in pairs(slot8) do
			if mission_data.state == ProgressionManager.MISSION_STATE_OFFERED then
				slot15 = mission_id

				table.insert(slot13, pending_missions)
			end
		end
	end

	return pending_missions
end
ProgressionManager.mission_progression_completed = function (self)
	return self._mission_progression_completed
end
ProgressionManager.set_operations_state = function (self, state)
	if self._operations_state == state then
		return 
	end

	slot8 = self._operations_state
	slot10 = state
	slot5 = "[ProgressionManager][set_operations_state] Changing the Operations state from " .. tostring(slot7) .. " to " .. tostring(slot9)

	Application.trace(slot3, Application)

	self._operations_state = state

	if state == ProgressionManager.OPERATIONS_STATE_PENDING then
		slot5 = BreadcrumbManager.CATEGORY_OPERATIONS

		if not managers.breadcrumb.category_has_breadcrumbs(slot3, managers.breadcrumb) then
			slot6 = {
				"operations_pending"
			}

			managers.breadcrumb.add_breadcrumb(slot3, managers.breadcrumb, BreadcrumbManager.CATEGORY_OPERATIONS)
		end
	end

	slot5 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(slot3, managers.savefile)

	return 
end
ProgressionManager.operations_state = function (self)
	return self._operations_state
end
ProgressionManager.operations_unlocked = function (self)
	return self._operations_state == ProgressionManager.OPERATIONS_STATE_UNLOCKED
end
ProgressionManager.at_final_unlock_cycle = function (self)
	if not self._mission_progression_completed and (self._unlock_cycles_completed == tweak_data.operations.progression.unlock_cycles - 1 or self._unlock_cycles_completed == tweak_data.operations.progression.unlock_cycles) then
		return true
	end

	return false
end
ProgressionManager.time_until_next_unlock = function (self)
	if self._mission_progression_completed or self._mission_progression_completion_pending then
		return 0
	end

	return self._mission_unlock_timer
end
ProgressionManager.get_mission_progression = function (self, mission_type, mission_id)
	slot7 = mission_id

	if not self.mission_unlocked(slot4, self, mission_type) then
		return 
	end

	return self._mission_progression[mission_type][mission_id].difficulty_available, self._mission_progression[mission_type][mission_id].difficulty_completed
end
ProgressionManager.complete_mission_on_difficulty = function (self, job_type, mission_id, difficulty)
	slot10 = mission_id
	slot12 = difficulty
	slot7 = "[ProgressionManager][complete_mission_on_difficulty] Completing mission " .. tostring(slot9) .. " on difficulty " .. tostring(slot11)

	Application.trace(slot5, Application)

	if not self._mission_progression[job_type][mission_id] or self._mission_progression[job_type][mission_id].state ~= ProgressionManager.MISSION_STATE_UNLOCKED then
		return 
	end

	if self._mission_progression[job_type][mission_id].difficulty_completed < difficulty then
		slot9 = self._mission_progression[job_type][mission_id].difficulty_available
		self._mission_progression[job_type][mission_id].difficulty_completed = math.clamp(slot6, difficulty, 1)
	end

	if self._mission_progression[job_type][mission_id].difficulty_completed == self._mission_progression[job_type][mission_id].difficulty_available then
		slot8 = 1
		slot11 = tweak_data
		self._mission_progression[job_type][mission_id].difficulty_available = math.clamp(slot6, self._mission_progression[job_type][mission_id].difficulty_available + 1, tweak_data.number_of_difficulties(slot10))
	end

	return 
end
ProgressionManager.choose_offered_mission = function (self, mission_id)
	slot8 = mission_id
	slot5 = "[ProgressionManager][choose_offered_mission] The player has chosen to unlock mission " .. tostring(slot7)

	Application.trace(slot3, Application)

	if not self._mission_progression[OperationsTweakData.JOB_TYPE_RAID][mission_id] or self._mission_progression[OperationsTweakData.JOB_TYPE_RAID][mission_id].state ~= ProgressionManager.MISSION_STATE_OFFERED then
		slot6 = mission_id

		Application.error(slot3, Application, "[ProgressionManager:choose_offered_mission] Tried to unlock a mission that was not available to unlock!")

		return 
	end

	slot6 = mission_id

	self._unlock_mission(slot3, self, OperationsTweakData.JOB_TYPE_RAID)

	slot4 = self._mission_progression[OperationsTweakData.JOB_TYPE_RAID]

	for mission_id, mission_data in pairs(slot3) do
		if mission_data.state == ProgressionManager.MISSION_STATE_OFFERED then
			mission_data.state = ProgressionManager.MISSION_STATE_LOCKED
		end
	end

	self._unlock_cycles_completed = self._unlock_cycles_completed + 1

	if self._unlock_cycles_completed == tweak_data.operations.progression.unlock_cycles then
		self._mission_progression_completed = true
	elseif self._unlock_cycles_completed < tweak_data.operations.progression.unlock_cycles - 1 then
		self._mission_unlock_timer = tweak_data.operations.progression.regular_unlock_cycle_duration
	else
		self._mission_unlock_timer = tweak_data.operations.progression.final_unlock_cycle_duration
	end

	slot6 = {
		"progression_system_new_raid"
	}

	managers.breadcrumb.remove_breadcrumb(slot3, managers.breadcrumb, BreadcrumbManager.CATEGORY_NEW_RAID)

	slot6 = {
		mission_id
	}

	managers.breadcrumb.add_breadcrumb(slot3, managers.breadcrumb, BreadcrumbManager.CATEGORY_NEW_RAID)

	self._last_unlocked_raid = mission_id
	slot5 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(slot3, managers.savefile)

	return 
end
ProgressionManager.clear_last_unlocked_raid = function (self)
	local last_unlocked = nil

	if self._last_unlocked_raid then
		last_unlocked = self._last_unlocked_raid
		self._last_unlocked_raid = nil
		slot5 = SavefileManager.SETTING_SLOT

		managers.savefile.save_game(slot3, managers.savefile)
	end

	return last_unlocked
end
ProgressionManager._unlock_first_time_missions = function (self)
	slot4 = "[ProgressionManager][_unlock_first_time_missions] Unlocking first-time missions!"

	Application.trace(slot2, Application)

	slot3 = tweak_data.operations.progression.initial_mission_unlock_blueprint

	for blueprint_index, blueprint_mission_type in pairs(slot2) do
		local unlocked_required_mission = false
		local potential_missions = tweak_data.operations.progression.mission_groups[blueprint_mission_type]

		while not unlocked_required_mission do
			slot11 = #potential_missions
			local mission_index_chosen = math.random(slot9, 1)
			slot13 = potential_missions[mission_index_chosen]

			if not self.mission_unlocked(1, self, OperationsTweakData.JOB_TYPE_RAID) then
				slot13 = potential_missions[mission_index_chosen]

				self._unlock_mission(slot10, self, OperationsTweakData.JOB_TYPE_RAID)

				unlocked_required_mission = true
			end
		end
	end

	self._first_time_missions_unlocked = true

	return 
end
ProgressionManager._unlock_all_missions = function (self)
	slot4 = "[ProgressionManager][_unlock_all_missions] Unlocking all remaining missions!"

	Application.trace(slot2, Application)

	slot3 = self._mission_progression

	for mission_type_id, mission_type_missions in pairs(slot2) do
		slot8 = mission_type_missions

		for mission_id, mission_data in pairs(slot7) do
			if mission_data.state ~= ProgressionManager.MISSION_STATE_UNLOCKED then
				slot15 = mission_id

				self._unlock_mission(slot12, self, mission_type_id)
			end

			local mission_tweak_data = tweak_data.operations.missions[mission_id]

			if mission_tweak_data and mission_tweak_data.control_brief_video then
				slot14 = mission_tweak_data.control_brief_video

				for video_index, video_path in pairs(slot13) do
					slot20 = video_path
					local chosen_video_unlock_id = tweak_data.intel.get_control_video_by_path(slot18, tweak_data.intel)

					if chosen_video_unlock_id then
						slot22 = {
							chosen_video_unlock_id
						}

						managers.unlock.unlock(slot19, managers.unlock, {
							slot = UnlockManager.SLOT_PROFILE,
							identifier = UnlockManager.CATEGORY_CONTROL_ARCHIVE
						})
					end
				end
			else
				slot15 = "[ProgressionManager:_unlock_all_missions] Tried to unlock a map that doesn't exist, call programmers, level:" .. mission_id

				Application.trace(slot13, Application)
			end
		end
	end

	self._unlock_cycles_completed = self._unlock_cycles_completed + 1
	self._mission_progression_completion_pending = true

	return 
end
ProgressionManager.mission_progression_completion_pending = function (self)
	return self._mission_progression_completion_pending
end
ProgressionManager.complete_mission_progression = function (self)
	slot4 = "[ProgressionManager][complete_mission_progression] Mission progression completed!"

	Application.trace(slot2, Application)

	self._mission_progression_completed = true
	self._mission_progression_completion_pending = false
	slot4 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(slot2, managers.savefile)

	return 
end
ProgressionManager._offer_new_missions = function (self)
	slot4 = "[ProgressionManager][_offer_new_missions] Offering a couple of new missions!"

	Application.trace(slot2, Application)

	local missions_to_make_available = #tweak_data.operations.progression.regular_mission_unlock_blueprint
	local locked_missions = {}
	local have_locked_missions = false
	slot6 = tweak_data.operations.progression.regular_mission_unlock_blueprint

	for _, mission_type in pairs(slot5) do
		if not locked_missions[mission_type] then
			locked_missions[mission_type] = {}
			slot11 = tweak_data.operations.progression.mission_groups[mission_type]

			for index, mission_name in pairs(slot10) do
				slot18 = mission_name

				if not self.mission_unlocked(slot15, self, OperationsTweakData.JOB_TYPE_RAID) then
					slot17 = mission_name

					table.insert(slot15, locked_missions[mission_type])

					have_locked_missions = true
				end
			end
		end
	end

	while 0 < missions_to_make_available and have_locked_missions do
		have_locked_missions = false
		slot6 = tweak_data.operations.progression.regular_mission_unlock_blueprint

		for _, mission_type in pairs(slot5) do
			if locked_missions[mission_type] and 0 < #locked_missions[mission_type] then
				slot11 = locked_missions[mission_type]

				math.shuffle(slot10)

				local mission_unlocked = table.remove(slot10)
				slot13 = mission_unlocked

				self._offer_mission(locked_missions[mission_type], self)

				missions_to_make_available = missions_to_make_available - 1
			end
		end

		slot6 = locked_missions

		for mission_type, locked_missions_of_type in pairs(slot5) do
			if 0 < #locked_missions_of_type then
				have_locked_missions = true

				break
			else
				locked_missions[mission_type] = nil
			end
		end
	end

	slot8 = {
		"progression_system_new_raid"
	}

	managers.breadcrumb.add_breadcrumb(slot5, managers.breadcrumb, BreadcrumbManager.CATEGORY_NEW_RAID)

	return 
end
ProgressionManager.update = function (self, t, dt)
	slot6 = game_state_machine

	if BaseNetworkHandler._gamestate_filter.any_ingame_mission[game_state_machine.current_state_name(slot5)] then
		slot5 = managers.raid_job
		local is_in_mission = not managers.raid_job.is_camp_loaded(slot4)
	end

	if is_in_mission then
		slot6 = managers.raid_job

		if managers.raid_job.played_tutorial(slot5) and not self._mission_progression_completed and not self._mission_progression_completion_pending and 0 < self._mission_unlock_timer then
			self._mission_unlock_timer = self._mission_unlock_timer - dt

			if self._mission_unlock_timer <= 0 then
				slot6 = self

				self._on_cycle_completed(slot5)
			end
		end
	end

	return 
end
ProgressionManager._on_cycle_completed = function (self)
	slot4 = "[ProgressionManager][_on_cycle_completed] Progression cycle completed. Determining what to do..."

	Application.trace(slot2, Application)

	self._mission_unlock_timer = 0

	if self._unlock_cycles_completed == tweak_data.operations.progression.unlock_cycles - 1 then
		slot3 = self

		self._unlock_all_missions(slot2)
	else
		slot3 = self

		self._offer_new_missions(slot2)
	end

	slot3 = managers.hud

	managers.hud.on_progression_cycle_completed(slot2)

	slot4 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(slot2, managers.savefile)

	return 
end
ProgressionManager.layout_camp = function (self)
	slot4 = "[ProgressionManager][layout_camp] Laying out camp."

	Application.trace(slot2, Application)

	local trophy_case_unit = self._get_trophy_case_unit(slot2)
	slot4 = managers.player

	if not managers.player.local_player_in_camp(self) or not trophy_case_unit then
		return 
	end

	slot4 = self._mission_progression

	for mission_type, missions_of_type in pairs(slot3) do
		slot9 = missions_of_type

		for mission_id, mission_data in pairs(slot8) do
			if mission_data.state == ProgressionManager.MISSION_STATE_UNLOCKED and 0 < mission_data.difficulty_completed then
				local mission_trophy = tweak_data.operations.missions[mission_id].trophy

				if mission_trophy then
					slot15 = trophy_case_unit
					slot18 = mission_trophy.position
					local trophy_locator = trophy_case_unit.get_object(slot14, Idstring(slot17))
					local difficulty_sequence_to_run = ProgressionManager.TROPHY_DIFFICULTY_SEQUENCES[mission_data.difficulty_completed]
					slot18 = ProgressionManager.TROPHY_MAX_ROTATION_OFFSET
					local rotation_offset = math.random(Idstring, -ProgressionManager.TROPHY_MAX_ROTATION_OFFSET)
					slot20 = trophy_locator
					slot21 = trophy_locator
					slot19 = trophy_locator.rotation(trophy_locator.rotation(slot19)).pitch(trophy_locator.rotation(slot19))
					slot22 = trophy_locator
					local spawn_rotation = Rotation(-ProgressionManager.TROPHY_MAX_ROTATION_OFFSET, trophy_locator.rotation(slot19).yaw(slot19) + rotation_offset, trophy_locator.rotation(trophy_locator.rotation(trophy_locator.rotation(slot19))).roll(trophy_locator.rotation(trophy_locator.rotation(slot19))))
					slot20 = ProgressionManager.TROPHY_MAX_X_OFFSET
					local position_offset_x = math.random(trophy_locator.rotation(slot19).yaw(slot19) + rotation_offset, -ProgressionManager.TROPHY_MAX_X_OFFSET)
					slot21 = ProgressionManager.TROPHY_MAX_Y_OFFSET
					local position_offset_y = math.random(-ProgressionManager.TROPHY_MAX_X_OFFSET, -ProgressionManager.TROPHY_MAX_Y_OFFSET)
					slot23 = trophy_locator.position(trophy_locator).z
					local spawn_position = Vector3(-ProgressionManager.TROPHY_MAX_Y_OFFSET, trophy_locator.position(trophy_locator.rotation(trophy_locator.rotation(trophy_locator.rotation(slot19)))).x + position_offset_x, trophy_locator.position(trophy_locator).y + position_offset_y)
					slot26 = difficulty_sequence_to_run
					slot28 = mission_id
					slot23 = "[ProgressionManager][layout_camp] Creating a " .. tostring(trophy_locator) .. " " .. tostring(slot27) .. " trophy!"

					Application.trace(trophy_locator.position(trophy_locator.rotation(trophy_locator.rotation(trophy_locator.rotation(slot19)))).x + position_offset_x, Application)

					slot25 = mission_trophy.unit
					slot25 = spawn_rotation
					local trophy = World.spawn_unit(trophy_locator.position(trophy_locator.rotation(trophy_locator.rotation(trophy_locator.rotation(slot19)))).x + position_offset_x, World, Idstring(tostring(trophy_locator)), spawn_position)
					slot23 = trophy
					slot24 = difficulty_sequence_to_run

					trophy.damage(World).run_sequence_simple(World, trophy.damage(World))

					slot23 = managers.network
					slot26 = mission_data.difficulty_completed

					managers.network.session(World).send_to_peers_synched(World, managers.network.session(World), "sync_camp_trophy", trophy)

					slot23 = Application

					if not Application.editor(World) then
						slot25 = spawn_position

						managers.worldcollection.register_spawned_unit(slot22, managers.worldcollection, trophy)
					end
				end
			end
		end
	end

	return 
end
ProgressionManager.sync_trophy_level = function (self, unit, trophy_level)
	local difficulty_sequence_to_run = ProgressionManager.TROPHY_DIFFICULTY_SEQUENCES[trophy_level]
	slot6 = unit
	slot7 = difficulty_sequence_to_run

	unit.damage(slot5).run_sequence_simple(slot5, unit.damage(slot5))

	return 
end
ProgressionManager._get_trophy_case_unit = function (self)
	slot4 = "all"
	slot8 = "world_geometry"
	local units = World.find_units_quick(slot2, World, managers.slot.get_mask(slot6, managers.slot))

	if units then
		slot4 = units

		for _, unit in pairs(slot3) do
			slot9 = unit

			if unit.name(slot8) == ProgressionManager.TROPHY_CASE_UNIT then
				return unit
			end
		end
	end

	slot5 = "[ProgressionManager][_get_trophy_case_unit] Did not find the trophy case!"

	Application.error(slot3, Application)

	return 
end
ProgressionManager.save_profile_slot = function (self, data)
	local state = {
		version = ProgressionManager.VERSION,
		mission_progression_completed = self._mission_progression_completed,
		mission_progression_completion_pending = self._mission_progression_completion_pending,
		unlock_cycles_completed = self._unlock_cycles_completed,
		first_time_missions_unlocked = self._first_time_missions_unlocked,
		operations_state = self._operations_state,
		mission_unlock_timer = self._mission_unlock_timer,
		mission_progression = self._mission_progression
	}
	data.ProgressionManager = state

	return 
end
ProgressionManager.load_profile_slot = function (self, data, version)
	local state = data.ProgressionManager

	if not state then
		slot6 = self

		self._unlock_first_time_missions(slot5)

		slot6 = managers.savefile

		managers.savefile.set_resave_required(slot5)

		return 
	end

	if not state.version or (state.version and state.version ~= ProgressionManager.VERSION) then
		self.version = ProgressionManager.VERSION
	else
		self.version = state.version or 1
		self._mission_progression_completed = state.mission_progression_completed
		self._mission_progression_completion_pending = state.mission_progression_completion_pending
		self._unlock_cycles_completed = state.unlock_cycles_completed
		self._first_time_missions_unlocked = state.first_time_missions_unlocked
		self._operations_state = state.operations_state
		self._mission_unlock_timer = state.mission_unlock_timer
		self._mission_progression = state.mission_progression or {}
	end

	slot6 = self

	self._setup(slot5)

	if not self._first_time_missions_unlocked then
		slot6 = self

		self._unlock_first_time_missions(slot5)

		slot6 = managers.savefile

		managers.savefile.set_resave_required(slot5)
	end

	return 
end

return 
