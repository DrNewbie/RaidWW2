if not RaidGUIControlStepperSimple then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlStepperSimple = slot0
RaidGUIControlStepperSimple.DEFAULT_WIDTH = 192
RaidGUIControlStepperSimple.DEFAULT_HEIGHT = 32
RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE = "hslider_arrow_right_base"
RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE = "hslider_arrow_left_base"
RaidGUIControlStepperSimple.BUTTON_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlStepperSimple.BUTTON_HIGHLIGHT_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlStepperSimple.TEXT_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlStepperSimple.TEXT_COLOR_DISABLED = tweak_data.gui.colors.raid_dark_grey
RaidGUIControlStepperSimple.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlStepperSimple.FONT_SIZE = tweak_data.gui.font_sizes.small
function RaidGUIControlStepperSimple:init(parent, params)
	slot7 = params

	RaidGUIControlStepperSimple.super.init(slot4, self, parent)

	if not params then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlStepperSimple:init] List specific parameters not specified for list: ")

		return 
	end

	if not params.data_source_callback then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlStepperSimple:init] Data source callback not specified for list: ")

		return 
	end

	self._pointer_type = "arrow"

	if params.on_item_selected_callback then
		self._on_select_callback = params.on_item_selected_callback
	end

	self._data_source_callback = params.data_source_callback
	slot5 = self

	self.highlight_off(slot4)

	slot5 = self

	self._create_stepper_panel(slot4)

	slot5 = self

	self._create_stepper_controls(slot4)

	return 
end
function RaidGUIControlStepperSimple:refresh_data(sort_descending)
	slot4 = self

	self._delete_items(slot3)

	slot4 = self

	self._create_stepper_panel(slot3)

	slot5 = sort_descending

	self._create_stepper_controls(slot3, self)

	return 
end
function RaidGUIControlStepperSimple:set_disabled_items(disabled_item_data)
	slot4 = self._stepper_data

	for index, data in pairs(slot3) do
		self._stepper_data[index].disabled = not disabled_item_data[index]
	end

	if self._stepper_data[self._selected_item_index].disabled then
		slot5 = RaidGUIControlStepperSimple.TEXT_COLOR_DISABLED

		self._value_label.set_color(slot3, self._value_label)
	else
		slot5 = RaidGUIControlStepperSimple.TEXT_COLOR

		self._value_label.set_color(slot3, self._value_label)
	end

	return 
end
function RaidGUIControlStepperSimple:_delete_items()
	self._stepper_data = {}
	self._selected_item = nil
	slot3 = self._object

	self._object.clear(slot2)

	return 
end
function RaidGUIControlStepperSimple:_create_stepper_panel()
	local stepper_params = clone(slot2)
	stepper_params.name = stepper_params.name .. "_stepper"
	slot4 = self._panel
	stepper_params.layer = self._panel.layer("_stepper") + 1
	stepper_params.w = self._params.w or RaidGUIControlStepperSimple.DEFAULT_WIDTH
	stepper_params.h = RaidGUIControlStepperSimple.DEFAULT_HEIGHT
	slot5 = stepper_params
	self._stepper_panel = self._panel.panel(self._params, self._panel)
	self._object = self._stepper_panel

	return 
