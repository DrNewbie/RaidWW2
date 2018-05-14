slot3 = "CoreStack"

core.module(slot1, core)

Stack = Stack or class()
function Stack:init()
	slot3 = self

	self.clear(slot2)

	return 
end
function Stack:push(value)
	self._last = self._last + 1
	self._table[self._last] = value

	return 
end
function Stack:pop()
	slot3 = self

	if self.is_empty(slot2) then
		slot3 = "Stack is empty"

		error(slot2)
	end

	local value = self._table[self._last]
	self._table[self._last] = nil
	self._last = self._last - 1

	return value
end
function Stack:top()
	slot3 = self

	if self.is_empty(slot2) then
		slot3 = "Stack is empty"

		error(slot2)
	end

	return self._table[self._last]
end
function Stack:is_empty()
	return self._last == 0
end
function Stack:size()
	return self._last
end
function Stack:clear()
	self._last = 0
	self._table = {}

	return 
end

return 
