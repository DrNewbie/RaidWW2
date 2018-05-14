if not RaidGUIControlProgressBar then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlProgressBar = slot0
RaidGUIControlProgressBar.SLIDER_STEP = 0.1
function RaidGUIControlProgressBar:init(parent, params)
	slot7 = params

	RaidGUIControlProgressBar.super.init(slot4, self, parent)

	if not self._params.color then
		slot7 = self._params.name

		Application.error(slot4, Application, "[RaidGUIControlProgressBar:init] Progress color not specified for the progress bar: ")

		return 
	end

	self._bar_width = params.bar_width or params.w / 2
	self._params.font = self._params.font or tweak_data.menu.pd2_medium_font
	self._params.font_size = self._params.font_size or tweak_data.menu.pd2_medium_font_size
	slot6 = self._params
	self._object = self._panel.panel(self._params.font_size or tweak_data.menu.pd2_medium_font_size, self._panel)
	self._bg_color = params.bar_background_color
	slot6 = {
		params.layer,
		y = 0,
		name = self._name .. "_bg",
		color = self._bg_color,
		x = self._object.w("_bg") - self._bar_width,
		w = self._bar_width,
		h = params.h,
		layer = self._params.layer + 1
	}
	slot9 = self._object
	self._bg = self._object.rect(self._params.font_size or tweak_data.menu.pd2_medium_font_size, self._object)
	slot6 = {
		align = "left",
		x = 0,
		w = self._object.w(self._bar_width) / 5 * 4,
		text = utf8.to_upper(self._bar_width),
		color = self._params.description_color or Color.white,
		font = self._params.font,
		font_size = self._params.font_size,
		layer = self._params.layer + 1
	}
	slot9 = self._object
	slot9 = params.description
	self._description = self._object.text(self._params.font_size or tweak_data.menu.pd2_medium_font_size, self._object)
	self._params.layer = self._params.layer + 2
	slot6 = self._params
	self._bar = self._object.rect(self._params.layer + 2, self._object)

	if params.border_width then
		slot8 = self._bg
		slot6 = self._bg.x(slot7) + params.border_width

		self._bar.set_x(slot4, self._bar)

		slot8 = self._bg
		slot6 = self._bg.y(params.border_width) + params.border_width

		self._bar.set_y(slot4, self._bar)

		slot8 = self._bg
		slot6 = self._bg.w(params.border_width) - 2 * params.border_width

		self._bar.set_w(slot4, self._bar)

		slot8 = self._bg
		slot6 = self._bg.h(2 * params.border_width) - 2 * params.border_width

		self._bar.set_h(slot4, self._bar)

		slot5 = self._bg
		self._width = self._bg.width(slot4) - 2 * params.border_width
	else
		slot5 = self._bg
		self._width = self._bg.width(slot4)
	end

	self._draggable = self._params.dragable
	self._progress = 1
	self._on_value_change_callback = params.on_value_change_callback

	return 
end
function RaidGUIControlProgressBar:close()
	RaidGUIControlScrollbar.super.close()

	self._dragging = false
	self._draggable = false

	return 
end
function RaidGUIControlProgressBar:set_progress(progress)
	slot6 = 1
	self._progress = math.clamp(slot3, progress, 0)
	local width = self._progress * self._width
	slot6 = width

	self._bar.set_width(progress, self._bar)

	return 
end
function RaidGUIControlProgressBar:get_progress()
	return self._progress
end
function RaidGUIControlProgressBar:on_mouse_moved(o, x, y)
	if not self._draggable then
		return 
	end

	slot9 = y

	RaidGUIControlProgressBar.super.on_mouse_moved(slot5, self, o, x)

	if not self._dragging then
		return 
	end

	local new_width = x - self._bg.world_x(slot5) - (self._params.border_width or 0)
	slot9 = 1
	local progress = math.clamp(self._bg, new_width / self._width, 0)
	slot9 = progress

	self.set_progress(new_width / self._width, self)

	if self._on_value_change_callback then
		self._on_value_change_callback()
	end

	return true, "grab"
end
function RaidGUIControlProgressBar:on_mouse_over(x, y)
	if not self._draggable then
		return 
	end

	slot7 = y

	RaidGUIControlProgressBar.super.on_mouse_over(slot4, self, x)

	self._pointer_type = "hand"

	return 
