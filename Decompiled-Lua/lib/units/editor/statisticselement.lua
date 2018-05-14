if not StatisticsElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

StatisticsElement = slot0
StatisticsElement.SAVE_UNIT_POSITION = false
StatisticsElement.SAVE_UNIT_ROTATION = false
function StatisticsElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.elements = {}
	slot5 = tweak_data.statistics
	self._hed.name = tweak_data.statistics.mission_statistics_table(self)[1]
	slot5 = "name"

	table.insert(tweak_data.statistics.mission_statistics_table(self)[1], self._save_values)

	return 
end
function StatisticsElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = tweak_data.statistics
	slot10 = "Select an mission statistics from the combobox"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "name", tweak_data.statistics.mission_statistics_table(slot10))

	return 
end

return 
