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
if not ProjectileBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

ProjectileBase = slot0
ProjectileBase.time_cheat = {}
local mvec1 = Vector3()
local mvec2 = Vector3()
local mrot1 = Rotation()
ProjectileBase.init = function (self, unit)
	slot6 = true

	ProjectileBase.super.init(slot3, self, unit)

	self._unit = unit
	self._damage_results = {}
	slot4 = self._unit
	self._spawn_position = self._unit.position(slot3)
	self._simulated = true
	self._orient_to_vel = true

	if self._setup_from_tweak_data then
		slot4 = self

		self._setup_from_tweak_data(slot3)
	end

	if self._setup_server_data then
		slot4 = Network

		if Network.is_server(slot3) then
			slot4 = self

			self._setup_server_data(slot3)
		end
	end

	return 
end
ProjectileBase.set_thrower_unit_by_peer_id = function (self, peer_id)
	if not peer_id then
		return 
	end

	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot5 = peer_id
		local peer = managers.network.session(slot3).peer(slot3, managers.network.session(slot3))

		if peer then
			slot5 = peer
			local thrower_unit = peer.unit(slot4)
		end

		slot6 = thrower_unit

		if alive(slot5) then
			slot7 = thrower_unit

			self.set_thrower_unit(slot5, self)

			slot7 = peer_id

			self.set_thrower_peer_id(slot5, self)
		end
	end

	return 
end
ProjectileBase.set_thrower_unit = function (self, unit)
	self._thrower_unit = unit

	return 
end
ProjectileBase.thrower_unit = function (self)
	slot3 = self._thrower_unit

	return (alive(slot2) and self._thrower_unit) or nil
end
ProjectileBase.set_thrower_peer_id = function (self, peer_id)
	self._thrower_peer_id = peer_id

	return 
end
ProjectileBase.get_thrower_peer_id = function (self)
	return self._thrower_peer_id or nil
end
ProjectileBase.set_parent_projectile_id = function (self, parent_projectile_id)
	self._parent_projectile_id = parent_projectile_id

	return 
end
ProjectileBase.get_parent_projectile_id = function (self)
	return self._parent_projectile_id or nil
end
ProjectileBase.get_aim_assist = function (self)
	return 
end
ProjectileBase.set_weapon_unit = function (self, weapon_unit)

	-- Decompilation error in this vicinity:
	self._weapon_unit = weapon_unit

	if weapon_unit then
		slot4 = weapon_unit
		slot4 = weapon_unit.base(slot3)
		slot2 = weapon_unit.base(slot3).get_name_id(slot3)
	end

	self._weapon_id = slot2
end
ProjectileBase.weapon_unit = function (self)
	slot3 = self._weapon_unit

	return (alive(slot2) and self._weapon_unit) or nil
end
ProjectileBase.set_projectile_entry = function (self, projectile_entry)
	self._projectile_entry = projectile_entry

	return 
end
ProjectileBase.projectile_entry = function (self)
	if not self._projectile_entry then
		slot4 = 1
		slot1 = tweak_data.blackmarket.get_projectile_name_from_index(slot2, tweak_data.blackmarket)
	end

	return slot1
end
ProjectileBase.get_name_id = function (self)

	-- Decompilation error in this vicinity:
	slot3 = self._weapon_unit
end
ProjectileBase.set_active = function (self, active)
	self._active = active
	slot7 = "base"
	slot6 = self._active

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(slot6))

	return 
end
ProjectileBase.active = function (self)
	return self._active
end
ProjectileBase.create_sweep_data = function (self)
	self._sweep_data = {
		slot_mask = self._slot_mask
	}
	slot4 = self._unit
	self._sweep_data.current_pos = self._unit.position(slot3)
	slot4 = self._sweep_data.current_pos
	self._sweep_data.last_pos = mvector3.copy(slot3)

	return 
