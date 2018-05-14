slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementTeamRelation then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementTeamRelation = slot0
function ElementTeamRelation:init(...)
	slot3 = self

	ElementCharacterTeam.super.init(slot2, ...)

	return 
end
function ElementTeamRelation:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.groupai
	slot8 = self._values.mutual

	managers.groupai.state(slot3).set_team_relation(slot3, managers.groupai.state(slot3), self._values.team1, self._values.team2, self._values.relation)

	slot5 = instigator

	ElementTeamRelation.super.on_executed(slot3, self)

	return 
end

return 
