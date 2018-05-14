-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreEditorUtils"

slot0(slot1, slot2)

slot0 = SpawnEnemyUnitElement

if not slot0 then
	slot0 = class
	slot2 = MissionElement
	slot0 = slot0(slot1)
end

SpawnEnemyUnitElement = slot0
slot0 = SpawnEnemyUnitElement
slot1 = true
slot0.USES_POINT_ORIENTATION = slot1
slot0 = SpawnEnemyUnitElement
slot1 = {}
slot2 = {
	value = "enemy",
	type = "enemy"
}
slot1[1] = slot2
slot2 = {
	value = "spawn_action",
	type = "enemy_spawn_action"
}
slot1[2] = slot2
slot0.INSTANCE_VAR_NAMES = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self, unit)
	slot2 = SpawnEnemyUnitElement
	slot2 = slot2.super
	slot2 = slot2.init
	slot4 = self
	slot5 = unit

	slot2(slot3, slot4)

	slot2 = {}
	self._enemies = slot2
	slot2 = self._hed
	slot3 = "german_grunt_light"
	slot2.enemy = slot3
	slot2 = self._hed
	slot3 = "none"
	slot2.force_pickup = slot3
	slot2 = self._hed
	slot3 = "none"
	slot2.spawn_action = slot3
	slot2 = self._hed
	slot3 = true
	slot2.participate_to_group_ai = slot3
	slot2 = self._hed
	slot3 = 5
	slot2.interval = slot3
	slot2 = self._hed
	slot3 = 0
	slot2.amount = slot3
	slot2 = self._hed
	slot3 = "any"
	slot2.accessibility = slot3
	slot2 = self._hed
	slot3 = 0
	slot2.voice = slot3
	slot2 = self._hed
	slot3 = "default"
	slot2.team = slot3
	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "enemy"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "force_pickup"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "team"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "spawn_action"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "participate_to_group_ai"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "interval"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "amount"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "accessibility"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "voice"

	slot2(slot3, slot4)

	return 
end

slot0.init = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self, ...)
	slot1 = SpawnEnemyUnitElement
	slot1 = slot1.super
	slot1 = slot1.post_init
	slot3 = self

	slot1(slot2, ...)

	slot3 = self
	slot1 = self._load_pickup

	slot1(slot2)

	slot1 = self._hed
	slot1 = slot1.enemy

	if slot1 then
		slot1 = string
		slot1 = slot1.find
		slot3 = self._hed
		slot3 = slot3.enemy
		slot4 = "units/"
		slot1 = slot1(slot2, slot3)

		if slot1 then
			slot1 = self._hed
			slot2 = EnemyManager
			slot2 = slot2.ENEMIES
			slot3 = self._hed
			slot3 = slot3.enemy
			slot2 = slot2[slot3]
			slot1.enemy = slot2
		end
	end

	return 
end

slot0.post_init = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self)
	slot1 = EnemyManager
	slot1 = slot1.ENEMIES
	slot2 = self._hed
	slot2 = slot2.enemy
	slot1 = slot1[slot2]

	if not slot1 then
		slot1 = self._hed
		local result = slot1.enemy
	end

	return result
end

