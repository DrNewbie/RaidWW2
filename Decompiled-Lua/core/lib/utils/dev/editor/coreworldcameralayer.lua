-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreWorldCameraLayer"

core.module(slot1, core)

slot3 = "CoreLayer"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not WorldCameraLayer then
	slot2 = CoreLayer.Layer
	slot0 = class(slot1)
end

WorldCameraLayer = slot0
function WorldCameraLayer:init(owner)
	slot6 = "world_camera"

	WorldCameraLayer.super.init(slot3, self, owner)

	slot4 = Overlay
	slot8 = 1
	self._workspace = Overlay.newgui(slot3).create_screen_workspace(slot3, Overlay.newgui(slot3), 0, 0, 1)
	slot4 = self._workspace
	slot4 = self._workspace.panel(slot3)
	slot7 = "core/guis/core_world_camera"
	self._gui = self._workspace.panel(slot3).gui(slot3, Idstring(0))
	self._gui_visible = nil
	slot5 = false

	self.set_gui_visible(slot3, self)

	self._look_through_camera = false
	self._current_time = 0
	self._time_precision = 10000

	return 
end
function WorldCameraLayer:get_layer_name()
	return "WorldCamera"
end
function WorldCameraLayer:load(world_holder, offset)
	slot8 = offset

	world_holder.create_world(slot4, world_holder, "world", self._save_name)

	slot5 = self

	self.update_camera_list(slot4)

	slot5 = self

	self.update_sequence_list(slot4)

	return 
end
function WorldCameraLayer:save(save_params)
	local file_name = "world_cameras"
	local t = {
		single_data_block = true,
		entry = self._save_name,
		data = {
			file = file_name
		}
	}
	slot7 = t.data

	self._add_project_save_data(slot5, self)

	slot7 = t

	managers.editor.add_save_data(slot5, managers.editor)

	slot7 = save_params.dir .. "\\" .. file_name .. ".world_cameras"
	local file = managers.editor._open_file(slot5, managers.editor)
	slot8 = file

	managers.worldcamera.save(managers.editor, managers.worldcamera)

	slot8 = file

	SystemFS.close(managers.editor, SystemFS)

	return 
end
function WorldCameraLayer:toggle_show_framing_gui(layer_toolbar, event)
	slot8 = event
	local visible = layer_toolbar.tool_state(slot4, event.get_id(slot7))
	self._forced_show_framing_gui = visible
	slot6 = self._workspace
	slot7 = 0.5

	self._workspace.panel(layer_toolbar).set_alpha(layer_toolbar, self._workspace.panel(layer_toolbar))

	slot7 = visible

	self.set_gui_visible(layer_toolbar, self)

	return 
end
function WorldCameraLayer:set_gui_visible(visible, external_forced)
	if self._gui_visible ~= visible or self._forced_show_framing_gui then
		if visible then
		else
			slot5 = self._workspace

			self._workspace.hide(slot4)
		end

		self._gui_visible = visible
	end

	return 
end
function WorldCameraLayer:update(t, dt)
	if not managers.worldcamera._current_world_camera and not self._look_through_camera and self._current_world_camera then
		slot5 = self._current_world_camera

		self._current_world_camera.debug_draw_editor(slot4)

		if self._current_point then
			slot10 = 0

			Application.draw_sphere(slot4, Application, self._current_point.pos, 40, 0, 1)
		end
	end

	if self._current_world_camera then
		slot7 = "fov"
		local fov = self._current_world_camera.value_at_time(slot4, self._current_world_camera, self._current_time)
		slot8 = "roll"
		local roll = self._current_world_camera.value_at_time(self._current_world_camera, self._current_world_camera, self._current_time)
		slot9 = "near_dof"
		local near_dof = self._current_world_camera.value_at_time(self._current_world_camera, self._current_world_camera, self._current_time)
		slot10 = "far_dof"
		local far_dof = self._current_world_camera.value_at_time(self._current_world_camera, self._current_world_camera, self._current_time)
		local dof_padding = self._current_world_camera.dof_padding(self._current_world_camera)
		slot10 = self._current_world_camera
		local dof_clamp = self._current_world_camera.dof_clamp(self._current_world_camera)

		if self._look_through_camera then
			slot12 = self._current_time
			local pos, t_pos = self._current_world_camera.positions_at_time(slot10, self._current_world_camera)

			if pos and t_pos then
				slot15 = t_pos - pos
				slot14 = roll
				local rot1 = Rotation(slot12, t_pos - pos.normalized(slot14))
				slot16 = t_pos
				slot19 = rot1
				local rot = Rotation.look_at(t_pos - pos.normalized(slot14), Rotation, pos, rot1.z(slot18))
				slot17 = rot

				managers.editor.set_camera(Rotation, managers.editor, pos)
			end

			slot14 = fov

			managers.editor.set_camera_fov(slot12, managers.editor)

			slot17 = dof_clamp

			managers.worldcamera.update_dof_values(slot12, managers.worldcamera, near_dof, far_dof, dof_padding)
		end

		slot11 = self._current_fov_text
		slot15 = fov

		self._current_fov_text.set_value(slot10, string.format(slot13, "%.0f"))

		slot11 = self._current_roll_text
		slot15 = roll

		self._current_roll_text.set_value(slot10, string.format(slot13, "%.0f"))

		slot11 = self._current_near_dof_text
		slot15 = near_dof

		self._current_near_dof_text.set_value(slot10, string.format(slot13, "%.0f"))

		slot11 = self._current_far_dof_text
		slot15 = far_dof

		self._current_far_dof_text.set_value(slot10, string.format(slot13, "%.0f"))
	end

	return 
