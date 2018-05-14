-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
RaidJobManager = RaidJobManager or class()
RaidJobManager.NUMBER_OF_SAVE_SLOTS = 5
RaidJobManager.WORLD_POINT_MISSION = "system_world_point_mission"
RaidJobManager.WORLD_POINT_CAMP = "system_world_point_camp"
RaidJobManager.WORLD_POINT_TUTORIAL = "system_world_point_tutorial"
RaidJobManager.CAMP_ID = "camp"
RaidJobManager.TUTORIAL_ID = "tutorial"
RaidJobManager.SINGLE_MISSION_TYPE_NAME = "RAID"
RaidJobManager.XP_MULTIPLIER_ON_FAIL = 0.05
RaidJobManager.get_instance = function ()
	if not Global.raid_job_manager then
		slot3 = RaidJobManager
		Global.raid_job_manager = RaidJobManager.new(slot2)
	end

	slot3 = RaidJobManager

	setmetatable(slot1, Global.raid_job_manager)

	return Global.raid_job_manager
end
RaidJobManager.init = function (self)
	slot3 = self

	self._setup(slot2)

	return 
end
RaidJobManager._setup = function (self)
	self._save_slots = {}
	self._loot_data = {}
	slot4 = RaidJobManager.CAMP_ID
	self._camp = tweak_data.operations.mission_data(slot2, tweak_data.operations)
	self._play_tutorial = true

	return 
end
RaidJobManager.set_selected_job = function (self, job_id)
	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	slot5 = job_id
	local selected_job = tweak_data.operations.mission_data(slot3, tweak_data.operations)

	if selected_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		slot6 = job_id

		tweak_data.operations.randomize_operation(slot4, tweak_data.operations)

		slot6 = job_id
		local list_delimited = tweak_data.operations.get_operation_indexes_delimited(slot4, tweak_data.operations)
		slot6 = managers.network
		slot9 = list_delimited

		managers.network.session(tweak_data.operations).send_to_peers_synched(tweak_data.operations, managers.network.session(tweak_data.operations), "sync_randomize_operation", job_id)
	end

	slot6 = job_id

	self._set_selected_job(slot4, self)

	slot5 = managers.network
	slot8 = Global.game_settings.difficulty

	managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_set_selected_job", job_id)

	return 
end
RaidJobManager._set_selected_job = function (self, job_id)
	slot5 = job_id
	local selected_job = tweak_data.operations.mission_data(slot3, tweak_data.operations)
	self._current_job = nil
	slot6 = {
		success = false,
		quit = true
	}

	managers.statistics.stop_session(tweak_data.operations, managers.statistics)

	slot5 = managers.network
	slot9 = ""

	managers.network.session(tweak_data.operations).send_to_peers_synched(tweak_data.operations, managers.network.session(tweak_data.operations), "stop_statistics_session", false, true)

	self._selected_job = selected_job
	self._loot_data = {}
	slot5 = managers.global_state

	managers.global_state.reset_all_flags(tweak_data.operations)

	if self._selected_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
		slot5 = self

		self._select_raid(slot4)

		slot6 = selected_job.mission_flag

		managers.global_state.set_flag(slot4, managers.global_state)
	elseif self._selected_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		slot5 = self

		self._select_operation(slot4)

		slot6 = selected_job.current_event_data.mission_flag

		managers.global_state.set_flag(slot4, managers.global_state)
	end

	return 
end
RaidJobManager._select_raid = function (self)
	self._current_save_slot = nil
	slot4 = self._selected_job.mission_state

	managers.global_state.set_flag(slot2, managers.global_state)

	return 
end
RaidJobManager._select_operation = function (self)
	slot3 = self
	self._current_save_slot = self.get_available_save_slot(slot2)
	slot5 = 1

	self.set_current_event(slot2, self, self._selected_job)

	slot4 = self._selected_job.current_event_data.mission_state

	managers.global_state.set_flag(slot2, managers.global_state)

	slot3 = managers.global_state
	self._initial_global_states = managers.global_state.get_all_global_states(slot2)

	return 
end
RaidJobManager.set_current_event = function (self, operation, index)
	operation.current_event = index
	local event_id = operation.events_index[index]
	operation.current_event_data = operation.events[event_id]

	return 
end
RaidJobManager.start_selected_job = function (self)
	slot3 = self

	self.on_mission_started(slot2)

	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	Global.player_manager.game_settings_difficulty = Global.game_settings.difficulty
	self._current_job = self._selected_job
	self._selected_job = nil
	slot4 = {
		drop_in = false,
		from_beginning = true
	}

	managers.statistics.start_session(Global.game_settings.difficulty, managers.statistics)

	slot3 = managers.network
	slot6 = false

	managers.network.session(Global.game_settings.difficulty).send_to_peers_synched(Global.game_settings.difficulty, managers.network.session(Global.game_settings.difficulty), "start_statistics_session", true)

	slot3 = managers.network
	slot5 = self._current_job.job_id

	managers.network.session(Global.game_settings.difficulty).send_to_peers_synched(Global.game_settings.difficulty, managers.network.session(Global.game_settings.difficulty), "sync_current_job")

	slot3 = managers.network

	managers.network.update_matchmake_attributes(Global.game_settings.difficulty)

	slot3 = managers.network.matchmake

	managers.network.matchmake.set_job_info_by_current_job(Global.game_settings.difficulty)

	return 
