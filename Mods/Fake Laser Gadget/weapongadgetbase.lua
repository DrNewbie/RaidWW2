WeaponLaserRaid = WeaponLaserRaid or class()

function WeaponLaserRaid:init(unit)
	self:steup(unit)
end

function WeaponLaserRaid:steup(unit)
	self._unit = unit
	self._ray_from_pos = Vector3()
	self._ray_to_pos = Vector3()
	self._use_laser = false
	self._laser_size = 0.5
	self._laser_color = Color(0.15, 1, 0, 0)
	self._laser_sensor_color = Color(0.15, 0.1, 0.1, 1)
	self._laser_brush = Draw:brush(self._laser_color)
	self._laser_brush:set_blend_mode("opacity_add")
	self._custom_position = nil
	self._custom_rotation = nil
end

function WeaponLaserRaid:set_position(pos)
	self._custom_position = pos
end

function WeaponLaserRaid:set_rotation(rot)
	self._custom_rotation = rot
end

function WeaponLaserRaid:color()
	return self._color or Color(0.15, 1, 0, 0)
end

function WeaponLaserRaid:set_color(color)
	if not color then
		return
	end
	self._color = color
	self._light_color = Vector3(color.r * 10, color.g * 10, color.b * 10)
	self._light:set_color(self._light_color)
	self._light_glow_color = Vector3(color.r * 0.2, color.g * 0.2, color.b * 0.2)
	self._light_glow:set_color(self._light_glow_color)
	self._brush:set_color(color)
end