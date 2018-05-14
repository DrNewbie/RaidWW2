slot3 = "CoreEngineAccess"

core.import(slot1, core)

function CoreEditor:build_lower_panel(parent)
	self._lower_panel = EWS.Panel(slot3, EWS, Global.frame_panel, "")
	slot5 = "HORIZONTAL"
	local lower_sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = lower_sizer

	self._lower_panel.set_sizer(EWS, self._lower_panel)

	slot9 = self._lower_panel
	slot9 = "EXPAND"

	lower_sizer.add(EWS, lower_sizer, self.build_info_frame("TAB_TRAVERSAL", self), 1, 0)

	slot9 = self._lower_panel
	slot9 = "EXPAND"

	lower_sizer.add(EWS, lower_sizer, self.build_edit_frame(1, self), 1, 0)

	slot6 = false

	self._edit_panel.set_visible(EWS, self._edit_panel)

	return self._lower_panel
end
function CoreEditor:add_edit_buttons(edit_btn_sizer)
	slot5 = " CoreEditor:add_edit_buttons( edit_btn_sizer )"

	cat_print(slot3, "editor")

	self._edit_buttons = {}
	slot4 = self._edit_buttons

	for _, btn in pairs(slot3) do
		slot11 = false

		self._left_toolbar.set_tool_enabled(slot8, self._left_toolbar, btn)
	end

	return 
end
function CoreEditor:build_info_frame(parent)
	slot7 = "TAB_TRAVERSAL"
	self._info_frame = EWS.Panel(slot3, EWS, parent, "Info Frame")
	slot5 = "HORIZONTAL"
	self._info_sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self._info_sizer

	self._info_frame.set_sizer(slot3, self._info_frame)

	slot8 = "TE_MULTILINE,TE_NOHIDESEL,TE_RICH2,TE_DONTWRAP,TE_READONLY"
	self._outputctrl = EWS.TextCtrl(slot3, EWS, self._info_frame, "- What would you like to build today? -\n\n", "")
	slot5 = "Courier New"

	self._outputctrl.set_font_face(slot3, self._outputctrl)
	self._info_sizer.add(slot3, self._info_sizer, self._outputctrl, 1, 0)

	slot5 = "Editor console output"

	self._outputctrl.set_tool_tip(slot3, self._outputctrl)

	slot7 = "NB_RIGHT,NB_MULTILINE"
	self._unit_info_notebook = EWS.Notebook(slot3, EWS, self._info_frame, "_unit_info_notebook")
	slot11 = "_change_unit_info"
	slot8 = self._unit_info_notebook

	self._ews_editor_frame.connect(slot3, self._ews_editor_frame, "_unit_info_notebook", "EVT_COMMAND_NOTEBOOK_PAGE_CHANGED", callback("EXPAND", self, self))

	slot8 = "EXPAND"

	self._info_sizer.add(slot3, self._info_sizer, self._unit_info_notebook, 1, 0)

	slot8 = "TE_MULTILINE,TE_RICH2,TE_DONTWRAP,TE_READONLY"
	self._unit_info = EWS.TextCtrl(slot3, EWS, self._unit_info_notebook, "Generic unit info", "")
	slot5 = "Courier New"

	self._unit_info.set_font_face(slot3, self._unit_info)

	slot5 = "Generic unit information"

	self._unit_info.set_tool_tip(slot3, self._unit_info)

	slot8 = "TE_MULTILINE,TE_RICH2,TE_DONTWRAP,TE_READONLY"
	self._gfx_unit_info = EWS.TextCtrl(slot3, EWS, self._unit_info_notebook, "Gfx unit info", "")
	slot5 = "Courier New"

	self._gfx_unit_info.set_font_face(slot3, self._gfx_unit_info)

	slot5 = "Gfx unit information"

	self._gfx_unit_info.set_tool_tip(slot3, self._gfx_unit_info)

	slot7 = true

	self._unit_info_notebook.add_page(slot3, self._unit_info_notebook, self._unit_info, "Generic")

	slot7 = false

	self._unit_info_notebook.add_page(slot3, self._unit_info_notebook, self._gfx_unit_info, "Gfx")

	slot7 = ""
	local unit_info_panel = EWS.Panel(slot3, EWS, self._info_frame, "")
	slot6 = "HORIZONTAL"
	local unit_info_sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = unit_info_sizer

	unit_info_panel.set_sizer(EWS, unit_info_panel)

	slot10 = "EXPAND"

	self._info_sizer.add(EWS, self._info_sizer, unit_info_panel, 0, 0)

	slot9 = "TB_FLAT,TB_VERTICAL,TB_NODIVIDER"
	self._unit_info_toolbar = EWS.ToolBar(EWS, EWS, unit_info_panel, "")
	slot6 = self

	self.add_open_unit_file_buttons(EWS)

	slot6 = self._unit_info_toolbar

	self._unit_info_toolbar.realize(EWS)

	slot10 = "EXPAND"

	unit_info_sizer.add(EWS, unit_info_sizer, self._unit_info_toolbar, 0, 0)

	return self._info_frame
