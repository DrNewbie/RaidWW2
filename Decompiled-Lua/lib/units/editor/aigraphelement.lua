if not AIGraphUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

AIGraphUnitElement = slot0
function AIGraphUnitElement:init(unit)
	slot5 = unit

	EnemyPreferedRemoveUnitElement.super.init(slot3, self)

	self._hed.graph_ids = {}
	self._hed.operation = NavigationManager.nav_states[1]
	slot5 = "graph_ids"

	table.insert(NavigationManager.nav_states[1], self._save_values)

	slot5 = "operation"

	table.insert(NavigationManager.nav_states[1], self._save_values)

	return 
end
function AIGraphUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	EnemyPreferedRemoveUnitElement.super.draw_links(slot6, self, t, dt)

	return 
end
function AIGraphUnitElement:update_editing()
	return 
end
function AIGraphUnitElement:_get_unit(id)
	slot7 = "Ai"
	slot6 = managers.editor.layer(slot5, managers.editor)

	for _, unit in ipairs(managers.editor.layer(slot5, managers.editor).created_units(slot5)) do
		slot9 = unit

		if unit.unit_data(slot8).unit_id == id then
			return unit
		end
	end

	return 
end
function AIGraphUnitElement:update_selected(t, dt)
	slot6 = "Ai"
	slot7 = dt

	managers.editor.layer(slot4, managers.editor).external_draw(slot4, managers.editor.layer(slot4, managers.editor), t)

	slot8 = "Ai"
	slot7 = managers.editor.layer(t, managers.editor)

	for _, unit in ipairs(managers.editor.layer(t, managers.editor).created_units(t)) do
		slot10 = self._hed.graph_ids

		for _, id in ipairs(slot9) do
			slot15 = unit

			if unit.unit_data(slot14).unit_id == id then
				slot16 = {
					g = 0.75,
					b = 0,
					r = 0,
					from_unit = self._unit,
					to_unit = unit
				}

				self._draw_link(slot14, self)
			end
		end
	end

	return 
end
function AIGraphUnitElement:update_unselected()
	slot3 = self._hed.graph_ids

	for _, id in ipairs(slot2) do
		slot9 = id
		local unit = self._get_unit(slot7, self)
		slot9 = unit

		if not alive(self) then
			slot10 = id

			self._add_or_remove_graph(slot8, self)
		end
	end

	return 
end
function AIGraphUnitElement:_add_element()
	slot4 = {
		ray_type = "editor",
		mask = 19
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "nav_surface", 1) then
			slot7 = ray.unit
			slot5 = ray.unit.unit_data(slot6).unit_id

			self._add_or_remove_graph(slot3, self)
		end
	end

	return 
end
function AIGraphUnitElement:_add_or_remove_graph(id)
	slot5 = id

	if table.contains(slot3, self._hed.graph_ids) then
		slot5 = id

		table.delete(slot3, self._hed.graph_ids)
	else
		slot5 = id

		table.insert(slot3, self._hed.graph_ids)
	end

	return 
end
function AIGraphUnitElement:add_unit_list_btn()
	local function f(unit)
		slot4 = "ai"

		return unit.type(slot2) == Idstring(unit)
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Add Trigger Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot13 = unit
		slot11 = unit.unit_data(slot12).unit_id

		self._add_or_remove_graph(slot9, self)
	end

	return 
end
function AIGraphUnitElement:remove_links(unit)
	slot4 = self._hed.graph_ids

	for _, id in ipairs(slot3) do
		slot9 = unit

		if id == unit.unit_data(slot8).unit_id then
			slot10 = id

			table.delete(slot8, self._hed.graph_ids)
		end
	end

	return 
end
function AIGraphUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "_add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function AIGraphUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "TB_FLAT,TB_NODIVIDER"
	self._btn_toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot10 = "world_editor\\unit_by_name_list.png"

	self._btn_toolbar.add_tool(slot4, self._btn_toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(slot9))

	slot12 = "add_unit_list_btn"
	slot9 = nil

	self._btn_toolbar.connect(slot4, self._btn_toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot5 = self._btn_toolbar

	self._btn_toolbar.realize(slot4)

	slot9 = "EXPAND,LEFT"

	panel_sizer.add(slot4, panel_sizer, self._btn_toolbar, 0, 1)

	local operations_params = {
		name = "Operation:",
		name_proportions = 1,
		tooltip = "Select an operation to perform on the selected graphs",
		sorted = true,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = panel_sizer,
		options = NavigationManager.nav_states,
		value = self._hed.operation
	}
	local operations = CoreEWS.combobox(panel_sizer)
	slot13 = "set_element_data"
	slot10 = {
		value = "operation",
		ctrlr = operations
	}

	operations.connect(operations_params, operations, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self, self, self))

	local help = {
		text = "The operation defines what to do with the selected graphs",
		panel = panel,
		sizer = panel_sizer
	}
	slot9 = help

	self.add_help_text(operations, self)

	return 
end

return 
