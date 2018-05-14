-- Decompilation Error: _glue_flows(node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CorePrefHud"

core.module(slot1, core)

PrefHud = PrefHud or class()
PrefHud.CONFIG_FILE_PATH = "core/settings/prefhud"
PrefHud.CONFIG_FILE_EXTENSION = "prefhud"
function PrefHud:init()
	self._const = {
		_bar_y = 14,
		_bar_space = 5,
		_bar_bg_x = 400,
		_bar_bg_y = 200
	}
	self._const._bar_x = self._const._bar_bg_x - self._const._bar_space * 2
	self._upd_interval = 0.1
	slot3 = self

	self.load_config(self._const._bar_bg_x - self._const._bar_space * 2)

	slot3 = self

	self.build_gui(self._const._bar_bg_x - self._const._bar_space * 2)

	slot3 = self

	self.hide(self._const._bar_bg_x - self._const._bar_space * 2)

	return 
end
function PrefHud:remove_counter(name)
	self._counters[name] = nil

	return 
end
function PrefHud:remove_all_counters()
	self._counters = {}

	return 
end
function PrefHud:add_counter(name, sort, min, mid, max, precision, inv, inv_colors, call_str)
	slot10 = self._counters
	slot11 = {
		_current_value = 0,
		_raw_value = 0
	}

	if not sort then
		slot14 = self._counters
		slot12 = table.size(slot13) + 1
	end

	slot11._sort = slot12
	slot11._min = min or 0
	slot11._mid = mid or 0.5
	slot11._max = max or 1
	slot11._inv = inv
	slot11._inv_colors = inv_colors
	slot11._precision = precision or 0
	slot11._call = call_str
	slot14 = "return " .. call_str
	slot11._func = loadstring(slot13)
	slot10[name] = slot11

	return 
end
function PrefHud:load_config()
	slot7 = self.CONFIG_FILE_PATH
	slot7 = self.CONFIG_FILE_PATH
	slot9 = self.CONFIG_FILE_EXTENSION

	assert(slot2, DB.has("[CorePrefHud] Can't open \"" .. tostring(self.CONFIG_FILE_EXTENSION) .. "." .. tostring(slot8) .. "\".", DB, self.CONFIG_FILE_EXTENSION))

	slot4 = Idstring(tostring(self.CONFIG_FILE_EXTENSION))
	slot7 = self.CONFIG_FILE_PATH
	local data = PackageManager.script_data(slot2, PackageManager, Idstring(self.CONFIG_FILE_EXTENSION))
	self._counters = {}
	slot4 = data

	for _, sub_data in ipairs(PackageManager) do
		if sub_data._meta == "counter" then
			slot16 = sub_data.max
			slot18 = sub_data.call

			self.add_counter(slot8, self, sub_data.name, tonumber(slot12), tonumber(sub_data.sort), tonumber(sub_data.min), tonumber(sub_data.mid), sub_data.precision, sub_data.inv == "true", sub_data.inv_colors == "true")
		end
	end

	return 
end
function PrefHud:build_gui()
	if self._workspace then
		slot3 = Overlay
		slot4 = self._workspace

		Overlay.newgui(slot2).destroy_workspace(slot2, Overlay.newgui(slot2))
	end

	local res = RenderSettings.resolution
	local safe_rect = 0.05
	slot6 = "WIN32"

	if SystemInfo.platform(slot4) == Idstring(SystemInfo) then
		safe_rect = 0
	end

	slot5 = Overlay
	slot9 = res.y * safe_rect
	self._workspace = Overlay.newgui(slot4).create_sub_screen_workspace(slot4, Overlay.newgui(slot4), 1000, 1000, res.x * safe_rect)
	slot5 = self._workspace
	slot5 = self._workspace.panel(slot4)
	slot8 = "core/guis/core_prefhud"
	self._gui = self._workspace.panel(slot4).gui(slot4, Idstring(1000))
	self._panel = self._gui.panel(slot4)
	local c = self._const
	slot7 = "bar_bg"
	slot12 = self._counters
	slot10 = table.size(slot11) * (c._bar_y + c._bar_space) + c._bar_space * 2

	self._gui.child(self._gui, self._gui).set_shape(self._gui, self._gui.child(self._gui, self._gui), 0, 0, c._bar_bg_x)

	slot10 = self._counters
	slot8 = table.size(c._bar_bg_x) * (c._bar_y + c._bar_space) + c._bar_space * 2

	self._panel.set_size(self._gui, self._panel, c._bar_bg_x)

	local i = 0
	local s, v, k = nil
	slot10 = self._counters

	while i < table.size(slot9) do
		slot10 = self._counters

		for it_k, it_v in pairs(slot9) do
			if not it_v._obj and it_v._sort <= (s or it_v._sort) then
				s = it_v._sort
				v = it_v
				k = it_k
			end
		end

		s = nil
		slot10 = self._panel
		v._obj = self._panel.rect(slot9)
		slot11 = 1

		v._obj.set_layer(slot9, v._obj)

		slot10 = v._obj
		slot15 = 0

		v._obj.set_color(slot9, Color(slot12, 0, 1))

		slot14 = c._bar_y

		v._obj.set_shape(slot9, v._obj, c._bar_space, c._bar_space + i * (c._bar_y + c._bar_space), c._bar_x)

		slot10 = self._panel
		v._text_obj = self._panel.text(slot9)
		slot11 = 2

		v._text_obj.set_layer(slot9, v._text_obj)

		slot12 = c._bar_space + i * (c._bar_y + c._bar_space)

		v._text_obj.set_position(slot9, v._text_obj, c._bar_space)

		slot18 = v._raw_value
		slot11 = k .. ": " .. tostring(string.format(slot16, "%." .. v._precision .. "f"))

		v._text_obj.set_text(slot9, v._text_obj)

		slot10 = v._text_obj
		slot15 = 0

		v._text_obj.set_color(slot9, Color(": ", 0, 0))

		slot10 = v._text_obj
		slot13 = "core/fonts/system_font"

		v._text_obj.set_font(slot9, Idstring(": "))

		slot11 = c._bar_y

		v._text_obj.set_font_size(slot9, v._text_obj)

		i = i + 1
	end

	return 
end
function PrefHud:show()
	slot3 = self._workspace

	self._workspace.show(slot2)

	self._visible = true

	return 
end
function PrefHud:hide()
	slot3 = self._workspace

	self._workspace.hide(slot2)

	self._visible = false

	return 
end
function PrefHud:toggle()
	if self._visible then
		slot3 = self

		self.hide(slot2)
	else
		slot3 = self

		self.show(slot2)
	end

	return 
end
function PrefHud:update_bars(t, dt)
	if self._upd_interval <= (self._prev_upd or self._upd_interval) then
		self._prev_upd = 0
		slot5 = self._counters

		for k, v in pairs(slot4) do
			local raw_value = v._func()

			if raw_value == nil then
				raw_value = 0
			end

			v._raw_value = raw_value
			slot13 = v._max
			local value = math.clamp(slot10, raw_value, 0)
			v._current_value = value

			if v._inv then
				value = v._max - value
			end

			if v._max <= value then
				if v._inv_colors then
					slot12 = v._obj
					slot17 = 0

					v._obj.set_color(slot11, Color(slot14, 0.8, 0))
				else
					slot12 = v._obj
					slot17 = 0

					v._obj.set_color(slot11, Color(slot14, 0, 0.8))
				end
			elseif v._mid <= value and value <= v._max then
				local t = (value - v._mid) / (v._max - v._mid)

				if v._inv_colors then
					slot13 = v._obj
					slot20 = 0
					slot21 = 0
					slot18 = t

					v._obj.set_color(slot12, math.lerp(slot15, Color(slot17, 0.8, 0.8), Color(0.8, 0.8, 0)))
				else
					slot13 = v._obj
					slot20 = 0
					slot21 = 0
					slot18 = t

					v._obj.set_color(slot12, math.lerp(slot15, Color(slot17, 0.8, 0.8), Color(0.8, 0, 0.8)))
				end
			elseif v._min <= value and value <= v._mid then
				local t = (value - v._min) / (v._mid - v._min)

				if v._inv_colors then
					slot13 = v._obj
					slot20 = 0
					slot21 = 0
					slot18 = t

					v._obj.set_color(slot12, math.lerp(slot15, Color(slot17, 0, 0.8), Color(0, 0.8, 0.8)))
				else
					slot13 = v._obj
					slot20 = 0
					slot21 = 0
					slot18 = t

					v._obj.set_color(slot12, math.lerp(slot15, Color(slot17, 0.8, 0), Color(0.8, 0.8, 0.8)))
				end
			elseif v._inv_colors then
				slot12 = v._obj
				slot17 = 0

				v._obj.set_color(slot11, Color(slot14, 0, 0.8))
			else
				slot12 = v._obj
				slot17 = 0

				v._obj.set_color(slot11, Color(slot14, 0.8, 0))
			end

			local proc = value / v._max
			slot14 = self._const._bar_x * proc

			v._obj.set_width(slot12, v._obj)

			slot21 = v._raw_value
			slot14 = k .. ": " .. tostring(string.format(slot19, "%." .. v._precision .. "f"))

			v._text_obj.set_text(slot12, v._text_obj)
		end
	else
		self._prev_upd = self._prev_upd + dt
	end

	return 
end
local ids_win32 = Idstring(function (self, t, dt)
	if self._upd_interval <= (self._prev_upd or self._upd_interval) then
		self._prev_upd = 0
		slot5 = self._counters

		for k, v in pairs(slot4) do
			local raw_value = v._func()

			if raw_value == nil then
				raw_value = 0
			end

			v._raw_value = raw_value
			slot13 = v._max
			local value = math.clamp(slot10, raw_value, 0)
			v._current_value = value

			if v._inv then
				value = v._max - value
			end

			if v._max <= value then
				if v._inv_colors then
					slot12 = v._obj
					slot17 = 0

					v._obj.set_color(slot11, Color(slot14, 0.8, 0))
				else
					slot12 = v._obj
					slot17 = 0

					v._obj.set_color(slot11, Color(slot14, 0, 0.8))
				end
			elseif v._mid <= value and value <= v._max then
				local t = (value - v._mid) / (v._max - v._mid)

				if v._inv_colors then
					slot13 = v._obj
					slot20 = 0
					slot21 = 0
					slot18 = t

					v._obj.set_color(slot12, math.lerp(slot15, Color(slot17, 0.8, 0.8), Color(0.8, 0.8, 0)))
				else
					slot13 = v._obj
					slot20 = 0
					slot21 = 0
					slot18 = t

					v._obj.set_color(slot12, math.lerp(slot15, Color(slot17, 0.8, 0.8), Color(0.8, 0, 0.8)))
				end
			elseif v._min <= value and value <= v._mid then
				local t = (value - v._min) / (v._mid - v._min)

				if v._inv_colors then
					slot13 = v._obj
					slot20 = 0
					slot21 = 0
					slot18 = t

					v._obj.set_color(slot12, math.lerp(slot15, Color(slot17, 0, 0.8), Color(0, 0.8, 0.8)))
				else
					slot13 = v._obj
					slot20 = 0
					slot21 = 0
					slot18 = t

					v._obj.set_color(slot12, math.lerp(slot15, Color(slot17, 0.8, 0), Color(0.8, 0.8, 0.8)))
				end
			elseif v._inv_colors then
				slot12 = v._obj
				slot17 = 0

				v._obj.set_color(slot11, Color(slot14, 0, 0.8))
			else
				slot12 = v._obj
				slot17 = 0

				v._obj.set_color(slot11, Color(slot14, 0.8, 0))
			end

			local proc = value / v._max
			slot14 = self._const._bar_x * proc

			v._obj.set_width(slot12, v._obj)

			slot21 = v._raw_value
			slot14 = k .. ": " .. tostring(string.format(slot19, "%." .. v._precision .. "f"))

			v._text_obj.set_text(slot12, v._text_obj)
		end
	else
		self._prev_upd = self._prev_upd + dt
	end

	return 
end)
local ids_left_ctrl = Idstring("WIN32")
local ids_f1 = Idstring("left ctrl")
slot5 = SystemInfo
local is_win32 = SystemInfo.platform("f1") == ids_win32
function PrefHud:update_keys()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return 
	--- END OF BLOCK #0 ---



end
function PrefHud:update(t, dt)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if self._visible then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-8, warpins: 1 ---
		slot7 = dt

		self.update_bars(slot4, self, t)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-12, warpins: 2 ---
	slot5 = self

	self.update_keys(slot4)

	return 
	--- END OF BLOCK #1 ---



end
function PrefHud:paused_update(t, dt)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot7 = dt

	self.update(slot4, self, t)

	return 
	--- END OF BLOCK #0 ---



end
function PrefHud:destroy()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = self._workspace

	if alive(slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-13, warpins: 1 ---
		slot3 = Overlay
		slot4 = self._workspace

		Overlay.newgui(slot2).destroy_workspace(slot2, Overlay.newgui(slot2))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end

return 