end
RaidJobManager.on_mission_started = function (self)
	slot4 = "[RaidJobManager:on_mission_started()]"

	Application.debug(slot2, Application)

	slot3 = self

	self.stop_sounds(slot2)

	slot3 = TimerManager
	slot3 = TimerManager.wall_running(slot2)
	self.start_time = TimerManager.wall_running(slot2).time(slot2)
	self.memory = {}
	self.shortterm_memory = {}
	slot3 = managers.experience

	managers.experience.clear_mission_xp(slot2)

	return 
end
RaidJobManager.on_mission_ended = function (self)
	self.memory = nil
	self.shortterm_memory = nil
	slot3 = self

	self.save_progress(slot2)

	return 
end
RaidJobManager.on_restart_to_camp = function (self)
	slot3 = self

	self._on_restart_to_camp(slot2)

	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot4 = "sync_raid_job_on_restart_to_camp"

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))
	end

	return 
end
RaidJobManager.synced_on_restart_to_camp = function (self)
	slot3 = self

	self._on_restart_to_camp(slot2)

	return 
end
RaidJobManager._on_restart_to_camp = function (self)
	slot4 = {
		success = false,
		quit = true
	}

	managers.statistics.stop_session(slot2, managers.statistics)

	slot3 = managers.lootdrop

	managers.lootdrop.reset_loot_value_counters(slot2)

	slot3 = managers.global_state

	managers.global_state.reset_all_flags(slot2)

	slot3 = managers.player

	if managers.player.current_state(slot2) == "turret" then
		slot3 = managers.hud
		slot6 = managers.player

		managers.hud.hide_turret_hud(slot2, managers.player.get_turret_unit(slot5))
	end

	slot3 = self

	self.cleanup(slot2)

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network.matchmake

		managers.network.matchmake.set_job_info_by_current_job(slot2)
	end

	slot4 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(slot2, managers.savefile)

	return 
end
RaidJobManager.start_selected_raid = function (self)
	slot3 = self

	self.start_selected_job(slot2)

	return 
end
RaidJobManager.start_selected_operation = function (self)
	slot4 = "[RaidJobManager:start_selected_operation()]"

	Application.debug(slot2, Application)

	slot3 = self

	self.start_selected_job(slot2)

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self

		self.save_progress(slot2)

		self._initial_global_states = nil
	end

	return 
end
RaidJobManager.selected_job = function (self)
	return self._selected_job
end
RaidJobManager.current_job = function (self)
	return self._current_job
end
RaidJobManager.is_in_tutorial = function (self)
	return self._current_job and self._current_job.level_id == "tutorial"
end
RaidJobManager.current_job_id = function (self)
	return self._current_job and self._current_job.job_id
end
RaidJobManager.current_level_id = function (self)
	return self._current_job and self._current_job.level_id
end
RaidJobManager.current_job_type = function (self)
	if self._selected_job then
		return self._selected_job.job_type
	elseif self._current_job then
		return self._current_job.job_type
	end

	return nil
end
RaidJobManager.on_mission_restart = function (self)
	slot3 = managers.challenge_cards

	managers.challenge_cards.remove_active_challenge_card(slot2)

	slot4 = false

	managers.greed.on_level_exited(slot2, managers.greed)

	slot4 = false

	managers.consumable_missions.on_level_exited(slot2, managers.consumable_missions)

	slot3 = managers.statistics

	managers.statistics.reset_session(slot2)

	slot3 = managers.lootdrop

	managers.lootdrop.reset_loot_value_counters(slot2)

	slot3 = self

	self.on_mission_ended(slot2)

	slot3 = self

	self.on_mission_started(slot2)

	return 
end
RaidJobManager.external_start_mission = function (self)
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	managers.worldcollection.level_transition_in_progress = true
	slot4 = "[RaidJobManager:external_start_mission()]"

	Application.debug(true, Application)

	if not self._current_job and not self._selected_job then
		slot4 = "[RaidJobManager:external_start_mission()] no job selected"

		Application.debug(slot2, Application)

		return 
	end

	local mission = self._current_job or self._selected_job
	local event_index = (self._current_job and self._current_job.current_event) or 1
	slot5 = managers.network
	slot9 = self.reload_mission_flag

	managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_external_start_mission", mission.job_id, event_index)

	slot7 = event_index

	self.do_external_start_mission(slot4, self, mission)

	return 
