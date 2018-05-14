TextGui = TextGui or class()
TextGui.COLORS = {}
TextGui.COLORS = {}
slot5 = 0
TextGui.COLORS.black = Color(slot2, 0, 0)
slot5 = 1
TextGui.COLORS.white = Color(slot2, 1, 1)
slot5 = 0
TextGui.COLORS.red = Color(slot2, 0.8, 0)
slot5 = 0
TextGui.COLORS.green = Color(slot2, 0, 0.8)
slot5 = 0.8
TextGui.COLORS.blue = Color(slot2, 0, 0)
slot5 = 0
TextGui.COLORS.yellow = Color(slot2, 0.8, 0.8)
slot5 = 0
TextGui.COLORS.orange = Color(slot2, 0.8, 0.4)
slot5 = 0.4
TextGui.COLORS.light_red = Color(slot2, 0.8, 0.4)
slot5 = 0.8
TextGui.COLORS.light_blue = Color(slot2, 0.4, 0.6)
slot5 = 0.4
TextGui.COLORS.light_green = Color(slot2, 0.6, 0.8)
slot5 = 0.4
TextGui.COLORS.light_yellow = Color(slot2, 0.8, 0.8)
slot5 = 0.4
TextGui.COLORS.light_orange = Color(slot2, 0.8, 0.6)
TextGui.GUI_EVENT_IDS = {
	syncronize = 1,
	timer_set = 2,
	timer_start_count_up = 3,
	timer_start_count_down = 4,
	timer_pause = 5,
	timer_resume = 6,
	number_set = 7
}
function TextGui:init(unit)
	self._unit = unit
	self._visible = true
	self.ROWS = self.ROWS or 2
	self.WIDTH = self.WIDTH or 640
	self.HEIGHT = self.HEIGHT or 360
	self.FONT = self.FONT or "fonts/font_large_mf"
	self.FONT_SIZE = self.FONT_SIZE or 180
	self.COLOR_TYPE = self.COLOR_TYPE or "light_blue"
	self.BG_COLOR_TYPE = self.BG_COLOR_TYPE or nil
	self.TEXT_COLOR = TextGui.COLORS[self.COLOR_TYPE]

	if self.BG_COLOR_TYPE then
		self.BG_COLOR = TextGui.COLORS[self.BG_COLOR_TYPE]
	end

	self._texts_data = {}

	for i = 1, self.ROWS, 1 do
		self._texts_data[i] = {}
		slot9 = 1
		self._texts_data[i].speed = 120 + 240 * math.rand(slot8)
		self._texts_data[i].gap = 20
		self._texts_data[i].texts_data = {}
		self._texts_data[i].iterator = 1
		self._texts_data[i].guis = {}
	end

	self._text = "HELLO WORLD!"
	self._gui_object = self._gui_object or "gui_object"
	slot4 = World
	self._new_gui = World.gui(slot3)
	slot4 = self
	slot7 = self._unit
	slot10 = self._gui_object

	self.add_workspace(slot3, self._unit.get_object(slot6, Idstring(slot9)))

	slot4 = self

	self.setup(slot3)

	slot7 = "text_gui"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(true))

	return 
end
function TextGui:add_workspace(gui_object)
	slot7 = gui_object
	slot12 = 0
	self._ws = self._new_gui.create_object_workspace(slot3, self._new_gui, self.WIDTH, self.HEIGHT, Vector3(slot9, 0, 0))
	slot4 = self._ws
	self._panel = self._ws.panel(slot3)

	return 
end
function TextGui:setup()
	slot3 = self._panel

	self._panel.clear(slot2)

	if self.BG_COLOR then
		slot4 = {
			layer = -1,
			color = self.BG_COLOR
		}
		self._bg_rect = self._panel.rect(slot2, self._panel)
	end

	local font_size = self.FONT_SIZE

	return 
