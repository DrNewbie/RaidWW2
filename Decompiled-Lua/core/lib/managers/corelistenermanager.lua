slot3 = "CoreListenerManager"

core.module(slot1, core)

slot3 = "CoreLinkedStackMap"

core.import(slot1, core)

ListenerManager = ListenerManager or class()
ListenerManager.init = function (self)
	self._set_map = {}
	self._category_map = {}
	self._listener_map = {}
	self._active_category_map = {}
	self._active_set_count_map = {}
	self._active_set_stack_map = {}
	self._activation_map = {}
	self._stack_activation_map = {}
	self._set_activation_map = {}
	self._last_activation_id = 0
	self._enabled = true
	slot4 = "main"

	self.add_stack(slot2, self)

	return 
end
ListenerManager.active_listener_obj = function (self)
	slot3 = self._listener_map

	for id, listener_data in pairs(slot2) do
		if listener_data.active then
			return listener_data.distance_obj
		end
	end

	return 
end
ListenerManager.get_closest_listener_position = function (self, position)
	slot5 = "ListenerManager:get_closest_listener_position dont function in wwise yet"

	Application.error(slot3, Application)

	return 

	local closest_position, closest_distance = nil

	function slot7(listener_id)
		slot4 = listener_id
		local distance_obj = Sound.listener(slot2, Sound)
		slot4 = distance_obj

		if alive(Sound) then
			local obj_position = distance_obj.position(slot3)
			slot5 = obj_position - position
			local obj_distance = obj_position - position.length(distance_obj)

			if not closest_distance or obj_distance < closest_distance then
				closest_position = obj_position
				closest_distance = obj_distance
			end
		end

		return 
	end

	self.callback_on_all_active_listeners(slot5, self)

	return closest_position, closest_distance
end
ListenerManager.set_enabled = function (self, enabled)
	enabled = not not enabled

	if self._enabled ~= enabled then
		function slot5(listener_id)
			slot4 = enabled

			self._listener_map[listener_id].listener.activate(slot2, self._listener_map[listener_id].listener)

			return 
		end

		self.callback_on_all_active_listeners(slot3, self)

		self._enabled = enabled
	end

	return 
end
ListenerManager.callback_on_all_active_listeners = function (self, func)
	local done_set_map = {}
	local done_category_map = {}
	slot6 = self._active_set_stack_map

	for stack_id, stack in pairs(slot5) do
		slot11 = stack
		local set_id = stack.top(slot10)

		if set_id and not done_set_map[set_id] then
			slot12 = self._set_map[set_id]

			for category_id, category_map in pairs(slot11) do
				if not done_category_map[category_id] then
					slot17 = category_map

					for listener_id, listener in pairs(slot16) do
						slot22 = listener_id

						func(slot21)
					end

					done_category_map[category_id] = true
				end
			end

			done_set_map[set_id] = true
		end
	end

	return 
end
ListenerManager.has_stack = function (self, stack_id)
	return self._active_set_stack_map[stack_id] ~= nil
end
ListenerManager.has_set = function (self, set_id)
	return self._set_map[set_id] ~= nil
end
ListenerManager.has_category = function (self, category_id)
	return self._category_map[category_id] ~= nil
end
ListenerManager.add_stack = function (self, stack_id)
	if not self._active_set_stack_map[stack_id] then
		slot5 = CoreLinkedStackMap.LinkedStackMap
		self._active_set_stack_map[stack_id] = CoreLinkedStackMap.LinkedStackMap.new(slot4)
		self._stack_activation_map[stack_id] = {}
	else
		slot8 = stack_id
		slot5 = "Stack id \"" .. tostring(slot7) .. "\" already exists."

		Application.stack_dump_error(slot3, Application)
	end

	return 
end
ListenerManager.remove_stack = function (self, stack_id)
	local active_set_stack = self._active_set_stack_map[stack_id]

	if active_set_stack then
		self._active_set_stack_map[stack_id] = nil
		slot5 = self._stack_activation_map[stack_id]

		for activation_id in pairs(nil) do
			slot10 = activation_id

			self.deactivate_set(slot8, self)
		end

		self._stack_activation_map[stack_id] = nil
	else
		slot9 = stack_id
		slot6 = "Stack id \"" .. tostring(slot8) .. "\" doesn't exists."

		Application.stack_dump_error(slot4, Application)
	end

	return 
