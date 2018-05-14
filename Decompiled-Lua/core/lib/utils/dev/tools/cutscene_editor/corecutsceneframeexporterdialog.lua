CoreCutsceneFrameExporterDialog = CoreCutsceneFrameExporterDialog or class()
function CoreCutsceneFrameExporterDialog:init(editor_self, editor_callback, parent_window, folder_name, start_frame, end_frame)
	self.__editor_self = editor_self
	self.__editor_callback = editor_callback
	self.__start_frame = start_frame
	self.__end_frame = end_frame
	slot15 = 0
	slot11 = Vector3(slot12, 100, 500)
	slot16 = 0
	slot14 = parent_window
	self.__window = EWS.Frame(slot8, EWS, "Export to Playblast", slot11, Vector3(100, 300, 180), "DEFAULT_DIALOG_STYLE,FRAME_FLOAT_ON_PARENT")
	slot9 = self.__window
	slot12 = "film_reel_16x16.png"

	self.__window.set_icon(slot8, CoreEWS.image_path(slot11))

	slot9 = self.__window
	slot13 = "3DFACE"

	self.__window.set_background_colour(slot8, EWS.get_system_colour(slot11, EWS) * 255.unpack(slot11))

	slot10 = "EVT_CLOSE_WINDOW"
	slot15 = "_on_exit"

	self.__window.connect(slot8, self.__window, callback(EWS.get_system_colour(slot11, EWS) * 255, self, self))

	slot10 = "VERTICAL"
	local sizer = EWS.BoxSizer(slot8, EWS)
	slot11 = sizer

	self.__window.set_sizer(EWS, self.__window)

	slot11 = folder_name
	local folder_name_sizer = self._create_folder_name_box(EWS, self)
	slot15 = "ALL,EXPAND"

	sizer.add(self, sizer, folder_name_sizer, 0, 2)

	slot13 = end_frame
	local frame_range_sizer = self._create_range_box(self, self, start_frame)
	slot16 = "ALL,EXPAND"

	sizer.add(self, sizer, frame_range_sizer, 0, 2)

	local button_sizer = self._create_button_box(self)
	slot17 = "TOP,LEFT,ALIGN_RIGHT"

	sizer.add(self, sizer, button_sizer, 0, 5)

	slot14 = true

	self.__window.set_visible(self, self.__window)

	return 
end
function CoreCutsceneFrameExporterDialog:_create_folder_name_box(folder_name)
	slot7 = "Enter a name for the new folder"
	local folder_name_sizer = EWS.StaticBoxSizer(slot3, EWS, self.__window, "VERTICAL")
	slot7 = folder_name
	self.__folder_name_ctrl = EWS.TextCtrl(EWS, EWS, self.__window)
	slot9 = "ALL,EXPAND"

	folder_name_sizer.add(EWS, folder_name_sizer, self.__folder_name_ctrl, 0, 2)

	return folder_name_sizer
