slot3 = "CoreUnitCamera"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

UnitCamera = UnitCamera or CoreClass.class()
function UnitCamera:init(unit)
	self._unit = unit
	self._active_count = 0

	return 
end
function UnitCamera:destroy()
	return 
end
function UnitCamera:create_layers()
	return 
end
function UnitCamera:activate()
	local is_deactivated = self._active_count == 0
	self._active_count = self._active_count + 1

	if is_deactivated then
		slot5 = true

		self.on_activate(slot3, self)
	end

	return 
end
function UnitCamera:deactivate()
	slot3 = 0 < self._active_count

	assert(slot2)

	self._active_count = self._active_count - 1
	local should_deactivate = self._active_count == 0

	if should_deactivate then
		slot5 = false

		self.on_activate(slot3, self)
	end

	return should_deactivate
end
function UnitCamera:on_activate(active)
	return 
end
function UnitCamera:is_active()
	return 0 < self._active_count
end
function UnitCamera:apply_camera(camera_manager)
	return 
end

return 
