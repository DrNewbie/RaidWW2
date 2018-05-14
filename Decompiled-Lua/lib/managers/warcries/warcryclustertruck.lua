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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not WarcryClustertruck then
	slot2 = Warcry
	slot0 = class(slot1)
end

WarcryClustertruck = slot0
WarcryClustertruck.team_buffs = {
	{
		id = "warcry_team_damage_reduction_bonus_on_activate",
		upgrade = "warcry_team_damage_reduction_bonus",
		use_levels = true,
		category = "player"
	}
}
function WarcryClustertruck:init()
	slot3 = self

	WarcryClustertruck.super.init(slot2)

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY
	}
	slot10 = "_on_enemy_killed"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "warcry_clustertruck_enemy_killed", callback(slot7, self, self))

	self._active = false
	self._type = Warcry.CLUSTERTRUCK
	self._tweak_data = tweak_data.warcry[self._type]
	self._killstreak_list = {}

	return 
end
local ids_time = Idstring(function (self)
	slot3 = self

	WarcryClustertruck.super.init(slot2)

	slot5 = 
	slot10 = "_on_enemy_killed"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "warcry_clustertruck_enemy_killed", callback(slot7, self, self))

	self._active = false
	self._type = Warcry.CLUSTERTRUCK
	self._tweak_data = tweak_data.warcry[self._type]
	self._killstreak_list = 

	return 
end)
local ids_blend_factor = Idstring("time")
slot4 = "base_color_intensity"
local ids_base_color_intensity = Idstring("blend_factor")
function WarcryClustertruck:update(dt)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot5 = dt
	local lerp = WarcryClustertruck.super.update(slot3, self)
	slot5 = managers.warcry
	local material = managers.warcry.warcry_post_material(self)

	if material then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-32, warpins: 1 ---
		slot7 = ids_blend_factor
		slot11 = self._tweak_data.fire_opacity

		material.set_variable(slot5, material, math.min(slot9, lerp))

		slot7 = ids_time
		slot10 = managers.warcry

		material.set_variable(slot5, material, managers.warcry.remaining(slot9))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-33, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function WarcryClustertruck:duration()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot7 = 1

	return self._tweak_data.base_duration * managers.player.upgrade_value(slot3, managers.player, "player", "warcry_duration")
	--- END OF BLOCK #0 ---



end
function WarcryClustertruck:get_level_description(level)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot6 = #self._tweak_data.buffs
	level = math.clamp(slot3, level, 1)

	if 2 <= level then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-23, warpins: 1 ---
		slot8 = level
		slot5 = "skill_warcry_clustertruck_level_" .. tostring(slot7) .. "_desc"

		return managers.localization.text(slot3, managers.localization)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-25, warpins: 2 ---
	return "warcry_clustertruck_desc"
	--- END OF BLOCK #1 ---



end
function WarcryClustertruck:activate()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-38, warpins: 1 ---
	slot3 = self

	WarcryClustertruck.super.activate(slot2)

	local material = managers.warcry.warcry_post_material(slot2)
	slot6 = self._tweak_data.fire_intensity

	material.set_variable(managers.warcry, material, ids_base_color_intensity)

	slot5 = self._tweak_data.grenade_refill_amounts[self._level]

	managers.player.refill_grenades(managers.warcry, managers.player)

	slot4 = managers.player
	slot5 = PlayerInventory.SLOT_3

	managers.player.get_current_state(managers.warcry).set_weapon_selection_wanted(managers.warcry, managers.player.get_current_state(managers.warcry))

	self._killstreak_list = {}

	return 
	--- END OF BLOCK #0 ---



end
function WarcryClustertruck:_on_enemy_killed(params)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot4 = managers.player
	local unit = managers.player.player_unit(slot3)
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-31, warpins: 2 ---
	local multiplier = 1

	if params.damage_type == "explosion" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-43, warpins: 1 ---
		slot10 = 1
		multiplier = multiplier + self._tweak_data.explosion_multiplier * managers.player.upgrade_value(slot6, managers.player, "player", "warcry_explosions_multiplier_bonus")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 44-51, warpins: 2 ---
	slot6 = self._killstreak_list
	slot9 = Application

	table.insert(slot5, Application.time(slot8))

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 52-62, warpins: 3 ---
	slot6 = Application

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 63-75, warpins: 0 ---
	while self._tweak_data.killstreak_duration < Application.time(slot5) - self._killstreak_list[1] do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-63, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 64-72, warpins: 1 ---
		slot7 = 1

		table.remove(slot5, self._killstreak_list)

		if #self._killstreak_list == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 73-73, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 74-74, warpins: 0 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 75-75, warpins: 0 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 75-100, warpins: 2 ---
	slot10 = 1
	multiplier = multiplier + self._tweak_data.killstreak_multiplier_bonus_per_enemy * (#self._killstreak_list - 1) * managers.player.upgrade_value(slot6, managers.player, "player", "warcry_killstreak_multiplier_bonus")
	local base_fill_value = self._tweak_data.base_kill_fill_amount
	slot9 = true

	managers.warcry.fill_meter_by_value(slot6, managers.warcry, base_fill_value * multiplier)

	return 
	--- END OF BLOCK #5 ---



end
function WarcryClustertruck:cleanup()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot3 = self

	WarcryClustertruck.super.cleanup(slot2)

	slot4 = "warcry_clustertruck_enemy_killed"

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
	--- END OF BLOCK #0 ---



end

return 
