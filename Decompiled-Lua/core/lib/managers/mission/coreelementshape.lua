-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local tmp_vec1 = Vector3()
slot4 = "CoreElementShape"

core.module(slot2, core)

slot4 = "CoreShapeManager"

core.import(slot2, core)

slot4 = "CoreMissionScriptElement"

core.import(slot2, core)

slot4 = "CoreTable"

core.import(slot2, core)

if not ElementShape then
	slot3 = CoreMissionScriptElement.MissionScriptElement
	slot1 = class(slot2)
end

ElementShape = slot1
function ElementShape:init(...)
	slot3 = self

	ElementShape.super.init(slot2, ...)

	self._shapes = {}

	if not self._values.shape_type or self._values.shape_type == "box" then
		slot3 = self
		slot7 = {
			position = self._values.position,
			rotation = self._values.rotation,
			width = self._values.width,
			depth = self._values.depth,
			height = self._values.height
		}

		self._add_shape(slot2, CoreShapeManager.ShapeBoxMiddle.new(slot5, CoreShapeManager.ShapeBoxMiddle))
	elseif self._values.shape_type == "cylinder" then
		slot3 = self
		slot7 = {
			position = self._values.position,
			rotation = self._values.rotation,
			height = self._values.height,
			radius = self._values.radius
		}

		self._add_shape(slot2, CoreShapeManager.ShapeCylinderMiddle.new(slot5, CoreShapeManager.ShapeCylinderMiddle))
	elseif self._values.shape_type == "unit" then
		self._shape_units = {}
		slot3 = self._values.unit_ids

		for _, id in ipairs(slot2) do

			-- Decompilation error in this vicinity:
			slot8 = Application
			slot10 = unit

			table.insert(slot8, self._shape_units)
		end
	end

	return 
end
function ElementShape:on_script_activated()
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementShape:_add_shape(shape)
	slot5 = shape

	table.insert(slot3, self._shapes)

	return 
end
function ElementShape:get_shapes()
	return self._shapes
end
function ElementShape:is_inside(pos)
	slot4 = self._shapes

	for _, shape in ipairs(slot3) do
		slot10 = pos

		if shape.is_inside(slot8, shape) then
			return true
		end
	end

	if self._shape_units then
		slot4 = self._shape_units

		for _, unit in ipairs(slot3) do
			slot9 = unit
			local data = unit.unit_data(slot8)
			local oobb = nil

			if data and data._object_oobb then
				slot14 = data._object_oobb
				local object = unit.get_object(slot10, Idstring(slot13))
				slot12 = object
				oobb = object.oobb(unit)
			else
				slot11 = unit
				oobb = unit.oobb(slot10)
			end

			local grow = self._values.grow or 0
			slot13 = grow

			oobb.grow(slot11, oobb)

			slot13 = pos

			if oobb.point_inside(slot11, oobb) then
				return true
			end
		end
	end

	return false
end
function ElementShape:client_on_executed(...)
	return 
end
function ElementShape:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementShape.super.on_executed(slot3, self)

	return 
end

return 
