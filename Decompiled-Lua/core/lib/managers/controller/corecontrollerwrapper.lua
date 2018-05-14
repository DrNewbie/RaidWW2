-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreControllerWrapper"

core.module(slot1, core)

slot3 = "CoreControllerWrapperSettings"

core.import(slot1, core)

slot3 = "CoreAccessObjectBase"

core.import(slot1, core)

if not ControllerWrapper then
	slot2 = CoreAccessObjectBase.AccessObjectBase
	slot0 = class(slot1)
end

ControllerWrapper = slot0
ControllerWrapper.TYPE = "generic"
ControllerWrapper.init = function (self, manager, id, name, controller_map, default_controller_id, setup, debug, skip_virtual_controller, custom_virtual_connect_func_map)
	slot14 = name

	ControllerWrapper.super.init(slot11, self, manager)

	self._id = id
	self._name = name
	self._controller_map = controller_map
	self._default_controller_id = default_controller_id
	self._setup = setup
	self._debug = debug

	if not skip_virtual_controller then
		slot16 = self._id
		slot13 = "ctrl_" .. tostring(slot15)
		self._virtual_controller = Input.create_virtual_controller(slot11, Input)
	end

	self._custom_virtual_connect_func_map = custom_virtual_connect_func_map or {}
	slot12 = controller_map

	for controller_id in pairs(slot11) do
		self._custom_virtual_connect_func_map[controller_id] = self._custom_virtual_connect_func_map[controller_id] or {}
	end

	self._connection_map = {}
	self._trigger_map = {}
	self._release_trigger_map = {}
	self._current_lerp_axis_map = {}
	self._claimed = false
	self._enabled = false
	self._delay_map = {}
	self._delay_bool_map = {}
	self._multi_input_map = {}
	slot13 = self._setup

	self.setup(slot11, self)

	slot12 = self
	self._was_connected = self.connected(slot11)
	slot12 = TimerManager
	slot12 = TimerManager.wall_running(slot11)
	self._reset_cache_time = TimerManager.wall_running(slot11).time(slot11) - 1
	self._delay_trigger_queue = {}
	self._input_pressed_cache = {}
	self._input_bool_cache = {}
	self._input_float_cache = {}
	self._input_axis_cache = {}
	slot13 = false

	self.reset_cache(slot11, self)

	self._destroy_callback_list = {}
	self._last_destroy_callback_id = 0
	self._connect_changed_callback_list = {}
	self._last_connect_changed_callback_id = 0
	self._rebind_callback_list = {}
	self._last_rebind_callback_id = 0

	return 
end
ControllerWrapper.destroy = function (self)
	slot3 = self._destroy_callback_list

	for id, func in pairs(slot2) do
		slot9 = id

		func(slot7, self)
	end

	slot3 = self._virtual_controller

	if alive(slot2) then
		slot4 = self._virtual_controller

		Input.destroy_virtual_controller(slot2, Input)

		self._virtual_controller = nil
	end

	return 
end
ControllerWrapper.update = function (self, t, dt)
	slot6 = true

	self.reset_cache(slot4, self)

	slot5 = self

	self.update_delay_trigger_queue(slot4)

	slot5 = self

	self.check_connect_changed_status(slot4)

	slot5 = self._virtual_controller

	if alive(slot4) then
		slot5 = self._virtual_controller

		self._virtual_controller.clear_axis_triggers(slot4)
	end

	return 
end
ControllerWrapper.paused_update = function (self, t, dt)
	slot6 = true

	self.reset_cache(slot4, self)

	slot5 = self

	self.update_delay_trigger_queue(slot4)

	slot5 = self

	self.check_connect_changed_status(slot4)

	slot5 = self._virtual_controller

	if alive(slot4) then
		slot5 = self._virtual_controller

		self._virtual_controller.clear_axis_triggers(slot4)
	end

	return 
end
ControllerWrapper.reset_cache = function (self, check_time)
	slot4 = TimerManager
	slot4 = TimerManager.wall_running(slot3)
	local reset_cache_time = TimerManager.wall_running(slot3).time(slot3)

	if not check_time or self._reset_cache_time < reset_cache_time then
		self._input_any_cache = nil
		self._input_any_pressed_cache = nil
		self._input_any_released_cache = nil
		slot5 = self._input_pressed_cache

		if next(slot4) then
			self._input_pressed_cache = {}
		end

		slot5 = self._input_bool_cache

		if next(slot4) then
			self._input_bool_cache = {}
		end

		slot5 = self._input_float_cache

		if next(slot4) then
			self._input_float_cache = {}
		end

		slot5 = self._input_axis_cache

		if next(slot4) then
			self._input_axis_cache = {}
		end

		slot5 = self

		self.update_multi_input(slot4)

		slot5 = self

		self.update_delay_input(slot4)

		self._reset_cache_time = reset_cache_time
	end

	return 
