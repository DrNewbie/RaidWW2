-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
EWSControlSettingSync = EWSControlSettingSync or class()
function EWSControlSettingSync:init(ews_frame)
	if ews_frame == nil then
		slot5 = "EWSControlSettingSync:init(): No ews_frame given as argument. Check so you use : to call new."

		Application.error(slot3, Application)
	end

	self._controls_map = {}
	self._ews_frame = ews_frame
	self._ending_mark = "-"
	self._unique_id_counter = 0
	slot6 = true
	slot11 = 1
	self._col = EWS.ColourDialog(slot3, EWS, self._ews_frame, Vector3(slot8, 1, 1))

	return 
end
function EWSControlSettingSync:get_control(id)
	local control_info = self._controls_map[id]

	if not control_info then
		slot6 = "EWSControlSettingSync::get_control_info() control info does not exist for \"" .. id .. "\""

		Application.throw_exception(slot4, Application)
	end

	return control_info.main_control
end
function EWSControlSettingSync:set_control_updated_callback(cb)
	self._control_updated_callback = cb

	return 
end
function EWSControlSettingSync:get_unique_id()
	self._unique_id_counter = self._unique_id_counter + 1

	return "_unique_id" .. self._unique_id_counter
end
function EWSControlSettingSync:update_setting_box(custom_data, event_object)
	local id = event_object.get_id(slot4)
	local res = self._col.show_modal(event_object)
	slot8 = id
	local control_info = self.get_control_info(self._col, self)
	local main_data = control_info.main_control

	if res == true then
		local val = self._col.get_colour(slot8)
		slot13 = val.z * 255

		main_data.set_background_colour(self._col, main_data, val.x * 255, val.y * 255)

		if self._control_updated_callback then
			slot11 = val

			self._control_updated_callback(slot9, id)
		end
	end

	return 
end
function EWSControlSettingSync:update_setting(custom_data, event_object)
	local id = event_object.get_id(slot4)
	slot7 = id
	local control_info = self.get_control_info(event_object, self)
	slot9 = control_info
	local value = self.get_ews_control_value(self, self, custom_data)
	local main_data = control_info.main_control

	if custom_data ~= main_data then
		slot12 = control_info

		self.set_ews_control_value(slot8, self, value, main_data)

		slot11 = control_info
		value = self.get_ews_control_value(slot8, self, main_data)
	end

	local controls = control_info.controls

	if controls then
		slot10 = controls

		for _, data in ipairs(slot9) do
			if data ~= main_data then
				slot18 = control_info

				self.set_ews_control_value(slot14, self, value, data)
			end
		end
	end

	if self._control_updated_callback then
		slot11 = value

		self._control_updated_callback(slot9, id)
	end

	local links = control_info.links

	if links then
		slot11 = links

		for _, link_id in ipairs(slot10) do
			if id ~= link_id then
				slot18 = value

				self.set_ews_value(slot15, self, link_id)
			end
		end
	end

	local sync_slaves = control_info.sync_less

	if sync_slaves then
		slot12 = sync_slaves

		for _, slave_id in ipairs(slot11) do
			if id ~= slave_id then
				slot18 = slave_id
				local slave_value = self.get_ews_value(slot16, self)

				if slave_value <= value then
					slot19 = slave_id
					local control_info = self.get_control_info(slot17, self)

					if control_info.sync_step then
						value = value + control_info.sync_step
					end

					slot21 = value

					self.set_ews_value(slot18, self, slave_id)
				end
			end
		end
	end

	sync_slaves = control_info.sync_more

	if sync_slaves then
		slot12 = sync_slaves

		for _, slave_id in ipairs(slot11) do
			if id ~= slave_id then
				slot18 = slave_id
				local slave_value = self.get_ews_value(slot16, self)

				if value <= slave_value then
					slot19 = slave_id
					local control_info = self.get_control_info(slot17, self)

					if control_info.sync_step then
						value = value - control_info.sync_step
					end

					slot21 = value

					self.set_ews_value(slot18, self, slave_id)
				end
			end
		end
	end

	return 
end
function EWSControlSettingSync:set_ews_vector(id, value)
	slot7 = value.x

	self.set_ews_value(slot4, self, id .. "-r")

	slot7 = value.y

	self.set_ews_value(slot4, self, id .. "-g")

	slot7 = value.z

	self.set_ews_value(slot4, self, id .. "-b")

	return 
end
function EWSControlSettingSync:set_ews_vector2(id, value)
	slot7 = value.x

	self.set_ews_value(slot4, self, id .. "-r")

	slot7 = value.y

	self.set_ews_value(slot4, self, id .. "-g")

	return 
