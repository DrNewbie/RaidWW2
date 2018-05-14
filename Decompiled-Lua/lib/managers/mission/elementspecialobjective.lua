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
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSpecialObjective then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSpecialObjective = slot0
ElementSpecialObjective._AI_GROUPS = {
	"enemies",
	"friendlies",
	"civilians",
	"bank_manager_old_man",
	"escort_guy_1",
	"escort_guy_2",
	"escort_guy_3",
	"escort_guy_4",
	"escort_guy_5",
	"chavez"
}
ElementSpecialObjective._PATHING_STYLES = {
	"destination",
	"precise",
	"coarse",
	"warp"
}
ElementSpecialObjective._ATTITUDES = {
	"avoid",
	"engage"
}
ElementSpecialObjective._TRIGGER_ON = {
	"interact"
}
ElementSpecialObjective._INTERACTION_VOICES = {
	"default",
	"cuff_cop",
	"down_cop",
	"stop_cop",
	"escort_keep",
	"escort_go",
	"escort",
	"stop",
	"down_stay",
	"down",
	"bridge_codeword",
	"bridge_chair",
	"undercover_interrogate"
}
ElementSpecialObjective._STANCES = {
	"ntl",
	"hos",
	"cbt"
}
ElementSpecialObjective._POSES = {
	"crouch",
	"stand"
}
ElementSpecialObjective._HASTES = {
	"walk",
	"run"
}
ElementSpecialObjective._DEFAULT_VALUES = {
	interval = -1,
	action_duration_min = 0,
	ai_group = 1,
	action_duration_max = 0,
	interaction_voice = 1,
	base_chance = 1,
	chance_inc = 0,
	interrupt_dmg = 0,
	interrupt_dis = -1,
	path_style = 1
}
function ElementSpecialObjective:init(...)
	slot3 = self

	ElementSpecialObjective.super.init(slot2, ...)

	slot4 = self._values

	self._finalize_values(slot2, self)

	slot3 = self._values
	self._values = clone(slot2)

	return 
end
function ElementSpecialObjective:_finalize_values(values)
	slot5 = "so_action"
	values.so_action = self.value(slot3, self)

	local function _index_or_nil(table_in, name_in)
		slot5 = values[name_in]
		local found_index = table.index_of(slot3, table_in)
		values[name_in] = (found_index ~= -1 and found_index) or nil

		return 
	end

	local function _nil_if_default(name_in)
		if values[name_in] == self._DEFAULT_VALUES[name_in] then
			values[name_in] = nil
		end

		return 
	end

	local function _nil_if_none(name_in)
		if values[name_in] == "none" then
			values[name_in] = nil
		end

		return 
	end

	local function _save_boolean(name_in)
		values[name_in] = values[name_in] or nil

		return 
	end

	slot8 = "use_instigator"

	_save_boolean(slot7)

	if values.use_instigator then
		values.ai_group = nil
		values.interval = nil
		values.search_distance = nil
	else
		slot9 = values.ai_group
		values.ai_group = table.index_of(slot7, self._AI_GROUPS)
		slot8 = "ai_group"

		_nil_if_default(slot7)

		slot8 = "interval"

		_nil_if_default(slot7)
	end

	slot8 = "is_navigation_link"

	_save_boolean(slot7)

	if values.use_instigator then
		values.search_position = nil
	end

	if values.align_position then
		slot8 = "align_position"

		_save_boolean(slot7)

		slot8 = "align_rotation"

		_save_boolean(slot7)

		slot8 = "needs_pos_rsrv"

		_save_boolean(slot7)

		slot9 = "path_style"

		_index_or_nil(slot7, ElementSpecialObjective._PATHING_STYLES)

		slot9 = "path_haste"

		_index_or_nil(slot7, ElementSpecialObjective._HASTES)

		slot8 = "patrol_path"

		_nil_if_none(slot7)
	else
		if not values.is_navigation_link then
			values.position = nil
		end

		values.align_position = nil
		values.align_rotation = nil
		values.needs_pos_rsrv = nil
		values.path_style = nil
		values.path_haste = nil
		values.patrol_path = nil
	end

	if values.align_rotation or values.is_navigation_link then
		slot8 = values.rotation
		values.rotation = mrotation.yaw(slot7)
	else
		values.rotation = nil
	end

	slot8 = "base_chance"

	_nil_if_default(slot7)

	if values.base_chance then
		slot8 = "chance_inc"

		_nil_if_default(slot7)
	else
		values.chance_inc = nil
	end

	slot8 = "action_duration_min"

	_nil_if_default(slot7)

	slot8 = "action_duration_max"

	_nil_if_default(slot7)

	slot9 = "trigger_on"

	_index_or_nil(slot7, ElementSpecialObjective._TRIGGER_ON)

	slot9 = "interaction_voice"

	_index_or_nil(slot7, ElementSpecialObjective._INTERACTION_VOICES)

	slot8 = "repeatable"

	_save_boolean(slot7)

	slot8 = "forced"

	_save_boolean(slot7)

	slot8 = "no_arrest"

	_save_boolean(slot7)

	slot8 = "scan"

	_save_boolean(slot7)

	slot8 = "allow_followup_self"

	_save_boolean(slot7)

	slot8 = "is_navigation_link"

	_save_boolean(slot7)

	slot8 = "is_align_point"

	_save_boolean(slot7)

	slot9 = "path_stance"

	_index_or_nil(slot7, ElementSpecialObjective._STANCES)

	slot9 = "pose"

	_index_or_nil(slot7, ElementSpecialObjective._POSES)

	slot8 = "so_action"

	_nil_if_none(slot7)

	slot8 = "interrupt_dis"

	_nil_if_default(slot7)

	slot8 = "interrupt_dmg"

	_nil_if_default(slot7)

	slot9 = "attitude"

	_index_or_nil(slot7, ElementSpecialObjective._ATTITUDES)

	if values.followup_elements then
		slot8 = values.followup_elements

		if not next(slot7) then
			values.followup_elements = nil
		end
	end

	if values.spawn_instigator_ids then
		slot8 = values.spawn_instigator_ids

		if not next(slot7) then
			values.spawn_instigator_ids = nil
		end
	end

	slot9 = values.SO_access
	values.SO_access = managers.navigation.convert_access_filter_to_number(slot7, managers.navigation)

	return 
