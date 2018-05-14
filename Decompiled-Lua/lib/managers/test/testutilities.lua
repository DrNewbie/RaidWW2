-- Decompilation Error: _run_step(_unwarp_expressions, node)

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

-- Decompilation error in this vicinity:
--- BLOCK #0 1-3, warpins: 1 ---
slot0 = TestUtilities or class()
TestUtilities = slot0
function TestUtilities:init()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return 
	--- END OF BLOCK #0 ---



end
function TestUtilities:spawn_projectile_at_pos(trgt_pos)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	slot4 = managers.barrage
	slot7 = managers.barrage.default_params
	local barrage_params = managers.barrage._prepare_barrage_params(slot3, clone(slot6))
	local pos = trgt_pos
	slot7 = "TestUtilities   !!!!!!!!!!!!!!!!!!!!!!!!!!!!    Spawned proj at: " .. pos

	Application.trace(clone, Application)

	slot8 = barrage_params.direction * barrage_params.lauch_power

	ProjectileBase.throw_projectile(clone, barrage_params.projectile_index, pos)

	return 
	--- END OF BLOCK #0 ---



end
function TestUtilities:spawn_projectile_on_graph()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	local pos = managers.navigation.get_random_point_on_graph(slot2)
	slot5 = pos

	self.spawn_projectile_at_pos(managers.navigation, self)

	return 
	--- END OF BLOCK #0 ---



end
function TestUtilities:spawn_enemy_at_pos(trgt_pos)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-44, warpins: 1 ---
	local position = trgt_pos
	slot7 = managers.viewport
	slot7 = managers.viewport.get_current_camera_rotation(math.UP)
	slot6 = math.UP
	local rot = Rotation(slot4, managers.viewport.get_current_camera_rotation(math.UP).y(math.UP).with_z(math.UP, managers.viewport.get_current_camera_rotation(math.UP).y(math.UP)))
	slot9 = "units/vanilla/characters/enemies/models/german_commander/german_commander"
	slot9 = rot
	local unit = World.spawn_unit(managers.viewport.get_current_camera_rotation(math.UP).y(math.UP).with_z(math.UP, managers.viewport.get_current_camera_rotation(math.UP).y(math.UP)), World, Idstring(0), position)
	slot8 = "TestUtilities  !!!!!!!!!!!!!!!!!!!!!!!!!!!   Spawned enemy at: " .. position

	Application.trace(World, Application)

	slot7 = managers.groupai
	slot9 = "law1"

	managers.groupai.state(World).assign_enemy_to_group_ai(World, managers.groupai.state(World), unit)

	return 
	--- END OF BLOCK #0 ---



end
function TestUtilities:spawn_enemy_on_graph()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	local position = managers.navigation.get_random_point_on_graph(slot2)
	slot5 = position

	self.spawn_enemy_at_pos(managers.navigation, self)

	return 
	--- END OF BLOCK #0 ---



end
function TestUtilities:get_random_seg_id_on_test_range()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot3 = world_id
	slot8 = #TestUtilities.SEG_IDS
	slot5 = TestUtilities.SEG_IDS[math.random(slot7)]
	local seg_id = tostring(slot2) .. "_" .. tostring(slot4)

	return seg_id
	--- END OF BLOCK #0 ---



end

return 

--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #1 4-5, warpins: 1 ---
slot0 = class()
--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #2 6-25, warpins: 2 ---
--- END OF BLOCK #2 ---



