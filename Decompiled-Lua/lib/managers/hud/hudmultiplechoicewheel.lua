HUDMultipleChoiceWheel = HUDMultipleChoiceWheel or class()
HUDMultipleChoiceWheel.W = 1080
HUDMultipleChoiceWheel.H = 960
HUDMultipleChoiceWheel.BACKGROUND_IMAGE = "comm_wheel_bg"
HUDMultipleChoiceWheel.CIRCLE_IMAGE = "comm_wheel_circle"
HUDMultipleChoiceWheel.POINTER_IMAGE = "comm_wheel_triangle"
HUDMultipleChoiceWheel.LINE_IMAGE = "coom_wheel_line"
HUDMultipleChoiceWheel.SEPARATOR_LINE_UNSELECTED_ALPHA = 0.25
HUDMultipleChoiceWheel.SEPARATOR_LINE_SELECTED_ALPHA = 1
HUDMultipleChoiceWheel.WHEEL_RADIUS = 128
HUDMultipleChoiceWheel.LINE_LENGTH = 237
HUDMultipleChoiceWheel.ICON_DISTANCE_FROM_CIRCLE = 100
HUDMultipleChoiceWheel.ICON_UNSELECTED_ALPHA = 0.5
HUDMultipleChoiceWheel.ICON_SELECTED_ALPHA = 1
HUDMultipleChoiceWheel.TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDMultipleChoiceWheel.TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDMultipleChoiceWheel.TEXT_DISTANCE_FROM_CIRCLE = 220
HUDMultipleChoiceWheel.TEXT_UNSELECTED_ALPHA = 0.75
HUDMultipleChoiceWheel.TEXT_SELECTED_ALPHA = 1
function HUDMultipleChoiceWheel:init(ws, hud, params)
	self._ws = ws
	self._tweak_data = params
	self._is_active = false
	self._in_cooldown = false
	slot6 = params.options
	self._option_data = deep_clone(slot5)
	self._options = {}
	self._separators = {}
	self._center = {}
	slot8 = managers.gui_data
	slot11 = hud.panel
	self._center.x, self._center.y = managers.gui_data.safe_to_full(slot7, hud.panel.world_center(slot10))
	self._show_clbks = (params and params.show_clbks) or nil
	self._hide_clbks = (params and params.hide_clbks) or nil
	slot7 = hud

	self._create_panel(slot5, self)

	slot6 = self

	self._create_background(slot5)

	slot6 = self

	self._create_pointer(slot5)

	slot6 = self

	self._setup_controller(slot5)

	return 
end
function HUDMultipleChoiceWheel:_create_panel(hud)
	local panel_params = {
		layer = 1200,
		name = "multiple_choice_wheel_panel",
		halign = "center",
		valign = "top",
		w = HUDMultipleChoiceWheel.W,
		h = HUDMultipleChoiceWheel.H
	}
	slot6 = panel_params
	self._object = hud.panel.panel(slot4, hud.panel)

	return 
