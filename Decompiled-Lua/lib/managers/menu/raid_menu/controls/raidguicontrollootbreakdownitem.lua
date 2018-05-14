if not RaidGUIControlLootBreakdownItem then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlLootBreakdownItem = slot0
RaidGUIControlLootBreakdownItem.W = 320
RaidGUIControlLootBreakdownItem.TOP_PART_H = 124
RaidGUIControlLootBreakdownItem.ICON_LAYOUT_W = 96
RaidGUIControlLootBreakdownItem.HORIZONTAL_PADDING = 32
RaidGUIControlLootBreakdownItem.FONT = "din_compressed"
RaidGUIControlLootBreakdownItem.COUNTER_H = 64
RaidGUIControlLootBreakdownItem.COUNTER_FONT_SIZE = tweak_data.gui.font_sizes.size_56
RaidGUIControlLootBreakdownItem.COUNTER_COLOR = tweak_data.gui.colors.raid_dirty_white
RaidGUIControlLootBreakdownItem.TITLE_H = 32
RaidGUIControlLootBreakdownItem.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlLootBreakdownItem.TITLE_COLOR = tweak_data.gui.colors.raid_grey_effects
RaidGUIControlLootBreakdownItem.TEXT_PANEL_H = 96
RaidGUIControlLootBreakdownItem.COLOR_EMPTY = tweak_data.gui.colors.raid_red
function RaidGUIControlLootBreakdownItem:init(parent, params)
	slot7 = params

	RaidGUIControlLootBreakdownItem.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlLootBreakdownItem:init] Parameters not specified for the card details"

		Application.error(slot4, Application)

		return 
	end

	self._acquired = params.acquired
	self._current = 0
	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_icon(slot4)

	slot5 = self

	self._create_text_panel(slot4)

	slot5 = self

	self._create_counter(slot4)

	slot5 = self

	self._create_title(slot4)

	slot5 = self

	self._refresh_layout(slot4)

	return 
end
function RaidGUIControlLootBreakdownItem:acquired()
	return self._acquired
end
function RaidGUIControlLootBreakdownItem:add_points(amount)
	self._current = self._current + amount
	slot4 = self

	self._refresh_counter(slot3)

	return 
end
function RaidGUIControlLootBreakdownItem:add_point(duration)
	slot9 = "_add_point"
	slot6 = duration

	self._icon.animate(slot3, self._icon, callback(slot6, self, self))

	self._current = self._current + 1
	slot4 = self

	self._refresh_counter(slot3)

	return 
end
function RaidGUIControlLootBreakdownItem:_add_point(main_icon, duration)
	local t = 0
	local y_move = 160
	local fade_out_distance = 40
	local icon_params = {
		name = "icon_clone",
		texture = tweak_data.gui.icons[self._params.icon].texture,
		texture_rect = tweak_data.gui.icons[self._params.icon].texture_rect
	}
	slot9 = self._icon
	icon_params.layer = self._icon.layer(self._params.icon) + 1
	slot10 = icon_params
	local icon = self._object.bitmap(self._params.icon, self._object)
	slot10 = icon
	slot13 = self._icon

	icon.set_center_y(self._object, self._icon.center_y(slot12))

	slot10 = icon
	slot13 = self._icon

	icon.set_center_x(self._object, self._icon.center_x(slot12))

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = duration
		local current_y_offset = Easing.linear(slot10, t, 0, y_move)
		slot13 = RaidGUIControlLootBreakdownItem.TOP_PART_H / 2 + current_y_offset

		icon.set_center_y(t, icon)

		if y_move - fade_out_distance < current_y_offset then
			local current_alpha = (y_move - current_y_offset) / (y_move - fade_out_distance)
			slot14 = current_alpha

			icon.set_alpha(slot12, icon)
		end
	end

	slot11 = icon

	self._object.remove(slot9, self._object)

	return 
end
function RaidGUIControlLootBreakdownItem:_create_panel()
	local panel_params = {
		name = "loot_breakdown_item",
		alpha = 0,
		w = RaidGUIControlLootBreakdownItem.W
	}
	slot5 = panel_params
	self._object = self._panel.panel(slot3, self._panel)

	return 
end
function RaidGUIControlLootBreakdownItem:_create_icon()
	local icon_params = {
		name = "loot_item_icon",
		texture = tweak_data.gui.icons[self._params.icon].texture,
		texture_rect = tweak_data.gui.icons[self._params.icon].texture_rect
	}
	slot5 = icon_params
	self._icon = self._object.bitmap(self._params.icon, self._object)
	slot5 = RaidGUIControlLootBreakdownItem.TOP_PART_H / 2

	self._icon.set_center_y(self._params.icon, self._icon)

	return 