end
ControllerWrapper.update_delay_trigger_queue = function (self)
	if self._enabled and self._virtual_controller then
		slot3 = self._delay_trigger_queue

		for connection_name, data in pairs(slot2) do
			slot8 = self._virtual_controller
			slot11 = connection_name

			if not self._virtual_controller.down(slot7, Idstring(slot10)) then
				self._delay_trigger_queue[connection_name] = nil
			else
				slot9 = connection_name

				if self.get_input_bool(slot7, self) then
					self._delay_trigger_queue[connection_name] = nil
					slot10 = data.func_params

					data.func(unpack(slot9))
				end
			end
		end
	end

	return 
end
ControllerWrapper.check_connect_changed_status = function (self)
	slot3 = self
	local connected = self.connected(slot2)

	if connected ~= self._was_connected then
		slot4 = self._connect_changed_callback_list

		for callback_id, func in pairs(slot3) do
			slot11 = callback_id

			func(slot8, self, connected)
		end

		self._was_connected = connected
	end

	return 
end
ControllerWrapper.update_multi_input = function (self)
	if self._enabled and self._virtual_controller then
		slot3 = self._multi_input_map

		for connection_name, single_connection_name_list in pairs(slot2) do
			slot9 = connection_name

			if self.get_connection_enabled(slot7, self) then
				local bool = nil
				slot9 = single_connection_name_list

				for _, single_connection_name in ipairs(slot8) do
					slot14 = self._virtual_controller
					slot17 = single_connection_name
					bool = self._virtual_controller.down(slot13, Idstring(slot16))

					if not bool then
						break
					end
				end

				if bool then
					self._input_bool_cache[connection_name] = bool
				else
					self._input_bool_cache[connection_name] = false
					self._input_pressed_cache[connection_name] = false
					self._input_float_cache[connection_name] = 0
					self._input_axis_cache[connection_name] = Vector3()
				end
			end
		end
	end

	return 
end
ControllerWrapper.update_delay_input = function (self)
	if self._enabled and self._virtual_controller then
		slot3 = TimerManager
		local wall_time = TimerManager.wall(slot2).time(slot2)
		slot4 = self._delay_map

		for connection_name, delay_data in pairs(TimerManager.wall(slot2)) do
			slot10 = connection_name

			if self.get_connection_enabled(slot8, self) then
				local delay_time_map = delay_data.delay_time_map
				local connection = delay_data.connection
				slot11 = connection
				local delay = connection.get_delay(slot10)

				if 0 < delay then
					slot13 = connection_name

					if not self.get_input_bool(slot11, self) then
						slot12 = delay_time_map

						for delay_connection_name, delay_time in pairs(slot11) do
							slot18 = delay_connection_name
							local down = self.get_input_bool(slot16, self)
							local allow = nil

							if down then
								if not delay_time then
									delay_time_map[delay_connection_name] = wall_time + delay
								elseif delay_time <= wall_time then
									allow = true
								end

								if not allow then
									self._input_bool_cache[delay_connection_name] = false
									self._input_pressed_cache[connection_name] = false
									self._input_float_cache[delay_connection_name] = 0
									self._input_axis_cache[delay_connection_name] = Vector3()
								end
							elseif delay_time then
								delay_time_map[delay_connection_name] = false
							end
						end
					else
						slot12 = delay_time_map

						for delay_connection_name, delay_time in pairs(slot11) do
							delay_time_map[delay_connection_name] = wall_time - delay
						end
					end
				end
			end
		end
	end

	return 
end
ControllerWrapper.add_destroy_callback = function (self, func)
	self._last_destroy_callback_id = self._last_destroy_callback_id + 1
	self._destroy_callback_list[self._last_destroy_callback_id] = func

	return self._last_destroy_callback_id
end
ControllerWrapper.remove_destroy_callback = function (self, id)
	self._destroy_callback_list[id] = nil

	return 
end
ControllerWrapper.add_connect_changed_callback = function (self, func)
	self._last_connect_changed_callback_id = self._last_connect_changed_callback_id + 1
	self._connect_changed_callback_list[self._last_connect_changed_callback_id] = func

	return self._last_connect_changed_callback_id
end
ControllerWrapper.remove_connect_changed_callback = function (self, id)
	self._connect_changed_callback_list[id] = nil

	return 
end
ControllerWrapper.add_rebind_callback = function (self, func)
	self._last_rebind_callback_id = self._last_rebind_callback_id + 1
	self._rebind_callback_list[self._last_rebind_callback_id] = func

	return self._last_rebind_callback_id
end
ControllerWrapper.remove_rebind_callback = function (self, id)
	self._rebind_callback_list[id] = nil

	return 
end
ControllerWrapper.rebind_connections = function (self, setup, setup_map)
	slot6 = false

	self.clear_connections(slot4, self)

	slot6 = true

	self.clear_triggers(slot4, self)

	slot6 = setup or self._setup

	self.setup(slot4, self)

	if self._enabled then
		slot5 = self

		self.restore_triggers(slot4)
	end

	slot5 = self._rebind_callback_list

	for id, func in pairs(slot4) do
		slot11 = id

		func(slot9, self)
	end

	return 
