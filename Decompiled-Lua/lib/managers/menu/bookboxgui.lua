-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not BookBoxGui then
	slot2 = TextBoxGui
	slot0 = class(slot1)
end

BookBoxGui = slot0
function BookBoxGui:init(ws, title, config)
	config = config or {}
	config.h = config.h or 310
	config.w = config.w or 360
	slot6 = ws
	local x, y = ws.size(slot5)
	config.x = config.x or x - config.w
	config.y = config.y or y - config.h - CoreMenuRenderer.Renderer.border_height
	self._header_type = config.header_type or "event"
	slot13 = config

	BookBoxGui.super.init(slot7, self, ws, title, nil, nil)

	self._pages = {}
	self._page_panels = {}

	return 
end
function BookBoxGui:add_page(name, box_gui, visible)
	slot7 = {
		h = 20,
		w = 40,
		x = 0,
		layer = 10,
		name = name
	}
	local panel = self._panel.panel(slot5, self._panel)
	slot8 = {
		name = "bg_rect",
		layer = 0,
		color = Color(slot10, 1, 0.5, 0.5)
	}
	slot14 = 0.5

	panel.rect(self._panel, panel)

	slot8 = {
		y = 0,
		name = "name_text",
		vertical = "center",
		hvertical = "center",
		align = "center",
		halign = "center",
		x = 0,
		layer = 1,
		text = string.upper(slot10),
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size
	}
	slot11 = name

	panel.text(self._panel, panel)

	slot8 = self._visible and (visible or false)

	box_gui.set_visible(slot6, box_gui)

	slot7 = box_gui
	slot10 = self

	box_gui.set_position(slot6, self.position(slot9))

	slot7 = box_gui
	slot10 = self

	box_gui.set_size(slot6, self.size(slot9))

	slot8 = nil

	box_gui.set_title(slot6, box_gui)

	slot8 = "bottom_line"
	slot8 = false

	box_gui._panel.child(slot6, box_gui._panel).set_visible(slot6, box_gui._panel.child(slot6, box_gui._panel))

	slot8 = "top_line"
	slot8 = false

	box_gui._panel.child(slot6, box_gui._panel).set_visible(slot6, box_gui._panel.child(slot6, box_gui._panel))

	slot8 = panel

	table.insert(slot6, self._page_panels)

	slot7 = self

	self._layout_page_panels(slot6)

	self._pages[name] = {
		box_gui = box_gui,
		panel = panel
	}

	if visible then
		slot8 = name

		self.set_page(slot6, self)
	end

	return 
end
function BookBoxGui:has_page(name)
	return self._pages[name]
end
function BookBoxGui:_layout_page_panels()
	local total_w = 0
	slot4 = self._page_panels

	for _, p in ipairs(slot3) do
		slot10 = "name_text"
		local name_text = p.child(slot8, p)
		slot10 = name_text
		local _, _, wt, ht = name_text.text_rect(p)
		total_w = total_w + wt + 1
	end

	local w = 0
	slot5 = self._page_panels

	for _, p in ipairs(slot4) do
		slot11 = "name_text"
		local name_text = p.child(slot9, p)
		slot11 = name_text
		local _, _, wt, ht = name_text.text_rect(p)
		slot18 = self._panel
		slot15 = wt / total_w * self._panel.w(slot17)
		local ws = math.ceil(slot14)

		if self._header_type == "fit" then
			ws = wt + 10
		end

		slot18 = ht

		p.set_size(slot15, p, ws)
		name_text.set_size(slot15, name_text, ws)

		slot20 = p
		slot18 = p.h(p) / 2

		name_text.set_center(slot15, name_text, p.w(ht) / 2)

		slot17 = "bg_rect"

		p.child(slot15, p).set_size(slot15, p.child(slot15, p), ws)

		slot16 = p
		slot19 = w

		p.set_x(slot15, math.ceil(ht))

		slot18 = p
		w = w + math.ceil(p.w(math.ceil)) + 2
	end

	return 
