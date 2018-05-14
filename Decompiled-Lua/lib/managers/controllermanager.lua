-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- Decompilation Error: _glue_flows(node)

slot3 = "ControllerManager"

core.module(slot1, core)

slot3 = "CoreControllerManager"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not ControllerManager then
	slot2 = CoreControllerManager.ControllerManager
	slot0 = class(slot1)
end

ControllerManager = slot0
function ControllerManager:init(path, default_settings_path)
	default_settings_path = "settings/controller_settings"
	path = default_settings_path
	self._menu_mode_enabled = 0
	slot7 = default_settings_path

	ControllerManager.super.init(slot4, self, path)

	self._connected_xbox_controllers = {}
	slot5 = self

	self._initial_connected_xbox_controllers(slot4)

	return 
end
function ControllerManager:update(t, dt)
	slot7 = dt

	ControllerManager.super.update(slot4, self, t)

	slot5 = self

	self._poll_reconnected_controller(slot4)

	return 
end
function ControllerManager:is_using_controller()
	slot3 = managers.controller

	if managers.controller.is_xbox_controller_present(slot2) then
		slot3 = managers.menu
		slot1 = not managers.menu.is_pc_controller(slot2)
	end

	return slot1
end
function ControllerManager:is_xbox_controller_present()
	if not self._connected_xbox_controllers then
		return false
	end

	slot3 = self._connected_xbox_controllers

	for _, connected in pairs(slot2) do
		if connected then
			return true
		end
	end

	return false
end
function ControllerManager:_initial_connected_xbox_controllers()
	slot3 = self
	self._connected_xbox_controllers = self._collect_connected_xbox_controllers(slot2)

	return 
end
function ControllerManager:_collect_connected_xbox_controllers()
	local controllers_list = {}
	slot5 = "WIN32"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		slot4 = Input
		local nr_controllers = Input.num_controllers(slot3)

		for i_controller = 0, nr_controllers - 1, 1 do
			slot10 = i_controller
			local controller = Input.controller(slot8, Input)
			slot10 = controller

			if controller.type(Input) == "xbox_controller" then
				slot10 = controller
				controllers_list[i_controller] = controller.connected(slot9)
			end
		end
	end

	return controllers_list
end
function ControllerManager:_handle_xbox_keyboard_hotswap()
	slot3 = self
	local current_controllers_connection_state = self._collect_connected_xbox_controllers(slot2)
	local trigger_hotswap = false
	local default_wrapper_old = self.get_default_wrapper_type(slot4)
	local is_controller_present_old = self.is_xbox_controller_present(self)
	slot7 = current_controllers_connection_state

	for idx, connected in pairs(self) do
		if current_controllers_connection_state[idx] ~= self._connected_xbox_controllers[idx] then
			local wrapper_index = 1

			if connected then
				wrapper_index = self._controller_to_wrapper_list[idx]
			end

			slot14 = wrapper_index

			self.set_default_wrapper_index(slot12, self)

			slot14 = idx

			managers.user.set_index(slot12, managers.user)

			trigger_hotswap = true
		end
	end

	self._connected_xbox_controllers = current_controllers_connection_state
	local default_wrapper = self.get_default_wrapper_type(slot6)
	slot8 = self
	local is_controller_present = self.is_xbox_controller_present(self)

	if trigger_hotswap and (default_wrapper ~= default_wrapper_old or is_controller_present == is_controller_present_old) then
		slot9 = self

		self.dispatch_hotswap_callbacks(slot8)
	end

	return 
end
function ControllerManager:_poll_reconnected_controller()
	slot3 = self

	self._handle_xbox_keyboard_hotswap(slot2)

	slot4 = "XB1"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) and Global.controller_manager.connect_controller_dialog_visible then
		local active_xuid = XboxLive.current_user(slot2)
		slot4 = Input
		local nr_controllers = Input.num_controllers(XboxLive)

		for i_controller = 0, nr_controllers - 1, 1 do
			slot10 = i_controller
			local controller = Input.controller(slot8, Input)
			slot10 = controller

			if controller.type(Input) == "xb1_controller" then
				slot11 = 12
			end
		end
	end

	return 
