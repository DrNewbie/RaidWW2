slot3 = "CoreSpringCameraNode"

core.module(slot1, core)

slot3 = "CoreTransformCameraNode"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreMath"

core.import(slot1, core)

local mvector3_add = mvector3.add
local mvector3_sub = mvector3.subtract
local mvector3_mul = mvector3.multiply
local mvector3_neg = mvector3.negate
local mvector3_set_zero = mvector3.set_zero
local mvector3_set = mvector3.set
local mvector3_set_static = mvector3.set_static
local mvector3_copy = mvector3.copy
local mvector3_rotate_with = mvector3.rotate_with

if not SpringCameraNode then
	slot11 = CoreTransformCameraNode.TransformCameraNode
	slot9 = CoreClass.class(slot10)
end

SpringCameraNode = slot9
SpringCameraNode.init = function (self, settings)
	slot5 = settings

	SpringCameraNode.super.init(slot3, self)

	slot6 = 0
	self._force = Vector3(slot3, 0, 0)
	self._spring = settings.spring
	self._max_displacement = settings.max_displacement
	self._damping = settings.damping
	self._force_scale = settings.force_scale
	slot4 = settings.force_applicant
	self._force_applicant = settings.force_applicant.new(slot3)
	self._integrator_func = settings.integrator_func
	slot4 = self

	self.reset(slot3)

	return 
end
SpringCameraNode.compile_settings = function (xml_node, settings)
	slot5 = settings

	SpringCameraNode.super.compile_settings(slot3, xml_node)

	slot5 = "spring"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "spring"
		settings.spring = math.string_to_vector(xml_node.parameter(slot5, xml_node))
	end

	slot5 = "max_displacement"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "max_displacement"
		settings.max_displacement = math.string_to_vector(xml_node.parameter(slot5, xml_node))
	end

	slot5 = "damping"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "damping"
		settings.damping = math.string_to_vector(xml_node.parameter(slot5, xml_node))
	end

	slot5 = "force_scale"

	if xml_node.has_parameter(slot3, xml_node) then
		slot7 = "force_scale"
		settings.force_scale = math.string_to_vector(xml_node.parameter(slot5, xml_node))
	end

	slot5 = "force"

	if xml_node.has_parameter(slot3, xml_node) then
		slot5 = "force"
		local force = xml_node.parameter(slot3, xml_node)

		if force == "acceleration" then
			settings.force_applicant = SpringCameraAcceleration
		elseif force == "velocity" then
			settings.force_applicant = SpringCameraVelocity
		elseif force == "position" then
			settings.force_applicant = SpringCameraPosition
		end
	else
		settings.force_applicant = SpringCameraPosition
	end

	slot5 = "integrator"

	if xml_node.has_parameter(slot3, xml_node) then
		slot5 = "integrator"
		local integrator = xml_node.parameter(slot3, xml_node)

		if integrator == "euler" then
			settings.integrator_func = SpringCameraNode.euler_integration
		elseif integrator == "rk2" then
			settings.integrator_func = SpringCameraNode.rk2_integration
		elseif integrator == "rk4" then
			settings.integrator_func = SpringCameraNode.rk4_integration
		end
	else
		settings.integrator_func = SpringCameraNode.rk2_integration
	end

	return 
end
SpringCameraNode.acceleration = function (self, displacement, velocity, force)
	local spring = self._spring
	local damping = self._damping
	slot10 = -(displacement.z * spring.z) - damping.z * velocity.z + force.z

	return Vector3(slot7, -(displacement.x * spring.x) - damping.x * velocity.x + force.x, -(displacement.y * spring.y) - damping.y * velocity.y + force.y)
end
SpringCameraNode.euler_integration = function (self, dt, force)
	local displacement = self._displacement
	local velocity = self._velocity
	slot10 = force
	local a1 = self.acceleration(slot6, self, displacement, velocity)
	self._displacement = velocity + a1 * dt
	self._velocity = self._displacement + velocity * dt + 0.5 * a1 * dt * dt

	return 
