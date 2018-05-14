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
slot3 = "CoreSoundLayer"

core.module(slot1, core)

slot3 = "CoreStaticLayer"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

slot2 = "core/lib/units/data/CoreEditorSoundData"

require(slot1)

if not SoundLayer then
	slot2 = CoreStaticLayer.StaticLayer
	slot0 = class(slot1)
end

SoundLayer = slot0
SoundLayer.init = function (self, owner)
	slot8 = "sound_layer"

	SoundLayer.super.init(slot3, self, owner, "sounds", {
		"sound"
	})

	self._muted = false
	self._environment_unit = "core/units/sound_environment/sound_environment"
	self._emitter_unit = "core/units/sound_emitter/sound_emitter"
	self._area_emitter_unit = "core/units/sound_area_emitter/sound_area_emitter"
	self._ignore_global_select = true
	slot6 = "statics"
	self._position_as_slot_mask = self._position_as_slot_mask + managers.slot.get_mask(self, managers.slot)

	return 
end
SoundLayer.load = function (self, world_holder, offset)
	local sound = world_holder.create_world(slot4, world_holder, "world", self._save_name)
	slot6 = self._default_ambience
	slot9 = managers.sound_environment

	CoreEws.change_combobox_value(world_holder, managers.sound_environment.default_ambience(offset))

	slot6 = self._default_environment
	slot9 = managers.sound_environment

	CoreEws.change_combobox_value(world_holder, managers.sound_environment.default_environment(offset))

	slot6 = self._ambience_enabled
	slot9 = managers.sound_environment

	self._ambience_enabled.set_value(world_holder, managers.sound_environment.ambience_enabled(offset))

	slot6 = self._default_occasional
	slot9 = managers.sound_environment

	CoreEws.change_combobox_value(world_holder, managers.sound_environment.default_occasional(offset))

	slot8 = managers.sound_environment

	for _, area in ipairs(managers.sound_environment.areas(managers.sound_environment.default_occasional)) do
		slot13 = area.position(slot14)
		slot16 = area
		local unit = SoundLayer.super.do_spawn_unit(slot10, self, self._environment_unit, area.rotation(area))
		slot12 = area

		if area.name(self) then
			slot13 = unit
			slot16 = area

			self.set_name_id(slot11, self, area.name(slot15))
		end

		slot12 = unit
		unit.sound_data(slot11).environment_area = area
		slot12 = unit
		slot13 = unit

		unit.sound_data(slot11).environment_area.set_unit(slot11, unit.sound_data(slot11).environment_area)
	end

	slot8 = managers.sound_environment

	for _, emitter in ipairs(managers.sound_environment.emitters(slot7)) do
		slot13 = emitter.position(slot14)
		slot16 = emitter
		local unit = SoundLayer.super.do_spawn_unit(slot10, self, self._emitter_unit, emitter.rotation(emitter))
		slot12 = emitter

		if emitter.name(self) then
			slot13 = unit
			slot16 = emitter

			self.set_name_id(slot11, self, emitter.name(slot15))
		end

		slot12 = unit
		unit.sound_data(slot11).emitter = emitter
		slot12 = unit
		slot13 = unit

		unit.sound_data(slot11).emitter.set_unit(slot11, unit.sound_data(slot11).emitter)
	end

	slot8 = managers.sound_environment

	for _, emitter in ipairs(managers.sound_environment.area_emitters(slot7)) do
		slot13 = emitter.position(slot14)
		slot16 = emitter
		local unit = SoundLayer.super.do_spawn_unit(slot10, self, self._area_emitter_unit, emitter.rotation(emitter))
		slot12 = emitter

		if emitter.name(self) then
			slot12 = emitter

			if emitter.name(slot11) ~= "" then
				slot13 = unit
				slot16 = emitter

				self.set_name_id(slot11, self, emitter.name(slot15))
			end
		end

		slot12 = unit
		unit.sound_data(slot11).emitter = emitter
		slot12 = unit
		slot13 = unit

		unit.sound_data(slot11).emitter.set_unit(slot11, unit.sound_data(slot11).emitter)
	end

	slot7 = nil

	self.set_select_unit(slot5, self)

	return 
