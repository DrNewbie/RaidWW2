if not RaidGUIControlInfoIcon then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlInfoIcon = slot0
RaidGUIControlInfoIcon.DEFAULT_WIDTH = 100
RaidGUIControlInfoIcon.DEFAULT_HEIGHT = 50
RaidGUIControlInfoIcon.TEXT_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlInfoIcon.TEXT_SIZE = tweak_data.gui.font_sizes.extra_small
RaidGUIControlInfoIcon.TITLE_TEXT_SIZE = 46
RaidGUIControlInfoIcon.COLOR = tweak_data.gui.colors.raid_black
RaidGUIControlInfoIcon.TOP_PADDING_DOWN = 5
RaidGUIControlInfoIcon.TOP_W = 48
RaidGUIControlInfoIcon.TOP_H = 48
function RaidGUIControlInfoIcon:init(parent, params)
	slot7 = params

	RaidGUIControlInfoIcon.super.init(slot4, self, parent)

	if not params.icon and not params.title then
		slot9 = self._name
		slot6 = "[RaidGUIControlInfoIcon:init] No icon or title set for info icon " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	if not params.text then
		slot9 = self._name
		slot6 = "[RaidGUIControlInfoIcon:init] No text set for info icon " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._init_panel(slot4)

	if params.icon then
		local icon_params = {
			y = 0,
			x = 0
		}
		slot6 = self._object
		icon_params.layer = self._object.layer(slot5) + 1
		icon_params.texture = tweak_data.gui.icons[self._params.icon].texture
		icon_params.texture_rect = tweak_data.gui.icons[self._params.icon].texture_rect
		icon_params.h = params.icon_h or RaidGUIControlInfoIcon.TOP_H
		icon_params.color = params.icon_color or RaidGUIControlInfoIcon.COLOR
		slot7 = icon_params
		self._top = self._object.bitmap(slot5, self._object)
		slot11 = self._params.icon
		slot12 = self._params.icon
		slot7 = self._top.h(slot8) * tweak_data.gui.icon_w(self._top, tweak_data.gui) / tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)

		self._top.set_w(slot5, self._top)

		slot6 = self._top
		self._top_w = self._top.w(slot5)
		slot6 = self._top
		self._top_h = self._top.h(slot5)
	else
		local title_params = {
			vertical = "center",
			wrap = false,
			align = "center",
			y = 0,
			x = 0
		}
		slot6 = self._object
		title_params.layer = self._object.layer(slot5) + 1
		title_params.font = RaidGUIControlInfoIcon.TEXT_FONT
		title_params.font_size = params.title_size or RaidGUIControlInfoIcon.TITLE_TEXT_SIZE
		title_params.h = params.title_h or RaidGUIControlInfoIcon.TOP_H
		title_params.color = params.title_color or RaidGUIControlInfoIcon.COLOR
		title_params.text = params.title
		slot7 = title_params
		self._top = self._object.text(slot5, self._object)
		slot6 = self._top
		local _, _, w, h = self._top.text_rect(slot5)
		slot11 = w

		self._top.set_w(slot9, self._top)

		slot11 = h

		self._top.set_h(slot9, self._top)

		self._top_w = w
		self._top_h = h
	end

	local text_params = {
		vertical = "center",
		wrap = false,
		align = "center",
		y = 0,
		x = 0,
		h = params.text_h or 0,
		font = RaidGUIControlInfoIcon.TEXT_FONT,
		font_size = params.text_size or RaidGUIControlInfoIcon.TEXT_SIZE,
		text = params.text,
		color = params.text_color or RaidGUIControlInfoIcon.COLOR
	}
	slot6 = self._object
	text_params.layer = self._object.layer(slot5) + 1
	slot7 = text_params
	self._text = self._object.text(slot5, self._object)
	slot6 = self._text
	local _, _, w, h = self._text.text_rect(slot5)
	slot11 = w

	self._text.set_w(slot9, self._text)

	if not params.text_h then
		slot11 = h

		self._text.set_h(slot9, self._text)
	end

	slot10 = self

	self._fit_size(slot9)

	self._align = self._params.align or "left"

	return 
