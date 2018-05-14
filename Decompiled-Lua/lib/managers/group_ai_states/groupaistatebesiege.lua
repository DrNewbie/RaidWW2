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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not GroupAIStateBesiege then
	slot2 = GroupAIStateBase
	slot0 = class(slot1)
end

GroupAIStateBesiege = slot0
GroupAIStateBesiege._MAX_SIMULTANEOUS_SPAWNS = 4
GroupAIStateBesiege._POLICE_UPDATE_INTERVAL_MIN = 0.4
GroupAIStateBesiege._POLICE_UPDATE_INTERVAL_MAX = 2
GroupAIStateBesiege.init = function (self)
	slot3 = self

	GroupAIStateBesiege.super.init(slot2)

	self._tweak_data = tweak_data.group_ai.besiege
	slot3 = Network

	if Network.is_server(slot2) and not self._police_upd_task_queued then
		slot3 = managers.navigation

		if managers.navigation.is_data_ready(slot2) then
			slot3 = self

			self._queue_police_upd_task(slot2)
		end
	end

	return 
end
GroupAIStateBesiege._init_misc_data = function (self, clean_up)
	slot5 = clean_up

	GroupAIStateBesiege.super._init_misc_data(slot3, self)

	self._nr_dynamic_waves = 0
	self._nr_waves = 0
	slot4 = self

	self._create_area_data(slot3)

	self._task_data = {
		reenforce = {
			next_dispatch_t = 0,
			tasks = {}
		},
		recon = {
			next_dispatch_t = 0,
			tasks = {}
		},
		assault = {
			is_first = true,
			disabled = true
		},
		regroup = {}
	}
	slot4 = managers.navigation

	if managers.navigation.is_data_ready() then
		slot4 = self

		self._assign_enemies(slot3)
	else
		slot5 = "[GroupAIStateBase:GroupAIStateBesiege()] nav data not ready, queuing.."

		Application.debug(slot3, Application)

		slot7 = self
		slot6 = {
			"navigation_ready"
		}
		slot11 = "_assign_enemies"

		managers.navigation.add_listener(slot3, managers.navigation, self.nav_ready_listener_key(slot6), callback(slot8, self, self))
	end

	self._disable_teleport_ai = false

	return 
end
GroupAIStateBesiege.set_disable_teleport_ai = function (self, value)
	self._disable_teleport_ai = value

	return 
end
GroupAIStateBesiege.clean_up = function (self)
	slot3 = managers.navigation
	slot6 = self

	managers.navigation.remove_listener(slot2, self.nav_ready_listener_key(slot5))

	if self._police_upd_task_queued then
		slot4 = "GroupAIStateBesiege._upd_police_activity"

		managers.enemy.unqueue_task(slot2, managers.enemy)
	end

	if self._hostage_upd_key then
		slot4 = self._hostage_upd_key

		managers.enemy.unqueue_task(slot2, managers.enemy)
	end

	slot4 = true

	self._init_misc_data(slot2, self)

	return 
end
GroupAIStateBesiege.nav_ready_listener_key = function (self)
	return "GroupAIStateBesiege"
end
GroupAIStateBesiege._assign_enemies = function (self)
	local all_areas = self._area_data
	slot4 = self._police

	for u_key, u_data in pairs(slot3) do
		if not u_data.assigned_area then
			slot9 = u_data.unit
			slot9 = u_data.unit.movement(slot8)
			local nav_seg = u_data.unit.movement(slot8).nav_tracker(slot8).nav_segment(slot8)
			slot14 = nav_seg
			slot12 = u_key

			self.set_enemy_assigned(u_data.unit.movement(slot8).nav_tracker(slot8), self, self.get_area_from_nav_seg_id(slot12, self))
		end
	end

	slot4 = managers.navigation
	slot7 = self

	managers.navigation.remove_listener(slot3, self.nav_ready_listener_key(slot6))

	return 
end
GroupAIStateBesiege.update = function (self, t, dt)
	slot7 = dt

	GroupAIStateBesiege.super.update(slot4, self, t)

	slot5 = Network

	if Network.is_server(slot4) then
		if not self._police_upd_task_queued then
			slot5 = self

			self._queue_police_upd_task(slot4)
		end

		slot5 = managers.navigation

		if managers.navigation.is_data_ready(slot4) and self._draw_enabled then
			slot6 = t

			self._draw_enemy_activity(slot4, self)

			slot5 = self

			self._draw_spawn_points(slot4)
		end
	end

	return 
end
GroupAIStateBesiege.paused_update = function (self, t, dt)
	slot7 = dt

	GroupAIStateBesiege.super.paused_update(slot4, self, t)

	slot5 = Network

	if Network.is_server(slot4) and self._draw_enabled then
		slot5 = managers.navigation

		if managers.navigation.is_data_ready(slot4) then
			slot6 = t

			self._draw_enemy_activity(slot4, self)

			slot5 = self

			self._draw_spawn_points(slot4)
		end
	end

	return 
end
GroupAIStateBesiege._queue_police_upd_task = function (self)
	self._police_upd_task_queued = true
	slot10 = self._spawning_groups
	slot7 = self._t + ((next(slot9) and GroupAIStateBesiege._POLICE_UPDATE_INTERVAL_MIN) or GroupAIStateBesiege._POLICE_UPDATE_INTERVAL_MAX)

	managers.enemy.queue_task(slot2, managers.enemy, "GroupAIStateBesiege._upd_police_activity", self._upd_police_activity, self)

	return 
end
GroupAIStateBesiege.assign_enemy_to_group_ai = function (self, unit, team_id)
	slot5 = unit
	local u_tracker = unit.movement(slot4).nav_tracker(slot4)
	local seg = u_tracker.nav_segment(unit.movement(slot4))
	slot8 = seg
	local area = self.get_area_from_nav_seg_id(u_tracker, self)
	slot8 = unit
	local u_name = unit.name(self)
	local u_category = nil
	slot10 = tweak_data.group_ai.unit_categories

	for _, nationality in pairs(slot9) do
		slot15 = nationality

		for cat_name, category in pairs(slot14) do
			slot20 = category.units

			for _, test_u_name in ipairs(slot19) do
				if u_name == test_u_name then
					u_category = cat_name

					break
				end
			end
		end
	end

	local group_desc = {
		size = 1,
		type = u_category or "custom"
	}
	local group = self._create_group(slot10, self)
	group.team = self._teams[team_id]
	local grp_objective = nil
	slot13 = unit
	slot13 = unit.brain(group_desc)
	local objective = unit.brain(group_desc).objective(group_desc)
	local grp_obj_type = (self._task_data.assault.active and "assault_area") or "recon_area"

	if objective then

		-- Decompilation error in this vicinity:
		slot13 = {
			type = grp_obj_type
		}
		slot17 = objective.nav_seg
		slot13.area = self.get_area_from_nav_seg_id(slot15, self) or area
		grp_objective = slot13
		objective.grp_objective = grp_objective
	else
		grp_objective = {
			type = grp_obj_type,
			area = area
		}
	end

	grp_objective.moving_out = false
	group.objective = grp_objective
	group.has_spawned = true
	slot16 = group
	slot19 = unit

	self._add_group_member(slot14, self, unit.key(slot18))

	slot16 = area
	slot19 = unit

	self.set_enemy_assigned(slot14, self, unit.key(slot18))

	return 
end
GroupAIStateBesiege.on_enemy_unregistered = function (self, unit)
	slot5 = unit

	GroupAIStateBesiege.super.on_enemy_unregistered(slot3, self)

	if self._is_server then
		slot5 = nil
		slot8 = unit

		self.set_enemy_assigned(slot3, self, unit.key(slot7))

		slot4 = unit
		slot4 = unit.brain(slot3)
		local objective = unit.brain(slot3).objective(slot3)

		if objective and objective.fail_clbk then
			local fail_clbk = objective.fail_clbk
			objective.fail_clbk = nil
			slot6 = unit

			fail_clbk(slot5)
		end
	end

	return 
end
GroupAIStateBesiege._upd_police_activity = function (self)
	self._police_upd_task_queued = false

	if self._ai_enabled and not managers.worldcollection.level_transition_in_progress then
		slot3 = self

		self._upd_SO(slot2)

		slot3 = self

		self._upd_SO_groups(slot2)

		slot3 = self

		self._check_spawn_phalanx(slot2)

		slot3 = self

		self._check_phalanx_group_has_spawned(slot2)

		slot3 = self

		self._check_phalanx_damage_reduction_increase(slot2)

		if self._enemy_weapons_hot then
			slot3 = self

			self._claculate_drama_value(slot2)

			slot3 = self

			self._upd_regroup_task(slot2)

			slot3 = self

			self._upd_reenforce_tasks(slot2)

			slot3 = self

			self._upd_recon_tasks(slot2)

			slot3 = self

			self._upd_assault_tasks(slot2)

			slot3 = self

			self._begin_new_tasks(slot2)

			slot3 = self

			self._upd_group_spawning(slot2)

			slot3 = self

			self._upd_groups(slot2)

			slot3 = self

			self._distance_based_retire_groups(slot2)

			slot3 = self

			self._check_and_teleport_team_ai(slot2)
		end
	end

	slot3 = self

	self._queue_police_upd_task(slot2)

	return 
end
GroupAIStateBesiege._check_and_teleport_team_ai = function (self)
	if self._disable_teleport_ai then
		return 
	end

	slot3 = Application
	local now = Application.time(slot2)
	self._next_teleport_teamai_t = self._next_teleport_teamai_t or now

	if self._next_teleport_teamai_t < now then
		slot4 = self

		self.teleport_team_ai(slot3)

		self._next_teleport_teamai_t = now + 4
	end

	return 
end
GroupAIStateBesiege._upd_SO = function (self)
	local t = self._t
	local so_to_delete = {}
	slot5 = self._special_objectives

	for id, so in pairs(slot4) do
		if so.delay_t < t then
			if so.data.interval then
				so.delay_t = t + so.data.interval
			end

			if math.random() <= so.chance then
				local so_data = so.data
				so.chance = so_data.base_chance

				if so_data.objective.follow_unit then
					slot11 = so_data.objective.follow_unit
				else
					slot14 = so.administered
					local unit_data = GroupAIStateBase._execute_so(slot10, self, so_data, so.rooms)

					if unit_data then
						if so.remaining_usage then
							so.remaining_usage = so.remaining_usage - 1

							if so.remaining_usage == 0 then
								slot13 = id

								table.insert(slot11, so_to_delete)
							end
						end

						if so.non_repeatable then
							slot13 = unit_data.unit
							so.administered[unit_data.unit.key(slot12)] = true
						end
					end
				end
			else
				so.chance = so.chance + so.data.chance_inc
			end

			if not so.data.interval then
				slot11 = id

				table.insert(slot9, so_to_delete)
			end
		end
	end

	slot5 = so_to_delete

	for _, so_id in ipairs(slot4) do
		slot11 = so_id

		self.remove_special_objective(slot9, self)
	end

	return 
