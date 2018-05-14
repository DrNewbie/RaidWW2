slot3 = "CoreControllerWrapperDebug"

core.module(slot1, core)

slot3 = "CoreControllerWrapper"

core.import(slot1, core)

if not ControllerWrapperDebug then
	slot2 = CoreControllerWrapper.ControllerWrapper
	slot0 = class(slot1)
end

ControllerWrapperDebug = slot0
ControllerWrapperDebug.TYPE = "debug"
function ControllerWrapperDebug:init(controller_wrapper_list, manager, id, name, default_controller_wrapper, setup)
	self._controller_wrapper_list = controller_wrapper_list
	self._default_controller_wrapper = default_controller_wrapper
	slot7 = ControllerWrapperDebug.super.init
	slot9 = self
	slot10 = manager
	slot11 = id
	slot12 = name
	slot13 = {}

	if default_controller_wrapper then
		slot16 = default_controller_wrapper
		slot14 = default_controller_wrapper.get_default_controller_id(slot15)
	end

	slot17 = true

	slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, setup, true)

	slot9 = controller_wrapper_list

	for _, controller_wrapper in ipairs(slot8) do
		slot16 = controller_wrapper

		for controller_id, controller in pairs(controller_wrapper.get_controller_map(slot15)) do
			self._controller_map[controller_id] = controller
		end
	end

	return 
end
function ControllerWrapperDebug:destroy()
	slot3 = self

	ControllerWrapperDebug.super.destroy(slot2)

	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		controller_wrapper.destroy(slot7)
	end

	return 
end
function ControllerWrapperDebug:update(t, dt)
	slot7 = dt

	ControllerWrapperDebug.super.update(slot4, self, t)

	slot5 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot4) do
		slot12 = dt

		controller_wrapper.update(slot9, controller_wrapper, t)
	end

	return 
end
function ControllerWrapperDebug:paused_update(t, dt)
	slot7 = dt

	ControllerWrapperDebug.super.paused_update(slot4, self, t)

	slot5 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot4) do
		slot12 = dt

		controller_wrapper.paused_update(slot9, controller_wrapper, t)
	end

	return 
end
function ControllerWrapperDebug:connected(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		if controller_wrapper.connected(slot7, ...) then
			return true
		end
	end

	return false
end
function ControllerWrapperDebug:rebind_connections(setup, setup_map)
	slot5 = self

	ControllerWrapperDebug.super.rebind_connections(slot4)

	slot5 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot4) do
		slot10 = controller_wrapper
		slot8 = controller_wrapper.rebind_connections

		if setup_map then
			slot13 = controller_wrapper
			slot11 = setup_map[controller_wrapper.get_type(slot12)]
		end

		slot12 = setup_map

		slot8(slot9, slot10, slot11)
	end

	return 
end
function ControllerWrapperDebug:setup(...)
	return 
end
function ControllerWrapperDebug:get_any_input(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		if controller_wrapper.get_any_input(slot7, ...) then
			return true
		end
	end

	return false
end
function ControllerWrapperDebug:get_any_input_pressed(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		if controller_wrapper.get_any_input_pressed(slot7, ...) then
			return true
		end
	end

	return false
end
function ControllerWrapperDebug:get_input_pressed(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		if controller_wrapper.connection_exist(slot7, ...) then
			slot8 = controller_wrapper

			if controller_wrapper.get_input_pressed(slot7, ...) then
				return true
			end
		end
	end

	return false
end
function ControllerWrapperDebug:get_input_bool(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		if controller_wrapper.connection_exist(slot7, ...) then
			slot8 = controller_wrapper

			if controller_wrapper.get_input_bool(slot7, ...) then
				return true
			end
		end
	end

	return false
end
function ControllerWrapperDebug:get_input_float(...)
	local input_float = 0
	slot4 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot3) do
		slot9 = controller_wrapper

		if controller_wrapper.connection_exist(slot8, ...) then
			slot9 = input_float
			slot12 = controller_wrapper
			input_float = math.max(slot8, controller_wrapper.get_input_float(slot11, ...))
		end
	end

	return input_float
end
function ControllerWrapperDebug:get_input_axis(...)
	slot5 = 0
	local input_axis = Vector3(slot2, 0, 0)
	slot4 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(0) do
		slot9 = controller_wrapper

		if controller_wrapper.connection_exist(slot8, ...) then
			local next_input_axis = controller_wrapper.get_input_axis(slot8, ...)
			slot11 = input_axis

			if input_axis.length(next_input_axis) < next_input_axis.length(controller_wrapper) then
				input_axis = next_input_axis
			end
		end
	end

	return input_axis
end
function ControllerWrapperDebug:get_connection_map(...)
	local map = {}
	slot4 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot3) do
		local sub_map = controller_wrapper.get_connection_map(slot8, ...)
		slot10 = sub_map

		for k, v in pairs(controller_wrapper) do
			map[k] = v
		end
	end

	return map
end
function ControllerWrapperDebug:connection_exist(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		if controller_wrapper.connection_exist(slot7, ...) then
			return true
		end
	end

	return false
end
function ControllerWrapperDebug:set_enabled(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		controller_wrapper.set_enabled(slot7, ...)
	end

	return 
end
function ControllerWrapperDebug:enable(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		controller_wrapper.enable(slot7, ...)
	end

	self._enabled = true

	return 
end
function ControllerWrapperDebug:disable(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		controller_wrapper.disable(slot7, ...)
	end

	self._enabled = false

	return 
end
function ControllerWrapperDebug:add_trigger(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		if controller_wrapper.connection_exist(slot7, ...) then
			slot8 = controller_wrapper

			controller_wrapper.add_trigger(slot7, ...)
		end
	end

	return 
end
function ControllerWrapperDebug:add_release_trigger(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		if controller_wrapper.connection_exist(slot7, ...) then
			slot8 = controller_wrapper

			controller_wrapper.add_release_trigger(slot7, ...)
		end
	end

	return 
end
function ControllerWrapperDebug:remove_trigger(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		if controller_wrapper.connection_exist(slot7, ...) then
			slot8 = controller_wrapper

			controller_wrapper.remove_trigger(slot7, ...)
		end
	end

	return 
end
function ControllerWrapperDebug:clear_triggers(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		controller_wrapper.clear_triggers(slot7, ...)
	end

	return 
end
function ControllerWrapperDebug:reset_cache(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		controller_wrapper.reset_cache(slot7, ...)
	end

	return 
end
function ControllerWrapperDebug:restore_triggers(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		controller_wrapper.restore_triggers(slot7, ...)
	end

	return 
end
function ControllerWrapperDebug:clear_connections(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		controller_wrapper.clear_connections(slot7, ...)
	end

	return 
end
function ControllerWrapperDebug:get_setup(...)
	if self._default_controller_wrapper then
		slot3 = self._default_controller_wrapper
		slot1 = self._default_controller_wrapper.get_setup(slot2, ...)
	end

	return slot1
end
function ControllerWrapperDebug:get_connection_settings(...)
	if self._default_controller_wrapper then
		slot3 = self._default_controller_wrapper
		slot1 = self._default_controller_wrapper.get_connection_settings(slot2, ...)
	end

	return slot1
end
function ControllerWrapperDebug:get_connection_enabled(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		if controller_wrapper.get_connection_enabled(slot7, ...) then
			return true
		end
	end

	return false
end
function ControllerWrapperDebug:set_connection_enabled(...)
	slot3 = self._controller_wrapper_list

	for _, controller_wrapper in ipairs(slot2) do
		slot8 = controller_wrapper

		controller_wrapper.set_connection_enabled(slot7, ...)
	end

	return 
end

return 
