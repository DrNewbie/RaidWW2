-- Decompilation Error: _glue_flows(node)

slot3 = "SlotManager"

core.module(slot1, core)

slot3 = "CoreSlotManager"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not SlotManager then
	slot2 = CoreSlotManager.SlotManager
	slot0 = class(slot1)
end

SlotManager = slot0
function SlotManager:init()
	slot3 = self

	SlotManager.super.init(slot2)

	local C_UnitManager = World.unit_manager(slot2)
	slot5 = 2

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 3

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 4

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 5

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 7

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 8

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 9

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 12

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 13

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 14

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 16

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 17

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot6 = 10

	C_UnitManager.set_slot_limited(World, C_UnitManager, 18)

	slot5 = 20

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 21

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 22

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot6 = 20

	C_UnitManager.set_slot_limited(World, C_UnitManager, 23)

	slot5 = 24

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 25

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 26

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 30

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 33

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 34

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 36

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 37

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 38

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 39

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot20 = 39
	self._masks.all = World.make_slot_mask(C_UnitManager, World, 1, 2, 3, 10, 11, 12, 19, 29, 33, 34, 35, 36, 37, 38)
	slot9 = 5
	self._masks.players = World.make_slot_mask(C_UnitManager, World, 2, 3, 4)
	slot9 = 25
	self._masks.criminals = World.make_slot_mask(C_UnitManager, World, 2, 3, 16)
	slot6 = 21
	self._masks.civilians = World.make_slot_mask(C_UnitManager, World)
	slot8 = 16
	self._masks.criminals_no_deployables = World.make_slot_mask(C_UnitManager, World, 2, 3)
	slot11 = 25
	self._masks.all_criminals = World.make_slot_mask(C_UnitManager, World, 2, 3, 5, 16, 24)
	slot9 = 5
	self._masks.all_criminals_no_player = World.make_slot_mask(C_UnitManager, World, 2, 3, 4)
	slot10 = 25
	self._masks.raycastable_characters = World.make_slot_mask(C_UnitManager, World, 3, 12, 16, 17)
	slot8 = 24
	self._masks.harmless_criminals = World.make_slot_mask(C_UnitManager, World, 4, 5)
	slot7 = 5
	self._masks.harmless_player_criminals = World.make_slot_mask(C_UnitManager, World, 4)
	slot9 = 21
	self._masks.long_distance_interaction = World.make_slot_mask(C_UnitManager, World, 3, 12, 16)
	slot9 = 33
	self._masks.trip_mine_targets = World.make_slot_mask(C_UnitManager, World, 12, 21, 22)
	slot6 = 7
	self._masks.cameras = World.make_slot_mask(C_UnitManager, World)
	slot7 = 33
	self._masks.enemies = World.make_slot_mask(C_UnitManager, World, 12)
	slot15 = 33
	self._masks.persons = World.make_slot_mask(C_UnitManager, World, 2, 3, 4, 5, 12, 16, 21, 22, 24)
	slot7 = 34
	self._masks.crowd = World.make_slot_mask(C_UnitManager, World, 33)
	slot7 = 9
	self._masks.melee_equipment = World.make_slot_mask(C_UnitManager, World, 8)
	slot7 = 11
	self._masks.body_area_damage = World.make_slot_mask(C_UnitManager, World, 1)
	self._masks.unit_area_damage = self._masks.players + self._masks.enemies
	slot9 = 11
	self._masks.area_damage_blocker = World.make_slot_mask(self._masks.enemies, World, 1, 3, 8)
	slot22 = 39
	self._masks.bullet_impact_targets = World.make_slot_mask(self._masks.enemies, World, 1, 2, 8, 11, 12, 14, 16, 17, 18, 21, 22, 25, 26, 33, 34, 35)
	slot21 = 39
	self._masks.bullet_impact_targets_no_teamai = World.make_slot_mask(self._masks.enemies, World, 1, 2, 8, 11, 12, 14, 17, 18, 21, 22, 25, 26, 33, 34, 35)
	self._masks.explosion_targets = self._masks.bullet_impact_targets - 2
	slot17 = 39
	self._masks.bullet_impact_targets_no_police = World.make_slot_mask(self._masks.enemies, World, 1, 2, 8, 11, 14, 16, 17, 25, 33, 34, 35)
	slot15 = 39
	self._masks.bullet_impact_targets_no_criminals = World.make_slot_mask(self._masks.enemies, World, 1, 8, 11, 12, 14, 17, 33, 34, 35)
	slot16 = 39
	self._masks.bullet_impact_targets_sentry_gun = World.make_slot_mask(self._masks.enemies, World, 1, 8, 11, 12, 14, 17, 22, 33, 34, 35)
	slot15 = 39
	self._masks.bullet_impact_targets_no_AI = World.make_slot_mask(self._masks.enemies, World, 1, 2, 8, 11, 14, 17, 33, 34, 35)
	slot16 = 35
	self._masks.bullet_impact_targets_shooting_death = World.make_slot_mask(self._masks.enemies, World, 1, 8, 11, 12, 14, 17, 21, 22, 33, 34)
	slot10 = 39
	self._masks.bullet_blank_impact_targets = World.make_slot_mask(self._masks.enemies, World, 1, 8, 11, 35)
	slot9 = 39
	self._masks.bullet_physics_push = World.make_slot_mask(self._masks.enemies, World, 11, 17, 18)
	slot9 = 39
	self._masks.AI_visibility = World.make_slot_mask(self._masks.enemies, World, 1, 11, 38)
	slot10 = 39
	self._masks.AI_visibility_sentry_gun = World.make_slot_mask(self._masks.enemies, World, 1, 11, 17, 38)
	slot8 = 15
	self._masks.AI_graph_obstacle_check = World.make_slot_mask(self._masks.enemies, World, 1, 11)
	slot6 = 12
	self._masks.player_autoaim = World.make_slot_mask(self._masks.enemies, World)
	slot6 = 36
	self._masks.cover = World.make_slot_mask(self._masks.enemies, World)
	slot6 = 1
	self._masks.env_effect = World.make_slot_mask(self._masks.enemies, World)
	slot7 = 11
	self._masks.world_geometry = World.make_slot_mask(self._masks.enemies, World, 1)
	slot6 = 1
	self._masks.trip_mine_placeables = World.make_slot_mask(self._masks.enemies, World)
	slot7 = 23
	self._masks.pickups = World.make_slot_mask(self._masks.enemies, World, 20)
	slot12 = 33
	self._masks.flesh = World.make_slot_mask(self._masks.enemies, World, 12, 16, 17, 21, 22, 24)
	slot8 = 11
	self._masks.footstep = World.make_slot_mask(self._masks.enemies, World, 1, 8)
	slot8 = 11
	self._masks.fire_damage = World.make_slot_mask(self._masks.enemies, World, 1, 2)
	slot6 = 39
	self._masks.vehicles = World.make_slot_mask(self._masks.enemies, World)
	slot8 = 39
	self._masks.molotov_raycasts = World.make_slot_mask(self._masks.enemies, World, 1, 11)
	slot9 = 39
	self._masks.player_ground_check = World.make_slot_mask(self._masks.enemies, World, 1, 11, 15)
	self._masks.interaction_obstruction = self._masks.world_geometry + self._masks.vehicles
	slot6 = 36
	self._masks.cover = World.make_slot_mask(self._masks.vehicles, World)
	self._masks.editor_all = self._masks.editor_all + 36 + 38 + 39
	self._masks.statics_layer = self._masks.statics_layer + 36 + 38 + 39
	slot21 = 39
	self._masks.arrow_impact_targets = World.make_slot_mask(self._masks.vehicles, World, 1, 2, 8, 11, 12, 16, 17, 18, 21, 22, 25, 26, 33, 34, 35)

	return 
