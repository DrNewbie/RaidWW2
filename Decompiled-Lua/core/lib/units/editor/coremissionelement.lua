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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CoreMissionElement = CoreMissionElement or class()

if not MissionElement then
	slot2 = CoreMissionElement
	slot0 = class(slot1)
end

MissionElement = slot0
MissionElement.SAVE_UNIT_POSITION = true
MissionElement.SAVE_UNIT_ROTATION = true
MissionElement.RANDOMS = nil
function MissionElement:init(...)
	slot3 = self

	CoreMissionElement.init(slot2, ...)

	return 
end
function CoreMissionElement:init(unit)
	if not CoreMissionElement.editor_link_brush then
		local brush = Draw.brush(slot3)
		slot8 = "core/fonts/nice_editor_font"

		brush.set_font(Draw, brush, Idstring(slot7))

		slot5 = brush
		slot8 = "OverlayVertexColorTextured"

		brush.set_render_template(Draw, Idstring(10))

		CoreMissionElement.editor_link_brush = brush
	end

	self._unit = unit
	slot4 = self._unit
	self._hed = self._unit.mission_element_data(slot3)
	slot4 = self._unit
	self._ud = self._unit.unit_data(slot3)
	slot5 = 1

	self._unit.anim_play(slot3, self._unit)

	self._save_values = {}
	self._update_selected_on = false
	slot4 = self

	self._add_default_saves(slot3)

	if self.USES_POINT_ORIENTATION then
		slot6 = "__update_editing"
		self.base_update_editing = callback(slot3, self, self)
	end

	slot4 = managers.editor
	self._parent_panel = managers.editor.mission_element_panel(slot3)
	slot4 = managers.editor
	self._parent_sizer = managers.editor.mission_element_sizer(slot3)
	self._panels = {}
	self._on_executed_units = {}
	slot4 = Draw
	self._arrow_brush = Draw.brush(slot3)
	slot4 = self

	self._createicon(slot3)

	return 
end
function CoreMissionElement:post_init()
	if self.RANDOMS then
		slot3 = self.RANDOMS

		for _, value_name in ipairs(slot2) do
			slot8 = self._hed[value_name]

			if tonumber(slot7) then
				self._hed[value_name] = {
					self._hed[value_name],
					0
				}
			end
		end
	end

	return 
end
function CoreMissionElement:_createicon()
	local iconsize = 32

	if Global.iconsize then
		iconsize = Global.iconsize
	end

	if self._icon == nil and self._icon_x == nil then
		return 
	end

	slot4 = self._unit
	local root = self._unit.orientation_object(slot3)

	if root == nil then
		return 
	end

	if self._iconcolor_type then
		if self._iconcolor_type == "trigger" then
			self._iconcolor = "ff81bffc"
		elseif self._iconcolor_type == "logic" then
			self._iconcolor = "ffffffd9"
		elseif self._iconcolor_type == "operator" then
			self._iconcolor = "fffcbc7c"
		elseif self._iconcolor_type == "filter" then
			self._iconcolor = "ff65ad67"
		end
	end

	if self._iconcolor == nil then
		self._iconcolor = "fff"
	end

	slot5 = self._iconcolor
	self._iconcolor_c = Color(slot4)
	slot5 = World
	self._icon_gui = World.newgui(slot4)
	slot8 = 0
	local pos = self._unit.position(slot4) - Vector3(self._unit, iconsize / 2, iconsize / 2)
	slot15 = 0
	slot11 = Vector3(slot12, iconsize, 0)
	slot16 = 0
	self._icon_ws = self._icon_gui.create_linked_workspace(self._unit, self._icon_gui, 64, 64, root, pos, Vector3(iconsize, 0, iconsize))
	slot7 = self._icon_ws.BILLBOARD_BOTH

	self._icon_ws.set_billboard(self._unit, self._icon_ws)

	slot6 = self._icon_ws
	slot6 = self._icon_ws.panel(self._unit)
	slot9 = "core/guis/core_edit_icon"

	self._icon_ws.panel(self._unit).gui(self._unit, Idstring(64))

	slot6 = self._icon_ws
	slot6 = self._icon_ws.panel(self._unit)
	slot9 = "core/guis/core_edit_icon"
	slot6 = self._icon_ws.panel(self._unit).gui(self._unit, Idstring(64))
	self._icon_script = self._icon_ws.panel(self._unit).gui(self._unit, Idstring(64)).script(self._unit)

	if self._icon then
		slot7 = self._icon
		slot10 = self._iconcolor

		self._icon_script.seticon(slot5, self._icon_script, tostring(slot9))
	elseif self._icon_x then
		slot10 = self._icon_h
		slot13 = self._iconcolor

		self._icon_script.seticon_texture_rect(slot5, self._icon_script, self._icon_x, self._icon_y, self._icon_w, tostring(slot12))
	end

	return 
end
function CoreMissionElement:set_iconsize(size)
	if not self._icon_ws then
		return 
	end

	local root = self._unit.orientation_object(slot3)
	slot8 = 0
	local pos = self._unit.position(self._unit) - Vector3(self._unit, size / 2, size / 2)
	slot15 = 0
	slot11 = Vector3(slot12, size, 0)
	slot16 = 0

	self._icon_ws.set_linked(self._unit, self._icon_ws, 64, 64, root, pos, Vector3(size, 0, size))

	return 
end
function CoreMissionElement:_add_default_saves()
	self._hed.enabled = true
	self._hed.debug = nil
	self._hed.execute_on_startup = false
	self._hed.execute_on_startup_priority = 100
	self._hed.execute_on_restart = nil
	self._hed.base_delay = 0
	self._hed.base_delay_rand = nil
	self._hed.trigger_times = 0
	self._hed.on_executed = {}

	if self.USES_POINT_ORIENTATION then
		self._hed.orientation_elements = nil
		self._hed.use_orientation_sequenced = nil
		self._hed.disable_orientation_on_use = nil
	end

	if self.USES_INSTIGATOR_RULES then
		self._hed.rules_elements = nil
	end

	if self.INSTANCE_VAR_NAMES then
		self._hed.instance_var_names = nil
	end

	slot4 = "unit:position"

	table.insert(slot2, self._save_values)

	slot4 = "unit:rotation"

	table.insert(slot2, self._save_values)

	slot4 = "enabled"

	table.insert(slot2, self._save_values)

	slot4 = "execute_on_startup"

	table.insert(slot2, self._save_values)

	slot4 = "execute_on_startup_priority"

	table.insert(slot2, self._save_values)

	slot4 = "base_delay"

	table.insert(slot2, self._save_values)

	slot4 = "trigger_times"

	table.insert(slot2, self._save_values)

	slot4 = "on_executed"

	table.insert(slot2, self._save_values)

	slot4 = "orientation_elements"

	table.insert(slot2, self._save_values)

	slot4 = "use_orientation_sequenced"

	table.insert(slot2, self._save_values)

	slot4 = "disable_orientation_on_use"

	table.insert(slot2, self._save_values)

	slot4 = "rules_elements"

	table.insert(slot2, self._save_values)

	slot4 = "instance_var_names"

	table.insert(slot2, self._save_values)

	return 
