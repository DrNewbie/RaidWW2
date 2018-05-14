if not RaidGUIControlGridItemActive then
	slot2 = RaidGUIControlGridItem
	slot0 = class(slot1)
end

RaidGUIControlGridItemActive = slot0
function RaidGUIControlGridItemActive:init(parent, params, item_data, grid_params)
	slot11 = grid_params

	RaidGUIControlGridItemActive.super.init(slot6, self, parent, params, item_data)

	return 
end
function RaidGUIControlGridItemActive:active()
	return self._active
end
function RaidGUIControlGridItemActive:activate()
	self._active = true
	slot3 = self._triangle_markers_panel

	self._triangle_markers_panel.show(slot2)

	return 
end
function RaidGUIControlGridItemActive:deactivate()
	self._active = false
	slot3 = self._triangle_markers_panel

	self._triangle_markers_panel.hide(slot2)

	return 
end
function RaidGUIControlGridItemActive:select_on()
	slot3 = self._select_background_panel

	self._select_background_panel.show(slot2)

	return 
end
function RaidGUIControlGridItemActive:select_off()
	slot3 = self._select_background_panel

	self._select_background_panel.hide(slot2)

	return 
end

return 
