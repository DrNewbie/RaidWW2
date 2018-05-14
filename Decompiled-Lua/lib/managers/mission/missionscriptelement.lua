-- Decompilation Error: _glue_flows(node)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not MissionScriptElement then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

MissionScriptElement = slot0
function MissionScriptElement:init(...)
	slot3 = self

	MissionScriptElement.super.init(slot2, ...)

	return 
end
function MissionScriptElement:client_on_executed()
	return 
end
function MissionScriptElement:on_executed(...)
	slot3 = Network

	if Network.is_client(slot2) then
		return 
	end

	slot3 = self

	MissionScriptElement.super.on_executed(slot2, ...)

	return 
end
slot3 = MissionScriptElement

CoreClass.override_class(function (self, ...)
	slot3 = Network

	if Network.is_client(slot2) then
		return 
	end

	slot3 = self

	MissionScriptElement.super.on_executed(slot2, ...)

	return 
end, CoreMissionScriptElement.MissionScriptElement)

return 