end
function CoreEditor:add_open_unit_file_buttons()
	self._open_unit_file_buttons = {}
	slot8 = "world_editor\\unit_file_unit_16x16.png"

	self._unit_info_toolbar.add_tool(slot2, self._unit_info_toolbar, "LTB_OPEN_UNIT_XML", "Open unit file", CoreEWS.image_path(slot7))

	slot10 = "on_open_unit_file"

	self._unit_info_toolbar.connect(slot2, self._unit_info_toolbar, "LTB_OPEN_UNIT_XML", "EVT_COMMAND_MENU_SELECTED", callback("Open unit file", self, self))

	slot8 = "world_editor\\unit_file_object_16x16.png"

	self._unit_info_toolbar.add_tool(slot2, self._unit_info_toolbar, "LTB_OPEN_OBJECT_XML", "Open object file", CoreEWS.image_path({
		type = "unit"
	}))

	slot10 = "on_open_unit_file"

	self._unit_info_toolbar.connect(slot2, self._unit_info_toolbar, "LTB_OPEN_OBJECT_XML", "EVT_COMMAND_MENU_SELECTED", callback("Open unit file", self, self))

	slot8 = "world_editor\\unit_file_material_16x16.png"

	self._unit_info_toolbar.add_tool(slot2, self._unit_info_toolbar, "LTB_OPEN_MATERIAL_XML", "Open material file", CoreEWS.image_path({
		type = "object"
	}))

	slot10 = "on_open_unit_file"

	self._unit_info_toolbar.connect(slot2, self._unit_info_toolbar, "LTB_OPEN_MATERIAL_XML", "EVT_COMMAND_MENU_SELECTED", callback("Open material file", self, self))

	slot8 = "world_editor\\unit_file_sequence_16x16.png"

	self._unit_info_toolbar.add_tool(slot2, self._unit_info_toolbar, "LTB_OPEN_SEQUECNCE_XML", "Open sequence file", CoreEWS.image_path({
		type = "material_config"
	}))

	slot10 = "on_open_unit_file"

	self._unit_info_toolbar.connect(slot2, self._unit_info_toolbar, "LTB_OPEN_SEQUECNCE_XML", "EVT_COMMAND_MENU_SELECTED", callback("Open sequence file", self, self))

	slot8 = "world_editor\\unit_file_max_16x16.png"

	self._unit_info_toolbar.add_tool(slot2, self._unit_info_toolbar, "LTB_OPEN_LAST_EXPORTED", "Open source file", CoreEWS.image_path({
		type = "sequence_manager"
	}))

	slot10 = "on_open_unit_file"

	self._unit_info_toolbar.connect(slot2, self._unit_info_toolbar, "LTB_OPEN_LAST_EXPORTED", "EVT_COMMAND_MENU_SELECTED", callback("Open source 3Dsmax file", self, self))

	slot8 = "folder_open_16x16.png"

	self._unit_info_toolbar.add_tool(slot2, self._unit_info_toolbar, "LTB_OPEN_FOLDER_EXPORTED", "Open content folder", CoreEWS.image_path({
		type = "max"
	}))

	slot10 = "on_open_unit_file"

	self._unit_info_toolbar.connect(slot2, self._unit_info_toolbar, "LTB_OPEN_FOLDER_EXPORTED", "EVT_COMMAND_MENU_SELECTED", callback("Open content folder", self, self))

	slot8 = "folder_open_source_16x16.png"

	self._unit_info_toolbar.add_tool(slot2, self._unit_info_toolbar, "LTB_OPEN_FOLDER_SOURCE", "Open source folder", CoreEWS.image_path({
		type = "folder"
	}))

	slot10 = "on_open_unit_file"
	slot7 = {
		type = "folder_source"
	}

	self._unit_info_toolbar.connect(slot2, self._unit_info_toolbar, "LTB_OPEN_FOLDER_SOURCE", "EVT_COMMAND_MENU_SELECTED", callback("Open source folder", self, self))

	slot4 = "LTB_OPEN_UNIT_XML"

	table.insert(slot2, self._open_unit_file_buttons)

	slot4 = "LTB_OPEN_OBJECT_XML"

	table.insert(slot2, self._open_unit_file_buttons)

	slot4 = "LTB_OPEN_MATERIAL_XML"

	table.insert(slot2, self._open_unit_file_buttons)

	slot4 = "LTB_OPEN_SEQUECNCE_XML"

	table.insert(slot2, self._open_unit_file_buttons)

	slot4 = "LTB_OPEN_LAST_EXPORTED"

	table.insert(slot2, self._open_unit_file_buttons)

	slot4 = "LTB_OPEN_FOLDER_EXPORTED"

	table.insert(slot2, self._open_unit_file_buttons)

	slot4 = "LTB_OPEN_FOLDER_SOURCE"

	table.insert(slot2, self._open_unit_file_buttons)

	slot3 = self._open_unit_file_buttons

	for _, btn in ipairs(slot2) do
		slot10 = false

		self._unit_info_toolbar.set_tool_enabled(slot7, self._unit_info_toolbar, btn)
	end

	return 