end
SoundLayer.save = function (self, save_params)
	local file_name = "world_sounds"
	local t = {
		single_data_block = true,
		entry = self._save_name,
		data = {
			file = file_name
		}
	}
	slot7 = t

	managers.editor.add_save_data(slot5, managers.editor)

	local sound_environments = {}
	local sound_emitters = {}
	local sound_area_emitters = {}
	slot9 = self._created_units

	for _, unit in ipairs(slot8) do
		slot15 = self._environment_unit

		if unit.name(slot13) == Idstring(unit) then
			local area = unit.sound_data(slot13).environment_area
			local shape_table = area.save_level_data(unit)
			slot16 = area
			shape_table.environment = area.environment(area)
			slot16 = area
			shape_table.ambience_event = area.ambience_event(area)
			slot16 = area
			shape_table.occasional_event = area.occasional_event(area)
			slot16 = area
			shape_table.use_environment = area.use_environment(area)
			slot16 = area
			shape_table.use_ambience = area.use_ambience(area)
			slot16 = area
			shape_table.use_occasional = area.use_occasional(area)
			slot16 = area
			shape_table.name = area.name(area)
			slot17 = shape_table

			table.insert(area, sound_environments)

			slot17 = {
				category = "soundbanks",
				name = managers.sound_environment.ambience_soundbank(slot19, area.ambience_event(slot22))
			}
			slot20 = managers.sound_environment
			slot23 = area

			managers.editor.add_to_sound_package(area, managers.editor)
		end

		slot15 = self._emitter_unit

		if unit.name(slot13) == Idstring(unit) then
			local emitter = unit.sound_data(slot13).emitter
			slot16 = {
				emitter_event = emitter.emitter_event(slot18),
				position = emitter.position(slot18),
				rotation = emitter.rotation(slot18),
				name = emitter.name(slot18)
			}
			slot19 = emitter
			slot19 = emitter
			slot19 = emitter
			slot19 = emitter

			table.insert(unit, sound_emitters)

			slot16 = {
				category = "soundbanks",
				name = managers.sound_environment.emitter_soundbank(slot18, emitter.emitter_event(slot21))
			}
			slot19 = managers.sound_environment
			slot22 = emitter

			managers.editor.add_to_sound_package(unit, managers.editor)
		end

		slot15 = self._area_emitter_unit

		if unit.name(slot13) == Idstring(unit) then
			local area_emitter = unit.sound_data(slot13).emitter
			local shape_table = area_emitter.save_level_data(unit)
			slot16 = area_emitter
			shape_table.name = area_emitter.name(area_emitter)
			slot17 = shape_table

			table.insert(area_emitter, sound_area_emitters)

			slot17 = {
				category = "soundbanks",
				name = managers.sound_environment.emitter_soundbank(slot19, unit.sound_data(slot22).emitter.emitter_event(slot22))
			}
			slot20 = managers.sound_environment
			slot23 = unit
			slot23 = unit.sound_data(slot22).emitter

			managers.editor.add_to_sound_package(area_emitter, managers.editor)
		end
	end

	local default_ambience = managers.sound_environment.default_ambience(slot8)
	local default_occasional = managers.sound_environment.default_occasional(managers.sound_environment)
	slot11 = managers.sound_environment
	local ambience_enabled = managers.sound_environment.ambience_enabled(managers.sound_environment)
	local sound_data = {}
	slot13 = managers.sound_environment
	sound_data.default_environment = managers.sound_environment.default_environment(slot12)
	sound_data.default_ambience = default_ambience
	sound_data.ambience_enabled = ambience_enabled
	sound_data.default_occasional = default_occasional
	sound_data.sound_environments = sound_environments
	sound_data.sound_emitters = sound_emitters
	sound_data.sound_area_emitters = sound_area_emitters

	if ambience_enabled then
		slot14 = {
			category = "soundbanks",
			name = managers.sound_environment.ambience_soundbank(slot16, managers.sound_environment)
		}
		slot18 = default_ambience

		managers.editor.add_to_sound_package(slot12, managers.editor)

		slot14 = {
			category = "soundbanks",
			name = managers.sound_environment.occasional_soundbank(slot16, managers.sound_environment)
		}
		slot18 = default_occasional

		managers.editor.add_to_sound_package(slot12, managers.editor)
	end

	slot14 = sound_data

	self._add_project_save_data(slot12, self)

	local path = save_params.dir .. "\\" .. file_name .. ".world_sounds"
	slot15 = path
	local file = managers.editor._open_file(file_name, managers.editor)
	slot15 = file
	slot19 = sound_data

	file.puts(managers.editor, ScriptSerializer.to_generic_xml(slot17, ScriptSerializer))

	slot16 = file

	SystemFS.close(managers.editor, SystemFS)

	return 
end
SoundLayer.hide = function (self)
	return 
end
SoundLayer.disable = function (self)
	return 
end
SoundLayer.update = function (self, t, dt)
	slot7 = dt

	SoundLayer.super.update(slot4, self, t)

	slot5 = self._created_units

	for _, unit in ipairs(slot4) do
		slot11 = self._emitter_unit

		if unit.name(slot9) == Idstring(unit) then
			local r = 0.6
			local g = 0.6
			local b = 0
			slot14 = unit

			if table.contains(slot12, self._selected_units) then
				b = 0.4
				g = 1
				r = 1
			end

			slot13 = unit
			slot18 = b

			unit.sound_data(slot12).emitter.draw(slot12, unit.sound_data(slot12).emitter, t, dt, r, g)
		end

		slot11 = self._environment_unit

		if unit.name(slot9) == Idstring(unit) then
			slot14 = 1

			Application.draw(slot9, Application, unit, 1, 1)

			local r = 0
			local g = 0
			local b = 0.8
			slot14 = unit

			if table.contains(1, self._selected_units) then
				b = 1
				g = 0.4
				r = 0.4
			end

			slot13 = unit
			slot18 = b

			unit.sound_data(slot12).environment_area.draw(slot12, unit.sound_data(slot12).environment_area, t, dt, r, g)
		end

		slot11 = self._area_emitter_unit

		if unit.name(slot9) == Idstring(unit) then
			slot14 = 1

			Application.draw(slot9, Application, unit, 1, 1)

			local r = 0
			local g = 0
			local b = 0.8
			slot14 = unit

			if table.contains(1, self._selected_units) then
				b = 1
				g = 0.4
				r = 0.4
			end

			slot13 = unit
			slot18 = b

			unit.sound_data(slot12).emitter.draw(slot12, unit.sound_data(slot12).emitter, t, dt, r, g)
		end
	end

	return 
