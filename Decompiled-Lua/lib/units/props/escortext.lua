-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
EscortExt = EscortExt or class()
function EscortExt:init(unit)
	self._unit = unit
	slot6 = 120
	self._wp_offset = Vector3(slot3, 0, 0)
	self._was_safe = false
	slot6 = 1
	self._safe_color = Color(slot3, 1, 1)
	slot6 = 0
	self._unsafe_color = Color(slot3, 1, 0)
	self._ws = managers.hud._fullscreen_workspace
	slot4 = self._unit
	slot4 = self._unit.base(slot3)
	local tweak = self._unit.base(slot3).char_tweak(slot3)

	if not tweak.immortal then
		slot5 = self._unit

		if not self._unit.character_damage(slot4).immortal then
			slot5 = self

			self._setup_health_bar(slot4)

			slot6 = false

			self.set_health_bar_visible(slot4, self)
		end
	end

	slot5 = Network

	if Network.is_server(slot4) then
		slot11 = self._unit
		slot11 = "set_logic"
		slot7 = callback(slot8, self, self)
		slot10 = TimerManager

		managers.enemy.add_delayed_clbk(slot4, managers.enemy, "EscortExt_set_logic" .. tostring(self._unit.key(TimerManager.game(self))), TimerManager.game(self).time(self))
	end

	return 
end
function EscortExt:set_logic()

	-- Decompilation error in this vicinity:
	slot3 = Network

	if Network.is_client(slot2) then
		return 
	end

	slot3 = self._unit
	slot3 = self._unit.brain(slot2)

	return 
end
function EscortExt:destroy()
	slot3 = self

	self.remove_health_bar(slot2)

	slot3 = self

	self.remove_waypoint(slot2)

	return 
end
function EscortExt:_setup_health_bar()
	slot3 = self._ws
	slot4 = {}
	self._health_panel = self._ws.panel(slot2).panel(slot2, self._ws.panel(slot2))
	slot4 = {
		name = "bg",
		valign = "center",
		halign = "center",
		layer = -1,
		texture = tweak_data.gui.icons[HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON].texture_rect
	}
	self._health_bar_bg = self._health_panel.bitmap(slot2, self._health_panel)
	slot6 = self._health_bar_bg
	slot4 = self._health_bar_bg.w(tweak_data.gui.icons[HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON].texture_rect) / 2

	self._health_bar_bg.set_w(slot2, self._health_bar_bg)

	slot3 = self._health_panel
	slot6 = self._health_bar_bg

	self._health_panel.set_w(slot2, self._health_bar_bg.w(tweak_data.gui.icons[HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON].texture_rect))

	slot3 = self._health_panel
	slot6 = self._health_bar_bg

	self._health_panel.set_h(slot2, self._health_bar_bg.h(tweak_data.gui.icons[HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON].texture_rect))

	slot6 = self._health_panel
	slot4 = self._health_panel.w(tweak_data.gui.icons[HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON].texture_rect) / 2

	self._health_bar_bg.set_center_x(slot2, self._health_bar_bg)

	slot4 = self._health_panel.h(tweak_data.gui.icons[HUDTeammatePlayer.PLAYER_HEALTH_BG_ICON].texture_rect) / 2

	self._health_bar_bg.set_center_y(slot2, self._health_bar_bg)

	slot4 = {
		name = "fg",
		w = self._health_bar_bg.w(self._health_panel) - 2,
		h = self._health_bar_bg.h(self._health_panel) - 2,
		color = tweak_data.gui.colors.progress_75
	}
	slot7 = self._health_bar_bg
	slot7 = self._health_bar_bg
	self._health_bar = self._health_panel.rect(slot2, self._health_panel)
	slot6 = self._health_panel
	slot4 = self._health_panel.w(tweak_data.gui.colors.progress_75) / 2

	self._health_bar.set_center_x(slot2, self._health_bar)

	slot6 = self._health_panel
	slot4 = self._health_panel.h(tweak_data.gui.colors.progress_75) / 2

	self._health_bar.set_center_y(slot2, self._health_bar)

	slot3 = self

	self.update_health_bar(slot2)

	return 
