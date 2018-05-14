slot3 = "CoreFreeFlightAction"

core.module(slot1, core)

FreeFlightAction = FreeFlightAction or class()
function FreeFlightAction:init(name, callback)
	slot5 = name
	self._name = assert(slot4)
	slot5 = callback
	self._callback = assert(slot4)

	return 
end
function FreeFlightAction:do_action()
	self._callback()

	return 
end
function FreeFlightAction:reset()
	return 
end
function FreeFlightAction:name()
	return self._name
end
FreeFlightActionToggle = FreeFlightActionToggle or class()
function FreeFlightActionToggle:init(name1, name2, callback1, callback2)
	slot7 = name1
	self._name1 = assert(slot6)
	slot7 = name2
	self._name2 = assert(slot6)
	slot7 = callback1
	self._callback1 = assert(slot6)
	slot7 = callback2
	self._callback2 = assert(slot6)
	self._toggle = 1

	return 
end
function FreeFlightActionToggle:do_action()
	if self._toggle == 1 then
		self._toggle = 2

		self._callback1()
	else
		self._toggle = 1

		self._callback2()
	end

	return 
end
function FreeFlightActionToggle:reset()
	if self._toggle == 2 then
		slot3 = self

		self.do_action(slot2)
	end

	return 
end
function FreeFlightActionToggle:name()
	if self._toggle == 1 then
		return self._name1
	else
		return self._name2
	end

	return 
end

return 
