CubeMapCreator = CubeMapCreator or class()
function CubeMapCreator:init()
	slot3 = World
	self._camera = World.create_camera(slot2)
	slot7 = 1
	self._vp = Application.create_world_viewport(slot2, Application, 0, 0, 1)
	slot4 = self._camera

	self._vp.set_camera(slot2, self._vp)

	slot4 = 90

	self._camera.set_fov(slot2, self._camera)

	slot4 = 1

	self._camera.set_aspect_ratio(slot2, self._camera)

	slot4 = 20

	self._camera.set_near_range(slot2, self._camera)

	slot4 = 100000

	self._camera.set_far_range(slot2, self._camera)

	self._creating_cube_map = false

	return 
end
function CubeMapCreator:destroy()
	if self._vp then
		slot4 = self._vp

		Application.destroy_viewport(slot2, Application)

		self._vp = nil
	end

	return 
end
function CubeMapCreator:set_camera_rot(rot)
	local yaw = rot.yaw(slot3)
	local pitch = rot.pitch(rot)
	slot6 = self._camera
	slot11 = 0

	self._camera.set_rotation(rot, Rotation(slot8, yaw, pitch))

	return 
end
function CubeMapCreator:render()
	if self._creating_cube_map then
		self._creating_cube_map = false
		slot3 = self

		self.create_cube_map(slot2)
	end

	return 
end
function CubeMapCreator:start_cube_map(pos)
	slot5 = pos

	self._camera.set_position(slot3, self._camera)

	self._creating_cube_map = true

	return 
end
function CubeMapCreator:create_cube_map()
	slot6 = 512
	local ypos = Application.create_texture(slot2, Application, "render_target", 512)
	slot7 = 512
	local xneg = Application.create_texture(Application, Application, "render_target", 512)
	slot8 = 512
	local yneg = Application.create_texture(Application, Application, "render_target", 512)
	slot9 = 512
	local xpos = Application.create_texture(Application, Application, "render_target", 512)
	slot10 = 512
	local zpos = Application.create_texture(Application, Application, "render_target", 512)
	local zneg = Application.create_texture(Application, Application, "render_target", 512)
	slot9 = self
	slot16 = 0
	slot12 = Vector3(slot13, 0, 1)
	slot17 = 1

	self.set_camera_rot(Application, Rotation(512, Vector3(0, 0, 0)))

	slot12 = ypos

	Application.render(Application, Application, "World", self._vp)

	slot9 = self
	slot16 = 0
	slot12 = Vector3(Vector3, -1, 0)
	slot17 = 1

	self.set_camera_rot(Application, Rotation(self._vp, Vector3(-1, 0, 0)))

	slot12 = xneg

	Application.render(Application, Application, "World", self._vp)

	slot9 = self
	slot16 = 0
	slot12 = Vector3(Vector3, 0, -1)
	slot17 = 1

	self.set_camera_rot(Application, Rotation(self._vp, Vector3(0, 0, 0)))

	slot12 = yneg

	Application.render(Application, Application, "World", self._vp)

	slot9 = self
	slot16 = 0
	slot12 = Vector3(Vector3, 1, 0)
	slot17 = 1

	self.set_camera_rot(Application, Rotation(self._vp, Vector3(1, 0, 0)))

	slot12 = xpos

	Application.render(Application, Application, "World", self._vp)

	slot9 = self
	slot16 = 1
	slot12 = Vector3(Vector3, 0, 0)
	slot17 = 0

	self.set_camera_rot(Application, Rotation(self._vp, Vector3(0, 1, 0)))

	slot12 = zpos

	Application.render(Application, Application, "World", self._vp)

	slot9 = self
	slot16 = -1
	slot12 = Vector3(Vector3, 0, 0)
	slot17 = 0

	self.set_camera_rot(Application, Rotation(self._vp, Vector3(0, 1, 0)))

	slot12 = zneg

	Application.render(Application, Application, "World", self._vp)

	return 
end

return 