end
function HUDMultipleChoiceWheel:_create_background()
	local background_params = {
		name = "background",
		texture = tweak_data.gui.icons[HUDMultipleChoiceWheel.BACKGROUND_IMAGE].texture,
		texture_rect = tweak_data.gui.icons[HUDMultipleChoiceWheel.BACKGROUND_IMAGE].texture_rect
	}
	slot5 = background_params
	local background = self._object.bitmap(HUDMultipleChoiceWheel.BACKGROUND_IMAGE, self._object)
	slot8 = self._object
	slot6 = self._object.w(slot7) / 2

	background.set_center_x(self._object, background)

	slot8 = self._object
	slot6 = self._object.h(slot7) / 2

	background.set_center_y(self._object, background)

	local background_circle_params = {
		name = "background_circle",
		layer = 10,
		alpha = 0.25,
		texture = tweak_data.gui.icons[HUDMultipleChoiceWheel.CIRCLE_IMAGE].texture,
		texture_rect = tweak_data.gui.icons[HUDMultipleChoiceWheel.CIRCLE_IMAGE].texture_rect
	}
	slot7 = background_circle_params
	local background_circle = self._object.bitmap(HUDMultipleChoiceWheel.CIRCLE_IMAGE, self._object)
	slot10 = self._object
	slot8 = self._object.w(slot9) / 2

	background_circle.set_center_x(self._object, background_circle)

	slot10 = self._object

	background_circle.set_center_y(self._object, background_circle)

	local selection_arc_params = {
		name = "selection_arc",
		visible = false,
		render_template = "VertexColorTexturedRadial",
		texture = tweak_data.gui.icons[HUDMultipleChoiceWheel.CIRCLE_IMAGE].texture
	}
	slot10 = HUDMultipleChoiceWheel.CIRCLE_IMAGE
	slot10 = HUDMultipleChoiceWheel.CIRCLE_IMAGE
	selection_arc_params.texture_rect = {
		tweak_data.gui.icon_w(self._object.h(slot9) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._object.h(slot9) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._object.h(slot9) / 2, tweak_data.gui)
	}
	slot9 = HUDMultipleChoiceWheel.CIRCLE_IMAGE
	selection_arc_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot9 = HUDMultipleChoiceWheel.CIRCLE_IMAGE
	selection_arc_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = background_circle
	selection_arc_params.layer = background_circle.layer(tweak_data.gui.icon_h) + 1
	slot9 = selection_arc_params
	self._selection_arc = self._object.bitmap(tweak_data.gui.icon_h, self._object)
	slot11 = self._object
	slot9 = self._object.w(HUDMultipleChoiceWheel.CIRCLE_IMAGE) / 2

	self._selection_arc.set_center_x(tweak_data.gui.icon_h, self._selection_arc)

	slot11 = self._object
	slot9 = self._object.h(HUDMultipleChoiceWheel.CIRCLE_IMAGE) / 2

	self._selection_arc.set_center_y(tweak_data.gui.icon_h, self._selection_arc)

	return 
end
function HUDMultipleChoiceWheel:_create_pointer()
	local pointer_params = {
		name = "pointer",
		texture = tweak_data.gui.icons[HUDMultipleChoiceWheel.POINTER_IMAGE].texture,
		texture_rect = tweak_data.gui.icons[HUDMultipleChoiceWheel.POINTER_IMAGE].texture_rect
	}
	slot5 = pointer_params
	self._pointer = self._object.bitmap(HUDMultipleChoiceWheel.POINTER_IMAGE, self._object)
	slot8 = self._object

	self._pointer.set_center(HUDMultipleChoiceWheel.POINTER_IMAGE, self._pointer, self._object.w(self._object.h(self._object) / 2) / 2)

	return 
end
function HUDMultipleChoiceWheel:_setup_controller()
	slot3 = managers.controller
	self._controller = managers.controller.get_default_controller(slot2)

	self._ws.connect_controller(slot2, self._ws, self._controller)

	slot3 = self._object
	slot8 = "_axis_moved"

	self._object.axis_move(slot2, callback(true, self, self))

	return 
end
function HUDMultipleChoiceWheel:destroy(unit)
	slot6 = self

	managers.queued_tasks.unqueue_all(slot3, managers.queued_tasks, nil)

	return 
end
function HUDMultipleChoiceWheel:is_visible()
	return self._is_active
