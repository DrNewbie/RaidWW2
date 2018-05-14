-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGuiControlKeyBind then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGuiControlKeyBind = slot0
RaidGuiControlKeyBind.WIDTH_SHORT = 32
RaidGuiControlKeyBind.WIDTH_MEDIUM = 112
RaidGuiControlKeyBind.WIDTH_LONG = 172
RaidGuiControlKeyBind.WIDTH_VERY_LONG = 236
RaidGuiControlKeyBind.HEIGHT = 32
RaidGuiControlKeyBind.PADDING = 16
RaidGuiControlKeyBind.TEXT_COLOR_NORMAL = tweak_data.gui.colors.raid_grey
RaidGuiControlKeyBind.TEXT_COLOR_ACTIVE = tweak_data.gui.colors.raid_white
RaidGuiControlKeyBind.ACTIVE_LINE_COLOR = tweak_data.gui.colors.raid_red
RaidGuiControlKeyBind.ICON_LEFT = "kb_left_base"
RaidGuiControlKeyBind.ICON_CENTER = "kb_center_base"
RaidGuiControlKeyBind.ICON_RIGHT = "kb_right_base"
RaidGuiControlKeyBind.CORNER_WIDTH = 10
function RaidGuiControlKeyBind:init(parent, params)
	slot7 = params

	RaidGuiControlKeyBind.super.init(slot4, self, parent)

	if not self._params.text_id and not self._params.text then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlLabel:init] Text not specified for the label control: ")

		return 
	end

	self._keybind_params = self._params.keybind_params
	self._params.layer = self._params.layer + 2
	slot6 = self._params
	self._object = self._panel.panel(self._params.layer + 2, self._panel)
	slot5 = self

	self._create_keybind_layout(self._params.layer + 2)

	slot6 = {
		visible = false,
		h = 32,
		y = 0,
		w = 3,
		x = 0,
		color = RaidGuiControlKeyBind.ACTIVE_LINE_COLOR
	}
	self._active_line = self._object.rect(self._params.layer + 2, self._object)
	self._params.layer = self._params.layer - 1
	self._ws = self._params.ws
	self._listening_to_input = false

	return 
end
function RaidGuiControlKeyBind:is_listening_to_input()
	return self._listening_to_input
end
function RaidGuiControlKeyBind:highlight_on()
	slot4 = RaidGuiControlKeyBind.TEXT_COLOR_ACTIVE

	self._description.set_color(slot2, self._description)

	slot4 = RaidGuiControlKeyBind.TEXT_COLOR_ACTIVE

	self._keybind.set_color(slot2, self._keybind)

	slot4 = "active"

	self._set_background_state(slot2, self)

	slot3 = self._active_line

	self._active_line.show(slot2)

	if self._play_mouse_over_sound then
		slot4 = "highlight"

		managers.menu_component.post_event(slot2, managers.menu_component)

		self._play_mouse_over_sound = false
	end

	return 
end
function RaidGuiControlKeyBind:highlight_off()
	if not self._listening_to_input then
		slot4 = RaidGuiControlKeyBind.TEXT_COLOR_NORMAL

		self._description.set_color(slot2, self._description)

		slot4 = RaidGuiControlKeyBind.TEXT_COLOR_NORMAL

		self._keybind.set_color(slot2, self._keybind)

		slot4 = "normal"

		self._set_background_state(slot2, self)

		slot3 = self._active_line

		self._active_line.hide(slot2)
	end

	self._play_mouse_over_sound = true

	return 
end
function RaidGuiControlKeyBind:_set_background_state(bg_state)
	if bg_state == "active" then
		slot4 = self._background_left

		self._background_left.hide(slot3)

		slot4 = self._background_left_active

		self._background_left_active.show(slot3)

		slot4 = self._background_mid

		self._background_mid.hide(slot3)

		slot4 = self._background_mid_active

		self._background_mid_active.show(slot3)

		slot4 = self._background_right

		self._background_right.hide(slot3)

		slot4 = self._background_right_active

		self._background_right_active.show(slot3)
	else
		slot4 = self._background_left

		self._background_left.show(slot3)

		slot4 = self._background_left_active

		self._background_left_active.hide(slot3)

		slot4 = self._background_mid

		self._background_mid.show(slot3)

		slot4 = self._background_mid_active

		self._background_mid_active.hide(slot3)

		slot4 = self._background_right

		self._background_right.show(slot3)

		slot4 = self._background_right_active

		self._background_right_active.hide(slot3)
	end

	return 