end
function RaidGUIControlStepperSimple:_create_stepper_controls(sort_descending)
	local left_arrow_params = {
		name = "stepper_simple_left_arrow",
		x = 0
	}
	slot7 = RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE
	left_arrow_params.y = self._object.h(slot4) / 2 - tweak_data.gui.icon_h(self._object, tweak_data.gui) / 2
	left_arrow_params.texture = tweak_data.gui.icons[RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE].texture
	left_arrow_params.texture_rect = tweak_data.gui.icons[RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE].texture_rect
	slot6 = RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE
	left_arrow_params.w = tweak_data.gui.icon_w(RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE, tweak_data.gui)
	slot6 = RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE
	left_arrow_params.h = tweak_data.gui.icon_h(RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE, tweak_data.gui)
	left_arrow_params.color = RaidGUIControlStepperSimple.BUTTON_COLOR
	left_arrow_params.highlight_color = RaidGUIControlStepperSimple.BUTTON_HIGHLIGHT_COLOR
	slot5 = self._object
	left_arrow_params.layer = self._object.layer(RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE) + 1
	slot7 = "on_left_arrow_clicked"
	left_arrow_params.on_click_callback = callback(RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE, self, self)
	slot6 = left_arrow_params
	self._arrow_left = self._object.image_button(RaidGUIControlStepperSimple.BUTTON_LEFT_TEXTURE, self._object)
	local right_arrow_params = {
		name = "stepper_simple_right_arrow"
	}
	slot8 = RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE
	right_arrow_params.x = self._object.w(self._object) - tweak_data.gui.icon_w(self._object, tweak_data.gui)
	slot8 = RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE
	right_arrow_params.y = self._object.h(tweak_data.gui.icon_w(self._object, tweak_data.gui)) / 2 - tweak_data.gui.icon_h(self._object, tweak_data.gui) / 2
	right_arrow_params.texture = tweak_data.gui.icons[RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE].texture
	right_arrow_params.texture_rect = tweak_data.gui.icons[RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE].texture_rect
	slot7 = RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE
	right_arrow_params.w = tweak_data.gui.icon_w(RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE, tweak_data.gui)
	slot7 = RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE
	right_arrow_params.h = tweak_data.gui.icon_h(RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE, tweak_data.gui)
	right_arrow_params.color = RaidGUIControlStepperSimple.BUTTON_COLOR
	right_arrow_params.highlight_color = RaidGUIControlStepperSimple.BUTTON_HIGHLIGHT_COLOR
	slot6 = self._object
	right_arrow_params.layer = self._object.layer(RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE) + 1
	slot8 = "on_right_arrow_clicked"
	right_arrow_params.on_click_callback = callback(RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE, self, self)
	slot7 = right_arrow_params
	self._arrow_right = self._object.image_button(RaidGUIControlStepperSimple.BUTTON_RIGHT_TEXTURE, self._object)
	local label_params = {
		name = "stepper_simple_value",
		vertical = "center",
		align = "center",
		text = "VALUE",
		y = 0
	}
	slot7 = self._arrow_left
	label_params.x = self._arrow_left.w(self._object)
	slot8 = self._arrow_left
	slot8 = self._arrow_right
	slot6 = self._arrow_right.w(self._object)
	label_params.w = self._object.w(self._object) - self._arrow_left.w(self._object) - slot6
	slot7 = self._object
	label_params.h = self._object.h(slot6)
	label_params.color = RaidGUIControlStepperSimple.TEXT_COLOR
	slot7 = self._object
	label_params.layer = self._object.layer(slot6) + 1
	label_params.font = RaidGUIControlStepperSimple.FONT
	label_params.font_size = RaidGUIControlStepperSimple.FONT_SIZE
	slot8 = label_params
	self._value_label = self._object.text(slot6, self._object)
	local stepper_data = self._data_source_callback()
	slot8 = stepper_data
	self._stepper_data = clone(self._object)
	self._selected_item_index = 1

	if sort_descending then
		self._selected_item_index = #self._stepper_data
	end

	if self._stepper_data then
		slot8 = self._stepper_data

		for item_index, item_data in pairs(slot7) do
			if item_data.selected then
				self._selected_item_index = item_index

				break
			end
		end
	end

	slot10 = true

	self._select_item(slot7, self, self._selected_item_index)

	return 
end
function RaidGUIControlStepperSimple:selected_item()
	return self._stepper_data[self._selected_item_index]
