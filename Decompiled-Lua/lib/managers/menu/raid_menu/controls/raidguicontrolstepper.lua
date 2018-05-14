if not RaidGUIControlStepper then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlStepper = slot0
RaidGUIControlStepper.DEFAULT_CONTROL_WIDTH = 480
RaidGUIControlStepper.DEFAULT_HEIGHT = 32
RaidGUIControlStepper.TEXT_PADDING = 16
RaidGUIControlStepper.BUTTON_RIGHT_TEXTURE = "hslider_arrow_right_base"
RaidGUIControlStepper.BUTTON_LEFT_TEXTURE = "hslider_arrow_left_base"
RaidGUIControlStepper.BUTTON_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlStepper.BUTTON_HIGHLIGHT_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlStepper.TEXT_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlStepper.TEXT_COLOR_DISABLED = tweak_data.gui.colors.raid_dark_grey
RaidGUIControlStepper.SIDELINE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlStepper.SIDELINE_W = 3
function RaidGUIControlStepper:init(parent, params)
	slot7 = params

	RaidGUIControlStepper.super.init(slot4, self, parent)

	if not params then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlStepper:init] List specific parameters not specified for list: ")

		return 
	end

	if not params.data_source_callback then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlStepper:init] Data source callback not specified for list: ")

		return 
	end

	self._pointer_type = "arrow"

	if params.on_item_selected_callback then
		self._on_select_callback = params.on_item_selected_callback
	end

	self._data_source_callback = params.data_source_callback
	self._stepper_params = params
	slot5 = self

	self._create_stepper_panel(slot4)

	slot5 = self

	self._create_stepper_controls(slot4)

	slot5 = self

	self.highlight_off(slot4)

	return 
end
function RaidGUIControlStepper:refresh_data(sort_descending)
	slot5 = sort_descending

	self._stepper.refresh_data(slot3, self._stepper)

	return 
end
function RaidGUIControlStepper:_create_stepper_panel()
	local stepper_params = clone(slot2)
	stepper_params.name = stepper_params.name .. "_stepper"
	slot4 = self._panel
	stepper_params.layer = self._panel.layer("_stepper") + 1
	stepper_params.w = self._params.w or RaidGUIControlStepper.DEFAULT_CONTROL_WIDTH
	stepper_params.h = RaidGUIControlStepper.DEFAULT_HEIGHT
	slot5 = stepper_params
	self._stepper_panel = self._panel.panel(self._params, self._panel)
	self._object = self._stepper_panel

	return 
end
function RaidGUIControlStepper:_create_stepper_controls()
	local sideline_params = {
		alpha = 0,
		y = 0,
		x = 0,
		w = RaidGUIControlStepper.SIDELINE_W
	}
	slot4 = self._object
	sideline_params.h = self._object.h(slot3)
	sideline_params.color = RaidGUIControlStepper.SIDELINE_COLOR
	slot5 = sideline_params
	self._sideline = self._object.rect(slot3, self._object)
	local stepper_w = self._params.stepper_w or RaidGUIControlStepperSimple.DEFAULT_WIDTH
	local stepper_params = {
		y = 0,
		name = self._name .. "_stepper"
	}
	slot6 = self._object
	stepper_params.x = self._object.w("_stepper") - stepper_w
	stepper_params.w = stepper_w
	stepper_params.on_item_selected_callback = self._params.on_item_selected_callback
	stepper_params.data_source_callback = self._params.data_source_callback
	stepper_params.start_from_last = self._stepper_params.start_from_last
	slot7 = stepper_params
	self._stepper = self._object.stepper_simple("_stepper", self._object)
	slot7 = {
		vertical = "center",
		align = "left",
		y = 0,
		x = RaidGUIControlStepper.SIDELINE_W + RaidGUIControlStepper.TEXT_PADDING,
		w = self._object.w(RaidGUIControlStepper.TEXT_PADDING) - stepper_w - RaidGUIControlStepper.SIDELINE_W - RaidGUIControlStepper.TEXT_PADDING * 2,
		h = self._object.h(RaidGUIControlStepper.TEXT_PADDING * 2),
		color = RaidGUIControlStepper.TEXT_COLOR,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		text = self._params.description,
		layer = self._object.layer(RaidGUIControlStepper.TEXT_PADDING * 2) + 1
	}
	slot10 = self._object
	slot10 = self._object
	slot10 = self._object
	self._description = self._object.text("_stepper", self._object)

	return 
end
function RaidGUIControlStepper:set_disabled_items(data)
	slot5 = data

	self._stepper.set_disabled_items(slot3, self._stepper)

	return 
end
function RaidGUIControlStepper:selected_item()
	slot3 = self._stepper

	return self._stepper.selected_item(slot2)
end
function RaidGUIControlStepper:label_x()
	slot3 = self._description

	return self._description.x(slot2)
end
function RaidGUIControlStepper:_select_item(index)
	slot4 = self._stepper

	self._stepper.selected_item(slot3)

	return 
end
function RaidGUIControlStepper:select_item_by_value(value)
	slot5 = value

	self._stepper.select_item_by_value(slot3, self._stepper)

	return 
end
function RaidGUIControlStepper:get_value()
	slot3 = self._stepper

	return self._stepper.get_value(slot2)
end
function RaidGUIControlStepper:set_value_and_render(value_to_select, skip_animation)
	slot7 = skip_animation

	self._stepper.set_value_and_render(slot4, self._stepper, value_to_select)

	return 
end
function RaidGUIControlStepper:mouse_released(o, button, x, y)
	return false