end
function WorldCameraLayer:build_panel(notebook)
	slot5 = "WorldCameraLayer:build_panel"

	cat_print(slot3, "editor")

	slot7 = "TAB_TRAVERSAL"
	self._ews_panel = EWS.Panel(slot3, EWS, notebook, "")
	slot5 = "HORIZONTAL"
	self._main_sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self._main_sizer

	self._ews_panel.set_sizer(slot3, self._ews_panel)

	slot5 = "VERTICAL"
	self._sizer = EWS.BoxSizer(slot3, EWS)
	slot7 = "TB_FLAT,TB_NODIVIDER"
	local layer_toolbar = EWS.ToolBar(slot3, EWS, self._ews_panel, "")
	slot10 = "toolbar\\find_16x16.png"

	layer_toolbar.add_check_tool(EWS, layer_toolbar, "WC_FORCE_FRAMING_GUI", "Show framing gui", CoreEws.image_path(slot9))

	slot7 = self._look_through_camera

	layer_toolbar.set_tool_state(EWS, layer_toolbar, "WC_FORCE_FRAMING_GUI")

	slot12 = "toggle_show_framing_gui"
	slot9 = layer_toolbar

	layer_toolbar.connect(EWS, layer_toolbar, "WC_FORCE_FRAMING_GUI", "EVT_COMMAND_MENU_SELECTED", callback("Look through camera", self, self))

	slot5 = layer_toolbar

	layer_toolbar.realize(EWS)

	slot9 = "EXPAND"

	self._sizer.add(EWS, self._sizer, layer_toolbar, 0, 0)

	slot8 = "Cameras"
	local cameras_sizer = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "HORIZONTAL")
	slot9 = "TB_FLAT,TB_VERTICAL,TB_NODIVIDER"
	local cam_toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot12 = "toolbar\\new_16x16.png"

	cam_toolbar.add_tool(EWS, cam_toolbar, "WC_CREATE_NEW", "Create New", CoreEws.image_path(self))

	slot14 = "create_new"

	cam_toolbar.connect(EWS, cam_toolbar, "WC_CREATE_NEW", "EVT_COMMAND_MENU_SELECTED", callback("Create a new world camera", self, self))

	slot12 = "toolbar\\delete_16x16.png"

	cam_toolbar.add_tool(EWS, cam_toolbar, "WC_DELETE", "Delete", CoreEws.image_path(self._camera_list))

	slot14 = "delete_camera"

	cam_toolbar.connect(EWS, cam_toolbar, "WC_DELETE", "EVT_COMMAND_MENU_SELECTED", callback("Delete selected world camera", self, self))

	slot12 = "sequencer\\play_from_start_16x16.png"

	cam_toolbar.add_tool(EWS, cam_toolbar, "WC_TEST", "Test", CoreEws.image_path(self._camera_list))

	slot14 = "test_camera"

	cam_toolbar.connect(EWS, cam_toolbar, "WC_TEST", "EVT_COMMAND_MENU_SELECTED", callback("Test selected world camera", self, self))

	slot12 = "sequencer\\stop_16x16.png"

	cam_toolbar.add_tool(EWS, cam_toolbar, "WC_STOP", "Stop", CoreEws.image_path(self._camera_list))

	slot14 = "stop_camera"
	slot11 = self._camera_list

	cam_toolbar.connect(EWS, cam_toolbar, "WC_STOP", "EVT_COMMAND_MENU_SELECTED", callback("Stop current test world camera", self, self))

	slot7 = cam_toolbar

	cam_toolbar.realize(EWS)

	slot11 = "EXPAND"

	cameras_sizer.add(EWS, cameras_sizer, cam_toolbar, 0, 0)

	slot10 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	self._camera_list = EWS.ListBox(EWS, EWS, self._ews_panel, "camera_layer_cameras")
	slot11 = "EXPAND"

	cameras_sizer.add(EWS, cameras_sizer, self._camera_list, 1, 0)

	slot11 = "EXPAND"

	self._sizer.add(EWS, self._sizer, cameras_sizer, 0, 0)

	slot10 = "Settings"
	local edit_sizer = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "VERTICAL")
	slot9 = "HORIZONTAL"
	local in_out_sizer = EWS.BoxSizer(EWS, EWS)
	slot12 = "In"
	local in_sizer = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "VERTICAL")
	slot14 = "CB_DROPDOWN,CB_READONLY"
	self._in_acc = EWS.ComboBox(EWS, EWS, self._ews_panel, "", "")
	slot10 = {
		"ease",
		"linear",
		"fast"
	}

	for _, name in ipairs(EWS) do
		slot16 = name

		self._in_acc.append(slot14, self._in_acc)
	end

	slot11 = "linear"

	self._in_acc.set_value(slot9, self._in_acc)

	slot16 = "change_acc"
	slot13 = "in"

	self._in_acc.connect(slot9, self._in_acc, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot13, self, self))

	slot14 = "EXPAND"

	in_sizer.add(slot9, in_sizer, self._in_acc, 1, 0)

	slot14 = "EXPAND"

	in_out_sizer.add(slot9, in_out_sizer, in_sizer, 1, 0)

	slot13 = "Out"
	local out_sizer = EWS.StaticBoxSizer(slot9, EWS, self._ews_panel, "VERTICAL")
	slot15 = "CB_DROPDOWN,CB_READONLY"
	self._out_acc = EWS.ComboBox(EWS, EWS, self._ews_panel, "", "")
	slot11 = {
		"ease",
		"linear",
		"fast"
	}

	for _, name in ipairs(EWS) do
		slot17 = name

		self._out_acc.append(slot15, self._out_acc)
	end

	slot12 = "linear"

	self._out_acc.set_value(slot10, self._out_acc)

	slot14 = "out"

	self._out_acc.connect(slot10, self._out_acc, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot14, self, self))

	slot15 = "EXPAND"

	out_sizer.add(slot10, out_sizer, self._out_acc, 1, 0)

	slot15 = "EXPAND"

	in_out_sizer.add(slot10, in_out_sizer, out_sizer, 1, 0)

	slot15 = "EXPAND"

	edit_sizer.add(slot10, edit_sizer, in_out_sizer, 0, 0)

	slot16 = "set_duration"
	slot16 = "set_duration"
	self._duration_params = {
		value = 2.5,
		name = "Camera Duration [sec]:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Specifies the camera lenght in seconds",
		min = 0,
		floats = 2,
		panel = self._ews_panel,
		sizer = edit_sizer,
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(0, self, self)
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(0, self, self)
			}
		}
	}
	slot11 = self._duration_params

	CoreEws.number_controller()

	slot16 = "set_delay"
	slot16 = "set_delay"
	self._delay_params = {
		value = 0,
		name = "End Delay [sec]:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Specifies the delay time after camera has reached the end position, in seconds",
		min = 0,
		floats = 2,
		panel = self._ews_panel,
		sizer = edit_sizer,
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(0, self, self)
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(0, self, self)
			}
		}
	}

	CoreEws.number_controller()

	slot12 = managers.worldcamera
	slot16 = "set_dof_padding"
	slot16 = "set_dof_padding"
	self._dof_paddding_params = {
		name = "Dof Padding [cm]:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "The fade distance from max dof to no dof",
		min = 0,
		floats = 0,
		panel = self._ews_panel,
		sizer = edit_sizer,
		value = managers.worldcamera.default_dof_padding(self._delay_params),
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(0, self, self)
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(0, self, self)
			}
		}
	}

	CoreEws.number_controller()

	slot12 = managers.worldcamera
	slot16 = "set_dof_clamp"
	slot16 = "set_dof_clamp"
	self._dof_clamp_params = {
		name_proportions = 1,
		name = "Dof Amount [0-1]:",
		ctrlr_proportions = 1,
		tooltip = "A value to specify how much dof it should have",
		min = 0,
		floats = 2,
		max = 1,
		panel = self._ews_panel,
		sizer = edit_sizer,
		value = managers.worldcamera.default_dof_clamp(self._dof_paddding_params),
		events = {
			{
				event = "EVT_COMMAND_TEXT_ENTER",
				callback = callback(0, self, self)
			},
			{
				event = "EVT_KILL_FOCUS",
				callback = callback(0, self, self)
			}
		}
	}
	slot11 = self._dof_clamp_params

	CoreEws.number_controller()

	slot15 = "EXPAND"

	self._sizer.add(, self._sizer, edit_sizer, 0, 0)

	slot14 = "Points"
	local points_sizer = EWS.StaticBoxSizer(, EWS, self._ews_panel, "HORIZONTAL")
	slot15 = "TB_FLAT,TB_VERTICAL,TB_NODIVIDER"
	local point_toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot18 = "toolbar\\new_16x16.png"

	point_toolbar.add_tool(EWS, point_toolbar, "WC_ADD", "Add", CoreEws.image_path("change_acc"))

	slot20 = "add_point"

	point_toolbar.connect(EWS, point_toolbar, "WC_ADD", "EVT_COMMAND_MENU_SELECTED", callback("Add point", self, self))

	slot18 = "sequencer\\loop_16x16.png"

	point_toolbar.add_tool(EWS, point_toolbar, "WC_MOVE", "Move", CoreEws.image_path(nil))

	slot20 = "move_point"

	point_toolbar.connect(EWS, point_toolbar, "WC_MOVE", "EVT_COMMAND_MENU_SELECTED", callback("Move point", self, self))

	slot18 = "toolbar\\delete_16x16.png"

	point_toolbar.add_tool(EWS, point_toolbar, "WC_DELETE_POINT", "Delete", CoreEws.image_path(nil))

	slot20 = "delete_point"

	point_toolbar.connect(EWS, point_toolbar, "WC_DELETE_POINT", "EVT_COMMAND_MENU_SELECTED", callback("Delete point", self, self))

	slot18 = "toolbar\\find_16x16.png"

	point_toolbar.add_tool(EWS, point_toolbar, "WC_GOTO_POINT", "Goto", CoreEws.image_path(nil))

	slot20 = "goto_point"
	slot17 = nil

	point_toolbar.connect(EWS, point_toolbar, "WC_GOTO_POINT", "EVT_COMMAND_MENU_SELECTED", callback("Goto point", self, self))

	slot13 = point_toolbar

	point_toolbar.realize(EWS)

	slot17 = "EXPAND"

	points_sizer.add(EWS, points_sizer, point_toolbar, 0, 0)

	self._point_list = EWS.ListBox(EWS, EWS, self._ews_panel, "camera_layer_points")
	slot19 = "select_point"
	slot16 = nil

	self._point_list.connect(EWS, self._point_list, "EVT_COMMAND_LISTBOX_SELECTED", callback("LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT", self, self))

	slot17 = "EXPAND"

	points_sizer.add(EWS, points_sizer, self._point_list, 1, 0)
	self._sizer.add(EWS, self._sizer, points_sizer, 0, 0)

	slot16 = "Keys"
	local keys_sizer = EWS.StaticBoxSizer(EWS, EWS, self._ews_panel, "VERTICAL")
	slot15 = "HORIZONTAL"
	local time_sizer = EWS.BoxSizer(EWS, EWS)
	slot22 = ""
	slot19 = "ALIGN_CENTER_VERTICAL,RIGHT"

	time_sizer.add(EWS, time_sizer, EWS.StaticText("EXPAND", EWS, self._ews_panel, "Time: ", ""), 0, 2)

	slot19 = ""
	self._time_text = EWS.StaticText(EWS, EWS, self._ews_panel, "0", "")
	slot19 = "ALIGN_CENTER_VERTICAL,RIGHT"

	time_sizer.add(EWS, time_sizer, self._time_text, 0, 50)

	slot22 = ""
	slot19 = "ALIGN_CENTER_VERTICAL,RIGHT"

	time_sizer.add(EWS, time_sizer, EWS.StaticText(0, EWS, self._ews_panel, "Fov: ", ""), 0, 2)

	slot19 = managers.worldcamera
	slot19 = ""
	self._current_fov_text = EWS.StaticText(EWS, EWS, self._ews_panel, managers.worldcamera.default_fov(2), "")
	slot19 = "ALIGN_CENTER_VERTICAL,RIGHT"

	time_sizer.add(EWS, time_sizer, self._current_fov_text, 0, 50)

	slot22 = ""
	slot19 = "ALIGN_CENTER_VERTICAL,RIGHT"

	time_sizer.add(EWS, time_sizer, EWS.StaticText(0, EWS, self._ews_panel, "Roll: ", ""), 0, 2)

	slot19 = ""
	self._current_roll_text = EWS.StaticText(EWS, EWS, self._ews_panel, 0, "")
	slot19 = "ALIGN_CENTER_VERTICAL,RIGHT"

	time_sizer.add(EWS, time_sizer, self._current_roll_text, 0, 50)

	slot19 = "EXPAND,BOTTOM"

	keys_sizer.add(EWS, keys_sizer, time_sizer, 0, 5)

	slot16 = "HORIZONTAL"
	local dof_text_sizer = EWS.BoxSizer(EWS, EWS)
	slot23 = ""
	slot20 = "ALIGN_CENTER_VERTICAL,RIGHT"

	dof_text_sizer.add(EWS, dof_text_sizer, EWS.StaticText(5, EWS, self._ews_panel, "Near Dof: ", ""), 0, 2)

	slot20 = managers.worldcamera
	slot20 = ""
	self._current_near_dof_text = EWS.StaticText(EWS, EWS, self._ews_panel, managers.worldcamera.default_near_dof(2), "")
	slot20 = "ALIGN_CENTER_VERTICAL,RIGHT"

	dof_text_sizer.add(EWS, dof_text_sizer, self._current_near_dof_text, 0, 40)

	slot23 = ""
	slot20 = "ALIGN_CENTER_VERTICAL,RIGHT"

	dof_text_sizer.add(EWS, dof_text_sizer, EWS.StaticText(0, EWS, self._ews_panel, "Far Dof: ", ""), 0, 2)

	slot20 = managers.worldcamera
	slot20 = ""
	self._current_far_dof_text = EWS.StaticText(EWS, EWS, self._ews_panel, managers.worldcamera.default_near_dof(2), "")
	slot20 = "ALIGN_CENTER_VERTICAL,RIGHT"

	dof_text_sizer.add(EWS, dof_text_sizer, self._current_far_dof_text, 0, 40)

	slot20 = "EXPAND,BOTTOM"

	keys_sizer.add(EWS, keys_sizer, dof_text_sizer, 0, 5)

	slot22 = ""
	local time = EWS.Slider(EWS, EWS, self._ews_panel, self._current_time, 0, self._time_precision, "")
	slot21 = "ALIGN_RIGHT,EXPAND,BOTTOM"

	keys_sizer.add(EWS, keys_sizer, time, 0, 5)

	slot23 = "set_time"

	time.connect(EWS, time, "EVT_SCROLL_CHANGED", callback(5, self, self))

	slot23 = "set_time"
	slot20 = {
		slider = time,
		text = self._time_text
	}

	time.connect(EWS, time, "EVT_SCROLL_THUMBTRACK", callback({
		slider = time,
		text = self._time_text
	}, self, self))

	slot20 = "TB_FLAT,TB_HORIZONTAL,TB_NODIVIDER"
	self._keys_toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot22 = "toolbar\\find_16x16.png"

	self._keys_toolbar.add_check_tool(EWS, self._keys_toolbar, "WC_LOOK_THROUGH_CAMERA", "Look through camera", CoreEws.image_path(self._time_text))

	slot19 = self._look_through_camera

	self._keys_toolbar.set_tool_state(EWS, self._keys_toolbar, "WC_LOOK_THROUGH_CAMERA")

	slot24 = "look_through_camera"

	self._keys_toolbar.connect(EWS, self._keys_toolbar, "WC_LOOK_THROUGH_CAMERA", "EVT_COMMAND_MENU_SELECTED", callback("Look through camera", self, self))

	slot22 = "toolbar\\new_16x16.png"

	self._keys_toolbar.add_tool(EWS, self._keys_toolbar, "WC_ADD_KEY", "Add key", CoreEws.image_path(nil))

	slot24 = "add_key"

	self._keys_toolbar.connect(EWS, self._keys_toolbar, "WC_ADD_KEY", "EVT_COMMAND_MENU_SELECTED", callback("Add key", self, self))

	slot22 = "toolbar\\delete_16x16.png"

	self._keys_toolbar.add_tool(EWS, self._keys_toolbar, "WC_DELETE_KEY", "Delete key", CoreEws.image_path(nil))

	slot24 = "delete_key"

	self._keys_toolbar.connect(EWS, self._keys_toolbar, "WC_DELETE_KEY", "EVT_COMMAND_MENU_SELECTED", callback("Delete key", self, self))

	slot22 = "world_editor\\wc_previous_key_16x16.png"

	self._keys_toolbar.add_tool(EWS, self._keys_toolbar, "WC_PREVIOUS_KEY", "Previous key", CoreEws.image_path(nil))

	slot24 = "prev_key"

	self._keys_toolbar.connect(EWS, self._keys_toolbar, "WC_PREVIOUS_KEY", "EVT_COMMAND_MENU_SELECTED", callback("Previous key", self, self))

	slot22 = "world_editor\\wc_next_key_16x16.png"

	self._keys_toolbar.add_tool(EWS, self._keys_toolbar, "WC_NEXT_KEY", "Next key", CoreEws.image_path(nil))

	slot24 = "next_key"
	slot21 = nil

	self._keys_toolbar.connect(EWS, self._keys_toolbar, "WC_NEXT_KEY", "EVT_COMMAND_MENU_SELECTED", callback("Next key", self, self))

	slot17 = self._keys_toolbar

	self._keys_toolbar.realize(EWS)

	slot21 = "EXPAND"

	keys_sizer.add(EWS, keys_sizer, self._keys_toolbar, 0, 0)

	slot18 = "HORIZONTAL"
	local select_key_sizer = EWS.BoxSizer(EWS, EWS)
	slot25 = ""
	slot22 = "ALIGN_CENTER_VERTICAL,RIGHT"

	select_key_sizer.add(EWS, select_key_sizer, EWS.StaticText(0, EWS, self._ews_panel, "Select Key: ", ""), 1, 2)

	slot22 = "CB_DROPDOWN,CB_READONLY"
	self._keys = EWS.ComboBox(EWS, EWS, self._ews_panel, "", "")
	slot24 = "select_key"
	slot21 = nil

	self._keys.connect(EWS, self._keys, "EVT_COMMAND_COMBOBOX_SELECTED", callback("", self, self))

	slot22 = "EXPAND,RIGHT"

	select_key_sizer.add(EWS, select_key_sizer, self._keys, 1, 5)

	slot25 = ""
	slot22 = "ALIGN_CENTER_VERTICAL"

	select_key_sizer.add(EWS, select_key_sizer, EWS.StaticText(1, EWS, self._ews_panel, "Key Time: ", ""), 1, 0)

	slot22 = "TE_CENTRE,TE_PROCESS_ENTER"
	local key_time = EWS.TextCtrl(EWS, EWS, self._ews_panel, "0", "")
	slot23 = "ALIGN_RIGHT,EXPAND"

	select_key_sizer.add(EWS, select_key_sizer, key_time, 1, 0)

	slot25 = "verify_number"

	key_time.connect(EWS, key_time, "EVT_CHAR", callback(0, nil, _G))

	slot25 = "on_key_time"
	slot22 = key_time

	key_time.connect(EWS, key_time, "EVT_COMMAND_TEXT_ENTER", callback(key_time, self, self))

	slot23 = "EXPAND"

	keys_sizer.add(EWS, keys_sizer, select_key_sizer, 1, 0)

	slot20 = "HORIZONTAL"
	local key_fov_sizer = EWS.BoxSizer(EWS, EWS)
	slot27 = ""
	slot24 = "ALIGN_CENTER_VERTICAL"

	key_fov_sizer.add(EWS, key_fov_sizer, EWS.StaticText(0, EWS, self._ews_panel, "Fov: ", ""), 1, 0)

	slot24 = managers.worldcamera
	slot26 = managers.worldcamera
	slot26 = managers.worldcamera.viewport("Fov: ")
	slot26 = ""
	local key_fov = EWS.Slider(EWS, EWS, self._ews_panel, managers.worldcamera.default_fov(0), 1, managers.worldcamera.viewport("Fov: ").reference_fov("Fov: "), "")
	slot25 = "ALIGN_RIGHT,EXPAND"

	key_fov_sizer.add(EWS, key_fov_sizer, key_fov, 4, 0)

	slot27 = "on_key_fov"

	key_fov.connect(EWS, key_fov, "EVT_SCROLL_CHANGED", callback(0, self, self))

	slot27 = "on_key_fov"

	key_fov.connect(EWS, key_fov, "EVT_SCROLL_THUMBTRACK", callback(key_fov, self, self))

	slot25 = managers.worldcamera
	slot25 = "ALIGN_CENTRE"
	local key_fov_text = EWS.StaticText(EWS, EWS, self._ews_panel, managers.worldcamera.default_fov(key_fov), "")
	slot26 = "ALIGN_CENTER_VERTICAL,RIGHT"

	key_fov_sizer.add(EWS, key_fov_sizer, key_fov_text, 0, 5)

	slot26 = "EXPAND"

	keys_sizer.add(EWS, keys_sizer, key_fov_sizer, 0, 0)

	slot23 = "HORIZONTAL"
	local key_near_dof_sizer = EWS.BoxSizer(EWS, EWS)
	slot30 = ""
	slot27 = "ALIGN_CENTER_VERTICAL"

	key_near_dof_sizer.add(EWS, key_near_dof_sizer, EWS.StaticText(0, EWS, self._ews_panel, "Near Dof: ", ""), 1, 0)

	slot27 = managers.worldcamera
	slot27 = "TE_CENTRE"
	local key_near_dof = EWS.TextCtrl(EWS, EWS, self._ews_panel, managers.worldcamera.default_near_dof(0), "")
	slot28 = "ALIGN_RIGHT,EXPAND"

	key_near_dof_sizer.add(EWS, key_near_dof_sizer, key_near_dof, 3, 0)

	slot30 = "verify_number"

	key_near_dof.connect(EWS, key_near_dof, "EVT_CHAR", callback(0, nil, _G))

	slot30 = "on_key_near_dof"
	slot27 = key_near_dof

	key_near_dof.connect(EWS, key_near_dof, "EVT_COMMAND_TEXT_UPDATED", callback(key_near_dof, self, self))

	slot28 = "EXPAND"

	keys_sizer.add(EWS, keys_sizer, key_near_dof_sizer, 0, 0)

	slot25 = "HORIZONTAL"
	local key_far_dof_sizer = EWS.BoxSizer(EWS, EWS)
	slot32 = ""
	slot29 = "ALIGN_CENTER_VERTICAL"

	key_far_dof_sizer.add(EWS, key_far_dof_sizer, EWS.StaticText(0, EWS, self._ews_panel, "Far Dof: ", ""), 1, 0)

	slot29 = managers.worldcamera
	slot29 = "TE_CENTRE"
	local key_far_dof = EWS.TextCtrl(EWS, EWS, self._ews_panel, managers.worldcamera.default_far_dof(0), "")
	slot30 = "ALIGN_RIGHT,EXPAND"

	key_far_dof_sizer.add(EWS, key_far_dof_sizer, key_far_dof, 3, 0)

	slot32 = "verify_number"

	key_far_dof.connect(EWS, key_far_dof, "EVT_CHAR", callback(0, nil, _G))

	slot32 = "on_key_far_dof"
	slot29 = key_far_dof

	key_far_dof.connect(EWS, key_far_dof, "EVT_COMMAND_TEXT_UPDATED", callback(key_far_dof, self, self))

	slot30 = "EXPAND"

	keys_sizer.add(EWS, keys_sizer, key_far_dof_sizer, 0, 0)

	local roll_params = {
		name_proportions = 1,
		name = "Roll:",
		value = 0,
		tooltip = "An angle value specifying the roll",
		floats = 0,
		ctrlr_proportions = 3,
		panel = self._ews_panel,
		sizer = keys_sizer
	}
	slot31 = "on_set_roll"
	slot31 = "on_set_roll"
	roll_params.events = {
		{
			event = "EVT_COMMAND_TEXT_ENTER",
			callback = callback(0, self, self)
		},
		{
			event = "EVT_KILL_FOCUS",
			callback = callback(0, self, self)
		}
	}
	slot27 = roll_params

	CoreEws.number_controller()

	self._key_types = {
		time = key_time,
		fov = key_fov,
		fov_text = key_fov_text,
		near_dof = key_near_dof,
		far_dof = key_far_dof,
		roll = roll_params
	}
	slot28 = false

	self._keys_toolbar.set_enabled(, self._keys_toolbar)

	slot28 = false

	self._keys.set_enabled(, self._keys)

	slot28 = false

	self.key_types_set_enabled(, self)

	slot31 = "EXPAND"

	self._sizer.add(, self._sizer, keys_sizer, 0, 0)

	slot27 = self

	self.build_sequence()

	self._time = time
	slot33 = "select_camera"
	slot30 = nil

	self._camera_list.connect(, self._camera_list, "EVT_COMMAND_LISTBOX_SELECTED", callback(0, self, self))

	slot31 = "EXPAND"

	self._main_sizer.add(, self._main_sizer, self._sizer, 1, 0)

	return self._ews_panel
