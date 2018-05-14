-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local mvec3_set = mvector3.set
local mvec3_sub = mvector3.subtract
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local mvec3_dis = mvector3.distance
local t_rem = table.remove
local t_ins = table.insert
local m_min = math.min
local tmp_vec1 = Vector3()
EnemyManager = EnemyManager or class()
EnemyManager._MAX_NR_CORPSES = 20
EnemyManager._nr_i_lod = {
	{
		2,
		2
	},
	{
		5,
		2
	},
	{
		10,
		5
	}
}
EnemyManager.ENEMIES = {
	german_fallschirmjager_heavy_shotgun = "units/vanilla/characters/enemies/models/german_fallschirmjager_heavy/german_fallschirmjager_heavy_shotgun",
	german_gebirgsjager_heavy = "units/vanilla/characters/enemies/models/german_gebirgsjager_heavy/german_gebirgsjager_heavy",
	female_spy = "units/vanilla/characters/enemies/models/female_spy/female_spy",
	german_black_waffen_sentry_light_kar98 = "units/vanilla/characters/enemies/models/german_black_waffen_sentry_light/german_black_waffen_sentry_light_kar98",
	german_gebirgsjager_heavy_kar98 = "units/vanilla/characters/enemies/models/german_gebirgsjager_heavy/german_gebirgsjager_heavy_kar98",
	german_sommilier = "units/vanilla/characters/enemies/models/german_sommeleir/german_sommilier",
	german_fallschirmjager_light_kar98 = "units/vanilla/characters/enemies/models/german_fallschirmjager_light/german_fallschirmjager_light_kar98",
	german_grunt_heavy_mp38 = "units/vanilla/characters/enemies/models/german_grunt_heavy/german_grunt_heavy_mp38",
	german_grunt_light_mp38 = "units/vanilla/characters/enemies/models/german_grunt_light/german_grunt_light_mp38",
	german_commander = "units/vanilla/characters/enemies/models/german_commander/german_commander",
	german_fallschirmjager_heavy_kar98 = "units/vanilla/characters/enemies/models/german_fallschirmjager_heavy/german_fallschirmjager_heavy_kar98",
	german_gebirgsjager_light = "units/vanilla/characters/enemies/models/german_gebirgsjager_light/german_gebirgsjager_light",
	german_gebirgsjager_light_kar98 = "units/vanilla/characters/enemies/models/german_gebirgsjager_light/german_gebirgsjager_light_kar98",
	german_sniper = "units/vanilla/characters/enemies/models/german_sniper/german_sniper",
	german_waffen_ss_shotgun = "units/vanilla/characters/enemies/models/german_waffen_ss/german_waffen_ss_shotgun",
	german_grunt_heavy_kar98 = "units/vanilla/characters/enemies/models/german_grunt_heavy/german_grunt_heavy_kar98",
	german_grunt_heavy = "units/vanilla/characters/enemies/models/german_grunt_heavy/german_grunt_heavy",
	german_fallschirmjager_light_shotgun = "units/vanilla/characters/enemies/models/german_fallschirmjager_light/german_fallschirmjager_light_shotgun",
	german_black_waffen_sentry_light = "units/vanilla/characters/enemies/models/german_black_waffen_sentry_light/german_black_waffen_sentry_light",
	german_black_waffen_sentry_light_shotgun = "units/vanilla/characters/enemies/models/german_black_waffen_sentry_light/german_black_waffen_sentry_light_shotgun",
	german_grunt_light = "units/vanilla/characters/enemies/models/german_grunt_light/german_grunt_light",
	german_grunt_light_shotgun = "units/vanilla/characters/enemies/models/german_grunt_light/german_grunt_light_shotgun",
	german_black_waffen_sentry_heavy = "units/vanilla/characters/enemies/models/german_black_waffen_sentry_heavy/german_black_waffen_sentry_heavy",
	german_waffen_ss = "units/vanilla/characters/enemies/models/german_waffen_ss/german_waffen_ss",
	german_black_waffen_sentry_heavy_kar98 = "units/vanilla/characters/enemies/models/german_black_waffen_sentry_heavy/german_black_waffen_sentry_heavy_kar98",
	german_flamer = "units/vanilla/characters/enemies/models/german_flamer/german_flamer",
	german_fallschirmjager_light = "units/vanilla/characters/enemies/models/german_fallschirmjager_light/german_fallschirmjager_light",
	soviet_nightwitch_01 = "units/vanilla/characters/enemies/models/soviet_nightwitch_01/soviet_nightwitch_01",
	german_black_waffen_sentry_heavy_shotgun = "units/vanilla/characters/enemies/models/german_black_waffen_sentry_heavy/german_black_waffen_sentry_heavy_shotgun",
	german_og_commander = "units/vanilla/characters/enemies/models/german_og_commander/german_og_commander",
	german_gebirgsjager_light_shotgun = "units/vanilla/characters/enemies/models/german_gebirgsjager_light/german_gebirgsjager_light_shotgun",
	german_black_waffen_sentry_gasmask = "units/vanilla/characters/enemies/models/german_black_waffen_sentry_gasmask/german_black_waffen_sentry_gasmask",
	soviet_nkvd_int_security_captain = "units/vanilla/characters/enemies/models/soviet_nkvd_int_security_captain/soviet_nkvd_int_security_captain",
	german_grunt_mid_shotgun = "units/vanilla/characters/enemies/models/german_grunt_mid/german_grunt_mid_shotgun",
	german_gebirgsjager_heavy_shotgun = "units/vanilla/characters/enemies/models/german_gebirgsjager_heavy/german_gebirgsjager_heavy_shotgun",
	german_black_waffen_sentry_gasmaskshotgun = "units/vanilla/characters/enemies/models/german_black_waffen_sentry_gasmask/german_black_waffen_sentry_gasmask_shotgun",
	german_grunt_mid_mp38 = "units/vanilla/characters/enemies/models/german_grunt_mid/german_grunt_mid_mp38",
	german_grunt_mid = "units/vanilla/characters/enemies/models/german_grunt_mid/german_grunt_mid",
	german_fallschirmjager_heavy = "units/vanilla/characters/enemies/models/german_fallschirmjager_heavy/german_fallschirmjager_heavy",
	german_officer = "units/vanilla/characters/enemies/models/german_commander/german_officer",
	german_grunt_heavy_shotgun = "units/vanilla/characters/enemies/models/german_grunt_heavy/german_grunt_heavy_shotgun",
	german_sommilier_01 = "units/vanilla/characters/enemies/models/german_sommilier/german_sommilier",
	german_grunt_mid_kar98 = "units/vanilla/characters/enemies/models/german_grunt_mid/german_grunt_mid_kar98",
	soviet_nkvd_int_security_captain_b = "units/vanilla/characters/enemies/models/soviet_nkvd_int_security_captain_b/soviet_nkvd_int_security_captain_b",
	german_grunt_light_kar98 = "units/vanilla/characters/enemies/models/german_grunt_light/german_grunt_light_kar98",
	german_spotter = "units/vanilla/characters/enemies/models/german_sniper/german_spotter",
	soviet_nightwitch_02 = "units/vanilla/characters/enemies/models/soviet_nightwitch_02/soviet_nightwitch_02",
	german_waffen_ss_kar98 = "units/vanilla/characters/enemies/models/german_waffen_ss/german_waffen_ss_kar98"
}
function EnemyManager:init()
	slot3 = self

	self._init_enemy_data(slot2)

	self._unit_clbk_key = "EnemyManager"
	self._corpse_disposal_upd_interval = 5
	self._commander_active = 0

	return 