end
RaidJobManager.do_external_start_mission = function (self, mission, event_index)
	slot5 = managers.system_menu

	managers.system_menu.force_close_all(slot4)

	slot5 = managers.menu

	managers.menu.close_all_menus(slot4)

	slot6 = false

	managers.player.set_local_player_in_camp(slot4, managers.player)

	local data = {}
	slot7 = "level_flag"

	managers.global_state.reset_flags_for_job(managers.player, managers.global_state)

	if mission.job_type == OperationsTweakData.JOB_TYPE_RAID then
		data.background = mission.loading.image
		data.loading_text = mission.loading.text
		data.mission = mission
		slot6 = self

		self.start_selected_raid(slot5)

		slot7 = mission.mission_flag

		managers.global_state.set_flag(slot5, managers.global_state)
	elseif mission.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		if event_index <= 1 and self._selected_job then
			slot6 = self

			self.start_selected_operation(slot5)
		end

		data.background = mission.current_event_data.loading.image
		data.loading_text = mission.current_event_data.loading.text
		slot6 = mission.current_event_data
		data.mission = deep_clone(slot5)
		data.mission.job_type = OperationsTweakData.JOB_TYPE_OPERATION
		data.mission.current_event = event_index
		data.mission.number_of_events = #mission.events_index
		data.mission.operation_name_id = mission.name_id
		data.mission.operation_icon = mission.icon_menu
		slot7 = mission.current_event_data.mission_flag

		managers.global_state.set_flag(mission.icon_menu, managers.global_state)
	else
		slot8 = mission.level_id

		Application.error(slot5, Application, "[RaidJobManager:external_start_mission()] Missing job_type in twek data for")

		return 
	end

	slot6 = managers.consumable_missions

	managers.consumable_missions.on_mission_started(slot5)

	slot7 = data

	managers.menu.show_loading_screen(slot5, managers.menu)

	slot13 = true

	managers.queued_tasks.queue(slot5, managers.queued_tasks, nil, self.external_start_mission_clbk, self, nil, 0.6, nil)

	return 
end
RaidJobManager.external_start_mission_clbk = function (self)
	slot5 = self.reload_mission_flag

	Application.debug(slot2, Application, "[RaidJobManager:external_start_mission_clbk()]")

	managers.menu.loading_screen_visible = true
	managers.worldcollection.moving_to_camp = false

	if self._current_job then
		slot4 = self._current_job.sub_worlds_spawned or 0

		managers.worldcollection.set_world_counter(slot2, managers.worldcollection)
	end

	slot9 = nil

	managers.queued_tasks.queue(slot2, managers.queued_tasks, nil, managers.worldcollection.level_transition_started, managers.worldcollection, nil, 0.1)

	slot4 = RaidJobManager.WORLD_POINT_MISSION
	local mission_wp = managers.mission.get_element_by_name(slot2, managers.mission)
	slot5 = RaidJobManager.WORLD_POINT_CAMP
	local camp_wp = managers.mission.get_element_by_name(managers.mission, managers.mission)
	self._tutorial_spawned = false

	if self.reload_mission_flag then
		mission_wp._action = "despawn"
		slot5 = mission_wp

		mission_wp.on_executed(slot4)
	elseif camp_wp then
		camp_wp._action = "despawn"
		slot5 = camp_wp

		camp_wp.on_executed(slot4)
	else
		slot8 = " Skipping despown step..."

		Application.debug(slot4, Application, "[RaidJobManager:external_start_mission_clbk()] No camp world point in the script! ", RaidJobManager.WORLD_POINT_CAMP)
	end

	local world, excluded_conts = nil

	if self._current_job then
		if self._current_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
			world = tweak_data.levels[self._current_job.level_id].predefined_world
			excluded_conts = self._current_job.excluded_continents
		elseif self._current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
			world = tweak_data.levels[self._current_job.current_event_data.level_id].predefined_world
			excluded_conts = self._current_job.current_event_data.excluded_continents
		else
			slot9 = self._current_job.job_id

			Application.error(slot6, Application, "[RaidJobManager:external_start_mission_clbk()] Missing job_type in tweak data for")

			return 
		end
	end

	if mission_wp then
		mission_wp._action = "spawn"
		mission_wp._spawn_loot = true
		mission_wp._values.world = world
		mission_wp._excluded_continents = excluded_conts
		slot7 = mission_wp

		mission_wp.on_executed(slot6)
	else
		slot10 = " Skipping spawn step..."

		Application.debug(slot6, Application, "[RaidJobManager:external_start_mission_clbk()] No mission world point in the script!", RaidJobManager.WORLD_POINT_MISSION)
	end

	return 
end
RaidJobManager.external_end_mission = function (self, restart_camp, is_failed)
	managers.worldcollection.level_transition_in_progress = true
	slot6 = true

	managers.game_play_central.set_restarting(true, managers.game_play_central)

	restart_camp = restart_camp or false
	local failed = is_failed or false
	self.restart_to_camp = restart_camp
	slot7 = not failed

	self.set_stage_success(slot5, self)

	slot6 = Network

	if Network.is_server(slot5) then
		slot7 = "[RaidJobManager:external_end_mission()]"

		Application.debug(slot5, Application)

		slot6 = managers.network
		slot9 = failed or false

		managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_external_end_mission", restart_camp)

		slot7 = restart_camp

		self.do_external_end_mission(slot5, self)
	end

	return 
end
RaidJobManager.tutorial_ended = function (self)
	self._tutorial_ended = true

	return 
end
RaidJobManager.set_temp_play_flag = function (self)
	self._play_tutorial = true
	self._temp_play_flag = true

	return 
