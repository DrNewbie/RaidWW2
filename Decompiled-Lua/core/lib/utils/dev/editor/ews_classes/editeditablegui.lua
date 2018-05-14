-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not EditUnitEditableGui then
	slot2 = EditUnitBase
	slot0 = class(slot1)
end

EditUnitEditableGui = slot0
function EditUnitEditableGui:init(editor)
	slot5 = {
		name = "Gui Text",
		class = self
	}
	local panel, sizer = editor or managers.editor.add_unit_edit_page(slot3, editor or managers.editor)
	self._panel = panel
	self._ctrls = {}
	self._element_guis = {}
	self._fonts = {
		"core/fonts/diesel"
	}
	self._aligns = {
		horizontal = {
			"left",
			"center",
			"right",
			"justified"
		},
		vertical = {
			"top",
			"center",
			"bottom"
		}
	}
	self._blend_modes = {
		"normal",
		"add",
		"mul",
		"mulx2",
		"sub",
		"darken",
		"lighten"
	}
	self._render_templates = {
		"diffuse_vc_decal",
		"Text",
		"TextDistanceField",
		"diffuse_vc_decal_distance_field"
	}
	slot7 = "VERTICAL"
	local ctrlrs_sizer = EWS.BoxSizer(, EWS)
	slot9 = ctrlrs_sizer

	self._create_color_button(EWS, self, panel)

	slot9 = ctrlrs_sizer

	self._create_text_box(EWS, self, panel)

	slot9 = ctrlrs_sizer

	self._create_font_combobox(EWS, self, panel)

	slot9 = ctrlrs_sizer

	self._create_font_size_slider(EWS, self, panel)

	slot9 = ctrlrs_sizer

	self._create_text_aligns_combobox(EWS, self, panel)

	slot9 = ctrlrs_sizer

	self._create_text_wrap_checkbox(EWS, self, panel)

	slot9 = ctrlrs_sizer

	self._create_render_template_blend_mode_combobox(EWS, self, panel)

	slot9 = ctrlrs_sizer

	self._create_alpha_slider(EWS, self, panel)

	slot9 = ctrlrs_sizer

	self._create_shape_sliders(EWS, self, panel)

	slot11 = "EXPAND"

	sizer.add(EWS, sizer, ctrlrs_sizer, 1, 1)

	slot7 = panel

	panel.layout(EWS)

	slot8 = false

	panel.set_enabled(EWS, panel)

	return 
end
function EditUnitEditableGui:_create_color_button(panel, sizer)
	slot6 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = ""

	sizer.add(EWS, sizer, horizontal_sizer, 0, 0)

	slot13 = ""
	slot10 = "EXPAND"

	horizontal_sizer.add(EWS, horizontal_sizer, EWS.StaticText(0, EWS, panel, "Color:", 0), 0.5, 1)

	local color_button = EWS.Button(EWS, EWS, panel, "", "")
	slot13 = "show_color_dialog"
	slot10 = ""

	color_button.connect(EWS, color_button, "EVT_COMMAND_BUTTON_CLICKED", callback("BU_EXACTFIT,NO_BORDER", self, self))

	slot11 = "LEFT"

	horizontal_sizer.add(EWS, horizontal_sizer, color_button, 0, 0)

	self._ctrls.color_button = color_button

	return 
end
function EditUnitEditableGui:_create_text_box(panel, sizer)
	slot6 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = "EXPAND,BOTTOM"

	sizer.add(EWS, sizer, horizontal_sizer, 1, 1)

	slot13 = ""
	slot10 = "EXPAND"

	horizontal_sizer.add(EWS, horizontal_sizer, EWS.StaticText(1, EWS, panel, "Text:", 0), 0.5, 1)

	local gui_text = EWS.TextCtrl(EWS, EWS, panel, "none", "")
	slot13 = "update_gui_text"
	slot10 = gui_text

	gui_text.connect(EWS, gui_text, "EVT_COMMAND_TEXT_UPDATED", callback("TE_MULTILINE,TE_WORDWRAP", self, self))

	slot11 = "EXPAND"

	horizontal_sizer.add(EWS, horizontal_sizer, gui_text, 1, 1)

	self._ctrls.gui_text = gui_text

	return 
