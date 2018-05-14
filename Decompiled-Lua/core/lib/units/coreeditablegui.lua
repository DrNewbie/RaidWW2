CoreEditableGui = CoreEditableGui or class()
function CoreEditableGui:init(unit)
	self._unit = unit
	self._text = self._text or "Default Text"
	self._cull_distance = self._cull_distance or 5000
	self._sides = self._sides or 1
	self._gui_movie = self._gui_movie or "default_text"
	self._gui_object = self._gui_object or "gui_name"
	self._font = "core/fonts/diesel"
	self._blend_mode = self._blend_mode or "normal"
	self._wrap = self._wrap or false
	self._word_wrap = self._word_wrap or false
	self._render_template = self._render_template or "diffuse_vc_decal"
	self._alpha = self._alpha or 1
	self._shape = {
		self._x or 0,
		self._y or 0,
		self._w or self.width or 1,
		self._h or self.height or 1
	}
	self._vertical = self._vertical or "center"
	self._align = self._align or "left"
	slot4 = World
	self._gui = World.newgui(self._h or self.height or 1)
	self._default_font = self._font
	self._guis = {}

	if self._sides == 1 then
		slot4 = self
		slot7 = self._unit
		slot10 = self._gui_object

		self.add_workspace(slot3, self._unit.get_object(slot6, Idstring(slot9)))
	else
		for i = 1, self._sides, 1 do
			slot8 = self
			slot11 = self._unit
			slot14 = self._gui_object .. i

			self.add_workspace(slot7, self._unit.get_object(slot10, Idstring(slot13)))
		end
	end

	slot5 = "std_text"
	local text_object = self._guis[1].gui.child(slot3, self._guis[1].gui)
	slot5 = text_object
	self._font_size = text_object.font_size(self._guis[1].gui)

	self.set_font_size(self._guis[1].gui, self)

	slot9 = text_object
	slot7 = text_object.color(text_object).blue
	self._font_color = Vector3(self._guis[1].gui, text_object.color(self._font_size).red, text_object.color(text_object).green)

	return 
end
function CoreEditableGui:add_workspace(gui_object)
	slot12 = 0
	local ws = self._gui.create_object_workspace(slot3, self._gui, 0, 0, Vector3(slot9, 0, 0))
	slot5 = ws
	slot8 = "core/guis/core_editable_gui"
	local gui = ws.panel(self._gui).gui(self._gui, Idstring(gui_object))
	local panel = gui.panel(ws.panel(self._gui))
	slot8 = "std_text"
	slot8 = self._wrap

	gui.child(gui, gui).set_wrap(gui, gui.child(gui, gui))

	slot8 = "std_text"
	slot8 = self._word_wrap

	gui.child(gui, gui).set_word_wrap(gui, gui.child(gui, gui))

	slot8 = "std_text"
	slot8 = self._blend_mode

	gui.child(gui, gui).set_blend_mode(gui, gui.child(gui, gui))

	slot8 = "std_text"
	slot7 = gui.child(gui, gui)
	slot10 = "core/fonts/diesel"

	gui.child(gui, gui).set_font(gui, Idstring(slot9))

	slot8 = "std_text"
	slot8 = self._text

	gui.child(gui, gui).set_text(gui, gui.child(gui, gui))

	slot8 = "std_text"
	slot7 = gui.child(gui, gui)

	gui.child(gui, gui).set_render_template(gui, Idstring(slot9))

	slot8 = "std_text"
	slot8 = self._align

	gui.child(gui, gui).set_align(gui, gui.child(gui, gui))

	slot8 = "std_text"
	slot8 = self._vertical

	gui.child(gui, gui).set_vertical(gui, gui.child(gui, gui))

	slot8 = "std_text"
	slot8 = self._alpha

	gui.child(gui, gui).set_alpha(gui, gui.child(gui, gui))

	slot8 = "std_text"
	slot14 = gui
	slot11 = self._shape[4] * gui.h(gui)

	gui.child(gui, gui).set_shape(gui, gui.child(gui, gui), self._shape[1] * gui.w(self._render_template), self._shape[2] * gui.h(gui), self._shape[3] * gui.w(gui))

	slot8 = {
		workspace = ws,
		gui = gui,
		panel = panel
	}

	table.insert(gui, self._guis)

	return 
end
function CoreEditableGui:text()
	return self._text
end
function CoreEditableGui:set_text(text)
	text = text or ""
	self._text = text

	if managers.localization then
		slot5 = text
		text = managers.localization.format_text(slot3, managers.localization)
	end

	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot10 = text

		gui.gui.child(slot8, gui.gui).set_text(slot8, gui.gui.child(slot8, gui.gui))
	end

	return 
end
function CoreEditableGui:default_font()
	return self._default_font
end
function CoreEditableGui:font()
	return self._font
end
function CoreEditableGui:set_font(font)
	self._font = font or self._font
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot9 = gui.gui.child(slot8, gui.gui)
		slot12 = "core/fonts/diesel"

		gui.gui.child(slot8, gui.gui).set_font(slot8, Idstring(slot11))
	end

	slot5 = self._font_size

	self.set_font_size(slot3, self)

	return 
