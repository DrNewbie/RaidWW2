-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementCharacterTeam then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementCharacterTeam = slot0
function ElementCharacterTeam:init(...)
	slot3 = self

	ElementCharacterTeam.super.init(slot2, ...)

	slot3 = self

	self._finalize_values(slot2)

	return 
end
function ElementCharacterTeam:_finalize_values()

	-- Decompilation error in this vicinity:
	local values = self._values

	if values.team == "" then
		values.team = nil
	end

	return 
end
function ElementCharacterTeam:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local function _set_unit_team_f(unit)
		slot3 = managers.groupai
		slot5 = self._values.team

		managers.groupai.state(slot2).set_char_team(slot2, managers.groupai.state(slot2), unit)

		return 
	end

	if self._values.use_instigator then
		if self._values.team then
			slot5 = instigator
			slot5 = instigator.character_damage(slot4)

			if not instigator.character_damage(slot4).dead(slot4) then
				slot5 = instigator

				_set_unit_team_f(slot4)
			end
		end
	elseif self._values.elements then
		slot5 = self._values.elements

		for _, element_id in pairs(slot4) do
			slot11 = element_id
			local element = self.get_mission_element(slot9, self)
			slot11 = element

			if element.enabled(self) or self._values.ignore_disabled then
				local all_units = element.units(slot10)
				slot12 = all_units

				for _, unit in ipairs(element) do
					slot17 = unit

					_set_unit_team_f(slot16)
				end
			end
		end
	end

	slot6 = instigator

	ElementCharacterTeam.super.on_executed(slot4, self)

	return 
end

return 
