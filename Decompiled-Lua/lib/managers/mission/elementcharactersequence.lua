slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementCharacterSequence then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementCharacterSequence = slot0
function ElementCharacterSequence:init(...)
	slot3 = self

	ElementCharacterSequence.super.init(slot2, ...)

	return 
end
function ElementCharacterSequence:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementCharacterSequence:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local function f(unit)
		slot3 = unit
		slot4 = self._values.sequence

		unit.damage(slot2).run_sequence_simple(slot2, unit.damage(slot2))

		return 
	end

	if self._values.sequence == "" then
		slot6 = self._id

		debug_pause(slot4, "[ElementCharacterSequence] Empty sequence name. Element ID:")

		return 
	end

	if self._values.use_instigator then
		slot5 = instigator

		if alive(slot4) then
			slot5 = instigator

			if instigator.damage(slot4) then
				slot5 = instigator

				f(slot4)
			else
				slot9 = self._id

				debug_pause_unit(slot4, instigator, "[ElementCharacterSequence] instigator without damage extension", instigator, ". Element ID:")
			end
		end
	else
		slot5 = self._values.elements

		for _, id in ipairs(slot4) do
			slot11 = id
			local element = self.get_mission_element(slot9, self)
			slot12 = f

			element.execute_on_all_units(self, element)
		end
	end

	slot6 = instigator

	ElementCharacterSequence.super.on_executed(slot4, self)

	return 
end

return 