end
function RaidGUIControlStepperSimple:_select_item(index, skip_animation)
	local item = self._stepper_data[index]

	if not item.text then
		slot7 = item.text_id
		local text = managers.localization.text(slot5, managers.localization)
	end

	local disabled = item.disabled
	self._selected_item_index = index

	if index == 1 then
		slot9 = 0

		self._arrow_left._object.set_alpha(slot7, self._arrow_left._object)

		slot9 = 1

		self._arrow_right._object.set_alpha(slot7, self._arrow_right._object)
	elseif index == #self._stepper_data then
		slot9 = 1

		self._arrow_left._object.set_alpha(slot7, self._arrow_left._object)

		slot9 = 0

		self._arrow_right._object.set_alpha(slot7, self._arrow_right._object)
	else
		slot9 = 1

		self._arrow_left._object.set_alpha(slot7, self._arrow_left._object)

		slot9 = 1

		self._arrow_right._object.set_alpha(slot7, self._arrow_right._object)
	end

	if skip_animation then
		slot9 = text

		self._value_label.set_text(slot7, self._value_label)

		if index == 1 then
			slot9 = 0

			self._arrow_left._object.set_alpha(slot7, self._arrow_left._object)
		elseif index == #self._stepper_data then
			slot9 = 0

			self._arrow_right._object.set_alpha(slot7, self._arrow_right._object)
		end
	else
		slot8 = self._value_label

		self._value_label.stop(slot7)

		slot13 = "_animate_value_change"
		slot11 = disabled

		self._value_label.animate(slot7, self._value_label, callback(slot10, self, self), text)
	end

	return 
end
function RaidGUIControlStepperSimple:select_item_by_value(value)
	if self._stepper_data then
		slot4 = self._stepper_data

		for item_index, item_data in pairs(slot3) do
			if value == item_data.value then
				slot10 = item_index

				self._select_item(slot8, self)

				return 
			end
		end
	end

	return 
end
function RaidGUIControlStepperSimple:get_value()
	local item = self._stepper_data[self._selected_item_index]

	return item.value
end
function RaidGUIControlStepperSimple:set_value_and_render(value_to_select, skip_animation)
	if self._stepper_data then
		slot5 = self._stepper_data

		for key, value in pairs(slot4) do
			slot10 = value.value

			if type(slot9) == "table" then
				slot11 = value.value

				if value_to_select.is_equal(slot9, value_to_select) then
					slot12 = skip_animation

					self._select_item(slot9, self, key)

					break
				end
			else
				slot11 = value_to_select

				if utf8.to_upper(slot9) == utf8.to_upper(value.value) then
					slot12 = skip_animation

					self._select_item(slot9, self, key)

					break
				end
			end
		end
	end

	return 
end
function RaidGUIControlStepperSimple:_delete_stepper_items()
	slot3 = self._stepper_panel

	self._stepper_panel.clear(slot2)

	return 
end
function RaidGUIControlStepperSimple:on_left_arrow_clicked()
	if not self._enabled then
		return 
	end

	if 1 < self._selected_item_index then
		self._selected_item_index = self._selected_item_index - 1
	else
		return 
	end

	slot4 = self._selected_item_index

	self._select_item(slot2, self)

	if self._on_select_callback then
		slot3 = self._stepper_data[self._selected_item_index]

		self._on_select_callback(slot2)
	end

	return 
end
function RaidGUIControlStepperSimple:on_right_arrow_clicked()
	if not self._enabled then
		return 
	end

	if self._selected_item_index < #self._stepper_data then
		self._selected_item_index = self._selected_item_index + 1
	else
		return 
	end

	slot4 = self._selected_item_index

	self._select_item(slot2, self)

	if self._on_select_callback then
		slot3 = self._stepper_data[self._selected_item_index]

		self._on_select_callback(slot2)
	end

	return 
end
function RaidGUIControlStepperSimple:mouse_moved(o, x, y)
	slot8 = y

	if not self.inside(slot5, self, x) then
		if self._mouse_inside then
			slot6 = self._arrow_left

			self._arrow_left.on_mouse_out(slot5)

			slot6 = self._arrow_right

			self._arrow_right.on_mouse_out(slot5)
		end

		self._mouse_inside = false

		return false, nil
	end

	self._mouse_inside = true
	local used = false
	local pointer = nil
	slot11 = y
	used, pointer = self._arrow_left.mouse_moved(slot7, self._arrow_left, o, x)

	if used then
		return used, pointer
	end

	slot11 = y
	used, pointer = self._arrow_right.mouse_moved(slot7, self._arrow_right, o, x)

	return used, pointer