end
ProjectileBase.throw = function (self, params)
	self._owner = params.owner
	local velocity = params.dir
	local adjust_z = 50
	local launch_speed = 250
	local push_at_body_index = nil

	if params.projectile_entry and tweak_data.projectiles[params.projectile_entry] then
		push_at_body_index = tweak_data.projectiles[params.projectile_entry].push_at_body_index
	end

	velocity = velocity * launch_speed
	slot10 = velocity.z + adjust_z
	velocity = Vector3(slot7, velocity.x, velocity.y)
	local mass_look_up_modifier = self._mass_look_up_modifier or 2
	slot12 = params.dir.z
	slot10 = 1
	local mass = math.max(slot8, mass_look_up_modifier * (1 + math.min(slot10, 0)))

	if self._simulated then
		if push_at_body_index then
			slot12 = velocity
			slot16 = push_at_body_index
			slot15 = self._unit.body(slot14, self._unit)

			self._unit.push_at(slot9, self._unit, mass, self._unit.body(slot14, self._unit).center_of_mass(slot14))
		else
			slot12 = velocity
			slot15 = self._unit

			self._unit.push_at(slot9, self._unit, mass, self._unit.position(slot14))
		end
	else
		self._velocity = velocity
	end

	if params.projectile_entry and tweak_data.projectiles[params.projectile_entry] then

		-- Decompilation error in this vicinity:
		local tweak_entry = tweak_data.projectiles[params.projectile_entry]
		local physic_effect = tweak_entry.physic_effect

		if physic_effect then
			slot14 = self._unit

			World.play_physic_effect(slot11, World, physic_effect)
		end

		if tweak_entry.throwable and tweak_entry.add_trail_effect then
			slot13 = tweak_entry.add_trail_effect

			self.add_trail_effect(slot11, self)
		end

		local unit_name = tweak_entry.sprint_unit

		if unit_name then
			slot15 = self._unit.position(unit_name)
			slot18 = self._unit
			local sprint = World.spawn_unit(slot12, World, Idstring(slot15), self._unit.rotation(self._unit))
			slot15 = math.UP
			local rot = Rotation(World, params.dir)
			slot16 = mvec1

			mrotation.x(params.dir, rot)

			slot16 = 0.25

			mvector3.multiply(params.dir, mvec1)

			slot16 = params.dir

			mvector3.add(params.dir, mvec1)

			slot16 = math.UP / 2

			mvector3.add(params.dir, mvec1)

			slot16 = 100

			mvector3.multiply(params.dir, mvec1)

			slot17 = mvec1
			slot20 = sprint

			sprint.push_at(params.dir, sprint, mass, sprint.position(slot19))

			slot15 = sprint

			self.modify_thrown_projectile(params.dir)
		end

		slot14 = params.projectile_entry

		self.set_projectile_entry(slot12, self)
	end

	return 
end
ProjectileBase.sync_throw_projectile = function (self, dir, projectile_type)
	slot6 = projectile_type
	local projectile_entry = tweak_data.blackmarket.get_projectile_name_from_index(slot4, tweak_data.blackmarket)
	slot7 = {
		dir = dir,
		projectile_entry = projectile_entry
	}

	self.throw(tweak_data.blackmarket, self)

	return 
