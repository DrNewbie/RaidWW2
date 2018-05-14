if not GroupAIStateStreet then
	slot2 = GroupAIStateRaid
	slot0 = class(slot1)
end

GroupAIStateStreet = slot0
function GroupAIStateStreet:init()
	slot3 = self

	GroupAIStateStreet.super.init(slot2)

	return 
end
function GroupAIStateStreet:nav_ready_listener_key()
	return "GroupAIStateStreet"
end
GroupAIStateStreet.MAX_SPAWN_RANGE = 10000
function GroupAIStateStreet:_begin_new_tasks()
	local all_areas = self._area_data
	local nav_manager = managers.navigation
	local all_nav_segs = nav_manager._nav_segments
	local task_data = self._task_data
	local t = self._t
	local reenforce_candidates = nil
	local dynamic_spawns = {}
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
		assault_candidates = true
	end

	if not reenforce_candidates and not recon_candidates and not assault_candidates then
		return 
	end

	local found_areas = {}
	local to_search_areas = {}
	slot18 = all_areas

	for area_id, area in pairs(slot17) do
		if area.spawn_points then
			slot23 = area.spawn_points

			for _, sp_data in pairs(slot22) do
				if sp_data.delay_t <= t and not all_nav_segs[sp_data.nav_seg].disabled then
					slot29 = area

					table.insert(slot27, to_search_areas)

					found_areas[area_id] = true

					break
				end
			end
		end

		if not found_areas[area_id] and area.spawn_groups then
			slot23 = area.spawn_groups

			for _, sp_data in pairs(slot22) do
				if sp_data.delay_t <= t and not all_nav_segs[sp_data.nav_seg].disabled then
					slot29 = area

					table.insert(slot27, to_search_areas)

					found_areas[area_id] = true

					break
				end
			end
		end
	end

	if #to_search_areas == 0 then
		return 
	end

	local i = 1

	repeat
		local area = to_search_areas[i]
		local force_factor = area.factors.force
		local demand = force_factor and force_factor.force
		local nr_police = table.size(slot21)
		slot23 = area.criminal.units
		local nr_criminals = table.size(area.police.units)

		if demand and ((nr_criminals == 0 and reenforce_candidates) or demand == 0) then
			local area_free = true
			slot25 = reenforce_data.tasks

			for i_task, reenforce_task_data in ipairs(slot24) do
				if reenforce_task_data.target_area == area then
					area_free = false

					break
				end
			end

			if area_free then
				if demand == 0 then
					slot26 = area

					table.insert(slot24, dynamic_spawns)
				else
					slot26 = area

					table.insert(slot24, reenforce_candidates)
				end
			end
		end

		if recon_candidates and (area.loot or area.hostages) then
			local occupied = nil
			slot25 = self._groups

			for group_id, group in pairs(slot24) do
				if group.objective.target_area == area or group.objective.area == area then
					occupied = true

					break
				end
			end

			if not occupied then
				local is_area_safe = nr_criminals == 0

				if is_area_safe then
					if are_recon_candidates_safe then
						slot27 = area

						table.insert(slot25, recon_candidates)
					else
						are_recon_candidates_safe = true
						recon_candidates = {
							area
						}
					end
				elseif not are_recon_candidates_safe then
					slot27 = area

					table.insert(slot25, recon_candidates)
				end
			end
		end

		if nr_criminals == 0 then
			slot24 = area.neighbours

			for neighbour_area_id, neighbour_area in pairs(slot23) do
				if not found_areas[neighbour_area_id] then
					slot30 = neighbour_area

					table.insert(slot28, to_search_areas)

					found_areas[neighbour_area_id] = true
				end
			end
		end

		i = i + 1
	until #to_search_areas < i

	if assault_candidates then
		slot19 = self

		self._begin_assault(slot18)

		recon_candidates = nil
	end

	if recon_candidates and 0 < #recon_candidates then
		local recon_area = recon_candidates[math.random(slot18)]
		slot21 = recon_area

		self._begin_recon_task(#recon_candidates, self)
	end

	if reenforce_candidates and 0 < #reenforce_candidates then
		slot19 = #reenforce_candidates
		local lucky_i_candidate = math.random(slot18)
		local reenforce_area = reenforce_candidates[lucky_i_candidate]
		slot22 = reenforce_area

		self._begin_reenforce_task(slot20, self)
	end

	slot19 = dynamic_spawns

	for _, reenforce_area in ipairs(slot18) do
		slot25 = reenforce_area

		self._begin_reenforce_task(slot23, self)
	end

	return 
end
function GroupAIStateStreet:_begin_assault()
	local assault_data = self._task_data.assault
	assault_data.active = true
	assault_data.next_dispatch_t = nil
	assault_data.tasks = {}
	assault_data.phase = "anticipation"
	assault_data.start_t = self._t
	local anticipation_duration = self._get_anticipation_duration(slot3, self, tweak_data.group_ai.street.assault.anticipation_duration)
	assault_data.is_first = nil
	assault_data.phase_end_t = self._t + anticipation_duration
	slot8 = tweak_data.group_ai.street.assault.force
	slot9 = tweak_data.group_ai.street.assault.force_balance_mul
	slot5 = self.get_difficulty_dependent_value(assault_data.is_first, self) * self._get_balancing_multiplier(self, self)
	assault_data.force = math.ceil(self)
	assault_data.use_smoke = true
	assault_data.use_smoke_timer = 0
	assault_data.force_spawned = 0

	if 0 < self._hostage_headcount then
		slot7 = tweak_data.group_ai.street.assault.hostage_hesitation_delay
		assault_data.phase_end_t = assault_data.phase_end_t + self.get_difficulty_dependent_value(slot5, self)
		assault_data.is_hesitating = true
		assault_data.voice_delay = self._t + (assault_data.phase_end_t - self._t) / 2
	end

	self._downs_during_assault = 0

	if self._hunt_mode then
		assault_data.phase_end_t = 0
	else
		slot6 = anticipation_duration

		managers.hud.setup_anticipation(slot4, managers.hud)

		slot5 = managers.hud

		managers.hud.start_anticipation(slot4)
	end

	if self._draw_drama then
		slot6 = {
			self._t
		}

		table.insert(slot4, self._draw_drama.assault_hist)
	end

	self._task_data.recon.tasks = {}

	return 
end
function GroupAIStateStreet:_upd_assault_task(task_data)
	local assault_data = self._task_data.assault

	if not assault_data or not task_data.target_area or not task_data.target_area.pos then
		return 
	end

	local target_area = task_data.target_area
	local target_pos = target_area.pos
	local t = self._t
	local force_multiplier = 1
	slot11 = "assault"
	local nr_wanted = assault_data.force * force_multiplier - self._count_police_force(slot9, self)

	if assault_data.phase == "anticipation" then
		slot10 = nr_wanted * 0.75
		nr_wanted = math.ceil(slot9)
	end

	if 0 < nr_wanted and assault_data.phase ~= "fade" then
		slot10 = self._spawning_groups

		if not next(slot9) then
			local function verif_clbk(test_spawn_group)
				return test_spawn_group.area.id == target_area.id
			end

			slot16 = verif_clbk
			local spawn_group, group_nationality, spawn_group_type = self._find_spawn_group_near_area(slot10, self, target_area, tweak_data.group_ai.street.assault.groups, nil, nil)

			if spawn_group then
				local grp_objective = {
					attitude = "engage",
					stance = "hos",
					pose = "stand",
					type = "assault_area",
					area = task_data.target_area,
					coarse_path = {
						{
							task_data.target_area.pos_nav_seg,
							task_data.target_area.pos
						}
					}
				}
				slot20 = assault_data

				self._spawn_in_group(, self, spawn_group, group_nationality, spawn_group_type, grp_objective)
			end
		end
	end

	if assault_data.phase ~= "anticipation" then
		if assault_data.use_smoke_timer < t then
			assault_data.use_smoke = true
		end

		if self._smoke_grenade_queued and assault_data.use_smoke then
			slot10 = self

			if not self.is_smoke_grenade_active(slot9) then
				slot14 = self._smoke_grenade_queued[4]

				self.detonate_smoke_grenade(slot9, self, self._smoke_grenade_queued[1], self._smoke_grenade_queued[1], self._smoke_grenade_queued[2])

				if self._smoke_grenade_queued[3] then
					self._smoke_grenade_ignore_control = true
				end
			end
		end
	end

	return 
end
function GroupAIStateStreet:_begin_reenforce_task(reenforce_area)
	local new_task = {
		use_spawn_event = true,
		target_area = reenforce_area,
		start_t = self._t
	}

	table.insert(slot4, self._task_data.reenforce.tasks)

	self._task_data.reenforce.active = true
	slot8 = tweak_data.group_ai.street.reenforce.interval
	self._task_data.reenforce.next_dispatch_t = self._t + self.get_difficulty_dependent_value(new_task, self)

	return 
end
function GroupAIStateStreet:_upd_assault_tasks()
	local assault_data = self._task_data.assault

	if not assault_data or not assault_data.active or not assault_data.tasks then
		return 
	end

	local assault_tasks = assault_data.tasks
	local reenforce_tasks = self._task_data.reenforce.tasks
	local t = self._t
	slot7 = self

	self._assign_recon_groups_to_retire(slot6)

	slot8 = tweak_data.group_ai.street.assault.force_pool
	slot9 = tweak_data.group_ai.street.assault.force_pool_balance_mul
	local force_pool = self.get_difficulty_dependent_value(slot6, self) * self._get_balancing_multiplier(self, self)
	local task_spawn_allowance = force_pool - ((self._hunt_mode and 0) or assault_data.force_spawned)

	if assault_data.phase == "anticipation" then
		if task_spawn_allowance <= 0 then
			assault_data.phase = "fade"
			assault_data.phase_end_t = t + tweak_data.group_ai.street.assault.fade_duration
		elseif assault_data.phase_end_t < t or self._drama_data.zone == "high" then
			slot10 = "start_assault"

			managers.mission.call_global_event(slot8, managers.mission)

			slot9 = managers.hud

			managers.hud.start_assault(slot8)

			slot10 = false

			self._set_rescue_state(slot8, self)

			assault_data.phase = "build"
			assault_data.phase_end_t = self._t + tweak_data.group_ai.street.assault.build_duration
			assault_data.is_hesitating = nil
			slot10 = true

			self.set_assault_mode(tweak_data.group_ai.street.assault.build_duration, self)

			slot10 = false

			managers.trade.set_trade_countdown(tweak_data.group_ai.street.assault.build_duration, managers.trade)
		else
			slot10 = assault_data.phase_end_t - t

			managers.hud.check_start_anticipation_music(slot8, managers.hud)

			if assault_data.is_hesitating and assault_data.voice_delay < self._t then
				if 0 < self._hostage_headcount then
					local best_group = nil
					slot10 = self._groups

					for _, group in pairs(slot9) do
						if not best_group or group.objective.type == "reenforce_area" then
							best_group = group
						elseif best_group.objective.type ~= "reenforce_area" and group.objective.type ~= "retire" then
							best_group = group
						end
					end

					if best_group then
						slot11 = best_group

						if self._voice_delay_assault(slot9, self) then
							assault_data.is_hesitating = nil
						end
					end
				else
					assault_data.is_hesitating = nil
				end
			end
		end
	elseif assault_data.phase == "build" then
		if task_spawn_allowance <= 0 then
			assault_data.phase = "fade"
			assault_data.phase_end_t = t + tweak_data.group_ai.street.assault.fade_duration
		elseif assault_data.phase_end_t < t or self._drama_data.zone == "high" then
			assault_data.phase = "sustain"
			slot12 = tweak_data.group_ai.street.assault.sustain_duration_min
			slot13 = tweak_data.group_ai.street.assault.sustain_duration_max
			slot10 = self.get_difficulty_dependent_value(self, self)
			slot11 = tweak_data.group_ai.street.assault.sustain_duration_balance_mul
			assault_data.phase_end_t = t + math.lerp(slot8, self.get_difficulty_dependent_value(slot10, self), math.random()) * self._get_balancing_multiplier(self.get_difficulty_dependent_value(slot10, self), self)
		end
	elseif assault_data.phase == "sustain" then
		if task_spawn_allowance <= 0 then
			assault_data.phase = "fade"
			assault_data.phase_end_t = t + tweak_data.group_ai.street.assault.fade_duration
		elseif assault_data.phase_end_t < t and not self._hunt_mode then
			assault_data.phase = "fade"
			assault_data.phase_end_t = t + tweak_data.group_ai.street.assault.fade_duration
		end
	else
		slot10 = "assault"
		local enemies_left = self._count_police_force(slot8, self)

		if enemies_left < 7 or assault_data.phase_end_t + 350 < t then
			if assault_data.phase_end_t - 8 < t and not assault_data.said_retreat then
				if self._drama_data.amount < tweak_data.drama.assault_fade_end then
					assault_data.said_retreat = true
					slot10 = self

					self._police_announce_retreat(slot9)
				end
			elseif assault_data.phase_end_t < t and self._drama_data.amount < tweak_data.drama.assault_fade_end then
				slot11 = 4

				if self._count_criminals_engaged_force(slot9, self) <= 3 then
					assault_data.active = nil
					assault_data.phase = nil
					assault_data.said_retreat = nil

					if self._draw_drama then
						self._draw_drama.assault_hist[#self._draw_drama.assault_hist][2] = t
					end

					slot11 = "end_assault"

					managers.mission.call_global_event(slot9, managers.mission)

					slot10 = self

					self._begin_regroup_task(slot9)

					return 
				end
			end
		end
	end

	if self._drama_data.amount <= tweak_data.drama.low then
		slot9 = self._player_criminals

		for criminal_key, criminal_data in pairs(slot8) do
			slot15 = criminal_data.unit

			self.criminal_spotted(slot13, self)

			slot14 = self._groups

			for group_id, group in pairs(slot13) do
				if group.objective.charge then
					slot19 = group.units

					for u_key, u_data in pairs(slot18) do
						slot24 = u_data.unit
						slot26 = criminal_key

						u_data.unit.brain(slot23).clbk_group_member_attention_identified(slot23, u_data.unit.brain(slot23), nil)
					end
				end
			end
		end
	end

	local closest_blockade_tasks = {}
	slot12 = self

	for u_key, u_data in pairs(self.all_player_criminals(slot11)) do
		local closest_dis_sq, closest_task_i = nil
		slot17 = reenforce_tasks

		for i_task, task_data in ipairs(slot16) do
			local force_settings = task_data.target_area.factors.force
			local force_required = force_settings and force_settings.force

			if force_required == 0 then
				slot25 = task_data.target_area.pos
				local my_dis_sq = mvector3.distance_sq(slot23, u_data.m_pos)
				local assault_task = assault_tasks[task_data.target_area.id]

				if not assault_task then
					my_dis_sq = my_dis_sq + 100
				end

				if not closest_dis_sq or my_dis_sq < closest_dis_sq then
					closest_dis_sq = my_dis_sq
					closest_task_i = i_task
				end
			end
		end

		if closest_dis_sq then
			closest_blockade_tasks[u_key] = closest_task_i
		end
	end

	slot10 = closest_blockade_tasks

	for criminal_u_key, i_reenforce_task in pairs(slot9) do
		local reenforce_task = reenforce_tasks[i_reenforce_task]
		local target_area_id = reenforce_task.target_area.id
		local assault_task = assault_tasks[target_area_id]

		if assault_task then
			if not assault_task.target_criminals[criminal_u_key] then
				assault_task.target_criminals[criminal_u_key] = self._criminals[criminal_u_key]
			end
		else
			assault_task = {
				target_area = self._area_data[target_area_id],
				target_criminals = {
					[criminal_u_key] = self._criminals[criminal_u_key]
				},
				start_t = t
			}
			assault_tasks[target_area_id] = assault_task
		end
	end

	local tasks_to_delete = {}
	slot11 = assault_tasks

	for area_id, assault_task in pairs(slot10) do
		local criminals_to_delete = nil
		slot17 = assault_task.target_criminals

		for criminal_u_key, u_data in pairs(slot16) do
			local delete_criminal = true

			if self._criminals[criminal_u_key] then
				local closest_blockade_i = closest_blockade_tasks[criminal_u_key]

				if closest_blockade_i then
					local reenforce_task = reenforce_tasks[closest_blockade_i]

					if reenforce_task.target_area.id == area_id then
						delete_criminal = false
					end
				end
			end

			if delete_criminal then
				criminals_to_delete = criminals_to_delete or {}
				slot24 = criminal_u_key

				table.insert(slot22, criminals_to_delete)
			end
		end

		if criminals_to_delete then
			slot17 = criminals_to_delete

			for _, criminal_u_key in ipairs(slot16) do
				assault_task.target_criminals[criminal_u_key] = nil
			end
		end

		if 30 < t - assault_task.start_t then
			slot17 = assault_task.target_criminals

			if not next(slot16) then
				tasks_to_delete = tasks_to_delete or {}
				slot18 = area_id

				table.insert(slot16, tasks_to_delete)
			end
		end
	end

	if tasks_to_delete then
		slot11 = tasks_to_delete

		for _, area_id in ipairs(slot10) do
			assault_tasks[area_id] = nil
		end
	end

	slot11 = self._groups

	for group_id, group in pairs(slot10) do
		if group.has_spawned and group.objective.type == "assault_area" and not assault_tasks[group.objective.area.id] then
			slot17 = group

			self._assign_group_to_retire(slot15, self)
		end
	end

	local tasks_sorted = {}
	slot12 = self._spawning_groups

	if next(slot11) then
		slot12 = assault_tasks

		for area_id, assault_task in pairs(slot11) do
			local area_population = 0
			slot18 = self._groups

			for group_id, group in pairs(slot17) do
				if group.objective.type == "assault_area" and group.objective.area.id == area_id then
					area_population = (area_population + group.initial_size) - group.casualties
				end
			end

			tasks_sorted[area_population] = assault_task
		end
	else
		slot12 = assault_tasks

		for area_id, assault_task in pairs(slot11) do
			slot18 = assault_task

			table.insert(slot16, tasks_sorted)
		end
	end

	slot12 = tasks_sorted

	for population, assault_task in pairs(slot11) do
		slot18 = assault_task

		self._upd_assault_task(slot16, self)
	end

	return 
end

return 