end
function EscortExt:update_health_bar()
	slot3 = self._health_panel

	if not alive(slot2) then
		return 
	end

	local full_size = self._health_panel.w(slot2) - 2
	slot4 = self._unit
	local new_size = full_size * self._unit.character_damage(self._health_panel).health_ratio(self._health_panel)
	slot6 = new_size

	self._health_bar.set_w(self._unit.character_damage(self._health_panel), self._health_bar)

	return 
end
function EscortExt:remove_health_bar()
	slot3 = self._health_panel

	if not alive(slot2) then
		return 
	end

	slot3 = self._health_panel
	slot4 = self._health_panel

	self._health_panel.parent(slot2).remove(slot2, self._health_panel.parent(slot2))

	self._health_panel = nil
	self._health_bar = nil
	self._health_bar_bg = nil

	return 
end
function EscortExt:set_health_bar_visible(visible)
	slot4 = self._health_panel

	if not alive(slot3) then
		return 
	end

	slot5 = visible

	self._health_panel.set_visible(slot3, self._health_panel)

	self._health_visible = visible

	return 
end
function EscortExt:has_waypoint()
	return self._has_waypoint
end
function EscortExt:add_waypoint()
	if self._has_waypoint then
		slot3 = self

		self.remove_waypoint(slot2)
	end

	slot3 = self._unit
	self._position = self._unit.position(slot2) + self._wp_offset
	slot3 = self._unit
	self._rotation = self._unit.rotation(self._wp_offset)
	self._waypoint_data = {
		present_timer = 0,
		radius = 200,
		distance = true,
		map_icon = "waypoint_escort_crouch",
		show_on_screen = true,
		icon = "waypoint_escort_crouch",
		blend_mode = "add",
		no_sync = true,
		waypoint_type = "unit_waypoint",
		unit = self._unit,
		position = self._position,
		rotation = self._rotation,
		color = self._unsafe_color
	}
	slot5 = self._unit
	self._icon_id = tostring(self._unit.key(slot4))

	managers.hud.add_waypoint(self._unsafe_color, managers.hud, self._icon_id)

	slot6 = "escort"
	slot5 = true

	self._unit.set_extension_update_enabled(self._unsafe_color, self._unit, Idstring(self._waypoint_data))

	self._has_waypoint = true

	return 
end
function EscortExt:remove_waypoint()
	if not self._has_waypoint then
		return 
	end

	slot4 = self._icon_id

	managers.hud.remove_waypoint(slot2, managers.hud)

	slot6 = "escort"

	self._unit.set_extension_update_enabled(slot2, self._unit, Idstring(false))

	self._has_waypoint = false

	return 
end
function EscortExt:is_safe()
	local someone_close = false
	slot5 = self._unit
	local char_tweak = tweak_data.character[self._unit.base(slot4)._tweak_table]
	local min_dis_sq = (char_tweak and char_tweak.escort_safe_dist) or 1000
	min_dis_sq = min_dis_sq * min_dis_sq
	slot8 = managers.groupai
	slot8 = managers.groupai.state(slot7)

	for c_key, c_data in pairs(managers.groupai.state(slot7).all_char_criminals(slot7)) do
		slot11 = c_data.m_pos
		slot14 = self._unit

		if mvector3.distance_sq(slot10, self._unit.position(slot13)) < min_dis_sq then
			someone_close = true

			break
		end
	end

	return someone_close
