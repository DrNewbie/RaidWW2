slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementTeamAICommands then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementTeamAICommands = slot0
function ElementTeamAICommands:init(...)
	slot3 = self

	ElementTeamAICommands.super.init(slot2, ...)

	return 
end
function ElementTeamAICommands:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementTeamAICommands.super.on_executed(slot3, self)

	return 
end
function ElementTeamAICommands:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end

return 
