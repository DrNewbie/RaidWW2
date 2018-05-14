CoreCameraDistancePicker = CoreCameraDistancePicker or class()
function CoreCameraDistancePicker:init(parent_window, value, button_label)
	slot7 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(slot5, EWS)
	slot8 = parent_window
	self.__panel = EWS.Panel(EWS, EWS)
	slot8 = sizer

	self.__panel.set_sizer(EWS, self.__panel)

	slot11 = ""
	self.__field = EWS.SpinCtrl(slot6, EWS, self.__panel, value or "", "")

	self.__field.set_range(slot6, self.__field, 0)

	slot7 = self.__field
	slot10 = self.__field
	slot11 = 0

	self.__field.set_min_size(slot6, self.__field.get_min_size(100000).with_x(100000, self.__field.get_min_size(100000)))

	slot11 = "BU_EXACTFIT"
	self.__button = EWS.Button(slot6, EWS, self.__panel, button_label or "Pick", "")
	slot7 = self.__button

	self.__button.fit_inside(slot6)

	slot11 = "EXPAND"

	sizer.add(slot6, sizer, self.__field, 1, 0)

	slot11 = "LEFT"

	sizer.add(slot6, sizer, self.__button, 0, 5)

	slot8 = "EVT_COMMAND_BUTTON_CLICKED"
	slot13 = "_enter_pick_mode"

	self.__button.connect(slot6, self.__button, callback(5, self, self))

	return 
end
function CoreCameraDistancePicker:panel()
	return self.__panel
end
function CoreCameraDistancePicker:update(time, delta_time)
	if self.__is_picking and managers.viewport then
		slot5 = managers.viewport
		local picking_camera = managers.viewport.get_current_camera(slot4)
	end

	if picking_camera then
		local ray_start = picking_camera.position(slot5)
		slot10 = managers.editor
		slot10 = managers.editor.cursor_pos(slot9)
		slot13 = picking_camera
		local ray_end = self._screen_to_world(picking_camera, managers.editor.cursor_pos(slot9).with_z(slot9, picking_camera.far_range(slot12)))
		slot10 = ray_end
		local raycast = World.raycast(self, World, ray_start)

		if raycast then
			local focus_point = Draw.pen(slot8)
			slot11 = raycast.position
			local screen_position = self._world_to_screen(Draw, self)
			slot12 = "screen"

			focus_point.set(self, focus_point)

			slot11 = focus_point
			slot14 = "ff0000"

			focus_point.set(self, Color(slot13))
			focus_point.circle(self, focus_point, screen_position)

			slot15 = -1
			slot12 = screen_position.with_x(0.1, screen_position)
			slot16 = screen_position.x - 0.1

			focus_point.line(self, focus_point, screen_position.with_x(screen_position, screen_position))

			slot15 = screen_position.x + 0.1
			slot12 = screen_position.with_x(screen_position.with_x, screen_position)
			slot16 = 1

			focus_point.line(self, focus_point, screen_position.with_x(screen_position, screen_position))

			slot15 = -1
			slot12 = screen_position.with_y(screen_position.with_x, screen_position)
			slot16 = screen_position.y - 0.1

			focus_point.line(self, focus_point, screen_position.with_y(screen_position, screen_position))

			slot15 = screen_position.y + 0.1
			slot12 = screen_position.with_y(screen_position.with_y, screen_position)

			focus_point.line(self, focus_point, screen_position.with_y(screen_position, screen_position))

			slot11 = self.__field
			slot14 = "%i"
			slot17 = 0
			slot20 = raycast.distance - 10

			self.__field.set_value(self, string.format(screen_position.with_y, math.max(1, math.round(slot19))))
		end

		slot10 = "EVT_MOTION"
		slot9 = EWS.MouseEvent(slot8, EWS)

		if EWS.MouseEvent(slot8, EWS).left_is_down(slot8) then
			slot9 = self

			self._exit_pick_mode(slot8)
		end
	end

	return 
