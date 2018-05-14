if not MapChangeFloorElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

MapChangeFloorElement = slot0
function MapChangeFloorElement:init(unit)
	slot5 = unit

	MapChangeFloorElement.super.init(slot3, self)

	self._hed.floor = 1
	slot5 = "floor"

	table.insert(1, self._save_values)

	return 
end
function MapChangeFloorElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Sets the map floor."
	local floor, floor_params = self._build_value_number(slot4, self, panel, panel_sizer, "floor", {
		floats = 0,
		min = 1
	})
	slot8 = "Floor:"

	floor_params.name_ctrlr.set_label(panel, floor_params.name_ctrlr)

	self._floor_params = floor_params

	return 
end

return 
