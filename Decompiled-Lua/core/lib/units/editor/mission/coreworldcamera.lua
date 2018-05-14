if not CoreWorldCameraUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreWorldCameraUnitElement = slot0

if not WorldCameraUnitElement then
	slot2 = CoreWorldCameraUnitElement
	slot0 = class(slot1)
end

WorldCameraUnitElement = slot0
function WorldCameraUnitElement:init(...)
	slot3 = self

	CoreWorldCameraUnitElement.init(slot2, ...)

	return 
end
function CoreWorldCameraUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.worldcamera = "none"
	self._hed.worldcamera_sequence = "none"
	slot5 = "worldcamera"

	table.insert("none", self._save_values)

	slot5 = "worldcamera_sequence"

	table.insert("none", self._save_values)

	return 
end
function CoreWorldCameraUnitElement:test_element()
	if self._hed.worldcamera_sequence ~= "none" then
		slot4 = self._hed.worldcamera_sequence

		managers.worldcamera.play_world_camera_sequence(slot2, managers.worldcamera)
	elseif self._hed.worldcamera ~= "none" then
		slot4 = self._hed.worldcamera

		managers.worldcamera.play_world_camera(slot2, managers.worldcamera)
	end

	return 
end
function CoreWorldCameraUnitElement:selected()
	slot3 = self

	MissionElement.selected(slot2)

	slot3 = self

	self._populate_worldcameras(slot2)

	slot3 = managers.worldcamera

	if not managers.worldcamera.all_world_cameras(slot2)[self._hed.worldcamera] then
		self._hed.worldcamera = "none"
		slot4 = self._hed.worldcamera

		self._worldcameras.set_value("none", self._worldcameras)
	end

	slot3 = self

	self._populate_sequences(slot2)

	slot3 = managers.worldcamera

	if not managers.worldcamera.all_world_camera_sequences(slot2)[self._hed.worldcamera_sequence] then
		self._hed.worldcamera_sequence = "none"
		slot4 = self._hed.worldcamera_sequence

		self._sequences.set_value("none", self._sequences)
	end

	return 
end
function CoreWorldCameraUnitElement:_populate_worldcameras()
	slot3 = self._worldcameras

	self._worldcameras.clear(slot2)
	self._worldcameras.append(slot2, self._worldcameras)

	slot5 = self

	for _, name in ipairs(self._sorted_worldcameras("none")) do
		slot9 = name

		self._worldcameras.append(slot7, self._worldcameras)
	end

	slot4 = self._hed.worldcamera

	self._worldcameras.set_value(slot2, self._worldcameras)

	return 
end
function CoreWorldCameraUnitElement:_populate_sequences()
	slot3 = self._sequences

	self._sequences.clear(slot2)
	self._sequences.append(slot2, self._sequences)

	slot5 = self

	for _, name in ipairs(self._sorted_worldcamera_sequences("none")) do
		slot9 = name

		self._sequences.append(slot7, self._sequences)
	end

	slot4 = self._hed.worldcamera_sequence

	self._sequences.set_value(slot2, self._sequences)

	return 
end
function CoreWorldCameraUnitElement:_sorted_worldcameras()
	local t = {}
	slot6 = managers.worldcamera

	for name, _ in pairs(managers.worldcamera.all_world_cameras(slot5)) do
		slot10 = name

		table.insert(slot8, t)
	end

	slot4 = t

	table.sort(slot3)

	return t
end
function CoreWorldCameraUnitElement:_sorted_worldcamera_sequences()
	local t = {}
	slot6 = managers.worldcamera

	for name, _ in pairs(managers.worldcamera.all_world_camera_sequences(slot5)) do
		slot10 = name

		table.insert(slot8, t)
	end

	slot4 = t

	table.sort(slot3)

	return t
end
function CoreWorldCameraUnitElement:select_camera_btn()
	slot4 = "Select camera"
	slot7 = self
	local dialog = SelectNameModal.new(slot2, SelectNameModal, self._sorted_worldcameras(slot6))
	slot4 = dialog

	if dialog.cancelled(SelectNameModal) then
		return 
	end

	slot6 = dialog

	for _, worldcamera in ipairs(dialog._selected_item_assets(slot5)) do
		self._hed.worldcamera = worldcamera
		slot10 = self._hed.worldcamera

		self._worldcameras.set_value(slot8, self._worldcameras)
	end

	return 