end
function WorldCameraLayer:build_sequence()
	slot6 = "Sequences"
	local sequences_sizer = EWS.StaticBoxSizer(slot2, EWS, self._ews_panel, "VERTICAL")
	slot5 = "HORIZONTAL"
	local sequence_sizer = EWS.BoxSizer(EWS, EWS)
	slot8 = "TB_FLAT,TB_VERTICAL,TB_NODIVIDER"
	local sequence_toolbar = EWS.ToolBar(EWS, EWS, self._ews_panel, "")
	slot11 = "toolbar\\new_16x16.png"

	sequence_toolbar.add_tool(EWS, sequence_toolbar, "WC_NEW_SEQUENCE", "Create New", CoreEws.image_path(slot10))

	slot13 = "on_create_new_sequence"

	sequence_toolbar.connect(EWS, sequence_toolbar, "WC_NEW_SEQUENCE", "EVT_COMMAND_MENU_SELECTED", callback("Create a new world camera sequence", self, self))

	slot11 = "toolbar\\delete_16x16.png"

	sequence_toolbar.add_tool(EWS, sequence_toolbar, "WC_DELETE_SEQUENCE", "Delete", CoreEws.image_path(self._camera_list))

	slot13 = "on_delete_sequence"

	sequence_toolbar.connect(EWS, sequence_toolbar, "WC_DELETE_SEQUENCE", "EVT_COMMAND_MENU_SELECTED", callback("Delete selected world camera sequence", self, self))

	slot11 = "sequencer\\play_from_start_16x16.png"

	sequence_toolbar.add_tool(EWS, sequence_toolbar, "WC_TEST_SEQUENCE", "Test", CoreEws.image_path(self._camera_list))

	slot13 = "on_test_sequence"

	sequence_toolbar.connect(EWS, sequence_toolbar, "WC_TEST_SEQUENCE", "EVT_COMMAND_MENU_SELECTED", callback("Test selected world camera sequence", self, self))

	slot11 = "sequencer\\stop_16x16.png"

	sequence_toolbar.add_tool(EWS, sequence_toolbar, "WC_STOP_SEQUENCE", "Stop", CoreEws.image_path(self._camera_list))

	slot13 = "on_stop_sequence"
	slot10 = self._camera_list

	sequence_toolbar.connect(EWS, sequence_toolbar, "WC_STOP_SEQUENCE", "EVT_COMMAND_MENU_SELECTED", callback("Stop current test world camera sequence", self, self))

	slot6 = sequence_toolbar

	sequence_toolbar.realize(EWS)

	slot10 = "EXPAND"

	sequence_sizer.add(EWS, sequence_sizer, sequence_toolbar, 0, 0)

	slot9 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	self._sequence_list = EWS.ListBox(EWS, EWS, self._ews_panel, "camera_layer_sequence_list")
	slot10 = "EXPAND"

	sequence_sizer.add(EWS, sequence_sizer, self._sequence_list, 1, 0)

	slot12 = "on_select_sequence"
	slot9 = nil

	self._sequence_list.connect(EWS, self._sequence_list, "EVT_COMMAND_LISTBOX_SELECTED", callback(0, self, self))

	slot10 = "EXPAND"

	sequences_sizer.add(EWS, sequences_sizer, sequence_sizer, 0, 0)

	slot7 = "VERTICAL"
	local cameras_sizer = EWS.BoxSizer(EWS, EWS)
	slot8 = "HORIZONTAL"
	local camera_sequence_lists_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	self._availible_sequence_camera_list = EWS.ListBox(EWS, EWS, self._ews_panel, "camera_layer_available_sequence_camera")
	slot12 = "EXPAND"

	camera_sequence_lists_sizer.add(EWS, camera_sequence_lists_sizer, self._availible_sequence_camera_list, 1, 0)

	slot14 = "on_add_camera_to_sequence"
	slot11 = nil

	self._availible_sequence_camera_list.connect(EWS, self._availible_sequence_camera_list, "EVT_COMMAND_LISTBOX_DOUBLECLICKED", callback(0, self, self))

	slot11 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB"
	self._sequence_camera_list = EWS.ListBox(EWS, EWS, self._ews_panel, "camera_layer_sequence_camera_list")
	slot12 = "EXPAND"

	camera_sequence_lists_sizer.add(EWS, camera_sequence_lists_sizer, self._sequence_camera_list, 1, 0)

	slot14 = "on_select_sequence_camera"

	self._sequence_camera_list.connect(EWS, self._sequence_camera_list, "EVT_COMMAND_LISTBOX_SELECTED", callback(0, self, self))

	slot14 = "on_remove_camera_from_sequence"
	slot11 = nil

	self._sequence_camera_list.connect(EWS, self._sequence_camera_list, "EVT_COMMAND_LISTBOX_DOUBLECLICKED", callback(nil, self, self))

	slot11 = "SP_VERTICAL"
	local spin = EWS.SpinButton(EWS, EWS, self._ews_panel, "")
	slot13 = "EXPAND"

	camera_sequence_lists_sizer.add(EWS, camera_sequence_lists_sizer, spin, 0, 0)

	slot15 = "on_move_camera_in_sequence"

	spin.connect(EWS, spin, "EVT_SCROLL_LINEUP", callback(0, self, self))

	slot15 = "on_move_camera_in_sequence"
	slot12 = 1

	spin.connect(EWS, spin, "EVT_SCROLL_LINEDOWN", callback(-1, self, self))

	slot13 = "EXPAND"

	cameras_sizer.add(EWS, cameras_sizer, camera_sequence_lists_sizer, 0, 0)

	slot10 = "HORIZONTAL"
	local camera_sequence_start_sizer = EWS.BoxSizer(EWS, EWS)
	slot17 = ""
	slot14 = "ALIGN_CENTER_VERTICAL"

	camera_sequence_start_sizer.add(EWS, camera_sequence_start_sizer, EWS.StaticText(0, EWS, self._ews_panel, "Start: ", ""), 1, 0)

	slot14 = "TE_CENTRE,TE_PROCESS_ENTER"
	local sequence_camera_start = EWS.TextCtrl(EWS, EWS, self._ews_panel, 0, "")
	slot15 = "ALIGN_RIGHT,EXPAND"

	camera_sequence_start_sizer.add(EWS, camera_sequence_start_sizer, sequence_camera_start, 3, 0)

	slot17 = "verify_number"

	sequence_camera_start.connect(EWS, sequence_camera_start, "EVT_CHAR", callback(0, nil, _G))

	slot17 = "on_sequence_camera_start"

	sequence_camera_start.connect(EWS, sequence_camera_start, "EVT_COMMAND_TEXT_ENTER", callback(sequence_camera_start, self, self))

	slot17 = "on_sequence_camera_start"
	slot14 = sequence_camera_start

	sequence_camera_start.connect(EWS, sequence_camera_start, "EVT_KILL_FOCUS", callback(sequence_camera_start, self, self))

	slot15 = "EXPAND"

	cameras_sizer.add(EWS, cameras_sizer, camera_sequence_start_sizer, 0, 0)

	slot12 = "HORIZONTAL"
	local camera_sequence_stop_sizer = EWS.BoxSizer(EWS, EWS)
	slot19 = ""
	slot16 = "ALIGN_CENTER_VERTICAL"

	camera_sequence_stop_sizer.add(EWS, camera_sequence_stop_sizer, EWS.StaticText(0, EWS, self._ews_panel, "Stop: ", ""), 1, 0)

	slot16 = "TE_CENTRE,TE_PROCESS_ENTER"
	local sequence_camera_stop = EWS.TextCtrl(EWS, EWS, self._ews_panel, 0, "")
	slot17 = "ALIGN_RIGHT,EXPAND"

	camera_sequence_stop_sizer.add(EWS, camera_sequence_stop_sizer, sequence_camera_stop, 3, 0)

	slot19 = "verify_number"

	sequence_camera_stop.connect(EWS, sequence_camera_stop, "EVT_CHAR", callback(0, nil, _G))

	slot19 = "on_sequence_camera_stop"

	sequence_camera_stop.connect(EWS, sequence_camera_stop, "EVT_COMMAND_TEXT_ENTER", callback(sequence_camera_stop, self, self))

	slot19 = "on_sequence_camera_stop"
	slot16 = sequence_camera_stop

	sequence_camera_stop.connect(EWS, sequence_camera_stop, "EVT_KILL_FOCUS", callback(sequence_camera_stop, self, self))

	slot17 = "EXPAND"

	cameras_sizer.add(EWS, cameras_sizer, camera_sequence_stop_sizer, 0, 0)

	self._camera_sequence_settings = {
		start = sequence_camera_start,
		stop = sequence_camera_stop
	}
	slot17 = "EXPAND"

	sequences_sizer.add(EWS, sequences_sizer, cameras_sizer, 0, 0)

	slot17 = "EXPAND"

	self._sizer.add(EWS, self._sizer, sequences_sizer, 0, 0)

	return 
