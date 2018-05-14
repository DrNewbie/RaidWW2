if not DropPointElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

DropPointElement = slot0
function DropPointElement:init(unit)
	slot5 = unit

	DropPointElement.super.init(slot3, self)

	return 
end

return 