end
function HUDMultipleChoiceWheel:show()
	if self._show_clbks then
		slot3 = self._show_clbks

		for _, clbk in pairs(slot2) do
			clbk()
		end
	end

	self._is_active = true

	if 0 < #self._options then
		slot3 = self

		self._destroy_options(slot2)

		self._is_active = true
	end

	slot3 = self

	self._create_options(slot2)

	slot4 = false

	self._activate_pointer(slot2, self)

	slot3 = self

	self._setup_controller(slot2)
	self._ws.connect_controller(slot2, self._ws, self._controller)

	slot3 = self

	self._fade_in_options(slot2)

	slot6 = self._object
	slot7 = self._object
	slot7 = self._object.parent(self._object.parent(true))

	self._object.set_center(slot2, self._object, self._object.parent(true).w(true) / 2)

	slot7 = self._object
	slot5 = self._object.h(self._object) / 2

	self._pointer.set_center(slot2, self._pointer, self._object.w(self._object.parent(self._object.parent(true)).h(self._object.parent(true)) / 2) / 2)

	slot4 = "[HUDMultipleChoiceWheel]_destroy_options"

	if managers.queued_tasks.has_task(slot2, managers.queued_tasks) then
		slot4 = "[HUDMultipleChoiceWheel]_destroy_options"

		managers.queued_tasks.unqueue(slot2, managers.queued_tasks)
	end

	slot4 = true

	self._object.set_visible(slot2, self._object)

	return 
end
function HUDMultipleChoiceWheel:hide(quiet)
	slot4 = self

	self._deactivate_pointer(slot3)

	slot5 = self._controller

	self._ws.disconnect_controller(slot3, self._ws)

	self._starting_mouse = nil
	slot4 = self

	self._fade_out_options(slot3)

	slot5 = false

	self._object.set_visible(slot3, self._object)

	slot10 = nil

	managers.queued_tasks.queue(slot3, managers.queued_tasks, "[HUDMultipleChoiceWheel]_destroy_options", self._destroy_options, self, nil, 0.4)

	self._is_active = false

	if self._hide_clbks then
		slot4 = self._hide_clbks

		for _, clbk in pairs(slot3) do
			clbk()
		end
	end

	if self._in_cooldown then
		return 
	end

	if self._active_panel ~= nil and not quiet then
		local current = self._option_data[self._active_panel]
		slot6 = current.id

		self.trigger_option(slot4, self)
	end

	return 
end
function HUDMultipleChoiceWheel:trigger_option(id)
	if not id or self._in_cooldown then
		return 
	end

	local option = nil

	for i = 1, #self._option_data, 1 do
		if self._option_data[i].id and self._option_data[i].id == id then
			option = self._option_data[i]

			break
		end
	end

	if not option then
		return 
	end

	if option.clbk_data then
		slot7 = option.clbk_data

		option.clbk(unpack(slot6))
	else
		slot5 = nil

		option.clbk(slot4)
	end

	if self._tweak_data.cooldown then
		self._in_cooldown = true
		slot11 = nil

		managers.queued_tasks.queue(slot4, managers.queued_tasks, "multiple_choice_wheel_cooldown", self.stop_cooldown, self, nil, self._tweak_data.cooldown)
	end

	return 
end
function HUDMultipleChoiceWheel:_call_clbk(function_name, function_data)
	if self._in_cooldown then
		return 
	end

	local parts = string.split(slot4, function_name)
	local method = parts[2]
	slot8 = "[.]"
	local target_parts = string.split(":", parts[1])
	local target = nil

	for i = 1, #target_parts, 1 do
		if target == nil then
			target = _G[target_parts[i]]
		else
			target = target[target_parts[i]]
		end
	end

	slot9 = target
	slot12 = function_data

	target[method](slot8, unpack(slot11))

	if self._tweak_data.cooldown then
		self._in_cooldown = true
		slot15 = nil

		managers.queued_tasks.queue(slot8, managers.queued_tasks, "multiple_choice_wheel_cooldown", self.stop_cooldown, self, nil, self._tweak_data.cooldown)
	end

	return 
end
function HUDMultipleChoiceWheel:stop_cooldown()
	self._in_cooldown = false

	return 
end
function HUDMultipleChoiceWheel:_create_options()
	local single_option_angle = 360 / #self._option_data

	for i = 1, #self._option_data, 1 do
		slot9 = i

		self._create_separator_line(slot7, self)

		slot9 = i
		local icon = self._create_icon(slot7, self)
		local text = self._create_option_text(self, self)
		local option = {
			icon = icon,
			text = text
		}
		slot12 = option

		table.insert(i, self._options)
	end

	slot5 = 1 / #self._option_data

	self._selection_arc.set_position_z(slot3, self._selection_arc)

	return 