end
function EnemyManager:enemy_names()
	local result = {}
	local n = 0
	slot5 = EnemyManager.ENEMIES

	for k, v in pairs(slot4) do
		n = n + 1
		result[n] = k
	end

	slot5 = result

	table.sort(slot4)

	return result
end
function EnemyManager:enemy_units()
	local result = {}
	local n = 0
	slot5 = EnemyManager.ENEMIES

	for k, v in pairs(slot4) do
		n = n + 1
		result[n] = v
	end

	slot5 = result

	table.sort(slot4)

	return result
end
function EnemyManager:update(t, dt)
	slot5 = managers.navigation

	if not managers.navigation.is_streamed_data_ready(slot4) then
		return 
	end

	self._t = t
	self._queued_task_executed = nil
	slot5 = self

	self._update_gfx_lod(slot4)

	slot7 = dt

	self._update_queued_tasks(slot4, self, t)

	slot5 = self

	self._cleanup_queued_tasks(slot4)

	return 
end
function EnemyManager:_update_gfx_lod()
	if self._gfx_lod_data.enabled then
		slot3 = managers.navigation

		if managers.navigation.is_data_ready(slot2) then
			slot3 = managers.viewport
			local camera_rot = managers.viewport.get_current_camera_rotation(slot2)

			if camera_rot then
				local pl_tracker, cam_pos = nil
				local pl_fwd = camera_rot.y(slot5)
				slot7 = managers.player
				local player = managers.player.player_unit(camera_rot)

				if player then
					slot8 = player
					slot8 = player.movement(slot7)
					pl_tracker = player.movement(slot7).nav_tracker(slot7)
					slot8 = player
					slot8 = player.movement(slot7)
					cam_pos = player.movement(slot7).m_head_pos(slot7)
				else
					pl_tracker = false
					slot8 = managers.viewport
					cam_pos = managers.viewport.get_current_camera_position(slot7)
				end

				local entries = self._gfx_lod_data.entries
				local units = entries.units
				local states = entries.states
				local move_ext = entries.move_ext
				local trackers = entries.trackers
				local com = entries.com
				local chk_vis_func = pl_tracker and pl_tracker.check_visibility
				local unit_occluded = Unit.occluded
				local occ_skip_units = managers.occlusion._skip_occlusion
				local world_in_view_with_options = World.in_view_with_options
				slot18 = states

				for i, state in ipairs(slot17) do
					if not state then
						slot23 = units[i]
					end
				end

				if 0 < #states then
					slot19 = "video_animation_lod"
					local anim_lod = managers.user.get_setting(slot17, managers.user)
					local nr_lod_1 = self._nr_i_lod[anim_lod][1]
					local nr_lod_2 = self._nr_i_lod[anim_lod][2]
					local nr_lod_total = nr_lod_1 + nr_lod_2
					local imp_i_list = self._gfx_lod_data.prio_i
					local imp_wgt_list = self._gfx_lod_data.prio_weights
					local nr_entries = #states
					local i = self._gfx_lod_data.next_chk_prio_i

					if nr_entries < i then
						i = 1
					end

					local start_i = i

					repeat
						if states[i] then
							slot27 = units[i]

							if alive(slot26) then
								slot27 = units[i]

								if not occ_skip_units[units[i].key(slot26)] then
								else
									slot31 = 18000

									if not world_in_view_with_options(slot26, World, com[i], 0, 120) then
										states[i] = false
										slot27 = units[i]
										slot28 = false

										units[i].base(slot26).set_visibility_state(slot26, units[i].base(slot26))

										slot29 = anim_lod

										self._remove_i_from_lod_prio(slot26, self, i)

										self._gfx_lod_data.next_chk_prio_i = i + 1

										break
									else
										slot29 = com[i]
										local my_wgt = mvec3_dir(slot26, tmp_vec1, cam_pos)
										local dot = mvec3_dot(tmp_vec1, tmp_vec1)
										local previous_prio = nil
										slot30 = imp_i_list

										for prio, i_entry in ipairs(pl_fwd) do
											if i == i_entry then
												previous_prio = prio

												break
											end
										end

										my_wgt = my_wgt * my_wgt * (1 - dot)
										local i_wgt = #imp_wgt_list

										while 0 < i_wgt do
											if previous_prio ~= i_wgt and imp_wgt_list[i_wgt] <= my_wgt then
												break
											end

											i_wgt = i_wgt - 1
										end

										if not previous_prio or i_wgt <= previous_prio then
											i_wgt = i_wgt + 1
										end

										if i_wgt ~= previous_prio then
											if previous_prio then
												slot32 = previous_prio

												t_rem(slot30, imp_i_list)

												slot32 = previous_prio

												t_rem(slot30, imp_wgt_list)

												if previous_prio <= nr_lod_1 and nr_lod_1 < i_wgt and nr_lod_1 <= #imp_i_list then
													local promote_i = imp_i_list[nr_lod_1]
													states[promote_i] = 1
													slot32 = units[promote_i]
													slot33 = 1

													units[promote_i].base(slot31).set_visibility_state(slot31, units[promote_i].base(slot31))
												elseif nr_lod_1 < previous_prio and i_wgt <= nr_lod_1 then
													local denote_i = imp_i_list[nr_lod_1]
													states[denote_i] = 2
													slot32 = units[denote_i]
													slot33 = 2

													units[denote_i].base(slot31).set_visibility_state(slot31, units[denote_i].base(slot31))
												end
											elseif i_wgt <= nr_lod_total and #imp_i_list == nr_lod_total then
												local kick_i = imp_i_list[nr_lod_total]
												states[kick_i] = 3
												slot32 = units[kick_i]
												slot33 = 3

												units[kick_i].base(slot31).set_visibility_state(slot31, units[kick_i].base(slot31))

												slot32 = imp_wgt_list

												t_rem(slot31)

												slot32 = imp_i_list

												t_rem(slot31)
											end

											local lod_stage = nil

											if i_wgt <= nr_lod_total then
												slot34 = my_wgt

												t_ins(slot31, imp_wgt_list, i_wgt)

												slot34 = i

												t_ins(slot31, imp_i_list, i_wgt)

												if i_wgt <= nr_lod_1 then
													lod_stage = 1
												else
													lod_stage = 2
												end
											else
												lod_stage = 3
												slot34 = anim_lod

												self._remove_i_from_lod_prio(slot31, self, i)
											end

											if states[i] ~= lod_stage then
												states[i] = lod_stage
												slot32 = units[i]
												slot33 = lod_stage

												units[i].base(slot31).set_visibility_state(slot31, units[i].base(slot31))
											end
										end

										self._gfx_lod_data.next_chk_prio_i = i + 1

										break
									end
								end
							end
						end

						if i == nr_entries then
							i = 1
						else
							i = i + 1
						end
					until i == start_i
				end
			end
		end
	end

	return 
