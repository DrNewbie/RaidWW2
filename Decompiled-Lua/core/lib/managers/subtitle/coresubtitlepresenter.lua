-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreSubtitlePresenter"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

slot3 = "CoreSubtitleSequence"

core.import(slot1, core)

SubtitlePresenter = SubtitlePresenter or CoreClass.class()

if not DebugPresenter then
	slot2 = SubtitlePresenter
	slot0 = CoreClass.class(slot1)
end

DebugPresenter = slot0

if not OverlayPresenter then
	slot2 = SubtitlePresenter
	slot0 = CoreClass.class(slot1)
end

OverlayPresenter = slot0
function SubtitlePresenter:destroy()
	return 
end
function SubtitlePresenter:update(time, delta_time)
	return 
end
function SubtitlePresenter:show()
	return 
end
function SubtitlePresenter:hide()
	return 
end
function SubtitlePresenter:show_text(text, duration)
	return 
end
function SubtitlePresenter:preprocess_sequence(sequence)
	return sequence
end
function DebugPresenter:destroy()
	slot3 = "subtitle_manager"
	slot6 = "SubtitlePresenter is destroyed."

	CoreDebug.cat_print(slot2, string.format(slot5))

	return 
end
function DebugPresenter:show()
	slot3 = "subtitle_manager"
	slot6 = "SubtitlePresenter is shown."

	CoreDebug.cat_print(slot2, string.format(slot5))

	return 
end
function DebugPresenter:hide()
	slot3 = "subtitle_manager"
	slot6 = "SubtitlePresenter hides."

	CoreDebug.cat_print(slot2, string.format(slot5))

	return 
end
function DebugPresenter:show_text(text, duration)

	-- Decompilation error in this vicinity:
	slot3 = CoreDebug.cat_print
	slot5 = "subtitle_manager"
	slot6 = string.format
	slot8 = "SubtitlePresenter displays \"%s\" %s."
	slot9 = text
end
function OverlayPresenter:init(font_name, font_size)
	slot5 = self
	slot3 = self.set_font

	if not font_name then
		slot8 = self
		slot6 = self._default_font_name(slot7)
	end

	if not font_size then
		slot9 = self
		slot7 = self._default_font_size(slot8)
	end

	slot3(slot4, slot5, slot6)

	slot5 = self

	self._clear_workspace(slot4)

	slot5 = managers.viewport
	slot10 = "_on_resolution_changed"
	self.__resolution_changed_id = managers.viewport.add_resolution_changed_func(slot4, CoreEvent.callback(slot7, self, self))
	self.__nation_icon = nil

	return 
end
function OverlayPresenter:destroy()
	if self.__resolution_changed_id and managers.viewport then
		slot4 = self.__resolution_changed_id

		managers.viewport.remove_resolution_changed_func(slot2, managers.viewport)
	end

	self.__resolution_changed_id = nil
	slot3 = self.__subtitle_panel

	if CoreCode.alive(slot2) then
		slot3 = self.__subtitle_panel

		self.__subtitle_panel.stop(slot2)

		slot3 = self.__subtitle_panel

		self.__subtitle_panel.clear(slot2)
	end

	self.__subtitle_panel = nil
	slot3 = self.__ws

	if CoreCode.alive(slot2) then
		slot3 = self.__ws
		slot4 = self.__ws

		self.__ws.gui(slot2).destroy_workspace(slot2, self.__ws.gui(slot2))
	end

	self.__ws = nil

	return 
end
function OverlayPresenter:show()
	slot3 = self.__ws

	self.__ws.show(slot2)

	return 
end
function OverlayPresenter:hide()
	slot3 = self.__ws

	self.__ws.hide(slot2)

	return 
end
function OverlayPresenter:set_debug(enabled)
	if self.__ws then
		slot4 = self.__ws
		slot5 = enabled

		self.__ws.panel(slot3).set_debug(slot3, self.__ws.panel(slot3))
	end

	return 
