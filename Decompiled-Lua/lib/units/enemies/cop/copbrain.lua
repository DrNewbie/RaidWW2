-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/units/enemies/cop/logics/CopLogicBase"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicInactive"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicIdle"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicAttack"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicIntimidated"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicTravel"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicArrest"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicFlee"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicSniper"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicSpotter"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicTrade"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicPhalanxMinion"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicPhalanxVip"

require(slot1)

slot2 = "lib/units/enemies/cop/logics/CopLogicTurret"

require(slot1)

slot2 = "lib/units/enemies/tank/logics/TankCopLogicAttack"

require(slot1)

slot2 = "lib/units/enemies/shield/logics/ShieldLogicAttack"

require(slot1)

slot2 = "lib/units/enemies/flamer/logics/FlamerLogicAttack"

require(slot1)

CopBrain = CopBrain or class()
local logic_variants = {
	security = {
		idle = CopLogicIdle,
		attack = CopLogicAttack,
		travel = CopLogicTravel,
		inactive = CopLogicInactive,
		intimidated = CopLogicIntimidated,
		arrest = CopLogicArrest,
		flee = CopLogicFlee,
		sniper = CopLogicSniper,
		spotter = CopLogicSpotter,
		trade = CopLogicTrade,
		phalanx = CopLogicPhalanxMinion,
		turret = CopLogicTurret
	}
}
local security_variant = logic_variants.security
logic_variants.gensec = security_variant
logic_variants.cop = security_variant
logic_variants.fbi = security_variant
logic_variants.swat = security_variant
logic_variants.heavy_swat = security_variant
logic_variants.fbi_swat = security_variant
logic_variants.fbi_heavy_swat = security_variant
logic_variants.nathan = security_variant
logic_variants.sniper = security_variant
logic_variants.spotter = security_variant
logic_variants.gangster = security_variant
logic_variants.biker = security_variant
logic_variants.mobster = security_variant
logic_variants.mobster_boss = security_variant
logic_variants.hector_boss = security_variant
logic_variants.hector_boss_no_armor = security_variant
logic_variants.dealer = security_variant
logic_variants.biker_escape = security_variant
logic_variants.city_swat = security_variant
logic_variants.old_hoxton_mission = security_variant
logic_variants.inside_man = security_variant
logic_variants.german_officer = security_variant
logic_variants.german_grunt_light = security_variant
logic_variants.german_grunt_light_mp38 = security_variant
logic_variants.german_grunt_light_kar98 = security_variant
logic_variants.german_grunt_light_shotgun = security_variant
logic_variants.german_grunt_mid = security_variant
logic_variants.german_grunt_mid_mp38 = security_variant
logic_variants.german_grunt_mid_kar98 = security_variant
logic_variants.german_grunt_mid_shotgun = security_variant
logic_variants.german_grunt_heavy = security_variant
logic_variants.german_grunt_heavy_mp38 = security_variant
logic_variants.german_grunt_heavy_kar98 = security_variant
logic_variants.german_grunt_heavy_shotgun = security_variant
logic_variants.german_light = security_variant
logic_variants.german_light_kar98 = security_variant
logic_variants.german_light_shotgun = security_variant
logic_variants.german_heavy = security_variant
logic_variants.german_heavy_kar98 = security_variant
logic_variants.german_heavy_shotgun = security_variant
logic_variants.german_gasmask = security_variant
logic_variants.german_gasmask_shotgun = security_variant
logic_variants.german_gasmask_commander_backup = security_variant
logic_variants.german_gasmask_commander_backup_shotgun = security_variant
logic_variants.german_light_commander_backup = security_variant
logic_variants.german_heavy_commander_backup = security_variant
logic_variants.german_fallschirmjager_light = security_variant
logic_variants.german_fallschirmjager_light_kar98 = security_variant
logic_variants.german_fallschirmjager_light_shotgun = security_variant
logic_variants.german_fallschirmjager_light_mp38 = security_variant
logic_variants.german_fallschirmjager_heavy = security_variant
logic_variants.german_fallschirmjager_heavy_kar98 = security_variant
logic_variants.german_fallschirmjager_heavy_shotgun = security_variant
logic_variants.german_fallschirmjager_heavy_mp38 = security_variant
logic_variants.german_waffen_ss = security_variant
logic_variants.german_waffen_ss_kar98 = security_variant
logic_variants.german_waffen_ss_shotgun = security_variant
logic_variants.german_gebirgsjager_light = security_variant
logic_variants.german_gebirgsjager_light_kar98 = security_variant
logic_variants.german_gebirgsjager_light_shotgun = security_variant
logic_variants.german_gebirgsjager_light_mp38 = security_variant
logic_variants.german_gebirgsjager_heavy = security_variant
logic_variants.german_gebirgsjager_heavy_kar98 = security_variant
logic_variants.german_gebirgsjager_heavy_shotgun = security_variant
logic_variants.german_gebirgsjager_heavy_mp38 = security_variant
logic_variants.german_sniper = security_variant
logic_variants.german_spotter = security_variant
logic_variants.soviet_nkvd_int_security_captain = security_variant
logic_variants.soviet_nkvd_int_security_captain_b = security_variant
slot4 = {
	"shield",
	"tank",
	"taser",
	"german_flamer",
	"german_commander",
	"german_og_commander"
}

for _, tweak_table_name in pairs(slot3) do
	slot9 = security_variant
	logic_variants[tweak_table_name] = clone(slot8)
end

logic_variants.german_commander.intimidated = nil
logic_variants.german_commander.flee = nil
logic_variants.german_og_commander.intimidated = nil
logic_variants.german_og_commander.flee = nil
logic_variants.shield.attack = ShieldLogicAttack
logic_variants.shield.intimidated = nil
logic_variants.shield.flee = nil
logic_variants.german_flamer.attack = FlamerLogicAttack
logic_variants.german_flamer.intimidated = nil
logic_variants.german_flamer.flee = nil
slot4 = logic_variants.shield
logic_variants.phalanx_minion = clone(nil)
slot4 = logic_variants.shield
logic_variants.phalanx_vip = clone(nil)
logic_variants.phalanx_vip.phalanx = CopLogicPhalanxVip
logic_variants.tank.attack = TankCopLogicAttack
logic_variants.tank_hw = logic_variants.tank
security_variant = nil
CopBrain._logic_variants = logic_variants
logic_varaints = nil
local reload = nil

if CopBrain._reload_clbks then
	reload = true
else
	CopBrain._reload_clbks = {}
end

function CopBrain:init(unit)
	self._unit = unit
	slot4 = TimerManager
	self._timer = TimerManager.game(slot3)

	self.set_update_enabled_state(slot3, self)

	self._current_logic = nil
	self._current_logic_name = nil
	self._active = true
	slot4 = unit
	local tweak_table = unit.base(slot3)._tweak_table
	local access = tweak_data.character[tweak_table].access
	slot7 = access
	self._SO_access = managers.navigation.convert_access_flag(false, managers.navigation)
	slot7 = "criminals"
	self._slotmask_enemies = managers.slot.get_mask(false, managers.slot)
	slot10 = "on_reload"
	self._reload_clbks[unit.key(managers.slot)] = callback(unit, self, self)
	self.random_travel_applied = false

	return 
