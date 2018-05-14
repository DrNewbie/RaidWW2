slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementPointOfNoReturn then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementPointOfNoReturn = slot0
function ElementPointOfNoReturn:init(...)
	slot3 = self

	ElementPointOfNoReturn.super.init(slot2, ...)

	return 
end
function ElementPointOfNoReturn:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementPointOfNoReturn:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local diff = (Global.game_settings and Global.game_settings.difficulty) or Global.DEFAULT_DIFFICULTY

	if diff == "difficulty_1" then
		slot5 = managers.groupai
		slot8 = self._id

		managers.groupai.state(slot4).set_point_of_no_return_timer(slot4, managers.groupai.state(slot4), self._values.time_normal, self._sync_id)
	elseif diff == "difficulty_2" then
		slot5 = managers.groupai
		slot8 = self._id

		managers.groupai.state(slot4).set_point_of_no_return_timer(slot4, managers.groupai.state(slot4), self._values.time_hard, self._sync_id)
	elseif diff == "difficulty_3" then
		slot5 = managers.groupai
		slot8 = self._id

		managers.groupai.state(slot4).set_point_of_no_return_timer(slot4, managers.groupai.state(slot4), self._values.time_overkill, self._sync_id)
	elseif diff == "difficulty_4" then
		slot5 = managers.groupai
		slot8 = self._id

		managers.groupai.state(slot4).set_point_of_no_return_timer(slot4, managers.groupai.state(slot4), self._values.time_overkill_145, self._sync_id)
	end

	slot6 = instigator

	ElementPointOfNoReturn.super.on_executed(slot4, self)

	return 
end

return 
