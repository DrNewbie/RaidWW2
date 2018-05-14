-- Decompilation Error: _glue_flows(node)

slot3 = "SequenceManager"

core.module(slot1, core)

slot3 = "CoreSequenceManager"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not SequenceManager then
	slot2 = CoreSequenceManager.SequenceManager
	slot0 = class(slot1)
end

SequenceManager = slot0
function SequenceManager:init()
	slot7 = "body_area_damage"
	slot8 = "area_damage_blocker"
	slot5 = managers.slot.get_mask(managers.slot, managers.slot)
	slot9 = "unit_area_damage"

	SequenceManager.super.init(slot2, self, managers.slot.get_mask(slot5, managers.slot), managers.slot.get_mask(managers.slot, managers.slot))

	slot4 = InteractionElement

	self.register_event_element_class(slot2, self)

	slot5 = "players"
	self._proximity_masks.players = managers.slot.get_mask(self, managers.slot)

	return 
end
function SequenceManager:on_level_transition()
	self._start_time_callback_list = {}
	self._startup_callback_map = {}
	self._callback_map = {}
	self._retry_callback_list = {}
	self._retry_callback_indices = {}
	self._area_damage_callback_map = {}
	self._last_start_time_callback_id = 0
	self._last_startup_callback_id = 0
	self._current_start_time_callback_index = 0
	self._last_callback_id = 0
	self._current_retry_callback_index = 0
	self._last_area_damage_callback_id = 0

	return 
end

if not InteractionElement then
	slot2 = CoreSequenceManager.BaseElement
	slot0 = class(slot1)
end

InteractionElement = slot0
InteractionElement.NAME = "interaction"
function InteractionElement:init(node, unit_element)
	slot7 = unit_element

	InteractionElement.super.init(slot4, self, node)

	slot6 = "enabled"
	self._enabled = self.get(slot4, self)

	return 
end
function InteractionElement:activate_callback(env)
	slot6 = self._enabled
	local enabled = self.run_parsed_func(slot3, self, env)
	slot5 = env.dest_unit

	if env.dest_unit.interaction(self) then
		slot5 = env.dest_unit
		slot6 = enabled

		env.dest_unit.interaction(slot4).set_active(slot4, env.dest_unit.interaction(slot4))
	else
		slot11 = env.dest_unit
		slot6 = "Unit " .. tostring(env.dest_unit.name(slot10)) .. " doesn't have the interaction extension."

		Application.error(slot4, Application)
	end

	return 
end
slot3 = SequenceManager

CoreClass.override_class(function (self, env)
	slot6 = self._enabled
	local enabled = self.run_parsed_func(slot3, self, env)
	slot5 = env.dest_unit

	if env.dest_unit.interaction(self) then
		slot5 = env.dest_unit
		slot6 = enabled

		env.dest_unit.interaction(slot4).set_active(slot4, env.dest_unit.interaction(slot4))
	else
		slot11 = env.dest_unit
		slot6 = "Unit " .. tostring(env.dest_unit.name(slot10)) .. " doesn't have the interaction extension."

		Application.error(slot4, Application)
	end

	return 
end, CoreSequenceManager.SequenceManager)

return 
