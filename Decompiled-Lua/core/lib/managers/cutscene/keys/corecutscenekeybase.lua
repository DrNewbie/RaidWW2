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
-- Decompilation Error: _glue_flows(node)

CoreCutsceneKeyBase = CoreCutsceneKeyBase or class()
CoreCutsceneKeyBase.init = function (self, key_collection)
	slot5 = key_collection

	self.set_key_collection(slot3, self)

	return 
end
CoreCutsceneKeyBase.load = function (self, key_node, loading_class)
	loading_class = loading_class or self

	if loading_class.super and loading_class.super.load then
		slot7 = loading_class.super

		loading_class.super.load(slot4, self, key_node)
	end

	if loading_class == CoreCutsceneKeyBase then
		slot6 = "frame"

		if key_node.parameter(slot4, key_node) then
			slot5 = self
			slot11 = "frame"

			self.set_frame(slot4, tonumber(key_node.parameter(slot9, key_node)))
		end
	end

	slot3 = pairs
	slot5 = loading_class.__serialized_attributes or {}

	for attribute, transform_func in slot3(slot4) do
		slot11 = attribute
		local string_value = key_node.parameter(slot9, key_node)

		if string_value then
			slot12 = string_value
			self["__" .. attribute] = transform_func(slot11)
		end
	end

	return 
end
CoreCutsceneKeyBase.populate_from_editor = function (self, cutscene_editor)
	slot4 = self
	slot7 = cutscene_editor

	self.set_frame(slot3, cutscene_editor.playhead_position(slot6))

	return 
end
CoreCutsceneKeyBase.set_key_collection = function (self, key_collection)
	self.__key_collection = key_collection

	return 
end
CoreCutsceneKeyBase.set_cast = function (self, cast)
	self._cast = cast

	return 
end
CoreCutsceneKeyBase.clone = function (self)
	slot3 = self

	return clone(slot2)
end
CoreCutsceneKeyBase.prime = function (self, player)
	return 
end
CoreCutsceneKeyBase.unload = function (self, player)
	return 
end
CoreCutsceneKeyBase.type_name = function (self)
	return self.NAME or "Unknown"
end
CoreCutsceneKeyBase._key_collection = function (self)
	return self.__key_collection
end
CoreCutsceneKeyBase.frame = function (self)
	return self._frame or 0
end
CoreCutsceneKeyBase.set_frame = function (self, frame)
	self._frame = frame

	return 
end
CoreCutsceneKeyBase.time = function (self)
	slot3 = self

	return self.frame(slot2) / 30
end
CoreCutsceneKeyBase.preceeding_key = function (self, properties)
	slot4 = self

	if self._key_collection(slot3) then
		slot4 = self
		slot7 = self
		slot7 = properties
		slot2 = self._key_collection(slot3).last_key_before(slot3, self._key_collection(slot3), self.time(slot6), self.ELEMENT_NAME)
	end

	return slot2
end
CoreCutsceneKeyBase.can_evaluate_with_player = function (self, player)
	return player ~= nil
end
CoreCutsceneKeyBase.is_valid = function (self, debug_output)
	slot6 = self

	for _, attribute_name in ipairs(self.attribute_names(slot5)) do
		slot10 = attribute_name
		slot14 = attribute_name

		if not self.is_valid_attribute_value(slot8, self, self.attribute_value(slot12, self)) then
			if debug_output then
				slot10 = "Attribute \"" .. attribute_name .. "\" is invalid."

				Application.error(slot8, Application)
			end

			return false
		end
	end

	return true
end
CoreCutsceneKeyBase.is_valid_attribute_value = function (self, attribute_name, value)
	local validator_func = self["is_valid_" .. attribute_name]

	if validator_func ~= nil then
		slot7 = value
		slot4 = validator_func(slot5, self)

		if validator_func(slot5, self) then
			slot4 = false
		end
	else
		slot4 = true
	end

	return slot4
end
CoreCutsceneKeyBase.is_valid_object_name = function (self, object_name, unit_name)
end
CoreCutsceneKeyBase.is_valid_unit_name = function (self, unit_name)
	slot6 = self

	return table.contains(slot3, self._unit_names(unit_name))
end
CoreCutsceneKeyBase._unit_names = function (self)
	slot4 = unit_names

	table.sort(slot3)

	return unit_names