end
function RaidGuiControlKeyBind:on_mouse_released(button)
	slot4 = managers.user

	if managers.user.get_key_rebind_started(slot3) and not self._listening_to_input then
		return 
	end

	slot4 = self

	self.activate_customize_controller(slot3)

	return 
end
function RaidGuiControlKeyBind:activate_customize_controller()
	slot3 = self._ws
	slot6 = Input

	self._ws.connect_keyboard(slot2, Input.keyboard(slot5))

	slot6 = Input

	self._ws.connect_mouse(slot2, Input.mouse(slot5))

	self._listening_to_input = true

	local function f(o, key)
		slot8 = nil

		self._key_press(slot3, self, o, key, "keyboard")

		return 
	end

	slot5 = "_"

	self._keybind.set_text(self._ws, self._keybind)

	slot5 = f

	self._keybind.key_release(self._ws, self._keybind)

	local function f(o, key)
		slot8 = nil

		self._key_press(slot3, self, o, key, "mouse")

		return 
	end

	slot6 = f

	self._keybind.mouse_click(self._keybind, self._keybind)

	local function f(index, key)
		slot8 = true

		self._key_press(slot3, self, self._keybind, key, "mouse")

		return 
	end

	slot6 = Input
	slot9 = Input
	slot9 = Input.mouse(slot8)
	slot12 = "mouse wheel up"
	self._mouse_wheel_up_trigger = Input.mouse(self._keybind).add_trigger(self._keybind, Input.mouse(self._keybind), Input.mouse(slot8).button_index(slot8, Idstring(slot11)))
	slot6 = Input
	slot9 = Input
	slot9 = Input.mouse(f)
	slot12 = "mouse wheel down"
	slot8 = f
	self._mouse_wheel_down_trigger = Input.mouse(self._keybind).add_trigger(self._keybind, Input.mouse(self._keybind), Input.mouse(f).button_index(f, Idstring(slot11)))

	return 
end
function RaidGuiControlKeyBind:_key_press(o, key, input_id, no_add)

	-- Decompilation error in this vicinity:
	slot7 = managers.system_menu

	if managers.system_menu.is_active(slot6) then
		return 
	end

	if not self._listening_to_input then
		return 
	end

	slot7 = managers.user

	if managers.user.get_key_rebind_skip_first_activate_key(slot6) then
		slot8 = false

		managers.user.set_key_rebind_skip_first_activate_key(slot6, managers.user)

		if input_id == "mouse" then
			slot7 = "0"
		elseif input_id == "keyboard" then
			slot7 = "enter"

			if key == Idstring(slot6) then
				return 
			end
		end
	end

	slot7 = "esc"

	if key == Idstring(slot6) then
		slot8 = o

		self._end_customize_controller(slot6, self)

		return 
	end

	slot5 = ""
	local key_name = slot5 .. slot6

	if not no_add and input_id == "mouse" and not ("mouse " .. key_name) then
	end

	local forbidden_btns = {
		"esc",
		"tab",
		"num abnt c1",
		"num abnt c2",
		"@",
		"ax",
		"convert",
		"kana",
		"kanji",
		"no convert",
		"oem 102",
		"stop",
		"unlabeled",
		"yen",
		"mouse 8",
		"mouse 9",
		""
	}
	slot9 = forbidden_btns

	for _, btn in ipairs(slot8) do
		slot14 = btn

		if Idstring(slot13) == key then
			slot15 = {
				KEY = key_name
			}

			managers.menu.show_key_binding_forbidden(slot13, managers.menu)

			slot15 = o

			self._end_customize_controller(slot13, self)

			return 
		end
	end

	local button_category = MenuCustomizeControllerCreator.CONTROLS_INFO[self._keybind_params.button].category
	slot10 = managers.controller
	slot13 = managers.controller
	slot10 = managers.controller.get_settings(slot9, managers.controller.get_default_wrapper_type(slot12))
	local connections = managers.controller.get_settings(slot9, managers.controller.get_default_wrapper_type(slot12)).get_connection_map(slot9)
	slot13 = button_category

	for _, name in ipairs(MenuCustomizeControllerCreator.controls_info_by_category(slot12)) do
		local connection = connections[name]

		if connection._btn_connections then
			slot17 = connection._btn_connections

			for name, btn_connection in pairs(slot16) do
				if btn_connection.name == key_name and self._keybind_params.binding ~= btn_connection.name then
					slot23 = {
						KEY = key_name,
						MAPPED = managers.localization.text(slot25, managers.localization)
					}
					slot27 = MenuCustomizeControllerCreator.CONTROLS_INFO[name].text_id

					managers.menu.show_key_binding_collision(slot21, managers.menu)

					slot24 = true

					self._end_customize_controller(slot21, self, o)

					return 
				end
			end
		else
			slot19 = connection

			for _, b_name in ipairs(connection.get_input_name_list(slot18)) do
				slot22 = b_name

				if tostring(slot21) == key_name and self._keybind_params.binding ~= b_name then
					slot23 = {
						KEY = key_name,
						MAPPED = managers.localization.text(slot25, managers.localization)
					}
					slot27 = MenuCustomizeControllerCreator.CONTROLS_INFO[name].text_id

					managers.menu.show_key_binding_collision(slot21, managers.menu)

					slot24 = true

					self._end_customize_controller(slot21, self, o)

					return 
				end
			end
		end
	end

	if self._keybind_params.axis then
		connections[self._keybind_params.axis]._btn_connections[self._keybind_params.button].name = key_name
		slot13 = {
			axis = self._keybind_params.axis,
			button = self._keybind_params.button,
			connection = key_name
		}

		managers.controller.set_user_mod(self._keybind_params.button, managers.controller, self._keybind_params.connection_name)

		self._keybind_params.binding = key_name
	else
		slot12 = input_id

		connections[self._keybind_params.button].set_controller_id(slot10, connections[self._keybind_params.button])

		slot12 = {
			key_name
		}

		connections[self._keybind_params.button].set_input_name_list(slot10, connections[self._keybind_params.button])

		slot13 = {
			button = self._keybind_params.button,
			connection = key_name,
			controller_id = input_id
		}

		managers.controller.set_user_mod(slot10, managers.controller, self._keybind_params.connection_name)

		self._keybind_params.binding = key_name
	end

	slot11 = managers.controller

	managers.controller.rebind_connections(slot10)

	slot12 = o

	self._end_customize_controller(slot10, self)

	return 
