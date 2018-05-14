if not NavObstacleElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

NavObstacleElement = slot0
NavObstacleElement.init = function (self, unit)
	slot5 = unit

	NavObstacleElement.super.init(slot3, self)

	self._guis = {}
	self._obstacle_units = {}
	self._hed.obstacle_list = {}
	self._all_object_names = {}
	self._hed.operation = "add"
	slot5 = "obstacle_list"

	table.insert("add", self._save_values)

	slot5 = "operation"

	table.insert("add", self._save_values)

	return 
end
NavObstacleElement.layer_finished = function (self)
	slot3 = self

	MissionElement.layer_finished(slot2)

	if self._hed.obstacle_unit_id then
		slot4 = {
			unit_id = self._hed.obstacle_unit_id,
			obj_name = self._hed.obstacle_obj_name
		}

		table.insert(slot2, self._hed.obstacle_list)
	end

	slot3 = self._hed.obstacle_list

	for _, data in pairs(slot2) do
		slot9 = data.unit_id
		slot14 = "load_unit"
		local unit = managers.worlddefinition.get_unit_on_load(slot7, managers.worlddefinition, callback(slot11, self, self))

		if unit then
			slot10 = unit
			self._obstacle_units[unit.unit_data(slot9).unit_id] = unit
		end
	end

	return 
end
NavObstacleElement.load_unit = function (self, unit)
	if unit then
		slot5 = unit
		self._obstacle_units[unit.unit_data(slot4).unit_id] = unit
	end

	return 
end
NavObstacleElement.update_selected = function (self, t, dt, selected_unit, all_units)
	slot10 = all_units

	self._check_alive_units_and_draw(slot6, self, "selected", selected_unit)

	return 
end
NavObstacleElement.update_unselected = function (self, t, dt, selected_unit, all_units)
	slot10 = all_units

	self._check_alive_units_and_draw(slot6, self, "unselected", selected_unit)

	return 
end
NavObstacleElement._check_alive_units_and_draw = function (self, type, selected_unit, all_units)
	local r = (type == "selected" and 1) or 0.5
	local g = 0
	local b = 0
	slot9 = self._obstacle_units

	for id, unit in pairs(slot8) do
		slot14 = unit

		if not alive(slot13) then
			slot15 = id

			self._remove_by_unit_id(slot13, self)

			self._obstacle_units[id] = nil
		else
			slot16 = unit

			if self._should_draw_link(slot13, self, selected_unit) then
				local params = {
					from_unit = self._unit,
					to_unit = unit,
					r = r,
					g = g,
					b = b
				}
				slot16 = params

				self._draw_link(slot14, self)

				slot19 = b / 2

				Application.draw(slot14, Application, unit, r / 2, g / 2)

				slot15 = self._hed.obstacle_list

				for _, data in pairs(slot14) do
					if data.unit_id == id then
						slot21 = data.obj_name
						local obj = unit.get_object(slot19, unit)

						if obj then
							slot25 = b

							Application.draw(slot20, Application, obj, r, g)
						end
					end
				end
			end
		end
	end

	return 
end
NavObstacleElement.draw_links_unselected = function (self, ...)
	slot3 = self

	NavObstacleElement.super.draw_links_unselected(slot2, ...)

	return 
end
NavObstacleElement._select_unit_mask = function (self)
	slot4 = "all"
	slot5 = "mission_elements"

	return managers.slot.get_mask(slot2, managers.slot) - managers.slot.get_mask(managers.slot, managers.slot)
end
NavObstacleElement.update_editing = function (self)
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = self._select_unit_mask(slot6)
	}
	slot7 = self
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot8 = 0

		Application.draw(slot3, Application, ray.unit, 0, 1)
	end

	return 
end
NavObstacleElement.select_unit = function (self)
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = self._select_unit_mask(slot6)
	}
	slot7 = self
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = ray.unit

		self._check_add_unit(slot3, self)
	end

	return 
end
NavObstacleElement._check_add_unit = function (self, unit)
	local all_object_names = self._get_objects_by_unit(slot3, self)
	slot6 = unit
	self._obstacle_units[unit.unit_data(unit).unit_id] = unit
	local obstacle_list_data = {}
	slot6 = unit
	obstacle_list_data.unit_id = unit.unit_data(unit).unit_id
	slot8 = all_object_names[1]
	obstacle_list_data.obj_name = Idstring(self._unindent_obj_name(slot7))
	slot7 = obstacle_list_data

	table.insert(unit, self._hed.obstacle_list)

	slot9 = obstacle_list_data

	self._add_unit(unit, self, unit, all_object_names)

	return 
