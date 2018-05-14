HUDMapWaypointBase = HUDMapWaypointBase or class()
HUDMapWaypointBase.create = function (panel, waypoint_data)
	if waypoint_data.map_icon then
		slot6 = waypoint_data

		return HUDMapWaypointIcon.new(slot3, HUDMapWaypointIcon, panel)
	elseif waypoint_data.waypoint_type == "objective" and waypoint_data.waypoint_display == "point" then
		slot6 = waypoint_data

		return HUDMapWaypointPoint.new(slot3, HUDMapWaypointPoint, panel)
	elseif waypoint_data.waypoint_type == "objective" and waypoint_data.waypoint_display == "circle" then
		slot6 = waypoint_data

		return HUDMapWaypointCircle.new(slot3, HUDMapWaypointCircle, panel)
	end

	return nil
end
HUDMapWaypointBase.init = function (self, waypoint_data)
	self._id = waypoint_data.id_string

	return 
end
HUDMapWaypointBase.set_center_x = function (self, x)
	slot5 = x

	self._object.set_center_x(slot3, self._object)

	return 
end
HUDMapWaypointBase.set_center_y = function (self, y)
	slot5 = y

	self._object.set_center_y(slot3, self._object)

	return 
end
HUDMapWaypointBase.set_position = function (self, x, y)
	slot6 = x

	self.set_center_x(slot4, self)

	slot6 = y

	self.set_center_y(slot4, self)

	return 
end
HUDMapWaypointBase.set_data = function (self, waypoint_data)
	return 
end
HUDMapWaypointBase.id = function (self)
	return self._id
end
HUDMapWaypointBase.show = function (self)
	slot4 = true

	self._object.set_visible(slot2, self._object)

	return 
end
HUDMapWaypointBase.hide = function (self)
	slot4 = false

	self._object.set_visible(slot2, self._object)

	return 
end
HUDMapWaypointBase.destroy = function (self)
	self._id = nil
	slot3 = self._object

	self._object.clear(slot2)

	slot3 = self._object
	slot4 = self._object

	self._object.parent(slot2).remove(slot2, self._object.parent(slot2))

	return 
end

if not HUDMapWaypointCircle then
	slot2 = HUDMapWaypointBase
	slot0 = class(slot1)
end

HUDMapWaypointCircle = slot0
HUDMapWaypointCircle.RADAR_ICON = "map_unknown_location"
HUDMapWaypointCircle.init = function (self, panel, waypoint_data)
	slot6 = waypoint_data

	HUDMapWaypointCircle.super.init(slot4, self)

	slot7 = waypoint_data

	self._create_panel(slot4, self, panel)

	slot6 = waypoint_data

	self._create_radar_icon(slot4, self)

	return 
end
HUDMapWaypointCircle._create_panel = function (self, panel, waypoint_data)
	local radius = waypoint_data.waypoint_radius
	local panel_params = {
		visible = false,
		is_root_panel = true
	}
	slot8 = self._id
	panel_params.name = "map_waypoint_circle_" .. tostring(slot7)
	panel_params.w = radius * 2
	panel_params.h = radius * 2
	slot9 = panel_params
	self._object = RaidGUIPanel.new(tostring(slot7), RaidGUIPanel, panel)

	return 
end
HUDMapWaypointCircle._create_radar_icon = function (self, waypoint_data)
	local radius = waypoint_data.waypoint_radius
	local radar_icon_params = {
		name = "radar_icon",
		x = radius - 3,
		w = radius - 3,
		h = radius,
		texture = tweak_data.gui.icons[HUDMapWaypointCircle.RADAR_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDMapWaypointCircle.RADAR_ICON].texture_rect
	}
	slot7 = radar_icon_params
	self._radar_icon = self._object.bitmap(HUDMapWaypointCircle.RADAR_ICON, self._object)
	slot6 = self._object
	slot10 = 359

	self._object.set_rotation(HUDMapWaypointCircle.RADAR_ICON, math.random(slot8, 0))

	slot6 = self._radar_icon
	slot11 = "_animate_rotate_radar"

	self._radar_icon.animate(HUDMapWaypointCircle.RADAR_ICON, callback(slot8, self, self))

	return 
end
HUDMapWaypointCircle.set_data = function (self, waypoint_data)
	slot4 = self._object

	if not self._object.visible(slot3) then
		slot5 = true

		self._object.set_visible(slot3, self._object)
	end

	return 
