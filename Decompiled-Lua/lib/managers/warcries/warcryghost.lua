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
if not WarcryGhost then
	slot2 = Warcry
	slot0 = class(slot1)
end

WarcryGhost = slot0
function WarcryGhost:init()
	slot3 = self

	WarcryGhost.super.init(slot2)

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY
	}
	slot10 = "_on_enemy_killed"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "warcry_ghost_enemy_killed", callback(slot7, self, self))

	self._active = false
	self._type = Warcry.GHOST
	self._tweak_data = tweak_data.warcry[self._type]

	return 
end
function WarcryGhost:_find_enemies_in_view()
	local player_unit = managers.player.player_unit(slot2)
	slot4 = player_unit

	if not alive(managers.player) then
		return 
	end

	slot6 = "fov_multiplier"
	local fov = tweak_data.player.stances.default.standard.FOV * managers.user.get_setting(slot4, managers.user)
	slot6 = 0.5 * fov
	local cone_radius = 2 * self._tweak_data.tint_distance * math.tan(managers.user)
	local player_camera = player_unit.camera(managers.user)
	local cone_tip = player_camera.position(player_unit)
	slot8 = player_camera
	local cone_base = player_camera.forward(player_camera).normalized(player_camera) * self._tweak_data.tint_distance + cone_tip
	slot13 = cone_radius
	slot17 = "enemies"
	local enemies_in_cone = World.find_units_quick(player_camera.forward(player_camera), World, "cone", cone_tip, cone_base, managers.slot.get_mask(slot15, managers.slot))
	local enemies = {}
	slot11 = enemies_in_cone

	for _, enemy in ipairs("cone") do
		slot16 = cone_tip
		slot19 = enemy

		if mvector3.distance(slot15, enemy.position(slot18)) < self._tweak_data.tint_distance then
			slot17 = enemy

			table.insert(slot15, enemies)
		end
	end

	return enemies
end
local ids_blend_factor = Idstring(function (self)
	local player_unit = managers.player.player_unit(slot2)
	slot4 = player_unit

	if not alive(managers.player) then
		return 
	end

	slot6 = "fov_multiplier"
	local fov = tweak_data.player.stances.default.standard.FOV * managers.user.get_setting(slot4, managers.user)
	slot6 = 0.5 * fov
	local cone_radius = 2 * self._tweak_data.tint_distance * math.tan(managers.user)
	local player_camera = player_unit.camera(managers.user)
	local cone_tip = player_camera.position(player_unit)
	slot8 = player_camera
	local cone_base = player_camera.forward(player_camera).normalized(player_camera) * self._tweak_data.tint_distance + cone_tip
	slot13 = cone_radius
	slot17 = "enemies"
	local enemies_in_cone = World.find_units_quick(player_camera.forward(player_camera), World, "cone", cone_tip, cone_base, managers.slot.get_mask(slot15, managers.slot))
	local enemies = 
	slot11 = enemies_in_cone

	for _, enemy in ipairs("cone") do
		slot16 = cone_tip
		slot19 = enemy

		if mvector3.distance(slot15, enemy.position(slot18)) < self._tweak_data.tint_distance then
			slot17 = enemy

			table.insert(slot15, enemies)
		end
	end

	return enemies
end)
slot3 = "time"
local ids_time = Idstring("blend_factor")
function WarcryGhost:update(dt)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot5 = dt
	local lerp = WarcryGhost.super.update(slot3, self)
	slot5 = managers.warcry
	local material = managers.warcry.warcry_post_material(self)

	if material then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-27, warpins: 1 ---
		slot8 = lerp

		material.set_variable(slot5, material, ids_blend_factor)

		slot7 = ids_time
		slot10 = managers.warcry

		material.set_variable(slot5, material, managers.warcry.remaining(slot9))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-32, warpins: 2 ---
	slot6 = self
	local enemies = self._find_enemies_in_view(slot5)

	if enemies then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-36, warpins: 1 ---
		slot7 = enemies

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-45, warpins: 0 ---
		for _, enemy in ipairs(slot6) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 37-43, warpins: 1 ---
			slot12 = enemy
			slot13 = "mark_enemy_ghost"

			enemy.contour(slot11).add(slot11, enemy.contour(slot11))
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 44-45, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 46-46, warpins: 2 ---
	return 
	--- END OF BLOCK #2 ---