end
CoreCutsceneKeyBase._unit_type = function (self, unit_name)

	-- Decompilation error in this vicinity:
	slot6 = true
	local unit = self._unit(slot3, self, unit_name)

	if unit then
		slot5 = unit
		slot3 = unit.name(slot4)
	end

	return slot3
end
CoreCutsceneKeyBase._unit_object_names = function (self, unit_name)

	-- Decompilation error in this vicinity:
	slot4 = managers.cutscene
	slot4 = managers.cutscene.actor_database(slot3)
	slot8 = unit_name
	local unit_type_info = managers.cutscene.actor_database(slot3).unit_type_info(slot3, self._unit_type(slot6, self))
end
CoreCutsceneKeyBase._unit_initial_object_visibility = function (self, unit_name, object_name)
	slot5 = managers.cutscene
	slot5 = managers.cutscene.actor_database(slot4)
	slot9 = unit_name
	local unit_type_info = managers.cutscene.actor_database(slot4).unit_type_info(slot4, self._unit_type(slot7, self))

	if unit_type_info then
		slot7 = object_name
		slot4 = unit_type_info.initial_object_visibility(slot5, unit_type_info)
	end

	return slot4
end
CoreCutsceneKeyBase._unit_extension_info = function (self, unit_name)

	-- Decompilation error in this vicinity:
	slot4 = managers.cutscene
	slot4 = managers.cutscene.actor_database(slot3)
	slot8 = unit_name
	local unit_type_info = managers.cutscene.actor_database(slot3).unit_type_info(slot3, self._unit_type(slot6, self))
end
CoreCutsceneKeyBase._unit_animation_groups = function (self, unit_name)

	-- Decompilation error in this vicinity:
	slot4 = managers.cutscene
	slot4 = managers.cutscene.actor_database(slot3)
	slot8 = unit_name
	local unit_type_info = managers.cutscene.actor_database(slot3).unit_type_info(slot3, self._unit_type(slot6, self))
end
CoreCutsceneKeyBase._unit = function (self, unit_name, allow_nil)
	if self._cast then
		slot6 = unit_name
		local unit = self._cast.unit(slot4, self._cast)
	end

	if unit == nil and managers.cutscene then
		slot6 = managers.cutscene
		unit = managers.cutscene.cutscene_actors_in_world(slot5)[unit_name]
	end

	slot7 = "Unit \"" .. (unit_name or "nil") .. "\" not found in cast or world."

	assert(slot5, allow_nil or unit)

	return unit
end
CoreCutsceneKeyBase._unit_object = function (self, unit_name, object_name, allow_nil)
	slot8 = allow_nil
	local unit = self._unit(slot5, self, unit_name)

	if unit then
		slot8 = object_name
		local object = unit.get_object(slot6, unit)
	end

	slot9 = "Object \"" .. (object_name or "nil") .. "\" not found in unit \"" .. (unit_name or "nil") .. "\"."

	assert(slot7, allow_nil or object)

	return object
end
CoreCutsceneKeyBase._unit_extension = function (self, unit_name, extension_name, allow_nil)

	-- Decompilation error in this vicinity:
	slot8 = allow_nil
	local unit = self._unit(slot5, self, unit_name)
	local extension_func = unit and unit[extension_name]
	slot8 = extension_func
end
CoreCutsceneKeyBase._unit_is_owned_by_level = function (self, unit_name)
	if managers.cutscene then
		slot4 = managers.cutscene

		return managers.cutscene.cutscene_actors_in_world(slot3)[unit_name] ~= nil
	end
end
CoreCutsceneKeyBase.play = function (self, player, undo, fast_forward)
	slot8 = self.evaluate
	slot7 = "Cutscene key must define the \"evaluate\" method to use the default CoreCutsceneKeyBase:play method."

	assert(slot5, type(slot7) == "function")

	if undo then
		slot6 = self.revert

		if type(slot5) == "function" then
			slot7 = player

			self.revert(slot5, self)
		else
			slot6 = self
			slot4 = self.preceeding_key
			slot7 = {}

			if self.unit_name then
				slot10 = self
				slot8 = self.unit_name(slot9)
			end

			slot7.unit_name = slot8

			if self.object_name then
				slot10 = self
				slot8 = self.object_name(slot9)
			end

			slot7.object_name = slot8
			local preceeding_key = slot4(slot5, slot6)

			if preceeding_key then
				slot9 = false

				preceeding_key.evaluate(slot6, preceeding_key, player)
			end
		end
	else
		slot8 = fast_forward

		self.evaluate(slot5, self, player)
	end

	return 