end
function EnemyManager:_remove_i_from_lod_prio(i, anim_lod)
	if not anim_lod then
		slot6 = "video_animation_lod"
		anim_lod = managers.user.get_setting(slot4, managers.user)
	end

	local nr_i_lod1 = self._nr_i_lod[anim_lod][1]
	slot6 = self._gfx_lod_data.prio_i

	for prio, i_entry in ipairs(slot5) do
		if i == i_entry then
			slot12 = prio

			table.remove(slot10, self._gfx_lod_data.prio_i)

			slot12 = prio

			table.remove(slot10, self._gfx_lod_data.prio_weights)

			if prio <= nr_i_lod1 and nr_i_lod1 < #self._gfx_lod_data.prio_i then
				local promoted_i_entry = self._gfx_lod_data.prio_i[prio]
				self._gfx_lod_data.entries.states[promoted_i_entry] = 1
				slot12 = self._gfx_lod_data.entries.units[promoted_i_entry]
				slot13 = 1

				self._gfx_lod_data.entries.units[promoted_i_entry].base(1).set_visibility_state(1, self._gfx_lod_data.entries.units[promoted_i_entry].base(1))
			end

			return 
		end
	end

	return 
end
function EnemyManager:_create_unit_gfx_lod_data(unit)
	local lod_entries = self._gfx_lod_data.entries
	slot6 = unit

	table.insert(slot4, lod_entries.units)

	slot6 = 1

	table.insert(slot4, lod_entries.states)

	slot5 = lod_entries.move_ext
	slot8 = unit

	table.insert(slot4, unit.movement(slot7))

	slot5 = lod_entries.trackers
	slot8 = unit
	slot8 = unit.movement(slot7)

	table.insert(slot4, unit.movement(slot7).nav_tracker(slot7))

	slot5 = lod_entries.com
	slot8 = unit
	slot8 = unit.movement(slot7)

	table.insert(slot4, unit.movement(slot7).m_com(slot7))

	return 
end
function EnemyManager:_destroy_unit_gfx_lod_data(u_key)
	local lod_entries = self._gfx_lod_data.entries
	slot5 = lod_entries.units

	for i, unit in ipairs(slot4) do
		slot10 = unit

		if u_key == unit.key(slot9) then
			if not lod_entries.states[i] then
				slot10 = unit
				slot11 = 1

				unit.base(slot9).set_visibility_state(slot9, unit.base(slot9))
			end

			local nr_entries = #lod_entries.units
			slot12 = i

			self._remove_i_from_lod_prio(slot10, self)

			slot11 = self._gfx_lod_data.prio_i

			for prio, i_entry in ipairs(slot10) do
				if i_entry == nr_entries then
					self._gfx_lod_data.prio_i[prio] = i

					break
				end
			end

			lod_entries.units[i] = lod_entries.units[nr_entries]
			slot11 = lod_entries.units

			table.remove(lod_entries.units[nr_entries])

			lod_entries.states[i] = lod_entries.states[nr_entries]
			slot11 = lod_entries.states

			table.remove(lod_entries.states[nr_entries])

			lod_entries.move_ext[i] = lod_entries.move_ext[nr_entries]
			slot11 = lod_entries.move_ext

			table.remove(lod_entries.move_ext[nr_entries])

			lod_entries.trackers[i] = lod_entries.trackers[nr_entries]
			slot11 = lod_entries.trackers

			table.remove(lod_entries.trackers[nr_entries])

			lod_entries.com[i] = lod_entries.com[nr_entries]
			slot11 = lod_entries.com

			table.remove(lod_entries.com[nr_entries])

			break
		end
	end

	return 
end
function EnemyManager:set_gfx_lod_enabled(state)
	if state then
		self._gfx_lod_data.enabled = state
	elseif self._gfx_lod_data.enabled then
		self._gfx_lod_data.enabled = state
		local entries = self._gfx_lod_data.entries
		local units = entries.units
		local states = entries.states
		slot7 = states

		for i, state in ipairs(slot6) do
			states[i] = 1
			slot12 = units[i]

			if alive(slot11) then
				slot12 = units[i]
				slot13 = 1

				units[i].base(slot11).set_visibility_state(slot11, units[i].base(slot11))
			end
		end
	end

	return 
