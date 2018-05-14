slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementCharacterOutline then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementCharacterOutline = slot0
function ElementCharacterOutline:init(...)
	slot3 = self

	ElementCharacterOutline.super.init(slot2, ...)

	return 
end
function ElementCharacterOutline:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementCharacterOutline:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local all_civilians = managers.enemy.all_civilians(slot3)
	slot5 = all_civilians

	for u_key, u_data in pairs(managers.enemy) do
		slot10 = u_data.unit
		local data = u_data.unit.brain(slot9)._logic_data

		if data and not data.been_outlined and data.char_tweak.outline_on_discover then
			slot11 = data

			CivilianLogicIdle._enable_outline(slot10)
		end
	end

	slot6 = instigator

	ElementCharacterOutline.super.on_executed(slot4, self)

	return 
end

return 
