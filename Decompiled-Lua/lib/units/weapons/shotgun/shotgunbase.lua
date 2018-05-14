-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not ShotgunBase then
	slot2 = RaycastWeaponBase
	slot0 = class(slot1)
end

ShotgunBase = slot0
function ShotgunBase:init(...)
	slot3 = self

	ShotgunBase.super.init(slot2, ...)

	self._damage_falloff_near = tweak_data.weapon[self._name_id].damage_falloff_near
	self._damage_falloff_far = tweak_data.weapon[self._name_id].damage_falloff_far
	self._DAMAGE_AT_FAR = tweak_data.weapon[self._name_id].DAMAGE_AT_FAR or 1
	self._range = self._damage_falloff_far

	return 
end
function ShotgunBase:_create_use_setups()
	local use_data = {}
	local player_setup = {
		selection_index = tweak_data.weapon[self._name_id].use_data.selection_index,
		equip = {
			align_place = tweak_data.weapon[self._name_id].use_data.align_place or "left_hand"
		},
		unequip = {
			align_place = "back"
		}
	}
	use_data.player = player_setup
	self._use_data = use_data

	return 
end
local mvec_to = Vector3()
local mvec_spread_direction = Vector3()
function ShotgunBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
	local result = {}
	local hit_enemies = {}
	local hit_something, col_rays = nil

	if self._alert_events then
		col_rays = {}
	end

	slot16 = dmg_mul
	local damage = self._get_current_damage(slot14, self)
	slot19 = self._range
	local autoaim, dodge_enemies = self.check_autoaim(self, self, from_pos, direction)
	local weight = 0.1
	local enemy_died = false

	local function hit_enemy(col_ray)
		slot3 = col_ray.unit

		if col_ray.unit.character_damage(slot2) then
			slot3 = col_ray.unit
		else
			slot7 = damage

			InstantBulletBase.on_collision(slot2, InstantBulletBase, col_ray, self._unit, user_unit)
		end

		return 
	end

	for i = 1, 6, 1 do
		slot26 = user_unit
		local spread = self._get_spread(slot24, self)
		slot27 = direction

		mvector3.set(self, mvec_spread_direction)

		if spread then
			slot27 = spread * (spread_mul or 1)

			mvector3.spread(slot25, mvec_spread_direction)
		end

		slot27 = mvec_spread_direction

		mvector3.set(slot25, mvec_to)

		slot27 = 20000

		mvector3.multiply(slot25, mvec_to)

		slot27 = from_pos

		mvector3.add(slot25, mvec_to)

		slot33 = self._setup.ignore_units
		local col_ray = World.raycast(slot25, World, "ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit")

		if col_rays then
			if col_ray then
				slot28 = col_ray

				table.insert(slot26, col_rays)
			else
				local ray_to = mvector3.copy(slot26)
				local spread_direction = mvector3.copy(mvec_to)
				slot30 = {
					position = ray_to,
					ray = spread_direction
				}

				table.insert(mvec_spread_direction, col_rays)
			end
		end

		if self._autoaim and autoaim then
			if col_ray then
				slot27 = col_ray.unit
				slot31 = "enemies"
			else
				autoaim = false
				slot30 = self._range
				local autohit = self.check_autoaim(slot26, self, from_pos, direction)

				if autohit then
					slot30 = 1
					local autohit_chance = 1 - math.clamp(slot27, (self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0)

					if math.random() < autohit_chance then
						self._autohit_current = (self._autohit_current + weight) / (1 + weight)
						hit_something = true
						slot29 = autohit

						hit_enemy(1 + weight)
					else
						self._autohit_current = self._autohit_current / (1 + weight)
					end
				elseif col_ray then
					hit_something = true
					slot28 = col_ray

					hit_enemy(slot27)
				end
			end
		elseif col_ray then
			hit_something = true
			slot27 = col_ray

			hit_enemy(slot26)
		end
	end

	slot21 = hit_enemies

	for _, col_ray in pairs(slot20) do
		slot26 = col_ray.unit.position(slot27)
		slot29 = user_unit
		local dist = mvector3.distance(slot25, user_unit.position(col_ray.unit))

		if self._damage_falloff_near < dist and dist < self._damage_falloff_far then
			local falloff_distance_percentage = 1 - (dist - self._damage_falloff_near) / (self._damage_falloff_far - self._damage_falloff_near)
			local damage_range = damage - self._DAMAGE_AT_FAR
			damage = falloff_distance_percentage * damage_range + self._DAMAGE_AT_FAR
		elseif self._damage_falloff_far <= dist then
			damage = self._DAMAGE_AT_FAR
		end

		slot31 = damage
		local result = InstantBulletBase.on_collision(slot26, InstantBulletBase, col_ray, self._unit, user_unit)

		if result and result.type == "death" and col_ray.distance < 500 then
			slot28 = col_ray.unit

			if col_ray.unit.movement(slot27)._active_actions[1] then
				slot28 = col_ray.unit
				slot28 = col_ray.unit.movement(slot27)._active_actions[1]

				if col_ray.unit.movement(slot27)._active_actions[1].type(slot27) == "hurt" then
					slot28 = col_ray.unit
					slot28 = col_ray.unit.movement(slot27)._active_actions[1]

					col_ray.unit.movement(slot27)._active_actions[1].force_ragdoll(slot27)
				end
			end

			slot30 = 1
			local scale = math.clamp(slot27, 1 - col_ray.distance / 500, 0.5)
			local unit = col_ray.unit
			slot33 = col_ray.unit
			local height = mvector3.distance(0.5, col_ray.unit.position(slot32)) - 100
			slot31 = 2
			local twist_dir = (math.random(col_ray.position) == 1 and 1) or -1
			slot33 = math.UP
			slot33 = height
			local rot_acc = (col_ray.ray.cross(slot31, col_ray.ray) + math.UP * 0.5 * twist_dir) * -1000 * math.sign(0.5 * twist_dir)
			local rot_time = 1 + math.rand(0.5 * twist_dir)
			slot34 = unit
			local nr_u_bodies = unit.num_bodies(2)
			local i_u_body = 0

			while i_u_body < nr_u_bodies do
				slot37 = i_u_body
				local u_body = unit.body(slot35, unit)
				slot37 = u_body

				if u_body.enabled(unit) then
					slot37 = u_body

					if u_body.dynamic(slot36) then
						local body_mass = u_body.mass(slot36)
						slot41 = "physic_effects/shotgun_hit"
						slot45 = col_ray.ray.z + 0.5
						slot45 = 2
						slot44 = rot_time

						World.play_physic_effect(u_body, World, Idstring(slot40), u_body, Vector3(slot42, col_ray.ray.x, col_ray.ray.y) * 600 * scale, (4 * body_mass) / math.random(col_ray.ray.y), rot_acc)
					end
				end

				i_u_body = i_u_body + 1
			end
		end
	end

	if dodge_enemies and self._suppression then
		slot21 = dodge_enemies

		for enemy_data, dis_error in pairs(slot20) do
			slot26 = enemy_data.unit
			slot28 = self._panic_suppression_chance

			enemy_data.unit.character_damage(slot25).build_suppression(slot25, enemy_data.unit.character_damage(slot25), suppr_mul * dis_error * self._suppression)
		end
	end

	slot21 = hit_enemies
	result.hit_enemy = (next(slot20) and true) or false

	if self._alert_events then
		result.rays = 0 < #col_rays and col_rays
	end

	slot22 = {
		hit = result.hit_enemy,
		weapon_unit = self._unit
	}

	managers.statistics.shot_fired(slot20, managers.statistics)

	return result
end
function ShotgunBase:reload_expire_t()
	local ammo_remaining_in_clip = self.get_ammo_remaining_in_clip(slot2)
	slot7 = self
	slot5 = self.get_ammo_max_per_clip(self) - ammo_remaining_in_clip

	return (math.min(self, self.get_ammo_total(slot5) - ammo_remaining_in_clip) * 20) / 30
end
function ShotgunBase:reload_enter_expire_t()
	return 0.3
end
function ShotgunBase:reload_exit_expire_t()
	return 1.3
end
function ShotgunBase:reload_not_empty_exit_expire_t()
	return 1
end
function ShotgunBase:start_reload(...)
	slot3 = self

	ShotgunBase.super.start_reload(slot2, ...)

	slot3 = self
	self._started_reload_empty = self.clip_empty(slot2)
	local speed_multiplier = self.reload_speed_multiplier(slot2)
	slot4 = Application
	self._next_shell_reloded_t = Application.time(self) + 0.3366666666666666 / speed_multiplier

	return 
end
function ShotgunBase:started_reload_empty()
	return self._started_reload_empty
end
function ShotgunBase:update_reloading(t, dt, time_left)
	if self._next_shell_reloded_t < t then
		slot6 = self
		local speed_multiplier = self.reload_speed_multiplier(slot5)
		self._next_shell_reloded_t = self._next_shell_reloded_t + 0.6666666666666666 / speed_multiplier
		slot7 = self
		slot13 = self
		slot11 = self.get_ammo_remaining_in_clip(self) + 1

		self.set_ammo_remaining_in_clip(0.6666666666666666 / speed_multiplier, math.min(slot9, self.get_ammo_max_per_clip(slot11)))

		slot11 = self._name_id
		slot10 = true

		managers.raid_job.set_memory(0.6666666666666666 / speed_multiplier, managers.raid_job, "kill_count_no_reload_" .. tostring(self.get_ammo_max_per_clip(slot11)), nil)

		return true
	end

	return 
end
function ShotgunBase:reload_interuptable()
	return true
end

return 
