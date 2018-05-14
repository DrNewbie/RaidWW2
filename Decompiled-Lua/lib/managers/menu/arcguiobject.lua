ArcGuiObject = ArcGuiObject or class()
function ArcGuiObject:init(panel, config)
	self._panel = panel
	self._radius_inner = config.radius_inner or 10
	self._radius_outer = config.radius_outer or 20
	self._sides = config.sides or 10
	self._total = config.total or 1
	slot6 = config
	config.triangles = self._create_triangles(slot4, self)
	config.w = self._radius_outer * 2
	config.h = self._radius_outer * 2
	slot6 = config
	self._circle = self._panel.polygon(slot4, self._panel)

	return 
end
function ArcGuiObject:_create_triangles(config)
	local amount = (360 * (config.current or 1)) / (config.total or 1)
	local s = self._radius_outer
	local triangles = {}
	local step = 360 / self._sides

	for i = step, amount, step do
		slot14 = 0
		local mid = Vector3(slot11, self._radius_outer, self._radius_outer)
		slot19 = i - step
		slot18 = 0
		slot14 = mid + Vector3(slot15, math.sin(slot17) * self._radius_inner, -math.cos(i - step) * self._radius_inner)

		table.insert(self._radius_outer, triangles)

		slot19 = i
		slot18 = 0
		slot14 = mid + Vector3(slot15, math.sin(-math.cos(i - step) * self._radius_inner) * self._radius_outer, -math.cos(i) * self._radius_outer)

		table.insert(self._radius_outer, triangles)

		slot19 = i - step
		slot18 = 0
		slot14 = mid + Vector3(slot15, math.sin(-math.cos(i) * self._radius_outer) * self._radius_outer, -math.cos(i - step) * self._radius_outer)

		table.insert(self._radius_outer, triangles)

		slot19 = i - step
		slot18 = 0
		slot14 = mid + Vector3(slot15, math.sin(-math.cos(i - step) * self._radius_outer) * self._radius_inner, -math.cos(i - step) * self._radius_inner)

		table.insert(self._radius_outer, triangles)

		slot19 = i
		slot18 = 0
		slot14 = mid + Vector3(slot15, math.sin(-math.cos(i - step) * self._radius_inner) * self._radius_inner, -math.cos(i) * self._radius_inner)

		table.insert(self._radius_outer, triangles)

		slot19 = i
		slot18 = 0
		slot14 = mid + Vector3(slot15, math.sin(-math.cos(i) * self._radius_inner) * self._radius_outer, -math.cos(i) * self._radius_outer)

		table.insert(self._radius_outer, triangles)
	end

	return triangles
end
function ArcGuiObject:set_current(current)
	slot5 = {
		current = current,
		total = self._total
	}
	local triangles = self._create_triangles(slot3, self)
	slot5 = self._circle

	self._circle.clear(self)

	slot6 = triangles

	self._circle.add_triangles(self, self._circle)

	return 
end
function ArcGuiObject:set_position(x, y)
	slot7 = y

	self._circle.set_position(slot4, self._circle, x)

	return 
end
function ArcGuiObject:set_layer(layer)
	slot5 = layer

	self._circle.set_layer(slot3, self._circle)

	return 
end
function ArcGuiObject:layer()
	slot3 = self._circle

	return self._circle.layer(slot2)
end
function ArcGuiObject:remove()
	slot4 = self._circle

	self._panel.remove(slot2, self._panel)

	return 
end

return 
