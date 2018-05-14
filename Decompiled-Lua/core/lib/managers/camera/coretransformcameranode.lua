slot3 = "CoreTransformCameraNode"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreMath"

core.import(slot1, core)

local mvector3_add = mvector3.add
local mvector3_sub = mvector3.subtract
local mvector3_set = mvector3.set
local mvector3_rotate_with = mvector3.rotate_with
local mrotation_set_zero = mrotation.set_zero
local mrotation_mul = mrotation.multiply
TransformCameraNode = TransformCameraNode or CoreClass.class()
TransformCameraNode.init = function (self, settings)
	self._child = nil
	self._parent_camera = nil
	self._local_position = settings.position
	self._local_rotation = settings.rotation
	self._local_fov = settings.fov
	self._local_dof_near_min = settings.dof_near_min
	self._local_dof_near_max = settings.dof_near_max
	self._local_dof_far_min = settings.dof_far_min
	self._local_dof_far_max = settings.dof_far_max
	self._local_dof_amount = settings.dof_amount
	slot6 = 0
	self._position = Vector3(slot3, 0, 0)
	self._rotation = Rotation()
	self._name = settings.name
	self._settings = settings

	return 
end
TransformCameraNode.compile_settings = function (xml_node, settings)
	slot5 = "name"

	if xml_node.has_parameter(slot3, xml_node) then
		slot5 = "name"
		settings.name = xml_node.parameter(slot3, xml_node)
	end

	slot5 = "position"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "position"
		settings.position = CoreMath.string_to_vector(xml_node.parameter(slot5, xml_node))
	else
		slot6 = 0
		settings.position = Vector3(slot3, 0, 0)
	end

	slot5 = "rotation"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "rotation"
		settings.rotation = CoreMath.string_to_rotation(xml_node.parameter(slot5, xml_node))
	else
		settings.rotation = Rotation()
	end

	slot5 = "fov"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "fov"
		settings.fov = tonumber(xml_node.parameter(slot5, xml_node))
	else
		settings.fov = 0
	end

	slot5 = "dof_near_min"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "dof_near_min"
		settings.dof_near_min = tonumber(xml_node.parameter(slot5, xml_node))
	else
		settings.dof_near_min = 0
	end

	slot5 = "dof_near_max"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "dof_near_max"
		settings.dof_near_max = tonumber(xml_node.parameter(slot5, xml_node))
	else
		settings.dof_near_max = 0
	end

	slot5 = "dof_far_min"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "dof_far_min"
		settings.dof_far_min = tonumber(xml_node.parameter(slot5, xml_node))
	else
		settings.dof_far_min = 0
	end

	slot5 = "dof_far_max"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "dof_far_max"
		settings.dof_far_max = tonumber(xml_node.parameter(slot5, xml_node))
	else
		settings.dof_far_max = 0
	end

	slot5 = "dof_amount"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "dof_amount"
		settings.dof_amount = tonumber(xml_node.parameter(slot5, xml_node))
	else
		settings.dof_amount = 0
	end

	return 
end
TransformCameraNode.destroy = function (self)
	self._child = nil
	self._parent_camera = nil

	return 
end
TransformCameraNode.name = function (self)
	return self._name
end
TransformCameraNode.set_parent = function (self, camera)
	camera._child = self
	self._parent_camera = camera

	return 
end
TransformCameraNode.child = function (self)
	return self._child
end
TransformCameraNode.set_local_position = function (self, position)
	self._local_position = position

	return 
end
TransformCameraNode.set_local_rotation = function (self, rotation)
	self._local_rotation = rotation

	return 
end
TransformCameraNode.set_local_position_from_world_position = function (self, position)
	local parent_camera = self._parent_camera

	if parent_camera then
		local parent_position = parent_camera.position(slot4)
		local parent_rotation = parent_camera.rotation(parent_camera)
		slot8 = position

		mvector3_set(parent_camera, self._local_position)

		slot7 = self._local_position
		slot10 = parent_camera

		mvector3_sub(parent_camera, parent_camera.position(slot9))

		slot7 = self._local_position
		slot10 = parent_camera
		slot10 = parent_camera.rotation(slot9)

		mvector3_rotate_with(parent_camera, parent_camera.rotation(slot9).inverse(slot9))
	else
		slot6 = position

		mvector3_set(slot4, self._local_position)
	end

	return 
end
TransformCameraNode.set_local_rotation_from_world_rotation = function (self, rotation)
	local parent_camera = self._parent_camera

	if parent_camera then
		local parent_rotation = parent_camera.rotation(slot4)
		slot6 = parent_rotation
		self._local_rotation = parent_rotation.inverse(parent_camera) * rotation
	else
		self._local_rotation = rotation
	end

	return 
end
TransformCameraNode.position = function (self)
	return self._position
end
TransformCameraNode.rotation = function (self)
	return self._rotation
end
TransformCameraNode.local_position = function (self)
	return self._local_position
end
TransformCameraNode.local_rotation = function (self)
	return self._local_rotation
end
TransformCameraNode.update = function (self, t, dt, in_data, out_data)
	if self._pivot_position then
		slot8 = self._pivot_position

		out_data.set_pivot_position(slot6, out_data)
	end

	if self._pivot_rotation then
		slot8 = self._pivot_rotation

		out_data.set_pivot_rotation(slot6, out_data)
	end

	slot8 = self._local_position

	out_data.set_position(slot6, out_data)

	slot8 = self._local_rotation

	out_data.set_rotation(slot6, out_data)

	slot8 = self._local_fov

	out_data.set_fov(slot6, out_data)

	slot12 = self._local_dof_far_max

	out_data.set_dof(slot6, out_data, self._local_dof_amount, self._local_dof_near_min, self._local_dof_near_max, self._local_dof_far_min)

	return 
end
TransformCameraNode.debug_render = function (self, t, dt)
	slot11 = 0
	local x_pen = Draw.pen(slot4, Color(slot7, 0.05, 1, 0))
	slot12 = 0
	local y_pen = Draw.pen(Draw, Color(0.05, 0.05, 0, 1))
	slot7 = Draw
	local z_pen = Draw.pen(Draw, Color(0.05, 0.05, 0, 0))
	local position = self._position
	local rotation = self._rotation
	slot14 = rotation
	slot12 = position + rotation.x(1) * 2

	x_pen.line(0.05, x_pen, position)

	slot14 = rotation
	slot12 = position + rotation.y(1) * 2

	y_pen.line(0.05, y_pen, position)

	slot14 = rotation

	z_pen.line(0.05, z_pen, position)

	slot16 = 1
	local brush = Draw.brush(0.05, Color(position + rotation.z(1) * 2, 0.3, 1, 1))
	slot13 = 1

	brush.sphere(Draw, brush, position)

	return 
end
TransformCameraNode.parent_camera = function (self)
	return self._parent_camera
end

return 
