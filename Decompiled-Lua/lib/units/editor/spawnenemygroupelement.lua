-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not SpawnEnemyGroupUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SpawnEnemyGroupUnitElement = slot0
SpawnEnemyGroupUnitElement.SAVE_UNIT_POSITION = false
SpawnEnemyGroupUnitElement.SAVE_UNIT_ROTATION = false
SpawnEnemyGroupUnitElement.RANDOMS = {
	"amount"
}
function SpawnEnemyGroupUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.spawn_type = "ordered"
	self._hed.ignore_disabled = true
	self._hed.amount = {
		0,
		0
	}
	self._hed.elements = {}
	self._hed.nationality = "german"
	self._hed.interval = 0
	self._hed.team = "default"
	slot5 = "elements"

	table.insert("default", self._save_values)

	slot5 = "spawn_type"

	table.insert("default", self._save_values)

	slot5 = "ignore_disabled"

	table.insert("default", self._save_values)

	slot5 = "amount"

	table.insert("default", self._save_values)

	slot5 = "nationality"

	table.insert("default", self._save_values)

	slot5 = "preferred_spawn_groups"

	table.insert("default", self._save_values)

	slot5 = "interval"

	table.insert("default", self._save_values)

	slot5 = "team"

	table.insert("default", self._save_values)

	return 
end
function SpawnEnemyGroupUnitElement:post_init(...)
	slot3 = self

	SpawnEnemyGroupUnitElement.super.post_init(slot2, ...)

	if self._hed.preferred_spawn_groups and tweak_data.group_ai.enemy_spawn_groups[self._hed.nationality] then
		local i = 1

		while i <= #self._hed.preferred_spawn_groups do
			if not tweak_data.group_ai.enemy_spawn_groups[self._hed.nationality][self._hed.preferred_spawn_groups[i]] then
				slot5 = i

				table.remove(slot3, self._hed.preferred_spawn_groups)
			else
				i = i + 1
			end
		end

		slot4 = self._hed.preferred_spawn_groups

		if not next(slot3) then
			self._hed.preferred_spawn_groups = nil
		end
	end

	if self._hed.random ~= nil then
		self._hed.spawn_type = (self._hed.random and "random") or "ordered"
		self._hed.random = nil
	end

	return 
end
function SpawnEnemyGroupUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	MissionElement.draw_links(slot6, self, t, dt, selected_unit)

	return 
end
function SpawnEnemyGroupUnitElement:update_editing()
	return 
end
function SpawnEnemyGroupUnitElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.75,
				b = 0,
				r = 0,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function SpawnEnemyGroupUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "ai_spawn_enemy", 1) then
			local id = ray.unit.unit_data(slot3).unit_id
			slot6 = id

			if table.contains(ray.unit, self._hed.elements) then
				slot6 = id

				table.delete(slot4, self._hed.elements)
			else
				slot6 = id

				table.insert(slot4, self._hed.elements)
			end
		end
	end

	return 
end
function SpawnEnemyGroupUnitElement:remove_links(unit)
	slot4 = self._hed.elements

	for _, id in ipairs(slot3) do
		slot9 = unit

		if id == unit.unit_data(slot8).unit_id then
			slot10 = id

			table.delete(slot8, self._hed.elements)
		end
	end

	return 