end
function RaidGUIControlLootBreakdownItem:_create_text_panel()
	local text_panel_params = {
		name = "text_panel",
		h = RaidGUIControlLootBreakdownItem.TEXT_PANEL_H
	}
	slot5 = text_panel_params
	self._text_panel = self._object.panel(slot3, self._object)
	slot5 = RaidGUIControlLootBreakdownItem.TOP_PART_H / 2

	self._text_panel.set_center_y(slot3, self._text_panel)

	return 
end
function RaidGUIControlLootBreakdownItem:_create_counter()
	local counter_params = {
		vertical = "center",
		name = "counter",
		align = "center",
		text = "",
		halign = "scale",
		valign = "top",
		h = RaidGUIControlLootBreakdownItem.COUNTER_H,
		font = RaidGUIControlLootBreakdownItem.FONT,
		font_size = RaidGUIControlLootBreakdownItem.COUNTER_FONT_SIZE,
		color = RaidGUIControlLootBreakdownItem.COUNTER_COLOR
	}
	slot5 = counter_params
	self._counter = self._text_panel.text(slot3, self._text_panel)
	slot4 = self

	self._refresh_counter(slot3)

	return 
end
function RaidGUIControlLootBreakdownItem:_refresh_counter()
	slot3 = self._current
	local counter_text = tostring(slot2)

	if self._params.total then
		slot6 = self._params.total
		counter_text = counter_text .. " / " .. tostring(slot5)
	end

	slot5 = counter_text

	self._counter.set_text(slot3, self._counter)

	return 
end
function RaidGUIControlLootBreakdownItem:_create_title()
	local title_params = {
		name = "counter",
		vertical = "center",
		align = "center",
		halign = "scale",
		valign = "top"
	}
	slot5 = self._counter
	slot3 = self._counter.h(self._counter)
	title_params.y = self._counter.y(slot3) + slot3
	title_params.h = RaidGUIControlLootBreakdownItem.TITLE_H
	title_params.font = RaidGUIControlLootBreakdownItem.FONT
	title_params.font_size = RaidGUIControlLootBreakdownItem.TITLE_FONT_SIZE
	title_params.color = RaidGUIControlLootBreakdownItem.TITLE_COLOR
	slot6 = true
	title_params.text = self.translate(slot3, self, self._params.title)
	slot5 = title_params
	self._title = self._text_panel.text(slot3, self._text_panel)

	return 
end
function RaidGUIControlLootBreakdownItem:_refresh_layout()
	slot3 = self._counter
	local _, _, counter_w, _ = self._counter.text_rect(slot2)
	slot7 = self._title
	local _, _, title_w, _ = self._title.text_rect(slot6)
	local text_w = (title_w < counter_w and counter_w) or title_w
	slot12 = (text_w + 33) / 32
	text_w = 32 * math.ceil(slot11)
	slot12 = self._text_panel
	slot15 = text_w

	self._text_panel.set_w(slot11, math.ceil(slot14))

	slot12 = self._counter
	slot15 = text_w

	self._counter.set_w(slot11, math.ceil(slot14))

	slot12 = self._title
	slot15 = text_w

	self._title.set_w(slot11, math.ceil(slot14))

	slot13 = self._object

	if self._object.w(self._text_panel) < self._text_panel.w(slot11) + RaidGUIControlLootBreakdownItem.ICON_LAYOUT_W + 2 * RaidGUIControlLootBreakdownItem.HORIZONTAL_PADDING then
		slot12 = self._object
		slot17 = self._text_panel
		slot15 = self._text_panel.w(slot16) + RaidGUIControlLootBreakdownItem.ICON_LAYOUT_W + 2 * RaidGUIControlLootBreakdownItem.HORIZONTAL_PADDING

		self._object.set_w(slot11, math.ceil(slot14))
	end

	local icon_center_x = (self._object.w(slot11) - text_w - RaidGUIControlLootBreakdownItem.ICON_LAYOUT_W) / 2 + RaidGUIControlLootBreakdownItem.ICON_LAYOUT_W / 2
	slot13 = self._icon
	slot16 = icon_center_x

	self._icon.set_center_x(self._object, math.floor(slot15))

	slot13 = self._text_panel
	slot18 = self._icon
	slot16 = self._icon.center_x(slot17) + RaidGUIControlLootBreakdownItem.ICON_LAYOUT_W / 2

	self._text_panel.set_x(self._object, math.floor(slot15))

	return 
end
function RaidGUIControlLootBreakdownItem:close()
	return 
