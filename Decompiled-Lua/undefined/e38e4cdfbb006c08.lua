if not DropPointGroupElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

DropPointGroupElement = slot0
function DropPointGroupElement:init(unit)
	slot5 = unit

	DropPointGroupElement.super.init(slot3, self)

	self._hed.points = {}
	self._hed.execute_on_startup = true

	return 
end

return 