end
function EditUnitEditableGui:_create_font_size_slider(panel, sizer)
	local horizontal_sizer = sizer
	self._font_size_params = {
		name_proportions = 1,
		name = "Font size:",
		ctrlr_proportions = 3,
		slider_ctrlr_proportions = 4,
		value = 1,
		tooltip = "Set the font size using the slider",
		min = 0.1,
		floats = 2,
		max = 10,
		panel = panel,
		sizer = horizontal_sizer
	}
	slot6 = self._font_size_params

	CoreEws.slider_and_number_controller(slot5)

	slot12 = "update_font_size"

	self._font_size_params.slider_ctrlr.connect(slot5, self._font_size_params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback(slot9, self, self))

	slot12 = "update_font_size"

	self._font_size_params.slider_ctrlr.connect(slot5, self._font_size_params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(nil, self, self))

	slot12 = "update_font_size"

	self._font_size_params.number_ctrlr.connect(slot5, self._font_size_params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(nil, self, self))

	slot12 = "update_font_size"
	slot9 = nil

	self._font_size_params.number_ctrlr.connect(slot5, self._font_size_params.number_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	return 
end
function EditUnitEditableGui:_create_font_combobox(panel, sizer)
	slot6 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot4, EWS)

	sizer.add(EWS, sizer, horizontal_sizer, 0, 1)

	self._font_params = {
		name = "Font:",
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "Select a font from the combobox",
		sorted = false,
		ctrlr_proportions = 1,
		panel = panel,
		sizer = horizontal_sizer,
		options = self._fonts,
		value = self._fonts[1]
	}
	local ctrlr = CoreEws.combobox(self._fonts[1])
	slot13 = "update_font"
	slot10 = nil

	ctrlr.connect(self._font_params, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback("EXPAND", self, self))

	self._ctrls.font_list = ctrlr

	return 
end
function EditUnitEditableGui:_create_text_aligns_combobox(panel, sizer)
	slot6 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot4, EWS)

	sizer.add(EWS, sizer, horizontal_sizer, 0, 1)

	self._aligns_horizontal_params = {
		name = "Horizontal:",
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "Select an align from the combobox",
		sorted = false,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = horizontal_sizer,
		options = self._aligns.horizontal,
		value = self._aligns.horizontal[1]
	}
	local ctrlr = CoreEws.combobox(self._aligns.horizontal[1])
	slot13 = "update_align"
	slot10 = nil

	ctrlr.connect(self._aligns_horizontal_params, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback("EXPAND", self, self))

	self._ctrls.align_horizontal = ctrlr
	self._aligns_vertical_params = {
		name = " Vertical:",
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "Select an align from the combobox",
		sorted = false,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = horizontal_sizer,
		options = self._aligns.vertical,
		value = self._aligns.vertical[1]
	}
	local ctrlr = CoreEws.combobox(self._aligns.vertical[1])
	slot14 = "update_vertical"
	slot11 = nil

	ctrlr.connect(self._aligns_vertical_params, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self, self, self))

	self._ctrls.align_vertical = ctrlr

	return 
