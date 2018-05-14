slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementInteraction then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInteraction = slot0
function ElementInteraction:init(...)
	slot3 = self

	ElementInteraction.super.init(slot2, ...)

	slot3 = Network

	if Network.is_server(slot2) then
		slot5 = self._values.rotation
		self._unit = CoreUnit.safe_spawn_unit(slot2, "units/dev_tools/mission_elements/point_interaction/interaction_dummy", self._values.position)
		slot3 = self._unit
		slot4 = self

		self._unit.interaction(slot2).set_mission_element(slot2, self._unit.interaction(slot2))

		slot3 = self._unit
		slot4 = self._values.tweak_data_id

		self._unit.interaction(slot2).set_tweak_data(slot2, self._unit.interaction(slot2))

		if self._values.override_timer ~= -1 then
			slot3 = self._unit
			slot4 = self._values.override_timer

			self._unit.interaction(slot2).set_override_timer_value(slot2, self._unit.interaction(slot2))
		end

		slot3 = self._unit
		slot5 = true

		self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), false)
	end

	return 
end
function ElementInteraction:on_script_activated()
	slot3 = self._unit

	if alive(slot2) and self._values.enabled then
		slot3 = self._unit
		slot5 = true

		self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), self._values.enabled)
	end

	return 
end
function ElementInteraction:set_enabled(enabled)
	slot5 = enabled

	ElementInteraction.super.set_enabled(slot3, self)

	slot4 = self._unit

	if alive(slot3) then
		slot4 = self._unit
		slot6 = true

		self._unit.interaction(slot3).set_active(slot3, self._unit.interaction(slot3), enabled)
	end

	return 
end
function ElementInteraction:on_executed(instigator, ...)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementInteraction.super.on_executed(slot3, self, ...)

	return 
end
function ElementInteraction:on_interacted(instigator)
	slot6 = "interacted"

	self.on_executed(slot3, self, instigator)

	return 
end
function ElementInteraction:on_interact_start(instigator)
	slot6 = "start"

	self.on_executed(slot3, self, instigator)

	return 
end
function ElementInteraction:on_interact_interupt(instigator)
	slot6 = "interupt"

	self.on_executed(slot3, self, instigator)

	return 
end
function ElementInteraction:stop_simulation(...)
	slot3 = self

	ElementInteraction.super.stop_simulation(slot2, ...)

	slot3 = self._unit

	if alive(slot2) then
		slot4 = self._unit

		World.delete_unit(slot2, World)
	end

	return 
end
function ElementInteraction:destroy()
	slot3 = self._unit

	if alive(slot2) then
		slot4 = 0

		self._unit.set_slot(slot2, self._unit)
	end

	return 
end
function ElementInteraction:stop_simulation(...)
	slot3 = self

	self.destroy(slot2)

	return 
end

return 