slot0._get_enemy = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self)
	slot1 = managers
	slot1 = slot1.navigation
	slot3 = slot1
	slot1 = slot1.is_data_ready
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = EWS
		slot3 = slot1
		slot1 = slot1.message_box
		slot4 = Global
		slot4 = slot4.frame_panel
		slot5 = "Can't test spawn unit without ready navigation data (AI-graph)"
		slot6 = "Spawn"
		slot7 = "OK,ICON_ERROR"
		slot8 = Vector3
		slot10 = -1
		slot11 = -1
		slot12 = 0

		slot1(slot2, slot3, slot4, slot5, slot6, slot8(slot9, slot10, slot11))

		return 
	end

	slot1 = self._hed
	slot1 = slot1.enemy

	if slot1 ~= "none" then
		slot1 = managers
		slot1 = slot1.groupai
		slot3 = slot1
		slot1 = slot1.state
		slot1 = slot1(slot2)
		slot3 = slot1
		slot1 = slot1.is_AI_enabled
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = safe_spawn_unit
			slot3 = Idstring
			slot7 = self
			slot5 = self._get_enemy
			slot3 = slot3(slot5(slot6))
			slot4 = self._unit
			slot6 = slot4
			slot4 = slot4.position
			slot4 = slot4(slot5)
			slot5 = self._unit
			slot7 = slot5
			slot5 = slot5.rotation
			local unit = slot1(slot2, slot3, slot5(slot6))

			if not unit then
				return 
			end

			slot2 = table
			slot2 = slot2.insert
			slot4 = self._enemies
			slot5 = unit

			slot2(slot3, slot4)

			slot4 = unit
			slot2 = unit.brain
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.set_logic
			slot5 = "inactive"
			slot6 = nil

			slot2(slot3, slot4, slot5)

			slot4 = self
			slot2 = self._resolve_team
			slot5 = unit
			local team_id = slot2(slot3, slot4)
			slot3 = managers
			slot3 = slot3.groupai
			slot5 = slot3
			slot3 = slot3.state
			slot3 = slot3(slot4)
			slot5 = slot3
			slot3 = slot3.set_char_team
			slot6 = unit
			slot7 = team_id

			slot3(slot4, slot5, slot6)

			slot3 = ElementSpawnEnemyDummy
			slot3 = slot3._create_action_data
			slot7 = self
			slot5 = self.get_spawn_anim
			local action_desc = slot3(slot5(slot6))
			slot6 = unit
			slot4 = unit.movement
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.action_request
			slot7 = action_desc

			slot4(slot5, slot6)

			slot6 = unit
			slot4 = unit.movement
			slot4 = slot4(slot5)
			slot6 = slot4
			slot4 = slot4.set_position
			slot9 = unit
			slot7 = unit.position

			slot4(slot5, slot7(slot8))
		end
	end

	return 
end

slot0.test_element = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self)
	slot1 = self._hed
	slot1 = slot1.spawn_action

	return slot1
end

slot0.get_spawn_anim = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self)
	slot1 = ipairs
	slot3 = self._enemies
	slot1, slot2, slot3 = slot1(slot2)

	for _, enemy in slot1, slot2, slot3 do
		slot8 = enemy
		slot6 = enemy.set_slot
		slot9 = 0

		slot6(slot7, slot8)
	end

	slot1 = {}
	self._enemies = slot1

	return 
end

slot0.stop_test_element = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self, params, ...)
	slot2 = SpawnEnemyUnitElement
	slot2 = slot2.super
	slot2 = slot2.set_element_data
	slot4 = self
	slot5 = params

	slot2(slot3, slot4, ...)

	slot2 = params.value

	if slot2 == "force_pickup" then
		slot4 = self
		slot2 = self._load_pickup

		slot2(slot3)
	end

	return 
end

slot0.set_element_data = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self)
	slot3 = self
	slot1 = self.stop_test_element

	slot1(slot2)

	slot1 = self._hed
	slot1 = slot1.enemy

	if slot1 ~= "none" then
		slot1 = managers
		slot1 = slot1.editor
		slot3 = slot1
		slot1 = slot1.reload_units
		slot4 = {}
		slot7 = self
		slot5 = self._get_enemy
		slot4[MULTRES] = slot5(slot6)
		slot5 = true
		slot6 = true

		slot1(slot2, slot3, slot4, slot5)
	end

	return 
end