end
NavObstacleElement._remove_by_unit_id = function (self, unit_id)
	local remove_entries = {}
	slot5 = self._guis

	for id, entry in pairs(slot4) do
		if entry.unit_id == unit_id then
			slot11 = id

			table.insert(slot9, remove_entries)
		end
	end

	slot5 = remove_entries

	for _, id in ipairs(slot4) do
		slot11 = id

		self.remove_entry(slot9, self)
	end

	slot7 = self._hed.obstacle_list

	for i, data in ipairs(clone(slot6)) do
		if data.unit_id == unit_id then
			slot11 = i

			table.remove(slot9, self._hed.obstacle_list)
		end
	end

	slot6 = unit_id

	self._remove_from_obstacle_list(slot4, self)

	return 
end
NavObstacleElement.remove_entry = function (self, id)
	local unit_id = self._guis[id].unit_id
	slot5 = self._guis[id].unit_id_ctrlr

	self._guis[id].unit_id_ctrlr.destroy(slot4)

	slot5 = self._guis[id].obj_names

	self._guis[id].obj_names.destroy(slot4)

	slot5 = self._guis[id].name_ctrlr

	self._guis[id].name_ctrlr.destroy(slot4)

	slot5 = self._guis[id].toolbar

	self._guis[id].toolbar.destroy(slot4)

	self._guis[id] = nil
	slot5 = self._panel

	self._panel.layout(nil)

	slot7 = self._hed.obstacle_list

	for i, entry in pairs(clone(slot6)) do
		if entry.guis_id == id then
			slot11 = i

			table.remove(slot9, self._hed.obstacle_list)
		end
	end

	slot5 = self._guis

	for _, guis in pairs(slot4) do
		if guis.unit_id == unit_id then
			return 
		end
	end

	self._obstacle_units[unit_id] = nil

	return 
end
NavObstacleElement._remove_from_obstacle_list = function (self, unit_id)
	slot6 = self._hed.obstacle_list

	for i, entry in pairs(clone(slot5)) do
		if entry.unit_id == unit_id then
			slot10 = i

			table.remove(slot8, self._hed.obstacle_list)
		end
	end

	return 
