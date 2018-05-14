slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSetOutline then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSetOutline = slot0
function ElementSetOutline:init(...)
	slot3 = self

	ElementSetOutline.super.init(slot2, ...)

	return 
end
function ElementSetOutline:client_on_executed(...)
	return 
end
function ElementSetOutline:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local function f(unit)
		slot3 = unit

		if unit.contour(slot2) then
			if self._values.set_outline then
				slot3 = unit
				slot5 = true

				unit.contour(slot2).add(slot2, unit.contour(slot2), "highlight_character")
			else
				slot3 = unit
				slot5 = true

				unit.contour(slot2).remove(slot2, unit.contour(slot2), "highlight_character")
			end
		end

		return 
	end

	slot5 = self._values.elements

	for _, id in ipairs(slot4) do
		slot11 = id
		local element = self.get_mission_element(slot9, self)
		slot12 = f

		element.execute_on_all_units(self, element)
	end

	slot6 = instigator

	ElementSetOutline.super.on_executed(slot4, self)

	return 
end

return 
