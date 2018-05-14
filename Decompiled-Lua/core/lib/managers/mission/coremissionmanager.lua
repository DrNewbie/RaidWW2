-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionManager"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

slot2 = "core/lib/managers/mission/CoreElementDebug"

require(slot1)

if not MissionManager then
	slot2 = CoreEvent.CallbackHandler
	slot0 = CoreClass.class(slot1)
end

MissionManager = slot0
MissionManager.init = function (self)
	slot3 = self

	MissionManager.super.init(slot2)

	self._runned_unit_sequences_callbacks = {}
	self._scripts = {}
	self._active_scripts = {}
	self._area_instigator_categories = {}
	slot4 = "none"

	self.add_area_instigator_categories(slot2, self)

	slot4 = "none"

	self.set_default_area_instigator(slot2, self)

	slot4 = "EventListenerHolder"
	slot3 = rawget(slot2, _G)
	self._global_event_listener = rawget(slot2, _G).new(slot2)
	self._global_event_list = {}

	return 
end
MissionManager.post_init = function (self)
	slot3 = managers.gui_data
	self._workspace = managers.gui_data.create_saferect_workspace(slot2)
	slot3 = self._workspace
	slot6 = TimerManager

	self._workspace.set_timer(slot2, TimerManager.game(slot5))

	slot4 = self._workspace

	managers.gui_data.layout_corner_saferect_workspace(slot2, managers.gui_data)

	slot3 = self._workspace
	slot6 = TimerManager

	self._workspace.set_timer(slot2, TimerManager.main(slot5))

	slot3 = self._workspace
	slot3 = self._workspace.panel(slot2)
	self._fading_debug_output = self._workspace.panel(slot2).gui(slot2, Idstring(slot5))
	slot7 = self._workspace

	self._fading_debug_output.set_leftbottom(slot2, self._fading_debug_output, 0)

	slot3 = self._fading_debug_output
	slot3 = {
		font_size = 18,
		max_rows = 20
	}

	self._fading_debug_output.script(slot2).configure(slot2)

	slot3 = self._workspace
	slot3 = self._workspace.panel(slot2)
	slot6 = "core/guis/core_persistent_debug_output"
	self._persistent_debug_output = self._workspace.panel(slot2).gui(slot2, Idstring(self._workspace.height("core/guis/core_fading_debug_output") / 3))
	slot6 = self._workspace

	self._persistent_debug_output.set_righttop(slot2, self._persistent_debug_output, self._workspace.width(self._workspace.height("core/guis/core_fading_debug_output") / 3))

	slot4 = false

	self.set_persistent_debug_enabled(slot2, self)

	slot4 = true

	self.set_fading_debug_enabled(slot2, self)

	slot3 = managers.viewport
	slot8 = "_resolution_changed"

	managers.viewport.add_resolution_changed_func(slot2, callback(0, self, self))

	return 
end
MissionManager._resolution_changed = function (self)
	slot4 = self._workspace

	managers.gui_data.layout_corner_saferect_workspace(slot2, managers.gui_data)

	return 
end
MissionManager.parse = function (self, params, stage_name, offset, file_type)
	local file_path, activate_mission = nil
	slot9 = params

	if CoreClass.type_name(slot8) == "table" then
		file_path = params.file_path
		file_type = params.file_type or "mission"
		activate_mission = params.activate_mission
		offset = params.offset
		self._worlddefinition = params.worlddefinition
		self._sync_id = params.sync_id
	else
		file_path = params
		file_type = file_type or "mission"
	end

	slot13 = activate_mission

	CoreDebug.cat_debug(slot8, "gaspode", "MissionManager", file_path, file_type)

	slot11 = file_path

	if not DB.has(slot8, DB, file_type) then
		slot14 = ")"

		Application.error(slot8, Application, "Couldn't find", file_path, "(", file_type)

		return false
	end

	local reverse = string.reverse(slot8)
	slot11 = "/"
	local i = string.find(file_path, reverse)
	slot14 = i
	local file_dir = string.reverse(string.sub(slot12, reverse))
	slot14 = file_path
	local continent_files = self._serialize_to_script(string.sub, self, file_type)
	continent_files._meta = nil
	slot13 = continent_files

	for name, data in pairs(self) do
		slot19 = name

		if not self._worlddefinition or managers.worlddefinition.continent_excluded(slot17, self._worlddefinition or managers.worlddefinition) then
			slot20 = data

			self._load_mission_file(slot17, self, file_dir)
		end
	end

	slot14 = activate_mission

	self._activate_mission(slot12, self)

	self._parsed = true

	return true