end
ListenerManager.add_set = function (self, set_id, category_id_list)
	if not self._set_map[set_id] then
		self._set_map[set_id] = {}
		self._set_activation_map[set_id] = {}

		if category_id_list then
			slot5 = category_id_list

			for _, category_id in ipairs(slot4) do
				slot12 = category_id

				self.add_set_category(slot9, self, set_id)
			end
		end
	else
		slot9 = set_id
		slot6 = "Unable to add an already set id \"" .. tostring(slot8) .. "\""

		Application.stack_dump_error(slot4, Application)
	end

	return 
end
ListenerManager.remove_set = function (self, set_id)
	local category_map = self._set_map[set_id]

	if category_map then
		slot5 = category_map

		for category_id in pairs(slot4) do
			slot11 = category_id

			self.remove_set_category(slot8, self, set_id)
		end

		slot5 = self._set_activation_map[set_id]

		for activation_id in pairs(slot4) do
			slot10 = activation_id

			self.deactivate_set(slot8, self)
		end

		self._set_map[set_id] = nil
		self._set_activation_map[set_id] = nil
	else
		slot9 = set_id
		slot6 = "Unable to remove non-existing set id \"" .. tostring(slot8) .. "\""

		Application.stack_dump_error(slot4, Application)
	end

	return 
end
ListenerManager.add_set_category = function (self, set_id, category_id)
	local category_map = self._set_map[set_id]

	if category_map then
		local listener_map = self._category_map[category_id]

		if not listener_map then
			listener_map = {}
			self._category_map[category_id] = listener_map
			self._active_category_map[category_id] = false
		end

		category_map[category_id] = listener_map
	else
		slot10 = category_id
		slot12 = set_id
		slot7 = "Unable to add a category id \"" .. tostring(slot9) .. "\" on non-existing set id \"" .. tostring(slot11) .. "\""

		Application.stack_dump_error(slot5, Application)
	end

	return 
end
ListenerManager.remove_set_category = function (self, set_id, category_id)
	local category_map = self._set_map[set_id]

	if category_map then
		if category_map[category_id] then
			category_map[category_id] = nil
		else
			slot10 = category_id
			slot12 = set_id
			slot7 = "Unable to remove non-existing category id \"" .. tostring(slot9) .. "\" on set id \"" .. tostring(slot11) .. "\""

			Application.stack_dump_error(slot5, Application)
		end
	else
		slot10 = category_id
		slot12 = set_id
		slot7 = "Unable to remove a category id \"" .. tostring(slot9) .. "\" on non-existing set id \"" .. tostring(slot11) .. "\""

		Application.stack_dump_error(slot5, Application)
	end

	return 
end
ListenerManager.add_category = function (self, category_id)
	if not self._category_map[category_id] then
		self._category_map[category_id] = {}
		self._active_category_map[category_id] = false
	else
		slot8 = category_id
		slot5 = "Unable to add already existing category id \"" .. tostring(slot7) .. "\""

		Application.stack_dump_error(slot3, Application)
	end

	return 
end
ListenerManager.remove_category = function (self, category_id)
	if self._category_map[category_id] then
		slot4 = self._set_map

		for set_id, category_map in pairs(slot3) do
			if category_map[category_id] then
				slot11 = category_id

				self.remove_set_category(slot8, self, set_id)
			end
		end

		self._category_map[category_id] = nil
		self._active_category_map[category_id] = nil
	else
		slot8 = category_id
		slot5 = "Unable to remove non-existing category id \"" .. tostring(slot7) .. "\""

		Application.stack_dump_error(slot3, Application)
	end

	return 
