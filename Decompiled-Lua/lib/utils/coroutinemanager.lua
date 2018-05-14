CoroutineManager = CoroutineManager or class()
CoroutineManager.Size = 16
function CoroutineManager:init()
	self._coroutines = {}
	self._buffer = {}
	local size = CoroutineManager.Size

	for i = 1, size, 1 do
		slot9 = {}

		table.insert(slot7, self._coroutines)
	end

	return 
end
function CoroutineManager:update(t, dt)
	slot5 = self

	self._add(slot4)

	local size = #self._coroutines

	for i = 1, size, 1 do
		slot10 = self._coroutines[i]

		for key, value in pairs(slot9) do
			if value then
				slot18 = value.arg
				local result = coroutine.resume(slot14, unpack(slot17))
				slot16 = value.co
				local status = coroutine.status(value.co)

				if status == "dead" then
					slot20 = result

					print(slot16, "[CoroutineManager:update] ", value, " has ended ")

					self._coroutines[i][key] = nil
				end
			end
		end
	end

	return 
end
function CoroutineManager:add_coroutine(name, func, ...)
	local arg = {
		...
	}
	local priority = func.Priority

	if not self._coroutines[priority][name] and not self._buffer[name] then
		self._buffer[name] = {
			name = name,
			func = func,
			arg = arg
		}
	end

	return 
end
function CoroutineManager:add_and_run_coroutine(name, func, ...)
	local arg = {
		...
	}
	local co = coroutine.create(slot5)
	slot10 = arg
	local result = coroutine.resume(func.Function, unpack(slot9))
	slot8 = co
	local status = coroutine.status(co)

	if status ~= "dead" then
		self._coroutines[func.Priority][name] = {
			co = co,
			arg = arg
		}
	end

	return 
end
function CoroutineManager:_add()
	slot3 = self._buffer

	for key, value in pairs(slot2) do
		slot8 = value.func.Function
		local co = coroutine.create(slot7)
		self._coroutines[value.func.Priority][value.name] = {
			co = co,
			arg = value.arg
		}
		self._buffer[key] = nil
	end

	self._buffer = nil
	self._buffer = {}

	return 
end
function CoroutineManager:is_running(name)
	if self._buffer[name] then
		return true
	end

	local size = #self._coroutines

	for i = 1, size, 1 do
		if self._coroutines[i][name] then
			return true
		end
	end

	return false
end

return 