end
NavObstacleElement._add_unit = function (self, unit, all_object_names, obstacle_list_data)
	local panel = self._panel
	local panel_sizer = self._panel_sizer
	slot13 = unit
	local unit_id = EWS.StaticText(slot7, EWS, panel, "" .. unit.unit_data("").name_id, 0)
	slot13 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, unit_id, 0, 0)

	slot10 = "HORIZONTAL"
	local h_sizer = EWS.BoxSizer(EWS, EWS)
	slot14 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, h_sizer, 0, 1)

	local obj_names_params = {
		name = "Object:",
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "Select an object from the combobox",
		sorted = true,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = h_sizer,
		options = all_object_names
	}
	slot13 = obstacle_list_data.obj_name
	obj_names_params.value = self._get_indented_obj_name(panel_sizer, nil, unit)
	local obj_names = CoreEws.combobox(panel_sizer)
	self._guis_id = self._guis_id or 0
	self._guis_id = self._guis_id + 1
	obstacle_list_data.guis_id = self._guis_id
	slot15 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(obj_names_params, EWS, panel, "")
	slot18 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "SELECT", "Select dialog", CoreEws.image_path(slot17))

	slot20 = "remove_entry"
	slot17 = self._guis_id

	toolbar.connect(EWS, toolbar, "SELECT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot13 = toolbar

	toolbar.realize(EWS)

	slot16 = unit
	self._guis[self._guis_id] = {
		unit_id_ctrlr = unit_id,
		unit = unit,
		unit_id = unit.unit_data("EVT_COMMAND_MENU_SELECTED").unit_id,
		obj_names = obj_names,
		name_ctrlr = obj_names_params.name_ctrlr,
		toolbar = toolbar,
		guis_id = self._guis_id
	}
	slot17 = "EXPAND,LEFT"

	h_sizer.add(self._guis_id, h_sizer, toolbar, 0, 1)

	slot19 = "set_obj_name_data"
	slot16 = self._guis_id

	obj_names.connect(self._guis_id, obj_names, "EVT_COMMAND_COMBOBOX_SELECTED", callback(1, self, self))

	slot13 = panel

	panel.layout(self._guis_id)

	return 
end
NavObstacleElement.set_obj_name_data = function (self, guis_id)
	local obj_name = self._guis[guis_id].obj_names.get_value(slot3)
	slot5 = self._hed.obstacle_list

	for i, entry in pairs(self._guis[guis_id].obj_names) do
		if entry.guis_id == guis_id then
			slot12 = obj_name
			entry.obj_name = Idstring(self._unindent_obj_name(slot11))

			break
		end
	end

	return 
end
NavObstacleElement.add_triggers = function (self, vc)
	slot5 = Idstring(slot6)
	slot10 = "select_unit"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
NavObstacleElement.select_unit_list_btn = function (self)
	local function f(unit)
		slot4 = "Statics"
		slot4 = unit
		slot4 = unit.type(managers.editor.layer(slot2, managers.editor))

		if not managers.editor.layer(slot2, managers.editor).category_map(slot2)[unit.type(managers.editor.layer(slot2, managers.editor)).s(managers.editor.layer(slot2, managers.editor))] then
			return false
		end

		return true
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Select Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot11 = unit

		self._check_add_unit(slot9, self)
	end

	return 
end
NavObstacleElement._build_panel = function (self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	self._build_value_combobox(slot4, self, panel, panel_sizer, "operation", {
		"add",
		"remove"
	})

	slot8 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot11 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "SELECT_UNIT_LIST", "Select unit from unit list", CoreEws.image_path("Choose if you want to add or remove an obstacle."))

	slot13 = "select_unit_list_btn"
	slot10 = nil

	toolbar.connect(EWS, toolbar, "SELECT_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot6 = toolbar

	toolbar.realize(EWS)

	slot10 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, toolbar, 0, 1)

	slot8 = self._hed.obstacle_list

	for _, data in pairs(clone(toolbar)) do
		local unit = self._obstacle_units[data.unit_id]
		slot12 = unit

		if not alive(slot11) then
			slot13 = data.unit_id

			self._remove_by_unit_id(slot11, self)
		else
			slot13 = data.obj_name

			if not unit.get_object(slot11, unit) then
				slot19 = self._unit
				slot17 = self._unit.unit_data(slot18).unit_id

				debug_pause(slot11, "[NavObstacleElement:_build_panel] object", data.object_name, "not found in unit", unit, ". element ID ")

				slot13 = data.unit_id

				self._remove_by_unit_id(slot11, self)
			else
				slot13 = unit
				local all_object_names = self._get_objects_by_unit(slot11, self)
				slot16 = data

				self._add_unit(self, self, unit, all_object_names)
			end
		end
	end

	return 
end
NavObstacleElement._get_objects_by_unit = function (self, unit)
	local all_object_names = {}

	if unit then
		slot5 = unit
		local root_obj = unit.orientation_object(slot4)
		all_object_names = {}
		local tree_depth = 1
		local _process_object_tree = nil

		function _process_object_tree(obj, depth)
			slot4 = obj
			slot4 = obj.name(slot3)
			local indented_name = obj.name(slot3).s(slot3)

			for i = 1, depth, 1 do
				indented_name = "-" .. indented_name
			end

			slot6 = indented_name

			table.insert(slot4, all_object_names)

			local children = obj.children(slot4)
			slot6 = children

			for _, child in ipairs(obj) do
				slot12 = depth + 1

				_process_object_tree(slot10, child)
			end

			return 
		end

		slot9 = 0

		_process_object_tree(slot7, root_obj)
	end

	return all_object_names
end
NavObstacleElement._unindent_obj_name = function (obj_name)
	slot5 = 1

	while string.sub(slot2, obj_name, 1) == "-" do
		slot4 = 2
		obj_name = string.sub(slot2, obj_name)
	end

	return obj_name
end
NavObstacleElement._get_indented_obj_name = function (obj, parent, obj_name)
	if parent then
		slot6 = obj_name

		if not parent.get_object(slot4, parent) then
		end
	end

	if not obj_name then
		slot5 = obj
		slot3 = obj.name(slot4)
	end

	slot5 = slot3
	local obj_name = slot3.s(slot4)
	slot6 = obj

	while obj.parent(slot5) do
		slot6 = obj
		obj = obj.parent(slot5)
		obj_name = "-" .. obj_name
	end

	return obj_name
end

return 
