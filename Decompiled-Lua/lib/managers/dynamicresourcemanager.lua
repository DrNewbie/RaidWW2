-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
DynamicResourceManager = DynamicResourceManager or class()
DynamicResourceManager.DYN_RESOURCES_PACKAGE = "packages/dyn_resources"
DynamicResourceManager.listener_events = {
	file_streamer_workload = 1
}
slot2 = "unit"
local ids_unit = Idstring()
DynamicResourceManager.init = function (self)
	if not Global.dyn_resource_manager_data then
		Global.dyn_resource_manager_data = {
			streaming_settings = {
				chunk_size_kb = 4096,
				sleep_time = 3,
				chunk_size_mul = 1
			},
			dyn_resources = {}
		}
	end

	self._dyn_resources = Global.dyn_resource_manager_data.dyn_resources
	self._streaming_settings = Global.dyn_resource_manager_data.streaming_settings
	self._to_unload = nil
	slot3 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot2)

	return 
end
DynamicResourceManager.post_init = function (self)
	slot4 = "max_streaming_chunk"
	local chunk_size_kb = managers.user.get_setting(slot2, managers.user)

	if self._streaming_settings.chunk_size_kb ~= chunk_size_kb then
		slot6 = self._streaming_settings.sleep_time

		self._set_file_streamer_settings(slot3, self, chunk_size_kb)
	end

	slot10 = "clbk_streaming_chunk_size_changed"

	managers.user.add_setting_changed_callback(slot3, managers.user, "max_streaming_chunk", callback(true, self, self))

	slot4 = self

	self.preload_units(slot3)

	return 
end
DynamicResourceManager.update = function (self)
	if self._to_unload then
		slot3 = self._to_unload

		for key, unload_params in pairs(slot2) do
			slot9 = unload_params.package_name
			slot11 = unload_params.keep_using

			PackageManager.package(slot7, PackageManager).unload_resource(slot7, PackageManager.package(slot7, PackageManager), unload_params.resource_type, unload_params.resource_name)
		end

		self._to_unload = nil
	end

	slot4 = self.listener_events.file_streamer_workload

	if self._listener_holder.has_listeners_for_event(slot2, self._listener_holder) then
		slot3 = self

		self._check_file_streamer_status(slot2)
	end

	return 
end
DynamicResourceManager.is_ready_to_close = function (self)

	-- Decompilation error in this vicinity:
	if self._to_unload then
		if not self._still_unloading_msg then
			slot3 = "[DynamicResourceManager:is_ready_to_close] still unloading"

			print(slot2)

			self._still_unloading_msg = true
		end

		return false
	end

	slot3 = self._dyn_resources

	for key, entry in pairs(slot2) do
		if not entry.ready then
			if not self._loadign_temp_msg then
				self._loadign_temp_msg = true
				slot8 = "[DynamicResourceManager:is_ready_to_close] loading temp"

				print(slot7)
			end

			return false
		end
	end

	return true
end
DynamicResourceManager._get_resource_key = function (resource_type, resource_name, package_name)
	slot7 = resource_type

	return package_name .. resource_name.key(slot5) .. resource_type.key(resource_name)
end
DynamicResourceManager.load = function (self, resource_type, resource_name, package_name, complete_clbk)
	slot9 = package_name
	local key = self._get_resource_key(slot6, resource_type, resource_name)
	local entry = self._to_unload and self._to_unload[key]

	if entry then
		entry.keep_using = nil
		entry.callbacks = {}
		self._dyn_resources[key] = entry
		self._to_unload[key] = nil
		slot9 = self._to_unload

		if not next(nil) then
			self._to_unload = nil
		end
	end

	entry = entry or self._dyn_resources[key]

	if entry then
		entry.ref_c = entry.ref_c + 1

		if entry.ready then
			if complete_clbk then
				slot11 = resource_name

				complete_clbk(slot8, true, resource_type)
			end

			return 
		elseif complete_clbk then
			slot10 = complete_clbk

			table.insert(slot8, entry.callbacks)

			return 
		else
			entry.ready = true
		end
	else
		entry = {
			ref_c = 1,
			resource_type = resource_type,
			resource_name = resource_name,
			package_name = package_name,
			callbacks = {}
		}

		if complete_clbk then
			slot10 = complete_clbk

			table.insert(slot8, entry.callbacks)
		else
			entry.ready = true
		end

		self._dyn_resources[key] = entry
	end

	if complete_clbk then
		slot9 = Application
	else

		-- Decompilation error in this vicinity:
		if not complete_clbk then
			slot14 = complete_clbk

			Application.error(slot8, Application, "[DynamicResourceManager:load]", resource_type, resource_name, package_name)
		end

		slot10 = package_name
		slot9 = PackageManager.package(slot8, PackageManager)
		slot7 = PackageManager.package(slot8, PackageManager).load_temp_resource
		slot10 = resource_type
		slot11 = resource_name
		slot16 = "clbk_resource_loaded"
		slot13 = true

		slot7(slot8, slot9, slot10, slot11, callback(slot13, self, DynamicResourceManager) or nil)
	end

	return 
