-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreHeatmapLayer"

core.module(slot1, core)

slot3 = "CoreLayer"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not HeatmapLayer then
	slot2 = CoreLayer.Layer
	slot0 = class(slot1)
end

HeatmapLayer = slot0
function HeatmapLayer:init(owner)
	slot6 = "heatmap"

	HeatmapLayer.super.init(slot3, self, owner)

	self._heatmap_sets = {}

	return 
end
function HeatmapLayer:get_layer_name()
	return "Heatmap"
end
function HeatmapLayer:get_setting(setting)
	return 
end
function HeatmapLayer:load(world_holder, offset)
	return 
end
function HeatmapLayer:save(save_params)
	return 
end
function HeatmapLayer:update(t, dt)
	slot7 = dt

	self._draw(slot4, self, t)

	return 
end
function HeatmapLayer:_draw(t, dt)
	local colors = {}
	slot8 = 0
	colors[1] = Vector3(slot5, 0, 1)
	slot8 = 1
	colors[2] = Vector3(slot5, 0, 0)
	slot8 = 1
	colors[3] = Vector3(slot5, 1, 0)
	slot8 = 1
	colors[4] = Vector3(slot5, 0, 1)
	slot8 = 1
	colors[MULTRES] = Vector3(slot5, 1, 1)
	slot6 = self._heatmap_sets

	for j, set in ipairs(slot5) do
		slot13 = colors[j % 5]

		self._draw_path(slot10, self, set.player)

		slot11 = set.enemies

		for _, path in pairs(slot10) do
			slot17 = path
			slot22 = 0

			self._draw_path(slot15, self, Vector3(slot19, 1, 0))
		end

		slot11 = set.teamai

		for _, path in pairs(slot10) do
			slot17 = path
			slot22 = 0

			self._draw_path(slot15, self, Vector3(slot19, 1, 1))
		end

		slot11 = set.civilians

		for _, path in pairs(slot10) do
			slot17 = path
			slot22 = 0

			self._draw_path(slot15, self, Vector3(slot19, 0, 0))
		end

		slot11 = set.events

		for _, event in ipairs(slot10) do
			slot21 = event[2].z

			Application.draw_sphere(slot15, Application, event[1], 25, event[2].x, event[2].y)
		end
	end

	return 
end
function HeatmapLayer:_draw_path(path, color)
	for i = 1, #path, 2 do
		local p1 = path[i]
		local p2 = path[i + 2]

		if p2 ~= nil then
			slot16 = color.z

			Application.draw_line(slot10, Application, p1, p2, color.x, color.y)
		end
	end

	return 
end
function HeatmapLayer:build_panel(notebook)
	slot5 = "HeatmapLayer:build_panel"

	cat_print(slot3, "editor")

	slot7 = "TAB_TRAVERSAL"
	self._ews_panel = EWS.Panel(slot3, EWS, notebook, "")
	slot5 = "HORIZONTAL"
	self._main_sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self._main_sizer

	self._ews_panel.set_sizer(slot3, self._ews_panel)

	slot5 = "VERTICAL"
	self._sizer = EWS.BoxSizer(slot3, EWS)
	slot8 = "BU_EXACTFIT,NO_BORDER"
	local add_btn = EWS.Button(slot3, EWS, self._ews_panel, "Add heatmap data", "")
	slot9 = "RIGHT"

	self._sizer.add(EWS, self._sizer, add_btn, 0, 5)

	slot11 = "_add_data"
	slot8 = {}

	add_btn.connect(EWS, add_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot9 = "BU_EXACTFIT,NO_BORDER"
	local clr_btn = EWS.Button(EWS, EWS, self._ews_panel, "Clear heatmap data", "")
	slot10 = "RIGHT"

	self._sizer.add(EWS, self._sizer, clr_btn, 0, 5)

	slot12 = "_clr_data"
	slot9 = {}

	clr_btn.connect(EWS, clr_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot10 = "EXPAND"

	self._main_sizer.add(EWS, self._main_sizer, self._sizer, 1, 0)

	return self._ews_panel
end
function HeatmapLayer:_add_data()
	slot5 = "Logs (*.txt)|*.txt"
	local opendlg_path, opendlg_dir = managers.database.open_file_dialog(slot2, managers.database, Global.frame)

	if opendlg_path and opendlg_dir then
		local path = opendlg_path
		local dir = opendlg_dir
		slot7 = "Opening " .. path

		print(slot6)

		slot9 = "r"
		local file = SystemFS.open(slot6, SystemFS, path)
		local data = {}
		local name = file.gets(path)
		slot10 = file
		local server = file.gets(file) == "true"
		data.name = name
		data.is_server = server
		data.player = {}
		data.enemies = {}
		data.teamai = {}
		data.civilians = {}
		data.events = {}
		slot11 = "Found data from " .. name

		print(slot10)

		while true do

			-- Decompilation error in this vicinity:
			slot11 = file
			local line = file.gets(slot10)

			if line == "" then
				break
			end

			slot13 = " "
			local comp = string.split(slot11, line)
			local type = tonumber(line)
			local time = tonumber(comp[1])
			slot17 = comp[5] + 5
			local pos = Vector3(comp[2], comp[3], comp[4])
		end

		slot11 = "Player positions: " .. #data.player

		print(slot10)

		slot14 = data.enemies
		slot11 = "Enemies: " .. table.size(slot13)

		print(slot10)

		slot14 = data.teamai
		slot11 = "TeamAIs: " .. table.size(slot13)

		print(slot10)

		slot14 = data.civilians
		slot11 = "Civilians: " .. table.size(slot13)

		print(slot10)

		slot11 = "Events: " .. #data.events

		print(slot10)

		if self._heatmap_sets == nil then
			self._heatmap_sets = {}
		end

		slot12 = data

		table.insert(slot10, self._heatmap_sets)
	end

	return 
end
function HeatmapLayer:_clr_data()
	self._heatmap_sets = {}

	return 
end
function HeatmapLayer:add_triggers()
	slot3 = self

	HeatmapLayer.super.add_triggers(slot2)

	return 
end
function HeatmapLayer:activate()
	slot3 = self

	HeatmapLayer.super.activate(slot2)

	return 
end
function HeatmapLayer:deactivate()
	slot3 = self

	HeatmapLayer.super.deactivate(slot2)

	return 
end
function HeatmapLayer:clear()
	slot3 = self

	HeatmapLayer.super.clear(slot2)

	slot3 = self

	self._clr_data(slot2)

	return 
end

return 
