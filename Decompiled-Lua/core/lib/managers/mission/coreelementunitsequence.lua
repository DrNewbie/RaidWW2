-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreElementUnitSequence"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreUnit"

core.import(slot1, core)

if not ElementUnitSequence then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementUnitSequence = slot0
function ElementUnitSequence:init(...)
	slot3 = self

	ElementUnitSequence.super.init(slot2, ...)

	slot4 = self._values.position
	self._unit = CoreUnit.safe_spawn_unit(slot2, "core/units/run_sequence_dummy/run_sequence_dummy")
	slot3 = self._mission_script
	slot5 = self._values.trigger_list

	self._mission_script.worlddefinition(slot2).add_trigger_sequence(slot2, self._mission_script.worlddefinition(slot2), self._unit)

	return 
end
function ElementUnitSequence:on_script_activated()
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementUnitSequence:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementUnitSequence:on_executed(instigator)

	-- Decompilation error in this vicinity:
	slot4 = self._unit

	if not self._unit.damage(slot3) then
		slot5 = self._editor_name

		_G.debug_pause(slot3, "[ElementUnitSequence:on_executed] Trying to run sequnce on a unit that has no damage extension. Editor name of the mission element:")
	end

	slot4 = self._unit
	slot5 = "run_sequence"

	self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))

	slot5 = instigator

	ElementUnitSequence.super.on_executed(slot3, self)

	return 
end
function ElementUnitSequence:destroy()
	slot4 = 0

	self._unit.set_slot(slot2, self._unit)

	return 
end
function ElementUnitSequence:stop_simulation(...)
	slot3 = self

	self.destroy(slot2)

	return 
end

return 