end
RaidJobManager.revert_temp_play_flag = function (self)
	if self._temp_play_flag then
		self._play_tutorial = false
	end

	self._temp_play_flag = nil

	return 
end
RaidJobManager.played_tutorial = function (self)
	return not self._play_tutorial
end
RaidJobManager.do_external_end_mission = function (self, restart_camp)
	slot4 = managers.system_menu

	managers.system_menu.force_close_all(slot3)

	slot4 = managers.menu

	managers.menu.close_all_menus(slot3)

	slot6 = restart_camp

	Application.debug(slot3, Application, "[RaidJobManager:external_end_mission()]")

	slot5 = true

	managers.player.set_local_player_in_camp(slot3, managers.player)

	slot4 = managers.consumable_missions
	slot2 = managers.consumable_missions.on_level_exited

	if self._current_job then
		slot7 = self
		slot5 = self.stage_success(slot6)
	end

	slot2(slot3, slot4)

	slot4 = managers.greed
	slot2 = managers.greed.on_level_exited

	if self._current_job then
		slot7 = self
		slot5 = self.stage_success(slot6)
	end

	slot2(slot3, slot4)

	if restart_camp then
		slot4 = self

		self.restart_camp(slot3)
	else
		slot4 = self

		if self.is_at_last_event(slot3) then
			slot4 = managers.challenge_cards

			if managers.challenge_cards.get_active_card_status(slot3) == ChallengeCardsManager.CARD_STATUS_ACTIVE then
				slot4 = managers.challenge_cards

				managers.challenge_cards.set_successfull_raid_end(slot3)
			end
		end

		slot5 = true

		managers.drop_loot.set_enabled(slot3, managers.drop_loot)

		local mission = self._camp

		if self._play_tutorial then
			slot6 = "tutorial"

			self.set_selected_job(slot4, self)

			slot5 = game_state_machine

			if game_state_machine.current_state(slot4).show_intro_video then
				slot5 = game_state_machine

				if not game_state_machine.current_state(slot4).intro_video_shown then
					slot5 = game_state_machine
					slot5 = game_state_machine.current_state(slot4)

					game_state_machine.current_state(slot4).show_intro_video(slot4)

					return 
				end
			end

			slot5 = self

			self.start_selected_job(slot4)

			mission = self._current_job
		end

		local data = {}
		slot6 = managers.worldcollection

		if not managers.worldcollection.first_pass(slot5) and mission.loading_success then
			local at_last_stage = false

			if not self._current_job then
				data.mission = mission
			elseif self._current_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
				data.mission = tweak_data.operations.missions[self._current_job.job_id]
				at_last_stage = true
			else
				local operation_tweak_data = tweak_data.operations.missions[self._current_job.job_id]
				local current_event_id = self._current_job.events_index[self._current_job.current_event]
				local event_tweak_data = operation_tweak_data.events[current_event_id]
				data.mission = event_tweak_data
				at_last_stage = self._current_job.current_event == #self._current_job.events_index
			end

			if self._current_job then
				slot7 = self
			elseif self._current_job then
				slot7 = self

				if not self.stage_success(slot6) then
					data.success = false
				end
			end

			data.background = data.mission.loading.image
			data.loading_text = data.mission.loading.text
		else
			data.background = mission.loading.image
			data.loading_text = mission.loading.text
			data.mission = mission
		end

		if self._tutorial_ended then
			self._tutorial_ended = nil
			slot6 = self

			self.complete_job(slot5)
		end

		slot7 = data

		managers.menu.show_loading_screen(slot5, managers.menu)

		slot13 = true

		managers.queued_tasks.queue(slot5, managers.queued_tasks, nil, self.external_end_mission_clbk, self, nil, 0.6, nil)
	end

	return 
end
RaidJobManager.save_tutorial_played_flag = function (self, value)
	self._play_tutorial = not value
	slot5 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(slot3, managers.savefile)

	return 
end
RaidJobManager.set_tutorial_played_flag = function (self, value)
	self._play_tutorial = not value

	return 
end
RaidJobManager.restart_camp = function (self)
	slot3 = self

	self.deactivate_current_job(slot2)

	return 