end
function CoreEditableGui:font_size()
	return self._font_size
end
function CoreEditableGui:set_font_size(font_size)
	self._font_size = font_size or self._font_size
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot14 = "std_text"
		slot13 = gui.gui.child(slot12, gui.gui)
		slot10 = self._font_size * (10 * gui.gui.child(slot12, gui.gui).height(slot12)) / 100 * 0.7

		gui.gui.child(slot8, gui.gui).set_font_size(slot8, gui.gui.child(slot8, gui.gui))
	end

	return 
end
function CoreEditableGui:font_color()
	return self._font_color
end
function CoreEditableGui:set_font_color(font_color)
	self._font_color = font_color or self._font_color
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot9 = gui.gui.child(slot8, gui.gui)
		slot15 = self._font_color.z

		gui.gui.child(slot8, gui.gui).set_color(slot8, Color(slot11, 1, self._font_color.x, self._font_color.y))
	end

	return 
end
function CoreEditableGui:align()
	return self._align
end
function CoreEditableGui:set_align(align)
	self._align = align or self._align
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot10 = self._align

		gui.gui.child(slot8, gui.gui).set_align(slot8, gui.gui.child(slot8, gui.gui))
	end

	return 
end
function CoreEditableGui:vertical()
	return self._vertical
end
function CoreEditableGui:set_vertical(vertical)
	self._vertical = vertical or self._vertical
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot10 = self._vertical

		gui.gui.child(slot8, gui.gui).set_vertical(slot8, gui.gui.child(slot8, gui.gui))
	end

	return 
end
function CoreEditableGui:set_blend_mode(blend_mode)
	self._blend_mode = blend_mode or self._blend_mode
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot10 = self._blend_mode

		gui.gui.child(slot8, gui.gui).set_blend_mode(slot8, gui.gui.child(slot8, gui.gui))
	end

	return 
end
function CoreEditableGui:blend_mode()
	return self._blend_mode
end
function CoreEditableGui:set_render_template(render_template)
	self._render_template = render_template or self._render_template
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot9 = gui.gui.child(slot8, gui.gui)
		slot12 = self._render_template

		gui.gui.child(slot8, gui.gui).set_render_template(slot8, Idstring(slot11))
	end

	return 
end
function CoreEditableGui:render_template()
	return self._render_template
end
function CoreEditableGui:set_wrap(wrap)
	if wrap == nil then
		return 
	end

	self._wrap = wrap
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot10 = self._wrap

		gui.gui.child(slot8, gui.gui).set_wrap(slot8, gui.gui.child(slot8, gui.gui))
	end

	return 
end
function CoreEditableGui:wrap()
	return self._wrap
end
function CoreEditableGui:set_word_wrap(word_wrap)
	if word_wrap == nil then
		return 
	end

	self._word_wrap = word_wrap
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot10 = self._word_wrap

		gui.gui.child(slot8, gui.gui).set_word_wrap(slot8, gui.gui.child(slot8, gui.gui))
	end

	return 
end
function CoreEditableGui:word_wrap()
	return self._word_wrap
end
function CoreEditableGui:set_alpha(alpha)
	self._alpha = alpha or self._alpha
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot10 = self._alpha

		gui.gui.child(slot8, gui.gui).set_alpha(slot8, gui.gui.child(slot8, gui.gui))
	end

	return 
end
function CoreEditableGui:alpha()
	return self._alpha
end
function CoreEditableGui:set_shape(shape)
	self._shape = shape or self._shape
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		slot10 = "std_text"
		slot16 = gui.gui
		slot13 = self._shape[4] * gui.gui.h(gui.gui)

		gui.gui.child(slot8, gui.gui).set_shape(slot8, gui.gui.child(slot8, gui.gui), self._shape[1] * gui.gui.w(slot12), self._shape[2] * gui.gui.h(gui.gui), self._shape[3] * gui.gui.w(gui.gui))
	end

	slot4 = self

	self.set_font_size(slot3)

	return 
end
function CoreEditableGui:shape()
	return self._shape
end
function CoreEditableGui:set_debug(enabled)
	return 
end
function CoreEditableGui:on_unit_set_enabled(enabled)
	slot4 = self._guis

	for _, gui in ipairs(slot3) do
		if enabled then
			slot9 = gui.workspace

			gui.workspace.show(slot8)
		else
			slot9 = gui.workspace

			gui.workspace.hide(slot8)
		end
	end

	return 
end
function CoreEditableGui:lock_gui()
	slot3 = self._guis

	for _, gui in ipairs(slot2) do
		slot9 = self._cull_distance

		gui.workspace.set_cull_distance(slot7, gui.workspace)

		slot9 = true

		gui.workspace.set_frozen(slot7, gui.workspace)
	end

	return 
end
function CoreEditableGui:destroy()
	slot3 = self._guis

	for _, gui in ipairs(slot2) do
		slot8 = self._gui

		if alive(slot7) then
			slot8 = gui.workspace

			if alive(slot7) then
				slot9 = gui.workspace

				self._gui.destroy_workspace(slot7, self._gui)
			end
		end
	end

	self._guis = nil

	return 
end

return 