end
ListenerManager.add_listener = function (self, category_id, distance_obj, orientation_obj, occlusion_obj, disabled)
	if not self._category_map[category_id] then
		slot9 = category_id

		self.add_category(slot7, self)
	end

	local listener_map = self._category_map[category_id]
	slot10 = category_id
	local listener = SoundDevice.create_listener(slot8, SoundDevice)
	slot11 = distance_obj

	listener.link_position(SoundDevice, listener)

	if orientation_obj then
		slot11 = orientation_obj

		listener.link_orientation(slot9, listener)
	end

	if occlusion_obj then
		slot11 = occlusion_obj

		listener.link_occlusion(slot9, listener)
	end

	local listener_data = {
		listener = listener,
		category_id = category_id,
		enabled = not disabled,
		distance_obj = distance_obj,
		orientation_obj = orientation_obj,
		occlusion_obj = occlusion_obj
	}
	slot11 = listener
	local key = listener.key(slot10)
	self._listener_map[key] = listener_data
	listener_map[key] = listener_data

	if not self._enabled or disabled or not self._active_category_map[category_id] then
		slot13 = false

		listener.activate(slot11, listener)
	end

	return key
end
ListenerManager.remove_listener = function (self, listener_id)
	local listener = self._listener_map[listener_id]

	if listener then
		local category_id = listener.category_id
		local listener_map = self._category_map[category_id]

		if listener_map then
			if listener_map[listener_id] then
				listener_map[listener_id].listener = nil
				listener_map[listener_id] = nil
				self._listener_map[listener_id] = nil
			else
				slot11 = listener_id
				slot13 = category_id
				slot8 = "Unable to remove non-existing listener id \"" .. tostring(slot10) .. "\" in category id \"" .. tostring(slot12) .. "\"."

				Application.stack_dump_error(slot6, Application)
			end
		else
			slot11 = listener_id
			slot13 = category_id
			slot8 = "Unable to remove listener id \"" .. tostring(slot10) .. "\" in non-existing category id \"" .. tostring(slot12) .. "\"."

			Application.stack_dump_error(slot6, Application)
		end
	else
		slot9 = listener_id
		slot6 = "Unable to remove non-existing listener id \"" .. tostring(slot8) .. "\"."

		Application.stack_dump_error(slot4, Application)
	end

	return 
end
ListenerManager.set_listener = function (self, listener_id, distance_obj, orientation_obj, occlusion_obj)
	local listener = self._listener_map[listener_id]

	if listener then
		local category_id = listener.category_id
		local listener_map = self._category_map[category_id]

		if listener_map then
			if listener_map[listener_id] then
				local listener = listener_map[listener_id].listener
				slot12 = distance_obj

				listener.link_position(slot10, listener)

				if orientation_obj then
					slot12 = orientation_obj

					listener.link_orientation(slot10, listener)
				end

				if occlusion_obj then
					slot12 = occlusion_obj

					listener.link_occlusion(slot10, listener)
				end
			else
				slot14 = listener_id
				slot16 = category_id
				slot11 = "Unable to set non-existing listener id \"" .. tostring(slot13) .. "\" in category id \"" .. tostring(slot15) .. "\"."

				Application.stack_dump_error(slot9, Application)
			end
		else
			slot14 = listener_id
			slot16 = category_id
			slot11 = "Unable to set listener id \"" .. tostring(slot13) .. "\" in non-existing category id \"" .. tostring(slot15) .. "\"."

			Application.stack_dump_error(slot9, Application)
		end
	else
		slot12 = listener_id
		slot9 = "Unable to set non-existing listener id \"" .. tostring(slot11) .. "\"."

		Application.stack_dump_error(slot7, Application)
	end

	return 
end
ListenerManager.set_listener_enabled = function (self, listener_id, enabled)
	local data = self._listener_map[listener_id]

	if data then
		data.enabled = enabled

		if self._active_category_map[data.category_id] then
			slot7 = self._enabled and enabled

			data.listener.activate(slot5, data.listener)
		end
	else
		slot10 = listener_id
		slot7 = "Unable to set non-existing listener id \"" .. tostring(slot9) .. "\"."

		Application.stack_dump_error(slot5, Application)
	end

	return 
end
ListenerManager.get_listener_enabled = function (self, listener_id)
	local listener = self._listener_map[listener_id]

	if listener then
		return listener.enabled
	else
		slot9 = listener_id
		slot6 = "Unable to get non-existing listener id \"" .. tostring(slot8) .. "\"."

		Application.stack_dump_error(slot4, Application)

		return nil
	end

	return 