end
function CoreCameraDistancePicker:_screen_to_world(coords)
	slot2 = assert

	if managers.viewport then
		slot6 = managers.viewport
		slot4 = managers.viewport.get_current_camera(slot5)
	end

	local camera = slot2(slot3)
	slot3 = assert

	if managers.viewport then
		slot7 = managers.viewport
		slot5 = managers.viewport.get_active_vp(slot6)
	end

	local viewport = slot3(slot4)
	local viewport_rect = viewport.get_rect(slot5)
	slot11 = viewport
	slot8 = (coords.x * 2 * viewport.get_width_multiplier(slot10)) / viewport_rect.w
	slot8 = (coords.y * 2) / viewport_rect.h
	local viewport_position = coords.with_x(viewport, coords).with_y(viewport, coords.with_x(viewport, coords))
	slot9 = viewport_position

	return camera.screen_to_world(coords.with_x(viewport, coords), camera)
end
function CoreCameraDistancePicker:_world_to_screen(coords)
	slot2 = assert

	if managers.viewport then
		slot6 = managers.viewport
		slot4 = managers.viewport.get_current_camera(slot5)
	end

	local camera = slot2(slot3)
	slot3 = assert

	if managers.viewport then
		slot7 = managers.viewport
		slot5 = managers.viewport.get_active_vp(slot6)
	end

	local viewport = slot3(slot4)
	local viewport_rect = viewport.get_rect(slot5)
	slot8 = coords
	local viewport_position = camera.world_to_screen(viewport, camera)
	slot12 = viewport
	slot9 = (viewport_position.x * 2 * viewport.get_width_multiplier(slot11)) / viewport_rect.w
	slot9 = -viewport_position.y / 2 * viewport_rect.h
	local screen_position = viewport_position.with_x(camera, viewport_position).with_y(camera, viewport_position.with_x(camera, viewport_position))

	return screen_position
end
function CoreCameraDistancePicker:connect(event_type, script_callback, object_data)
	if object_data then
		slot9 = object_data

		self.__field.connect(slot5, self.__field, event_type, script_callback)
	else
		slot8 = script_callback

		self.__field.connect(slot5, self.__field, event_type)
	end

	return 
end
function CoreCameraDistancePicker:disconnect(event_type, script_callback, object_data)
	if object_data then
		slot9 = object_data

		self.__field.disconnect(slot5, self.__field, event_type, script_callback)
	else
		slot8 = script_callback

		self.__field.disconnect(slot5, self.__field, event_type)
	end

	return 
end
function CoreCameraDistancePicker:get_value(value)
	slot5 = value

	return self.__field.get_value(slot3, self.__field)
end
function CoreCameraDistancePicker:set_value(value)
	slot5 = value

	self.__field.set_value(slot3, self.__field)

	return 
end
function CoreCameraDistancePicker:change_value(value)
	slot5 = value

	self.__field.change_value(slot3, self.__field)

	return 
end
function CoreCameraDistancePicker:set_background_colour(r, g, b)
	slot9 = b

	self.__field.set_background_colour(slot5, self.__field, r, g)

	slot6 = self.__field

	self.__field.refresh(slot5)

	slot6 = self.__field

	self.__field.update(slot5)

	return 
end
function CoreCameraDistancePicker:enabled()
	slot3 = self.__field

	return self.__field.enabled(slot2)
end
function CoreCameraDistancePicker:set_enabled(enabled)
	slot5 = enabled

	self.__field.set_enabled(slot3, self.__field)

	slot5 = enabled and not self.__pick_button_disabled

	self.__button.set_enabled(slot3, self.__button)

	return 
end
function CoreCameraDistancePicker:set_pick_button_enabled(enabled)
	self.__pick_button_disabled = not enabled or nil
	slot7 = self
	slot5 = self.enabled(slot6) and not self.__pick_button_disabled

	self.__button.set_enabled(slot3, self.__button)

	return 
end
function CoreCameraDistancePicker:has_focus()
	if not self.__is_picking then
		slot3 = EWS

		return EWS.get_window_in_focus(slot2) == self.__field
	end
end
function CoreCameraDistancePicker:_enter_pick_mode()
	self.__is_picking = true

	return 
end
function CoreCameraDistancePicker:_exit_pick_mode()
	self.__is_picking = nil

	return 
end

return 