end
function OverlayPresenter:set_font(font_name, font_size)
	slot7 = font_name
	self.__font_name = assert(slot4, tostring(slot6))
	slot7 = font_size
	slot6 = "Invalid font size parameter."
	self.__font_size = assert(slot4, tonumber("Invalid font name parameter."))

	if self.__subtitle_panel then
		slot5 = {
			"layout",
			"label",
			"shadow"
		}

		for _, ui_element_name in ipairs(slot4) do
			slot11 = ui_element_name
			local ui_element = self.__subtitle_panel.child(slot9, self.__subtitle_panel)

			if ui_element then
				slot11 = ui_element
				slot14 = self.__font_name

				ui_element.set_font(slot10, Idstring(slot13))

				slot12 = self.__font_size

				ui_element.set_font_size(slot10, ui_element)
			end
		end
	end

	slot5 = self.__ws

	if CoreCode.alive(slot4) then
		slot5 = self.__ws
		slot6 = "string_width"
		local string_width_measure_text_field = self.__ws.panel(slot4).child(slot4, self.__ws.panel(slot4))
	end

	if string_width_measure_text_field then
		slot6 = string_width_measure_text_field
		slot9 = self.__font_name

		string_width_measure_text_field.set_font(slot5, Idstring(slot8))

		slot7 = self.__font_size

		string_width_measure_text_field.set_font_size(slot5, string_width_measure_text_field)
	end

	return 
end
function OverlayPresenter:set_width(pixels)
	local safe_width = self._gui_width(slot3)
	slot6 = safe_width
	self.__width = math.min(self, pixels)
	slot5 = self.__subtitle_panel

	if CoreCode.alive(self) then
		slot5 = self
		slot6 = self.__width

		self._layout_text_field(slot4).set_width(slot4, self._layout_text_field(slot4))
	end

	return 
end
function OverlayPresenter:show_text(text, duration, color, nationality_icon)
	if text == nil or text == "" then
		return 
	end

	slot8 = "label"

	if not self.__subtitle_panel.child(slot6, self.__subtitle_panel) then
		slot8 = {
			name = "label",
			vertical = "top",
			wrap = true,
			align = "center",
			y = 1,
			x = 32,
			layer = 1,
			font = self.__font_name,
			font_size = self.__font_size,
			color = Color.white
		}
		local label = self.__subtitle_panel.text(slot6, self.__subtitle_panel)
	end

	slot9 = "shadow"

	if not self.__subtitle_panel.child(slot7, self.__subtitle_panel) then
		slot9 = {
			y = 2,
			name = "shadow",
			vertical = "top",
			wrap = true,
			align = "center",
			word_wrap = true,
			visible = false,
			x = 33,
			layer = 0,
			font = self.__font_name,
			font_size = self.__font_size,
			color = Color.black.with_alpha(slot11, Color.black)
		}
		slot13 = 0.5
		local shadow = self.__subtitle_panel.text(slot7, self.__subtitle_panel)
	end

	slot12 = self.__subtitle_panel
	slot10 = self.__subtitle_panel.w(slot11) - 64

	label.set_w(slot8, label)

	slot12 = self.__subtitle_panel
	slot10 = self.__subtitle_panel.w(slot11) - 64

	shadow.set_w(slot8, shadow)

	if nationality_icon ~= nil then
		slot10 = "nation_icon"

		if not self.__subtitle_panel.child(slot8, self.__subtitle_panel) then
			slot10 = {
				name = "nation_icon",
				h = 32,
				y = 1,
				w = 32,
				layer = 1,
				visible = true,
				x = 1,
				texture = nationality_icon.texture,
				texture_rect = nationality_icon.texture_rect
			}
			local nation_icon = self.__subtitle_panel.bitmap(slot8, self.__subtitle_panel)
		end

		slot11 = nationality_icon.texture

		nation_icon.set_image(slot9, nation_icon)

		slot10 = nation_icon

		nation_icon.set_texture_rect(slot9, unpack(slot12))

		slot11 = true

		nation_icon.set_visible(slot9, nation_icon)

		slot11 = text
		local string_len = self._string_width(slot9, self)
		slot14 = self.__subtitle_panel
		slot12 = self.__subtitle_panel.w(nationality_icon.texture_rect) / 2 - string_len / 2 - 32 - 3
		local new_x = math.max(self, 1)
		slot13 = new_x

		nation_icon.set_x(1, nation_icon)

		slot13 = Color.white

		label.set_color(1, label)
	else
		slot10 = color or Color.white

		label.set_color(slot8, label)

		slot10 = "nation_icon"

		if self.__subtitle_panel.child(slot8, self.__subtitle_panel) then
			slot10 = "nation_icon"
			slot10 = false

			self.__subtitle_panel.child(slot8, self.__subtitle_panel).set_visible(slot8, self.__subtitle_panel.child(slot8, self.__subtitle_panel))
		end
	end

	slot10 = text

	label.set_text(slot8, label)

	slot10 = text

	shadow.set_text(slot8, shadow)

	return 