end
ListenerManager.activate_set = function (self, stack_id, set_id)
	local active_set_stack = self._active_set_stack_map[stack_id]

	if active_set_stack then
		if self._set_map[set_id] then
			slot6 = active_set_stack
			local active_set_id = active_set_stack.top(slot5)

			if active_set_id ~= set_id then
				if active_set_id and self._active_set_count_map[active_set_id] == 1 then
					slot8 = active_set_id

					self._deactivate_set(slot6, self)
				end

				slot8 = set_id

				self._activate_set(slot6, self)
			end

			slot8 = set_id
			local link_id = active_set_stack.add(slot6, active_set_stack)
			local activation_id = self._last_activation_id + 1
			self._activation_map[activation_id] = {
				stack_id = stack_id,
				set_id = set_id,
				link_id = link_id
			}
			self._stack_activation_map[stack_id][activation_id] = true
			self._set_activation_map[set_id][activation_id] = true
			self._last_activation_id = activation_id

			return activation_id
		else
			slot10 = set_id
			slot7 = "Unable to activate non-existing set id \"" .. tostring(slot9) .. "\" on stack id \"" .. stack_id .. "\"."

			Application.stack_dump_error(slot5, Application)
		end
	else
		slot10 = set_id
		slot7 = "Unable to activate set id \"" .. tostring(slot9) .. "\" on non-existing stack id \"" .. stack_id .. "\"."

		Application.stack_dump_error(slot5, Application)
	end

	return -1
end
ListenerManager.deactivate_set = function (self, activation_id)
	local activation = self._activation_map[activation_id]

	if activation then
		local stack_id = activation.stack_id
		local set_id = activation.set_id
		local active_set_stack = self._active_set_stack_map[stack_id]
		local top_set_id = active_set_stack.top(slot7)
		slot10 = activation.link_id

		active_set_stack.remove(active_set_stack, active_set_stack)

		slot9 = active_set_stack
		local next_active_set_id = active_set_stack.top(active_set_stack)

		if set_id == top_set_id and set_id ~= next_active_set_id then
			if next_active_set_id and not self._active_set_count_map[next_active_set_id] then
				slot11 = next_active_set_id

				self._activate_set(slot9, self)
			end

			slot11 = set_id

			self._deactivate_set(slot9, self)
		end

		self._activation_map[activation_id] = nil
		self._stack_activation_map[stack_id][activation_id] = nil
		self._set_activation_map[set_id][activation_id] = nil
	else
		slot9 = activation_id
		slot6 = "Unable to deactivate non-existing activation id \"" .. tostring(slot8) .. "\"."

		Application.stack_dump_error(slot4, Application)
	end

	return 
end
ListenerManager._activate_set = function (self, set_id)
	local active_set_count = self._active_set_count_map[set_id]

	if not active_set_count then
		slot7 = true

		self._set_listener_set_active(slot4, self, set_id)
	end

	active_set_count = active_set_count or 0
	self._active_set_count_map[set_id] = active_set_count + 1

	return 
end
ListenerManager._deactivate_set = function (self, set_id)
	local active_set_count = self._active_set_count_map[set_id]
	active_set_count = active_set_count - 1

	if active_set_count <= 0 then
		active_set_count = nil
		slot7 = false

		self._set_listener_set_active(slot4, self, set_id)
	end

	self._active_set_count_map[set_id] = active_set_count

	return 
end
ListenerManager._set_listener_set_active = function (self, set_id, active)
	slot5 = self._set_map[set_id]

	for category_id, listener_map in pairs(slot4) do
		self._active_category_map[category_id] = active
		slot10 = listener_map

		for _, data in pairs(slot9) do
			slot16 = self._enabled and data.enabled and active

			data.listener.activate(slot14, data.listener)

			data.active = active
		end
	end

	return 
end
ListenerManager.debug_print = function (self)
	slot3 = self._active_set_stack_map

	for stack_id, stack in pairs(slot2) do
		slot11 = stack_id
		slot15 = stack
		slot9 = tostring(slot10) .. ": " .. tostring(stack.to_string(slot14))

		cat_debug(slot7, "debug")
	end

	return 
end

return 