end
function RaidGUIControlStepper:highlight_on()
	self._highlighted = true

	if not self._enabled then
		return 
	end

	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_highlight_on"

	self._object.animate(slot2, callback(slot5, self, self))

	if self._play_mouse_over_sound then
		slot4 = "highlight"

		managers.menu_component.post_event(slot2, managers.menu_component)

		self._play_mouse_over_sound = false
	end

	return 
end
function RaidGUIControlStepper:highlight_off()
	self._highlighted = false

	if not self._enabled then
		return 
	end

	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_highlight_off"

	self._object.animate(slot2, callback(slot5, self, self))

	self._play_mouse_over_sound = true

	return 
end
function RaidGUIControlStepper:on_mouse_scroll_up()
	if not self._enabled then
		return 
	end

	slot3 = self._stepper

	self._stepper.on_right_arrow_clicked(slot2)

	return 
end
function RaidGUIControlStepper:on_mouse_scroll_down()
	if not self._enabled then
		return 
	end

	slot3 = self._stepper

	self._stepper.on_left_arrow_clicked(slot2)

	return 
end
function RaidGUIControlStepper:x()
	slot3 = self._stepper_panel._engine_panel

	return self._stepper_panel._engine_panel.x(slot2)
end
function RaidGUIControlStepper:w()
	slot3 = self._stepper_panel._engine_panel

	return self._stepper_panel._engine_panel.w(slot2)
end
function RaidGUIControlStepper:confirm_pressed()
	if self._selected then
		return true
	end

	return 
end
function RaidGUIControlStepper:is_selected_control()
	return self._selected_control
end
function RaidGUIControlStepper:_select_control(value)
	return 
end
function RaidGUIControlStepper:move_down()
	if self._selected then
		slot3 = self

		return self.super.move_down(slot2)
	end

	return 
end
function RaidGUIControlStepper:move_up()
	if self._selected then
		slot3 = self

		return self.super.move_up(slot2)
	end

	return 
end
function RaidGUIControlStepper:scroll_left()
	if self._selected then
		slot3 = self._stepper

		self._stepper.on_left_arrow_clicked(slot2)

		return true
	end

	return 
end
function RaidGUIControlStepper:scroll_right()
	if self._selected then
		slot3 = self._stepper

		self._stepper.on_right_arrow_clicked(slot2)

		return true
	end

	return 
end
function RaidGUIControlStepper:_animate_highlight_on()
	slot3 = self._sideline
	local starting_alpha = self._sideline.alpha(slot2)
	local duration = 0.2
	local t = duration - (1 - starting_alpha) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local alpha = Easing.quartic_out(slot6, t, 0, 1)
		slot9 = alpha

		self._sideline.set_alpha(t, self._sideline)

		slot11 = duration
		local description_r = Easing.quartic_out(t, t, RaidGUIControlStepper.TEXT_COLOR.r, RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR.r - RaidGUIControlStepper.TEXT_COLOR.r)
		slot12 = duration
		local description_g = Easing.quartic_out(t, t, RaidGUIControlStepper.TEXT_COLOR.g, RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR.g - RaidGUIControlStepper.TEXT_COLOR.g)
		local description_b = Easing.quartic_out(t, t, RaidGUIControlStepper.TEXT_COLOR.b, RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR.b - RaidGUIControlStepper.TEXT_COLOR.b)
		slot11 = self._description
		slot16 = description_b

		self._description.set_color(t, Color(duration, description_r, description_g))
	end

	slot7 = 1

	self._sideline.set_alpha(slot5, self._sideline)

	return 
end
function RaidGUIControlStepper:_animate_highlight_off()
	slot3 = self._sideline
	local starting_alpha = self._sideline.alpha(slot2)
	local duration = 0.2
	local t = duration - starting_alpha * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local alpha = Easing.quartic_out(slot6, t, 1, -1)
		slot9 = alpha

		self._sideline.set_alpha(t, self._sideline)

		slot11 = duration
		local description_r = Easing.quartic_out(t, t, RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR.r, RaidGUIControlStepper.TEXT_COLOR.r - RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR.r)
		slot12 = duration
		local description_g = Easing.quartic_out(t, t, RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR.g, RaidGUIControlStepper.TEXT_COLOR.g - RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR.g)
		local description_b = Easing.quartic_out(t, t, RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR.b, RaidGUIControlStepper.TEXT_COLOR.b - RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR.b)
		slot11 = self._description
		slot16 = description_b

		self._description.set_color(t, Color(duration, description_r, description_g))
	end

	slot7 = 0

	self._sideline.set_alpha(slot5, self._sideline)

	return 
end
function RaidGUIControlStepper:set_enabled(enabled)
	slot5 = enabled

	RaidGUIControlStepper.super.set_enabled(slot3, self)

	slot5 = enabled

	self._stepper.set_enabled(slot3, self._stepper)

	if enabled then
		if self._highlighted then
			slot5 = RaidGUIControlStepper.TEXT_HIGHLIGHT_COLOR

			self._description.set_color(slot3, self._description)

			slot5 = 1

			self._sideline.set_alpha(slot3, self._sideline)
		else
			slot5 = RaidGUIControlStepper.TEXT_COLOR

			self._description.set_color(slot3, self._description)

			slot5 = 0

			self._sideline.set_alpha(slot3, self._sideline)
		end
	else
		slot5 = RaidGUIControlStepper.TEXT_COLOR_DISABLED

		self._description.set_color(slot3, self._description)

		slot5 = 0

		self._sideline.set_alpha(slot3, self._sideline)
	end

	return 
end

return 