end
function WarcryGhost:duration()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot7 = 1

	return self._tweak_data.base_duration * managers.player.upgrade_value(slot3, managers.player, "player", "warcry_duration")
	--- END OF BLOCK #0 ---



end
function WarcryGhost:get_level_description(level)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot6 = #self._tweak_data.buffs
	level = math.clamp(slot3, level, 1)

	if 2 <= level then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-36, warpins: 1 ---
		local percentage = tostring(slot3) .. "%"
		slot9 = level
		slot7 = {
			PERCENTAGE = percentage
		}

		return managers.localization.text(tweak_data.upgrades.values.player.warcry_dodge[level] * 100, managers.localization, "skill_warcry_ghost_level_" .. tostring(slot8) .. "_desc")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 37-38, warpins: 2 ---
	return "warcry_ghost_team_desc"
	--- END OF BLOCK #1 ---



end
local ids_desaturation = Idstring(function (self, level)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot6 = #self._tweak_data.buffs
	level = math.clamp(slot3, level, 1)

	if 2 <= level then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-36, warpins: 1 ---
		local percentage = tostring(slot3) .. "%"
		slot9 = level
		slot7 = 

		return managers.localization.text(tweak_data.upgrades.values.player.warcry_dodge[level] * 100, managers.localization, "skill_warcry_ghost_level_" .. tostring(slot8) .. "_desc")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 37-38, warpins: 2 ---
	return "warcry_ghost_team_desc"
	--- END OF BLOCK #1 ---



end)
local ids_contour_post_processor = Idstring("desaturation")
local ids_contour = Idstring("contour_post_processor")
local ids_empty = Idstring("contour")
local ids_tint = Idstring("empty")
slot9 = "noise_strength"
local ids_noise_strength = Idstring("tint")
function WarcryGhost:activate()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-37, warpins: 1 ---
	slot3 = self

	WarcryGhost.super.activate(slot2)

	local material = managers.warcry.warcry_post_material(slot2)
	slot6 = self._tweak_data.desaturation

	material.set_variable(managers.warcry, material, ids_desaturation)

	slot6 = tweak_data.contour.character.ghost_warcry

	material.set_variable(managers.warcry, material, ids_tint)

	slot6 = self._tweak_data.grain_noise_strength

	material.set_variable(managers.warcry, material, ids_noise_strength)

	slot4 = managers.viewport
	local vp = managers.viewport.first_active_viewport(managers.warcry)

	if vp then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-46, warpins: 1 ---
		slot5 = vp
		slot8 = ids_empty

		vp.vp(slot4).set_post_processor_effect(slot4, vp.vp(slot4), "World", ids_contour_post_processor)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 47-47, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function WarcryGhost:deactivate()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot3 = self

	WarcryGhost.super.deactivate(slot2)

	slot3 = managers.viewport
	local vp = managers.viewport.first_active_viewport(slot2)

	if vp then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-21, warpins: 1 ---
		slot4 = vp
		slot7 = ids_contour

		vp.vp(slot3).set_post_processor_effect(slot3, vp.vp(slot3), "World", ids_contour_post_processor)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-22, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function WarcryGhost:_on_enemy_killed(params)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot4 = managers.player
	local unit = managers.player.player_unit(slot3)
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-31, warpins: 2 ---
	local multiplier = 1

	if params.damage_type == "melee" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-43, warpins: 1 ---
		slot10 = 1
		multiplier = multiplier + self._tweak_data.melee_multiplier * managers.player.upgrade_value(slot6, managers.player, "player", "warcry_melee_multiplier_bonus")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 44-46, warpins: 2 ---
	if params.damage_type == "bullet" and params.enemy_distance and params.enemy_distance < self._tweak_data.distance_multiplier_activation_distance then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-72, warpins: 1 ---
		slot10 = 1
		multiplier = multiplier + (self._tweak_data.distance_multiplier_addition_per_meter * (self._tweak_data.distance_multiplier_activation_distance - params.enemy_distance)) / 100 * managers.player.upgrade_value(params.enemy_distance, managers.player, "player", "warcry_short_range_multiplier_bonus")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 73-82, warpins: 4 ---
	local base_fill_value = self._tweak_data.base_kill_fill_amount
	slot9 = true

	managers.warcry.fill_meter_by_value(slot6, managers.warcry, base_fill_value * multiplier)

	return 
	--- END OF BLOCK #3 ---



end
function WarcryGhost:cleanup()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = "warcry_ghost_enemy_killed"

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
	--- END OF BLOCK #0 ---



end

return 