end
function ControllerManager:controller_mod_changed()
	if not Global.controller_manager.user_mod then
		slot5 = "controller_mod"
		Global.controller_manager.user_mod = managers.user.get_setting(slot3, managers.user)
		slot3 = self

		self.load_user_mod(managers.user.get_setting(slot3, managers.user))
	end

	return 
end
function ControllerManager:set_user_mod(connection_name, params)
	Global.controller_manager.user_mod = Global.controller_manager.user_mod or {}

	if params.axis then
		Global.controller_manager.user_mod[connection_name] = Global.controller_manager.user_mod[connection_name] or {
			axis = params.axis
		}
		Global.controller_manager.user_mod[connection_name][params.button] = params
	else
		Global.controller_manager.user_mod[connection_name] = params
	end

	slot6 = "controller_mod_type"
	slot9 = managers.controller

	managers.user.set_setting(slot4, managers.user, managers.controller.get_default_wrapper_type(slot8))

	slot8 = true

	managers.user.set_setting(slot4, managers.user, "controller_mod", Global.controller_manager.user_mod)

	return 
end
function ControllerManager:clear_user_mod(category, CONTROLS_INFO)
	Global.controller_manager.user_mod = Global.controller_manager.user_mod or {}
	local names = table.map_keys(Global.controller_manager.user_mod or )
	slot6 = names

	for _, name in ipairs(Global.controller_manager.user_mod) do
		if CONTROLS_INFO[name] and (CONTROLS_INFO[name].category == category or category == "all") then
			Global.controller_manager.user_mod[name] = nil
		end
	end

	slot7 = "controller_mod_type"
	slot10 = managers.controller

	managers.user.set_setting(slot5, managers.user, managers.controller.get_default_wrapper_type(slot9))

	slot9 = true

	managers.user.set_setting(slot5, managers.user, "controller_mod", Global.controller_manager.user_mod)

	slot6 = self

	self.load_user_mod(slot5)

	return 
end
function ControllerManager:load_user_mod()
	if Global.controller_manager.user_mod then
		slot3 = managers.controller
		slot7 = "controller_mod_type"
		local connections = managers.controller.get_settings(slot2, managers.user.get_setting(slot5, managers.user)).get_connection_map(slot2)
		slot4 = Global.controller_manager.user_mod

		for connection_name, params in pairs(managers.controller.get_settings(slot2, managers.user.get_setting(slot5, managers.user))) do
			if params.axis and connections[params.axis] then
				slot9 = params

				for button, button_params in pairs(slot8) do
					slot14 = button_params

					if type(slot13) == "table" and button_params.button and connections[params.axis]._btn_connections[button_params.button] then
						connections[params.axis]._btn_connections[button_params.button].name = button_params.connection
					end
				end
			elseif params.button and connections[params.button] then
				slot10 = params.controller_id

				connections[params.button].set_controller_id(slot8, connections[params.button])

				slot10 = {
					params.connection
				}

				connections[params.button].set_input_name_list(slot8, connections[params.button])
			end
		end

		slot4 = self

		self.rebind_connections(slot3)
	end

	return 
end
function ControllerManager:init_finalize()
	slot9 = "controller_mod_changed"
	slot6 = true

	managers.user.add_setting_changed_callback(slot2, managers.user, "controller_mod", callback(slot6, self, self))

	if Global.controller_manager.user_mod then
		slot3 = self

		self.load_user_mod(slot2)
	end

	slot3 = self

	self._check_dialog(slot2)

	return 
end
function ControllerManager:default_controller_connect_change(connected)
	slot5 = connected

	ControllerManager.super.default_controller_connect_change(slot3, self)

	if Global.controller_manager.default_wrapper_index and not connected then
		slot4 = self

		if not self._controller_changed_dialog_active(slot3) then
			slot4 = self

			self._show_controller_changed_dialog(slot3)
		end
	end

	return 
end
function ControllerManager:_check_dialog()
	if Global.controller_manager.connect_controller_dialog_visible then
		slot3 = self

		if not self._controller_changed_dialog_active(slot2) then
			slot3 = self

			self._show_controller_changed_dialog(slot2)
		end
	end

	return 
end
function ControllerManager:_controller_changed_dialog_active()
	slot4 = "connect_controller_dialog"

	return (managers.system_menu.is_active_by_id(slot2, managers.system_menu) and true) or false