end
function BookBoxGui:remove_page(name)
	slot5 = name

	print(slot3, "BookBoxGui:remove_page( name )")

	local page = self._pages[name]
	slot6 = page

	print("BookBoxGui:remove_page( name )", "page")

	if not page then
		return 
	end

	slot5 = page.box_gui

	page.box_gui.close(slot4)

	self._pages[name] = nil
	slot7 = name

	print(nil, ":remove_page(", self._active_page_name)

	if self._active_page_name == name then
		self._active_page_name = nil
		slot5 = self._pages
		local n, _ = next(slot4)
		slot8 = n

		print(slot6, "change to")

		slot8 = n

		self.set_page(slot6, self)
	end

	slot5 = self._page_panels

	for i, panel in ipairs(slot4) do
		slot10 = panel

		if panel.name(slot9) == name then
			slot11 = i

			table.remove(slot9, self._page_panels)

			slot11 = panel

			self._panel.remove(slot9, self._panel)
		end
	end

	slot5 = self

	self._layout_page_panels(slot4)

	return 
end
function BookBoxGui:set_size(x, y)
	slot7 = y

	BookBoxGui.super.set_size(slot4, self, x)

	slot5 = self._pages

	for name, page in pairs(slot4) do
		slot12 = y

		page.box_gui.set_size(slot9, page.box_gui, x)
	end

	return 
end
function BookBoxGui:set_centered()
	slot3 = self

	BookBoxGui.super.set_centered(slot2)

	slot3 = self._pages

	for name, page in pairs(slot2) do
		slot9 = self._panel.x(slot10)
		slot12 = self._panel

		page.box_gui.set_position(slot7, page.box_gui, self._panel.y(self._panel))
	end

	return 
end
function BookBoxGui:set_position(x, y)
	slot7 = y

	BookBoxGui.super.set_position(slot4, self, x)

	slot5 = self._pages

	for name, page in pairs(slot4) do
		slot12 = y

		page.box_gui.set_position(slot9, page.box_gui, x)
	end

	return 
end
function BookBoxGui:set_visible(visible)
	slot5 = visible

	BookBoxGui.super.set_visible(slot3, self)

	slot4 = self._pages

	for name, page in pairs(slot3) do
		slot10 = visible and name == self._active_page_name

		page.box_gui.set_visible(slot8, page.box_gui)
	end

	return 
end
function BookBoxGui:set_enabled(enabled)
	slot5 = enabled

	BookBoxGui.super.set_enabled(slot3, self)

	slot4 = self._pages

	for name, page in pairs(slot3) do
		slot10 = enabled

		page.box_gui.set_enabled(slot8, page.box_gui)
	end

	return 
end
function BookBoxGui:set_layer(layer)
	slot5 = layer

	BookBoxGui.super.set_layer(slot3, self)

	slot4 = self._pages

	for name, page in pairs(slot3) do
		slot10 = layer

		page.box_gui.set_layer(slot8, page.box_gui)
	end

	return 
end
function BookBoxGui:close()
	slot3 = self

	BookBoxGui.super.close(slot2)

	slot3 = self._pages

	for name, page in pairs(slot2) do
		if page.box_gui then
			slot8 = page.box_gui

			page.box_gui.close(slot7)
		end
	end

	return 
end
function BookBoxGui:set_page(name)
	if self._active_page_name == name then
		return 
	end

	if self._active_page_name and self._active_page_name ~= name then
		slot4 = self._pages[self._active_page_name].box_gui

		self._pages[self._active_page_name].box_gui.close_page(self._active_page_name)
	end

	slot4 = self._pages

	for page_name, page in pairs(slot3) do

		-- Decompilation error in this vicinity:
		slot10 = self._visible and page_name == name

		page.box_gui.set_visible(slot8, page.box_gui)

		slot10 = "bg_rect"
		slot9 = page.panel.child(slot8, page.panel)
		slot7 = page.panel.child(slot8, page.panel).set_color

		slot7(slot8, slot9)
	end

	self._active_page_name = name
	slot4 = self._pages[self._active_page_name].box_gui

	self._pages[self._active_page_name].box_gui.open_page(self._active_page_name)

	return 
end
function BookBoxGui:input_focus()
	if not self._active_page_name then
		return false
	end

	slot3 = self._pages[self._active_page_name].box_gui

	if self._pages[self._active_page_name].box_gui.input_focus(self._active_page_name) then
		return true
	end

	return 