end
ControllerWrapper.setup = function (self, setup)
	if setup then
		self._setup = setup
		slot4 = setup
		local connection_map = setup.get_connection_map(slot3)
		slot7 = setup

		for _, connection_name in ipairs(setup.get_connection_list(slot6)) do
			local connection = connection_map[connection_name]
			slot11 = connection
			local controller_id = connection.get_controller_id(slot10) or self._default_controller_id
			local controller = self._controller_map[controller_id]
			slot17 = controller

			self.setup_connection(slot12, self, connection_name, connection, controller_id)
		end
	end

	return 
end
ControllerWrapper.setup_connection = function (self, connection_name, connection, controller_id, controller)
	return 
end
ControllerWrapper.connect = function (self, controller_id, input_name, connection_name, connection, allow_multiple, is_multi)

	-- Decompilation error in this vicinity:
	local controller = self._controller_map[controller_id or self._default_controller_id]

	if controller then
		if self._virtual_controller then
			if not allow_multiple and self._connection_map[connection_name] then
				slot13 = self
				slot15 = connection_name
				slot11 = self.to_string(slot12) .. " Controller already has a \"" .. tostring(slot14) .. "\" connection. Overwrites existing one."

				Application.error(slot9, Application)
			end

			slot15 = connection

			self.virtual_connect(slot9, self, controller_id, controller, input_name, connection_name)

			self._connection_map[connection_name] = true

			if is_multi then
				local single_connection_name_list = self._multi_input_map[connection_name] or {}
				slot11 = connection_name
				slot13 = input_name
				slot11 = tostring(slot12)
				local single_connection_name = tostring(slot10) .. "_for_single_input_" .. slot11
				slot17 = connection

				self.virtual_connect(slot11, self, controller_id, controller, input_name, single_connection_name)

				slot13 = single_connection_name

				table.insert(slot11, single_connection_name_list)

				self._multi_input_map[connection_name] = single_connection_name_list
			end
		else
			slot11 = "Tried to connect to a destroyed virtual controller."

			Application.stack_dump_error(slot9, Application)
		end
	else
		slot13 = controller_id
		slot10 = "Invalid controller wrapper. Tried to connect to non-existing controller id \"" .. tostring(slot12) .. "\"."

		error(slot9)
	end

	return 
end
ControllerWrapper.virtual_connect = function (self, controller_id, controller, input_name, connection_name, connection)
	local func = self._custom_virtual_connect_func_map[controller_id][input_name]

	if func then
		slot13 = connection

		func(slot8, controller_id, controller, input_name, connection_name)
	else
		slot14 = connection

		self.virtual_connect2(slot8, self, controller_id, controller, input_name, connection_name)
	end

	return 
end
ControllerWrapper.virtual_connect2 = function (self, controller_id, controller, input_name, connection_name, connection)
	slot8 = connection
	local min_src, max_src, min_dest, max_dest = connection.get_range(slot7)
	local connect_src_type = connection.get_connect_src_type(slot11)
	slot13 = connection
	local connect_dest_type = connection.get_connect_dest_type(connection)

	if connection._btn_connections and input_name == "buttons" then
		local btn_data = {
			up = {
				1,
				0,
				1
			},
			down = {
				1,
				0,
				-1
			},
			left = {
				0,
				0,
				-1
			},
			right = {
				0,
				0,
				1
			},
			accelerate = {
				1,
				0,
				1
			},
			brake = {
				1,
				0,
				-1
			},
			turn_left = {
				0,
				0,
				-1
			},
			turn_right = {
				0,
				0,
				1
			}
		}
		slot15 = self._virtual_controller
		slot18 = connection_name

		if not self._virtual_controller.has_axis(slot14, Idstring(slot17)) then
			slot15 = self._virtual_controller
			slot18 = connection_name

			self._virtual_controller.add_axis(slot14, Idstring(slot17))
		end

		slot15 = connection._btn_connections

		for btn, input in pairs(slot14) do

			-- Decompilation error in this vicinity:
			slot20 = controller
			slot23 = input.name
		end
	else
		slot14 = input_name

		if type(slot13) ~= "number" then
			slot14 = input_name
			input_name = Idstring(slot13)
		end

		slot15 = input_name
	end

	return 
end
ControllerWrapper.connected = function (self, controller_id)
	if controller_id then
		slot4 = self._controller_map[controller_id]

		return self._controller_map[controller_id].connected(slot3)
	else
		slot4 = self._controller_map

		for _, controller in pairs(slot3) do
			slot9 = controller

			if not controller.connected(slot8) then
				return false
			end
		end

		return true
	end

	return 
end
ControllerWrapper.get_setup = function (self)
	return self._setup
