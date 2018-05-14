-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
WaypointExt = WaypointExt or class()
function WaypointExt:init(unit)
	self._unit = unit
	WaypointExt.debug_ext = self
	self._is_active = false

	return 
end
function WaypointExt:add_waypoint(icon_name, pos_z_offset, pos_locator, map_icon, show_on_hud)

	-- Decompilation error in this vicinity:
	if self._is_active then
		slot8 = self

		self.remove_waypoint(slot7)
	end

	self._icon_name = icon_name or "pd2_goto"
	self._pos_z_offset = slot6
	self._pos_locator = pos_locator
	self._map_icon = map_icon
	self._show_on_hud = show_on_hud
	local position = position + self._pos_z_offset
	self._icon_pos = position
	self._icon_rot = rotation
	slot13 = 1
	self._waypoint_data = {
		present_timer = 0,
		radius = 200,
		waypoint_origin = "waypoint_extension",
		blend_mode = "add",
		no_sync = false,
		waypoint_type = "unit_waypoint",
		icon = self._icon_name,
		map_icon = map_icon,
		unit = self._unit,
		position = position,
		rotation = rotation,
		color = Color(slot10, 1, 1),
		show_on_screen = show_on_hud or (show_on_hud == nil and true)
	}
	slot12 = self._unit
	self._icon_id = tostring(self._unit.key(slot11))

	managers.hud.add_waypoint(show_on_hud or (show_on_hud == nil and true), managers.hud, self._icon_id)

	slot13 = "waypoint"
	slot12 = true

	self._unit.set_extension_update_enabled(show_on_hud or (show_on_hud == nil and true), self._unit, Idstring(self._waypoint_data))

	self._is_active = true

	return 
end
function WaypointExt:remove_waypoint()
	if self._icon_id then
		slot4 = self._icon_id

		managers.hud.remove_waypoint(slot2, managers.hud)

		self._icon_id = nil
		self._icon_pos = nil
		self._waypoint_data = nil
	end

	slot6 = "waypoint"

	self._unit.set_extension_update_enabled(slot2, self._unit, Idstring(false))

	self._is_active = false

	return 
end
function WaypointExt:update(t, dt)
	if self._icon_pos then

		-- Decompilation error in this vicinity:
		local position = position + self._pos_z_offset
		slot7 = position

		mvector3.set(slot5, self._icon_pos)

		slot12 = rotation

		mrotation.set_yaw_pitch_roll(slot6, self._icon_rot, rotation.yaw(rotation.pitch(rotation)), rotation.roll(rotation))
	end

	return 
end
function WaypointExt:save(save_data)
	save_data.Waypoint = {
		active = self._is_active,
		icon_name = self._icon_name,
		pos_z_offset = self._pos_z_offset and self._pos_z_offset.z,
		pos_locator = self._pos_locator,
		map_icon = self._map_icon,
		show_on_hud = self._show_on_hud
	}

	return 
end
function WaypointExt:load(save_data)
	if save_data.Waypoint then
		if save_data.Waypoint.active and not self._is_active then
			local icon_name = save_data.Waypoint.icon_name
			local pos_z_offset = save_data.Waypoint.pos_z_offset
			local pos_locator = save_data.Waypoint.pos_locator
			local map_icon = save_data.Waypoint.map_icon
			local show_on_hud = save_data.Waypoint.show_on_hud
			slot14 = show_on_hud

			self.add_waypoint(slot8, self, icon_name, pos_z_offset, pos_locator, map_icon)
		elseif not save_data.Waypoint.active and self._is_active then
			slot4 = self

			self.remove_waypoint(slot3)
		end
	end

	return 
end

return 