end
function ElementSpecialObjective:event(name, unit)
	if self._events and self._events[name] then
		slot5 = self._events[name]

		for _, callback in pairs(slot4) do
			slot10 = unit

			callback(slot9)
		end
	end

	return 
end
function ElementSpecialObjective:clbk_objective_action_start(unit)
	slot6 = unit

	self.event(slot3, self, "anim_start")

	return 
end
function ElementSpecialObjective:clbk_objective_administered(unit)
	if self._values.needs_pos_rsrv then
		self._pos_rsrv = self._pos_rsrv or {}
		slot5 = unit
		local unit_rsrv = self._pos_rsrv[unit.key(slot4)]

		if unit_rsrv then
			slot6 = unit_rsrv

			managers.navigation.unreserve_pos(slot4, managers.navigation)
		else
			slot3 = {
				radius = 30
			}

			if not self._values.align_position or not self._values.position then
				slot6 = unit
				slot4 = unit.position(slot5)
			end

			slot3.position = slot4
			unit_rsrv = slot3
			slot6 = unit
			self._pos_rsrv[unit.key(slot5)] = unit_rsrv
		end

		slot5 = unit
		slot5 = unit.movement(slot4)
		unit_rsrv.filter = unit.movement(slot4).pos_rsrv_id(slot4)
		slot6 = unit_rsrv

		managers.navigation.add_pos_reservation(slot4, managers.navigation)
	end

	self._receiver_units = self._receiver_units or {}
	slot5 = unit
	self._receiver_units[unit.key(slot4)] = unit
	slot6 = unit

	self.event(unit.key(slot4), self, "administered")

	return 
end
function ElementSpecialObjective:clbk_objective_complete(unit)
	if self._pos_rsrv then
		slot5 = unit
		local unit_rsrv = self._pos_rsrv[unit.key(slot4)]

		if unit_rsrv then
			slot6 = unit_rsrv

			managers.navigation.unreserve_pos(slot4, managers.navigation)

			slot6 = unit
			self._pos_rsrv[unit.key(managers.navigation)] = nil
		end
	end

	if self._receiver_units then
		slot5 = unit
		self._receiver_units[unit.key(slot4)] = nil
		slot4 = self._receiver_units

		if not next(unit.key(slot4)) then
			self._receiver_units = nil
		end
	end

	if self.turret_unit then
		slot4 = self.turret_unit
		slot5 = unit

		self.turret_unit.weapon(slot3).on_turret_SO_completed(slot3, self.turret_unit.weapon(slot3))
	end

	slot6 = unit

	self.event(slot3, self, "complete")

	return 