end
ControllerWrapper.get_connection_settings = function (self, connection_name)
	slot5 = connection_name

	return self._setup.get_connection(slot3, self._setup)
end
ControllerWrapper.get_default_controller_id = function (self)
	return self._default_controller_id
end
ControllerWrapper.get_type = function (self)
	return self.TYPE
end
ControllerWrapper.get_id = function (self)
	return self._id
end
ControllerWrapper.get_name = function (self)
	return self._name
end
ControllerWrapper.get_debug = function (self)
	return self._debug
end
ControllerWrapper.get_connection_map = function (self)
	return self._connection_map
end
ControllerWrapper.get_controller_map = function (self)
	return self._controller_map
end
ControllerWrapper.get_controller = function (self, controller_id)
	return self._controller_map[controller_id or self._default_controller_id]
end
ControllerWrapper.connection_exist = function (self, connection_name)
	return self._connection_map[connection_name] ~= nil
end
ControllerWrapper.set_enabled = function (self, bool)
	if bool then
		slot4 = self

		self.enable(slot3)
	else
		slot4 = self

		self.disable(slot3)
	end

	return 
end
ControllerWrapper.enable = function (self)
	slot4 = true

	self.set_active(slot2, self)

	return 
end
ControllerWrapper.disable = function (self)
	slot4 = false

	self.set_active(slot2, self)

	return 
end
ControllerWrapper._really_activate = function (self)
	slot3 = self

	ControllerWrapper.super._really_activate(slot2)

	if not self._enabled then
		slot7 = self._name
		slot4 = "[ControllerManager] Enabled controller \"" .. tostring(slot6) .. "\"."

		cat_print(slot2, "controller_manager")

		if self._virtual_controller then
			slot4 = true

			self._virtual_controller.set_enabled(slot2, self._virtual_controller)
		end

		self._enabled = true
		slot4 = true

		self.clear_triggers(slot2, self)

		slot3 = self

		self.restore_triggers(slot2)

		slot4 = false

		self.reset_cache(slot2, self)

		slot3 = self
		self._was_connected = self.connected(slot2)
	end

	return 
end
ControllerWrapper._really_deactivate = function (self)
	slot3 = self

	ControllerWrapper.super._really_deactivate(slot2)

	if self._enabled then
		slot7 = self._name
		slot4 = "[ControllerManager] Disabled controller \"" .. tostring(slot6) .. "\"."

		cat_print(slot2, "controller_manager")

		self._enabled = false
		slot4 = true

		self.clear_triggers(slot2, self)

		slot4 = false

		self.reset_cache(slot2, self)

		if self._virtual_controller then
			slot4 = false

			self._virtual_controller.set_enabled(slot2, self._virtual_controller)
		end
	end

	return 
end
ControllerWrapper.enabled = function (self)
	return self._enabled
end
ControllerWrapper.is_claimed = function (self)
	return self._claimed
end
ControllerWrapper.set_claimed = function (self, bool)
	self._claimed = bool

	return 
end
ControllerWrapper.add_trigger = function (self, connection_name, func)
	local trigger = {}
	self._trigger_map[connection_name] = self._trigger_map[connection_name] or {}

	if self._trigger_map[connection_name][func] then
		slot9 = self
		slot11 = func
		slot13 = connection_name
		slot7 = self.to_string(slot8) .. " Unable to register already existing trigger for function \"" .. tostring(slot10) .. "\" on connection \"" .. tostring(slot12) .. "\"."

		Application.error(slot5, Application)

		return 
	end

	trigger.original_func = func
	slot8 = func
	trigger.func = self.get_trigger_func(slot5, self, connection_name)

	if self._enabled and self._virtual_controller then
		slot7 = connection_name

		if self.get_connection_enabled(slot5, self) then
			slot9 = connection_name
			slot8 = trigger.func
			trigger.id = self._virtual_controller.add_trigger(slot5, self._virtual_controller, Idstring(slot8))
		end
	end

	self._trigger_map[connection_name][func] = trigger

	return 
end
ControllerWrapper.add_release_trigger = function (self, connection_name, func)
	local trigger = {}
	self._release_trigger_map[connection_name] = self._release_trigger_map[connection_name] or {}
	trigger.original_func = func
	slot8 = func
	trigger.func = self.get_release_trigger_func(self._release_trigger_map[connection_name] or , self, connection_name)

	if self._virtual_controller then
		slot7 = connection_name

		if self.get_connection_enabled(slot5, self) then
			slot9 = connection_name
			slot8 = trigger.func
			trigger.id = self._virtual_controller.add_release_trigger(slot5, self._virtual_controller, Idstring(slot8))
		end
	end

	self._release_trigger_map[connection_name][func] = trigger

	return 