end
function TextGui:_create_text_gui(row)
	local data = self._texts_data[row]
	local text_data = data.texts_data[data.iterator]

	if not text_data then
		return 
	end

	local color = self.COLORS[text_data.color_type or self.COLOR_TYPE]
	local font_size = text_data.font_size or self.FONT_SIZE
	local font = text_data.font or self.FONT
	slot10 = {
		y = 0,
		vertical = "center",
		align = "center",
		visible = true,
		layer = 0,
		text = text_data.text,
		font = font,
		font_size = font_size,
		color = color
	}
	local gui = self._panel.text(slot8, self._panel)

	if self.RENDER_TEMPLATE then
		slot10 = gui
		slot13 = self.RENDER_TEMPLATE

		gui.set_render_template(slot9, Idstring(slot12))
	end

	if self.BLEND_MODE then
		slot11 = self.BLEND_MODE

		gui.set_blend_mode(slot9, gui)
	end

	slot10 = gui
	local _, _, w, h = gui.text_rect(slot9)
	slot15 = w

	gui.set_w(slot13, gui)

	slot15 = h

	gui.set_h(slot13, gui)

	slot14 = self._panel
	local y = self._panel.h(slot13)

	if text_data.align_h and text_data.align_h == "bottom" then
		slot16 = (row - 1) * y / self.ROWS + y / self.ROWS

		gui.set_bottom(slot14, gui)
	else
		slot16 = (row - 1) * y / self.ROWS + y / self.ROWS / 2

		gui.set_center_y(slot14, gui)
	end

	slot15 = self._panel
	local x = self._panel.w(slot14)

	if not self.START_RIGHT then
		if 0 < #data.guis then
			local last_gui = data.guis[#data.guis]
			slot18 = last_gui.gui
			x = last_gui.x + last_gui.gui.w(slot17) + data.gap
		else
			x = 0
		end
	end

	slot17 = x

	gui.set_x(slot15, gui)

	slot17 = {
		gui = gui,
		x = x
	}

	table.insert(slot15, data.guis)

	if text_data.once then
		slot17 = data.iterator

		table.remove(slot15, data.texts_data)
	end

	data.iterator = data.iterator + 1

	if #data.texts_data < data.iterator then
		data.iterator = 1
	end

	return 
end
function TextGui:update(unit, t, dt)
	if not self._visible then
		return 
	end

	slot6 = self._texts_data

	for row, data in ipairs(slot5) do
		if 0 < #data.texts_data and #data.guis == 0 then
			slot12 = row

			self._create_text_gui(slot10, self)
		end

		local i = 1

		while i <= #data.guis do
			local gui_data = data.guis[i]
			slot14 = gui_data.x

			gui_data.gui.set_x(slot12, gui_data.gui)

			gui_data.x = gui_data.x - data.speed * dt

			if i == #data.guis then
				slot14 = gui_data.gui
				slot14 = self._panel

				if gui_data.x + gui_data.gui.w(slot13) + data.gap < self._panel.w(slot13) then
					slot14 = row

					self._create_text_gui(slot12, self)
				end
			end

			slot14 = gui_data.gui

			if gui_data.x + gui_data.gui.w(slot13) < 0 then
				slot13 = gui_data.gui
				slot14 = gui_data.gui

				gui_data.gui.parent(slot12).remove(slot12, gui_data.gui.parent(slot12))

				slot14 = i

				table.remove(slot12, data.guis)
			else
				i = i + 1
			end
		end
	end

	return 
end
function TextGui:set_color_type(type)
	self.COLOR_TYPE = type
	self.TEXT_COLOR = TextGui.COLORS[self.COLOR_TYPE]

	return 
end
function TextGui:set_bg_color_type(type)
	self.BG_COLOR_TYPE = type
	self.BG_COLOR = (self.BG_COLOR_TYPE and TextGui.COLORS[self.BG_COLOR_TYPE]) or nil

	if self.BG_COLOR then
		if not self._bg_rect then
			slot5 = {
				layer = -1,
				color = self.BG_COLOR
			}
			slot2 = self._panel.rect(slot3, self._panel)
		end

		self._bg_rect = slot2
		slot5 = self.BG_COLOR

		self._bg_rect.set_color(slot3, self._bg_rect)
	else
		slot4 = self._bg_rect

		if alive(slot3) then
			slot4 = self._bg_rect
			slot5 = self._bg_rect

			self._bg_rect.parent(slot3).remove(slot3, self._bg_rect.parent(slot3))

			self._bg_rect = nil
		end
	end

	return 
end
function TextGui:add_once_text(...)
	slot3 = self
	local t = self.add_text(slot2, ...)
	t.once = true

	return 
end
function TextGui:add_text(row, text, color_type, font_size, align_h, font)
	local data = self._texts_data[row]
	slot11 = {
		text = text,
		color_type = color_type,
		font_size = font_size,
		align_h = align_h,
		font = font
	}

	table.insert(slot9, data.texts_data)

	return data.texts_data[#data.texts_data]
end
function TextGui:set_row_speed(row, speed)
	local data = self._texts_data[row]
	data.speed = speed

	return 
end
function TextGui:set_row_gap(row, gap)
	local data = self._texts_data[row]
	data.gap = gap

	return 
end
function TextGui:clear_row_and_guis(row)
	local data = self._texts_data[row]

	while 0 < #data.guis do
		local gui_data = table.remove(slot4)
		slot6 = gui_data.gui
		slot7 = gui_data.gui

		gui_data.gui.parent(data.guis).remove(data.guis, gui_data.gui.parent(data.guis))
	end

	slot6 = row

	self.clear_row(slot4, self)

	return 
end
function TextGui:clear_row(row)
	local data = self._texts_data[row]
	data.texts_data = {}
	data.iterator = 1

	return 
end
function TextGui:_test()
	for i = 1, self.ROWS, 1 do
		slot8 = i

		self.clear_row_and_guis(slot6, self)
	end

	local companies = {
		"Big bank",
		"Starbeeze",
		"Overkill",
		"GenSEC",
		"505",
		"Google",
		"Apple",
		"Microsoft",
		"Ilija CORP",
		"New York RNGRS",
		"Nissan",
		"Nintendo",
		"WPC",
		"Murky Water",
		"Beer Company",
		"Ivan food sollution systems",
		"Catfight",
		"LOL"
	}
	slot4 = companies

	for i, company in ipairs(slot3) do
		local j = 10 - math.rand(slot8)
		slot11 = self.ROWS
		local row = math.mod(20, i) + 1
		slot14 = "white"

		self.add_text(i, self, row, company)

		slot18 = j
		slot17 = nil

		self.add_text(slot10, self, row, "" .. ((j < 0 and "") or "+") .. string.format(slot16, "%.2f") .. "%", (j < 0 and "light_red") or "light_green", self.FONT_SIZE / 1.5, "bottom")

		slot14 = "white"

		self.add_text(slot10, self, row, "  ")
	end

	return 
end
function TextGui:_test2()
	for i = 1, self.ROWS, 1 do
		slot8 = i

		self.clear_row_and_guis(slot6, self)
	end

	local texts = {
		"Welcome to Big Bank"
	}
	local texts2 = {
		"Loan",
		"Invest",
		"Market",
		"Stock",
		"Currencies",
		"Global Markets",
		"Sell",
		"Buy",
		"Portfolio",
		"Funds",
		"MONEY!"
	}
	slot5 = texts

	for i, text in ipairs(slot4) do
		slot13 = "green"

		self.add_text(slot9, self, 1, text)
	end

	slot5 = texts2

	for i, text in ipairs(slot4) do
		slot13 = "light_green"

		self.add_text(slot9, self, 2, text)

		slot13 = "light_green"

		self.add_text(slot9, self, 2, " - ")
	end

	return 
end
function TextGui:_sequence_trigger(sequence_name)
	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	slot4 = self._unit
	slot5 = sequence_name

	if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
		slot4 = self._unit
		slot5 = sequence_name

		self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))
	end

	return 