end
MissionManager._serialize_to_script = function (self, type, name)
	slot5 = Application

	if Application.editor(slot4) then
		slot6 = type.id(slot7)
		slot9 = name

		return PackageManager.editor_load_script_data(slot4, PackageManager, name.id(type))
	else
		slot6 = type.id(slot7)
		slot9 = name

		if not PackageManager.has(slot4, PackageManager, name.id(type)) then
			slot6 = "Script data file " .. name .. " of type " .. type .. " has not been loaded. Could be that old mission format is being loaded. Try resaving the level."

			Application.throw_exception(slot4, Application)
		end

		slot6 = type.id(slot7)
		slot9 = name

		return PackageManager.script_data(slot4, PackageManager, name.id(type))
	end

	return 
end
MissionManager._load_mission_file = function (self, file_dir, data)
	local file_path = file_dir .. data.file
	slot8 = file_path
	local scripts = self._serialize_to_script(slot5, self, "mission")
	scripts._meta = nil
	slot7 = scripts

	for name, data in pairs(self) do
		data.name = name
		data.worlddefinition = self._worlddefinition
		data.sync_id = self._sync_id
		slot13 = data

		self._add_script(slot11, self)
	end

	return 
end
MissionManager._add_script = function (self, data)
	slot7 = data
	self._scripts[data.name] = MissionScript.new(slot5, MissionScript)

	return 
end
MissionManager.scripts = function (self)
	return self._scripts
end
MissionManager.script = function (self, name)
	return self._scripts[name]
end
MissionManager._activate_mission = function (self, name)
	slot6 = name

	Application.debug(slot3, Application, "[MissionManager:_activate_mission]")

	if name then
		slot5 = name

		if self.script(slot3, self) then
			slot5 = name

			self.activate_script(slot3, self)
		else
			slot5 = "There was no mission named " .. name .. " availible to activate!"

			Application.throw_exception(slot3, Application)
		end
	else
		slot4 = self._scripts

		for _, script in pairs(slot3) do
			slot9 = script

			if script.activate_on_parsed(slot8) then
				slot9 = self
				slot12 = script

				self.activate_script(slot8, script.name(slot11))
			end
		end
	end

	return 
end
MissionManager.activate_script = function (self, name, ...)
	slot7 = name
	slot10 = self

	Application.debug(slot3, Application, "[MissionManager:activate_script]", Global.running_simulation, inspect(slot9))

	if not self._scripts[name] then
		if Global.running_simulation then
			slot5 = "Can't activate mission script " .. name .. ". It doesn't exist."

			managers.editor.output_error(slot3, managers.editor)

			return 
		else
			slot5 = "Can't activate mission script " .. name .. ". It doesn't exist."

			Application.throw_exception(slot3, Application)
		end
	end

	slot4 = self._scripts[name]

	self._scripts[name].activate(slot3, ...)

	return 
end
MissionManager.find_alert_point = function (self, position)
	local distances = {}
	slot5 = self._scripts

	for name, script in pairs(slot4) do
		slot10 = script._alert_points

		for _, alert_point in pairs(slot9) do
			slot16 = "enabled"

			if alert_point.value(slot14, alert_point) and not alert_point.executing then
				slot18 = "position"
				slot16 = position
				local distance = mvector3.distance(slot14, alert_point.value(slot16, alert_point))
				distances[distance] = alert_point
			end
		end
	end

	local min = -1
	slot6 = distances

	for distance, alert_point in pairs(slot5) do
		if min == -1 or distance < min then
			min = distance
		end
	end

	return distances[min]