end
function RaidGUIControlLootBreakdownItem:animate_icon()
	self._animating_icon = true
	slot3 = self._icon

	self._icon.stop(slot2)

	slot3 = self._icon
	slot8 = "_animate_icon"

	self._icon.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlLootBreakdownItem:animate_show()
	local duration = 0.7
	local y_offset = 50
	local t = 0
	slot7 = 0

	self._object.set_alpha(slot5, self._object)

	slot7 = y_offset

	self._object.set_y(slot5, self._object)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_alpha = Easing.quartic_out(slot6, t, 0, 1)
		slot9 = current_alpha

		self._object.set_alpha(t, self._object)

		slot11 = duration
		local current_y_offset = Easing.quartic_out(t, t, y_offset, -y_offset)
		slot10 = current_y_offset

		self._object.set_y(t, self._object)
	end

	slot7 = 1

	self._object.set_alpha(slot5, self._object)

	slot7 = 0

	self._object.set_y(slot5, self._object)

	return 
end
function RaidGUIControlLootBreakdownItem:animate_empty()
	local duration = 0.7
	local t = 0
	local played_sound = false
	local initial_icon_color = self._icon.color(slot5)
	local initial_counter_color = self._counter.color(self._icon)
	local initial_title_color = self._title.color(self._counter)
	slot9 = 0.3

	wait(self._title)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local current_icon_r = Easing.quartic_out(slot9, t, initial_icon_color.r, RaidGUIControlLootBreakdownItem.COLOR_EMPTY.r - initial_icon_color.r)
		slot14 = duration
		local current_icon_g = Easing.quartic_out(t, t, initial_icon_color.g, RaidGUIControlLootBreakdownItem.COLOR_EMPTY.g - initial_icon_color.g)
		local current_icon_b = Easing.quartic_out(t, t, initial_icon_color.b, RaidGUIControlLootBreakdownItem.COLOR_EMPTY.b - initial_icon_color.b)
		slot13 = self._icon
		slot18 = current_icon_b

		self._icon.set_color(t, Color(duration, current_icon_r, current_icon_g))

		slot16 = duration
		local current_counter_r = Easing.quartic_out(t, t, initial_counter_color.r, RaidGUIControlLootBreakdownItem.COLOR_EMPTY.r - initial_counter_color.r)
		slot17 = duration
		local current_counter_g = Easing.quartic_out(t, t, initial_counter_color.g, RaidGUIControlLootBreakdownItem.COLOR_EMPTY.g - initial_counter_color.g)
		local current_counter_b = Easing.quartic_out(t, t, initial_counter_color.b, RaidGUIControlLootBreakdownItem.COLOR_EMPTY.b - initial_counter_color.b)
		slot16 = self._counter
		slot21 = current_counter_b

		self._counter.set_color(t, Color(duration, current_counter_r, current_counter_g))

		slot19 = duration
		local current_title_r = Easing.quartic_out(t, t, initial_title_color.r, RaidGUIControlLootBreakdownItem.COLOR_EMPTY.r - initial_title_color.r)
		slot20 = duration
		local current_title_g = Easing.quartic_out(t, t, initial_title_color.g, RaidGUIControlLootBreakdownItem.COLOR_EMPTY.g - initial_title_color.g)
		local current_title_b = Easing.quartic_out(t, t, initial_title_color.b, RaidGUIControlLootBreakdownItem.COLOR_EMPTY.b - initial_title_color.b)
		slot19 = self._title
		slot24 = current_title_b

		self._title.set_color(t, Color(duration, current_title_r, current_title_g))

		if 0 < t and not played_sound then
			slot20 = LootScreenGui.EMPTY_LOOT_ITEM_SOUND_EFFECT

			managers.menu_component.post_event(slot18, managers.menu_component)

			played_sound = true
		end
	end

	slot10 = RaidGUIControlLootBreakdownItem.COLOR_EMPTY

	self._icon.set_color(slot8, self._icon)

	slot10 = RaidGUIControlLootBreakdownItem.COLOR_EMPTY

	self._counter.set_color(slot8, self._counter)

	slot10 = RaidGUIControlLootBreakdownItem.COLOR_EMPTY

	self._title.set_color(slot8, self._title)

	return 
end
function RaidGUIControlLootBreakdownItem:hide(delay)
	slot4 = self._title

	self._title.stop(slot3)

	slot9 = "_animate_hide"
	slot6 = delay

	self._title.animate(slot3, self._title, callback(slot6, self, self))

	return 
end
function RaidGUIControlLootBreakdownItem:finalize()
	slot4 = 1

	self._object.set_alpha(slot2, self._object)

	slot4 = 0

	self._object.set_y(slot2, self._object)

	self._current = self._params.acquired
	slot3 = self

	self._refresh_counter(slot2)

	return 
