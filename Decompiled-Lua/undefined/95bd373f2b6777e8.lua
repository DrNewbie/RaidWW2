if not CoreWorldEventUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreWorldEventUnitElement = slot0
function CoreWorldEventUnitElement:init(type, ...)
	slot4 = self

	CoreWorldEventUnitElement.super.init(slot3, ...)

	self._type = type
	self._guis = {}
	self._hed.event_list = {}
	slot5 = "event_list"

	table.insert(, self._save_values)

	return 
end
function CoreWorldEventUnitElement:layer_finished(...)
	slot3 = self

	CoreWorldEventUnitElement.super.layer_finished(slot2, ...)

	return 
end
function CoreWorldEventUnitElement:selected()
	slot3 = self

	InstanceEventUnitElement.super.selected(slot2)

	return 
end
function CoreWorldEventUnitElement:update_selected(t, dt)
	slot5 = self._hed.event_list

	for _, data in ipairs(slot4) do
		slot13 = data.world_name

		self._draw_world_link(slot9, self, t, dt)
	end

	return 
end
function CoreWorldEventUnitElement:update_editing(t, dt)
	return 
end
function CoreWorldEventUnitElement:_draw_world_link(t, dt, world_name)
	slot6 = self
	local r, g, b = self.get_link_color(slot5)

	if self._type == "input" then
		slot14 = world_name
		slot15 = 0.2

		Application.draw_arrow(slot8, Application, self._unit.position(slot11), managers.worldcollection.get_world_position(self._unit, managers.worldcollection), r, g, b)
	else
		slot13 = world_name
		slot13 = self._unit
		slot15 = 0.2

		Application.draw_arrow(slot8, Application, managers.worldcollection.get_world_position(slot11, managers.worldcollection), self._unit.position(managers.worldcollection), r, g, b)
	end

	return 
end
function CoreWorldEventUnitElement:_world_name_raycast()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if not ray or not ray.unit then
		return nil
	end

	local world_name = nil
	slot5 = ray.unit

	if ray.unit.mission_element_data(slot4) then
		slot5 = ray.unit

		if ray.unit.mission_element_data(slot4).element_class == "ElementWorldPoint" then
			slot5 = ray.unit
			world_name = ray.unit.unit_data(slot4).name_id
		end
	end

	return world_name
end
function CoreWorldEventUnitElement:on_world_changed_name(old_name, new_name)
	slot5 = self._hed.event_list

	for _, data in ipairs(slot4) do
		if data.world_name == old_name then
			data.world_name = new_name
		end
	end

	slot5 = self._guis

	for _, data in ipairs(slot4) do
		if data.world_name == old_name then
			data.world_name = new_name
			slot11 = new_name

			data.world_name_ctrlr.set_label(slot9, data.world_name_ctrlr)
		end
	end

	return 
end
function CoreWorldEventUnitElement:on_world_deleted(name)
	slot4 = self._guis
	local clone_guis = clone(slot3)
	slot7 = self._hed.event_list

	for i, event_list_data in ipairs(clone(slot6)) do
		if event_list_data.world_name == name then
			slot11 = event_list_data

			self.remove_entry(slot9, self)
		end
	end

	return 
end
function CoreWorldEventUnitElement:_get_events(world_name)
	if self._type == "input" then
		slot6 = "ElementWorldInput"

		return managers.worldcollection.get_mission_elements_from_script(slot3, managers.worldcollection, world_name)
	else
		slot6 = "ElementWorldOutput"

		return managers.worldcollection.get_mission_elements_from_script(slot3, managers.worldcollection, world_name)
	end

	return 
end
function CoreWorldEventUnitElement:_set_world_by_raycast()
	slot3 = self
	local world_name = self._world_name_raycast(slot2)

	if world_name then
		slot5 = world_name

		self._add_world_by_name(slot3, self)
	end

	return 
end
function CoreWorldEventUnitElement:_add_world_by_name(world_name)
	local world = managers.worldcollection.world_names(slot3)[world_name].world
	local events = self._get_events(managers.worldcollection, self)
	local event_list_data = {
		world_name = world_name,
		event = events[1]
	}
	slot8 = event_list_data

	table.insert(world, self._hed.event_list)

	slot10 = event_list_data

	self._add_world_gui(world, self, world_name, events)

	return 
end
function CoreWorldEventUnitElement:_add_world_gui(world_name, events, event_list_data)
	local panel = self._panel
	local panel_sizer = self._panel_sizer
	slot9 = "HORIZONTAL"
	local h_sizer = EWS.BoxSizer(slot7, EWS)
	slot13 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, h_sizer, 0, 1)

	slot13 = "ALIGN_LEFT"
	local world_name_ctrlr = EWS.StaticText(EWS, EWS, panel, "" .. world_name, 0)
	slot14 = "LEFT,ALIGN_CENTER_VERTICAL"

	h_sizer.add(EWS, h_sizer, world_name_ctrlr, 2, 1)

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
		world_name_ctrlr = world_name_ctrlr,
		world_name = world_name,
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
function CoreWorldEventUnitElement:_on_gui_set_event_data(event_list_data)
	slot5 = event_list_data
	local guis = self._get_guis_by_event_list_data(slot3, self)
	slot5 = guis.event
	local event = guis.event.get_value(self)
	event_list_data.event = event

	return 
