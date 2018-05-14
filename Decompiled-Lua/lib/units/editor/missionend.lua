if not MissionEndUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

MissionEndUnitElement = slot0
function MissionEndUnitElement:init(unit)
	slot5 = unit

	MissionEndUnitElement.super.init(slot3, self)

	self._hed.state = "none"
	slot5 = "state"

	table.insert("none", self._save_values)

	return 
end
function MissionEndUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = {
		"none",
		"success",
		"failed",
		"leave_safehouse"
	}

	self._build_value_combobox(slot4, self, panel, panel_sizer, "state")

	return 
end

return 