end
function CopBrain:post_init()
	self._logics = CopBrain._logic_variants[self._unit.base(slot3)._tweak_table]
	slot3 = self

	self._reset_logic_data(self._unit.base(slot3)._tweak_table)

	slot5 = self._unit
	local my_key = tostring(self._unit.key(self._unit))
	slot4 = self._unit
	slot6 = {
		"dmg_rcv",
		"hurt",
		"light_hurt",
		"heavy_hurt",
		"hurt_sick",
		"shield_knock",
		"counter_tased",
		"taser_tased"
	}
	slot11 = "clbk_damage"

	self._unit.character_damage(self._unit.key).add_listener(self._unit.key, self._unit.character_damage(self._unit.key), "CopBrain_hurt" .. my_key, callback(slot8, self, self))

	slot4 = self._unit
	slot6 = {
		"death"
	}
	slot11 = "clbk_death"

	self._unit.character_damage(self._unit.key).add_listener(self._unit.key, self._unit.character_damage(self._unit.key), "CopBrain_death" .. my_key, callback(slot8, self, self))

	slot4 = self

	self._setup_attention_handler(self._unit.key)

	if not self._current_logic then
		slot5 = "idle"

		self.set_init_logic(slot3, self)
	end

	slot4 = Network

	if Network.is_server(slot3) then
		slot6 = {
			radius = 30,
			position = mvector3.copy(self._unit.movement(slot10).m_pos(slot10))
		}
		slot11 = self._unit
		slot11 = self._unit.movement(slot10)

		self.add_pos_rsrv(slot3, self, "stand")

		slot4 = managers.groupai
		slot4 = managers.groupai.state(slot3)

		if not managers.groupai.state(slot3).enemy_weapons_hot(slot3) then
			self._enemy_weapons_hot_listen_id = "CopBrain" .. my_key
			slot4 = managers.groupai
			slot6 = {
				"enemy_weapons_hot"
			}
			slot11 = "clbk_enemy_weapons_hot"

			managers.groupai.state(my_key).add_listener(my_key, managers.groupai.state(my_key), self._enemy_weapons_hot_listen_id, callback(slot8, self, self))
		end
	end

	slot4 = self._unit

	if not self._unit.contour(slot3) then
		slot6 = self._unit

		debug_pause_unit(slot3, self._unit, "[CopBrain:post_init] character missing contour extension")
	end

	slot5 = BuffEffectManager.EFFECT_ATTACK_ONLY_IN_AIR

	if managers.buff_effect.is_effect_active(slot3, managers.buff_effect) then
		slot4 = self._unit

		if self._unit.damage(slot3) then
			slot4 = self._unit
			slot5 = "halloween_2017"

			if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
				slot4 = self._unit
				slot5 = "halloween_2017"

				self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))
			end
		end
	end

	return 
end
function CopBrain:set_logic_queued(data)
	slot4 = self._unit

	if alive(slot3) then
		slot4 = self._unit

		if not self._unit.brain(slot3).dead then
			slot6 = data.params

			self.set_logic(slot3, self, data.state_name)
		end
	end

	self.logic_queued_key = nil

	return 
end
function CopBrain:update(unit, t, dt)
	slot6 = managers.network

	if managers.network.session(slot5) then
		slot6 = managers.network
		slot6 = managers.network.session(slot5)
		slot6 = managers.network.session(slot5).local_peer(slot5)
	end

	slot6 = managers.game_play_central

	if managers.game_play_central.is_restarting(slot5) then
		return 
	end

	local logic = self._current_logic

	if logic.update then
		local l_data = self._logic_data
		l_data.t = t
		l_data.dt = dt
		slot8 = l_data

		logic.update(slot7)
	end

	return 
end
function CopBrain:set_update_enabled_state(state)
	slot7 = "brain"
	slot6 = state

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(slot6))

	return 
end
function CopBrain:set_spawn_ai(spawn_ai)
	self._spawn_ai = spawn_ai
	slot5 = true

	self.set_update_enabled_state(slot3, self)

	if spawn_ai.init_state then
		slot6 = spawn_ai.params

		self.set_logic(slot3, self, spawn_ai.init_state)
	end

	if spawn_ai.stance then
		slot4 = self._unit
		slot5 = spawn_ai.stance

		self._unit.movement(slot3).set_stance(slot3, self._unit.movement(slot3))
	end

	if spawn_ai.objective then
		slot5 = spawn_ai.objective

		self.set_objective(slot3, self)
	end

	return 
end
function CopBrain:set_spawn_entry(spawn_entry, tactics_map)
	self._logic_data.tactics = tactics_map
	self._logic_data.rank = spawn_entry.rank

	return 
end
function CopBrain:set_tactic(new_tactic_info)
	local old_tactic = self._logic_data.tactic
	self._logic_data.tactic = new_tactic_info

	if self._current_logic.on_new_tactic then
		slot6 = old_tactic

		self._current_logic.on_new_tactic(slot4, self._logic_data)
	end

	return 
end
function CopBrain:set_objective(new_objective)
	local old_objective = self._logic_data.objective
	self._logic_data.objective = new_objective

	if new_objective and new_objective.followup_objective and new_objective.followup_objective.interaction_voice then
		slot5 = self._unit
		slot7 = new_objective.followup_objective.interaction_voice

		self._unit.network(slot4).send(slot4, self._unit.network(slot4), "set_interaction_voice")
	elseif old_objective and old_objective.followup_objective and old_objective.followup_objective.interaction_voice then
		slot5 = self._unit
		slot7 = ""

		self._unit.network(slot4).send(slot4, self._unit.network(slot4), "set_interaction_voice")
	end

	slot6 = old_objective

	self._current_logic.on_new_objective(slot4, self._logic_data)

	return 
end
function CopBrain:set_followup_objective(followup_objective)
	local old_followup = self._logic_data.objective.followup_objective
	self._logic_data.objective.followup_objective = followup_objective

	if followup_objective and followup_objective.interaction_voice then
		slot5 = self._unit
		slot7 = followup_objective.interaction_voice

		self._unit.network(slot4).send(slot4, self._unit.network(slot4), "set_interaction_voice")
	elseif old_followup and old_followup.interaction_voice then
		slot5 = self._unit
		slot7 = ""

		self._unit.network(slot4).send(slot4, self._unit.network(slot4), "set_interaction_voice")
	end

	return 
end
function CopBrain:save(save_data)
	local my_save_data = {}

	if self._logic_data.objective and self._logic_data.objective.followup_objective and self._logic_data.objective.followup_objective.interaction_voice then
		my_save_data.interaction_voice = self._logic_data.objective.followup_objective.interaction_voice
	else
		my_save_data.interaction_voice = nil
	end

	if self._logic_data.internal_data.weapon_laser_on then
		my_save_data.weapon_laser_on = true
	end

	if self._logic_data.internal_data.weapon_laser_on then
		my_save_data.weapon_laser_on = true
	end

	if self._logic_data.name == "trade" and self._logic_data.internal_data.fleeing then
		my_save_data.trade_flee_contour = true
	end

	my_save_data.team_id = self._logic_data.team.id
	save_data.brain = my_save_data

	return 
end
function CopBrain:objective()
	return self._logic_data.objective
end
function CopBrain:is_hostage()
	return self._logic_data.internal_data and self._logic_data.internal_data.is_hostage
end
function CopBrain:is_available_for_assignment(objective)
	slot5 = objective

	return self._current_logic.is_available_for_assignment(slot3, self._logic_data)
end
function CopBrain:_reset_logic_data()
	slot4 = self._unit
	slot5 = self._unit
	slot4 = self._unit
	slot4 = self._unit
	slot5 = self._unit
	slot4 = self._unit
	slot4 = self._unit.movement(self._unit.base(self._unit.movement(self._unit.base(self._unit.movement(slot3))._tweak_table))._tweak_table)
	slot7 = managers.groupai
	slot6 = "on_objective_complete"
	slot7 = managers.groupai
	slot6 = "on_objective_failed"
	self._logic_data = {
		unit = self._unit,
		brain = self,
		active_searches = {},
		m_pos = self._unit.movement(slot3).m_pos(slot3),
		char_tweak = tweak_data.character[self._unit.base(self._unit.movement(slot3))._tweak_table],
		key = self._unit.key(self._unit.base(self._unit.movement(slot3))._tweak_table),
		pos_rsrv = {},
		pos_rsrv_id = self._unit.movement(self._unit.base(self._unit.movement(slot3))._tweak_table).pos_rsrv_id(self._unit.base(self._unit.movement(slot3))._tweak_table),
		SO_access = self._SO_access,
		SO_access_str = tweak_data.character[self._unit.base(self._unit.movement(self._unit.base(self._unit.movement(slot3))._tweak_table))._tweak_table].access,
		detected_attention_objects = {},
		attention_handler = self._attention_handler,
		visibility_slotmask = managers.slot.get_mask(self._unit.base(self._unit.movement(self._unit.base(self._unit.movement(slot3))._tweak_table))._tweak_table, managers.slot),
		enemy_slotmask = self._slotmask_enemies,
		cool = self._unit.movement(self._unit.base(self._unit.movement(self._unit.base(self._unit.movement(slot3))._tweak_table))._tweak_table).cool(self._unit.base(self._unit.movement(self._unit.base(self._unit.movement(slot3))._tweak_table))._tweak_table),
		objective_complete_clbk = callback(self._unit.base(self._unit.movement(self._unit.base(self._unit.movement(slot3))._tweak_table))._tweak_table, managers.groupai.state("AI_visibility"), managers.groupai.state(managers.groupai)),
		objective_failed_clbk = callback(self._unit.base(self._unit.movement(self._unit.base(self._unit.movement(slot3))._tweak_table))._tweak_table, managers.groupai.state(managers.groupai.state(managers.groupai)), managers.groupai.state(managers.groupai))
	}
	slot3 = Application

	if Application.production_build(callback(self._unit.base(self._unit.movement(self._unit.base(self._unit.movement(slot3))._tweak_table))._tweak_table, managers.groupai.state(managers.groupai.state(managers.groupai)), managers.groupai.state(managers.groupai))) then
		slot4 = self._unit
		self._logic_data.debug_name = self._unit.name(slot3)
	end

	return 