end
function EditUnitEditableGui:_create_text_wrap_checkbox(panel, sizer)
	slot6 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot4, EWS)

	sizer.add(EWS, sizer, horizontal_sizer, 0, 0)

	slot9 = ""
	local checkbox = EWS.CheckBox(EWS, EWS, panel, "Text Wrap ")
	slot8 = false

	checkbox.set_value(EWS, checkbox)

	slot8 = "Click to toggle"

	checkbox.set_tool_tip(EWS, checkbox)

	slot13 = "update_text_wrap"
	slot10 = nil

	checkbox.connect(EWS, checkbox, "EVT_COMMAND_CHECKBOX_CLICKED", callback("TOP,BOTTOM,RIGHT", self, self))
	horizontal_sizer.add(EWS, horizontal_sizer, checkbox, 0, 1)

	self._ctrls.text_wrap = checkbox
	slot10 = ""
	local checkbox = EWS.CheckBox(EWS, EWS, panel, "Text Word Wrap")
	slot9 = false

	checkbox.set_value(EWS, checkbox)

	slot9 = "Click to toggle"

	checkbox.set_tool_tip(EWS, checkbox)

	slot9 = false

	checkbox.set_enabled(EWS, checkbox)

	slot14 = "update_text_word_wrap"
	slot11 = nil

	checkbox.connect(EWS, checkbox, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND,LEFT", self, self))

	slot12 = "EXPAND,LEFT"

	horizontal_sizer.add(EWS, horizontal_sizer, checkbox, 0, 1)

	self._ctrls.text_word_wrap = checkbox

	horizontal_sizer.add_spacer(EWS, horizontal_sizer, 2, 0, 1)

	slot11 = ""
	local checkbox = EWS.CheckBox(EWS, EWS, panel, "Debug")
	slot10 = false

	checkbox.set_value(EWS, checkbox)

	slot10 = "Click to toggle"

	checkbox.set_tool_tip(EWS, checkbox)

	slot15 = "update_debug"
	slot12 = nil

	checkbox.connect(EWS, checkbox, "EVT_COMMAND_CHECKBOX_CLICKED", callback("", self, self))

	slot13 = "EXPAND,LEFT"

	horizontal_sizer.add(EWS, horizontal_sizer, checkbox, 1, 1)

	self._ctrls.debug = checkbox

	return 
end
function EditUnitEditableGui:_create_render_template_blend_mode_combobox(panel, sizer)
	slot6 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot4, EWS)

	sizer.add(EWS, sizer, horizontal_sizer, 0, 1)

	self._render_template_params = {
		name = "Render Template:",
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "Select a Render Template from the combobox",
		sorted = false,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = horizontal_sizer,
		options = self._render_templates,
		value = self._render_templates[1]
	}
	local ctrlr = CoreEws.combobox(self._render_templates[1])
	slot13 = "update_render_template"
	slot10 = nil

	ctrlr.connect(self._render_template_params, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback("EXPAND", self, self))

	self._ctrls.render_list = ctrlr
	self._blend_mode_params = {
		name = " Blend Mode:",
		enabled = false,
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "Select a Blend Mode from the combobox",
		sorted = false,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = horizontal_sizer,
		options = self._blend_modes,
		value = self._blend_modes[1]
	}
	local ctrlr = CoreEws.combobox(self._blend_modes[1])
	slot14 = "update_blend_mode"
	slot11 = nil

	ctrlr.connect(self._blend_mode_params, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self, self, self))

	self._ctrls.blend_list = ctrlr

	return 
end
function EditUnitEditableGui:_create_alpha_slider(panel, sizer)
	local horizontal_sizer = sizer
	self._alpha_params = {
		name_proportions = 1,
		name = "Alpha:",
		ctrlr_proportions = 3,
		slider_ctrlr_proportions = 4,
		value = 1,
		tooltip = "Set the alpha using the slider",
		min = 0,
		floats = 2,
		max = 1,
		panel = panel,
		sizer = horizontal_sizer
	}
	slot6 = self._alpha_params

	CoreEws.slider_and_number_controller(slot5)

	slot12 = "update_alpha"

	self._alpha_params.slider_ctrlr.connect(slot5, self._alpha_params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback(slot9, self, self))

	slot12 = "update_alpha"

	self._alpha_params.slider_ctrlr.connect(slot5, self._alpha_params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(nil, self, self))

	slot12 = "update_alpha"

	self._alpha_params.number_ctrlr.connect(slot5, self._alpha_params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(nil, self, self))

	slot12 = "update_alpha"
	slot9 = nil

	self._alpha_params.number_ctrlr.connect(slot5, self._alpha_params.number_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	return 
end
function EditUnitEditableGui:_create_shape_sliders(panel, sizer)
	local horizontal_sizer = sizer
	slot10 = "TOP"

	sizer.add_spacer(slot5, sizer, 0, 2, 0)

	self._shape_params = {}
	slot6 = {
		"x",
		"y",
		"w",
		"h"
	}

	for i, shape in ipairs(slot5) do
		self._shape_params[i] = {
			name_proportions = 1,
			ctrlr_proportions = 3,
			slider_ctrlr_proportions = 4,
			value = 1,
			tooltip = "Set shape using the slider",
			min = 0,
			floats = 2,
			max = 1,
			name = "Shape " .. shape .. ":",
			panel = panel,
			sizer = horizontal_sizer
		}
		slot11 = self._shape_params[i]

		CoreEws.slider_and_number_controller()

		slot17 = "update_shape"

		self._shape_params[i].slider_ctrlr.connect(, self._shape_params[i].slider_ctrlr, "EVT_SCROLL_CHANGED", callback(slot14, self, self))

		slot17 = "update_shape"

		self._shape_params[i].slider_ctrlr.connect(, self._shape_params[i].slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(nil, self, self))

		slot17 = "update_shape"

		self._shape_params[i].number_ctrlr.connect(, self._shape_params[i].number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(nil, self, self))

		slot17 = "update_shape"
		slot14 = nil

		self._shape_params[i].number_ctrlr.connect(, self._shape_params[i].number_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))
	end

	return 
