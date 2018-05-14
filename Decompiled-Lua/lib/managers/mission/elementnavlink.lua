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

if not ElementNavLink then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementNavLink = slot0
ElementNavLink._AI_GROUPS = {
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
ElementNavLink._PATHING_STYLES = {
	"destination",
	"precise",
	"coarse",
	"warp"
}
ElementNavLink._ATTITUDES = {
	"avoid",
	"engage"
}
ElementNavLink._TRIGGER_ON = {
	"interact"
}
ElementNavLink._INTERACTION_VOICES = {
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
ElementNavLink._STANCES = {
	"ntl",
	"hos",
	"cbt"
}
ElementNavLink._POSES = {
	"crouch",
	"stand"
}
ElementNavLink._HASTES = {
	"walk",
	"run"
}
ElementNavLink._DEFAULT_VALUES = {
	base_chance = 1,
	chance_inc = 0,
	ai_group = 1,
	interval = 3,
	interaction_voice = 1,
	path_style = 1
}
function ElementNavLink:init(...)
	slot3 = self

	ElementNavLink.super.init(slot2, ...)

	slot4 = self._values

	self._finalize_values(slot2, self)

	slot3 = self._values
	self._values = clone(slot2)

	return 
end
function ElementNavLink:_finalize_values(values)
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

	slot9 = values.ai_group
	values.ai_group = table.index_of(slot7, self._AI_GROUPS)
	slot8 = "ai_group"

	_nil_if_default(slot7)

	slot8 = "interval"

	_nil_if_default(slot7)

	slot8 = "is_navigation_link"

	_save_boolean(slot7)

	if values.align_position then
		slot8 = "align_position"

		_save_boolean(slot7)

		slot8 = "align_rotation"

		_save_boolean(slot7)

		slot8 = "needs_pos_rsrv"

		_save_boolean(slot7)

		slot9 = "path_style"

		_index_or_nil(slot7, ElementNavLink._PATHING_STYLES)

		slot9 = "path_haste"

		_index_or_nil(slot7, ElementNavLink._HASTES)

		slot8 = "patrol_path"

		_nil_if_none(slot7)
	else
		values.align_position = nil
		values.align_rotation = nil
		values.needs_pos_rsrv = nil
		values.path_style = nil
		values.path_haste = nil
		values.patrol_path = nil
	end

	slot8 = values.rotation
	values.rotation = mrotation.yaw(slot7)
	slot8 = "base_chance"

	_nil_if_default(slot7)

	if values.base_chance then
		slot8 = "chance_inc"

		_nil_if_default(slot7)
	else
		values.chance_inc = nil
	end

	slot9 = "trigger_on"

	_index_or_nil(slot7, ElementNavLink._TRIGGER_ON)

	slot9 = "interaction_voice"

	_index_or_nil(slot7, ElementNavLink._INTERACTION_VOICES)

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

	slot9 = "path_stance"

	_index_or_nil(slot7, ElementNavLink._STANCES)

	slot9 = "pose"

	_index_or_nil(slot7, ElementNavLink._POSES)

	slot8 = "so_action"

	_nil_if_none(slot7)

	slot9 = "attitude"

	_index_or_nil(slot7, ElementNavLink._ATTITUDES)

	if values.followup_elements then
		slot8 = values.followup_elements

		if not next(slot7) then
			values.followup_elements = nil
		end
	end

	slot9 = values.SO_access
	values.SO_access = managers.navigation.convert_access_filter_to_number(slot7, managers.navigation)

	return 
end
function ElementNavLink:event(name, unit)
	if self._events and self._events[name] then
		slot5 = self._events[name]

		for _, callback in ipairs(slot4) do
			slot10 = unit

			callback(slot9)
		end
	end

	return 
end
function ElementNavLink:clbk_objective_action_start(unit)
	slot6 = unit

	self.event(slot3, self, "anim_start")

	return 
end
function ElementNavLink:clbk_objective_administered(unit)
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
function ElementNavLink:clbk_objective_complete(unit)
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

	slot6 = unit

	self.event(slot3, self, "complete")

	return 
end
function ElementNavLink:clbk_objective_failed(unit)
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

	slot6 = unit

	self.event(slot3, self, "fail")

	return 
end
function ElementNavLink:clbk_verify_administration(unit)
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
function ElementNavLink:add_event_callback(name, callback)
	self._events = self._events or {}
	self._events[name] = self._events[name] or {}
	slot6 = callback

	table.insert(self._events[name] or , self._events[name])

	return 
end
function ElementNavLink:on_executed(instigator)

	-- Decompilation error in this vicinity:
	if self._values.so_action then
		slot5 = self

		managers.navigation.register_anim_nav_link(slot3, managers.navigation)
	else
		slot6 = self._id

		Application.error(slot3, Application, "[ElementNavLink:on_executed] Nav link without animation specified. Element id:")
	end

	slot5 = nil

	ElementNavLink.super.on_executed(slot3, self)

	return 
end
function ElementNavLink:operation_remove()
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
					slot9 = unit.brain(slot8)

					if unit.brain(slot8).is_available_for_assignment(slot8) then
						slot9 = unit
						slot10 = nil

						unit.brain(slot8).set_objective(slot8, unit.brain(slot8))
					end
				end
			end
		end
	end

	return 
end
function ElementNavLink:destroy()
	slot3 = self

	ElementNavLink.super.destroy(slot2)

	slot4 = self

	managers.navigation.unregister_anim_nav_link(slot2, managers.navigation)

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
function ElementNavLink:get_objective(instigator)
	if not self._is_AI_SO then
		slot5 = "AI"
		local is_AI_SO = string.begins(slot3, self._values.so_action)
	end

	slot5 = self
	local pose, stance, attitude, path_style, pos, rot, interrupt_dis, interrupt_health, haste, trigger_on, interaction_voice = self._get_misc_SO_params(slot4)
	local objective = {
		type = "act",
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
		trigger_on = trigger_on,
		interaction_voice = interaction_voice,
		followup_SO = (self._values.followup_elements and self) or nil
	}
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
	local action = nil

	if self._values.so_action then
		action = {
			align_sync = true,
			needs_full_blend = true,
			type = "act",
			body_part = 1,
			variant = self._values.so_action,
			blocks = {
				light_hurt = -1,
				hurt = -1,
				action = -1,
				heavy_hurt = -1,
				walk = -1
			}
		}
		objective.type = "act"
	else
		objective.type = "free"
	end

	objective.action = action

	if self._values.align_position then
		slot19 = self._values.position
		objective.nav_seg = managers.navigation.get_nav_seg_from_pos(slot17, managers.navigation)

		if path_style == "destination" then
			slot19 = self._values.position
			slot24 = 0
			local path_data = managers.ai_data.destination_path(slot17, managers.ai_data, Rotation(slot21, self._values.rotation or 0, 0))
			objective.path_data = path_data
		else
			local path_name = self._values.patrol_path
			slot20 = path_name
			local path_data = managers.ai_data.patrol_path(slot18, managers.ai_data)
			objective.path_data = path_data
		end
	end

	return objective
end
function ElementNavLink:_get_misc_SO_params()

	-- Decompilation error in this vicinity:
	local pose, stance, attitude, path_style, pos, rot, interrupt_dis, interrupt_health, haste, trigger_on, interaction_voice = nil
	local values = self._values
	pos = (values.align_position and values.position) or nil

	return pose, stance, attitude, path_style, pos, rot, -1, interrupt_health, haste, trigger_on, interaction_voice
end
function ElementNavLink:nav_link_end_pos()
	return self._values.search_position
end
function ElementNavLink:nav_link_access()
	slot3 = self._values.SO_access

	return tonumber(slot2)
end
function ElementNavLink:chance()
	slot4 = "base_chance"

	return self._get_default_value_if_nil(slot2, self)
end
function ElementNavLink:nav_link_delay()
	slot4 = "interval"

	return self._get_default_value_if_nil(slot2, self)
end
function ElementNavLink:nav_link()
	return self._nav_link
end
function ElementNavLink:id()
	return self._id
end
function ElementNavLink:_is_nav_link()
	return true
end
function ElementNavLink:set_nav_link(nav_link)
	self._nav_link = nav_link

	return 
end
function ElementNavLink:nav_link_wants_align_pos()
	return self._values.align_position
end
function ElementNavLink:get_objective_trigger()
	return self._values.trigger_on
end
function ElementNavLink:_administer_objective(unit, objective)

	-- Decompilation error in this vicinity:
	if objective.type == "phalanx" then
		slot6 = unit

		GroupAIStateBase.register_phalanx_unit(slot4, GroupAIStateBase)
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
function ElementNavLink:choose_followup_SO(unit, skip_element_ids)

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
function ElementNavLink:get_as_followup(unit, skip_element_ids)
	slot7 = unit

	self.event(slot4, self, "admin_fail")

	return 
end
function ElementNavLink:_get_default_value_if_nil(name_in)

	-- Decompilation error in this vicinity:
	return self._values[name_in] or self._DEFAULT_VALUES[name_in]
end

return 