end
function HUDMultipleChoiceWheel:_create_separator_line(index)
	local single_option_angle = 360 / #self._option_data
	local separator_line_params = {}
	slot7 = index
	separator_line_params.name = "separator_line_" .. tostring(slot6)
	separator_line_params.texture = tweak_data.gui.icons[HUDMultipleChoiceWheel.LINE_IMAGE].texture
	separator_line_params.texture_rect = tweak_data.gui.icons[HUDMultipleChoiceWheel.LINE_IMAGE].texture_rect
	separator_line_params.rotation = single_option_angle * (index - 1)
	separator_line_params.alpha = HUDMultipleChoiceWheel.SEPARATOR_LINE_UNSELECTED_ALPHA
	local separator_line = self._object.bitmap(HUDMultipleChoiceWheel.LINE_IMAGE, self._object)
	local dx = (HUDMultipleChoiceWheel.WHEEL_RADIUS + HUDMultipleChoiceWheel.LINE_LENGTH / 2) * math.cos(separator_line_params)
	slot9 = single_option_angle * (index - 1) - 90
	local dy = (HUDMultipleChoiceWheel.WHEEL_RADIUS + HUDMultipleChoiceWheel.LINE_LENGTH / 2) * math.sin(single_option_angle * (index - 1) - 90)
	slot12 = self._object
	slot10 = self._object.w(slot11) / 2 + dx

	separator_line.set_center_x(single_option_angle * (index - 1) - 90, separator_line)

	slot12 = self._object
	slot10 = self._object.h(slot11) / 2 + dy

	separator_line.set_center_y(single_option_angle * (index - 1) - 90, separator_line)

	slot10 = separator_line

	table.insert(single_option_angle * (index - 1) - 90, self._separators)

	return 
end
function HUDMultipleChoiceWheel:_create_icon(index)
	local single_option_angle = 360 / #self._option_data
	local icon_params = {}
	slot7 = self._option_data[index].id
	icon_params.name = "icon_" .. tostring(slot6)
	icon_params.texture = tweak_data.gui.icons[self._option_data[index].icon].texture
	icon_params.texture_rect = tweak_data.gui.icons[self._option_data[index].icon].texture_rect
	icon_params.alpha = HUDMultipleChoiceWheel.ICON_UNSELECTED_ALPHA
	local icon = self._object.bitmap(self._option_data[index].icon, self._object)
	local dx = (HUDMultipleChoiceWheel.WHEEL_RADIUS + HUDMultipleChoiceWheel.ICON_DISTANCE_FROM_CIRCLE) * math.cos(icon_params)
	slot9 = (single_option_angle * (index - 1) + single_option_angle / 2) - 90
	local dy = (HUDMultipleChoiceWheel.WHEEL_RADIUS + HUDMultipleChoiceWheel.ICON_DISTANCE_FROM_CIRCLE) * math.sin((single_option_angle * (index - 1) + single_option_angle / 2) - 90)
	slot12 = self._object
	slot10 = self._object.w(slot11) / 2 + dx

	icon.set_center_x((single_option_angle * (index - 1) + single_option_angle / 2) - 90, icon)

	slot12 = self._object
	slot10 = self._object.h(slot11) / 2 + dy

	icon.set_center_y((single_option_angle * (index - 1) + single_option_angle / 2) - 90, icon)

	return icon