end
function ElementSpecialObjective:clbk_objective_failed(unit)
	if self._pos_rsrv then
		slot5 = unit
		local unit_rsrv = self._pos_rsrv[unit.key(slot4)]

		if unit_rsrv then
			slot6 = unit_rsrv

			managers.navigation.unreserve_pos(slot4, managers.navigation)

			slot6 = unit
			self._pos_rsrv[unit.key(managers.navigation)] = nil
		end
	end

	if self._receiver_units then
		slot5 = unit
		self._receiver_units[unit.key(slot4)] = nil
		slot4 = self._receiver_units

		if not next(unit.key(slot4)) then
			self._receiver_units = nil
		end
	end

	if managers.editor and managers.editor._stopping_simulation then
		return 
	end

	if self.turret_unit then
		slot4 = self.turret_unit
		slot5 = unit

		self.turret_unit.weapon(slot3).on_turret_SO_failed(slot3, self.turret_unit.weapon(slot3))
	end

	slot6 = unit

	self.event(slot3, self, "fail")

	return 
end
function ElementSpecialObjective:clbk_verify_administration(unit)
	if self._values.needs_pos_rsrv then
		self._tmp_pos_rsrv = self._tmp_pos_rsrv or {
			radius = 30,
			position = self._values.position
		}
		local pos_rsrv = self._tmp_pos_rsrv
		slot5 = unit
		slot5 = unit.movement(slot4)
		pos_rsrv.filter = unit.movement(slot4).pos_rsrv_id(slot4)
		slot6 = pos_rsrv

		if managers.navigation.is_pos_free(slot4, managers.navigation) then
			return true
		else
			return false
		end
	end

	return true
end
function ElementSpecialObjective:add_event_callback(name, callback, callback_id)
	local id = callback_id or "generic_id"
	self._events = self._events or {}
	self._events[name] = self._events[name] or {}
	self._events[name][id] = callback

	return 
end
function ElementSpecialObjective:remove_event_callback(callback_id)
	if self._events and self._events.complete then
		self._events.complete[callback_id] = nil
	end

	if self._events and self._events.fail then
		self._events.fail[callback_id] = nil
	end

	if self._events and self._events.administered then
		self._events.administered[callback_id] = nil
	end

	return 
end
function ElementSpecialObjective:on_executed(instigator)

	-- Decompilation error in this vicinity:
	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	if not managers.groupai.state(slot3).is_AI_enabled(slot3) then
		slot4 = Application
	elseif self._values.spawn_instigator_ids then
		slot4 = self
		local chosen_units, objectives = self._select_units_from_spawners(slot3)

		if chosen_units then
			slot6 = chosen_units

			for i, chosen_unit in ipairs(slot5) do
				slot13 = objectives[i]

				self._administer_objective(slot10, self, chosen_unit)
			end
		end
	elseif self._values.use_instigator then
		slot4 = self

		if self._is_nav_link(slot3) then
			slot6 = self._id

			Application.error(slot3, Application, "[ElementSpecialObjective:on_executed] Ambiguous nav_link/SO. Element id:")
		else
			slot4 = instigator

			if type_name(slot3) == "Unit" then
				slot4 = instigator
			elseif not instigator then
				slot6 = self._id

				Application.error(slot3, Application, "[ElementSpecialObjective:on_executed] Special Objective missing instigator. Possibly improper \"use instigator\" flag use. Element id:")
			end
		end
	else
		slot4 = self

		if self._is_nav_link(slot3) then
			if self._values.so_action then
				slot5 = self

				managers.navigation.register_anim_nav_link(slot3, managers.navigation)
			else
				slot6 = self._id

				Application.error(slot3, Application, "[ElementSpecialObjective:on_executed] Nav link without animation specified. Element id:")
			end
		else
			slot5 = instigator
			local objective = self.get_objective(slot3, self)

			if objective then
				local search_dis_sq = self._values.search_distance
				search_dis_sq = (search_dis_sq and search_dis_sq * search_dis_sq) or nil
				local so_descriptor = {
					objective = objective
				}
				slot8 = "base_chance"
				so_descriptor.base_chance = self._get_default_value_if_nil(slot6, self)
				slot8 = "chance_inc"
				so_descriptor.chance_inc = self._get_default_value_if_nil(slot6, self)
				so_descriptor.interval = self._values.interval
				so_descriptor.search_dis_sq = search_dis_sq
				so_descriptor.search_pos = self._values.search_position
				so_descriptor.usage_amount = self._values.trigger_times
				slot9 = "ai_group"
				slot6 = self._get_default_value_if_nil(self, self)
				so_descriptor.AI_group = self._AI_GROUPS[slot6]
				slot7 = self._values.SO_access
				so_descriptor.access = tonumber(slot6)
				so_descriptor.repeatable = self._values.repeatable
				so_descriptor.admin_clbk = callback(slot6, self, self)
				slot7 = managers.groupai
				slot10 = self
				slot9 = so_descriptor

				managers.groupai.state(slot6).add_special_objective(slot6, managers.groupai.state(slot6), self._unique_string_id("clbk_objective_administered"))
			end
		end
	end

	slot5 = instigator

	ElementSpecialObjective.super.on_executed(slot3, self)

	return 
