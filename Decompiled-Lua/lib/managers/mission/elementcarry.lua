-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementCarry then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementCarry = slot0
function ElementCarry:init(...)
	slot3 = self

	ElementCarry.super.init(slot2, ...)

	return 
end
function ElementCarry:on_executed(instigator)

	-- Decompilation error in this vicinity:
	if self._values.type_filter and self._values.type_filter ~= "none" then
		slot4 = instigator
		local carry_ext = instigator.carry_data(slot3)

		if not carry_ext then
			slot7 = instigator

			debug_pause_unit(slot4, instigator, "[ElementCarry:on_executed] instigator missing carry_data extension")

			return 
		end

		slot5 = carry_ext
		local carry_id = carry_ext.carry_id(slot4)

		if carry_id ~= self._values.type_filter then
			return 
		end
	end

	if self._values.operation == "remove" then
		slot4 = Network

		if Network.is_server(slot3) then
			slot5 = 0

			instigator.set_slot(slot3, instigator)
		end
	elseif self._values.operation == "add_to_respawn" then
		slot4 = Network

		if Network.is_server(slot3) then
			local carry_ext = instigator.carry_data(slot3)
			local carry_id = carry_ext.carry_id(instigator)
			local multiplier = carry_ext.multiplier(carry_ext)
			slot9 = multiplier

			managers.loot.add_to_respawn(carry_ext, managers.loot, carry_id)

			slot8 = 0

			instigator.set_slot(carry_ext, instigator)
		end
	elseif self._values.operation == "freeze" then
		slot4 = instigator
		slot5 = "freeze"

		if instigator.damage(slot3).has_sequence(slot3, instigator.damage(slot3)) then
			slot4 = instigator
			slot5 = "freeze"

			instigator.damage(slot3).run_sequence_simple(slot3, instigator.damage(slot3))
		else
			slot5 = instigator

			debug_pause(slot3, "[ElementCarry:on_executed] instigator missing freeze sequence")
		end
	elseif self._values.operation == "secure" or self._values.operation == "secure_silent" then
		slot4 = instigator

		if instigator.carry_data(slot3) then
			local carry_ext = instigator.carry_data(slot3)
			slot5 = carry_ext

			carry_ext.disarm(instigator)

			slot5 = Network

			if Network.is_server(instigator) then
				local silent = self._values.operation == "secure_silent"
				local carry_id = carry_ext.carry_id(slot5)
				local multiplier = carry_ext.multiplier(carry_ext)
				slot11 = silent

				managers.loot.secure(carry_ext, managers.loot, carry_id, multiplier)
			end

			slot6 = 0

			carry_ext.set_value(slot4, carry_ext)

			slot5 = instigator
			slot6 = "secured"

			if instigator.damage(slot4).has_sequence(slot4, instigator.damage(slot4)) then
				slot5 = instigator
				slot6 = "secured"

				instigator.damage(slot4).run_sequence_simple(slot4, instigator.damage(slot4))
			else
				slot6 = instigator

				debug_pause(slot4, "[ElementCarry:on_executed] instigator missing secured sequence")
			end
		else
			slot5 = instigator

			debug_pause(slot3, "[ElementCarry:on_executed] instigator missing carry_data extension")
		end
	end

	slot5 = instigator

	ElementCarry.super.on_executed(slot3, self)

	return 
end
function ElementCarry:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end

return 