end
function CoreEditor:_change_unit_info(notebook)
	return 
end
function CoreEditor:on_open_unit_file(data)
	slot6 = self

	if alive(self.selected_unit(slot5)) then
		local unit = self.selected_unit(slot3)
		slot5 = self
		slot5 = self.selected_unit(self)
		local u_name = self.selected_unit(self).name(self)
		local lookup = nil

		if data.type == "unit" then
			slot7 = unit
			slot7 = unit.name(slot6)
			lookup = unit.name(slot6).s(slot6)
		elseif data.type == "object" then
			slot7 = unit
			lookup = unit.model_filename(slot6)
		elseif data.type == "material_config" then
			slot7 = unit
			slot7 = unit.material_config(slot6)
			lookup = unit.material_config(slot6).s(slot6)
		elseif data.type == "sequence_manager" then
			slot8 = unit
			lookup = self.sequence_file(slot6, self)
		elseif data.type == "max" then
			slot7 = unit
			lookup = unit.last_export_source(slot6)
			slot7 = "start " .. lookup

			os.execute(slot6)

			return 
		elseif data.type == "folder" then
			slot7 = unit
			slot7 = unit.name(slot6)
			lookup = unit.name(slot6).s(slot6)
			slot8 = lookup
			local fullPath = managers.database.entry_expanded_directory(slot6, managers.database)
			slot10 = "\\"
			lookup = string.gsub(managers.database, fullPath, "/")
			slot8 = "explorer /select, " .. lookup .. ".unit"

			os.execute(managers.database)

			return 
		elseif data.type == "folder_source" then
			slot7 = unit
			slot7 = unit.last_export_source(slot6)
			lookup = unit.last_export_source(slot6).s(slot6)
			slot9 = "\\"
			lookup = string.gsub(slot6, lookup, "/")
			slot7 = "explorer /select, " .. lookup

			os.execute(slot6)

			return 
		end

		if not lookup then
			return 
		end

		slot9 = lookup
		local full_path = managers.database.entry_expanded_path(slot6, managers.database, data.type)
		slot9 = full_path

		if managers.database.has(managers.database, managers.database) then
			slot8 = "start " .. full_path

			os.execute(slot7)
		else
			slot12 = u_name
			slot9 = "Unit " .. u_name.s(slot11) .. " didn't have a " .. data.type .. " file."

			self.output_warning(slot7, self)
		end
	end

	return 