end
RaidJobManager.external_end_mission_clbk = function (self)
	slot4 = "[RaidJobManager:external_end_mission_clbk()]"

	Application.debug(slot2, Application)

	managers.menu.loading_screen_visible = true
	managers.worldcollection.moving_to_camp = true
	slot4 = 0

	managers.worldcollection.set_world_counter(true, managers.worldcollection)

	slot9 = nil

	managers.queued_tasks.queue(true, managers.queued_tasks, nil, managers.worldcollection.level_transition_started, managers.worldcollection, nil, 0.1)

	slot4 = RaidJobManager.WORLD_POINT_MISSION
	local mission_wp = managers.mission.get_element_by_name(true, managers.mission)
	slot5 = RaidJobManager.WORLD_POINT_CAMP
	local camp_wp = managers.mission.get_element_by_name(managers.mission, managers.mission)
	slot6 = RaidJobManager.WORLD_POINT_TUTORIAL
	local tutorial_wp = managers.mission.get_element_by_name(managers.mission, managers.mission)

	if self._play_tutorial then
		self._tutorial_spawned = true
		slot6 = tutorial_wp

		tutorial_wp.on_executed(slot5)

		return 
	end

	if self._tutorial_spawned then
		tutorial_wp._action = "despawn"
		slot6 = tutorial_wp

		tutorial_wp.on_executed(slot5)

		self._tutorial_spawned = false
	end

	if mission_wp then
		mission_wp._action = "despawn"
		slot6 = mission_wp

		mission_wp.on_executed(slot5)
	else
		slot9 = " Skipping despown step..."

		Application.debug(slot5, Application, "[RaidJobManager:external_end_mission_clbk()] No mission world point in the script!", RaidJobManager.WORLD_POINT_MISSION)
	end

	if camp_wp then
		camp_wp._action = "spawn"
		slot6 = camp_wp

		camp_wp.on_executed(slot5)
	else
		slot9 = " Skipping spawn step..."

		Application.debug(slot5, Application, "[RaidJobManager:external_end_mission_clbk()] No camp world point in the script! ", RaidJobManager.WORLD_POINT_CAMP)
	end

	return 
end
RaidJobManager.is_camp_loaded = function (self)
	slot4 = RaidJobManager.WORLD_POINT_CAMP
	local camp_wp = managers.mission.get_element_by_name(slot2, managers.mission)
	local result = false

	if camp_wp then
		result = camp_wp._has_created
	end

	return result
end
RaidJobManager.has_active_job = function (self)
	return (self._current_job and true) or false
end
RaidJobManager.get_available_save_slot = function (self)
	local available_save_slot = nil

	for i = 1, RaidJobManager.NUMBER_OF_SAVE_SLOTS, 1 do
		if not self._save_slots[i] then
			available_save_slot = i

			break
		end
	end

	return available_save_slot
end
RaidJobManager.get_first_save_slot = function (self)
	if self._save_slots then
		slot3 = self._save_slots
		slot1 = next(slot2)
	end

	return slot1
end
RaidJobManager.has_available_save_slot = function (self)
	for i = 1, RaidJobManager.NUMBER_OF_SAVE_SLOTS, 1 do
		if not self._save_slots[i] then
			return true
		end
	end

	return false
end
RaidJobManager.is_at_last_event = function (self)
	local job = self._current_job or game_state_machine._current_state._current_job_data

	if not job then
		slot4 = managers.worldcollection

		if not managers.worldcollection.first_pass(slot3) then
			slot5 = "[RaidJobManager:is_at_last_event] Checking if at last event, but there is no current job!"

			Application.error(slot3, Application)
		end

		return false
	end

	if job.job_type == OperationsTweakData.JOB_TYPE_RAID or job.current_event == #job.events_index then
		return true
	end

	return false
end
RaidJobManager.complete_current_event = function (self)
	slot4 = "[RaidJobManager][complete_current_event]"

	Application.trace(slot2, Application)

	if not self._current_job then
		slot4 = "[RaidJobManager:complete_current_event] It seems you are not in a mission."

		Application.error(slot2, Application)

		return 
	end

	local event_loot_data = {}
	slot4 = managers.lootdrop
	event_loot_data.acquired = managers.lootdrop.picked_up_current_leg(slot3)
	slot4 = managers.lootdrop
	event_loot_data.spawned = managers.lootdrop.loot_spawned_current_leg(slot3)
	slot5 = event_loot_data

	table.insert(slot3, self._loot_data)

	slot5 = EventCompleteState.LOOT_DATA_READY_KEY

	managers.system_event_listener.call_listeners(slot3, managers.system_event_listener)

	if self._current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		if self._stage_success then
			self._next_event_index = self._current_job.current_event + 1
		else
			self._next_event_index = self._current_job.current_event
		end

		slot6 = self._next_event_index

		Application.trace(slot3, Application, "[RaidJobManager:complete_current_event] self._next_event_index ")
	end

	slot4 = managers.network.matchmake

	managers.network.matchmake.set_job_info_by_current_job(slot3)

	slot4 = managers.network
	slot7 = event_loot_data.spawned

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_event_loot_data", event_loot_data.acquired)

	slot4 = self

	self.on_mission_ended(slot3)

	return 
end
RaidJobManager.sync_current_event_index = function (self, current_event)
	slot6 = current_event

	self.set_current_event(slot3, self, self._current_job)

	slot4 = self

	self.on_mission_started(slot3)

	return 
end
RaidJobManager.sync_event_loot_data = function (self, loot_acquired, loot_spawned)
	slot6 = "[RaidJobManager][sync_event_loot_data]"

	Application.trace(slot4, Application)

	local event_loot_data = {
		acquired = loot_acquired,
		spawned = loot_spawned
	}
	slot7 = event_loot_data

	table.insert(Application, self._loot_data)

	slot7 = EventCompleteState.LOOT_DATA_READY_KEY

	managers.system_event_listener.call_listeners(Application, managers.system_event_listener)

	return 
end
RaidJobManager.job_loot_data = function (self)
	return self._loot_data
end
RaidJobManager.loot_acquired_in_job = function (self)
	local loot_acquired = 0
	slot4 = self._loot_data

	for i, data in pairs(slot3) do
		loot_acquired = loot_acquired + data.acquired
	end

	return loot_acquired
