slot3 = "CoreCameraMixer"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

local mvector3_add = mvector3.add
local mvector3_sub = mvector3.subtract
local mvector3_mul = mvector3.multiply
local mvector3_set = mvector3.set
local mvector3_copy = mvector3.copy
local mrotation_mul = mrotation.multiply
local mrotation_slerp = mrotation.slerp
local mrotation_set_zero = mrotation.set_zero

local function safe_divide(a, b)
	if b == 0 then
		return 1
	end

	return a / b
end

CameraMixer = CameraMixer or CoreClass.class()
function CameraMixer:init(name)
	self._name = name
	self._cameras = {}

	return 
end
function CameraMixer:destroy()
	slot3 = self._cameras

	for index, camera in ipairs(slot2) do
		slot8 = camera.camera

		camera.camera.destroy(slot7)
	end

	self._cameras = {}

	return 
end
function CameraMixer:add_camera(camera, blend_time)
	slot6 = {
		time = 0,
		camera = camera,
		blend_time = blend_time
	}

	table.insert(slot4, self._cameras)

	return 
end
function CameraMixer:stop()
	slot3 = self._cameras

	for index, camera in ipairs(slot2) do
		slot8 = camera.camera

		camera.camera.destroy(slot7)
	end

	self._cameras = {}

	return 
end
function CameraMixer:update(cud, cud_class, time, dt)
	slot7 = self._cameras

	for index, camera in ipairs(slot6) do
		local _camera = camera.camera
		slot14 = cud
		local cam_data = cud_class.new(slot12, cud_class)
		slot14 = _camera._nodes

		for _, cam in ipairs(cud_class) do
			local local_cam_data = cud_class.new(slot18)
			slot24 = local_cam_data

			cam.update(cud_class, cam, time, dt, cam_data)

			slot21 = local_cam_data

			cam_data.transform_with(cud_class, cam_data)

			slot21 = cam_data._position

			mvector3_set(cud_class, cam._position)

			slot20 = cam._rotation

			mrotation_set_zero(cud_class)

			slot21 = cam_data._rotation

			mrotation_mul(cud_class, cam._rotation)
		end

		camera.cam_data = cam_data
	end

	local full_blend_index = 1
	slot8 = self._cameras

	for index, _camera in ipairs(slot7) do
		_camera.time = _camera.time + dt
		local factor = nil

		if 1 < index then
			slot19 = _camera.blend_time
			slot18 = 1
			slot14 = math.clamp(slot15, safe_divide(slot17, _camera.time), 0) * 90
			factor = math.sin(slot13)
		else
			factor = 1
		end

		slot16 = factor

		cud.interpolate_to_target(slot13, cud, _camera.cam_data)

		if 1 <= factor then
			full_blend_index = index
		end
	end

	for i = 1, full_blend_index - 1, 1 do
		slot12 = self._cameras[1].camera

		self._cameras[1].camera.destroy(slot11)

		slot13 = 1

		table.remove(slot11, self._cameras)
	end

	slot8 = self._cameras

	for index, camera in ipairs(slot7) do
		slot13 = not camera.camera._destroyed

		assert(slot12)
	end

	return 
end
function CameraMixer:debug_render(t, dt)
	slot11 = 1
	local pen = Draw.pen(slot4, Color(slot7, 0.05, 0, 0))
	slot6 = self._cameras

	for _, camera in ipairs(Draw) do
		local cam = camera.camera
		local parent_node = nil
		slot13 = cam._nodes

		for _, node in ipairs(slot12) do
			slot20 = dt

			node.debug_render(slot17, node, t)

			if parent_node then
				slot20 = node._position

				pen.line(slot17, pen, parent_node._position)
			end

			parent_node = node
		end
	end

	return 
end
function CameraMixer:active_camera()
	local camera_count = #self._cameras

	if camera_count == 0 then
		return nil
	end

	return self._cameras[camera_count].camera
end
function CameraMixer:cameras()
	local cameras = {}
	slot4 = self._cameras

	for _, camera in ipairs(slot3) do
		slot10 = camera.camera

		table.insert(slot8, cameras)
	end

	return cameras
end

return 
