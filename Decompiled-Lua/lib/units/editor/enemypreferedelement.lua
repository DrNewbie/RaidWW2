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
if not EnemyPreferedAddUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

EnemyPreferedAddUnitElement = slot0
EnemyPreferedAddUnitElement.SAVE_UNIT_POSITION = false
EnemyPreferedAddUnitElement.SAVE_UNIT_ROTATION = false
function EnemyPreferedAddUnitElement:init(unit)
	slot5 = unit

	EnemyPreferedRemoveUnitElement.super.init(slot3, self)

	slot5 = "spawn_points"

	table.insert(slot3, self._save_values)

	slot5 = "spawn_groups"

	table.insert(slot3, self._save_values)

	return 
end
function EnemyPreferedAddUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	EnemyPreferedRemoveUnitElement.super.draw_links(slot6, self, t, dt, selected_unit)

	slot11 = all_units

	self._private_draw_links(slot6, self, t, dt, selected_unit)

	return 
end
function EnemyPreferedAddUnitElement:_private_draw_links(t, dt, selected_unit, all_units)
	local function _draw_func(element_ids)
		if not element_ids then
			return 
		end

		slot3 = element_ids

		for _, id in ipairs(slot2) do
			local unit = all_units[id]
			local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

			if draw then
				slot11 = {
					g = 0,
					b = 0.75,
					r = 0,
					from_unit = self._unit,
					to_unit = unit
				}

				self._draw_link(slot9, self)
			end
		end

		return 
	end

	slot8 = self._hed.spawn_points

	_draw_func(slot7)

	slot8 = self._hed.spawn_groups

	_draw_func(slot7)

	return 
end
function EnemyPreferedAddUnitElement:update_editing()
	return 
end
function EnemyPreferedAddUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		local is_group, id = nil
		slot8 = ray.unit
		slot8 = ray.unit.name(slot7)
		slot9 = true

		if string.find(slot5, ray.unit.name(slot7).s(slot7), "ai_spawn_enemy", 1) then
			slot6 = ray.unit
			id = ray.unit.unit_data(slot5).unit_id
		else
			slot8 = ray.unit
			slot8 = ray.unit.name(slot7)
			slot9 = true

			if string.find(slot5, ray.unit.name(slot7).s(slot7), "ai_enemy_group", 1) then
				slot6 = ray.unit
				id = ray.unit.unit_data(slot5).unit_id
				is_group = true
			end
		end

		if id then
			if is_group then
				if self._hed.spawn_groups then
					slot7 = id
				else
					self._hed.spawn_groups = self._hed.spawn_groups or {}
					slot7 = id

					table.insert(self._hed.spawn_groups or , self._hed.spawn_groups)
				end
			elseif self._hed.spawn_points then
				slot7 = id
			else
				self._hed.spawn_points = self._hed.spawn_points or {}
				slot7 = id

				table.insert(self._hed.spawn_points or , self._hed.spawn_points)
			end
		end
	end

	return 
end
function EnemyPreferedAddUnitElement:_delete_id_from_table(id, table_name)
	if not self._hed[table_name] then
		return 
	end

	slot6 = id

	table.delete(slot4, self._hed[table_name])

	slot5 = self._hed[table_name]

	if not next(slot4) then
		self._hed[table_name] = nil
	end

	return 
end
function EnemyPreferedAddUnitElement:remove_links(unit)
	slot4 = unit
	local rem_u_id = unit.unit_data(slot3).unit_id

	local function _rem_func(element_ids)
		if not element_ids then
			return 
		end

		slot3 = element_ids

		for _, id in ipairs(slot2) do
			if id == rem_u_id then
				slot9 = id

				table.delete(slot7, element_ids)
			end
		end

		return 
	end

	slot6 = self._hed.spawn_points

	_rem_func(slot5)

	slot6 = self._hed.spawn_groups

	_rem_func(slot5)

	return 
