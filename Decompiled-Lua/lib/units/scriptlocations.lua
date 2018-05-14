ScriptLocations = ScriptLocations or class()
function ScriptLocations:init(unit)
	return 
end
function ScriptLocations:setup(callback)
	if callback then
		slot6 = true

		self._unit.set_extension_update_enabled(slot3, self._unit, "roaming_data")
	else
		slot6 = false

		self._unit.set_extension_update_enabled(slot3, self._unit, "roaming_data")
	end

	self._updator = callback

	return 
end

return 