end
DynamicResourceManager.unload = function (self, resource_type, resource_name, package_name, keep_using)
	if keep_using then
		slot11 = keep_using

		debug_pause(slot6, "[DynamicResourceManager:unload] keep_using should be false!", resource_type, resource_name, package_name)
	end

	slot9 = package_name
	local key = self._get_resource_key(slot6, resource_type, resource_name)
	local entry = self._dyn_resources[key]
	entry.ref_c = entry.ref_c - 1

	if entry.ref_c ~= 0 then
		return 
	end

	self._to_unload = self._to_unload or {}
	self._to_unload[key] = entry
	entry.keep_using = keep_using
	entry.callbacks = nil
	self._dyn_resources[key] = nil

	return 
end
DynamicResourceManager.has_resource = function (self, resource_type, resource_name, package_name)
	slot8 = package_name
	local key = self._get_resource_key(slot5, resource_type, resource_name)

	return (self._dyn_resources[key] and true) or false
end
DynamicResourceManager.is_resource_ready = function (self, resource_type, resource_name, package_name)
	slot8 = package_name
	local key = self._get_resource_key(slot5, resource_type, resource_name)
	local entry = self._dyn_resources[key]

	return entry and entry.ready
end
DynamicResourceManager.clbk_resource_loaded = function (self, status, resource_type, resource_name, package_name)
	slot9 = package_name
	local key = self._get_resource_key(slot6, resource_type, resource_name)
	local entry = self._dyn_resources[key] or (self._to_unload and self._to_unload[key])

	if not entry then
		return 
	end

	entry.ready = true

	if not entry.callbacks then
		return 
	end

	local callbacks = entry.callbacks
	entry.callbacks = nil
	slot10 = callbacks

	for _, clbk in ipairs(slot9) do
		slot17 = resource_name

		clbk(slot14, status, resource_type)
	end

	return 
end
DynamicResourceManager.change_material_config = function (self, name, unit)
	slot13 = unit

	unit.set_material_config(slot4, unit, name, true, callback(100, self, self, "on_material_applied"))

	return 
end
DynamicResourceManager.on_material_applied = function (self, unit)
	slot4 = unit

	if alive(slot3) then
		slot4 = unit

		if unit.interaction(slot3) then
			slot4 = unit
			slot4 = unit.interaction(slot3)

			unit.interaction(slot3).refresh_material(slot3)
		end

		slot4 = unit

		if unit.contour(slot3) then
			slot4 = unit
			slot4 = unit.contour(slot3)

			unit.contour(slot3).update_materials(slot3)
		end
	end

	return 
end
DynamicResourceManager._check_file_streamer_status = function (self)
	local nr_tasks = Application.file_streamer_workload(slot2)
	slot6 = nr_tasks

	self._listener_holder.call(Application, self._listener_holder, self.listener_events.file_streamer_workload)

	return 
end
DynamicResourceManager.is_file_streamer_idle = function (self)
	slot3 = Application
	local nr_tasks = Application.file_streamer_workload(slot2)

	return nr_tasks == 0
end
DynamicResourceManager.set_file_streaming_chunk_size_mul = function (self, mul, sleep_time)
	mul = mul or self._streaming_settings.chunk_size_mul
	sleep_time = sleep_time or self._streaming_settings.sleep_time

	if mul == self._streaming_settings.chunk_size_mul and sleep_time == self._streaming_settings.sleep_time then
		return 
	end

	slot8 = sleep_time

	print(slot4, "[DynamicResourceManager:set_file_streaming_chunk_size_mul]", mul, "sleep_time")

	self._streaming_settings.chunk_size_mul = mul
	slot7 = sleep_time

	self._set_file_streamer_settings(slot4, self, self._streaming_settings.chunk_size_kb)

	return 
end
DynamicResourceManager._set_file_streamer_settings = function (self, chunk_size_kb, sleep_time)
	self._streaming_settings.chunk_size_kb = chunk_size_kb
	self._streaming_settings.sleep_time = sleep_time
	local chunk_size_kb_end_value = chunk_size_kb * 1024 * self._streaming_settings.chunk_size_mul
	slot8 = sleep_time

	Application.set_file_streamer_settings(slot5, Application, chunk_size_kb_end_value)

	return 
end
DynamicResourceManager.add_listener = function (self, key, events, clbk)
	slot9 = clbk

	self._listener_holder.add(slot5, self._listener_holder, key, events)

	return 
end
DynamicResourceManager.remove_listener = function (self, key)
	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end
DynamicResourceManager.max_streaming_chunk = function (self)
	return self._max_streaming_chunk_kb
end
DynamicResourceManager.clbk_streaming_chunk_size_changed = function (self, name, old_value, new_value)
	slot8 = self._streaming_settings.sleep_time

	self._set_file_streamer_settings(slot5, self, new_value)

	return 
end
DynamicResourceManager.preload_units = function (self)
	return 
end

return 