end
function EnemyManager:chk_any_unit_in_slotmask_visible(slotmask, cam_pos, cam_nav_tracker)
	if self._gfx_lod_data.enabled then
		slot6 = managers.navigation

		if managers.navigation.is_data_ready(slot5) then
			slot6 = managers.viewport
			local camera_rot = managers.viewport.get_current_camera_rotation(slot5)
			local entries = self._gfx_lod_data.entries
			local units = entries.units
			local states = entries.states
			local trackers = entries.trackers
			local move_exts = entries.move_ext
			local com = entries.com
			local chk_vis_func = cam_nav_tracker and cam_nav_tracker.check_visibility
			local unit_occluded = Unit.occluded
			local occ_skip_units = managers.occlusion._skip_occlusion
			slot17 = "AI_visibility"
			local vis_slotmask = managers.slot.get_mask(slot15, managers.slot)
			slot17 = states

			for i, state in ipairs(managers.slot) do
				local unit = units[i]
				slot24 = slotmask

				if unit.in_slot(slot22, unit) then
					slot23 = unit
				end
			end
		end
	end

	return 
end
function EnemyManager:_init_enemy_data()
	local enemy_data = {}
	local unit_data = {}
	self._enemy_data = enemy_data
	enemy_data.unit_data = unit_data
	enemy_data.nr_units = 0
	enemy_data.nr_active_units = 0
	enemy_data.nr_inactive_units = 0
	enemy_data.inactive_units = {}
	enemy_data.max_nr_active_units = 20
	enemy_data.corpses = {}
	enemy_data.nr_corpses = 0
	self._civilian_data = {
		unit_data = {}
	}
	self._queued_tasks = {}
	self._queued_task_executed = nil
	self._delayed_clbks = {}
	self._t = 0
	self._gfx_lod_data = {
		enabled = true,
		prio_i = {},
		prio_weights = {},
		next_chk_prio_i = 1,
		entries = {}
	}
	local lod_entries = self._gfx_lod_data.entries
	lod_entries.units = {}
	lod_entries.states = {}
	lod_entries.move_ext = {}
	lod_entries.trackers = {}
	lod_entries.com = {}
	self._corpse_disposal_enabled = false

	return 
end
function EnemyManager:all_enemies()
	return self._enemy_data.unit_data
end
function EnemyManager:is_enemy(unit)
	slot5 = unit

	return (self._enemy_data.unit_data[unit.key(slot4)] and true) or false
end
function EnemyManager:all_civilians()
	return self._civilian_data.unit_data
end
function EnemyManager:is_civilian(unit)
	slot5 = unit

	return (self._civilian_data.unit_data[unit.key(slot4)] and true) or false
end
function EnemyManager:queue_task(id, task_clbk, data, execute_t, verification_clbk, asap)
	local task_data = {
		clbk = task_clbk,
		id = id,
		data = data,
		t = execute_t,
		v_cb = verification_clbk,
		asap = asap
	}
	slot10 = TimerManager
	slot10 = TimerManager.game(slot9)
	task_data.queue_time = TimerManager.game(slot9).time(slot9)
	slot11 = task_data

	table.insert(slot9, self._queued_tasks)

	return 
end
function EnemyManager:unqueue_all_tasks()
	self._queued_tasks = {}

	return 
end
function EnemyManager:remove_delayed_clbks()
	self._delayed_clbks = {}

	return 
end
function EnemyManager:unqueue_task(id)
	local tasks = self._queued_tasks
	local i = #tasks

	while 0 < i do
		if tasks[i].id == id then
			slot7 = i

			table.remove(slot5, tasks)

			return 
		end

		i = i - 1
	end

	return 
end
function EnemyManager:_cleanup_queued_tasks()
	local tasks = self._queued_tasks
	local i = #tasks

	while 0 < i do
		if tasks[i].is_executed then
			slot6 = i

			table.remove(slot4, tasks)
		end

		i = i - 1
	end

	return 
end
function EnemyManager:unqueue_task_debug(id)
	if not id then
		slot4 = Application

		Application.stack_dump(slot3)
	end

	local tasks = self._queued_tasks
	local i = #tasks
	local removed = nil

	while 0 < i do
		if tasks[i].id == id then
			if removed then
				slot9 = id

				debug_pause(slot6, "DOUBLE TASK AT ", i)
			else
				slot8 = i

				table.remove(slot6, tasks)

				removed = true
			end
		end

		i = i - 1
	end

	if not removed then
		slot9 = "was not queued!!!"

		debug_pause(slot6, "[EnemyManager:unqueue_task] task", id)
	end

	return 
end
function EnemyManager:has_task(id)
	local tasks = self._queued_tasks
	local i = #tasks
	local count = 0

	while 0 < i do
		if tasks[i].id == id then
			count = count + 1
		end

		i = i - 1
	end

	return 0 < count and count
end
function EnemyManager:_execute_queued_task(i)
	local task = self._queued_tasks[i]
	slot5 = TimerManager
	local time = TimerManager.game(slot4).time(slot4)
	slot6 = time - task.queue_time

	if math.abs(TimerManager.game(slot4)) < 0.1 then
		return 
	end

	self._queued_task_executed = true
	task.is_executed = true

	if task.data and task.data.unit then
		slot6 = task.data.unit

		if not alive(slot5) then
			slot7 = "[EnemyManager:_execute_queued_task] dead unit"
			slot10 = task

			Application.error(slot5, Application, inspect(slot9))

			return 
		end
	end

	if task.v_cb then
		slot6 = task.id

		task.v_cb(slot5)
	end

	slot6 = task.data

	task.clbk(slot5)

	return 
end
local m_ceil = math.ceil
local t_remove = table.remove
function EnemyManager:_update_queued_tasks(t, dt)
	local i_asap_task, asp_task_t = nil
	local queue_remaining = m_ceil(slot6)
	slot8 = self._queued_tasks

	for i_task, task_data in ipairs(dt * tweak_data.group_ai.ai_tick_rate) do
		if not task_data.t or task_data.t < t then
			slot14 = i_task

			self._execute_queued_task(slot12, self)

			queue_remaining = queue_remaining - 1

			if queue_remaining <= 0 then
				break
			end
		elseif task_data.asap and (not asp_task_t or task_data.t < asp_task_t) then
			i_asap_task = i_task
			asp_task_t = task_data.t
		end
	end

	if i_asap_task and not self._queued_task_executed then
		slot9 = i_asap_task

		self._execute_queued_task(slot7, self)
	end

	local all_clbks = self._delayed_clbks

	if all_clbks[1] and all_clbks[1][2] < t then
		slot10 = 1
		local clbk = t_remove(slot8, all_clbks)[3]

		clbk()
	end

	return 