end
ProjectileBase.update = function (self, unit, t, dt)
	if not self._simulated and not self._collided then
		slot7 = mvec1

		self._unit.m_position(slot5, self._unit)

		slot7 = self._velocity * dt

		mvector3.set(slot5, mvec2)

		slot7 = mvec2

		mvector3.add(slot5, mvec1)

		slot7 = mvec1

		self._unit.set_position(slot5, self._unit)

		if self._orient_to_vel then
			slot8 = math.UP

			mrotation.set_look_at(slot5, mrot1, mvec2)

			slot7 = mrot1

			self._unit.set_rotation(slot5, self._unit)
		end

		slot8 = self._velocity.z - 980 * dt
		self._velocity = Vector3(slot5, self._velocity.x, self._velocity.y)
	end

	if self._sweep_data and not self._collided then
		slot7 = self._sweep_data.current_pos

		self._unit.m_position(slot5, self._unit)

		slot11 = self._sweep_data.slot_mask
		local col_ray = World.raycast(slot5, World, "ray", self._sweep_data.last_pos, self._sweep_data.current_pos, "slot_mask")

		if self._draw_debug_trail then
			slot13 = 1
			slot10 = 3
			slot9 = self._sweep_data.current_pos

			Draw.brush(slot6, Draw, Color(slot9, 1, 0, 0), nil).line(slot6, Draw.brush(slot6, Draw, Color(slot9, 1, 0, 0), nil), self._sweep_data.last_pos)
		end

		if col_ray and col_ray.unit then
			slot9 = self._sweep_data.current_pos

			mvector3.direction(slot6, mvec1, self._sweep_data.last_pos)

			slot8 = col_ray.position

			mvector3.add(slot6, mvec1)

			slot8 = mvec1

			self._unit.set_position(slot6, self._unit)

			slot8 = mvec1

			self._unit.set_position(slot6, self._unit)

			if self._draw_debug_impact then
				slot13 = 1
				slot10 = 10

				Draw.brush(slot6, Draw, Color(slot9, 0.5, 0, 0), nil).sphere(slot6, Draw.brush(slot6, Draw, Color(slot9, 0.5, 0, 0), nil), col_ray.position)

				slot13 = 0
				slot10 = 10
				slot10 = self._unit
				slot9 = 3

				Draw.brush(slot6, Draw, Color(4, 0.5, 1, 0), nil).sphere(slot6, Draw.brush(slot6, Draw, Color(4, 0.5, 1, 0), nil), self._unit.position(nil))
			end

			slot7 = self._unit
			col_ray.velocity = self._unit.velocity(slot6)
			self._collided = true
			slot8 = col_ray

			self._on_collision(slot6, self)
		end

		slot8 = self._sweep_data.last_pos

		self._unit.m_position(slot6, self._unit)
	end

	return 
