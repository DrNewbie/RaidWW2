-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementPickup then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementPickup = slot0
function ElementPickup:init(...)
	slot3 = self

	ElementPickup.super.init(slot2, ...)

	return 
end
function ElementPickup:client_on_executed(...)
	return 
end
function ElementPickup:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = instigator

	if alive(slot3) then
		slot4 = instigator
	else
		slot4 = instigator
		local reason = not alive(slot3) and "no instigator"

		if not reason then
			slot5 = instigator
			reason = not instigator.character_damage(slot4) and "no character damage extension (wrong type of unit)"
		end

		if not reason then
			slot5 = instigator
			slot5 = instigator.character_damage(slot4)
			reason = instigator.character_damage(slot4).dead(slot4) and "instigator dead"
		end

		if not reason then
			slot5 = instigator
			reason = not instigator.character_damage(slot4).set_pickup and "No set_pickup function"
		end

		slot8 = self
		slot7 = "Reason: " .. reason

		debug_pause(slot4, "Skipped pickup operation on an instigator!", self.editor_name(slot7))
	end

	slot5 = instigator

	ElementPickup.super.on_executed(slot3, self)

	return 
end

return 