end
function RaidGUIControlInfoIcon:_init_panel()
	local panel_params = clone(slot2)
	panel_params.name = panel_params.name .. "_info_icon"
	slot4 = self._panel
	panel_params.layer = self._panel.layer("_info_icon") + 1
	panel_params.x = self._params.x or 0
	panel_params.y = self._params.y or 0
	panel_params.w = self._params.w or RaidGUIControlInfoIcon.DEFAULT_WIDTH
	panel_params.h = self._params.h or RaidGUIControlInfoIcon.DEFAULT_HEIGHT
	slot5 = panel_params
	self._object = self._panel.panel(self._params, self._panel)

	return 
end
function RaidGUIControlInfoIcon:_fit_size()
	if not self._params.w then
		slot4 = self._text

		if self._text.w(self._top) <= self._top.w(slot2) then
			slot3 = self._object
			slot6 = self._top

			self._object.set_w(slot2, self._top.w(slot5))
		else
			slot3 = self._object
			slot6 = self._text

			self._object.set_w(slot2, self._text.w(slot5))
		end
	end

	if not self._params.h then
		slot7 = self._text
		slot4 = self._top.h(slot5) + RaidGUIControlInfoIcon.TOP_PADDING_DOWN + self._text.h(self._top)

		self._object.set_h(slot2, self._object)
	end

	slot6 = self._object
	slot4 = self._object.w(slot5) / 2

	self._top.set_center_x(slot2, self._top)

	slot4 = 0

	self._top.set_y(slot2, self._top)

	if self._params.top_offset_y then
		slot4 = self._params.top_offset_y

		self._top.set_y(slot2, self._top)
	end

	slot6 = self._object
	slot4 = self._object.w(slot5) / 2

	self._text.set_center_x(slot2, self._text)

	slot3 = self._text
	slot6 = self._object

	self._text.set_bottom(slot2, self._object.h(slot5))

	return 
end
function RaidGUIControlInfoIcon:set_icon(icon, params)
	if self._top then
		slot6 = self._top

		self._object.remove(slot4, self._object)
	end

	if not tweak_data.gui.icons[icon] then
		return 
	end

	local icon_params = {
		y = 0,
		x = 0
	}
	slot6 = self._object
	icon_params.layer = self._object.layer(slot5) + 1
	icon_params.texture = tweak_data.gui.icons[icon].texture
	icon_params.texture_rect = tweak_data.gui.icons[icon].texture_rect
	icon_params.h = (params and params.icon_h) or RaidGUIControlInfoIcon.TOP_H
	icon_params.color = (params and params.color) or Color.white
	slot7 = icon_params
	self._top = self._object.bitmap(slot5, self._object)
	slot11 = icon
	slot12 = icon
	slot7 = self._top.h(slot8) * tweak_data.gui.icon_w(self._top, tweak_data.gui) / tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)

	self._top.set_w(slot5, self._top)

	slot6 = self._top
	self._top_w = self._top.w(slot5)
	slot6 = self._top
	self._top_h = self._top.h(slot5)
	slot6 = self

	self._fit_size(slot5)

	return 