end
ProjectileBase.clbk_impact = function (self, tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if self._sweep_data and not self._collided then
		slot17 = position

		mvector3.set(slot15, mvec2)

		slot17 = self._sweep_data.last_pos

		mvector3.subtract(slot15, mvec2)

		slot17 = 2

		mvector3.multiply(slot15, mvec2)

		slot17 = self._sweep_data.last_pos

		mvector3.add(slot15, mvec2)

		slot21 = self._sweep_data.slot_mask
		local col_ray = World.raycast(slot15, World, "ray", self._sweep_data.last_pos, mvec2, "slot_mask")

		if col_ray and col_ray.unit then
			if self._draw_debug_impact then
				slot23 = 1
				slot20 = 10

				Draw.brush(slot16, Draw, Color(slot19, 0.5, 0, 0), nil).sphere(slot16, Draw.brush(slot16, Draw, Color(slot19, 0.5, 0, 0), nil), col_ray.position)

				slot23 = 0
				slot20 = 10
				slot20 = self._unit
				slot19 = 3

				Draw.brush(slot16, Draw, Color(4, 0.5, 1, 0), nil).sphere(slot16, Draw.brush(slot16, Draw, Color(4, 0.5, 1, 0), nil), self._unit.position(nil))
			end

			slot19 = col_ray.position

			mvector3.direction(slot16, mvec1, self._sweep_data.last_pos)

			slot18 = col_ray.position

			mvector3.add(slot16, mvec1)

			slot18 = mvec1

			self._unit.set_position(slot16, self._unit)

			slot18 = mvec1

			self._unit.set_position(slot16, self._unit)

			col_ray.velocity = velocity
			self._collided = true
			slot18 = col_ray

			self._on_collision(slot16, self)
		end
	end

	return 
end
ProjectileBase._on_collision = function (self, col_ray)
	slot4 = "_on_collision"
	slot7 = col_ray

	print(slot3, inspect(slot6))

	return 
end
ProjectileBase._bounce = function (self, ...)
	slot3 = "_bounce"

	print(slot2, ...)

	return 
end
ProjectileBase.save = function (self, data)
	local state = {
		timer = self._timer
	}
	data.ProjectileBase = state

	return 
end
ProjectileBase.load = function (self, data)
	local state = data.ProjectileBase
	self._timer = state.timer

	return 
end
ProjectileBase.destroy = function (self)
	return 
end
slot5 = "object3d"
local ids_object3d = Idstring(function (self)
	return 
end)
ProjectileBase.throw_projectile = function (projectile_type, pos, dir, owner_peer_id, cooking_t, parent_projectile_id)
	if not projectile_type then
		slot10 = self._values.grenade_type

		Application.error(slot7, Application, "[ProjectileBase.throw_projectile] Trying to spawn an unknown projectile type: ", debug.traceback())

		return 
	end

	slot9 = projectile_type
	local projectile_entry = tweak_data.blackmarket.get_projectile_name_from_index(slot7, tweak_data.blackmarket)
	slot10 = owner_peer_id

	if not ProjectileBase.check_time_cheat(tweak_data.blackmarket, projectile_type) then
		return 
	end

	local tweak_entry = tweak_data.projectiles[projectile_entry]
	slot12 = Network
	slot10 = (not Network.is_server(slot11) and tweak_entry.local_unit) or tweak_entry.unit
	local unit_name = Idstring(slot9)
	local rot_dir = tweak_entry._rot_dir or math.UP
	slot18 = rot_dir
	local unit = World.spawn_unit(slot11, World, unit_name, Rotation(slot16, dir))
	slot16 = ids_object3d

	for _, o in ipairs(unit.get_objects_by_type(pos, unit)) do
		if o.set_skip_detail_distance_culling then
			slot19 = true

			o.set_skip_detail_distance_culling(slot17, o)
		end
	end

	if cooking_t then
		slot13 = unit

		if unit.base(slot12)._timer then
			slot14 = unit
			unit.base(slot12)._timer = unit.base(unit)._timer - cooking_t
			slot13 = unit

			if unit.base(unit.base(unit)._timer - cooking_t)._timer < 0.3 then
				slot13 = unit
				unit.base(slot12)._timer = 0.3
			end
		end
	end

	if owner_peer_id then
		slot13 = managers.network

		if managers.network.session(slot12) then
			slot13 = managers.network
			slot14 = owner_peer_id
			local peer = managers.network.session(slot12).peer(slot12, managers.network.session(slot12))

			if peer then
				slot14 = peer
				local thrower_unit = peer.unit(slot13)
			end

			slot15 = thrower_unit

			if alive(slot14) then
				slot15 = unit
				slot16 = thrower_unit

				unit.base(slot14).set_thrower_unit(slot14, unit.base(slot14))

				slot15 = unit
				slot16 = owner_peer_id

				unit.base(slot14).set_thrower_peer_id(slot14, unit.base(slot14))

				if not tweak_entry.throwable then
					slot15 = thrower_unit

					if thrower_unit.movement(slot14) then
						slot15 = thrower_unit
						slot15 = thrower_unit.movement(slot14)

						if thrower_unit.movement(slot14).current_state(slot14) then
							slot15 = unit
							slot18 = thrower_unit
							slot18 = thrower_unit.movement(slot17)
							slot16 = thrower_unit.movement(slot17).current_state(slot17)._equipped_unit

							unit.base(slot14).set_weapon_unit(slot14, unit.base(slot14))
						end
					end
				end
			end
		end
	end

	if parent_projectile_id then
		slot13 = unit
		slot14 = parent_projectile_id

		unit.base(slot12).set_parent_projectile_id(slot12, unit.base(slot12))
	end

	slot13 = unit
	slot14 = {
		dir = dir,
		projectile_entry = projectile_entry
	}

	unit.base(slot12).throw(slot12, unit.base(slot12))

	slot13 = unit

	if unit.base(slot12).set_owner_peer_id then
		slot13 = unit
		slot14 = owner_peer_id

		unit.base(slot12).set_owner_peer_id(slot12, unit.base(slot12))
	end

	slot13 = managers.network
	slot17 = unit
	slot19 = owner_peer_id or 0
	slot22 = unit
	slot22 = unit.base(slot21)

	managers.network.session(slot12).send_to_peers_synched(slot12, managers.network.session(slot12), "sync_throw_projectile", (unit.id(slot16) ~= -1 and unit) or nil, pos, dir, projectile_type, unit.base(slot21).get_parent_projectile_id(slot21))

	if tweak_data.projectiles[projectile_entry].impact_detonation then
		slot13 = unit
		slot13 = unit.damage(slot12)
		slot19 = unit
		slot18 = "clbk_impact"

		unit.damage(slot12).add_body_collision_callback(slot12, callback(slot15, unit.base(slot17), unit.base(unit)))

		slot13 = unit
		slot13 = unit.base(slot12)

		unit.base(slot12).create_sweep_data(slot12)
	end

	return unit
end
ProjectileBase.add_trail_effect = function (self)
	return 
end
ProjectileBase.check_time_cheat = function (projectile_type, owner_peer_id)
	if not owner_peer_id then
		return true
	end

	slot5 = projectile_type
	local projectile_entry = tweak_data.blackmarket.get_projectile_name_from_index(slot3, tweak_data.blackmarket)

	if tweak_data.projectiles[projectile_entry].time_cheat then
		ProjectileBase.time_cheat[projectile_type] = ProjectileBase.time_cheat[projectile_type] or {}

		if ProjectileBase.time_cheat[projectile_type][owner_peer_id] then
			slot6 = Application

			if Application.time(slot5) < ProjectileBase.time_cheat[projectile_type][owner_peer_id] then
				return false
			end
		end

		slot6 = Application
		ProjectileBase.time_cheat[projectile_type][owner_peer_id] = Application.time(slot5) + tweak_data.projectiles[projectile_entry].time_cheat
	end

	return true
end
ProjectileBase.spawn = function (unit_name, pos, rot)
	slot8 = unit_name
	slot8 = rot
	local unit = World.spawn_unit(slot4, World, Idstring(slot7), pos)

	return unit
end
ProjectileBase._dispose_of_sound = function (...)
	return 
end
ProjectileBase._detect_and_give_dmg = function (self, hit_pos)
	local params = {
		hit_pos = hit_pos,
		collision_slotmask = self._collision_slotmask,
		user = self._user,
		damage = self._damage,
		player_damage = self._player_damage or self._damage,
		range = self._range,
		ignore_unit = self._ignore_unit,
		curve_pow = self._curve_pow,
		col_ray = self._col_ray,
		alert_filter = self._alert_filter,
		owner = self._owner
	}
	slot6 = params
	local hit_units, splinters = managers.explosion.detect_and_give_dmg(slot4, managers.explosion)

	return hit_units, splinters
end
ProjectileBase._explode_on_client = function (position, normal, user_unit, dmg, range, curve_pow, custom_params)
	slot13 = custom_params

	managers.explosion.play_sound_and_effects(slot8, managers.explosion, position, normal, range)

	slot15 = curve_pow

	managers.explosion.client_damage_and_push(slot8, managers.explosion, position, normal, user_unit, dmg, range)

	return 
end
ProjectileBase._play_sound_and_effects = function (position, normal, range, custom_params)
	slot10 = custom_params

	managers.explosion.play_sound_and_effects(slot5, managers.explosion, position, normal, range)

	return 
end

return 