end
SoundLayer.build_panel = function (self, notebook)

	-- Decompilation error in this vicinity:
	slot5 = notebook

	SoundLayer.super.build_panel(slot3, self)

	slot7 = "TAB_TRAVERSAL"
	self._sound_panel = EWS.Panel(slot3, EWS, self._ews_panel, "")
	slot5 = "VERTICAL"
	self._sound_sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self._sound_sizer

	self._sound_panel.set_sizer(slot3, self._sound_panel)

	slot5 = "HORIZONTAL"
	local cb_sizer = EWS.BoxSizer(slot3, EWS)
	local show_sound = EWS.CheckBox(EWS, EWS, self._sound_panel, "Show Sound", "")
	slot7 = false

	show_sound.set_value(EWS, show_sound)

	slot12 = "toggle_show_sound"
	slot9 = show_sound

	show_sound.connect(EWS, show_sound, "EVT_COMMAND_CHECKBOX_CLICKED", callback("ALIGN_LEFT", self, self))

	slot10 = "EXPAND"

	cb_sizer.add(EWS, cb_sizer, show_sound, 1, 0)

	slot10 = "ALIGN_LEFT"
	local sound_always_on = EWS.CheckBox(EWS, EWS, self._sound_panel, "Sound Always On", "")
	slot7 = sound_always_on

	sound_always_on.set_value(EWS, managers.editor.listener_always_enabled(""))

	slot13 = "toggle_sound_always_on"
	slot10 = sound_always_on

	sound_always_on.connect(EWS, sound_always_on, "EVT_COMMAND_CHECKBOX_CLICKED", callback(managers.editor, self, self))

	slot11 = "EXPAND"

	cb_sizer.add(EWS, cb_sizer, sound_always_on, 1, 0)

	slot11 = "ALIGN_LEFT,TOP,BOTTOM"

	self._sound_sizer.add(EWS, self._sound_sizer, cb_sizer, 0, 5)

	slot10 = "Defaults"
	local soundbank_sizer = EWS.StaticBoxSizer(EWS, EWS, self._sound_panel, "VERTICAL")
	slot9 = soundbank_sizer

	self._build_defaults(EWS, self)

	slot12 = "EXPAND"

	self._sound_sizer.add(EWS, self._sound_sizer, soundbank_sizer, 0, 0)

	slot9 = "HORIZONTAL"
	local h_sound_emitter_sizer = EWS.BoxSizer(EWS, EWS)
	slot12 = "Sound Emitter"
	self._sound_emitter_sizer = EWS.StaticBoxSizer(EWS, EWS, self._sound_panel, "VERTICAL")
	local default_emitter_path = managers.sound_environment.game_default_emitter_path(EWS)
	local emitter_paths = managers.sound_environment.emitter_paths(managers.sound_environment)
	slot11 = {
		name = "Categories",
		panel = self._sound_panel,
		sizer = self._sound_emitter_sizer,
		options = (0 < #emitter_paths and emitter_paths) or {
			"- No emitter paths in project -"
		},
		value = (0 < #emitter_paths and default_emitter_path) or "- No emitter paths in project -",
		value_changed_cb = function (params)
			slot4 = params.value

			self.select_emitter_path(slot2, self)

			return 
		end
	}
	local ctrlr, combobox_params = CoreEws.combobox_and_list(managers.sound_environment)
	self._emitter_path_combobox = combobox_params
	slot11 = CoreEws.combobox_and_list
	slot13 = {
		sorted = true,
		name = "Events",
		panel = self._sound_panel,
		sizer = self._sound_emitter_sizer
	}
end
SoundLayer._build_defaults = function (self, sizer)
	slot5 = managers.sound_environment
	slot5 = managers.sound_environment
	self._default_environment = {
		sizer_proportions = 1,
		name = "Environment:",
		ctrlr_proportions = 3,
		name_proportions = 1,
		tooltip = "Select default environment from the combobox",
		sorted = true,
		panel = self._sound_panel,
		sizer = sizer,
		options = managers.sound_environment.environments(slot4),
		value = managers.sound_environment.game_default_environment(slot4)
	}
	local environments = CoreEws.combobox(managers.sound_environment.game_default_environment(slot4))
	slot11 = "select_default_sound_environment"

	environments.connect(self._default_environment, environments, "EVT_COMMAND_COMBOBOX_SELECTED", callback(nil, self, self))

	slot5 = managers.sound_environment
	local no_ambiences_availible = #managers.sound_environment.ambience_events(self._default_environment) == 0
	local error_text = "- No ambience soundbanks in project -"
	slot5 = {
		sizer_proportions = 1,
		name = "Ambience:",
		ctrlr_proportions = 3,
		name_proportions = 1,
		tooltip = "Select default ambience from the combobox",
		sorted = true,
		panel = self._sound_panel,
		sizer = sizer
	}

	if not no_ambiences_availible or not {
		error_text
	} then
		slot8 = managers.sound_environment
		slot6 = managers.sound_environment.ambience_events(slot7)
	end

	slot5.options = slot6

	if not no_ambiences_availible or not error_text then
		slot8 = managers.sound_environment
		slot6 = managers.sound_environment.game_default_ambience(slot7)
	end

	slot5.value = slot6
	self._default_ambience = slot5
	local ambiences = CoreEws.combobox(slot6)
	slot9 = not no_ambiences_availible

	ambiences.set_enabled(self._default_ambience, ambiences)

	slot14 = "select_default_ambience"

	ambiences.connect(self._default_ambience, ambiences, "EVT_COMMAND_COMBOBOX_SELECTED", callback(nil, self, self))

	slot8 = managers.sound_environment
	local no_occasionals_availible = #managers.sound_environment.occasional_events(self._default_ambience) == 0
	local error_text = "- No occasional soundbanks in project -"
	slot8 = {
		sizer_proportions = 1,
		name = "Occasional:",
		ctrlr_proportions = 3,
		name_proportions = 1,
		tooltip = "Select default occasional from the combobox",
		sorted = true,
		panel = self._sound_panel,
		sizer = sizer
	}

	if not no_occasionals_availible or not {
		error_text
	} then
		slot11 = managers.sound_environment
		slot9 = managers.sound_environment.occasional_events(slot10)
	end

	slot8.options = slot9

	if not no_occasionals_availible or not error_text then
		slot11 = managers.sound_environment
		slot9 = managers.sound_environment.game_default_occasional(slot10)
	end

	slot8.value = slot9
	self._default_occasional = slot8
	local occasionals = CoreEws.combobox(slot9)
	slot12 = not no_occasionals_availible

	occasionals.set_enabled(self._default_occasional, occasionals)

	slot17 = "select_default_occasional"
	slot14 = nil

	occasionals.connect(self._default_occasional, occasionals, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot14, self, self))

	slot14 = ""
	self._ambience_enabled = EWS.CheckBox(self._default_occasional, EWS, self._sound_panel, "Ambience Enabled")
	slot11 = self._ambience_enabled
	slot14 = managers.sound_environment

	self._ambience_enabled.set_value(self._default_occasional, managers.sound_environment.ambience_enabled("Ambience Enabled"))

	slot15 = "ALIGN_RIGHT,TOP"

	sizer.add(self._default_occasional, sizer, self._ambience_enabled, 0, 5)

	slot17 = "set_ambience_enabled"
	slot14 = self._ambience_enabled

	self._ambience_enabled.connect(self._default_occasional, self._ambience_enabled, "EVT_COMMAND_CHECKBOX_CLICKED", callback(5, self, self))

	slot12 = not no_ambiences_availible

	self._ambience_enabled.set_enabled(self._default_occasional, self._ambience_enabled)

	return 