end
function WorldCameraLayer:select_camera()
	slot3 = self
	local name = self.selected_camera(slot2)
	self._current_point = nil

	if name then
		slot5 = name
		self._current_world_camera = managers.worldcamera.world_camera(slot3, managers.worldcamera)
		slot4 = self._duration_params
		slot7 = self._current_world_camera

		CoreEws.change_entered_number(slot3, self._current_world_camera.duration(slot6))

		slot4 = self._delay_params
		slot7 = self._current_world_camera

		CoreEws.change_entered_number(slot3, self._current_world_camera.delay(slot6))

		slot4 = self._dof_paddding_params
		slot7 = self._current_world_camera

		CoreEws.change_entered_number(slot3, self._current_world_camera.dof_padding(slot6))

		slot4 = self._dof_clamp_params
		slot7 = self._current_world_camera

		CoreEws.change_entered_number(slot3, self._current_world_camera.dof_clamp(slot6))

		slot4 = self._point_list

		self._point_list.clear(slot3)

		slot6 = self._current_world_camera

		for i, pos in ipairs(self._current_world_camera.get_points(self._current_world_camera.dof_clamp)) do
			slot10 = i

			self._point_list.append(slot8, self._point_list)
		end

		slot4 = self._in_acc
		slot7 = self._current_world_camera

		self._in_acc.set_value(slot3, self._current_world_camera.in_acc_string(slot6))

		slot4 = self._out_acc
		slot7 = self._current_world_camera

		self._out_acc.set_value(slot3, self._current_world_camera.out_acc_string(slot6))

		slot5 = true

		self._keys_toolbar.set_enabled(slot3, self._keys_toolbar)

		slot5 = true

		self._keys.set_enabled(slot3, self._keys)

		slot5 = true

		self.key_types_set_enabled(slot3, self)

		slot4 = self

		self.populate_keys(slot3)
	end

	return 
