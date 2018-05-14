-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreLuaDump"

core.import(slot1, core)

CoreLuaProfiler = CoreLuaProfiler or class()
core_lua_profiler_reload = true
CoreLuaProfiler.init = function (self)
	slot3 = self

	self.create_main_frame(slot2)

	self._profilers = {}
	self._profiler_sorting = "DO_NOT_SORT"
	self._frames_since_profilers_reset = 1
	self._frames_sample_steps = 1
	self._g_table = {}

	self.find_methods(slot2, self, _G)

	slot3 = self

	self.on_goto_global(slot2)

	slot3 = self._g_table
	slot8 = "sort_by_name"

	table.sort(slot2, callback(self._g_table, self, self))

	slot3 = self._g_table

	for _, it in ipairs(slot2) do
		if not it._source then
			slot9 = it._name

			self._main_frame_table._table_list_ctrl.append_item(slot7, self._main_frame_table._table_list_ctrl)
		end
	end

	core_lua_profiler_reload = true
	slot4 = 0

	self._main_frame_table._table_list_ctrl.autosize_column(slot2, self._main_frame_table._table_list_ctrl)

	slot4 = true

	self.check_news(slot2, self)

	return 
end
CoreLuaProfiler.create_main_frame = function (self)
	slot9 = 0
	slot10 = 0
	slot8 = Global.frame
	self._main_frame = EWS.Frame(slot2, EWS, "LUA Profiler", Vector3(slot6, -1, -1), Vector3(-1, 1000, 800), "FRAME_FLOAT_ON_PARENT,DEFAULT_FRAME_STYLE")
	self._resource_sort_func = function (a, b)
		return a._name < b._name
	end
	local sort_by_name = self._resource_sort_func

	local function sort_by_mem_use(a, b)
		return b._used < a._used
	end

	local menu_bar = EWS.MenuBar("LUA Profiler")
	slot7 = ""
	local file_menu = EWS.Menu(EWS, EWS)
	slot10 = ""

	file_menu.append_item(EWS, file_menu, "NEWS", "Get Latest News")

	slot7 = file_menu

	file_menu.append_separator(EWS)

	slot10 = ""

	file_menu.append_item(EWS, file_menu, "EXIT", "Exit")

	slot9 = "File"

	menu_bar.append(EWS, menu_bar, file_menu)

	slot8 = ""
	self._resources_menu = EWS.Menu(EWS, EWS)
	slot10 = ""

	self._resources_menu.append_item(EWS, self._resources_menu, "COLLECT_RESOURCES", "Collect\tCtrl+C")

	slot7 = self._resources_menu

	self._resources_menu.append_separator(EWS)

	slot10 = ""

	self._resources_menu.append_radio_item(EWS, self._resources_menu, "SORT_NAME", "Sort By Name")

	slot10 = ""

	self._resources_menu.append_radio_item(EWS, self._resources_menu, "SORT_MEM_USE", "Sort By Mem Use")

	slot9 = true

	self._resources_menu.set_checked(EWS, self._resources_menu, "SORT_NAME")

	slot9 = "Resources"

	menu_bar.append(EWS, menu_bar, self._resources_menu)

	slot8 = ""
	local lua_menu = EWS.Menu(EWS, EWS)
	slot11 = ""

	lua_menu.append_item(EWS, lua_menu, "SAMPLE_RATE", "Set Sample Rate\tCtrl+S")

	slot11 = ""

	lua_menu.append_item(EWS, lua_menu, "GOTO_GLOBAL", "Goto Global\tCtrl+G")

	slot10 = "LUA"

	menu_bar.append(EWS, menu_bar, lua_menu)

	slot9 = menu_bar

	self._main_frame.set_menu_bar(EWS, self._main_frame)

	slot15 = "on_check_news"

	self._main_frame.connect(EWS, self._main_frame, "NEWS", "EVT_COMMAND_MENU_SELECTED", callback(slot12, self, self))

	slot15 = "on_close"

	self._main_frame.connect(EWS, self._main_frame, "EXIT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot15 = "on_update_resources"

	self._main_frame.connect(EWS, self._main_frame, "COLLECT_RESOURCES", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot15 = "on_set_resource_sort_func"

	self._main_frame.connect(EWS, self._main_frame, "SORT_NAME", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot15 = "on_set_resource_sort_func"

	self._main_frame.connect(EWS, self._main_frame, "SORT_MEM_USE", "EVT_COMMAND_MENU_SELECTED", callback(sort_by_name, self, self))

	slot15 = "on_do_dump"

	self._main_frame.connect(EWS, self._main_frame, "DO_DUMP", "EVT_COMMAND_MENU_SELECTED", callback(sort_by_mem_use, self, self))

	slot15 = "on_open_dump"

	self._main_frame.connect(EWS, self._main_frame, "DUMP_OPEN", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot15 = "on_set_sample_rate"

	self._main_frame.connect(EWS, self._main_frame, "SAMPLE_RATE", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot15 = "on_goto_global"

	self._main_frame.connect(EWS, self._main_frame, "GOTO_GLOBAL", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot15 = "on_close"
	slot12 = ""

	self._main_frame.connect(EWS, self._main_frame, "", "EVT_CLOSE_WINDOW", callback("", self, self))

	slot9 = "VERTICAL"
	local main_box = EWS.BoxSizer(EWS, EWS)
	slot12 = ""
	self._main_notebook = EWS.Notebook(EWS, EWS, self._main_frame, "")
	slot16 = "on_notebook_changing"
	slot13 = ""

	self._main_notebook.connect(EWS, self._main_notebook, "", "EVT_COMMAND_NOTEBOOK_PAGE_CHANGING", callback(self, self, self))

	slot13 = "EXPAND"

	main_box.add(EWS, main_box, self._main_notebook, 1, 0)

	self._main_frame_table = {}
	slot13 = ""
	self._main_frame_table._main_panel = EWS.Panel(main_box, EWS, self._main_notebook, "")
	slot11 = "VERTICAL"
	self._main_frame_table._main_panel_box = EWS.BoxSizer(main_box, EWS)
	slot10 = "VERTICAL"
	local panel_box = EWS.BoxSizer(EWS.BoxSizer(main_box, EWS), EWS)
	slot11 = "HORIZONTAL"
	local splitter_box = EWS.BoxSizer(EWS, EWS)
	local function_box = EWS.BoxSizer(EWS, EWS)
	slot11 = EWS.ListCtrl("VERTICAL", EWS, self._main_frame_table._main_panel, "Watch Data")
	self._main_frame_table._function_list_ctrl = slot11
	slot19 = "on_select_function"
	slot16 = ""

	self._main_frame_table._function_list_ctrl.connect(slot11, self._main_frame_table._function_list_ctrl, "", "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback("LC_REPORT", self, self))

	slot16 = "EXPAND"

	function_box.add(slot11, function_box, self._main_frame_table._function_list_ctrl, 2, 0)

	slot13 = "Name"

	self._main_frame_table._function_list_ctrl.append_column(slot11, self._main_frame_table._function_list_ctrl)

	slot13 = "Source"

	self._main_frame_table._function_list_ctrl.append_column(slot11, self._main_frame_table._function_list_ctrl)

	slot11 = EWS.ListCtrl(self._main_frame_table._function_list_ctrl, EWS, self._main_frame_table._main_panel, "Watch Data")
	self._main_frame_table._table_list_ctrl = slot11
	slot19 = "on_select_table"
	slot16 = ""

	self._main_frame_table._table_list_ctrl.connect(slot11, self._main_frame_table._table_list_ctrl, "", "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback("LC_REPORT,LC_SINGLE_SEL", self, self))

	slot16 = "EXPAND"

	function_box.add(slot11, function_box, self._main_frame_table._table_list_ctrl, 3, 0)

	slot13 = "Name"

	self._main_frame_table._table_list_ctrl.append_column(slot11, self._main_frame_table._table_list_ctrl)

	slot16 = "EXPAND"

	splitter_box.add(slot11, splitter_box, function_box, 2, 0)

	slot11 = EWS.ListCtrl(splitter_box, EWS, self._main_frame_table._main_panel, "Watch Data")
	self._main_frame_table._profiler_list_ctrl = slot11
	slot19 = "on_select_profiler"
	slot16 = ""

	self._main_frame_table._profiler_list_ctrl.connect(slot11, self._main_frame_table._profiler_list_ctrl, "", "EVT_COMMAND_LIST_ITEM_ACTIVATED", callback("LC_REPORT", self, self))

	slot16 = "EXPAND"

	splitter_box.add(slot11, splitter_box, self._main_frame_table._profiler_list_ctrl, 3, 0)

	slot13 = "Name"

	self._main_frame_table._profiler_list_ctrl.append_column(slot11, self._main_frame_table._profiler_list_ctrl)

	slot13 = "Source"

	self._main_frame_table._profiler_list_ctrl.append_column(slot11, self._main_frame_table._profiler_list_ctrl)

	slot13 = "Calls"

	self._main_frame_table._profiler_list_ctrl.append_column(slot11, self._main_frame_table._profiler_list_ctrl)

	slot13 = "Time/Call"

	self._main_frame_table._profiler_list_ctrl.append_column(slot11, self._main_frame_table._profiler_list_ctrl)

	slot13 = "Cost/Call"

	self._main_frame_table._profiler_list_ctrl.append_column(slot11, self._main_frame_table._profiler_list_ctrl)

	slot13 = "Time"

	self._main_frame_table._profiler_list_ctrl.append_column(slot11, self._main_frame_table._profiler_list_ctrl)

	slot13 = "Cost"

	self._main_frame_table._profiler_list_ctrl.append_column(slot11, self._main_frame_table._profiler_list_ctrl)

	slot16 = "EXPAND"

	panel_box.add(slot11, panel_box, splitter_box, 1, 0)

	slot17 = ""
	slot11 = EWS.StaticText(panel_box, EWS, self._main_frame_table._main_panel, "Lua mem usage: 0.0 Mb", "")
	self._main_frame_table._mem_usage_text = slot11
	slot16 = "EXPAND"

	panel_box.add(slot11, panel_box, self._main_frame_table._mem_usage_text, 0, 0)

	slot13 = panel_box

	self._main_frame_table._main_panel.set_sizer(slot11, self._main_frame_table._main_panel)

	slot16 = "EXPAND"

	self._main_frame_table._main_panel_box.add(slot11, self._main_frame_table._main_panel_box, self._main_frame_table._main_panel, 1, 0)

	self._resources_frame_table = {}
	slot16 = ""
	self._resources_frame_table._main_panel = EWS.Panel(self._main_frame_table._main_panel_box, EWS, self._main_notebook, "")
	slot14 = "VERTICAL"
	self._resources_frame_table._main_panel_box = EWS.BoxSizer(self._main_frame_table._main_panel_box, EWS)
	slot11 = EWS.TreeCtrl(self._main_frame_table._main_panel_box, EWS, self._resources_frame_table._main_panel, "")
	self._resources_frame_table._tree_ctrl = slot11
	slot19 = "on_tree_ctrl_change"
	slot16 = ""

	self._resources_frame_table._tree_ctrl.connect(slot11, self._resources_frame_table._tree_ctrl, "", "EVT_COMMAND_TREE_SEL_CHANGED", callback("TR_HAS_BUTTONS,TR_LINES_AT_ROOT,TR_DEFAULT_STYLE,SUNKEN_BORDER,TR_HIDE_ROOT", self, self))

	slot16 = "EXPAND"

	self._resources_frame_table._main_panel_box.add(slot11, self._resources_frame_table._main_panel_box, self._resources_frame_table._tree_ctrl, 1, 0)

	slot13 = self._resources_frame_table._main_panel_box

	self._resources_frame_table._main_panel.set_sizer(slot11, self._resources_frame_table._main_panel)

	slot15 = true

	self._main_notebook.add_page(slot11, self._main_notebook, self._resources_frame_table._main_panel, "Resources")

	slot15 = false

	self._main_notebook.add_page(slot11, self._main_notebook, self._main_frame_table._main_panel, "LUA")

	self._main_notebook_page_selected = 0
	slot13 = main_box

	self._main_frame.set_sizer(slot11, self._main_frame)

	slot13 = true

	self._main_frame.set_visible(slot11, self._main_frame)

	slot13 = self._main_frame
	self._set_sample_rate_dialog = CoreLuaProfilerSampleRateDialog.new(slot11, CoreLuaProfilerSampleRateDialog)

	return 
end
CoreLuaProfiler.on_set_resource_sort_func = function (self, data, event)
	slot7 = false

	self._resources_menu.set_checked(slot4, self._resources_menu, "SORT_NAME")
	self._resources_menu.set_checked(slot4, self._resources_menu, "SORT_MEM_USE")

	slot8 = event
	slot7 = true

	self._resources_menu.set_checked(slot4, self._resources_menu, event.get_id(false))

	self._resource_sort_func = data
	slot5 = self

	self.on_update_resources(slot4)

	return 
end
CoreLuaProfiler.on_notebook_changing = function (self)
	self._flag_notebook_change = true

	return 
end
CoreLuaProfiler.notebook_change = function (self)
	if self._flag_notebook_change then
		slot5 = 0

		if self._main_notebook.get_current_page(slot2) == self._main_notebook.get_page(self._main_notebook, self._main_notebook) then
			self._main_notebook_page_selected = 0
		else
			self._main_notebook_page_selected = 1
		end

		self._flag_notebook_change = nil
	end

	return 
end
CoreLuaProfiler.notebook_selected = function (self)
	return self._main_notebook_page_selected
end
CoreLuaProfiler.on_check_news = function (self)
	slot3 = self

	self.check_news(slot2)

	return 
end
CoreLuaProfiler.check_news = function (self, new_only)
	local news = nil

	if new_only then
		slot7 = self._main_frame
		news = managers.news.get_news(slot4, managers.news, "lua_profiler")
	else
		slot7 = self._main_frame
		news = managers.news.get_old_news(slot4, managers.news, "lua_profiler")
	end

	if news then
		local str = nil
		slot6 = news

		for _, n in ipairs(slot5) do
			if not str then
				str = n
			else
				str = str .. "\n" .. n
			end
		end

		slot10 = "OK,ICON_INFORMATION"
		slot6 = EWS.MessageDialog(slot5, EWS, self._main_frame, str, "New Features!")

		EWS.MessageDialog(slot5, EWS, self._main_frame, str, "New Features!").show_modal(slot5)
	end

	return 
end
CoreLuaProfiler.binary_to_string = function (self, str)
	local out_str = ""
	slot6 = "[%d]+"

	for number in string.gmatch(slot4, str) do
		slot12 = number
		out_str = out_str .. string.char(tonumber(slot11))
	end

	return out_str
end
CoreLuaProfiler.dump_tree_expand = function (self, node)
	slot5 = node._id

	self._dump_frame_table._tree_ctrl.expand(slot3, self._dump_frame_table._tree_ctrl)

	if node._parent then
		local p = self._dump_tree_id_table[node._parent]
		slot5 = p

		assert(slot4)

		slot6 = p

		self.dump_tree_expand(slot4, self)
	end

	return 
end
CoreLuaProfiler.on_dump_search = function (self)
	local found = nil
	slot4 = self._dump_frame_table._search_text_ctrl
	local str = self._dump_frame_table._search_text_ctrl.get_value(slot3)
	local len = #self._dump_tree_id_table
	local max = (str ~= "" and len * 2) or len
	slot12 = "PD_AUTO_HIDE,PD_SMOOTH,PD_CAN_SKIP"
	local prog = EWS.ProgressDialog(slot6, EWS, self._main_frame, "Search", "Searching...", max)
	slot8 = self._dump_frame_table._tree_ctrl

	self._dump_frame_table._tree_ctrl.freeze(EWS)

	slot8 = self._dump_tree_id_table

	for i, v in pairs(EWS) do
		slot14 = v._id

		self._dump_frame_table._tree_ctrl.collapse(slot12, self._dump_frame_table._tree_ctrl)

		slot15 = false

		self._dump_frame_table._tree_ctrl.set_item_bold(slot12, self._dump_frame_table._tree_ctrl, v._id)

		slot13 = prog

		if prog.skip(slot12) then
			slot14 = max

			prog.update_bar(slot12, prog)

			return 
		else
			slot14 = i

			prog.update_bar(slot12, prog)
		end
	end

	if str ~= "" then
		slot8 = self._dump_tree_id_table

		for i, v in pairs(slot7) do
			slot14 = str

			if string.find(slot12, v._name) then
				found = true
				slot14 = v

				self.dump_tree_expand(slot12, self)

				slot15 = true

				self._dump_frame_table._tree_ctrl.set_item_bold(slot12, self._dump_frame_table._tree_ctrl, v._id)
			else
				slot15 = false

				self._dump_frame_table._tree_ctrl.set_item_bold(slot12, self._dump_frame_table._tree_ctrl, v._id)
			end

			slot13 = prog

			if prog.skip(slot12) then
				slot14 = max

				prog.update_bar(slot12, prog)

				return 
			else
				slot14 = len + i

				prog.update_bar(slot12, prog)
			end
		end
	end

	slot8 = self._dump_frame_table._tree_ctrl

	self._dump_frame_table._tree_ctrl.thaw(slot7)

	return 
end
CoreLuaProfiler.on_open_dump = function (self)
	slot8 = managers.database
	slot9 = "OPEN,FILE_MUST_EXIST"
	local dialog = EWS.FileDialog(slot2, EWS, self._main_frame, "Open Lua Dump XML", managers.database.base_path(slot7), "", "XML files (*.xml)|*.xml")
	slot4 = dialog

	if dialog.show_modal(EWS) then
		slot5 = dialog
		slot7 = managers.database
		local cmd = "copy /Y \"" .. dialog.get_path(slot4) .. "\" \"" .. managers.database.base_path(slot6) .. "core\\temp\\dump.xml\""
		slot5 = cmd

		os.execute("\" \"")

		slot6 = "/core/temp/dump.xml"

		Application.update_filesystem_index("\" \"", Application)

		slot5 = self

		self.open_dump("\" \"")
	end

	return 
end
CoreLuaProfiler.open_dump = function (self)
	slot4 = "/core/temp/dump.xml"
	local node = SystemFS.parse_xml(slot2, SystemFS)
	slot4 = node

	assert(SystemFS)

	self._dump_tree_id_table = {}
	slot4 = self._dump_frame_table._tree_ctrl

	self._dump_frame_table._tree_ctrl.freeze(SystemFS)
	self._dump_frame_table._tree_ctrl.clear(SystemFS)

	local root_name = "lua_dump"
	slot6 = root_name
	local root_id = self._dump_frame_table._tree_ctrl.append_root(self._dump_frame_table._tree_ctrl, self._dump_frame_table._tree_ctrl)
	self._dump_tree_id_table[root_id] = {
		_id = root_id,
		_name = root_name
	}
	slot8 = root_id

	self.fill_dump_tree_ctrl(, self, node)

	slot6 = self._dump_frame_table._tree_ctrl

	self._dump_frame_table._tree_ctrl.thaw()

	slot6 = self._dump_frame_table._tree_ctrl

	self._dump_frame_table._tree_ctrl.refresh()

	return 
end
CoreLuaProfiler.on_do_dump = function (self)
	slot12 = -1
	local str = EWS.get_text_from_user(slot2, EWS, self._main_frame, "Enter variable you want to dump.", "Dump", "_G", Vector3(true, -1, -1))

	if str ~= "" then
		slot4 = "return " .. str
		local var = 
		-- Decompilation error in this vicinity:
		loadstring(slot3)()

		if var then
			slot6 = var

			CoreLuaDump.core_lua_dump(slot4, "/core/temp/dump.xml")

			slot5 = self

			self.open_dump(slot4)
		end
	end

	return 
end
CoreLuaProfiler.fill_dump_tree_ctrl = function (self, node, id)
	slot5 = node

	for n in node.children(slot4) do
		local name = n.name(slot8)
		slot11 = "name"
		local sufix = n.parameter(n, n)

		if sufix ~= "" then
			slot14 = sufix
			name = name .. " - " .. self.binary_to_string(slot12, self)
		end

		local new_id = self._dump_frame_table._tree_ctrl.append(slot10, self._dump_frame_table._tree_ctrl, id)
		slot14 = n
		self._dump_tree_id_table[new_id] = {
			_id = new_id,
			_name = n.name(name),
			_parent = id
		}
		slot14 = n

		for k, v in pairs(n.parameter_map(name)) do
			slot19 = k
			local new_k_id = self._dump_frame_table._tree_ctrl.append(slot16, self._dump_frame_table._tree_ctrl, new_id)
			self._dump_tree_id_table[new_k_id] = {
				_id = new_k_id,
				_name = k,
				_parent = new_id
			}
			slot19 = v
			local bin_str = self.binary_to_string(, self)
			slot20 = new_k_id
			slot24 = v
			local new_v_id = self._dump_frame_table._tree_ctrl.append(self, self._dump_frame_table._tree_ctrl, self.binary_to_string(slot22, self))
			self._dump_tree_id_table[new_v_id] = {
				_id = new_v_id,
				_name = bin_str,
				_parent = new_k_id
			}
		end

		slot14 = new_id

		self.fill_dump_tree_ctrl(slot11, self, n)
	end

	return 
end
CoreLuaProfiler.load_profilers = function (self)
	slot4 = "/data/settings/lua_profiler.xml"

	if SystemFS.exists(slot2, SystemFS) then
		local prev_class_name = self._class_name
		local prev_class_table = self._class_table
		local file = SystemFS.open(slot4, SystemFS, "/data/settings/lua_profiler.xml")
		slot8 = file
		local node = Node.from_xml(file.read("r"))
		slot7 = file

		file.close(file.read)

		slot7 = self

		self.remove_all_profilers(file.read)

		slot7 = self._main_frame_table._profiler_list_ctrl

		self._main_frame_table._profiler_list_ctrl.delete_all_items(file.read)

		slot7 = node

		for class_node in node.children(file.read) do
			slot12 = "name"
			self._class_name = class_node.parameter(slot10, class_node)
			slot12 = self._class_name
			local c = rawget(slot10, _G)

			if c then
				slot14 = self._class_table

				self.find_methods(slot11, self, c)

				slot12 = class_node

				for func_node in class_node.children(slot11) do
					slot17 = "name"
					local f = c[func_node.parameter(slot15, func_node)]

					if f then
						slot17 = self
						slot21 = "name"

						self.add_profiler(slot16, func_node.parameter(slot19, func_node))
					end
				end
			end
		end

		self._class_name = prev_class_name
		self._class_table = prev_class_table
	end

	return 
end
CoreLuaProfiler.get_child = function (self, node, name, key, value)
	slot7 = node

	for n in node.children(slot6) do
		slot11 = n

		if n.name(slot10) == name then
			slot12 = key

			if n.parameter(slot10, n) == value then
				return n
			end
		end
	end

	return 
end
CoreLuaProfiler.save_profilers = function (self)
	local node = Node(slot2)
	slot4 = self._profilers

	for k, v in pairs("lua_profiler") do
		slot13 = v._class_name
		local n = self.get_child(slot8, self, node, "class", "name")

		if not n then
			slot11 = "class"
			n = node.make_child(slot9, node)
			slot12 = v._class_name

			n.set_parameter(slot9, n, "name")
		end

		slot11 = "function"
		slot12 = v._function_name

		n.make_child(slot9, n).set_parameter(slot9, n.make_child(slot9, n), "name")
	end

	slot6 = "w"
	local file = SystemFS.open(slot3, SystemFS, "/data/settings/lua_profiler.xml")
	slot5 = file
	slot8 = node

	file.write(SystemFS, node.to_xml(slot7))

	slot5 = file

	file.close(SystemFS)

	return 
end
CoreLuaProfiler.on_set_sample_rate = function (self)
	slot3 = self._set_sample_rate_dialog

	if self._set_sample_rate_dialog.show_modal(slot2) then
		slot3 = self._set_sample_rate_dialog
		self._frames_sample_steps = self._set_sample_rate_dialog.get_value(slot2)
	end

	return 
end
CoreLuaProfiler.on_goto_global = function (self)
	self._class_table = {}
	slot5 = self._class_table

	self.find_methods(slot2, self, _G)

	self._class_name = "_G"
	slot3 = self

	self.update_list(slot2)

	return 
end
CoreLuaProfiler.sort_by_name = function (self, a, b)
	slot6 = b._name

	return string.lower(slot4) < string.lower(a._name)
end
CoreLuaProfiler.update_list = function (self)
	slot3 = self._class_table
	slot8 = "sort_by_name"

	table.sort(slot2, callback(slot5, self, self))

	slot3 = self._main_frame_table._function_list_ctrl

	self._main_frame_table._function_list_ctrl.delete_all_items(slot2)

	slot3 = self._class_table

	for _, it in ipairs(slot2) do
		if it._source then
			slot9 = it._name
			local i = self._main_frame_table._function_list_ctrl.append_item(slot7, self._main_frame_table._function_list_ctrl)
			slot12 = it._source

			self._main_frame_table._function_list_ctrl.set_item(self._main_frame_table._function_list_ctrl, self._main_frame_table._function_list_ctrl, i, 1)
		end
	end

	slot4 = 0

	self._main_frame_table._function_list_ctrl.autosize_column(slot2, self._main_frame_table._function_list_ctrl)

	slot4 = 1

	self._main_frame_table._function_list_ctrl.autosize_column(slot2, self._main_frame_table._function_list_ctrl)

	return 
end
CoreLuaProfiler.find_table = function (self, name)
	slot4 = self._g_table

	for _, it in ipairs(slot3) do
		if not it._source and it._name == name then
			return it
		end
	end

	return 
end
CoreLuaProfiler.find_function = function (self, name)
	slot4 = self._class_table

	for _, it in ipairs(slot3) do
		if it._source and it._name == name then
			return it
		end
	end

	return 
end
CoreLuaProfiler.set_position = function (self, newpos)
	slot5 = newpos

	self._main_frame.set_position(slot3, self._main_frame)

	return 
end
CoreLuaProfiler.on_close = function (self)
	slot4 = "LUA Profiler"

	managers.toolhub.close(slot2, managers.toolhub)

	return 
end
CoreLuaProfiler.on_select_profiler = function (self)
	slot3 = self._main_frame_table._profiler_list_ctrl
	local selected_idices = self._main_frame_table._profiler_list_ctrl.selected_items(slot2)
	local sources = {}

	function slot6(a, b)
		return b < a
	end

	table.sort(slot4, selected_idices)

	slot5 = selected_idices

	for _, selected_index in ipairs(slot4) do
		slot10 = sources
		slot15 = 1

		table.insert(slot9, self._main_frame_table._profiler_list_ctrl.get_item(slot12, self._main_frame_table._profiler_list_ctrl, selected_index))

		slot11 = selected_index

		self._main_frame_table._profiler_list_ctrl.delete_item(slot9, self._main_frame_table._profiler_list_ctrl)
	end

	slot5 = sources

	for _, source in ipairs(slot4) do
		if self._profilers[source] then
			local f = self._profilers[source]._old_func
			slot12 = self._profilers[source]._class_name
			rawget(slot10, _G)[self._profilers[source]._function_name] = f
			self._profilers[source] = nil
			slot12 = "profiler remove " .. source

			Application.console_command(nil, Application)
		end
	end

	slot5 = self

	self.save_profilers(slot4)

	return 
end
CoreLuaProfiler.remove_all_profilers = function (self)
	slot3 = self._profilers

	for k, v in pairs(slot2) do
		slot9 = v._class_name
		rawget(slot7, _G)[v._function_name] = v._old_func
		slot9 = "profiler remove " .. k

		Application.console_command(v._function_name, Application)
	end

	self._profilers = {}

	return 
end
CoreLuaProfiler.add_profiler = function (self, name)
	slot5 = name
	local func_table = self.find_function(slot3, self)

	if not self._profilers[func_table._source] then
		self._profilers[func_table._source] = {
			_class_name = self._class_name,
			_function_name = func_table._name,
			_calls = 0,
			_time = 0
		}
		slot6 = self._class_name
		local f = rawget(0, _G)[func_table._name]
		self._profilers[func_table._source]._old_func = f
		slot7 = self._class_name
		rawget(func_table._source, _G)[func_table._name] = function (...)
			local profiler_id = Profiler.start(slot1, Profiler)
			local ret_list = {
				f(...)
			}
			slot5 = profiler_id

			Profiler.stop(func_table._source, Profiler)

			slot4 = ret_list

			return unpack(func_table._source)
		end
		slot7 = func_table._name
		local i = self._main_frame_table._profiler_list_ctrl.append_item(func_table._name, self._main_frame_table._profiler_list_ctrl)
		slot10 = func_table._source

		self._main_frame_table._profiler_list_ctrl.set_item(self._main_frame_table._profiler_list_ctrl, self._main_frame_table._profiler_list_ctrl, i, 1)

		slot8 = 0

		self._main_frame_table._profiler_list_ctrl.autosize_column(self._main_frame_table._profiler_list_ctrl, self._main_frame_table._profiler_list_ctrl)

		slot8 = "profiler add " .. func_table._source

		Application.console_command(self._main_frame_table._profiler_list_ctrl, Application)
	end

	return 
end
CoreLuaProfiler.on_select_function = function (self)
	slot5 = self._main_frame_table._function_list_ctrl

	for _, selected_index in ipairs(self._main_frame_table._function_list_ctrl.selected_items(slot4)) do
		slot8 = self
		slot13 = 0

		self.add_profiler(slot7, self._main_frame_table._function_list_ctrl.get_item(slot10, self._main_frame_table._function_list_ctrl, selected_index))
	end

	slot3 = self

	self.save_profilers(slot2)

	return 
end
CoreLuaProfiler.on_select_table = function (self)
	local name = self._main_frame_table._table_list_ctrl.get_item(slot2, self._main_frame_table._table_list_ctrl, self._main_frame_table._table_list_ctrl.selected_item(0))
	self._class_table = {}
	self._class_name = name
	slot8 = name
	slot6 = self._class_table

	self.find_methods(self._main_frame_table._table_list_ctrl, self, self.find_table(self._main_frame_table._table_list_ctrl, self)._table)

	slot4 = self

	self.update_list(self._main_frame_table._table_list_ctrl)

	return 
end
CoreLuaProfiler.destroy = function (self)
	slot3 = self._main_frame

	if alive(slot2) then
		slot3 = self._main_frame

		self._main_frame.destroy(slot2)

		self._main_frame = nil
	end

	return 
end
CoreLuaProfiler.close = function (self)
	slot3 = self

	self.remove_all_profilers(slot2)

	slot3 = self._main_frame

	self._main_frame.destroy(slot2)

	return 
end
CoreLuaProfiler.reset_profilers = function (self)
	if self._frames_sample_steps <= self._frames_since_profilers_reset then
		self._frames_since_profilers_reset = 1
		slot3 = self._profilers

		for k, v in pairs(slot2) do
			v._calls = 0
			v._time = 0
		end
	else
		self._frames_since_profilers_reset = self._frames_since_profilers_reset + 1
	end

	return 
end
CoreLuaProfiler.update_profilers = function (self)
	slot3 = self._profilers

	for k, v in pairs(slot2) do
		slot10 = k
		v._calls = v._calls + Profiler.counter_calls(slot8, Profiler)
		slot10 = k
		v._time = v._time + Profiler.counter_time(slot8, Profiler)
	end

	return 
end
CoreLuaProfiler.roundup = function (self, value)
	slot4 = value
	local f = math.floor(slot3)

	if 0 < value - f then
		return f + 1
	else
		return f
	end

	return 
end
CoreLuaProfiler.update_profiler_list = function (self)
	slot3 = self._profilers

	for k, v in pairs(slot2) do
		local calls = v._calls / self._frames_sample_steps
		local t = v._time / self._frames_sample_steps
		slot12 = 1000000
		local time = t / math.clamp(slot9, calls, 1) * 1000
		slot14 = 1000000
		local cost = (t * 6000) / math.clamp(1, calls, 1)
		local total_time = t * 1000
		local total_cost = t * 6000
		local i = 0
		slot15 = self._main_frame_table._profiler_list_ctrl

		while i < self._main_frame_table._profiler_list_ctrl.item_count(slot14) do
			slot17 = 1

			if self._main_frame_table._profiler_list_ctrl.get_item(slot14, self._main_frame_table._profiler_list_ctrl, i) == k then
				break
			end

			i = i + 1
		end

		slot17 = 2
		slot21 = calls

		self._main_frame_table._profiler_list_ctrl.set_item(slot14, self._main_frame_table._profiler_list_ctrl, i, self.roundup(slot19, self))

		slot21 = time
		slot18 = string.format(slot19, "%.2f") .. " ms"

		self._main_frame_table._profiler_list_ctrl.set_item(slot14, self._main_frame_table._profiler_list_ctrl, i, 3)

		slot21 = cost
		slot18 = string.format(" ms", "%.2f") .. " %"

		self._main_frame_table._profiler_list_ctrl.set_item(slot14, self._main_frame_table._profiler_list_ctrl, i, 4)

		slot21 = total_time
		slot18 = string.format(" %", "%.2f") .. " ms"

		self._main_frame_table._profiler_list_ctrl.set_item(slot14, self._main_frame_table._profiler_list_ctrl, i, 5)

		slot21 = total_cost
		slot18 = string.format(" ms", "%.2f") .. " %"

		self._main_frame_table._profiler_list_ctrl.set_item(slot14, self._main_frame_table._profiler_list_ctrl, i, 6)
	end

	return 
end
CoreLuaProfiler.update_mem = function (self)
	local memuse = collectgarbage(slot2) / 1024
	slot9 = memuse
	slot5 = "Lua mem usage: " .. string.format(slot7, "%.1f") .. " Mb"

	self._main_frame_table._mem_usage_text.set_value("count", self._main_frame_table._mem_usage_text)

	return 
end
CoreLuaProfiler.update = function (self, t, dt)
	slot5 = self

	self.notebook_change(slot4)

	slot5 = self

	if self.notebook_selected(slot4) == 0 then
	else
		if core_lua_profiler_reload then
			core_lua_profiler_reload = false
			slot5 = self

			self.load_profilers(slot4)
		end

		slot5 = self

		self.update_profilers(slot4)

		if 1 < self._frames_sample_steps or not self._last_update or 0.5 < t - self._last_update then
			self._last_update = t

			if self._frames_sample_steps <= self._frames_since_profilers_reset then
				slot5 = self

				self.update_profiler_list(slot4)

				slot5 = self

				self.update_mem(slot4)
			end
		end

		slot5 = self

		self.reset_profilers(slot4)
	end

	return 
end
CoreLuaProfiler.find_methods = function (self, in_table, out_table)
	slot5 = in_table

	for k, v in pairs(slot4) do
		slot10 = v

		if type(slot9) == "function" then
			slot11 = "S"
			local info = debug.getinfo(slot9, v)

			if info.what == "Lua" then
				local info_table = {
					_name = k,
					_table = v,
					_source = info.source .. ":" .. info.linedefined
				}
				slot13 = info_table

				table.insert(":", out_table)
			end
		else
			slot10 = v

			if type(slot9) == "table" and v.type_name ~= k then
				local info_table = {
					_name = k,
					_table = v
				}
				slot12 = info_table

				table.insert(slot10, out_table)
			end
		end
	end

	return 
end
CoreLuaProfiler.on_tree_ctrl_change = function (self)
	return 
end
CoreLuaProfiler.on_update_resources = function (self)
	slot3 = self._resources_frame_table._tree_ctrl

	self._resources_frame_table._tree_ctrl.freeze(slot2)

	slot3 = self._resources_frame_table._tree_ctrl

	self._resources_frame_table._tree_ctrl.clear(slot2)

	local root_id = self._resources_frame_table._tree_ctrl.append_root(slot2, self._resources_frame_table._tree_ctrl)
	local mem_report = {}
	slot6 = "all"
	local units = World.find_units_quick("World", World)
	slot6 = units

	for _, unit in ipairs(World) do
		slot11 = unit

		if not mem_report[unit.name(slot10)] then
			slot11 = unit
			mem_report[unit.name(slot10)] = {
				_num = 1,
				_unit = unit
			}
		else
			slot11 = unit
			local prev = mem_report[unit.name(slot10)]
			prev._num = prev._num + 1
		end
	end

	self._unit_report = {}
	slot6 = mem_report

	for k, v in pairs(slot5) do
		slot12 = {
			_name = k,
			_used = v._unit.geometry_memory_use(slot14),
			_unit = v._unit,
			_extensions = v._unit.extensions(slot14),
			_textures = v._unit.used_texture_names(slot14)
		}
		slot15 = v._unit
		slot15 = v._unit
		slot15 = v._unit

		table.insert(slot10, self._unit_report)
	end

	slot7 = self._resource_sort_func

	table.sort(slot5, self._unit_report)

	slot6 = self._unit_report

	for _, v in ipairs(slot5) do
		slot14 = v._name
		slot10 = self._resources_frame_table._tree_ctrl.append(slot11, self._resources_frame_table._tree_ctrl, root_id)
		self._unit_report._unit_id = slot10
		slot13 = true

		self._resources_frame_table._tree_ctrl.set_item_bold(slot10, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)

		slot18 = v._unit
		slot13 = "Author: " .. tostring(v._unit.author(slot17))

		self._resources_frame_table._tree_ctrl.append(slot10, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)

		slot18 = v._unit
		slot13 = "Enabled: " .. tostring(v._unit.enabled(slot17))

		self._resources_frame_table._tree_ctrl.append(slot10, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)

		slot18 = v._unit
		slot13 = "Visible: " .. tostring(v._unit.visible(slot17))

		self._resources_frame_table._tree_ctrl.append(slot10, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)

		slot18 = v._unit
		slot13 = "Slot: " .. tostring(v._unit.slot(slot17))

		self._resources_frame_table._tree_ctrl.append(slot10, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)

		slot18 = v._unit
		slot13 = "Num Bodies: " .. tostring(v._unit.num_bodies(slot17))

		self._resources_frame_table._tree_ctrl.append(slot10, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)

		slot16 = v._unit
		slot13 = "Diesel: " .. v._unit.diesel_filename(slot15)

		self._resources_frame_table._tree_ctrl.append(slot10, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)

		slot16 = v._unit
		slot13 = "Material Config: " .. v._unit.material_config(slot15)

		self._resources_frame_table._tree_ctrl.append(slot10, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)

		slot18 = v._used / 1024
		slot13 = "Geometry Mem: " .. tostring(math.round(slot17)) .. "Kb"

		self._resources_frame_table._tree_ctrl.append(slot10, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)

		if 0 < #v._textures then
			slot14 = "Used Textures"
			self._unit_report._textures_id = self._resources_frame_table._tree_ctrl.append(slot11, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)
			slot13 = true

			self._resources_frame_table._tree_ctrl.set_item_bold(self._resources_frame_table._tree_ctrl.append(slot11, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id), self._resources_frame_table._tree_ctrl, self._unit_report._textures_id)

			slot11 = v._textures

			for _, texture_name in ipairs(slot10) do
				slot18 = texture_name

				self._resources_frame_table._tree_ctrl.append(slot15, self._resources_frame_table._tree_ctrl, self._unit_report._textures_id)
			end
		end

		if 0 < #v._extensions then
			slot14 = "Script Extensions"
			self._unit_report._extensions_id = self._resources_frame_table._tree_ctrl.append(slot11, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id)
			slot13 = true

			self._resources_frame_table._tree_ctrl.set_item_bold(self._resources_frame_table._tree_ctrl.append(slot11, self._resources_frame_table._tree_ctrl, self._unit_report._unit_id), self._resources_frame_table._tree_ctrl, self._unit_report._extensions_id)

			slot11 = v._extensions

			for _, extension_name in ipairs(slot10) do
				slot18 = extension_name

				self._resources_frame_table._tree_ctrl.append(slot15, self._resources_frame_table._tree_ctrl, self._unit_report._extensions_id)
			end
		end
	end

	slot6 = self._resources_frame_table._tree_ctrl

	self._resources_frame_table._tree_ctrl.thaw(slot5)

	slot6 = self._resources_frame_table._tree_ctrl

	self._resources_frame_table._tree_ctrl.refresh(slot5)

	return 
end
CoreLuaProfilerSampleRateDialog = CoreLuaProfilerSampleRateDialog or class()
CoreLuaProfilerSampleRateDialog.init = function (self, p)
	slot12 = 0
	slot13 = 0
	slot10 = "CAPTION,SYSTEM_MENU"
	self._dialog = EWS.Dialog(slot3, EWS, p, "Sample Rate", "", Vector3(slot9, -1, -1), Vector3(-1, 200, 86))
	slot5 = "VERTICAL"
	local box = EWS.BoxSizer(slot3, EWS)
	slot6 = "HORIZONTAL"
	local text_box = EWS.BoxSizer(EWS, EWS)
	self._key_text_ctrl = EWS.TextCtrl(EWS, EWS, self._dialog, "", "")
	slot13 = "on_set_button"
	slot10 = ""

	self._key_text_ctrl.connect(EWS, self._key_text_ctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot10 = "EXPAND"

	text_box.add(EWS, text_box, self._key_text_ctrl, 1, 0)

	slot10 = "ALL,EXPAND"

	box.add(EWS, box, text_box, 0, 4)

	slot7 = "HORIZONTAL"
	local button_box = EWS.BoxSizer(EWS, EWS)
	self._set = EWS.Button(EWS, EWS, self._dialog, "Set", "")
	slot14 = "on_set_button"
	slot11 = ""

	self._set.connect(EWS, self._set, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot11 = "ALL,EXPAND"

	button_box.add(EWS, button_box, self._set, 1, 4)

	self._cancel = EWS.Button(EWS, EWS, self._dialog, "Cancel", "")
	slot14 = "on_cancel_button"
	slot11 = ""

	self._cancel.connect(EWS, self._cancel, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot11 = "ALL,EXPAND"

	button_box.add(EWS, button_box, self._cancel, 1, 4)

	slot11 = "EXPAND"

	box.add(EWS, box, button_box, 0, 0)

	slot8 = box

	self._dialog.set_sizer(EWS, self._dialog)

	return 
end
CoreLuaProfilerSampleRateDialog.show_modal = function (self)
	slot4 = "1"

	self._key_text_ctrl.set_value(slot2, self._key_text_ctrl)

	self._key = nil
	self._done = false
	self._return_val = true
	slot3 = self._dialog

	self._dialog.show_modal(slot2)

	while not self._done do
	end

	return self._return_val
end
CoreLuaProfilerSampleRateDialog.on_set_button = function (self)
	self._done = true
	slot3 = self._key_text_ctrl
	self._key = self._key_text_ctrl.get_value(slot2)
	slot4 = ""

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
CoreLuaProfilerSampleRateDialog.on_cancel_button = function (self)
	self._done = true
	self._return_val = false
	slot4 = ""

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
CoreLuaProfilerSampleRateDialog.get_value = function (self)
	slot3 = 1
	slot6 = self._key

	return math.max(slot2, tonumber(slot5))
end

return 