end
function CoreWorldCameraUnitElement:select_sequence_btn()
	slot4 = "Select sequence"
	slot7 = self
	local dialog = SelectNameModal.new(slot2, SelectNameModal, self._sorted_worldcamera_sequences(slot6))
	slot4 = dialog

	if dialog.cancelled(SelectNameModal) then
		return 
	end

	slot6 = dialog

	for _, worldcamera_sequence in ipairs(dialog._selected_item_assets(slot5)) do
		self._hed.worldcamera_sequence = worldcamera_sequence
		slot10 = self._hed.worldcamera_sequence

		self._sequences.set_value(slot8, self._sequences)
	end

	return 
end
function CoreWorldCameraUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "HORIZONTAL"
	local sequence_sizer = EWS.BoxSizer(slot4, EWS)
	slot13 = ""
	slot10 = "ALIGN_CENTER_VERTICAL"

	sequence_sizer.add(EWS, sequence_sizer, EWS.StaticText(slot8, EWS, self._panel, "Sequence:", 0), 1, 0)

	slot10 = "CB_DROPDOWN,CB_READONLY"
	self._sequences = EWS.ComboBox(EWS, EWS, self._panel, "", "")
	slot6 = self

	self._populate_sequences(EWS)

	slot7 = self._hed.worldcamera_sequence

	self._sequences.set_value(EWS, self._sequences)

	slot12 = "set_element_data"
	slot9 = {
		value = "worldcamera_sequence",
		ctrlr = self._sequences
	}

	self._sequences.connect(EWS, self._sequences, "EVT_COMMAND_COMBOBOX_SELECTED", callback("", self, self))

	slot10 = "EXPAND"

	sequence_sizer.add(EWS, sequence_sizer, self._sequences, 3, 0)

	slot9 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot12 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "SELECT_EFFECT", "Select sequence", CoreEws.image_path(self))

	slot14 = "select_sequence_btn"
	slot11 = nil

	toolbar.connect(EWS, toolbar, "SELECT_EFFECT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot7 = toolbar

	toolbar.realize(EWS)

	slot11 = "EXPAND,LEFT"

	sequence_sizer.add(EWS, sequence_sizer, toolbar, 0, 1)

	slot11 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, sequence_sizer, 0, 0)

	slot8 = "HORIZONTAL"
	local worldcamera_sizer = EWS.BoxSizer(EWS, EWS)
	slot15 = ""
	slot12 = "ALIGN_CENTER_VERTICAL"

	worldcamera_sizer.add(EWS, worldcamera_sizer, EWS.StaticText(0, EWS, self._panel, "Camera:", 0), 1, 0)

	slot12 = "CB_DROPDOWN,CB_READONLY"
	self._worldcameras = EWS.ComboBox(EWS, EWS, self._panel, "", "")
	slot8 = self

	self._populate_worldcameras(EWS)

	slot9 = self._hed.worldcamera

	self._worldcameras.set_value(EWS, self._worldcameras)

	slot14 = "set_element_data"
	slot11 = {
		value = "worldcamera",
		ctrlr = self._worldcameras
	}

	self._worldcameras.connect(EWS, self._worldcameras, "EVT_COMMAND_COMBOBOX_SELECTED", callback("", self, self))

	slot12 = "EXPAND"

	worldcamera_sizer.add(EWS, worldcamera_sizer, self._worldcameras, 3, 0)

	slot11 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot14 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "SELECT_EFFECT", "Select camera", CoreEws.image_path(self))

	slot16 = "select_camera_btn"
	slot13 = nil

	toolbar.connect(EWS, toolbar, "SELECT_EFFECT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot9 = toolbar

	toolbar.realize(EWS)

	slot13 = "EXPAND,LEFT"

	worldcamera_sizer.add(EWS, worldcamera_sizer, toolbar, 0, 1)

	slot13 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, worldcamera_sizer, 0, 0)

	return 
end

return 