end
function RaidGuiControlKeyBind:_end_customize_controller(o, skip_next_key_press)
	slot5 = o

	if not alive(slot4) then
		return 
	end

	slot5 = self._ws

	self._ws.disconnect_keyboard(slot4)

	slot5 = self._ws

	self._ws.disconnect_mouse(slot4)

	slot6 = nil

	o.key_press(slot4, o)

	slot6 = nil

	o.key_release(slot4, o)

	slot6 = nil

	o.mouse_click(slot4, o)

	slot6 = nil

	o.mouse_release(slot4, o)

	slot5 = Input
	slot6 = self._mouse_wheel_up_trigger

	Input.mouse(slot4).remove_trigger(slot4, Input.mouse(slot4))

	slot5 = Input
	slot6 = self._mouse_wheel_down_trigger

	Input.mouse(slot4).remove_trigger(slot4, Input.mouse(slot4))

	function slot6()
		self._listening_to_input = false
		slot2 = self

		self.highlight_off(false)

		slot2 = self

		self.reload(false)

		return 
	end

	setup.add_end_frame_clbk(slot4, setup)

	slot6 = false

	managers.user.set_key_rebind_started(slot4, managers.user)

	slot6 = true

	managers.user.set_key_rebind_skip_first_activate_key(slot4, managers.user)

	if skip_next_key_press then
		slot6 = true

		managers.user.set_key_rebind_skip_first_activate_key(slot4, managers.user)
	end

	return 
end
function RaidGuiControlKeyBind:reload()
	slot3 = self._object

	self._object.clear(slot2)

	slot3 = self

	self._create_keybind_layout(slot2)

	return 
end
function RaidGuiControlKeyBind:confirm_pressed()
	if self._selected then
		slot4 = self

		self.on_mouse_released(slot2, self)

		return true
	end

	return 