end
function BookBoxGui:mouse_pressed(button, x, y)
	slot6 = self

	if not self.can_take_input(slot5) then
		return 
	end

	slot6 = "0"

	if button == Idstring(slot5) then
		slot6 = self._pages

		for name, page in pairs(slot5) do
			slot13 = y

			if page.panel.inside(slot10, page.panel, x) then
				slot12 = name

				self.set_page(slot10, self)

				return true
			end
		end
	end

	if not self._active_page_name then
		return false
	end

	slot9 = y

	if self._pages[self._active_page_name].box_gui.mouse_pressed(self._active_page_name, self._pages[self._active_page_name].box_gui, button, x) then
		return true
	end

	return 
end
function BookBoxGui:check_grab_scroll_bar(x, y)
	slot5 = self

	if not self.can_take_input(slot4) then
		return false
	end

	slot7 = y

	if self._text_box.inside(slot4, self._text_box, x) then
		slot6 = "top_line"
		slot7 = y

		if self._text_box.child(slot4, self._text_box).inside(slot4, self._text_box.child(slot4, self._text_box), x) then
			self._grabbed_title = true
			slot5 = self
			self._grabbed_offset_x = self.x(slot4) - x
			slot5 = self
			self._grabbed_offset_y = self.y(slot4) - y

			return true
		end
	end

	if not self._active_page_name then
		return false
	end

	slot7 = y

	if self._pages[self._active_page_name].box_gui.check_grab_scroll_bar(self._active_page_name, self._pages[self._active_page_name].box_gui, x) then
		return true
	end

	return 
end
function BookBoxGui:release_scroll_bar()
	slot3 = self
	local used, pointer = BookBoxGui.super.release_scroll_bar(slot2)

	if used then
		return true, pointer
	end

	if not self._active_page_name then
		return false
	end

	slot5 = self._pages[self._active_page_name].box_gui

	if self._pages[self._active_page_name].box_gui.release_scroll_bar(self._active_page_name) then
		return true
	end

	return 
end
function BookBoxGui:mouse_wheel_down(x, y)
	if not self._visible then
		return 
	end

	if not self._active_page_name then
		return false
	end

	slot7 = y

	if self._pages[self._active_page_name].box_gui.mouse_wheel_down(self._active_page_name, self._pages[self._active_page_name].box_gui, x) then
		return true
	end

	return 
end
function BookBoxGui:mouse_wheel_up(x, y)
	if not self._visible then
		return 
	end

	if not self._active_page_name then
		return false
	end

	slot7 = y

	if self._pages[self._active_page_name].box_gui.mouse_wheel_up(self._active_page_name, self._pages[self._active_page_name].box_gui, x) then
		return true
	end

	return 
end
function BookBoxGui:moved_scroll_bar(x, y)
	slot7 = y
	local used, pointer = BookBoxGui.super.moved_scroll_bar(slot4, self, x)

	if used then
		return true, pointer
	end

	if not self._active_page_name then
		return false
	end

	slot9 = y

	if self._pages[self._active_page_name].box_gui.moved_scroll_bar(self._active_page_name, self._pages[self._active_page_name].box_gui, x) then
		return true
	end

	return 
end
function BookBoxGui:mouse_moved(x, y)
	local pointer = nil
	slot6 = self

	if not self.can_take_input(slot5) then
		return false, pointer
	end

	if not self._active_page_name then
		return false, pointer
	end

	slot8 = y
	local used, wpointer = self._pages[self._active_page_name].box_gui.mouse_moved(self._active_page_name, self._pages[self._active_page_name].box_gui, x)

	if not wpointer then
	end

	if used then
		return true, pointer
	end

	slot10 = y

	if self._mouse_over_page_panel(slot7, self, x) then
		pointer = "arrow"
	else
		slot10 = y

		if self._text_box.inside(slot7, self._text_box, x) then
			slot9 = "top_line"
			slot10 = y

			if self._text_box.child(slot7, self._text_box).inside(slot7, self._text_box.child(slot7, self._text_box), x) then
				pointer = "hand"
			end
		end
	end

	return false, pointer
end
function BookBoxGui:_mouse_over_page_panel(x, y)
	slot5 = self._page_panels

	for _, panel in ipairs(slot4) do
		slot12 = y

		if panel.inside(slot9, panel, x) then
			return panel
		end
	end

	return nil
end

return 
