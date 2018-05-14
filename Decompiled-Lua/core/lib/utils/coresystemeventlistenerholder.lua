slot3 = "CoreSystemEventListenerHolder"

core.module(slot1, core)

SystemEventListenerHolder = SystemEventListenerHolder or class()
function SystemEventListenerHolder:add(key, event_types, clbk)
	if self._calling then
		slot9 = clbk

		self._set_new(slot5, self, key, event_types)
	else
		slot9 = clbk

		self._add(slot5, self, key, event_types)
	end

	return 
end
function SystemEventListenerHolder:remove(key)
	if self._calling then
		slot5 = key

		self._set_trash(slot3, self)
	else
		slot5 = key

		self._remove(slot3, self)
	end

	return 
end
function SystemEventListenerHolder:call(event, ...)
	if self._listeners then
		local event_listeners = self._listeners[event]

		if event_listeners then
			self._calling = true
			slot5 = event_listeners

			for key, clbk in pairs(slot4) do
				slot11 = key

				if self._not_trash(slot9, self) then
					clbk(...)
				end
			end

			self._calling = nil
			slot5 = self

			self._append_new_additions(slot4)

			slot5 = self

			self._dispose_trash(slot4)
		end
	end

	return 
end
function SystemEventListenerHolder:_remove(key)
	local listeners = self._listeners

	if not self._listener_keys then
		return 
	end

	local listeners_keys = self._listener_keys[key]

	if listeners_keys then
		slot6 = listeners_keys

		for _, event in pairs(slot5) do
			listeners[event][key] = nil
			slot11 = listeners[event]

			if not next(nil) then
				listeners[event] = nil
			end
		end

		slot6 = listeners

		if next(slot5) then
			self._listener_keys[key] = nil
		else
			self._listeners = nil
			self._listener_keys = nil
		end
	end

	return 
end
function SystemEventListenerHolder:listener_exists(key)
	if self._listener_keys and self._listener_keys[key] then
		return true
	end

	return false
end
function SystemEventListenerHolder:_add(key, event_types, clbk)
	if self._listener_keys and self._listener_keys[key] then
		slot10 = event_types

		_G.debug_pause(slot5, "[SystemEventListenerHolder:_add] duplicate", key, inspect(clbk))

		return 
	end

	local listeners = self._listeners

	if not listeners then
		self._listeners = {}
		self._listener_keys = {}
		listeners = self._listeners
	end

	slot7 = event_types

	for _, event in pairs(slot6) do
		listeners[event] = listeners[event] or {}
		listeners[event][key] = clbk
	end

	self._listener_keys[key] = event_types

	return 
end
function SystemEventListenerHolder:_set_trash(key)
	self._trash = self._trash or {}
	self._trash[key] = true

	if self._additions then
		self._additions[key] = nil
	end

	return 
end
function SystemEventListenerHolder:_set_new(key, event_types, clbk)
	if self._additions and self._additions[key] then
		slot10 = event_types

		_G.debug_pause(slot5, "[SystemEventListenerHolder:_set_new] duplicate", key, inspect(clbk))

		return 
	end

	self._additions = self._additions or {}
	self._additions[key] = {
		clbk,
		event_types
	}

	if self._trash then
		self._trash[key] = nil
	end

	return 
end
function SystemEventListenerHolder:_append_new_additions()
	if self._additions then
		local listeners = self._listeners

		if not listeners then
			self._listeners = {}
			self._listener_keys = {}
			listeners = self._listeners
		end

		slot4 = self._additions

		for key, new_entry in pairs(slot3) do
			slot9 = new_entry[2]

			for _, event in ipairs(slot8) do
				listeners[event] = listeners[event] or {}
				listeners[event][key] = new_entry[1]
			end

			self._listener_keys[key] = new_entry[2]
		end

		self._additions = nil
	end

	return 
end
function SystemEventListenerHolder:_dispose_trash()
	if self._trash then
		slot3 = self._trash

		for key, _ in pairs(slot2) do
			slot9 = key

			self._remove(slot7, self)
		end

		self._trash = nil
	end

	return 
end
function SystemEventListenerHolder:_not_trash(key)
	return not self._trash or not self._trash[key]
end
function SystemEventListenerHolder:has_listeners_for_event(event)
	return self._listeners and self._listeners[event]
end

return 
