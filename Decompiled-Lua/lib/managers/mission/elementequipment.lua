slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementEquipment then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEquipment = slot0
function ElementEquipment:init(...)
	slot3 = self

	ElementEquipment.super.init(slot2, ...)

	return 
end
function ElementEquipment:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.equipment ~= "none" then
		slot4 = managers.player

		if instigator == managers.player.player_unit(slot3) then
			slot5 = {
				name = self._values.equipment,
				amount = self._values.amount
			}

			managers.player.add_special(slot3, managers.player)
		else
			local rpc_params = {
				"give_equipment",
				self._values.equipment,
				self._values.amount,
				false
			}
			slot5 = instigator
			slot6 = rpc_params

			instigator.network(slot4).send_to_unit(slot4, instigator.network(slot4))
		end
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot5 = "Cant give equipment " .. self._values.equipment .. " in element " .. self._editor_name .. "."

			managers.editor.output_error(slot3, managers.editor)
		end
	end

	slot5 = instigator

	ElementEquipment.super.on_executed(slot3, self)

	return 
end

return 
