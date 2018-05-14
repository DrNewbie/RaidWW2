-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

slot3 = "CoreColorPickerPanel"

core.import(slot1, core)

TemplateMixerDummy = TemplateMixerDummy or class()
function TemplateMixerDummy:init(editor, ...)
	self._editor = editor
	self._args = {
		...
	}

	if #self._args == 1 then
		self._param = self._args[1]
		self._type = "sky"
	elseif #self._args == 2 then
		self._mat = self._args[1]
		self._param = self._args[2]
		self._type = "underlay"
	elseif #self._args == 3 then
		self._pro = self._args[1]
		self._mod = self._args[2]
		self._param = self._args[3]
		self._type = "posteffect"
	else
		slot4 = "[TemplateMixerDummy] Bad number of arguments!"

		error(slot3)
	end

	slot5 = self

	self._editor.reg_mixer(slot3, self._editor)

	return 
end
function TemplateMixerDummy:get_value()
	return self._val
end
function TemplateMixerDummy:set_value(v)
	self._val = v

	return 
end
function TemplateMixerDummy:update_mix(env1, env2, blend)
	local p1, p2 = nil

	if self._type == "posteffect" then
		slot12 = self._param
		p1 = self._editor.retrive_posteffect_param(slot7, self._editor, self._editor._template_effects[env1], self._pro, self._mod)
		slot12 = self._param
		p2 = self._editor.retrive_posteffect_param(slot7, self._editor, self._editor._template_effects[env2], self._pro, self._mod)
	elseif self._type == "underlay" then
		slot11 = self._param
		p1 = self._editor.retrive_underlay_param(slot7, self._editor, self._editor._template_underlays[env1], self._mat)
		slot11 = self._param
		p2 = self._editor.retrive_underlay_param(slot7, self._editor, self._editor._template_underlays[env2], self._mat)
	else
		slot10 = self._param
		p1 = self._editor.retrive_sky_param(slot7, self._editor, self._editor._template_skies[env1])
		slot10 = self._param
		p2 = self._editor.retrive_sky_param(slot7, self._editor, self._editor._template_skies[env2])
	end

	if p1 and p2 then
		local p1type = type(slot7)
		slot9 = p2
		local p2type = type(p1)

		if p1type == p2type then
			if p1type == "string" then
				if blend < 0.5 then
					self._val = p1
				else
					self._val = p2
				end
			else
				slot12 = blend
				self._val = math.lerp(slot9, p1, p2)
			end
		end
	end

	return 
end
function TemplateMixerDummy:args()
	local v = {}
	slot4 = self._args
	v[MULTRES] = unpack(slot3)
	slot5 = self

	table.insert(slot3, v)

	slot4 = v

	return unpack(slot3)
end
FormulaMixerDummy = FormulaMixerDummy or class()
FormulaMixerDummy.STD_TOL = 0.01
function FormulaMixerDummy:init(editor, master, tol, formula, ...)
	self._editor = editor
	self._master = master
	self._formula = formula
	self._tol = tol
	self._params = {
		...
	}
	slot7 = master.get_value(slot8)
	slot10 = self._params
	self._value = formula(slot6, unpack(master))
	slot8 = self

	self._editor.add_updator(slot6, self._editor)

	return 
end
function FormulaMixerDummy:get_value()
	return self._value
end
function FormulaMixerDummy:set_value(v)
	self._value = v

	return 
end
function FormulaMixerDummy:update(t, dt)

	-- Decompilation error in this vicinity:
	slot8 = self._params
	local value = self._formula(slot4, unpack(self._master))
	local t = type(self._master.get_value(value))

	return 
end
DummyWidget = DummyWidget or class()
function DummyWidget:init(t)
	self._val = t

	return 
end
function DummyWidget:get_value()
	return self._val
end
function DummyWidget:set_value(v)
	self._val = v

	return 