end
function EditUnitEditableGui:show_color_dialog()
	slot8 = self._ctrls.color_button
	slot6 = self._ctrls.color_button.background_colour(slot7) / 255
	local colordlg = EWS.ColourDialog(slot2, EWS, Global.frame, true)
	slot4 = colordlg

	if colordlg.show_modal(EWS) then
		slot9 = colordlg
		slot7 = colordlg.get_colour(colordlg).z * 255

		self._ctrls.color_button.set_background_colour(slot3, self._ctrls.color_button, colordlg.get_colour(slot6).x * 255, colordlg.get_colour(colordlg).y * 255)

		slot4 = self._ctrls.units

		for _, unit in ipairs(slot3) do
			slot9 = unit

			if alive(slot8) then
				slot9 = unit

				if unit.editable_gui(slot8) then
					slot9 = unit
					slot9 = unit.editable_gui(slot8)
					slot16 = colordlg
					slot14 = colordlg.get_colour(colordlg).z

					unit.editable_gui(slot8).set_font_color(slot8, Vector3(slot11, colordlg.get_colour(slot13).x, colordlg.get_colour(colordlg).y))
				end
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_debug()

	-- Decompilation error in this vicinity:
	local enabled = self._ctrls.debug.get_value(slot2)
	slot4 = self._ctrls.units

	for _, unit in ipairs(self._ctrls.debug) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			if unit.editable_gui(slot8) then
				slot9 = unit
				slot10 = enabled

				unit.editable_gui(slot8).set_debug(slot8, unit.editable_gui(slot8))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_shape()
	if self._no_event then
		return 
	end

	local shape = {
		self._shape_params[1].value,
		self._shape_params[2].value,
		self._shape_params[3].value,
		self._shape_params[4].value
	}
	slot4 = self._ctrls.units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			if unit.editable_gui(slot8) then
				slot9 = unit
				slot10 = shape

				unit.editable_gui(slot8).set_shape(slot8, unit.editable_gui(slot8))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_alpha()
	if self._no_event then
		return 
	end

	slot3 = self._ctrls.units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit

			if unit.editable_gui(slot7) then
				slot8 = unit
				slot9 = self._alpha_params.value

				unit.editable_gui(slot7).set_alpha(slot7, unit.editable_gui(slot7))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_render_template()
	if self._no_event then
		return 
	end

	local render_template = self._render_template_params.value
	slot5 = render_template == "Text"

	self._ctrls.blend_list.set_enabled(slot3, self._ctrls.blend_list)

	slot4 = self._ctrls.units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			if unit.editable_gui(slot8) then
				slot9 = unit
				slot10 = render_template

				unit.editable_gui(slot8).set_render_template(slot8, unit.editable_gui(slot8))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_blend_mode()
	if self._no_event then
		return 
	end

	local blend_mode = self._blend_mode_params.value
	slot4 = self._ctrls.units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			if unit.editable_gui(slot8) then
				slot9 = unit
				slot10 = blend_mode

				unit.editable_gui(slot8).set_blend_mode(slot8, unit.editable_gui(slot8))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_text_wrap()
	if self._no_event then
		return 
	end

	local enabled = self._ctrls.text_wrap.get_value(slot2)
	slot5 = enabled

	self._ctrls.text_word_wrap.set_enabled(self._ctrls.text_wrap, self._ctrls.text_word_wrap)

	slot4 = self._ctrls.units

	for _, unit in ipairs(self._ctrls.text_wrap) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			if unit.editable_gui(slot8) then
				slot9 = unit
				slot10 = enabled

				unit.editable_gui(slot8).set_wrap(slot8, unit.editable_gui(slot8))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_text_word_wrap()
	if self._no_event then
		return 
	end

	local enabled = self._ctrls.text_word_wrap.get_value(slot2)
	slot4 = self._ctrls.units

	for _, unit in ipairs(self._ctrls.text_word_wrap) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			if unit.editable_gui(slot8) then
				slot9 = unit
				slot10 = enabled

				unit.editable_gui(slot8).set_word_wrap(slot8, unit.editable_gui(slot8))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_align()
	if self._no_event then
		return 
	end

	local align = self._aligns_horizontal_params.value
	slot4 = self._ctrls.units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			if unit.editable_gui(slot8) then
				slot9 = unit
				slot10 = align

				unit.editable_gui(slot8).set_align(slot8, unit.editable_gui(slot8))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_vertical()
	if self._no_event then
		return 
	end

	local align = self._aligns_vertical_params.value
	slot4 = self._ctrls.units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			if unit.editable_gui(slot8) then
				slot9 = unit
				slot10 = align

				unit.editable_gui(slot8).set_vertical(slot8, unit.editable_gui(slot8))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_font()
	if self._no_event then
		return 
	end

	local font = self._font_params.value
	slot4 = self._ctrls.units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			if unit.editable_gui(slot8) then
				slot9 = unit
				slot10 = font

				unit.editable_gui(slot8).set_font(slot8, unit.editable_gui(slot8))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_gui_text(gui_text)
	if self._no_event then
		return 
	end

	slot4 = self._ctrls.units

	for _, unit in ipairs(slot3) do
		slot9 = unit

		if alive(slot8) then
			slot9 = unit

			if unit.editable_gui(slot8) then
				slot9 = unit
				slot9 = unit.editable_gui(slot8)
				slot14 = gui_text

				unit.editable_gui(slot8).set_text(slot8, utf8.from_latin1(gui_text.get_value(slot13)))
			end
		end
	end

	return 