end
SoundLayer._build_environment = function (self)
	slot6 = "Sound Environment"
	local sound_environment_sizer = EWS.StaticBoxSizer(slot2, EWS, self._sound_panel, "VERTICAL")
	self._priority_params = {
		name_proportions = 1,
		name = "Priority:",
		ctrlr_proportions = 2,
		value = 9,
		tooltip = "DISABLED",
		min = 1,
		floats = 0,
		max = 9,
		panel = self._sound_panel,
		sizer = sound_environment_sizer
	}
	local priority = CoreEws.number_controller(self._sound_panel)
	slot11 = "set_environment_priority"

	priority.connect(self._priority_params, priority, "EVT_COMMAND_TEXT_ENTER", callback(slot8, self, self))

	slot11 = "set_environment_priority"
	slot8 = nil

	priority.connect(self._priority_params, priority, "EVT_KILL_FOCUS", callback(nil, self, self))

	local environment_sizer = EWS.BoxSizer(self._priority_params, EWS)
	slot7 = managers.sound_environment
	slot7 = managers.sound_environment
	self._effect_params = {
		sizer_proportions = 1,
		name = "Effect:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Select an environment effect from the combobox",
		sorted = true,
		panel = self._sound_panel,
		sizer = environment_sizer,
		options = managers.sound_environment.environments("HORIZONTAL"),
		value = managers.sound_environment.game_default_environment("HORIZONTAL")
	}
	local effects = CoreEws.combobox(managers.sound_environment.game_default_environment("HORIZONTAL"))
	slot13 = "select_sound_environment"
	slot10 = nil

	effects.connect(self._effect_params, effects, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self, self, self))

	slot11 = "ALIGN_LEFT"
	self._use_environment = EWS.CheckBox(self._effect_params, EWS, self._sound_panel, "", "")
	slot8 = true

	self._use_environment.set_value(self._effect_params, self._use_environment)

	slot13 = "toggle_use_environment"
	slot10 = nil

	self._use_environment.connect(self._effect_params, self._use_environment, "EVT_COMMAND_CHECKBOX_CLICKED", callback("", self, self))

	slot11 = "EXPAND"

	environment_sizer.add(self._effect_params, environment_sizer, self._use_environment, 0, 0)

	slot11 = "EXPAND"

	sound_environment_sizer.add(self._effect_params, sound_environment_sizer, environment_sizer, 1, 0)

	local ambience_sizer = EWS.BoxSizer(self._effect_params, EWS)
	slot9 = managers.sound_environment
	slot9 = managers.sound_environment
	self._ambience_params = {
		sizer_proportions = 1,
		name = "Ambience:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Select an ambience from the combobox",
		sorted = true,
		panel = self._sound_panel,
		sizer = ambience_sizer,
		options = managers.sound_environment.ambience_events("HORIZONTAL"),
		value = managers.sound_environment.game_default_ambience("HORIZONTAL")
	}
	local ambiences = CoreEws.combobox(managers.sound_environment.game_default_ambience("HORIZONTAL"))
	slot15 = "select_environment_ambience"
	slot12 = nil

	ambiences.connect(self._ambience_params, ambiences, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self, self, self))

	slot13 = "ALIGN_LEFT"
	self._use_ambience = EWS.CheckBox(self._ambience_params, EWS, self._sound_panel, "", "")
	slot10 = true

	self._use_ambience.set_value(self._ambience_params, self._use_ambience)

	slot15 = "toggle_use_ambience"
	slot12 = nil

	self._use_ambience.connect(self._ambience_params, self._use_ambience, "EVT_COMMAND_CHECKBOX_CLICKED", callback("", self, self))

	slot13 = "EXPAND"

	ambience_sizer.add(self._ambience_params, ambience_sizer, self._use_ambience, 0, 0)

	slot13 = "EXPAND"

	sound_environment_sizer.add(self._ambience_params, sound_environment_sizer, ambience_sizer, 1, 0)

	local occasional_sizer = EWS.BoxSizer(self._ambience_params, EWS)
	slot11 = managers.sound_environment
	slot11 = managers.sound_environment
	self._occasional_params = {
		sizer_proportions = 1,
		name = "Occasional:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Select an occasional from the combobox",
		sorted = true,
		panel = self._sound_panel,
		sizer = occasional_sizer,
		options = managers.sound_environment.occasional_events("HORIZONTAL"),
		value = managers.sound_environment.game_default_occasional("HORIZONTAL")
	}
	local occasionals = CoreEws.combobox(managers.sound_environment.game_default_occasional("HORIZONTAL"))
	slot17 = "select_environment_occasional"
	slot14 = nil

	occasionals.connect(self._occasional_params, occasionals, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self, self, self))

	slot15 = "ALIGN_LEFT"
	self._use_occasional = EWS.CheckBox(self._occasional_params, EWS, self._sound_panel, "", "")
	slot12 = true

	self._use_occasional.set_value(self._occasional_params, self._use_occasional)

	slot17 = "toggle_use_occasional"
	slot14 = nil

	self._use_occasional.connect(self._occasional_params, self._use_occasional, "EVT_COMMAND_CHECKBOX_CLICKED", callback("", self, self))

	slot15 = "EXPAND"

	occasional_sizer.add(self._occasional_params, occasional_sizer, self._use_occasional, 0, 0)

	slot15 = "EXPAND"

	sound_environment_sizer.add(self._occasional_params, sound_environment_sizer, occasional_sizer, 1, 0)

	self._sound_environment_sizer = sound_environment_sizer
	slot15 = "EXPAND"

	self._sound_sizer.add(self._occasional_params, self._sound_sizer, sound_environment_sizer, 0, 0)

	return 