end
function CoreCutsceneFrameExporterDialog:_create_range_box(start_frame, end_frame)
	slot8 = "Frame range"
	local frame_range_sizer = EWS.StaticBoxSizer(slot4, EWS, self.__window, "HORIZONTAL")
	slot10 = "ALIGN_CENTER_VERTICAL"
	local all_button = EWS.RadioButton(EWS, EWS, self.__window, "All", "frame_range")
	slot11 = "ALIGN_CENTER_VERTICAL"
	self.__range_button = EWS.RadioButton(EWS, EWS, self.__window, "Frames", "frame_range")
	slot8 = true

	all_button.set_value(EWS, all_button)

	slot11 = "ALL,EXPAND"

	frame_range_sizer.add(EWS, frame_range_sizer, all_button, 0, 2)

	slot11 = "ALL,EXPAND"

	frame_range_sizer.add(EWS, frame_range_sizer, self.__range_button, 0, 2)

	slot9 = start_frame
	self.__start_frame_ctrl = EWS.TextCtrl(EWS, EWS, self.__window)
	slot9 = end_frame
	self.__end_frame_ctrl = EWS.TextCtrl(EWS, EWS, self.__window)
	slot8 = "EVT_COMMAND_TEXT_UPDATED"
	slot13 = "_on_range_ctrl_update"

	self.__start_frame_ctrl.connect(EWS, self.__start_frame_ctrl, callback(2, self, self))

	slot8 = "EVT_COMMAND_TEXT_UPDATED"
	slot13 = "_on_range_ctrl_update"

	self.__end_frame_ctrl.connect(EWS, self.__end_frame_ctrl, callback(2, self, self))

	slot12 = "from: "
	slot11 = "TOP,LEFT,ALIGN_CENTER_VERTICAL"

	frame_range_sizer.add(EWS, frame_range_sizer, EWS.StaticText(callback, EWS, self.__window), 0, 2)

	slot11 = "TOP,ALIGN_RIGHT"

	frame_range_sizer.add(EWS, frame_range_sizer, self.__start_frame_ctrl, 1, 2)

	slot12 = "to: "
	slot11 = "TOP,LEFT,ALL,ALIGN_CENTER_VERTICAL"

	frame_range_sizer.add(EWS, frame_range_sizer, EWS.StaticText(1, EWS, self.__window), 0, 2)

	slot11 = "TOP,ALIGN_RIGHT"

	frame_range_sizer.add(EWS, frame_range_sizer, self.__end_frame_ctrl, 1, 2)

	return frame_range_sizer
end
function CoreCutsceneFrameExporterDialog:_create_button_box()
	slot4 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(slot2, EWS)
	slot6 = "OK"
	local ok_button = EWS.Button(EWS, EWS, self.__window)
	slot7 = "Cancel"
	local cancel_button = EWS.Button(EWS, EWS, self.__window)
	slot7 = "EVT_COMMAND_BUTTON_CLICKED"
	slot12 = "_on_ok_clicked"

	ok_button.connect(EWS, ok_button, callback(slot9, self, self))

	slot7 = "EVT_COMMAND_BUTTON_CLICKED"
	slot12 = "_on_exit"

	cancel_button.connect(EWS, cancel_button, callback(slot9, self, self))

	slot10 = "ALL,ALIGN_RIGHT"

	button_sizer.add(EWS, button_sizer, ok_button, 0, 2)

	slot10 = "ALL,ALIGN_RIGHT"

	button_sizer.add(EWS, button_sizer, cancel_button, 0, 2)

	return button_sizer
end
function CoreCutsceneFrameExporterDialog:_destroy_window()
	slot3 = self.__window

	if alive(slot2) then
		slot3 = self.__window

		self.__window.destroy(slot2)
	end

	self.__window = nil

	return 
end
function CoreCutsceneFrameExporterDialog:update(time, delta_time)
	slot5 = self.__window

	if not alive(slot4) then
		return true
	end

	return 
end
function CoreCutsceneFrameExporterDialog:_on_exit()
	slot3 = self

	self._destroy_window(slot2)

	return 
end
function CoreCutsceneFrameExporterDialog:_on_ok_clicked()
	slot3 = self
	local folder_name = self._folder_name_input(slot2)
	local start_frame, end_frame = nil
	slot6 = self.__range_button

	if self.__range_button.get_value(slot5) == true then
		slot6 = self
		start_frame, end_frame = self._start_end_frame_input(slot5)
	else
		end_frame = self.__end_frame
		start_frame = self.__start_frame
	end

	if folder_name and start_frame and end_frame then
		slot6 = self

		self._destroy_window(slot5)

		slot9 = folder_name

		self.__editor_callback(slot5, self.__editor_self, start_frame, end_frame)
	end

	return 
end
function CoreCutsceneFrameExporterDialog:_on_range_ctrl_update()
	slot4 = true

	self.__range_button.set_value(slot2, self.__range_button)

	return 
