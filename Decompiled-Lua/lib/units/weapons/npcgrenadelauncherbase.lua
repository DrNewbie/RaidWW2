if not NPCGrenadeLauncherBase then
	slot2 = NPCRaycastWeaponBase
	slot0 = class(slot1)
end

NPCGrenadeLauncherBase = slot0
function NPCGrenadeLauncherBase:init(...)
	slot3 = self

	NPCGrenadeLauncherBase.super.init(slot2, ...)

	self._grenade_id = self.grenade_id or "m24"

	return 
end
function NPCGrenadeLauncherBase:ejects_shells()
	return false
end
function NPCGrenadeLauncherBase:fire_blank(direction, impact)
	slot5 = World
	slot6 = self._muzzle_effect_table

	World.effect_manager(slot4).spawn(slot4, World.effect_manager(slot4))

	slot5 = self

	self._sound_singleshot(slot4)

	return 
end
function NPCGrenadeLauncherBase:singleshot(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	slot11 = Network

	if not Network.is_server(slot10) then
		return 
	end

	slot19 = target_unit
	local fired = self.fire(slot10, self, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
	slot14 = fired

	Application.trace(self, Application, "[NPCGrenadeLauncherBase:singleshot]   fired: ")

	if fired then
		slot12 = self._obj_fire
		slot12 = self._obj_fire.rotation(slot11)
		local direction = self._obj_fire.rotation(slot11).y(slot11)

		if fired.hit_pos then
			slot14 = self._obj_fire
			slot13 = fired.hit_pos - self._obj_fire.position(slot13)
			direction = fired.hit_pos - self._obj_fire.position(slot13).normalized(self._obj_fire.position(slot13))
		elseif target_unit then
			slot14 = self._obj_fire
			slot13 = target_unit.position(slot12) - self._obj_fire.position(target_unit)
			direction = target_unit.position(slot12) - self._obj_fire.position(target_unit).normalized(self._obj_fire.position(target_unit))
		end

		slot14 = self._grenade_id
		local index = tweak_data.blackmarket.get_index_from_projectile_id(slot12, tweak_data.blackmarket)
		slot17 = self._obj_fire
		slot16 = direction * 10

		ProjectileBase.throw_projectile(tweak_data.blackmarket, index, self._obj_fire.position(slot16))

		slot14 = self

		self._sound_singleshot(tweak_data.blackmarket)
	end

	return fired
end
local mvec_to = Vector3()
local mvec_spread_direction = Vector3()
local mvec1 = Vector3()
function NPCGrenadeLauncherBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	local result = {}
	local hit_unit = nil
	slot15 = user_unit
	local spread = self._get_spread(slot13, self)
	slot16 = direction

	mvector3.set(self, mvec_spread_direction)

	if spread then
	end

	local ray_distance = self._weapon_range or 20000

	if target_unit then
		slot16 = mvec_to
		slot19 = target_unit

		mvector3.set(slot15, target_unit.position(slot18))
	else
		slot17 = direction

		mvector3.set(slot15, mvec_to)

		slot17 = ray_distance

		mvector3.multiply(slot15, mvec_to)

		slot17 = from_pos

		mvector3.add(slot15, mvec_to)
	end

	slot23 = self._setup.ignore_units
	local col_ray = World.raycast(slot15, World, "ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit")

	if col_ray then
		result.hit_enemy = col_ray.hit_unit
	end

	if self._alert_events then
		result.rays = {
			col_ray
		}

		if col_ray then
			result.hit_pos = col_ray.position
			slot19 = result.hit_pos

			Application.debug(slot16, Application, "hit pos ")
		end
	end

	return result
end

return 
