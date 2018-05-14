-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not NewFlamethrowerBase then
	slot2 = NewRaycastWeaponBase
	slot0 = class(slot1)
end

NewFlamethrowerBase = slot0
NewFlamethrowerBase.EVENT_IDS = {
	flamethrower_effect = 1
}
function NewFlamethrowerBase:init(...)
	slot3 = self

	NewFlamethrowerBase.super.init(slot2, ...)

	slot3 = self

	self.setup_default(slot2)

	return 
end
function NewFlamethrowerBase:setup_default()
	self._rays = tweak_data.weapon[self._name_id].rays or 6
	self._range = tweak_data.weapon[self._name_id].flame_max_range or 1000
	self._flame_max_range = tweak_data.weapon[self._name_id].flame_max_range
	self._single_flame_effect_duration = tweak_data.weapon[self._name_id].single_flame_effect_duration
	self._bullet_class = FlameBulletBase

	return 
end
function NewFlamethrowerBase:update(unit, t, dt)
	return 
end
function NewFlamethrowerBase:_create_use_setups()
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
function NewFlamethrowerBase:_update_stats_values()
	slot3 = self

	NewFlamethrowerBase.super._update_stats_values(slot2)

	slot3 = self

	self.setup_default(slot2)

	if self._ammo_data and self._ammo_data.rays ~= nil then
		self._rays = self._ammo_data.rays
	end

	return 
end
function NewFlamethrowerBase:get_damage_falloff(damage, col_ray, user_unit)
	return 
end
function NewFlamethrowerBase:_spawn_muzzle_effect(from_pos, direction)
	slot5 = self._unit
	slot7 = direction

	self._unit.flamethrower_effect_extension(slot4)._spawn_muzzle_effect(slot4, self._unit.flamethrower_effect_extension(slot4), from_pos)

	return 
end
local mvec_to = Vector3()
local mvec_direction = Vector3()
local mvec_spread_direction = Vector3()
function NewFlamethrowerBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)

	-- Decompilation error in this vicinity:
	if self._rays == 1 then
		slot21 = shoot_through_data
		local result = NewFlamethrowerBase.super._fire_raycast(slot11, self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)

		return result
	end

	local result = {}
	local hit_enemies = {}
	local hit_something, col_rays = nil

	if self._alert_events then
		col_rays = {}
	end

	slot17 = dmg_mul
	local damage = self._get_current_damage(slot15, self)
	slot20 = self._range
	local autoaim, dodge_enemies = self.check_autoaim(self, self, from_pos, direction)
	local weight = 0.1
	local enemy_died = false

	local function hit_enemy(col_ray)
		slot3 = col_ray.unit

		if col_ray.unit.character_damage(slot2) then
			slot3 = col_ray.unit
		else
			slot7 = damage

			self._bullet_class.on_collision(slot2, self._bullet_class, col_ray, self._unit, user_unit)
		end

		return 
	end

	slot23 = user_unit
	local spread = self._get_spread(slot21, self)
	slot24 = direction

	mvector3.set(self, mvec_direction)

	for i = 1, self._rays, 1 do
		slot28 = mvec_direction

		mvector3.set(slot26, mvec_spread_direction)

		if spread then
			slot28 = spread * (spread_mul or 1)

			mvector3.spread(slot26, mvec_spread_direction)
		end

		slot28 = mvec_spread_direction

		mvector3.set(slot26, mvec_to)

		slot28 = 20000

		mvector3.multiply(slot26, mvec_to)

		slot28 = from_pos

		mvector3.add(slot26, mvec_to)

		local search_for_targets = true
		local raycast_from = from_pos
		local raycast_to = mvec_to
		slot30 = self._setup.ignore_units
		local raycast_ignore_units = clone(slot29)
		local test_color = 1
		local col_ray, test_last_raycast_hit_position = nil

		while search_for_targets do

			-- Decompilation error in this vicinity:
			slot41 = raycast_ignore_units
			col_ray = World.raycast(slot33, World, "ray", raycast_from, raycast_to, "slot_mask", self._bullet_slotmask, "ignore_unit")

			if test_last_raycast_hit_position == nil then
				test_last_raycast_hit_position = raycast_from
			end

			if col_rays then
				if col_ray then
					if col_ray then
						test_last_raycast_hit_position = col_ray.hit_position
					end

					if self._flame_max_range < col_ray.distance then
						search_for_targets = false

						break
					else
						slot34 = col_ray.unit
						slot38 = "world_geometry"

						if col_ray.unit.in_slot(slot33, managers.slot.get_mask(slot36, managers.slot)) then
							slot35 = col_ray

							table.insert(slot33, col_rays)

							search_for_targets = false
						else
							slot35 = col_ray.unit

							table.insert(slot33, raycast_ignore_units)
						end
					end
				else
					local ray_to = mvector3.copy(slot33)
					local spread_direction = mvector3.copy(raycast_to)
					slot37 = {
						position = ray_to,
						ray = spread_direction
					}

					table.insert(mvec_spread_direction, col_rays)

					search_for_targets = false
				end
			end

			hit_something = true
			slot34 = col_ray

			hit_enemy(slot33)
		end
	end

	slot23 = hit_enemies

	for _, col_ray in pairs(slot22) do
		if 0 < damage then
			slot32 = damage
			local result = self._bullet_class.on_collision(slot27, self._bullet_class, col_ray, self._unit, user_unit)

			if result and result.type == "death" then
			end
		end
	end

	if dodge_enemies and self._suppression then
		slot23 = dodge_enemies

		for enemy_data, dis_error in pairs(slot22) do
			slot28 = enemy_data.unit
			slot30 = self._panic_suppression_chance

			enemy_data.unit.character_damage(slot27).build_suppression(slot27, enemy_data.unit.character_damage(slot27), suppr_mul * dis_error * self._suppression)
		end
	end

	slot23 = hit_enemies
	result.hit_enemy = (next(slot22) and true) or false

	if self._alert_events then
		result.rays = 0 < #col_rays and col_rays
	end

	slot24 = {
		hit = false,
		weapon_unit = self._unit
	}

	managers.statistics.shot_fired(slot22, managers.statistics)

	slot23 = hit_enemies

	return result
end
function NewFlamethrowerBase:reload_interuptable()
	return false
end
function NewFlamethrowerBase:calculate_vertical_recoil_kick()
	return 0
end
function NewFlamethrowerBase:third_person_important()
	return true
end

return 
