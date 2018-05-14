-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not CoreInstanceInputUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreInstanceInputUnitElement = slot0

if not InstanceInputUnitElement then
	slot2 = CoreInstanceInputUnitElement
	slot0 = class(slot1)
end

InstanceInputUnitElement = slot0
InstanceInputUnitElement.SAVE_UNIT_POSITION = false
InstanceInputUnitElement.SAVE_UNIT_ROTATION = false
function InstanceInputUnitElement:init(...)
	slot3 = self

	InstanceInputUnitElement.super.init(slot2, ...)

	self._hed.event = "none"
	slot4 = "event"

	table.insert("none", self._save_values)

	return 
end
function InstanceInputUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = "TE_PROCESS_ENTER"
	local event = EWS.TextCtrl(slot4, EWS, panel, self._hed.event, "")
	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, event, 0, 0)

	slot12 = "set_element_data"

	event.connect(EWS, event, "EVT_COMMAND_TEXT_ENTER", callback(0, self, self))

	slot12 = "set_element_data"
	slot9 = {
		value = "event",
		ctrlr = event
	}

	event.connect(EWS, event, "EVT_KILL_FOCUS", callback({
		value = "event",
		ctrlr = event
	}, self, self))

	return 
end

if not CoreInstanceOutputUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreInstanceOutputUnitElement = slot0

if not InstanceOutputUnitElement then
	slot2 = CoreInstanceOutputUnitElement
	slot0 = class(slot1)
end

InstanceOutputUnitElement = slot0
InstanceOutputUnitElement.SAVE_UNIT_POSITION = false
InstanceOutputUnitElement.SAVE_UNIT_ROTATION = false
function InstanceOutputUnitElement:init(...)
	slot3 = self

	InstanceOutputUnitElement.super.init(slot2, ...)

	self._hed.event = "none"
	slot4 = "event"

	table.insert("none", self._save_values)

	return 
end
function InstanceOutputUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = "TE_PROCESS_ENTER"
	local event = EWS.TextCtrl(slot4, EWS, panel, self._hed.event, "")
	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, event, 0, 0)

	slot12 = "set_element_data"

	event.connect(EWS, event, "EVT_COMMAND_TEXT_ENTER", callback(0, self, self))

	slot12 = "set_element_data"
	slot9 = {
		value = "event",
		ctrlr = event
	}

	event.connect(EWS, event, "EVT_KILL_FOCUS", callback({
		value = "event",
		ctrlr = event
	}, self, self))

	return 
end

if not CoreInstanceEventUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreInstanceEventUnitElement = slot0

if not InstanceEventUnitElement then
	slot2 = CoreInstanceEventUnitElement
	slot0 = class(slot1)
end

InstanceEventUnitElement = slot0
InstanceEventUnitElement.SAVE_UNIT_POSITION = false
InstanceEventUnitElement.SAVE_UNIT_ROTATION = false
function InstanceEventUnitElement:init(type, ...)
	slot4 = self

	InstanceEventUnitElement.super.init(slot3, ...)

	self._type = type
	self._guis = {}
	self._hed.event_list = {}
	slot5 = "event_list"

	table.insert(, self._save_values)

	return 
end
function InstanceEventUnitElement:layer_finished(...)
	slot3 = self

	InstanceEventUnitElement.super.layer_finished(slot2, ...)

	if self._hed.instance then
		slot4 = {
			instance = self._hed.instance,
			event = self._hed.event
		}

		table.insert(slot2, self._hed.event_list)
	end

	return 
end
function InstanceEventUnitElement:selected()
	slot3 = self

	InstanceEventUnitElement.super.selected(slot2)

	return 
end
function InstanceEventUnitElement:update_selected(t, dt)
	slot5 = self._hed.event_list

	for _, data in ipairs(slot4) do
		slot13 = data.instance

		self._draw_instance_link(slot9, self, t, dt)
	end

	return 
end
function InstanceEventUnitElement:update_editing(t, dt)
	slot5 = self
	local instance_name = self._instance_name_raycast(slot4)

	if instance_name then
		slot9 = instance_name

		self._draw_instance_link(slot5, self, t, dt)
	end

	return 
end
function InstanceEventUnitElement:_draw_instance_link(t, dt, instance_name)
	slot6 = self
	local r, g, b = self.get_link_color(slot5)
	slot10 = "Instances"
	slot15 = b

	managers.editor.layer(slot8, managers.editor).external_draw_instance(slot8, managers.editor.layer(slot8, managers.editor), t, dt, instance_name, r, g)

	if self._type == "input" then
		slot14 = instance_name
		slot15 = 0.2

		Application.draw_arrow(slot8, Application, self._unit.position(slot11), managers.world_instance.get_instance_data_by_name(self._unit, managers.world_instance).position, r, g, b)
	else
		slot13 = instance_name
		slot13 = self._unit
		slot15 = 0.2

		Application.draw_arrow(slot8, Application, managers.world_instance.get_instance_data_by_name(slot11, managers.world_instance).position, self._unit.position(managers.world_instance), r, g, b)
	end

	return 