end
function ControllerManager:_show_controller_changed_dialog()
	slot3 = self

	if self._controller_changed_dialog_active(slot2) then
		return 
	end

	slot4 = "ControllerManager:_show_controller_changed_dialog"

	Application.trace(slot2, Application)
	print(debug.traceback())

	Global.controller_manager.connect_controller_dialog_visible = true
	local data = {}
	slot6 = "connect_controller_dialog_callback"
	data.callback_func = callback(debug.traceback, self, self)
	slot5 = "dialog_connect_controller_title"
	data.title = managers.localization.text(debug.traceback, managers.localization)
	slot6 = {
		NR = Global.controller_manager.default_wrapper_index or 1
	}
	data.text = managers.localization.text(slot3, managers.localization, "dialog_connect_controller_text")
	slot5 = "XB1"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		data.no_buttons = true
	else
		slot7 = "dialog_ok"
		data.button_list = {
			{
				text = managers.localization.text(slot5, managers.localization)
			}
		}
	end

	data.id = "connect_controller_dialog"
	data.force = true
	slot5 = data

	managers.system_menu.show(slot3, managers.system_menu)

	return 
end
function ControllerManager:_change_mode(mode)
	slot5 = mode

	self.change_default_wrapper_mode(slot3, self)

	return 
end
function ControllerManager:set_menu_mode_enabled(enabled)
	slot5 = "WIN32"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		self._menu_mode_enabled = self._menu_mode_enabled or 0
		self._menu_mode_enabled = self._menu_mode_enabled + ((enabled and 1) or -1)
		slot4 = self

		if self.get_menu_mode_enabled(slot3) then
			slot5 = "menu"

			self._change_mode(slot3, self)
		else
			slot4 = self

			self.set_ingame_mode(slot3)
		end

		if self._menu_mode_enabled < 0 then
		end
	end

	return 
end
function ControllerManager:get_menu_mode_enabled()
	return self._menu_mode_enabled and 0 < self._menu_mode_enabled
end
function ControllerManager:set_ingame_mode(mode)
	slot5 = "WIN32"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		if mode then
			self._ingame_mode = mode
		end

		slot4 = self

		if not self.get_menu_mode_enabled(slot3) then
			slot5 = self._ingame_mode

			self._change_mode(slot3, self)
		end
	end

	return 
end
function ControllerManager:_close_controller_changed_dialog(hard)
	return 
end
function ControllerManager:connect_controller_dialog_callback()
	Global.controller_manager.connect_controller_dialog_visible = nil

	return 
end
function ControllerManager:get_mouse_controller()

	-- Decompilation error in this vicinity:
	if not Global.controller_manager.default_wrapper_index then
		slot3 = self
		local index = self.get_preferred_default_wrapper_index(slot2)
	end

	local wrapper_class = self._wrapper_class_map and self._wrapper_class_map[index]

	if wrapper_class and wrapper_class.TYPE == "steam" then
		local controller_index = self._wrapper_to_controller_list[index][1]
		slot7 = controller_index
		local controller = Input.controller(slot5, Input)

		if not Global.controller_manager.default_wrapper_index then
			slot7 = self
			local index = self.get_preferred_default_wrapper_index(slot6)
		end

		local wrapper_class = self._wrapper_class_map[index]

		return controller
	end

	slot5 = Input

	return Input.mouse(slot4)
end
slot3 = ControllerManager

CoreClass.override_class(function (self)

	-- Decompilation error in this vicinity:
	if not Global.controller_manager.default_wrapper_index then
		slot3 = self
		local index = self.get_preferred_default_wrapper_index(slot2)
	end

	local wrapper_class = self._wrapper_class_map and self._wrapper_class_map[index]

	if wrapper_class and wrapper_class.TYPE == "steam" then
		local controller_index = self._wrapper_to_controller_list[index][1]
		slot7 = controller_index
		local controller = Input.controller(slot5, Input)

		if not Global.controller_manager.default_wrapper_index then
			slot7 = self
			local index = self.get_preferred_default_wrapper_index(slot6)
		end

		local wrapper_class = self._wrapper_class_map[index]

		return controller
	end

	slot5 = Input

	return Input.mouse(slot4)
end, CoreControllerManager.ControllerManager)

return 
