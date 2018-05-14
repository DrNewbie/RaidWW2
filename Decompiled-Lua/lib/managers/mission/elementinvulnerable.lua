slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementInvulnerable then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInvulnerable = slot0
function ElementInvulnerable:init(...)
	slot3 = self

	ElementInvulnerable.super.init(slot2, ...)

	return 
end
function ElementInvulnerable:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)
		slot12 = element

		for _, unit in ipairs(element.units(slot11)) do
			slot15 = unit

			if alive(slot14) then
				slot15 = unit

				if unit.character_damage(slot14) then
					slot15 = unit
					slot16 = self._values.invulnerable

					unit.character_damage(slot14).set_invulnerable(slot14, unit.character_damage(slot14))

					slot15 = unit
					slot16 = self._values.immortal

					unit.character_damage(slot14).set_immortal(slot14, unit.character_damage(slot14))
				end
			end
		end
	end

	slot5 = instigator

	ElementInvulnerable.super.on_executed(slot3, self)

	return 
end

return 
