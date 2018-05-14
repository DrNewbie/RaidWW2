if not KillzoneUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

KillzoneUnitElement = slot0
function KillzoneUnitElement:init(unit)
	slot5 = unit

	KillzoneUnitElement.super.init(slot3, self)

	self._hed.type = "sniper"
	slot5 = "type"

	table.insert("sniper", self._save_values)

	return 
end
function KillzoneUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = {
		"sniper",
		"gas",
		"fire"
	}

	self._build_value_combobox(slot4, self, panel, panel_sizer, "type")

	return 
end

return 