end
function WorldCameraLayer:create_new()
	slot12 = 0
	slot9 = true
	local name = EWS.get_text_from_user(slot2, EWS, Global.frame_panel, "Enter name for the new camera:", "Create Camera", "new_camera", Vector3(slot9, -1, -1))

	if name and name ~= "" then
		slot4 = managers.worldcamera

		if managers.worldcamera.all_world_cameras(slot3)[name] then
			slot4 = self

			self.create_new(slot3)
		else
			slot5 = name

			managers.worldcamera.create_world_camera(slot3, managers.worldcamera)
			self.update_camera_list(slot3)

			slot5 = self._camera_list

			for i = 0, self._camera_list.nr_items(self) - 1, 1 do
				slot9 = i

				if self._camera_list.get_string(slot7, self._camera_list) == name then
					slot9 = i

					self._camera_list.select_index(slot7, self._camera_list)
				end
			end

			slot4 = self

			self.select_camera(slot3)
		end
	end

	return 
end
function WorldCameraLayer:delete_camera()
	slot3 = self
	local name = self.selected_camera(slot2)

	if name then
		slot8 = "YES_NO,ICON_QUESTION"
		slot13 = 0
		local confirm = EWS.message_box(slot3, EWS, Global.frame_panel, "Delete camera " .. name .. "?", "Worldcamera", Vector3(slot10, -1, -1))

		if confirm == "NO" then
			return 
		end

		slot6 = name

		managers.worldcamera.remove_world_camera(slot4, managers.worldcamera)

		slot5 = self

		self.update_camera_list(slot4)

		self._current_world_camera = nil
		self._current_point = nil
		slot5 = self._point_list

		self._point_list.clear(slot4)

		slot6 = "linear"

		self._in_acc.set_value(slot4, self._in_acc)

		slot6 = "linear"

		self._out_acc.set_value(slot4, self._out_acc)

		slot6 = false

		self._keys_toolbar.set_enabled(slot4, self._keys_toolbar)

		slot6 = false

		self._keys.set_enabled(slot4, self._keys)

		slot6 = false

		self.key_types_set_enabled(slot4, self)

		slot5 = managers.editor
		slot8 = managers.editor

		managers.editor.set_camera_fov(slot4, managers.editor.default_camera_fov(slot7))

		slot6 = 0

		managers.editor.set_camera_roll(slot4, managers.editor)
	end

	return 
end
function WorldCameraLayer:test_camera()
	slot3 = self
	local name = self.selected_camera(slot2)

	if name then
		slot5 = false

		managers.editor.sound_check_object_active(slot3, managers.editor)

		slot5 = name
		slot10 = "test_done"
		self._test_done_callback = managers.worldcamera.add_world_camera_done_callback(slot3, managers.worldcamera, callback(slot7, self, self))
		slot5 = name

		managers.worldcamera.play_world_camera(slot3, managers.worldcamera)
	end

	return 
end
function WorldCameraLayer:test_done()
	slot3 = self

	self.force_editor_state(slot2)

	slot4 = true

	managers.editor.sound_check_object_active(slot2, managers.editor)

	if self._look_through_camera then
	end

	return 
end
function WorldCameraLayer:stop_camera()
	slot3 = managers.worldcamera

	managers.worldcamera.stop_world_camera(slot2)

	slot3 = self

	self.force_editor_state(slot2)

	return 
end
function WorldCameraLayer:select_point()
	local point = self.selected_point(slot2)
	slot4 = self
	local name = self.selected_camera(self)

	if point and name then
		slot6 = name
		slot6 = point
		self._current_point = managers.worldcamera.world_camera(slot4, managers.worldcamera).get_point(slot4, managers.worldcamera.world_camera(slot4, managers.worldcamera))
	end

	return 