slot0._reload_unit_list_btn = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "HORIZONTAL"
	local enemy_sizer = slot3(slot4, slot5)
	slot6 = panel_sizer
	slot4 = panel_sizer.add
	slot7 = enemy_sizer
	slot8 = 0
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = self
	slot4 = self._build_value_combobox
	slot7 = panel
	slot8 = enemy_sizer
	slot9 = "enemy"
	slot10 = managers
	slot10 = slot10.enemy
	slot12 = slot10
	slot10 = slot10.enemy_names
	slot10 = slot10(slot11)
	slot11, slot12 = nil
	slot13 = {
		horizontal_sizer_proportions = 1
	}

	slot4(slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.ToolBar
	slot7 = panel
	slot8 = ""
	slot9 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = slot4(slot5, slot6, slot7, slot8)
	slot7 = toolbar
	slot5 = toolbar.add_tool
	slot8 = "ADD_UNIT_LIST"
	slot9 = "Reload unit"
	slot10 = CoreEws
	slot10 = slot10.image_path
	slot12 = "toolbar\\refresh_16x16.png"
	slot10 = slot10(slot11)
	slot11 = nil

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = toolbar
	slot5 = toolbar.connect
	slot8 = "ADD_UNIT_LIST"
	slot9 = "EVT_COMMAND_MENU_SELECTED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "_reload_unit_list_btn"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = nil

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = toolbar
	slot5 = toolbar.realize

	slot5(slot6)

	slot7 = enemy_sizer
	slot5 = enemy_sizer.add
	slot8 = toolbar
	slot9 = 0
	slot10 = 0
	slot11 = "EXPAND,LEFT"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.CheckBox
	slot8 = panel
	slot9 = "Participate to group ai"
	slot10 = ""
	local participate_to_group_ai = slot5(slot6, slot7, slot8, slot9)
	slot8 = participate_to_group_ai
	slot6 = participate_to_group_ai.set_value
	slot9 = self._hed
	slot9 = slot9.participate_to_group_ai

	slot6(slot7, slot8)

	slot8 = participate_to_group_ai
	slot6 = participate_to_group_ai.connect
	slot9 = "EVT_COMMAND_CHECKBOX_CLICKED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "set_element_data"
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = {
		value = "participate_to_group_ai",
		ctrlr = participate_to_group_ai
	}

	slot6(slot7, slot8, slot9, slot10)

	slot8 = panel_sizer
	slot6 = panel_sizer.add
	slot9 = participate_to_group_ai
	slot10 = 0
	slot11 = 0
	slot12 = "EXPAND"

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = clone
	slot8 = CopActionAct
	slot8 = slot8._act_redirects
	slot8 = slot8.enemy_spawn
	local spawn_action_options = slot6(slot7)
	slot7 = table
	slot7 = slot7.insert
	slot9 = spawn_action_options
	slot10 = "none"

	slot7(slot8, slot9)

	slot9 = self
	slot7 = self._build_value_combobox
	slot10 = panel
	slot11 = panel_sizer
	slot12 = "spawn_action"
	slot13 = spawn_action_options

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot9 = self
	slot7 = self._build_value_number
	slot10 = panel
	slot11 = panel_sizer
	slot12 = "interval"
	slot13 = {
		floats = 2,
		min = 0
	}
	slot14 = "Used to specify how often this spawn can be used. 0 means no interval"

	slot7(slot8, slot9, slot10, slot11, slot12, slot13)

	slot9 = self
	slot7 = self._build_value_number
	slot10 = panel
	slot11 = panel_sizer
	slot12 = "voice"
	slot13 = {
		min = 0,
		floats = 0,
		max = 5
	}
	slot14 = "Voice variant. 1-5. 0 for random."

	slot7(slot8, slot9, slot10, slot11, slot12, slot13)

	slot9 = self
	slot7 = self._build_value_combobox
	slot10 = panel
	slot11 = panel_sizer
	slot12 = "accessibility"
	slot13 = ElementSpawnEnemyDummy
	slot13 = slot13.ACCESSIBILITIES
	slot14 = "Only units with this movement type will be spawned from this element."

	slot7(slot8, slot9, slot10, slot11, slot12, slot13)

	slot7 = table
	slot7 = slot7.map_keys
	slot9 = tweak_data
	slot9 = slot9.pickups
	local pickups = slot7(slot8)
	slot8 = table
	slot8 = slot8.insert
	slot10 = pickups
	slot11 = "none"

	slot8(slot9, slot10)

	slot10 = self
	slot8 = self._build_value_combobox
	slot11 = panel
	slot12 = panel_sizer
	slot13 = "force_pickup"
	slot14 = pickups

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot10 = self
	slot8 = self._build_value_combobox
	slot11 = panel
	slot12 = panel_sizer
	slot13 = "team"
	slot14 = table
	slot14 = slot14.list_add
	slot16 = {
		"default"
	}
	slot17 = tweak_data
	slot17 = slot17.levels
	slot19 = slot17
	slot17 = slot17.get_team_names_indexed
	slot14 = slot14(slot15, slot17(slot18))
	slot15 = "Select the character's team."

	slot8(slot9, slot10, slot11, slot12, slot13, slot14)

	return 
end

slot0._build_panel = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self)
	slot1 = self._hed
	slot1 = slot1.force_pickup

	if slot1 ~= "none" then
		slot1 = tweak_data
		slot1 = slot1.pickups
		slot2 = self._hed
		slot2 = slot2.force_pickup
		slot1 = slot1[slot2]
		local unit_name = slot1.unit
		slot2 = CoreUnit
		slot2 = slot2.editor_load_unit
		slot4 = unit_name

		slot2(slot3)
	end

	return 
