-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not FleePointElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

FleePointElement = slot0
FleePointElement.SAVE_UNIT_ROTATION = false
function FleePointElement:init(unit)
	slot5 = unit

	FleePointElement.super.init(slot3, self)

	self._hed.functionality = "flee_point"
	self._hed.so_action = "none"
	slot8 = 16
	slot3 = tostring(tonumber(slot6, "8FFFFFFF"))
	self._hed.SO_access = slot3
	slot5 = "functionality"

	table.insert(slot3, self._save_values)

	slot5 = "so_action"

	table.insert(slot3, self._save_values)

	slot5 = "SO_access"

	table.insert(slot3, self._save_values)

	self._enemies = {}

	return 
end
function FleePointElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select the functionality of the point"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "functionality", {
		"flee_point",
		"loot_drop"
	})

	slot8 = CopActionAct._act_redirects.SO
	local options = table.list_add(slot4, clone(panel_sizer))

	self._build_value_combobox({
		"none"
	}, self, panel, panel_sizer, "so_action", options)

	slot12 = managers.enemy
	slot11 = "Select the unit to be used when testing."

	self._build_value_combobox(, self, panel, panel_sizer, "test_unit", managers.enemy.enemy_units("Select a action that the unit should start with."))

	return 
end
function FleePointElement:test_element()
	slot3 = managers.navigation

	if not managers.navigation.is_data_ready(slot2) then
		slot7 = "OK,ICON_ERROR"
		slot12 = 0

		EWS.message_box(slot2, EWS, Global.frame_panel, "Can't test flee point unit without ready navigation data (AI-graph)", "Flee point", Vector3(slot9, -1, -1))

		return 
	end

	if not self._hed.test_unit then
		slot3 = "units/vanilla/characters/enemies/models/german_grunt_light/german_grunt_light"
		local spawn_unit_name = Idstring(slot2)
	end

	slot5 = self._unit.position(slot6)
	slot8 = self._unit
	local enemy = safe_spawn_unit(slot3, spawn_unit_name, self._unit.rotation(self._unit))

	if not enemy then
		return 
	end

	slot6 = enemy

	table.insert(slot4, self._enemies)

	slot5 = managers.groupai
	slot6 = enemy
	slot10 = "non_combatant"

	managers.groupai.state(slot4).set_char_team(slot4, managers.groupai.state(slot4), tweak_data.levels.get_default_team_ID(slot8, tweak_data.levels))

	slot5 = enemy
	slot6 = false

	enemy.movement(slot4).set_root_blend(slot4, enemy.movement(slot4))

	local t = {}
	slot6 = self._unit
	t.id = self._unit.unit_data(enemy.movement(slot4)).unit_id
	slot6 = self._unit
	t.editor_name = self._unit.unit_data(enemy.movement(slot4)).name_id
	slot6 = self
	t.values = self.new_save_values(enemy.movement(slot4))
	t.values.use_instigator = true
	t.values.is_navigation_link = false
	t.values.is_alert_point = false
	t.values.followup_elements = nil
	t.values.spawn_instigator_ids = nil
	slot7 = {
		elements = {}
	}
	self._script = MissionScript.new(nil, MissionScript)
	slot8 = t
	self._so_class = ElementFleePoint.new(nil, ElementFleePoint, self._script)
	self._so_class._values.align_position = nil
	self._so_class._values.align_rotation = nil
	slot7 = enemy

	self._so_class.on_executed(nil, self._so_class)

	slot6 = Application
	self._start_test_t = Application.time(nil)

	return 
end
function FleePointElement:stop_test_element()

	-- Decompilation error in this vicinity:
	slot3 = self._enemies

	for _, enemy in ipairs(slot2) do
		slot9 = 0

		enemy.set_slot(slot7, enemy)
	end

	self._enemies = {}
	slot1 = print
	slot3 = "Stop test time"
end

return 