end
RaidJobManager.loot_spawned_in_job = function (self)
	local loot_spawned = 0
	slot4 = self._loot_data

	for i, data in pairs(slot3) do
		loot_spawned = loot_spawned + data.spawned
	end

	return loot_spawned
end
RaidJobManager.is_at_checkpoint = function (self)
	slot3 = self
	local current_event = self.current_operation_event(slot2)

	return current_event and current_event.checkpoint
end
RaidJobManager.current_operation_event = function (self)
	if not self._current_job then
		return nil
	end

	return self._current_job.events[self._current_job.events_index[self._current_job.current_event]]
end
RaidJobManager.start_next_event = function (self)
	if self._current_job.current_event then
		if self._stage_success then
			slot4 = self._current_job.current_event + 1

			self.start_event(slot2, self)
		else
			slot4 = self._current_job.current_event

			self.start_event(slot2, self)
		end
	elseif self._current_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
		slot3 = self

		self.complete_job(slot2)
	end

	self._stage_success = nil

	return 
end
RaidJobManager.start_event = function (self, event_id)
	slot6 = event_id

	Application.debug(slot3, Application, "[RaidJobManager:start_event]")

	if not self._current_job then
		return 
	end

	slot6 = event_id

	self.set_current_event(slot3, self, self._current_job)

	if self._current_job.job_type == OperationsTweakData.JOB_TYPE_RAID or #self._current_job.events_index < self._current_job.current_event then
		slot4 = self

		self.complete_job(slot3)

		return 
	end

	slot4 = managers.network
	slot6 = self._current_job.current_event

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_current_event_index")

	slot5 = "sys_location"

	managers.global_state.reset_flags_for_job(slot3, managers.global_state)

	slot5 = self._current_job.current_event_data.mission_state

	managers.global_state.set_flag(slot3, managers.global_state)

	slot5 = "level_flag"

	managers.global_state.reset_flags_for_job(slot3, managers.global_state)

	slot5 = self._current_job.current_event_data.mission_flag

	managers.global_state.set_flag(slot3, managers.global_state)

	slot5 = {
		drop_in = false,
		from_beginning = false
	}

	managers.statistics.start_session(slot3, managers.statistics)

	slot4 = managers.network
	slot7 = false

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "start_statistics_session", false)

	slot4 = managers.lootdrop

	managers.lootdrop.reset_loot_value_counters(slot3)

	slot4 = self

	self.on_mission_started(slot3)

	return 
end
RaidJobManager.complete_job = function (self)
	slot3 = Network

	if Network.is_server(slot2) and self._current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		slot4 = self._current_save_slot

		self.delete_save(slot2, self)
	end

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network
		slot4 = "sync_complete_job"

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))
	end

	self._current_save_slot = nil
	self._current_job = nil
	self._loot_data = {}
	slot3 = self

	self.on_mission_ended(slot2)

	slot3 = managers.statistics

	managers.statistics.reset_session(slot2)

	slot3 = managers.lootdrop

	managers.lootdrop.reset_loot_value_counters(slot2)

	return 
end
RaidJobManager.continue_operation = function (self, slot)
	slot4 = managers.global_state

	managers.global_state.reset_all_flags(slot3)

	slot5 = self._save_slots[slot].global_states

	managers.global_state.set_global_states(slot3, managers.global_state)

	self._current_job = self._save_slots[slot].current_job
	self._current_job.events_index = self._save_slots[slot].events_index

	if self._current_job.events_index then
		tweak_data.operations.missions[self._current_job.job_id].events_index = self._current_job.events_index
		slot5 = "|"
		local list_delimited = table.concat(self._current_job.events_index, self._current_job.events_index)
		slot5 = managers.network
		slot8 = list_delimited

		managers.network.session(self._current_job.events_index).send_to_peers_synched(self._current_job.events_index, managers.network.session(self._current_job.events_index), "sync_randomize_operation", self._current_job.job_id)
	end

	slot4 = managers.network
	slot6 = self._current_job.job_id

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_current_job")

	if self._save_slots[slot].active_card then
		slot5 = self._save_slots[slot].active_card

		managers.challenge_cards.set_active_card(slot3, managers.challenge_cards)
	end

	self._current_save_slot = slot
	self._loot_data = {}

	if self._save_slots[slot].event_data then
		slot4 = self._save_slots[slot].event_data

		for event_index, event_data in pairs(slot3) do
			self._loot_data[event_index] = event_data.loot_data
		end
	end

	slot4 = managers.network.matchmake

	managers.network.matchmake.set_job_info_by_current_job(slot3)

	if self._current_job.current_event == 1 then
		self._selected_job = self._current_job
	end

	slot5 = self._current_job.current_event

	self.start_event(slot3, self)

	return 
end
RaidJobManager.clear_operations_save_slots = function (self)
	for i = 1, RaidJobManager.NUMBER_OF_SAVE_SLOTS, 1 do
		self._save_slots[i] = nil
	end

	self._current_save_slot = nil
	slot4 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(slot2, managers.savefile)

	return 