end
MissionManager.debug_enabled_alert_points = function (self)
	local distances = {}
	slot4 = self._scripts

	for name, script in pairs(slot3) do
		slot9 = script._alert_points

		for _, alert_point in pairs(slot8) do
			slot15 = "enabled"

			if alert_point.value(slot13, alert_point) and not alert_point.executing then
				slot15 = "Enabled alert point at"
				slot19 = "position"

				Application.debug(slot13, Application, alert_point.value(slot17, alert_point))
			end
		end
	end

	return 
end
MissionManager.find_closest_metal_object_position = function (self, position)
	local distances = {}
	slot5 = self._scripts

	for name, script in pairs(slot4) do
		slot10 = script._metal_detector_objects

		for _, object in pairs(slot9) do
			slot16 = "enabled"

			if object.value(slot14, object) then
				slot18 = "position"
				slot16 = position
				local distance = mvector3.distance(slot14, object.value(slot16, object))
				distances[distance] = object
			end
		end
	end

	local min = -1
	slot6 = distances

	for distance, alert_point in pairs(slot5) do
		if min == -1 or distance < min then
			min = distance
		end
	end

	return min
end
MissionManager.update = function (self, t, dt)
	slot5 = self._scripts

	for _, script in pairs(slot4) do
		slot12 = dt

		script.update(slot9, script, t)
	end

	return 
end
MissionManager.stop_simulation = function (self, ...)
	slot3 = self

	self.pre_destroy(slot2)

	slot3 = self._scripts

	for _, script in pairs(slot2) do
		slot8 = script

		script.stop_simulation(slot7, ...)
	end

	self._scripts = {}
	self._runned_unit_sequences_callbacks = {}
	slot4 = "EventListenerHolder"
	slot3 = rawget(slot2, _G)
	self._global_event_listener = rawget(slot2, _G).new(slot2)

	return 
end
MissionManager.on_simulation_started = function (self)
	self._pre_destroyed = nil

	return 
end
MissionManager.add_runned_unit_sequence_trigger = function (self, id, sequence, callback)
	if self._runned_unit_sequences_callbacks[id] then
		if self._runned_unit_sequences_callbacks[id][sequence] then
			slot7 = callback

			table.insert(slot5, self._runned_unit_sequences_callbacks[id][sequence])
		else
			self._runned_unit_sequences_callbacks[id][sequence] = {
				callback
			}
		end
	else
		local t = {
			[sequence] = {
				callback
			}
		}
		self._runned_unit_sequences_callbacks[id] = t
	end

	return 
end
MissionManager.runned_unit_sequence = function (self, unit, sequence, params)
	if self._pre_destroyed then
		return 
	end

	slot6 = unit

	if alive(slot5) then
		slot6 = unit

		if unit.unit_data(slot5) then
			slot6 = unit
			local id = unit.unit_data(slot5).unit_id

			if id == 0 or not id then
				slot7 = unit
				id = unit.editor_id(slot6)
			end

			if self._runned_unit_sequences_callbacks[id] and self._runned_unit_sequences_callbacks[id][sequence] then
				slot7 = self._runned_unit_sequences_callbacks[id][sequence]

				for _, call in ipairs(slot6) do
					slot12 = params and params.unit

					call(slot11)
				end
			end
		end
	end

	return 
end
MissionManager.add_area_instigator_categories = function (self, category)
	slot5 = category

	table.insert(slot3, self._area_instigator_categories)

	return 
end
MissionManager.area_instigator_categories = function (self)
	return self._area_instigator_categories
end
MissionManager.set_default_area_instigator = function (self, default)
	self._default_area_instigator = default

	return 
end
MissionManager.default_area_instigator = function (self)
	return self._default_area_instigator
end
MissionManager.default_instigator = function (self)
	return nil
end
MissionManager.persistent_debug_enabled = function (self)
	return self._persistent_debug_enabled
end
MissionManager.set_persistent_debug_enabled = function (self, enabled)
	self._persistent_debug_enabled = enabled

	if enabled then
		slot4 = self._persistent_debug_output

		self._persistent_debug_output.show(slot3)
	else
		slot4 = self._persistent_debug_output

		self._persistent_debug_output.hide(slot3)
	end

	return 
