if not CorePointOrientationUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CorePointOrientationUnitElement = slot0

if not PointOrientationUnitElement then
	slot2 = CorePointOrientationUnitElement
	slot0 = class(slot1)
end

PointOrientationUnitElement = slot0
function PointOrientationUnitElement:init(...)
	slot3 = self

	PointOrientationUnitElement.super.init(slot2, ...)

	return 
end
function CorePointOrientationUnitElement:init(unit)
	slot5 = unit

	CorePointOrientationUnitElement.super.init(slot3, self)

	return 
end
function CorePointOrientationUnitElement:update_selected(...)
	slot3 = self

	CorePointOrientationUnitElement.super.update_selected(slot2, ...)

	slot3 = self

	self._draw_orientation(slot2)

	return 
end
function CorePointOrientationUnitElement:update_unselected(...)
	slot3 = self

	CorePointOrientationUnitElement.super.update_unselected(slot2, ...)

	slot3 = self

	self._draw_orientation(slot2)

	return 
end
function CorePointOrientationUnitElement:_draw_orientation()
	local len = 25
	local scale = 0.05
	slot10 = self._unit
	slot10 = self._unit.rotation(self._unit)
	slot11 = scale

	Application.draw_arrow(slot4, Application, self._unit.position(slot7), self._unit.position(self._unit) + self._unit.rotation(self._unit).x(self._unit) * len, 1, 0, 0)

	slot10 = self._unit
	slot10 = self._unit.rotation(self._unit)
	slot11 = scale

	Application.draw_arrow(slot4, Application, self._unit.position(self._unit.position(self._unit) + self._unit.rotation(self._unit).x(self._unit) * len), self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * len, 0, 1, 0)

	slot10 = self._unit
	slot10 = self._unit.rotation(self._unit)
	slot11 = scale

	Application.draw_arrow(slot4, Application, self._unit.position(self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * len), self._unit.position(self._unit) + self._unit.rotation(self._unit).z(self._unit) * len, 0, 0, 1)

	return 
end

return 