end
function EWSControlSettingSync:set_ews_box(id, value)
	local control_info = self.get_control_info(slot4, self)
	local main_data = control_info.main_control
	slot10 = value.z * 255

	main_data.set_background_colour(id .. "-rgb", main_data, value.x * 255, value.y * 255)

	return 
end
function EWSControlSettingSync:do_set_ews_value(id, value)
	local control_info = self.get_control_info(slot4, self)
	local main_data = control_info.main_control
	slot10 = control_info

	self.set_ews_control_value(id, self, value, main_data)

	slot9 = control_info
	local main_value = self.get_ews_control_value(id, self, main_data)
	local controls = control_info.controls

	if controls then
		slot9 = controls

		for _, data in ipairs(slot8) do
			if data ~= main_data then
				slot17 = control_info

				self.set_ews_control_value(slot13, self, main_value, data)
			end
		end
	end

	return main_value
end
function EWSControlSettingSync:set_ews_value(id, value)
	slot7 = value
	local main_value = self.do_set_ews_value(slot4, self, id)

	if self._control_updated_callback then
		slot7 = main_value

		self._control_updated_callback(slot5, id)
	end

	return 
end
function EWSControlSettingSync:get_ews_value(id)
	local control_info = self.get_control_info(slot3, self)
	local data = control_info.main_control
	slot8 = control_info

	return self.get_ews_control_value(id, self, data)
end
function EWSControlSettingSync:set_ews_control_value(value, data, control_info)
	local controls_type = control_info.controls_type

	if controls_type then
		local scales = control_info.controls_scale

		if value and scales and scales[data] then
			slot8 = value
			value = tonumber(slot7) * scales[data]
		end

		local type = controls_type[data]

		if type == "list" then
		elseif type == "listctrl" then
			slot12 = "LIST_STATE_SELECTED"
			local index = data.get_next_item(slot8, data, index, "LIST_NEXT_ALL")
			local data_map = control_info.listctrl_data

			while index ~= -1 do
				slot14 = value

				data.set_item(slot10, data, index, 1)

				slot13 = value

				data_map[index].set(slot10, data_map[index], 1)

				slot14 = "LIST_STATE_SELECTED"
				index = data.get_next_item(slot10, data, index, "LIST_NEXT_ALL")
			end
		else
			slot10 = value

			data.set_value(slot8, data)
		end
	else
		slot8 = "EWSControlSettingSync::set_ews_control_value() controls_type was not specified for control_info map"

		Application.throw_exception(slot6, Application)
	end

	return 
end
function EWSControlSettingSync:get_ews_control_value(data, control_info)
	local controls_type = control_info.controls_type
	local value = nil

	if controls_type then
		local type = controls_type[data]

		if type == "list" then
			slot8 = data
			local index = data.selected_index(slot7)

			if -1 < index then
				slot10 = index
				value = data.get_string(slot8, data)
			end
		elseif type == "listctrl" then
			slot11 = "LIST_STATE_SELECTED"
			local index = data.get_next_item(slot7, data, -1, "LIST_NEXT_ALL")

			if index ~= -1 then
				local data_map = control_info.listctrl_data
				value = data_map[index][1]
			end
		else
			slot8 = data
			value = data.get_value(slot7)
		end

		local scales = control_info.controls_scale

		if value and scales and scales[data] then
			slot9 = value
			value = tonumber(slot8) / scales[data]
		end
	else
		slot8 = "EWSControlSettingSync::get_ews_control_value() controls_type was not specified for control_info map"

		Application.throw_exception(slot6, Application)
	end

	return value
end
function EWSControlSettingSync:get_ews_control_value_from_id(data, id)
	slot6 = data
	slot10 = id

	return self.get_ews_control_value(slot4, self, self.get_control_info(slot8, self))
end
function EWSControlSettingSync:get_control_info(id)
	local control_info = self._controls_map[id]

	if not control_info then
		slot6 = "EWSControlSettingSync::get_control_info() control info does not exist for \"" .. id .. "\""

		Application.throw_exception(slot4, Application)
	end

	return control_info
end
function EWSControlSettingSync:update_link(custom_data, event_object)
	slot8 = event_object
	local control_info = self.get_control_info(slot4, event_object.get_id(slot7))
	slot8 = control_info
	local value = self.get_ews_control_value(self, self, custom_data)
	local links = control_info.links

	if links then
		for link_id in nil do
			slot12 = event_object

			if event_object.get_id(slot11) ~= link_id then
				slot13 = link_id
				local link_info = self.get_control_info(slot11, self)

				if value then
					link_info.links = links
				else
					link_info.links = nil
				end
			end
		end
	end

	return 
