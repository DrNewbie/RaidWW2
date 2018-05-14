if not CoreWorldCameraTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreWorldCameraTriggerUnitElement = slot0

if not WorldCameraTriggerUnitElement then
	slot2 = CoreWorldCameraTriggerUnitElement
	slot0 = class(slot1)
end

WorldCameraTriggerUnitElement = slot0
function WorldCameraTriggerUnitElement:init(...)
	slot3 = self

	CoreWorldCameraTriggerUnitElement.init(slot2, ...)

	return 
end
function CoreWorldCameraTriggerUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.worldcamera_trigger_sequence = "none"
	self._hed.worldcamera_trigger_after_clip = "done"
	slot5 = "worldcamera_trigger_sequence"

	table.insert("done", self._save_values)

	slot5 = "worldcamera_trigger_after_clip"

	table.insert("done", self._save_values)

	return 
end
function CoreWorldCameraTriggerUnitElement:selected()
	slot3 = self

	MissionElement.selected(slot2)

	slot3 = self

	self._populate_sequences(slot2)

	slot3 = managers.worldcamera

	if not managers.worldcamera.all_world_camera_sequences(slot2)[self._hed.worldcamera_trigger_sequence] then
		self._hed.worldcamera_trigger_sequence = "none"
		slot4 = self._hed.worldcamera_trigger_sequence

		self._sequences.set_value("none", self._sequences)
	end

	slot3 = self

	self._populate_after_clip(slot2)

	return 
end
function CoreWorldCameraTriggerUnitElement:_populate_sequences()
	slot3 = self._sequences

	self._sequences.clear(slot2)
	self._sequences.append(slot2, self._sequences)

	slot5 = managers.worldcamera

	for name, _ in pairs(managers.worldcamera.all_world_camera_sequences("none")) do
		slot9 = name

		self._sequences.append(slot7, self._sequences)
	end

	slot4 = self._hed.worldcamera_trigger_sequence

	self._sequences.set_value(slot2, self._sequences)

	return 
end
function CoreWorldCameraTriggerUnitElement:_populate_after_clip()
	slot3 = self._after_clip

	self._after_clip.clear(slot2)

	slot4 = "done"

	self._after_clip.append(slot2, self._after_clip)

	local old_clip = self._hed.worldcamera_trigger_after_clip
	self._hed.worldcamera_trigger_after_clip = "done"

	if self._hed.worldcamera_trigger_sequence ~= "none" then
		slot5 = self._hed.worldcamera_trigger_sequence
		local sequence = managers.worldcamera.world_camera_sequence(slot3, managers.worldcamera)
		slot5 = sequence

		for i, cam in ipairs(managers.worldcamera) do
			slot11 = i

			self._after_clip.append(slot9, self._after_clip)

			if i == old_clip then
				self._hed.worldcamera_trigger_after_clip = old_clip
			end
		end
	end

	slot5 = self._hed.worldcamera_trigger_after_clip

	self._after_clip.set_value(slot3, self._after_clip)

	return 
end
function CoreWorldCameraTriggerUnitElement:_build_panel(panel, panel_sizer)
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

	slot7 = self._hed.worldcamera_trigger_sequence

	self._sequences.set_value(EWS, self._sequences)

	slot12 = "set_element_data"

	self._sequences.connect(EWS, self._sequences, "EVT_COMMAND_COMBOBOX_SELECTED", callback("", self, self))

	slot12 = "_populate_after_clip"
	slot9 = nil

	self._sequences.connect(EWS, self._sequences, "EVT_COMMAND_COMBOBOX_SELECTED", callback({
		value = "worldcamera_trigger_sequence",
		ctrlr = self._sequences
	}, self, self))

	slot10 = "EXPAND"

	sequence_sizer.add(EWS, sequence_sizer, self._sequences, 3, 0)

	slot10 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, sequence_sizer, 0, 0)

	slot7 = "HORIZONTAL"
	local after_clip_sizer = EWS.BoxSizer(EWS, EWS)
	slot14 = ""
	slot11 = "ALIGN_CENTER_VERTICAL"

	after_clip_sizer.add(EWS, after_clip_sizer, EWS.StaticText(0, EWS, self._panel, "After Clip:", 0), 1, 0)

	slot11 = "CB_DROPDOWN,CB_READONLY"
	self._after_clip = EWS.ComboBox(EWS, EWS, self._panel, "", "")
	slot7 = self

	self._populate_after_clip(EWS)

	slot8 = self._hed.worldcamera_trigger_after_clip

	self._after_clip.set_value(EWS, self._after_clip)

	slot13 = "set_element_data"
	slot10 = {
		value = "worldcamera_trigger_after_clip",
		ctrlr = self._after_clip
	}

	self._after_clip.connect(EWS, self._after_clip, "EVT_COMMAND_COMBOBOX_SELECTED", callback("", self, self))

	slot11 = "EXPAND"

	after_clip_sizer.add(EWS, after_clip_sizer, self._after_clip, 3, 0)

	slot11 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, after_clip_sizer, 0, 0)

	return 
end

return 
