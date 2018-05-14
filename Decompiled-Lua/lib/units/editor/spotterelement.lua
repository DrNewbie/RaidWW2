if not SpotterUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SpotterUnitElement = slot0
SpotterUnitElement.USES_POINT_ORIENTATION = true
SpotterUnitElement.ON_EXECUTED_ALTERNATIVES = {
	"on_outlined",
	"on_spotted"
}
function SpotterUnitElement:init(unit)
	slot5 = unit

	SpotterUnitElement.super.init(slot3, self)

	return 
end
function SpotterUnitElement:update_selected(time, rel_time)
	slot11 = time * 100
	local brush = Draw.brush(slot4, Color.white.with_alpha(slot7, Color.white))
	local len = (math.sin(Draw) + 1) / 2 * 3000
	slot12 = self._unit
	slot12 = self._unit.rotation(self._unit)
	slot10 = len

	brush.cone(time * 100, brush, self._unit.position((1 - (math.sin(slot10) + 1) / 2) * 0.15), self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * len)

	slot7 = brush
	slot11 = 0.15

	brush.set_color(time * 100, Color.white.with_alpha(self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * len, Color.white))

	slot12 = self._unit
	slot12 = self._unit.rotation(self._unit)
	slot10 = 3000

	brush.cone(time * 100, brush, self._unit.position(self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * len), self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * 3000)

	slot12 = self._unit
	slot12 = self._unit.rotation(self._unit)
	slot14 = 0.1

	Application.draw_cone(time * 100, Application, self._unit.position(self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * 3000), self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * 3000, 3000, 0.75, 0.75, 0.75)

	return 
end
function SpotterUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	return 
end

return 
