if not CarryUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CarryUnitElement = slot0
CarryUnitElement.SAVE_UNIT_POSITION = false
CarryUnitElement.SAVE_UNIT_ROTATION = false
function CarryUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.elements = {}
	self._hed.operation = "secure"
	self._hed.type_filter = "none"
	slot5 = "operation"

	table.insert("none", self._save_values)

	slot5 = "type_filter"

	table.insert("none", self._save_values)

	return 
end
function CarryUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = {
		"remove",
		"freeze",
		"secure",
		"secure_silent",
		"add_to_respawn",
		"filter_only"
	}

	self._build_value_combobox(slot4, self, panel, panel_sizer, "operation")

	slot8 = "type_filter"
	slot11 = {
		"none"
	}
	slot14 = tweak_data.carry

	self._build_value_combobox(slot4, self, panel, panel_sizer, table.list_add(slot10, tweak_data.carry.get_carry_ids(slot13)))

	return 
end

return 
