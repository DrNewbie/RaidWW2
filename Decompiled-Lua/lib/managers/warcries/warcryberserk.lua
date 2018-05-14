-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- Decompilation Error: _glue_flows(node)

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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not WarcryBerserk then
	slot2 = Warcry
	slot0 = class(slot1)
end

WarcryBerserk = slot0
function WarcryBerserk:init()
	slot3 = self

	WarcryBerserk.super.init(slot2)

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY
	}
	slot10 = "_on_enemy_killed"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "warcry_berserk_enemy_killed", callback(slot7, self, self))

	self._active = false
	self._type = Warcry.BERSERK
	self._tweak_data = tweak_data.warcry[self._type]

	return 
end
local ids_layer1_animate_factor = Idstring(function (self)
	slot3 = self

	WarcryBerserk.super.init(slot2)

	slot5 = 
	slot10 = "_on_enemy_killed"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "warcry_berserk_enemy_killed", callback(slot7, self, self))

	self._active = false
	self._type = Warcry.BERSERK
	self._tweak_data = tweak_data.warcry[self._type]

	return 
end)
slot3 = "blend_factor"
local ids_blend_factor = Idstring("layer1_animate_factor")
function WarcryBerserk:update(dt)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot5 = dt
	local lerp = WarcryBerserk.super.update(slot3, self)
	slot5 = managers.environment_controller
	local distortion_a = managers.environment_controller.get_default_lens_distortion_value(self)
	local distortion_b = self._tweak_data.lens_distortion_value
	slot9 = lerp
	local distortion = math.lerp(slot6, distortion_a, distortion_b)
	slot9 = distortion

	managers.environment_controller.set_lens_distortion_power(distortion_a, managers.environment_controller)

	slot8 = managers.warcry
	local material = managers.warcry.warcry_post_material(distortion_a)

	if material then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-66, warpins: 1 ---
		slot11 = lerp

		material.set_variable(slot8, material, ids_blend_factor)

		local f = self._tweak_data.overlay_pulse_freq
		local A = self._tweak_data.overlay_pulse_ampl
		local t = managers.warcry.duration(ids_blend_factor) - managers.warcry.remaining(managers.warcry)
		slot13 = 360 * t * f
		local animation_factor = 0.5 * A * (math.sin(managers.warcry) - 1) + 1
		slot15 = animation_factor

		material.set_variable(managers.warcry, material, ids_layer1_animate_factor)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 67-67, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function WarcryBerserk:activate()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-48, warpins: 1 ---
	slot3 = self

	WarcryBerserk.super.activate(slot2)

	slot6 = 1
	self._ammo_consumption_counter = managers.player.upgrade_value(slot2, managers.player, "player", "warcry_ammo_consumption")
	local health_restoration_percentage = self._tweak_data.base_team_heal_percentage
	slot7 = 1
	health_restoration_percentage = health_restoration_percentage * managers.player.upgrade_value(managers.player, managers.player, "player", "warcry_team_heal_bonus")
	slot4 = managers.player
	slot4 = managers.player.player_unit(managers.player)
	slot5 = health_restoration_percentage / 100

	managers.player.player_unit(managers.player).character_damage(managers.player).restore_health(managers.player, managers.player.player_unit(managers.player).character_damage(managers.player))

	slot4 = managers.network
	slot6 = health_restoration_percentage

	managers.network.session(managers.player).send_to_peers_synched(managers.player, managers.network.session(managers.player), "restore_health_by_percentage")

	return 
	--- END OF BLOCK #0 ---



end
function WarcryBerserk:deactivate()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot3 = self

	WarcryBerserk.super.deactivate(slot2)

	slot3 = managers.environment_controller

	managers.environment_controller.reset_lens_distortion_value(slot2)

	self._ammo_consumption_counter = nil

	return 
	--- END OF BLOCK #0 ---



end
function WarcryBerserk:duration()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot7 = 1

	return self._tweak_data.base_duration * managers.player.upgrade_value(slot3, managers.player, "player", "warcry_duration")
	--- END OF BLOCK #0 ---



end
function WarcryBerserk:get_level_description(level)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot6 = #self._tweak_data.buffs
	level = math.clamp(slot3, level, 1)

	if 2 <= level then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-23, warpins: 1 ---
		slot8 = level
		slot5 = "skill_warcry_berserk_level_" .. tostring(slot7) .. "_desc"

		return managers.localization.text(slot3, managers.localization)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-25, warpins: 2 ---
	return "warcry_berserk_desc"
	--- END OF BLOCK #1 ---



end
function WarcryBerserk:check_ammo_consumption()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	self._ammo_consumption_counter = self._ammo_consumption_counter - 1

	if self._ammo_consumption_counter == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-17, warpins: 1 ---
		slot6 = 1
		self._ammo_consumption_counter = managers.player.upgrade_value(slot2, managers.player, "player", "warcry_ammo_consumption")

		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-19, warpins: 2 ---
	return false
	--- END OF BLOCK #1 ---



end
function WarcryBerserk:_on_enemy_killed(params)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot4 = managers.player
	local unit = managers.player.player_unit(slot3)
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-43, warpins: 2 ---
	slot5 = managers.player
	slot5 = managers.player.player_unit(slot4)
	slot5 = managers.player.player_unit(slot4).character_damage(slot4)
	local health_ratio = managers.player.player_unit(slot4).character_damage(slot4).health_ratio(slot4)
	local multiplier = 1

	if health_ratio < self._tweak_data.low_health_multiplier_activation_percentage then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-64, warpins: 1 ---
		slot9 = 1 - health_ratio / self._tweak_data.low_health_multiplier_activation_percentage
		local low_health_multiplier = math.lerp(slot6, self._tweak_data.low_health_multiplier_min, self._tweak_data.low_health_multiplier_max)
		slot11 = 1
		multiplier = multiplier + low_health_multiplier * managers.player.upgrade_value(self._tweak_data.low_health_multiplier_min, managers.player, "player", "warcry_low_health_multiplier_bonus")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 65-67, warpins: 2 ---
	if params.dismemberment_occured then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 68-79, warpins: 1 ---
		slot11 = 1
		multiplier = multiplier + self._tweak_data.dismemberment_multiplier * managers.player.upgrade_value(slot7, managers.player, "player", "warcry_dismemberment_multiplier_bonus")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 80-89, warpins: 2 ---
	local base_fill_value = self._tweak_data.base_kill_fill_amount
	slot10 = true

	managers.warcry.fill_meter_by_value(slot7, managers.warcry, base_fill_value * multiplier)

	return 
	--- END OF BLOCK #3 ---



end
function WarcryBerserk:cleanup()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = "warcry_berserk_enemy_killed"

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
	--- END OF BLOCK #0 ---



end

return 
