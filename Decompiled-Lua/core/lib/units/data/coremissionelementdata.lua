CoreMissionElementData = CoreMissionElementData or class()

if not MissionElementData then
	slot2 = CoreMissionElementData
	slot0 = class(slot1)
end

MissionElementData = slot0
function MissionElementData:init(...)
	slot3 = self

	CoreMissionElementData.init(slot2, ...)

	return 
end
function CoreMissionElementData:init(unit)
	return 
end

return 