end
local health_pos = Vector3()
local health_dir = Vector3()
local cam_dir = Vector3()
function EscortExt:update(t, dt)
	if self._has_waypoint then
		slot6 = self._unit.position(slot7) + self._wp_offset

		mvector3.set(slot4, self._position)

		local rotation = self._unit.rotation(slot4)
		slot8 = rotation.pitch(rotation)
		slot11 = rotation

		mrotation.set_yaw_pitch_roll(self._unit, self._rotation, rotation.yaw(self._unit), rotation.roll(rotation))

		if not self._was_safe then
			slot6 = self
		elseif self._was_safe then
			slot6 = self

			if not self.is_safe(slot5) then
				slot7 = false

				self.set_waypoint_safe(slot5, self)

				self._was_safe = false
				slot7 = self._unit
				local char_tweak = tweak_data.character[self._unit.base(self)._tweak_table]

				if char_tweak and char_tweak.unsafe_vo then
					slot7 = self._unit
					slot9 = true

					self._unit.sound(slot6).say(slot6, self._unit.sound(slot6), char_tweak.unsafe_vo)
				end
			end
		end
	end

	slot5 = self._health_bar

	if alive(slot4) and self._health_visible then
		slot5 = managers.viewport
		local cam = managers.viewport.get_current_camera(slot4)

		if not cam then
			return 
		end

		slot6 = cam_dir
		slot9 = cam
		slot9 = cam.rotation(slot8)

		mvector3.set(slot5, cam.rotation(slot8).y(slot8))

		slot6 = health_dir
		slot9 = self._unit

		mvector3.set(slot5, self._unit.position(slot8))

		slot6 = health_dir
		slot9 = cam

		mvector3.subtract(slot5, cam.position(slot8))

		slot6 = health_dir

		mvector3.normalize(slot5)

		slot7 = health_dir
		local dot = mvector3.dot(slot5, cam_dir)

		if dot < 0 then
			slot7 = self._health_panel

			self._health_panel.hide(slot6)
		else
			slot7 = health_pos
			slot17 = 150
			slot12 = self._unit.position(slot13) + Vector3(self._unit, 0, 0)

			mvector3.set(slot6, self._ws.world_to_screen(slot9, self._ws, cam))

			slot9 = health_pos.y

			self._health_panel.set_center(slot6, self._health_panel, health_pos.x)

			slot7 = self._health_panel

			self._health_panel.show(slot6)
		end
	end

	return 
end
function EscortExt:set_waypoint_safe(safe)
	slot6 = (safe and self._safe_color) or self._unsafe_color

	managers.hud.change_waypoint_distance_color(slot3, managers.hud, self._icon_id)

	slot6 = (safe and self._safe_color) or self._unsafe_color

	managers.hud.change_waypoint_arrow_color(slot3, managers.hud, self._icon_id)

	slot6 = (safe and "waypoint_escort_stand") or "waypoint_escort_crouch"

	managers.hud.change_waypoint_icon(slot3, managers.hud, self._icon_id)

	return 
end
function EscortExt:set_active(active)
	self._active = active

	if active then
		slot4 = self

		if not self.has_waypoint(slot3) then
			slot4 = self

			self.add_waypoint(slot3)

			slot4 = self
			slot7 = self

			self.set_waypoint_safe(slot3, self.is_safe(slot6))
		end
	else
		slot4 = self

		self.remove_waypoint(slot3)
	end

	slot5 = active

	self.set_health_bar_visible(slot3, self)

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = self._unit
		slot6 = active

		self._unit.network(slot3).send(slot3, self._unit.network(slot3), "set_escort_active")
	end

	return 
end
function EscortExt:active()
	return self._active
end
function EscortExt:save(data)
	data.escort = {}

	if self._has_waypoint then
		data.escort.has_waypoint = true
		data.escort.was_safe = self._was_safe
	end

	data.escort.health_visible = self._health_visible

	return 
end
function EscortExt:load(data)
	if data.escort.has_waypoint then
		slot4 = self

		self.add_waypoint(slot3)

		slot5 = data.escort.was_safe

		self.set_waypoint_safe(slot3, self)
	end

	slot5 = data.escort.health_visible

	self.set_health_bar_visible(slot3, self)

	return 
end

return 