end
CoreCutsceneKeyBase._save_under = function (self, parent_node)
	slot5 = "Required string member ELEMENT_NAME not declared in cutscene key class."
	local element_name = assert(slot3, self.ELEMENT_NAME)
	slot6 = element_name
	local key_node = parent_node.make_child(self.ELEMENT_NAME, parent_node)
	slot7 = "frame"
	slot12 = self

	key_node.set_parameter(parent_node, key_node, tostring(self.frame(slot11)))

	local exclude_defaults = true
	slot10 = exclude_defaults

	for _, attribute_name in ipairs(self.attribute_names(tostring, self)) do
		slot13 = attribute_name
		slot19 = attribute_name

		key_node.set_parameter(slot11, key_node, tostring(self.attribute_value(slot17, self)))
	end

	return key_node
end
CoreCutsceneKeyBase.attribute_names = function (self, exclude_defaults, _class, _destination)
	if not _class then
		slot6 = self
		_class = getmetatable(slot5)
	end

	_destination = _destination or {}

	if _class.super then
		slot9 = _destination

		CoreCutsceneKeyBase.attribute_names(slot5, self, exclude_defaults, _class.super)
	end

	slot4 = ipairs
	slot6 = _class.__serialized_attribute_order or {}

	for _, attribute_name in slot4(slot5) do
		if not exclude_defaults or self["__" .. attribute_name] ~= nil then
			slot12 = attribute_name

			table.insert(slot10, _destination)
		end
	end

	return _destination
end
CoreCutsceneKeyBase.attribute_value = function (self, attribute_name)
	if self[attribute_name] then
		slot4 = self
		slot2 = self[attribute_name](slot3)
	end

	return slot2
end
CoreCutsceneKeyBase.attribute_value_from_string = function (self, attribute_name, string_value)
	if string_value == "" then
		return nil
	else
		local transform_func = self.__serialized_attributes[attribute_name]
		slot6 = string_value

		return transform_func(slot5)
	end

	return 
end
CoreCutsceneKeyBase.set_attribute_value_from_string = function (self, attribute_name, string_value)
	slot7 = string_value
	local value = self.attribute_value_from_string(slot4, self, attribute_name)
	slot7 = value

	return self["set_" .. attribute_name](attribute_name, self)
end
CoreCutsceneKeyBase.register_control = function (self, control_name)
	self.register_serialized_attribute(slot3, self, control_name, nil)

	return 
end
CoreCutsceneKeyBase.register_serialized_attribute = function (self, attribute_name, default, transform_func)
	local class_table = self
	class_table.__serialized_attributes = class_table.__serialized_attributes or {}
	class_table.__serialized_attributes[attribute_name] = transform_func or tostring
	class_table.__serialized_attribute_order = class_table.__serialized_attribute_order or {}
	slot8 = attribute_name

	if not table.contains(slot6, class_table.__serialized_attribute_order) then
		slot8 = attribute_name

		table.insert(slot6, class_table.__serialized_attribute_order)
	end

	class_table[attribute_name] = function (instance)
		local value = instance["__" .. attribute_name]

		return (value == nil and default) or value
	end
	class_table["set_" .. attribute_name] = function (instance, value)
		local previous_value = instance["__" .. attribute_name]

		if instance.on_attribute_before_changed then
			slot8 = previous_value

			instance.on_attribute_before_changed(slot4, instance, attribute_name, value)
		end

		if instance["is_valid_" .. attribute_name] then
			slot7 = previous_value
		else
			slot8 = value
			instance["__" .. attribute_name] = iff(slot5, value == default, nil)

			if instance.on_attribute_changed then
				slot8 = previous_value

				instance.on_attribute_changed(slot4, instance, attribute_name, value)
			end

			return true
		end

		return 
	end

	return 
end
CoreCutsceneKeyBase.attribute_affects = function (self, changed, ...)
	local class_table = self
	class_table.__control_dependencies = class_table.__control_dependencies or {}
	slot6 = {
		...
	}
	local affected_attribute_names = table.list_union(slot4, class_table.__control_dependencies[changed] or {})
	class_table.__control_dependencies[changed] = affected_attribute_names

	return 