end
function SpawnEnemyGroupUnitElement:get_links_to_unit(...)
	slot3 = self

	SpawnEnemyGroupUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "spawn_point"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function SpawnEnemyGroupUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function SpawnEnemyGroupUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"ai_spawn_enemy"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot13 = {
		"random",
		"group"
	}
	slot11 = "Specify how the enemy will be spawned."

	self._build_value_combobox(slot5, self, panel, panel_sizer, "spawn_type", table.list_add(slot11, {
		"ordered"
	}))

	slot10 = "Select if disabled spawn points should be ignored or not"

	self._build_value_checkbox(slot5, self, panel, panel_sizer, "ignore_disabled")

	slot11 = "Specify amount of enemies to spawn from group"

	self._build_value_random_number(slot5, self, panel, panel_sizer, "amount", {
		floats = 0,
		min = 0
	})
	self._build_value_number(slot5, self, panel, panel_sizer, "interval", {
		floats = 0,
		min = 0
	})

	slot12 = {
		"default"
	}
	slot15 = tweak_data.levels
	slot11 = "Select the group's team (overrides character team)."

	self._build_value_combobox(slot5, self, panel, panel_sizer, "team", table.list_add("Used to specify how often this spawn can be used. 0 means no interval", tweak_data.levels.get_team_names_indexed(slot14)))

	local opt_sizer = panel_sizer
	slot8 = "HORIZONTAL"
	local filter_sizer = EWS.BoxSizer(self, EWS)
	slot9 = "VERTICAL"
	local opt1_sizer = EWS.BoxSizer(EWS, EWS)
	slot10 = "VERTICAL"
	local opt2_sizer = EWS.BoxSizer(EWS, EWS)
	local opt3_sizer = EWS.BoxSizer(EWS, EWS)
	local opt_nationalities = {}
	slot12 = tweak_data.group_ai.enemy_spawn_groups

	for cat_name, team in pairs("VERTICAL") do
		slot18 = cat_name

		table.insert(slot16, opt_nationalities)
	end

	slot12 = opt_nationalities

	table.sort(slot11)

	slot18 = opt_nationalities
	slot17 = "Select the nationality to choose the groups from."

	self._build_value_combobox(slot11, self, panel, panel_sizer, "nationality", table.list_add(slot17))

	local opt_groups = {}
	slot13 = tweak_data.group_ai.enemy_spawn_groups[opt_nationalities[1]]

	for cat_name, team in pairs(self) do
		slot19 = cat_name

		table.insert(slot17, opt_groups)
	end

	slot13 = opt_groups

	table.sort(slot12)

	slot13 = opt_groups

	for i, o in ipairs(slot12) do
		slot21 = ""
		local check = EWS.CheckBox(slot17, EWS, panel, o)

		if self._hed.preferred_spawn_groups then
			slot20 = o
		else
			slot20 = false

			check.set_value(slot18, check)
		end

		slot25 = "on_preferred_spawn_groups_checkbox_changed"
		slot22 = {
			ctrlr = check,
			name = o
		}

		check.connect(slot18, check, "EVT_COMMAND_CHECKBOX_CLICKED", callback(slot22, self, self))

		slot19 = #opt_groups / 3

		if i <= math.round(slot18) then
			slot23 = "EXPAND"

			opt1_sizer.add(slot18, opt1_sizer, check, 0, 0)
		else
			slot19 = #opt_groups / 3

			if i <= math.round(slot18) * 2 then
				slot23 = "EXPAND"

				opt2_sizer.add(slot18, opt2_sizer, check, 0, 0)
			else
				slot23 = "EXPAND"

				opt3_sizer.add(slot18, opt3_sizer, check, 0, 0)
			end
		end
	end

	slot17 = "EXPAND"

	filter_sizer.add(slot12, filter_sizer, opt1_sizer, 1, 0)

	slot17 = "EXPAND"

	filter_sizer.add(slot12, filter_sizer, opt2_sizer, 1, 0)

	slot17 = "EXPAND"

	filter_sizer.add(slot12, filter_sizer, opt3_sizer, 1, 0)

	slot17 = "EXPAND"

	opt_sizer.add(slot12, opt_sizer, filter_sizer, 1, 0)

	return 
end
function SpawnEnemyGroupUnitElement:on_preferred_spawn_groups_checkbox_changed(params)
	slot4 = params.ctrlr
	local value = params.ctrlr.get_value(slot3)

	if value then
		self._hed.preferred_spawn_groups = self._hed.preferred_spawn_groups or {}
		slot6 = params.name

		if table.contains(slot4, self._hed.preferred_spawn_groups) then
			return 
		end

		slot6 = params.name

		table.insert(slot4, self._hed.preferred_spawn_groups)
	elseif self._hed.preferred_spawn_groups then
		slot6 = params.name

		table.delete(slot4, self._hed.preferred_spawn_groups)

		slot5 = self._hed.preferred_spawn_groups

		if not next(slot4) then
			self._hed.preferred_spawn_groups = nil
		end
	end

	return 
end

return 
