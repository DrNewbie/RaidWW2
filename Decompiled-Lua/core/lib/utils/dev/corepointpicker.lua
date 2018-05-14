slot3 = "CorePointPicker"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

if not PointPicker then
	slot3 = CoreEvent.BasicEventHandling
	slot0 = CoreClass.mixin(slot1, CoreClass.class())
end

PointPicker = slot0
function PointPicker:init(viewport, slotmask)
	self.__viewport = viewport
	self.__enabled = false

	if not slotmask then
		slot25 = 39
		slot3 = World.make_slot_mask(slot4, World, 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 22, 23, 24, 26, 27, 30, 34, 37, 38)
	end

	self.__slotmask = slot3

	return 
end
function PointPicker:update(time, delta_time)
	if self.__enabled then
		local camera = self.__viewport.camera(slot4)
		slot6 = managers.editor
		local start_position = managers.editor.cursor_pos(self.__viewport).with_z(self.__viewport, camera.near_range(slot8))
		slot10 = camera
		local end_position = start_position.with_z(managers.editor.cursor_pos(self.__viewport), camera.far_range(camera))
		slot9 = start_position
		local ray_start = camera.screen_to_world(start_position, camera)
		slot10 = end_position
		local ray_end = camera.screen_to_world(camera, camera)
		slot15 = self.__slotmask
		local raycast = World.raycast(camera, World, "ray", ray_start, ray_end, "slot_mask")
		slot12 = "EVT_MOTION"
		local mouse_event = EWS.MouseEvent(World, EWS)

		if mouse_event then
			slot12 = mouse_event

			if mouse_event.left_is_down(slot11) then
				slot13 = raycast

				self._mouse_left_down(slot11, self)
			else
				slot13 = raycast

				self._mouse_moved(slot11, self)
			end
		end
	end

	return 
end
function PointPicker:start_picking()
	self.__enabled = true

	return 
end
function PointPicker:stop_picking()
	self.__enabled = false

	return 
end
function PointPicker:_mouse_moved(raycast)
	slot6 = raycast

	self._send_event(slot3, self, "EVT_PICKING")

	return 
end
function PointPicker:_mouse_left_down(raycast)
	slot6 = raycast

	self._send_event(slot3, self, "EVT_FINISHED_PICKING")

	slot4 = self

	self.stop_picking(slot3)

	return 
end

return 