end
function WorldCameraLayer:add_point()
	slot3 = self
	local name = self.selected_camera(slot2)

	if name then
		local cam = managers.editor._vp.camera(slot3)
		slot6 = name
		slot9 = cam

		managers.worldcamera.world_camera(managers.editor._vp, managers.worldcamera).add_point(managers.editor._vp, managers.worldcamera.world_camera(managers.editor._vp, managers.worldcamera), cam.rotation(cam))

		slot5 = self._point_list

		self._point_list.clear(managers.editor._vp)

		slot8 = name
		slot7 = managers.worldcamera.world_camera(cam.position(slot7), managers.worldcamera)

		for i, point in ipairs(managers.worldcamera.world_camera(cam.position(slot7), managers.worldcamera).get_points(cam.position(slot7))) do
			slot11 = i

			self._point_list.append(slot9, self._point_list)
		end
	end

	return 
end
function WorldCameraLayer:move_point()
	local point = self.selected_point(slot2)
	slot4 = self
	local name = self.selected_camera(self)

	if point and name then
		local cam = managers.editor._vp.camera(slot4)
		slot7 = name
		slot8 = cam.position(slot9)
		slot11 = cam

		managers.worldcamera.world_camera(managers.editor._vp, managers.worldcamera).move_point(managers.editor._vp, managers.worldcamera.world_camera(managers.editor._vp, managers.worldcamera), point, cam.rotation(cam))
	end

	slot5 = self

	self.select_point(slot4)

	return 
end
function WorldCameraLayer:delete_point()
	local point = self.selected_point(slot2)
	slot4 = self
	local name = self.selected_camera(self)

	if point and name then
		slot6 = name

		managers.worldcamera.world_camera(slot4, managers.worldcamera).delete_point(slot4, managers.worldcamera.world_camera(slot4, managers.worldcamera))

		self._current_point = nil
		slot5 = self._point_list

		self._point_list.clear(slot4)

		slot8 = name
		slot7 = managers.worldcamera.world_camera(point, managers.worldcamera)

		for i, point in ipairs(managers.worldcamera.world_camera(point, managers.worldcamera).get_points(point)) do
			slot11 = i

			self._point_list.append(slot9, self._point_list)
		end
	end

	return 
end
function WorldCameraLayer:goto_point()
	local point = self.selected_point(slot2)
	slot4 = self
	local name = self.selected_camera(self)

	if point and name then
		slot6 = name
		slot6 = point
		local p = managers.worldcamera.world_camera(slot4, managers.worldcamera).get_point(slot4, managers.worldcamera.world_camera(slot4, managers.worldcamera))
		slot11 = 1
		local rot = Rotation(managers.worldcamera.world_camera(slot4, managers.worldcamera), Vector3(slot8, 0, 0))
		slot9 = rot

		managers.editor.set_camera(p.t_pos - p.pos, managers.editor, p.pos)
	end

	return 
end
function WorldCameraLayer:change_acc(type)
	slot4 = self
	local name = self.selected_camera(slot3)

	if name then
		if type == "in" then
			slot6 = name
			slot5 = managers.worldcamera.world_camera(slot4, managers.worldcamera)
			slot8 = self._in_acc

			managers.worldcamera.world_camera(slot4, managers.worldcamera).set_in_acc(slot4, self._in_acc.get_value(slot7))
		elseif type == "out" then
			slot6 = name
			slot5 = managers.worldcamera.world_camera(slot4, managers.worldcamera)
			slot8 = self._out_acc

			managers.worldcamera.world_camera(slot4, managers.worldcamera).set_out_acc(slot4, self._out_acc.get_value(slot7))
		end
	end

	return 
end
function WorldCameraLayer:set_duration(params)
	slot4 = self
	local name = self.selected_camera(slot3)

	if name then
		slot6 = name
		slot6 = params.value

		managers.worldcamera.world_camera(slot4, managers.worldcamera).set_duration(slot4, managers.worldcamera.world_camera(slot4, managers.worldcamera))
	end

	return 
end
function WorldCameraLayer:set_delay(params)
	slot4 = self
	local name = self.selected_camera(slot3)

	if name then
		slot6 = name
		slot6 = params.value

		managers.worldcamera.world_camera(slot4, managers.worldcamera).set_delay(slot4, managers.worldcamera.world_camera(slot4, managers.worldcamera))
	end

	return 
end
function WorldCameraLayer:set_dof_padding(params)
	slot4 = self
	local name = self.selected_camera(slot3)

	if name then
		slot6 = name
		slot6 = params.value

		managers.worldcamera.world_camera(slot4, managers.worldcamera).set_dof_padding(slot4, managers.worldcamera.world_camera(slot4, managers.worldcamera))
	end

	return 
end
function WorldCameraLayer:set_dof_clamp(params)
	slot4 = self
	local name = self.selected_camera(slot3)

	if name then
		slot6 = name
		slot6 = params.value

		managers.worldcamera.world_camera(slot4, managers.worldcamera).set_dof_clamp(slot4, managers.worldcamera.world_camera(slot4, managers.worldcamera))
	end

	return 
end
function WorldCameraLayer:update_camera_list()
	slot3 = self._camera_list

	self._camera_list.clear(slot2)

	slot3 = self._availible_sequence_camera_list

	self._availible_sequence_camera_list.clear(slot2)

	slot5 = managers.worldcamera

	for name, _ in pairs(managers.worldcamera.all_world_cameras(slot4)) do
		slot9 = name

		self._camera_list.append(slot7, self._camera_list)

		slot9 = name

		self._availible_sequence_camera_list.append(slot7, self._availible_sequence_camera_list)
	end

	return 
end
function WorldCameraLayer:selected_camera()
	slot3 = self._camera_list
	local index = self._camera_list.selected_index(slot2)

	if index ~= -1 then
		slot5 = index

		return self._camera_list.get_string(slot3, self._camera_list)
	end

	return nil
end
function WorldCameraLayer:selected_world_camera()
	slot3 = self._camera_list
	local index = self._camera_list.selected_index(slot2)

	if index ~= -1 then
		slot4 = managers.worldcamera
		slot8 = index

		return managers.worldcamera.world_camera(slot3, self._camera_list.get_string(slot6, self._camera_list))
	end

	return nil
end
function WorldCameraLayer:selected_point()
	slot3 = self._point_list
	local index = self._point_list.selected_index(slot2)

	if index ~= -1 then
		slot7 = index

		return tonumber(self._point_list.get_string(slot5, self._point_list))
	end

	return nil
end
function WorldCameraLayer:look_through_camera(data, event)
	slot5 = self._keys_toolbar
	slot8 = event
	self._look_through_camera = self._keys_toolbar.tool_state(slot4, event.get_id(slot7))

	if not self._look_through_camera then
		slot5 = managers.editor
		slot8 = managers.editor

		managers.editor.set_camera_fov(slot4, managers.editor.default_camera_fov(slot7))

		slot6 = 0

		managers.editor.set_camera_roll(slot4, managers.editor)

		slot5 = managers.worldcamera

		managers.worldcamera.stop_dof(slot4)
	elseif self._current_world_camera then
	end

	return 
end
function WorldCameraLayer:set_time(data)
	slot4 = data.slider
	self._current_time = data.slider.get_value(slot3) / self._time_precision
	local floats = math.log10(self._time_precision)
	slot5 = data.text
	slot9 = self._current_time

	data.text.set_value(self._time_precision, string.format(slot7, "%." .. floats .. "f"))

	return 
end
function WorldCameraLayer:add_key()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot5 = self._current_time
		local index = camera.add_key(slot3, camera)
		slot6 = index

		self.populate_keys(camera, self)
	end

	return 
end
function WorldCameraLayer:delete_key()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot6 = self._keys
		local index = tonumber(self._keys.get_value(slot5))

		if index == 1 then
			slot6 = "Won't delete key 1"

			managers.editor.output_info(slot4, managers.editor)

			return 
		end

		slot5 = camera
		slot10 = self._keys

		camera.delete_key(slot4, tonumber(self._keys.get_value(slot9)))
	end

	slot4 = self

	self.populate_keys(slot3)

	return 
end
function WorldCameraLayer:select_key()
	slot3 = self
	slot8 = self._keys

	self.set_key(slot2, tonumber(self._keys.get_value(slot7)))

	return 
end
function WorldCameraLayer:on_key_time()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot6 = self._keys
		local old_index = tonumber(self._keys.get_value(slot5))
		slot6 = old_index
		slot11 = self._key_types.time
		local new_index = camera.move_key(self._keys.get_value, camera, tonumber(self._key_types.time.get_value(slot10)))
		slot7 = new_index

		self.populate_keys(camera, self)
	end

	return 
end
function WorldCameraLayer:on_key_fov()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot9 = self._keys
		local key = camera.key(slot3, tonumber(self._keys.get_value(slot8)))
		slot5 = self._key_types.fov
		key.fov = self._key_types.fov.get_value(camera)
		slot5 = self._key_types.fov_text
		slot8 = self._key_types.fov

		self._key_types.fov_text.set_value(camera, self._key_types.fov.get_value(self._keys.get_value))
	end

	return 
end
function WorldCameraLayer:on_key_near_dof()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot9 = self._keys
		local key = camera.key(slot3, tonumber(self._keys.get_value(slot8)))
		slot5 = self._key_types.near_dof
		local near_dof = self._key_types.near_dof.get_value(camera)

		if near_dof == "" then
			near_dof = 0
		end

		key.near_dof = near_dof
	end

	return 