end
function HUDMultipleChoiceWheel:_create_option_text(index)
	local single_option_angle = 360 / #self._option_data
	local option_text_params = {
		vertical = "center",
		align = "center",
		halign = "center",
		valign = "center",
		name = "text_" .. tostring(slot6),
		font = HUDMultipleChoiceWheel.TEXT_FONT,
		font_size = HUDMultipleChoiceWheel.TEXT_FONT_SIZE
	}
	slot9 = self._option_data[index].text_id
	option_text_params.text = utf8.to_upper(managers.localization.text(self._option_data[index].id, managers.localization))
	option_text_params.alpha = HUDMultipleChoiceWheel.TEXT_UNSELECTED_ALPHA
	slot7 = option_text_params
	local text = self._object.text(tostring(slot6), self._object)
	slot7 = text
	local _, _, w, h = text.text_rect(self._object)
	slot12 = w + 10

	text.set_w(slot10, text)

	slot12 = h

	text.set_h(slot10, text)

	local dx = (HUDMultipleChoiceWheel.WHEEL_RADIUS + HUDMultipleChoiceWheel.TEXT_DISTANCE_FROM_CIRCLE) * math.cos(text)
	slot13 = (single_option_angle * (index - 1) + single_option_angle / 2) - 90
	local dy = (HUDMultipleChoiceWheel.WHEEL_RADIUS + HUDMultipleChoiceWheel.TEXT_DISTANCE_FROM_CIRCLE) * math.sin((single_option_angle * (index - 1) + single_option_angle / 2) - 90)
	slot16 = self._object
	slot14 = self._object.w(slot15) / 2 + dx

	text.set_center_x((single_option_angle * (index - 1) + single_option_angle / 2) - 90, text)

	slot16 = self._object
	slot14 = self._object.h(slot15) / 2 + dy

	text.set_center_y((single_option_angle * (index - 1) + single_option_angle / 2) - 90, text)

	return text
end
function HUDMultipleChoiceWheel:_recreate_options()
	slot3 = self

	self._destroy_options(slot2)

	slot3 = self

	self._deactivate_pointer(slot2)

	slot3 = self

	self._create_options(slot2)

	slot4 = false

	self._activate_pointer(slot2, self)

	return 
end
function HUDMultipleChoiceWheel:set_options(options)
	self._option_data = options

	return 
end
function HUDMultipleChoiceWheel:add_option(option, index)
	for i = 1, #self._option_data, 1 do
		if self._option_data[i].id == option.id then
			return 
		end
	end

	index = index or #self._option_data + 1
	slot7 = option

	table.insert(slot4, self._option_data, index)

	return 
end
function HUDMultipleChoiceWheel:remove_option(option_id)
	for i = 1, #self._option_data, 1 do
		if self._option_data[i].id == option_id then
			slot9 = i

			table.remove(slot7, self._option_data)

			break
		end
	end

	return 
end
function HUDMultipleChoiceWheel:_fade_in_options()
	for slot4 = 1, #self._options, 1 do
	end

	return 
end
function HUDMultipleChoiceWheel:_fade_out_options()
	for i = 1, #self._options, 1 do
		if self._active_panel ~= nil and self._active_panel == i then
		end
	end

	if self._pointer ~= nil then
	end

	return 
end
function HUDMultipleChoiceWheel:_destroy_options()
	if self._is_active then
		slot3 = self._options

		for _, option in pairs(slot2) do
			slot9 = option.icon

			self._object.remove(slot7, self._object)

			slot9 = option.text

			self._object.remove(slot7, self._object)
		end

		self._options = {}
		self._is_active = false
		slot3 = self._separators

		for _, separator in pairs(slot2) do
			slot9 = separator

			self._object.remove(slot7, self._object)
		end

		self._separators = {}
	end

	return 
end
function HUDMultipleChoiceWheel:_activate_pointer(controller_activated)
	self._last_mouse_pos = {
		x = 0,
		y = 0
	}
	self._last_mouse_dist = 0

	if not controller_activated then
		slot4 = managers.controller

		if managers.controller.get_default_wrapper_type(slot3) ~= "pc" then
			return 
		end
	end

	self._mouse_active = true
	self._mouse_id = managers.mouse_pointer.get_id(slot3)
	local data = {}
	slot7 = "_mouse_moved"
	data.mouse_move = callback(managers.mouse_pointer, self, self)
	slot7 = "_mouse_clicked"
	data.mouse_click = callback(managers.mouse_pointer, self, self)
	data.id = self._mouse_id
	slot6 = data

	managers.mouse_pointer.use_mouse(managers.mouse_pointer, managers.mouse_pointer)

	local base_resolution = tweak_data.gui.base_resolution
	slot8 = base_resolution.y / 2

	managers.mouse_pointer.set_mouse_world_position(managers.mouse_pointer, managers.mouse_pointer, base_resolution.x / 2)

	slot7 = "none"

	managers.mouse_pointer.set_pointer_image(managers.mouse_pointer, managers.mouse_pointer)

	return 