end
function OverlayPresenter:preprocess_sequence(sequence)
	slot4 = CoreSubtitleSequence.SubtitleSequence
	local new_sequence = CoreSubtitleSequence.SubtitleSequence.new(slot3)
	slot7 = sequence

	for _, subtitle in ipairs(sequence.subtitles(slot6)) do
		local subtitle_string = subtitle.string(slot9)
		slot13 = sequence
		local wrapped_lines = self._split_string_into_lines(subtitle, self, subtitle_string)
		local lines_per_batch = 2
		slot15 = #wrapped_lines / lines_per_batch
		slot14 = 1
		local batch_count = math.max(subtitle_string, math.ceil(slot14))
		slot14 = subtitle
		local batch_duration = subtitle.duration(math.ceil(slot14)) / batch_count
		local batch = 0

		for line = 1, batch_count * lines_per_batch, 2 do
			slot21 = "\n"
			local wrapped_string = table.concat(slot19, {
				wrapped_lines[line],
				wrapped_lines[line + 1]
			})
			slot21 = new_sequence
			slot28 = subtitle
			slot28 = subtitle.color(slot29)
			slot31 = subtitle

			new_sequence.add_subtitle(, CoreSubtitleSequence.Subtitle.new(slot23, CoreSubtitleSequence.Subtitle, wrapped_string, subtitle.start_time(slot27) + batch_duration * batch, batch_duration, subtitle.nationality_icon(subtitle)))

			batch = batch + 1
		end
	end

	return new_sequence
end
function OverlayPresenter:_clear_workspace()
	slot3 = self.__ws

	if CoreCode.alive(slot2) then
		slot3 = Overlay
		slot4 = self.__ws

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))
	end

	slot3 = managers.gui_data
	self.__ws = managers.gui_data.create_saferect_workspace(slot2)
	slot3 = self.__ws
	slot6 = TimerManager

	self.__ws.set_timer(slot2, TimerManager.game(slot5))

	slot3 = self.__ws
	slot4 = {
		layer = 150
	}
	self.__subtitle_panel = self.__ws.panel(slot2).panel(slot2, self.__ws.panel(slot2))
	slot3 = self

	self._on_resolution_changed(slot2)

	return 
end
function OverlayPresenter:_split_string_into_lines(subtitle_string, owning_sequence)
	slot6 = subtitle_string

	return self._auto_word_wrap_string(slot4, self)
end
function OverlayPresenter:_auto_word_wrap_string(subtitle_string)
	local layout_text_field = self._layout_text_field(slot3)

	layout_text_field.set_text(self, layout_text_field)

	slot7 = layout_text_field

	function slot6(index)
		return index + 1
	end

	local line_breaks = table.collect(self, layout_text_field.line_breaks(subtitle_string))
	local wrapped_lines = {}

	for line = 1, #line_breaks, 1 do
		local range_start = line_breaks[line]
		local range_end = line_breaks[line + 1]
		slot15 = (range_end or 0) - 1
		local string_range = utf8.sub(slot12, subtitle_string, range_start)
		slot14 = wrapped_lines
		slot17 = string_range

		table.insert(subtitle_string, string.trim(slot16))
	end

	return wrapped_lines