end
function CoreWorldEventUnitElement:_get_guis_by_event_list_data(event_list_data)
	slot6 = self._hed.event_list

	for i, entry in pairs(clone(slot5)) do
		if entry == event_list_data then
			return self._guis[i]
		end
	end

	return 
end
function CoreWorldEventUnitElement:remove_entry(event_list_data)
	local function _remove_guis(guis)
		if guis then
			slot3 = guis.world_name_ctrlr

			guis.world_name_ctrlr.destroy(slot2)

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
function CoreWorldEventUnitElement:destroy_panel(...)
	slot3 = self

	CoreWorldEventUnitElement.super.destroy_panel(slot2, ...)

	return 
end
function CoreWorldEventUnitElement:_on_gui_select_world_list()
	local settings = {
		list_style = "LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING"
	}
	local names = managers.worldcollection.world_name_ids(slot3)
	slot8 = settings
	local dialog = SelectNameModal.new(managers.worldcollection, SelectNameModal, "Select worlds", names)
	slot6 = dialog

	if dialog.cancelled(SelectNameModal) then
		return 
	end

	slot8 = dialog

	for _, instance_name in ipairs(dialog._selected_item_assets(slot7)) do
		slot12 = instance_name

		self._add_world_by_name(slot10, self)
	end

	return 
end
function CoreWorldEventUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "TB_FLAT,TB_NODIVIDER"
	local btn_toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot11 = "world_editor\\unit_by_name_list.png"

	btn_toolbar.add_tool(EWS, btn_toolbar, "SELECT_UNIT_LIST", "Select unit from unit list", CoreEws.image_path(slot10))

	slot13 = "_on_gui_select_world_list"
	slot10 = nil

	btn_toolbar.connect(EWS, btn_toolbar, "SELECT_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot6 = btn_toolbar

	btn_toolbar.realize(EWS)

	slot10 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, btn_toolbar, 0, 1)

	slot8 = self._hed.event_list

	for _, data in pairs(clone(btn_toolbar)) do
		local world = managers.worldcollection.world_names(slot10)[data.world_name].world
		slot13 = world
		local events = self._get_events(managers.worldcollection, self)
		slot16 = data

		self._add_world_gui(self, self, data.world_name, events)
	end

	return 
end
function CoreWorldEventUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "_set_world_by_raycast"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end

if not CoreWorldInputEventUnitElement then
	slot2 = CoreWorldEventUnitElement
	slot0 = class(slot1)
end

CoreWorldInputEventUnitElement = slot0
function CoreWorldInputEventUnitElement:init(...)
	slot4 = "input"

	CoreWorldInputEventUnitElement.super.init(slot2, self, ...)

	return 
end

if not CoreWorldOutputEventUnitElement then
	slot2 = CoreWorldEventUnitElement
	slot0 = class(slot1)
end

CoreWorldOutputEventUnitElement = slot0
function CoreWorldOutputEventUnitElement:init(...)
	slot4 = "output"

	CoreWorldOutputEventUnitElement.super.init(slot2, self, ...)

	return 
end

if not CoreWorldInputUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreWorldInputUnitElement = slot0
function CoreWorldInputUnitElement:init(...)
	slot3 = self

	CoreWorldInputUnitElement.super.init(slot2, ...)

	self._hed.event = "none"
	slot4 = "event"

	table.insert("none", self._save_values)

	return 
end
function CoreWorldInputUnitElement:_build_panel(panel, panel_sizer)
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

if not CoreWorldOutputUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreWorldOutputUnitElement = slot0
function CoreWorldOutputUnitElement:init(...)
	slot3 = self

	CoreWorldOutputUnitElement.super.init(slot2, ...)

	self._hed.event = "none"
	slot4 = "event"

	table.insert("none", self._save_values)

	return 
end
function CoreWorldOutputUnitElement:_build_panel(panel, panel_sizer)
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

if not CoreWorldSpawnerElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreWorldSpawnerElement = slot0
function CoreWorldSpawnerElement:init(unit)
	slot5 = unit

	CoreWorldSpawnerElement.super.init(slot3, self)

	self._hed.world = ""
	slot5 = "state"

	table.insert("", self._save_values)

	slot5 = "world"

	table.insert("", self._save_values)

	return 
end
function CoreWorldSpawnerElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local worlds = managers.worldcollection.get_all_worlds(slot4)
	slot7 = ""

	table.insert(managers.worldcollection, worlds)

	slot6 = worlds

	table.sort(managers.worldcollection)

	slot11 = "Select a world from the combobox"

	self._build_value_combobox(managers.worldcollection, self, panel, panel_sizer, "world", worlds)

	slot7 = "The world that will be loaded"

	self._add_help_text(managers.worldcollection, self)

	return 
end
function CoreWorldSpawnerElement:set_element_data(...)
	slot3 = self

	CoreWorldSpawnerElement.super.set_element_data(slot2, ...)

	slot3 = self

	self._change_world(slot2)

	return 
