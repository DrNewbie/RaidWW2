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
if not WarcrySharpshooter then
	slot2 = Warcry
	slot0 = class(slot1)
end

WarcrySharpshooter = slot0
function WarcrySharpshooter:init()
	slot3 = self

	WarcrySharpshooter.super.init(slot2)

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY
	}
	slot10 = "_on_enemy_killed"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "warcry_sharpshooter_enemy_killed", callback(slot7, self, self))

	self._active = false
	self._type = Warcry.SHARPSHOOTER
	self._tweak_data = tweak_data.warcry[self._type]

	return 
end
local ids_layer1_animate_factor = Idstring(function (self)
	slot3 = self

	WarcrySharpshooter.super.init(slot2)

	slot5 = 
	slot10 = "_on_enemy_killed"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "warcry_sharpshooter_enemy_killed", callback(slot7, self, self))

	self._active = false
	self._type = Warcry.SHARPSHOOTER
	self._tweak_data = tweak_data.warcry[self._type]

	return 
end)
slot3 = "blend_factor"
local ids_blend_factor = Idstring("layer1_animate_factor")
function WarcrySharpshooter:update(dt)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot5 = dt
	local lerp = WarcrySharpshooter.super.update(slot3, self)
	slot5 = managers.warcry
	local material = managers.warcry.warcry_post_material(self)

	if material then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-47, warpins: 1 ---
		slot8 = lerp

		material.set_variable(slot5, material, ids_blend_factor)

		local f = self._tweak_data.overlay_pulse_freq
		local A = self._tweak_data.overlay_pulse_ampl
		local t = managers.warcry.duration(ids_blend_factor) - managers.warcry.remaining(managers.warcry)
		slot10 = 360 * t * f
		local animation_factor = 0.5 * A * (math.sin(managers.warcry) - 1) + 1
		slot12 = animation_factor

		material.set_variable(managers.warcry, material, ids_layer1_animate_factor)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 48-54, warpins: 2 ---
	slot6 = managers.player
	local player_unit = managers.player.player_unit(slot5)

	if player_unit then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-71, warpins: 1 ---
		slot7 = player_unit
		slot7 = player_unit.camera(slot6)
		slot7 = player_unit.camera(slot6).camera_unit(slot6)
		local locked_enemy = player_unit.camera(slot6).camera_unit(slot6).base(slot6).locked_unit(slot6)
		slot8 = locked_enemy

		if alive(player_unit.camera(slot6).camera_unit(slot6).base(slot6)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-78, warpins: 1 ---
			slot8 = locked_enemy
			slot9 = "mark_enemy_sharpshooter"

			locked_enemy.contour(slot7).add(slot7, locked_enemy.contour(slot7))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 79-79, warpins: 3 ---
	return 
	--- END OF BLOCK #2 ---



end
local ids_contour_post_processor = Idstring(function (self, dt)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot5 = dt
	local lerp = WarcrySharpshooter.super.update(slot3, self)
	slot5 = managers.warcry
	local material = managers.warcry.warcry_post_material(self)

	if material then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-47, warpins: 1 ---
		slot8 = lerp

		material.set_variable(slot5, material, ids_blend_factor)

		local f = self._tweak_data.overlay_pulse_freq
		local A = self._tweak_data.overlay_pulse_ampl
		local t = managers.warcry.duration(ids_blend_factor) - managers.warcry.remaining(managers.warcry)
		slot10 = 360 * t * f
		local animation_factor = 0.5 * A * (math.sin(managers.warcry) - 1) + 1
		slot12 = animation_factor

		material.set_variable(managers.warcry, material, ids_layer1_animate_factor)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 48-54, warpins: 2 ---
	slot6 = managers.player
	local player_unit = managers.player.player_unit(slot5)

	if player_unit then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-71, warpins: 1 ---
		slot7 = player_unit
		slot7 = player_unit.camera(slot6)
		slot7 = player_unit.camera(slot6).camera_unit(slot6)
		local locked_enemy = player_unit.camera(slot6).camera_unit(slot6).base(slot6).locked_unit(slot6)
		slot8 = locked_enemy

		if alive(player_unit.camera(slot6).camera_unit(slot6).base(slot6)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-78, warpins: 1 ---
			slot8 = locked_enemy
			slot9 = "mark_enemy_sharpshooter"

			locked_enemy.contour(slot7).add(slot7, locked_enemy.contour(slot7))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 79-79, warpins: 3 ---
	return 
	--- END OF BLOCK #2 ---



end)
local ids_contour = Idstring("contour_post_processor")
local ids_empty = Idstring("contour")
slot7 = "contour_color"
local ids_contour_color = Idstring("empty")
function WarcrySharpshooter:activate()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	slot3 = self

	WarcrySharpshooter.super.activate(slot2)

	local material = managers.warcry.warcry_post_material(slot2)
	slot6 = tweak_data.contour.character.sharpshooter_warcry

	material.set_variable(managers.warcry, material, ids_contour_color)

	slot4 = managers.viewport
	local vp = managers.viewport.first_active_viewport(managers.warcry)

	if vp then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-34, warpins: 1 ---
		slot5 = vp
		slot8 = ids_empty

		vp.vp(slot4).set_post_processor_effect(slot4, vp.vp(slot4), "World", ids_contour_post_processor)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 35-35, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function WarcrySharpshooter:deactivate()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot3 = self

	WarcrySharpshooter.super.deactivate(slot2)

	slot3 = managers.player

	if not managers.player.player_unit(slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-28, warpins: 2 ---
	slot3 = managers.player
	slot3 = managers.player.get_current_state(slot2)

	managers.player.get_current_state(slot2).reset_aim_assist_look_multiplier(slot2)

	slot3 = managers.viewport
	local vp = managers.viewport.first_active_viewport(slot2)

	if vp then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-37, warpins: 1 ---
		slot4 = vp
		slot7 = ids_contour

		vp.vp(slot3).set_post_processor_effect(slot3, vp.vp(slot3), "World", ids_contour_post_processor)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 38-43, warpins: 2 ---
	slot4 = managers.enemy

	managers.enemy.disable_countours_on_dead_enemies(slot3)

	return 
	--- END OF BLOCK #2 ---



end
function WarcrySharpshooter:duration()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot7 = 1

	return self._tweak_data.base_duration * managers.player.upgrade_value(slot3, managers.player, "player", "warcry_duration")
	--- END OF BLOCK #0 ---



end
function WarcrySharpshooter:get_level_description(level)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot6 = #self._tweak_data.buffs
	level = math.clamp(slot3, level, 1)
	slot8 = level
	slot5 = "skill_warcry_sharpshooter_level_" .. tostring(slot7) .. "_desc"

	return managers.localization.text(slot3, managers.localization)
	--- END OF BLOCK #0 ---



end
function WarcrySharpshooter:_on_enemy_killed(params)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot4 = managers.player
	local unit = managers.player.player_unit(slot3)
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-31, warpins: 2 ---
	local multiplier = 1

	if params.headshot == true then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-43, warpins: 1 ---
		slot10 = 1
		multiplier = multiplier + self._tweak_data.headshot_multiplier * managers.player.upgrade_value(slot6, managers.player, "player", "warcry_headshot_multiplier_bonus")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 44-46, warpins: 2 ---
	if params.enemy_distance and self._tweak_data.distance_multiplier_activation_distance < params.enemy_distance then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-69, warpins: 1 ---
		slot10 = 1
		multiplier = multiplier + (self._tweak_data.distance_multiplier_addition_per_meter * (params.enemy_distance - self._tweak_data.distance_multiplier_activation_distance)) / 100 * managers.player.upgrade_value(self._tweak_data.distance_multiplier_activation_distance, managers.player, "player", "warcry_long_range_multiplier_bonus")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 70-79, warpins: 3 ---
	local base_fill_value = self._tweak_data.base_kill_fill_amount
	slot9 = true

	managers.warcry.fill_meter_by_value(slot6, managers.warcry, base_fill_value * multiplier)

	return 
	--- END OF BLOCK #3 ---



end
function WarcrySharpshooter:cleanup()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = "warcry_sharpshooter_enemy_killed"

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
	--- END OF BLOCK #0 ---



end

return 