end
function ElementSpecialObjective:operation_remove()
	if self._nav_link then
		slot4 = self

		managers.navigation.unregister_anim_nav_link(slot2, managers.navigation)
	else
		slot3 = managers.groupai
		slot3 = managers.groupai.state(slot2)
		slot6 = self

		managers.groupai.state(slot2).remove_special_objective(slot2, self._unique_string_id(slot5))

		if self._receiver_units then
			local cpy = clone(slot2)
			slot4 = cpy

			for u_key, unit in pairs(self._receiver_units) do
				if self._receiver_units[u_key] then
					slot9 = unit

					if alive(slot8) then
						slot9 = unit

						if not unit.brain(slot8)._current_logic.inactive then
							slot9 = unit
							slot10 = nil

							unit.brain(slot8).set_objective(slot8, unit.brain(slot8))

							slot9 = unit
							slot10 = {
								sync = true,
								body_part = 2,
								type = "idle"
							}

							unit.brain(slot8).action_request(slot8, unit.brain(slot8))
						end
					end
				end
			end
		end
	end

	return 
end
function ElementSpecialObjective:get_objective(instigator)

	-- Decompilation error in this vicinity:
	if not self._is_AI_SO then
		slot5 = "AI"
		local is_AI_SO = string.begins(slot3, self._values.so_action)
	end

	slot5 = self
	local pose, stance, attitude, path_style, pos, rot, interrupt_dis, interrupt_health, haste, trigger_on, interaction_voice = self._get_misc_SO_params(slot4)
	local objective = {
		type = false,
		element = self,
		pos = pos,
		rot = rot,
		path_style = path_style,
		attitude = attitude,
		stance = stance,
		pose = pose,
		haste = haste,
		interrupt_dis = interrupt_dis,
		interrupt_health = interrupt_health,
		no_retreat = not interrupt_dis and not interrupt_health,
		trigger_on = trigger_on
	}
	slot17 = self
	objective.action_duration = self._get_action_duration(slot16)
	objective.interaction_voice = interaction_voice
	objective.followup_SO = (self._values.followup_elements and self) or nil
	slot19 = "clbk_objective_action_start"
	objective.action_start_clbk = callback(slot16, self, self)
	slot19 = "clbk_objective_failed"
	objective.fail_clbk = callback(slot16, self, self)
	slot19 = "clbk_objective_complete"
	objective.complete_clbk = callback(slot16, self, self)
	slot19 = "clbk_verify_administration"
	objective.verification_clbk = callback(slot16, self, self)
	objective.scan = self._values.scan
	objective.forced = self._values.forced
	objective.no_arrest = self._values.no_arrest

	if objective.nav_seg then
		slot17 = managers.groupai
		slot18 = objective.nav_seg
		objective.area = managers.groupai.state(slot16).get_area_from_nav_seg_id(slot16, managers.groupai.state(slot16))
	end

	return objective
