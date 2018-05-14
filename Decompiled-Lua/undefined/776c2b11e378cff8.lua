if not AirDropPlane then
	slot2 = UnitBase
	slot0 = class(slot1)
end

AirDropPlane = slot0
function AirDropPlane:init(unit)
	slot6 = false

	AirDropPlane.super.init(slot3, self, unit)

	self._unit = unit
	self._body_name = self._body_name or "a_body"

	return 
end
function AirDropPlane:set_drop_unit(unit)
	self._drop_unit = unit

	return 
end
function AirDropPlane:spawn_pod()
	slot5 = self._unit

	managers.airdrop.spawn_pod(slot2, managers.airdrop, self._drop_unit)

	return 
end

return 
