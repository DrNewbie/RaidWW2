if not RaidGUIControlLabel then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlLabel = slot0
function RaidGUIControlLabel:init(parent, params)
	slot7 = params

	RaidGUIControlLabel.super.init(slot4, self, parent)

	if not self._params.text_id and not self._params.text then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlLabel:init] Text not specified for the label control: ")

		return 
	end

	local default_font_size = tweak_data.gui.font_sizes.size_24
	slot8 = default_font_size
	local default_font = tweak_data.gui.get_font_path(slot5, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	self._params.font = self._params.font or default_font
	self._params.font_size = self._params.font_size or default_font_size
	slot5 = self._params

	if not self._params.text then
		slot9 = self._params.text_id
		slot6 = managers.localization.text(slot7, managers.localization)
	end

	slot5.text = slot6
	self._params.text_id = nil
	self._params.background_color = params.item_background_color
	self._params.vertical = params.vertical

	if self._params.background_color then
		local background_params = clone(slot6)
		background_params.color = self._params.background_color
		slot9 = background_params
		self._background = self._panel.rect(self._params, self._panel)
	end

	self._params.layer = self._params.layer + 2

	if self._params.text_padding then
		self._params.x = self._params.x + self._params.text_padding
	end

	slot8 = self._params
	self._object = self._panel.text(slot6, self._panel)

	if self._params.text_padding then
		self._params.x = self._params.x - self._params.text_padding
		slot10 = self._object
		slot8 = self._object.w(slot9) - self._params.text_padding * 2

		self._object.set_w(self._params.x - self._params.text_padding, self._object)
	end

	self._params.layer = self._params.layer - 1

	return 
end
function RaidGUIControlLabel:is_alive()
	if self._object then
		slot3 = self._object
		slot1 = alive(slot2)
	end

	return slot1
end
function RaidGUIControlLabel:set_text(text)
	slot5 = text

	self._object.set_text(slot3, self._object)

	return 
end
function RaidGUIControlLabel:text()
	slot3 = self._object

	return self._object.text(slot2)
end
function RaidGUIControlLabel:set_align(align)
	slot5 = align

	self._object.set_align(slot3, self._object)

	return 
end
function RaidGUIControlLabel:color()
	slot3 = self._object

	self._object.color(slot2)

	return 
end
function RaidGUIControlLabel:set_color(color)
	slot5 = color

	self._object.set_color(slot3, self._object)

	return 
end
function RaidGUIControlLabel:set_alpha(alpha)
	slot5 = alpha

	self._object.set_alpha(slot3, self._object)

	return 
end
function RaidGUIControlLabel:set_font(font)
	slot5 = font

	self._object.set_font(slot3, self._object)

	return 
end
function RaidGUIControlLabel:set_font_size(size)
	slot5 = size

	self._object.set_font_size(slot3, self._object)

	return 
end
function RaidGUIControlLabel:highlight_on()
	return 
end
function RaidGUIControlLabel:highlight_off()
	return 
end
function RaidGUIControlLabel:center_x(coord)
	slot5 = coord

	return self._object.center_x(slot3, self._object)
end
function RaidGUIControlLabel:center_y(coord)
	slot5 = coord

	return self._object.center_y(slot3, self._object)
end
function RaidGUIControlLabel:set_center_x(coord)
	slot5 = coord

	self._object.set_center_x(slot3, self._object)

	return 
end
function RaidGUIControlLabel:set_center_y(coord)
	slot5 = coord

	self._object.set_center_y(slot3, self._object)

	return 
end
function RaidGUIControlLabel:text_rect()
	slot3 = self._object

	return self._object.text_rect(slot2)
end
function RaidGUIControlLabel:set_width(width)
	slot5 = width

	self._object.set_width(slot3, self._object)

	return 
end
function RaidGUIControlLabel:set_height(height)
	slot5 = height

	self._object.set_height(slot3, self._object)

	return 
end
function RaidGUIControlLabel:mouse_released(o, button, x, y)
	return false
end

return 