end
slot3 = SlotManager

CoreClass.override_class(function (self)
	slot3 = self

	SlotManager.super.init(slot2)

	local C_UnitManager = World.unit_manager(slot2)
	slot5 = 2

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 3

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 4

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 5

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 7

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 8

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 9

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 12

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 13

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 14

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 16

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 17

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot6 = 10

	C_UnitManager.set_slot_limited(World, C_UnitManager, 18)

	slot5 = 20

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 21

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 22

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot6 = 20

	C_UnitManager.set_slot_limited(World, C_UnitManager, 23)

	slot5 = 24

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 25

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 26

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 30

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 33

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 34

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 36

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 37

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 38

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot5 = 39

	C_UnitManager.set_slot_infinite(World, C_UnitManager)

	slot20 = 39
	self._masks.all = World.make_slot_mask(C_UnitManager, World, 1, 2, 3, 10, 11, 12, 19, 29, 33, 34, 35, 36, 37, 38)
	slot9 = 5
	self._masks.players = World.make_slot_mask(C_UnitManager, World, 2, 3, 4)
	slot9 = 25
	self._masks.criminals = World.make_slot_mask(C_UnitManager, World, 2, 3, 16)
	slot6 = 21
	self._masks.civilians = World.make_slot_mask(C_UnitManager, World)
	slot8 = 16
	self._masks.criminals_no_deployables = World.make_slot_mask(C_UnitManager, World, 2, 3)
	slot11 = 25
	self._masks.all_criminals = World.make_slot_mask(C_UnitManager, World, 2, 3, 5, 16, 24)
	slot9 = 5
	self._masks.all_criminals_no_player = World.make_slot_mask(C_UnitManager, World, 2, 3, 4)
	slot10 = 25
	self._masks.raycastable_characters = World.make_slot_mask(C_UnitManager, World, 3, 12, 16, 17)
	slot8 = 24
	self._masks.harmless_criminals = World.make_slot_mask(C_UnitManager, World, 4, 5)
	slot7 = 5
	self._masks.harmless_player_criminals = World.make_slot_mask(C_UnitManager, World, 4)
	slot9 = 21
	self._masks.long_distance_interaction = World.make_slot_mask(C_UnitManager, World, 3, 12, 16)
	slot9 = 33
	self._masks.trip_mine_targets = World.make_slot_mask(C_UnitManager, World, 12, 21, 22)
	slot6 = 7
	self._masks.cameras = World.make_slot_mask(C_UnitManager, World)
	slot7 = 33
	self._masks.enemies = World.make_slot_mask(C_UnitManager, World, 12)
	slot15 = 33
	self._masks.persons = World.make_slot_mask(C_UnitManager, World, 2, 3, 4, 5, 12, 16, 21, 22, 24)
	slot7 = 34
	self._masks.crowd = World.make_slot_mask(C_UnitManager, World, 33)
	slot7 = 9
	self._masks.melee_equipment = World.make_slot_mask(C_UnitManager, World, 8)
	slot7 = 11
	self._masks.body_area_damage = World.make_slot_mask(C_UnitManager, World, 1)
	self._masks.unit_area_damage = self._masks.players + self._masks.enemies
	slot9 = 11
	self._masks.area_damage_blocker = World.make_slot_mask(self._masks.enemies, World, 1, 3, 8)
	slot22 = 39
	self._masks.bullet_impact_targets = World.make_slot_mask(self._masks.enemies, World, 1, 2, 8, 11, 12, 14, 16, 17, 18, 21, 22, 25, 26, 33, 34, 35)
	slot21 = 39
	self._masks.bullet_impact_targets_no_teamai = World.make_slot_mask(self._masks.enemies, World, 1, 2, 8, 11, 12, 14, 17, 18, 21, 22, 25, 26, 33, 34, 35)
	self._masks.explosion_targets = self._masks.bullet_impact_targets - 2
	slot17 = 39
	self._masks.bullet_impact_targets_no_police = World.make_slot_mask(self._masks.enemies, World, 1, 2, 8, 11, 14, 16, 17, 25, 33, 34, 35)
	slot15 = 39
	self._masks.bullet_impact_targets_no_criminals = World.make_slot_mask(self._masks.enemies, World, 1, 8, 11, 12, 14, 17, 33, 34, 35)
	slot16 = 39
	self._masks.bullet_impact_targets_sentry_gun = World.make_slot_mask(self._masks.enemies, World, 1, 8, 11, 12, 14, 17, 22, 33, 34, 35)
	slot15 = 39
	self._masks.bullet_impact_targets_no_AI = World.make_slot_mask(self._masks.enemies, World, 1, 2, 8, 11, 14, 17, 33, 34, 35)
	slot16 = 35
	self._masks.bullet_impact_targets_shooting_death = World.make_slot_mask(self._masks.enemies, World, 1, 8, 11, 12, 14, 17, 21, 22, 33, 34)
	slot10 = 39
	self._masks.bullet_blank_impact_targets = World.make_slot_mask(self._masks.enemies, World, 1, 8, 11, 35)
	slot9 = 39
	self._masks.bullet_physics_push = World.make_slot_mask(self._masks.enemies, World, 11, 17, 18)
	slot9 = 39
	self._masks.AI_visibility = World.make_slot_mask(self._masks.enemies, World, 1, 11, 38)
	slot10 = 39
	self._masks.AI_visibility_sentry_gun = World.make_slot_mask(self._masks.enemies, World, 1, 11, 17, 38)
	slot8 = 15
	self._masks.AI_graph_obstacle_check = World.make_slot_mask(self._masks.enemies, World, 1, 11)
	slot6 = 12
	self._masks.player_autoaim = World.make_slot_mask(self._masks.enemies, World)
	slot6 = 36
	self._masks.cover = World.make_slot_mask(self._masks.enemies, World)
	slot6 = 1
	self._masks.env_effect = World.make_slot_mask(self._masks.enemies, World)
	slot7 = 11
	self._masks.world_geometry = World.make_slot_mask(self._masks.enemies, World, 1)
	slot6 = 1
	self._masks.trip_mine_placeables = World.make_slot_mask(self._masks.enemies, World)
	slot7 = 23
	self._masks.pickups = World.make_slot_mask(self._masks.enemies, World, 20)
	slot12 = 33
	self._masks.flesh = World.make_slot_mask(self._masks.enemies, World, 12, 16, 17, 21, 22, 24)
	slot8 = 11
	self._masks.footstep = World.make_slot_mask(self._masks.enemies, World, 1, 8)
	slot8 = 11
	self._masks.fire_damage = World.make_slot_mask(self._masks.enemies, World, 1, 2)
	slot6 = 39
	self._masks.vehicles = World.make_slot_mask(self._masks.enemies, World)
	slot8 = 39
	self._masks.molotov_raycasts = World.make_slot_mask(self._masks.enemies, World, 1, 11)
	slot9 = 39
	self._masks.player_ground_check = World.make_slot_mask(self._masks.enemies, World, 1, 11, 15)
	self._masks.interaction_obstruction = self._masks.world_geometry + self._masks.vehicles
	slot6 = 36
	self._masks.cover = World.make_slot_mask(self._masks.vehicles, World)
	self._masks.editor_all = self._masks.editor_all + 36 + 38 + 39
	self._masks.statics_layer = self._masks.statics_layer + 36 + 38 + 39
	slot21 = 39
	self._masks.arrow_impact_targets = World.make_slot_mask(self._masks.vehicles, World, 1, 2, 8, 11, 12, 16, 17, 18, 21, 22, 25, 26, 33, 34, 35)

	return 
end, CoreSlotManager.SlotManager)

return 
