HUDObjectiveBase = HUDObjectiveBase or class()
HUDObjectiveBase.OFFSET_WHILE_HIDDEN = 20
function HUDObjectiveBase:init()
	return 
end
function HUDObjectiveBase:x()
	slot3 = self._object

	return self._object.x(slot2)
end
function HUDObjectiveBase:y()
	slot3 = self._object

	return self._object.y(slot2)
end
function HUDObjectiveBase:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDObjectiveBase:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDObjectiveBase:set_x(x)
	slot5 = x

	return self._object.set_x(slot3, self._object)
end
function HUDObjectiveBase:set_y(y)
	slot5 = y

	return self._object.set_y(slot3, self._object)
end
function HUDObjectiveBase:id()
	return self._id
end
function HUDObjectiveBase:complete()
	return 
end
function HUDObjectiveBase:animate_show(delay)
	slot4 = self._object

	self._object.stop(slot3)

	slot9 = "_animate_show"

	self._object.animate(slot3, self._object, callback(delay, self, self))

	return 
end
function HUDObjectiveBase:animate_hide(delay)
	slot4 = self._object

	self._object.stop(slot3)

	slot9 = "_animate_hide"

	self._object.animate(slot3, self._object, callback(delay, self, self))

	return 
end
function HUDObjectiveBase:set_visible()
	slot4 = true

	self._object.set_visible(slot2, self._object)

	slot4 = 1

	self._object.set_alpha(slot2, self._object)

	slot3 = self._object
	slot6 = self._object
	slot6 = self._object.parent(slot5)

	self._object.set_right(slot2, self._object.parent(slot5).w(slot5))

	return 
end
function HUDObjectiveBase:set_hidden()
	slot4 = 0

	self._object.set_alpha(slot2, self._object)

	slot6 = self._object
	slot6 = self._object.parent(slot5)
	slot4 = self._object.parent(slot5).w(slot5) - HUDObjectiveBase.OFFSET_WHILE_HIDDEN

	self._object.set_right(slot2, self._object)

	slot4 = false

	self._object.set_visible(slot2, self._object)

	return 
end
function HUDObjectiveBase:_animate_show(panel, delay)
	local duration = 0.2
	local t = 0
	slot8 = true

	self._object.set_visible(slot6, self._object)

	slot8 = 0

	self._object.set_alpha(slot6, self._object)

	slot10 = self._object
	slot10 = self._object.parent(slot9)
	slot8 = self._object.parent(slot9).w(slot9) - HUDObjectiveBase.OFFSET_WHILE_HIDDEN

	self._object.set_right(slot6, self._object)

	if delay then
		slot7 = delay

		wait(slot6)
	end

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration
		local current_alpha = Easing.quartic_out(slot7, t, 0, 1)
		slot10 = current_alpha

		self._object.set_alpha(t, self._object)

		local current_offset = Easing.quartic_out(t, t, HUDObjectiveBase.OFFSET_WHILE_HIDDEN, -HUDObjectiveBase.OFFSET_WHILE_HIDDEN)
		slot13 = self._object
		slot13 = self._object.parent(duration)
		slot11 = self._object.parent(duration).w(duration) - current_offset

		self._object.set_right(t, self._object)
	end

	slot8 = 1

	self._object.set_alpha(slot6, self._object)

	slot7 = self._object
	slot10 = self._object
	slot10 = self._object.parent(slot9)

	self._object.set_right(slot6, self._object.parent(slot9).w(slot9))

	return 
end
function HUDObjectiveBase:_animate_hide(panel, delay)
	local duration = 0.15
	local t = self._object.alpha(slot5) * duration
	slot7 = self._object
	slot10 = self._object
	slot10 = self._object.parent(slot9)

	self._object.set_right(self._object, self._object.parent(slot9).w(slot9))

	if delay then
		slot7 = delay

		wait(slot6)
	end

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration
		local current_alpha = Easing.quartic_in(slot7, t, 1, -1)
		slot10 = current_alpha

		self._object.set_alpha(t, self._object)

		local current_offset = Easing.quartic_in(t, t, 0, HUDObjectiveBase.OFFSET_WHILE_HIDDEN)
		slot13 = self._object
		slot13 = self._object.parent(duration)
		slot11 = self._object.parent(duration).w(duration) - current_offset

		self._object.set_right(t, self._object)
	end

	slot8 = 0

	self._object.set_alpha(slot6, self._object)

	slot10 = self._object
	slot10 = self._object.parent(slot9)
	slot8 = self._object.parent(slot9).w(slot9) - HUDObjectiveBase.OFFSET_WHILE_HIDDEN

	self._object.set_right(slot6, self._object)

	slot8 = false

	self._object.set_visible(slot6, self._object)

	return 
end

return 