end
function InstanceEventUnitElement:_instance_name_raycast()
	slot4 = {
		ray_type = "body editor",
		skip_instance_check = true,
		mask = 1
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if not ray or not ray.unit then
		return nil
	end

	slot4 = ray.unit
	local instance_name = ray.unit.unit_data(slot3).instance

	if not instance_name then
		return nil
	end

	local instance_data = managers.world_instance.get_instance_data_by_name(slot4, managers.world_instance)
	slot7 = self._unit

	return (instance_data.script == self._unit.mission_element_data(instance_name).script and instance_name) or nil
end
function InstanceEventUnitElement:on_instance_changed_name(old_name, new_name)
	slot5 = self._hed.event_list

	for _, data in ipairs(slot4) do
		if data.instance == old_name then
			data.instance = new_name
		end
	end

	slot5 = self._guis

	for _, data in ipairs(slot4) do
		if data.instance_name == old_name then
			data.instance_name = new_name
			slot11 = new_name

			data.instance_name_ctrlr.set_label(slot9, data.instance_name_ctrlr)
		end
	end

	return 
end
function InstanceEventUnitElement:on_instance_deleted(name)
	slot4 = self._guis
	local clone_guis = clone(slot3)
	slot7 = self._hed.event_list

	for i, event_list_data in ipairs(clone(slot6)) do
		if event_list_data.instance == name then
			slot11 = event_list_data

			self.remove_entry(slot9, self)
		end
	end

	return 
end
function InstanceEventUnitElement:_get_events(instance_name)
	if self._type == "input" then
		slot5 = instance_name

		return managers.world_instance.get_mission_inputs_by_name(slot3, managers.world_instance)
	else
		slot5 = instance_name

		return managers.world_instance.get_mission_outputs_by_name(slot3, managers.world_instance)
	end

	return 
end
function InstanceEventUnitElement:_set_instance_by_raycast()
	slot3 = self
	local instance_name = self._instance_name_raycast(slot2)

	if instance_name then
		slot5 = instance_name

		self._add_instance_by_name(slot3, self)
	end

	return 
end
function InstanceEventUnitElement:_add_instance_by_name(instance_name)
	local events = self._get_events(slot3, self)
	local event_list_data = {
		instance = instance_name,
		event = events[1]
	}
	slot7 = event_list_data

	table.insert(instance_name, self._hed.event_list)

	slot9 = event_list_data

	self._add_instance_gui(instance_name, self, instance_name, events)

	return 
end
function InstanceEventUnitElement:_add_instance_gui(instance_name, events, event_list_data)
	local panel = self._panel
	local panel_sizer = self._panel_sizer
	slot9 = "HORIZONTAL"
	local h_sizer = EWS.BoxSizer(slot7, EWS)
	slot13 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, h_sizer, 0, 1)

	slot13 = "ALIGN_LEFT"
	local instance_name_ctrlr = EWS.StaticText(EWS, EWS, panel, "" .. instance_name, 0)
	slot14 = "LEFT,ALIGN_CENTER_VERTICAL"

	h_sizer.add(EWS, h_sizer, instance_name_ctrlr, 2, 1)

	local events_params = {
		ctrlr_proportions = 2,
		name_proportions = 0,
		tooltip = "Select an event from the combobox",
		sorted = true,
		sizer_proportions = 2,
		panel = panel,
		sizer = h_sizer,
		options = events,
		value = event_list_data.event
	}
	local event = CoreEws.combobox(h_sizer)
	slot15 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(events_params, EWS, panel, "")
	slot18 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "SELECT", "Remove", CoreEws.image_path(slot17))

	slot20 = "remove_entry"
	slot17 = event_list_data

	toolbar.connect(EWS, toolbar, "SELECT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot13 = toolbar

	toolbar.realize(EWS)

	slot14 = {
		instance_name_ctrlr = instance_name_ctrlr,
		instance_name = instance_name,
		event = event,
		name_ctrlr = events_params.name_ctrlr,
		toolbar = toolbar
	}

	table.insert(EWS, self._guis)

	slot17 = "EXPAND,LEFT"

	h_sizer.add(EWS, h_sizer, toolbar, 0, 1)

	slot19 = "_on_gui_set_event_data"
	slot16 = event_list_data

	event.connect(EWS, event, "EVT_COMMAND_COMBOBOX_SELECTED", callback(1, self, self))

	slot13 = panel

	panel.layout(EWS)

	return 
end
function InstanceEventUnitElement:_on_gui_set_event_data(event_list_data)
	slot5 = event_list_data
	local guis = self._get_guis_by_event_list_data(slot3, self)
	slot5 = guis.event
	local event = guis.event.get_value(self)
	event_list_data.event = event

	return 
end
function InstanceEventUnitElement:_get_guis_by_event_list_data(event_list_data)
	slot6 = self._hed.event_list

	for i, entry in pairs(clone(slot5)) do
		if entry == event_list_data then
			return self._guis[i]
		end
	end

	return 
end
function InstanceEventUnitElement:remove_entry(event_list_data)
	local function _remove_guis(guis)
		if guis then
			slot3 = guis.instance_name_ctrlr

			guis.instance_name_ctrlr.destroy(slot2)

			slot3 = guis.event

			guis.event.destroy(slot2)

			if guis.name_ctrlr then
				slot3 = guis.name_ctrlr

				guis.name_ctrlr.destroy(slot2)
			end

			slot3 = guis.toolbar

			guis.toolbar.destroy(slot2)

			slot4 = guis

			table.delete(slot2, self._guis)

			slot3 = self._panel

			self._panel.layout(slot2)
		end

		return 
	end

	slot7 = self._hed.event_list

	for i, entry in pairs(clone(slot6)) do
		if entry == event_list_data then
			slot11 = i

			table.remove(slot9, self._hed.event_list)

			slot10 = self._guis[i]

			_remove_guis(slot9)

			break
		end
	end

	return 
end
function InstanceEventUnitElement:destroy_panel(...)
	slot3 = self

	InstanceEventUnitElement.super.destroy_panel(slot2, ...)

	return 
end
function InstanceEventUnitElement:_on_gui_select_instance_list()
	local settings = {
		list_style = "LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING"
	}
	slot5 = "default"
	local names = managers.world_instance.instance_names_by_script(slot3, managers.world_instance)
	slot8 = self._unit
	slot6 = self._unit.mission_element_data(slot7).script
	local names_script = managers.world_instance.instance_names_by_script(managers.world_instance, managers.world_instance)
	slot6 = names_script

	for _, val in ipairs(managers.world_instance) do
		slot12 = val

		table.insert(slot10, names)
	end

	slot9 = settings
	local dialog = SelectNameModal.new(slot5, SelectNameModal, "Select instances", names)
	slot7 = dialog

	if dialog.cancelled(SelectNameModal) then
		return 
	end

	slot9 = dialog

	for _, instance_name in ipairs(dialog._selected_item_assets(slot8)) do
		slot13 = instance_name

		self._add_instance_by_name(slot11, self)
	end

	return 
end
function InstanceEventUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "TB_FLAT,TB_NODIVIDER"
	local btn_toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot11 = "world_editor\\unit_by_name_list.png"

	btn_toolbar.add_tool(EWS, btn_toolbar, "SELECT_UNIT_LIST", "Select unit from unit list", CoreEws.image_path(slot10))

	slot13 = "_on_gui_select_instance_list"
	slot10 = nil

	btn_toolbar.connect(EWS, btn_toolbar, "SELECT_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot6 = btn_toolbar

	btn_toolbar.realize(EWS)

	slot10 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, btn_toolbar, 0, 1)

	slot8 = self._hed.event_list

	for _, data in pairs(clone(btn_toolbar)) do
		slot12 = data.instance
		local events = self._get_events(slot10, self)
		slot15 = data

		self._add_instance_gui(self, self, data.instance, events)
	end

	return 
end
function InstanceEventUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "_set_instance_by_raycast"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end

if not CoreInstanceInputEventUnitElement then
	slot2 = InstanceEventUnitElement
	slot0 = class(slot1)
end

CoreInstanceInputEventUnitElement = slot0

if not InstanceInputEventUnitElement then
	slot2 = CoreInstanceInputEventUnitElement
	slot0 = class(slot1)
end

InstanceInputEventUnitElement = slot0
function InstanceInputEventUnitElement:init(...)
	slot4 = "input"

	InstanceInputEventUnitElement.super.init(slot2, self, ...)

	return 
end

if not CoreInstanceOutputEventUnitElement then
	slot2 = InstanceEventUnitElement
	slot0 = class(slot1)
end

CoreInstanceOutputEventUnitElement = slot0

if not InstanceOutputEventUnitElement then
	slot2 = CoreInstanceOutputEventUnitElement
	slot0 = class(slot1)
end

InstanceOutputEventUnitElement = slot0
function InstanceOutputEventUnitElement:init(...)
	slot4 = "output"

	InstanceOutputEventUnitElement.super.init(slot2, self, ...)

	return 
end

if not CoreInstancePointUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreInstancePointUnitElement = slot0

if not InstancePointUnitElement then
	slot2 = CoreInstancePointUnitElement
	slot0 = class(slot1)
end

InstancePointUnitElement = slot0
function InstancePointUnitElement:init(...)
	slot3 = self

	InstancePointUnitElement.super.init(slot2, ...)

	self._hed.instance = nil
	slot4 = "instance"

	table.insert(nil, self._save_values)

	return 
end
function InstancePointUnitElement:update_selected(t, dt)
	if self._hed.instance then
		slot8 = self._hed.instance

		InstanceEventUnitElement._draw_instance_link(slot4, self, t, dt)
	end

	return 
end
function InstancePointUnitElement:update_editing(t, dt)
	slot5 = self
	local instance_name = self._instance_name_raycast(slot4)

	if instance_name then
		slot9 = instance_name

		InstanceEventUnitElement._draw_instance_link(slot5, self, t, dt)
	end

	return 
end
function InstancePointUnitElement:selected()
	slot3 = self

	InstanceEventUnitElement.super.selected(slot2)

	slot3 = self
	local names = self._get_options(slot2)

	if self._instance_params then
		slot5 = names

		CoreEws.update_combobox_options(slot3, self._instance_params)
	end

	slot5 = self._hed.instance

	if not table.contains(slot3, names) then
		self._hed.instance = nil
	end

	if self._instance_params then
		slot5 = self._hed.instance

		CoreEws.change_combobox_value(slot3, self._instance_params)
	end

	return 
end
function InstancePointUnitElement:external_change_instance(instance)
	self._hed.instance = instance

	return 
end
function InstancePointUnitElement:_set_instance_by_raycast()
	slot3 = self
	local instance_name = self._instance_name_raycast(slot2)

	if instance_name then
		self._hed.instance = instance_name
		slot5 = instance_name

		CoreEws.change_combobox_value(slot3, self._instance_params)
	end

	return 
end
function InstancePointUnitElement:_instance_name_raycast()

	-- Decompilation error in this vicinity:
	slot4 = {
		ray_type = "body editor",
		skip_instance_check = true,
		mask = 1
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if not ray or not ray.unit then
		return nil
	end

	slot4 = ray.unit
	local instance_name = ray.unit.unit_data(slot3).instance

	if not instance_name then
		return nil
	end

	slot6 = instance_name
	local instance_data = managers.world_instance.get_instance_data_by_name(slot4, managers.world_instance)
end
function InstancePointUnitElement:_get_options()
	slot6 = self._unit
	local _names = managers.world_instance.instance_names_by_script(slot2, managers.world_instance)
	local names = {}
	slot5 = _names

	for _, name in ipairs(self._unit.mission_element_data(slot5).script) do
		slot11 = name

		if managers.world_instance.get_instance_data_by_name(slot9, managers.world_instance).mission_placed then
			slot11 = name

			table.insert(slot9, names)
		end
	end

	return names
end
function InstancePointUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "instance"
	slot11 = self
	local instance_ctrlr, instance_params = self._build_value_combobox(slot4, self, panel, panel_sizer, self._get_options(slot10))
	self._instance_params = instance_params

	return 
end
function InstancePointUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "_set_instance_by_raycast"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end

if not CoreInstanceParamsUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreInstanceParamsUnitElement = slot0
CoreInstanceParamsUnitElement.TYPES = {
	"number",
	"enemy",
	"objective",
	"civilian",
	"enemy_spawn_action",
	"civilian_spawn_state",
	"special_objective_action"
}

if not InstanceParamsUnitElement then
	slot2 = CoreInstanceParamsUnitElement
	slot0 = class(slot1)
end

InstanceParamsUnitElement = slot0
function InstanceParamsUnitElement:init(...)
	slot3 = self

	InstanceParamsUnitElement.super.init(slot2, ...)

	self._hed.params = {}
	slot4 = "params"

	table.insert(, self._save_values)

	return 
end
function InstanceParamsUnitElement:_add_var_dialog()
	slot12 = 0
	slot9 = true
	local var_name = EWS.get_text_from_user(slot2, EWS, Global.frame_panel, "Enter variable name:", "Add variable", "var_", Vector3(slot9, -1, -1))

	if not var_name or var_name == "" then
		return 
	end

	slot4 = self._hed.params

	for _, data in ipairs(slot3) do
		if data.var_name == var_name then
			slot9 = self

			self._add_var_dialog(slot8)

			return 
		end
	end

	slot9 = "OK,CANCEL"
	local dialog = EWS.SingleChoiceDialog(slot3, EWS, self._panel, "Type", "", CoreInstanceParamsUnitElement.TYPES)
	local result = dialog.show_modal(EWS)
	slot6 = dialog
	local type = dialog.get_string_selection(dialog)

	if type == "" then
		return 
	end

	local default_value = nil

	if type == "number" then
		default_value = 0
	elseif type == "enemy" then
		slot8 = managers.enemy
		default_value = managers.enemy.enemy_units(slot7)[1]
	elseif type == "civilian" then
		default_value = SpawnCivilianUnitElement._options[1]
	elseif type == "objective" then
		slot8 = managers.objectives
		default_value = managers.objectives.objectives_by_name(slot7)[1]
	elseif type == "enemy_spawn_action" then
		slot8 = CopActionAct._act_redirects.enemy_spawn
		default_value = clone(slot7)[1]
	elseif type == "civilian_spawn_state" then
		default_value = CopActionAct._act_redirects.civilian_spawn[1]
	elseif type == "special_objective_action" then
		default_value = CopActionAct._act_redirects.SO[1]
	end

	local data = {
		var_name = var_name,
		type = type,
		default_value = default_value
	}
	slot10 = data

	table.insert(slot8, self._hed.params)

	slot10 = data

	self._build_var_panel(slot8, self)

	return 
end
function InstanceParamsUnitElement:_add_var(var_name, type, default_value)
	return 
end
function InstanceParamsUnitElement:_remove_var_name(var_name)
	slot4 = self._hed.params

	for i, data in ipairs(slot3) do
		if data.var_name == var_name then
			slot10 = i

			table.remove(slot8, self._hed.params)

			if self._panels[i] then
				slot10 = i
				local rem_data = table.remove(slot8, self._panels)
				slot10 = rem_data.panel

				rem_data.panel.destroy_children(self._panels)

				slot10 = rem_data.panel

				rem_data.panel.destroy(self._panels)
			end

			slot9 = self._panel

			self._panel.layout(slot8)

			return 
		end
	end

	return 
end
function InstanceParamsUnitElement:_build_var_panel(data)
	self._panels = self._panels or {}
	slot7 = "TAB_TRAVERSAL"
	local panel = EWS.Panel(slot3, EWS, self._panel, "")
	slot6 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = sizer

	panel.set_sizer(EWS, panel)

	slot9 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot12 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "REMOVE", "Remove", CoreEws.image_path(slot11))

	slot14 = "_remove_var_name"
	slot11 = data.var_name

	toolbar.connect(EWS, toolbar, "REMOVE", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot7 = toolbar

	toolbar.realize(EWS)

	slot11 = "EXPAND,LEFT"

	sizer.add(EWS, sizer, toolbar, 0, 1)

	slot11 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, panel, 0, 0)

	if data.type == "number" then
		slot10 = sizer

		self._build_number(slot6, self, data, panel)
	elseif data.type == "enemy" then
		slot10 = sizer
		slot13 = managers.enemy

		self._build_combobox(slot6, self, data, panel, managers.enemy.enemy_units(slot12))
	elseif data.type == "civilian" then
		slot11 = SpawnCivilianUnitElement._options

		self._build_combobox(slot6, self, data, panel, sizer)
	elseif data.type == "objective" then
		slot10 = sizer
		slot13 = managers.objectives

		self._build_combobox(slot6, self, data, panel, managers.objectives.objectives_by_name(slot12))
	elseif data.type == "enemy_spawn_action" then
		slot10 = sizer
		slot13 = CopActionAct._act_redirects.enemy_spawn

		self._build_combobox(slot6, self, data, panel, clone(slot12))
	elseif data.type == "civilian_spawn_state" then
		slot11 = CopActionAct._act_redirects.civilian_spawn

		self._build_combobox(slot6, self, data, panel, sizer)
	elseif data.type == "special_objective_action" then
		slot11 = CopActionAct._act_redirects.SO

		self._build_combobox(slot6, self, data, panel, sizer)
	end

	slot8 = {
		var_name = data.var_name,
		panel = panel
	}

	table.insert(slot6, self._panels)

	slot7 = self._panel

	self._panel.layout(slot6)

	return 
end
function InstanceParamsUnitElement:_build_number(data, panel, sizer)
	local number_params = {
		name_proportions = 1,
		tooltip = "Set a default number variable.",
		floats = 0,
		sizer_proportions = 1,
		ctrlr_proportions = 2,
		name = data.var_name,
		panel = panel,
		sizer = sizer,
		value = data.default_value
	}
	local number = CoreEws.number_controller(slot6)
	slot14 = "_set_default_var_name"

	number.connect(number_params, number, "EVT_COMMAND_TEXT_ENTER", callback(slot11, self, self))

	slot14 = "_set_default_var_name"
	slot11 = {
		ctrlr = number,
		data = data
	}

	number.connect(number_params, number, "EVT_KILL_FOCUS", callback({
		ctrlr = number,
		data = data
	}, self, self))

	return 
end
function InstanceParamsUnitElement:_build_combobox(data, panel, sizer, options)
	slot8 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot6, EWS)
	slot12 = "EXPAND,LEFT"

	sizer.add(EWS, sizer, horizontal_sizer, 1, 1)

	local params = {
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "Select an option from the combobox",
		sorted = true,
		ctrlr_proportions = 2,
		name = data.var_name,
		panel = panel,
		sizer = horizontal_sizer,
		options = options,
		value = data.default_value
	}
	local combobox = CoreEws.combobox(sizer)
	slot16 = "_set_default_var_name"
	slot13 = {
		ctrlr = combobox,
		data = data
	}

	combobox.connect(params, combobox, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot13, self, self))

	slot13 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(params, EWS, panel, "")
	slot16 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "ADD_UNIT_LIST", "Set from list", CoreEws.image_path(self))

	slot18 = "_on_gui_select_name_dialog"
	slot15 = {
		combobox = params,
		data = data
	}

	toolbar.connect(EWS, toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot11 = toolbar

	toolbar.realize(EWS)

	slot15 = "EXPAND,LEFT"

	horizontal_sizer.add(EWS, horizontal_sizer, toolbar, 0, 1)

	return 
end
function InstanceParamsUnitElement:_set_default_var_name(data)
	slot4 = data.ctrlr
	local value = data.ctrlr.get_value(slot3)
	slot6 = value
	data.data.default_value = tonumber(slot5) or value

	return 
end
function InstanceParamsUnitElement:_on_gui_select_name_dialog(params)
	slot6 = params.combobox.options
	local dialog = SelectNameModal.new(slot3, SelectNameModal, "Select name")
	slot5 = dialog

	if dialog.cancelled(SelectNameModal) then
		return 
	end

	slot7 = dialog

	for _, name in ipairs(dialog._selected_item_assets(slot6)) do
		slot11 = name

		CoreEws.change_combobox_value(slot9, params.combobox)

		slot11 = {
			ctrlr = params.combobox.ctrlr,
			data = params.data
		}

		self._set_default_var_name(slot9, self)
	end

	return 
end
function InstanceParamsUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot11 = "world_editor\\add_unit.png"

	toolbar.add_tool(EWS, toolbar, "ADD", "Add variable", CoreEws.image_path(slot10))

	slot13 = "_add_var_dialog"
	slot10 = nil

	toolbar.connect(EWS, toolbar, "ADD", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot6 = toolbar

	toolbar.realize(EWS)

	slot10 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, toolbar, 0, 1)

	slot6 = self._hed.params

	for _, data in ipairs(EWS) do
		slot12 = data

		self._build_var_panel(slot10, self)
	end

	return 
end

if not CoreInstanceSetParamsUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreInstanceSetParamsUnitElement = slot0

if not InstanceSetParamsUnitElement then
	slot2 = CoreInstanceSetParamsUnitElement
	slot0 = class(slot1)
end

InstanceSetParamsUnitElement = slot0
function InstanceSetParamsUnitElement:init(...)
	slot3 = self

	InstanceSetParamsUnitElement.super.init(slot2, ...)

	self._panels = {}
	self._hed.instance = nil
	self._hed.params = {}
	self._hed.apply_on_execute = nil
	slot4 = "instance"

	table.insert(nil, self._save_values)

	slot4 = "params"

	table.insert(nil, self._save_values)

	slot4 = "apply_on_execute"

	table.insert(nil, self._save_values)

	return 
end
function InstanceSetParamsUnitElement:update_selected(t, dt)
	if self._hed.instance then
		slot8 = self._hed.instance

		InstanceEventUnitElement._draw_instance_link(slot4, self, t, dt)
	end

	return 
end
function InstanceSetParamsUnitElement:update_editing(t, dt)
	slot5 = self
	local instance_name = self._instance_name_raycast(slot4)

	if instance_name then
		slot9 = instance_name

		InstanceEventUnitElement._draw_instance_link(slot5, self, t, dt)
	end

	return 
end
function InstanceSetParamsUnitElement:selected()
	slot3 = self

	InstanceEventUnitElement.super.selected(slot2)

	slot3 = self
	local names = self._get_options(slot2)

	if self._instance_params then
		slot5 = names

		CoreEws.update_combobox_options(slot3, self._instance_params)
	end

	slot5 = self._hed.instance

	if not table.contains(slot3, names) then
		self._hed.instance = nil
	end

	if self._instance_params then
		slot5 = self._hed.instance

		CoreEws.change_combobox_value(slot3, self._instance_params)
	end

	return 
end
function InstanceSetParamsUnitElement:on_instance_changed_name(old_name, new_name)
	if old_name == self._hed.instance then
		self._hed.instance = new_name

		if self._instance_params then
			slot6 = self._hed.instance

			CoreEws.change_combobox_value(slot4, self._instance_params)
		end
	end

	return 
end
function InstanceSetParamsUnitElement:on_instance_deleted(name)
	if name == self._hed.instance then
		self._hed.instance = nil
		self._hed.params = {}
		slot4 = self

		self._destroy_params_panels()

		if self._instance_params then
			slot5 = self._hed.instance

			CoreEws.change_combobox_value(slot3, self._instance_params)
		end
	end

	return 
end
function InstanceSetParamsUnitElement:_instance_name_raycast()
	slot4 = {
		ray_type = "body editor",
		skip_instance_check = true,
		mask = 1
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if not ray or not ray.unit then
		return nil
	end

	slot4 = ray.unit
	local instance_name = ray.unit.unit_data(slot3).instance

	if not instance_name then
		return nil
	end

	local instance_data = managers.world_instance.get_instance_data_by_name(slot4, managers.world_instance)
	slot7 = self._unit

	return (instance_data.script == self._unit.mission_element_data(instance_name).script and instance_name) or nil
end
function InstanceSetParamsUnitElement:_set_instance_by_raycast()
	slot3 = self
	local instance_name = self._instance_name_raycast(slot2)

	if instance_name then
		slot5 = instance_name

		self._check_change_instance(slot3, self)

		slot5 = self._hed.instance

		CoreEws.change_combobox_value(slot3, self._instance_params)

		slot4 = self

		self._on_instance_changed(slot3)
	end

	return 
end
function InstanceSetParamsUnitElement:_get_options()
	slot6 = self._unit
	local _names = managers.world_instance.instance_names_by_script(slot2, managers.world_instance)
	local names = {}
	slot5 = _names

	for _, name in ipairs(self._unit.mission_element_data(slot5).script) do
		slot11 = name

		table.insert(slot9, names)
	end

	slot5 = names

	table.sort(slot4)

	return names
end
function InstanceSetParamsUnitElement:_on_gui_change_instance(params)
	slot4 = self
	slot7 = params.ctrlr

	self._check_change_instance(slot3, params.ctrlr.get_value(slot6))

	return 
end
function InstanceSetParamsUnitElement:_check_change_instance(new_instance)

	-- Decompilation error in this vicinity:
	slot5 = new_instance
	local new_folder = managers.world_instance.get_instance_data_by_name(slot3, managers.world_instance).folder
	slot6 = self._hed.instance
	local folder = managers.world_instance.get_instance_data_by_name(managers.world_instance, managers.world_instance).folder

	if new_folder == folder then
		self._hed.instance = new_instance

		return 
	end

	local msg = "Changing instance from " .. self._hed.instance .. " to " .. new_instance .. " will reset variables. Continue?"
	slot11 = "YES_NO,ICON_QUESTION"
	slot16 = 0
	local confirm = EWS.message_box(" to ", EWS, Global.frame_panel, msg, "func_instance_set_params", Vector3(slot13, -1, -1))

	if confirm == "NO" then
		slot9 = self._hed.instance

		CoreEws.change_combobox_value(slot7, self._instance_params)

		return 
	end

	self._hed.params = {}
	self._hed.instance = new_instance

	return 
end
function InstanceSetParamsUnitElement:_on_instance_changed()
	if self._hed.instance then
		slot4 = self._hed.instance
		local params = managers.world_instance.get_instance_params_by_name(slot2, managers.world_instance)
		slot5 = params

		self._build_from_params(managers.world_instance, self)
	end

	return 
end
function InstanceSetParamsUnitElement:_set_var_name(data)
	local value = data.ctrlr.get_value(slot3)
	slot5 = value

	if not tonumber(data.ctrlr) then
	end

	self._hed.params[data.var_name] = value

	return 
end
function InstanceSetParamsUnitElement:_destroy_params_panels()
	slot3 = self._panels

	for _, panel in ipairs(slot2) do
		slot8 = panel

		panel.destroy_children(slot7)

		slot8 = panel

		panel.destroy(slot7)
	end

	self._panels = {}

	return 
end
function InstanceSetParamsUnitElement:_build_from_params(params)
	slot4 = self._panel

	self._panel.freeze(slot3)

	slot4 = self

	self._destroy_params_panels(slot3)

	slot4 = params

	for _, data in ipairs(slot3) do
		slot12 = "TAB_TRAVERSAL"
		local panel = EWS.Panel(slot8, EWS, self._panel, "")
		local sizer = EWS.BoxSizer(EWS, EWS)
		slot12 = sizer

		panel.set_sizer(EWS, panel)

		slot15 = "EXPAND"

		self._panel_sizer.add(EWS, self._panel_sizer, panel, 0, 0)

		slot14 = ""
		local use = EWS.CheckBox(EWS, EWS, panel, "")
		slot13 = "Toggle use of variable on/off"

		use.set_tool_tip(EWS, use)

		slot13 = (self._hed.params[data.var_name] and true) or false

		use.set_value("HORIZONTAL", use)

		slot16 = "EXPAND,RIGHT"

		sizer.add("HORIZONTAL", sizer, use, 0, 4)

		slot15 = "TAB_TRAVERSAL"
		local value_panel = EWS.Panel("HORIZONTAL", EWS, panel, "")
		slot14 = "HORIZONTAL"
		local value_sizer = EWS.BoxSizer(EWS, EWS)
		slot15 = value_sizer

		value_panel.set_sizer(EWS, value_panel)

		slot18 = "EXPAND"

		sizer.add(EWS, sizer, value_panel, 1, 0)

		local value_ctrlr = nil

		if data.type == "number" then
			slot18 = value_sizer
			value_ctrlr = self._build_number(slot14, self, data, value_panel)
		elseif data.type == "enemy" then
			slot18 = value_sizer
			slot21 = managers.enemy
			value_ctrlr = self._build_combobox(slot14, self, data, value_panel, managers.enemy.enemy_units(slot20))
		elseif data.type == "civilian" then
			slot19 = SpawnCivilianUnitElement._options
			value_ctrlr = self._build_combobox(slot14, self, data, value_panel, value_sizer)
		elseif data.type == "objective" then
			slot18 = value_sizer
			slot21 = managers.objectives
			value_ctrlr = self._build_combobox(slot14, self, data, value_panel, managers.objectives.objectives_by_name(slot20))
		elseif data.type == "enemy_spawn_action" then
			slot18 = value_sizer
			slot21 = CopActionAct._act_redirects.enemy_spawn
			value_ctrlr = self._build_combobox(slot14, self, data, value_panel, clone(slot20))
		elseif data.type == "civilian_spawn_state" then
			slot19 = CopActionAct._act_redirects.civilian_spawn
			value_ctrlr = self._build_combobox(slot14, self, data, value_panel, value_sizer)
		elseif data.type == "special_objective_action" then
			slot19 = CopActionAct._act_redirects.SO
			value_ctrlr = self._build_combobox(slot14, self, data, value_panel, value_sizer)
		end

		slot21 = "_on_gui_toggle_use"

		use.connect(slot14, use, "EVT_COMMAND_CHECKBOX_CLICKED", callback({
			ctrlr = use,
			var_name = data.var_name,
			value_panel = value_panel,
			value_ctrlr = value_ctrlr
		}, self, self))

		slot16 = (self._hed.params[data.var_name] and true) or false

		value_panel.set_enabled(slot14, value_panel)

		slot16 = panel

		table.insert(slot14, self._panels)
	end

	slot4 = self._panel

	self._panel.layout(slot3)

	slot4 = self._panel

	self._panel.thaw(slot3)

	return 
end
function InstanceSetParamsUnitElement:_on_gui_toggle_use(params)
	local use = params.ctrlr.get_value(slot3)
	slot6 = use

	params.value_panel.set_enabled(params.ctrlr, params.value_panel)

	local value = params.value_ctrlr

	if use then
		slot7 = {
			ctrlr = params.value_ctrlr,
			var_name = params.var_name
		}

		self._set_var_name(slot5, self)
	else
		self._hed.params[params.var_name] = nil
	end

	return 
end
function InstanceSetParamsUnitElement:_build_number(data, panel, sizer)
	local number_params = {
		name_proportions = 1,
		tooltip = "Set a number variable.",
		floats = 0,
		sizer_proportions = 1,
		ctrlr_proportions = 2,
		name = data.var_name,
		panel = panel,
		sizer = sizer,
		value = self._hed.params[data.var_name] or data.default_value
	}
	local number = CoreEws.number_controller(slot6)
	slot14 = "_set_var_name"

	number.connect(number_params, number, "EVT_COMMAND_TEXT_ENTER", callback(slot11, self, self))

	slot14 = "_set_var_name"
	slot11 = {
		ctrlr = number,
		var_name = data.var_name
	}

	number.connect(number_params, number, "EVT_KILL_FOCUS", callback({
		ctrlr = number,
		var_name = data.var_name
	}, self, self))

	return number
end
function InstanceSetParamsUnitElement:_build_combobox(data, panel, sizer, options)
	local horizontal_sizer = EWS.BoxSizer(slot6, EWS)
	slot12 = "EXPAND,LEFT"

	sizer.add(EWS, sizer, horizontal_sizer, 1, 1)

	local combobox_params = {
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "Select an option from the combobox",
		sorted = true,
		ctrlr_proportions = 2,
		name = data.var_name,
		panel = panel,
		sizer = horizontal_sizer,
		options = options,
		value = self._hed.params[data.var_name] or data.default_value
	}
	local combobox = CoreEws.combobox("HORIZONTAL")
	slot16 = "_set_var_name"

	combobox.connect(combobox_params, combobox, "EVT_COMMAND_COMBOBOX_SELECTED", callback({
		ctrlr = combobox,
		var_name = data.var_name
	}, self, self))

	slot13 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(combobox_params, EWS, panel, "")
	slot16 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "ADD_UNIT_LIST", "Set from list", CoreEws.image_path(self))

	slot18 = "_on_gui_select_name_dialog"
	slot15 = {
		combobox = combobox_params,
		var_name = data.var_name
	}

	toolbar.connect(EWS, toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot11 = toolbar

	toolbar.realize(EWS)

	slot15 = "EXPAND,LEFT"

	horizontal_sizer.add(EWS, horizontal_sizer, toolbar, 0, 1)

	return combobox
end
function InstanceSetParamsUnitElement:_on_gui_select_name_dialog(params)
	slot6 = params.combobox.options
	local dialog = SelectNameModal.new(slot3, SelectNameModal, "Select name")
	slot5 = dialog

	if dialog.cancelled(SelectNameModal) then
		return 
	end

	slot7 = dialog

	for _, name in ipairs(dialog._selected_item_assets(slot6)) do
		slot11 = name

		CoreEws.change_combobox_value(slot9, params.combobox)

		slot11 = {
			ctrlr = params.combobox.ctrlr,
			var_name = params.var_name
		}

		self._set_var_name(slot9, self)
	end

	return 
end
function InstanceSetParamsUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "instance"
	slot11 = self
	local instance_ctrlr, instance_params = self._build_value_combobox(slot4, self, panel, panel_sizer, self._get_options(slot10))
	self._instance_params = instance_params
	slot11 = "If checked, the values will be applied when the element is executed."

	self._build_value_checkbox(panel, self, panel, panel_sizer, "apply_on_execute")

	slot7 = self

	self._on_instance_changed(panel)

	return 
end
function InstanceSetParamsUnitElement:set_element_data(params, ...)
	if params.value == "instance" then
		slot5 = params

		self._on_gui_change_instance(slot3, self)

		slot4 = self

		self._on_instance_changed(slot3)

		return 
	end

	slot5 = params

	InstanceSetParamsUnitElement.super.set_element_data(slot3, self, ...)

	return 
end
function InstanceSetParamsUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "_set_instance_by_raycast"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end

return 
