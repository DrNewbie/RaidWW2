if not CoreLogicLinkUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreLogicLinkUnitElement = slot0

if not LogicLinkUnitElement then
	slot2 = CoreLogicLinkUnitElement
	slot0 = class(slot1)
end

LogicLinkUnitElement = slot0
LogicLinkUnitElement.SAVE_UNIT_POSITION = false
LogicLinkUnitElement.SAVE_UNIT_ROTATION = false

return 
