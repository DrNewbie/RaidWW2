-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HUDHitDirection = HUDHitDirection or class()
HUDHitDirection.W = 512
HUDHitDirection.H = 512
HUDHitDirection.UNIT_TYPE_HIT_PLAYER = 1
HUDHitDirection.UNIT_TYPE_HIT_VEHICLE = 2
HUDHitDirection.DAMAGE_INDICATOR_BASE = "damage_indicator_"
HUDHitDirection.DEFAULT_DAMAGE_INDICATOR = 1
HUDHitDirection.DAMAGE_INDICATOR_DURATION = 1
HUDHitDirection.INDICATOR_FADE_IN_DURATION = 0.2
HUDHitDirection.INDICATOR_FADE_OUT_DURATION = 0.25
HUDHitDirection.SEVERITY_THRESHOLDS = {
	0,
	3,
	6,
	9
}
function HUDHitDirection:init(hud)
	slot5 = hud

	self._create_panel(slot3, self)

	slot4 = self

	self._create_directional_indicators(slot3)

	self._indicators = {}
	slot5 = "hit_direction_indicators"
	slot10 = "update"

	managers.hud.add_updator(slot3, managers.hud, callback(slot7, self, self))

	return 
end
function HUDHitDirection:_create_panel(hud)
	slot5 = "hit_direction_panel"

	if hud.panel.child(slot3, hud.panel) then
		slot4 = hud.panel
		slot8 = "hit_direction_panel"

		hud.panel.remove(slot3, hud.panel.child(slot6, hud.panel))
	end

	local panel_params = {
		layer = -5,
		name = "hit_direction_panel",
		halign = "center",
		visible = true,
		valign = "center",
		w = HUDHitDirection.W,
		h = HUDHitDirection.H
	}
	slot6 = panel_params
	self._object = hud.panel.panel(slot4, hud.panel)
	slot9 = hud.panel

	self._object.set_center(slot4, self._object, hud.panel.w(hud.panel.h(hud.panel) / 2) / 2)

	return 
end
function HUDHitDirection:_create_directional_indicators()
	slot7 = "center"
	local left = self._create_indicator(slot2, self, "left", -90, "left")
	slot5 = 0

	left.set_left(self, left)

	slot7 = self._object
	slot5 = self._object.h("left") / 2

	left.set_center_y(self, left)

	slot8 = "center"
	local right = self._create_indicator(self, self, "right", 90, "right")
	slot5 = right
	slot8 = self._object

	right.set_right(self, self._object.w("right"))

	slot8 = self._object
	slot6 = self._object.h("right") / 2

	right.set_center_y(self, right)

	slot9 = "top"
	local up = self._create_indicator(self, self, "up", 0, "center")
	slot7 = 0

	up.set_top(self, up)

	slot9 = self._object
	slot7 = self._object.w("center") / 2

	up.set_center_x(self, up)

	slot10 = "bottom"
	local down = self._create_indicator(self, self, "down", 180, "center")
	slot7 = down
	slot10 = self._object

	down.set_bottom(self, self._object.h("center"))

	slot10 = self._object
	slot8 = self._object.w("center") / 2

	down.set_center_x(self, down)

	return 
end
function HUDHitDirection:_create_indicator(name, rotation, halign, valign)
	local indicator_params = {
		alpha = 0,
		visible = true,
		name = name,
		texture = tweak_data.gui.icons[HUDHitDirection.DAMAGE_INDICATOR_BASE .. HUDHitDirection.DEFAULT_DAMAGE_INDICATOR].texture,
		texture_rect = tweak_data.gui.icons[HUDHitDirection.DAMAGE_INDICATOR_BASE .. HUDHitDirection.DEFAULT_DAMAGE_INDICATOR].texture_rect,
		rotation = rotation,
		halign = halign,
		valign = valign
	}
	slot9 = indicator_params
	local indicator = self._object.bitmap(HUDHitDirection.DAMAGE_INDICATOR_BASE .. HUDHitDirection.DEFAULT_DAMAGE_INDICATOR, self._object)

	return indicator
end
function HUDHitDirection:on_hit_direction(direction, unit_type_hit)
	slot6 = direction
	local direction = self._object.child(slot4, self._object)
	slot6 = direction

	direction.stop(self._object)

	slot6 = direction
	slot11 = "_animate_hit_direction"

	direction.animate(self._object, callback(slot8, self, self))

	return 
end
function HUDHitDirection:_animate_hit_direction(direction)
	local duration = 0.6
	local t = duration
	slot7 = 1

	direction.set_alpha(slot5, direction)

	while 0 < t do
		local dt = coroutine.yield()
		t = t - dt
		slot8 = t / duration

		direction.set_alpha(slot6, direction)
	end

	slot7 = 0

	direction.set_alpha(slot5, direction)

	return 
end
function HUDHitDirection:on_hit_unit(attack_data, unit_type_hit)
	slot7 = attack_data.attacker_unit
	local attacker_id = tostring(attack_data.attacker_unit.key(slot6))

	if not self._indicators[attacker_id] then
		slot10 = "center"
		local indicator = self._create_indicator(slot5, self, "damage_indicator_unit_" .. attacker_id, 0, "center")
		slot7 = attack_data.attacker_unit
		local enemy_position = attack_data.attacker_unit.position(self)
		self._indicators[attacker_id] = {
			severity = 1,
			need_to_extend = false,
			fade_out_t = 0,
			indicator = indicator,
			position = enemy_position,
			damage = attack_data.damage,
			t = HUDHitDirection.DAMAGE_INDICATOR_DURATION,
			fade_in_t = HUDHitDirection.INDICATOR_FADE_IN_DURATION
		}
	else
		self._indicators[attacker_id].need_to_extend = true
		slot7 = attack_data.attacker_unit
		self._indicators[attacker_id].position = attack_data.attacker_unit.position(slot6)
		self._indicators[attacker_id].damage = self._indicators[attacker_id].damage + attack_data.damage
		slot7 = attacker_id

		self._set_proper_severity(self._indicators[attacker_id].damage + attack_data.damage, self)
	end

	return 