end
function ElementSpecialObjective:_get_hunt_location(instigator)
	slot4 = instigator

	if not alive(slot3) then
		return 
	end

	slot4 = instigator
	slot4 = instigator.movement(slot3)
	local from_pos = instigator.movement(slot3).m_pos(slot3)
	local nearest_criminal, nearest_dis, nearest_pos = nil
	slot8 = managers.groupai
	local criminals = managers.groupai.state(slot7).all_criminals(slot7)
	slot9 = criminals

	for u_key, record in pairs(managers.groupai.state(slot7)) do
		if not record.status then
			slot15 = record.m_pos
			local my_dis = mvector3.distance(slot13, from_pos)

			if not nearest_dis or my_dis < nearest_dis then
				nearest_dis = my_dis
				nearest_criminal = record.unit
				nearest_pos = record.m_pos
			end
		end
	end

	if not nearest_criminal then
		slot9 = "[ElementSpecialObjective:_create_SO_hunt] Could not find a criminal to hunt"

		print(slot8)

		return 
	end

	slot9 = nearest_criminal
	local criminal_tracker = nearest_criminal.movement(slot8).nav_tracker(slot8)
	slot10 = criminal_tracker
	local objective_nav_seg = criminal_tracker.nav_segment(nearest_criminal.movement(slot8))
	slot12 = criminal_tracker

	return objective_nav_seg, criminal_tracker.field_position(slot11)
end
function ElementSpecialObjective:_get_misc_SO_params()

	-- Decompilation error in this vicinity:
	local pose, stance, attitude, path_style, pos, rot, interrupt_dis, interrupt_health, haste, trigger_on, interaction_voice = nil
	local values = self._values
	pos = (values.align_position and values.position) or nil

	if values.interrupt_dmg then
		interrupt_health = (values.interrupt_dmg < 1 and 1 - values.interrupt_dmg) or nil
	else
		interrupt_health = 1
	end

	haste = self._HASTES[values.path_haste]
	trigger_on = self._TRIGGER_ON[values.trigger_on] or nil
	interaction_voice = values.interaction_voice and self._INTERACTION_VOICES[values.interaction_voice]

	return pose, stance, attitude, path_style, pos, rot, interrupt_dis, interrupt_health, haste, trigger_on, interaction_voice
end
function ElementSpecialObjective:nav_link_end_pos()
	return self._values.search_position
end
function ElementSpecialObjective:nav_link_access()
	slot3 = self._values.SO_access

	return tonumber(slot2)
end
function ElementSpecialObjective:chance()
	slot4 = "base_chance"

	return self._get_default_value_if_nil(slot2, self)
end
function ElementSpecialObjective:nav_link_delay()
	slot4 = "interval"

	return self._get_default_value_if_nil(slot2, self)
end
function ElementSpecialObjective:nav_link()
	return self._nav_link
end
function ElementSpecialObjective:id()
	return self._id
end
function ElementSpecialObjective:_is_nav_link()
	return self._values.is_navigation_link or (self._values.navigation_link and self._values.navigation_link ~= -1)
end
function ElementSpecialObjective:set_nav_link(nav_link)
	self._nav_link = nav_link

	return 
end
function ElementSpecialObjective:nav_link_wants_align_pos()
	return self._values.align_position