end
RaidJobManager.delete_save = function (self, slot)
	self._save_slots[slot] = nil
	self._current_save_slot = nil
	slot5 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(nil, managers.savefile)

	return 
end
RaidJobManager.get_save_slots = function (self)
	return self._save_slots
end
RaidJobManager.save_progress = function (self)
	if self._current_job and self._current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		self._need_to_save = true
		slot4 = SavefileManager.SETTING_SLOT

		managers.savefile.save_game(slot2, managers.savefile)
	end

	return 
end
RaidJobManager.on_challenge_card_failed = function (self)
	if self._current_job and self._current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		self._save_slots[self._current_save_slot].active_card.status = ChallengeCardsManager.CARD_STATUS_FAILED
		slot4 = SavefileManager.SETTING_SLOT

		managers.savefile.save_game(ChallengeCardsManager.CARD_STATUS_FAILED, managers.savefile)
	end

	return 
end
RaidJobManager.get_current_save_slot = function (self)
	return self._current_save_slot
end
RaidJobManager.load_game = function (self, data)
	slot5 = "[RaidJobManager:load_game] "

	Application.trace(slot3, Application)

	local state = data.job_manager

	if state then
		if state.slots then
			self._save_slots = state.slots
		end

		self._play_tutorial = not state.tutorial_played
	end

	return 
end
RaidJobManager.save_game = function (self, data)
	data.job_manager = {
		tutorial_played = not self._play_tutorial
	}

	if not self._current_job or self._current_job.job_type ~= OperationsTweakData.JOB_TYPE_OPERATION or not self._need_to_save then
		data.job_manager.slots = self._save_slots
		self._need_to_save = nil
		self._next_event_index = nil

		return 
	end

	if managers.global_state then
		if self._current_save_slot and self._current_job then
			slot4 = Network

			if Network.is_server(slot3) then
				local save_data = {}

				if not self._initial_global_states then
					slot5 = managers.global_state
					slot3 = managers.global_state.get_all_global_states(slot4)
				end

				save_data.global_states = slot3
				slot5 = self._current_job
				local current_job = deep_clone(slot4)

				if not self._save_slots[self._current_save_slot] then
					self._save_slots[self._current_save_slot] = {}
				end

				save_data.event_data = self._save_slots[self._current_save_slot].event_data

				if not save_data.event_data then
					save_data.event_data = {}
				end

				if not save_data.event_data[current_job.current_event] then
					save_data.event_data[current_job.current_event] = {}
				end

				slot7 = self
				save_data.event_data[current_job.current_event].peer_data = self._prepare_peer_save_data(slot6)

				if self._next_event_index then
					current_job.current_event = self._next_event_index
				end

				slot6 = managers.challenge_cards
				local active_card = managers.challenge_cards.get_active_card(slot5)

				if active_card then
					slot7 = active_card
					save_data.active_card = deep_clone(slot6)
				end

				save_data.current_job = current_job
				slot7 = self._loot_data

				for index, data in pairs(slot6) do
					if not save_data.event_data[index] then
						save_data.event_data[index] = {}
					end

					save_data.event_data[index].loot_data = data
				end

				save_data.difficulty = Global.game_settings.difficulty
				slot8 = save_data.difficulty
				save_data.difficulty_id = tweak_data.difficulty_to_index(slot6, tweak_data)
				save_data.permission = Global.game_settings.permission
				save_data.drop_in_allowed = Global.game_settings.drop_in_allowed
				save_data.team_ai = self._save_slots[self._current_save_slot].team_ai

				if save_data.team_ai == nil then
					save_data.team_ai = Global.game_settings.team_ai
				end

				save_data.auto_kick = Global.game_settings.auto_kick
				save_data.events_index = current_job.events_index
				self._save_slots[self._current_save_slot] = save_data
			end
		end

		data.job_manager.slots = self._save_slots
		self._need_to_save = nil
	end

	return 
end
RaidJobManager._prepare_peer_save_data = function (self)
	local peer_save_data = {}
	local local_player_data = {}
	slot7 = managers.player
	local_player_data.name = utf8.to_upper(managers.player.get_character_profile_name(slot6))
	local_player_data.is_local_player = true
	slot5 = managers.skilltree
	local_player_data.class = managers.skilltree.get_character_profile_class(slot4)
	slot5 = managers.network
	slot5 = managers.network.session(slot4)
	slot5 = managers.network.session(slot4).local_peer(slot4)
	local_player_data.nationality = managers.network.session(slot4).local_peer(slot4).character(slot4)
	slot5 = managers.experience
	local_player_data.level = managers.experience.current_level(slot4)
	slot5 = managers.network
	slot5 = managers.network.session(slot4)
	slot5 = managers.network.session(slot4).local_peer(slot4)
	local_player_data.player_id = managers.network.session(slot4).local_peer(slot4).user_id(slot4)
	slot5 = managers.network
	slot5 = managers.network.session(slot4)
	slot5 = managers.network.session(slot4).local_peer(slot4)
	local_player_data.statistics = managers.network.session(slot4).local_peer(slot4).statistics(slot4)

	table.insert(slot4, peer_save_data)

	slot7 = managers.network
	slot7 = managers.network.session(local_player_data)

	for index, peer in pairs(managers.network.session(local_player_data).all_peers(local_player_data)) do
		slot10 = managers.network
		slot10 = managers.network.session(slot9)

		if peer ~= managers.network.session(slot9).local_peer(slot9) then
			local peer_data = {}
			slot11 = peer
			peer_data.name = peer.name(slot10)
			slot11 = peer
			peer_data.class = peer.class(slot10)
			slot11 = peer
			peer_data.nationality = peer.character(slot10)
			slot11 = peer
			peer_data.level = peer.level(slot10)
			slot11 = peer
			peer_data.player_id = peer.user_id(slot10)
			slot11 = peer
			peer_data.statistics = peer.statistics(slot10)
			slot12 = peer_data

			table.insert(slot10, peer_save_data)
		end
	end

	return peer_save_data