end
function HUDHitDirection:_set_proper_severity(id)
	if self._indicators[id].severity == #HUDHitDirection.SEVERITY_THRESHOLDS then
		return 
	end

	if HUDHitDirection.SEVERITY_THRESHOLDS[self._indicators[id].severity + 1] < self._indicators[id].damage then
		self._indicators[id].severity = self._indicators[id].severity + 1
		slot4 = self._indicators[id].indicator
		slot7 = tweak_data.gui.icons[HUDHitDirection.DAMAGE_INDICATOR_BASE .. self._indicators[id].severity].texture_rect

		self._indicators[id].indicator.set_texture_rect(self._indicators[id].severity + 1, unpack(slot6))
	end

	return 
end
function HUDHitDirection:update(t, dt)

	-- Decompilation error in this vicinity:
	slot5 = managers.player
	slot5 = managers.player
	slot5 = managers.player.player_unit(slot4)
	local player_pos = managers.player.player_unit(slot4).movement(slot4).m_pos(slot4)
	slot6 = managers.player
	slot6 = managers.player.player_unit(managers.player.player_unit(slot4).movement(slot4))
	local cam_fwd = managers.player.player_unit(managers.player.player_unit(slot4).movement(slot4)).camera(managers.player.player_unit(slot4).movement(slot4)).forward(managers.player.player_unit(slot4).movement(slot4))
	slot7 = self._indicators

	for id, indicator_data in pairs(managers.player.player_unit(managers.player.player_unit(slot4).movement(slot4)).camera(managers.player.player_unit(slot4).movement(slot4))) do
		indicator_data.t = indicator_data.t - dt
		slot14 = 1
		indicator_data.fade_in_t = math.clamp(slot11, indicator_data.fade_in_t - dt, 0)

		if indicator_data.t - HUDHitDirection.INDICATOR_FADE_OUT_DURATION <= 0 then
			slot14 = 1
			indicator_data.fade_out_t = math.clamp(slot11, indicator_data.fade_out_t + dt, 0)
		end

		slot13 = 1 - indicator_data.fade_in_t / HUDHitDirection.INDICATOR_FADE_IN_DURATION - indicator_data.fade_out_t / HUDHitDirection.INDICATOR_FADE_OUT_DURATION

		indicator_data.indicator.set_alpha(slot11, indicator_data.indicator)

		slot13 = player_pos.z
		local enemy_pos = self._indicators[id].position.with_z(slot11, self._indicators[id].position)
		slot13 = enemy_pos - player_pos
		slot14 = cam_fwd
		local angle = enemy_pos - player_pos.normalized(self._indicators[id].position).angle(self._indicators[id].position, enemy_pos - player_pos.normalized(self._indicators[id].position))
		slot14 = enemy_pos - player_pos
		slot15 = cam_fwd
		local cross_prod = enemy_pos - player_pos.normalized(enemy_pos - player_pos.normalized(self._indicators[id].position)).cross(enemy_pos - player_pos.normalized(self._indicators[id].position), enemy_pos - player_pos.normalized(enemy_pos - player_pos.normalized(self._indicators[id].position)))
		slot16 = math.UP
		local orientation = cross_prod.dot(enemy_pos - player_pos.normalized(enemy_pos - player_pos.normalized(self._indicators[id].position)), cross_prod)

		if orientation < 0 then
			angle = -angle
		end

		slot17 = indicator_data.indicator
		slot17 = angle - 90
		local dx = (self._object.w(slot15) / 2 - indicator_data.indicator.h(self._object) / 2) * math.cos(self._object)
		slot18 = indicator_data.indicator
		slot18 = angle - 90
		local dy = (self._object.h(self._object) / 2 - indicator_data.indicator.h(self._object) / 2) * math.sin(self._object)
		slot19 = angle

		indicator_data.indicator.set_rotation(self._object, indicator_data.indicator)

		slot22 = indicator_data.indicator
		slot19 = self._object.w(slot20) / 2 - indicator_data.indicator.w(self._object) / 2 + dx

		indicator_data.indicator.set_x(self._object, indicator_data.indicator)

		slot22 = indicator_data.indicator
		slot19 = self._object.h(indicator_data.indicator.w(self._object) / 2) / 2 - indicator_data.indicator.h(self._object) / 2 + dy

		indicator_data.indicator.set_y(self._object, indicator_data.indicator)

		if indicator_data.need_to_extend == true then
			indicator_data.t = HUDHitDirection.DAMAGE_INDICATOR_DURATION
			indicator_data.fade_out_t = 0
			indicator_data.need_to_extend = false
		end

		if indicator_data.t <= 0 then
			slot19 = id

			self._remove_indicator(slot17, self)
		end
	end

	return 
end
function HUDHitDirection:_remove_indicator(id)
	slot5 = self._indicators[id].indicator

	self._object.remove(slot3, self._object)

	self._indicators[id] = nil

	return 
end
function HUDHitDirection:clean_up()
	slot3 = self._indicators

	for index, indicator_data in pairs(slot2) do
		slot8 = indicator_data.indicator

		indicator_data.indicator.stop(slot7)

		slot9 = indicator_data.indicator

		self._object.remove(slot7, self._object)
	end

	self._indicators = {}

	return 
end

return 
