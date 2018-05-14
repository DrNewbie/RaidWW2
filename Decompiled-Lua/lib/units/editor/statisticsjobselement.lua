if not StatisticsJobsElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

StatisticsJobsElement = slot0
StatisticsJobsElement.SAVE_UNIT_POSITION = false
StatisticsJobsElement.SAVE_UNIT_ROTATION = false
function StatisticsJobsElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.elements = {}
	self._hed.job = "four_stores"
	self._hed.state = "completed"
	self._hed.difficulty = "all"
	self._hed.include_prof = true
	self._hed.include_dropin = false
	self._hed.required = 1
	slot5 = "job"

	table.insert(1, self._save_values)

	slot5 = "state"

	table.insert(1, self._save_values)

	slot5 = "difficulty"

	table.insert(1, self._save_values)

	slot5 = "include_prof"

	table.insert(1, self._save_values)

	slot5 = "include_dropin"

	table.insert(1, self._save_values)

	slot5 = "required"

	table.insert(1, self._save_values)

	return 
end
function StatisticsJobsElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local job_list = {}
	slot6 = tweak_data.operations.missions

	for job, data in pairs(slot5) do
		slot12 = job

		table.insert(slot10, job_list)
	end

	slot6 = job_list

	table.sort(slot5)

	slot11 = "Select the required job"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "job", job_list)

	local states = {
		"started",
		"started_dropin",
		"completed",
		"completed_dropin",
		"failed",
		"failed_dropin"
	}
	slot12 = "Select the required play state."

	self._build_value_combobox(self, self, panel, panel_sizer, "state", states)

	local difficulties = deep_clone(self)
	slot9 = "all"

	table.insert(tweak_data.difficulties, difficulties)

	slot13 = "Select the required difficulty."

	self._build_value_combobox(tweak_data.difficulties, self, panel, panel_sizer, "difficulty", difficulties)

	slot12 = "Select if professional heists should be included."

	self._build_value_checkbox(tweak_data.difficulties, self, panel, panel_sizer, "include_prof")

	slot12 = "Select if drop-in is counted as well."

	self._build_value_checkbox(tweak_data.difficulties, self, panel, panel_sizer, "include_dropin")

	slot13 = "Type the required amount that is needed."

	self._build_value_number(tweak_data.difficulties, self, panel, panel_sizer, "required", {
		floats = 0,
		min = 1
	})

	return 
end

return 
