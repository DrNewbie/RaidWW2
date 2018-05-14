slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementJobValue then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementJobValue = slot0
function ElementJobValue:init(...)
	slot3 = self

	ElementJobValue.super.init(slot2, ...)

	return 
end
function ElementJobValue:client_on_executed(...)
	if self._values.save then
		slot3 = self

		self.on_executed(slot2, ...)
	end

	return 
end
function ElementJobValue:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.key ~= "none" then
		if self._values.save then
			slot6 = self._values.value

			managers.mission.set_saved_job_value(slot3, managers.mission, self._values.key)
		else
			slot6 = self._values.value

			managers.mission.set_job_value(slot3, managers.mission, self._values.key)
		end
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot5 = "Cant set job value with key none."

			managers.editor.output_error(slot3, managers.editor)
		end
	end

	slot5 = instigator

	ElementJobValue.super.on_executed(slot3, self)

	return 
end

if not ElementJobValueFilter then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementJobValueFilter = slot0
function ElementJobValueFilter:init(...)
	slot3 = self

	ElementJobValueFilter.super.init(slot2, ...)

	return 
end
function ElementJobValueFilter:client_on_executed(...)
	return 
end
function ElementJobValueFilter:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local value = nil

	if self._values.save then
		slot6 = self._values.key
		value = managers.mission.get_saved_job_value(slot4, managers.mission)
	else
		slot6 = self._values.key
		value = managers.mission.get_job_value(slot4, managers.mission)
	end

	slot6 = value

	if not self._check_value(slot4, self) then
		return 
	end

	slot6 = instigator

	ElementJobValueFilter.super.on_executed(slot4, self)

	return 
end
function ElementJobValueFilter:_check_value(value)
	if self._values.check_type == "not_has_key" then
		return not value
	end

	if not value then
		return false
	end

	if self._values.check_type == "has_key" then
		return true
	end

	if not self._values.check_type or self._values.check_type == "equal" then
		return value == self._values.value
	end

	if self._values.check_type == "less_or_equal" then
		return value <= self._values.value
	end

	if self._values.check_type == "greater_or_equal" then
		return self._values.value <= value
	end

	if self._values.check_type == "less_than" then
		return value < self._values.value
	end

	if self._values.check_type == "greater_than" then
		return self._values.value < value
	end

	return 
end

if not ElementApplyJobValue then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementApplyJobValue = slot0
function ElementApplyJobValue:init(...)
	slot3 = self

	ElementApplyJobValue.super.init(slot2, ...)

	return 
end
function ElementApplyJobValue:client_on_executed(...)
	return 
end
function ElementApplyJobValue:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local value = nil

	if self._values.save then
		slot6 = self._values.key
		value = managers.mission.get_saved_job_value(slot4, managers.mission)
	else
		slot6 = self._values.key
		value = managers.mission.get_job_value(slot4, managers.mission)
	end

	slot5 = self._values.elements

	for _, id in ipairs(slot4) do
		slot11 = id
		local element = self.get_mission_element(slot9, self)

		if element then
			slot12 = value

			element.apply_job_value(slot10, element)
		end
	end

	slot6 = instigator

	ElementApplyJobValue.super.on_executed(slot4, self)

	return 
end

return 