end
function CopBrain:set_init_logic(name, enter_params)
	local logic = self._logics[name]
	local l_data = self._logic_data
	slot7 = self._timer
	l_data.t = self._timer.time(slot6)
	slot7 = self._timer
	l_data.dt = self._timer.delta_time(slot6)
	l_data.name = name
	l_data.logic = logic
	self._current_logic = logic
	self._current_logic_name = name
	slot9 = enter_params

	logic.enter(slot6, l_data, name)

	return 
end
function CopBrain:set_logic(name, enter_params)
	local logic = self._logics[name]
	local l_data = self._logic_data
	slot7 = self._timer
	l_data.t = self._timer.time(slot6)
	slot7 = self._timer
	l_data.dt = self._timer.delta_time(slot6)
	slot9 = enter_params

	self._current_logic.exit(slot6, l_data, name)

	l_data.name = name
	l_data.logic = logic
	self._current_logic = logic
	self._current_logic_name = name
	slot9 = enter_params

	logic.enter(slot6, l_data, name)

	return 
end
function CopBrain:get_logic_by_name(name)
	return self._logics[name]
end
function CopBrain:search_for_path_to_unit(search_id, other_unit, access_neg)
	slot6 = other_unit
	local enemy_tracker = other_unit.movement(slot5).nav_tracker(slot5)
	slot7 = enemy_tracker
	local pos_to = enemy_tracker.field_position(other_unit.movement(slot5))
	local params = {}
	slot9 = self._unit
	slot9 = self._unit.movement(slot8)
	params.tracker_from = self._unit.movement(slot8).nav_tracker(slot8)
	params.tracker_to = enemy_tracker
	slot12 = search_id
	params.result_clbk = callback(slot8, self, self, "clbk_pathing_results")
	params.id = search_id
	params.access_pos = self._SO_access
	params.access_neg = access_neg
	self._logic_data.active_searches[search_id] = true
	slot10 = params

	managers.navigation.search_pos_to_pos(true, managers.navigation)

	return true
end
function CopBrain:search_for_path(search_id, to_pos, prio, access_neg, nav_segs)
	local params = {}
	slot9 = self._unit
	slot9 = self._unit.movement(slot8)
	params.tracker_from = self._unit.movement(slot8).nav_tracker(slot8)
	params.pos_to = to_pos
	slot12 = search_id
	params.result_clbk = callback(slot8, self, self, "clbk_pathing_results")
	params.id = search_id
	params.prio = prio
	params.access_pos = self._SO_access
	params.access_neg = access_neg
	params.nav_segs = nav_segs
	self._logic_data.active_searches[search_id] = true
	slot10 = params

	managers.navigation.search_pos_to_pos(true, managers.navigation)

	return true
end
function CopBrain:search_for_path_from_pos(search_id, from_pos, to_pos, prio, access_neg, nav_segs)
	local params = {
		pos_from = from_pos,
		pos_to = to_pos
	}
	slot13 = search_id
	params.result_clbk = callback(slot9, self, self, "clbk_pathing_results")
	params.id = search_id
	params.prio = prio
	params.access_pos = self._SO_access
	params.access_neg = access_neg
	params.nav_segs = nav_segs
	self._logic_data.active_searches[search_id] = true
	slot11 = params

	managers.navigation.search_pos_to_pos(true, managers.navigation)

	return true
end
function CopBrain:search_for_path_to_cover(search_id, cover, offset_pos, access_neg)
	local params = {}
	slot8 = self._unit
	slot8 = self._unit.movement(slot7)
	params.tracker_from = self._unit.movement(slot7).nav_tracker(slot7)
	params.tracker_to = cover[NavigationManager.COVER_TRACKER]
	slot11 = search_id
	params.result_clbk = callback(slot7, self, self, "clbk_pathing_results")
	params.id = search_id
	params.access_pos = self._SO_access
	params.access_neg = access_neg
	self._logic_data.active_searches[search_id] = true
	slot9 = params

	managers.navigation.search_pos_to_pos(true, managers.navigation)

	return true
end
function CopBrain:search_for_coarse_path(search_id, to_seg, verify_clbk, access_neg)
	local params = {}
	slot8 = self._unit
	slot8 = self._unit.movement(slot7)
	params.from_tracker = self._unit.movement(slot7).nav_tracker(slot7)
	params.to_seg = to_seg
	params.access = {
		"walk"
	}
	params.id = search_id
	slot11 = search_id
	params.results_clbk = callback(slot7, self, self, "clbk_coarse_pathing_results")
	params.verify_clbk = verify_clbk
	params.access_pos = self._logic_data.char_tweak.access
	params.access_neg = access_neg
	self._logic_data.active_searches[search_id] = 2
	slot9 = params

	managers.navigation.search_coarse(2, managers.navigation)

	return true
end
function CopBrain:action_request(new_action_data)
	slot4 = self._unit
	slot5 = new_action_data

	return self._unit.movement(slot3).action_request(slot3, self._unit.movement(slot3))
end
function CopBrain:on_action_completed(action)
	slot5 = action

	self._current_logic.on_action_completed(slot3, self._logic_data)

	return 
end
function CopBrain:clbk_coarse_pathing_results(search_id, path)
	slot7 = path

	self._add_pathing_result(slot4, self, search_id)

	return 
end
function CopBrain:clbk_pathing_results(search_id, path)
	slot7 = path

	self._add_pathing_result(slot4, self, search_id)

	if path then
		local t = nil
		slot6 = path

		for i, nav_point in ipairs(slot5) do
			if not nav_point.x then
				slot11 = nav_point
				slot11 = nav_point.script_data(slot10).element

				if 0 < nav_point.script_data(slot10).element.nav_link_delay(slot10) then
					if not t then
						slot11 = TimerManager
						slot11 = TimerManager.game(slot10)
						t = TimerManager.game(slot10).time(slot10)
					end

					slot14 = nav_point
					slot14 = nav_point.script_data(slot13).element
					slot12 = t + nav_point.script_data(slot13).element.nav_link_delay(slot13)

					nav_point.set_delay_time(slot10, nav_point)
				end
			end
		end
	end

	return 
end
function CopBrain:_add_pathing_result(search_id, path)
	self._logic_data.active_searches[search_id] = nil
	self._logic_data.pathing_results = self._logic_data.pathing_results or {}
	self._logic_data.pathing_results[search_id] = path or "failed"

	return 
end
function CopBrain:cancel_all_pathing_searches()
	slot3 = self._logic_data.active_searches

	for search_id, search_type in pairs(slot2) do
		if search_type == 2 then
			slot9 = search_id

			managers.navigation.cancel_coarse_search(slot7, managers.navigation)
		else
			slot9 = search_id

			managers.navigation.cancel_pathing_search(slot7, managers.navigation)
		end
	end

	self._logic_data.active_searches = {}
	self._logic_data.pathing_results = nil

	return 
end
function CopBrain:abort_detailed_pathing(search_id)
	if self._logic_data.active_searches[search_id] then
		self._logic_data.active_searches[search_id] = nil
		slot5 = search_id

		managers.navigation.cancel_pathing_search(nil, managers.navigation)
	end

	return 
