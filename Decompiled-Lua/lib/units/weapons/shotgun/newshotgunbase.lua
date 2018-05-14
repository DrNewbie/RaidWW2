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
if not NewShotgunBase then
	slot2 = NewRaycastWeaponBase
	slot0 = class(slot1)
end

NewShotgunBase = slot0
function NewShotgunBase:init(...)
	slot3 = self

	NewShotgunBase.super.init(slot2, ...)

	slot3 = self

	self.setup_default(slot2)

	return 
end
function NewShotgunBase:setup_default()
	self._damage_falloff_near = tweak_data.weapon[self._name_id].damage_falloff_near
	self._damage_falloff_far = tweak_data.weapon[self._name_id].damage_falloff_far
	self._DAMAGE_AT_FAR = tweak_data.weapon[self._name_id].DAMAGE_AT_FAR or 1
	self._rays = tweak_data.weapon[self._name_id].rays or 6
	self._range = self._damage_falloff_far
	self._use_shotgun_reload = self._use_shotgun_reload or self._use_shotgun_reload == nil

	return 
end
function NewShotgunBase:_create_use_setups()
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
function NewShotgunBase:_update_stats_values()
	slot3 = self

	NewShotgunBase.super._update_stats_values(slot2)

	slot3 = self

	self.setup_default(slot2)

	if self._ammo_data then
		if self._ammo_data.rays ~= nil then
			self._rays = self._ammo_data.rays
		end

		self._range = 1000
		slot3 = self

		if self.weapon_tweak_data(slot2).damage_profile then
			slot3 = self
			local damage_profile = self.weapon_tweak_data(slot2).damage_profile
			self._range = damage_profile[#damage_profile].range or self._range
		end
	end

	return 
end
local mvec_temp = Vector3()
local mvec_to = Vector3()
local mvec_direction = Vector3()
local mvec_spread_direction = Vector3()
function NewShotgunBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)

	-- Decompilation error in this vicinity:
	local result = nil
	local hit_enemies = {}
	local hit_objects = {}
	local hit_something, col_rays = nil

	if self._alert_events then
		col_rays = {}
	end

	slot18 = dmg_mul
	local damage = self._get_current_damage(slot16, self)
	slot21 = self._range
	local autoaim, dodge_enemies = self.check_autoaim(self, self, from_pos, direction)
	local weight = 0.1
	local enemy_died = false

	local function hit_enemy(col_ray)
		slot3 = col_ray.unit

		if col_ray.unit.character_damage(slot2) then
			slot3 = col_ray.unit
			local enemy_key = col_ray.unit.key(slot2)
		else
			add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_wall

			if add_shoot_through_bullet then
				slot5 = col_ray.unit
				slot7 = col_ray.unit
				hit_objects[col_ray.unit.key(slot4)] = hit_objects[col_ray.unit.key(slot6)] or {}
				slot7 = col_ray.unit
				slot5 = col_ray

				table.insert(col_ray.unit.key(slot4), hit_objects[col_ray.unit.key(slot6)])
			else
				slot8 = damage

				self._bullet_class.on_collision(slot3, self._bullet_class, col_ray, self._unit, user_unit)
			end
		end

		return 
	end

	slot24 = user_unit
	local spread = self._get_spread(slot22, self)
	slot25 = direction

	mvector3.set(self, mvec_direction)

	if spread then
	end

	slot22 = 1
	slot23 = (shoot_through_data and 1) or self._rays

	for i = slot22, slot23, 1 do

		-- Decompilation error in this vicinity:
		slot29 = mvec_direction

		mvector3.set(slot27, mvec_spread_direction)

		if spread then
			slot29 = spread * (spread_mul or 1)

			mvector3.spread(slot27, mvec_spread_direction)
		end

		slot29 = mvec_spread_direction

		mvector3.set(slot27, mvec_to)

		slot29 = 20000

		mvector3.multiply(slot27, mvec_to)

		slot29 = from_pos

		mvector3.add(slot27, mvec_to)

		if self._autoaim and autoaim then
			if col_ray then
				slot30 = col_ray.unit
				slot34 = "enemies"
			else
				autoaim = false
				slot33 = self._range
				local autohit = self.check_autoaim(slot29, self, from_pos, direction)

				if autohit then
					slot33 = 1
					local autohit_chance = 1 - math.clamp(slot30, (self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0)

					if math.random() < autohit_chance then
						self._autohit_current = (self._autohit_current + weight) / (1 + weight)
						hit_something = true
						slot32 = autohit

						hit_enemy(1 + weight)
					else
						self._autohit_current = self._autohit_current / (1 + weight)
					end
				elseif col_ray then
					hit_something = true
					slot31 = col_ray

					hit_enemy(slot30)
				end
			end
		elseif col_ray then
			hit_something = true
			slot30 = col_ray

			hit_enemy(slot29)
		end
	end

	slot24 = hit_objects

	for _, col_rays in pairs(slot23) do
		local center_ray = col_rays[1]

		if 1 < #col_rays then
			slot31 = center_ray

			mvector3.set_static(slot29, mvec_temp)

			slot30 = col_rays

			for _, col_ray in ipairs(slot29) do
				slot36 = col_ray.position

				mvector3.add(slot34, mvec_temp)
			end

			slot31 = #col_rays

			mvector3.divide(slot29, mvec_temp)

			local closest_dist_sq = mvector3.distance_sq(slot29, mvec_temp)
			local dist_sq = nil
			slot32 = col_rays

			for _, col_ray in ipairs(center_ray.position) do
				slot38 = col_ray.position
				dist_sq = mvector3.distance_sq(slot36, mvec_temp)

				if dist_sq < closest_dist_sq then
					closest_dist_sq = dist_sq
					center_ray = col_ray
				end
			end
		end

		slot39 = shoot_through_data

		NewShotgunBase.super._fire_raycast(slot29, self, user_unit, from_pos, center_ray.ray, dmg_mul, shoot_player, 0, autohit_mul, suppr_mul)
	end

	slot24 = hit_enemies

	for _, col_ray in pairs(slot23) do
		slot31 = user_unit
		local damage = self.get_damage_falloff(slot28, self, col_ray)

		if 0 < damage then
			local my_result = nil
			local add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_enemy or self._can_shoot_through_wall

			if add_shoot_through_bullet then
				slot41 = shoot_through_data
				my_result = NewShotgunBase.super._fire_raycast(slot31, self, user_unit, from_pos, col_ray.ray, dmg_mul, shoot_player, 0, autohit_mul, suppr_mul)
			else
				slot36 = damage
				my_result = self._bullet_class.on_collision(slot31, self._bullet_class, col_ray, self._unit, user_unit)
			end

			if my_result and my_result.type == "death" then
				slot36 = col_ray.distance

				managers.game_play_central.do_shotgun_push(slot31, managers.game_play_central, col_ray.unit, col_ray.position, col_ray.ray)
			end
		end
	end

	if dodge_enemies and self._suppression then
		slot24 = dodge_enemies

		for enemy_data, dis_error in pairs(slot23) do
			slot29 = enemy_data.unit
			slot31 = self._panic_suppression_chance

			enemy_data.unit.character_damage(slot28).build_suppression(slot28, enemy_data.unit.character_damage(slot28), suppr_mul * dis_error * self._suppression)
		end
	end

	if not result then
		result = {}
		slot24 = hit_enemies
		result.hit_enemy = (next(slot23) and true) or false

		if self._alert_events then
			result.rays = 0 < #col_rays and col_rays
		end
	end

	if not shoot_through_data then
		slot25 = {
			hit = false,
			weapon_unit = self._unit
		}

		managers.statistics.shot_fired(slot23, managers.statistics)
	end

	slot24 = hit_enemies

	return result
end

if not SaigaShotgun then
	slot6 = NewShotgunBase
	slot4 = class(slot5)
end

SaigaShotgun = slot4
function SaigaShotgun:init(...)
	slot3 = self

	SaigaShotgun.super.init(slot2, ...)

	self._use_shotgun_reload = false

	return 
end

if not InstantElectricBulletBase then
	slot6 = InstantBulletBase
	slot4 = class(slot5)
end

InstantElectricBulletBase = slot4
function InstantElectricBulletBase:give_impact_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing)

	-- Decompilation error in this vicinity:
	local hit_unit = col_ray.unit
	local action_data = {
		damage = 0,
		weapon_unit = weapon_unit,
		attacker_unit = user_unit,
		col_ray = col_ray,
		armor_piercing = armor_piercing,
		attacker_unit = user_unit,
		attack_dir = col_ray.ray
	}
	slot10 = weapon_unit

	return defense_data
end

return 