end
function RaidGUIControlStepperSimple:mouse_released(o, button, x, y)
	return false
end
function RaidGUIControlStepperSimple:on_mouse_scroll_up()
	if not self._enabled then
		return 
	end

	slot3 = self

	self.on_right_arrow_clicked(slot2)

	return 
end
function RaidGUIControlStepperSimple:on_mouse_scroll_down()
	if not self._enabled then
		return 
	end

	slot3 = self

	self.on_left_arrow_clicked(slot2)

	return 
end
function RaidGUIControlStepperSimple:x()
	slot3 = self._stepper_panel._engine_panel

	return self._stepper_panel._engine_panel.x(slot2)
end
function RaidGUIControlStepperSimple:w()
	slot3 = self._stepper_panel._engine_panel

	return self._stepper_panel._engine_panel.w(slot2)
end
function RaidGUIControlStepperSimple:confirm_pressed()
	if not self._enabled then
		return 
	end

	if self._selected then
		self._selected_control = not self._selected_control
		slot4 = self._selected_control

		self._select_control(slot2, self)

		return true
	end

	return 
end
function RaidGUIControlStepperSimple:is_selected_control()
	return self._selected_control
end
function RaidGUIControlStepperSimple:_select_control(value)
	return 
end
function RaidGUIControlStepperSimple:move_down()
	if self._selected then
		self._selected_control = false
		slot4 = false

		self._select_control(slot2, self)

		slot3 = self

		return self.super.move_down(slot2)
	end

	return 
end
function RaidGUIControlStepperSimple:move_up()
	if self._selected then
		self._selected_control = false
		slot4 = false

		self._select_control(slot2, self)

		slot3 = self

		return self.super.move_up(slot2)
	end

	return 
end
function RaidGUIControlStepperSimple:set_enabled(enabled)
	slot5 = enabled

	RaidGUIControlStepperSimple.super.set_enabled(slot3, self)

	slot5 = enabled

	self._arrow_left.set_enabled(slot3, self._arrow_left)

	slot5 = enabled

	self._arrow_right.set_enabled(slot3, self._arrow_right)

	if enabled then
		if self._stepper_data[self._selected_item_index].disabled then
			slot5 = RaidGUIControlStepperSimple.TEXT_COLOR_DISABLED

			self._value_label.set_color(slot3, self._value_label)
		else
			slot5 = RaidGUIControlStepperSimple.TEXT_COLOR

			self._value_label.set_color(slot3, self._value_label)
		end
	else
		slot5 = RaidGUIControlStepperSimple.TEXT_COLOR_DISABLED

		self._value_label.set_color(slot3, self._value_label)
	end

	return 
end
function RaidGUIControlStepperSimple:_animate_value_change(o, text, disabled)
	slot6 = self._value_label
	local starting_alpha = self._value_label.alpha(slot5)
	local duration = 0.13
	local t = duration - starting_alpha * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local alpha = Easing.linear(slot9, t, 1, -1)
		slot12 = alpha

		self._value_label.set_alpha(t, self._value_label)
	end

	slot10 = 0

	self._value_label.set_alpha(slot8, self._value_label)

	slot10 = text

	self._value_label.set_text(slot8, self._value_label)

	if disabled then
		slot10 = RaidGUIControlStepperSimple.TEXT_COLOR_DISABLED

		self._value_label.set_color(slot8, self._value_label)
	else
		slot10 = RaidGUIControlStepperSimple.TEXT_COLOR

		self._value_label.set_color(slot8, self._value_label)
	end

	duration = 0.18
	t = 0

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local alpha = Easing.quartic_out(slot9, t, 0, 1)
		slot12 = alpha

		self._value_label.set_alpha(t, self._value_label)
	end

	slot10 = 1

	self._value_label.set_alpha(slot8, self._value_label)

	return 
end

return 
