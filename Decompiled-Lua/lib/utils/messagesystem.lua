slot2 = "lib/utils/Messages"

require(slot1)

MessageSystem = MessageSystem or class()
function MessageSystem:init()
	self._listeners = {}
	self._remove_list = {}
	self._add_list = {}
	self._messages = {}

	return 
end
function MessageSystem:register(message, uid, func)
	slot7 = {
		message = message,
		uid = uid,
		func = func
	}

	table.insert(slot5, self._add_list)

	return 
end
function MessageSystem:unregister(message, uid)
	slot6 = {
		message = message,
		uid = uid
	}

	table.insert(slot4, self._remove_list)

	return 
end
function MessageSystem:notify(message, uid, ...)
	local arg = {
		...
	}
	slot7 = {
		message = message,
		uid = uid,
		arg = arg
	}

	table.insert(slot5, self._messages)

	return 
end
function MessageSystem:notify_now(message, uid, ...)
	local arg = {
		...
	}

	if self._listeners[message] then
		if uid and self._listeners[message][uid] then
			slot8 = arg

			self._listeners[message][uid](unpack(slot7))
		else
			slot6 = self._listeners[message]

			for key, value in pairs(slot5) do
				slot13 = arg

				value(unpack(slot12))
			end
		end
	end

	return 
end
function MessageSystem:_notify()
	slot3 = self._messages
	local messages = deep_clone(slot2)
	local count = #self._messages

	for i = 1, count, 1 do
		self._messages[i] = nil
	end

	self._messages = nil
	self._messages = {}

	for i = 1, count, 1 do
		if self._listeners[messages[i].message] then
			if messages[i].uid then
				slot11 = messages[i].arg

				self._listeners[messages[i].message][messages[i].uid](unpack(slot10))
			else
				slot9 = self._listeners[messages[i].message]

				for key, value in pairs(slot8) do
					slot16 = messages[i].arg

					value(unpack(slot15))
				end
			end
		end
	end

	return 
end
function MessageSystem:flush()
	if 0 < #self._remove_list then
		slot3 = self

		self._remove(slot2)
	end

	if 0 < #self._add_list then
		slot3 = self

		self._add(slot2)
	end

	return 
end
function MessageSystem:update()
	slot3 = self

	self.flush(slot2)

	slot3 = self

	self._notify(slot2)

	return 
end
function MessageSystem:_remove()
	local count = #self._remove_list

	for i = 1, count, 1 do
		local data = self._remove_list[i]
		slot11 = self._remove_list[i].uid

		self._unregister(slot8, self, self._remove_list[i].message)

		self._remove_list[i].message = nil
		self._remove_list[i].uid = nil
	end

	self._remove_list = nil
	self._remove_list = {}

	return 
end
function MessageSystem:_add()
	local count = #self._add_list

	for i = 1, count, 1 do
		local data = self._add_list[i]
		slot12 = data.func

		self._register(slot8, self, data.message, data.uid)

		self._add_list[i].message = nil
		self._add_list[i].uid = nil
		self._add_list[i].func = nil
	end

	self._add_list = nil
	self._add_list = {}

	return 
end
function MessageSystem:_register(message, uid, func)
	if not self._listeners[message] then
		self._listeners[message] = {}
	end

	if not self._listeners[message][uid] then
		self._listeners[message][uid] = func
	end

	return 
end
function MessageSystem:_unregister(message, uid)
	if self._listeners[message] then
		self._listeners[message][uid] = nil
	end

	return 
end

return 
