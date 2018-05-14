slot3 = "CoreLevelSettingsLayer"

core.module(slot1, core)

slot3 = "CoreLayer"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not LevelSettingsLayer then
	slot2 = CoreLayer.Layer
	slot0 = class(slot1)
end

LevelSettingsLayer = slot0
function LevelSettingsLayer:init(owner)
	slot6 = "level_settings"

	LevelSettingsLayer.super.init(slot3, self, owner)

	self._settings = {}
	self._settings_ctrlrs = {}

	return 
end
function LevelSettingsLayer:get_layer_name()
	return "Level Settings"
end
function LevelSettingsLayer:get_setting(setting)
	return self._settings[setting]
end
function LevelSettingsLayer:get_mission_filter()
	local t = {}

	for i = 1, 5, 1 do
		slot9 = "mission_filter_" .. i

		if self.get_setting(slot7, self) then
			slot9 = i

			table.insert(slot7, t)
		end
	end

	return t
end
function LevelSettingsLayer:load(world_holder, offset)
	slot8 = offset
	self._settings = world_holder.create_world(slot4, world_holder, "world", self._save_name)
	slot5 = self._settings_ctrlrs

	for id, setting in pairs(slot4) do
		if setting.type == "combobox" then
			slot11 = self._settings[id]

			CoreEws.change_combobox_value(slot9, setting.params)
		end
	end

	return 
end
function LevelSettingsLayer:save(save_params)
	local t = {
		single_data_block = true,
		entry = self._save_name,
		data = {
			settings = self._settings
		}
	}
	slot6 = t.data

	self._add_project_save_data(self._settings, self)

	slot6 = t

	managers.editor.add_save_data(self._settings, managers.editor)

	return 
end
function LevelSettingsLayer:update(t, dt)
	return 
end
function LevelSettingsLayer:build_panel(notebook)
	slot5 = "LevelSettingsLayer:build_panel"

	cat_print(slot3, "editor")

	slot7 = "TAB_TRAVERSAL"
	self._ews_panel = EWS.Panel(slot3, EWS, notebook, "")
	slot5 = "HORIZONTAL"
	self._main_sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self._main_sizer

	self._ews_panel.set_sizer(slot3, self._ews_panel)

	slot5 = "VERTICAL"
	self._sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = self._sizer

	self._add_chunk_name(slot3, self, self._ews_panel)

	slot5 = self._sizer

	self._add_simulation_level_id(slot3, self)

	slot5 = self._sizer

	self._add_simulation_mission_filter(slot3, self)

	slot8 = "EXPAND"

	self._main_sizer.add(slot3, self._main_sizer, self._sizer, 1, 0)

	return self._ews_panel
end
function LevelSettingsLayer:_add_simulation_level_id(sizer)
	local id = "simulation_level_id"
	local params = {
		default = "none",
		name = "Simulation level id:",
		value = "none",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Select a level id to use when simulating the level.",
		sorted = true,
		panel = self._ews_panel,
		sizer = sizer
	}
	slot7 = "tweak_data"
	slot6 = rawget(slot5, _G).levels
	params.options = rawget(slot5, _G).levels.get_level_index(slot5)
	local ctrlr = CoreEws.combobox(slot5)
	slot13 = "_set_data"
	slot10 = {
		ctrlr = ctrlr,
		value = id
	}

	ctrlr.connect(params, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot10, self, self))

	self._settings_ctrlrs[id] = {
		default = "none",
		type = "combobox",
		params = params,
		ctrlr = ctrlr
	}

	return 
end
function LevelSettingsLayer:_add_simulation_mission_filter(sizer)
	for i = 1, 5, 1 do
		local id = "mission_filter_" .. i
		slot12 = ""
		local ctrlr = EWS.CheckBox(slot8, EWS, self._ews_panel, "Mission filter " .. i)
		slot11 = false

		ctrlr.set_value(EWS, ctrlr)

		slot16 = "_set_data"
		slot13 = {
			ctrlr = ctrlr,
			value = id
		}

		ctrlr.connect(EWS, ctrlr, "EVT_COMMAND_CHECKBOX_CLICKED", callback(slot13, self, self))

		slot14 = "EXPAND"

		sizer.add(EWS, sizer, ctrlr, 0, 0)

		self._settings_ctrlrs[id] = {
			default = false,
			type = "checkbox",
			ctrlr = ctrlr
		}
	end

	return 
end
function LevelSettingsLayer:_add_chunk_name(panel, sizer)
	local id = "chunk_name"
	slot7 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot5, EWS)
	slot11 = "EXPAND,LEFT"

	sizer.add(EWS, sizer, horizontal_sizer, 0, 1)

	local options = {
		"default",
		"init"
	}
	local combobox_params = {
		name = "Chunk Name",
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "Select an option from the combobox",
		sorted = false,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = horizontal_sizer,
		options = options,
		value = self._settings.chunk_name or options[1]
	}
	local ctrlr = CoreEws.combobox(slot8)
	slot16 = "_set_data"

	ctrlr.connect(combobox_params, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback({
		ctrlr = ctrlr,
		value = id
	}, self, self))

	self._settings_ctrlrs[id] = {
		type = "combobox",
		params = combobox_params,
		ctrlr = ctrlr,
		default = options[1]
	}

	return 
end
function LevelSettingsLayer:_set_data(data)
	slot6 = data.ctrlr
	self._settings[data.value] = data.ctrlr.get_value(slot5)
	slot6 = self._settings[data.value]
	self._settings[data.value] = tonumber(slot5) or self._settings[data.value]

	return 
end
function LevelSettingsLayer:add_triggers()
	slot3 = self

	LevelSettingsLayer.super.add_triggers(slot2)

	local vc = self._editor_data.virtual_controller

	return 
end
function LevelSettingsLayer:activate()
	slot3 = self

	LevelSettingsLayer.super.activate(slot2)

	return 
end
function LevelSettingsLayer:deactivate()
	slot3 = self

	LevelSettingsLayer.super.deactivate(slot2)

	return 
end
function LevelSettingsLayer:clear()
	slot3 = self

	LevelSettingsLayer.super.clear(slot2)

	slot3 = self._settings_ctrlrs

	for id, setting in pairs(slot2) do
		if setting.type == "combobox" then
			slot9 = setting.default

			CoreEws.change_combobox_value(slot7, setting.params)
		elseif setting.type == "checkbox" then
			slot9 = setting.default

			setting.ctrlr.set_value(slot7, setting.ctrlr)
		end
	end

	self._settings = {}

	return 
end

return 
