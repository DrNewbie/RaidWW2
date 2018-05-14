-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreEditorUtils"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreUnit"

slot0(slot1, slot2)

slot0 = SpawnCivilianUnitElement

if not slot0 then
	slot0 = class
	slot2 = MissionElement
	slot0 = slot0(slot1)
end

SpawnCivilianUnitElement = slot0
slot0 = SpawnCivilianUnitElement
slot1 = true
slot0.USES_POINT_ORIENTATION = slot1
slot0 = SpawnCivilianUnitElement
slot1 = {}
slot2 = {
	value = "enemy",
	type = "civilian"
}
slot1[1] = slot2
slot2 = {
	value = "state",
	type = "civilian_spawn_state"
}
slot1[2] = slot2
slot0.INSTANCE_VAR_NAMES = slot1
slot0 = SpawnCivilianUnitElement
slot1 = {
	"units/vanilla/characters/enemies/models/german_grunt_light_test/german_grunt_light_test",
	"units/vanilla/characters/enemies/models/soviet_nightwitch_01/soviet_nightwitch_01",
	"units/vanilla/characters/enemies/models/soviet_nightwitch_02/soviet_nightwitch_02",
	"units/vanilla/characters/enemies/models/female_spy/female_spy",
	"units/vanilla/characters/enemies/models/male_spy/male_spy"
}
slot0._options = slot1
slot0 = SpawnCivilianUnitElement

function slot1(self, unit)
	slot2 = SpawnCivilianUnitElement
	slot2 = slot2.super
	slot2 = slot2.init
	slot4 = self
	slot5 = unit

	slot2(slot3, slot4)

	slot2 = {}
	self._enemies = slot2
	slot2 = CopActionAct
	slot2 = slot2._act_redirects
	slot2 = slot2.civilian_spawn
	self._states = slot2
	slot2 = self._hed
	slot3 = "none"
	slot2.state = slot3
	slot2 = self._hed
	slot3 = "units/vanilla/characters/enemies/models/german_grunt_light_test/german_grunt_light_test"
	slot2.enemy = slot3
	slot2 = self._hed
	slot3 = "none"
	slot2.force_pickup = slot3
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
	slot5 = "state"

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

	return 
end

slot0.init = slot1
slot0 = SpawnCivilianUnitElement

function slot1(self, ...)
	slot1 = SpawnCivilianUnitElement
	slot1 = slot1.super
	slot1 = slot1.post_init
	slot3 = self

	slot1(slot2, ...)

	slot3 = self
	slot1 = self._load_pickup

	slot1(slot2)

	return 
end

slot0.post_init = slot1
slot0 = SpawnCivilianUnitElement

function slot1(self)
	slot1 = self._hed
	slot1 = slot1.enemy

	return slot1
end

slot0._get_enemy = slot1
slot0 = SpawnCivilianUnitElement

function slot1(self)
	slot1 = SpawnEnemyUnitElement
	slot1 = slot1.test_element
	slot3 = self

	slot1(slot2)

	return 
end

slot0.test_element = slot1
slot0 = SpawnCivilianUnitElement

function slot1(self)
	slot1 = self._hed
	slot1 = slot1.state

	return slot1
end

slot0.get_spawn_anim = slot1
slot0 = SpawnCivilianUnitElement

function slot1(self)
	slot1 = ipairs
	slot3 = self._enemies
	slot1, slot2, slot3 = slot1(slot2)

	for _, enemy in slot1, slot2, slot3 do
		slot8 = enemy
		slot6 = enemy.base
		slot6 = slot6(slot7)

		if slot6 then
			slot8 = enemy
			slot6 = enemy.base
			slot6 = slot6(slot7)
			slot6 = slot6.set_slot
		else
			slot8 = enemy
			slot6 = enemy.set_slot
			slot9 = 0

			slot6(slot7, slot8)
		end
	end

	slot1 = {}
	self._enemies = slot1

	return 
end

slot0.stop_test_element = slot1
slot0 = SpawnCivilianUnitElement

function slot1(self, params, ...)
	slot2 = SpawnCivilianUnitElement
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
slot0 = SpawnCivilianUnitElement

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
		slot5 = Idstring
		slot7 = self._hed
		slot7 = slot7.enemy
		slot4[MULTRES] = slot5(slot6)
		slot5 = true
		slot6 = true

		slot1(slot2, slot3, slot4, slot5)
	end

	return 
end

slot0._reload_unit_list_btn = slot1
slot0 = SpawnCivilianUnitElement

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
	slot10 = self._options
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

	slot7 = self
	slot5 = self._build_value_combobox
	slot8 = panel
	slot9 = panel_sizer
	slot10 = "state"
	slot11 = table
	slot11 = slot11.list_add
	slot13 = self._states
	slot14 = {
		"none"
	}

	slot5(slot6, slot7, slot8, slot9, slot11(slot12, slot13))

	slot5 = table
	slot5 = slot5.map_keys
	slot7 = tweak_data
	slot7 = slot7.pickups
	local pickups = slot5(slot6)
	slot6 = table
	slot6 = slot6.insert
	slot8 = pickups
	slot9 = "none"

	slot6(slot7, slot8)

	slot8 = self
	slot6 = self._build_value_combobox
	slot9 = panel
	slot10 = panel_sizer
	slot11 = "force_pickup"
	slot12 = pickups

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot8 = self
	slot6 = self._build_value_combobox
	slot9 = panel
	slot10 = panel_sizer
	slot11 = "team"
	slot12 = table
	slot12 = slot12.list_add
	slot14 = {
		"default"
	}
	slot15 = tweak_data
	slot15 = slot15.levels
	slot17 = slot15
	slot15 = slot15.get_team_names_indexed
	slot12 = slot12(slot13, slot15(slot16))
	slot13 = "Select the character's team."

	slot6(slot7, slot8, slot9, slot10, slot11, slot12)

	return 
end

slot0._build_panel = slot1
slot0 = SpawnCivilianUnitElement

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
slot0 = SpawnCivilianUnitElement

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
slot0 = SpawnCivilianUnitElement

function slot1(self, unit)
	slot2 = self._hed
	slot2 = slot2.team

	if slot2 == "default" then
		slot2 = tweak_data
		slot2 = slot2.levels
		slot4 = slot2
		slot2 = slot2.get_default_team_ID
		slot5 = "non_combatant"

		return slot2(slot3, slot4)
	else
		slot2 = self._hed
		slot2 = slot2.team

		return slot2
	end

	return 
end

slot0._resolve_team = slot1
slot0 = SpawnCivilianUnitElement

function slot1(self, ...)
	slot1 = SpawnCivilianUnitElement
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