end
function WorldCameraLayer:on_key_far_dof()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot9 = self._keys
		local key = camera.key(slot3, tonumber(self._keys.get_value(slot8)))
		slot5 = self._key_types.far_dof
		local far_dof = self._key_types.far_dof.get_value(camera)

		if far_dof == "" then
			far_dof = 0
		end

		key.far_dof = far_dof
	end

	return 
end
function WorldCameraLayer:on_set_roll()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot4 = camera
		slot9 = self._keys
		local key = camera.key(slot3, tonumber(self._keys.get_value(slot8)))
		local roll = self._key_types.roll.value
		key.roll = roll
	end

	return 
end
function WorldCameraLayer:set_near_dof()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot8 = "editor_all"
		slot6 = "body editor"
		local ray = managers.editor.select_unit_by_raycast(slot3, managers.editor, managers.slot.get_mask(slot6, managers.slot))

		if ray and ray.position then
			slot6 = managers.editor
			slot6 = managers.editor.camera(slot5)
			local dist = ray.position - managers.editor.camera(slot5).position(slot5).length(managers.editor.camera(slot5).position(slot5))
			slot6 = self._key_types.near_dof
			slot9 = dist

			self._key_types.near_dof.set_value(ray.position - managers.editor.camera(slot5).position(slot5), math.round(slot8))
		end
	end

	return 
end
function WorldCameraLayer:set_far_dof()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot8 = "editor_all"
		slot6 = "body editor"
		local ray = managers.editor.select_unit_by_raycast(slot3, managers.editor, managers.slot.get_mask(slot6, managers.slot))

		if ray and ray.position then
			slot6 = managers.editor
			slot6 = managers.editor.camera(slot5)
			local dist = ray.position - managers.editor.camera(slot5).position(slot5).length(managers.editor.camera(slot5).position(slot5))
			slot6 = self._key_types.far_dof
			slot9 = dist

			self._key_types.far_dof.set_value(ray.position - managers.editor.camera(slot5).position(slot5), math.round(slot8))
		end
	end

	return 
end
function WorldCameraLayer:populate_keys(index)
	slot4 = self._keys

	self._keys.clear(slot3)

	slot4 = self
	local camera = self.selected_world_camera(slot3)

	if camera then
		slot7 = camera

		for i, key in ipairs(camera.keys(slot6)) do
			slot11 = i

			self._keys.append(slot9, self._keys)
		end
	end

	index = index or 1
	slot6 = index
	local key = camera.key(slot4, camera)
	local time = key.time
	local fov = key.fov
	local near_dof = key.near_dof
	local far_dof = key.far_dof
	local roll = key.roll
	slot12 = index or 1

	self._keys.set_value(slot10, self._keys)

	slot16 = roll

	self.set_key_values(slot10, self, time, fov, near_dof, far_dof)

	return 
end
function WorldCameraLayer:set_key(index)
	slot4 = self
	local camera = self.selected_world_camera(slot3)

	if camera then
		slot6 = index
		local key = camera.key(slot4, camera)
		local time = key.time
		local fov = key.fov
		local near_dof = key.near_dof
		local far_dof = key.far_dof
		local roll = key.roll
		slot12 = key.time * self._time_precision

		self._time.set_value(slot10, self._time)

		slot12 = index

		self._keys.set_value(slot10, self._keys)

		slot12 = {
			slider = self._time,
			text = self._time_text
		}

		self.set_time(slot10, self)

		slot16 = roll

		self.set_key_values(slot10, self, time, fov, near_dof, far_dof)
	end

	return 
end
function WorldCameraLayer:set_key_values(time, fov, near_dof, far_dof, roll)
	slot8 = self._key_types

	for _, ctrl in pairs(slot7) do
		slot14 = false

		ctrl.number_ctrlr or ctrl.set_enabled(slot12, ctrl.number_ctrlr or ctrl)
	end

	if fov then
		slot9 = true

		self._key_types.fov.set_enabled(slot7, self._key_types.fov)

		slot9 = fov

		self._key_types.fov.set_value(slot7, self._key_types.fov)

		slot9 = true

		self._key_types.fov_text.set_enabled(slot7, self._key_types.fov_text)

		slot9 = fov

		self._key_types.fov_text.set_value(slot7, self._key_types.fov_text)
	end

	if near_dof then
		slot9 = true

		self._key_types.near_dof.set_enabled(slot7, self._key_types.near_dof)

		slot9 = near_dof

		self._key_types.near_dof.change_value(slot7, self._key_types.near_dof)
	end

	if far_dof then
		slot9 = true

		self._key_types.far_dof.set_enabled(slot7, self._key_types.far_dof)

		slot9 = far_dof

		self._key_types.far_dof.change_value(slot7, self._key_types.far_dof)
	end

	if roll then
		slot9 = true

		self._key_types.roll.number_ctrlr.set_enabled(slot7, self._key_types.roll.number_ctrlr)

		slot9 = roll

		CoreEws.change_entered_number(slot7, self._key_types.roll)
	end

	if time then
		slot9 = true

		self._key_types.time.set_enabled(slot7, self._key_types.time)

		local floats = math.log10(slot7)
		slot9 = self._key_types.time
		slot13 = time

		self._key_types.time.change_value(self._time_precision, string.format(slot11, "%." .. floats .. "f"))
	end

	return 
end
function WorldCameraLayer:next_key()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot5 = self._current_time
		local index = camera.next_key(slot3, camera)
		slot6 = index

		self.set_key(camera, self)
	end

	return 
end
function WorldCameraLayer:prev_key()
	slot3 = self
	local camera = self.selected_world_camera(slot2)

	if camera then
		slot6 = true
		local index = camera.prev_key(slot3, camera, self._current_time)
		slot6 = index

		self.set_key(camera, self)
	end

	return 
end
function WorldCameraLayer:key_types_set_enabled(enabled)
	slot4 = self._key_types

	for _, ctrl in pairs(slot3) do
		local c = ctrl.number_ctrlr or ctrl
		slot11 = enabled

		c.set_enabled(slot9, c)
	end

	return 
end
function WorldCameraLayer:on_select_sequence()
	slot3 = self

	self.select_sequence(slot2)

	return 
end
function WorldCameraLayer:on_create_new_sequence()
	slot12 = 0
	slot9 = true
	local name = EWS.get_text_from_user(slot2, EWS, Global.frame_panel, "Enter name for the new sequence:", "Create Sequence", "new_sequence", Vector3(slot9, -1, -1))

	if name and name ~= "" then
		slot4 = managers.worldcamera

		if managers.worldcamera.all_world_camera_sequences(slot3)[name] then
			slot4 = self

			self.on_create_new_sequence(slot3)
		else
			slot5 = name

			managers.worldcamera.create_world_camera_sequence(slot3, managers.worldcamera)
			self.update_sequence_list(slot3)

			slot5 = self._sequence_list

			for i = 0, self._sequence_list.nr_items(self) - 1, 1 do
				slot9 = i

				if self._sequence_list.get_string(slot7, self._sequence_list) == name then
					slot9 = i

					self._sequence_list.select_index(slot7, self._sequence_list)
				end
			end

			slot4 = self

			self.select_sequence(slot3)
		end
	end

	return 
end
function WorldCameraLayer:on_delete_sequence()
	slot3 = self
	local name = self.selected_sequence_name(slot2)

	if name then
		slot5 = name

		managers.worldcamera.remove_world_camera_sequence(slot3, managers.worldcamera)

		slot4 = self

		self.update_sequence_list(slot3)

		slot4 = self._sequence_camera_list

		self._sequence_camera_list.clear(slot3)
	end

	return 
end
function WorldCameraLayer:on_test_sequence()
	slot3 = self
	local name = self.selected_sequence_name(slot2)

	if name then
		slot5 = name

		managers.worldcamera.play_world_camera_sequence(slot3, managers.worldcamera)

		slot5 = false

		managers.editor.sound_check_object_active(slot3, managers.editor)

		slot5 = name
		slot10 = "sequence_test_done"
		self._sequence_test_done_callback = managers.worldcamera.add_sequence_done_callback(slot3, managers.worldcamera, callback(slot7, self, self))
	end

	return 
end
function WorldCameraLayer:sequence_test_done()
	slot3 = self

	self.force_editor_state(slot2)

	slot4 = true

	managers.editor.sound_check_object_active(slot2, managers.editor)

	return 
end
function WorldCameraLayer:on_stop_sequence()
	slot3 = managers.worldcamera

	managers.worldcamera.stop_world_camera(slot2)

	return 
end
function WorldCameraLayer:on_add_camera_to_sequence()
	slot3 = self
	local name = self.selected_sequence_name(slot2)

	if not name then
		return 
	end

	slot4 = self._availible_sequence_camera_list
	local index = self._availible_sequence_camera_list.selected_index(slot3)

	if index ~= -1 then
		slot6 = name
		slot10 = index
		local i = managers.worldcamera.add_camera_to_sequence(slot4, managers.worldcamera, self._availible_sequence_camera_list.get_string(slot8, self._availible_sequence_camera_list))
		slot7 = i - 1

		self.update_sequence_camera_list(managers.worldcamera, self)

		slot6 = self

		self.on_select_sequence_camera(managers.worldcamera)
	end

	return 