end
function ElementSpecialObjective:_select_units_from_spawners()

	-- Decompilation error in this vicinity:
	local candidates = {}
	local objectives = {}
	local wanted_nr_units = nil

	if self._values.trigger_times and 0 < self._values.trigger_times then
		wanted_nr_units = self._values.trigger_times
	else
		return candidates, objectives
	end

	slot8 = #candidates
	wanted_nr_units = math.min(slot6, wanted_nr_units)
	local chosen_units = {}
	local chosen_objectives = {}

	for i = 1, wanted_nr_units, 1 do
		local i_unit = math.random(slot12)
		slot15 = i_unit
		local chosen_unit = table.remove(#candidates, candidates)
		slot16 = chosen_unit

		table.insert(candidates, chosen_units)

		slot15 = chosen_objectives
		slot19 = i_unit

		table.insert(candidates, table.remove(slot17, objectives))
	end

	return chosen_units, chosen_objectives
end
function ElementSpecialObjective:get_objective_trigger()
	return self._values.trigger_on
end
function ElementSpecialObjective:_administer_objective(unit, objective)

	-- Decompilation error in this vicinity:
	if objective.type == "phalanx" then
		slot6 = unit

		GroupAIStateBase.register_phalanx_unit(slot4, GroupAIStateBase)
	end

	if objective.type == "turret" then
		slot7 = objective

		self._administer_to_turret(slot4, self, unit)

		return 
	end

	if objective.trigger_on == "interact" then
		slot5 = unit
		slot5 = unit.brain(slot4)

		if not unit.brain(slot4).objective(slot4) then
			local idle_objective = {
				type = "free",
				followup_objective = objective
			}
			slot6 = unit
			slot7 = idle_objective

			unit.brain(slot5).set_objective(slot5, unit.brain(slot5))
		end

		slot5 = unit
		slot6 = objective

		unit.brain(slot4).set_followup_objective(slot4, unit.brain(slot4))

		return 
	end

	return 
end
function ElementSpecialObjective:_administer_to_turret(unit, objective)
	local so_object = self.turret_unit.weapon(slot4)._SO_object
	slot6 = self.turret_unit
	local turret_pos = self.turret_unit.weapon(self.turret_unit)._SO_object.position(self.turret_unit)
	slot7 = self.turret_unit
	local turret_rot = self.turret_unit.weapon(self.turret_unit.weapon(self.turret_unit)._SO_object)._SO_object.rotation(self.turret_unit.weapon(self.turret_unit)._SO_object)
	objective.pos = turret_pos
	objective.rot = turret_rot
	slot8 = self.turret_unit
	slot10 = self

	self.turret_unit.weapon(self.turret_unit.weapon(self.turret_unit.weapon(self.turret_unit)._SO_object)._SO_object).on_turret_SO_administered(self.turret_unit.weapon(self.turret_unit.weapon(self.turret_unit)._SO_object)._SO_object, self.turret_unit.weapon(self.turret_unit.weapon(self.turret_unit.weapon(self.turret_unit)._SO_object)._SO_object), unit)

	slot8 = unit
	slot9 = objective

	unit.brain(self.turret_unit.weapon(self.turret_unit.weapon(self.turret_unit)._SO_object)._SO_object).set_objective(self.turret_unit.weapon(self.turret_unit.weapon(self.turret_unit)._SO_object)._SO_object, unit.brain(self.turret_unit.weapon(self.turret_unit.weapon(self.turret_unit)._SO_object)._SO_object))

	slot9 = unit

	self.clbk_objective_administered(self.turret_unit.weapon(self.turret_unit.weapon(self.turret_unit)._SO_object)._SO_object, self)

	return 
end
function ElementSpecialObjective:choose_followup_SO(unit, skip_element_ids)

	-- Decompilation error in this vicinity:
	if not self._values.followup_elements then
		return 
	end

	if skip_element_ids == nil then
		if self._values.allow_followup_self then
			slot5 = self
		else
			skip_element_ids = {
				[self._id] = true
			}
		end
	end

	if self._values.SO_access and unit then
		slot9 = unit
		slot9 = unit.brain(slot8)
		slot8 = 0

		if not managers.navigation.check_access(slot4, managers.navigation, self._values.SO_access, unit.brain(slot8).SO_access(slot8)) then
			return 
		end
	end

	local total_weight = 0
	local pool = {}
	local lucky_w = math.random() * total_weight
	local accumulated_w = 0
	slot10 = pool

	for i, followup_data in ipairs(slot9) do
		accumulated_w = accumulated_w + followup_data.weight

		if lucky_w <= accumulated_w then
			return pool[i].element
		end
	end

	return 
end
function ElementSpecialObjective:get_as_followup(unit, skip_element_ids)
	slot7 = unit

	self.event(slot4, self, "admin_fail")

	return 
end
function ElementSpecialObjective:_get_action_duration()

	-- Decompilation error in this vicinity:
	if not self._values.action_duration_max and not self._values.action_duration_min then
		return 
	else
		slot4 = "action_duration_min"
		local val1 = self._get_default_value_if_nil(slot2, self)
		slot5 = "action_duration_max"
		local val2 = self._get_default_value_if_nil(self, self)
		slot6 = val2
		local min = math.min(self, val1)
		slot7 = val2
		local max = math.max(val1, val1)
		slot8 = max

		return math.lerp(val1, min, math.random())
	end

	return 
end
function ElementSpecialObjective:_get_default_value_if_nil(name_in)
	return self._values[name_in] or self._DEFAULT_VALUES[name_in]
end
function ElementSpecialObjective:destroy()
	slot3 = self

	ElementSpecialObjective.super.destroy(slot2)

	if self._pos_rsrv then
		slot3 = self._pos_rsrv

		for _, unit_rsrv in pairs(slot2) do
			slot9 = unit_rsrv

			managers.navigation.unreserve_pos(slot7, managers.navigation)
		end

		self._pos_rsrv = nil
	end

	return 
end

return 
