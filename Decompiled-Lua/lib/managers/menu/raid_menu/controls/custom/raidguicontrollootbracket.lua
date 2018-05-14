if not RaidGUIControlLootBracket then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlLootBracket = slot0
RaidGUIControlLootBracket.BRONZE = tweak_data.gui.colors.raid_red
RaidGUIControlLootBracket.SILVER = Color.white
slot3 = "f1a130"
RaidGUIControlLootBracket.GOLD = Color(slot2)
RaidGUIControlLootBracket.ICON = "reward_loot"
RaidGUIControlLootBracket.ICON_INACTIVE_SIZE = 202
RaidGUIControlLootBracket.ICON_INACTIVE_H = 213
RaidGUIControlLootBracket.ICON_ACTIVE_H = 283
RaidGUIControlLootBracket.ICON_ACTIVE_PADDING_BOTTOM = 9
RaidGUIControlLootBracket.DEFAULT_W = 283
RaidGUIControlLootBracket.DEFAULT_H = 320
RaidGUIControlLootBracket.NOTCH_W = 3
RaidGUIControlLootBracket.NOTCH_H = 50
RaidGUIControlLootBracket.NOTCH_COLOR = Color.white
RaidGUIControlLootBracket.NOTCH_ICON = "slider_pin"
slot3 = "787878"
RaidGUIControlLootBracket.NOTCH_COLOR_INACTIVE = Color(slot2)
RaidGUIControlLootBracket.NOTCH_COLOR_ACTIVE = tweak_data.gui.colors.raid_red
RaidGUIControlLootBracket.NOTCH_PADDING_TOP = 19
RaidGUIControlLootBracket.NOTCH_PADDING_BOTTOM = 13
function RaidGUIControlLootBracket:init(parent, params)
	slot7 = params

	RaidGUIControlLootBracket.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlLootBracket:init] Parameters not specified for the customization details"

		Application.error(slot4, Application)

		return 
	end

	self._bracket = params.bracket or RaidGUIControlLootBracket.SILVER
	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_notch(slot4)

	slot5 = self

	self._create_bracket_icon(slot4)

	return 