end
SoundLayer.toggle_show_sound = function (self, show_sound)
	slot10 = show_sound
	slot5 = "set show_sound " .. tostring(show_sound.get_value(slot9))

	Application.console_command(slot3, Application)

	return 
end
SoundLayer.toggle_sound_always_on = function (self, sound_always_on)
	slot4 = managers.editor
	slot7 = sound_always_on

	managers.editor.set_listener_always_enabled(slot3, sound_always_on.get_value(slot6))

	return 
end
SoundLayer.select_default_ambience = function (self)
	slot4 = self._default_ambience.value

	managers.sound_environment.set_default_ambience(slot2, managers.sound_environment)

	return 
end
SoundLayer.select_default_occasional = function (self)
	slot4 = self._default_occasional.value

	managers.sound_environment.set_default_occasional(slot2, managers.sound_environment)

	return 
end
SoundLayer.set_ambience_enabled = function (self, ambience_enabled)
	slot4 = managers.sound_environment
	slot7 = ambience_enabled

	managers.sound_environment.set_ambience_enabled(slot3, ambience_enabled.get_value(slot6))

	return 
end
SoundLayer.select_default_sound_environment = function (self, environments)
	slot5 = self._default_environment.value

	managers.sound_environment.set_default_environment(slot3, managers.sound_environment)

	return 
end
SoundLayer.select_emitter_path = function (self, path)
	local emitter = self._selected_unit.sound_data(slot3).emitter
	slot6 = path

	emitter.set_emitter_path(self._selected_unit, emitter)

	slot6 = path

	self.set_sound_emitter_events(self._selected_unit, self)

	slot5 = self._emitter_events_combobox
	slot8 = emitter

	CoreEws.change_combobox_value(self._selected_unit, emitter.emitter_event(slot7))

	return 