end
function CopBrain:clbk_damage(my_unit, damage_info)
	if damage_info.attacker_unit then
		slot6 = self._slotmask_enemies

		if damage_info.attacker_unit.in_slot(slot4, damage_info.attacker_unit) then
			slot6 = damage_info

			self._current_logic.damage_clbk(slot4, self._logic_data)
		end
	end

	return 
end
function CopBrain:clbk_death(my_unit, damage_info)
	slot6 = damage_info

	self._current_logic.death_clbk(slot4, self._logic_data)

	self.dead = true

	if self.logic_queued_key then
		self.logic_queued_key = nil
		slot6 = self.logic_queued_key

		managers.queued_tasks.unqueue(slot4, managers.queued_tasks)
	end

	slot6 = false

	self.set_active(slot4, self)

	if self._alert_listen_key then
		slot5 = managers.groupai
		slot6 = self._alert_listen_key

		managers.groupai.state(slot4).remove_alert_listener(slot4, managers.groupai.state(slot4))

		self._alert_listen_key = nil
	end

	slot5 = self

	self._chk_enable_bodybag_interaction(slot4)

	if self._following_hostage_contour_id then
		slot5 = self._unit
		slot7 = true

		self._unit.contour(slot4).remove_by_id(slot4, self._unit.contour(slot4), self._following_hostage_contour_id)

		self._following_hostage_contour_id = nil
	end

	return 
end
function CopBrain:is_active()
	return self._active
end
function CopBrain:set_active(state)
	self._active = state

	if state then
		slot5 = "idle"

		self.set_logic(slot3, self)
	elseif self._current_logic_name ~= "inactive" then
		if self._logic_data.is_converted then
			slot6 = nil

			self._attention_handler.override_attention(slot3, self._attention_handler, "enemy_team_cbt")
		end

		slot5 = "inactive"

		self.set_logic(slot3, self)
	end

	return 
end
function CopBrain:cancel_trade()
	if not self._active then
		return 
	end

	if self._logic_data.is_converted then
		local action_data = {
			body_part = 4,
			type = "stand"
		}
		slot5 = action_data

		self.action_request(slot3, self)

		slot5 = nil

		self.set_objective(slot3, self)

		slot5 = "idle"

		self.set_logic(slot3, self)
	else
		slot4 = "intimidated"

		self.set_logic(slot2, self)
	end

	return 
end
function CopBrain:interaction_voice()
	if self._logic_data.objective and self._logic_data.objective.followup_objective and self._logic_data.objective.followup_objective.trigger_on == "interact" and (not self._logic_data.objective or not self._logic_data.objective.nav_seg or not not self._logic_data.objective.in_place) then
		slot3 = self._unit

		if not self._unit.anim_data(slot2).unintimidateable then
			return self._logic_data.objective.followup_objective.interaction_voice
		end
	end

	return 
end
function CopBrain:on_intimidated(amount, aggressor_unit)
	slot5 = self
	local interaction_voice = self.interaction_voice(slot4)

	if interaction_voice then
		slot7 = self._logic_data.objective.followup_objective

		self.set_objective(slot5, self)

		return interaction_voice
	else
		slot8 = aggressor_unit

		self._current_logic.on_intimidated(slot5, self._logic_data, amount)
	end

	return 
end
function CopBrain:on_tied(aggressor_unit, not_tied)
	slot7 = not_tied

	return self._current_logic.on_tied(slot4, self._logic_data, aggressor_unit)
end
function CopBrain:on_trade(aggressor_unit)
	slot5 = aggressor_unit

	return self._current_logic.on_trade(slot3, self._logic_data)
end
function CopBrain:on_detected_enemy_destroyed(destroyed_unit)
	slot5 = destroyed_unit

	self._current_logic.on_detected_enemy_destroyed(slot3, self._logic_data)

	return 
end
function CopBrain:on_detected_attention_obj_modified(modified_u_key)
	slot5 = modified_u_key

	self._current_logic.on_detected_attention_obj_modified(slot3, self._logic_data)

	return 
end
function CopBrain:on_criminal_neutralized(criminal_key)
	slot5 = criminal_key

	self._current_logic.on_criminal_neutralized(slot3, self._logic_data)

	return 
end
function CopBrain:on_alert(alert_data)
	if alert_data[5] == self._unit then
		return 
	end

	slot5 = alert_data

	self._current_logic.on_alert(slot3, self._logic_data)

	return 
end
function CopBrain:filter_area_unsafe(nav_seg)
	slot4 = managers.groupai
	slot5 = nav_seg

	return not managers.groupai.state(slot3).is_nav_seg_safe(slot3, managers.groupai.state(slot3))
end
function CopBrain:on_area_safety(...)
	slot3 = self._logic_data

	self._current_logic.on_area_safety(slot2, ...)

	return 
end
function CopBrain:draw_reserved_positions()
	slot3 = self._logic_data

	self._current_logic.draw_reserved_positions(slot2)

	return 
end
function CopBrain:draw_reserved_covers()
	slot3 = self._logic_data

	self._current_logic.draw_reserved_covers(slot2)

	return 
end
function CopBrain:set_important(state)
	self._important = state
	self._logic_data.important = state
	slot4 = self._logic_data

	self._current_logic.on_importance(slot3)

	return 
end
function CopBrain:is_important()
	return self._important
end
function CopBrain:on_reload()
	slot5 = self._unit
	self._logic_data.char_tweak = tweak_data.character[self._unit.base(slot4)._tweak_table]
	self._logics = CopBrain._logic_variants[self._unit.base(self._unit.base(slot4)._tweak_table)._tweak_table]
	self._current_logic = self._logics[self._current_logic_name]
	slot5 = self._unit
	self._logic_data.char_tweak = tweak_data.character[self._unit.base(self._unit)._tweak_table]

	return 
end
function CopBrain:on_rescue_allowed_state(state)
	if self._current_logic.on_rescue_allowed_state then
		slot5 = state

		self._current_logic.on_rescue_allowed_state(slot3, self._logic_data)
	end

	return 
end
function CopBrain:on_objective_unit_destroyed(unit)
	slot5 = unit

	return self._current_logic.on_objective_unit_destroyed(slot3, self._logic_data)
end
function CopBrain:on_objective_unit_damaged(unit, damage_info)
	slot5 = unit

	if unit.character_damage(slot4).dead then
		slot5 = unit
		slot5 = unit.character_damage(slot4)

		if unit.character_damage(slot4).dead(slot4) then
			slot7 = damage_info.attacker_unit

			return self._current_logic.on_objective_unit_damaged(slot4, self._logic_data, unit)
		end
	end

	return 
end
function CopBrain:is_advancing()
	slot3 = self._logic_data

	return self._current_logic.is_advancing(slot2)
end
function CopBrain:anim_clbk(unit, ...)
	slot4 = self._logic_data

	self._current_logic.anim_clbk(slot3, ...)

	return 
end
function CopBrain:anim_clbk_dodge_cover_grenade(unit)
	slot5 = unit

	self._chk_use_cover_grenade(slot3, self)

	return 
end
function CopBrain:_chk_use_cover_grenade(unit)
	slot4 = Network

	if not Network.is_server(slot3) or not self._logic_data.char_tweak.dodge_with_grenade or not self._logic_data.attention_obj then
		return 
	end

	local check_f = self._logic_data.char_tweak.dodge_with_grenade.check
	slot5 = TimerManager
	slot5 = TimerManager.game(slot4)
	local t = TimerManager.game(slot4).time(slot4)

	if check_f and (not self._flashbang_cover_expire_t or self._next_cover_grenade_chk_t < t) then
		slot7 = self._nr_flashbang_covers_used or 0
		local result, next_t = check_f(slot5, t)
		self._next_cover_grenade_chk_t = next_t

		if not result then
			return 
		end
	end

	local grenade_was_used = nil

	if 1000 < self._logic_data.attention_obj.dis or not self._logic_data.char_tweak.dodge_with_grenade.flash then
		if self._logic_data.char_tweak.dodge_with_grenade.smoke then
			slot7 = managers.groupai
			slot7 = managers.groupai.state(slot6)

			if not managers.groupai.state(slot6).is_smoke_grenade_active(slot6) then
				local duration = self._logic_data.char_tweak.dodge_with_grenade.smoke.duration
				slot8 = managers.groupai
				slot12 = self._unit
				slot14 = duration[2]
				slot12 = false

				managers.groupai.state(slot7).detonate_smoke_grenade(slot7, managers.groupai.state(slot7), self._logic_data.m_pos + math.UP * 10, self._unit.movement(slot11).m_head_pos(slot11), math.lerp(self._unit.movement(slot11), duration[1], math.random()))

				grenade_was_used = true
			end
		end
	elseif self._logic_data.char_tweak.dodge_with_grenade.flash then
		local duration = self._logic_data.char_tweak.dodge_with_grenade.flash.duration
		slot8 = managers.groupai
		slot12 = self._unit
		slot14 = duration[2]
		slot12 = true

		managers.groupai.state(slot7).detonate_smoke_grenade(slot7, managers.groupai.state(slot7), self._logic_data.m_pos + math.UP * 10, self._unit.movement(slot11).m_head_pos(slot11), math.lerp(self._unit.movement(slot11), duration[1], math.random()))

		grenade_was_used = true
	end

	if grenade_was_used then
		self._nr_flashbang_covers_used = (self._nr_flashbang_covers_used or 0) + 1
	end

	return 