end
function TextGui:set_visible(visible)
	self._visible = visible

	if visible then
		slot4 = self._ws

		self._ws.show(slot3)
	else
		slot4 = self._ws

		self._ws.hide(slot3)
	end

	return 
end
function TextGui:lock_gui()
	slot4 = self._cull_distance

	self._ws.set_cull_distance(slot2, self._ws)

	slot4 = true

	self._ws.set_frozen(slot2, self._ws)

	return 
end
function TextGui:sync_gui_net_event(event_id, value)
	if event_id == TextGui.GUI_EVENT_IDS.syncronize then
		slot6 = value

		self.timer_set(slot4, self)
	elseif event_id == TextGui.GUI_EVENT_IDS.timer_set then
		slot6 = value

		self.timer_set(slot4, self)
	elseif event_id == TextGui.GUI_EVENT_IDS.timer_start_count_up then
		slot5 = self

		self.timer_start_count_up(slot4)
	elseif event_id == TextGui.GUI_EVENT_IDS.timer_start_count_down then
		slot5 = self

		self.timer_start_count_down(slot4)
	elseif event_id == TextGui.GUI_EVENT_IDS.timer_pause then
		slot5 = self

		self.timer_pause(slot4)
	elseif event_id == TextGui.GUI_EVENT_IDS.timer_resume then
		slot5 = self

		self.timer_resume(slot4)
	elseif event_id == TextGui.GUI_EVENT_IDS.number_set then
		slot6 = value

		self.number_set(slot4, self)
	end

	return 
end
function TextGui:destroy()
	slot3 = self._new_gui

	if alive(slot2) then
		slot3 = self._ws

		if alive(slot2) then
			slot4 = self._ws

			self._new_gui.destroy_workspace(slot2, self._new_gui)

			self._ws = nil
			self._new_gui = nil
		end
	end

	return 
end
function TextGui:save(data)
	local state = {
		COLOR_TYPE = self.COLOR_TYPE,
		BG_COLOR_TYPE = self.BG_COLOR_TYPE,
		visible = self._visible
	}
	data.TextGui = state

	return 
end
function TextGui:load(data)
	local state = data.TextGui
	slot6 = state.COLOR_TYPE

	self.set_color_type(slot4, self)

	slot6 = state.BG_COLOR_TYPE

	self.set_bg_color_type(slot4, self)

	if state.visible ~= self._visible then
		slot6 = state.visible

		self.set_visible(slot4, self)
	end

	return 
end

return 