end
function EWSControlSettingSync:show_texture_dialog(custom_data, event_object)
	slot8 = event_object
	local control_info = self.get_control_info(slot4, event_object.get_id(slot7))
	slot11 = managers.database
	slot12 = "OPEN,FILE_MUST_EXIST"
	local dialog = EWS.FileDialog(self, EWS, self._ews_frame, "Choose file", managers.database.base_path(slot10), "", "DDS self:files(*.dds)|*.dds|TGA self:files(*.tga)|*.tga")
	slot7 = dialog

	if dialog.show_modal(EWS) then
		local path = dialog.get_path(slot6)
		slot11 = managers.database
		slot9 = managers.database.base_path(slot10).size
		path = path.substring(dialog, path)
		slot10 = path.size - 4
		path = path.substring(dialog, path, 0)
		slot11 = control_info

		self.set_ews_control_value(dialog, self, path, custom_data)

		slot10 = event_object

		self.update_setting(dialog, self, custom_data)
	end

	return 
end
function EWSControlSettingSync:create_small_label(text)
	slot8 = ""
	local label = EWS.StaticText(slot3, EWS, self._ews_frame, text, 0)
	slot6 = 7

	label.set_font_size(EWS, label)

	return label
end
function EWSControlSettingSync:create_linker(id, link_ids)
	slot9 = ""
	local check = EWS.CheckBox(slot4, EWS, self._ews_frame, "Link", id)
	slot7 = 6

	check.set_font_size(EWS, check)

	slot13 = "update_link"

	self._ews_frame.connect(EWS, self._ews_frame, id, "EVT_COMMAND_CHECKBOX_CLICKED", callback(check, self, self))

	local info_map = {}
	local types_map = {
		[check] = "check"
	}
	info_map.controls_type = types_map
	info_map.main_control = check
	info_map.links = link_ids
	self._controls_map[id] = info_map

	return check
end
function EWSControlSettingSync:create_slider(id, min, max, num_decimals, labeltext)
	min = min or 0
	max = max or 0
	slot8 = 10
	slot11 = num_decimals
	local scale = math.pow(slot7, math.abs(slot10))
	min = min * scale
	max = max * scale

	if max < min or min == max then
		slot10 = "EWSControlSettingSync::create_slider(" .. id .. "," .. min .. "," .. max .. "," .. num_decimals .. ") Arguments are confusing"

		Application.throw_exception(slot8, Application)
	end

	slot10 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(slot8, EWS)

	if labeltext ~= nil then
		slot11 = labeltext
		local label = self.create_small_label(slot9, self)
		slot15 = "FIXED_MINSIZE"

		sizer.add(self, sizer, label, 0, 0)
	end

	slot16 = ""
	local slider = EWS.Slider(slot9, EWS, self._ews_frame, min, min, max, id)
	slot15 = ""
	local text = EWS.TextCtrl(EWS, EWS, self._ews_frame, "", id)
	slot16 = "EXPAND"

	sizer.add(EWS, sizer, slider, 1, 0)
	sizer.add(EWS, sizer, text, 0, 2)

	slot19 = "update_setting"

	self._ews_frame.connect(EWS, self._ews_frame, id, "EVT_COMMAND_TEXT_ENTER", callback("LEFT", self, self))

	slot19 = "update_setting"

	self._ews_frame.connect(EWS, self._ews_frame, id, "EVT_SCROLL_THUMBTRACK", callback(text, self, self))

	slot19 = "update_setting"
	slot16 = slider

	self._ews_frame.connect(EWS, self._ews_frame, id, "EVT_SCROLL_CHANGED", callback(slider, self, self))

	local info_map = {}
	local types_map = {
		[text] = "text",
		[slider] = "slider"
	}
	info_map.controls_type = types_map
	local scales_map = {
		[slider] = scale
	}
	info_map.controls_scale = scales_map
	info_map.controls = {
		slider,
		text
	}
	info_map.main_control = slider
	slot18 = num_decimals
	slot16 = -math.abs(self)
	info_map.sync_step = math.pow("EVT_SCROLL_CHANGED", 10)
	self._controls_map[id] = info_map

	return sizer