end
HUDMapWaypointCircle._animate_rotate_radar = function (self)
	while true do
		local low_speed = 0.6
		local high_speed = 1.7
		local speedup_duration = 1.2
		local high_speed_sustain_duration = 0.6
		local slowdown_duration = 3
		local low_speed_sustain_duration = 0.4
		local t = 0

		while t < speedup_duration do
			local dt = coroutine.yield()
			t = t + dt
			local current_speed = Easing.quartic_in_out(slot10, t, low_speed, high_speed - low_speed)
			slot15 = self._object
			slot13 = self._object.rotation(speedup_duration) + current_speed

			self._object.set_rotation(t, self._object)
		end

		t = 0

		while t < high_speed_sustain_duration do
			local dt = coroutine.yield()
			t = t + dt
			slot14 = self._object
			slot12 = self._object.rotation(slot13) + high_speed

			self._object.set_rotation(slot10, self._object)
		end

		t = 0

		while t < slowdown_duration do
			local dt = coroutine.yield()
			t = t + dt
			local current_speed = Easing.quintic_in_out(slot10, t, high_speed, low_speed - high_speed)
			slot15 = self._object
			slot13 = self._object.rotation(slowdown_duration) + current_speed

			self._object.set_rotation(t, self._object)
		end

		t = 0

		while t < low_speed_sustain_duration do
			local dt = coroutine.yield()
			t = t + dt
			slot14 = self._object
			slot12 = self._object.rotation(slot13) + low_speed

			self._object.set_rotation(slot10, self._object)
		end
	end

	return 
end
HUDMapWaypointCircle.destroy = function (self)
	slot3 = self._radar_icon

	self._radar_icon.stop(slot2)

	slot3 = self

	HUDMapWaypointCircle.super.destroy(slot2)

	return 
end

if not HUDMapWaypointPoint then
	slot2 = HUDMapWaypointBase
	slot0 = class(slot1)
end

HUDMapWaypointPoint = slot0
HUDMapWaypointPoint.W = 96
HUDMapWaypointPoint.H = 96
HUDMapWaypointPoint.ICON = "map_waypoint_pov_in"
HUDMapWaypointPoint.ICON_LAYER = 3
HUDMapWaypointPoint.ICON_BACKGROUND = "map_waypoint_pov_in"
HUDMapWaypointPoint.ICON_BACKGROUND_LAYER = 1
HUDMapWaypointPoint.DISTANCE_H = 32
HUDMapWaypointPoint.DISTANCE_FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDMapWaypointPoint.DISTANCE_FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDMapWaypointPoint.DISTANCE_LAYER = 2
HUDMapWaypointPoint.init = function (self, panel, waypoint_data)
	slot6 = waypoint_data

	HUDMapWaypointPoint.super.init(slot4, self)

	slot6 = panel

	self._create_panel(slot4, self)

	slot5 = self

	self._create_icon(slot4)

	slot5 = self

	self._create_background_icon(slot4)

	slot5 = self

	self._create_distance(slot4)

	return 
end
HUDMapWaypointPoint._create_panel = function (self, panel)
	local panel_params = {
		visible = false,
		halign = "center",
		valign = "center"
	}
	slot6 = self._id
	panel_params.name = "map_waypoint_point_" .. tostring(slot5)
	panel_params.w = HUDMapWaypointPoint.W
	panel_params.h = HUDMapWaypointPoint.H
	slot6 = panel_params
	self._object = panel.panel(tostring(slot5), panel)

	return 
