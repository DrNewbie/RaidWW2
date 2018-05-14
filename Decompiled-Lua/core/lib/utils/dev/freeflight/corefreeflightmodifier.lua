slot3 = "CoreFreeFlightModifier"

core.module(slot1, core)

FreeFlightModifier = FreeFlightModifier or class()
function FreeFlightModifier:init(name, values, index, callback)
	slot7 = name
	self._name = assert(slot6)
	slot7 = values
	self._values = assert(slot6)
	slot7 = index
	self._index = assert(slot6)
	self._callback = callback

	return 
end
function FreeFlightModifier:step_up()
	slot5 = #self._values
	self._index = math.clamp(slot2, self._index + 1, 1)

	if self._callback then
		slot5 = self

		self._callback(self.value(slot4))
	end

	return 
end
function FreeFlightModifier:step_down()
	slot5 = #self._values
	self._index = math.clamp(slot2, self._index - 1, 1)

	if self._callback then
		slot5 = self

		self._callback(self.value(slot4))
	end

	return 
end
function FreeFlightModifier:name_value()
	slot5 = self._values[self._index]

	return string.format(slot2, "%10.10s %7.2f", self._name)
end
function FreeFlightModifier:value()
	return self._values[self._index]
end

return 