end
CoreCutsceneKeyBase.populate_sizer_with_editable_attributes = function (self, grid_sizer, parent_frame)
	slot7 = self

	for _, attribute_name in ipairs(self.attribute_names(slot6)) do
		local control = nil

		local function on_control_edited()
			slot3 = attribute_name
			local value_is_valid = self.validate_control_for_attribute(slot1, self)

			if value_is_valid then
				slot3 = control
				local value = control.get_value(slot2)

				if value == nil then
					value = ""
				else
					slot4 = value
					value = tostring(slot3)
				end

				slot6 = value

				self.set_attribute_value_from_string(slot3, self, attribute_name)

				slot5 = attribute_name

				self.refresh_controls_dependent_on(slot3, self)

				slot4 = parent_frame

				parent_frame.fit_inside(slot3)
			end

			return 
		end

		slot15 = on_control_edited
		control = self.control_for_attribute(slot11, self, attribute_name, parent_frame)
		self.__controls = self.__controls or {}
		self.__controls[attribute_name] = control
		slot13 = attribute_name

		self.refresh_control_for_attribute(slot11, self)

		slot12 = control
		local control_type = type_name(slot11)

		if control_type == "EWSPanel" then
			slot17 = "EXPAND"

			grid_sizer.add(slot12, grid_sizer, control, 1, 0)
		else

			-- Decompilation error in this vicinity:
			slot14 = control_type

			if not table.contains(slot12, {
				"EWSCheckBox",
				"EWSButton",
				"EWSBitmapButton",
				"EWSStaticLine"
			}) then
				slot14 = attribute_name
				local label = self.attribute_label(slot12, self)

				if label then
					slot19 = label .. ":"
					slot18 = "TOP,LEFT,RIGHT"

					grid_sizer.add(slot13, grid_sizer, EWS.StaticText(slot16, EWS, parent_frame), 0, 5)
				end
			end

			slot13 = grid_sizer
			slot11 = grid_sizer.add
			slot16 = control
			slot17 = "ALL,EXPAND"

			slot11(slot12, slot13, control.panel(slot15) or control, 0, 5)
		end
	end

	return 
end
CoreCutsceneKeyBase.attribute_label = function (self, attribute_name)
	if self["label_for_" .. attribute_name] then
		slot4 = self

		return self["label_for_" .. attribute_name](attribute_name)
	else
		slot5 = true

		return string.pretty(slot3, attribute_name)
	end

	return 
end
CoreCutsceneKeyBase.attribute_is_boolean = function (self, attribute_name)

	-- Decompilation error in this vicinity:
	slot6 = "true"
end
CoreCutsceneKeyBase.control_for_attribute = function (self, attribute_name, parent_frame, callback_func)
	if self["control_for_" .. attribute_name] then
		slot8 = callback_func

		return self["control_for_" .. attribute_name](attribute_name, self, parent_frame)
	else
		slot7 = attribute_name

		if self.attribute_is_boolean(slot5, self) then
			slot7 = parent_frame
			slot11 = attribute_name
			local control = EWS.CheckBox(slot5, EWS, self.attribute_label(slot9, self))
			slot7 = control
			slot10 = control
			slot11 = 0

			control.set_min_size(EWS, control.get_min_size(slot9).with_x(slot9, control.get_min_size(slot9)))

			slot9 = callback_func

			control.connect(EWS, control, "EVT_COMMAND_CHECKBOX_CLICKED")

			return control
		else
			slot8 = ""
			local control = EWS.TextCtrl(slot5, EWS, parent_frame)
			slot7 = control
			slot10 = control
			slot11 = 0

			control.set_min_size(EWS, control.get_min_size(slot9).with_x(slot9, control.get_min_size(slot9)))

			slot9 = callback_func

			control.connect(EWS, control, "EVT_COMMAND_TEXT_UPDATED")

			return control
		end
	end

	return 
end
CoreCutsceneKeyBase.refresh_control_for_attribute = function (self, attribute_name)
	local control = self.__controls and self.__controls[attribute_name]

	if control then
	elseif self.__controls then
		self.__controls[attribute_name] = nil
	end

	return 