end
function CoreWorldSpawnerElement:post_init()
	slot3 = self

	CoreWorldSpawnerElement.super.post_init(slot2)

	slot4 = self._unit.unit_data(slot5).name_id
	slot7 = self._unit

	managers.worldcollection.register_editor_position(slot2, managers.worldcollection, self._unit.position(self._unit))

	slot3 = self

	self._change_world(slot2)

	return 
end
function CoreWorldSpawnerElement:_change_world()
	if self._low_poly_unit then
		slot4 = self._low_poly_unit

		World.delete_unit(slot2, World)

		self._low_poly_unit = nil
	end

	slot4 = self._hed.world
	local world_meta_data = managers.worldcollection.get_world_meta_data(slot2, managers.worldcollection)

	if world_meta_data then
		if world_meta_data.low_poly and world_meta_data.low_poly ~= "" then
			slot5 = self._unit.position(slot6)
			slot8 = self._unit
			self._low_poly_unit = CoreUnit.safe_spawn_unit(slot3, world_meta_data.low_poly, self._unit.rotation(self._unit))
			slot7 = "rp_worlds"
			slot6 = self._low_poly_unit

			self._unit.link(slot3, self._unit, Idstring(self._unit.rotation))
		end

		slot7 = self._unit
		slot6 = self._hed.world

		managers.worldcollection.register_editor_name(slot3, managers.worldcollection, self._unit.unit_data(slot6).name_id)
	else
		self._hed.world = nil
		slot7 = self._unit
		slot5 = self._unit.unit_data(slot6).name_id

		managers.worldcollection.register_editor_name(nil, managers.worldcollection)

		if self._low_poly_unit then
			slot5 = self._low_poly_unit

			World.delete_unit(slot3, World)

			self._low_poly_unit = nil
		end
	end

	return 
end
function CoreWorldSpawnerElement:destroy()
	slot3 = self._low_poly_unit

	if alive(slot2) then
		slot4 = self._low_poly_unit

		World.delete_unit(slot2, World)

		self._low_poly_unit = nil
	end

	slot3 = self

	CoreWorldSpawnerElement.super.destroy(slot2)

	return 
end
function CoreWorldSpawnerElement:set_disabled()
	if self._low_poly_unit then
		slot4 = false

		self._low_poly_unit.set_visible(slot2, self._low_poly_unit)
	end

	slot3 = self

	CoreWorldSpawnerElement.super.set_disabled(slot2)

	return 
end
function CoreWorldSpawnerElement:set_enabled()
	if self._low_poly_unit then
		slot4 = true

		self._low_poly_unit.set_visible(slot2, self._low_poly_unit)
	end

	slot3 = self

	CoreWorldSpawnerElement.super.set_enabled(slot2)

	return 
end
function CoreWorldSpawnerElement:on_name_changed(old_name, new_name)
	slot8 = new_name

	Application.debug(slot4, Application, "[CoreWorldSpawnerElement:on_name_changed]", old_name)

	slot6 = "Mission"
	slot6 = {
		"func_world_input_event",
		"func_world_output_event",
		"func_world_point",
		"func_world_set_params"
	}
	local mission_units = managers.editor.layer(slot4, managers.editor).get_created_unit_by_pattern(slot4, managers.editor.layer(slot4, managers.editor))
	slot6 = mission_units

	for _, mission_unit in ipairs(managers.editor.layer(slot4, managers.editor)) do
		slot11 = mission_unit

		if mission_unit.mission_element(slot10).on_world_changed_name then
			slot11 = mission_unit
			slot13 = new_name

			mission_unit.mission_element(slot10).on_world_changed_name(slot10, mission_unit.mission_element(slot10), old_name)
		else
			slot11 = mission_unit

			if mission_unit.mission_element_data(slot10).world == old_name then
				self._hed.world = new_name
			end
		end
	end

	slot8 = new_name

	managers.worldcollection.on_editor_changed_name(slot5, managers.worldcollection, old_name)

	return 
end
function CoreWorldSpawnerElement:on_world_deleted()
	slot4 = "[CoreWorldSpawnerElement:on_world_deleted()]"

	Application.debug(slot2, Application)

	local editor_name = self._unit.unit_data(slot2).name_id
	slot5 = "Mission"
	slot5 = {
		"func_world_input_event",
		"func_world_output_event",
		"func_world_set_params"
	}
	local mission_units = managers.editor.layer(self._unit, managers.editor).get_created_unit_by_pattern(self._unit, managers.editor.layer(self._unit, managers.editor))
	slot5 = mission_units

	for _, mission_unit in ipairs(managers.editor.layer(self._unit, managers.editor)) do
		slot10 = mission_unit

		if mission_unit.mission_element(slot9).on_world_deleted then
			slot10 = mission_unit
			slot11 = editor_name

			mission_unit.mission_element(slot9).on_world_deleted(slot9, mission_unit.mission_element(slot9))
		end
	end

	slot6 = editor_name

	managers.worldcollection.unregister_editor_name(slot4, managers.worldcollection)

	return 
end

return 