end
SpringCameraNode.rk2_integration = function (self, dt, force)
	local xf = self._displacement
	local vf = self._velocity
	local x1 = mvector3.copy(slot6)
	local v1 = mvector3.copy(xf)
	local x2 = mvector3.copy(vf)
	slot11 = 0.5 * dt

	mvector3_mul(v1, x2)

	slot11 = x1

	mvector3_add(v1, x2)

	slot13 = force
	local a = self.acceleration(v1, self, x1, v1)
	local v2 = mvector3.copy(self)
	slot13 = 0.5 * dt

	mvector3_mul(a, v2)

	slot13 = v1

	mvector3_add(a, v2)

	slot13 = v2

	mvector3_set(a, xf)

	slot13 = dt

	mvector3_mul(a, xf)

	slot13 = x1

	mvector3_add(a, xf)

	slot12 = a
	slot18 = force

	mvector3_set(a, self.acceleration(slot14, self, x2, v2))

	slot13 = a

	mvector3_set(a, vf)

	slot13 = dt

	mvector3_mul(a, vf)

	slot13 = v1

	mvector3_add(a, vf)

	return 
end
SpringCameraNode.rk4_integration = function (self, dt, force)
	local x1 = self._displacement
	local v1 = self._velocity
	slot10 = force
	local a1 = self.acceleration(slot6, self, x1, v1)
	local x2 = x1 + 0.5 * v1 * dt
	local v2 = v1 + 0.5 * a1 * dt
	slot13 = force
	local a2 = self.acceleration(v1, self, x2, v2)
	local x3 = x1 + 0.5 * v2 * dt
	local v3 = v1 + 0.5 * a2 * dt
	slot16 = force
	local a3 = self.acceleration(v2, self, x3, v3)
	local x4 = x1 + v3 * dt
	local v4 = v1 + a3 * dt
	slot19 = force
	local a4 = self.acceleration(v3, self, x4, v4)
	local xf = x1 + dt / 6 * (v1 + 2 * v2 + 2 * v3 + v4)
	local vf = v1 + dt / 6 * (a1 + 2 * a2 + 2 * a3 + a4)
	self._displacement = xf
	self._velocity = vf

	return 
end
SpringCameraNode.update = function (self, t, dt, in_data, out_data)
	local displacement = self._displacement
	local max_displacement = self._max_displacement
	local force = self._force
	local force_scale = self._force_scale
	slot16 = in_data._rotation

	self._force_applicant.force(slot10, self._force_applicant, t, dt, force, in_data._position)

	slot14 = force.z * force_scale.z

	mvector3_set_static(slot10, force, force.x * force_scale.x, force.y * force_scale.y)
	self._integrator_func(slot10, self, dt)

	slot16 = max_displacement.x
	slot17 = max_displacement.y
	slot13 = math.clamp(displacement.x, displacement.y, -max_displacement.y)
	slot18 = max_displacement.z

	mvector3_set_static(slot10, displacement, math.clamp(force, displacement.x, -max_displacement.x), math.clamp(displacement.y, displacement.z, -max_displacement.z))

	slot12 = displacement

	mvector3_set(slot10, self._local_position)

	slot15 = out_data

	SpringCameraNode.super.update(slot10, self, t, dt, in_data)

	return 
end
SpringCameraNode.reset = function (self)
	slot5 = 0
	self._velocity = Vector3(slot2, 0, 0)
	slot5 = 0
	self._displacement = Vector3(slot2, 0, 0)

	if self._force_applicant then
		slot3 = self._force_applicant

		self._force_applicant.reset(slot2)
	end

	return 
end
SpringCameraNode.debug_render = function (self, t, dt)
	SpringCameraNode.super.debug_render(slot4, self, t)

	slot11 = 0
	local start_brush = Draw.brush(slot4, Color(dt, 0.3, 1, 0))
	slot12 = 0
	local end_brush = Draw.brush(Draw, Color(0.3, 0.3, 0, 1))
	slot7 = Draw
	slot13 = 1
	local line_pen = Draw.pen(Draw, Color(0.3, 0.3, 0, 0))
	local parent_position = nil
	slot12 = self
	slot12 = self.parent_camera(0)

	start_brush.sphere(Color, start_brush, self.parent_camera(0).position(0))

	slot12 = self

	end_brush.sphere(Color, end_brush, self.position(1))

	slot12 = self
	slot10 = self.parent_camera(1).position(1)
	slot13 = self

	line_pen.line(Color, line_pen, self.position(self.parent_camera(1)))

	slot15 = 1
	local line_pen2 = Draw.pen(Color, Color(self.position, 0.3, 1, 0))
	slot15 = self._force
	slot18 = self
	slot12 = self.position(self) + self._force.rotate_with(self, self.rotation(slot17))

	line_pen2.line(Draw, line_pen2, self.position(0.3))

	return 