end
function RaidGuiControlKeyBind:_create_keybind_layout()
	slot4 = self._keybind_params.binding
	local translated_keybind = managers.localization.check_keybind_translation(slot2, managers.localization)
	slot5 = {
		vertical = "center",
		align = "center",
		y = 0,
		x = RaidGuiControlKeyBind.PADDING,
		h = RaidGuiControlKeyBind.HEIGHT,
		text = translated_keybind,
		color = RaidGuiControlKeyBind.TEXT_COLOR_NORMAL,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24
	}
	self._keybind = self._object.text(managers.localization, self._object)
	slot4 = self._keybind
	slot7 = translated_keybind

	self._keybind.set_text(managers.localization, utf8.to_upper(tweak_data.gui.font_sizes.size_24))

	slot5 = {
		align = "right",
		y = 0,
		x = self._params.keybind_w,
		w = self._params.w - self._params.keybind_w,
		h = RaidGuiControlKeyBind.HEIGHT,
		text = self._keybind_params.text_id,
		color = RaidGuiControlKeyBind.TEXT_COLOR_NORMAL,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small
	}
	self._description = self._object.text(managers.localization, self._object)
	slot4 = self._keybind
	local x1, y1, keybind_width, h1 = self._keybind.text_rect(managers.localization)

	if keybind_width < RaidGuiControlKeyBind.WIDTH_SHORT then
		keybind_width = RaidGuiControlKeyBind.WIDTH_SHORT
	elseif keybind_width < RaidGuiControlKeyBind.WIDTH_MEDIUM then
		keybind_width = RaidGuiControlKeyBind.WIDTH_MEDIUM
	elseif keybind_width < RaidGuiControlKeyBind.WIDTH_LONG then
		keybind_width = RaidGuiControlKeyBind.WIDTH_LONG
	else
		keybind_width = RaidGuiControlKeyBind.WIDTH_VERY_LONG
	end

	slot9 = {
		y = 0,
		x = RaidGuiControlKeyBind.PADDING,
		h = self._params.h,
		texture = tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_LEFT].texture,
		texture_rect = tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_LEFT].texture_rect
	}
	self._background_left = self._object.bitmap(slot7, self._object)
	local center_texture_rect = {
		tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_CENTER].texture_rect[1] + 1,
		tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_CENTER].texture_rect[2],
		tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_CENTER].texture_rect[3] - 2,
		tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_CENTER].texture_rect[4]
	}
	slot10 = {
		y = 0,
		x = self._background_left.x(slot12) + RaidGuiControlKeyBind.CORNER_WIDTH,
		w = keybind_width - 2 * RaidGuiControlKeyBind.CORNER_WIDTH,
		h = self._params.h,
		texture = tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_CENTER].texture,
		texture_rect = center_texture_rect
	}
	slot13 = self._background_left
	self._background_mid = self._object.bitmap(RaidGuiControlKeyBind.ICON_CENTER, self._object)
	slot10 = {
		y = 0,
		x = (self._background_left.x(RaidGuiControlKeyBind.ICON_CENTER) + keybind_width) - RaidGuiControlKeyBind.CORNER_WIDTH,
		h = self._params.h,
		texture = tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_RIGHT].texture,
		texture_rect = tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_RIGHT].texture_rect
	}
	slot13 = self._background_left
	self._background_right = self._object.bitmap(RaidGuiControlKeyBind.ICON_CENTER, self._object)
	slot10 = {
		visible = false,
		y = 0,
		x = RaidGuiControlKeyBind.PADDING,
		h = self._params.h,
		texture = tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_LEFT].texture,
		texture_rect = tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_LEFT].texture_rect
	}
	self._background_left_active = self._object.bitmap(RaidGuiControlKeyBind.ICON_CENTER, self._object)
	slot10 = {
		visible = false,
		y = 0,
		x = self._background_left_active.x(RaidGuiControlKeyBind.ICON_LEFT) + RaidGuiControlKeyBind.CORNER_WIDTH,
		w = keybind_width - 2 * RaidGuiControlKeyBind.CORNER_WIDTH,
		h = self._params.h,
		texture = tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_CENTER].texture,
		texture_rect = center_texture_rect
	}
	slot13 = self._background_left_active
	self._background_mid_active = self._object.bitmap(RaidGuiControlKeyBind.ICON_CENTER, self._object)
	slot10 = {
		visible = false,
		y = 0,
		x = (self._background_left_active.x(RaidGuiControlKeyBind.ICON_CENTER) + keybind_width) - RaidGuiControlKeyBind.CORNER_WIDTH,
		h = self._params.h,
		texture = tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_RIGHT].texture,
		texture_rect = tweak_data.gui.icons[RaidGuiControlKeyBind.ICON_RIGHT].texture_rect
	}
	slot13 = self._background_left_active
	self._background_right_active = self._object.bitmap(RaidGuiControlKeyBind.ICON_CENTER, self._object)
	slot10 = keybind_width

	self._keybind.set_w(RaidGuiControlKeyBind.ICON_CENTER, self._keybind)

	slot10 = {
		visible = false,
		h = 32,
		y = 0,
		w = 3,
		x = 0,
		color = RaidGuiControlKeyBind.ACTIVE_LINE_COLOR
	}
	self._active_line = self._object.rect(RaidGuiControlKeyBind.ICON_CENTER, self._object)
	slot10 = "normal"

	self._set_background_state(RaidGuiControlKeyBind.ICON_CENTER, self)

	return 
end

return 