end
function CoreEditor:sequence_file(unit)
	slot4 = unit

	if alive(slot3) then
		slot6 = unit
		slot6 = unit.name(slot5)
		slot4 = CoreEngineAccess._editor_unit_data(unit.name(slot5).id(slot5))
		local object_file = CoreEngineAccess._editor_unit_data(unit.name(slot5).id(slot5)).model(slot3)
		local node = nil
		slot8 = object_file

		if DB.has(slot5, DB, "object") then
			slot8 = object_file
			node = DB.load_node(slot5, DB, "object")
		else
			slot10 = object_file
			slot7 = "data/objects" .. object_file.s(slot9)
			node = SystemFS.parse_xml(slot5, SystemFS)
		end

		slot6 = node

		for child in node.children(slot5) do
			slot10 = child

			if child.name(slot9) == "sequence_manager" then
				slot11 = "file"

				return child.parameter(slot9, child)
			end
		end

		slot9 = unit
		slot9 = unit.name(slot8)
		slot7 = unit.name(slot8).s(slot8) .. " didn't have a sequence xml."

		managers.editor.output_warning(slot5, managers.editor)
	end

	return false
end
function CoreEditor:build_edit_frame(parent)
	slot7 = "TAB_TRAVERSAL"
	self._edit_panel = EWS.Panel(slot3, EWS, parent, "Edit Panel")
	slot5 = "HORIZONTAL"
	local main_sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = main_sizer

	self._edit_panel.set_sizer(EWS, self._edit_panel)

	slot6 = false

	self._edit_panel.set_visible(EWS, self._edit_panel)

	return self._edit_panel, main_sizer
end
function CoreEditor:show_edit(data)
	slot4 = self[data.panel]
	slot8 = data.btn

	self[data.panel].set_visible(slot3, self._left_toolbar.tool_state(slot6, self._left_toolbar))

	slot7 = self
	slot5 = not self.check_edit_buttons(slot6)

	self._info_frame.set_visible(slot3, self._info_frame)

	slot4 = self._edit_panel
	slot7 = self

	self._edit_panel.set_visible(slot3, self.check_edit_buttons(slot6))

	slot4 = self._edit_panel

	self._edit_panel.layout(slot3)

	slot4 = self._lower_panel

	self._lower_panel.layout(slot3)

	return 
end
function CoreEditor:check_edit_buttons()
	local value = false
	slot4 = self._edit_buttons

	for _, btn in pairs(slot3) do
		if not value then
			slot10 = btn
			value = self._left_toolbar.tool_state(slot8, self._left_toolbar)
		end
	end

	return value
end
function CoreEditor:layout_edit_panel()
	slot3 = self._edit_panel

	self._edit_panel.layout(slot2)

	slot3 = self._lower_panel

	self._lower_panel.layout(slot2)

	return 
