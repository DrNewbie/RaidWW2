if not BarrageUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

BarrageUnitElement = slot0
BarrageUnitElement.SAVE_UNIT_POSITION = false
BarrageUnitElement.SAVE_UNIT_ROTATION = false
function BarrageUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.elements = {}
	self._hed.operation = "start"
	self._hed.type = "default"
	slot5 = "operation"

	table.insert("default", self._save_values)

	slot5 = "type"

	table.insert("default", self._save_values)

	return 
end
function BarrageUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = {
		"start",
		"stop",
		"set_spotter_type"
	}

	self._build_value_combobox(slot4, self, panel, panel_sizer, "operation")

	slot8 = "type"
	slot11 = tweak_data.barrage

	self._build_value_combobox(slot4, self, panel, panel_sizer, tweak_data.barrage.get_barrage_ids(slot10))

	return 
end

return 