end
function EWSControlSettingSync:create_double_slider(id_min, id_max, min, max, num_decimals)
	slot9 = "VERTICAL"
	local sizer = EWS.BoxSizer(slot7, EWS)
	slot16 = num_decimals
	slot13 = "EXPAND"

	sizer.add(EWS, sizer, self.create_slider(slot11, self, id_min, min, max), 1, 0)

	slot16 = num_decimals
	slot13 = "EXPAND"

	sizer.add(EWS, sizer, self.create_slider(1, self, id_max, min, max), 1, 0)

	slot10 = id_min
	self.get_control_info(EWS, self).sync_less = {
		id_max
	}
	slot10 = id_max
	self.get_control_info(, self).sync_more = {
		id_min
	}

	return sizer
end
function EWSControlSettingSync:create_double_slider2(id_min, id_max, min, max, num_decimals)
	slot9 = "VERTICAL"
	local sizer = EWS.BoxSizer(slot7, EWS)
	slot16 = num_decimals
	slot13 = "EXPAND"

	sizer.add(EWS, sizer, self.create_slider(slot11, self, id_min, min, max), 1, 0)

	slot16 = num_decimals
	slot13 = "EXPAND"

	sizer.add(EWS, sizer, self.create_slider(1, self, id_max, min, max), 1, 0)

	return sizer
end
function EWSControlSettingSync:create_rgb_slider(base_id, min, max, num_decimals, labeltext)
	slot9 = "VERTICAL"
	local sizer = EWS.BoxSizer(slot7, EWS)

	if labeltext ~= nil then
		slot10 = labeltext
		local label = self.create_small_label(slot8, self)
		slot14 = "FIXED_MINSIZE"

		sizer.add(self, sizer, label, 0, 0)
	end

	local id_r = base_id .. self._ending_mark .. "r"
	local id_g = base_id .. self._ending_mark .. "g"
	local id_b = base_id .. self._ending_mark .. "b"
	slot19 = num_decimals
	slot16 = "EXPAND"

	sizer.add("b", sizer, self.create_slider(slot14, self, id_r, min, max), 0, 0)

	slot19 = num_decimals
	slot16 = "EXPAND"

	sizer.add("b", sizer, self.create_slider(0, self, id_g, min, max), 0, 0)

	slot19 = num_decimals
	slot16 = "EXPAND"

	sizer.add("b", sizer, self.create_slider(0, self, id_b, min, max), 0, 0)

	slot17 = {
		id_r,
		id_g,
		id_b
	}
	slot16 = "ALIGN_CENTER_HORIZONTAL"

	sizer.add("b", sizer, self.create_linker(0, self, "link_" .. base_id), 1, 0)

	return sizer