end
RaidJobManager.sync_current_job = function (self, job_id)
	self._selected_job = nil
	self._current_job = nil
	slot5 = job_id
	self._current_job = tweak_data.operations.mission_data(slot3, tweak_data.operations)

	if self._current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		slot6 = 1

		self.set_current_event(slot3, self, self._current_job)
	end

	slot4 = self

	self.on_mission_started(slot3)

	return 
end
RaidJobManager.set_memory = function (self, key, value, is_shortterm)
	if self.memory and not is_shortterm then
		self.memory[key] = value
	elseif self.shortterm_memory then
		self.shortterm_memory[key] = value
	end

	return false
end
RaidJobManager.get_memory = function (self, key, is_shortterm)
	if is_shortterm then
		return self.shortterm_memory and self.shortterm_memory[key]
	else
		return self.memory and self.memory[key]
	end

	return 
end
RaidJobManager.sync_save = function (self, data)
	local state = {
		selected_job_id = self._selected_job and self._selected_job.job_id,
		current_job_id = self._current_job and self._current_job.job_id,
		current_job_event = self._current_job and self._current_job.current_event,
		loot_data = self._loot_data
	}

	if self._selected_job and self._selected_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		state.events_index = self._selected_job.events_index
	end

	if self._current_job and self._current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		state.events_index = self._current_job.events_index
	end

	data.RaidJobManager = state

	return 
end
RaidJobManager.sync_load = function (self, data)
	local state = data.RaidJobManager
	slot6 = "[RaidJobManager:sync_load]"
	slot9 = state

	Application.debug(slot4, Application, inspect(slot8))

	if state.current_job_id then
		slot6 = state.current_job_id
		self._current_job = tweak_data.operations.mission_data(slot4, tweak_data.operations)
		self._current_job.job_id = state.current_job_id

		if self._current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
			self._current_job.events_index = state.events_index
			tweak_data.operations.missions[state.current_job_id].events_index = state.events_index
			slot7 = state.current_job_event

			self.set_current_event(state.events_index, self, self._current_job)
		end

		self._loot_data = state.loot_data
	end

	if state.selected_job_id then
		slot6 = state.selected_job_id
		self._selected_job = tweak_data.operations.mission_data(slot4, tweak_data.operations)

		if state.events_index then
			self._selected_job.events_index = state.events_index
			tweak_data.operations.missions[state.selected_job_id].events_index = state.events_index
		end

		self._selected_job.job_id = state.selected_job_id
	end

	return 
end
RaidJobManager.cleanup = function (self)
	self._current_save_slot = {}
	self._selected_job = nil
	self._current_job = nil
	self._stage_success = nil
	self._loot_data = {}
	self._tutorial_spawned = nil

	return 
end
RaidJobManager.reset = function (self)
	slot3 = self

	self.cleanup(slot2)

	self._save_slots = {}

	return 
end
RaidJobManager.on_simulation_ended = function (self)
	self._save_slots = {}
	slot3 = self

	self.cleanup(slot2)

	return 
end
RaidJobManager.stop_sounds = function (self)
	slot4 = "cleanup"
	local cleanup = SoundDevice.create_source(slot2, SoundDevice)

	return 
end
RaidJobManager.set_stage_success = function (self, success)
	slot5 = success

	print(slot3, "[RaidJobManager:set_stage_success]")

	self._stage_success = success

	return 
end
RaidJobManager.stage_success = function (self)
	return self._stage_success
end
RaidJobManager.deactivate_current_job = function (self)
	self._current_job = nil
	self._selected_job = nil
	self._stage_success = nil
	self.start_time = nil
	self.memory = nil
	self.shortterm_memory = nil
	slot3 = managers.loot

	managers.loot.on_job_deactivated(slot2)

	slot3 = managers.mission

	managers.mission.on_job_deactivated(slot2)

	slot3 = self

	self.stop_sounds(slot2)

	slot3 = managers.network.matchmake

	managers.network.matchmake.set_job_info_by_current_job(slot2)

	return 
end
RaidJobManager.set_camp = function (self, job_id)
	local job = tweak_data.operations.missions[job_id]
	self._camp = job

	return true
end
RaidJobManager.camp = function (self)
	return self._camp
end
RaidJobManager.has_active_job = function (self)
	return self._current_job ~= nil
end

return 