end
function CopBrain:on_nav_link_unregistered(element_id)
	if self._logic_data.pathing_results then
		local failed_search_ids = nil
		slot5 = self._logic_data.pathing_results

		for path_name, path in pairs(slot4) do
			slot10 = path

			if type(slot9) == "table" and path[1] then
				slot10 = path[1]

				if type(slot9) ~= "table" then
					slot10 = path

					for i, nav_point in ipairs(slot9) do
						if not nav_point.x then
							slot15 = nav_point

							if nav_point.script_data(slot14).element._id == element_id then
								failed_search_ids = failed_search_ids or {}
								failed_search_ids[path_name] = true

								break
							end
						end
					end
				end
			end
		end

		if failed_search_ids then
			slot5 = failed_search_ids

			for search_id, _ in pairs(slot4) do
				self._logic_data.pathing_results[search_id] = "failed"
			end
		end
	end

	if self._current_logic._get_all_paths then
		slot4 = self._logic_data
		local paths = self._current_logic._get_all_paths(slot3)
	end

	if not paths then
		return 
	end

	local verified_paths = {}
	slot6 = paths

	for path_name, path in pairs(slot5) do
		local path_is_ok = true
		slot12 = path

		for i, nav_point in ipairs(slot11) do
			if not nav_point.x then
				slot17 = nav_point

				if nav_point.script_data(slot16).element._id == element_id then
					path_is_ok = false

					break
				end
			end
		end

		if path_is_ok then
			verified_paths[path_name] = path
		end
	end

	slot7 = verified_paths

	self._current_logic._set_verified_paths(slot5, self._logic_data)

	return 
end
function CopBrain:SO_access()
	return self._SO_access
end
function CopBrain:_setup_attention_handler()
	slot4 = self._unit
	self._attention_handler = CharacterAttentionObject.new(slot2, CharacterAttentionObject)

	return 
end
function CopBrain:attention_handler()
	return self._attention_handler
end
function CopBrain:set_attention_settings(params)
	local att_settings = nil

	if params then
		if params.peaceful then
			att_settings = {
				"enemy_team_idle"
			}
		elseif params.cbt then
			slot5 = managers.groupai
			slot5 = managers.groupai.state(slot4)

			if managers.groupai.state(slot4).enemy_weapons_hot(slot4) then
				att_settings = {
					"enemy_team_cbt"
				}
			else
				att_settings = {
					"enemy_team_cbt",
					"enemy_enemy_cbt",
					"enemy_civ_cbt"
				}
			end
		elseif params.corpse_cbt then
			att_settings = {
				"enemy_combatant_corpse_cbt"
			}
		elseif params.corpse_sneak then
			att_settings = {
				"enemy_law_corpse_sneak",
				"enemy_team_corpse_sneak",
				"enemy_civ_cbt"
			}
		end
	end

	slot6 = att_settings

	PlayerMovement.set_attention_settings(slot4, self)

	return 
end
function CopBrain:_create_attention_setting_from_descriptor(setting_desc, setting_name)
	slot7 = setting_name

	return PlayerMovement._create_attention_setting_from_descriptor(slot4, self, setting_desc)
end
function CopBrain:clbk_attention_notice_corpse(observer_unit, status)
	return 
end
function CopBrain:on_cool_state_changed(state)
	if self._logic_data then
		self._logic_data.cool = state
	end

	if self._alert_listen_key then
		slot4 = managers.groupai
		slot5 = self._alert_listen_key

		managers.groupai.state(slot3).remove_alert_listener(slot3, managers.groupai.state(slot3))
	else
		slot7 = self._unit
		self._alert_listen_key = "CopBrain" .. tostring(self._unit.key(slot6))
	end

	local alert_listen_filter, alert_types = nil

	if state then
		slot6 = managers.groupai
		slot7 = "criminals_enemies_civilians"
		alert_listen_filter = managers.groupai.state(slot5).get_unit_type_filter(slot5, managers.groupai.state(slot5))
		alert_types = {
			vo_distress = true,
			fire = true,
			bullet = true,
			vo_intimidate = true,
			explosion = true,
			footstep = true,
			aggression = true,
			vo_cbt = true
		}

		if self._logic_data and self._logic_data.internal_data.vision_cool then
			self._logic_data.internal_data.vision = self._logic_data.internal_data.vision_cool
		end
	else
		slot6 = managers.groupai
		slot7 = "criminal"
		alert_listen_filter = managers.groupai.state(slot5).get_unit_type_filter(slot5, managers.groupai.state(slot5))
		alert_types = {
			explosion = true,
			fire = true,
			aggression = true,
			bullet = true
		}

		if self._logic_data then
			slot6 = self

			self.terminate_all_suspicion(slot5)

			if self._logic_data.internal_data.vision_not_cool then
				self._logic_data.internal_data.vision = self._logic_data.internal_data.vision_not_cool
			end
		end
	end

	slot6 = managers.groupai
	slot10 = alert_types
	slot13 = self._unit
	slot13 = self._unit.movement("on_alert")

	managers.groupai.state(slot5).add_alert_listener(slot5, managers.groupai.state(slot5), self._alert_listen_key, callback(slot9, self, self), alert_listen_filter, self._unit.movement("on_alert").m_head_pos("on_alert"))

	return 
end
function CopBrain:on_suppressed(state)
	self._logic_data.is_suppressed = state or nil

	if self._current_logic.on_suppressed_state then
		slot4 = self._logic_data

		self._current_logic.on_suppressed_state(slot3)

		if self._logic_data.char_tweak.chatter.suppress then
			slot4 = self._unit
			slot6 = true

			self._unit.sound(slot3).say(slot3, self._unit.sound(slot3), "help")
		end
	end

	return 
end
function CopBrain:attention_objects()
	if self._logic_data.attention_obj then
		slot3 = "attention_obj"

		print(slot2)

		slot5 = self._logic_data.attention_obj

		print(inspect(slot4))
	end

	slot3 = self._logic_data.detected_attention_objects

	for u_key, attention_data in pairs(slot2) do
		if self._logic_data.attention_obj ~= attention_data then
			slot10 = attention_data

			print(inspect(slot9))
		end
	end

	return 
end
function CopBrain:clbk_enemy_weapons_hot()
	slot3 = managers.groupai
	slot4 = self._enemy_weapons_hot_listen_id

	managers.groupai.state(slot2).remove_listener(slot2, managers.groupai.state(slot2))

	self._enemy_weapons_hot_listen_id = nil
	slot3 = self

	self.end_alarm_pager(slot2)

	if self._logic_data.logic.on_enemy_weapons_hot then
		slot3 = self._logic_data

		self._logic_data.logic.on_enemy_weapons_hot(slot2)
	end

	return 
end
function CopBrain:set_group(group)
	self._logic_data.group = group

	return 
end
function CopBrain:on_team_set(team_data)
	self._logic_data.team = team_data
	slot5 = team_data

	self._attention_handler.set_team(slot3, self._attention_handler)

	return 
end
function CopBrain:on_new_group_objective(objective)
	if self._current_logic.on_new_group_objective then
		slot5 = objective

		self._current_logic.on_new_group_objective(slot3, self._logic_data)
	end

	return 