end
function EnemyManager:add_delayed_clbk(id, clbk, execute_t)
	if not clbk then
		slot6 = "[EnemyManager:add_delayed_clbk] Empty callback object!!!"

		debug_pause(slot5)
	end

	local clbk_data = {
		id,
		execute_t,
		clbk
	}
	local all_clbks = self._delayed_clbks
	local i = #all_clbks

	while 0 < i and execute_t < all_clbks[i][2] do
		i = i - 1
	end

	slot11 = clbk_data

	table.insert(slot8, all_clbks, i + 1)

	return 
end
function EnemyManager:remove_delayed_clbk(id)
	local all_clbks = self._delayed_clbks
	slot5 = all_clbks

	for i, clbk_data in ipairs(slot4) do
		if clbk_data[1] == id then
			slot11 = i

			table.remove(slot9, all_clbks)

			return 
		end
	end

	slot8 = "was not scheduled!!!"

	Application.error(slot4, Application, "[EnemyManager:remove_delayed_clbk] id", id)

	return 
end
function EnemyManager:remove_all_delayed_clbks(id)
	local all_clbks = self._delayed_clbks
	local callback_data = nil
	local i = #all_clbks

	while 0 < i do
		callback_data = all_clbks[i]

		if callback_data[1] == id then
			slot8 = i

			table.remove(slot6, all_clbks)
		end

		i = i - 1
	end

	return 
end
function EnemyManager:reschedule_delayed_clbk(id, execute_t)
	local all_clbks = self._delayed_clbks
	local clbk_data = nil
	slot7 = all_clbks

	for i, clbk_d in ipairs(slot6) do
		if clbk_d[1] == id then
			slot13 = i
			clbk_data = table.remove(slot11, all_clbks)

			break
		end
	end

	if clbk_data then
		clbk_data[2] = execute_t
		local i = #all_clbks

		while 0 < i and execute_t < all_clbks[i][2] do
			i = i - 1
		end

		slot10 = clbk_data

		table.insert(slot7, all_clbks, i + 1)

		return 
	end

	slot9 = "was not scheduled!!!"

	print(slot6, "[EnemyManager:reschedule_delayed_clbk] id", id)

	return 
end
function EnemyManager:force_delayed_clbk(id)
	local all_clbks = self._delayed_clbks
	slot5 = all_clbks

	for i, clbk_data in ipairs(slot4) do
		if clbk_data[1] == id then
			slot11 = 1
			local clbk = table.remove(slot9, all_clbks)[3]

			clbk()

			return 
		end
	end

	slot7 = "was not scheduled!!!"

	debug_pause(slot4, "[EnemyManager:force_delayed_clbk] id", id)

	return 
end
function EnemyManager:queued_tasks_by_callback()
	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	local t = TimerManager.game(slot2).time(slot2)
	local categorised_queued_tasks = {}
	local congestion = 0
	slot6 = self._queued_tasks

	for i_task, task_data in ipairs(slot5) do
		if categorised_queued_tasks[task_data.clbk] then
			categorised_queued_tasks[task_data.clbk].amount = categorised_queued_tasks[task_data.clbk].amount + 1
		else
			categorised_queued_tasks[task_data.clbk] = {
				amount = 1,
				key = task_data.id
			}
		end

		if not task_data.t or task_data.t < t then
			congestion = congestion + 1
		end
	end

	slot7 = congestion

	print(slot5, "congestion")

	slot6 = categorised_queued_tasks

	for clbk, data in pairs(slot5) do
		slot12 = data.amount

		print(slot10, data.key)
	end

	return 
end
function EnemyManager:register_enemy(enemy)
	if self._destroyed then
		slot4 = "[EnemyManager:register_enemy] enemy manager is destroyed"

		debug_pause(slot3)
	end

	local char_tweak = tweak_data.character[enemy.base(slot4)._tweak_table]
	local u_data = {
		importance = 0,
		unit = enemy
	}
	slot6 = enemy
	slot6 = enemy.movement(enemy)
	u_data.m_pos = enemy.movement(enemy).m_pos(enemy)
	slot6 = enemy
	slot6 = enemy.movement(enemy)
	u_data.tracker = enemy.movement(enemy).nav_tracker(enemy)
	u_data.char_tweak = char_tweak
	slot7 = char_tweak.access
	u_data.so_access = managers.navigation.convert_access_flag(enemy, managers.navigation)
	slot7 = enemy
	slot5 = enemy.key(managers.navigation)
	self._enemy_data.unit_data[slot5] = u_data
	slot6 = enemy
	slot7 = self._unit_clbk_key
	slot12 = "on_enemy_destroyed"

	enemy.base(slot5).add_destroy_listener(slot5, enemy.base(slot5), callback(slot9, self, self))

	slot7 = enemy

	self.on_enemy_registered(slot5, self)

	return 
