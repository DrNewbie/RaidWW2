if not ExplosionDamageUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

ExplosionDamageUnitElement = slot0
function ExplosionDamageUnitElement:init(unit)
	slot5 = unit

	ExplosionDamageUnitElement.super.init(slot3, self)

	self._hed.range = 100
	self._hed.damage = 40
	slot5 = "range"

	table.insert(40, self._save_values)

	slot5 = "damage"

	table.insert(40, self._save_values)

	return 
end
function ExplosionDamageUnitElement:update_selected()
	local brush = Draw.brush(slot2)
	slot4 = brush
	slot10 = 1

	brush.set_color(Draw, Color(slot6, 0.15, 1, 1))

	slot10 = 0.5
	local pen = Draw.pen(Draw, Color(slot6, 0.15, 0.5, 0.5))
	slot8 = self._unit
	slot8 = 4

	brush.sphere(Draw, brush, self._unit.position(0.15), self._hed.range)

	slot8 = self._unit
	slot7 = self._hed.range

	pen.sphere(Draw, pen, self._unit.position(self._hed.range))

	return 
end
function ExplosionDamageUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "The range the explosion should reach"

	self._build_value_number(slot4, self, panel, panel_sizer, "range", {
		floats = 0,
		min = 0
	})

	slot10 = "The damage from the explosion"

	self._build_value_number(slot4, self, panel, panel_sizer, "damage", {
		min = 0,
		floats = 0,
		max = 100
	})

	return 
end

return 
