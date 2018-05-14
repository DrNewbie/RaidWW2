slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementModifyPlayer then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementModifyPlayer = slot0
function ElementModifyPlayer:init(...)
	slot3 = self

	ElementModifyPlayer.super.init(slot2, ...)

	return 
end
function ElementModifyPlayer:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementModifyPlayer:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = instigator

	if alive(slot3) then
		slot4 = managers.player

		if instigator == managers.player.player_unit(slot3) then
			slot4 = instigator
			slot5 = self._values.damage_fall_disabled

			instigator.character_damage(slot3).set_damage_fall_disabled(slot3, instigator.character_damage(slot3))
		end
	end

	slot5 = instigator

	ElementModifyPlayer.super.on_executed(slot3, self)

	return 
end

return 