end
function CoreEditor:unit_output(unit)
	slot4 = unit

	if alive(slot3) then
		local n = "\n"
		local t = "\t"
		slot10 = unit
		slot8 = unit.unit_data(slot9).unit_id
		slot10 = unit
		slot10 = unit.name(slot9)
		local text = "ID / Name:" .. t .. tostring(slot7) .. " / " .. unit.name(slot9).s(slot9) .. n
		slot10 = unit
		text = text .. "NameID:" .. t .. unit.unit_data(n).name_id .. n
		slot10 = unit
		slot10 = unit.type(n)
		slot12 = unit
		text = text .. "Type / Slot:" .. t .. unit.type(n).s(n) .. " / " .. unit.slot(slot11) .. n
		slot11 = unit
		text = text .. "Mass:" .. t .. t .. unit.mass(unit.slot(slot11)) .. n
		slot11 = unit
		slot11 = unit.author(n)
		text = text .. "Author:" .. t .. t .. unit.author(n).s(n) .. n
		slot11 = managers.sequence
		slot14 = unit
		text = text .. "Damage types:" .. t .. t .. managers.sequence.editor_info(n, unit.name(slot13)) .. n
		slot10 = unit
		text = text .. "Geometry memory:" .. t .. unit.geometry_memory_use(managers.sequence.editor_info(n, unit.name(slot13))) .. n
		slot10 = unit
		text = text .. "Unit filename:" .. t .. unit.unit_filename(n) .. n
		slot10 = unit
		text = text .. "Object filename:" .. t .. unit.model_filename(n) .. n
		slot10 = unit
		text = text .. "Diesel filename:" .. t .. unit.diesel_filename(n) .. n
		slot10 = unit
		slot10 = unit.material_config(n)
		text = text .. "Material filename:" .. t .. unit.material_config(n).s(n) .. n
		text = text .. "Materials:" .. n
		slot10 = unit

		for _, name in ipairs(self._unit_materials(unit.material_config(n).s(n), self)) do
			text = text .. t .. name .. n
		end

		text = text .. "Last export from:" .. t .. unit.last_export_source(slot9) .. n
		local models_text = ""
		slot11 = unit
		models_text = models_text .. "Models:" .. t .. unit.nr_models(unit) .. n
		models_text = models_text .. "Name" .. t .. t .. t .. t .. t .. "Instanced" .. t .. "Vertecies" .. t .. "Triangles" .. t .. "Atoms" .. n
		slot9 = unit

		for i = 0, unit.nr_models(t) - 1, 1 do
			slot13 = i

			if unit.is_visible(slot11, unit) then
				slot15 = i
				slot14 = unit.model_name(slot13, unit)
				local len = string.len(unit.model_name(slot13, unit).s(slot13))
				slot13 = len / 7
				local tabs = 5 - math.floor(unit.model_name(slot13, unit).s)
				local tab = ""

				for j = 1, tabs, 1 do
					tab = tab .. t
				end

				slot17 = i
				slot16 = unit.model_name(slot15, unit)
				slot21 = i
				slot22 = i
				slot25 = i
				slot28 = i
				models_text = models_text .. unit.model_name(slot15, unit).s(slot15) .. tab .. tostring(unit.is_model_instance(slot19, unit)) .. t .. t .. unit.vertex_count(unit, unit) .. t .. t .. unit.triangle_count(slot23, unit) .. t .. t .. unit.atom_count(slot26, unit) .. n
			end
		end

		models_text = models_text .. n .. "Used texture names:" .. n
		slot10 = unit

		for _, name in ipairs(unit.used_texture_names(n)) do
			models_text = models_text .. t .. name .. n
		end

		slot9 = text

		self._unit_info.set_value(slot7, self._unit_info)

		slot9 = models_text

		self._gfx_unit_info.set_value(slot7, self._gfx_unit_info)

		slot8 = self._open_unit_file_buttons

		for _, btn in ipairs(slot7) do
			slot15 = true

			self._unit_info_toolbar.set_tool_enabled(slot12, self._unit_info_toolbar, btn)
		end
	else
		slot5 = ""

		self._unit_info.set_value(slot3, self._unit_info)

		slot5 = ""

		self._gfx_unit_info.set_value(slot3, self._gfx_unit_info)

		slot4 = self._open_unit_file_buttons

		for _, btn in ipairs(slot3) do
			slot11 = false

			self._unit_info_toolbar.set_tool_enabled(slot8, self._unit_info_toolbar, btn)
		end
	end

	return 
end
function CoreEditor:_unit_materials(unit)
	local names = {}
	slot7 = unit
	slot10 = "material"

	for _, material in ipairs(unit.get_objects_by_type(slot6, Idstring(slot9))) do
		slot10 = names
		slot13 = material
		slot13 = material.name(slot12)

		if not table.contains(slot9, material.name(slot12).s(slot12)) then
			slot10 = names
			slot13 = material
			slot13 = material.name(slot12)

			table.insert(slot9, material.name(slot12).s(slot12))
		end
	end

	return names
end

return 
