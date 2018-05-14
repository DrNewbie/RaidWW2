TemporaryPropertyManager = TemporaryPropertyManager or class()
function TemporaryPropertyManager:init()
	self._properties = {}

	return 
end
function TemporaryPropertyManager:activate_property(prop, time, value)
	slot8 = Application
	self._properties[prop] = {
		value,
		Application.time(slot7) + time
	}

	return 
end
function TemporaryPropertyManager:get_property(prop, default)
	slot5 = Application
	local time = Application.time(slot4)

	if self._properties[prop] and time <= self._properties[prop][2] then
		return self._properties[prop][1]
	elseif self._properties[prop] then
		self._properties[prop] = nil
	end

	return default
end
function TemporaryPropertyManager:add_to_property(prop, time, value)
	slot7 = prop

	if not self.has_active_property(slot5, self) then
		slot9 = value

		self.activate_property(slot5, self, prop, time)
	else
		self._properties[prop][1] = self._properties[prop][1] + value
		self._properties[prop][2] = self._properties[prop][2] + time
	end

	return 
end
function TemporaryPropertyManager:mul_to_property(prop, time, value)
	slot7 = prop

	if not self.has_active_property(slot5, self) then
		slot9 = value

		self.activate_property(slot5, self, prop, time)
	else
		self._properties[prop][1] = self._properties[prop][1] * value
	end

	return 
end
function TemporaryPropertyManager:set_time(prop, time)
	slot6 = prop

	if self.has_active_property(slot4, self) then
		slot6 = Application
		self._properties[prop][2] = Application.time(slot5) + time
	end

	return 
end
function TemporaryPropertyManager:has_active_property(prop)
	slot4 = Application
	local time = Application.time(slot3)

	if self._properties[prop] then
	end

	if self._properties[prop] and time <= self._properties[prop][2] then
		return true
	elseif self._properties[prop] then
		self._properties[prop] = nil
	end

	return false
end
function TemporaryPropertyManager:remove_property(prop)
	if self._properties[prop] then
		self._properties[prop] = nil
	end

	return 
end

return 
