HUDMapPlayerPin = HUDMapPlayerPin or class()
HUDMapPlayerPin.W = 128
HUDMapPlayerPin.H = 128
function HUDMapPlayerPin:init(panel, params)
	self._id = params.id
	self._ai = params.ai or false
	self._hidden = false
	slot6 = panel

	self._create_panel(slot4, self)

	slot6 = params

	self._create_nationality_icon(slot4, self)

	return 
end
function HUDMapPlayerPin:_create_panel(panel)
	local panel_params = {
		visible = false,
		halign = "center",
		valign = "center"
	}
	slot6 = self._id
	panel_params.name = "player_pin_" .. tostring(slot5)
	panel_params.w = HUDMapPlayerPin.W
	panel_params.h = HUDMapPlayerPin.H
	slot6 = panel_params
	self._object = panel.panel(tostring(slot5), panel)

	return 
end
function HUDMapPlayerPin:_create_nationality_icon(params)
	local nationality = params.nationality or "german"
	local nationality_icon = "player_panel_nationality_" .. nationality
	local nationality_icon_params = {
		name = "nationality_icon",
		valign = "center",
		halign = "center",
		texture = tweak_data.gui.icons[nationality_icon].texture,
		texture_rect = tweak_data.gui.icons[nationality_icon].texture_rect
	}
	slot8 = nationality_icon_params
	self._nationality_icon = self._object.bitmap(slot6, self._object)
	slot10 = self._object
	slot8 = self._object.w(slot9) / 2

	self._nationality_icon.set_center_x(slot6, self._nationality_icon)

	slot10 = self._object
	slot8 = self._object.h(slot9) / 2

	self._nationality_icon.set_center_y(slot6, self._nationality_icon)

	return 
end
function HUDMapPlayerPin:set_nationality(nationality)
	local nationality_icon = "player_panel_nationality_" .. nationality
	slot6 = tweak_data.gui.icons[nationality_icon].texture

	self._nationality_icon.set_image(slot4, self._nationality_icon)

	slot5 = self._nationality_icon
	slot8 = tweak_data.gui.icons[nationality_icon].texture_rect

	self._nationality_icon.set_texture_rect(slot4, unpack(slot7))

	return 
end
function HUDMapPlayerPin:set_center_x(x)
	slot5 = x

	self._object.set_center_x(slot3, self._object)

	return 
end
function HUDMapPlayerPin:set_center_y(y)
	slot5 = y

	self._object.set_center_y(slot3, self._object)

	return 
end
function HUDMapPlayerPin:set_position(x, y)
	slot6 = x

	self.set_center_x(slot4, self)

	slot6 = y

	self.set_center_y(slot4, self)

	return 
end
function HUDMapPlayerPin:ai()
	return self._ai
end
function HUDMapPlayerPin:id()
	return self._id
end
function HUDMapPlayerPin:show()
	self._shown = true

	if not self._hidden then
		slot4 = true

		self._object.set_visible(slot2, self._object)
	end

	return 
end
function HUDMapPlayerPin:hide()
	self._shown = false
	slot4 = false

	self._object.set_visible(slot2, self._object)

	return 
end
function HUDMapPlayerPin:set_hidden(value)
	self._hidden = value
	slot5 = not value

	self._object.set_visible(slot3, self._object)

	if not self._hidden and self._shown then
		slot4 = self

		self.show(slot3)
	elseif self._hidden and not self._shown then
		slot4 = self

		self.hide(slot3)
	end

	return 
end

return 