end
Vector2Slider = Vector2Slider or class()
function Vector2Slider:init(editor, p, name, picker_bottom, picker_top, min, max, scale, display_scale)
	self._scale = scale
	self._editor = editor

	if display_scale then
		self._display_scale = display_scale
	else
		self._display_scale = 1
	end

	slot15 = name
	self._box = EWS.StaticBoxSizer(slot11, EWS, p, "VERTICAL")
	slot13 = "HORIZONTAL"
	self._top_button_box = EWS.BoxSizer(slot11, EWS)

	if picker_top == "depth" or picker_top == "all" then
		self._top_depth_btn = EWS.Button(slot11, EWS, p, "Pick Depth X", "")
		slot19 = "on_pick_top_depth_button"
		slot16 = ""

		self._top_depth_btn.connect(slot11, self._top_depth_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

		slot16 = "EXPAND"

		self._top_button_box.add(slot11, self._top_button_box, self._top_depth_btn, 0, 0)
	end

	if picker_top == "height" or picker_top == "all" then
		self._top_height_btn = EWS.Button(slot11, EWS, p, "Pick Height X", "")
		slot19 = "on_pick_top_height_button"
		slot16 = ""

		self._top_height_btn.connect(slot11, self._top_height_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

		slot16 = "EXPAND"

		self._top_button_box.add(slot11, self._top_button_box, self._top_height_btn, 0, 0)
	end

	if picker_bottom == "depth" or picker_bottom == "all" then
		self._bottom_depth_btn = EWS.Button(slot11, EWS, p, "Pick Depth Y", "")
		slot19 = "on_pick_bottom_depth_button"
		slot16 = ""

		self._bottom_depth_btn.connect(slot11, self._bottom_depth_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

		slot16 = "EXPAND"

		self._top_button_box.add(slot11, self._top_button_box, self._bottom_depth_btn, 0, 0)
	end

	if picker_bottom == "height" or picker_bottom == "all" then
		self._bottom_height_btn = EWS.Button(slot11, EWS, p, "Pick Height Y", "")
		slot19 = "on_pick_bottom_height_button"
		slot16 = ""

		self._bottom_height_btn.connect(slot11, self._bottom_height_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

		slot16 = "EXPAND"

		self._top_button_box.add(slot11, self._top_button_box, self._bottom_height_btn, 0, 0)
	end

	slot16 = "EXPAND"

	self._box.add(slot11, self._box, self._top_button_box, 0, 0)

	slot13 = "HORIZONTAL"
	self._slider_r_box = EWS.BoxSizer(slot11, EWS)
	self._slider_r = EWS.Slider(slot11, EWS, p, 0, min)
	slot19 = "on_slider"

	self._slider_r.connect(slot11, self._slider_r, "", "EVT_SCROLL_THUMBTRACK", callback(max, self, self))

	slot19 = "on_slider_changed"
	slot16 = ""

	self._slider_r.connect(slot11, self._slider_r, "", "EVT_SCROLL_CHANGED", callback("", self, self))

	slot16 = "EXPAND"

	self._slider_r_box.add(slot11, self._slider_r_box, self._slider_r, 5, 0)

	self._slider_r_textctrl = EWS.TextCtrl(slot11, EWS, p, "", "")
	slot19 = "on_update_textctrl"
	slot16 = ""

	self._slider_r_textctrl.connect(slot11, self._slider_r_textctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot16 = "EXPAND"

	self._slider_r_box.add(slot11, self._slider_r_box, self._slider_r_textctrl, 1, 0)

	slot16 = "EXPAND"

	self._box.add(slot11, self._box, self._slider_r_box, 1, 0)

	slot13 = "HORIZONTAL"
	self._slider_g_box = EWS.BoxSizer(slot11, EWS)
	self._slider_g = EWS.Slider(slot11, EWS, p, 0, min)
	slot19 = "on_slider"

	self._slider_g.connect(slot11, self._slider_g, "", "EVT_SCROLL_THUMBTRACK", callback(max, self, self))

	slot19 = "on_slider_changed"
	slot16 = ""

	self._slider_g.connect(slot11, self._slider_g, "", "EVT_SCROLL_CHANGED", callback("", self, self))

	slot16 = "EXPAND"

	self._slider_g_box.add(slot11, self._slider_g_box, self._slider_g, 5, 0)

	self._slider_g_textctrl = EWS.TextCtrl(slot11, EWS, p, "", "")
	slot19 = "on_update_textctrl"
	slot16 = ""

	self._slider_g_textctrl.connect(slot11, self._slider_g_textctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot16 = "EXPAND"

	self._slider_g_box.add(slot11, self._slider_g_box, self._slider_g_textctrl, 1, 0)

	slot16 = "EXPAND"

	self._box.add(slot11, self._box, self._slider_g_box, 1, 0)

	return 
end
function Vector2Slider:on_slider_changed()
	slot3 = self

	self.set_text(slot2)

	slot3 = self._editor

	self._editor.value_is_changed(slot2)

	return 
end
function Vector2Slider:on_slider()
	slot3 = self

	self.set_text(slot2)

	return 
end
function Vector2Slider:on_pick_top_depth_button()
	self._editor._update_pick_element = self
	self._editor._update_pick_element_type = "depth_x"

	return 
end
function Vector2Slider:on_pick_top_height_button()
	self._editor._update_pick_element = self
	self._editor._update_pick_element_type = "height_x"

	return 
end
function Vector2Slider:on_pick_bottom_depth_button()
	self._editor._update_pick_element = self
	self._editor._update_pick_element_type = "depth_y"

	return 
end
function Vector2Slider:on_pick_bottom_height_button()
	self._editor._update_pick_element = self
	self._editor._update_pick_element_type = "height_y"

	return 
end
function Vector2Slider:get_value()
	slot6 = self._slider_g
	slot5 = 0

	return Vector3(slot2, self._slider_r.get_value(slot4) / self._scale, self._slider_g.get_value(self._slider_r) / self._scale)
end
function Vector2Slider:on_update_textctrl()
	slot5 = self._slider_r_textctrl
	local r = tonumber(self._slider_r_textctrl.get_value(slot4))
	slot4 = r

	if type(self._slider_r_textctrl.get_value) ~= "number" then
		r = 0
	end

	slot6 = self._slider_g_textctrl
	local g = tonumber(self._slider_g_textctrl.get_value(slot5))
	slot5 = g

	if type(self._slider_g_textctrl.get_value) ~= "number" then
		g = 0
	end

	slot5 = self
	slot10 = 0

	self.set_value(slot4, Vector3(slot7, (r * self._display_scale) / self._scale, (g * self._display_scale) / self._scale))

	slot5 = self._editor

	self._editor.value_is_changed(slot4)

	return 
end
function Vector2Slider:set_text()
	slot3 = self._slider_r_textctrl
	slot8 = self._slider_r
	slot6 = self._slider_r.get_value(slot7) / self._display_scale

	self._slider_r_textctrl.set_value(slot2, tostring(slot5))

	slot3 = self._slider_g_textctrl
	slot8 = self._slider_g
	slot6 = self._slider_g.get_value(self._display_scale) / self._display_scale

	self._slider_g_textctrl.set_value(slot2, tostring(slot5))

	return 
end
function Vector2Slider:set_value(v)
	slot5 = v.x * self._scale

	self._slider_r.set_value(slot3, self._slider_r)

	slot5 = v.y * self._scale

	self._slider_g.set_value(slot3, self._slider_g)

	slot4 = self

	self.set_text(slot3)

	return 
end
DBDropdown = DBDropdown or class()
function DBDropdown:init(editor, p, name, db_key)
	self._editor = editor
	self._name = name
	self._db_key = db_key
	slot10 = name
	self._box = EWS.StaticBoxSizer(slot6, EWS, p, "VERTICAL")
	slot8 = "HORIZONTAL"
	self._button_box = EWS.BoxSizer(slot6, EWS)
	slot11 = "EXPAND"

	self._box.add(slot6, self._box, self._button_box, 1, 0)

	slot8 = "HORIZONTAL"
	self._value_box = EWS.BoxSizer(slot6, EWS)
	self._combobox = EWS.ComboBox(slot6, EWS, p, "", "")
	slot14 = "on_combobox_changed"
	slot11 = ""

	self._combobox.connect(slot6, self._combobox, "", "EVT_COMMAND_COMBOBOX_SELECTED", callback("CB_SORT,CB_READONLY", self, self))

	slot7 = self

	self.append_values(slot6)

	slot11 = "EXPAND"

	self._value_box.add(slot6, self._value_box, self._combobox, 1, 0)

	slot11 = "EXPAND"

	self._box.add(slot6, self._box, self._value_box, 1, 0)

	return 
end
function DBDropdown:append_values()
	local value = nil
	slot6 = LightIntensityDB

	for _, v in ipairs(LightIntensityDB.list(slot5)) do
		slot9 = self._combobox
		slot12 = v

		self._combobox.append(slot8, v.s(slot11))

		slot9 = v
		value = v.s(slot8)
	end

	if value then
		slot5 = value

		self._combobox.set_value(slot3, self._combobox)
	end

	return 
end
function DBDropdown:get_value()
	slot6 = self._combobox

	return "#" .. self._db_key .. "#" .. self._combobox.get_value(slot5)
end
function DBDropdown:on_combobox_changed()
	slot3 = self._editor

	self._editor.value_is_changed(slot2)

	return 
end
function DBDropdown:set_value(v)
	slot4 = v

	if type(slot3) == "string" then
		slot5 = 2
		local str = string.sub(slot3, v)
		slot5 = str

		assert(v)

		slot6 = "#"
		local i = string.find(v, str)

		assert(str)

		slot8 = i - 1
		local db_key = string.sub(str, str, 1)
		slot7 = db_key and db_key == self._db_key

		assert(i)

		slot8 = i + 1
		local value_key = string.sub(i, str)
		slot8 = value_key

		assert(str)

		slot9 = value_key

		self._combobox.set_value(str, self._combobox)
	end

	return 
end
SingelSlider = SingelSlider or class()
function SingelSlider:init(editor, p, name, picker, min, max, scale, display_scale, picky)
	self._scale = scale
	self._editor = editor
	self._name = name
	self._min = min
	self._picky = picky

	if display_scale then
		self._display_scale = display_scale
	else
		self._display_scale = 1
	end

	slot15 = name
	self._box = EWS.StaticBoxSizer(slot11, EWS, p, "VERTICAL")
	slot13 = "HORIZONTAL"
	self._button_box = EWS.BoxSizer(slot11, EWS)

	if picker == "height" or picker == "all" then
		self._height_btn = EWS.Button(slot11, EWS, p, "Pick Height", "")
		slot19 = "on_pick_height_button"
		slot16 = ""

		self._height_btn.connect(slot11, self._height_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

		slot16 = "EXPAND"

		self._button_box.add(slot11, self._button_box, self._height_btn, 0, 0)
	end

	if picker == "depth" or picker == "all" then
		self._depth_btn = EWS.Button(slot11, EWS, p, "Pick Depth", "")
		slot19 = "on_pick_depth_button"
		slot16 = ""

		self._depth_btn.connect(slot11, self._depth_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

		slot16 = "EXPAND"

		self._button_box.add(slot11, self._button_box, self._depth_btn, 0, 0)
	end

	slot16 = "EXPAND"

	self._box.add(slot11, self._box, self._button_box, 1, 0)

	slot13 = "HORIZONTAL"
	self._slider_box = EWS.BoxSizer(slot11, EWS)
	slot16 = ""
	self._chackbox = EWS.CheckBox(slot11, EWS, p, "", "")
	slot13 = "Feed Zero"

	self._chackbox.set_tool_tip(slot11, self._chackbox)

	slot16 = "EXPAND"

	self._slider_box.add(slot11, self._slider_box, self._chackbox, 0, 0)

	self._slider = EWS.Slider(slot11, EWS, p, 0, min)
	slot19 = "on_slider"

	self._slider.connect(slot11, self._slider, "", "EVT_SCROLL_THUMBTRACK", callback(max, self, self))

	slot19 = "on_slider_changed"
	slot16 = ""

	self._slider.connect(slot11, self._slider, "", "EVT_SCROLL_CHANGED", callback("", self, self))

	slot16 = "EXPAND"

	self._slider_box.add(slot11, self._slider_box, self._slider, 5, 0)

	self._slider_textctrl = EWS.TextCtrl(slot11, EWS, p, "", "")
	slot19 = "on_update_textctrl"
	slot16 = ""

	self._slider_textctrl.connect(slot11, self._slider_textctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot16 = "EXPAND"

	self._slider_box.add(slot11, self._slider_box, self._slider_textctrl, 1, 0)

	slot16 = "EXPAND"

	self._box.add(slot11, self._box, self._slider_box, 1, 0)

	slot12 = self

	self.set_text(slot11)

	return 
end
function SingelSlider:get_value()
	slot3 = self._chackbox

	if self._chackbox.get_value(slot2) then
		return self._min
	else
		slot3 = self._slider

		return self._slider.get_value(slot2) / self._scale
	end

	return 
end
function SingelSlider:on_pick_depth_button()
	self._editor._update_pick_element = self
	self._editor._update_pick_element_type = "depth"

	return 
end
function SingelSlider:on_pick_height_button()
	self._editor._update_pick_element = self
	self._editor._update_pick_element_type = "height"

	return 
end
function SingelSlider:on_slider_changed()
	slot3 = self

	self.set_text(slot2)

	slot3 = self._editor

	self._editor.value_is_changed(slot2)

	return 
end
function SingelSlider:on_slider()
	if self._picky then
		slot3 = self._editor

		self._editor.value_is_changed(slot2)
	end

	slot3 = self

	self.set_text(slot2)

	return 
end
function SingelSlider:on_update_textctrl()
	slot5 = self._slider_textctrl
	local n = tonumber(self._slider_textctrl.get_value(slot4))
	slot4 = n

	if type(self._slider_textctrl.get_value) ~= "number" then
		n = 0
	end

	slot5 = (n * self._display_scale) / self._scale

	self.set_value(slot3, self)

	slot4 = self._editor

	self._editor.value_is_changed(slot3)

	return 
end
function SingelSlider:set_text()
	slot3 = self._slider_textctrl
	slot8 = self._slider
	slot6 = self._slider.get_value(slot7) / self._display_scale

	self._slider_textctrl.set_value(slot2, tostring(slot5))

	return 
end
function SingelSlider:set_value(v)
	slot5 = v * self._scale

	self._slider.set_value(slot3, self._slider)

	slot4 = self

	self.set_text(slot3)

	return 
end
EnvironmentEditorEnvMixer = EnvironmentEditorEnvMixer or class()
function EnvironmentEditorEnvMixer:init(editor, p, name)
	self._editor = editor
	self._name = name
	slot9 = name
	self._box = EWS.StaticBoxSizer(slot5, EWS, p, "VERTICAL")
	slot7 = "HORIZONTAL"
	self._slider_box = EWS.BoxSizer(slot5, EWS)
	self._slider = EWS.Slider(slot5, EWS, p, 0, 0)
	slot13 = "on_slider_change"

	self._slider.connect(slot5, self._slider, "", "EVT_SCROLL_THUMBTRACK", callback((#self._editor._template_environment_names - 1) * self._editor.MIX_MUL, self, self))

	slot13 = "on_slider_changed"
	slot10 = ""

	self._slider.connect(slot5, self._slider, "", "EVT_SCROLL_CHANGED", callback("", self, self))

	slot10 = "EXPAND"

	self._slider_box.add(slot5, self._slider_box, self._slider, 5, 0)

	slot10 = "EXPAND"

	self._box.add(slot5, self._box, self._slider_box, 1, 0)

	slot9 = 0

	self.update_tool_tip(slot5, self, self._editor._template_environment_names[1], self._editor._template_environment_names[2])

	slot6 = self._editor._template_environment_names

	for _, sub in ipairs(slot5) do
		self._name_str = (self._name_str and self._name_str .. " " .. sub) or sub
	end

	return 
end
function EnvironmentEditorEnvMixer:get_value()
	slot5 = self._slider
	slot3 = self._slider.get_value(slot4) / self._editor.MIX_MUL

	return tostring(slot2) .. " " .. self._name_str
end
function EnvironmentEditorEnvMixer:on_slider_changed()
	slot3 = self._editor

	self._editor.value_is_changed(slot2)

	slot3 = self

	self.on_slider_change(slot2)

	return 
end
function EnvironmentEditorEnvMixer:on_slider_change()
	local val = self._slider.get_value(slot2) / self._editor.MIX_MUL
	slot4 = val
	local fval = math.floor(self._slider)
	local i1 = fval + 1
	local i2 = fval + 2
	local blend = val - fval

	if #self._editor._template_environment_names < i2 then
		i1 = i1 - 1
		i2 = i2 - 1
		blend = 1
	end

	local env1 = self._editor._template_environment_names[i1]
	local env2 = self._editor._template_environment_names[i2]
	slot13 = blend

	self.update_tool_tip(slot9, self, env1, env2)

	slot13 = blend

	self._editor.update_mix(slot9, self._editor, env1, env2)

	return 
end
function EnvironmentEditorEnvMixer:update_tool_tip(env1, env2, blend)
	slot9 = "%.1f"
	slot13 = "%.1f"
	slot16 = blend
	slot7 = string.format(slot8, tostring(slot11)) .. "% " .. env1 .. " - " .. string.format(1 - blend, tostring(slot15)) .. "% " .. env2

	self._slider.set_tool_tip(slot5, self._slider)

	return 
end
function EnvironmentEditorEnvMixer:set_value(v)
	slot10 = "[%w_.]+"
	slot5 = tonumber(string.match(slot8, v)) * self._editor.MIX_MUL

	self._slider.set_value(slot3, self._slider)

	return 
end
RgbBox = RgbBox or class()
function RgbBox:init(editor, p, name)
	self._editor = editor
	slot9 = name
	self._box = EWS.StaticBoxSizer(slot5, EWS, p, "VERTICAL")
	slot7 = "HORIZONTAL"
	self._pick_box = EWS.BoxSizer(slot5, EWS)
	self._pick_btn = EWS.Button(slot5, EWS, p, "Pick Color", "")
	slot13 = "on_pick_button"
	slot10 = ""

	self._pick_btn.connect(slot5, self._pick_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot10 = "EXPAND"

	self._pick_box.add(slot5, self._pick_box, self._pick_btn, 0, 0)

	self._btn = EWS.Button(slot5, EWS, p, "", "")
	slot13 = "on_color_button"
	slot10 = ""

	self._btn.connect(slot5, self._btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot10 = "EXPAND"

	self._pick_box.add(slot5, self._pick_box, self._btn, 0, 0)

	slot10 = "EXPAND"

	self._box.add(slot5, self._box, self._pick_box, 1, 0)

	slot7 = "VERTICAL"
	self._slider_box = EWS.BoxSizer(slot5, EWS)
	slot7 = "HORIZONTAL"
	self._slider_r_box = EWS.BoxSizer(slot5, EWS)
	self._slider_r = EWS.Slider(slot5, EWS, p, 128, 0)
	slot9 = 180

	self._slider_r.set_background_colour(slot5, self._slider_r, 195, 180)

	slot13 = "on_slider"

	self._slider_r.connect(slot5, self._slider_r, "", "EVT_SCROLL_THUMBTRACK", callback(255, self, self))

	slot13 = "on_slider_changed"
	slot10 = ""

	self._slider_r.connect(slot5, self._slider_r, "", "EVT_SCROLL_CHANGED", callback("", self, self))

	slot10 = "EXPAND"

	self._slider_r_box.add(slot5, self._slider_r_box, self._slider_r, 5, 0)

	self._slider_r_textctrl = EWS.TextCtrl(slot5, EWS, p, "", "")
	slot13 = "on_update_textctrl"
	slot10 = ""

	self._slider_r_textctrl.connect(slot5, self._slider_r_textctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot10 = "EXPAND"

	self._slider_r_box.add(slot5, self._slider_r_box, self._slider_r_textctrl, 1, 0)

	slot10 = "EXPAND"

	self._slider_box.add(slot5, self._slider_box, self._slider_r_box, 1, 0)

	slot7 = "HORIZONTAL"
	self._slider_g_box = EWS.BoxSizer(slot5, EWS)
	self._slider_g = EWS.Slider(slot5, EWS, p, 128, 0)
	slot9 = 180

	self._slider_g.set_background_colour(slot5, self._slider_g, 180, 195)

	slot13 = "on_slider"

	self._slider_g.connect(slot5, self._slider_g, "", "EVT_SCROLL_THUMBTRACK", callback(255, self, self))

	slot13 = "on_slider_changed"
	slot10 = ""

	self._slider_g.connect(slot5, self._slider_g, "", "EVT_SCROLL_CHANGED", callback("", self, self))

	slot10 = "EXPAND"

	self._slider_g_box.add(slot5, self._slider_g_box, self._slider_g, 5, 0)

	self._slider_g_textctrl = EWS.TextCtrl(slot5, EWS, p, "", "")
	slot13 = "on_update_textctrl"
	slot10 = ""

	self._slider_g_textctrl.connect(slot5, self._slider_g_textctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot10 = "EXPAND"

	self._slider_g_box.add(slot5, self._slider_g_box, self._slider_g_textctrl, 1, 0)

	slot10 = "EXPAND"

	self._slider_box.add(slot5, self._slider_box, self._slider_g_box, 1, 0)

	slot7 = "HORIZONTAL"
	self._slider_b_box = EWS.BoxSizer(slot5, EWS)
	self._slider_b = EWS.Slider(slot5, EWS, p, 128, 0)
	slot9 = 195

	self._slider_b.set_background_colour(slot5, self._slider_b, 180, 180)

	slot13 = "on_slider"

	self._slider_b.connect(slot5, self._slider_b, "", "EVT_SCROLL_THUMBTRACK", callback(255, self, self))

	slot13 = "on_slider_changed"
	slot10 = ""

	self._slider_b.connect(slot5, self._slider_b, "", "EVT_SCROLL_CHANGED", callback("", self, self))

	slot10 = "EXPAND"

	self._slider_b_box.add(slot5, self._slider_b_box, self._slider_b, 5, 0)

	self._slider_b_textctrl = EWS.TextCtrl(slot5, EWS, p, "", "")
	slot13 = "on_update_textctrl"
	slot10 = ""

	self._slider_b_textctrl.connect(slot5, self._slider_b_textctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot10 = "EXPAND"

	self._slider_b_box.add(slot5, self._slider_b_box, self._slider_b_textctrl, 1, 0)

	slot10 = "EXPAND"

	self._slider_box.add(slot5, self._slider_box, self._slider_b_box, 1, 0)

	slot10 = "EXPAND"

	self._box.add(slot5, self._box, self._slider_box, 0, 0)

	slot6 = self
	slot11 = 0.5

	self.set_value(slot5, Vector3(0, 0.5, 0.5))

	slot8 = true
	slot11 = self
	self._color_dialog = EWS.ColourDialog(slot5, EWS, p, self.get_value(0.5))

	return 
end
function RgbBox:on_slider_changed()
	slot3 = self
	slot10 = self._slider_b
	slot8 = self._slider_b.get_value(self._slider_g) / 255

	self.set_value(slot2, Vector3(slot5, self._slider_r.get_value(slot7) / 255, self._slider_g.get_value(self._slider_r) / 255))

	slot3 = self._editor

	self._editor.value_is_changed(slot2)

	return 
end
function RgbBox:on_slider()
	slot3 = self
	slot10 = self._slider_b
	slot8 = self._slider_b.get_value(self._slider_g) / 255

	self.set_value(slot2, Vector3(slot5, self._slider_r.get_value(slot7) / 255, self._slider_g.get_value(self._slider_r) / 255))

	return 
end
function RgbBox:on_color_button()
	slot3 = self._color_dialog

	if self._color_dialog.show_modal(slot2) then
		slot3 = self
		slot6 = self._color_dialog

		self.set_value(slot2, self._color_dialog.get_colour(slot5))

		slot3 = self

		self.set_text(slot2)

		slot3 = self._editor

		self._editor.value_is_changed(slot2)
	end

	return 
end
function RgbBox:on_pick_button()
	self._editor._update_pick_element = self
	self._editor._update_pick_element_type = "color"

	return 
end
function RgbBox:on_update_textctrl()
	slot5 = self._slider_r_textctrl
	local r = tonumber(self._slider_r_textctrl.get_value(slot4))
	slot4 = r

	if type(self._slider_r_textctrl.get_value) ~= "number" then
		r = 0
	end

	slot6 = self._slider_g_textctrl
	local g = tonumber(self._slider_g_textctrl.get_value(slot5))
	slot5 = g

	if type(self._slider_g_textctrl.get_value) ~= "number" then
		g = 0
	end

	slot7 = self._slider_b_textctrl
	local b = tonumber(self._slider_b_textctrl.get_value(slot6))
	slot6 = b

	if type(self._slider_b_textctrl.get_value) ~= "number" then
		b = 0
	end

	slot6 = self
	slot11 = b / 255

	self.set_value(slot5, Vector3(slot8, r / 255, g / 255))

	slot6 = self._editor

	self._editor.value_is_changed(slot5)

	return 
end
function RgbBox:get_value()
	return self._color
end
function RgbBox:set_text()
	slot3 = self._slider_r_textctrl
	slot6 = self._color.x * 255

	self._slider_r_textctrl.set_value(slot2, tostring(slot5))

	slot3 = self._slider_g_textctrl
	slot6 = self._color.y * 255

	self._slider_g_textctrl.set_value(slot2, tostring(slot5))

	slot3 = self._slider_b_textctrl
	slot6 = self._color.z * 255

	self._slider_b_textctrl.set_value(slot2, tostring(slot5))

	return 
end
function RgbBox:set_value(v)
	self._color = v
	slot4 = self

	self.set_text(slot3)

	slot7 = self._color.z * 255

	self._btn.set_background_colour(slot3, self._btn, self._color.x * 255, self._color.y * 255)

	slot5 = self._color.x * 255

	self._slider_r.set_value(slot3, self._slider_r)

	slot5 = self._color.y * 255

	self._slider_g.set_value(slot3, self._slider_g)

	slot5 = self._color.z * 255

	self._slider_b.set_value(slot3, self._slider_b)

	return 
end
EnvEdColorBox = EnvEdColorBox or class()
function EnvEdColorBox:init(editor, p, name, no_value)
	self._editor = editor
	slot10 = name
	self._box = EWS.StaticBoxSizer(slot6, EWS, p, "VERTICAL")
	slot11 = no_value
	self._picker_panel = CoreColorPickerPanel.ColorPickerPanel.new(slot6, CoreColorPickerPanel.ColorPickerPanel, p, false, "HORIZONTAL")
	slot13 = "on_changed"

	self._picker_panel.connect(slot6, self._picker_panel, "EVT_COLOR_UPDATED", CoreEvent.callback("HORIZONTAL", self, self))

	slot8 = "EVT_COLOR_CHANGED"
	slot13 = "on_leftup"

	self._picker_panel.connect(slot6, self._picker_panel, CoreEvent.callback(self._picker_panel, self, self))

	slot10 = self._picker_panel
	slot11 = "EXPAND"

	self._box.add(slot6, self._box, self._picker_panel.panel(CoreEvent.callback), 0, 0)

	slot8 = self

	self._editor.add_updator(slot6, self._editor)

	slot9 = 0
	self._color = Vector3(slot6, 0, 0)

	return 
end
function EnvEdColorBox:update(t, dt)
	slot7 = dt

	self._picker_panel.update(slot4, self._picker_panel, t)

	return 
end
function EnvEdColorBox:on_changed(sender, color)
	slot7 = color.b
	self._color = Vector3(slot4, color.r, color.g)

	return 
end
function EnvEdColorBox:on_leftup()
	slot3 = self._editor

	self._editor.value_is_changed(slot2)

	return 
end
function EnvEdColorBox:get_value()
	return self._color
end
function EnvEdColorBox:set_value(v)
	self._color = v
	slot4 = self._picker_panel
	slot9 = v.z

	self._picker_panel.set_color(slot3, Color(slot6, v.x, v.y))

	return 
end
EnvEdEditBox = EnvEdEditBox or class()
function EnvEdEditBox:init(editor, p, name, no_value)
	self._editor = editor
	slot10 = name
	self._box = EWS.StaticBoxSizer(slot6, EWS, p, "VERTICAL")
	self._value = "default"
	self._textctrl = EWS.TextCtrl(slot6, EWS, p, self._value, "")
	slot14 = "text_changed"
	slot11 = ""

	self._textctrl.connect(slot6, self._textctrl, "", "EVT_COMMAND_TEXT_UPDATED", callback("", self, self))

	slot11 = "EXPAND"

	self._box.add(slot6, self._box, self._textctrl, 0, 0)

	return 
end
function EnvEdEditBox:text_changed()
	slot3 = self._textctrl
	self._value = self._textctrl.get_value(slot2)
	slot3 = self._editor

	self._editor.value_is_changed(slot2)

	return 
end
function EnvEdEditBox:get_value()
	return self._value
end
function EnvEdEditBox:set_value(value)
	self._value = value
	slot5 = value

	self._textctrl.set_value(slot3, self._textctrl)

	return 
end
PathBox = PathBox or class()
function PathBox:init(editor, p, name)
	self._editor = editor
	slot9 = name
	self._box = EWS.StaticBoxSizer(slot5, EWS, p, "VERTICAL")
	slot7 = "HORIZONTAL"
	local h_box = EWS.BoxSizer(slot5, EWS)
	self._btn = EWS.Button(EWS, EWS, p, "Browse", "")
	slot14 = "on_path_button"
	slot11 = ""

	self._btn.connect(EWS, self._btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot11 = "EXPAND"

	h_box.add(EWS, h_box, self._btn, 0, 0)

	slot11 = "EXPAND"

	self._box.add(EWS, self._box, h_box, 1, 0)

	slot11 = ""
	self._path_text = EWS.StaticText(EWS, EWS, p, name, "")

	self._box.add(EWS, self._box, self._path_text, 0, 0)

	self._path = ""
	slot12 = managers.database
	slot13 = "OPEN,FILE_MUST_EXIST"
	self._path_dialog = EWS.FileDialog(EWS, EWS, p, "Sky Scene", managers.database.base_path("EXPAND"), "", "Scene files (*.scene)|*.scene")

	return 
end
function PathBox:on_path_button()
	slot3 = self._path_dialog

	if self._path_dialog.show_modal(slot2) then
		local dialog_path = self._path_dialog.get_path(slot2)
		slot4 = self
		slot8 = dialog_path

		self.set_value(self._path_dialog, managers.database.entry_path(slot6, managers.database))

		slot4 = self._editor

		self._editor.value_is_changed(self._path_dialog)
	end

	return 
end
function PathBox:get_value()
	return self._path
end
function PathBox:set_value(v)
	self._path = v
	slot5 = self._path

	self._path_text.set_label(slot3, self._path_text)

	return 
end
DBPickDialog = DBPickDialog or class()
function DBPickDialog:init(editor, p, name, pick_type)
	self._editor = editor
	self._parent = p
	slot10 = name
	self._box = EWS.StaticBoxSizer(slot6, EWS, p, "VERTICAL")
	slot8 = "HORIZONTAL"
	local h_box = EWS.BoxSizer(slot6, EWS)
	self._clear_btn = EWS.Button(EWS, EWS, p, "Clear", "")
	slot15 = "set_value"
	slot12 = ""

	self._clear_btn.connect(EWS, self._clear_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot12 = "EXPAND"

	h_box.add(EWS, h_box, self._clear_btn, 0, 0)

	self._btn = EWS.Button(EWS, EWS, p, "Browse", "")
	slot15 = "on_path_button"
	slot12 = ""

	self._btn.connect(EWS, self._btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot12 = "EXPAND"

	h_box.add(EWS, h_box, self._btn, 0, 0)

	slot12 = "EXPAND"

	self._box.add(EWS, self._box, h_box, 1, 0)

	slot12 = ""
	self._path_text = EWS.StaticText(EWS, EWS, p, "", "")
	slot12 = "EXPAND"

	self._box.add(EWS, self._box, self._path_text, 0, 0)

	self._path = ""
	self._pick_type = pick_type or ""

	return 
end
function DBPickDialog:on_path_button()
	slot5 = "Textures (*.dds)|*.dds"
	local path = managers.database.open_file_dialog(slot2, managers.database, self._parent)

	if path then
		slot4 = self
		slot8 = path

		self.set_value(slot3, managers.database.entry_path(slot6, managers.database))
	end

	return 
end
function DBPickDialog:get_value()
	return self._path
end
function DBPickDialog:set_value(v)
	self._path = v
	slot5 = self._path

	self._path_text.set_label(slot3, self._path_text)

	return 
end
CustomCheckBox = CustomCheckBox or class()
function CustomCheckBox:init(editor, p, text)
	self._editor = editor
	slot9 = ""
	self._box = EWS.StaticBoxSizer(slot5, EWS, p, "HORIZONTAL")
	self._check_box = EWS.CheckBox(slot5, EWS, p, text, "")
	slot13 = "on_checkbox"
	slot10 = ""

	self._check_box.connect(slot5, self._check_box, "", "EVT_COMMAND_CHECKBOX_CLICKED", callback("", self, self))

	slot10 = "EXPAND"

	self._box.add(slot5, self._box, self._check_box, 1, 0)

	return 
end
function CustomCheckBox:on_checkbox()
	slot3 = self._editor

	self._editor.value_is_changed(slot2)

	return 
end
function CustomCheckBox:get_value()
	slot3 = self._check_box
	local v = self._check_box.get_value(slot2)

	if v then
		return 1
	else
		return 0
	end

	return 
end
function CustomCheckBox:set_value(v)
	slot5 = 0 < v

	self._check_box.set_value(slot3, self._check_box)

	return 
end
ConnectDialog = ConnectDialog or class()
function ConnectDialog:init(p)
	slot12 = 0
	slot13 = 0
	slot10 = "CAPTION,SYSTEM_MENU"
	self._dialog = EWS.Dialog(slot3, EWS, p, "Connect Client", "", Vector3(slot9, 0, 0), Vector3(0, 300, 75))
	slot5 = "VERTICAL"
	local box = EWS.BoxSizer(slot3, EWS)
	slot6 = "HORIZONTAL"
	local text_box = EWS.BoxSizer(EWS, EWS)
	self._text_ctrl = EWS.TextCtrl(EWS, EWS, self._dialog, "", "")
	slot7 = "192.168.0.1"

	self._text_ctrl.set_value(EWS, self._text_ctrl)

	slot13 = "on_connect_button"
	slot10 = ""

	self._text_ctrl.connect(EWS, self._text_ctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot10 = "EXPAND"

	text_box.add(EWS, text_box, self._text_ctrl, 3, 0)

	self._port_text_ctrl = EWS.TextCtrl(EWS, EWS, self._dialog, "", "")
	slot7 = "12345"

	self._port_text_ctrl.set_value(EWS, self._port_text_ctrl)

	slot13 = "on_connect_button"
	slot10 = ""

	self._port_text_ctrl.connect(EWS, self._port_text_ctrl, "", "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot10 = "EXPAND"

	text_box.add(EWS, text_box, self._port_text_ctrl, 1, 0)

	slot10 = "EXPAND"

	box.add(EWS, box, text_box, 0, 0)

	slot7 = "HORIZONTAL"
	local button_box = EWS.BoxSizer(EWS, EWS)
	self._connect = EWS.Button(EWS, EWS, self._dialog, "Connect", "")
	slot14 = "on_connect_button"
	slot11 = ""

	self._connect.connect(EWS, self._connect, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot11 = "EXPAND"

	button_box.add(EWS, button_box, self._connect, 1, 0)

	self._cancel = EWS.Button(EWS, EWS, self._dialog, "Cancel", "")
	slot14 = "on_cancel_button"
	slot11 = ""

	self._cancel.connect(EWS, self._cancel, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot11 = "EXPAND"

	button_box.add(EWS, button_box, self._cancel, 1, 0)

	slot11 = "EXPAND"

	box.add(EWS, box, button_box, 0, 0)

	slot8 = box

	self._dialog.set_sizer(EWS, self._dialog)

	return 
end
function ConnectDialog:show_modal()
	self._done = false
	self._return_val = true
	slot3 = self._dialog

	self._dialog.show_modal(slot2)

	while not self._done do
	end

	return self._return_val
end
function ConnectDialog:on_connect_button()
	self._done = true
	slot4 = ""

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
function ConnectDialog:on_cancel_button()
	self._done = true
	self._return_val = false
	slot4 = ""

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
function ConnectDialog:get_ip()
	slot3 = self._text_ctrl

	return self._text_ctrl.get_value(slot2)
end
function ConnectDialog:get_port()
	slot5 = self._port_text_ctrl

	return tonumber(self._port_text_ctrl.get_value(slot4))
end

return 