end
SoundLayer.set_sound_emitter_events = function (self, path)
	slot4 = self._emitter_events_combobox
	slot8 = path

	CoreEws.update_combobox_options(slot3, managers.sound_environment.emitter_events(slot6, managers.sound_environment))

	return 
end
SoundLayer.select_emitter_event = function (self, value)
	local emitter = self._selected_unit.sound_data(slot3).emitter
	slot6 = value

	emitter.set_emitter_event(self._selected_unit, emitter)

	return 
end
SoundLayer.set_environment_priority = function (self)
	slot3 = self._selected_unit
	local area = self._selected_unit.sound_data(slot2).environment_area

	return 
end
SoundLayer.select_sound_environment = function (self)
	local area = self._selected_unit.sound_data(slot2).environment_area
	slot5 = self._effect_params.value

	area.set_environment(self._selected_unit, area)

	return 
end
SoundLayer.toggle_use_environment = function (self)
	local area = self._selected_unit.sound_data(slot2).environment_area
	slot4 = area
	slot7 = self._use_environment

	area.set_use_environment(self._selected_unit, self._use_environment.get_value(slot6))

	return 
end
SoundLayer.select_environment_ambience = function (self)
	local area = self._selected_unit.sound_data(slot2).environment_area
	slot5 = self._ambience_params.value

	area.set_environment_ambience(self._selected_unit, area)

	return 
end
SoundLayer.toggle_use_ambience = function (self)
	local area = self._selected_unit.sound_data(slot2).environment_area
	slot4 = area
	slot7 = self._use_ambience

	area.set_use_ambience(self._selected_unit, self._use_ambience.get_value(slot6))

	return 
end
SoundLayer.select_environment_occasional = function (self)
	local area = self._selected_unit.sound_data(slot2).environment_area
	slot5 = self._occasional_params.value

	area.set_environment_occasional(self._selected_unit, area)

	return 
end
SoundLayer.toggle_use_occasional = function (self)
	local area = self._selected_unit.sound_data(slot2).environment_area
	slot4 = area
	slot7 = self._use_occasional

	area.set_use_occasional(self._selected_unit, self._use_occasional.get_value(slot6))

	return 
end
SoundLayer.on_restart_emitters = function (self)
	slot3 = self._created_units

	for _, unit in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		slot9 = self._emitter_unit
	end

	return 
end
SoundLayer.clear = function (self)
	slot3 = managers.sound_environment

	managers.sound_environment.set_to_default(slot2)

	slot3 = self._default_environment
	slot6 = managers.sound_environment

	CoreEws.change_combobox_value(slot2, managers.sound_environment.game_default_environment(slot5))

	slot3 = self._default_ambience
	slot6 = managers.sound_environment

	CoreEws.change_combobox_value(slot2, managers.sound_environment.game_default_ambience(slot5))

	slot3 = self._default_occasional
	slot6 = managers.sound_environment

	CoreEws.change_combobox_value(slot2, managers.sound_environment.game_default_occasional(slot5))

	slot3 = self._ambience_enabled
	slot6 = managers.sound_environment

	self._ambience_enabled.set_value(slot2, managers.sound_environment.ambience_enabled(slot5))

	slot3 = self._created_units

	for _, unit in ipairs(slot2) do
		slot9 = self._environment_unit

		if unit.name(slot7) == Idstring(unit) then
			slot11 = unit
			slot9 = unit.sound_data(slot10).environment_area

			managers.sound_environment.remove_area(slot7, managers.sound_environment)
		end

		slot9 = self._emitter_unit

		if unit.name(slot7) == Idstring(unit) then
			slot11 = unit
			slot9 = unit.sound_data(slot10).emitter

			managers.sound_environment.remove_emitter(slot7, managers.sound_environment)
		end

		slot9 = self._area_emitter_unit

		if unit.name(slot7) == Idstring(unit) then
			slot11 = unit
			slot9 = unit.sound_data(slot10).emitter

			managers.sound_environment.remove_area_emitter(slot7, managers.sound_environment)
		end
	end

	slot3 = self

	SoundLayer.super.clear(slot2)

	slot3 = self

	self.set_sound_environment_parameters(slot2)

	return 