end
function CopBrain:clbk_group_member_attention_identified(member_unit, attention_u_key)
	slot6 = attention_u_key

	self._current_logic.identify_attention_obj_instant(slot4, self._logic_data)

	return 
end
function CopBrain:convert_to_criminal(mastermind_criminal)
	self._logic_data.is_converted = true
	self._logic_data.group = nil
	slot5 = "mover_blocker"
	local mover_col_body = self._unit.body(nil, self._unit)
	slot6 = false

	mover_col_body.set_enabled(self._unit, mover_col_body)

	slot7 = "team_enemy_cbt"
	local attention_preset = PlayerMovement._create_attention_setting_from_descriptor(self._unit, self, tweak_data.attention.settings.team_enemy_cbt)
	slot8 = attention_preset

	self._attention_handler.override_attention(self, self._attention_handler, "enemy_team_cbt")

	local health_multiplier = 1
	local damage_multiplier = 1
	slot8 = mastermind_criminal

	if alive("enemy_team_cbt") then
		slot8 = mastermind_criminal
		slot10 = "convert_enemies_health_multiplier"
		health_multiplier = health_multiplier * (mastermind_criminal.base(slot7).upgrade_value(slot7, mastermind_criminal.base(slot7), "player") or 1)
		slot8 = mastermind_criminal
		slot10 = "passive_convert_enemies_health_multiplier"
		health_multiplier = health_multiplier * (mastermind_criminal.base(slot7).upgrade_value(slot7, mastermind_criminal.base(slot7), "player") or 1)
		slot8 = mastermind_criminal
		slot10 = "convert_enemies_damage_multiplier"
		damage_multiplier = damage_multiplier * (mastermind_criminal.base(slot7).upgrade_value(slot7, mastermind_criminal.base(slot7), "player") or 1)
		slot8 = mastermind_criminal
		slot10 = "passive_convert_enemies_damage_multiplier"
		damage_multiplier = damage_multiplier * (mastermind_criminal.base(slot7).upgrade_value(slot7, mastermind_criminal.base(slot7), "player") or 1)
	else
		slot11 = 1
		health_multiplier = health_multiplier * managers.player.upgrade_value(slot7, managers.player, "player", "convert_enemies_health_multiplier")
		slot11 = 1
		health_multiplier = health_multiplier * managers.player.upgrade_value(slot7, managers.player, "player", "passive_convert_enemies_health_multiplier")
		slot11 = 1
		damage_multiplier = damage_multiplier * managers.player.upgrade_value(slot7, managers.player, "player", "convert_enemies_damage_multiplier")
		slot11 = 1
		damage_multiplier = damage_multiplier * managers.player.upgrade_value(slot7, managers.player, "player", "passive_convert_enemies_damage_multiplier")
	end

	slot8 = self._unit
	slot9 = health_multiplier

	self._unit.character_damage(slot7).convert_to_criminal(slot7, self._unit.character_damage(slot7))

	self._logic_data.attention_obj = nil
	slot8 = self._logic_data

	CopLogicBase._destroy_all_detected_attention_object_data(nil)

	slot9 = tweak_data.character.russian.access
	self._SO_access = managers.navigation.convert_access_flag(nil, managers.navigation)
	self._logic_data.SO_access = self._SO_access
	self._logic_data.SO_access_str = tweak_data.character.russian.access
	slot9 = "enemies"
	self._slotmask_enemies = managers.slot.get_mask(tweak_data.character.russian.access, managers.slot)
	self._logic_data.enemy_slotmask = self._slotmask_enemies
	slot8 = self._unit
	slot8 = self._unit.inventory(self._slotmask_enemies)
	local equipped_w_selection = self._unit.inventory(self._slotmask_enemies).equipped_selection(self._slotmask_enemies)

	if equipped_w_selection then
		slot9 = self._unit
		slot11 = true

		self._unit.inventory(slot8).remove_selection(slot8, self._unit.inventory(slot8), equipped_w_selection)
	end

	slot9 = self._unit
	local weap_name = self._unit.base(slot8).default_weapon_name(slot8)
	slot12 = self._unit
	slot12 = true

	TeamAIInventory.add_unit_by_name(self._unit.base(slot8), self._unit.inventory(slot11), weap_name)

	slot10 = self._unit
	local weapon_unit = self._unit.inventory(self._unit.base(slot8)).equipped_unit(self._unit.base(slot8))
	slot11 = weapon_unit
	slot12 = damage_multiplier

	weapon_unit.base(self._unit.inventory(self._unit.base(slot8))).add_damage_multiplier(self._unit.inventory(self._unit.base(slot8)), weapon_unit.base(self._unit.inventory(self._unit.base(slot8))))

	slot12 = nil

	self.set_objective(self._unit.inventory(self._unit.base(slot8)), self)
	self.set_logic(self._unit.inventory(self._unit.base(slot8)), self, "idle")

	slot15 = managers.groupai
	slot14 = "on_criminal_objective_complete"
	self._logic_data.objective_complete_clbk = callback(self, managers.groupai.state(nil), managers.groupai.state(managers.groupai))
	slot15 = managers.groupai
	slot14 = "on_criminal_objective_failed"
	slot10 = callback(self, managers.groupai.state(managers.groupai.state(managers.groupai)), managers.groupai.state(managers.groupai))
	self._logic_data.objective_failed_clbk = slot10
	slot11 = managers.groupai
	slot12 = self._unit

	managers.groupai.state(slot10).on_criminal_jobless(slot10, managers.groupai.state(slot10))

	slot11 = self._unit
	slot13 = 16

	self._unit.base(slot10).set_slot(slot10, self._unit.base(slot10), self._unit)

	slot11 = self._unit
	slot12 = "hos"

	self._unit.movement(slot10).set_stance(slot10, self._unit.movement(slot10))

	local action_data = {
		clamp_to_graph = true,
		type = "act",
		body_part = 1,
		variant = "attached_collar_enter",
		blocks = {
			heavy_hurt = -1,
			hurt = -1,
			action = -1,
			light_hurt = -1,
			walk = -1
		}
	}
	slot12 = self._unit
	slot13 = action_data

	self._unit.brain(self._unit.movement(slot10)).action_request(self._unit.movement(slot10), self._unit.brain(self._unit.movement(slot10)))

	slot12 = self._unit
	slot15 = nil

	self._unit.sound(self._unit.movement(slot10)).say(self._unit.movement(slot10), self._unit.sound(self._unit.movement(slot10)), "cn1", true)

	return 
end
function CopBrain:on_surrender_chance()
	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	local t = TimerManager.game(slot2).time(slot2)

	if self._logic_data.surrender_window then
		self._logic_data.surrender_window.expire_t = t + self._logic_data.surrender_window.timeout_duration
		slot6 = self._logic_data.surrender_window.expire_t

		managers.enemy.reschedule_delayed_clbk(t + self._logic_data.surrender_window.timeout_duration, managers.enemy, self._logic_data.surrender_window.expire_clbk_id)

		slot6 = 0.93
		self._logic_data.surrender_window.chance_mul = math.pow(managers.enemy, self._logic_data.surrender_window.chance_mul)

		return 
	end

	local window_duration = 5 + 4 * math.random()
	local timeout_duration = 5 + 5 * math.random()
	slot11 = self._unit
	self._logic_data.surrender_window = {
		chance_mul = 0.05,
		expire_clbk_id = "CopBrain_sur_op" .. tostring(self._unit.key(slot10)),
		window_expire_t = t + window_duration,
		expire_t = t + window_duration + timeout_duration,
		window_duration = window_duration,
		timeout_duration = timeout_duration
	}
	slot12 = "clbk_surrender_chance_expired"
	slot9 = self._logic_data.surrender_window.expire_t

	managers.enemy.add_delayed_clbk(, managers.enemy, self._logic_data.surrender_window.expire_clbk_id, callback(self._unit.key, self, self))

	return 
end
function CopBrain:terminate_all_suspicion()
	slot3 = self._logic_data.detected_attention_objects

	for u_key, u_data in pairs(slot2) do
		if u_data.uncover_progress then
			u_data.uncover_progress = nil
			u_data.last_suspicion_t = nil
			slot8 = u_data.unit
			slot10 = false

			u_data.unit.movement(slot7).on_suspicion(slot7, u_data.unit.movement(slot7), self._unit)
		end
	end

	return 