end
CoreCutsceneKeyBase.refresh_controls_dependent_on = function (self, attribute_name, refreshed_controls)
	refreshed_controls = refreshed_controls or {}

	if refreshed_controls[attribute_name] == nil then
		slot3 = ipairs
		slot5 = (self.__control_dependencies and self.__control_dependencies[attribute_name]) or {}

		for _, dependant_attribute_name in slot3(slot4) do
			slot11 = dependant_attribute_name

			self.refresh_control_for_attribute(slot9, self)

			refreshed_controls[dependant_attribute_name] = true
			slot12 = refreshed_controls

			self.refresh_controls_dependent_on(slot9, self, dependant_attribute_name)
		end
	end

	return 
end
CoreCutsceneKeyBase.validate_control_for_attribute = function (self, attribute_name)

	-- Decompilation error in this vicinity:
	local control = self.__controls and self.__controls[attribute_name]

	if control == nil then
		return false
	else
		slot5 = {
			"EWSPanel",
			"EWSCheckBox",
			"EWSRadioButton",
			"EWSSlider",
			"EWSButton",
			"EWSBitmapButton",
			"EWSStaticLine",
			"EWSColorWell"
		}
		slot8 = control

		if table.contains(slot4, type_name(slot7)) then
			return true
		end
	end

	slot6 = attribute_name
	slot10 = attribute_name
	slot13 = control
	local value_is_valid = self.is_valid_attribute_value(slot4, self, self.attribute_value_from_string(slot8, self, control.get_value(slot12)))
	slot7 = control
	slot10 = colour * 255

	control.set_background_colour(slot6, colour * 255.unpack(slot9))

	slot7 = control

	if type_name(slot6) ~= "table" then
		slot7 = control

		control.refresh(slot6)

		slot7 = control

		control.update(slot6)
	end

	return value_is_valid
end
CoreCutsceneKeyBase.standard_divider_control = function (self, parent_frame)
	slot5 = parent_frame
	local control = EWS.StaticLine(slot3, EWS)
	slot5 = control
	slot8 = control
	slot9 = 0

	control.set_min_size(EWS, control.get_min_size(slot7).with_x(slot7, control.get_min_size(slot7)))

	return control
end
CoreCutsceneKeyBase.standard_combo_box_control = function (self, parent_frame, callback_func)
	slot9 = "CB_DROPDOWN,CB_READONLY,CB_SORT"
	local control = EWS.ComboBox(slot4, EWS, parent_frame, "", "")
	slot6 = control
	slot9 = control
	slot10 = 0

	control.set_min_size(EWS, control.get_min_size("").with_x("", control.get_min_size("")))

	slot8 = callback_func

	control.connect(EWS, control, "EVT_COMMAND_COMBOBOX_SELECTED")

	return control
end
CoreCutsceneKeyBase.standard_combo_box_control_refresh = function (self, attribute_name, values)
	local function refresh_func(self, control)
		slot4 = control

		control.freeze(slot3)

		slot4 = control

		control.clear(slot3)

		slot5 = attribute_name
		local attribute_value = self.attribute_value(slot3, self)
		slot5 = values

		for _, entry in ipairs(self) do
			local value = tostring(slot9)
			slot12 = value

			control.append(entry, control)

			if value == attribute_value then
				slot12 = value

				control.set_value(slot10, control)
			end
		end

		slot5 = control

		control.thaw(slot4)

		return 
	end

	return refresh_func
end
CoreCutsceneKeyBase.standard_percentage_slider_control = function (self, parent_frame, callback_func)
	slot11 = "SL_AUTOTICKS"
	local control = EWS.Slider(slot4, EWS, parent_frame, 0, 0, 100, "")
	slot7 = 50

	control.set_tick_freq(EWS, control)

	slot8 = callback_func

	control.connect(EWS, control, "EVT_SCROLL_CHANGED")

	slot8 = callback_func

	control.connect(EWS, control, "EVT_SCROLL_THUMBTRACK")

	return control
end
CoreCutsceneKeyBase.standard_percentage_slider_control_refresh = function (self, attribute_name)
	local function refresh_func(self, control)
		slot5 = attribute_name
		local attribute_value = self.attribute_value(slot3, self)
		slot5 = control
		slot10 = 100

		control.set_value(self, math.clamp(slot7, attribute_value * 100, 0))

		return 
	end

	return refresh_func