end
SoundLayer.do_spawn_unit = function (self, ...)
	local unit = SoundLayer.super.do_spawn_unit(slot2, ...)
	slot4 = unit

	if alive(self) then
		slot5 = self._emitter_unit

		if unit.name(slot3) == Idstring(unit) then
			slot4 = unit

			if not unit.sound_data(slot3).emitter then
				slot6 = {}
				slot3 = managers.sound_environment.add_emitter(unit, managers.sound_environment)
				unit.sound_data(slot3).emitter = slot3
				slot4 = unit
				slot5 = unit

				unit.sound_data(slot3).emitter.set_unit(slot3, unit.sound_data(slot3).emitter)
			end

			slot4 = self

			self.set_sound_emitter_parameters(slot3)
		else
			slot5 = self._area_emitter_unit

			if unit.name(slot3) == Idstring(unit) then
				slot4 = unit

				if not unit.sound_data(slot3).emitter then
					slot6 = {}
					slot3 = managers.sound_environment.add_area_emitter(unit, managers.sound_environment)
					unit.sound_data(slot3).emitter = slot3
					slot4 = unit
					slot5 = unit

					unit.sound_data(slot3).emitter.set_unit(slot3, unit.sound_data(slot3).emitter)

					slot4 = unit
					slot6 = self._sound_emitter_sizer
					self._current_shape_panel = unit.sound_data(slot3).emitter.panel(slot3, unit.sound_data(slot3).emitter, self._sound_panel)
					slot4 = self._sound_panel

					self._sound_panel.layout(slot3)
				end

				slot4 = self

				self.set_sound_emitter_parameters(slot3)
			else
				slot5 = self._environment_unit

				if unit.name(slot3) == Idstring(unit) then
					slot4 = unit

					if not unit.sound_data(slot3).environment_area then
						slot6 = {}
						slot3 = managers.sound_environment.add_area(unit, managers.sound_environment)
						unit.sound_data(slot3).environment_area = slot3
						slot4 = unit
						slot5 = unit

						unit.sound_data(slot3).environment_area.set_unit(slot3, unit.sound_data(slot3).environment_area)

						slot4 = unit
						slot6 = self._sound_environment_sizer
						self._current_shape_panel = unit.sound_data(slot3).environment_area.panel(slot3, unit.sound_data(slot3).environment_area, self._sound_panel)
						slot4 = self._sound_panel

						self._sound_panel.layout(slot3)
					end

					slot4 = self

					self.set_sound_environment_parameters(slot3)
				end
			end
		end
	end

	return unit
end
SoundLayer.select_unit_ray_authorised = function (self, ray)
	local unit = ray and ray.unit

	if unit then

		-- Decompilation error in this vicinity:
		slot6 = self._emitter_unit
		slot6 = self._environment_unit
		slot6 = self._area_emitter_unit

		return unit.name(slot4) == Idstring(unit)
	end

	return 
end
SoundLayer.clone_edited_values = function (self, unit, source)

	-- Decompilation error in this vicinity:
	slot7 = source

	SoundLayer.super.clone_edited_values(slot4, self, unit)

	slot6 = self._environment_unit

	if unit.name(slot4) == Idstring(unit) then
		local area = unit.sound_data(slot4).environment_area
		local source_area = source.sound_data(unit).environment_area
		slot7 = area
		slot10 = source_area

		area.set_environment(source, source_area.environment(slot9))

		slot7 = area
		slot10 = source_area

		area.set_environment_ambience(source, source_area.ambience_event(slot9))

		slot7 = area
		slot10 = source_area

		area.set_width(source, source_area.width(slot9))

		slot7 = area
		slot10 = source_area

		area.set_depth(source, source_area.depth(slot9))

		slot7 = area
		slot10 = source_area

		area.set_height(source, source_area.height(slot9))
	end

	slot6 = self._emitter_unit

	return 
end
SoundLayer.delete_unit = function (self, unit)
	slot5 = self._environment_unit

	if unit.name(slot3) == Idstring(unit) then
		slot7 = unit
		slot5 = unit.sound_data(slot6).environment_area

		managers.sound_environment.remove_area(slot3, managers.sound_environment)

		slot4 = unit
		slot4 = unit.sound_data(slot3).environment_area

		if unit.sound_data(slot3).environment_area.panel(slot3) then
			slot5 = unit
			slot5 = unit.sound_data(slot4).environment_area

			if self._current_shape_panel == unit.sound_data(slot4).environment_area.panel(slot4) then
				self._current_shape_panel = nil
			end

			slot4 = unit
			slot4 = unit.sound_data(slot3).environment_area
			slot4 = unit.sound_data(slot3).environment_area.panel(slot3)

			unit.sound_data(slot3).environment_area.panel(slot3).destroy(slot3)

			slot4 = self._sound_panel

			self._sound_panel.layout(slot3)
		end
	end

	slot5 = self._emitter_unit

	if unit.name(slot3) == Idstring(unit) then
		slot7 = unit
		slot5 = unit.sound_data(slot6).emitter

		managers.sound_environment.remove_emitter(slot3, managers.sound_environment)
	end

	slot5 = self._area_emitter_unit

	if unit.name(slot3) == Idstring(unit) then
		slot7 = unit
		slot5 = unit.sound_data(slot6).emitter

		managers.sound_environment.remove_area_emitter(slot3, managers.sound_environment)
	end

	slot5 = unit

	SoundLayer.super.delete_unit(slot3, self)

	return 
end
SoundLayer.update_unit_settings = function (self)
	slot3 = self

	SoundLayer.super.update_unit_settings(slot2)

	if self._current_shape_panel then
		slot4 = false

		self._current_shape_panel.set_visible(slot2, self._current_shape_panel)
	end

	slot3 = self

	self.set_sound_emitter_parameters(slot2)

	slot3 = self

	self.set_sound_environment_parameters(slot2)

	return 
