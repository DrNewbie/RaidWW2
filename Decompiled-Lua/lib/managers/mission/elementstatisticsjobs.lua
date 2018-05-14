slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementStatisticsJobs then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementStatisticsJobs = slot0
function ElementStatisticsJobs:init(...)
	slot3 = self

	ElementStatisticsJobs.super.init(slot2, ...)

	return 
end
function ElementStatisticsJobs:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot9 = self._values.include_dropin
	local value = self._completed_job_data(slot3, self, self._values.job, self._values.state, self._values.difficulty ~= "all" and self._values.difficulty, self._values.include_prof)

	if value < self._values.required then
		return 
	end

	slot6 = instigator

	ElementStatisticsJobs.super.on_executed(slot4, self)

	return 
end
function ElementStatisticsJobs:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementStatisticsJobs:_completed_job_data(job_id, state, difficulty, prof, dropin)
	local count = 0

	if not difficulty then
		slot9 = tweak_data.difficulties

		for _, diff in pairs(slot8) do
			slot15 = job_id
			slot17 = diff
			count = count + (job_list[tostring(slot14) .. "_" .. tostring(slot16) .. "_" .. state] or 0)
		end
	end

	slot10 = job_id
	slot12 = difficulty
	count = count + (job_list[tostring(slot9) .. "_" .. tostring(slot11) .. "_" .. state] or 0)

	if prof then
		slot14 = dropin
		count = count + self._completed_job_data(slot8, self, job_id .. "_prof", state, difficulty, false)
	end

	if dropin then
		slot10 = "_dropin"

		if not string.find(slot8, state) then
			slot14 = false
			count = count + self._completed_job_data(slot8, self, job_id, state .. "_dropin", difficulty, prof)
		end
	end

	return count
end

return 