end
function WorldCameraLayer:on_remove_camera_from_sequence()
	slot3 = self
	local name = self.selected_sequence_name(slot2)

	if not name then
		return 
	end

	slot4 = self._sequence_camera_list
	local index = self._sequence_camera_list.selected_index(slot3)

	if index ~= -1 then
		index = index + 1
		slot7 = index

		managers.worldcamera.remove_camera_from_sequence(slot4, managers.worldcamera, name)

		slot5 = self

		self.update_sequence_camera_list(slot4)
	end

	return 
end
function WorldCameraLayer:on_move_camera_in_sequence(dir)
	slot4 = self
	local name = self.selected_sequence_name(slot3)

	if not name then
		return 
	end

	slot5 = self._sequence_camera_list
	local index = self._sequence_camera_list.selected_index(slot4)

	if index ~= -1 then
		index = index + 1
		slot8 = index
		local camera_sequence_table = managers.worldcamera.remove_camera_from_sequence(slot5, managers.worldcamera, name)
		slot8 = 1
		slot11 = self._sequence_camera_list
		local new_index = math.clamp(managers.worldcamera, index + dir, self._sequence_camera_list.nr_items(slot10))
		slot11 = new_index

		managers.worldcamera.insert_camera_to_sequence(index + dir, managers.worldcamera, name, camera_sequence_table)

		slot8 = self

		self.update_sequence_camera_list(index + dir)

		slot9 = new_index - 1

		self._sequence_camera_list.select_index(index + dir, self._sequence_camera_list)
	end

	return 
end
function WorldCameraLayer:on_select_sequence_camera()
	slot3 = self
	local sequence_camera = self.selected_sequence_camera(slot2)

	if sequence_camera then
		slot4 = self._camera_sequence_settings.start
		slot8 = sequence_camera.start

		self._camera_sequence_settings.start.change_value(slot3, string.format(slot6, "%.4f"))

		slot4 = self._camera_sequence_settings.stop
		slot8 = sequence_camera.stop

		self._camera_sequence_settings.stop.change_value(slot3, string.format(slot6, "%.4f"))
	end

	return 
end
function WorldCameraLayer:on_sequence_camera_start()
	slot5 = self._camera_sequence_settings.start
	local value = tonumber(self._camera_sequence_settings.start.get_value(slot4))
	value = math.clamp(self._camera_sequence_settings.start.get_value, value, 0)
	slot4 = self._camera_sequence_settings.start
	slot8 = value

	self._camera_sequence_settings.start.change_value(self._camera_sequence_settings.start.get_value, string.format(1, "%.4f"))

	slot4 = self
	local sequence_camera = self.selected_sequence_camera(self._camera_sequence_settings.start.get_value)

	if sequence_camera then
		sequence_camera.start = value
	end

	return 
end
function WorldCameraLayer:on_sequence_camera_stop()
	slot5 = self._camera_sequence_settings.stop
	local value = tonumber(self._camera_sequence_settings.stop.get_value(slot4))
	value = math.clamp(self._camera_sequence_settings.stop.get_value, value, 0)
	slot4 = self._camera_sequence_settings.stop
	slot8 = value

	self._camera_sequence_settings.stop.change_value(self._camera_sequence_settings.stop.get_value, string.format(1, "%.4f"))

	slot4 = self
	local sequence_camera = self.selected_sequence_camera(self._camera_sequence_settings.stop.get_value)

	if sequence_camera then
		sequence_camera.stop = value
	end

	return 
end
function WorldCameraLayer:update_sequence_list()
	slot3 = self._sequence_list

	self._sequence_list.clear(slot2)

	slot5 = managers.worldcamera

	for name, _ in pairs(managers.worldcamera.all_world_camera_sequences(slot4)) do
		slot9 = name

		self._sequence_list.append(slot7, self._sequence_list)
	end

	return 
end
function WorldCameraLayer:select_sequence()
	slot3 = self
	local name = self.selected_sequence_name(slot2)

	if name then
		slot4 = self

		self.update_sequence_camera_list(slot3)
	end

	return 
end
function WorldCameraLayer:selected_sequence_name()
	slot3 = self._sequence_list
	local index = self._sequence_list.selected_index(slot2)

	if index ~= -1 then
		slot5 = index

		return self._sequence_list.get_string(slot3, self._sequence_list)
	end

	return nil
end
function WorldCameraLayer:selected_sequence()
	slot3 = self._sequence_list
	local index = self._sequence_list.selected_index(slot2)

	if index ~= -1 then
		slot4 = managers.worldcamera
		slot8 = index

		return managers.worldcamera.world_camera_sequence(slot3, self._sequence_list.get_string(slot6, self._sequence_list))
	end

	return nil
end
function WorldCameraLayer:selected_sequence_camera_name()
	slot3 = self._sequence_camera_list
	local index = self._sequence_camera_list.selected_index(slot2)

	if index ~= -1 then
		slot5 = index

		return self._sequence_camera_list.get_string(slot3, self._sequence_camera_list)
	end

	return nil
end
function WorldCameraLayer:selected_sequence_camera()
	slot3 = self._sequence_camera_list
	local index = self._sequence_camera_list.selected_index(slot2)

	if index ~= -1 then
		index = index + 1
		slot4 = self
		local sequence = self.selected_sequence(slot3)

		if sequence then
			return sequence[index]
		end
	end

	return nil
end
function WorldCameraLayer:update_sequence_camera_list(index)
	slot4 = self._sequence_camera_list

	self._sequence_camera_list.clear(slot3)

	slot4 = self
	local sequence = self.selected_sequence(slot3)

	if not sequence then
		return 
	end

	slot5 = sequence

	for _, camera in ipairs(slot4) do
		slot11 = camera.name

		self._sequence_camera_list.append(slot9, self._sequence_camera_list)
	end

	if index then
		slot6 = index

		self._sequence_camera_list.select_index(slot4, self._sequence_camera_list)
	end

	return 
end
function WorldCameraLayer:deselect()
	return 
end
function WorldCameraLayer:add_triggers()
	WorldCameraLayer.super.add_triggers(slot2)

	local vc = self._editor_data.virtual_controller
	slot5 = Idstring(slot6)
	slot10 = "add_point"

	vc.add_trigger(self, vc, callback("rmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "move_point"

	vc.add_trigger(self, vc, callback("emb", self, self))

	slot5 = Idstring(callback)
	slot10 = "set_far_dof"

	vc.add_trigger(self, vc, callback("set_world_camera_far_dof", self, self))

	slot5 = Idstring(callback)
	slot10 = "set_near_dof"

	vc.add_trigger(self, vc, callback("set_world_camera_near_dof", self, self))

	return 
end
function WorldCameraLayer:activate()
	slot4 = "Mission"
	slot3 = managers.editor.layer(slot2, managers.editor)

	managers.editor.layer(slot2, managers.editor).hide_all(slot2)

	slot3 = self

	WorldCameraLayer.super.activate(slot2)

	slot4 = true

	self.set_gui_visible(slot2, self)

	return 
end
function WorldCameraLayer:deactivate()
	slot4 = "Mission"
	slot3 = managers.editor.layer(slot2, managers.editor)

	managers.editor.layer(slot2, managers.editor).unhide_all(slot2)

	slot3 = self

	WorldCameraLayer.super.deactivate(slot2)

	slot4 = false

	self.set_gui_visible(slot2, self)

	slot3 = managers.editor
	slot6 = managers.editor

	managers.editor.set_camera_fov(slot2, managers.editor.default_camera_fov(slot5))

	slot4 = 0

	managers.editor.set_camera_roll(slot2, managers.editor)

	return 
end
function WorldCameraLayer:clear()
	slot3 = self

	WorldCameraLayer.super.clear(slot2)

	self._current_world_camera = nil
	self._current_point = nil
	slot3 = self._point_list

	self._point_list.clear(slot2)

	slot4 = "linear"

	self._in_acc.set_value(slot2, self._in_acc)

	slot4 = "linear"

	self._out_acc.set_value(slot2, self._out_acc)

	slot4 = false

	self._keys_toolbar.set_enabled(slot2, self._keys_toolbar)

	slot4 = false

	self._keys.set_enabled(slot2, self._keys)

	slot4 = false

	self.key_types_set_enabled(slot2, self)

	slot3 = managers.worldcamera

	managers.worldcamera.clear(slot2)

	slot3 = self

	self.update_camera_list(slot2)

	slot3 = self

	self.update_sequence_list(slot2)

	slot3 = self

	self.update_sequence_camera_list(slot2)

	slot3 = managers.editor
	slot6 = managers.editor

	managers.editor.set_camera_fov(slot2, managers.editor.default_camera_fov(slot5))

	slot4 = 0

	managers.editor.set_camera_roll(slot2, managers.editor)

	return 
end
function WorldCameraLayer:get_help(text)
	local t = "\t"
	local n = "\n"
	text = text .. "Create point:        Right mouse btn" .. n
	text = text .. "Move point:          Thumb mouse btn" .. n

	return text
end

return 
