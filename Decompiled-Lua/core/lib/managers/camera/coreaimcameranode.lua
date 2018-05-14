slot3 = "CoreAimCameraNode"

core.module(slot1, core)

slot3 = "CoreTransformCameraNode"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

local mvector3_add = mvector3.add
local mvector3_set = mvector3.set
local mvector3_copy = mvector3.copy
local mvector3_negate = mvector3.negate
local mvector3_rotate_with = mvector3.rotate_with
local mvector3_normalize = mvector3.normalize
local mrotation_set_zero = mrotation.set_zero
local mrotation_mul = mrotation.multiply
local mrotation_inv = mrotation.invert

if not AimCameraNode then
	slot11 = CoreTransformCameraNode.TransformCameraNode
	slot9 = CoreClass.class(slot10)
end

AimCameraNode = slot9
function AimCameraNode:init(settings)
	slot5 = settings

	AimCameraNode.super.init(slot3, self)

	self._pitch_offset = settings.pitch_offset

	return 
end
function AimCameraNode.compile_settings(xml_node, settings)
	slot5 = settings

	AimCameraNode.super.compile_settings(slot3, xml_node)

	slot5 = "pitch_offset"

	if xml_node.has_parameter(slot3, xml_node) then
		slot5 = "pitch_offset"
		settings.pitch_offset = xml_node.parameter(slot3, xml_node) == "true"
	else
		settings.pitch_offset = false
	end

	return 
end
function AimCameraNode:set_eye_target_position(position)
	self._eye_target_position = position

	return 
end
function AimCameraNode:update(t, dt, in_data, out_data)
	local eye_target_position = self._eye_target_position

	if not eye_target_position then
		return 
	end

	local parent_position = in_data.position(slot7)
	slot9 = in_data
	local parent_rotation = in_data.rotation(in_data)

	if self._pitch_offset then
		slot10 = self._local_position
		slot15 = parent_rotation

		mvector3_set(slot9, self._update_pitch_offset(slot12, self, parent_position))
	end

	local direction = mvector3_copy(slot9)
	slot12 = parent_rotation

	mvector3_rotate_with(self._local_position, direction)

	slot12 = parent_position

	mvector3_add(self._local_position, direction)

	slot11 = direction

	mvector3_negate(self._local_position)

	slot12 = eye_target_position

	mvector3_add(self._local_position, direction)

	slot11 = direction

	mvector3_normalize(self._local_position)

	slot11 = self._local_rotation

	mrotation_set_zero(self._local_position)

	slot12 = parent_rotation

	mrotation_mul(self._local_position, self._local_rotation)

	slot11 = self._local_rotation

	mrotation_inv(self._local_position)

	slot11 = self._local_rotation
	slot15 = math.UP

	mrotation_mul(self._local_position, Rotation(slot13, direction))

	slot14 = 10

	out_data.set_constraints(self._local_position, out_data, Rotation(), 10)

	slot15 = out_data

	AimCameraNode.super.update(self._local_position, self, t, dt, in_data)

	return 
end
function AimCameraNode:_update_pitch_offset(parent_position, parent_rotation)
	slot5 = self
	local current_position = parent_position + self.local_position(slot4).rotate_with(slot4, self.local_position(slot4))
	local current_position_to_eye_target = self._camera_data.eye_target_position - current_position
	slot7 = current_position_to_eye_target

	if 0 < current_position_to_eye_target.length(parent_rotation) then
		slot8 = parent_rotation.y(slot9)
		slot11 = parent_rotation
		local polar = current_position_to_eye_target.to_polar_with_reference(slot6, current_position_to_eye_target, parent_rotation.z(parent_rotation))
		local pitch = polar.pitch
		local yaw = polar.spin

		if pitch < 0 and -90 < pitch then
			local normalized_pitch = math.abs(slot9) / 90
			slot12 = 270 + normalized_pitch * 180
			local y_offset = -math.sign(pitch) * (math.sin(pitch) * 0.5 + 0.5) * 90
			slot14 = 0
			local offset = Vector3(pitch, 0, y_offset)
			slot13 = offset
			slot17 = yaw

			return offset.rotate_with(0, Rotation(slot15, math.UP))
		end
	end

	slot7 = self

	return self.local_position(slot6)
end

return 
