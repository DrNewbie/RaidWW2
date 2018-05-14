if not EquipmentUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

EquipmentUnitElement = slot0
function EquipmentUnitElement:init(unit)
	slot5 = unit

	EquipmentUnitElement.super.init(slot3, self)

	self._hed.equipment = "none"
	self._hed.amount = 1
	slot5 = "equipment"

	table.insert(1, self._save_values)

	slot5 = "amount"

	table.insert(1, self._save_values)

	return 
end
function EquipmentUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "equipment"
	slot11 = {
		"none"
	}
	slot14 = tweak_data.equipments.specials

	self._build_value_combobox(slot4, self, panel, panel_sizer, table.list_add(slot10, table.map_keys(slot13)))

	slot10 = "Specifies how many of this equipment to recieve (only work on those who has a max_amount set in their tweak data)."

	self._build_value_number(slot4, self, panel, panel_sizer, "amount", {
		floats = 0,
		min = 1
	})

	return 
end

return 