end
function CoreCutsceneFrameExporterDialog:_folder_name_input()
	slot3 = self.__folder_name_ctrl
	local folder_name = self.__folder_name_ctrl.get_value(slot2)

	if folder_name then
		slot4 = folder_name

		if string.len(slot3) <= 3 then
			slot8 = "OK,ICON_EXCLAMATION"
			slot4 = EWS.MessageDialog(slot3, EWS, self.__window, "The folder name is too short.", "Invalid Folder Name")

			EWS.MessageDialog(slot3, EWS, self.__window, "The folder name is too short.", "Invalid Folder Name").show_modal(slot3)

			return nil
		else
			slot5 = "[a-z_0-9]+"

			if string.match(slot3, folder_name) ~= folder_name then
				slot8 = "OK,ICON_EXCLAMATION"
				slot4 = EWS.MessageDialog(slot3, EWS, self.__window, "The folder name may only contain lower-case letters, numbers and underscores.", "Invalid Folder Name")

				EWS.MessageDialog(slot3, EWS, self.__window, "The folder name may only contain lower-case letters, numbers and underscores.", "Invalid Folder Name").show_modal(slot3)

				return nil
			else
				slot5 = "/frames/" .. folder_name

				if SystemFS.exists(slot3, SystemFS) then
					slot8 = "YES_NO,NO_DEFAULT,ICON_EXCLAMATION"
					slot4 = EWS.MessageDialog(slot3, EWS, self.__window, "A folder with that name already exists. Do you want to replace it?", "Replace Existing?")

					if EWS.MessageDialog(slot3, EWS, self.__window, "A folder with that name already exists. Do you want to replace it?", "Replace Existing?").show_modal(slot3) == "ID_NO" then
						return nil
					end
				end
			end
		end
	end

	return folder_name
end
function CoreCutsceneFrameExporterDialog:_start_end_frame_input()
	local start_frame = self.__start_frame_ctrl.get_value(slot2)
	local end_frame = self.__end_frame_ctrl.get_value(self.__start_frame_ctrl)
	slot6 = "[0-9]+"

	if string.match(self.__end_frame_ctrl, start_frame) ~= start_frame then
		slot9 = "OK,ICON_EXCLAMATION"
		slot5 = EWS.MessageDialog(slot4, EWS, self.__window, "The starting frame is not a valid number.", "Invalid Input")

		EWS.MessageDialog(slot4, EWS, self.__window, "The starting frame is not a valid number.", "Invalid Input").show_modal(slot4)

		return nil
	else
		slot6 = "[0-9]+"

		if string.match(slot4, end_frame) ~= end_frame then
			slot9 = "OK,ICON_EXCLAMATION"
			slot5 = EWS.MessageDialog(slot4, EWS, self.__window, "The ending frame is not a valid number.", "Invalid Input")

			EWS.MessageDialog(slot4, EWS, self.__window, "The ending frame is not a valid number.", "Invalid Input").show_modal(slot4)

			return nil
		else
			slot6 = end_frame

			if tonumber(start_frame) < tonumber(slot4) then
				slot9 = "OK,ICON_EXCLAMATION"
				slot5 = EWS.MessageDialog(slot4, EWS, self.__window, "The ending frame number is smaller than the starting frame number.", "Invalid Range")

				EWS.MessageDialog(slot4, EWS, self.__window, "The ending frame number is smaller than the starting frame number.", "Invalid Range").show_modal(slot4)

				return nil
			else
				slot6 = self.__end_frame

				if tonumber(end_frame) < tonumber(slot4) then
					slot9 = "OK,ICON_EXCLAMATION"
					slot5 = EWS.MessageDialog(slot4, EWS, self.__window, "The ending frame number does not exist in the active film track.", "Invalid Range")

					EWS.MessageDialog(slot4, EWS, self.__window, "The ending frame number does not exist in the active film track.", "Invalid Range").show_modal(slot4)

					return nil
				end
			end
		end
	end

	end_frame = end_frame + 1

	return start_frame, end_frame
end

return 