end
HUDMapWaypointPoint._create_icon = function (self)
	local icon_params = {
		name = "icon",
		texture = tweak_data.gui.icons[HUDMapWaypointPoint.ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDMapWaypointPoint.ICON].texture_rect
	}
	slot5 = icon_params
	self._icon = self._object.bitmap(HUDMapWaypointPoint.ICON, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._icon.set_center_x(HUDMapWaypointPoint.ICON, self._icon)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._icon.set_center_y(HUDMapWaypointPoint.ICON, self._icon)

	return 
end
HUDMapWaypointPoint._create_background_icon = function (self)
	local background_icon_params = {
		name = "background_icon",
		texture = tweak_data.gui.icons[HUDMapWaypointPoint.ICON_BACKGROUND].texture,
		texture_rect = tweak_data.gui.icons[HUDMapWaypointPoint.ICON_BACKGROUND].texture_rect
	}
	slot5 = background_icon_params
	self._background_icon = self._object.bitmap(HUDMapWaypointPoint.ICON_BACKGROUND, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._background_icon.set_center_x(HUDMapWaypointPoint.ICON_BACKGROUND, self._background_icon)

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._background_icon.set_center_y(HUDMapWaypointPoint.ICON_BACKGROUND, self._background_icon)

	slot4 = self._background_icon
	slot9 = "_animate_background_icon"

	self._background_icon.animate(HUDMapWaypointPoint.ICON_BACKGROUND, callback(slot6, self, self))

	return 
end
HUDMapWaypointPoint._create_distance = function (self)
	local distance_text_params = {
		vertical = "center",
		name = "distance_text",
		align = "center",
		text = ""
	}
	slot4 = self._object
	distance_text_params.w = self._object.w(slot3)
	distance_text_params.h = HUDMapWaypointPoint.DISTANCE_H
	distance_text_params.font = HUDMapWaypointPoint.DISTANCE_FONT
	distance_text_params.font_size = HUDMapWaypointPoint.DISTANCE_FONT_SIZE
	distance_text_params.layer = HUDMapWaypointPoint.DISTANCE_LAYER
	slot5 = distance_text_params
	self._distance = self._object.text(slot3, self._object)
	slot4 = self._distance
	slot7 = self._object

	self._distance.set_bottom(slot3, self._object.h(slot6))

	return 
end
HUDMapWaypointPoint.set_data = function (self, waypoint_data)
	slot4 = managers.player

	if not managers.player.player_unit(slot3) then
		slot5 = false

		self._distance.set_visible(slot3, self._distance)
	end

	slot5 = true

	self._distance.set_visible(slot3, self._distance)

	slot5 = true

	self._object.set_visible(slot3, self._object)

	local waypoint_distance = Vector3()
	slot6 = waypoint_data.position

	mvector3.set(self._object, waypoint_distance)

	slot5 = waypoint_distance
	slot8 = managers.viewport

	mvector3.subtract(self._object, managers.viewport.get_current_camera_position(slot7))

	slot11 = waypoint_distance
	slot9 = waypoint_distance.length(slot10) / 100
	slot6 = string.format(slot7, "%.0f") .. "m"

	self._distance.set_text(self._object, self._distance)

	return 
end
HUDMapWaypointPoint._animate_background_icon = function (self)
	while true do
		local enhance_factor = 2
		local blink_duration = 2
		local t = 0

		while t < blink_duration do
			local dt = coroutine.yield()
			t = t + dt
			local current_size = Easing.quartic_out(slot6, t, 1, 1)
			slot11 = self._icon
			slot9 = self._icon.w(blink_duration) * current_size

			self._background_icon.set_w(t, self._background_icon)

			slot11 = self._icon
			slot9 = self._icon.h(blink_duration) * current_size

			self._background_icon.set_h(t, self._background_icon)

			slot11 = self._object
			slot9 = self._object.w(blink_duration) / 2

			self._background_icon.set_center_x(t, self._background_icon)

			slot11 = self._object
			slot9 = self._object.h(blink_duration) / 2

			self._background_icon.set_center_y(t, self._background_icon)

			slot11 = blink_duration
			local current_alpha = Easing.quartic_out(t, t, 0.6, -0.6)
			slot10 = current_alpha

			self._background_icon.set_alpha(t, self._background_icon)
		end

		slot6 = self._background_icon
		slot9 = self._icon

		self._background_icon.set_w(slot5, self._icon.w(slot8))

		slot6 = self._background_icon
		slot9 = self._icon

		self._background_icon.set_h(slot5, self._icon.h(slot8))

		slot9 = self._object
		slot7 = self._object.w(slot8) / 2

		self._background_icon.set_center_x(slot5, self._background_icon)

		slot9 = self._object
		slot7 = self._object.h(slot8) / 2

		self._background_icon.set_center_y(slot5, self._background_icon)

		slot7 = 0

		self._background_icon.set_alpha(slot5, self._background_icon)

		slot6 = 0.3

		wait(slot5)
	end

	return 
end
HUDMapWaypointPoint.destroy = function (self)
	slot3 = self._background_icon

	self._background_icon.stop(slot2)

	slot3 = self

	HUDMapWaypointPoint.super.destroy(slot2)

	return 
end

if not HUDMapWaypointIcon then
	slot2 = HUDMapWaypointBase
	slot0 = class(slot1)
end

HUDMapWaypointIcon = slot0
HUDMapWaypointIcon.init = function (self, panel, waypoint_data)
	slot6 = waypoint_data

	HUDMapWaypointIcon.super.init(slot4, self)

	slot7 = waypoint_data

	self._create_panel(slot4, self, panel)

	slot6 = waypoint_data

	self._create_icon(slot4, self)

	return 
end
HUDMapWaypointIcon._create_panel = function (self, panel, waypoint_data)
	local icon = waypoint_data.map_icon
	local panel_params = {
		halign = "center",
		valign = "center"
	}
	slot8 = self._id
	slot6 = tostring(slot7)
	panel_params.name = "map_waypoint_icon_" .. slot6
	slot8 = icon
	panel_params.w = tweak_data.gui.icon_w(slot6, tweak_data.gui)
	slot8 = icon
	panel_params.h = tweak_data.gui.icon_h(slot6, tweak_data.gui)
	slot8 = panel_params
	self._object = panel.panel(slot6, panel)

	return 
end
HUDMapWaypointIcon._create_icon = function (self, waypoint_data)
	local icon = waypoint_data.map_icon
	local icon_params = {
		name = "icon",
		texture = tweak_data.gui.icons[icon].texture,
		texture_rect = tweak_data.gui.icons[icon].texture_rect
	}
	slot7 = icon_params
	self._icon = self._object.bitmap(slot5, self._object)

	return 
end
HUDMapWaypointIcon.set_data = function (self, waypoint_data)
	slot7 = waypoint_data.rotation
	slot5 = -waypoint_data.rotation.yaw(slot6)

	self.set_rotation(slot3, self)

	return 
end
HUDMapWaypointIcon.set_rotation = function (self, rotation)
	slot5 = rotation

	self._icon.set_rotation(slot3, self._icon)

	return 
end

return 
