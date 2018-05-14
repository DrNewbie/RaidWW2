slot3 = "CoreCollisionCameraNode"

core.module(slot1, core)

slot3 = "CoreTransformCameraNode"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreMath"

core.import(slot1, core)

if not CollisionCameraNode then
	slot2 = CoreTransformCameraNode.TransformCameraNode
	slot0 = CoreClass.class(slot1)
end

CollisionCameraNode = slot0
CollisionCameraNode.init = function (self, settings)
	slot5 = settings

	CollisionCameraNode.super.init(slot3, self)

	self._pop_controller = SmootherPopController()
	self._update = CollisionCameraNode._update_smoother
	self._ignore_unit = settings.ignore_unit
	slot6 = settings.smooth_radius

	self._pop_controller.set_parameter(slot3, self._pop_controller, "smooth_radius")

	slot6 = settings.near_radius

	self._pop_controller.set_parameter(slot3, self._pop_controller, "near_radius")

	slot6 = settings.precision

	self._pop_controller.set_parameter(slot3, self._pop_controller, "precision")

	self._camera_distance = 10000
	self._camera_max_velocity = settings.max_velocity
	self._safe_position_var = settings.safe_position_var

	return 
end
CollisionCameraNode.set_unit = function (self, unit)
	self._unit = unit

	if self._ignore_unit then
		slot6 = {
			unit
		}

		self._pop_controller.set_parameter(slot3, self._pop_controller, "ignore_units")
	end

	return 
end
CollisionCameraNode.set_safe_position = function (self, position)
	self._safe_position = position

	return 
end
CollisionCameraNode.compile_settings = function (xml_node, settings)
	slot5 = settings

	CollisionCameraNode.super.compile_settings(slot3, xml_node)

	slot5 = "ignore_unit"

	if xml_node.has_parameter(slot3, xml_node) then
		slot5 = "ignore_unit"
		settings.ignore_unit = xml_node.parameter(slot3, xml_node) == "true"
	else
		settings.ignore_unit = true
	end

	slot5 = "smooth_radius"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "smooth_radius"
		settings.smooth_radius = tonumber(xml_node.parameter(slot5, xml_node))
	else
		settings.smooth_radius = 30
	end

	slot5 = "near_radius"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "near_radius"
		settings.near_radius = tonumber(xml_node.parameter(slot5, xml_node))
	else
		settings.near_radius = 5
	end

	slot5 = "precision"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "precision"
		settings.precision = tonumber(xml_node.parameter(slot5, xml_node))
	else
		settings.precision = 0.005
	end

	slot5 = "max_velocity"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "max_velocity"
		settings.max_velocity = tonumber(xml_node.parameter(slot5, xml_node))
	else
		settings.max_velocity = 300
	end

	return 
end
CollisionCameraNode.update = function (self, t, dt, in_data, out_data)
	slot11 = out_data

	self._update(slot6, self, t, dt, in_data)

	slot11 = out_data

	CollisionCameraNode.super.update(slot6, self, t, dt, in_data)

	return 
end
CollisionCameraNode._update_smoother = function (self, t, dt, in_data, out_data)
	local position = in_data._position
	local rotation = in_data._rotation
	local safe_position = self._safe_position
	slot12 = position
	local new_position = self._pop_controller.wanted_position(slot9, self._pop_controller, safe_position)
	slot11 = new_position - position
	slot14 = rotation
	self._local_position = new_position - position.rotate_with(self._pop_controller, rotation.inverse(slot13))

	return 
end
CollisionCameraNode._update_fast_smooth = function (self, t, dt, in_data, out_data)
	local position = in_data._position
	local rotation = in_data._rotation
	local safe_position = self._safe_position
	safe_position = safe_position or position
	local camera_direction = position - safe_position
	slot11 = camera_direction
	local camera_distance = camera_direction.length(slot10)

	if 0 < camera_distance then
		camera_direction = camera_direction * 1 / camera_distance
		slot14 = position
		local fraction = self._pop_controller.wanted_position(slot11, self._pop_controller, safe_position)
		local collision_distance = fraction * camera_distance
		local new_distance = nil

		if collision_distance < self._camera_distance then
			new_distance = collision_distance
		else
			slot17 = self._camera_max_velocity * dt
			local diff = math.clamp(slot14, collision_distance - self._camera_distance, 0)
			new_distance = self._camera_distance + diff
		end

		local new_position = safe_position + position - safe_position.normalized(slot14) * new_distance
		self._camera_distance = new_distance
		slot16 = new_position - position
		slot19 = rotation
		self._local_position = new_position - position.rotate_with(position - safe_position, rotation.inverse(slot18))
	else
		slot14 = 0
		self._local_position = Vector3(slot11, 0, 0)
	end

	return 
end
CollisionCameraNode.debug_render = function (self, t, dt)
	local safe_position = self._camera_data[self._safe_position_var]
	slot12 = 1
	local brush = Draw.brush(slot5, Color(slot8, 0.3, 1, 1))

	brush.sphere(Draw, brush, safe_position)

	slot13 = 0
	local brush2 = Draw.brush(Draw, Color(1, 0.3, 1, 0))
	slot10 = 1

	brush2.sphere(Draw, brush2, self._position)

	return 
end

return 
