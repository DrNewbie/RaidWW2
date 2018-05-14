if not RaidGUIControlListItemIconDescription then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlListItemIconDescription = slot0
RaidGUIControlListItemIconDescription.ICON_PADDING = 4
RaidGUIControlListItemIconDescription.ICON_PADDING_RIGHT = 10
RaidGUIControlListItemIconDescription.ICON_WIDTH = 42
RaidGUIControlListItemIconDescription.ICON_HEIGHT = 42
RaidGUIControlListItemIconDescription.FONT = tweak_data.gui.fonts.lato
RaidGUIControlListItemIconDescription.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_24
RaidGUIControlListItemIconDescription.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.paragraph
RaidGUIControlListItemIconDescription.COLOR = tweak_data.gui.colors.raid_black
RaidGUIControlListItemIconDescription.ACTIVE_COLOR = tweak_data.gui.colors.raid_light_red
RaidGUIControlListItemIconDescription.TITLE_PADDING_DOWN = 13
RaidGUIControlListItemIconDescription.PANEL_PADDING_DOWN = 13
RaidGUIControlListItemIconDescription.SIDELINE_W = 3
function RaidGUIControlListItemIconDescription:init(parent, params, data)
	slot8 = params

	RaidGUIControlListItemIconDescription.super.init(slot5, self, parent)

	if not params.on_click_callback then
		slot8 = params.name

		Application.error(slot5, Application, "[RaidGUIControlListItemIconDescription:init] On click callback not specified for list item: ")
	end

	self._on_click_callback = params.on_click_callback
	self._on_item_selected_callback = params.on_item_selected_callback
	self._on_double_click_callback = params.on_double_click_callback
	self._data = data
	slot6 = self

	self._create_panel(slot5)

	slot6 = self

	self._create_sideline(slot5)

	slot6 = self

	self._create_icon(slot5)

	slot6 = self

	self._create_title(slot5)

	slot6 = self

	self._create_description(slot5)

	slot10 = self._description
	slot7 = self._description.y(slot8) + self._description.h(self._description) + RaidGUIControlListItemIconDescription.PANEL_PADDING_DOWN

	self._object.set_h(slot5, self._object)

	self._selectable = self._data.selectable
	self._selected = false
	slot6 = self

	self.highlight_off(slot5)

	return 
end
function RaidGUIControlListItemIconDescription:_create_panel()
	local panel_params = {
		name = "list_item_" .. self._name,
		x = self._params.x or 0,
		y = self._params.y or 0
	}

	if not self._params.w then
		slot4 = self._panel
		slot2 = self._panel.w(slot3)
	end

	panel_params.w = slot2

	if not self._params.h then
		slot4 = self._panel
		slot2 = self._panel.h(slot3)
	end

	panel_params.h = slot2
	slot5 = panel_params
	self._object = self._panel.panel(slot3, self._panel)

	return 
end
function RaidGUIControlListItemIconDescription:_create_sideline()
	local sideline_params = {
		alpha = 0,
		x = 0,
		y = (self._params.h - RaidGUIControlListItemIconDescription.ICON_HEIGHT) / 2,
		w = RaidGUIControlListItemIconDescription.SIDELINE_W,
		h = RaidGUIControlListItemIconDescription.ICON_HEIGHT,
		color = RaidGUIControlListItemIconDescription.ACTIVE_COLOR
	}
	slot5 = sideline_params
	self._sideline = self._object.rect(RaidGUIControlListItemIconDescription.ICON_HEIGHT, self._object)

	return 
end
function RaidGUIControlListItemIconDescription:_create_icon()
	local icon_params = {
		name = "list_item_icon_" .. self._name
	}
	slot5 = self._sideline
	icon_params.x = self._sideline.x(self._name) + self._sideline.w(self._sideline) + RaidGUIControlListItemIconDescription.ICON_PADDING
	icon_params.y = (self._params.h - RaidGUIControlListItemIconDescription.ICON_HEIGHT) / 2
	icon_params.w = RaidGUIControlListItemIconDescription.ICON_WIDTH
	icon_params.h = RaidGUIControlListItemIconDescription.ICON_HEIGHT
	icon_params.texture = self._data.icon.texture
	icon_params.texture_rect = self._data.icon.texture_rect
	slot5 = icon_params
	self._icon = self._object.bitmap(RaidGUIControlListItemIconDescription.ICON_HEIGHT, self._object)

	if self._params.icon_color then
		slot5 = self._params.icon_color

		self._icon.set_color(slot3, self._icon)
	end

	return 