end
ControllerWrapper.get_trigger_func = function (self, connection_name, func)
	local wrapper = self

	if self._delay_bool_map[connection_name] or self._multi_input_map[connection_name] then
		return function (...)
			slot3 = true

			wrapper.reset_cache(slot1, wrapper)

			slot3 = connection_name

			if wrapper.get_input_bool(slot1, wrapper) then
				func(...)
			else
				slot4 = func

				wrapper.queue_delay_trigger(slot1, wrapper, connection_name, ...)
			end

			return 
		end
	else
		return function (...)
			slot3 = true

			wrapper.reset_cache(slot1, wrapper)
			func(...)

			return 
		end
	end

	return 
end
ControllerWrapper.get_release_trigger_func = function (self, connection_name, func)
	local wrapper = self

	if self._delay_bool_map[connection_name] or self._multi_input_map[connection_name] then
		return function (...)
			slot3 = true

			wrapper.reset_cache(slot1, wrapper)

			slot3 = connection_name

			if wrapper.get_input_bool(slot1, wrapper) then
				func(...)
			end

			return 
		end
	else
		return function (...)
			slot3 = true

			wrapper.reset_cache(slot1, wrapper)
			func(...)

			return 
		end
	end

	return 
end
ControllerWrapper.queue_delay_trigger = function (self, connection_name, func, ...)
	self._delay_trigger_queue[connection_name] = {
		func = func,
		func_params = {
			...
		}
	}

	return 
end
ControllerWrapper.has_trigger = function (self, connection_name, func)
	local trigger_sub_map = self._trigger_map[connection_name]

	return trigger_sub_map and trigger_sub_map[func]
end
ControllerWrapper.has_release_trigger = function (self, connection_name, func)
	local release_trigger_sub_map = self._release_trigger_map[connection_name]

	return release_trigger_sub_map and release_trigger_sub_map[func]
end
ControllerWrapper.remove_trigger = function (self, connection_name, func)
	local trigger_sub_map = self._trigger_map[connection_name]

	if trigger_sub_map then
		if func then
			local trigger = trigger_sub_map[func]

			if trigger then
				local queued_trigger = self._delay_trigger_queue[connection_name]

				if queued_trigger and trigger.original_func == queued_trigger.func then
					self._delay_trigger_queue[connection_name] = nil
				end

				if trigger.id then
					slot9 = trigger.id

					self._virtual_controller.remove_trigger(slot7, self._virtual_controller)

					trigger.id = nil
				end
			else
				slot10 = self
				slot12 = func
				slot14 = connection_name
				slot8 = self.to_string(slot9) .. " Unable to remove non-existing trigger for function \"" .. tostring(slot11) .. "\" on connection \"" .. tostring(slot13) .. "\"."

				Application.error(slot6, Application)
			end

			trigger_sub_map[func] = nil
			slot7 = trigger_sub_map

			if not next(slot6) then
				trigger_sub_map = nil
			end
		else
			self._delay_trigger_queue[connection_name] = nil
			slot6 = trigger_sub_map

			for _, trigger in pairs(nil) do
				slot12 = trigger.id

				self._virtual_controller.remove_trigger(slot10, self._virtual_controller)

				trigger.id = nil
			end

			trigger_sub_map = nil
		end

		self._trigger_map[connection_name] = trigger_sub_map
	else
		slot9 = self
		slot11 = connection_name
		slot7 = self.to_string(slot8) .. " Unable to remove trigger on non-existing connection \"" .. tostring(slot10) .. "\"."

		Application.error(slot5, Application)
	end

	return 
end
ControllerWrapper.remove_release_trigger = function (self, connection_name, func)
	local trigger_sub_map = self._release_trigger_map[connection_name]

	if trigger_sub_map then
		if func then
			trigger = trigger_sub_map[func]

			if trigger then
				if trigger.id then
					slot7 = trigger.id

					self._virtual_controller.remove_trigger(slot5, self._virtual_controller)

					trigger.id = nil
				end
			else
				slot9 = self
				slot11 = func
				slot13 = connection_name
				slot7 = self.to_string(slot8) .. " Unable to remove non-existing release trigger for function \"" .. tostring(slot10) .. "\" on connection \"" .. tostring(slot12) .. "\"."

				Application.error(slot5, Application)
			end

			trigger_sub_map[func] = nil
			slot6 = trigger_sub_map

			if not next(slot5) then
				trigger_sub_map = nil
			end
		else
			slot6 = trigger_sub_map

			for _, trigger in pairs(slot5) do
				slot12 = trigger.id

				self._virtual_controller.remove_trigger(slot10, self._virtual_controller)

				trigger.id = nil
			end

			trigger_sub_map = nil
		end

		self._release_trigger_map[connection_name] = trigger_sub_map
	else
		slot9 = self
		slot11 = connection_name
		slot7 = self.to_string(slot8) .. " Unable to remove release trigger on non-existing connection \"" .. tostring(slot10) .. "\"."

		Application.error(slot5, Application)
	end

	return 
