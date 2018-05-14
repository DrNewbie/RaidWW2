FlamethrowerEffectExtension = FlamethrowerEffectExtension or class()
FlamethrowerEffectExtension.MIN_EFFECT_INTERVAL = 0.01
function FlamethrowerEffectExtension:init(unit, ...)
	self._unit = unit
	self._name_id = self.name_id or "test_raycast_weapon"
	self.name_id = nil
	slot4 = self

	self.setup_default(slot3)

	slot7 = "flamethrower_effect_extension"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(true))

	return 
end
function FlamethrowerEffectExtension:setup_default()
	self._flame_effect = {}
	slot4 = "effects/vanilla/fire/fire_flame_burst_001"
	self._flame_effect.effect = Idstring(slot3)
	self._nozzle_effect = {}
	slot4 = "effects/vanilla/explosions/exp_flamer_nosel_001"
	self._nozzle_effect.effect = Idstring(slot3)
	self._pilot_light = {}
	slot4 = "effects/vanilla/fire/fire_flame_burst_pilot_001"
	self._pilot_light.effect = Idstring(slot3)
	self._flame_max_range = tweak_data.weapon[self._name_id].flame_max_range
	self._single_flame_effect_duration = tweak_data.weapon[self._name_id].single_flame_effect_duration
	self._distance_to_gun_tip = 50
	self._flamethrower_effect_collection = {}

	return 
end
local mvec1 = Vector3()
function FlamethrowerEffectExtension:update(unit, t, dt)
	if self._flamethrower_effect_collection ~= nil then
		local flame_effect_dt = self._single_flame_effect_duration / dt
		local flame_effect_distance = self._flame_max_range / flame_effect_dt
		slot8 = self._flamethrower_effect_collection

		for _, effect_entry in pairs(slot7) do
			local do_continue = true
			slot14 = World
			slot15 = effect_entry.id

			if World.effect_manager(slot13).alive(slot13, World.effect_manager(slot13)) == false then
				if effect_entry.been_alive == true then
					slot14 = World
					slot15 = effect_entry.id

					World.effect_manager(slot13).kill(slot13, World.effect_manager(slot13))

					slot15 = _

					table.remove(slot13, self._flamethrower_effect_collection)

					do_continue = false
				end
			elseif effect_entry.been_alive == false then
				effect_entry.been_alive = true
			end

			if do_continue == true then
				slot15 = effect_entry.position

				mvector3.set(slot13, mvec1)

				slot15 = effect_entry.direction * flame_effect_distance

				mvector3.add(slot13, effect_entry.position)

				slot16 = effect_entry.position
				local raycast = World.raycast(slot13, World, mvec1)

				if raycast ~= nil then
					slot16 = _

					table.remove(slot14, self._flamethrower_effect_collection)
				else
					slot15 = World
					slot17 = effect_entry.position

					World.effect_manager(slot14).move(slot14, World.effect_manager(slot14), effect_entry.id)
				end

				slot15 = effect_entry.position
				slot18 = unit
				local effect_distance = mvector3.distance(slot14, unit.position(slot17))

				if self._flame_max_range < effect_distance then
					slot16 = World
					slot17 = effect_entry.id

					World.effect_manager(slot15).kill(slot15, World.effect_manager(slot15))
				end
			end
		end
	end

	return 
end
function FlamethrowerEffectExtension:_spawn_muzzle_effect(from_pos, direction)
	if self._next_fire_time then
		slot6 = managers.player
		slot6 = managers.player.player_timer(slot5)

		if managers.player.player_timer(slot5).time(slot5) < self._next_fire_time then
			return 
		end
	end

	local from = from_pos + direction * self._distance_to_gun_tip
	slot9 = "fire"
	local nozzle_obj = self._unit.get_object(slot5, Idstring(slot8))
	slot7 = nozzle_obj
	local nozzle_pos = nozzle_obj.position(self._unit)
	local attach_obj = self._unit
	slot9 = World
	slot10 = {
		effect = self._flame_effect.effect,
		position = nozzle_pos,
		normal = math.UP
	}
	local effect_id = World.effect_manager(slot8).spawn(slot8, World.effect_manager(slot8))
	slot10 = managers.player
	slot10 = managers.player.player_timer(World.effect_manager(slot8))
	self._next_fire_time = managers.player.player_timer(World.effect_manager(slot8)).time(World.effect_manager(slot8)) + FlamethrowerEffectExtension.MIN_EFFECT_INTERVAL
	slot11 = {
		been_alive = false,
		id = effect_id,
		position = nozzle_pos,
		direction = mvector3.copy(slot13)
	}
	slot14 = direction

	table.insert(FlamethrowerEffectExtension.MIN_EFFECT_INTERVAL, self._flamethrower_effect_collection)

	return 
end

return 