end
function CoreMissionElement:build_default_gui(panel, sizer)
	slot8 = "enabled"

	self._build_value_checkbox(slot4, self, panel, sizer)

	slot8 = "execute_on_startup"

	self._build_value_checkbox(slot4, self, panel, sizer)

	slot10 = "Specifies priority if this element is executed on startup (lower number means faster execution)"

	self._build_value_number(slot4, self, panel, sizer, "execute_on_startup_priority", {
		floats = 0,
		min = 0
	})

	slot10 = "Specifies how many time this element can be executed (0 mean unlimited times)"

	self._build_value_number(slot4, self, panel, sizer, "trigger_times", {
		floats = 0,
		min = 0
	})

	slot6 = "HORIZONTAL"
	local base_delay_sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = "EXPAND,LEFT"

	sizer.add(EWS, sizer, base_delay_sizer, 0, 0)

	slot11 = "Specifies a base delay that is added to each on executed delay"
	local base_delay_ctrlr = self._build_value_number(EWS, self, panel, base_delay_sizer, "base_delay", {
		sizer_proportions = 2,
		min = 0,
		floats = 2,
		name_proportions = 1,
		ctrlr_proportions = 1
	})
	slot13 = "  random"
	local base_delay_rand_ctrlr = self._build_value_number(self, self, panel, base_delay_sizer, "base_delay_rand", {
		sizer_proportions = 1,
		min = 0,
		floats = 2,
		name_proportions = 0,
		ctrlr_proportions = 1
	}, "Specifies an additional random time to be added to base delay (delay + rand)")
	slot11 = "On Executed"
	local on_executed_sizer = EWS.StaticBoxSizer(self, EWS, panel, "VERTICAL")
	slot10 = "HORIZONTAL"
	local element_sizer = EWS.BoxSizer(EWS, EWS)

	on_executed_sizer.add(EWS, on_executed_sizer, element_sizer, 0, 1)

	self._elements_params = {
		name = "Element:",
		name_proportions = 1,
		tooltip = "Select an element from the combobox",
		sorted = true,
		sizer_proportions = 1,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = element_sizer,
		options = {}
	}
	local elements = CoreEWS.combobox()
	slot17 = "on_executed_element_selected"
	slot14 = nil

	elements.connect(self._elements_params, elements, "EVT_COMMAND_COMBOBOX_SELECTED", callback("EXPAND,LEFT", self, self))

	slot14 = "TB_FLAT,TB_NODIVIDER"
	self._add_elements_toolbar = EWS.ToolBar(self._elements_params, EWS, panel, "")
	slot16 = "world_editor\\unit_by_name_list.png"

	self._add_elements_toolbar.add_tool(self._elements_params, self._add_elements_toolbar, "ADD_ELEMENT", "Add an element", CoreEws.image_path(self))

	slot18 = "_on_toolbar_add_element"
	slot15 = nil

	self._add_elements_toolbar.connect(self._elements_params, self._add_elements_toolbar, "ADD_ELEMENT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot11 = self._add_elements_toolbar

	self._add_elements_toolbar.realize(self._elements_params)
	element_sizer.add(self._elements_params, element_sizer, self._add_elements_toolbar, 0, 1)

	slot14 = "TB_FLAT,TB_NODIVIDER"
	self._elements_toolbar = EWS.ToolBar(self._elements_params, EWS, panel, "")
	slot16 = "toolbar\\delete_16x16.png"

	self._elements_toolbar.add_tool(self._elements_params, self._elements_toolbar, "DELETE_SELECTED", "Remove selected element", CoreEws.image_path("EXPAND,LEFT"))

	slot18 = "_on_toolbar_remove"
	slot15 = nil

	self._elements_toolbar.connect(self._elements_params, self._elements_toolbar, "DELETE_SELECTED", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot11 = self._elements_toolbar

	self._elements_toolbar.realize(self._elements_params)

	slot15 = "EXPAND,LEFT"

	element_sizer.add(self._elements_params, element_sizer, self._elements_toolbar, 0, 1)

	if not self.ON_EXECUTED_ALTERNATIVES and self._create_dynamic_on_executed_alternatives then
		slot11 = self

		self._create_dynamic_on_executed_alternatives(slot10)
	end

	if self.ON_EXECUTED_ALTERNATIVES then
		local on_executed_alternatives_params = {
			name = "Alternative:",
			name_proportions = 1,
			tooltip = "Select an alternative on executed from the combobox",
			sorted = false,
			ctrlr_proportions = 2,
			panel = panel,
			sizer = on_executed_sizer,
			options = self.ON_EXECUTED_ALTERNATIVES,
			value = self.ON_EXECUTED_ALTERNATIVES[1]
		}
		local on_executed_alternatives_types = CoreEws.combobox(slot11)
		slot19 = "on_executed_alternatives_types"
		slot16 = nil

		on_executed_alternatives_types.connect(on_executed_alternatives_params, on_executed_alternatives_types, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot16, self, self))

		self._on_executed_alternatives_params = on_executed_alternatives_params
	end

	slot12 = "HORIZONTAL"
	local delay_sizer = EWS.BoxSizer(slot10, EWS)

	on_executed_sizer.add(EWS, on_executed_sizer, delay_sizer, 0, 0)

	self._element_delay_params = {
		value = 0,
		name = "Delay:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Sets the delay time for the selected on executed element",
		min = 0,
		floats = 2,
		sizer_proportions = 2,
		panel = panel,
		sizer = delay_sizer
	}
	local element_delay = CoreEws.number_controller(EWS)
	slot19 = "on_executed_element_delay"

	element_delay.connect(self._element_delay_params, element_delay, "EVT_COMMAND_TEXT_ENTER", callback("EXPAND,LEFT", self, self))

	slot19 = "on_executed_element_delay"
	slot16 = nil

	element_delay.connect(self._element_delay_params, element_delay, "EVT_KILL_FOCUS", callback(nil, self, self))

	self._element_delay_rand_params = {
		value = 0,
		name = "  Random:",
		ctrlr_proportions = 1,
		name_proportions = 0,
		tooltip = "Specifies an additional random time to be added to delay (delay + rand)",
		min = 0,
		floats = 2,
		sizer_proportions = 1,
		panel = panel,
		sizer = delay_sizer
	}
	local element_delay_rand = CoreEws.number_controller(self._element_delay_params)
	slot20 = "on_executed_element_delay_rand"

	element_delay_rand.connect(self._element_delay_rand_params, element_delay_rand, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot20 = "on_executed_element_delay_rand"
	slot17 = nil

	element_delay_rand.connect(self._element_delay_rand_params, element_delay_rand, "EVT_KILL_FOCUS", callback(nil, self, self))

	slot18 = "EXPAND"

	sizer.add(self._element_delay_rand_params, sizer, on_executed_sizer, 0, 0)

	if self.USES_POINT_ORIENTATION then
		slot18 = panel
		slot18 = "EXPAND"

		sizer.add(slot13, sizer, self._build_point_orientation(slot16, self), 0, 0)
	end

	if self.INSTANCE_VAR_NAMES then
		slot18 = panel
		slot18 = "EXPAND"

		sizer.add(slot13, sizer, self._build_instance_var_names(slot16, self), 0, 0)
	end

	slot20 = "LI_HORIZONTAL"
	slot18 = "EXPAND,TOP,BOTTOM"

	sizer.add(slot13, sizer, EWS.StaticLine(slot16, EWS, panel, ""), 0, 5)

	slot14 = self

	self.append_elements_sorted(slot13)
	self.set_on_executed_element(slot13)

	local function refresh_list_flow_cbk(ctrlr)
		local function f()
			slot3 = "Mission"
			slot2 = managers.editor.layer(slot1, managers.editor)

			managers.editor.layer(slot1, managers.editor).refresh_list_flow(slot1)

			return 
		end

		slot7 = nil

		ctrlr.connect(slot3, ctrlr, "EVT_COMMAND_TEXT_ENTER", f)

		slot7 = nil

		ctrlr.connect(slot3, ctrlr, "EVT_KILL_FOCUS", f)

		return 
	end

	slot15 = base_delay_ctrlr

	refresh_list_flow_cbk(self)

	slot15 = base_delay_rand_ctrlr

	refresh_list_flow_cbk(self)

	slot15 = element_delay

	refresh_list_flow_cbk(self)

	slot15 = element_delay_rand

	refresh_list_flow_cbk(self)

	return 
end
function CoreMissionElement:_build_point_orientation(panel)
	slot7 = "Point orientation"
	local sizer = EWS.StaticBoxSizer(slot3, EWS, panel, "HORIZONTAL")
	slot8 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot11 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "ADD_ELEMENT", "Add an element", CoreEws.image_path(slot10))

	slot13 = "_add_unit_to_orientation_elements"

	toolbar.connect(EWS, toolbar, "ADD_ELEMENT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot11 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "DELETE_ELEMENT", "Remove selected element", CoreEws.image_path(nil))

	slot13 = "_remove_unit_from_orientation_elements"
	slot10 = nil

	toolbar.connect(EWS, toolbar, "DELETE_ELEMENT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot6 = toolbar

	toolbar.realize(EWS)
	sizer.add(EWS, sizer, toolbar, 0, 1)

	slot9 = ""
	local use_orientation_sequenced = EWS.CheckBox(EWS, EWS, panel, "Use sequenced")
	slot8 = self._hed.use_orientation_sequenced

	use_orientation_sequenced.set_value(EWS, use_orientation_sequenced)

	slot13 = "set_element_data"
	slot10 = {
		value = "use_orientation_sequenced",
		ctrlr = use_orientation_sequenced
	}

	use_orientation_sequenced.connect(EWS, use_orientation_sequenced, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND,LEFT", self, self))
	sizer.add(EWS, sizer, use_orientation_sequenced, 0, 4)

	slot10 = ""
	local disable_orientation_on_use = EWS.CheckBox(EWS, EWS, panel, "Disable on use")
	slot9 = self._hed.disable_orientation_on_use

	disable_orientation_on_use.set_value(EWS, disable_orientation_on_use)

	slot14 = "set_element_data"
	slot11 = {
		value = "disable_orientation_on_use",
		ctrlr = disable_orientation_on_use
	}

	disable_orientation_on_use.connect(EWS, disable_orientation_on_use, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND,LEFT", self, self))

	slot12 = "EXPAND,LEFT"

	sizer.add(EWS, sizer, disable_orientation_on_use, 0, 4)

	return sizer
end
function CoreMissionElement:_add_unit_to_orientation_elements()
	slot3 = self._unit
	local script = self._unit.mission_element_data(slot2).script

	local function f(unit)

		-- Decompilation error in this vicinity:
		slot5 = unit
		slot5 = unit.name(slot4)
		slot6 = true

		if not string.find(slot2, unit.name(slot4).s(slot4), "point_orientation", 1) then
			return 
		end

		slot3 = unit
		slot3 = unit
		local id = unit.unit_data(slot2).unit_id

		if self._hed.orientation_elements then
			slot5 = id

			if table.contains(slot3, self._hed.orientation_elements) then
				return false
			end
		end

		slot5 = "Mission"
		slot5 = unit
		slot5 = unit.type(managers.editor.layer(slot3, managers.editor))

		return managers.editor.layer(slot3, managers.editor).category_map(slot3)[unit.type(managers.editor.layer(slot3, managers.editor)).s(managers.editor.layer(slot3, managers.editor))]
	end

	local dialog = SelectUnitByNameModal.new(slot4, SelectUnitByNameModal, "Add Unit")
	slot8 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot14 = unit
		slot12 = unit.unit_data(slot13).unit_id

		self._add_orientation_unit_id(slot10, self)
	end

	return 
end
function CoreMissionElement:_remove_unit_from_orientation_elements()
	if not self._hed.orientation_elements then
		return 
	end

	local function f(unit)
		slot6 = unit
		slot4 = unit.unit_data(slot5).unit_id

		return table.contains(slot2, self._hed.orientation_elements)
	end

	slot6 = f
	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Remove Unit")
	slot5 = dialog

	if dialog.cancelled(SelectUnitByNameModal) then
		return 
	end

	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(slot6)) do
		slot13 = unit
		slot11 = unit.unit_data(slot12).unit_id

		self._remove_orientation_unit_id(slot9, self)
	end

	return 
end
function CoreMissionElement:_build_instance_var_names(panel)
	slot7 = "Instance variables"
	local sizer = EWS.StaticBoxSizer(slot3, EWS, panel, "VERTICAL")
	local options = {}
	slot7 = "Mission"
	slot7 = {
		"func_instance_params"
	}
	local func_instance_params_units = managers.editor.layer(panel, managers.editor).get_created_unit_by_pattern(panel, managers.editor.layer(panel, managers.editor))
	slot7 = func_instance_params_units

	for _, unit in ipairs(managers.editor.layer(panel, managers.editor)) do
		slot14 = unit
		slot12 = unit.mission_element_data(slot13).params

		for _, param in ipairs(slot11) do
			options[param.type] = options[param.type] or {}
			slot18 = param.var_name

			table.insert(options[param.type] or , options[param.type])
		end
	end

	slot7 = self.INSTANCE_VAR_NAMES

	for _, data in ipairs(slot6) do
		local params = {
			default = "not_used",
			ctrlr_proportions = 2,
			name_proportions = 1,
			sizer_proportions = 1,
			tooltip = "Select a value",
			sorted = true
		}
		slot14 = true
		params.name = string.pretty(slot12, data.value) .. ":"
		params.panel = panel
		params.sizer = sizer
		params.options = options[data.type] or {}
		params.value = (self._hed.instance_var_names and self._hed.instance_var_names[data.value]) or "not_used"
		local ctrlr = CoreEws.combobox(slot12)
		slot20 = "_set_instance_var_name"

		ctrlr.connect(params, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback({
			ctrlr = ctrlr,
			data = data
		}, self, self))
	end

	return sizer
end
function CoreMissionElement:_set_instance_var_name(params)
	slot4 = params.ctrlr
	local value = params.ctrlr.get_value(slot3)
	value = (value ~= "not_used" and value) or nil
	self._hed.instance_var_names = self._hed.instance_var_names or {}
	self._hed.instance_var_names[params.data.value] = value
	slot6 = self._hed.instance_var_names
	self._hed.instance_var_names = (next(slot5) and self._hed.instance_var_names) or nil

	return 
end
function CoreMissionElement:_create_panel()
	if self._panel then
		return 
	end

	slot5 = self._parent_sizer
	self._panel, self._panel_sizer = self._add_panel(slot2, self, self._parent_panel)

	return 
end
function CoreMissionElement:_build_panel()
	slot3 = self

	self._create_panel(slot2)

	return 
end
function CoreMissionElement:panel(id, parent, parent_sizer)
	if id then
		if self._panels[id] then
			return self._panels[id]
		end

		slot8 = parent_sizer
		local panel, panel_sizer = self._add_panel(slot5, self, parent)
		slot10 = panel_sizer

		self._build_panel(parent, self, panel)

		self._panels[id] = panel

		return self._panels[id]
	end

	if not self._panel then
		slot6 = self

		self._build_panel(slot5)
	end

	return self._panel
end
function CoreMissionElement:_add_panel(parent, parent_sizer)
	local panel = EWS.ScrolledWindow(slot4, EWS, parent, "")
	slot6 = panel
	slot11 = 0

	panel.set_scroll_rate(EWS, Vector3("VSCROLL,TAB_TRAVERSAL", 0, 20))

	slot11 = 0
	slot7 = Vector3("VSCROLL,TAB_TRAVERSAL", 0, 0)
	slot12 = -1

	panel.set_virtual_size_hints(EWS, panel, Vector3(0, 1, -1))

	slot7 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot8 = panel_sizer

	panel.set_sizer(EWS, panel)

	slot11 = "EXPAND"

	parent_sizer.add(EWS, parent_sizer, panel, 1, 0)

	slot8 = false

	panel.set_visible(EWS, panel)

	slot8 = {
		alive = true
	}

	panel.set_extension(EWS, panel)

	slot9 = panel_sizer

	self.build_default_gui(EWS, self, panel)

	return panel, panel_sizer
end
function CoreMissionElement:add_help_text(data)
	if data.panel and data.sizer then
		slot11 = "TE_MULTILINE,TE_READONLY,TE_WORDWRAP,TE_CENTRE"
		slot8 = "EXPAND,TOP,BOTTOM"

		data.sizer.add(slot3, data.sizer, EWS.TextCtrl(slot6, EWS, data.panel, data.text, 0), 0, 5)
	end

	return 
end
function CoreMissionElement:_add_help_text(text)
	local help = {
		panel = self._panel,
		sizer = self._panel_sizer,
		text = text
	}
	slot6 = help

	self.add_help_text(slot4, self)

	return 
end
function CoreMissionElement:_on_toolbar_add_element()
	local function f(unit)
		slot4 = "mission_element"

		return unit.type(slot2) == Idstring(unit) and unit ~= self._unit
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Add/Remove element")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot11 = unit

		self.add_on_executed(slot9, self)
	end

	return 
end
function CoreMissionElement:_on_toolbar_remove()
	slot3 = self
	slot6 = self

	self.remove_on_execute(slot2, self._current_element_unit(slot5))

	return 
end
function CoreMissionElement:set_element_data(data)
	if data.callback then
		local he = self._unit.mission_element(slot3)
		slot7 = data.params

		he[data.callback](self._unit, he, data.ctrlr)
	end

	if data.value then
		slot6 = data.ctrlr
		self._hed[data.value] = data.ctrlr.get_value(slot5)
		slot6 = self._hed[data.value]
		self._hed[data.value] = tonumber(slot5) or self._hed[data.value]

		if data.value == "base_delay_rand" then
			self._hed[data.value] = (0 < self._hed[data.value] and self._hed[data.value]) or nil
		end

		slot5 = "K_CONTROL"

		if EWS.get_key_state(slot3, EWS) then
			slot4 = self._hed[data.value]
			local value = tonumber(slot3) or self._hed[data.value]
			slot8 = "Mission"
			slot7 = managers.editor.layer(slot6, managers.editor)

			for _, unit in ipairs(managers.editor.layer(slot6, managers.editor).selected_units(slot6)) do
				if unit ~= self._unit then
					slot10 = unit

					if unit.mission_element_data(slot9) then
						slot10 = unit
						unit.mission_element_data(slot9)[data.value] = value
						slot10 = unit
						slot10 = unit.mission_element(data.value)

						unit.mission_element(data.value).set_panel_dirty(data.value)
					end
				end
			end
		end
	end

	return 
end
function CoreMissionElement:set_panel_dirty()
	slot3 = self._panel

	if not alive(slot2) then
		return 
	end

	slot3 = self._panel

	self._panel.destroy(slot2)

	self._panel = nil

	return 
end
function CoreMissionElement:selected()
	slot3 = self

	self.append_elements_sorted(slot2)

	return 
end
function CoreMissionElement:update_selected()
	return 
end
function CoreMissionElement:update_unselected()
	return 
end
function CoreMissionElement:can_edit()
	return self.update_editing or self.base_update_editing
end
function CoreMissionElement:begin_editing()
	return 
end
function CoreMissionElement:end_editing()
	return 
end
function CoreMissionElement:clone_data(all_units)
	slot4 = self._hed.on_executed

	for _, data in ipairs(slot3) do
		slot10 = all_units[data.id]

		table.insert(slot8, self._on_executed_units)
	end

	return 
end
function CoreMissionElement:layer_finished()
	slot3 = self._hed.on_executed

	for _, data in ipairs(slot2) do
		slot9 = data.id
		local unit = managers.worlddefinition.get_mission_element_unit(slot7, managers.worlddefinition)
		slot10 = unit

		table.insert(managers.worlddefinition, self._on_executed_units)
	end

	return 
end
function CoreMissionElement:save_data(file, t)
	slot7 = t

	self.save_values(slot4, self, file)

	return 
end
function CoreMissionElement:save_values(file, t)
	t = t .. "\t"
	slot6 = t .. "<values>"

	file.puts("\t", file)

	slot5 = self._save_values

	for _, name in ipairs("\t") do
		slot13 = name

		self.save_value(slot9, self, file, t)
	end

	slot6 = t .. "</values>"

	file.puts(slot4, file)

	return 
end
function CoreMissionElement:save_value(file, t, name)
	t = t .. "\t"
	slot6 = file
	slot12 = self._unit

	file.puts("\t", save_value_string(slot8, self._hed, name, t))

	return 
end
function CoreMissionElement:new_save_values()

	-- Decompilation error in this vicinity:
	local t = {}

	if self.RANDOMS then
		slot4 = self.RANDOMS

		for _, value_name in ipairs(slot3) do
			if t[value_name][2] == 0 then
				t[value_name] = t[value_name][1]
			end
		end
	end

	return t
end
function CoreMissionElement:name()
	slot3 = self._unit

	return self._unit.name(slot2) .. self._ud.unit_id
end
function CoreMissionElement:add_to_mission_package()
	return 
end
function CoreMissionElement:get_color(type)
	if type then
		if type == "activate" or type == "enable" then
			return 0, 1, 0
		elseif type == "deactivate" or type == "disable" then
			return 1, 0, 0
		end
	end

	return 0, 1, 0
end
function CoreMissionElement:draw_links_selected(t, dt, selected_unit)
	local unit = self._current_element_unit(slot5)
	slot7 = unit

	if alive(self) then
		local r = 1
		local g = 1
		local b = 1

		if self._iconcolor then
			slot11 = "Mission"
			slot10 = managers.editor.layer(slot9, managers.editor)

			if managers.editor.layer(slot9, managers.editor).use_colored_links(slot9) then
				r = self._iconcolor_c.r
				g = self._iconcolor_c.g
				b = self._iconcolor_c.b
			end
		end

		slot11 = {
			thick = true,
			from_unit = self._unit,
			to_unit = unit,
			r = r,
			g = g,
			b = b
		}

		self._draw_link(slot9, self)
	end

	return 
end
function CoreMissionElement:_draw_link(params)
	slot5 = "Mission"
	slot4 = managers.editor.layer(slot3, managers.editor)
	params.draw_flow = managers.editor.layer(slot3, managers.editor).visualize_flow(slot3)
	slot5 = params

	Application.draw_link(slot3, Application)

	return 
end
function CoreMissionElement:draw_links_unselected()
	return 
end
function CoreMissionElement:clear()
	return 
end
function CoreMissionElement:action_types()
	return self._action_types
end
function CoreMissionElement:timeline_color()
	return self._timeline_color
end
function CoreMissionElement:add_triggers(vc)
	return 
end
function CoreMissionElement:base_add_triggers(vc)
	if self.USES_POINT_ORIENTATION then
		slot5 = Idstring(slot6)
		slot10 = "_on_use_point_orientation"

		vc.add_trigger(slot3, vc, callback("lmb", self, self))
	end

	if self.USES_INSTIGATOR_RULES then
		slot5 = Idstring(slot6)
		slot10 = "_on_use_instigator_rule"

		vc.add_trigger(slot3, vc, callback("lmb", self, self))
	end

	return 
end
function CoreMissionElement:_on_use_point_orientation()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "point_orientation", 1) then
			slot4 = ray.unit
			local id = ray.unit.unit_data(slot3).unit_id

			if self._hed.orientation_elements then
				slot6 = id
			else
				slot6 = id

				self._add_orientation_unit_id(slot4, self)
			end
		end
	end

	return 
end
function CoreMissionElement:_add_orientation_unit_id(id)
	self._hed.orientation_elements = self._hed.orientation_elements or {}
	slot5 = id

	table.insert(self._hed.orientation_elements or , self._hed.orientation_elements)

	return 
end
function CoreMissionElement:_remove_orientation_unit_id(id)
	slot5 = id

	table.delete(slot3, self._hed.orientation_elements)

	self._hed.orientation_elements = (0 < #self._hed.orientation_elements and self._hed.orientation_elements) or nil

	return 
end
function CoreMissionElement:_on_use_instigator_rule()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "data_instigator_rule", 1) then
			slot4 = ray.unit
			local id = ray.unit.unit_data(slot3).unit_id

			if self._hed.rules_elements then
				slot6 = id
			else
				slot6 = id

				self._add_instigator_rule_unit_id(slot4, self)
			end
		end
	end

	return 
end
function CoreMissionElement:_add_instigator_rule_unit_id(id)
	self._hed.rules_elements = self._hed.rules_elements or {}
	slot5 = id

	table.insert(self._hed.rules_elements or , self._hed.rules_elements)

	return 
end
function CoreMissionElement:_remove_instigator_rule_unit_id(id)
	slot5 = id

	table.delete(slot3, self._hed.rules_elements)

	self._hed.rules_elements = (0 < #self._hed.rules_elements and self._hed.rules_elements) or nil

	return 
end
function CoreMissionElement:__update_editing(_, t, dt, current_pos)
	return 
end
function CoreMissionElement:clear_triggers()
	return 
end
function CoreMissionElement:widget_affect_object()
	return nil
end
function CoreMissionElement:use_widget_position()
	return nil
end
function CoreMissionElement:set_enabled()
	if self._icon_ws then
		slot3 = self._icon_ws

		self._icon_ws.show(slot2)
	end

	return 
end
function CoreMissionElement:set_disabled()
	if self._icon_ws then
		slot3 = self._icon_ws

		self._icon_ws.hide(slot2)
	end

	return 
end
function CoreMissionElement:on_set_visible(visible)
	if self._icon_ws then
		if visible then
			slot4 = self._icon_ws

			self._icon_ws.show(slot3)
		else
			slot4 = self._icon_ws

			self._icon_ws.hide(slot3)
		end
	end

	return 
end
function CoreMissionElement:set_update_selected_on(value)
	self._update_selected_on = value

	return 
end
function CoreMissionElement:update_selected_on()
	return self._update_selected_on
end
function CoreMissionElement:destroy_panel()
	if self._panel then
		slot3 = self._panel
		self._panel.extension(slot2).alive = false
		slot3 = self._panel

		self._panel.destroy(false)

		self._panel = nil
	end

	return 
end
function CoreMissionElement:destroy()
	if self._timeline then
		slot3 = self._timeline

		self._timeline.destroy(slot2)
	end

	if self._panel then
		slot3 = self._panel
		self._panel.extension(slot2).alive = false
		slot3 = self._panel

		self._panel.destroy(false)
	end

	if self._icon_ws then
		slot3 = self._icon_gui

		if alive(slot2) then
			slot3 = self._icon_ws

			if alive(slot2) then
				slot4 = self._icon_ws

				self._icon_gui.destroy_workspace(slot2, self._icon_gui)

				self._icon_ws = nil
			end
		end
	end

	return 
end
function CoreMissionElement:draw_links(t, dt, selected_unit, all_units)
	slot8 = all_units

	self._base_check_removed_units(slot6, self)

	slot10 = selected_unit

	self.draw_link_on_executed(slot6, self, t, dt)

	slot12 = all_units

	self._draw_elements(slot6, self, t, dt, self._hed.orientation_elements, selected_unit)

	slot12 = all_units

	self._draw_elements(slot6, self, t, dt, self._hed.rules_elements, selected_unit)

	return 
end
function CoreMissionElement:_base_check_removed_units(all_units)
	if self._hed.orientation_elements then
		slot6 = self._hed.orientation_elements

		for _, id in ipairs(clone(slot5)) do
			local unit = all_units[id]
			slot10 = unit

			if not alive(slot9) then
				slot11 = id

				self._remove_orientation_unit_id(slot9, self)
			end
		end
	end

	if self._hed.rules_elements then
		slot6 = self._hed.rules_elements

		for _, id in ipairs(clone(slot5)) do
			local unit = all_units[id]
			slot10 = unit

			if not alive(slot9) then
				slot11 = id

				self._remove_instigator_rule_unit_id(slot9, self)
			end
		end
	end

	return 
end
function CoreMissionElement:_draw_elements(t, dt, elements, selected_unit, all_units)
	if not elements then
		return 
	end

	slot8 = elements

	for _, id in ipairs(slot7) do
		local unit = all_units[id]
		slot16 = unit

		if self._should_draw_link(slot13, self, selected_unit) then
			slot14 = unit
			slot14 = unit.mission_element(slot13)
			local r, g, b = unit.mission_element(slot13).get_link_color(slot13)
			slot18 = {
				from_unit = unit,
				to_unit = self._unit,
				r = r,
				g = g,
				b = b
			}

			self._draw_link(slot16, self)
		end
	end

	return 
end
function CoreMissionElement:_should_draw_link(selected_unit, unit)
	return not selected_unit or unit == selected_unit or self._unit == selected_unit
end
function CoreMissionElement:get_link_color(unit)
	local r = 1
	local g = 1
	local b = 1

	if self._iconcolor then
		slot8 = "Mission"
		slot7 = managers.editor.layer(slot6, managers.editor)

		if managers.editor.layer(slot6, managers.editor).use_colored_links(slot6) then
			r = self._iconcolor_c.r
			g = self._iconcolor_c.g
			b = self._iconcolor_c.b
		end
	end

	return r, g, b
end
function CoreMissionElement:draw_link_on_executed(t, dt, selected_unit)
	local unit_sel = self._unit == selected_unit
	slot8 = (unit_sel and Color.green) or Color.white

	CoreMissionElement.editor_link_brush.set_color(slot6, CoreMissionElement.editor_link_brush)

	slot7 = self._on_executed_units

	for _, unit in ipairs(slot6) do
		if not selected_unit or unit_sel or unit == selected_unit then
			slot14 = unit
			local dir = mvector3.copy(unit.position(slot13))
			slot13 = dir
			slot16 = self._unit

			mvector3.subtract(unit.position, self._unit.position(slot15))

			local vec_len = mvector3.normalize(unit.position)
			slot15 = vec_len
			local offset = math.min(dir, 50)
			slot16 = offset

			mvector3.multiply(50, dir)

			if self._distance_to_camera < 1000000 then
				slot16 = unit.unit_data(slot17).unit_id
				local text = self._get_delay_string(slot14, self)
				slot19 = unit
				slot17 = unit.unit_data(unit).unit_id
				local alternative = self._get_on_executed(self, self).alternative

				if alternative then
					text = text .. " - " .. alternative .. ""
				end

				slot20 = self._unit
				slot22 = managers.editor
				slot23 = managers.editor
				slot23 = managers.editor.camera_rotation(managers.editor.camera_rotation(slot21))
				slot21 = -managers.editor.camera_rotation(managers.editor.camera_rotation(slot21)).z(managers.editor.camera_rotation(slot21))

				CoreMissionElement.editor_link_brush.center_text(slot16, CoreMissionElement.editor_link_brush, self._unit.position(slot19) + dir, text, managers.editor.camera_rotation(slot21).x(slot21))
			end

			slot15 = self
			local r, g, b = self.get_link_color(slot14)
			slot19 = {
				from_unit = self._unit,
				to_unit = unit,
				r = r * 0.75,
				g = g * 0.75,
				b = b * 0.75
			}

			self._draw_link(slot17, self)
		end
	end

	return 
end
function CoreMissionElement:_get_delay_string(unit_id)

	-- Decompilation error in this vicinity:
	slot6 = unit_id
	local delay = self._hed.base_delay + self._get_on_executed(slot4, self).delay
	slot6 = delay
	local text = string.format(slot4, "%.2f")

	return text
end
function CoreMissionElement:add_on_executed(unit)
	slot5 = unit

	if self.remove_on_execute(slot3, self) then
		return 
	end

	local params = {
		delay = 0
	}
	slot5 = unit
	params.id = unit.unit_data(slot4).unit_id
	params.alternative = (self.ON_EXECUTED_ALTERNATIVES and self.ON_EXECUTED_ALTERNATIVES[1]) or nil
	slot6 = unit

	table.insert(slot4, self._on_executed_units)

	slot6 = params

	table.insert(slot4, self._hed.on_executed)

	if self._timeline then
		slot7 = params

		self._timeline.add_element(slot4, self._timeline, unit)
	end

	slot5 = self

	self.append_elements_sorted(slot4)

	slot6 = unit

	self.set_on_executed_element(slot4, self)

	return 
end
function CoreMissionElement:remove_links(unit)
	return 
end
function CoreMissionElement:remove_on_execute(unit)
	slot4 = self._hed.on_executed

	for _, on_executed in ipairs(slot3) do
		slot10 = unit

		if on_executed.id == unit.unit_data(slot9).unit_id then
			if self._timeline then
				slot10 = on_executed

				self._timeline.remove_element(slot8, self._timeline)
			end

			slot10 = on_executed

			table.delete(slot8, self._hed.on_executed)

			slot10 = unit

			table.delete(slot8, self._on_executed_units)

			slot9 = self

			self.append_elements_sorted(slot8)

			return true
		end
	end

	return false
end
function CoreMissionElement:delete_unit(units)
	local id = self._unit.unit_data(slot3).unit_id
	slot5 = units

	for _, unit in ipairs(self._unit) do
		slot10 = unit
		slot11 = self._unit

		unit.mission_element(slot9).remove_on_execute(slot9, unit.mission_element(slot9))

		slot10 = unit
		slot11 = self._unit

		unit.mission_element(slot9).remove_links(slot9, unit.mission_element(slot9))
	end

	return 
end
function CoreMissionElement:set_on_executed_element(unit, id)
	if not unit then
		slot6 = id
		unit = self.on_execute_unit_by_id(slot4, self)
	end

	slot5 = unit

	if not alive(slot4) then
		slot6 = false

		self._set_on_execute_ctrlrs_enabled(slot4, self)

		slot5 = self

		self._set_first_executed_element(slot4)

		return 
	end

	slot6 = true

	self._set_on_execute_ctrlrs_enabled(slot4, self)

	if self._elements_params then
		slot6 = unit
		local name = self.combobox_name(slot4, self)
		slot7 = name

		CoreEWS.change_combobox_value(self, self._elements_params)

		slot6 = self

		self.set_on_executed_data(self)
	end

	return 
end
function CoreMissionElement:set_on_executed_data()
	local id = self.combobox_id(slot2, self)
	slot5 = id
	local params = self._get_on_executed(self, self)
	slot6 = params.delay

	CoreEWS.change_entered_number(self, self._element_delay_params)

	slot6 = params.delay_rand or 0

	CoreEWS.change_entered_number(self._elements_params.value, self._element_delay_rand_params)

	if self._on_executed_alternatives_params then
		slot6 = params.alternative

		CoreEWS.change_combobox_value(slot4, self._on_executed_alternatives_params)
	end

	if self._timeline then
		slot6 = params

		self._timeline.select_element(slot4, self._timeline)
	end

	return 
end
function CoreMissionElement:_set_first_executed_element()
	if 0 < #self._hed.on_executed then
		slot5 = self._hed.on_executed[1].id

		self.set_on_executed_element(slot2, self, nil)
	end

	return 
end
function CoreMissionElement:_set_on_execute_ctrlrs_enabled(enabled)
	if not self._elements_params then
		return 
	end

	slot5 = enabled

	self._elements_params.ctrlr.set_enabled(slot3, self._elements_params.ctrlr)

	slot5 = enabled

	self._element_delay_params.number_ctrlr.set_enabled(slot3, self._element_delay_params.number_ctrlr)

	slot5 = enabled

	self._element_delay_rand_params.number_ctrlr.set_enabled(slot3, self._element_delay_rand_params.number_ctrlr)

	slot5 = enabled

	self._elements_toolbar.set_enabled(slot3, self._elements_toolbar)

	if self._on_executed_alternatives_params then
		slot5 = enabled

		self._on_executed_alternatives_params.ctrlr.set_enabled(slot3, self._on_executed_alternatives_params.ctrlr)
	end

	return 
end
function CoreMissionElement:on_executed_element_selected()
	slot3 = self

	self.set_on_executed_data(slot2)

	return 
end
function CoreMissionElement:_get_on_executed(id)
	slot4 = self._hed.on_executed

	for _, params in ipairs(slot3) do
		if params.id == id then
			return params
		end
	end

	return 
end
function CoreMissionElement:_current_element_id()
	if not self._elements_params or not self._elements_params.value then
		return nil
	end

	slot4 = self._elements_params.value

	return self.combobox_id(slot2, self)
end
function CoreMissionElement:_current_element_unit()
	slot3 = self
	local id = self._current_element_id(slot2)

	if not id then
		return nil
	end

	slot5 = id
	local unit = self.on_execute_unit_by_id(slot3, self)
	slot5 = unit

	if not alive(self) then
		return nil
	end

	return unit
end
function CoreMissionElement:on_executed_element_delay()
	slot4 = self._elements_params.value
	local id = self.combobox_id(slot2, self)
	slot5 = id
	local params = self._get_on_executed(self, self)
	params.delay = self._element_delay_params.value

	if self._timeline then
		slot6 = params

		self._timeline.delay_updated(slot4, self._timeline)
	end

	return 
end
function CoreMissionElement:on_executed_element_delay_rand()
	slot4 = self._elements_params.value
	local id = self.combobox_id(slot2, self)
	slot5 = id
	local params = self._get_on_executed(self, self)
	params.delay_rand = (0 < self._element_delay_rand_params.value and self._element_delay_rand_params.value) or nil

	return 
end
function CoreMissionElement:on_executed_alternatives_types()
	slot4 = self._elements_params.value
	local id = self.combobox_id(slot2, self)
	slot5 = id
	local params = self._get_on_executed(self, self)
	slot6 = self._on_executed_alternatives_params.value

	print(self, "self._on_executed_alternatives_params.value")

	params.alternative = self._on_executed_alternatives_params.value

	return 
end
function CoreMissionElement:append_elements_sorted()
	if not self._elements_params then
		return 
	end

	local id = self._current_element_id(slot2)
	slot4 = self._elements_params
	slot8 = self._on_executed_units

	CoreEWS.update_combobox_options(self, self._combobox_names_names(slot6, self))

	slot6 = id

	self.set_on_executed_element(self, self, nil)

	return 
end
function CoreMissionElement:combobox_name(unit)
	slot4 = unit
	slot6 = unit

	return unit.unit_data(slot3).name_id .. " (" .. unit.unit_data(slot5).unit_id .. ")"
end
function CoreMissionElement:combobox_id(name)
	local s = nil
	local e = string.len(slot4) - 1
	slot6 = name

	for i = string.len(name), 0, -1 do
		slot12 = i
		local t = string.sub(slot9, name, i)

		if t == "(" then
			s = i + 1

			break
		end
	end

	slot10 = e

	return tonumber(string.sub(slot7, name, s))
end
function CoreMissionElement:on_execute_unit_by_id(id)
	slot4 = self._on_executed_units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if unit.unit_data(slot8).unit_id == id then
			return unit
		end
	end

	return nil
end
function CoreMissionElement:_combobox_names_names(units)
	local names = {}
	slot5 = units

	for _, unit in ipairs(slot4) do
		slot10 = names
		slot14 = unit

		table.insert(slot9, self.combobox_name(slot12, self))
	end

	return names
end
function CoreMissionElement:on_timeline()
	if not self._timeline then
		slot6 = self._unit
		slot4 = self._unit.unit_data(slot5).name_id
		self._timeline = MissionElementTimeline.new(slot2, MissionElementTimeline)
		slot4 = self._unit

		self._timeline.set_mission_unit(slot2, self._timeline)
	else
		slot4 = true

		self._timeline.set_visible(slot2, self._timeline)
	end

	return 
end
function CoreMissionElement:_build_value_combobox(panel, sizer, value_name, options, tooltip, custom_name, params)
	slot11 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot9, EWS)
	slot15 = "EXPAND,LEFT"

	sizer.add(slot10, sizer, horizontal_sizer, (params and params.horizontal_sizer_proportions) or 0, 1)

	local combobox_params = {
		sizer_proportions = 1,
		name_proportions = 1,
		sorted = false,
		ctrlr_proportions = 2
	}
	slot13 = true
	combobox_params.name = string.pretty(sizer, custom_name or value_name) .. ":"
	combobox_params.panel = panel
	combobox_params.sizer = horizontal_sizer
	combobox_params.options = options
	combobox_params.value = self._hed[value_name]
	combobox_params.tooltip = tooltip or "Select an option from the combobox"
	local ctrlr = CoreEws.combobox(sizer)
	slot19 = "set_element_data"

	ctrlr.connect(combobox_params, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback({
		ctrlr = ctrlr,
		value = value_name
	}, self, self))

	slot16 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(combobox_params, EWS, panel, "")
	slot19 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "SELECT_NAME_LIST", "Select from list", CoreEws.image_path(self))

	slot21 = "_on_gui_value_combobox_toolbar_select_dialog"
	slot18 = {
		combobox_params = combobox_params,
		value_name = value_name
	}

	toolbar.connect(EWS, toolbar, "SELECT_NAME_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot14 = toolbar

	toolbar.realize(EWS)

	slot18 = "EXPAND,LEFT"

	horizontal_sizer.add(EWS, horizontal_sizer, toolbar, 0, 1)

	return ctrlr, combobox_params
end
function CoreMissionElement:_on_gui_value_combobox_toolbar_select_dialog(params)
	slot6 = params.combobox_params.options
	local dialog = SelectNameModal.new(slot3, SelectNameModal, "Select name")
	slot5 = dialog

	if dialog.cancelled(SelectNameModal) then
		return 
	end

	slot7 = dialog

	for _, name in ipairs(dialog._selected_item_assets(slot6)) do
		slot11 = name

		CoreEws.change_combobox_value(slot9, params.combobox_params)

		slot11 = {
			ctrlr = params.combobox_params.ctrlr,
			value = params.value_name
		}

		self.set_element_data(slot9, self)
	end

	return 
end
function CoreMissionElement:_build_value_number(panel, sizer, value_name, options, tooltip, custom_name)
	local number_params = {}
	slot11 = true
	number_params.name = string.pretty(slot9, custom_name or value_name) .. ":"
	number_params.panel = panel
	number_params.sizer = sizer
	number_params.value = self._hed[value_name]
	number_params.floats = options.floats
	number_params.tooltip = tooltip or "Set a number value"
	number_params.min = options.min
	number_params.max = options.max
	number_params.name_proportions = options.name_proportions or 1
	number_params.ctrlr_proportions = options.ctrlr_proportions or 2
	number_params.sizer_proportions = options.sizer_proportions
	local ctrlr = CoreEws.number_controller(slot9)
	slot17 = "set_element_data"

	ctrlr.connect(number_params, ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(slot14, self, self))

	slot17 = "set_element_data"
	slot14 = {
		ctrlr = ctrlr,
		value = value_name
	}

	ctrlr.connect(number_params, ctrlr, "EVT_KILL_FOCUS", callback({
		ctrlr = ctrlr,
		value = value_name
	}, self, self))

	return ctrlr, number_params
end
function CoreMissionElement:_build_value_checkbox(panel, sizer, value_name, tooltip, custom_name)
	slot8 = EWS
	slot6 = EWS.CheckBox
	slot9 = panel

	if not custom_name then
		slot13 = true
		slot10 = string.pretty(slot11, value_name)
	end

	slot11 = ""
	local checkbox = slot6(slot7, slot8, slot9, slot10)
	slot10 = self._hed[value_name]

	checkbox.set_value(slot8, checkbox)

	slot10 = tooltip or "Click to toggle"

	checkbox.set_tool_tip(slot8, checkbox)

	slot15 = "set_element_data"

	checkbox.connect(slot8, checkbox, "EVT_COMMAND_CHECKBOX_CLICKED", callback({
		ctrlr = checkbox,
		value = value_name
	}, self, self))

	slot13 = "EXPAND"

	sizer.add(slot8, sizer, checkbox, 0, 0)

	return checkbox
end
function CoreMissionElement:_open_color_picker(panel, color_ctrlr)
	if not self.__color_picker_dialog then
		slot9 = true
		slot3 = CoreColorPickerDialog.ColorPickerDialog.new(slot4, CoreColorPickerDialog.ColorPickerDialog, panel, true, "HORIZONTAL")
	end

	self.__color_picker_dialog = slot3
	slot5 = self.__color_picker_dialog._window

	self.__color_picker_dialog._window.set_focus(slot4)

	function slot7()
		self.__color_picker_dialog = nil

		return 
	end

	self.__color_picker_dialog.connect(slot4, self.__color_picker_dialog, "EVT_CLOSE_WINDOW")

	slot11 = "_on_color_changed"
	slot8 = ""

	self.__color_picker_dialog.connect(slot4, self.__color_picker_dialog, "EVT_COLOR_UPDATED", callback(slot8, self, self))

	slot5 = self._parent_panel
	slot5 = self._parent_panel.parent(slot4)
	slot5 = self._parent_panel.parent(slot4).parent(slot4)
	slot5 = self._parent_panel.parent(slot4).parent(slot4).parent(slot4)
	slot5 = self._parent_panel.parent(slot4).parent(slot4).parent(slot4).parent(slot4)
	local editor_window = self._parent_panel.parent(slot4).parent(slot4).parent(slot4).parent(slot4).parent(slot4).parent(slot4)
	slot10 = editor_window
	slot8 = editor_window.get_size(editor_window).z
	local distance = Vector3(self._parent_panel.parent(slot4).parent(slot4).parent(slot4).parent(slot4).parent(slot4), editor_window.get_size(callback(slot8, self, self)).x * 0.85, editor_window.get_size(editor_window).y * 0.6)
	slot10 = editor_window
	slot8 = editor_window.get_position(editor_window) + distance

	self.__color_picker_dialog.set_position(editor_window.get_size(callback(slot8, self, self)).x * 0.85, self.__color_picker_dialog)

	slot8 = true

	self.__color_picker_dialog.set_visible(editor_window.get_size(callback(slot8, self, self)).x * 0.85, self.__color_picker_dialog)

	return 
end
function CoreMissionElement:_build_value_color(panel, sizer, value_name, tooltip, custom_name)
	slot9 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot7, EWS)
	slot13 = "EXPAND,ALIGN_RIGHT"

	sizer.add(EWS, sizer, horizontal_sizer, 0, 0)

	slot9 = EWS
	slot7 = EWS.StaticText
	slot10 = panel

	if not custom_name then
		slot14 = true
		slot11 = string.pretty(slot12, value_name) .. ": "
	end

	local text_ctrlr = slot7(slot8, slot9, slot10)
	slot11 = tooltip or "Click to select a color"

	text_ctrlr.set_tool_tip(slot9, text_ctrlr)

	slot15 = text_ctrlr

	horizontal_sizer.add(slot9, horizontal_sizer, text_ctrlr, 0, 158 - text_ctrlr.get_size("ALIGN_LEFT,ALIGN_CENTER_VERTICAL,RIGHT").x)

	slot14 = "BU_RIGHT"
	local color_ctrlr = EWS.Button(slot9, EWS, panel, "", "")
	slot14 = 0

	color_ctrlr.set_background_colour(EWS, color_ctrlr, 0, 255)

	slot12 = tooltip or "Click to select a color"

	color_ctrlr.set_tool_tip(text_ctrlr, color_ctrlr)

	slot17 = "_open_color_picker"

	color_ctrlr.connect(text_ctrlr, color_ctrlr, "EVT_COMMAND_BUTTON_CLICKED", callback({
		panel = panel,
		color_ctrlr = color_ctrlr
	}, self, self))

	slot15 = "RIGHT"

	horizontal_sizer.add(text_ctrlr, horizontal_sizer, color_ctrlr, 1, 0)

	return text_ctrlr, color_ctrlr
end
function CoreMissionElement:_build_value_random_number(panel, sizer, value_name, options, tooltip, custom_name)
	local horizontal_sizer = EWS.BoxSizer(slot8, EWS)
	slot14 = "EXPAND,LEFT"

	sizer.add(EWS, sizer, horizontal_sizer, 0, 0)

	local number_params = {
		name = string.pretty("HORIZONTAL", custom_name or value_name) .. ":",
		panel = panel,
		sizer = horizontal_sizer,
		value = self._hed[value_name][1],
		floats = options.floats,
		tooltip = tooltip or "Set a number value",
		min = options.min,
		max = options.max,
		name_proportions = options.name_proportions or 2,
		ctrlr_proportions = options.ctrlr_proportions or 2,
		sizer_proportions = options.sizer_proportions or 2
	}
	local ctrlr = CoreEws.number_controller("HORIZONTAL")
	slot18 = "_set_random_number_element_data"

	ctrlr.connect(number_params, ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(slot15, self, self))

	slot18 = "_set_random_number_element_data"
	slot15 = {
		index = 1,
		ctrlr = ctrlr,
		value = value_name
	}

	ctrlr.connect(number_params, ctrlr, "EVT_KILL_FOCUS", callback({
		index = 1,
		ctrlr = ctrlr,
		value = value_name
	}, self, self))

	local number2_params = {
		name = "+ random:",
		tooltip = "Add a random amount",
		panel = panel,
		sizer = horizontal_sizer,
		value = self._hed[value_name][2],
		floats = options.floats,
		min = options.min,
		max = options.max,
		name_proportions = options.name_proportions or 1,
		ctrlr_proportions = options.ctrlr_proportions or 2,
		sizer_proportions = options.sizer_proportions or 1
	}
	local ctrlr2 = CoreEws.number_controller(true)
	slot20 = "_set_random_number_element_data"

	ctrlr2.connect(number2_params, ctrlr2, "EVT_COMMAND_TEXT_ENTER", callback(slot17, self, self))

	slot20 = "_set_random_number_element_data"
	slot17 = {
		index = 2,
		ctrlr = ctrlr2,
		value = value_name
	}

	ctrlr2.connect(number2_params, ctrlr2, "EVT_KILL_FOCUS", callback({
		index = 2,
		ctrlr = ctrlr2,
		value = value_name
	}, self, self))

	return ctrlr, number_params
end
function CoreMissionElement:_set_random_number_element_data(data)
	slot4 = "_set_random_number_element_data"
	slot7 = data

	print(slot3, inspect(slot6))

	local value = data.ctrlr.get_value(slot3)
	slot5 = value
	value = tonumber(data.ctrlr)
	slot6 = value
	slot9 = value

	print(data.ctrlr, "data.ctrlr:get_value()", type(slot8))

	slot5 = "self._hed[ data.value ]"
	slot8 = self._hed[data.value]

	print(data.ctrlr, inspect(type))

	self._hed[data.value][data.index] = value

	return 
end
function CoreMissionElement:_build_add_remove_unit_from_list(panel, sizer, elements, names, exact_names)
	slot11 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(slot7, EWS, panel, "")
	slot14 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(slot13))

	slot16 = "_add_unit_list_btn"

	toolbar.connect(EWS, toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot14 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "REMOVE_UNIT_LIST", "Remove unit from unit list", CoreEws.image_path({
		elements = elements,
		names = names,
		exact_names = exact_names
	}))

	slot16 = "_remove_unit_list_btn"
	slot13 = {
		elements = elements
	}

	toolbar.connect(EWS, toolbar, "REMOVE_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot9 = toolbar

	toolbar.realize(EWS)

	slot13 = "EXPAND,LEFT"

	sizer.add(EWS, sizer, toolbar, 0, 1)

	return 
end
function CoreMissionElement:_add_unit_list_btn(params)
	local elements = params.elements or {}
	slot5 = self._unit
	local script = self._unit.mission_element_data(slot4).script

	local function f_correct_unit(unit)
		if not params.names and not params.exact_names then
			return true
		end

		slot3 = unit
		slot3 = unit.name(slot2)
		local u_name = unit.name(slot2).s(slot2)

		if params.exact_names then
			slot4 = params.exact_names

			for _, name in ipairs(slot3) do
				if u_name == name then
					return true
				end
			end
		end

		if params.names then
			slot4 = params.names

			for _, name in ipairs(slot3) do
				slot12 = true

				if string.find(slot8, u_name, name, 1) then
					return true
				end
			end
		end

		return false
	end

	local function f(unit)

		-- Decompilation error in this vicinity:
		slot3 = unit
		local id = unit.unit_data(slot2).unit_id
		slot5 = id

		if table.contains(unit, elements) then
			return false
		end

		slot4 = unit

		if f_correct_unit(slot3) then
			return true
		end

		return false
	end

	local dialog = SelectUnitByNameModal.new(slot7, SelectUnitByNameModal, "Add Unit")
	slot11 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		local id = unit.unit_data(slot13).unit_id
		slot16 = id

		table.insert(unit, elements)
	end

	return 
end
function CoreMissionElement:_remove_unit_list_btn(params)
	local elements = params.elements

	local function f(unit)
		slot6 = unit
		slot4 = unit.unit_data(slot5).unit_id

		return table.contains(slot2, elements)
	end

	local dialog = SelectUnitByNameModal.new(slot5, SelectUnitByNameModal, "Remove Unit")
	slot9 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		local id = unit.unit_data(slot11).unit_id
		slot14 = id

		table.delete(unit, elements)
	end

	return 
end
function CoreMissionElement:_build_add_remove_static_unit_from_list(panel, sizer, params)
	slot9 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(slot5, EWS, panel, "")
	slot12 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(slot11))

	slot14 = "_add_static_unit_list_btn"

	toolbar.connect(EWS, toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot12 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "REMOVE_UNIT_LIST", "Remove unit from unit list", CoreEws.image_path(params))

	slot14 = "_remove_static_unit_list_btn"
	slot11 = params

	toolbar.connect(EWS, toolbar, "REMOVE_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot7 = toolbar

	toolbar.realize(EWS)

	slot11 = "EXPAND,LEFT"

	sizer.add(EWS, sizer, toolbar, 0, 1)

	return 
end
function CoreMissionElement:_add_static_unit_list_btn(params)
	local dialog = (params.single and SingleSelectUnitByNameModal) or SelectUnitByNameModal.new(slot3, (params.single and SingleSelectUnitByNameModal) or SelectUnitByNameModal, "Add Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(params.add_filter)) do
		local id = unit.unit_data(slot9).unit_id
		slot11 = unit

		params.add_result(unit)
	end

	return 
end
function CoreMissionElement:_remove_static_unit_list_btn(params)
	local dialog = (params.single and SingleSelectUnitByNameModal) or SelectUnitByNameModal.new(slot3, (params.single and SingleSelectUnitByNameModal) or SelectUnitByNameModal, "Remove Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(params.remove_filter)) do
		slot10 = unit

		params.remove_result(slot9)
	end

	return 
end
function CoreMissionElement:get_links_to_unit(to_unit, links, all_units)
	if to_unit == self._unit then
		slot6 = self._hed.on_executed

		for _, data in ipairs(slot5) do
			local on_executed_unit = all_units[data.id]
			slot15 = on_executed_unit
			local delay = self._get_delay_string(slot11, self)
			local type = "on_executed" .. ((data.alternative and " " .. data.alternative) or "")
			slot15 = {
				unit = on_executed_unit,
				alternative = type,
				delay = delay
			}

			table.insert(on_executed_unit.unit_data(slot14).unit_id, links.on_executed)
		end
	end

	slot6 = self._hed.on_executed

	for _, data in ipairs(slot5) do
		local unit = all_units[data.id]

		if unit == to_unit then
			slot15 = unit
			local delay = self._get_delay_string(slot11, self)
			local type = "on_executed" .. ((data.alternative and " " .. data.alternative) or "")
			slot15 = {
				unit = self._unit,
				alternative = type,
				delay = delay
			}

			table.insert(unit.unit_data(slot14).unit_id, links.executers)
		end
	end

	return 
end
function CoreMissionElement:_get_links_of_type_from_elements(elements, type, to_unit, links, all_units)
	local links1 = (type == "operator" and links.on_executed) or (type == "trigger" and links.executers) or (type == "filter" and links.executers) or links.on_executed
	local links2 = (type == "operator" and links.executers) or (type == "trigger" and links.on_executed) or (type == "filter" and links.on_executed) or links.executers
	local to_unit_id = to_unit.unit_data(slot9).unit_id
	slot11 = elements

	for _, id in ipairs(to_unit) do
		if to_unit == self._unit then
			slot17 = {
				unit = all_units[id],
				alternative = type
			}

			table.insert(slot15, links1)
		elseif id == to_unit_id then
			slot17 = {
				unit = self._unit,
				alternative = type
			}

			table.insert(slot15, links2)
		end
	end

	return 
end

return 