end
SoundLayer.set_sound_environment_parameters = function (self)
	slot4 = false

	self._priority_params.number_ctrlr.set_enabled(slot2, self._priority_params.number_ctrlr)

	slot4 = false

	self._effect_params.ctrlr.set_enabled(slot2, self._effect_params.ctrlr)

	slot4 = false

	self._ambience_params.ctrlr.set_enabled(slot2, self._ambience_params.ctrlr)

	slot4 = false

	self._occasional_params.ctrlr.set_enabled(slot2, self._occasional_params.ctrlr)

	slot4 = false

	self._use_environment.set_enabled(slot2, self._use_environment)

	slot4 = false

	self._use_ambience.set_enabled(slot2, self._use_ambience)

	slot4 = false

	self._use_occasional.set_enabled(slot2, self._use_occasional)

	slot3 = self._selected_unit

	if alive(slot2) then
		slot4 = self._environment_unit

		if self._selected_unit.name(slot2) == Idstring(self._selected_unit) then
			slot3 = self._selected_unit
			local area = self._selected_unit.sound_data(slot2).environment_area

			if area then
				self._current_shape_panel = area.panel(slot3, area, self._sound_panel)
				slot5 = true

				self._current_shape_panel.set_visible(slot3, self._current_shape_panel)

				slot5 = false

				self._priority_params.number_ctrlr.set_enabled(slot3, self._priority_params.number_ctrlr)

				slot5 = true

				self._effect_params.ctrlr.set_enabled(slot3, self._effect_params.ctrlr)

				slot5 = true

				self._ambience_params.ctrlr.set_enabled(slot3, self._ambience_params.ctrlr)

				slot5 = true

				self._occasional_params.ctrlr.set_enabled(slot3, self._occasional_params.ctrlr)

				slot5 = true

				self._use_environment.set_enabled(slot3, self._use_environment)

				slot5 = true

				self._use_ambience.set_enabled(slot3, self._use_ambience)

				slot5 = true

				self._use_occasional.set_enabled(slot3, self._use_occasional)

				slot4 = self._effect_params
				slot7 = area

				CoreEws.change_combobox_value(slot3, area.environment(self._sound_environment_sizer))

				slot4 = self._ambience_params
				slot7 = area

				CoreEws.change_combobox_value(slot3, area.ambience_event(self._sound_environment_sizer))

				slot4 = self._occasional_params
				slot7 = area

				CoreEws.change_combobox_value(slot3, area.occasional_event(self._sound_environment_sizer))

				slot4 = self._use_environment
				slot7 = area

				self._use_environment.set_value(slot3, area.use_environment(self._sound_environment_sizer))

				slot4 = self._use_ambience
				slot7 = area

				self._use_ambience.set_value(slot3, area.use_ambience(self._sound_environment_sizer))

				slot4 = self._use_occasional
				slot7 = area

				self._use_occasional.set_value(slot3, area.use_occasional(self._sound_environment_sizer))
			end
		end
	end

	slot3 = self._sound_panel

	self._sound_panel.layout(slot2)

	return 
end
SoundLayer.set_sound_emitter_parameters = function (self)
	slot4 = false

	self._emitter_path_combobox.ctrlr.set_enabled(slot2, self._emitter_path_combobox.ctrlr)

	slot4 = false

	self._emitter_path_combobox.toolbar.set_enabled(slot2, self._emitter_path_combobox.toolbar)

	slot4 = false

	self._emitter_events_combobox.ctrlr.set_enabled(slot2, self._emitter_events_combobox.ctrlr)

	slot4 = false

	self._emitter_events_combobox.toolbar.set_enabled(slot2, self._emitter_events_combobox.toolbar)

	slot3 = self._selected_unit

	if alive(slot2) then
		slot4 = self._emitter_unit
	end

	return 
end
SoundLayer.activate = function (self)
	slot3 = self

	SoundLayer.super.activate(slot2)

	slot4 = true

	managers.editor.set_listener_enabled(slot2, managers.editor)

	slot4 = false

	managers.editor.set_wanted_mute(slot2, managers.editor)

	return 
end
SoundLayer.deactivate = function (self, params)
	slot5 = false

	managers.editor.set_listener_enabled(slot3, managers.editor)

	slot4 = self

	SoundLayer.super.deactivate(slot3)

	if not params or not params.simulation then
		slot5 = true

		managers.editor.set_wanted_mute(slot3, managers.editor)
	end

	return 
end
SoundLayer.add_triggers = function (self)
	slot3 = self

	SoundLayer.super.add_triggers(slot2)

	return 
end
SoundLayer.get_layer_name = function (self)
	return "Sound"
end
SoundLayer.set_unit_name = function (self, units)
	slot5 = units

	SoundLayer.super.set_unit_name(slot3, self)

	if self._unit_name == self._emitter_unit or self._unit_name == self._area_emitter_unit then
		slot4 = managers.sound_environment

		if #managers.sound_environment.emitter_paths(slot3) == 0 then
			slot5 = "No emitter soundbanks in project. Talk to your sound designer."

			managers.editor.output(slot3, managers.editor)

			slot7 = units
			slot6 = false

			units.set_item_selected(slot3, units, units.selected_item(slot6))

			self._unit_name = ""
		end
	end

	return 
end

return 
