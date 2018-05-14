if not QueuedEventListenerHolder then
	slot2 = EventListenerHolder
	slot0 = class(slot1)
end

QueuedEventListenerHolder = slot0
function QueuedEventListenerHolder:init()
	self._queue = {}

	return 
end
function QueuedEventListenerHolder:add(key, event_types, clbk)
	slot9 = clbk

	QueuedEventListenerHolder.super.add(slot5, self, key, event_types)

	slot6 = event_types

	for _, event in ipairs(slot5) do
		self._queue[event] = self._queue[event] or {}
		slot12 = key

		if not table.contains(slot10, self._queue[event]) then
			slot12 = key

			table.insert(slot10, self._queue[event])
		end
	end

	return 
end
function QueuedEventListenerHolder:remove(key)
	slot5 = key

	QueuedEventListenerHolder.super.remove(slot3, self)

	slot4 = self._queue

	for _, event in ipairs(slot3) do
		local index = nil
		slot10 = self._queue[event]

		for i, value in ipairs(slot9) do
			if key == value then
				index = i
			end
		end

		if index then
			slot11 = index

			table.remove(slot9, self._queue[event])
		end
	end

	return 
end
function QueuedEventListenerHolder:call(event, ...)
	if self._queue[event] then
		slot4 = self._queue[event]

		for _, queue_key in ipairs(slot3) do
			if self._listeners and self._listeners[event] then
				local event_listeners = self._listeners[event]
				slot10 = event_listeners

				for key, clbk in pairs(slot9) do
					if queue_key == key then
						slot16 = key

						if self._not_trash(slot14, self) then
							clbk(...)
						end
					end
				end
			end
		end
	end

	return 
end

return 
