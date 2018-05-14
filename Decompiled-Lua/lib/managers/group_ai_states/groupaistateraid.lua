if not GroupAIStateRaid then
	slot2 = GroupAIStateBesiege
	slot0 = class(slot1)
end

GroupAIStateRaid = slot0
function GroupAIStateRaid:init()
	slot3 = self

	GroupAIStateRaid.super.init(slot2)

	self._tweak_data = tweak_data.group_ai.raid

	return 
end
function GroupAIStateRaid:nav_ready_listener_key()
	return "GroupAIStateRaid"
end

return 