end
ControllerWrapper.clear_triggers = function (self, temporary)
	if self._virtual_controller then
		slot4 = self._virtual_controller

		self._virtual_controller.clear_triggers(slot3)
	end

	self._delay_trigger_queue = {}

	if temporary then
		slot4 = self._trigger_map

		for _, trigger_sub_map in pairs(slot3) do
			slot9 = trigger_sub_map

			for _, trigger in pairs(slot8) do
				trigger.id = nil
			end
		end

		slot4 = self._release_trigger_map

		for _, release_trigger_sub_map in pairs(slot3) do
			slot9 = release_trigger_sub_map

			for _, release_trigger in pairs(slot8) do
				release_trigger.id = nil
			end
		end
	else
		self._trigger_map = {}
		self._release_trigger_map = {}
	end

	return 
end
ControllerWrapper.restore_triggers = function (self)
	if self._virtual_controller then
		slot3 = self._trigger_map

		for connection_name, trigger_sub_map in pairs(slot2) do
			slot8 = trigger_sub_map

			for _, trigger in pairs(slot7) do
				slot14 = connection_name

				if self.get_connection_enabled(slot12, self) then
					slot16 = connection_name
					slot15 = trigger.func
					trigger.id = self._virtual_controller.add_trigger(slot12, self._virtual_controller, Idstring(slot15))
				end
			end
		end

		slot3 = self._release_trigger_map

		for connection_name, trigger_sub_map in pairs(slot2) do
			slot8 = trigger_sub_map

			for _, trigger in pairs(slot7) do
				slot14 = connection_name

				if self.get_connection_enabled(slot12, self) then
					slot16 = connection_name
					slot15 = trigger.func
					trigger.id = self._virtual_controller.add_release_trigger(slot12, self._virtual_controller, Idstring(slot15))
				end
			end
		end
	end

	return 
end
ControllerWrapper.clear_connections = function (self, temporary)
	if self._virtual_controller then
		slot4 = self._virtual_controller

		self._virtual_controller.clear_connections(slot3)
	end

	if not temporary then
		self._connection_map = {}
		self._delay_map = {}
		self._delay_bool_map = {}
		self._multi_input_map = {}
	end

	return 
end
ControllerWrapper.get_any_input = function (self)
	if self._input_any_cache == nil then
		if self._enabled and self._virtual_controller then
			slot3 = self._virtual_controller
			self._input_any_cache = 0 < #self._virtual_controller.down_list(slot2)
			self._input_any_cache = not not self._input_any_cache
		end
	end

	return self._input_any_cache
end
ControllerWrapper.get_any_input_pressed = function (self)
	if self._input_any_pressed_cache == nil then
		if self._enabled and self._virtual_controller then
			slot3 = self._virtual_controller
			self._input_any_pressed_cache = 0 < #self._virtual_controller.pressed_list(slot2)
			self._input_any_pressed_cache = not not self._input_any_pressed_cache
		end
	end

	return self._input_any_pressed_cache
end
ControllerWrapper.get_any_input_released = function (self)
	if self._input_any_released_cache == nil then
		if self._enabled and self._virtual_controller then
			slot3 = self._virtual_controller
			self._input_any_released_cache = 0 < #self._virtual_controller.released_list(slot2)
			self._input_any_released_cache = not not self._input_any_released_cache
		end
	end

	return self._input_any_released_cache
end
local id_strings = {}
ControllerWrapper.get_input_pressed = function (self, connection_name)
	local cache = self._input_pressed_cache[connection_name]

	if cache == nil then
		if self._connection_map[connection_name] then
			slot3 = id_strings

			if not id_strings[connection_name] then
				slot6 = connection_name
				slot4 = Idstring(slot5)
			end

			slot3[connection_name] = slot4
			local ids = id_strings[connection_name]
		else
			slot6 = connection_name

			self.print_invalid_connection_error(slot4, self)

			cache = false
		end

		self._input_pressed_cache[connection_name] = cache
	end

	return cache
end
ControllerWrapper.print_invalid_connection_error = function (self, connection_name)
	ControllerWrapper.INVALID_CONNECTION_ERROR = ControllerWrapper.INVALID_CONNECTION_ERROR or {}

	if not ControllerWrapper.INVALID_CONNECTION_ERROR[connection_name] then
		slot7 = self
		slot9 = connection_name
		slot5 = self.to_string(slot6) .. " No controller input binded to connection \"" .. tostring(slot8) .. "\"."

		Application.stack_dump_error(slot3, Application)

		ControllerWrapper.INVALID_CONNECTION_ERROR[connection_name] = true
	end

	return 
end
ControllerWrapper.get_input_bool = function (self, connection_name)
	local cache = self._input_bool_cache[connection_name]

	if cache == nil then
		if self._connection_map[connection_name] then
			slot3 = id_strings

			if not id_strings[connection_name] then
				slot6 = connection_name
				slot4 = Idstring(slot5)
			end

			slot3[connection_name] = slot4
			local ids = id_strings[connection_name]
		else
			slot6 = connection_name

			self.print_invalid_connection_error(slot4, self)

			cache = false
		end

		self._input_bool_cache[connection_name] = cache
	end

	return cache