end
function RaidGUIControlListItemIconDescription:_create_title()
	local title_params = {
		vertical = "center",
		y = 0
	}
	slot5 = self._name
	title_params.name = "list_item_title_" .. tostring(slot4)
	slot5 = self._icon
	title_params.x = self._icon.x(tostring(slot4)) + self._icon.w(self._icon) + RaidGUIControlListItemIconDescription.ICON_PADDING_RIGHT
	title_params.w = self._params.w
	title_params.h = self._params.h
	title_params.text = self._data.title
	title_params.font = RaidGUIControlListItemIconDescription.FONT
	title_params.font_size = RaidGUIControlListItemIconDescription.TITLE_FONT_SIZE
	title_params.color = RaidGUIControlListItemIconDescription.COLOR
	slot5 = title_params
	self._title = self._object.text(RaidGUIControlListItemIconDescription.ICON_PADDING_RIGHT, self._object)
	slot8 = self._title
	slot5 = self._object.w(slot6) - self._title.x(self._object)

	self._title.set_w(RaidGUIControlListItemIconDescription.ICON_PADDING_RIGHT, self._title)

	slot4 = self._title
	local _, _, w, h = self._title.text_rect(RaidGUIControlListItemIconDescription.ICON_PADDING_RIGHT)
	slot9 = h

	self._title.set_h(self._object, self._title)

	slot8 = self._title
	slot11 = self._icon

	self._title.set_center_y(self._object, self._icon.center_y(slot10))

	return 
end
function RaidGUIControlListItemIconDescription:_create_description()
	local description_params = {
		wrap = true,
		vertical = "center"
	}
	slot5 = self._name
	slot3 = tostring(slot4)
	description_params.name = "list_item_description_" .. slot3
	slot4 = self._title
	description_params.x = self._title.x(slot3)
	slot5 = self._title
	description_params.y = self._title.y(slot3) + self._title.h(self._title) + RaidGUIControlListItemIconDescription.TITLE_PADDING_DOWN
	description_params.w = self._params.w
	description_params.h = self._params.h
	description_params.text = self._data.description
	description_params.font = RaidGUIControlListItemIconDescription.FONT
	description_params.font_size = RaidGUIControlListItemIconDescription.DESCRIPTION_FONT_SIZE
	description_params.color = RaidGUIControlListItemIconDescription.COLOR
	slot5 = description_params
	self._description = self._object.text(RaidGUIControlListItemIconDescription.TITLE_PADDING_DOWN, self._object)
	slot8 = self._description
	slot5 = self._object.w(slot6) - self._description.x(self._object)

	self._description.set_w(RaidGUIControlListItemIconDescription.TITLE_PADDING_DOWN, self._description)

	slot5 = self._data.description

	self._description.set_text(RaidGUIControlListItemIconDescription.TITLE_PADDING_DOWN, self._description)

	slot4 = self._description
	local _, _, w, h = self._description.text_rect(RaidGUIControlListItemIconDescription.TITLE_PADDING_DOWN)
	slot9 = h

	self._description.set_h(self._object, self._description)

	return 
end
function RaidGUIControlListItemIconDescription:on_mouse_released(button)
	if self._on_click_callback then
		slot6 = self._data

		self._on_click_callback(slot3, button, self)
	end

	if self._params.list_item_selected_callback then
		slot4 = self._name

		self._params.list_item_selected_callback(slot3)
	end

	return 
end
function RaidGUIControlListItemIconDescription:mouse_double_click(o, button, x, y)
	if self._params.no_click then
		return 
	end

	if self._on_double_click_callback then
		slot9 = self._data

		self._on_double_click_callback(slot6, nil, self)

		return true
	end

	return 
end
function RaidGUIControlListItemIconDescription:selected()
	return self._selected
end
function RaidGUIControlListItemIconDescription:select()
	self._selected = true
	slot4 = RaidGUIControlListItemIconDescription.ACTIVE_COLOR

	self._title.set_color(slot2, self._title)

	slot4 = RaidGUIControlListItemIconDescription.ACTIVE_COLOR

	self._icon.set_color(slot2, self._icon)

	slot4 = 1

	self._sideline.set_alpha(slot2, self._sideline)

	return 
end
function RaidGUIControlListItemIconDescription:unselect()
	self._selected = false

	if not self._active then
		slot4 = RaidGUIControlListItemIconDescription.COLOR

		self._title.set_color(slot2, self._title)
	end

	slot4 = self._params.icon_color or Color.white

	self._icon.set_color(slot2, self._icon)

	slot4 = 0

	self._sideline.set_alpha(slot2, self._sideline)

	return 
end
function RaidGUIControlListItemIconDescription:data()
	return self._data
end
function RaidGUIControlListItemIconDescription:highlight_on()
	slot4 = RaidGUIControlListItemIconDescription.ACTIVE_COLOR

	self._title.set_color(slot2, self._title)

	return 
end
function RaidGUIControlListItemIconDescription:highlight_off()
	if not self._active then
		slot4 = RaidGUIControlListItemIconDescription.COLOR

		self._title.set_color(slot2, self._title)
	end

	slot4 = self._params.icon_color or Color.white

	self._icon.set_color(slot2, self._icon)

	slot4 = 0

	self._sideline.set_alpha(slot2, self._sideline)

	return 
end
function RaidGUIControlListItemIconDescription:confirm_pressed()
	slot3 = self
	slot6 = "0"

	self.on_mouse_released(slot2, Idstring(slot5))

	return 
end
function RaidGUIControlListItemIconDescription:activate()
	self._active = true
	slot3 = self

	self.highlight_on(slot2)

	return 
end
function RaidGUIControlListItemIconDescription:deactivate()
	self._active = false
	slot3 = self

	self.highlight_off(slot2)

	return 
end
function RaidGUIControlListItemIconDescription:activated()
	return self._active
end

return 