end
MissionManager.add_persistent_debug_output = function (self, debug, color)
	if not self._persistent_debug_enabled then
		return 
	end

	slot7 = debug

	Application.debug(slot4, Application, "[MissionManager:add_persistent_debug_output]")

	slot5 = self._persistent_debug_output
	slot6 = color

	self._persistent_debug_output.script(slot4).log(slot4, debug)

	return 
end
MissionManager.set_fading_debug_enabled = function (self, enabled)
	self._fading_debug_enabled = enabled

	if enabled then
		slot4 = self._fading_debug_output

		self._fading_debug_output.show(slot3)
	else
		slot4 = self._fading_debug_output

		self._fading_debug_output.hide(slot3)
	end

	return 
end
MissionManager.add_fading_debug_output = function (self, debug, color, as_subtitle)
	slot6 = Application

	if not Application.production_build(slot5) then
		return 
	end

	if not self._fading_debug_enabled then
		return 
	end

	if as_subtitle then
		slot8 = color

		self._show_debug_subtitle(slot5, self, debug)
	else
		local stuff = {
			" -",
			" \\",
			" |",
			" /"
		}
		self._fade_index = (self._fade_index or 0) + 1
		self._fade_index = (#stuff < self._fade_index and self._fade_index and 1) or self._fade_index
		slot7 = self._fading_debug_output
		slot9 = nil

		self._fading_debug_output.script(slot6).log(slot6, stuff[self._fade_index] .. " " .. debug, color)
	end

	return 
end
MissionManager._show_debug_subtitle = function (self, debug, color)
	if not self._debug_subtitle_text then
		slot5 = self._workspace
		slot6 = {
			font_size = 20,
			name = "debug_fading_subtitle_text",
			wrap = true,
			word_wrap = true,
			align = "center",
			font = "core/fonts/diesel",
			halign = "center",
			valign = "center",
			text = debug,
			color = color or Color.white
		}
		slot3 = self._workspace.panel(slot4).text(slot4, self._workspace.panel(slot4))
	end

	self._debug_subtitle_text = slot3
	slot8 = self._workspace
	slot8 = self._workspace.panel(slot7)
	slot6 = self._workspace.panel(slot7).w(slot7) / 2

	self._debug_subtitle_text.set_w(slot4, self._debug_subtitle_text)

	slot6 = debug

	self._debug_subtitle_text.set_text(slot4, self._debug_subtitle_text)

	slot8 = debug
	slot6 = utf8.len(slot7) * 0.04
	local subtitle_time = math.max(slot4, 4)
	slot6 = self._debug_subtitle_text
	local _, _, w, h = self._debug_subtitle_text.text_rect(4)
	slot11 = h

	self._debug_subtitle_text.set_h(slot9, self._debug_subtitle_text)

	slot13 = self._workspace
	slot13 = self._workspace.panel(slot12)
	slot11 = self._workspace.panel(slot12).w(slot12) / 2

	self._debug_subtitle_text.set_center_x(slot9, self._debug_subtitle_text)

	slot13 = self._workspace
	slot13 = self._workspace.panel(slot12)
	slot11 = self._workspace.panel(slot12).h(slot12) / 1.4

	self._debug_subtitle_text.set_top(slot9, self._debug_subtitle_text)

	slot11 = color or Color.white

	self._debug_subtitle_text.set_color(slot9, self._debug_subtitle_text)

	slot11 = 1

	self._debug_subtitle_text.set_alpha(slot9, self._debug_subtitle_text)

	slot10 = self._debug_subtitle_text

	self._debug_subtitle_text.stop(slot9)

	function slot11(o)
		slot3 = subtitle_time

		_G.wait(slot2)

		slot4 = 0

		self._debug_subtitle_text.set_alpha(slot2, self._debug_subtitle_text)

		return 
	end

	self._debug_subtitle_text.animate(slot9, self._debug_subtitle_text)

	return 
end
MissionManager.get_element_by_id = function (self, id)
	slot4 = self._scripts

	for name, script in pairs(slot3) do
		slot10 = id

		if script.element(slot8, script) then
			slot10 = id

			return script.element(slot8, script)
		end
	end

	return 
end
MissionManager.get_element_by_name = function (self, name)
	slot4 = self._scripts

	for _, data in pairs(slot3) do
		slot11 = data

		for id, element in pairs(data.elements(slot10)) do
			slot14 = element

			if element.editor_name(slot13) == name then
				return element
			end
		end
	end

	return 
end
MissionManager.add_global_event_listener = function (self, key, events, clbk)
	slot9 = clbk

	self._global_event_listener.add(slot5, self._global_event_listener, key, events)

	return 
end
MissionManager.remove_global_event_listener = function (self, key)
	slot5 = key

	self._global_event_listener.remove(slot3, self._global_event_listener)

	return 
end
MissionManager.global_event_listener_exists = function (self, key)
	slot5 = key

	return self._global_event_listener.listener_exists(slot3, self._global_event_listener)
end
MissionManager.call_global_event = function (self, event, ...)
	slot5 = event

	self._global_event_listener.call(slot3, self._global_event_listener, ...)

	return 
end
MissionManager.set_global_event_list = function (self, list)
	self._global_event_list = list

	return 
end
MissionManager.get_global_event_list = function (self)
	return self._global_event_list
end
MissionManager.save = function (self, data)
	local state = {}
	slot5 = self._scripts

	for _, script in pairs(slot4) do
		slot11 = state

		script.save(slot9, script)
	end

	data.MissionManager = state

	return 
end
MissionManager.load = function (self, data)
	slot6 = self._sync_id
	slot9 = data.MissionManager

	Application.debug(slot3, Application, "[MissionManager:load]", inspect(slot8))

	local state = data.MissionManager

	if self._parsed then
		slot5 = self._scripts

		for _, script in pairs(slot4) do
			slot11 = state

			script.load(slot9, script)
		end
	else
		slot6 = "[MissionManager:load] dropin!"

		Application.debug(slot4, Application)

		Global.mision_load_state_dropin = state
	end

	return 
end
MissionManager.pre_destroy = function (self)
	self._pre_destroyed = true
	slot3 = self._scripts

	for _, script in pairs(slot2) do
		slot8 = script

		script.pre_destroy(slot7)
	end

	return 
end
MissionManager.destroy = function (self)
	slot3 = self._scripts

	for _, script in pairs(slot2) do
		slot8 = script

		script.destroy(slot7)
	end

	return 
end

if not MissionScript then
	slot2 = CoreEvent.CallbackHandler
	slot0 = CoreClass.class(slot1)
end

MissionScript = slot0
MissionScript.imported_modules = MissionScript.imported_modules or {}
slot2 = MissionScript.imported_modules

for module_name, _ in pairs(slot1) do
	slot7 = module_name

	MissionScript.import(slot6)
end

MissionScript.import = function (module_name)
	MissionScript.imported_modules[module_name] = true
	slot4 = module_name
	local module = core.import(true, core)

	return module
end
MissionScript.init = function (self, data)
	slot4 = self

	MissionScript.super.init(slot3)

	self._metal_detector_objects = {}
	self._alert_points = {}
	self._elements = {}
	self._element_groups = {}
	self._name = data.name
	self._activate_on_parsed = data.activate_on_parsed
	self._worlddefinition = data.worlddefinition
	self._sync_id = data.sync_id
	self._worlddefinition_id = data.sync_id
	slot6 = self._name

	CoreDebug.cat_debug(slot3, "gaspode", "New MissionScript:")

	slot5 = data.elements

	self._add_translation(slot3, self)

	slot5 = data.elements

	self._create_elements(slot3, self)

	if data.instances then
		slot4 = data.instances

		for _, instance_name in ipairs(slot3) do
			slot11 = self._worlddefinition_id
			local instance_data = managers.world_instance.get_instance_data_by_name(slot8, managers.world_instance, instance_name)
			slot12 = self._worlddefinition_id
			local prepare_mission_data = managers.world_instance.prepare_mission_data_by_name(managers.world_instance, managers.world_instance, instance_name)

			if not instance_data.mission_placed then
				slot12 = prepare_mission_data

				self.create_instance_elements(slot10, self)
			else
				slot12 = prepare_mission_data

				self._preload_instance_class_elements(slot10, self)
			end
		end
	end

	self._updators = {}
	self._save_states = {}
	slot5 = self._elements

	self._on_created(slot3, self)

	return 
end
MissionScript._add_translation = function (self, elements)

	-- Decompilation error in this vicinity:
	local position = self._worlddefinition.translation(slot3).position
	local rotation = self._worlddefinition.translation(self._worlddefinition).rotation
	slot6 = elements

	for _, element in ipairs(self._worlddefinition) do
		slot13 = rotation

		_G.CoreWorldInstanceManager.translate_element_values(slot10, element, position)
	end

	return 
end
MissionScript.external_create_instance_elements = function (self, prepare_mission_data)
	slot5 = prepare_mission_data
	local new_elements = self.create_instance_elements(slot3, self)
	slot6 = new_elements

	self._on_created(self, self)

	if self._active then
		slot6 = new_elements

		self._on_script_activated(slot4, self)
	end

	return 
end
MissionScript.create_instance_elements = function (self, prepare_mission_data)
	local new_elements = {}
	slot5 = prepare_mission_data

	for _, instance_mission_data in pairs(slot4) do
		slot11 = instance_mission_data.elements
		new_elements = self._create_elements(slot9, self)
	end

	return new_elements
end
MissionScript._preload_instance_class_elements = function (self, prepare_mission_data)
	slot4 = prepare_mission_data

	for _, instance_mission_data in pairs(slot3) do
		slot9 = instance_mission_data.elements

		for _, element in ipairs(slot8) do
			slot16 = element.class

			self._element_class(slot13, self, element.module)
		end
	end

	return 
end
MissionScript._create_elements = function (self, elements)
	local new_elements = {}
	slot5 = elements

	for _, element in ipairs(slot4) do
		local class = element.class
		slot13 = class
		slot13 = element
		local new_element = self._element_class(slot10, self, element.module).new(slot10, self._element_class(slot10, self, element.module), self)
		slot13 = "is_alert_point"
		local is_alert = new_element.value(self._element_class(slot10, self, element.module), new_element)
		slot14 = "is_metal_detector_object"
		local is_metal_detector_object = new_element.value(new_element, new_element)
		local old_element = self._elements[element.id]

		if old_element then
			slot15 = Application

			if not Application.editor(slot14) then
				slot16 = "[MissionScript:_create_elements] Leaking mission element! old"
				slot19 = old_element

				Application.debug(slot14, Application, inspect(slot18))

				slot16 = "[MissionScript:_create_elements] Leaking mission element! new"
				slot19 = new_element

				Application.debug(slot14, Application, inspect(slot18))

				slot16 = element.id

				_G.debug_pause(slot14, "[MissionScript:_create_elements] Leaking mission element! ID:")
			end
		end

		self._elements[element.id] = new_element
		new_elements[element.id] = new_element
		self._element_groups[class] = self._element_groups[class] or {}
		slot16 = new_element

		table.insert(self._element_groups[class] or , self._element_groups[class])

		if is_alert then
			self._alert_points[element.id] = new_element
		end

		if is_metal_detector_object then
			self._metal_detector_objects[element.id] = new_element
		end
	end

	return new_elements
end
MissionScript.activate_on_parsed = function (self)
	return self._activate_on_parsed
end
MissionScript._on_created = function (self, elements)
	slot4 = elements

	for _, element in pairs(slot3) do
		slot9 = element

		element.on_created(slot8)
	end

	return 
end
MissionScript._element_class = function (self, module_name, class_name)
	slot6 = class_name
	local element_class = rawget(slot4, _G)

	if not element_class and module_name and module_name ~= "none" then
		slot7 = "CoreMissionManager"
		local raw_module = rawget(slot5, _G)[module_name]

		if not raw_module or not raw_module[class_name] then
			slot7 = module_name
			element_class = MissionScript.import(slot6)[class_name]
		end
	end

	if not element_class then
		element_class = CoreMissionScriptElement.MissionScriptElement
		slot9 = module_name

		Application.error(slot5, Application, "[MissionScript]SCRIPT ERROR: Didn't find class", class_name)
	end

	return element_class
end
MissionScript.activate = function (self, ...)
	self._active = true
	slot4 = ""

	managers.mission.add_persistent_debug_output(slot2, managers.mission)

	slot4 = "Activate mission " .. self._name
	slot10 = 0

	managers.mission.add_persistent_debug_output(slot2, managers.mission, Color(slot6, 1, 0, 1))

	slot6 = self._elements
	slot4 = CoreTable.clone(Color)

	self._on_script_activated(slot2, self, ...)

	return 
end
MissionScript._on_script_activated = function (self, elements, ...)
	slot4 = elements

	for _, element in pairs(slot3) do
		slot9 = element

		element.on_script_activated(slot8)
	end

	local startup_order = {}
	slot5 = elements

	for _, element in pairs(slot4) do
		slot11 = "execute_on_startup"

		if element.value(slot9, element) then
			slot11 = element

			table.insert(slot9, startup_order)
		end
	end

	local function sort_func(a, b)
		slot5 = "execute_on_startup_priority"
		local av = a.value(slot3, a)
		slot6 = "execute_on_startup_priority"
		local bv = b.value(a, b)

		if av and bv then
			return av < bv
		end

		if av then
			return true
		else
			return false
		end

		return 
	end

	slot7 = sort_func

	table.sort(slot5, startup_order)

	slot6 = startup_order

	for _, element in ipairs(slot5) do
		slot11 = element

		element.on_executed(slot10, ...)
	end

	return 
end
MissionScript.add_updator = function (self, id, updator)
	self._updators[id] = updator

	return 
end
MissionScript.remove_updator = function (self, id)
	self._updators[id] = nil

	return 
end
MissionScript.update = function (self, t, dt)
	slot6 = dt

	MissionScript.super.update(slot4, self)

	slot5 = self._updators

	for _, updator in pairs(slot4) do
		slot11 = dt

		updator(slot9, t)
	end

	return 
end
MissionScript._debug_draw = function (self, t, dt)
	slot6 = Color.red
	local brush = Draw.brush(slot4, Draw)
	slot7 = Color.red
	local name_brush = Draw.brush(Draw, Draw)
	slot10 = "fonts/font_medium"

	name_brush.set_font(Draw, name_brush, Idstring(slot9))

	slot7 = name_brush
	slot10 = "OverlayVertexColorTextured"

	name_brush.set_render_template(Draw, Idstring(16))

	slot7 = self._elements

	for _, element in pairs(Draw) do
		slot15 = element
		slot13 = (element.enabled(slot14) and Color.green) or Color.red

		brush.set_color(slot11, brush)

		slot15 = element
		slot13 = (element.enabled(slot14) and Color.green) or Color.red

		name_brush.set_color(slot11, name_brush)

		slot13 = "position"

		if element.value(slot11, element) then
			slot16 = "position"
			slot14 = 5

			brush.sphere(slot11, brush, element.value(slot14, element))

			slot12 = managers.viewport

			if managers.viewport.get_current_camera(slot11) then
				slot12 = managers.viewport
				slot12 = managers.viewport.get_current_camera(slot11)
				local cam_up = managers.viewport.get_current_camera(slot11).rotation(slot11).z(slot11)
				slot13 = managers.viewport
				slot13 = managers.viewport.get_current_camera(managers.viewport.get_current_camera(slot11).rotation(slot11))
				local cam_right = managers.viewport.get_current_camera(managers.viewport.get_current_camera(slot11).rotation(slot11)).rotation(managers.viewport.get_current_camera(slot11).rotation(slot11)).x(managers.viewport.get_current_camera(slot11).rotation(slot11))
				slot18 = "position"
				slot20 = 30
				slot20 = element
				slot18 = -cam_up

				name_brush.center_text(managers.viewport.get_current_camera(managers.viewport.get_current_camera(slot11).rotation(slot11)).rotation(managers.viewport.get_current_camera(slot11).rotation(slot11)), name_brush, element.value(slot16, element) + Vector3(element, 0, 0), utf8.from_latin1(element.editor_name(0)), cam_right)
			end
		end

		slot13 = "rotation"

		if element.value(slot11, element) then

			-- Decompilation error in this vicinity:
			slot15 = "rotation"
			slot17 = "position"
			slot18 = "position"
			slot18 = rotation
			slot16 = 2

			brush.cylinder(slot12, brush, element.value(slot15, element), element.value(element, element) + rotation.y(element) * 50)

			slot17 = "position"
			slot18 = "position"
			slot18 = rotation
			slot16 = 1

			brush.cylinder(slot12, brush, element.value(element.value(element, element) + rotation.y(element) * 50, element), element.value(element, element) + rotation.z(element) * 25)
		end

		slot14 = dt

		element.debug_draw(slot11, element, t)
	end

	return 
end
MissionScript.name = function (self)
	return self._name
end
MissionScript.element_groups = function (self)
	return self._element_groups
end
MissionScript.element_group = function (self, name)
	return self._element_groups[name]
end
MissionScript.elements = function (self)
	return self._elements
end
MissionScript.element = function (self, id)
	return self._elements[id]
end
MissionScript.debug_output = function (self, debug, color)
	slot9 = "%X"
	slot7 = color

	managers.mission.add_persistent_debug_output(slot4, managers.mission, Application.date(slot7, Application) .. ": " .. debug)

	slot6 = debug

	CoreDebug.cat_print(slot4, "editor")

	return 
end
MissionScript.worlddefinition = function (self)
	return self._worlddefinition or managers.worlddefinition
end
MissionScript.sync_id = function (self)
	return self._sync_id or 0
end
MissionScript.is_debug = function (self)
	return true
end
MissionScript.add_save_state_cb = function (self, id)
	self._save_states[id] = true

	return 
end
MissionScript.remove_save_state_cb = function (self, id)
	self._save_states[id] = nil

	return 
end
MissionScript.save = function (self, data)
	local state = {}
	slot5 = self._save_states

	for id, _ in pairs(slot4) do
		state[id] = {}
		slot11 = state[id]

		self._elements[id].save(slot9, self._elements[id])
	end

	data[self._name] = state

	return 
end
MissionScript.load = function (self, data)
	local state = data[self._name]

	if not state then
		slot10 = data
		slot8 = inspect(slot9)

		Application.debug(slot4, Application, "[MissionScript:load] Nothing to load!", self._name, debug.traceback())

		return 
	end

	if self._element_groups.ElementInstancePoint then
		slot5 = self._element_groups.ElementInstancePoint

		for _, element in ipairs(slot4) do
			slot10 = element

			if state[element.id(slot9)] then
				slot11 = element
				slot9 = element.id(slot10)
				slot13 = element
				slot11 = state[element.id(slot12)]

				self._elements[slot9].load(slot9, self._elements[slot9])

				slot10 = element
				state[element.id(slot9)] = nil
			end
		end
	end

	slot5 = state

	for id, mission_state in pairs(slot4) do
		if self._elements[id] and self._elements[id].load then
			slot11 = mission_state

			self._elements[id].load(slot9, self._elements[id])
		else
			slot11 = id
			slot14 = mission_state

			_G.debug_pause(slot9, "Mission element without load method?", inspect(slot13))
		end
	end

	return 
end
MissionScript.stop_simulation = function (self, ...)
	slot3 = self._elements

	for _, element in pairs(slot2) do
		slot8 = element

		element.stop_simulation(slot7, ...)
	end

	slot3 = self

	MissionScript.super.clear(slot2)

	return 
end
MissionScript.pre_destroy = function (self, ...)
	slot3 = self._elements

	for _, element in pairs(slot2) do
		slot8 = element

		element.pre_destroy(slot7, ...)
	end

	slot3 = self

	MissionScript.super.clear(slot2)

	return 
end
MissionScript.destroy = function (self, ...)
	slot3 = self._elements

	for _, element in pairs(slot2) do
		slot8 = element

		element.destroy(slot7, ...)
	end

	slot3 = self

	MissionScript.super.clear(slot2)

	return 
end

return 