end
ControllerWrapper.get_input_float = function (self, connection_name)
	local cache = self._input_float_cache[connection_name]

	if cache == nil then
		if self._connection_map[connection_name] then
			slot3 = id_strings

			if not id_strings[connection_name] then
				slot6 = connection_name
				slot4 = Idstring(slot5)
			end

			slot3[connection_name] = slot4
			local ids = id_strings[connection_name]
		else
			slot6 = connection_name

			self.print_invalid_connection_error(slot4, self)

			cache = 0
		end

		self._input_float_cache[connection_name] = cache
	end

	return cache
end
ControllerWrapper.get_input_axis_clbk = function (self, connection_name, func)
	slot5 = self

	if not self.enabled(slot4) then
		return 
	end

	local id = id_strings[connection_name]

	if not id then
		slot6 = connection_name
		id = Idstring(slot5)
		id_strings[connection_name] = id
	end

	local connection = self._setup.get_connection(slot5, self._setup)

	local function f(axis_id, controller_name, axis)
		local unscaled_axis = mvector3.copy(slot4)
		slot11 = axis
		slot6 = self.get_modified_axis(slot7, self, connection_name, connection)
		slot12 = unscaled_axis

		func(axis, self.get_unscaled_axis(self, self, connection_name, connection))

		return 
	end

	slot10 = f

	self._virtual_controller.add_axis_trigger(connection_name, self._virtual_controller, id)

	return 
end
ControllerWrapper.get_input_axis = function (self, connection_name)
	local cache = self._input_axis_cache[connection_name]

	if cache == nil then
		if self._connection_map[connection_name] then
			slot3 = id_strings

			if not id_strings[connection_name] then
				slot6 = connection_name
				slot4 = Idstring(slot5)
			end

			slot3[connection_name] = slot4
			local ids = id_strings[connection_name]

			if self._enabled and self._virtual_controller then
				slot7 = connection_name

				if self.get_connection_enabled(slot5, self) then
					slot7 = ids
					cache = self._virtual_controller.axis(slot5, self._virtual_controller)
				end
			end

			if cache then
				slot7 = connection_name
				local connection = self._setup.get_connection(slot5, self._setup)
				slot10 = cache
				cache = self.get_modified_axis(self._setup, self, connection_name, connection)
			else
				cache = Vector3()
			end
		else
			slot6 = connection_name

			self.print_invalid_connection_error(slot4, self)

			cache = Vector3()
		end

		self._input_axis_cache[connection_name] = cache
	end

	return cache
end
ControllerWrapper.get_unscaled_axis = function (self, connection_name, connection, axis)
	if connection.get_inversion then
		slot6 = connection
		local inversion = connection.get_inversion(slot5)
	end

	if inversion then
		slot12 = axis
		slot10 = mvector3.z(axis) * inversion.z

		mvector3.set_static(slot6, axis, mvector3.x(slot9) * inversion.x, mvector3.y(axis) * inversion.y)
	end

	return axis
end
ControllerWrapper.get_modified_axis = function (self, connection_name, connection, axis)
	if connection.get_multiplier then
		slot6 = connection
		local multiplier = connection.get_multiplier(slot5)
	end

	if multiplier then
		slot12 = axis
		slot10 = mvector3.z(axis) * multiplier.z

		mvector3.set_static(slot6, axis, mvector3.x(slot9) * multiplier.x, mvector3.y(axis) * multiplier.y)
	end

	if connection.get_inversion then
		slot7 = connection
		local inversion = connection.get_inversion(slot6)
	end

	if inversion then
		slot13 = axis
		slot11 = mvector3.z(axis) * inversion.z

		mvector3.set_static(slot7, axis, mvector3.x(slot10) * inversion.x, mvector3.y(axis) * inversion.y)
	end

	slot11 = axis.x
	local x = self.rescale_x_axis(slot7, self, connection_name, connection)
	slot12 = axis.y
	local y = self.rescale_y_axis(self, self, connection_name, connection)
	slot13 = axis.z
	local z = self.rescale_z_axis(self, self, connection_name, connection)
	slot14 = z

	mvector3.set_static(self, axis, x, y)

	slot14 = axis

	return self.lerp_axis(self, self, connection_name, connection)
end
ControllerWrapper.lerp_axis = function (self, connection_name, connection, axis)
	if connection.get_lerp then
		slot6 = connection
		local lerp = connection.get_lerp(slot5)
	end

	if lerp then
		local current_axis = self._current_lerp_axis_map[connection_name]
		slot11 = lerp

		mvector3.lerp(slot7, axis, current_axis, axis)

		self._current_lerp_axis_map[connection_name] = axis
	end

	return axis
end
ControllerWrapper.rescale_x_axis = function (self, connection_name, connection, x)
	slot9 = x

	return self.rescale_axis_component(slot5, self, connection_name, connection)
