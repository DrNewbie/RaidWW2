VehicleCamera = VehicleCamera or class()
function VehicleCamera:init(unit)
	self._unit = unit
	slot4 = World
	self._camera = World.create_camera(slot3)
	self._default_fov = 80
	slot5 = self._default_fov

	self._camera.set_fov(slot3, self._camera)

	slot5 = managers.viewport.CAMERA_NEAR_RANGE

	self._camera.set_near_range(slot3, self._camera)

	slot5 = managers.viewport.CAMERA_FAR_RANGE

	self._camera.set_far_range(slot3, self._camera)

	return 
end
function VehicleCamera:setup()
	slot3 = managers.viewport
	self._viewport = managers.viewport.first_active_viewport(slot2)
	slot3 = self._viewport
	self._director = self._viewport.director(slot2)
	slot3 = self._viewport
	self._on_foot_camera = self._viewport.camera(slot2)
	slot3 = self._director
	self._on_foot_camera_controller = self._director.camera(slot2)
	slot4 = self._camera
	slot7 = "vehicle_camera"
	self._camera_controller = self._director.make_camera(slot2, self._director, Idstring(slot6))
	slot4 = self._camera

	self._director.position_as(slot2, self._director)

	self._camera_list = {}
	slot1 = ipairs
	slot3 = self._camera_object_names or {}

	for _, object_name in slot1(slot2) do
		slot8 = self._camera_list
		slot11 = self._unit
		slot14 = object_name

		table.insert(slot7, self._unit.get_object(slot10, Idstring(slot13)))
	end

	if self._back_camera_object_name then
		slot3 = self._unit
		slot6 = self._back_camera_object_name
		self._back_camera_object = self._unit.get_object(slot2, Idstring(slot5))
	end

	if 0 < #self._camera_list then
		slot4 = self._camera_list[1]

		self._camera_controller.set_both(slot2, self._camera_controller)
	end

	return 
end
function VehicleCamera:_setup_sound_listener()
	slot8 = false
	self._listener_id = managers.listener.add_listener(slot2, managers.listener, "access_camera", self._camera, self._camera, nil)
	slot5 = {
		"access_camera"
	}

	managers.listener.add_set(slot2, managers.listener, "access_camera")

	slot5 = "access_camera"
	self._listener_activation_id = managers.listener.activate_set(slot2, managers.listener, "main")
	slot4 = {
		primary = true,
		active = true,
		object = self._unit.orientation_object(self._camera)
	}
	slot7 = self._unit
	self._sound_check_object = managers.sound_environment.add_check_object(slot2, managers.sound_environment)

	return 
end
local pos = Vector3()
local target = Vector3()
function VehicleCamera:update_camera()
	if not self._active then
		return 
	end

	slot3 = self._unit
	slot4 = self._active_camera_object
	local rot = self._unit.vehicle(slot2).object_rotation(slot2, self._unit.vehicle(slot2))
	slot4 = pos
	slot7 = self._unit
	slot8 = self._active_camera_object

	mvector3.set(self._unit.vehicle(slot2), self._unit.vehicle(slot6).object_position(slot6, self._unit.vehicle(slot6)))

	slot5 = pos

	self._camera_controller.set_camera(self._unit.vehicle(slot2), self._camera_controller)

	slot5 = target

	mrotation.y(self._unit.vehicle(slot2), rot)

	slot5 = 100

	mvector3.multiply(self._unit.vehicle(slot2), target)

	slot5 = pos

	mvector3.add(self._unit.vehicle(slot2), target)

	slot5 = target

	self._camera_controller.set_target(self._unit.vehicle(slot2), self._camera_controller)

	slot5 = target

	mrotation.z(self._unit.vehicle(slot2), rot)

	slot5 = target

	self._camera_controller.set_default_up(self._unit.vehicle(slot2), self._camera_controller)

	return 
end
function VehicleCamera:activate(player_unit)
	self._active = true

	if self._viewport then
		slot4 = self._viewport

		if self._viewport.name(slot3) == "playernil" then
			slot5 = self._camera

			self._viewport.set_camera(slot3, self._viewport)

			slot5 = self._camera_controller

			self._director.set_camera(slot3, self._director)
		end
	end

	slot4 = player_unit

	if alive(slot3) then
		slot4 = player_unit
		slot5 = self._camera

		player_unit.camera(slot3).set_listener_object(slot3, player_unit.camera(slot3))
	end

	return 
end
function VehicleCamera:deactivate(player_unit)
	self._active = false
	self._rear_cam_active = false

	if self._viewport then
		slot4 = self._viewport

		if self._viewport.name(slot3) == "playernil" then
			slot5 = self._on_foot_camera

			self._viewport.set_camera(slot3, self._viewport)

			slot5 = self._on_foot_camera_controller

			self._director.set_camera(slot3, self._director)
		end
	end

	slot4 = player_unit

	if alive(slot3) then
		slot4 = player_unit
		slot4 = player_unit.camera(slot3)

		player_unit.camera(slot3).set_default_listener_object(slot3)
	end

	return 
end
function VehicleCamera:show_next(player_unit)
	if #self._camera_list == 0 then
		return 
	end

	if not self._active then
		self._camera_list_i = 1
		self._active_camera_object = self._camera_list[self._camera_list_i]
		slot5 = player_unit

		self.activate(self._camera_list_i, self)
	elseif #self._camera_list <= self._camera_list_i then
		slot5 = player_unit

		self.deactivate(slot3, self)
	else
		self._camera_list_i = self._camera_list_i + 1
		self._active_camera_object = self._camera_list[self._camera_list_i]
	end

	return 
end
function VehicleCamera:set_rear_cam_active(active, player_unit)
	if not self._back_camera_object then
		return 
	end

	if self._rear_cam_active == active then
		return 
	end

	self._rear_cam_active = active

	if active then
		if self._active then
			self._old_active_camera_object = self._active_camera_object
		end

		self._active_camera_object = self._back_camera_object
		slot6 = player_unit

		self.activate(slot4, self)
	elseif self._old_active_camera_object then
		self._active_camera_object = self._old_active_camera_object
		self._old_active_camera_object = nil
	else
		slot6 = player_unit

		self.deactivate(slot4, self)
	end

	return 
end
function VehicleCamera:rear_cam_active()
	return self._rear_cam_active
end
function VehicleCamera:destroy()
	slot3 = self._camera

	if alive(slot2) then
		slot4 = self._camera

		World.delete_camera(slot2, World)

		self._camera = nil
	end

	if self._listener_id then
		slot4 = self._sound_check_object

		managers.sound_environment.remove_check_object(slot2, managers.sound_environment)

		slot4 = self._listener_id

		managers.listener.remove_listener(slot2, managers.listener)

		slot4 = "access_camera"

		managers.listener.remove_set(slot2, managers.listener)

		self._listener_id = nil
	end

	return 
end

return 
