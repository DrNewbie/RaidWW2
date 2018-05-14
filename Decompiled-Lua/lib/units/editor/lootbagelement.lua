if not LootBagUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

LootBagUnitElement = slot0
LootBagUnitElement.USES_POINT_ORIENTATION = true
function LootBagUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._test_units = {}
	slot7 = 1
	self._hed.spawn_dir = Vector3(self, 0, 0)
	self._hed.push_multiplier = 0
	self._hed.carry_id = "none"
	self._hed.from_respawn = false

	return 
end
function LootBagUnitElement:save(list)
	if self._hed.push_multiplier ~= 0 then
		list.spawn_dir = self._hed.spawn_dir
		list.push_multiplier = self._hed.push_multiplier
	end

	list.carry_id = self._hed.carry_id
	list.from_respawn = self._hed.from_respawn

	return 
end
function LootBagUnitElement:test_element()
	local unit_name = "units/vanilla/pickups/pku_gold_bar_bag/pku_gold_bar_bag"
	local throw_distance_multiplier = 1

	if self._hed.carry_id ~= "none" then
		if not tweak_data.carry[self._hed.carry_id].unit then
		end

		local carry_type = tweak_data.carry[self._hed.carry_id].type

		if not tweak_data.carry.types[carry_type].throw_distance_multiplier then
		end
	end

	slot6 = self._unit.position(slot7)
	slot9 = self._unit
	local unit = safe_spawn_unit(slot4, unit_name, self._unit.rotation(self._unit))
	slot7 = unit

	table.insert(unit_name, self._test_units)

	local push_value = (self._hed.push_multiplier and self._hed.spawn_dir * self._hed.push_multiplier) or 0
	slot9 = 600 * push_value * throw_distance_multiplier

	unit.push(slot6, unit, 100)

	return 
end
function LootBagUnitElement:stop_test_element()
	slot3 = self._test_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot9 = unit

			World.delete_unit(slot7, World)
		end
	end

	self._test_units = {}

	return 
end
function LootBagUnitElement:update_selected(time, rel_time)
	slot9 = self._unit
	slot11 = 0.1

	Application.draw_arrow(slot4, Application, self._unit.position(slot7), self._unit.position(self._unit) + self._hed.spawn_dir * 50, 0.75, 0.75, 0.75)

	return 
end
function LootBagUnitElement:update_editing(time, rel_time)
	slot5 = Input
	local kb = Input.keyboard(slot4)
	local speed = 60 * rel_time
	slot7 = kb
	slot10 = "left"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.spawn_dir
		slot13 = 0
		self._hed.spawn_dir = self._hed.spawn_dir.rotate_with(slot7, Rotation(slot10, speed, 0))
	end

	slot7 = kb
	slot10 = "right"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.spawn_dir
		slot13 = 0
		self._hed.spawn_dir = self._hed.spawn_dir.rotate_with(slot7, Rotation(slot10, -speed, 0))
	end

	slot7 = kb
	slot10 = "up"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.spawn_dir
		slot13 = speed
		self._hed.spawn_dir = self._hed.spawn_dir.rotate_with(slot7, Rotation(slot10, 0, 0))
	end

	slot7 = kb
	slot10 = "down"

	if kb.down(slot6, Idstring(slot9)) then
		slot8 = self._hed.spawn_dir
		slot13 = -speed
		self._hed.spawn_dir = self._hed.spawn_dir.rotate_with(slot7, Rotation(slot10, 0, 0))
	end

	slot7 = self._unit
	local from = self._unit.position(slot6)
	local to = from + self._hed.spawn_dir * 100000
	slot10 = {
		from = from,
		to = to,
		mask = managers.slot.get_mask(slot12, managers.slot)
	}
	slot14 = "statics_layer"
	local ray = managers.editor.unit_by_raycast(slot8, managers.editor)

	if ray and ray.unit then
		slot15 = 0

		Application.draw_sphere(slot9, Application, ray.position, 25, 1, 0)
	end

	return 
end
function LootBagUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	self._build_value_number(slot4, self, panel, panel_sizer, "push_multiplier", {
		floats = 1,
		min = 0
	})

	slot11 = {
		"none"
	}
	slot14 = tweak_data.carry
	slot10 = "Select a carry_id to be created."

	self._build_value_combobox(slot4, self, panel, panel_sizer, "carry_id", table.list_add("Use this to add a velocity to a physic push on the spawned unit", tweak_data.carry.get_carry_ids(slot13)))

	slot8 = "from_respawn"

	self._build_value_checkbox(slot4, self, panel, panel_sizer)

	return 
end

if not LootBagTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

LootBagTriggerUnitElement = slot0
LootBagTriggerUnitElement.SAVE_UNIT_POSITION = false
LootBagTriggerUnitElement.SAVE_UNIT_ROTATION = false
function LootBagTriggerUnitElement:init(unit)
	slot5 = unit

	LootBagTriggerUnitElement.super.init(slot3, self)

	self._hed.elements = {}
	self._hed.trigger_type = "load"
	slot5 = "elements"

	table.insert("load", self._save_values)

	slot5 = "trigger_type"

	table.insert("load", self._save_values)

	return 
end
function LootBagTriggerUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	LootBagTriggerUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.85,
				b = 0.25,
				r = 0.85,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function LootBagTriggerUnitElement:update_editing()
	return 
end
function LootBagTriggerUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "units/dev_tools/mission_elements/point_loot_bag/point_loot_bag"

		if ray.unit.name(slot3) == Idstring(ray.unit) then
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
function LootBagTriggerUnitElement:remove_links(unit)
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
function LootBagTriggerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function LootBagTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"point_loot_bag/point_loot_bag"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select a trigger type for the selected elements"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "trigger_type", {
		"load",
		"spawn"
	})

	slot7 = "This element is a trigger to point_loot_bag element."

	self._add_help_text(slot5, self)

	return 
end

return 