end
function RaidGUIControlInfoIcon:set_title(title, params)
	local h = nil

	if self._top then
		slot6 = self._top
		h = self._top.h(slot5)
		slot7 = self._top

		self._object.remove(slot5, self._object)
	end

	local x = 0

	if self._align == "left" then
		slot7 = self._object
		x = self._object.x(slot6)
	elseif self._align == "center" then
		slot7 = self._object
		x = self._object.center_x(slot6)
	elseif self._align == "right" then
		slot7 = self._object
		x = self._object.right(slot6)
	end

	local title_params = {
		vertical = "center",
		wrap = false,
		align = "center",
		y = 0,
		x = 0
	}
	slot8 = self._object
	title_params.layer = self._object.layer(slot7) + 1
	title_params.font = (params and params.font) or RaidGUIControlInfoIcon.TEXT_FONT
	title_params.font_size = (params and params.font_size) or RaidGUIControlInfoIcon.TITLE_TEXT_SIZE
	title_params.h = h or RaidGUIControlInfoIcon.TOP_H
	title_params.color = (params and params.color) or RaidGUIControlInfoIcon.COLOR
	title_params.text = title
	slot9 = title_params
	self._top = self._object.text(slot7, self._object)
	slot8 = self._top
	local _, _, w, h = self._top.text_rect(slot7)
	slot13 = w

	self._top.set_w(slot11, self._top)

	slot13 = h

	self._top.set_h(slot11, self._top)

	self._top_w = w
	self._top_h = h
	slot12 = self

	self._fit_size(slot11)

	if self._align == "left" then
		slot13 = x

		self.set_x(slot11, self)
	elseif self._align == "center" then
		slot13 = x

		self.set_center_x(slot11, self)
	elseif self._align == "right" then
		slot13 = x

		self.set_right(slot11, self)
	end

	return 
end
function RaidGUIControlInfoIcon:set_text(text, params)
	if self._text then
		slot6 = self._text

		self._object.remove(slot4, self._object)
	end

	local x = 0

	if self._align == "left" then
		slot6 = self._object
		x = self._object.x(slot5)
	elseif self._align == "center" then
		slot6 = self._object
		x = self._object.center_x(slot5)
	elseif self._align == "right" then
		slot6 = self._object
		x = self._object.right(slot5)
	end

	local text_params = {
		vertical = "center",
		wrap = false,
		align = "center",
		y = 0,
		x = 0,
		font = RaidGUIControlInfoIcon.TEXT_FONT,
		font_size = (params and params.text_size) or RaidGUIControlInfoIcon.TEXT_SIZE
	}

	if not params or not params.no_translate or not text then
		slot9 = true
		slot5 = self.translate(slot6, self, text)
	end

	text_params.text = slot5
	text_params.color = (params and params.color) or RaidGUIControlInfoIcon.COLOR
	slot7 = self._object
	text_params.layer = self._object.layer(slot6) + 1
	slot8 = text_params
	self._text = self._object.text(slot6, self._object)
	slot7 = self._text
	local _, _, w, h = self._text.text_rect(slot6)
	slot12 = w

	self._text.set_w(slot10, self._text)

	slot12 = h

	self._text.set_h(slot10, self._text)

	slot11 = self

	self._fit_size(slot10)

	if self._align == "left" then
		slot12 = x

		self.set_x(slot10, self)
	elseif self._align == "center" then
		slot12 = x

		self.set_center_x(slot10, self)
	elseif self._align == "right" then
		slot12 = x

		self.set_right(slot10, self)
	end

	return 
end
function RaidGUIControlInfoIcon:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	self._align = "left"

	return 
end
function RaidGUIControlInfoIcon:set_center_x(x)
	slot5 = x

	self._object.set_center_x(slot3, self._object)

	self._align = "center"

	return 
end
function RaidGUIControlInfoIcon:set_center_y(y)
	slot5 = y

	self._object.set_center_y(slot3, self._object)

	return 
end
function RaidGUIControlInfoIcon:set_right(x)
	slot5 = x

	self._object.set_right(slot3, self._object)

	self._align = "right"

	return 
end
function RaidGUIControlInfoIcon:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function RaidGUIControlInfoIcon:set_bottom(bottom)
	slot5 = bottom

	self._object.set_bottom(slot3, self._object)

	return 
end
function RaidGUIControlInfoIcon:set_alpha(alpha)
	slot5 = alpha

	self._object.set_alpha(slot3, self._object)

	return 
end
function RaidGUIControlInfoIcon:show()
	slot4 = true

	self._object.set_visible(slot2, self._object)

	return 
end
function RaidGUIControlInfoIcon:hide()
	slot4 = false

	self._object.set_visible(slot2, self._object)

	return 
end

return 