end
function EnemyManager:on_enemy_died(dead_unit, damage_info)
	if self._destroyed then
		slot6 = dead_unit

		debug_pause(slot4, "[EnemyManager:on_enemy_died] enemy manager is destroyed")
	end

	slot5 = dead_unit
	local u_key = dead_unit.key(slot4)
	local enemy_data = self._enemy_data
	local u_data = enemy_data.unit_data[u_key]
	slot9 = dead_unit

	self.on_enemy_unregistered(slot7, self)

	enemy_data.unit_data[u_key] = nil
	slot9 = "enemy_killed"

	managers.mission.call_global_event(nil, managers.mission)

	slot8 = managers.groupai
	slot8 = managers.groupai.state(nil)

	if not managers.groupai.state(nil).is_police_called(nil) then
		slot10 = {
			skip_idle_check = true,
			instigator = managers.player.local_player(slot12)
		}
		slot13 = managers.player

		managers.dialog.queue_dialog(slot7, managers.dialog, "player_gen_stealth_kill")
	end

	slot8 = dead_unit

	if dead_unit.movement(slot7) then
		slot8 = dead_unit
		slot8 = dead_unit.movement(slot7)

		dead_unit.movement(slot7).anim_clbk_close_parachute(slot7)
	end

	enemy_data.nr_corpses = enemy_data.nr_corpses + 1
	slot9 = dead_unit
	slot7 = dead_unit.id(slot8)
	enemy_data.corpses[slot7] = u_data
	u_data.death_t = self._t
	slot9 = u_key

	self._destroy_unit_gfx_lod_data(slot7, self)

	slot8 = dead_unit
	u_data.u_id = dead_unit.id(slot7)
	slot8 = dead_unit
	local contour_ext = dead_unit.contour(slot7)

	if contour_ext then
		slot9 = contour_ext

		contour_ext.disable(slot8)
	end

	return 
end
function EnemyManager:disable_countours_on_dead_enemies()
	slot3 = managers.enemy._enemy_data.corpses

	for _, corpse in pairs(slot2) do
		local unit = corpse.unit
		slot9 = unit

		if alive(slot8) and unit.contour then
			slot9 = unit
			local contour = unit.contour(slot8)

			if contour then
				slot10 = contour

				contour.disable(slot9)
			end
		end
	end

	return 
end
function EnemyManager:on_enemy_destroyed(enemy)
	local u_key = enemy.key(slot3)
	slot5 = enemy
	local u_id = enemy.id(enemy)
	local enemy_data = self._enemy_data

	if enemy_data.unit_data[u_key] then
		slot8 = enemy

		self.on_enemy_unregistered(slot6, self)

		enemy_data.unit_data[u_key] = nil
		slot8 = u_key

		self._destroy_unit_gfx_lod_data(nil, self)
	elseif enemy_data.corpses[u_id] then
		enemy_data.nr_corpses = enemy_data.nr_corpses - 1
		enemy_data.corpses[u_id] = nil
	end

	return 
end
function EnemyManager:on_enemy_registered(unit)
	self._enemy_data.nr_units = self._enemy_data.nr_units + 1
	slot6 = true

	self._create_unit_gfx_lod_data(self._enemy_data.nr_units + 1, self, unit)

	slot4 = managers.groupai
	slot5 = unit

	managers.groupai.state(self._enemy_data.nr_units + 1).on_enemy_registered(self._enemy_data.nr_units + 1, managers.groupai.state(self._enemy_data.nr_units + 1))

	return 
end
function EnemyManager:on_enemy_unregistered(unit)
	self._enemy_data.nr_units = self._enemy_data.nr_units - 1
	slot4 = managers.groupai
	slot5 = unit

	managers.groupai.state(self._enemy_data.nr_units - 1).on_enemy_unregistered(self._enemy_data.nr_units - 1, managers.groupai.state(self._enemy_data.nr_units - 1))

	return 
end
function EnemyManager:register_civilian(unit)
	slot4 = unit
	slot5 = self._unit_clbk_key
	slot10 = "on_civilian_destroyed"

	unit.base(slot3).add_destroy_listener(slot3, unit.base(slot3), callback(slot7, self, self))

	slot6 = true

	self._create_unit_gfx_lod_data(slot3, self, unit)

	local char_tweak = tweak_data.character[unit.base(self)._tweak_table]
	slot6 = unit
	slot8 = unit
	slot8 = unit.movement(slot7)
	slot8 = unit
	slot8 = unit.movement(slot7)
	slot9 = char_tweak.access
	self._civilian_data.unit_data[unit.key(unit)] = {
		is_civilian = true,
		unit = unit,
		m_pos = unit.movement(slot7).m_pos(slot7),
		tracker = unit.movement(slot7).nav_tracker(slot7),
		char_tweak = char_tweak,
		so_access = managers.navigation.convert_access_flag(slot7, managers.navigation)
	}

	return 
end
function EnemyManager:on_civilian_died(dead_unit, damage_info)
	local u_key = dead_unit.key(slot4)
	slot6 = managers.groupai
	slot7 = dead_unit

	managers.groupai.state(dead_unit).on_civilian_unregistered(dead_unit, managers.groupai.state(dead_unit))

	slot6 = Network

	if Network.is_server(dead_unit) and damage_info.attacker_unit then
		slot6 = dead_unit

		if not dead_unit.base(slot5).enemy then
			slot6 = managers.groupai
			slot7 = damage_info.attacker_unit

			managers.groupai.state(slot5).hostage_killed(slot5, managers.groupai.state(slot5))
		end
	end

	slot7 = "civilian_killed"

	managers.mission.call_global_event(slot5, managers.mission)

	local u_data = self._civilian_data.unit_data[u_key]
	local enemy_data = self._enemy_data
	enemy_data.nr_corpses = enemy_data.nr_corpses + 1
	slot9 = dead_unit
	slot7 = dead_unit.id(slot8)
	enemy_data.corpses[slot7] = u_data
	slot8 = TimerManager
	slot8 = TimerManager.game(slot7)
	u_data.death_t = TimerManager.game(slot7).time(slot7)
	self._civilian_data.unit_data[u_key] = nil
	slot9 = u_key

	self._destroy_unit_gfx_lod_data(nil, self)

	slot8 = dead_unit
	u_data.u_id = dead_unit.id(nil)

	return 
end
function EnemyManager:on_civilian_destroyed(enemy)
	local u_key = enemy.key(slot3)
	slot5 = enemy
	local u_id = enemy.id(enemy)
	local enemy_data = self._enemy_data

	if enemy_data.corpses[u_id] then
		enemy_data.nr_corpses = enemy_data.nr_corpses - 1
		enemy_data.corpses[u_id] = nil
	else
		slot7 = managers.groupai
		slot8 = enemy

		managers.groupai.state(slot6).on_civilian_unregistered(slot6, managers.groupai.state(slot6))

		self._civilian_data.unit_data[u_key] = nil
		slot8 = u_key

		self._destroy_unit_gfx_lod_data(nil, self)
	end

	return 
