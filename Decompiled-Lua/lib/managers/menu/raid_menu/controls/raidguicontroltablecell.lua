if not RaidGUIControlTableCell then
	slot2 = RaidGUIControlLabel
	slot0 = class(slot1)
end

RaidGUIControlTableCell = slot0
RaidGUIControlTableCell.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlTableCell.FONT_SIZE = tweak_data.gui.font_sizes.small
function RaidGUIControlTableCell:init(parent, params, row_data, table_params)
	params.font = params.font or RaidGUIControlTableCell.FONT
	params.font_size = params.font_size or RaidGUIControlTableCell.FONT_SIZE
	slot9 = params

	RaidGUIControlTableCell.super.init(slot6, self, parent)

	self._table_params = table_params
	self._data = {
		value = params.value
	}

	return 
end
function RaidGUIControlTableCell:highlight_on()
	slot3 = self._object

	if alive(slot2) and self._table_params and self._table_params.row_params and self._table_params.row_params.color and self._table_params.row_params.highlight_color then
		slot4 = tweak_data.gui.colors.raid_table_cell_highlight_on

		self._object.set_color(slot2, self._object)
	end

	return 
end
function RaidGUIControlTableCell:highlight_off()
	slot3 = self._object

	if alive(slot2) and self._table_params and self._table_params.row_params and self._table_params.row_params.color and self._table_params.row_params.highlight_color then
		slot4 = tweak_data.gui.colors.raid_table_cell_highlight_off

		self._object.set_color(slot2, self._object)
	end

	return 
end
function RaidGUIControlTableCell:select_on()
	slot3 = self._object

	if alive(slot2) and self._params.selected_color and self._params.color then
		slot4 = tweak_data.gui.colors.raid_red

		self._object.set_color(slot2, self._object)
	end

	return 
end
function RaidGUIControlTableCell:select_off()
	slot3 = self._object

	if alive(slot2) and self._params.selected_color and self._params.color then
		slot4 = self._params.color

		self._object.set_color(slot2, self._object)
	end

	return 
end
function RaidGUIControlTableCell:on_double_click(button)
	if self._params.on_double_click_callback then
		slot6 = self._data

		self._params.on_double_click_callback(slot3, button, self)
	end

	return 
end

return 