end
function EnemyPreferedAddUnitElement:get_links_to_unit(...)
	slot3 = self

	EnemyPreferedAddUnitElement.super.get_links_to_unit(slot2, ...)

	if self._hed.spawn_groups then
		slot5 = "spawn_group"

		self._get_links_of_type_from_elements(slot2, self, self._hed.spawn_groups, ...)
	end

	if self._hed.spawn_points then
		slot5 = "spawn_point"

		self._get_links_of_type_from_elements(slot2, self, self._hed.spawn_points, ...)
	end

	return 
end
function EnemyPreferedAddUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function EnemyPreferedAddUnitElement:add_unit_list_btn()
	slot3 = self._unit
	local script = self._unit.mission_element_data(slot2).script

	local function f(unit)

		-- Decompilation error in this vicinity:
		slot3 = unit
		slot3 = unit
		local id = unit.unit_data(slot2).unit_id

		if self._hed.spawn_points then
			slot5 = id

			if table.contains(slot3, self._hed.spawn_points) then
				return false
			end
		end

		if self._hed.spawn_groups then
			slot5 = id

			if table.contains(slot3, self._hed.spawn_groups) then
				return false
			end
		end

		slot6 = unit
		slot6 = unit.name(slot5)
		slot7 = true

		return false
	end

	local dialog = SelectUnitByNameModal.new(slot4, SelectUnitByNameModal, "Add Unit")
	slot8 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		local id = unit.unit_data(slot10).unit_id
		slot14 = unit
		slot14 = unit.name(slot13)
		slot15 = true

		if string.find(unit, unit.name(slot13).s(slot13), "ai_enemy_group", 1) then
			self._hed.spawn_groups = self._hed.spawn_groups or {}
			slot13 = id

			table.insert(self._hed.spawn_groups or , self._hed.spawn_groups)
		else
			slot14 = unit
			slot14 = unit.name(slot13)
			slot15 = true

			if string.find(slot11, unit.name(slot13).s(slot13), "ai_spawn_enemy", 1) then
				self._hed.spawn_points = self._hed.spawn_points or {}
				slot13 = id

				table.insert(self._hed.spawn_points or , self._hed.spawn_points)
			end
		end
	end

	return 
end
function EnemyPreferedAddUnitElement:remove_unit_list_btn()
	local function f(unit)
		return slot1
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Remove Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do

		-- Decompilation error in this vicinity:
		local id = unit.unit_data(slot9).unit_id
		slot13 = "spawn_groups"

		self._delete_id_from_table(unit, self, id)

		slot13 = "spawn_points"

		self._delete_id_from_table(unit, self, id)
	end

	return 
end
function EnemyPreferedAddUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot11 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(slot10))

	slot13 = "add_unit_list_btn"

	toolbar.connect(EWS, toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot11 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "REMOVE_UNIT_LIST", "Remove unit from unit list", CoreEws.image_path(nil))

	slot13 = "remove_unit_list_btn"
	slot10 = nil

	toolbar.connect(EWS, toolbar, "REMOVE_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot6 = toolbar

	toolbar.realize(EWS)

	slot10 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, toolbar, 0, 1)

	return 
end

if not EnemyPreferedRemoveUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

EnemyPreferedRemoveUnitElement = slot0
EnemyPreferedRemoveUnitElement.SAVE_UNIT_POSITION = false
EnemyPreferedRemoveUnitElement.SAVE_UNIT_ROTATION = false
function EnemyPreferedRemoveUnitElement:init(unit)
	slot5 = unit

	EnemyPreferedRemoveUnitElement.super.init(slot3, self)

	self._hed.elements = {}
	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function EnemyPreferedRemoveUnitElement:update_editing()
	return 
end
function EnemyPreferedRemoveUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	EnemyPreferedRemoveUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0,
				b = 0,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function EnemyPreferedRemoveUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "ai_enemy_prefered_add", 1) then
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
function EnemyPreferedRemoveUnitElement:remove_links(unit)
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
function EnemyPreferedRemoveUnitElement:get_links_to_unit(...)
	slot3 = self

	EnemyPreferedRemoveUnitElement.super.get_links_to_unit(slot2, ...)

	if self._hed.elements then
		slot5 = "operator"

		self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)
	end

	return 
end
function EnemyPreferedRemoveUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function EnemyPreferedRemoveUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"ai_enemy_prefered_add"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	return 
end

return 