end

slot0._load_pickup = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self)
	slot1 = self._hed
	slot1 = slot1.force_pickup

	if slot1 ~= "none" then
		slot1 = tweak_data
		slot1 = slot1.pickups
		slot2 = self._hed
		slot2 = slot2.force_pickup
		slot1 = slot1[slot2]
		local unit_name = slot1.unit
		slot2 = managers
		slot2 = slot2.editor
		slot4 = slot2
		slot2 = slot2.add_to_world_package
		slot5 = {
			category = "units"
		}
		slot8 = unit_name
		slot6 = unit_name.s
		slot6 = slot6(slot7)
		slot5.name = slot6
		slot6 = self._unit
		slot8 = slot6
		slot6 = slot6.unit_data
		slot6 = slot6(slot7)
		slot6 = slot6.continent
		slot5.continent = slot6

		slot2(slot3, slot4)

		local sequence_files = {}
		slot3 = CoreEditorUtils
		slot3 = slot3.get_sequence_files_by_unit_name
		slot5 = unit_name
		slot6 = sequence_files

		slot3(slot4, slot5)

		slot3 = ipairs
		slot5 = sequence_files
		slot3, slot4, slot5 = slot3(slot4)

		for _, file in slot3, slot4, slot5 do
			slot8 = managers
			slot8 = slot8.editor
			slot10 = slot8
			slot8 = slot8.add_to_world_package
			slot11 = {
				init = true,
				category = "script_data"
			}
			slot14 = file
			slot12 = file.s
			slot12 = slot12(slot13)
			slot13 = ".sequence_manager"
			slot12 = slot12 .. slot13
			slot11.name = slot12
			slot12 = self._unit
			slot14 = slot12
			slot12 = slot12.unit_data
			slot12 = slot12(slot13)
			slot12 = slot12.continent
			slot11.continent = slot12

			slot8(slot9, slot10)
		end
	end

	return 
end

slot0.add_to_mission_package = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self, unit)
	slot2 = self._hed
	slot2 = slot2.team

	if slot2 == "default" then
		slot7 = unit
		slot7 = unit.base(slot6)
		slot5 = (unit.base(slot6).char_tweak(slot6).access == "gangster" and "gangster") or "combatant"

		return tweak_data.levels.get_default_team_ID(slot3, tweak_data.levels)
	else
		slot2 = self._hed
		slot2 = slot2.team

		return slot2
	end

	return 
end

slot0._resolve_team = slot1
slot0 = SpawnEnemyUnitElement

function slot1(self, ...)
	slot1 = SpawnEnemyUnitElement
	slot1 = slot1.super
	slot1 = slot1.destroy
	slot3 = self

	slot1(slot2, ...)

	slot3 = self
	slot1 = self.stop_test_element

	slot1(slot2)

	return 
end

slot0.destroy = slot1

return 
