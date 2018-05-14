ListenerHolder = ListenerHolder or class()
function ListenerHolder:add(key, clbk)
	if self._calling then
		slot7 = clbk

		self._set_new(slot4, self, key)
	else
		slot7 = clbk

		self._add(slot4, self, key)
	end

	return 
end
function ListenerHolder:remove(key)
	if self._calling then
		slot5 = key

		self._set_trash(slot3, self)
	else
		slot5 = key

		self._remove(slot3, self)
	end

	return 
end
function ListenerHolder:call(...)
	if self._listeners then
		self._calling = true
		slot3 = self._listeners

		for key, clbk in pairs(slot2) do
			slot9 = key

			if self._not_trash(slot7, self) then
				clbk(...)
			end
		end

		self._calling = nil
		slot3 = self

		self._append_new_additions(slot2)

		slot3 = self

		self._dispose_trash(slot2)
	end

	return 
end
function ListenerHolder:_remove(key)
	self._listeners[key] = nil
	slot4 = self._listeners

	if not next(nil) then
		self._listeners = nil
	end

	return 
end
function ListenerHolder:_add(key, clbk)
	self._listeners = self._listeners or {}
	self._listeners[key] = clbk

	return 
end
function ListenerHolder:_set_trash(key)
	self._trash = self._trash or {}
	self._trash[key] = true

	if self._additions then
		self._additions[key] = nil
	end

	return 
end
function ListenerHolder:_set_new(key, clbk)
	self._additions = self._additions or {}
	self._additions[key] = clbk

	if self._trash then
		self._trash[key] = nil
	end

	return 
end
function ListenerHolder:_append_new_additions()
	if self._additions then
		slot3 = self._additions

		for key, clbk in pairs(slot2) do
			slot10 = clbk

			self._add(slot7, self, key)
		end

		self._additions = nil
	end

	return 
end
function ListenerHolder:_dispose_trash()
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
function ListenerHolder:_not_trash(key)
	return not self._trash or not self._trash[key]
end
function ListenerHolder:is_empty()
	return not self._listeners
end

return 