end
function RaidGUIControlLootBracket:_create_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.name = control_params.name .. "_panel"

	if not self._params.layer then
		slot4 = self._panel
		slot2 = self._panel.layer(slot3) + 1
	end

	control_params.layer = slot2
	control_params.w = self._params.w or RaidGUIControlLootBracket.DEFAULT_W
	control_params.h = self._params.h or RaidGUIControlLootBracket.DEFAULT_H
	slot5 = control_params
	self._control_panel = self._panel.panel(slot3, self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlLootBracket:_create_notch()
	local notch_params = {
		name = "notch",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[RaidGUIControlLootBracket.NOTCH_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlLootBracket.NOTCH_ICON].texture_rect,
		color = RaidGUIControlLootBracket.NOTCH_COLOR_INACTIVE
	}
	slot4 = self._object
	notch_params.layer = self._object.layer(RaidGUIControlLootBracket.NOTCH_ICON) + 1
	slot5 = notch_params
	self._notch = self._object.bitmap(RaidGUIControlLootBracket.NOTCH_ICON, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._notch.set_center_x(RaidGUIControlLootBracket.NOTCH_ICON, self._notch)

	slot7 = self._object
	slot5 = self._object.h(slot6) - RaidGUIControlLootBracket.NOTCH_PADDING_BOTTOM

	self._notch.set_bottom(RaidGUIControlLootBracket.NOTCH_ICON, self._notch)

	return 
end
function RaidGUIControlLootBracket:_create_bracket_icon()
	local bracket_icon_params = {
		name = "bracket_icon",
		y = 0,
		x = 0,
		h = RaidGUIControlLootBracket.ICON_INACTIVE_H
	}
	slot6 = RaidGUIControlLootBracket.ICON
	slot7 = RaidGUIControlLootBracket.ICON
	bracket_icon_params.w = RaidGUIControlLootBracket.ICON_INACTIVE_H * tweak_data.gui.icon_w(slot4, tweak_data.gui) / tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
	bracket_icon_params.texture = tweak_data.gui.icons[RaidGUIControlLootBracket.ICON].texture
	bracket_icon_params.texture_rect = tweak_data.gui.icons[RaidGUIControlLootBracket.ICON].texture_rect
	bracket_icon_params.color = self._bracket
	slot4 = self._object
	bracket_icon_params.layer = self._object.layer(RaidGUIControlLootBracket.ICON) + 2
	slot5 = bracket_icon_params
	self._bracket_icon = self._object.bitmap(RaidGUIControlLootBracket.ICON, self._object)
	slot7 = self._object
	slot5 = self._object.w(tweak_data.gui) / 2

	self._bracket_icon.set_center_x(RaidGUIControlLootBracket.ICON, self._bracket_icon)

	slot7 = self._notch
	slot5 = self._notch.y(tweak_data.gui) - RaidGUIControlLootBracket.NOTCH_PADDING_TOP

	self._bracket_icon.set_bottom(RaidGUIControlLootBracket.ICON, self._bracket_icon)

	return 
end
function RaidGUIControlLootBracket:activate()
	slot3 = self._bracket_icon

	self._bracket_icon.stop(slot2)

	slot3 = self._bracket_icon
	slot8 = "_animate_activate"

	self._bracket_icon.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlLootBracket:deactivate()
	slot3 = self._bracket_icon

	self._bracket_icon.stop(slot2)

	slot3 = self._bracket_icon
	slot8 = "_animate_deactivate"

	self._bracket_icon.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlLootBracket:_animate_activate()
	local duration = 0.25
	slot5 = self._object
	local t = (self._bracket_icon.w(slot3) - RaidGUIControlLootBracket.ICON_INACTIVE_SIZE) / (self._object.w(self._bracket_icon) - RaidGUIControlLootBracket.ICON_INACTIVE_SIZE) * duration
	slot6 = "bronze_silver_gold_icon"

	managers.menu_component.post_event(RaidGUIControlLootBracket.ICON_INACTIVE_SIZE, managers.menu_component)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_bottom_padding = Easing.quartic_in_out(slot5, t, 0, RaidGUIControlLootBracket.ICON_ACTIVE_PADDING_BOTTOM)
		slot10 = duration
		local current_size = Easing.quartic_in_out(t, t, RaidGUIControlLootBracket.ICON_INACTIVE_H, RaidGUIControlLootBracket.ICON_ACTIVE_H - RaidGUIControlLootBracket.ICON_INACTIVE_H)
		slot11 = duration
		local current_r = Easing.quartic_in_out(t, t, RaidGUIControlLootBracket.NOTCH_COLOR_INACTIVE.r, RaidGUIControlLootBracket.NOTCH_COLOR_ACTIVE.r - RaidGUIControlLootBracket.NOTCH_COLOR_INACTIVE.r)
		slot12 = duration
		local current_g = Easing.quartic_in_out(t, t, RaidGUIControlLootBracket.NOTCH_COLOR_INACTIVE.g, RaidGUIControlLootBracket.NOTCH_COLOR_ACTIVE.g - RaidGUIControlLootBracket.NOTCH_COLOR_INACTIVE.g)
		local current_b = Easing.quartic_in_out(t, t, RaidGUIControlLootBracket.NOTCH_COLOR_INACTIVE.b, RaidGUIControlLootBracket.NOTCH_COLOR_ACTIVE.b - RaidGUIControlLootBracket.NOTCH_COLOR_INACTIVE.b)
		slot11 = self._notch
		slot16 = current_b

		self._notch.set_color(t, Color(duration, current_r, current_g))

		slot12 = current_size

		self._bracket_icon.set_h(t, self._bracket_icon)

		slot15 = RaidGUIControlLootBracket.ICON
		slot16 = RaidGUIControlLootBracket.ICON
		slot13 = tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
		slot12 = current_size * tweak_data.gui.icon_w(duration, tweak_data.gui) / slot13

		self._bracket_icon.set_w(t, self._bracket_icon)

		slot14 = self._object
		slot12 = self._object.w(slot13) / 2

		self._bracket_icon.set_center_x(t, self._bracket_icon)

		slot14 = self._notch
		slot12 = self._notch.y(slot13) - RaidGUIControlLootBracket.NOTCH_PADDING_TOP - current_bottom_padding

		self._bracket_icon.set_bottom(t, self._bracket_icon)
	end

	slot6 = RaidGUIControlLootBracket.NOTCH_COLOR_ACTIVE

	self._notch.set_color(slot4, self._notch)

	slot6 = RaidGUIControlLootBracket.ICON_ACTIVE_H

	self._bracket_icon.set_h(slot4, self._bracket_icon)

	slot10 = RaidGUIControlLootBracket.ICON
	slot11 = RaidGUIControlLootBracket.ICON
	slot6 = RaidGUIControlLootBracket.ICON_ACTIVE_H * tweak_data.gui.icon_w(slot8, tweak_data.gui) / tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)

	self._bracket_icon.set_w(slot4, self._bracket_icon)

	slot8 = self._object
	slot6 = self._object.w(tweak_data.gui.icon_w(slot8, tweak_data.gui) / tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)) / 2

	self._bracket_icon.set_center_x(slot4, self._bracket_icon)

	slot8 = self._notch
	slot6 = self._notch.y(tweak_data.gui.icon_w(slot8, tweak_data.gui) / tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)) - RaidGUIControlLootBracket.NOTCH_PADDING_TOP - RaidGUIControlLootBracket.ICON_ACTIVE_PADDING_BOTTOM

	self._bracket_icon.set_bottom(slot4, self._bracket_icon)

	return 