end
function EditUnitEditableGui:update_font_size()
	if self._no_event then
		return 
	end

	slot3 = self._ctrls.units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit

			if unit.editable_gui(slot7) then
				slot8 = unit
				slot9 = self._font_size_params.value

				unit.editable_gui(slot7).set_font_size(slot7, unit.editable_gui(slot7))
			end
		end
	end

	return 
end
function EditUnitEditableGui:is_editable(unit, units)
	slot5 = unit

	if alive(slot4) then
		slot5 = unit

		if unit.editable_gui(slot4) then
			self._ctrls.unit = unit
			self._ctrls.units = units
			local font_options = clone(slot4)
			slot6 = self._ctrls.unit
			local default_font = self._ctrls.unit.editable_gui(self._fonts).default_font(self._fonts)
			slot8 = default_font

			if not table.contains(self._ctrls.unit.editable_gui(self._fonts), font_options) then
				slot8 = default_font

				table.insert(slot6, font_options)
			end

			slot8 = font_options

			CoreEws.update_combobox_options(slot6, self._font_params)

			self._no_event = true
			slot7 = self._ctrls.gui_text
			slot12 = self._ctrls.unit
			slot12 = self._ctrls.unit.editable_gui(slot11)

			self._ctrls.gui_text.set_value(slot6, utf8.to_latin1(self._ctrls.unit.editable_gui(slot11).text(slot11)))

			slot7 = self._ctrls.unit
			local font_color = self._ctrls.unit.editable_gui(slot6).font_color(slot6)
			slot11 = font_color.z * 255

			self._ctrls.color_button.set_background_colour(self._ctrls.unit.editable_gui(slot6), self._ctrls.color_button, font_color.x * 255, font_color.y * 255)

			slot8 = self._font_size_params
			slot11 = self._ctrls.unit
			slot11 = self._ctrls.unit.editable_gui(font_color.y * 255)

			CoreEws.change_slider_and_number_value(self._ctrls.unit.editable_gui(slot6), self._ctrls.unit.editable_gui(font_color.y * 255).font_size(font_color.y * 255))

			slot8 = self._font_params
			slot11 = self._ctrls.unit
			slot11 = self._ctrls.unit.editable_gui(font_color.y * 255)

			CoreEws.change_combobox_value(self._ctrls.unit.editable_gui(slot6), self._ctrls.unit.editable_gui(font_color.y * 255).font(font_color.y * 255))

			slot8 = self._aligns_horizontal_params
			slot11 = self._ctrls.unit
			slot11 = self._ctrls.unit.editable_gui(font_color.y * 255)

			CoreEws.change_combobox_value(self._ctrls.unit.editable_gui(slot6), self._ctrls.unit.editable_gui(font_color.y * 255).align(font_color.y * 255))

			slot8 = self._aligns_vertical_params
			slot11 = self._ctrls.unit
			slot11 = self._ctrls.unit.editable_gui(font_color.y * 255)

			CoreEws.change_combobox_value(self._ctrls.unit.editable_gui(slot6), self._ctrls.unit.editable_gui(font_color.y * 255).vertical(font_color.y * 255))

			slot8 = self._blend_mode_params
			slot11 = self._ctrls.unit
			slot11 = self._ctrls.unit.editable_gui(font_color.y * 255)

			CoreEws.change_combobox_value(self._ctrls.unit.editable_gui(slot6), self._ctrls.unit.editable_gui(font_color.y * 255).blend_mode(font_color.y * 255))

			slot8 = self._render_template_params
			slot11 = self._ctrls.unit
			slot11 = self._ctrls.unit.editable_gui(font_color.y * 255)

			CoreEws.change_combobox_value(self._ctrls.unit.editable_gui(slot6), self._ctrls.unit.editable_gui(font_color.y * 255).render_template(font_color.y * 255))

			slot8 = self._alpha_params
			slot11 = self._ctrls.unit
			slot11 = self._ctrls.unit.editable_gui(font_color.y * 255)

			CoreEws.change_slider_and_number_value(self._ctrls.unit.editable_gui(slot6), self._ctrls.unit.editable_gui(font_color.y * 255).alpha(font_color.y * 255))

			slot8 = self._ctrls.unit
			local shape = self._ctrls.unit.editable_gui(self._ctrls.unit.editable_gui(slot6)).shape(self._ctrls.unit.editable_gui(slot6))
			slot9 = shape

			for i, value in ipairs(self._ctrls.unit.editable_gui(self._ctrls.unit.editable_gui(slot6))) do
				slot15 = value

				CoreEws.change_slider_and_number_value(slot13, self._shape_params[i])
			end

			slot9 = self._ctrls.text_wrap
			slot12 = self._ctrls.unit
			slot12 = self._ctrls.unit.editable_gui(slot11)

			self._ctrls.text_wrap.set_value(slot8, self._ctrls.unit.editable_gui(slot11).wrap(slot11))

			slot9 = self._ctrls.text_word_wrap
			slot12 = self._ctrls.unit
			slot12 = self._ctrls.unit.editable_gui(slot11)

			self._ctrls.text_word_wrap.set_value(slot8, self._ctrls.unit.editable_gui(slot11).word_wrap(slot11))

			slot9 = self._ctrls.text_word_wrap
			slot12 = self._ctrls.unit
			slot12 = self._ctrls.unit.editable_gui(slot11)

			self._ctrls.text_word_wrap.set_enabled(slot8, self._ctrls.unit.editable_gui(slot11).wrap(slot11))

			slot12 = self._ctrls.unit
			slot12 = self._ctrls.unit.editable_gui(slot11)
			slot10 = self._ctrls.unit.editable_gui(slot11).render_template(slot11) == "Text"

			self._ctrls.blend_list.set_enabled(slot8, self._ctrls.blend_list)

			self._no_event = false

			return true
		end
	end

	return false
end

return 