end
function RaidGUIControlProgressBar:on_mouse_out(x, y)
	if not self._draggable then
		return 
	end

	slot7 = y

	RaidGUIControlProgressBar.super.on_mouse_out(slot4, self, x)

	self._pointer_type = "hand"

	if self._dragging then
		slot5 = self._bg

		if x - self._bg.world_x(slot4) < 0 then
			slot6 = 0

			self.set_progress(slot4, self)
		else
			slot6 = self._bg

			if self._bg.w(self._bg) < x - self._bg.world_x(slot4) then
				slot6 = 1

				self.set_progress(slot4, self)
			end
		end
	end

	self._dragging = false

	return 
end
function RaidGUIControlProgressBar:on_mouse_pressed()
	if not self._draggable then
		return 
	end

	slot4 = self

	managers.raid_menu.set_active_control(slot2, managers.raid_menu)

	self._pointer_type = "grab"
	self._dragging = true
	self._last_x = nil

	return 
end
function RaidGUIControlProgressBar:on_mouse_released()
	if not self._draggable then
		return 
	end

	self._pointer_type = "hand"
	self._dragging = false

	if self._on_value_change_callback then
		self._on_value_change_callback()
	end

	return 
end
function RaidGUIControlProgressBar:show()
	slot3 = self._object

	self._object.show(slot2)

	slot3 = self._bar

	self._bar.show(slot2)

	slot3 = self._bg

	self._bg.show(slot2)

	return 
end
function RaidGUIControlProgressBar:hide()
	slot3 = self._object

	self._object.hide(slot2)

	slot3 = self._bar

	self._bar.hide(slot2)

	slot3 = self._bg

	self._bg.hide(slot2)

	return 
end
function RaidGUIControlProgressBar:set_selected(value)
	self._selected = value

	if self._selected then
		slot4 = self

		self.highlight_on(slot3)
	else
		slot4 = self

		self.highlight_off(slot3)
	end

	return 
end
function RaidGUIControlProgressBar:highlight_on()
	if self._params.no_highlight then
		return 
	end

	slot3 = self._object

	self._object.highlight_on(slot2)

	return 
end
function RaidGUIControlProgressBar:highlight_off()
	if self._params.no_highlight or self._selected then
		return 
	end

	slot3 = self._object

	self._object.highlight_off(slot2)

	return 
end
function RaidGUIControlProgressBar:confirm_pressed()
	if self._selected then
		self._selected_control = not self._selected_control
		slot4 = self._selected_control

		self._select_control(slot2, self)

		return true
	end

	return 
end
function RaidGUIControlProgressBar:_select_control(value)
	local color = (value and Color.white) or self._bg_color
	slot6 = color

	self._bg.set_color(slot4, self._bg)

	return 
end
function RaidGUIControlProgressBar:move_down()
	if self._selected then
		if self._selected_control then
			self._selected_control = false
			slot4 = false

			self._select_control(slot2, self)
		end

		slot3 = self

		return self.super.move_down(slot2)
	end

	return 
end
function RaidGUIControlProgressBar:move_up()
	if self._selected then
		if self._selected_control then
			self._selected_control = false
			slot4 = false

			self._select_control(slot2, self)
		end

		slot3 = self

		return self.super.move_up(slot2)
	end

	return 
end
function RaidGUIControlProgressBar:move_left()
	if self._selected then
		if self._selected_control then
			local current_progress = self.get_progress(slot2)
			slot5 = current_progress - RaidGUIControlProgressBar.SLIDER_STEP

			self.set_progress(self, self)

			if self._on_value_change_callback then
				self._on_value_change_callback()
			end

			return true
		else
			slot3 = self

			return self.super.move_left(slot2)
		end
	end

	return 
end
function RaidGUIControlProgressBar:move_right()
	if self._selected then
		if self._selected_control then
			local current_progress = self.get_progress(slot2)
			slot5 = current_progress + RaidGUIControlProgressBar.SLIDER_STEP

			self.set_progress(self, self)

			if self._on_value_change_callback then
				self._on_value_change_callback()
			end

			return true
		else
			slot3 = self

			return self.super.move_right(slot2)
		end
	end

	return 
end

return 
