if not NPCSpottingOpticsWeaponBase then
	slot2 = NPCRaycastWeaponBase
	slot0 = class(slot1)
end

NPCSpottingOpticsWeaponBase = slot0
function NPCSpottingOpticsWeaponBase:init(...)
	slot3 = self

	NPCSpottingOpticsWeaponBase.super.init(slot2, ...)

	return 
end
function NPCSpottingOpticsWeaponBase:setup(setup_data)
	slot5 = setup_data

	NPCSpottingOpticsWeaponBase.super.setup(slot3, self)

	slot5 = setup_data.user_unit

	managers.barrage.register_spotter(slot3, managers.barrage)

	return 
end
function NPCSpottingOpticsWeaponBase:ejects_shells()
	return false
end
function NPCSpottingOpticsWeaponBase:fire_blank(direction, impact)
	return 
end
function NPCSpottingOpticsWeaponBase:singleshot(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	return 

	slot11 = Network

	if not Network.is_server(slot10) then
		return 
	end

	if not target_unit then
		return 
	end

	slot11 = managers.barrage

	if managers.barrage.is_barrage_running(slot10) then
		return false
	end

	local nav_seg = nil
	slot12 = target_unit

	if target_unit.vehicle_driving(slot11) then
		slot12 = managers.navigation
		slot15 = target_unit
		nav_seg = managers.navigation.get_nav_seg_from_pos(slot11, target_unit.position(slot14))
		slot15 = nav_seg

		Application.trace(slot11, Application, "[NPCSpottingOpticsWeaponBase:singleshot] shooting a vehicle", target_unit)
	else
		slot12 = managers.navigation
		slot15 = target_unit
		slot15 = target_unit.movement(slot14)
		slot15 = target_unit.movement(slot14).nav_tracker(slot14)
		nav_seg = managers.navigation.get_nav_seg(slot11, target_unit.movement(slot14).nav_tracker(slot14).nav_segment(slot14))
		slot15 = nav_seg

		Application.trace(slot11, Application, "[NPCSpottingOpticsWeaponBase:singleshot] shooting a player", target_unit)
	end

	if not nav_seg or not nav_seg.barrage_allowed then
		return 
	end

	slot20 = target_unit
	local fired = self.fire(slot11, self, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)

	if fired then
	end

	return false
end
local mvec_to = Vector3()
local mvec_spread_direction = Vector3()
local mvec1 = Vector3()
function NPCSpottingOpticsWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	return 

	local result = {}
	local hit_unit = nil
	local ray_distance = self._weapon_range or 20000
	slot15 = mvec_to
	slot18 = target_unit

	mvector3.set(slot14, target_unit.position(slot17))

	slot22 = self._setup.ignore_units
	local col_ray = World.raycast(slot14, World, "ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit")

	if col_ray then
		result.hit_enemy = col_ray.hit_unit
	end

	if self._alert_events then
		result.rays = {
			col_ray
		}

		if col_ray then
			result.hit_pos = col_ray.position
			slot18 = result.hit_pos

			Application.debug(slot15, Application, "hit pos ")
		end
	end

	return result
end
function NPCSpottingOpticsWeaponBase:_spawn_muzzle_effect()
	return 
end

return 