end
function EWSControlSettingSync:create_rgb_box(base_id, labeltext)
	slot6 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(slot4, EWS)
	local newid = base_id .. "-rgb"
	local label = nil

	if labeltext == nil then
		label = base_id
	else
		label = labeltext
	end

	slot12 = label
	slot12 = ""

	sizer.add(slot7, sizer, self.create_small_label(slot10, self), 2, 0)

	slot12 = ""
	local slider = EWS.Button(slot7, EWS, self._ews_frame, label, newid)

	sizer.add(EWS, sizer, slider, 2, 1)

	slot16 = "update_setting_box"
	slot13 = slider

	slider.connect(EWS, slider, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	local info_map = {}
	local types_map = {
		[slider] = "box"
	}
	info_map.controls_type = types_map
	info_map.main_control = slider
	self._controls_map[newid] = info_map

	return sizer
end
function EWSControlSettingSync:create_string(id, label_text)
	slot6 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = ""
	local text = EWS.TextCtrl(EWS, EWS, self._ews_frame, "", id)

	if label_text then
		slot11 = ""
		local label = EWS.StaticText(slot6, EWS, self._ews_frame, label_text, 0)
		slot12 = "ALIGN_CENTER_VERTICAL,RIGHT"

		sizer.add(EWS, sizer, label, 0, 2)
	end

	sizer.add(slot6, sizer, text, 1, 0)

	slot14 = "update_setting"

	self._ews_frame.connect(slot6, self._ews_frame, id, "EVT_COMMAND_TEXT_UPDATED", callback("EXPAND", self, self))

	slot14 = "update_setting"
	slot11 = text

	self._ews_frame.connect(slot6, self._ews_frame, id, "EVT_COMMAND_TEXT_ENTER", callback(text, self, self))

	local info_map = {}
	local types_map = {
		[text] = "text"
	}
	info_map.controls_type = types_map
	info_map.main_control = text
	self._controls_map[id] = info_map

	return sizer
end
function EWSControlSettingSync:create_texture_path(id)
	slot5 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(slot3, EWS)
	slot9 = "TE_PROCESS_ENTER"
	local text = EWS.TextCtrl(EWS, EWS, self._ews_frame, "", id)
	slot10 = "EXPAND"

	sizer.add(EWS, sizer, text, 1, 0)

	slot13 = "BU_EXACTFIT,NO_BORDER"

	sizer.add(EWS, sizer, EWS.Button(1, EWS, self._ews_frame, "Browse", id), 0, 2)

	slot13 = "show_texture_dialog"

	self._ews_frame.connect(EWS, self._ews_frame, id, "EVT_COMMAND_BUTTON_CLICKED", callback("LEFT,EXPAND", self, self))

	slot13 = "update_setting"
	slot10 = text

	self._ews_frame.connect(EWS, self._ews_frame, id, "EVT_COMMAND_TEXT_ENTER", callback(text, self, self))

	local info_map = {}
	local types_map = {
		[text] = "text"
	}
	info_map.controls_type = types_map
	info_map.main_control = text
	self._controls_map[id] = info_map

	return sizer
end
function EWSControlSettingSync:create_list_config(id, rename_event_func, add_event_func)
	slot7 = "VERTICAL"
	local sizer = EWS.BoxSizer(slot5, EWS)
	slot11 = ""
	local text = EWS.TextCtrl(EWS, EWS, self._ews_frame, "", id)
	slot11 = "LB_SINGLE,LB_HSCROLL"
	local list = EWS.ListBox(EWS, EWS, self._ews_frame, id)
	slot10 = "HORIZONTAL"
	local text_sizer = EWS.BoxSizer(EWS, EWS)
	slot14 = "EXPAND"

	text_sizer.add(EWS, text_sizer, text, 1, 0)

	slot14 = "EXPAND"

	sizer.add(EWS, sizer, text_sizer, 0, 0)

	slot14 = "EXPAND"

	sizer.add(EWS, sizer, list, 1, 0)

	if add_event_func then
		slot14 = "BU_EXACTFIT,NO_BORDER"
		local add_btn = EWS.Button(slot9, EWS, self._ews_frame, "Add", id)
		slot15 = "LEFT,EXPAND"

		text_sizer.add(EWS, text_sizer, add_btn, 0, 2)

		slot15 = text

		self._ews_frame.connect(EWS, self._ews_frame, id, "EVT_COMMAND_BUTTON_CLICKED", add_event_func)
	end

	slot17 = "update_setting"

	self._ews_frame.connect(slot9, self._ews_frame, id, "EVT_COMMAND_LISTBOX_SELECTED", callback(list, self, self))

	if rename_event_func then
		slot14 = text

		self._ews_frame.connect(slot9, self._ews_frame, id, "EVT_COMMAND_TEXT_ENTER", rename_event_func)
	end

	local info_map = {}
	local types_map = {
		[list] = "list",
		[text] = "text"
	}
	info_map.controls_type = types_map
	info_map.controls = {
		list,
		text
	}
	info_map.main_control = list
	self._controls_map[id] = info_map

	return sizer
end
function EWSControlSettingSync:create_combo_config(id, label_text, rename_event_func)
	slot7 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(slot5, EWS)
	slot11 = "CB_SORT,CB_DROPDOWN"
	local combo = EWS.ComboBox(EWS, EWS, self._ews_frame, "", id)

	if label_text then
		slot12 = ""
		local label = EWS.StaticText(slot7, EWS, self._ews_frame, label_text, 0)
		slot13 = "ALIGN_CENTER_VERTICAL,RIGHT"

		sizer.add(EWS, sizer, label, 0, 2)
	end

	slot12 = ""

	sizer.add(slot7, sizer, combo, 1, 0)

	if rename_event_func then
		slot12 = combo

		self._ews_frame.connect(slot7, self._ews_frame, id, "EVT_COMMAND_TEXT_ENTER", rename_event_func)
	end

	slot15 = "update_setting"

	self._ews_frame.connect(slot7, self._ews_frame, id, "EVT_COMMAND_COMBOBOX_SELECTED", callback(combo, self, self))

	local info_map = {}
	local types_map = {
		[combo] = "combo"
	}
	info_map.controls_type = types_map
	info_map.main_control = combo
	self._controls_map[id] = info_map

	return sizer
end
function EWSControlSettingSync:create_name_popup(id, label_text, init_text)
	init_text = init_text or "none"
	slot14 = 0
	slot15 = 0
	slot12 = "CAPTION,CLOSE_BOX"
	local pop_up = EWS.Dialog(slot5, EWS, nil, label_text, "", Vector3(slot11, 525, 400), Vector3(525, 230, 150))
	slot8 = "LIGHT GREY"

	pop_up.set_background_colour(EWS, pop_up)

	slot9 = "VERTICAL"
	local pop_up_main_sizer = EWS.StaticBoxSizer(EWS, EWS, pop_up)
	slot9 = pop_up_main_sizer

	pop_up.set_sizer(EWS, pop_up)

	slot12 = "TE_CENTRE"
	local popup_name = EWS.TextCtrl(EWS, EWS, pop_up, init_text, id)
	slot13 = "EXPAND"

	pop_up_main_sizer.add(EWS, pop_up_main_sizer, popup_name, 0, 0)

	slot10 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot14 = "BU_EXACTFIT,NO_BORDER"
	local ok_btn = EWS.Button(EWS, EWS, pop_up, "Ok", id)
	slot15 = "RIGHT"

	button_sizer.add(EWS, button_sizer, ok_btn, 0, 5)

	slot17 = "update_setting"
	slot14 = popup_name

	ok_btn.connect(EWS, ok_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot15 = "BU_EXACTFIT,NO_BORDER"
	local cancel_btn = EWS.Button(EWS, EWS, pop_up, "Cancel", "_pop_up_cancel")
	slot16 = "RIGHT"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 5)

	slot18 = "close_name_popup"
	slot15 = pop_up

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot16 = "EXPAND"

	pop_up_main_sizer.add(EWS, pop_up_main_sizer, button_sizer, 0, 0)

	local info_map = {}
	local types_map = {
		[popup_name] = "popup_name"
	}
	info_map.controls_type = types_map
	info_map.main_control = popup_name
	self._controls_map[id] = info_map

	return pop_up
end
function EWSControlSettingSync:close_name_popup(popup)
	slot4 = popup

	popup.end_modal(slot3)

	return 
end
function EWSControlSettingSync:attach_function_button(to_id, sizer, text, event_func)
	local id = self.get_unique_id(slot6)
	slot12 = "BU_EXACTFIT,NO_BORDER"
	local btn = EWS.Button(self, EWS, self._ews_frame, text, id)
	slot13 = "LEFT,EXPAND"

	sizer.add(EWS, sizer, btn, 0, 2)

	slot13 = to_id

	self._ews_frame.connect(EWS, self._ews_frame, id, "EVT_COMMAND_BUTTON_CLICKED", event_func)

	return 
end
function EWSControlSettingSync:append_to_control(id, map)
	local control_info = self.get_control_info(slot4, self)
	local list_data = control_info.main_control
	slot7 = list_data

	list_data.clear(id)

	if map[1] then
		slot7 = map

		for _, name in ipairs(slot6) do
			slot13 = name

			list_data.append(slot11, list_data)
		end
	else
		slot7 = map

		for name, data in pairs(slot6) do
			slot13 = name

			list_data.append(slot11, list_data)
		end
	end

	return 
end
function EWSControlSettingSync:create_properties_list(id, add_vector, read_only)
	slot7 = "VERTICAL"
	local sizer = EWS.BoxSizer(slot5, EWS)
	slot10 = "LC_REPORT,LC_HRULES,LC_VRULES,LC_SINGLE_SEL"
	local list = EWS.ListCtrl(EWS, EWS, self._ews_frame, id)
	slot11 = ""

	list.insert_column(EWS, list, 0, "Property")

	slot11 = ""

	list.insert_column(EWS, list, 1, "Value")

	slot12 = "EXPAND"

	sizer.add(EWS, sizer, list, 1, 0)

	local text = nil

	if not read_only then
		slot10 = "HORIZONTAL"
		local value_sizer = EWS.BoxSizer(slot8, EWS)
		slot14 = ""
		text = EWS.TextCtrl(EWS, EWS, self._ews_frame, "", id)
		local remove_id = self.get_unique_id(EWS)
		slot15 = "BU_EXACTFIT,NO_BORDER"
		local remove_btn = EWS.Button(self, EWS, self._ews_frame, "Remove", remove_id)
		slot16 = "EXPAND"

		value_sizer.add(EWS, value_sizer, text, 1, 0)

		slot16 = "LEFT,EXPAND"

		value_sizer.add(EWS, value_sizer, remove_btn, 0, 2)
		sizer.add(EWS, sizer, value_sizer, 0, 0)

		slot19 = "remove_selected_property_from_list"
		slot16 = id

		self._ews_frame.connect(EWS, self._ews_frame, remove_id, "EVT_COMMAND_BUTTON_CLICKED", callback("EXPAND", self, self))
	end

	if add_vector and 0 < #add_vector then
		slot10 = "HORIZONTAL"
		local add_sizer = EWS.BoxSizer(slot8, EWS)
		slot14 = "CB_SORT,CB_DROPDOWN"
		local combo = EWS.ComboBox(EWS, EWS, self._ews_frame, "", id)
		slot15 = "BU_EXACTFIT,NO_BORDER"
		local add_btn = EWS.Button(EWS, EWS, self._ews_frame, "Add", id)
		slot12 = add_vector

		for _, name in ipairs(EWS) do
			slot18 = name

			combo.append(slot16, combo)
		end

		slot16 = "EXPAND"

		add_sizer.add(slot11, add_sizer, combo, 1, 0)

		slot16 = "LEFT,EXPAND"

		add_sizer.add(slot11, add_sizer, add_btn, 0, 2)
		sizer.add(slot11, sizer, add_sizer, 0, 4)

		slot19 = "add_property_to_list"
		slot16 = combo

		self._ews_frame.connect(slot11, self._ews_frame, id, "EVT_COMMAND_BUTTON_CLICKED", callback("TOP,EXPAND", self, self))
	end

	slot16 = "update_setting"

	self._ews_frame.connect(slot8, self._ews_frame, id, "EVT_COMMAND_LIST_ITEM_SELECTED", callback(slot13, self, self))

	slot16 = "update_setting"
	slot13 = text

	self._ews_frame.connect(slot8, self._ews_frame, id, "EVT_COMMAND_TEXT_ENTER", callback(list, self, self))

	local info_map = {
		listctrl_data = {}
	}
	local types_map = {
		[list] = "listctrl"
	}

	if not read_only then
		types_map[text] = "text"
		info_map.controls = {
			list,
			text
		}
	end

	info_map.controls_type = types_map
	info_map.main_control = list
	self._controls_map[id] = info_map

	return sizer
end
function EWSControlSettingSync:load_properties_list(id, properties_map)
	local control_info = self.get_control_info(slot4, self)
	local list_data = control_info.main_control
	slot7 = list_data

	list_data.delete_all_items(id)

	local data_map = control_info.listctrl_data
	data_map = {}

	if properties_map then
		slot8 = properties_map

		for name, value in pairs(slot7) do
			slot14 = name
			local index = list_data.append_item(slot12, list_data)
			slot17 = value

			list_data.set_item(list_data, list_data, index, 1)

			data_map[index] = {
				name,
				value
			}
		end
	end

	local controls_type = control_info.controls_type
	slot9 = controls_type

	for data, type in pairs(slot8) do
		if type == "text" then
			slot15 = ""

			data.set_value(slot13, data)
		end
	end

	return 
end
function EWSControlSettingSync:save_properties_list(id)
	local saved_map = {}
	local control_info = self.get_control_info(slot4, self)
	local data_map = control_info.listctrl_data
	slot7 = data_map

	for index, data in pairs(id) do
		saved_map[data[0]] = data[1]
	end

	return saved_map
end
function EWSControlSettingSync:add_property_to_list(custom_data, event_object)
	slot8 = event_object
	local control_info = self.get_control_info(slot4, event_object.get_id(slot7))
	slot8 = control_info
	local name = self.get_ews_control_value(self, self, custom_data)
	local list_data = control_info.main_control
	slot9 = name
	local index = list_data.append_item(custom_data, list_data)
	local data_map = control_info.listctrl_data
	data_map[index] = {
		name,
		""
	}

	return 
end
function EWSControlSettingSync:remove_selected_property_from_list(custom_data, event_object)
	local control_info = self.get_control_info(slot4, self)
	local list_data = control_info.main_control
	slot10 = "LIST_STATE_SELECTED"
	local index = list_data.get_next_item(custom_data, list_data, index, "LIST_NEXT_ALL")
	local data_map = control_info.listctrl_data

	while index ~= -1 do
		slot10 = index

		list_data.delete_item(slot8, list_data)

		data_map[index] = nil
		slot12 = "LIST_STATE_SELECTED"
		index = list_data.get_next_item(slot8, list_data, index, "LIST_NEXT_ALL")
	end

	return 
end
function EWSControlSettingSync:create_about_dialog(about_text)
	local text = about_text or "This about was created by\nH\\xe5kan\nThe all and mighty."
	local num_lines = 0
	local longest_line = 0
	local at = 0
	local at_end = 0
	local _ = nil

	while true do
		num_lines = num_lines + 1
		slot13 = true
		_, at_end = text.find(slot9, text, "\n", at)

		if _ and at_end then
			slot12 = at_end
			slot10 = text.sub(slot9, text, at)
			local length = text.sub(slot9, text, at).len(slot9)

			if longest_line < length then
				longest_line = length
			end

			at = at_end + 1
		else
			break
		end
	end

	if longest_line == 0 then
		slot10 = text
		longest_line = text.len(slot9)
	end

	local text_box_size = num_lines * 15
	local frame_size_height = text_box_size + 50
	local frame_size_width = longest_line * 8
	slot21 = 0
	slot21 = frame_size_height
	slot19 = ""
	local about_dialog = EWS.Dialog(slot12, EWS, nil, "About", "hoho", Vector3(slot18, -1, -1), Vector3(-1, frame_size_width))
	slot18 = "TE_CENTRE,TE_READONLY,TE_MULTILINE,TE_NO_VSCROLL,TE_RICH,TE_AUTO_URL"
	local static_text = EWS.TextCtrl(EWS, EWS, about_dialog, text, "")
	slot18 = 200

	static_text.set_background_colour(EWS, static_text, 212, 208)

	slot15 = static_text
	slot20 = 0

	static_text.set_position(EWS, Vector3(208, 0, 0))

	slot15 = static_text
	slot20 = 0

	static_text.set_size(EWS, Vector3(208, frame_size_width, text_box_size))

	slot19 = ""
	local ok_button = EWS.Button(EWS, EWS, about_dialog, "OK", "")
	slot16 = ok_button
	slot21 = 0

	ok_button.set_position(EWS, Vector3("", 0, text_box_size))

	slot16 = ok_button
	slot21 = 0

	ok_button.set_size(EWS, Vector3("", frame_size_width - 5, -1))

	slot22 = "on_about_dialog_button_ok"
	slot19 = about_dialog

	ok_button.connect(EWS, ok_button, "EVT_COMMAND_BUTTON_CLICKED", callback(frame_size_width - 5, self, self))

	return about_dialog
end
function EWSControlSettingSync:on_about_dialog_button_ok(data, event)
	slot6 = ""

	data.end_modal(slot4, data)

	return 
end
AboutDialog = AboutDialog or class()
function AboutDialog:init(parent, text)
	local text = text or "This about was created by\nH\\xe5kan\nThe all and mighty."
	local num_lines = 0
	local longest_line = 0
	local at = 0
	local at_end = 0
	local _ = nil

	while true do
		num_lines = num_lines + 1
		slot14 = true
		_, at_end = text.find(slot10, text, "\n", at)

		if _ and at_end then
			slot13 = at_end
			slot11 = text.sub(slot10, text, at)
			local length = text.sub(slot10, text, at).len(slot10)

			if longest_line < length then
				longest_line = length
			end

			at = at_end + 1
		else
			break
		end
	end

	if longest_line == 0 then
		slot11 = text
		longest_line = text.len(slot10)
	end

	local text_box_size = num_lines * 15
	local frame_size_height = text_box_size + 50
	local frame_size_width = longest_line * 6
	slot22 = 0
	slot22 = frame_size_height
	slot20 = ""
	self._frame = EWS.Dialog(slot13, EWS, parent, "About", "hoho", Vector3(slot19, -1, -1), Vector3(-1, frame_size_width))
	slot18 = "ALIGN_CENTRE"
	self._static_text = EWS.StaticText(slot13, EWS, self._frame, text, "")
	slot14 = self._static_text
	slot19 = 0

	self._static_text.set_position(slot13, Vector3(text, 0, 0))

	slot14 = self._static_text
	slot19 = 0

	self._static_text.set_size(slot13, Vector3(text, frame_size_width, text_box_size))

	slot18 = ""
	self._ok_button = EWS.Button(slot13, EWS, self._frame, "OK", "")
	slot14 = self._ok_button
	slot19 = 0

	self._ok_button.set_position(slot13, Vector3("OK", 0, text_box_size))

	slot14 = self._ok_button
	slot19 = 0

	self._ok_button.set_size(slot13, Vector3("OK", frame_size_width - 5, -1))

	slot20 = "on_button_ok"
	slot17 = ""

	self._ok_button.connect(slot13, self._ok_button, "EVT_COMMAND_BUTTON_CLICKED", callback(frame_size_width - 5, self, self))

	return 
end
function AboutDialog:on_button_ok(data, event)
	slot6 = ""

	self._frame.end_modal(slot4, self._frame)

	return 
end
function AboutDialog:show()
	slot3 = self._frame

	self._frame.show_modal(slot2)

	return 
end

return 