end
function CopBrain:clbk_surrender_chance_expired()
	self._logic_data.surrender_window = nil

	return 
end
function CopBrain:add_pos_rsrv(rsrv_name, pos_rsrv)
	local pos_reservations = self._logic_data.pos_rsrv

	if pos_reservations[rsrv_name] then
		slot7 = pos_reservations[rsrv_name]

		managers.navigation.unreserve_pos(slot5, managers.navigation)
	end

	pos_rsrv.filter = self._logic_data.pos_rsrv_id
	slot7 = pos_rsrv

	managers.navigation.add_pos_reservation(slot5, managers.navigation)

	pos_reservations[rsrv_name] = pos_rsrv

	if not pos_rsrv.id then
		slot7 = "[CopBrain:add_pos_rsrv] missing id"
		slot10 = pos_rsrv

		debug_pause_unit(slot5, self._unit, inspect(slot9))

		return 
	end

	return 
end
function CopBrain:set_pos_rsrv(rsrv_name, pos_rsrv)
	local pos_reservations = self._logic_data.pos_rsrv

	if pos_reservations[rsrv_name] == pos_rsrv then
		return 
	end

	if pos_reservations[rsrv_name] then
		slot7 = pos_reservations[rsrv_name]

		managers.navigation.unreserve_pos(slot5, managers.navigation)
	end

	if not pos_rsrv.id then
		slot7 = "[CopBrain:set_pos_rsrv] missing id"
		slot10 = pos_rsrv

		debug_pause_unit(slot5, self._unit, inspect(slot9))

		return 
	end

	pos_reservations[rsrv_name] = pos_rsrv

	return 
end
function CopBrain:rem_pos_rsrv(rsrv_name)
	local pos_reservations = self._logic_data.pos_rsrv

	if not pos_reservations[rsrv_name] then
		return 
	end

	if not pos_reservations[rsrv_name].id then
		slot6 = "[CopBrain:rem_pos_rsrv] missing id"
		slot9 = pos_reservations[rsrv_name]

		debug_pause_unit(slot4, self._unit, inspect(slot8))

		return 
	end

	slot6 = pos_reservations[rsrv_name]

	managers.navigation.unreserve_pos(slot4, managers.navigation)

	pos_reservations[rsrv_name] = nil

	return 
end
function CopBrain:get_pos_rsrv(rsrv_name)
	return self._logic_data.pos_rsrv[rsrv_name]
end
function CopBrain:rem_all_pos_rsrv()
	slot3 = self._logic_data.pos_rsrv

	for rsrv_name, pos_rsrv in pairs(slot2) do
		slot9 = pos_rsrv

		managers.navigation.unreserve_pos(slot7, managers.navigation)
	end

	self._logic_data.pos_rsrv = {}

	return 
end
function CopBrain:begin_alarm_pager(reset)
	if not reset and self._alarm_pager_has_run then
		return 
	end

	self._alarm_pager_has_run = true
	self._alarm_pager_data = {}
	slot6 = tweak_data.player.alarm_pager.nr_of_calls[2]
	self._alarm_pager_data.total_nr_calls = math.random(slot4, tweak_data.player.alarm_pager.nr_of_calls[1])
	self._alarm_pager_data.nr_calls_made = 0
	slot5 = tweak_data.player.alarm_pager.first_call_delay[2]
	local call_delay = math.lerp(0, tweak_data.player.alarm_pager.first_call_delay[1], math.random())
	slot9 = self._unit
	self._alarm_pager_data.pager_clbk_id = "pager" .. tostring(self._unit.key(slot8))
	slot11 = "clbk_alarm_pager"
	slot10 = TimerManager
	slot10 = TimerManager.game(self)
	slot8 = TimerManager.game(self).time(self) + call_delay

	managers.enemy.add_delayed_clbk("pager" .. tostring(self._unit.key(slot8)), managers.enemy, self._alarm_pager_data.pager_clbk_id, callback(slot8, self, self))

	return 
end
function CopBrain:is_pager_started()
	return (self._alarm_pager_data and true) or nil
end
function CopBrain:end_alarm_pager()
	if not self._alarm_pager_data then
		return 
	end

	if self._alarm_pager_data.pager_clbk_id then
		slot4 = self._alarm_pager_data.pager_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)
	end

	self._alarm_pager_data = nil

	return 
end
function CopBrain:on_alarm_pager_interaction(status, player)
	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)

	if not managers.groupai.state(slot4).whisper_mode(slot4) then
		return 
	end

	slot5 = self._unit
	slot5 = self._unit.character_damage(slot4)
	local is_dead = self._unit.character_damage(slot4).dead(slot4)
	local pager_data = self._alarm_pager_data

	if not pager_data then
		return 
	end

	if status == "started" then
		slot7 = self._unit
		slot7 = self._unit.sound(slot6)

		self._unit.sound(slot6).stop(slot6)

		slot7 = self._unit
		slot9 = true

		self._unit.interaction(slot6).set_outline_flash_state(slot6, self._unit.interaction(slot6), nil)

		if pager_data.pager_clbk_id then
			slot8 = pager_data.pager_clbk_id

			managers.enemy.remove_delayed_clbk(slot6, managers.enemy)

			pager_data.pager_clbk_id = nil
		end
	elseif status == "complete" then
		slot7 = managers.groupai
		slot7 = managers.groupai.state(slot6)
		local nr_previous_bluffs = managers.groupai.state(slot6).get_nr_successful_alarm_pager_bluffs(slot6)
		local has_upgrade = nil
		slot9 = player

		if player.base(slot8).is_local_player then
			slot11 = "corpse_alarm_pager_bluff"
			has_upgrade = managers.player.has_category_upgrade(slot8, managers.player, "player")
		else
			slot9 = player
			slot11 = "corpse_alarm_pager_bluff"
			has_upgrade = player.base(slot8).upgrade_value(slot8, player.base(slot8), "player")
		end

		local chance_table = tweak_data.player.alarm_pager[(has_upgrade and "bluff_success_chance_w_skill") or "bluff_success_chance"]
		slot11 = #chance_table
		local chance_index = math.min(slot9, nr_previous_bluffs + 1)
		slot12 = #chance_table
		local is_last = chance_table[math.min(nr_previous_bluffs + 1, chance_index + 1)] == 0
		local rand_nr = math.random()
		local success = 0 < chance_table[chance_index] and rand_nr < chance_table[chance_index]
		slot14 = self._unit
		slot14 = self._unit.sound(slot13)

		self._unit.sound(slot13).stop(slot13)

		if success then
			slot14 = managers.groupai
			slot14 = managers.groupai.state(slot13)

			managers.groupai.state(slot13).on_successful_alarm_pager_bluff(slot13)

			local cue_index = (is_last and 4) or 1

			if is_dead then
				slot15 = self._unit
				slot19 = cue_index
				slot18 = true

				self._unit.sound(slot14).corpse_play(slot14, self._unit.sound(slot14), "dsp_radio_fooled_" .. tostring(slot18), nil)
			else
				slot15 = self._unit
				slot19 = cue_index
				slot18 = true

				self._unit.sound(slot14).play(slot14, self._unit.sound(slot14), "dsp_radio_fooled_" .. tostring(slot18), nil)
			end

			if is_last then
			end
		else
			slot14 = managers.groupai
			slot15 = "alarm_pager_bluff_failed"

			managers.groupai.state(slot13).on_police_called(slot13, managers.groupai.state(slot13))

			slot14 = self._unit
			slot16 = true

			self._unit.interaction(slot13).set_active(slot13, self._unit.interaction(slot13), false)

			if is_dead then
				slot14 = self._unit
				slot17 = true

				self._unit.sound(slot13).corpse_play(slot13, self._unit.sound(slot13), "dsp_radio_alarm_1", nil)
			else
				slot14 = self._unit
				slot17 = true

				self._unit.sound(slot13).play(slot13, self._unit.sound(slot13), "dsp_radio_alarm_1", nil)
			end
		end

		slot14 = self

		self.end_alarm_pager(slot13)

		slot14 = self

		if not self._chk_enable_bodybag_interaction(slot13) then
			slot14 = self._unit
			slot16 = true

			self._unit.interaction(slot13).set_active(slot13, self._unit.interaction(slot13), false)
		end
	elseif status == "interrupted" then
		slot7 = managers.groupai
		slot8 = "alarm_pager_hang_up"

		managers.groupai.state(slot6).on_police_called(slot6, managers.groupai.state(slot6))

		slot7 = self._unit
		slot9 = true

		self._unit.interaction(slot6).set_active(slot6, self._unit.interaction(slot6), false)

		slot7 = self._unit
		slot7 = self._unit.sound(slot6)

		self._unit.sound(slot6).stop(slot6)

		if is_dead then
			slot7 = self._unit
			slot10 = true

			self._unit.sound(slot6).corpse_play(slot6, self._unit.sound(slot6), "dsp_radio_alarm_1", nil)
		else
			slot7 = self._unit
			slot10 = true

			self._unit.sound(slot6).play(slot6, self._unit.sound(slot6), "dsp_radio_alarm_1", nil)
		end

		slot7 = self

		self.end_alarm_pager(slot6)
	end

	return 