end
function HUDMultipleChoiceWheel:_deactivate_pointer()
	if not self._mouse_active then
		return 
	end

	self._mouse_active = false
	slot4 = self._mouse_id

	managers.mouse_pointer.remove_mouse(slot2, managers.mouse_pointer)

	slot3 = managers.mouse_pointer

	managers.mouse_pointer.release_mouse_pointer(slot2)

	return 
end
function HUDMultipleChoiceWheel:_get_pointer_angle(x, y)
	local vec1 = {
		x = x,
		y = y
	}
	local vec2 = {
		x = 0,
		y = -3
	}
	slot8 = vec1.x
	slot9 = vec2.x
	local angle = math.atan2(slot6, vec1.y) - math.atan2(vec1.y, vec2.y)

	if angle < 0 then
		angle = 360 + angle
	end

	return angle
end
function HUDMultipleChoiceWheel:_enter_panel(id)
	slot5 = HUDMultipleChoiceWheel.TEXT_SELECTED_ALPHA

	self._options[id].text.set_alpha(slot3, self._options[id].text)

	slot5 = HUDMultipleChoiceWheel.ICON_SELECTED_ALPHA

	self._options[id].icon.set_alpha(slot3, self._options[id].icon)

	slot5 = HUDMultipleChoiceWheel.SEPARATOR_LINE_SELECTED_ALPHA

	self._separators[id].set_alpha(slot3, self._separators[id])

	slot5 = HUDMultipleChoiceWheel.SEPARATOR_LINE_SELECTED_ALPHA

	self._separators[id % #self._option_data + 1].set_alpha(id % #self._option_data + 1, self._separators[id % #self._option_data + 1])

	slot4 = self._pointer

	self._pointer.stop(id % #self._option_data + 1)

	local single_option_angle = math.ceil(id % #self._option_data + 1)
	slot6 = single_option_angle * id

	self._selection_arc.set_rotation(360 / #self._option_data, self._selection_arc)

	slot6 = true

	self._selection_arc.set_visible(360 / #self._option_data, self._selection_arc)

	return 
end
function HUDMultipleChoiceWheel:_exit_panel(id)
	slot5 = HUDMultipleChoiceWheel.TEXT_UNSELECTED_ALPHA

	self._options[id].text.set_alpha(slot3, self._options[id].text)

	slot5 = HUDMultipleChoiceWheel.ICON_UNSELECTED_ALPHA

	self._options[id].icon.set_alpha(slot3, self._options[id].icon)

	slot5 = HUDMultipleChoiceWheel.SEPARATOR_LINE_UNSELECTED_ALPHA

	self._separators[id].set_alpha(slot3, self._separators[id])

	slot5 = HUDMultipleChoiceWheel.SEPARATOR_LINE_UNSELECTED_ALPHA

	self._separators[id % #self._option_data + 1].set_alpha(id % #self._option_data + 1, self._separators[id % #self._option_data + 1])

	slot5 = false

	self._selection_arc.set_visible(id % #self._option_data + 1, self._selection_arc)

	return 
end
function HUDMultipleChoiceWheel:_select_panel(x, y, distance_from_center)
	slot8 = y - self._center.y
	local angle = self._get_pointer_angle(slot5, self, x - self._center.x)
	slot7 = angle / 360 / #self._options
	local quadrant = math.floor(self) + 1

	if 50 < distance_from_center then
		if self._active_panel ~= nil then
			if self._active_panel ~= quadrant then
				slot9 = self._active_panel

				self._exit_panel(slot7, self)

				slot9 = quadrant

				self._enter_panel(slot7, self)
			end
		else
			slot9 = quadrant

			self._enter_panel(slot7, self)
		end

		for i = 1, #self._options, 1 do
			if i == quadrant then
				self._active_panel = i
			end
		end
	else
		slot9 = quadrant

		self._exit_panel(slot7, self)

		if self._active_panel ~= nil then
			slot9 = self._active_panel

			self._exit_panel(slot7, self)

			self._active_panel = nil
			slot8 = self._pointer

			self._pointer.stop(slot7)
		end
	end

	return 
end
function HUDMultipleChoiceWheel:_axis_moved(o, axis, value, c)
	slot7 = "right"

	if axis == Idstring(slot6) then
		slot9 = -value.y * 100

		self.set_pointer_position(slot6, self, value.x * 100)
	end

	return 
end
function HUDMultipleChoiceWheel:set_pointer_position(x, y)
	slot8 = self._object
	slot6 = self._object.w(slot7) / 2 + x

	self._pointer.set_center_x(slot4, self._pointer)

	slot8 = self._object
	slot6 = self._object.h(slot7) / 2 + y

	self._pointer.set_center_y(slot4, self._pointer)

	slot7 = y
	local angle = self._get_pointer_angle(slot4, self, x)

	self._pointer.set_rotation(self, self._pointer)

	slot9 = 2
	slot10 = 2
	slot6 = math.pow(angle, x) + math.pow(x, y)
	local distance_from_center = math.sqrt(self)
	local center_x = (self._starting_mouse and self._starting_mouse.x) or self._center.x
	local center_y = (self._starting_mouse and self._starting_mouse.y) or self._center.y
	slot12 = distance_from_center

	self._select_panel(slot8, self, self._center.x + x, self._center.y + y)

	return 
end
function HUDMultipleChoiceWheel:_mouse_moved(o, x, y, mouse_ws)
	if self._starting_mouse == nil then
		self._starting_mouse = {
			x = x,
			y = y
		}
	end

	slot10 = 2
	slot11 = 2
	local distance_from_center = math.sqrt(slot6)
	slot10 = y - self._starting_mouse.y
	local angle = self._get_pointer_angle(math.pow(slot8, x - self._starting_mouse.x) + math.pow(x - self._starting_mouse.x, y - self._starting_mouse.y), self, x - self._starting_mouse.x)
	local dx = 100 * math.cos(self)
	slot10 = angle - 91
	local dy = 100 * math.sin(angle - 91)

	if distance_from_center < 100 then
		slot13 = y - self._starting_mouse.y

		self.set_pointer_position(slot10, self, x - self._starting_mouse.x)

		slot11 = managers.mouse_pointer
		local mx, my = managers.mouse_pointer.world_position(slot10)
		self._last_mouse_pos.x = mx
		self._last_mouse_pos.y = my
	else
		slot13 = dy

		self.set_pointer_position(slot10, self, dx)

		slot14 = self._object
		slot13 = 0
		local curr_mouse_dist = Vector3(slot10, x - self._object.center_x(dx), y - self._object.center_y(self._object))
		slot12 = curr_mouse_dist

		if self._last_mouse_dist < curr_mouse_dist.length(x - self._object.center_x(dx)) then
			slot12 = curr_mouse_dist
			self._last_mouse_dist = curr_mouse_dist.length(slot11)
		else
			slot14 = self._starting_mouse.y + dy

			managers.mouse_pointer.set_mouse_world_position(slot11, managers.mouse_pointer, self._starting_mouse.x + dx)

			self._last_mouse_dist = 0
		end
	end

	return 
end
function HUDMultipleChoiceWheel:_mouse_clicked(o, button, x, y)
	return 
end
function HUDMultipleChoiceWheel:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDMultipleChoiceWheel:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDMultipleChoiceWheel:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDMultipleChoiceWheel:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end

return 