end
function RaidGUIControlLootBreakdownItem:fade()
	slot4 = 0.5

	self._object.set_alpha(slot2, self._object)

	slot4 = 0.7

	self._icon.set_alpha(slot2, self._icon)

	return 
end
function RaidGUIControlLootBreakdownItem:check_state()
	if self._acquired == 0 then
		slot4 = RaidGUIControlLootBreakdownItem.COLOR_EMPTY

		self._icon.set_color(slot2, self._icon)

		slot4 = RaidGUIControlLootBreakdownItem.COLOR_EMPTY

		self._counter.set_color(slot2, self._counter)

		slot4 = RaidGUIControlLootBreakdownItem.COLOR_EMPTY

		self._title.set_color(slot2, self._title)
	end

	return 
end
function RaidGUIControlLootBreakdownItem:_animate_hide(panel, delay)
	local duration = 0.3
	local t = 0
	slot7 = self._object
	local initial_alpha = self._object.alpha(slot6)

	if delay then
		slot8 = delay

		wait(slot7)
	end

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = duration
		local current_alpha = Easing.quartic_in_out(slot8, t, initial_alpha, -initial_alpha)
		slot11 = current_alpha

		self._object.set_alpha(t, self._object)
	end

	slot9 = 0

	self._object.set_alpha(slot7, self._object)

	return 
end
function RaidGUIControlLootBreakdownItem:animate_move_right(offset)
	slot4 = self._counter

	self._counter.stop(slot3)

	slot9 = "_animate_move_right"
	slot6 = offset

	self._counter.animate(slot3, self._counter, callback(slot6, self, self))

	return 
end
function RaidGUIControlLootBreakdownItem:_animate_move_right(panel, offset)
	local duration = 0.8
	local t = 0
	local initial_x_position = self._object.x(slot6)
	local initial_alpha = self._object.alpha(self._object)
	slot9 = self._icon
	local initial_icon_alpha = self._icon.alpha(self._object)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = duration
		local current_alpha = Easing.quartic_in_out(slot10, t, initial_alpha, 0.5 - initial_alpha)
		slot13 = current_alpha

		self._object.set_alpha(t, self._object)

		slot15 = duration
		local current_icon_alpha = Easing.quartic_in_out(t, t, initial_icon_alpha, 0.7 - initial_icon_alpha)
		slot14 = current_icon_alpha

		self._icon.set_alpha(t, self._icon)

		slot16 = duration
		local current_x_offset = Easing.quartic_in_out(t, t, 0, offset)
		slot15 = initial_x_position + current_x_offset

		self._object.set_x(t, self._object)
	end

	slot11 = 0.5

	self._object.set_alpha(slot9, self._object)

	slot11 = 0.7

	self._icon.set_alpha(slot9, self._icon)

	slot11 = initial_x_position + offset

	self._object.set_x(slot9, self._object)

	return 
end
function RaidGUIControlLootBreakdownItem:stop_animating_icon()
	self._animating_icon = false

	return 
end
function RaidGUIControlLootBreakdownItem:_animate_icon(icon)
	local y_move = 160
	local t = 0
	local cycle_duration = 0.35
	local wait_time = 0.1
	local first_cycle = true
	local fade_out_distance = 30

	while self._animating_icon == true do
		slot11 = RaidGUIControlLootBreakdownItem.TOP_PART_H / 2

		self._icon.set_center_y(slot9, self._icon)

		slot11 = 1

		self._icon.set_alpha(slot9, self._icon)

		while t < cycle_duration do
			local dt = coroutine.yield()
			t = t + dt
			local current_y_offset = nil

			if first_cycle then
				slot15 = cycle_duration
				current_y_offset = Easing.quartic_in(slot11, t, 0, y_move)
			else
				slot15 = cycle_duration
				current_y_offset = Easing.linear(slot11, t, 0, y_move)
			end

			slot13 = RaidGUIControlLootBreakdownItem.TOP_PART_H / 2 + current_y_offset

			self._icon.set_center_y(slot11, self._icon)

			if y_move - fade_out_distance < current_y_offset then
				local current_alpha = (y_move - current_y_offset) / (y_move - fade_out_distance)
				slot14 = current_alpha

				self._icon.set_alpha(slot12, self._icon)
			end
		end

		first_cycle = false
		t = 0
		slot10 = wait_time

		wait(slot9)
	end

	slot11 = RaidGUIControlLootBreakdownItem.TOP_PART_H / 2

	self._icon.set_center_y(slot9, self._icon)

	slot11 = 1

	self._icon.set_alpha(slot9, self._icon)

	return 
end

return 