end
GroupAIStateBesiege._begin_new_tasks = function (self)
	local all_areas = self._area_data
	local nav_manager = managers.navigation
	local all_nav_segs = nav_manager._nav_segments
	local task_data = self._task_data
	local t = self._t
	local reenforce_candidates = nil
	local reenforce_data = task_data.reenforce

	if reenforce_data.next_dispatch_t and reenforce_data.next_dispatch_t < t then
		reenforce_candidates = {}
	end

	local recon_candidates, are_recon_candidates_safe = nil
	local recon_data = task_data.recon

	if recon_data.next_dispatch_t and recon_data.next_dispatch_t < t and not task_data.assault.active and not task_data.regroup.active then
		recon_candidates = {}
	end

	local assault_candidates = nil
	local assault_data = task_data.assault

	if 0 < self._difficulty_value and assault_data.next_dispatch_t and assault_data.next_dispatch_t < t and not task_data.regroup.active then
		assault_candidates = {}
	end

	if not reenforce_candidates and not recon_candidates and not assault_candidates then
		return 
	end

	local found_areas = {}
	local to_search_areas = {}
	slot17 = all_areas

	for area_id, area in pairs(slot16) do
		if area.spawn_points then
			slot22 = area.spawn_points

			for _, sp_data in pairs(slot21) do
				if sp_data.delay_t <= t and not all_nav_segs[sp_data.nav_seg].disabled then
					slot28 = area

					table.insert(slot26, to_search_areas)

					found_areas[area_id] = true

					break
				end
			end
		end

		if not found_areas[area_id] and area.spawn_groups then
			slot22 = area.spawn_groups

			for _, sp_data in pairs(slot21) do
				if sp_data.delay_t <= t and not all_nav_segs[sp_data.nav_seg].disabled then
					slot28 = area

					table.insert(slot26, to_search_areas)

					found_areas[area_id] = true

					break
				end
			end
		end
	end

	if #to_search_areas == 0 then
		return 
	end

	if assault_candidates and self._hunt_mode then
		slot17 = self._char_criminals

		for criminal_key, criminal_data in pairs(slot16) do
			if not criminal_data.status then
				local nav_seg = criminal_data.tracker.nav_segment(slot21)
				slot24 = nav_seg
				local area = self.get_area_from_nav_seg_id(criminal_data.tracker, self)
				found_areas[area] = true
				slot25 = area

				table.insert(self, assault_candidates)
			end
		end
	end

	local i = 1

	repeat
		local area = to_search_areas[i]
		local force_factor = area.factors.force
		local demand = force_factor and force_factor.force
		local nr_police = table.size(slot20)
		slot22 = area.criminal.units
		local nr_criminals = table.size(area.police.units)

		if reenforce_candidates and demand and 0 < demand and nr_criminals == 0 then
			local area_free = true
			slot24 = reenforce_data.tasks

			for i_task, reenforce_task_data in ipairs(slot23) do
				if reenforce_task_data.target_area == area then
					area_free = false

					break
				end
			end

			if area_free then
				slot25 = area

				table.insert(slot23, reenforce_candidates)
			end
		end

		if recon_candidates and (area.loot or area.hostages) then
			local occupied = nil
			slot24 = self._groups

			for group_id, group in pairs(slot23) do
				if group.objective.target_area == area or group.objective.area == area then
					occupied = true

					break
				end
			end

			if not occupied then
				local is_area_safe = nr_criminals == 0

				if is_area_safe then
					if are_recon_candidates_safe then
						slot26 = area

						table.insert(slot24, recon_candidates)
					else
						are_recon_candidates_safe = true
						recon_candidates = {
							area
						}
					end
				elseif not are_recon_candidates_safe then
					slot26 = area

					table.insert(slot24, recon_candidates)
				end
			end
		end

		if assault_candidates then
			slot23 = area.criminal.units

			for criminal_key, _ in pairs(slot22) do
				if not self._criminals[criminal_key].status and not self._criminals[criminal_key].is_deployable then
					slot29 = area

					table.insert(slot27, assault_candidates)

					break
				end
			end
		end

		if nr_criminals == 0 then
			slot23 = area.neighbours

			for neighbour_area_id, neighbour_area in pairs(slot22) do
				if not found_areas[neighbour_area_id] then
					slot29 = neighbour_area

					table.insert(slot27, to_search_areas)

					found_areas[neighbour_area_id] = true
				end
			end
		end

		i = i + 1
	until #to_search_areas < i

	if assault_candidates and 0 < #assault_candidates then
		slot19 = assault_candidates

		self._begin_assault_task(slot17, self)

		recon_candidates = nil
	end

	if recon_candidates and 0 < #recon_candidates then
		local recon_area = recon_candidates[math.random(slot17)]
		slot20 = recon_area

		self._begin_recon_task(#recon_candidates, self)
	end

	if reenforce_candidates and 0 < #reenforce_candidates then
		slot18 = #reenforce_candidates
		local lucky_i_candidate = math.random(slot17)
		local reenforce_area = reenforce_candidates[lucky_i_candidate]
		slot21 = reenforce_area

		self._begin_reenforce_task(slot19, self)

		recon_candidates = nil
	end

	return 
end
GroupAIStateBesiege._begin_assault_task = function (self, assault_areas)
	local assault_task = self._task_data.assault
	assault_task.active = true
	assault_task.next_dispatch_t = nil
	assault_task.target_areas = assault_areas
	assault_task.phase = "anticipation"
	assault_task.start_t = self._t
	local anticipation_duration = self._get_anticipation_duration(slot4, self, self._tweak_data.assault.anticipation_duration)
	assault_task.is_first = nil
	assault_task.phase_end_t = self._t + anticipation_duration
	slot9 = self._tweak_data.assault.force
	slot10 = self._tweak_data.assault.force_balance_mul
	slot6 = self.get_difficulty_dependent_value(assault_task.is_first, self) * self._get_balancing_multiplier(self, self)
	assault_task.force = math.ceil(self)
	assault_task.use_smoke = true
	assault_task.use_smoke_timer = 0
	assault_task.use_spawn_event = true
	assault_task.force_spawned = 0

	if 0 < self._hostage_headcount then
		slot8 = self._tweak_data.assault.hostage_hesitation_delay
		assault_task.phase_end_t = assault_task.phase_end_t + self.get_difficulty_dependent_value(slot6, self)
		assault_task.is_hesitating = true
		assault_task.voice_delay = self._t + (assault_task.phase_end_t - self._t) / 2
	end

	self._downs_during_assault = 0

	if self._hunt_mode then
		assault_task.phase_end_t = 0
	else
		slot7 = anticipation_duration

		managers.hud.setup_anticipation(slot5, managers.hud)

		slot6 = managers.hud

		managers.hud.start_anticipation(slot5)
	end

	slot8 = {
		skip_idle_check = true
	}

	managers.dialog.queue_dialog(slot5, managers.dialog, "player_gen_incoming_wave")

	if self._draw_drama then
		slot7 = {
			self._t
		}

		table.insert(slot5, self._draw_drama.assault_hist)
	end

	self._task_data.recon.tasks = {}

	return 
end
GroupAIStateBesiege._upd_assault_tasks = function (self)

	-- Decompilation error in this vicinity:
	local task_data = self._task_data.assault

	if not task_data.active then
		return 
	end

	local t = self._t
	slot5 = self

	self._assign_recon_groups_to_retire(slot4)

	slot6 = self._tweak_data.assault.force_pool
	slot7 = self._tweak_data.assault.force_pool_balance_mul
	local force_pool = self.get_difficulty_dependent_value(slot4, self) * self._get_balancing_multiplier(self, self)
	local task_spawn_allowance = force_pool - ((self._hunt_mode and 0) or task_data.force_spawned)

	if task_data.phase == "anticipation" then
		if task_spawn_allowance <= 0 then
			task_data.phase = "fade"
			task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
		elseif task_data.phase_end_t < t or self._drama_data.zone == "high" then
			slot8 = "start_assault"

			managers.mission.call_global_event(slot6, managers.mission)

			slot7 = managers.hud

			managers.hud.start_assault(slot6)

			slot8 = false

			self._set_rescue_state(slot6, self)

			task_data.phase = "build"
			task_data.phase_end_t = self._t + self._tweak_data.assault.build_duration
			task_data.is_hesitating = nil
			slot8 = true

			self.set_assault_mode(self._tweak_data.assault.build_duration, self)

			slot8 = "assault"

			managers.music.raid_music_state_change(self._tweak_data.assault.build_duration, managers.music)

			slot8 = false

			managers.trade.set_trade_countdown(self._tweak_data.assault.build_duration, managers.trade)
		else
			slot8 = task_data.phase_end_t - t

			managers.hud.check_start_anticipation_music(slot6, managers.hud)

			if task_data.is_hesitating and task_data.voice_delay < self._t then
				if 0 < self._hostage_headcount then
					local best_group = nil
					slot8 = self._groups

					for _, group in pairs(slot7) do
						if not best_group or group.objective.type == "reenforce_area" then
							best_group = group
						elseif best_group.objective.type ~= "reenforce_area" and group.objective.type ~= "retire" then
							best_group = group
						end
					end

					if best_group then
						slot9 = best_group

						if self._voice_delay_assault(slot7, self) then
							task_data.is_hesitating = nil
						end
					end
				else
					task_data.is_hesitating = nil
				end
			end
		end
	elseif task_data.phase == "build" then
		if task_spawn_allowance <= 0 then
			task_data.phase = "fade"
			task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
		elseif task_data.phase_end_t < t or self._drama_data.zone == "high" then
			task_data.phase = "sustain"
			slot10 = self._tweak_data.assault.sustain_duration_min
			slot11 = self._tweak_data.assault.sustain_duration_max
			slot8 = self.get_difficulty_dependent_value(self, self)
			slot9 = self._tweak_data.assault.sustain_duration_balance_mul
			task_data.phase_end_t = t + math.lerp(slot6, self.get_difficulty_dependent_value(slot8, self), math.random()) * self._get_balancing_multiplier(self.get_difficulty_dependent_value(slot8, self), self)
		end
	elseif task_data.phase == "sustain" then
		if task_spawn_allowance <= 0 then
			task_data.phase = "fade"
			slot8 = "assault"

			managers.music.raid_music_state_change(slot6, managers.music)

			task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
		elseif task_data.phase_end_t < t and not self._hunt_mode then
			slot8 = "control"

			managers.music.raid_music_state_change(slot6, managers.music)

			task_data.phase = "fade"
			task_data.phase_end_t = t + self._tweak_data.assault.fade_duration
		end
	else
		local end_assault = false
		slot9 = "assault"
		local enemies_left = self._count_police_force(slot7, self)

		if not self._hunt_mode then
			local min_enemies_left = 7

			if enemies_left < min_enemies_left or task_data.phase_end_t + 350 < t then
				if task_data.phase_end_t - 8 < t and not task_data.said_retreat then
					if self._drama_data.amount < tweak_data.drama.assault_fade_end then
						task_data.said_retreat = true
						slot10 = self

						self._police_announce_retreat(slot9)
					end
				elseif task_data.phase_end_t < t and self._drama_data.amount < tweak_data.drama.assault_fade_end then
					slot11 = 4

					if self._count_criminals_engaged_force(slot9, self) <= 3 then
						end_assault = true
					end
				end
			else
				slot11 = min_enemies_left - enemies_left

				print(slot9, "kill more enemies to end fade phase: ")
			end

			if task_data.force_end or end_assault then
				slot10 = "assault task clear"

				print(slot9)

				task_data.active = nil
				task_data.phase = nil
				task_data.said_retreat = nil

				if self._draw_drama then
					self._draw_drama.assault_hist[#self._draw_drama.assault_hist][2] = t
				end

				slot11 = "control"

				managers.music.raid_music_state_change(slot9, managers.music)

				slot11 = "end_assault"

				managers.mission.call_global_event(slot9, managers.mission)

				slot10 = self

				self._begin_regroup_task(slot9)

				return 
			end
		else
			slot9 = "disable hunt mode to end fade phase"

			print(slot8)
		end
	end

	if self._drama_data.amount <= tweak_data.drama.low then
		slot7 = self._player_criminals

		for criminal_key, criminal_data in pairs(slot6) do
			slot13 = criminal_data.unit

			self.criminal_spotted(slot11, self)

			slot12 = self._groups

			for group_id, group in pairs(slot11) do
				if group.objective.charge then
					slot17 = group.units

					for u_key, u_data in pairs(slot16) do
						slot22 = u_data.unit
						slot24 = criminal_key

						u_data.unit.brain(slot21).clbk_group_member_attention_identified(slot21, u_data.unit.brain(slot21), nil)
					end
				end
			end
		end
	end

	local primary_target_area, target_pos = nil

	if task_data.target_areas then
		primary_target_area = task_data.target_areas[1]
		target_pos = primary_target_area.pos
	end

	slot11 = primary_target_area

	self._upd_assault_spawning(slot8, self, task_data)

	if task_data.phase ~= "anticipation" then
		if task_data.use_smoke_timer < t then
			task_data.use_smoke = true
		end

		if self._smoke_grenade_queued and task_data.use_smoke then
			slot9 = self

			if not self.is_smoke_grenade_active(slot8) then
				slot13 = self._smoke_grenade_queued[4]

				self.detonate_smoke_grenade(slot8, self, self._smoke_grenade_queued[1], self._smoke_grenade_queued[1], self._smoke_grenade_queued[2])

				if self._smoke_grenade_queued[3] then
					self._smoke_grenade_ignore_control = true
				end
			end
		end
	end

	slot10 = task_data.phase

	self._assign_enemy_groups_to_assault(slot8, self)

	return 
end
GroupAIStateBesiege._upd_assault_spawning = function (self, task_data, primary_target_area)
	slot7 = "assault"
	local nr_wanted = task_data.force - self._count_police_force(slot5, self)

	if task_data.phase == "anticipation" then
		nr_wanted = nr_wanted - 5
	end

	if 0 < nr_wanted and task_data.phase ~= "fade" then
		slot6 = self._spawning_groups

		if next(slot5) then
		else
			local spawn_group, group_nationality, spawn_group_type = self._find_spawn_group_near_area(slot5, self, primary_target_area, self._tweak_data.assault.groups, nil, nil)

			if spawn_group then
				local grp_objective = {
					attitude = "avoid",
					stance = "hos",
					pose = "crouch",
					type = "assault_area",
					area = spawn_group.area,
					coarse_path = {
						{
							spawn_group.area.pos_nav_seg,
							spawn_group.area.pos
						}
					}
				}
				slot15 = task_data

				self._spawn_in_group(, self, spawn_group, group_nationality, spawn_group_type, grp_objective)
			end
		end
	end

	return 
end
GroupAIStateBesiege._distance_based_retire_groups = function (self)
	slot3 = managers.raid_job
	local current_level = managers.raid_job.current_job(slot2)

	if current_level then
		local max_distance = current_level.enemy_retire_distance_threshold or GroupAIStateZone.MAX_DISTANCE_TO_PLAYER
		slot5 = self._groups

		for group_id, group in pairs(slot4) do
			if group.has_spawned and group.objective.type ~= "retire" then
				local closest_dis_sq = nil
				slot13 = self

				for u_key, u_data in pairs(self.all_player_criminals(slot12)) do
					slot17 = group.objective.area.pos
					local my_dis_sq = mvector3.distance_sq(slot15, u_data.m_pos)

					if not closest_dis_sq or my_dis_sq < closest_dis_sq then
						closest_dis_sq = my_dis_sq
					end
				end

				if closest_dis_sq and max_distance < closest_dis_sq then
					slot12 = group

					self._assign_group_to_retire(slot10, self)
				end
			end
		end
	end

	return 
end
GroupAIStateBesiege._verify_anticipation_spawn_point = function (self, sp_data)
	local sp_nav_seg = sp_data.nav_seg
	slot6 = sp_nav_seg
	local area = self.get_area_from_nav_seg_id(slot4, self)

	if area.is_safe then
		return true
	else
		slot6 = self._criminals

		for criminal_key, c_data in pairs(slot5) do
			if not c_data.status and not c_data.is_deployable then
				slot12 = c_data.m_pos

				if mvector3.distance(slot10, sp_data.pos) < 2500 then
					slot11 = sp_data.pos.z - c_data.m_pos.z

					if math.abs(slot10) < 300 then
						return 
					end
				end
			end
		end
	end

	return true
end
GroupAIStateBesiege.is_smoke_grenade_active = function (self)
	if self._smoke_end_t then
		slot3 = Application

		return Application.time(slot2) < self._smoke_end_t
	end
end
GroupAIStateBesiege.is_cs_grenade_active = function (self)
	if self._cs_end_t then
		slot3 = Application

		return Application.time(slot2) < self._cs_end_t
	end
end
GroupAIStateBesiege._begin_recon_task = function (self, recon_area)
	local new_task = {
		use_smoke = true,
		use_spawn_event = true,
		target_area = recon_area,
		start_t = self._t
	}
	slot6 = new_task

	table.insert(slot4, self._task_data.recon.tasks)

	self._task_data.recon.next_dispatch_t = nil

	return 
end
GroupAIStateBesiege._begin_regroup_task = function (self)
	self._task_data.regroup.start_t = self._t
	slot6 = self._tweak_data.regroup.duration
	self._task_data.regroup.end_t = self._t + self.get_difficulty_dependent_value(slot4, self)
	self._task_data.regroup.active = true

	if self._draw_drama then
		slot4 = {
			self._t
		}

		table.insert(slot2, self._draw_drama.regroup_hist)
	end

	slot3 = self

	self._assign_assault_groups_to_retire(slot2)

	return 
end
GroupAIStateBesiege._end_regroup_task = function (self)
	if self._task_data.regroup.active then
		self._task_data.regroup.active = nil
		slot4 = true

		managers.trade.set_trade_countdown(nil, managers.trade)

		slot4 = false

		self.set_assault_mode(nil, self)

		if not self._smoke_grenade_ignore_control then
			slot3 = managers.network
			slot4 = "sync_smoke_grenade_kill"

			managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))

			slot3 = self

			self.sync_smoke_grenade_kill(slot2)
		end

		local dmg = self._downs_during_assault
		local limits = tweak_data.group_ai.bain_assault_praise_limits
		local result = (dmg < limits[1] and 0) or (dmg < limits[2] and 1) or 2
		slot7 = result

		managers.hud.end_assault(slot5, managers.hud)

		slot6 = self

		self._mark_hostage_areas_as_unsafe(slot5)

		slot7 = true

		self._set_rescue_state(slot5, self)

		if not self._task_data.assault.next_dispatch_t then
			local assault_delay = self._tweak_data.assault.delay
			slot10 = assault_delay
			self._task_data.assault.next_dispatch_t = self._t + self.get_difficulty_dependent_value(slot8, self)
		end

		if self._draw_drama then
			self._draw_drama.regroup_hist[#self._draw_drama.regroup_hist][2] = self._t
		end

		self._task_data.recon.next_dispatch_t = self._t
	end

	return 
end
GroupAIStateBesiege._upd_regroup_task = function (self)
	if not self._task_data.regroup.active then
		return 
	end

	slot3 = self

	self._assign_assault_groups_to_retire(slot2)

	if self._task_data.regroup.end_t < self._t or self._drama_data.zone == "low" then
		slot3 = self

		self._end_regroup_task(slot2)
	end

	return 
end
GroupAIStateBesiege._find_nearest_safe_area = function (self, start_area, start_pos)
	local to_search_areas = {
		group.objective.area
	}
	local found_areas = {
		[group.objective.area] = "init"
	}

	repeat
		slot8 = 1
		local search_area = table.remove(slot6, to_search_areas)
		slot8 = search_area.criminal.units

		if next(to_search_areas) then
			assault_area = search_area

			break
		else
			slot8 = search_area.neighbours

			for other_area_id, other_area in pairs(slot7) do
				if not found_areas[other_area] then
					slot14 = other_area

					table.insert(slot12, to_search_areas)

					found_areas[other_area] = search_area
				end
			end
		end
	until #to_search_areas == 0

	local mvec3_dis_sq = mvector3.distance_sq
	local all_areas = self._area_data
	local all_nav_segs = managers.navigation._nav_segments
	local all_doors = managers.navigation._room_doors
	local my_enemy_pos, my_enemy_dis_sq = nil
	slot13 = self._criminals

	for c_key, c_data in pairs(slot12) do
		slot19 = c_data.m_pos
		local my_dis = mvec3_dis_sq(slot17, start_pos)

		if not my_enemy_pos or my_enemy_dis_sq < my_dis then
			slot22 = start_pos
			slot19 = mvector3.z(slot20) - mvector3.z(c_data.m_pos)

			if math.abs(slot18) < 300 then
				my_enemy_pos = c_data.m_pos
				my_enemy_dis_sq = my_dis
			end
		end
	end

	if not my_enemy_pos or 9000000 < my_enemy_dis_sq then
		return 
	end

	local closest_dis, closest_safe_nav_seg_id, closest_area = nil
	local start_neighbours = all_nav_segs[nav_seg_id].neighbours
	slot17 = start_neighbours

	for neighbour_seg_id, door_list in pairs(slot16) do
		slot23 = neighbour_seg_id
		local neighbour_area = self.get_area_from_nav_seg_id(slot21, self)
		slot23 = neighbour_area.criminal.units

		if not next(self) then
			local neighbour_nav_seg = all_nav_segs[neighbour_seg_id]

			if not neighbour_nav_seg.disabled then
				slot25 = neighbour_nav_seg.pos

				if my_enemy_dis_sq < mvec3_dis_sq(slot23, my_enemy_pos) then
					slot24 = door_list

					for _, i_door in ipairs(slot23) do
						slot29 = i_door

						if type(slot28) == "number" then
							local door = all_doors[i_door]
							slot31 = start_pos
							local my_dis = mvec3_dis_sq(slot29, door.center)

							if not closest_dis or my_dis < closest_dis then
								closest_dis = my_dis
								closest_safe_nav_seg_id = neighbour_seg_id
								closest_area = neighbour_area
							end
						end
					end
				end
			end
		end
	end

	return closest_area, closest_safe_nav_seg_id
end
GroupAIStateBesiege._upd_recon_tasks = function (self)
	local t = self._t
	slot4 = self

	self._assign_enemy_groups_to_recon(slot3)

	local task_data = self._task_data.recon.tasks[1]

	if not task_data then
		return 
	end

	slot5 = self

	self._assign_assault_groups_to_retire(slot4)

	slot5 = self._spawning_groups

	if next(slot4) then
		return 
	end

	local target_pos = task_data.target_area.pos
	slot7 = self._tweak_data.recon.force
	slot8 = "recon"
	local force_wanted = self.get_difficulty_dependent_value(slot5, self) - self._count_police_force(self, self)

	if force_wanted <= 0 then
		return 
	end

	slot16 = "_verify_anticipation_spawn_point"
	local spawn_group, group_nationality, spawn_group_type = self._find_spawn_group_near_area(slot6, self, task_data.target_area, self._tweak_data.recon.groups, nil, callback(slot13, self, self))

	if spawn_group then
		local grp_objective = {
			attitude = "avoid",
			scan = true,
			stance = "hos",
			type = "recon_area",
			area = spawn_group.area,
			target_area = task_data.target_area
		}
		slot16 = nil

		self._spawn_in_group(slot10, self, spawn_group, group_nationality, spawn_group_type, grp_objective)
	end

	return 
end
GroupAIStateBesiege._find_spawn_points_near_area = function (self, target_area, nr_wanted, target_pos, max_dis, verify_clbk)
	local all_areas = self._area_data
	local all_nav_segs = managers.navigation._nav_segments
	local mvec3_dis = mvector3.distance
	local t = self._t
	local distances = {}
	local s_points = {}
	target_pos = target_pos or target_area.pos
	max_dis = max_dis or self._tweak_data.max_spawning_distance
	local to_search_areas = {
		target_area
	}
	local found_areas = {
		[target_area.id] = true
	}

	repeat
		slot17 = 1
		local search_area = table.remove(slot15, to_search_areas)
		local spawn_points = search_area.spawn_points

		if spawn_points then
			slot18 = spawn_points

			for _, sp_data in ipairs(slot17) do
				if sp_data.delay_t <= t then
				end
			end
		end

		if #s_points == nr_wanted then
			break
		end

		slot18 = all_areas

		for other_area_id, other_area in pairs(slot17) do
			if not found_areas[other_area_id] and other_area.neighbours[search_area.id] then
				slot24 = other_area

				table.insert(slot22, to_search_areas)

				found_areas[other_area_id] = true
			end
		end
	until #to_search_areas == 0

	return 0 < #s_points and s_points
end
GroupAIStateBesiege._find_spawn_group_near_area = function (self, target_area, allowed_groups, target_pos, max_dis, verify_clbk)
	local all_areas = self._area_data
	local mvec3_dis = mvector3.distance_sq
	max_dis = max_dis or self._tweak_data.max_spawning_distance
	local min_dis = (self._tweak_data.min_spawning_distance and self._tweak_data.min_spawning_distance * self._tweak_data.min_spawning_distance) or 0
	local max_z_dis_sq = (self._tweak_data.max_spawning_height_diff and self._tweak_data.max_spawning_height_diff * self._tweak_data.max_spawning_height_diff) or 0
	max_dis = max_dis and max_dis * max_dis
	local t = self._t
	local valid_spawn_groups = {}
	local valid_spawn_group_distances = {}
	local total_dis = 0
	target_pos = target_pos or target_area.pos
	local to_search_areas = {
		target_area
	}
	local found_areas = {
		[target_area.id] = true
	}

	repeat
		slot19 = 1
		local search_area = table.remove(slot17, to_search_areas)
		local spawn_groups = search_area.spawn_groups

		if spawn_groups then
			slot20 = spawn_groups

			for _, spawn_group in ipairs(slot19) do
				if spawn_group.delay_t <= t then
				end
			end
		end

		slot20 = all_areas

		for other_area_id, other_area in pairs(slot19) do
			if not found_areas[other_area_id] and other_area.neighbours[search_area.id] then
				slot26 = other_area

				table.insert(slot24, to_search_areas)

				found_areas[other_area_id] = true
			end
		end
	until #to_search_areas == 0

	slot18 = valid_spawn_group_distances

	if not next(slot17) then
		return 
	end

	if total_dis == 0 then
		total_dis = 1
	end

	local total_weight = 0
	local candidate_groups = {}
	local dis_limit = 100000000
	slot21 = valid_spawn_group_distances

	for i, dis in ipairs(slot20) do
		local weight = valid_spawn_group_distances[i]
		slot28 = 0.2
		slot32 = weight / dis_limit
		weight = math.lerp(slot26, 1, math.min(slot30, 1))
		local spawn_group = valid_spawn_groups[i]
		local group_types = spawn_group.mission_element.spawn_groups(1)
		local nationality = spawn_group.mission_element.nationality(spawn_group.mission_element)
		slot36 = weight
		total_weight = total_weight + self._choose_best_groups(spawn_group.mission_element, self, candidate_groups, spawn_group, nationality, group_types, allowed_groups)
	end

	if total_weight == 0 then
		return 
	end

	slot23 = total_weight

	return self._choose_best_group(slot20, self, candidate_groups)
end
GroupAIStateBesiege._choose_best_groups = function (self, best_groups, group, nationality, group_types, allowed_groups, weight)
	local total_weight = 0
	slot10 = group_types

	for _, group_type in ipairs(slot9) do
		slot16 = group_type

		if not managers.enemy.is_spawn_group_allowed(slot14, managers.enemy) then
		elseif tweak_data.group_ai.enemy_spawn_groups[nationality][group_type] then
			local cat_weights = allowed_groups[group_type]

			if cat_weights then
				local cat_weight = self.get_difficulty_dependent_value(slot15, self)
				local mod_weight = weight * cat_weight
				slot19 = {
					group = group,
					nationality = nationality,
					group_type = group_type,
					wght = mod_weight
				}

				table.insert(cat_weights, best_groups)

				total_weight = total_weight + mod_weight
			end
		else
			slot18 = group.mission_element._id

			debug_pause(slot14, "[GroupAIStateBesiege:_find_spawn_group_near_area] inexistent spawn_group:", group_type, ". element id:")
		end
	end

	return total_weight
end
GroupAIStateBesiege._choose_best_group = function (self, best_groups, total_weight)
	local rand_wgt = total_weight * math.random()
	local best_grp, best_grp_nationality, best_grp_type = nil
	slot9 = best_groups

	for i, candidate in ipairs(slot8) do
		rand_wgt = rand_wgt - candidate.wght

		if rand_wgt <= 0 then
			best_grp = candidate.group
			best_grp_nationality = candidate.nationality
			best_grp_type = candidate.group_type
			best_grp.delay_t = self._t + best_grp.interval

			break
		end
	end

	return best_grp, best_grp_nationality, best_grp_type
end
GroupAIStateBesiege.force_spawn_group = function (self, group, nationality, group_types)
	local best_groups = {}
	slot13 = (self._task_data.assault.active and "assault") or "recon"
	local total_weight = self._choose_best_groups(slot6, self, best_groups, group, group_types, nationality, self._tweak_data[1].groups)

	if 0 < total_weight then
		slot10 = total_weight
		local spawn_group, nationality, spawn_group_type = self._choose_best_group(slot7, self, best_groups)

		if spawn_group then
			local grp_objective = {
				attitude = "avoid",
				stance = "hos",
				pose = "crouch",
				type = "assault_area",
				area = spawn_group.area,
				coarse_path = {
					{
						spawn_group.area.pos_nav_seg,
						spawn_group.area.pos
					}
				}
			}
			slot17 = nil

			self._spawn_in_group(, self, spawn_group, group_nationality, spawn_group_type, grp_objective)
		end
	end

	return 
end
GroupAIStateBesiege._spawn_in_individual_groups = function (self, grp_objective, spawn_points, task)
	slot6 = spawn_points

	for i_sp, spawn_point in ipairs(slot5) do
		local group_desc = {
			size = 1,
			type = "custom"
		}
		slot12 = grp_objective
		local grp_objective_cpy = clone(slot11)

		if not grp_objective_cpy.area then
			grp_objective_cpy.area = spawn_point.area
		end

		local group = self._create_group(slot12, self)
		group.objective = grp_objective_cpy
		group.objective.moving_out = true
		local spawn_task = {}
		slot15 = grp_objective_cpy
		spawn_task.objective = self._create_objective_from_group_objective(group_desc)
		spawn_task.spawn_point = spawn_point
		spawn_task.group = group
		spawn_task.task = task
		slot16 = spawn_task

		table.insert(group_desc, self._spawning_groups)
	end

	return 
end
GroupAIStateBesiege._extract_group_desc_structure = function (spawn_entry_outer, valid_unit_entries)
	slot4 = spawn_entry_outer

	for spawn_entry_key, spawn_entry in ipairs(slot3) do
		if spawn_entry.unit then
			slot9 = valid_unit_entries
			slot12 = spawn_entry

			table.insert(slot8, clone(slot11))
		else
			slot10 = valid_unit_entries

			GroupAIStateBesiege._extract_group_desc_structure(slot8, spawn_entry)
		end
	end

	slot4 = spawn_entry_outer

	for spawn_entry_key, spawn_entry in pairs(slot3) do
		slot9 = spawn_entry_key

		if (type(slot8) ~= "number" or #spawn_entry_outer < spawn_entry_key) and #spawn_entry ~= 0 then
			slot9 = #spawn_entry
			local i_rand = math.random(slot8)
			local rand_branch = spawn_entry[i_rand]

			if rand_branch.unit then
				slot11 = valid_unit_entries
				slot14 = rand_branch

				table.insert(slot10, clone(slot13))
			else
				slot12 = valid_unit_entries

				GroupAIStateBesiege._extract_group_desc_structure(slot10, rand_branch)
			end
		end
	end

	return 
end
GroupAIStateBesiege._get_special_unit_type_count = function (self, special_type)
	if not self._special_units[special_type] then
		return 0
	end

	slot4 = self._special_units[special_type]

	return table.size(slot3)
end
GroupAIStateBesiege._spawn_in_group = function (self, spawn_group, group_nationality, spawn_group_type, grp_objective, ai_task)
	local spawn_group_desc = tweak_data.group_ai.enemy_spawn_groups[group_nationality][spawn_group_type]
	local wanted_nr_units = nil
	slot10 = spawn_group_desc.amount

	if type(slot9) == "number" then
		wanted_nr_units = spawn_group_desc.amount
	else
		slot11 = spawn_group_desc.amount[2]
		wanted_nr_units = math.random(slot9, spawn_group_desc.amount[1])
	end

	local valid_unit_types = {}
	slot12 = valid_unit_types

	self._extract_group_desc_structure(slot10, spawn_group_desc.spawn)

	local unit_categories = tweak_data.group_ai.unit_categories[group_nationality]
	local total_wgt = 0
	local i = 1

	while i <= #valid_unit_types do
		local spawn_entry = valid_unit_types[i]
		local cat_data = unit_categories[spawn_entry.unit]

		if not cat_data then
			slot17 = spawn_entry.unit

			debug_pause(slot15, "[GroupAIStateBesiege:_spawn_in_group] unit category doesn't exist:")

			return 
		elseif cat_data.special_type and tweak_data.group_ai.special_unit_spawn_limits[cat_data.special_type] then
			slot17 = cat_data.special_type
			slot14 = self._get_special_unit_type_count(slot15, self)
			slot15 = spawn_entry.amount_min or 0
		else
			total_wgt = total_wgt + spawn_entry.freq
			i = i + 1
		end
	end

	slot14 = spawn_group.spawn_pts

	for _, sp_data in ipairs(slot13) do
		slot20 = 0.5
		sp_data.delay_t = self._t + math.rand(slot19)
	end

	local spawn_task = {}

	if not grp_objective.element then
		slot15 = grp_objective
		slot13 = self._create_objective_from_group_objective(slot14)
	else
		slot13 = false

		if false then
			slot13 = true
		end
	end

	spawn_task.objective = slot13
	spawn_task.units_remaining = {}
	spawn_task.spawn_group = spawn_group
	spawn_task.spawn_group_type = spawn_group_type
	spawn_task.ai_task = ai_task
	slot16 = spawn_task

	table.insert(slot14, self._spawning_groups)

	local function _add_unit_type_to_spawn_task(i, spawn_entry)
		local spawn_amount_mine = 1 + ((spawn_task.units_remaining[spawn_entry.unit] and spawn_task.units_remaining[spawn_entry.unit].amount) or 0)
		spawn_task.units_remaining[spawn_entry.unit] = {
			amount = spawn_amount_mine,
			spawn_entry = spawn_entry,
			nationality = group_nationality
		}
		wanted_nr_units = wanted_nr_units - 1

		if spawn_entry.amount_min then
			spawn_entry.amount_min = spawn_entry.amount_min - 1
		end

		if spawn_entry.amount_max then
			spawn_entry.amount_max = spawn_entry.amount_max - 1

			if spawn_entry.amount_max == 0 then
				slot6 = i

				table.remove(slot4, valid_unit_types)

				total_wgt = total_wgt - spawn_entry.freq

				return true
			end
		end

		return 
	end

	local i = 1

	while i <= #valid_unit_types do

		-- Decompilation error in this vicinity:
		local spawn_entry = valid_unit_types[i]
	end

	while 0 < wanted_nr_units and #valid_unit_types ~= 0 do
		local rand_wght = math.random() * total_wgt
		local rand_i = 1
		local rand_entry = nil

		while true do

			-- Decompilation error in this vicinity:
			rand_entry = valid_unit_types[rand_i]
			rand_wght = rand_wght - rand_entry.freq

			if rand_wght <= 0 then
				break
			else
				rand_i = rand_i + 1
			end
		end

		local cat_data = unit_categories[rand_entry.unit]

		if cat_data.special_type and tweak_data.group_ai.special_unit_spawn_limits[cat_data.special_type] then
			slot22 = cat_data.special_type
		else
			slot22 = rand_entry

			_add_unit_type_to_spawn_task(slot20, rand_i)
		end
	end

	local group_desc = {
		size = 0,
		type = spawn_group_type
	}
	slot18 = spawn_task.units_remaining

	for u_name, spawn_info in pairs(slot17) do
		group_desc.size = group_desc.size + spawn_info.amount
	end

	slot19 = group_desc
	local group = self._create_group(slot17, self)
	group.objective = grp_objective
	group.objective.moving_out = true
	slot17 = self._teams

	if not spawn_group.team_id then
		slot21 = "combatant"
		slot18 = tweak_data.levels.get_default_team_ID(slot19, tweak_data.levels)
	end

	group.team = slot17[slot18]
	spawn_task.group = group

	return group
end
GroupAIStateBesiege._try_spawn_unit = function (self, u_type_name, nationality, spawn_entry, spawn_task, nr_units_spawned, produce_data)
	local group_ai_tweak = tweak_data.group_ai
	local spawn_points = spawn_task.spawn_group.spawn_pts

	if GroupAIStateBesiege._MAX_SIMULTANEOUS_SPAWNS <= nr_units_spawned then
		return 
	end

	local hopeless = true
	slot12 = spawn_points

	for _, sp_data in ipairs(slot11) do
		local category = group_ai_tweak.unit_categories[nationality][u_type_name]

		if (sp_data.accessibility == "any" or category.access[sp_data.accessibility]) and (not sp_data.amount or 0 < sp_data.amount) then
			slot18 = sp_data.mission_element

			if sp_data.mission_element.enabled(slot17) then
				hopeless = false

				if sp_data.delay_t < self._t then
					slot19 = #category.units
					produce_data.name = category.units[math.random(slot18)]
					slot19 = produce_data
					local spawned_unit = sp_data.mission_element.produce(math.random(slot18), sp_data.mission_element)
					slot19 = spawned_unit
					local u_key = spawned_unit.key(sp_data.mission_element)
					local objective = nil

					if spawn_task.objective then
						slot21 = spawn_task.objective
						objective = self.clone_objective(slot20)
					else
						slot22 = spawned_unit
						objective = spawn_task.group.objective.element.get_random_SO(slot20, spawn_task.group.objective.element)

						if not objective then
							slot22 = 0

							spawned_unit.set_slot(slot20, spawned_unit)

							return true
						end

						objective.grp_objective = spawn_task.group.objective
					end

					local u_data = self._police[u_key]
					slot24 = u_key

					self.set_enemy_assigned(slot21, self, objective.area)

					if spawn_entry.tactics then
						u_data.tactics = spawn_entry.tactics
						u_data.tactics_map = {}
						slot22 = u_data.tactics

						for _, tactic_name in ipairs(slot21) do
							u_data.tactics_map[tactic_name] = true
						end
					end

					slot22 = spawned_unit
					slot24 = u_data.tactics_map

					spawned_unit.brain(slot21).set_spawn_entry(slot21, spawned_unit.brain(slot21), spawn_entry)

					u_data.rank = spawn_entry.rank
					slot24 = u_key

					self._add_group_member(slot21, self, spawn_task.group)

					slot22 = spawned_unit
					slot23 = objective

					if spawned_unit.brain(slot21).is_available_for_assignment(slot21, spawned_unit.brain(slot21)) then
						if objective.element then
							slot23 = spawned_unit

							objective.element.clbk_objective_administered(slot21, objective.element)
						end

						slot22 = spawned_unit
						slot23 = objective

						spawned_unit.brain(slot21).set_objective(slot21, spawned_unit.brain(slot21))
					else
						slot22 = spawned_unit
						slot23 = objective

						spawned_unit.brain(slot21).set_followup_objective(slot21, spawned_unit.brain(slot21))
					end

					if spawn_task.ai_task then
						spawn_task.ai_task.force_spawned = spawn_task.ai_task.force_spawned + 1
					end

					sp_data.delay_t = self._t + sp_data.interval

					if sp_data.amount then
						sp_data.amount = sp_data.amount - 1
					end

					return true
				end
			end
		end
	end

	if hopeless then
		slot15 = u_type_name

		debug_pause(slot11, "[GroupAIStateBesiege:_upd_group_spawning] spawn group", spawn_task.spawn_group.id, "failed to spawn unit")

		return true
	end

	return 
end
GroupAIStateBesiege._upd_group_spawning = function (self)
	local spawn_task = self._spawning_groups[1]

	if not spawn_task then
		return 
	end

	local nr_units_spawned = 0
	local produce_data = {
		name = true,
		spawn_ai = {}
	}
	local group_ai_tweak = tweak_data.group_ai
	local spawn_points = spawn_task.spawn_group.spawn_pts
	slot8 = spawn_task.units_remaining

	for u_type_name, spawn_info in pairs(slot7) do
		if not group_ai_tweak.unit_categories[spawn_info.nationality][u_type_name].access.acrobatic then
			local no_spawned = 0

			for i = spawn_info.amount, 1, -1 do
				slot24 = produce_data
				local success = self._try_spawn_unit(slot17, self, u_type_name, spawn_info.nationality, spawn_info.spawn_entry, spawn_task, nr_units_spawned)

				if success then
					no_spawned = no_spawned + 1
					nr_units_spawned = nr_units_spawned + 1
				end
			end

			spawn_info.amount = spawn_info.amount - no_spawned
		end
	end

	slot8 = spawn_task.units_remaining

	for u_type_name, spawn_info in pairs(slot7) do
		local no_spawned = 0

		for i = spawn_info.amount, 1, -1 do
			slot24 = produce_data
			local success = self._try_spawn_unit(slot17, self, u_type_name, spawn_info.nationality, spawn_info.spawn_entry, spawn_task, nr_units_spawned)

			if success then
				no_spawned = no_spawned + 1
				nr_units_spawned = nr_units_spawned + 1
			end
		end

		spawn_info.amount = spawn_info.amount - no_spawned
	end

	local complete = true
	slot9 = spawn_task.units_remaining

	for u_type_name, spawn_info in pairs(slot8) do
		if 0 < spawn_info.amount then
			complete = false

			break
		end
	end

	if complete then
		spawn_task.group.has_spawned = true
		slot10 = 1

		table.remove(true, self._spawning_groups)

		if spawn_task.group.size <= 0 then
			self._groups[spawn_task.group.id] = nil
		end
	end

	return 
end
GroupAIStateBesiege._begin_reenforce_task = function (self, reenforce_area)
	local new_task = {
		use_spawn_event = true,
		target_area = reenforce_area,
		start_t = self._t
	}

	table.insert(slot4, self._task_data.reenforce.tasks)

	self._task_data.reenforce.active = true
	slot8 = self._tweak_data.reenforce.interval
	self._task_data.reenforce.next_dispatch_t = self._t + self.get_difficulty_dependent_value(new_task, self)

	return 
end
GroupAIStateBesiege._upd_reenforce_tasks = function (self)
	local reenforce_tasks = self._task_data.reenforce.tasks
	local t = self._t

	for i_task = #reenforce_tasks, 1, -1 do
		local task_data = reenforce_tasks[i_task]
		local force_settings = task_data.target_area.factors.force
		local force_required = force_settings and force_settings.force

		if force_required then
			local force_occupied = 0
			slot13 = self._groups

			for group_id, group in pairs(slot12) do
				if (group.objective.target_area or group.objective.area) == task_data.target_area and group.objective.type == "reenforce_area" then
					force_occupied = force_occupied + ((group.has_spawned and group.size) or group.initial_size)
				end
			end

			local force_missing = force_required - force_occupied

			if 0 < force_missing and not self._task_data.regroup.active and self._task_data.assault.phase ~= "fade" and self._task_data.reenforce.next_dispatch_t < t then
				slot15 = task_data.target_area
			elseif force_missing < 0 then
				slot16 = force_required

				self._retreat_from_area(slot13, self, task_data)
			end
		else
			slot12 = self._groups

			for group_id, group in pairs(slot11) do
				if group.has_spawned and (group.objective.target_area or group.objective.area) == task_data.target_area and group.objective.type == "reenforce_area" then
					slot18 = group

					self._assign_group_to_retire(slot16, self)
				end
			end

			reenforce_tasks[i_task] = reenforce_tasks[#reenforce_tasks]
			slot12 = reenforce_tasks

			table.remove(slot11)
		end
	end

	slot5 = self

	self._assign_enemy_groups_to_reenforce(slot4)

	return 
end
GroupAIStateBesiege._reenforce_area = function (self, task_data)
	local t = self._t
	slot5 = self._spawning_groups

	if next(slot4) then
		return 
	end

	local spawn_group, group_nationality, spawn_group_type = self._find_spawn_group_near_area(slot4, self, task_data.target_area, self._tweak_data.reenforce.groups, nil, nil)

	if spawn_group then
		local grp_objective = {
			attitude = "avoid",
			scan = true,
			pose = "stand",
			type = "reenforce_area",
			stance = "hos",
			area = spawn_group.area,
			target_area = task_data.target_area
		}
		slot14 = nil

		self._spawn_in_group(slot8, self, spawn_group, group_nationality, spawn_group_type, grp_objective)

		slot11 = self._tweak_data.reenforce.interval
		self._task_data.reenforce.next_dispatch_t = t + self.get_difficulty_dependent_value(self, self)
	end

	return 
end
GroupAIStateBesiege._retreat_from_area = function (self, task_data, force_required)
	local force_defending = 0
	slot6 = self._groups

	for group_id, group in pairs(slot5) do
		if group.objective.area == task_data.target_area and group.objective.type == "reenforce_area" then
			force_defending = force_defending + ((group.has_spawned and group.size) or group.initial_size)
		end
	end

	local force_extra = force_defending - force_required

	if 0 < force_extra then
		local closest_group, closest_group_size = nil
		slot9 = self._groups

		for group_id, group in pairs(slot8) do
			if group.has_spawned and (group.objective.target_area or group.objective.area) == task_data.target_area and group.objective.type == "reenforce_area" and (not closest_group_size or closest_group_size < group.size) and group.size <= force_extra then
				closest_group = group
				closest_group_size = group.size
			end
		end

		if closest_group then
			slot10 = closest_group

			self._assign_group_to_retire(slot8, self)
		end
	end

	return 
end
GroupAIStateBesiege.register_criminal = function (self, unit)
	slot5 = unit

	GroupAIStateBesiege.super.register_criminal(slot3, self)

	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	slot4 = unit
	local u_key = unit.key(slot3)
	local record = self._criminals[u_key]
	slot7 = record.seg
	local area_data = self.get_area_from_nav_seg_id(slot5, self)
	area_data.criminal.units[u_key] = record

	return 
end
GroupAIStateBesiege.unregister_criminal = function (self, unit)
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = unit
		local u_key = unit.key(slot3)
		local record = self._criminals[u_key]
		slot6 = self._area_data

		for area_id, area in pairs(slot5) do
			if area.nav_segs[record.seg] then
				area.criminal.units[u_key] = nil
			end
		end
	end

	slot5 = unit

	GroupAIStateBesiege.super.unregister_criminal(slot3, self)

	return 
end
GroupAIStateBesiege.on_objective_complete = function (self, unit, objective)
	local new_objective, so_element = nil

	if objective.followup_objective then
		if not objective.followup_objective.trigger_on then
			new_objective = objective.followup_objective
		else
			new_objective = {
				type = "free",
				followup_objective = objective.followup_objective,
				interrupt_dis = objective.interrupt_dis,
				interrupt_health = objective.interrupt_health
			}
		end
	elseif objective.followup_SO then
		local current_SO_element = objective.followup_SO
		slot9 = unit
		so_element = current_SO_element.choose_followup_SO(slot7, current_SO_element)

		if so_element then
			slot9 = unit
			new_objective = so_element.get_objective(slot7, so_element)
		end
	end

	if new_objective then
		if new_objective.nav_seg then
			slot7 = unit
			local u_key = unit.key(slot6)
			local u_data = self._police[u_key]

			if u_data and u_data.assigned_area then
				slot11 = u_key

				self.set_enemy_assigned(slot8, self, self._area_data[new_objective.nav_seg])
			end
		end
	else
		slot7 = unit
		slot7 = unit.movement(slot6)
		local seg = unit.movement(slot6).nav_tracker(slot6).nav_segment(slot6)
		slot9 = seg
		local area_data = self.get_area_from_nav_seg_id(unit.movement(slot6).nav_tracker(slot6), self)
		slot9 = self

		if self.rescue_state(self) then
			slot10 = unit

			if tweak_data.character[unit.base(slot9)._tweak_table].rescue_hostages then
				slot11 = managers.enemy

				for u_key, u_data in pairs(managers.enemy.all_civilians(slot10)) do
					slot14 = u_data.tracker

					if seg == u_data.tracker.nav_segment(slot13) then
						slot14 = u_data.unit
						slot14 = u_data.unit.brain(slot13)
						local so_id = u_data.unit.brain(slot13).wants_rescue(slot13)

						if so_id then
							local so = self._special_objectives[so_id]
							local so_data = so.data
							local so_objective = so_data.objective
							slot18 = so_objective
							new_objective = self.clone_objective(slot17)

							if so_data.admin_clbk then
								slot18 = unit

								so_data.admin_clbk(slot17)
							end

							slot19 = so_id

							self.remove_special_objective(slot17, self)

							break
						end
					end
				end
			end
		end

		if not new_objective and objective.type == "free" then
			new_objective = {
				is_default = true,
				type = "free",
				attitude = objective.attitude
			}
		end

		if not area_data.is_safe then
			area_data.is_safe = true
			slot11 = {
				reason = "guard",
				unit = unit
			}

			self._on_nav_seg_safety_status(slot8, self, seg)
		end
	end

	objective.fail_clbk = nil
	slot7 = unit
	slot8 = new_objective

	unit.brain(slot6).set_objective(slot6, unit.brain(slot6))

	if objective.complete_clbk then
		slot7 = unit

		objective.complete_clbk(slot6)
	end

	if so_element then
		slot8 = unit

		so_element.clbk_objective_administered(slot6, so_element)
	end

	return 
end
GroupAIStateBesiege.on_defend_travel_end = function (self, unit, objective)
	local seg = objective.nav_seg
	slot7 = seg
	local area = self.get_area_from_nav_seg_id(slot5, self)

	if not area.is_safe then
		area.is_safe = true
		slot9 = {
			reason = "guard",
			unit = unit
		}

		self._on_area_safety_status(slot6, self, area)
	end

	return 
end
GroupAIStateBesiege.on_cop_jobless = function (self, unit)
	slot4 = unit
	local u_key = unit.key(slot3)

	if not self._police[u_key].assigned_area then
		return 
	end

	slot5 = unit
	slot5 = unit.movement(slot4)
	local nav_seg = unit.movement(slot4).nav_tracker(slot4).nav_segment(slot4)
	slot7 = nav_seg
	local area = self.get_area_from_nav_seg_id(unit.movement(slot4).nav_tracker(slot4), self)
	local force_factor = area.factors.force
	local demand = force_factor and force_factor.force
	slot9 = area.police.units
	local nr_police = table.size(slot8)
	local undershot = demand and demand - nr_police

	if undershot and 0 < undershot then
		local new_objective = {
			type = "defend_area",
			interrupt_health = 0.75,
			is_default = true,
			stance = "hos",
			in_place = true,
			scan = true,
			interrupt_dis = 700,
			attitude = "avoid",
			nav_seg = nav_seg
		}
		slot14 = u_key

		self.set_enemy_assigned(slot11, self, self._area_data[nav_seg])

		slot12 = unit
		slot13 = new_objective

		unit.brain(slot11).set_objective(slot11, unit.brain(slot11))

		return true
	end

	if not area.is_safe then
		local new_objective = {
			stance = "hos",
			scan = true,
			in_place = true,
			type = "free",
			is_default = true,
			attitude = "avoid",
			nav_seg = nav_seg
		}
		slot14 = u_key

		self.set_enemy_assigned(slot11, self, self._area_data[nav_seg])

		slot12 = unit
		slot13 = new_objective

		unit.brain(slot11).set_objective(slot11, unit.brain(slot11))

		return true
	end

	return 
end
GroupAIStateBesiege._animate_health_change = function (self, bar, final_color)
	local starting_color = Color.red
	local curr_color = starting_color
	local t = 0

	while t < 0.35 do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = 0.35
		local new_r = self._ease_in_quart(slot8, self, t, starting_color.r, final_color.r)
		slot14 = 0.35
		local new_g = self._ease_in_quart(self, self, t, starting_color.g, final_color.g)
		slot15 = 0.35
		local new_b = self._ease_in_quart(self, self, t, starting_color.b, final_color.b)
		slot12 = bar
		slot17 = new_b

		bar.set_color(self, Color(final_color.b, new_r, new_g))
	end

	slot9 = final_color

	bar.set_color(slot7, bar)

	return 
end
GroupAIStateBesiege._ease_in_quart = function (self, t, starting_value, change, duration)
	t = t / duration

	return change * t * t * t * t + starting_value
end
GroupAIStateBesiege._draw_enemy_activity = function (self, t)
	local draw_data = self._AI_draw_data
	local brush_area = draw_data.brush_area
	local area_normal = -math.UP
	local logic_name_texts = draw_data.logic_name_texts
	local unit_type_texts = draw_data.unit_type_texts
	local unit_health_bars = draw_data.unit_health_bars
	local unit_health_bars_bg = draw_data.unit_health_bars_bg
	local unit_health_bar_vals = draw_data.unit_health_bar_vals
	local rect_bgs = draw_data.rect_bgs
	local rect_bg_width = 0
	local group_id_texts = draw_data.group_id_texts
	local panel = draw_data.panel
	slot16 = managers.viewport
	local camera = managers.viewport.get_current_camera(slot15)

	if not camera then
		return 
	end

	local ws = draw_data.workspace
	local mid_pos1 = Vector3()
	local mid_pos2 = Vector3()
	local focus_enemy_pen = draw_data.pen_focus_enemy
	local focus_player_brush = draw_data.brush_focus_player
	local suppr_period = 0.4
	local suppr_t = t % suppr_period

	if suppr_period * 0.5 < suppr_t then
		suppr_t = suppr_period - suppr_t
	end

	slot24 = draw_data.brush_suppressed
	slot31 = suppr_t
	slot30 = 0.2

	draw_data.brush_suppressed.set_color(slot23, Color(slot26, math.lerp(slot28, 0.2, 0.5), 0.85, 0.9))

	slot24 = self._area_data

	for area_id, area in pairs(slot23) do
		slot29 = area.police.units

		if 0 < table.size(slot28) then
			slot32 = area_normal

			brush_area.half_sphere(slot28, brush_area, area.pos, 22)
		end
	end

	local function _f_draw_unit_type(u_key, l_data, draw_color)
		local unit_type_text = unit_type_texts[u_key]
		slot8 = l_data.unit
		local text_str = tostring(l_data.unit.model_filename(slot7))
		slot8 = "/"
		local path_parts = string.split(l_data.unit.model_filename, text_str)
		text_str = path_parts[#path_parts]

		if unit_type_text then
			slot9 = text_str

			unit_type_text.set_text(slot7, unit_type_text)

			slot8 = unit_type_text
			local x, y, w, h = unit_type_text.text_rect(slot7)

			if rect_bg_width < w then
				rect_bg_width = w
			end
		else
			slot9 = {
				name = "unit_type_text",
				font_size = 20,
				layer = 1,
				text = text_str,
				font = tweak_data.gui.get_font_path(slot11, tweak_data.gui, tweak_data.gui.fonts.lato),
				color = Color(slot11, 0.47058823529411764, 0.8509803921568627)
			}
			slot14 = 20
			slot14 = 0.30196078431372547
			unit_type_text = panel.text(slot7, panel)
			unit_type_texts[u_key] = unit_type_text
			slot8 = unit_type_text
			local x, y, w, h = unit_type_text.text_rect(slot7)

			if rect_bg_width < w then
				rect_bg_width = w
			end
		end

		local my_head_pos = mid_pos1
		slot9 = my_head_pos
		slot12 = l_data.unit
		slot12 = l_data.unit.movement(slot11)

		mvector3.set(slot8, l_data.unit.movement(slot11).m_head_pos(slot11))

		slot10 = my_head_pos.z + 30

		mvector3.set_z(slot8, my_head_pos)

		slot10 = my_head_pos
		local my_head_pos_screen = camera.world_to_screen(slot8, camera)

		if 0 < my_head_pos_screen.z then
			local screen_x = (my_head_pos_screen.x + 1) * 0.5 * RenderSettings.resolution.x
			local screen_y = (my_head_pos_screen.y + 1) * 0.5 * RenderSettings.resolution.y
			slot13 = screen_x

			unit_type_text.set_x(slot11, unit_type_text)

			slot13 = screen_y - 33

			unit_type_text.set_y(slot11, unit_type_text)

			slot12 = unit_type_text

			if not unit_type_text.visible(slot11) then
				slot12 = unit_type_text

				unit_type_text.show(slot11)
			end
		else
			slot10 = unit_type_text

			if unit_type_text.visible(slot9) then
				slot10 = unit_type_text

				unit_type_text.hide(slot9)
			end
		end

		return 
	end

	local function _f_draw_unit_health(u_key, l_data, draw_color)
		local unit_health_bar = unit_health_bars[u_key]
		local unit_health_bar_bg = unit_health_bars_bg[u_key]
		local unit_health_bar_val = unit_health_bar_vals[u_key]
		slot10 = l_data.unit
		slot10 = l_data.unit.character_damage(slot9)
		local current_health = tostring(l_data.unit.character_damage(slot9).health_ratio(slot9))
		local current_health_raw_value = nil
		slot10 = l_data.unit

		if l_data.unit.character_damage(slot9).health ~= nil then
			slot12 = "%.2f"
			slot15 = l_data.unit
			slot15 = l_data.unit.character_damage(slot14)
			current_health_raw_value = tostring(string.format(slot11, l_data.unit.character_damage(slot14).health(slot14)))
		else
			slot11 = current_health
			current_health_raw_value = string.format(slot9, "%.2f")
		end

		if unit_health_bar then
			local current_w = 130 * current_health
			slot11 = unit_health_bar

			if unit_health_bar.w(slot10) ~= current_w then
				slot11 = unit_health_bar

				unit_health_bar.stop(slot10)

				slot16 = "_animate_health_change"
				slot12 = callback(slot13, self, self)
				slot17 = 0.30196078431372547

				unit_health_bar.animate(slot10, unit_health_bar, Color(self, 0.47058823529411764, 0.8509803921568627))

				slot16 = "_animate_health_change"
				slot12 = callback(Color, self, self)
				slot17 = 0.30196078431372547

				unit_health_bar_val.animate(slot10, unit_health_bar_val, Color(self, 0.47058823529411764, 0.8509803921568627))
			end

			slot12 = 130 * current_health

			unit_health_bar.set_w(slot10, unit_health_bar)

			slot11 = unit_health_bar_val

			unit_health_bar_val.set_text(slot10, tostring(slot13))

			slot11 = unit_health_bar_val
			local x, y, w, h = unit_health_bar_val.text_rect(slot10)
			slot15 = unit_health_bar_bg

			if rect_bg_width < unit_health_bar_bg.w(current_health_raw_value) + w + 7 then
				slot15 = unit_health_bar_bg
				rect_bg_width = unit_health_bar_bg.w(slot14) + w + 7
			end
		else
			slot11 = {
				blend_mode = "normal",
				name = "unit_health_bar_bg",
				h = 7,
				layer = 1,
				w = 130 * current_health,
				color = Color.black.with_alpha(slot13, Color.black)
			}
			slot15 = 0.7
			unit_health_bar_bg = panel.rect(slot9, panel)
			slot11 = {
				blend_mode = "normal",
				name = "unit_health_bar",
				h = 7,
				layer = 1,
				w = 130 * current_health,
				color = Color(slot13, 0.47058823529411764, 0.8509803921568627)
			}
			slot16 = 0.30196078431372547
			unit_health_bar = panel.rect(slot9, panel)
			slot11 = {
				name = "unit_health_value",
				font_size = 20,
				layer = 1,
				text = tostring(slot13),
				font = tweak_data.gui.get_font_path(slot13, tweak_data.gui, tweak_data.gui.fonts.lato),
				color = Color(slot13, 0.47058823529411764, 0.8509803921568627)
			}
			slot14 = current_health_raw_value
			slot16 = 20
			slot16 = 0.30196078431372547
			unit_health_bar_val = panel.text(slot9, panel)
			unit_health_bar_vals[u_key] = unit_health_bar_val
			unit_health_bars_bg[u_key] = unit_health_bar_bg
			unit_health_bars[u_key] = unit_health_bar
			slot10 = unit_health_bar_val
			local x, y, w, h = unit_health_bar_val.text_rect(slot9)
			slot14 = unit_health_bar_bg

			if rect_bg_width < unit_health_bar_bg.w(slot13) + w then
				slot14 = unit_health_bar_bg
				rect_bg_width = unit_health_bar_bg.w(slot13) + w
			end
		end

		local my_head_pos = mid_pos1
		slot11 = my_head_pos
		slot14 = l_data.unit
		slot14 = l_data.unit.movement(slot13)

		mvector3.set(slot10, l_data.unit.movement(slot13).m_head_pos(slot13))

		slot12 = my_head_pos.z + 30

		mvector3.set_z(slot10, my_head_pos)

		slot12 = my_head_pos
		local my_head_pos_screen = camera.world_to_screen(slot10, camera)

		if 0 < my_head_pos_screen.z then
			local screen_x = (my_head_pos_screen.x + 1) * 0.5 * RenderSettings.resolution.x
			local screen_y = (my_head_pos_screen.y + 1) * 0.5 * RenderSettings.resolution.y
			slot15 = screen_x

			unit_health_bar_bg.set_x(slot13, unit_health_bar_bg)

			slot15 = screen_y - 9

			unit_health_bar_bg.set_y(slot13, unit_health_bar_bg)

			slot15 = screen_x + 135

			unit_health_bar_val.set_x(slot13, unit_health_bar_val)

			slot15 = screen_y - 16

			unit_health_bar_val.set_y(slot13, unit_health_bar_val)

			slot15 = screen_x

			unit_health_bar.set_x(slot13, unit_health_bar)

			slot15 = screen_y - 9

			unit_health_bar.set_y(slot13, unit_health_bar)

			slot14 = unit_health_bar

			if not unit_health_bar.visible(slot13) then
				slot14 = unit_health_bar_bg

				unit_health_bar_bg.show(slot13)

				slot14 = unit_health_bar

				unit_health_bar.show(slot13)

				slot14 = unit_health_bar_val

				unit_health_bar_val.show(slot13)
			end
		else
			slot12 = unit_health_bar

			if unit_health_bar.visible(slot11) then
				slot12 = unit_health_bar_bg

				unit_health_bar_bg.hide(slot11)

				slot12 = unit_health_bar

				unit_health_bar.hide(slot11)

				slot12 = unit_health_bar_val

				unit_health_bar_val.hide(slot11)
			end
		end

		return 
	end

	local function _f_draw_logic_name(u_key, l_data, draw_color)
		local logic_name_text = logic_name_texts[u_key]
		local text_str = l_data.name

		if l_data.objective and l_data.objective.type then
			text_str = text_str .. ":" .. l_data.objective.type
		end

		if not l_data.group then
			text_str = l_data.team.id .. ":" .. text_str
		end

		if l_data.internal_data.vision then
			text_str = text_str .. ":" .. l_data.internal_data.vision.name .. "(v)"
		end

		if logic_name_text then
			slot8 = text_str

			logic_name_text.set_text(slot6, logic_name_text)

			slot7 = logic_name_text
			local x, y, w, h = logic_name_text.text_rect(slot6)

			if rect_bg_width < w then
				rect_bg_width = w
			end
		else
			slot8 = {
				name = "text",
				font_size = 20,
				layer = 1,
				text = text_str,
				font = tweak_data.gui.get_font_path(slot10, tweak_data.gui, tweak_data.gui.fonts.lato),
				color = draw_color
			}
			slot13 = 20
			logic_name_text = panel.text(slot6, panel)
			logic_name_texts[u_key] = logic_name_text
			slot7 = logic_name_text
			local x, y, w, h = logic_name_text.text_rect(slot6)

			if rect_bg_width < w then
				rect_bg_width = w
			end
		end

		local my_head_pos = mid_pos1
		slot8 = my_head_pos
		slot11 = l_data.unit
		slot11 = l_data.unit.movement(slot10)

		mvector3.set(slot7, l_data.unit.movement(slot10).m_head_pos(slot10))

		slot9 = my_head_pos.z + 30

		mvector3.set_z(slot7, my_head_pos)

		slot9 = my_head_pos
		local my_head_pos_screen = camera.world_to_screen(slot7, camera)

		if 0 < my_head_pos_screen.z then
			local screen_x = (my_head_pos_screen.x + 1) * 0.5 * RenderSettings.resolution.x
			local screen_y = (my_head_pos_screen.y + 1) * 0.5 * RenderSettings.resolution.y
			slot12 = screen_x

			logic_name_text.set_x(slot10, logic_name_text)

			slot12 = screen_y

			logic_name_text.set_y(slot10, logic_name_text)

			slot11 = logic_name_text

			if not logic_name_text.visible(slot10) then
				slot11 = logic_name_text

				logic_name_text.show(slot10)
			end
		else
			slot9 = logic_name_text

			if logic_name_text.visible(slot8) then
				slot9 = logic_name_text

				logic_name_text.hide(slot8)
			end
		end

		return 
	end

	local function _f_draw_rect_bg(u_key, l_data, draw_color)
		local rect_bg = rect_bgs[u_key]

		if not rect_bg then
			slot7 = {
				blend_mode = "normal",
				name = "rect_bg",
				h = 54,
				layer = 0,
				w = rect_bg_width + 10,
				color = Color.black.with_alpha(slot9, Color.black)
			}
			slot11 = 0.5
			rect_bg = panel.rect(slot5, panel)
			rect_bgs[u_key] = rect_bg
		else
			slot6 = rect_bg

			if rect_bg.w(slot5) ~= rect_bg_width + 10 then
				slot7 = rect_bg_width + 10

				rect_bg.set_w(slot5, rect_bg)
			end
		end

		local my_head_pos = mid_pos1
		slot7 = my_head_pos
		slot10 = l_data.unit
		slot10 = l_data.unit.movement(slot9)

		mvector3.set(slot6, l_data.unit.movement(slot9).m_head_pos(slot9))

		slot8 = my_head_pos.z + 30

		mvector3.set_z(slot6, my_head_pos)

		slot8 = my_head_pos
		local my_head_pos_screen = camera.world_to_screen(slot6, camera)

		if 0 < my_head_pos_screen.z then
			local screen_x = (my_head_pos_screen.x + 1) * 0.5 * RenderSettings.resolution.x
			local screen_y = (my_head_pos_screen.y + 1) * 0.5 * RenderSettings.resolution.y
			slot11 = screen_x - 5

			rect_bg.set_x(slot9, rect_bg)

			slot11 = screen_y - 32

			rect_bg.set_y(slot9, rect_bg)

			slot10 = rect_bg

			if not rect_bg.visible(slot9) then
				slot10 = rect_bg

				rect_bg.show(slot9)
			end
		else
			slot8 = rect_bg

			if rect_bg.visible(slot7) then
				slot8 = rect_bg

				rect_bg.hide(slot7)
			end
		end

		return 
	end

	local function _f_draw_obj_pos(unit)
		local brush = nil
		slot4 = unit
		slot4 = unit.brain(slot3)
		local objective = unit.brain(slot3).objective(slot3)
		local objective_type = objective and objective.type

		if objective_type == "guard" then
			brush = draw_data.brush_guard
		elseif objective_type == "defend_area" then
			brush = draw_data.brush_defend
		elseif objective_type == "free" or objective_type == "follow" or objective_type == "surrender" then
			brush = draw_data.brush_free
		elseif objective_type == "act" then
			brush = draw_data.brush_act
		else
			brush = draw_data.brush_misc
		end

		local obj_pos = nil

		if objective then
			if objective.pos then
				obj_pos = objective.pos
			elseif objective.follow_unit then
				slot7 = objective.follow_unit
				slot7 = objective.follow_unit.movement(slot6)
				obj_pos = objective.follow_unit.movement(slot6).m_head_pos(slot6)
				slot7 = objective.follow_unit

				if objective.follow_unit.base(slot6).is_local_player then
					obj_pos = obj_pos + math.UP * -30
				end
			elseif objective.nav_seg then
				obj_pos = managers.navigation._nav_segments[objective.nav_seg].pos
			elseif objective.area then
				obj_pos = objective.area.pos
			end
		end

		if obj_pos then
			slot7 = unit
			local u_pos = unit.movement(slot6).m_com(slot6)
			slot12 = 3

			brush.cylinder(unit.movement(slot6), brush, u_pos, obj_pos, 4)

			slot10 = 24

			brush.sphere(unit.movement(slot6), brush, u_pos)
		end

		slot7 = unit

		if unit.brain(slot6)._logic_data.is_suppressed then
			slot7 = mid_pos1
			slot10 = unit
			slot10 = unit.movement(slot9)

			mvector3.set(slot6, unit.movement(slot9).m_pos(slot9))

			slot8 = mid_pos1.z + 220

			mvector3.set_z(slot6, mid_pos1)

			slot10 = unit
			slot10 = unit.movement(slot9)
			slot10 = 35

			draw_data.brush_suppressed.cylinder(slot6, draw_data.brush_suppressed, unit.movement(slot9).m_pos(slot9), mid_pos1)
		end

		return 
	end

	local group_center = Vector3()
	slot30 = self._groups

	for group_id, group in pairs(slot29) do
		local nr_units = 0
		slot36 = group.units

		for u_key, u_data in pairs(slot35) do
			nr_units = nr_units + 1
			slot41 = group_center
			slot44 = u_data.unit
			slot44 = u_data.unit.movement(slot43)

			mvector3.add(slot40, u_data.unit.movement(slot43).m_com(slot43))
		end

		if 0 < nr_units then
			slot37 = nr_units

			mvector3.divide(slot35, group_center)

			local gui_text = group_id_texts[group_id]
			slot38 = group_center
			local group_pos_screen = camera.world_to_screen(group_center, camera)

			if 0 < group_pos_screen.z then
				if not gui_text then
					slot39 = {
						name = "text",
						font_size = 24,
						layer = 2,
						text = group.team.id .. ":" .. group_id .. ":" .. group.objective.type,
						font = tweak_data.gui.get_font_path(":", tweak_data.gui, tweak_data.gui.fonts.lato),
						color = draw_data.group_id_color
					}
					slot44 = 20
					gui_text = panel.text(slot37, panel)
					group_id_texts[group_id] = gui_text
				end

				local screen_x = (group_pos_screen.x + 1) * 0.5 * RenderSettings.resolution.x
				local screen_y = (group_pos_screen.y + 1) * 0.5 * RenderSettings.resolution.y
				slot41 = screen_x

				gui_text.set_x(slot39, gui_text)

				slot41 = screen_y

				gui_text.set_y(slot39, gui_text)

				slot40 = gui_text

				if not gui_text.visible(slot39) then
					slot40 = gui_text

					gui_text.show(slot39)
				end
			elseif gui_text then
				slot38 = gui_text

				if gui_text.visible(slot37) then
					slot38 = gui_text

					gui_text.hide(slot37)
				end
			end

			slot38 = group.units

			for u_key, u_data in pairs(slot37) do
				slot44 = group_center
				slot47 = u_data.unit
				slot47 = u_data.unit.movement(slot46)

				draw_data.pen_group.line(slot42, draw_data.pen_group, u_data.unit.movement(slot46).m_com(slot46))
			end
		end

		slot36 = group_center

		mvector3.set_zero(slot35)
	end

	local function _f_draw_attention_on_player(l_data)
		if l_data.attention_obj then
			slot3 = l_data.unit
			slot3 = l_data.unit.movement(slot2)
			local my_head_pos = l_data.unit.movement(slot2).m_head_pos(slot2)
			local e_pos = l_data.attention_obj.m_head_pos
			slot6 = e_pos
			local dis = mvector3.distance(slot4, my_head_pos)
			slot9 = 300

			mvector3.step(my_head_pos, mid_pos2, my_head_pos, e_pos)

			slot9 = t % 0.5

			mvector3.lerp(my_head_pos, mid_pos1, my_head_pos, mid_pos2)

			slot9 = 50

			mvector3.step(my_head_pos, mid_pos2, mid_pos1, e_pos)

			slot8 = mid_pos2

			focus_enemy_pen.line(my_head_pos, focus_enemy_pen, mid_pos1)

			slot6 = l_data.attention_obj.unit

			if l_data.attention_obj.unit.base(my_head_pos) then
				slot6 = l_data.attention_obj.unit

				if l_data.attention_obj.unit.base(slot5).is_local_player then
					slot8 = 20

					focus_player_brush.sphere(slot5, focus_player_brush, my_head_pos)
				end
			end
		end

		return 
	end

	local function _f_draw_ai_vision(data)
		local my_data = data.internal_data

		if not my_data.vision then
			return 
		end

		local brush_c1 = self._AI_draw_data.brush_ai_vision_c1
		local brush_c2 = self._AI_draw_data.brush_ai_vision_c2
		local brush_c3 = self._AI_draw_data.brush_ai_vision_c3
		local temp_rotation = Rotation()
		slot8 = data.unit
		local draw_pos = data.unit.movement(slot7).m_head_pos(slot7)
		slot12 = data.unit
		slot12 = data.unit.movement(slot11)
		slot12 = data.unit.movement(slot11).m_head_rot(slot11)
		slot12 = 0

		mrotation.set_yaw_pitch_roll(data.unit.movement(slot7), temp_rotation, data.unit.movement(slot11).m_head_rot(slot11).yaw(slot11), 0)

		local direction = temp_rotation.y(data.unit.movement(slot7))
		slot10 = direction

		mvector3.normalize(temp_rotation)

		local rad_1 = math.sin(temp_rotation) * my_data.vision.cone_1.distance
		local rad_2 = math.sin(my_data.vision.cone_1.angle / 2) * my_data.vision.cone_2.distance
		local rad_3 = math.sin(my_data.vision.cone_2.angle / 2) * my_data.vision.cone_3.distance
		local dist_1 = math.cos(my_data.vision.cone_3.angle / 2) * my_data.vision.cone_1.distance
		local dist_2 = math.cos(my_data.vision.cone_1.angle / 2) * my_data.vision.cone_2.distance
		slot15 = my_data.vision.cone_3.angle / 2
		local dist_3 = math.cos(my_data.vision.cone_2.angle / 2) * my_data.vision.cone_3.distance

		if 180 <= my_data.vision.cone_1.angle then
			slot18 = my_data.vision.cone_1.distance
			slot21 = temp_rotation

			brush_c1.half_sphere(slot15, brush_c1, draw_pos, temp_rotation.y(slot20))
		else
			brush_c1.cone(slot15, brush_c1, draw_pos, draw_pos + direction * -dist_1, rad_1)

			slot21 = temp_rotation
			slot20 = 4

			brush_c1.half_sphere(slot15, brush_c1, draw_pos + direction * -dist_1, rad_1, temp_rotation.y(100))
		end

		if 180 <= my_data.vision.cone_2.angle then
			slot18 = my_data.vision.cone_2.distance
			slot21 = temp_rotation

			brush_c2.half_sphere(slot15, brush_c2, draw_pos, temp_rotation.y(slot20))
		else
			brush_c2.cone(slot15, brush_c2, draw_pos, draw_pos + direction * -dist_2, rad_2)

			slot21 = temp_rotation
			slot20 = 4

			brush_c2.half_sphere(slot15, brush_c2, draw_pos + direction * -dist_2, rad_2, temp_rotation.y(100))
		end

		if 180 <= my_data.vision.cone_3.angle then
			slot18 = my_data.vision.cone_3.distance
			slot21 = temp_rotation

			brush_c3.half_sphere(slot15, brush_c3, draw_pos, temp_rotation.y(slot20))
		else
			brush_c3.cone(slot15, brush_c3, draw_pos, draw_pos + direction * -dist_3, rad_3)

			slot21 = temp_rotation
			slot20 = 4

			brush_c3.half_sphere(slot15, brush_c3, draw_pos + direction * -dist_3, rad_3, temp_rotation.y(100))
		end

		return 
	end

	local groups = {}
	slot37 = 0
	groups[1] = {
		group = self._police,
		color = Color(slot33, 1, 1, 0)
	}
	slot34 = managers.enemy
	slot37 = 0.75
	groups[2] = {
		group = managers.enemy.all_civilians(slot33),
		color = Color(slot33, 1, 0.75, 0.75)
	}
	slot37 = 0
	groups[3] = {
		group = self._ai_criminals,
		color = Color(slot33, 1, 0, 1)
	}
	slot33 = groups

	for _, group_data in ipairs(Color(slot33, 1, 0, 1)) do
		slot38 = group_data.group

		for u_key, u_data in pairs(slot37) do
			slot43 = u_data.unit

			_f_draw_obj_pos(slot42)

			if camera then
				local l_data = u_data.unit.brain(slot42)._logic_data
				rect_bg_width = 0
				slot46 = group_data.color

				_f_draw_unit_type(u_data.unit, u_key, l_data)

				slot46 = group_data.color

				_f_draw_unit_health(u_data.unit, u_key, l_data)

				slot46 = group_data.color

				_f_draw_logic_name(u_data.unit, u_key, l_data)

				slot46 = group_data.color

				_f_draw_rect_bg(u_data.unit, u_key, l_data)

				slot44 = l_data

				_f_draw_attention_on_player(u_data.unit)

				slot44 = World

				if World.selected_unit(u_data.unit) == u_data.unit then
					slot44 = l_data

					_f_draw_ai_vision(slot43)
				end
			end
		end
	end

	slot33 = unit_type_texts

	for u_key, gui_text in pairs(slot32) do
		local keep = nil
		slot39 = groups

		for _, group_data in ipairs(slot38) do
			if group_data.group[u_key] then
				keep = true

				break
			end
		end

		if not keep then
			slot40 = gui_text

			panel.remove(slot38, panel)

			unit_type_texts[u_key] = nil
		end
	end

	slot33 = logic_name_texts

	for u_key, gui_text in pairs(slot32) do
		local keep = nil
		slot39 = groups

		for _, group_data in ipairs(slot38) do
			if group_data.group[u_key] then
				keep = true

				break
			end
		end

		if not keep then
			slot40 = gui_text

			panel.remove(slot38, panel)

			logic_name_texts[u_key] = nil
		end
	end

	slot33 = unit_health_bars

	for u_key, gui_bar in pairs(slot32) do
		local keep = nil
		slot39 = groups

		for _, group_data in ipairs(slot38) do
			if group_data.group[u_key] then
				keep = true

				break
			end
		end

		if not keep then
			slot40 = gui_bar

			panel.remove(slot38, panel)

			unit_health_bars[u_key] = nil
		end
	end

	slot33 = unit_health_bars_bg

	for u_key, gui_bar in pairs(slot32) do
		local keep = nil
		slot39 = groups

		for _, group_data in ipairs(slot38) do
			if group_data.group[u_key] then
				keep = true

				break
			end
		end

		if not keep then
			slot40 = gui_bar

			panel.remove(slot38, panel)

			unit_health_bars_bg[u_key] = nil
		end
	end

	slot33 = unit_health_bar_vals

	for u_key, gui_text in pairs(slot32) do
		local keep = nil
		slot39 = groups

		for _, group_data in ipairs(slot38) do
			if group_data.group[u_key] then
				keep = true

				break
			end
		end

		if not keep then
			slot40 = gui_text

			panel.remove(slot38, panel)

			unit_health_bar_vals[u_key] = nil
		end
	end

	slot33 = rect_bgs

	for u_key, gui_rect in pairs(slot32) do
		local keep = nil
		slot39 = groups

		for _, group_data in ipairs(slot38) do
			if group_data.group[u_key] then
				keep = true

				break
			end
		end

		if not keep then
			slot40 = gui_rect

			panel.remove(slot38, panel)

			rect_bgs[u_key] = nil
		end
	end

	slot33 = group_id_texts

	for group_id, gui_text in pairs(slot32) do
		if not self._groups[group_id] then
			slot39 = gui_text

			panel.remove(slot37, panel)

			group_id_texts[group_id] = nil
		end
	end

	return 
end
GroupAIStateBesiege.filter_nav_seg_unsafe = function (self, nav_seg)
	slot5 = nav_seg

	return not self.is_nav_seg_safe(slot3, self)
end
GroupAIStateBesiege._on_nav_seg_safety_status = function (self, seg, event)
	slot6 = seg
	local area = self.get_area_from_nav_seg_id(slot4, self)
	slot8 = event

	self._on_area_safety_status(self, self, area)

	return 
end
GroupAIStateBesiege.add_flee_point = function (self, id, pos, so_action)
	slot8 = true
	local nav_seg = managers.navigation.get_nav_seg_from_pos(slot5, managers.navigation, pos)
	slot8 = nav_seg
	local area = self.get_area_from_nav_seg_id(managers.navigation, self)
	local flee_point = {
		pos = pos,
		nav_seg = nav_seg,
		area = area,
		so_action = so_action
	}
	self._flee_points[id] = flee_point
	area.flee_points = area.flee_points or {}
	area.flee_points[id] = flee_point

	return 
end
GroupAIStateBesiege.remove_flee_point = function (self, id)
	local flee_point = self._flee_points[id]

	if not flee_point then
		return 
	end

	self._flee_points[id] = nil
	local area = flee_point.area
	area.flee_points[id] = nil
	slot6 = area.flee_points

	if not next(nil) then
		area.flee_points = nil
	end

	return 
end
GroupAIStateBesiege.flee_point = function (self, start_nav_seg)
	slot5 = start_nav_seg
	local start_area = self.get_area_from_nav_seg_id(slot3, self)
	local to_search_areas = {
		start_area
	}
	local found_areas = {
		[start_area] = true
	}

	repeat
		slot8 = 1
		local search_area = table.remove(slot6, to_search_areas)

		if search_area.flee_points then
			slot8 = search_area.flee_points
		else
			slot8 = search_area.neighbours

			for other_area_id, other_area in pairs(slot7) do
				if not found_areas[other_area] then
					slot14 = other_area

					table.insert(slot12, to_search_areas)

					found_areas[other_area] = true
				end
			end
		end
	until #to_search_areas == 0

	return 
end
GroupAIStateBesiege.safe_flee_point = function (self, start_nav_seg)
	slot5 = start_nav_seg
	local start_area = self.get_area_from_nav_seg_id(slot3, self)
	slot5 = start_area.criminal.units

	if next(self) then
		return 
	end

	local to_search_areas = {
		start_area
	}
	local found_areas = {
		[start_area] = true
	}

	repeat
		slot8 = 1
		local search_area = table.remove(slot6, to_search_areas)

		if search_area.flee_points then
			slot8 = search_area.flee_points
		else
			slot8 = search_area.neighbours

			for other_area_id, other_area in pairs(slot7) do
				if not found_areas[other_area] then
					slot13 = other_area.criminal.units

					if not next(slot12) then
						slot14 = other_area

						table.insert(slot12, to_search_areas)

						found_areas[other_area] = true
					end
				end
			end
		end
	until #to_search_areas == 0

	return 
end
GroupAIStateBesiege.add_enemy_loot_drop_point = function (self, id, pos)
	slot7 = true
	local nav_seg = managers.navigation.get_nav_seg_from_pos(slot4, managers.navigation, pos)
	slot7 = nav_seg
	local area = self.get_area_from_nav_seg_id(managers.navigation, self)
	local drop_point = {
		pos = pos,
		nav_seg = nav_seg,
		area = area
	}
	self._enemy_loot_drop_points[id] = drop_point
	area.enemy_loot_drop_points = area.enemy_loot_drop_points or {}
	area.enemy_loot_drop_points[id] = drop_point

	return 
end
GroupAIStateBesiege.remove_enemy_loot_drop_point = function (self, id)
	local drop_point = self._enemy_loot_drop_points[id]

	if not drop_point then
		return 
	end

	self._enemy_loot_drop_points[id] = nil
	local area = drop_point.area
	area.enemy_loot_drop_points[id] = nil
	slot6 = area.enemy_loot_drop_points

	if not next(nil) then
		area.enemy_loot_drop_points = nil
	end

	return 
end
GroupAIStateBesiege.get_safe_enemy_loot_drop_point = function (self, start_nav_seg)
	slot5 = start_nav_seg
	local start_area = self.get_area_from_nav_seg_id(slot3, self)
	slot5 = start_area.criminal.units

	if next(self) then
		return 
	end

	local to_search_areas = {
		start_area
	}
	local found_areas = {
		[start_area] = true
	}

	repeat
		slot8 = 1
		local search_area = table.remove(slot6, to_search_areas)

		if search_area.enemy_loot_drop_points then
			slot8 = search_area.enemy_loot_drop_points
		else
			slot8 = search_area.neighbours

			for other_area_id, other_area in pairs(slot7) do
				if not found_areas[other_area] then
					slot13 = other_area.criminal.units

					if not next(slot12) then
						slot14 = other_area

						table.insert(slot12, to_search_areas)

						found_areas[other_area] = true
					end
				end
			end
		end
	until #to_search_areas == 0

	return 
end
GroupAIStateBesiege._draw_spawn_points = function (self)
	local all_areas = self._area_data
	local tmp_vec3 = Vector3()
	slot5 = all_areas

	for area_id, area_data in pairs(slot4) do
		local area_spawn_points = area_data.spawn_points

		if area_spawn_points then
			slot11 = area_spawn_points

			for _, sp_data in ipairs(slot10) do
				slot21 = 0.6

				Application.draw_sphere(slot15, Application, sp_data.pos, 220, 0.1, 0.4)
			end
		end

		local area_spawn_groups = area_data.spawn_groups

		if area_spawn_groups then
			slot12 = area_spawn_groups

			for _, spawn_group in ipairs(slot11) do
				slot18 = math.UP

				mvector3.set(slot16, tmp_vec3)

				slot18 = 2500

				mvector3.multiply(slot16, tmp_vec3)

				slot18 = spawn_group.pos

				mvector3.add(slot16, tmp_vec3)

				slot23 = 0.75

				Application.draw_cylinder(slot16, Application, spawn_group.pos, tmp_vec3, 220, 0.2, 0.1)

				slot17 = spawn_group.spawn_pts

				for _, sp_data in ipairs(slot16) do
					slot23 = math.UP

					mvector3.set(slot21, tmp_vec3)

					slot23 = 200

					mvector3.multiply(slot21, tmp_vec3)

					slot23 = sp_data.pos

					mvector3.add(slot21, tmp_vec3)

					slot28 = 0.6

					Application.draw_cylinder(slot21, Application, sp_data.pos, tmp_vec3, 63, 0.1, 0.4)

					slot28 = 0.75

					Application.draw_cylinder(slot21, Application, spawn_group.pos, sp_data.pos, 20, 0.2, 0.1)
				end
			end
		end
	end

	return 
end
GroupAIStateBesiege.on_hostage_fleeing = function (self, unit)
	self._hostage_fleeing = unit

	return 
end
GroupAIStateBesiege.on_hostage_flee_end = function (self)
	self._hostage_fleeing = nil

	return 
end
GroupAIStateBesiege.can_hostage_flee = function (self)
	return not self._hostage_fleeing
end
GroupAIStateBesiege.add_to_surrendered = function (self, unit, update)
	local hos_data = self._hostage_data
	local nr_entries = #hos_data
	local entry = {}
	slot8 = unit
	entry.u_key = unit.key(slot7)
	entry.clbk = update

	if not self._hostage_upd_key then
		self._hostage_upd_key = "GroupAIStateBesiege:_upd_hostage_task"
		slot12 = self._t + 1

		managers.enemy.queue_task(slot7, managers.enemy, self._hostage_upd_key, self._upd_hostage_task, self)
	end

	slot9 = entry

	table.insert(slot7, hos_data)

	return 
end
GroupAIStateBesiege.remove_from_surrendered = function (self, unit)
	local hos_data = self._hostage_data
	local u_key = unit.key(slot4)
	slot6 = hos_data

	for i, entry in ipairs(unit) do
		if u_key == entry.u_key then
			slot12 = i

			table.remove(slot10, hos_data)

			break
		end
	end

	if #hos_data == 0 then
		slot7 = self._hostage_upd_key

		managers.enemy.unqueue_task(slot5, managers.enemy)

		self._hostage_upd_key = nil
	end

	return 
end
GroupAIStateBesiege._upd_hostage_task = function (self)
	self._hostage_upd_key = nil
	local hos_data = self._hostage_data
	local first_entry = hos_data[1]
	slot6 = 1

	table.remove(slot4, hos_data)
	first_entry.clbk()

	if not self._hostage_upd_key and 0 < #hos_data then
		self._hostage_upd_key = "GroupAIStateBesiege:_upd_hostage_task"
		slot9 = self._t + 1

		managers.enemy.queue_task(slot4, managers.enemy, self._hostage_upd_key, self._upd_hostage_task, self)
	end

	return 
end
GroupAIStateBesiege.set_area_min_police_force = function (self, id, force, pos)
	if force then
		slot8 = true
		local nav_seg_id = managers.navigation.get_nav_seg_from_pos(slot5, managers.navigation, pos)
		slot8 = nav_seg_id
		local area = self.get_area_from_nav_seg_id(managers.navigation, self)
		local factors = area.factors
		factors.force = {
			id = id,
			force = force
		}
	else
		slot6 = self._area_data

		for area_id, area in pairs(slot5) do
			local force_factor = area.factors.force

			if force_factor and force_factor.id == id then
				area.factors.force = nil
				slot12 = self._groups

				for group_id, group in pairs(nil) do
					if group.objective and group.objective.area and group.objective.area.id == area_id then
						slot19 = nil

						self._set_assault_objective_to_group(slot16, self, group)
					end
				end

				return 
			end
		end
	end

	return 
end
GroupAIStateBesiege.set_wave_mode = function (self, flag)
	local old_wave_mode = self._wave_mode
	self._wave_mode = flag
	self._hunt_mode = nil

	if flag == "hunt" then
		self._hunt_mode = true
		self._wave_mode = "besiege"
		slot5 = managers.hud

		managers.hud.start_assault(slot4)

		slot6 = false

		self._set_rescue_state(slot4, self)

		slot6 = true

		self.set_assault_mode(slot4, self)

		slot6 = false

		managers.trade.set_trade_countdown(slot4, managers.trade)

		slot5 = self

		self._end_regroup_task(slot4)

		if self._task_data.assault.active then
			self._task_data.assault.phase = "sustain"
			self._task_data.use_smoke = true
			self._task_data.use_smoke_timer = 0
			slot6 = "assault"

			managers.music.raid_music_state_change(0, managers.music)
		else
			self._task_data.assault.next_dispatch_t = self._t
		end
	elseif flag == "besiege" then
		if self._task_data.regroup.active then
			self._task_data.assault.next_dispatch_t = self._task_data.regroup.end_t
		elseif not self._task_data.assault.active then
			self._task_data.assault.next_dispatch_t = self._t
		end
	elseif flag == "quiet" then
		self._hunt_mode = nil
	else
		self._wave_mode = old_wave_mode
		slot7 = " does not apply to the current Group AI state."

		debug_pause(slot4, "[GroupAIStateBesiege:set_wave_mode] flag", flag)
	end

	return 
end
GroupAIStateBesiege.on_simulation_ended = function (self)
	slot3 = self

	GroupAIStateBesiege.super.on_simulation_ended(slot2)

	slot3 = managers.navigation

	if managers.navigation.is_data_ready(slot2) then
		slot3 = self

		self._create_area_data(slot2)

		self._task_data = {
			reenforce = {
				next_dispatch_t = 0,
				tasks = {}
			},
			recon = {
				next_dispatch_t = 0,
				tasks = {}
			},
			assault = {
				is_first = true,
				disabled = true
			},
			regroup = {}
		}
	end

	if self._police_upd_task_queued then
		self._police_upd_task_queued = nil
		slot4 = "GroupAIStateBesiege._upd_police_activity"

		managers.enemy.unqueue_task(slot2, managers.enemy)
	end

	return 
end
GroupAIStateBesiege.on_simulation_started = function (self)
	slot3 = self

	GroupAIStateBesiege.super.on_simulation_started(slot2)

	slot3 = managers.navigation

	if managers.navigation.is_data_ready(slot2) then
		slot3 = self

		self._create_area_data(slot2)

		self._task_data = {
			reenforce = {
				next_dispatch_t = 0,
				tasks = {}
			},
			recon = {
				next_dispatch_t = 0,
				tasks = {}
			},
			assault = {
				is_first = true,
				disabled = true
			},
			regroup = {}
		}
	end

	if not self._police_upd_task_queued then
		slot3 = self

		self._queue_police_upd_task(slot2)
	end

	return 
end
GroupAIStateBesiege.on_enemy_weapons_hot = function (self, is_delayed_callback)
	if not self._ai_enabled then
		return 
	end

	if not self._enemy_weapons_hot then
		self._task_data.assault.disabled = nil
		self._task_data.assault.next_dispatch_t = self._t
	end

	slot5 = is_delayed_callback

	GroupAIStateBesiege.super.on_enemy_weapons_hot(slot3, self)

	return 
end
GroupAIStateBesiege.is_detection_persistent = function (self)
	return self._task_data.assault.active
end
GroupAIStateBesiege._assign_enemy_groups_to_assault = function (self, phase)
	slot4 = self._groups

	for group_id, group in pairs(slot3) do
		if group.has_spawned and group.objective.type == "assault_area" then
			if group.objective.moving_out then
				local done_moving = nil
				slot10 = group.units

				for u_key, u_data in pairs(slot9) do
					slot15 = u_data.unit
					slot15 = u_data.unit.brain(slot14)
					local objective = u_data.unit.brain(slot14).objective(slot14)

					if objective then
						if objective.grp_objective ~= group.objective then
						elseif not objective.in_place then
							done_moving = false
						elseif done_moving == nil then
							done_moving = true
						end
					end
				end

				if done_moving == true then
					group.objective.moving_out = nil
					group.in_place_t = self._t
					group.objective.moving_in = nil
					slot11 = group

					self._voice_move_complete(nil, self)
				end
			end

			if not group.objective.moving_in then
				slot11 = phase

				self._set_assault_objective_to_group(slot8, self, group)
			end
		end
	end

	return 
end
GroupAIStateBesiege._assign_enemy_groups_to_recon = function (self)
	slot3 = self._groups

	for group_id, group in pairs(slot2) do
		if group.has_spawned and group.objective.type == "recon_area" then
			if group.objective.moving_out then
				local done_moving = nil
				slot9 = group.units

				for u_key, u_data in pairs(slot8) do
					slot14 = u_data.unit
					slot14 = u_data.unit.brain(slot13)
					local objective = u_data.unit.brain(slot13).objective(slot13)

					if objective then
						if objective.grp_objective ~= group.objective then
						elseif not objective.in_place then
							done_moving = false
						elseif done_moving == nil then
							done_moving = true
						end
					end
				end

				if done_moving == true then
					if group.objective.moved_in then
						group.visited_areas = group.visited_areas or {}
						group.visited_areas[group.objective.area] = true
					end

					group.objective.moving_out = nil
					group.in_place_t = self._t
					group.objective.moving_in = nil
					slot10 = group

					self._voice_move_complete(nil, self)
				end
			end

			if not group.objective.moving_in then
				slot9 = group

				self._set_recon_objective_to_group(slot7, self)
			end
		end
	end

	return 
end
GroupAIStateBesiege._set_recon_objective_to_group = function (self, group)
	local current_objective = group.objective
	local target_area = current_objective.target_area or current_objective.area

	if (not target_area.loot and not target_area.hostages) or (not current_objective.moving_out and current_objective.moved_in and group.in_place_t and 15 < self._t - group.in_place_t) then
		local recon_area = nil
		local to_search_areas = {
			current_objective.area
		}
		local found_areas = {
			[current_objective.area] = "init"
		}

		repeat
			slot10 = 1
			local search_area = table.remove(slot8, to_search_areas)

			if search_area.loot or search_area.hostages then
				local occupied = nil
				slot11 = self._groups

				for test_group_id, test_group in pairs(slot10) do
					if test_group ~= group and (test_group.objective.target_area == search_area or test_group.objective.area == search_area) then
						occupied = true

						break
					end
				end

				if not occupied and group.visited_areas and group.visited_areas[search_area] then
					occupied = true
				end

				if not occupied then
					slot11 = search_area.criminal.units
					local is_area_safe = not next(slot10)

					if is_area_safe then
						recon_area = search_area

						break
					else
						recon_area = recon_area or search_area
					end
				end
			end

			slot10 = search_area.criminal.units

			if not next(slot9) then
				slot10 = search_area.neighbours

				for other_area_id, other_area in pairs(slot9) do
					if not found_areas[other_area] then
						slot16 = other_area

						table.insert(slot14, to_search_areas)

						found_areas[other_area] = search_area
					end
				end
			end
		until #to_search_areas == 0

		if recon_area then
			local coarse_path = {
				{
					recon_area.pos_nav_seg,
					recon_area.pos
				}
			}
			local last_added_area = recon_area

			while found_areas[last_added_area] ~= "init" do
				last_added_area = found_areas[last_added_area]
				slot13 = {
					last_added_area.pos_nav_seg,
					last_added_area.pos
				}

				table.insert(slot10, coarse_path, 1)
			end

			local grp_objective = {
				scan = true,
				pose = "stand",
				type = "recon_area",
				stance = "hos",
				attitude = "avoid",
				area = current_objective.area,
				target_area = recon_area,
				coarse_path = coarse_path
			}
			slot14 = grp_objective

			self._set_objective_to_enemy_group(slot11, self, group)

			current_objective = group.objective
		end
	end

	if current_objective.target_area then
		if current_objective.moving_out and not current_objective.moving_in and current_objective.coarse_path then
			slot7 = group
			local forwardmost_i_nav_point = self._get_group_forwardmost_coarse_path_index(slot5, self)

			if forwardmost_i_nav_point and 1 < forwardmost_i_nav_point then
				for i = forwardmost_i_nav_point + 1, #current_objective.coarse_path, 1 do
					local nav_point = current_objective.coarse_path[forwardmost_i_nav_point]
					slot13 = nav_point[1]

					if not self.is_nav_seg_safe(slot11, self) then
						for i = 0, #current_objective.coarse_path - forwardmost_i_nav_point, 1 do
							slot16 = current_objective.coarse_path

							table.remove(slot15)
						end

						local grp_objective = {
							attitude = "avoid",
							scan = true,
							pose = "stand",
							type = "recon_area",
							stance = "hos"
						}
						slot14 = current_objective.coarse_path[#current_objective.coarse_path][1]
						grp_objective.area = self.get_area_from_nav_seg_id(slot12, self)
						grp_objective.target_area = current_objective.target_area
						slot15 = grp_objective

						self._set_objective_to_enemy_group(slot12, self, group)

						return 
					end
				end
			end
		end

		if not current_objective.moving_out and not current_objective.area.neighbours[current_objective.target_area.id] then
			local search_params = {
				id = "GroupAI_recon",
				from_seg = current_objective.area.pos_nav_seg,
				to_seg = current_objective.target_area.pos_nav_seg
			}
			slot7 = group
			search_params.access_pos = self._get_group_acces_mask(slot6)
			slot9 = "is_nav_seg_safe"
			search_params.verify_clbk = callback(slot6, self, self)
			slot8 = search_params
			local coarse_path = managers.navigation.search_coarse(slot6, managers.navigation)

			if coarse_path then
				slot9 = coarse_path

				self._merge_coarse_path_by_area(slot7, self)
				table.remove(slot7)

				local grp_objective = {
					scan = true,
					pose = "stand",
					type = "recon_area",
					stance = "hos",
					attitude = "avoid"
				}
				slot10 = coarse_path[#coarse_path][1]
				grp_objective.area = self.get_area_from_nav_seg_id(coarse_path, self)
				grp_objective.target_area = current_objective.target_area
				grp_objective.coarse_path = coarse_path
				slot11 = grp_objective

				self._set_objective_to_enemy_group(coarse_path, self, group)
			end
		end

		if not current_objective.moving_out and current_objective.area.neighbours[current_objective.target_area.id] then
			local grp_objective = {
				stance = "hos",
				scan = true,
				pose = "crouch",
				type = "recon_area",
				attitude = "avoid",
				area = current_objective.target_area
			}
			slot9 = grp_objective

			self._set_objective_to_enemy_group(slot6, self, group)

			group.objective.moving_in = true
			group.objective.moved_in = true
			slot7 = current_objective.target_area.criminal.units

			if next(true) then
				slot9 = {
					use_smoke = true,
					target_areas = {
						grp_objective.area
					}
				}

				self._chk_group_use_smoke_grenade(slot6, self, group)
			end
		end
	end

	return 
end
GroupAIStateBesiege._set_objective_to_enemy_group = function (self, group, grp_objective)
	group.objective = grp_objective

	if grp_objective.area then
		grp_objective.moving_out = true

		if not grp_objective.nav_seg and grp_objective.coarse_path then
			grp_objective.nav_seg = grp_objective.coarse_path[#grp_objective.coarse_path][1]
		end
	end

	grp_objective.assigned_t = self._t

	if self._AI_draw_data and self._AI_draw_data.group_id_texts[group.id] then
		slot6 = self._AI_draw_data.group_id_texts[group.id]

		self._AI_draw_data.panel.remove(slot4, self._AI_draw_data.panel)

		self._AI_draw_data.group_id_texts[group.id] = nil
	end

	return 
end
GroupAIStateBesiege._upd_groups = function (self)
	slot3 = self._groups

	for group_id, group in pairs(slot2) do
		slot9 = group

		self._verify_group_objective(slot7, self)

		slot8 = group.units

		for u_key, u_data in pairs(slot7) do
			local nav_seg = u_data.tracker.nav_segment(slot12)
			slot15 = nav_seg
			local world_id = managers.navigation.get_world_for_nav_seg(u_data.tracker, managers.navigation)
			slot16 = world_id
			local alarm = managers.worldcollection.get_alarm_for_world(managers.navigation, managers.worldcollection)

			if alarm then
				local brain = u_data.unit.brain(slot15)
				slot17 = brain
				local current_objective = brain.objective(u_data.unit)

				if not current_objective or current_objective.is_default or (current_objective.grp_objective and current_objective.grp_objective ~= group.objective and not current_objective.grp_objective.no_retry) then
				end
			end
		end
	end

	return 
end
GroupAIStateBesiege._set_assault_objective_to_group = function (self, group, phase)
	if not group.has_spawned then
		return 
	end

	local phase_is_anticipation = phase == "anticipation"
	local current_objective = group.objective
	local approach, open_fire, push, pull_back, charge = nil
	slot13 = group
	local obstructed_area = self._chk_group_areas_tresspassed(slot11, self)
	slot13 = group.units
	local group_leader_u_key, group_leader_u_data = self._determine_group_leader(self)
	local tactics_map = nil

	if group_leader_u_data and group_leader_u_data.tactics then
		tactics_map = {}
		slot16 = group_leader_u_data.tactics

		for _, tactic_name in ipairs(slot15) do
			tactics_map[tactic_name] = true
		end

		if current_objective.tactic and not tactics_map[current_objective.tactic] then
			current_objective.tactic = nil
		end

		slot16 = group_leader_u_data.tactics

		for i_tactic, tactic_name in ipairs(slot15) do
			if tactic_name == "deathguard" and not phase_is_anticipation then
				if current_objective.tactic == tactic_name then
					slot21 = self._char_criminals

					for u_key, u_data in pairs(slot20) do
						if u_data.status and current_objective.follow_unit == u_data.unit then
							slot26 = u_data.tracker
							local crim_nav_seg = u_data.tracker.nav_segment(slot25)

							if current_objective.area.nav_segs[crim_nav_seg] then
								return 
							end
						end
					end
				end

				local closest_crim_u_data, closest_crim_dis_sq = nil
				slot23 = self._char_criminals

				for u_key, u_data in pairs(slot22) do
					if u_data.status then
						slot29 = group.units
						local closest_u_id, closest_u_data, closest_u_dis_sq = self._get_closest_group_unit_to_pos(slot27, u_data.m_pos)

						if closest_u_dis_sq and (not closest_crim_dis_sq or closest_u_dis_sq < closest_crim_dis_sq) then
							closest_crim_u_data = u_data
							closest_crim_dis_sq = closest_u_dis_sq
						end
					end
				end

				if closest_crim_u_data then
					local search_params = {
						id = "GroupAI_deathguard"
					}
					slot24 = group_leader_u_data.unit
					slot24 = group_leader_u_data.unit.movement(slot23)
					search_params.from_tracker = group_leader_u_data.unit.movement(slot23).nav_tracker(slot23)
					search_params.to_tracker = closest_crim_u_data.tracker
					slot24 = group
					search_params.access_pos = self._get_group_acces_mask(slot23)
					slot25 = search_params
					local coarse_path = managers.navigation.search_coarse(slot23, managers.navigation)

					if coarse_path then
						local grp_objective = {
							distance = 800,
							type = "assault_area",
							attitude = "engage",
							tactic = "deathguard",
							moving_in = true,
							follow_unit = closest_crim_u_data.unit
						}
						slot27 = coarse_path[#coarse_path][1]
						grp_objective.area = self.get_area_from_nav_seg_id(slot25, self)
						grp_objective.coarse_path = coarse_path
						group.is_chasing = true
						slot28 = grp_objective

						self._set_objective_to_enemy_group(slot25, self, group)

						slot27 = group

						self._voice_deathguard_start(slot25, self)

						return 
					end
				end
			elseif tactic_name == "charge" and not current_objective.moving_out and group.in_place_t and (15 < self._t - group.in_place_t or (4 < self._t - group.in_place_t and self._drama_data.amount <= tweak_data.drama.low)) then
				slot21 = current_objective.area.criminal.units

				if next(slot20) and group.is_chasing and not current_objective.charge then
					charge = true
				end
			end
		end
	end

	local objective_area = nil

	if obstructed_area then
		if current_objective.moving_out then
			if not current_objective.open_fire then
				open_fire = true
			end
		elseif not current_objective.pushed or (charge and not current_objective.charge) then
			push = true
		end
	else
		slot18 = group
		local obstructed_path_index = self._chk_coarse_path_obstructed(slot16, self)

		if obstructed_path_index then
			slot19 = obstructed_path_index

			print(slot17, "obstructed_path_index")

			slot23 = 1
			slot19 = group.coarse_path[math.max(slot21, obstructed_path_index - 1)][1]
			objective_area = self.get_area_from_nav_seg_id(slot17, self)
			pull_back = true
		elseif not current_objective.moving_out then
			local has_criminals_close = nil

			if not current_objective.moving_out then
				slot19 = current_objective.area.neighbours

				for area_id, neighbour_area in pairs(slot18) do
					slot24 = neighbour_area.criminal.units

					if next(slot23) then
						has_criminals_close = true

						break
					end
				end
			end

			if charge then
				push = true
			elseif not has_criminals_close or not group.in_place_t then
				approach = true
			elseif not phase_is_anticipation and not current_objective.open_fire then
				open_fire = true
			elseif not phase_is_anticipation and group.in_place_t and (group.is_chasing or not tactics_map or not tactics_map.ranged_fire or 15 < self._t - group.in_place_t) then
				push = true
			elseif phase_is_anticipation and current_objective.open_fire then
				pull_back = true
			end
		end
	end

	objective_area = objective_area or current_objective.area

	if open_fire then
		local grp_objective = {
			attitude = "engage",
			pose = "stand",
			type = "assault_area",
			stance = "hos",
			open_fire = true,
			tactic = current_objective.tactic,
			area = obstructed_area or current_objective.area
		}
		slot20 = current_objective.area.pos
		grp_objective.coarse_path = {
			{
				objective_area.pos_nav_seg,
				mvector3.copy(slot19)
			}
		}
		slot20 = grp_objective

		self._set_objective_to_enemy_group(, self, group)

		slot19 = group

		self._voice_open_fire_start(, self)
	elseif approach or push then
		local assault_area, alternate_assault_area, alternate_assault_area_from, assault_path, alternate_assault_path = nil
		local to_search_areas = {
			objective_area
		}
		local found_areas = {
			[objective_area] = "init"
		}

		repeat
			slot25 = 1
			local search_area = table.remove(slot23, to_search_areas)
			slot25 = search_area.criminal.units

			if next(to_search_areas) then
				local assault_from_here = true

				if not push and tactics_map and tactics_map.flank then
					local assault_from_area = found_areas[search_area]

					if assault_from_area ~= "init" then
						local cop_units = assault_from_area.police.units
						slot28 = cop_units

						for u_key, u_data in pairs(slot27) do
							if u_data.group and u_data.group ~= group and u_data.group.objective.type == "assault_area" then
								assault_from_here = false

								if not alternate_assault_area or math.random() < 0.5 then
									local search_params = {
										id = "GroupAI_assault",
										from_seg = current_objective.area.pos_nav_seg,
										to_seg = search_area.pos_nav_seg
									}
									slot34 = group
									search_params.access_pos = self._get_group_acces_mask(slot33)
									slot36 = "is_nav_seg_safe"
									search_params.verify_clbk = callback(slot33, self, self)
									slot35 = search_params
									alternate_assault_path = managers.navigation.search_coarse(slot33, managers.navigation)

									if alternate_assault_path then
										slot35 = alternate_assault_path

										self._merge_coarse_path_by_area(slot33, self)

										alternate_assault_area = search_area
										alternate_assault_area_from = assault_from_area
									end
								end

								found_areas[search_area] = nil

								break
							end
						end
					end
				end

				if assault_from_here then
					local search_params = {
						id = "GroupAI_assault",
						from_seg = current_objective.area.pos_nav_seg,
						to_seg = search_area.pos_nav_seg
					}
					slot27 = group
					search_params.access_pos = self._get_group_acces_mask(slot26)
					slot29 = "is_nav_seg_safe"
					search_params.verify_clbk = callback(slot26, self, self)
					slot28 = search_params
					assault_path = managers.navigation.search_coarse(slot26, managers.navigation)

					if assault_path then
						slot28 = assault_path

						self._merge_coarse_path_by_area(slot26, self)

						assault_area = search_area

						break
					end
				end
			else
				slot25 = search_area.neighbours

				for other_area_id, other_area in pairs(slot24) do
					if not found_areas[other_area] then
						slot31 = other_area

						table.insert(slot29, to_search_areas)

						found_areas[other_area] = search_area
					end
				end
			end
		until #to_search_areas == 0

		if not assault_area and alternate_assault_area then
			assault_area = alternate_assault_area
			found_areas[assault_area] = alternate_assault_area_from
			assault_path = alternate_assault_path
		end

		if assault_area and assault_path then
			local assault_area = (push and assault_area) or (found_areas[assault_area] == "init" and objective_area) or found_areas[assault_area]

			if 2 < #assault_path and assault_area.nav_segs[assault_path[#assault_path - 1][1]] then
				slot25 = assault_path

				table.remove(slot24)
			end

			local used_grenade = nil

			if push then
				local detonate_pos = nil

				if charge then
					slot27 = assault_area.criminal.units

					for c_key, c_data in pairs(slot26) do
						slot32 = c_data.unit
						slot32 = c_data.unit.movement(slot31)
						detonate_pos = c_data.unit.movement(slot31).m_pos(slot31)

						break
					end
				end

				local first_chk = (math.random() < 0.5 and self._chk_group_use_flash_grenade) or self._chk_group_use_smoke_grenade
				local second_chk = (first_chk == self._chk_group_use_flash_grenade and self._chk_group_use_smoke_grenade) or self._chk_group_use_flash_grenade
				slot32 = detonate_pos
				used_grenade = first_chk(slot28, self, group, self._task_data.assault)

				if not used_grenade then
					slot32 = detonate_pos
					used_grenade = second_chk(slot28, self, group, self._task_data.assault)
				end

				slot30 = group

				self._voice_move_in_start(slot28, self)
			end

			if not push or used_grenade then
				local grp_objective = {
					type = "assault_area",
					stance = "hos",
					area = assault_area,
					coarse_path = assault_path,
					pose = (push and "crouch") or "stand",
					attitude = (push and "engage") or "avoid",
					moving_in = (push and true) or nil,
					open_fire = push or nil,
					pushed = push or nil,
					charge = charge,
					interrupt_dis = (charge and 0) or nil
				}
				group.is_chasing = group.is_chasing or push
				slot29 = grp_objective

				self._set_objective_to_enemy_group(slot26, self, group)
			end
		end
	elseif pull_back then
		local retreat_area, do_not_retreat = nil
		slot19 = group.units

		for u_key, u_data in pairs(slot18) do
			slot24 = u_data.tracker
			local nav_seg_id = u_data.tracker.nav_segment(slot23)

			if current_objective.area.nav_segs[nav_seg_id] then
				retreat_area = current_objective.area

				break
			end

			slot26 = nav_seg_id

			if self.is_nav_seg_safe(slot24, self) then
				slot26 = nav_seg_id
				retreat_area = self.get_area_from_nav_seg_id(slot24, self)

				break
			end
		end

		if not retreat_area and not do_not_retreat and current_objective.coarse_path then
			slot20 = group
			local forwardmost_i_nav_point = self._get_group_forwardmost_coarse_path_index(slot18, self)

			if forwardmost_i_nav_point then
				local nearest_safe_nav_seg_id = current_objective.coarse_path(slot19)
				slot22 = nearest_safe_nav_seg_id
				retreat_area = self.get_area_from_nav_seg_id(forwardmost_i_nav_point, self)
			end
		end

		if retreat_area then
			local new_grp_objective = {
				attitude = "avoid",
				stance = "hos",
				pose = "crouch",
				type = "assault_area",
				area = retreat_area
			}
			slot22 = retreat_area.pos
			new_grp_objective.coarse_path = {
				{
					retreat_area.pos_nav_seg,
					mvector3.copy(slot21)
				}
			}
			group.is_chasing = nil
			slot22 = new_grp_objective

			self._set_objective_to_enemy_group(, self, group)

			return 
		end
	end

	return 
end
GroupAIStateBesiege._create_objective_from_group_objective = function (grp_objective, receiving_unit)
	local objective = {
		grp_objective = grp_objective
	}

	if grp_objective.element then
		slot6 = receiving_unit
		objective = grp_objective.element.get_random_SO(slot4, grp_objective.element)

		if not objective then
			return 
		end

		objective.grp_objective = grp_objective

		return 
	elseif grp_objective.type == "defend_area" or grp_objective.type == "recon_area" or grp_objective.type == "reenforce_area" then
		objective.type = "defend_area"
		objective.stance = "hos"
		objective.pose = "crouch"
		objective.scan = true
		objective.interrupt_dis = 200
		objective.interrupt_suppression = true
	elseif grp_objective.type == "retire" then
		objective.type = "defend_area"
		objective.stance = "hos"
		objective.pose = "stand"
		objective.scan = true
		objective.interrupt_dis = 200
		objective.action = grp_objective.action
	elseif grp_objective.type == "assault_area" then
		objective.type = "defend_area"

		if grp_objective.follow_unit then
			objective.follow_unit = grp_objective.follow_unit
			objective.distance = grp_objective.distance
		end

		objective.stance = "hos"
		objective.pose = "stand"
		objective.scan = true
		objective.interrupt_dis = 200
		objective.interrupt_suppression = true
	elseif grp_objective.type == "create_phalanx" then
		objective.type = "phalanx"
		objective.stance = "hos"
		objective.interrupt_dis = nil
		objective.interrupt_health = nil
		objective.interrupt_suppression = nil
		objective.attitude = "avoid"
		objective.path_ahead = true
	elseif grp_objective.type == "hunt" then
		objective.type = "hunt"
		objective.stance = "hos"
		objective.scan = true
		objective.interrupt_dis = 200
	end

	objective.stance = grp_objective.stance or objective.stance
	objective.pose = grp_objective.pose or objective.pose
	objective.area = grp_objective.area
	objective.nav_seg = grp_objective.nav_seg or objective.area.pos_nav_seg
	objective.attitude = grp_objective.attitude or objective.attitude
	objective.interrupt_dis = grp_objective.interrupt_dis or objective.interrupt_dis
	objective.interrupt_health = grp_objective.interrupt_health or objective.interrupt_health
	objective.interrupt_suppression = grp_objective.interrupt_suppression or objective.interrupt_suppression
	objective.pos = grp_objective.pos

	if grp_objective.scan ~= nil then
		objective.scan = grp_objective.scan
	end

	if grp_objective.coarse_path then
		objective.path_style = "coarse_complete"
		objective.path_data = grp_objective.coarse_path
	end

	return objective
end
GroupAIStateBesiege._assign_groups_to_retire = function (self, allowed_groups, suitable_grp_func)
	slot5 = self._groups

	for group_id, group in pairs(slot4) do
		if not allowed_groups[group.type] and group.objective.type ~= "reenforce_area" and group.objective.type ~= "retire" then
			slot11 = group

			self._assign_group_to_retire(slot9, self)
		elseif suitable_grp_func and allowed_groups[group.type] then
			slot10 = group

			suitable_grp_func(slot9)
		end
	end

	return 
end
GroupAIStateBesiege._assign_group_to_retire = function (self, group)
	local retire_area, retire_pos, retire_flee_point = nil
	local to_search_areas = {
		group.objective.area
	}
	local found_areas = {
		[group.objective.area] = true
	}

	repeat
		slot10 = 1
		local search_area = table.remove(slot8, to_search_areas)

		if search_area.flee_points then
			slot10 = search_area.flee_points
		else
			slot10 = search_area.neighbours

			for other_area_id, other_area in pairs(slot9) do
				if not found_areas[other_area] then
					slot16 = other_area

					table.insert(slot14, to_search_areas)

					found_areas[other_area] = true
				end
			end
		end
	until #to_search_areas == 0

	if not retire_area then
		slot13 = group.objective.area
		slot13 = group.id

		Application.error(slot8, Application, "[GroupAIStateBesiege:_assign_group_to_retire] flee point not found. from area:", inspect(slot12), "group ID:")

		return 
	end

	local grp_objective = {
		type = "retire",
		area = retire_area or group.objective.area,
		coarse_path = {
			{
				retire_area.pos_nav_seg,
				retire_area.pos
			}
		},
		pos = retire_pos
	}

	if retire_flee_point and retire_flee_point.so_action and retire_flee_point.so_action ~= "none" then
		slot13 = "on_retire_action_complete"
		grp_objective.action = {
			align_sync = true,
			needs_full_blend = true,
			type = "act",
			body_part = 1,
			variant = retire_flee_point.so_action,
			blocks = {
				light_hurt = -1,
				hurt = -1,
				action = 1,
				heavy_hurt = -1,
				idle = 1,
				aim = 1,
				act = 1,
				walk = 1
			},
			complete_callback = callback(slot10, self, self)
		}
	end

	slot12 = grp_objective

	self._set_objective_to_enemy_group(slot9, self, group)

	return 
end
GroupAIStateBesiege.on_retire_action_complete = function (self, unit)
	slot4 = unit
	slot5 = false

	unit.brain(slot3).set_active(slot3, unit.brain(slot3))

	slot4 = unit
	slot6 = 0

	unit.base(slot3).set_slot(slot3, unit.base(slot3), unit)

	return 
end
GroupAIStateBesiege._determine_group_leader = function (units)
	local highest_rank, highest_ranking_u_key, highest_ranking_u_data = nil
	slot6 = units

	for u_key, u_data in pairs(slot5) do
		if u_data.rank and (not highest_rank or highest_rank < u_data.rank) then
			highest_rank = u_data.rank
			highest_ranking_u_key = u_key
			highest_ranking_u_data = u_data
		end
	end

	return highest_ranking_u_key, highest_ranking_u_data
end
GroupAIStateBesiege._get_closest_group_unit_to_pos = function (pos, units)
	local closest_dis_sq, closest_u_key, closest_u_data = nil
	slot7 = units

	for u_key, u_data in pairs(slot6) do
		slot13 = u_data.m_pos
		local my_dis = mvector3.distance_sq(slot11, pos)

		if not closest_dis_sq or my_dis < closest_dis_sq then
			closest_dis_sq = my_dis
			closest_u_key = u_key
			closest_u_data = u_data
		end
	end

	return closest_u_key, closest_u_data, closest_dis_sq
end
GroupAIStateBesiege._chk_group_use_smoke_grenade = function (self, group, task_data, detonate_pos)
	if task_data.use_smoke then
		slot6 = self

		if not self.is_smoke_grenade_active(slot5) then
			local shooter_pos, shooter_u_data = nil
			local duration = tweak_data.group_ai.smoke_grenade_lifetime
			slot9 = group.units

			for u_key, u_data in pairs(slot8) do
				if u_data.tactics_map and u_data.tactics_map.smoke_grenade then
					if not detonate_pos then
						slot14 = u_data.tracker
						local nav_seg_id = u_data.tracker.nav_segment(slot13)
						local nav_seg = managers.navigation._nav_segments[nav_seg_id]
						slot16 = nav_seg.neighbours

						for neighbour_nav_seg_id, door_list in pairs(slot15) do

							-- Decompilation error in this vicinity:
							slot22 = neighbour_nav_seg_id
							local area = self.get_area_from_nav_seg_id(slot20, self)
						end
					end

					if detonate_pos and shooter_u_data then
						self.detonate_smoke_grenade(slot13, self, detonate_pos, shooter_pos, duration)

						slot20 = 1
						slot17 = math.rand(false, 0)^0.5
						task_data.use_smoke_timer = self._t + math.lerp(self, tweak_data.group_ai.smoke_and_flash_grenade_timeout[1], tweak_data.group_ai.smoke_and_flash_grenade_timeout[2])
						task_data.use_smoke = false

						if shooter_u_data.char_tweak.chatter.smoke then
							slot14 = shooter_u_data.unit
							slot15 = self._t

							if not shooter_u_data.unit.sound(slot13).speaking(slot13, shooter_u_data.unit.sound(slot13)) then
								slot17 = "smoke"

								self.chk_say_enemy_chatter(slot13, self, shooter_u_data.unit, shooter_u_data.m_pos)
							end
						end

						return true
					end
				end
			end
		end
	end

	return 
end
GroupAIStateBesiege._chk_group_use_flash_grenade = function (self, group, task_data, detonate_pos)
	if task_data.use_smoke then
		slot6 = self

		if not self.is_smoke_grenade_active(slot5) then
			local shooter_pos, shooter_u_data = nil
			local duration = tweak_data.group_ai.flash_grenade_lifetime
			slot9 = group.units

			for u_key, u_data in pairs(slot8) do
				if u_data.tactics_map and u_data.tactics_map.flash_grenade then
					if not detonate_pos then
						slot14 = u_data.tracker
						local nav_seg_id = u_data.tracker.nav_segment(slot13)
						local nav_seg = managers.navigation._nav_segments[nav_seg_id]
						slot16 = nav_seg.neighbours

						for neighbour_nav_seg_id, door_list in pairs(slot15) do
							if task_data.target_areas[1].nav_segs[neighbour_nav_seg_id] then
								local random_door_id = door_list[math.random(slot20)]
								slot22 = random_door_id

								if type(#door_list) == "number" then
									detonate_pos = managers.navigation._room_doors[random_door_id].center
								elseif random_door_id.script_data then
									slot22 = random_door_id
									slot22 = random_door_id.script_data(slot21).element
									detonate_pos = random_door_id.script_data(slot21).element.nav_link_end_pos(slot21)
								else
									detonate_pos = random_door_id
								end

								slot22 = u_data.m_pos
								shooter_pos = mvector3.copy(slot21)
								shooter_u_data = u_data

								break
							end
						end
					end

					if detonate_pos and shooter_u_data then
						slot18 = true

						self.detonate_smoke_grenade(slot13, self, detonate_pos, shooter_pos, duration)

						slot17 = math.random()^0.5
						task_data.use_smoke_timer = self._t + math.lerp(self, tweak_data.group_ai.smoke_and_flash_grenade_timeout[1], tweak_data.group_ai.smoke_and_flash_grenade_timeout[2])
						task_data.use_smoke = false

						if shooter_u_data.char_tweak.chatter.flash_grenade then
							slot14 = shooter_u_data.unit
							slot15 = self._t

							if not shooter_u_data.unit.sound(slot13).speaking(slot13, shooter_u_data.unit.sound(slot13)) then
								slot17 = "flash_grenade"

								self.chk_say_enemy_chatter(slot13, self, shooter_u_data.unit, shooter_u_data.m_pos)
							end
						end

						return true
					end
				end
			end
		end
	end

	return 
end
GroupAIStateBesiege.detonate_smoke_grenade = function (self, detonate_pos, shooter_pos, duration, flashbang)
	slot7 = managers.network
	slot12 = (flashbang and true) or false

	managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_smoke_grenade", detonate_pos, shooter_pos, duration)

	slot11 = flashbang

	self.sync_smoke_grenade(slot6, self, detonate_pos, shooter_pos, duration)

	return 
end
GroupAIStateBesiege.detonate_cs_grenade = function (self, detonate_pos, shooter_pos, duration)
	slot6 = managers.network
	slot10 = duration

	managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_cs_grenade", detonate_pos, shooter_pos)

	slot9 = duration

	self.sync_cs_grenade(slot5, self, detonate_pos, shooter_pos)

	return 
end
GroupAIStateBesiege._assign_assault_groups_to_retire = function (self)
	local function suitable_grp_func(group)
		if group.objective.type == "assault_area" then
			local regroup_area = nil
			slot4 = group.objective.area.criminal.units

			if next(slot3) then
				slot4 = group.objective.area.neighbours

				for other_area_id, other_area in pairs(slot3) do
					slot9 = other_area.criminal.units

					if not next(slot8) then
						regroup_area = other_area

						break
					end
				end
			end

			regroup_area = regroup_area or group.objective.area
			local grp_objective = {
				stance = "hos",
				attitude = "avoid",
				pose = "crouch",
				type = "recon_area",
				area = regroup_area
			}
			slot7 = grp_objective

			self._set_objective_to_enemy_group(slot4, self, group)
		end

		return 
	end

	slot6 = suitable_grp_func

	self._assign_groups_to_retire(slot3, self, self._tweak_data.recon.groups)

	return 
end
GroupAIStateBesiege._assign_recon_groups_to_retire = function (self)
	local function suitable_grp_func(group)
		if group.objective.type == "recon_area" then
			local grp_objective = {
				stance = "hos",
				attitude = "avoid",
				pose = "crouch",
				type = "assault_area",
				area = group.objective.area
			}
			slot6 = grp_objective

			self._set_objective_to_enemy_group(slot3, self, group)
		end

		return 
	end

	slot6 = suitable_grp_func

	self._assign_groups_to_retire(slot3, self, self._tweak_data.assault.groups)

	return 
end
GroupAIStateBesiege._assign_enemy_groups_to_reenforce = function (self)
	slot3 = self._groups

	for group_id, group in pairs(slot2) do
		if group.has_spawned and group.objective.type == "reenforce_area" then
			local locked_up_in_area = nil

			if group.objective.moving_out then
				local done_moving = true
				slot10 = group.units

				for u_key, u_data in pairs(slot9) do
					slot15 = u_data.unit
					slot15 = u_data.unit.brain(slot14)
					local objective = u_data.unit.brain(slot14).objective(slot14)

					if not objective or objective.is_default or (objective.grp_objective and objective.grp_objective ~= group.objective) then
						if objective then
							if objective.area then
								locked_up_in_area = objective.area
							elseif objective.nav_seg then
								slot17 = objective.nav_seg
								locked_up_in_area = self.get_area_from_nav_seg_id(slot15, self)
							else
								slot16 = self
								slot19 = u_data.tracker
								locked_up_in_area = self.get_area_from_nav_seg_id(slot15, u_data.tracker.nav_segment(slot18))
							end
						else
							slot16 = self
							slot19 = u_data.tracker
							locked_up_in_area = self.get_area_from_nav_seg_id(slot15, u_data.tracker.nav_segment(slot18))
						end
					elseif not objective.in_place then
						done_moving = false
					end
				end

				if done_moving then
					group.objective.moving_out = nil
					group.in_place_t = self._t
					group.objective.moving_in = nil
					slot11 = group

					self._voice_move_complete(nil, self)
				end
			end

			if not group.objective.moving_in then
				if locked_up_in_area and locked_up_in_area ~= group.objective.area then
				elseif not group.objective.moving_out then
					slot10 = group

					self._set_reenforce_objective_to_group(slot8, self)
				end
			end
		end
	end

	return 
end
GroupAIStateBesiege._set_reenforce_objective_to_group = function (self, group)
	if not group.has_spawned then
		return 
	end

	local current_objective = group.objective

	if current_objective.target_area then
		if current_objective.moving_out and not current_objective.moving_in then
			slot6 = group
			local forwardmost_i_nav_point = self._get_group_forwardmost_coarse_path_index(slot4, self)

			if forwardmost_i_nav_point then
				for i = forwardmost_i_nav_point + 1, #current_objective.coarse_path, 1 do
					local nav_point = current_objective.coarse_path[forwardmost_i_nav_point]
					slot12 = nav_point[1]

					if not self.is_nav_seg_safe(slot10, self) then
						for i = 0, #current_objective.coarse_path - forwardmost_i_nav_point, 1 do
							slot15 = current_objective.coarse_path

							table.remove(slot14)
						end

						local grp_objective = {
							attitude = "avoid",
							scan = true,
							pose = "stand",
							type = "reenforce_area",
							stance = "hos"
						}
						slot13 = current_objective.coarse_path[#current_objective.coarse_path][1]
						grp_objective.area = self.get_area_from_nav_seg_id(slot11, self)
						grp_objective.target_area = current_objective.target_area
						slot14 = grp_objective

						self._set_objective_to_enemy_group(slot11, self, group)

						return 
					end
				end
			end
		end

		if not current_objective.moving_out and not current_objective.area.neighbours[current_objective.target_area.id] then
			local search_params = {
				id = "GroupAI_reenforce",
				from_seg = current_objective.area.pos_nav_seg,
				to_seg = current_objective.target_area.pos_nav_seg
			}
			slot6 = group
			search_params.access_pos = self._get_group_acces_mask(slot5)
			slot8 = "is_nav_seg_safe"
			search_params.verify_clbk = callback(slot5, self, self)
			slot7 = search_params
			local coarse_path = managers.navigation.search_coarse(slot5, managers.navigation)

			if coarse_path then
				slot8 = coarse_path

				self._merge_coarse_path_by_area(slot6, self)
				table.remove(slot6)

				local grp_objective = {
					scan = true,
					pose = "stand",
					type = "reenforce_area",
					stance = "hos",
					attitude = "avoid"
				}
				slot9 = coarse_path[#coarse_path][1]
				grp_objective.area = self.get_area_from_nav_seg_id(coarse_path, self)
				grp_objective.target_area = current_objective.target_area
				grp_objective.coarse_path = coarse_path
				slot10 = grp_objective

				self._set_objective_to_enemy_group(coarse_path, self, group)
			end
		end

		if not current_objective.moving_out and current_objective.area.neighbours[current_objective.target_area.id] then
			slot5 = current_objective.target_area.criminal.units

			if not next(slot4) then
				local grp_objective = {
					stance = "hos",
					scan = true,
					pose = "crouch",
					type = "reenforce_area",
					attitude = "engage",
					area = current_objective.target_area
				}
				slot8 = grp_objective

				self._set_objective_to_enemy_group(slot5, self, group)

				group.objective.moving_in = true
			end
		end
	end

	return 
end
GroupAIStateBesiege._get_group_forwardmost_coarse_path_index = function (self, group)
	local coarse_path = group.objective.coarse_path
	local forwardmost_i_nav_point = #coarse_path

	while 0 < forwardmost_i_nav_point do
		local nav_seg = coarse_path[forwardmost_i_nav_point][1]
		slot8 = nav_seg
		local area = self.get_area_from_nav_seg_id(slot6, self)

		if not area then
			return 
		end

		slot8 = group.units

		for u_key, u_data in pairs(slot7) do
			slot14 = u_data.unit
			slot14 = u_data.unit.movement(slot13)
			slot14 = u_data.unit.movement(slot13).nav_tracker(slot13)

			if area.nav_segs[u_data.unit.movement(slot13).nav_tracker(slot13).nav_segment(slot13)] then
				return forwardmost_i_nav_point
			end
		end

		forwardmost_i_nav_point = forwardmost_i_nav_point - 1
	end

	return 
end
GroupAIStateBesiege._voice_deathguard_start = function (self, group)
	local time = self._t
	slot5 = group.units

	for u_key, unit_data in pairs(slot4) do
		if unit_data.char_tweak.chatter.go_go then
			slot13 = "go_go"

			if self.chk_say_enemy_chatter(slot9, self, unit_data.unit, unit_data.m_pos) then
				break
			end
		end
	end

	return 
end
GroupAIStateBesiege._voice_open_fire_start = function (self, group)
	slot4 = group.units

	for u_key, unit_data in pairs(slot3) do
		if unit_data.char_tweak.chatter.aggressive then
			slot12 = "aggressive"

			if self.chk_say_enemy_chatter(slot8, self, unit_data.unit, unit_data.m_pos) then
				break
			end
		end
	end

	return 
end
GroupAIStateBesiege._voice_move_in_start = function (self, group)
	slot4 = group.units

	for u_key, unit_data in pairs(slot3) do
		if unit_data.char_tweak.chatter.go_go then
			slot12 = "go_go"

			if self.chk_say_enemy_chatter(slot8, self, unit_data.unit, unit_data.m_pos) then
				break
			end
		end
	end

	return 
end
GroupAIStateBesiege._voice_move_complete = function (self, group)
	slot4 = group.units

	for u_key, unit_data in pairs(slot3) do
		if unit_data.char_tweak.chatter.ready then
			slot12 = "ready"

			if self.chk_say_enemy_chatter(slot8, self, unit_data.unit, unit_data.m_pos) then
				break
			end
		end
	end

	return 
end
GroupAIStateBesiege._voice_delay_assault = function (self, group)
	local time = self._t
	slot5 = group.units

	for u_key, unit_data in pairs(slot4) do
		slot10 = unit_data.unit
		slot11 = time

		if not unit_data.unit.sound(slot9).speaking(slot9, unit_data.unit.sound(slot9)) then
			slot10 = unit_data.unit
			slot13 = nil

			unit_data.unit.sound(slot9).say(slot9, unit_data.unit.sound(slot9), "p01", true)

			return true
		end
	end

	return false
end
GroupAIStateBesiege._chk_group_areas_tresspassed = function (self, group)
	local objective = group.objective
	local occupied_areas = {}
	slot6 = group.units

	for u_key, u_data in pairs(slot5) do
		local nav_seg = u_data.tracker.nav_segment(slot10)
		slot12 = self._area_data

		for area_id, area in pairs(u_data.tracker) do
			if area.nav_segs[nav_seg] then
				occupied_areas[area_id] = area
			end
		end
	end

	slot6 = occupied_areas

	for area_id, area in pairs(slot5) do
		slot12 = area

		if not self.is_area_safe(slot10, self) then
			return area
		end
	end

	return 
end
GroupAIStateBesiege._chk_coarse_path_obstructed = function (self, group)
	local current_objective = group.objective

	if not current_objective.coarse_path then
		return 
	end

	slot6 = group
	local forwardmost_i_nav_point = self._get_group_forwardmost_coarse_path_index(slot4, self)

	if forwardmost_i_nav_point then
		for i = forwardmost_i_nav_point + 1, #current_objective.coarse_path, 1 do
			local nav_point = current_objective.coarse_path[forwardmost_i_nav_point]
			slot12 = nav_point[1]

			if not self.is_nav_seg_safe(slot10, self) then
				return i
			end
		end
	end

	return 
end
GroupAIStateBesiege._count_criminals_engaged_force = function (self, max_count)
	local count = 0
	local all_enemies = self._police
	slot6 = self._char_criminals

	for c_key, c_data in pairs(slot5) do
		slot14 = c_data.tracker
		local c_area = self.get_area_from_nav_seg_id(slot10, c_data.tracker.nav_segment(slot13))
		slot12 = c_data.engaged

		for e_key, e_data_prev in pairs(self) do
			local e_data = all_enemies[e_key]

			if e_data then
				local e_group = e_data.group

				if e_group and e_group.objective.type == "assault_area" then
					slot19 = self
					slot22 = e_data.tracker
					local e_area = self.get_area_from_nav_seg_id(slot18, e_data.tracker.nav_segment(slot21))

					if e_area == c_area or e_area.neighbours[c_area] then
						count = count + 1

						if max_count and count == max_count then
							return count
						end
					end
				end
			else
				slot23 = e_data_prev
				slot22 = e_data_prev.unit

				debug_pause_unit(slot17, e_data_prev.unit, "non-enemy engaging player", e_key, inspect(slot22))

				slot18 = managers.enemy

				if managers.enemy.all_civilians(slot17)[e_key] then
					slot18 = "he is civilian"

					print(slot17)
				elseif self._criminals[e_key] then
					slot18 = "he is criminal"

					print(slot17)
				else
					slot18 = "unknown unit type"

					print(slot17)
				end
			end
		end
	end

	return count
end
GroupAIStateBesiege._verify_group_objective = function (self, group)
	local is_objective_broken = nil
	local grp_objective = group.objective
	local coarse_path = grp_objective.coarse_path
	local nav_segments = managers.navigation._nav_segments

	if coarse_path then
		slot8 = coarse_path

		for i_node, node in ipairs(slot7) do
			local nav_seg = nav_segments[node[1]]

			if not nav_seg then
				return 
			end

			if nav_seg.disabled then
				is_objective_broken = true

				break
			end
		end
	end

	local found = false

	if not grp_objective.moving_out then
		slot9 = group.units

		for u_key, u_data in pairs(slot8) do
			slot14 = u_data.unit

			if not u_data.unit.brain(slot13).path_failed then
				found = true

				break
			end
		end

		if not found then
			is_objective_broken = true
			slot9 = group.units

			for u_key, u_data in pairs(slot8) do
				slot14 = u_data.unit
				u_data.unit.brain(slot13).path_failed = false
			end
		end
	end

	if not is_objective_broken then
		return 
	end

	local new_area = nil
	local tested_nav_seg_ids = {}
	slot11 = group.units

	for u_key, u_data in pairs(slot10) do
		slot17 = u_data.m_pos

		u_data.tracker.move(slot15, u_data.tracker)

		slot16 = u_data.tracker
		local nav_seg_id = u_data.tracker.nav_segment(slot15)

		if not tested_nav_seg_ids[nav_seg_id] then
			tested_nav_seg_ids[nav_seg_id] = true
			slot18 = nav_seg_id
			local areas = self.get_areas_from_nav_seg_id(slot16, self)
			slot18 = areas

			for _, test_area in pairs(self) do
				slot23 = test_area.nav_segs

				for test_nav_seg, _ in pairs(slot22) do
					if not nav_segments[test_nav_seg].disabled then
						new_area = test_area

						break
					end
				end

				if new_area then
					break
				end
			end
		end

		if new_area then
			break
		end
	end

	if not new_area then
		slot11 = "[GroupAIStateBesiege:_verify_group_objective] could not find replacement area to"
		slot14 = grp_objective.area

		print(slot10, inspect(slot13))

		return 
	end

	group.objective = {
		moving_out = false,
		type = grp_objective.type,
		area = new_area
	}

	return 
end
GroupAIStateBesiege.team_data = function (self, team_id)
	return self._teams[team_id]
end
GroupAIStateBesiege.set_char_team = function (self, unit, team_id)
	slot5 = unit
	local u_key = unit.key(slot4)
	local team = self._teams[team_id]
	local u_data = self._police[u_key]

	if u_data and u_data.group then
		u_data.group.team = team
		slot8 = u_data.group.units

		for _, other_u_data in pairs(slot7) do
			slot13 = other_u_data.unit
			slot14 = team

			other_u_data.unit.movement(slot12).set_team(slot12, other_u_data.unit.movement(slot12))
		end

		return 
	end

	slot8 = unit
	slot9 = team

	unit.movement(slot7).set_team(slot7, unit.movement(slot7))

	return 
end
GroupAIStateBesiege.set_team_relation = function (self, team1_id, team2_id, relation, mutual)
	if mutual then
		slot11 = nil

		self.set_team_relation(slot6, self, team1_id, team2_id, relation)

		slot11 = nil

		self.set_team_relation(slot6, self, team2_id, team1_id, relation)

		return 
	end

	if relation == "foe" then
		self._teams[team1_id].foes[team2_id] = true
	elseif relation == "friend" or relation == "neutral" then
		self._teams[team1_id].foes[team2_id] = nil
	end

	slot7 = Network

	if Network.is_server(slot6) then
		slot8 = team1_id
		local team1_index = tweak_data.levels.get_team_index(slot6, tweak_data.levels)
		slot9 = team2_id
		local team2_index = tweak_data.levels.get_team_index(tweak_data.levels, tweak_data.levels)
		local relation_code = (relation == "neutral" and 1) or (relation == "friend" and 2) or 3
		slot10 = managers.network
		slot14 = relation_code

		managers.network.session(slot9).send_to_peers_synched(slot9, managers.network.session(slot9), "sync_team_relation", team1_index, team2_index)
	end

	return 
end
GroupAIStateBesiege._check_spawn_phalanx = function (self)
	if Global.game_settings.single_player then
		return 
	end

	if not self._phalanx_center_pos then
		return 
	end

	if not self._task_data or not self._task_data.assault.active then
		return 
	end

	if self._task_data.assault.phase ~= "build" and self._task_data.assault.phase ~= "sustain" then
		return 
	end

	if self._phalanx_spawn_group then
		return 
	end

	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	local now = TimerManager.game(slot2).time(slot2)
	local respawn_delay = tweak_data.group_ai.phalanx.spawn_chance.respawn_delay

	if self._phalanx_despawn_time and now < self._phalanx_despawn_time + respawn_delay then
		return 
	end

	local spawn_chance_start = tweak_data.group_ai.phalanx.spawn_chance.start
	self._phalanx_current_spawn_chance = self._phalanx_current_spawn_chance or spawn_chance_start
	self._phalanx_last_spawn_check = self._phalanx_last_spawn_check or now
	self._phalanx_last_chance_increase = self._phalanx_last_chance_increase or now
	local spawn_chance_increase = tweak_data.group_ai.phalanx.spawn_chance.increase
	local spawn_chance_max = tweak_data.group_ai.phalanx.spawn_chance.max

	if self._phalanx_current_spawn_chance < spawn_chance_max and 0 < spawn_chance_increase then
		local chance_increase_intervall = tweak_data.group_ai.phalanx.chance_increase_intervall

		if self._phalanx_last_chance_increase + chance_increase_intervall <= now then
			self._phalanx_last_chance_increase = now
			slot10 = self._phalanx_current_spawn_chance + spawn_chance_increase
			self._phalanx_current_spawn_chance = math.min(slot8, spawn_chance_max)
		end
	end

	if 0 < self._phalanx_current_spawn_chance then
		local check_spawn_intervall = tweak_data.group_ai.phalanx.check_spawn_intervall

		if self._phalanx_last_spawn_check + check_spawn_intervall <= now then
			self._phalanx_last_spawn_check = now

			if math.random() <= self._phalanx_current_spawn_chance then
				slot9 = self

				self._spawn_phalanx(slot8)
			end
		end
	end

	return 
end
GroupAIStateBesiege._spawn_phalanx = function (self)
	if self._phalanx_center_pos then
		local phalanx_center_pos = self._phalanx_center_pos
		slot5 = phalanx_center_pos
		local phalanx_center_nav_seg = managers.navigation.get_nav_seg_from_pos(slot3, managers.navigation)
		local phalanx_area = self.get_area_from_nav_seg_id(managers.navigation, self)
		local phalanx_group = {
			Phalanx = {
				1,
				1,
				1
			}
		}
		local spawn_group, group_nationality, spawn_group_type = self._find_spawn_group_near_area(phalanx_center_nav_seg, self, phalanx_area, phalanx_group, nil, nil)

		if spawn_group.spawn_pts[1] and spawn_group.spawn_pts[1].pos then
			local spawn_pos = spawn_group.spawn_pts[1].pos
			slot12 = spawn_pos
			local spawn_nav_seg = managers.navigation.get_nav_seg_from_pos(slot10, managers.navigation)
			slot13 = spawn_nav_seg
			local spawn_area = self.get_area_from_nav_seg_id(managers.navigation, self)

			if spawn_group then
				local grp_objective = {
					type = "defend_area",
					area = spawn_area,
					nav_seg = spawn_nav_seg
				}
				slot14 = "Phalanx spawn started!"

				print(slot13)

				slot19 = nil
				self._phalanx_spawn_group = self._spawn_in_group(slot13, self, spawn_group, group_nationality, spawn_group_type, grp_objective)
				slot15 = true

				self.set_assault_endless(slot13, self)

				slot15 = "cpa_a02_01"

				managers.game_play_central.announcer_say(slot13, managers.game_play_central)

				slot14 = managers.network
				slot19 = "phalanx_spawned"
				slot17 = 0

				managers.network.session(slot13).send_to_peers_synched(slot13, managers.network.session(slot13), "group_ai_event", self.get_sync_event_id(spawn_group_type, self))
			end
		end
	else
		slot3 = "self._phalanx_center_pos NOT SET!!!"

		print(slot2)
	end

	return 
end
GroupAIStateBesiege._check_phalanx_group_has_spawned = function (self)
	if self._phalanx_spawn_group then
		if self._phalanx_spawn_group.has_spawned then
			if not self._phalanx_spawn_group.set_to_phalanx_group_obj then
				local pos = self._phalanx_center_pos
				slot5 = pos
				local nav_seg = managers.navigation.get_nav_seg_from_pos(slot3, managers.navigation)
				local area = self.get_area_from_nav_seg_id(managers.navigation, self)
				local grp_objective = {
					type = "create_phalanx",
					area = area,
					nav_seg = nav_seg,
					pos = pos
				}
				slot7 = "Phalanx spawn finished, setting phalanx objective!"

				print(nav_seg)

				slot9 = grp_objective

				self._set_objective_to_enemy_group(nav_seg, self, self._phalanx_spawn_group)

				self._phalanx_spawn_group.set_to_phalanx_group_obj = true
			end
		else
			slot3 = "Phalanx group has not yet spawned completely!"

			print(slot2)
		end
	end

	return 
end
GroupAIStateBesiege.phalanx_damage_reduction_enable = function (self)
	local law1team = self._get_law1_team(slot2)
	slot5 = law1team.damage_reduction or tweak_data.group_ai.phalanx.vip.damage_reduction.start

	self.set_phalanx_damage_reduction_buff(self, self)

	if not self._phalanx_damage_reduction_last_increase then
		slot4 = TimerManager
		slot4 = TimerManager.game(slot3)
		slot2 = TimerManager.game(slot3).time(slot3)
	end

	self._phalanx_damage_reduction_last_increase = slot2

	return 
end
GroupAIStateBesiege.phalanx_damage_reduction_disable = function (self)
	slot4 = -1

	self.set_phalanx_damage_reduction_buff(slot2, self)

	self._phalanx_damage_reduction_last_increase = nil

	return 
end
GroupAIStateBesiege._get_law1_team = function (self)
	slot4 = "combatant"
	local team_id = tweak_data.levels.get_default_team_ID(slot2, tweak_data.levels)
	slot5 = team_id

	return self.team_data(tweak_data.levels, self)
end
GroupAIStateBesiege._check_phalanx_damage_reduction_increase = function (self)
	slot3 = self
	local law1team = self._get_law1_team(slot2)
	local damage_reduction_max = tweak_data.group_ai.phalanx.vip.damage_reduction.max

	if law1team.damage_reduction and law1team.damage_reduction < damage_reduction_max then
		slot5 = TimerManager
		slot5 = TimerManager.game(slot4)
		local now = TimerManager.game(slot4).time(slot4)
		local increase_intervall = tweak_data.group_ai.phalanx.vip.damage_reduction.increase_intervall
		local last_increase = self._phalanx_damage_reduction_last_increase

		if last_increase + increase_intervall < now then
			last_increase = now
			slot9 = law1team.damage_reduction + tweak_data.group_ai.phalanx.vip.damage_reduction.increase
			local damage_reduction = math.min(slot7, damage_reduction_max)
			slot10 = damage_reduction

			self.set_phalanx_damage_reduction_buff(damage_reduction_max, self)

			self._phalanx_damage_reduction_last_increase = last_increase
			slot11 = "%!"

			print(damage_reduction_max, "Phalanx damage reduction buff has been increased to ", law1team.damage_reduction)

			slot11 = self

			if alive(self.phalanx_vip(law1team.damage_reduction)) then
				slot9 = self
				slot9 = self.phalanx_vip(slot8)
				slot12 = true

				self.phalanx_vip(slot8).sound(slot8).say(slot8, self.phalanx_vip(slot8).sound(slot8), "cpw_a05", true)
			end
		end
	end

	return 
end
GroupAIStateBesiege.set_phalanx_damage_reduction_buff = function (self, damage_reduction)
	slot4 = self
	local law1team = self._get_law1_team(slot3)
	damage_reduction = damage_reduction or -1

	if law1team then
		if 0 < damage_reduction then
			law1team.damage_reduction = damage_reduction
		else
			law1team.damage_reduction = nil
		end

		slot5 = self

		self.set_damage_reduction_buff_hud(slot4)
	end

	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = managers.network
		slot7 = damage_reduction

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_damage_reduction_buff")
	end

	return 
end
GroupAIStateBesiege.set_damage_reduction_buff_hud = function (self)
	slot3 = self
	local law1team = self._get_law1_team(slot2)

	if law1team then
		if law1team.damage_reduction then
			slot4 = "Setting damage reduction buff icon to ENABLED!"

			print(slot3)
		else
			slot4 = "Setting damage reduction buff icon to DISABLED!"

			print(slot3)
		end
	else
		slot4 = "LAW 1 TEAM NOT FOUND!!!!"

		debug_pause(slot3)
	end

	return 
end
GroupAIStateBesiege.set_assault_endless = function (self, enabled)
	self._hunt_mode = enabled
	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.network
		slot6 = enabled

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_assault_endless")
	end

	return 
end
GroupAIStateBesiege.phalanx_despawned = function (self)
	slot3 = TimerManager
	self._phalanx_despawn_time = TimerManager.game(slot2).time(slot2)
	self._phalanx_spawn_group = nil
	local spawn_chance_decrease = tweak_data.group_ai.phalanx.spawn_chance.decrease
	slot5 = self._phalanx_current_spawn_chance or tweak_data.group_ai.phalanx.spawn_chance.start - spawn_chance_decrease
	self._phalanx_current_spawn_chance = math.max(TimerManager.game(slot2), 0)

	return 
end
GroupAIStateBesiege.phalanx_spawn_group = function (self)
	return self._phalanx_spawn_group
end
GroupAIStateBesiege.force_end_assault_phase = function (self)
	local task_data = self._task_data.assault

	if task_data.active then
		slot4 = "GroupAIStateBesiege:force_end_assault_phase()"

		print(slot3)

		task_data.phase = "fade"
		task_data.force_end = true
	end

	slot5 = false

	self.set_assault_endless(slot3, self)

	return 
end

return 