end
SpringCameraForce = SpringCameraForce or CoreClass.class()
SpringCameraForce.init = function (self)
	return 
end
SpringCameraForce.force = function (self, t, dt, force, parent_position, parent_rotation)
	return 
end
SpringCameraForce.reset = function (self)
	return 
end

if not SpringCameraPosition then
	slot11 = SpringCameraForce
	slot9 = CoreClass.class(slot10)
end

SpringCameraPosition = slot9
SpringCameraPosition.init = function (self)
	slot3 = self

	self.reset(slot2)

	return 
end
SpringCameraPosition.force = function (self, t, dt, force, parent_position, parent_rotation)
	if not self._reset then
		slot9 = parent_position

		mvector3_set(slot7, force)

		slot9 = self._previous_parent_position

		mvector3_sub(slot7, force)

		slot8 = force
		slot11 = parent_rotation

		mvector3_rotate_with(slot7, parent_rotation.inverse(slot10))

		slot8 = force

		mvector3_neg(slot7)
	else
		slot8 = force

		mvector3_set_zero(slot7)

		self._reset = false
	end

	slot9 = parent_position

	mvector3_set(slot7, self._previous_parent_position)

	return 
end
SpringCameraPosition.reset = function (self)
	self._reset = true
	slot5 = 0
	self._previous_parent_position = Vector3(slot2, 0, 0)

	return 
end

if not SpringCameraVelocity then
	slot11 = SpringCameraForce
	slot9 = CoreClass.class(slot10)
end

SpringCameraVelocity = slot9
SpringCameraVelocity.init = function (self)
	slot3 = self

	self.reset(slot2)

	return 
end
SpringCameraVelocity.force = function (self, t, dt, force, parent_position, parent_rotation)
	if not self._reset then
		slot9 = parent_position

		mvector3_set(slot7, force)

		slot9 = self._previous_parent_position

		mvector3_sub(slot7, force)

		slot9 = 1 / dt

		mvector3_mul(slot7, force)

		local velocity = mvector3_copy(slot7)
		slot10 = self._velocity

		mvector3_sub(force, force)

		slot10 = velocity

		mvector3_set(force, self._velocity)

		slot9 = force
		slot12 = parent_rotation

		mvector3_rotate_with(force, parent_rotation.inverse(slot11))

		slot9 = force

		mvector3_neg(force)
	else
		slot8 = force

		mvector3_set_zero(slot7)

		slot8 = self._velocity

		mvector3_set_zero(slot7)

		self._reset = false
	end

	slot9 = parent_position

	mvector3_set(slot7, self._previous_parent_position)

	return 
end
SpringCameraVelocity.reset = function (self)
	self._reset = true
	slot5 = 0
	self._velocity = Vector3(slot2, 0, 0)
	slot5 = 0
	self._previous_parent_position = Vector3(slot2, 0, 0)

	return 
end

if not SpringCameraAcceleration then
	slot11 = SpringCameraForce
	slot9 = CoreClass.class(slot10)
end

SpringCameraAcceleration = slot9
SpringCameraAcceleration.init = function (self)
	slot3 = self

	self.reset(slot2)

	return 
end
SpringCameraAcceleration.force = function (self, t, dt, force, parent_position, parent_rotation)
	if not self._reset then
		slot9 = parent_position

		mvector3_set(slot7, force)

		slot9 = self._previous_parent_position

		mvector3_sub(slot7, force)

		slot9 = 1 / dt

		mvector3_mul(slot7, force)

		local velocity = mvector3_copy(slot7)
		slot10 = self._velocity

		mvector3_sub(force, force)

		slot10 = 1 / dt

		mvector3_mul(force, force)

		slot10 = velocity

		mvector3_set(force, self._velocity)

		slot9 = force
		slot12 = parent_rotation

		mvector3_rotate_with(force, parent_rotation.inverse(slot11))

		slot9 = force

		mvector3_neg(force)
	else
		slot8 = force

		mvector3_set_zero(slot7)

		slot8 = self._velocity

		mvector3_set_zero(slot7)

		self._reset = false
	end

	slot9 = parent_position

	mvector3_set(slot7, self._previous_parent_position)

	return 
end
SpringCameraAcceleration.reset = function (self)
	self._reset = true
	slot5 = 0
	self._velocity = Vector3(slot2, 0, 0)
	slot5 = 0
	self._previous_parent_position = Vector3(slot2, 0, 0)

	return 
end

return 
