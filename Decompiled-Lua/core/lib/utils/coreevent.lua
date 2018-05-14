-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if core then
	slot3 = "CoreEvent"

	core.module(slot1, core)

	slot3 = "CoreDebug"

	core.import(slot1, core)
end

function callback(o, base_callback_class, base_callback_func_name, base_callback_param)
	if base_callback_class and base_callback_func_name and base_callback_class[base_callback_func_name] then
		if base_callback_param ~= nil then
			if o then
				return function (...)
					slot3 = base_callback_param

					return base_callback_class[base_callback_func_name](base_callback_func_name, o, ...)
				end
			else
				return function (...)
					slot2 = base_callback_param

					return base_callback_class[base_callback_func_name](base_callback_func_name, ...)
				end
			end
		elseif o then
			return function (...)
				slot2 = o

				return base_callback_class[base_callback_func_name](base_callback_func_name, ...)
			end
		else
			return function (...)
				return base_callback_class[base_callback_func_name](...)
			end
		end
	elseif base_callback_class then
		if base_callback_class then
			slot8 = base_callback_class
			slot6 = getmetatable(slot7) or base_callback_class
			local class_name = CoreDebug.class_name(slot5)
		end

		slot10 = class_name
		slot12 = base_callback_func_name
		slot7 = "Callback on class \"" .. tostring(slot9) .. "\" refers to a non-existing function \"" .. tostring(slot11) .. "\"."

		error(slot6)
	elseif base_callback_func_name then
		slot9 = base_callback_func_name
		slot6 = "Callback to function \"" .. tostring(slot8) .. "\" is on a nil class."

		error(slot5)
	else
		slot6 = "Callback class and function was nil."

		error(slot5)
	end

	return 
end

local tc = 0

function get_ticket(delay)
	slot4 = delay - 1

	return {
		delay,
		math.random(slot3)
	}
end

function valid_ticket(ticket)
	return tc % ticket[1] == ticket[2]
end

function update_tickets()
	tc = tc + 1

	if 30 < tc then
		tc = 0
	end

	return 
end

BasicEventHandling = {
	connect = function (self, event_name, callback_func, data)
		self._event_callbacks = self._event_callbacks or {}
		self._event_callbacks[event_name] = self._event_callbacks[event_name] or {}

		local function wrapped_func(...)
			slot2 = data

			callback_func(slot1, ...)

			return 
		end

		slot8 = wrapped_func

		table.insert(slot6, self._event_callbacks[event_name])

		return wrapped_func
	end,
	disconnect = function (self, event_name, wrapped_func)
		if self._event_callbacks and self._event_callbacks[event_name] then
			slot6 = wrapped_func

			table.delete(slot4, self._event_callbacks[event_name])

			slot5 = self._event_callbacks[event_name]

			if table.empty(slot4) then
				self._event_callbacks[event_name] = nil
				slot5 = self._event_callbacks

				if table.empty(nil) then
					self._event_callbacks = nil
				end
			end
		end

		return 
	end,
	_has_callbacks_for_event = function (self, event_name)
		return self._event_callbacks ~= nil and self._event_callbacks[event_name] ~= nil
	end,
	_send_event = function (self, event_name, ...)
		if self._event_callbacks then
			slot2 = ipairs
			slot4 = self._event_callbacks[event_name] or {}

			for _, wrapped_func in slot2(slot3) do
				wrapped_func(...)
			end
		end

		return 
	end
}
CallbackHandler = CallbackHandler or class()
function CallbackHandler:init()
	slot3 = self

	self.clear(slot2)

	return 
end
function CallbackHandler:clear()
	self._t = 0
	self._sorted = {}

	return 
end
function CallbackHandler:__insert_sorted(cb)
	local i = 1

	while self._sorted[i] and (self._sorted[i].next == nil or self._sorted[i].next < cb.next) do
		i = i + 1
	end

	slot7 = cb

	table.insert(slot4, self._sorted, i)

	return 
end
function CallbackHandler:add(f, interval, times)
	times = times or -1
	local cb = {
		f = f,
		interval = interval,
		times = times,
		next = self._t + interval
	}
	slot8 = cb

	self.__insert_sorted(slot6, self)

	return cb
end
function CallbackHandler:remove(cb)
	if cb then
		cb.next = nil
	end

	return 
end
function CallbackHandler:update(dt)
	self._t = self._t + dt

	while true do

		-- Decompilation error in this vicinity:
		local cb = self._sorted[1]
		cb.next = cb.next + cb.interval
		slot6 = cb

		self.__insert_sorted(cb.interval, self)
	end

	return 
end
CallbackEventHandler = CallbackEventHandler or class()
function CallbackEventHandler:init()
	return 
end
function CallbackEventHandler:clear()
	self._callback_map = nil

	return 
end
function CallbackEventHandler:add(func)
	self._callback_map = self._callback_map or {}
	self._callback_map[func] = true

	return 
end
function CallbackEventHandler:remove(func)
	if not self._callback_map or not self._callback_map[func] then
		return 
	end

	if self._next_callback == func then
		slot5 = self._next_callback
		self._next_callback = next(slot3, self._callback_map)
	end

	self._callback_map[func] = nil
	slot4 = self._callback_map

	if not next(nil) then
		self._callback_map = nil
	end

	return 
end
function CallbackEventHandler:dispatch(...)
	if self._callback_map then
		slot3 = self._callback_map
		self._next_callback = next(slot2)

		self._next_callback(...)

		while self._next_callback do
			slot4 = self._next_callback
			self._next_callback = next(slot2, self._callback_map)

			if self._next_callback then
				self._next_callback(...)
			end
		end
	end

	return 
end

function over(seconds, f, fixed_dt)
	local t = 0

	while true do
		local dt = coroutine.yield()
		t = t + ((fixed_dt and 0.03333333333333333) or dt)

		if seconds <= t then
			break
		end

		slot8 = t

		f(slot6, t / seconds)
	end

	slot7 = seconds

	f(slot5, 1)

	return 
end

function seconds(s, t)
	if not t then
		return seconds, s, 0
	end

	if s and s <= t then
		return nil
	end

	local dt = coroutine.yield()
	t = t + dt

	if s and s < t then
		t = s
	end

	if s then
		return t, t / s, dt
	else
		return t, t, dt
	end

	return 
end

function wait(seconds, fixed_dt)
	local t = 0

	while t < seconds do
		local dt = coroutine.yield()
		t = t + ((fixed_dt and 0.03333333333333333) or dt)
	end

	return 
end

return 