end
function OverlayPresenter:_layout_text_field()
	slot3 = self.__subtitle_panel

	assert(slot2)

	slot4 = "layout"

	if not self.__subtitle_panel.child(slot2, self.__subtitle_panel) then
		slot4 = {
			name = "layout",
			vertical = "top",
			word_wrap = true,
			wrap = true,
			align = "center",
			visible = false,
			width = self.__subtitle_panel.w(slot6) - 64,
			font = self.__font_name,
			font_size = self.__font_size
		}
		slot7 = self.__subtitle_panel
		slot1 = self.__subtitle_panel.text(slot2, self.__subtitle_panel)
	end

	return slot1
end
function OverlayPresenter:_string_width(subtitle_string)
	slot4 = self.__ws
	slot5 = "string_width"

	if not self.__ws.panel(slot3).child(slot3, self.__ws.panel(slot3)) then
		slot4 = self.__ws
		slot5 = {
			name = "string_width",
			wrap = true,
			visible = false,
			font = self.__font_name,
			font_size = self.__font_size
		}
		local string_width_measure_text_field = self.__ws.panel(slot3).text(slot3, self.__ws.panel(slot3))
	end

	slot6 = subtitle_string

	string_width_measure_text_field.set_text(slot4, string_width_measure_text_field)

	slot5 = string_width_measure_text_field
	local x, y, width, height = string_width_measure_text_field.text_rect(slot4)

	return width
end
function OverlayPresenter:_on_resolution_changed()
	slot3 = self
	slot1 = self.set_font

	if not self.__font_name then
		slot6 = self
		slot4 = self._default_font_name(slot5)
	end

	if not self.__font_size then
		slot7 = self
		slot5 = self._default_font_size(slot6)
	end

	slot1(slot2, slot3, slot4)

	local width = self._gui_width(slot2)
	local height = self._gui_height(self)
	local safe_rect = managers.gui_data.corner_scaled_size(self)
	slot7 = self.__ws

	managers.gui_data.layout_corner_saferect_workspace(managers.gui_data, managers.gui_data)

	slot7 = 768

	self.__subtitle_panel.set_width(managers.gui_data, self.__subtitle_panel)

	slot7 = 64

	self.__subtitle_panel.set_height(managers.gui_data, self.__subtitle_panel)

	slot7 = 480

	self.__subtitle_panel.set_x(managers.gui_data, self.__subtitle_panel)

	slot7 = 760

	self.__subtitle_panel.set_y(managers.gui_data, self.__subtitle_panel)

	slot7 = "label"
	local label = self.__subtitle_panel.child(managers.gui_data, self.__subtitle_panel)

	if label then
		slot7 = label
		slot10 = self.__subtitle_panel

		label.set_h(slot6, self.__subtitle_panel.h(slot9))

		slot10 = self.__subtitle_panel
		slot8 = self.__subtitle_panel.w(slot9) - 64

		label.set_w(slot6, label)

		slot8 = 32

		label.set_x(slot6, label)
	end

	slot8 = "shadow"
	local shadow = self.__subtitle_panel.child(slot6, self.__subtitle_panel)

	if shadow then
		slot8 = shadow
		slot11 = self.__subtitle_panel

		shadow.set_h(slot7, self.__subtitle_panel.h(slot10))

		slot11 = self.__subtitle_panel
		slot9 = self.__subtitle_panel.w(slot10) - 64

		shadow.set_w(slot7, shadow)

		slot9 = 32

		shadow.set_x(slot7, shadow)
	end

	return 
end
function OverlayPresenter:_gui_width()
	slot3 = self.__subtitle_panel

	return self.__subtitle_panel.width(slot2)
end
function OverlayPresenter:_gui_height()
	slot3 = self.__subtitle_panel

	return self.__subtitle_panel.width(slot2)
end
function OverlayPresenter:_default_font_name()
	return "ui/fonts/pf_din_text_comp_pro_medium_outlined_22"
end
function OverlayPresenter:_default_font_size()
	return 22
end

return 