end
function EnemyManager:on_criminal_registered(unit)
	slot6 = false

	self._create_unit_gfx_lod_data(slot3, self, unit)

	return 
end
function EnemyManager:on_criminal_unregistered(u_key)
	slot5 = u_key

	self._destroy_unit_gfx_lod_data(slot3, self)

	return 
end
function EnemyManager:_upd_corpse_disposal()
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	local t = TimerManager.game(slot2).time(slot2)
	local enemy_data = self._enemy_data
	local nr_corpses = enemy_data.nr_corpses
	local disposals_needed = nr_corpses - self._MAX_NR_CORPSES
	local corpses = enemy_data.corpses
	slot12 = t + self._corpse_disposal_upd_interval

	self.queue_task(slot7, self, "EnemyManager._upd_corpse_disposal", EnemyManager._upd_corpse_disposal, self)

	slot8 = self

	if not self.is_corpse_disposal_enabled(slot7) or disposals_needed <= 0 then
		return 
	end

	slot8 = managers.player
	local player = managers.player.player_unit(slot7)
	local to_dispose = {}
	local nr_found = 0
	local no_peers = 0
	slot14 = managers.network
	slot14 = managers.network.session(slot13)

	for peer_id, peer in pairs(managers.network.session(slot13).all_peers(slot13)) do
		local peer_unit = peer.unit(slot16)
		slot18 = peer

		if peer.unit(peer) then
			no_peers = no_peers + 1
			local cam_pos = peer_unit.position(slot17)
			slot19 = peer_unit
			slot19 = peer_unit.movement(peer_unit)
			local cam_fwd = peer_unit.movement(peer_unit).m_head_rot(peer_unit).y(peer_unit)
			slot20 = corpses

			for u_key, u_data in pairs(peer_unit.movement(peer_unit).m_head_rot(peer_unit)) do
				local u_pos = u_data.m_pos
				slot27 = u_pos
				local dis = mvec3_dis(slot25, cam_pos)

				if 1500 >= dis and 200 < dis then
					slot28 = u_pos - cam_pos

					if mvector3.dot(slot26, cam_fwd) < 0 and 10 < t - u_data.death_t then
						to_dispose[u_key] = to_dispose[u_key] or 0
						to_dispose[u_key] = to_dispose[u_key] + 1
					end
				end
			end
		end
	end

	slot12 = to_dispose

	for k, v in pairs(slot11) do
		if v == no_peers then
			to_dispose[k] = -1
			nr_found = nr_found + 1

			if nr_found == disposals_needed then
				break
			end
		end
	end

	slot12 = to_dispose

	for u_key, v in pairs(slot11) do
		if v == -1 then
			local u_data = corpses[u_key]
			slot18 = u_data.unit

			if alive(slot17) then
				slot18 = u_data.unit
				slot20 = 0

				u_data.unit.base(slot17).set_slot(slot17, u_data.unit.base(slot17), u_data.unit)
			end

			corpses[u_key] = nil
		end
	end

	enemy_data.nr_corpses = nr_corpses - nr_found
	disposals_needed = enemy_data.nr_corpses - self._MAX_NR_CORPSES

	if 0 < disposals_needed then
		slot12 = corpses

		for u_key, u_data in pairs(slot11) do
			if 10 < t - u_data.death_t then
				slot17 = u_data.unit

				if alive(slot16) then
					slot17 = u_data.unit
					slot19 = 0

					u_data.unit.base(slot16).set_slot(slot16, u_data.unit.base(slot16), u_data.unit)
				end

				disposals_needed = disposals_needed - 1
				enemy_data.nr_corpses = enemy_data.nr_corpses - 1
				corpses[u_key] = nil

				if disposals_needed == 0 then
					break
				end
			end
		end
	end

	return 
end
function EnemyManager:set_corpse_disposal_enabled(state)
	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	self._corpse_disposal_enabled = state

	if state then
		slot5 = "EnemyManager._upd_corpse_disposal"

		if not self.has_task(slot3, self) then
			slot10 = TimerManager
			slot10 = TimerManager.game(slot9)
			slot8 = TimerManager.game(slot9).time(slot9) + self._corpse_disposal_upd_interval

			self.queue_task(slot3, self, "EnemyManager._upd_corpse_disposal", EnemyManager._upd_corpse_disposal, self)
		end
	else
		slot5 = "EnemyManager._upd_corpse_disposal"

		self.unqueue_task(slot3, self)
	end

	return 
end
function EnemyManager:is_corpse_disposal_enabled()
	return self._corpse_disposal_enabled
end
function EnemyManager:on_simulation_ended()
	self._commander_active = 0

	return 
end
function EnemyManager:on_simulation_started()
	self._destroyed = nil

	return 
end
function EnemyManager:on_level_tranistion()
	self._destroyed = nil
	slot3 = self

	self.unqueue_all_tasks(slot2)

	slot3 = self

	self.remove_delayed_clbks(slot2)

	slot3 = self

	self.dispose_all_corpses(slot2)

	return 
end
function EnemyManager:dispose_all_corpses()
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	slot3 = self._enemy_data.corpses

	for _, corpse_data in pairs(slot2) do
		slot8 = corpse_data.unit

		if alive(slot7) then
			slot9 = corpse_data.unit

			World.delete_unit(slot7, World)
		end
	end

	self._enemy_data.corpses = {}

	return 
end
function EnemyManager:save(data)
	local my_data = nil
	my_data = my_data or {}
	slot5 = self._enemy_data.corpses

	for u_key, u_data in pairs(slot4) do
		my_data.corpses = my_data.corpses or {}
		local corpse_data = {
			u_data.u_id
		}
		slot11 = u_data.unit
		slot11 = u_data.unit.movement(slot10)
		corpse_data[2] = u_data.unit.movement(slot10).m_pos(slot10)
		corpse_data[3] = (u_data.is_civilian and true) or false
		slot11 = u_data.unit
		slot11 = u_data.unit.interaction(slot10)
		corpse_data[4] = (u_data.unit.interaction(slot10).active(slot10) and true) or false
		slot11 = u_data.unit
		corpse_data[5] = u_data.unit.interaction(slot10).tweak_data
		slot11 = u_data.unit
		slot11 = u_data.unit.contour(slot10)
		corpse_data[MULTRES] = u_data.unit.contour(slot10).is_flashing(slot10)
		slot12 = corpse_data

		table.insert(slot10, my_data.corpses)
	end

	data.enemy_manager = my_data

	return 