end
function CopBrain:clbk_alarm_pager(ignore_this, data)
	local pager_data = self._alarm_pager_data
	local clbk_id = pager_data.pager_clbk_id
	pager_data.pager_clbk_id = nil
	slot7 = managers.groupai
	slot7 = managers.groupai.state(slot6)

	if not managers.groupai.state(slot6).whisper_mode(slot6) then
		slot7 = self

		self.end_alarm_pager(slot6)

		return 
	end

	if pager_data.nr_calls_made == 0 then
		slot7 = managers.groupai
		slot8 = "pager"

		if managers.groupai.state(slot6).is_ecm_jammer_active(slot6, managers.groupai.state(slot6)) then
			slot7 = self

			self.end_alarm_pager(slot6)

			slot8 = true

			self.begin_alarm_pager(slot6, self)

			return 
		end

		slot7 = self._unit
		slot7 = self._unit.sound(slot6)

		self._unit.sound(slot6).stop(slot6)

		slot7 = self._unit
		slot7 = self._unit.character_damage(slot6)

		if self._unit.character_damage(slot6).dead(slot6) then
			slot7 = self._unit
			slot10 = true

			self._unit.sound(slot6).corpse_play(slot6, self._unit.sound(slot6), "dsp_radio_query_1", nil)
		else
			slot7 = self._unit
			slot10 = true

			self._unit.sound(slot6).play(slot6, self._unit.sound(slot6), "dsp_radio_query_1", nil)
		end

		slot7 = self._unit
		slot8 = "corpse_alarm_pager"

		self._unit.interaction(slot6).set_tweak_data(slot6, self._unit.interaction(slot6))

		slot7 = self._unit
		slot9 = true

		self._unit.interaction(slot6).set_active(slot6, self._unit.interaction(slot6), true)
	elseif pager_data.nr_calls_made < pager_data.total_nr_calls then
		slot7 = self._unit
		slot7 = self._unit.sound(slot6)

		self._unit.sound(slot6).stop(slot6)

		slot7 = self._unit
		slot7 = self._unit.character_damage(slot6)

		if self._unit.character_damage(slot6).dead(slot6) then
			slot7 = self._unit
			slot10 = true

			self._unit.sound(slot6).corpse_play(slot6, self._unit.sound(slot6), "dsp_radio_reminder_1", nil)
		else
			slot7 = self._unit
			slot10 = true

			self._unit.sound(slot6).play(slot6, self._unit.sound(slot6), "dsp_radio_reminder_1", nil)
		end
	elseif pager_data.nr_calls_made == pager_data.total_nr_calls then
		slot7 = self._unit
		slot9 = true

		self._unit.interaction(slot6).set_active(slot6, self._unit.interaction(slot6), false)

		slot7 = managers.groupai
		slot8 = "alarm_pager_not_answered"

		managers.groupai.state(slot6).on_police_called(slot6, managers.groupai.state(slot6))

		slot7 = self._unit
		slot7 = self._unit.sound(slot6)

		self._unit.sound(slot6).stop(slot6)

		slot7 = self._unit
		slot7 = self._unit.character_damage(slot6)

		if self._unit.character_damage(slot6).dead(slot6) then
			slot7 = self._unit
			slot10 = true

			self._unit.sound(slot6).corpse_play(slot6, self._unit.sound(slot6), "pln_alm_any_any", nil)
		else
			slot7 = self._unit
			slot10 = true

			self._unit.sound(slot6).play(slot6, self._unit.sound(slot6), "pln_alm_any_any", nil)
		end

		slot7 = self

		self.end_alarm_pager(slot6)
	end

	if pager_data.nr_calls_made == pager_data.total_nr_calls - 1 then
		slot7 = self._unit
		slot9 = true

		self._unit.interaction(slot6).set_outline_flash_state(slot6, self._unit.interaction(slot6), true)
	end

	pager_data.nr_calls_made = pager_data.nr_calls_made + 1

	if pager_data.nr_calls_made <= pager_data.total_nr_calls then
		slot9 = pager_data.nr_calls_made
		local duration_settings = tweak_data.player.alarm_pager.call_duration[math.min(slot7, #tweak_data.player.alarm_pager.call_duration)]
		slot9 = duration_settings[2]
		local call_delay = math.lerp(slot7, duration_settings[1], math.random())
		self._alarm_pager_data.pager_clbk_id = clbk_id
		slot15 = "clbk_alarm_pager"
		slot14 = TimerManager
		slot14 = TimerManager.game(self)
		slot12 = TimerManager.game(self).time(self) + call_delay

		managers.enemy.add_delayed_clbk(duration_settings[1], managers.enemy, self._alarm_pager_data.pager_clbk_id, callback(slot12, self, self))
	end

	return 
end
function CopBrain:_chk_enable_bodybag_interaction()
	slot3 = self._unit
	slot4 = "corpse_dispose"

	self._unit.interaction(slot2).set_tweak_data(slot2, self._unit.interaction(slot2))

	slot3 = self._unit
	slot5 = true

	self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), true)

	return true
end
function CopBrain:on_police_call_success(unit)
	if self._logic_data.logic.on_police_call_success then
		slot4 = self._logic_data

		self._logic_data.logic.on_police_call_success(slot3)
	end

	return 
end
function CopBrain:stealth_action_allowed()
	return not self._flagged_looking and not self._SO_id
end
function CopBrain:_switch_to_cbt()
	self._switch_to_cbt_called = false
	slot3 = self._unit

	if alive(slot2) then
		slot3 = self._unit
		slot6 = false

		self._unit.movement(slot2).set_stance(slot2, self._unit.movement(slot2), "cbt", false)
	end

	return 
end
function CopBrain:pre_destroy(unit)
	slot5 = false

	self.set_active(slot3, self)
	self.cancel_all_pathing_searches(slot3)

	slot5 = unit
	slot3 = unit.key(self)
	self._reload_clbks[slot3] = nil
	slot5 = nil

	self._attention_handler.set_attention(slot3, self._attention_handler)

	slot4 = self._unit
	slot5 = nil

	self._unit.movement(slot3).set_attention(slot3, self._unit.movement(slot3))

	slot4 = self

	self.rem_all_pos_rsrv(slot3)

	slot4 = self

	self.end_alarm_pager(slot3)

	if self._current_logic.pre_destroy then
		slot4 = self._logic_data

		self._current_logic.pre_destroy(slot3)
	end

	if self._alert_listen_key then
		slot4 = managers.groupai
		slot5 = self._alert_listen_key

		managers.groupai.state(slot3).remove_alert_listener(slot3, managers.groupai.state(slot3))

		self._alert_listen_key = nil
	end

	if self._enemy_weapons_hot_listen_id then
		slot4 = managers.groupai
		slot5 = self._enemy_weapons_hot_listen_id

		managers.groupai.state(slot3).remove_listener(slot3, managers.groupai.state(slot3))

		self._enemy_weapons_hot_listen_id = nil
	end

	if self._logic_data.surrender_window then
		slot5 = self._logic_data.surrender_window.expire_clbk_id

		managers.enemy.remove_delayed_clbk(slot3, managers.enemy)

		self._logic_data.surrender_window = nil
	end

	return 
end

if reload then
	slot5 = CopBrain._reload_clbks

	for k, clbk in pairs(slot4) do
		clbk()
	end
end

return 