end
ControllerWrapper.rescale_y_axis = function (self, connection_name, connection, y)
	slot9 = y

	return self.rescale_axis_component(slot5, self, connection_name, connection)
end
ControllerWrapper.rescale_z_axis = function (self, connection_name, connection, z)
	slot9 = z

	return self.rescale_axis_component(slot5, self, connection_name, connection)
end
ControllerWrapper.rescale_axis_component = function (self, connection_name, connection, comp)
	return comp
end
ControllerWrapper.set_connection_enabled = function (self, connection_name, enabled)
	if self._connection_map[connection_name] then
		slot6 = connection_name
		local connection = self._setup.get_connection(slot4, self._setup)
	end

	if connection then
		slot6 = connection

		if not connection.get_enabled(slot5) ~= not enabled then
			slot7 = enabled

			connection.set_enabled(slot5, connection)

			local trigger_sub_map = self._trigger_map[connection_name]

			if trigger_sub_map then
				slot7 = trigger_sub_map

				for _, trigger in pairs(slot6) do
					if enabled then
						if not trigger.id then
							slot15 = connection_name
							slot14 = trigger.func
							trigger.id = self._virtual_controller.add_trigger(slot11, self._virtual_controller, Idstring(slot14))
						end
					elseif trigger.id then
						slot13 = trigger.id

						self._virtual_controller.remove_trigger(slot11, self._virtual_controller)

						trigger.id = nil
					end
				end
			end

			trigger_sub_map = self._release_trigger_map[connection_name]

			if trigger_sub_map then
				slot7 = trigger_sub_map

				for _, trigger in pairs(slot6) do
					if enabled then
						if not trigger.id then
							slot15 = connection_name
							slot14 = trigger.func
							trigger.id = self._virtual_controller.add_release_trigger(slot11, self._virtual_controller, Idstring(slot14))
						end
					elseif trigger.id then
						slot13 = trigger.id

						self._virtual_controller.remove_trigger(slot11, self._virtual_controller)

						trigger.id = nil
					end
				end
			end

			if not enabled then
				self._delay_trigger_queue[connection_name] = nil
			end

			local delay_data = self._delay_map[connection_name]

			if delay_data then
				slot8 = delay_data.delay_time_map

				for delay_connection_name in pairs(slot7) do
					local trigger_sub_map = self._trigger_map[delay_connection_name]

					if trigger_sub_map then
						slot13 = trigger_sub_map

						for _, trigger in pairs(slot12) do
							slot20 = trigger.original_func
							trigger.func = self.get_trigger_func(slot17, self, delay_connection_name)

							if trigger.id then
								slot19 = trigger.id

								self._virtual_controller.remove_trigger(slot17, self._virtual_controller)

								slot21 = delay_connection_name
								slot20 = trigger.func
								trigger.id = self._virtual_controller.add_trigger(slot17, self._virtual_controller, Idstring(slot20))
							end
						end
					end

					local release_trigger_sub_map = self._release_trigger_map[delay_connection_name]

					if release_trigger_sub_map then
						slot14 = release_trigger_sub_map

						for _, release_trigger in pairs(slot13) do
							slot21 = release_trigger.original_func
							release_trigger.func = self.get_trigger_func(slot18, self, delay_connection_name)

							if release_trigger.id then
								slot20 = release_trigger.id

								self._virtual_controller.remove_trigger(slot18, self._virtual_controller)

								slot22 = delay_connection_name
								slot21 = release_trigger.func
								release_trigger.id = self._virtual_controller.add_release_trigger(slot18, self._virtual_controller, Idstring(slot21))
							end
						end
					end
				end

				slot8 = self

				self.update_delay_trigger_queue(slot7)
			end
		end
	else
		slot9 = self
		slot11 = connection_name
		slot7 = self.to_string(slot8) .. " Controller can't enable connection \"" .. tostring(slot10) .. "\" because it doesn't exist."

		Application.error(slot5, Application)
	end

	return 
end
ControllerWrapper.get_connection_enabled = function (self, connection_name)
	if self._connection_map[connection_name] then
		slot5 = connection_name
		local connection = self._setup.get_connection(slot3, self._setup)
	end

	if connection then
		slot5 = connection
		local ret = connection.get_enabled(slot4)
	end

	return ret
end
ControllerWrapper.to_string = function (self)
	slot3 = self

	return self.__tostring(slot2)
end
ControllerWrapper.__tostring = function (self)
	slot6 = self._id
	slot9 = self
	slot10 = (self._debug and "Yes") or "No"

	return string.format(slot2, "[Controller][Wrapper][ID: %s, Type: %s, Name: %s, Enabled: %s, Debug: %s]", tostring(slot5), tostring(self.get_type(slot8)), tostring(tostring(self._name or "N/A")), tostring((self._enabled and "Yes") or "No"))
end
ControllerWrapper.change_mode = function (controller, mode)
	return nil
end

return 