end
function EnemyManager:load(data)
	local my_data = data.enemy_manager

	if not my_data then
		return 
	end

	if my_data.corpses then
		slot5 = my_data.corpses

		for _, corpse_data in pairs(slot4) do
			local u_id = corpse_data[1]
			local spawn_pos = corpse_data[2]
			local is_civilian = corpse_data[3]
			local interaction_active = corpse_data[4]
			local interaction_tweak_data = corpse_data[5]
			local contour_flashing = corpse_data[6]
			slot22 = 50
			slot23 = 100
			slot24 = "AI_graph_obstacle_check"
			local grnd_ray = World.raycast(slot15, World, "ray", spawn_pos + Vector3(slot19, 0, 0), spawn_pos - Vector3(0, 0, 0), "slot_mask", managers.slot.get_mask(0, managers.slot), "ray_type")
			slot18 = u_id
			local corpse = World.unit_manager(World).get_unit_by_id(World, World.unit_manager(World))
			slot18 = corpse
			slot24 = corpse
			slot24 = (is_civilian and "on_civilian_destroyed") or "on_enemy_destroyed"

			corpse.base(World.unit_manager(World)).add_destroy_listener(World, corpse.base(World.unit_manager(World)), callback(slot21, self, self))

			slot20 = corpse
			self._enemy_data.corpses[u_id] = {
				death_t = 0,
				unit = corpse,
				u_id = u_id,
				m_pos = corpse.position("EnemyManager_corpse_dummy" .. tostring(corpse.key("walk")))
			}
			self._enemy_data.nr_corpses = self._enemy_data.nr_corpses + 1
			slot18 = corpse

			if corpse.damage(self._enemy_data.nr_corpses + 1) then
				slot18 = corpse
				slot19 = "unfreeze_ragdoll"

				if corpse.damage(slot17).has_sequence(slot17, corpse.damage(slot17)) then
					Application.debug(slot17, Application, "[EnemyManager:load] call unfreeze_ragdoll")

					slot18 = corpse
					slot19 = "unfreeze_ragdoll"

					corpse.damage(slot17).run_sequence_simple(slot17, corpse.damage(slot17))

					slot21 = "movement"
					slot20 = false

					corpse.set_extension_update_enabled(slot17, corpse, Idstring(corpse))

					slot24 = nil

					managers.queued_tasks.queue(slot17, managers.queued_tasks, nil, self._queue_freeze_ragdoll, self, {
						corpse = corpse
					}, 6)
				end
			end
		end
	end

	return 
end
function EnemyManager:_queue_freeze_ragdoll(data)
	slot4 = data.corpse

	if alive(slot3) then
		slot4 = data.corpse
		slot5 = "freeze_ragdoll"

		data.corpse.damage(slot3).run_sequence_simple(slot3, data.corpse.damage(slot3))
	end

	return 
end
function EnemyManager:get_corpse_unit_data_from_key(u_id)
	return self._enemy_data.corpses[u_id]
end
function EnemyManager:get_corpse_unit_data_from_id(u_id)
	slot4 = self._enemy_data.corpses

	for u_key, u_data in pairs(slot3) do
		if u_id == u_data.u_id then
			return u_data
		end
	end

	return 
end
function EnemyManager:remove_corpse_by_id(u_id)
	slot4 = self._enemy_data.corpses

	for u_key, u_data in pairs(slot3) do
		if u_id == u_data.u_id then
			slot10 = 0

			u_data.unit.set_slot(slot8, u_data.unit)

			break
		end
	end

	return 
end
function EnemyManager:commander_difficulty()
	return self._difficulty_difference or 0
end
function EnemyManager:is_commander_active()
	return self._commander_active and 0 < self._commander_active
end
function EnemyManager:is_spawn_group_allowed(group_type)
	local allowed = true
	slot5 = managers.enemy

	if not managers.enemy.is_commander_active(slot4) and (group_type == "commander_squad" or group_type == "ss_flankers" or group_type == "ss_rifle_range" or group_type == "ss_chargers") then
		allowed = false
	end

	return allowed
end
function EnemyManager:register_commander()
	slot5 = self._commander_active

	Application.debug(slot2, Application, "[EnemyManager:register_commander()]")

	self._commander_active = self._commander_active + 1

	if self._commander_active == 1 then
		slot3 = managers.groupai
		slot3 = managers.groupai.state(slot2)
		local old_diff = managers.groupai.state(slot2).get_difficulty(slot2)
		local new_diff = old_diff + CommanderBrain.INTENSITY_INCREASE
		slot7 = 1
		new_diff = math.clamp(slot4, new_diff, new_diff)
		self._difficulty_difference = new_diff - old_diff

		if 0 < self._difficulty_difference then
			slot8 = new_diff

			Application.debug(slot4, Application, "[EnemyManager:register_commander()] setting new intensity value (old,new)", old_diff)

			slot5 = managers.groupai
			slot6 = new_diff

			managers.groupai.state(slot4).set_difficulty(slot4, managers.groupai.state(slot4))
		end
	end

	return 
end
function EnemyManager:unregister_commander()
	slot5 = self._commander_active

	Application.debug(slot2, Application, "[EnemyManager:unregister_commander()]")

	slot5 = self._commander_active
	self._commander_active = math.clamp(slot2, self._commander_active - 1, 0)

	if self._commander_active == 0 and 0 < self._difficulty_difference then
		slot3 = managers.groupai
		slot3 = managers.groupai.state(slot2)
		local old_diff = managers.groupai.state(slot2).get_difficulty(slot2)
		local new_diff = old_diff - self._difficulty_difference
		slot7 = new_diff
		new_diff = math.clamp(slot4, new_diff, 0)
		slot8 = new_diff

		Application.debug(slot4, Application, "[EnemyManager:unregister_commander()] setting new intensity value (old,new)", old_diff)

		slot5 = managers.groupai
		slot6 = new_diff

		managers.groupai.state(slot4).set_difficulty(slot4, managers.groupai.state(slot4))

		self._difficulty_difference = 0
	end

	return 
end

return 