end
function RaidGUIControlLootBracket:_animate_deactivate()
	local duration = 0.25
	slot5 = self._object
	local t = (1 - (self._bracket_icon.w(slot3) - RaidGUIControlLootBracket.ICON_INACTIVE_SIZE) / (self._object.w(self._bracket_icon) - RaidGUIControlLootBracket.ICON_INACTIVE_SIZE)) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_bottom_padding = Easing.quartic_in_out(slot5, t, RaidGUIControlLootBracket.ICON_ACTIVE_PADDING_BOTTOM, -RaidGUIControlLootBracket.ICON_ACTIVE_PADDING_BOTTOM)
		local current_size = Easing.quartic_in_out(t, t, RaidGUIControlLootBracket.ICON_ACTIVE_H, RaidGUIControlLootBracket.ICON_INACTIVE_H - RaidGUIControlLootBracket.ICON_ACTIVE_H)
		slot9 = current_size

		self._bracket_icon.set_h(t, self._bracket_icon)

		slot12 = RaidGUIControlLootBracket.ICON
		slot13 = RaidGUIControlLootBracket.ICON
		slot10 = tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
		slot9 = current_size * tweak_data.gui.icon_w(duration, tweak_data.gui) / slot10

		self._bracket_icon.set_w(t, self._bracket_icon)

		slot11 = self._object
		slot9 = self._object.w(slot10) / 2

		self._bracket_icon.set_center_x(t, self._bracket_icon)

		slot11 = self._notch
		slot9 = self._notch.y(slot10) - RaidGUIControlLootBracket.NOTCH_PADDING_TOP - current_bottom_padding

		self._bracket_icon.set_bottom(t, self._bracket_icon)
	end

	slot6 = RaidGUIControlLootBracket.ICON_INACTIVE_H

	self._bracket_icon.set_h(slot4, self._bracket_icon)

	slot10 = RaidGUIControlLootBracket.ICON
	slot11 = RaidGUIControlLootBracket.ICON
	slot6 = RaidGUIControlLootBracket.ICON_INACTIVE_H * tweak_data.gui.icon_w(slot8, tweak_data.gui) / tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)

	self._bracket_icon.set_w(slot4, self._bracket_icon)

	slot8 = self._object
	slot6 = self._object.w(tweak_data.gui.icon_w(slot8, tweak_data.gui) / tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)) / 2

	self._bracket_icon.set_center_x(slot4, self._bracket_icon)

	slot8 = self._notch
	slot6 = self._notch.y(tweak_data.gui.icon_w(slot8, tweak_data.gui) / tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)) - RaidGUIControlLootBracket.NOTCH_PADDING_TOP

	self._bracket_icon.set_bottom(slot4, self._bracket_icon)

	return 
end

return 
