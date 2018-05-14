if not ElementVehicleOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementVehicleOperator = slot0
function ElementVehicleOperator:init(...)
	slot3 = self

	ElementVehicleOperator.super.init(slot2, ...)

	return 
end
function ElementVehicleOperator:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementVehicleOperator:_get_unit(unit_id)
	slot6 = nil
	slot9 = self._mission_script
	local unit = managers.worldcollection.get_unit_with_id(slot3, managers.worldcollection, unit_id, self._mission_script.sync_id(slot8))

	return unit
end
function ElementVehicleOperator:_apply_operator(unit)
	if unit then
		slot4 = unit

		if not unit.npc_vehicle_driving(slot3) then
			slot4 = unit
			local extension = unit.vehicle_driving(slot3)
		end

		if extension then
			local call = extension[self._values.operation]

			if call then
				slot6 = extension
				slot9 = self._values.damage

				call(slot5, tonumber(slot8))
			else
				slot8 = self._values.operation

				Application.error(slot5, Application, "Vehicle Operator applied to a unit that doesn't support the specified operation - opertion: ")
			end
		else
			slot6 = "Vehicle Operator applied to a unit that isn't a vehicle: "
			slot9 = unit

			Application.error(slot4, Application, inspect(slot8))
		end
	else
		slot5 = "Vehicle Operator applied to a unit that doesn't exist - operator: "
		slot8 = self._unit

		Application.error(slot3, Application, inspect(slot7))
	end

	return 
end
function ElementVehicleOperator:on_executed(instigator)
	slot5 = "ElementVehicleOperator:on_executed"

	Application.debug(slot3, Application)

	if not self._values.enabled then
		return 
	end

	if self._values.use_instigator then
		if instigator then
			slot5 = instigator

			self._apply_operator(slot3, self)
		end
	else
		slot4 = self._values.elements

		for _, id in ipairs(slot3) do
			slot10 = id
			local unit = self._get_unit(slot8, self)
			slot11 = unit

			self._apply_operator(self, self)
		end
	end

	slot5 = instigator

	ElementVehicleOperator.super.on_executed(slot3, self)

	return 
end

return 