end
CoreCutsceneKeyBase.control_for_unit_name = CoreCutsceneKeyBase.standard_combo_box_control
CoreCutsceneKeyBase.control_for_object_name = CoreCutsceneKeyBase.standard_combo_box_control
CoreCutsceneKeyBase.refresh_control_for_unit_name = function (self, control, selected_unit_name)
	slot5 = control

	control.freeze(slot4)

	slot5 = control

	control.clear(slot4)

	local unit_names = self._unit_names(slot4)
	slot6 = unit_names

	if table.empty(self) then
		slot7 = false

		control.set_enabled(slot5, control)
	else
		slot7 = true

		control.set_enabled(slot5, control)

		if not selected_unit_name then
			slot6 = self
			local value = self.unit_name(slot5)
		end

		slot7 = unit_names

		for _, unit_name in pairs(slot6) do
			slot13 = unit_name

			if self.is_valid_unit_name(slot11, self) then
				slot13 = unit_name

				control.append(slot11, control)

				if unit_name == value then
					slot13 = value

					control.set_value(slot11, control)
				end
			end
		end
	end

	slot6 = control

	control.thaw(slot5)

	return 
end
CoreCutsceneKeyBase.refresh_control_for_object_name = function (self, control, unit_name, selected_object_name)
	slot6 = control

	control.freeze(slot5)

	slot6 = control

	control.clear(slot5)

	slot6 = self
	slot4 = self._unit_object_names

	if not unit_name then
		slot9 = self
		slot7 = self.unit_name(slot8)
	end

	local object_names = slot4(slot5, slot6)

	if #object_names == 0 then
		slot8 = false

		control.set_enabled(slot6, control)
	else
		slot8 = true

		control.set_enabled(slot6, control)

		if not selected_object_name then
			slot7 = self
			local value = self.object_name(slot6)
		end

		slot8 = object_names

		for _, object_name in ipairs(slot7) do
			slot15 = unit_name

			if self.is_valid_object_name(slot12, self, object_name) then
				slot14 = object_name

				control.append(slot12, control)

				if object_name == value then
					slot14 = value

					control.set_value(slot12, control)
				end
			end
		end
	end

	slot7 = control

	control.thaw(slot6)

	return 
end
CoreCutsceneKeyBase.on_gui_representation_changed = function (self, sender, sequencer_clip)
	slot5 = self
	slot8 = sequencer_clip

	self.set_frame(slot4, sequencer_clip.start_time(slot7))

	return 
end
CoreCutsceneKeyBase.VOID = function (self)
	return nil
end
CoreCutsceneKeyBase.TRUE = function (self)
	return true
end
CoreCutsceneKeyBase.string_to_vector = function (string_value)

	-- Decompilation error in this vicinity:
	local xyz_strings = {}
	slot5 = "Vector3%((%-?[%d%.]+), (%-?[%d%.]+), (%-?[%d%.]+)%)"
	xyz_strings[MULTRES] = string.match(slot3, string_value)
	slot5 = tonumber
	local xyz_numbers = table.collect(slot3, xyz_strings)
end
CoreCutsceneKeyBase.string_to_rotation = function (string_value)

	-- Decompilation error in this vicinity:
	local xyz_strings = {}
	slot5 = "Rotation%((%-?[%d%.]+), (%-?[%d%.]+), (%-?[%d%.]+)%)"
	xyz_strings[MULTRES] = string.match(slot3, string_value)
	slot5 = tonumber
	local xyz_numbers = table.collect(slot3, xyz_strings)
end
CoreCutsceneKeyBase.string_to_color = function (string_value)

	-- Decompilation error in this vicinity:
	local argb_strings = {}
	slot5 = "Color%(([%d%.]+) %* %(([%d%.]+), ([%d%.]+), ([%d%.]+)%)%)"
	argb_strings[MULTRES] = string.match(slot3, string_value)
	slot5 = tonumber
	local argb_numbers = table.collect(slot3, argb_strings)
end
slot4 = "object_name"

CoreCutsceneKeyBase.attribute_affects(function (string_value)

	-- Decompilation error in this vicinity:
	local argb_strings = 
	slot5 = "Color%(([%d%.]+) %* %(([%d%.]+), ([%d%.]+), ([%d%.]+)%)%)"
	argb_strings[MULTRES] = string.match(slot3, string_value)
	slot5 = tonumber
	local argb_numbers = table.collect(slot3, argb_strings)
end, CoreCutsceneKeyBase, "unit_name")

return 
