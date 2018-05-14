slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreLightGroupCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreLightGroupCutsceneKey = slot0
CoreLightGroupCutsceneKey.ELEMENT_NAME = "light_group"
CoreLightGroupCutsceneKey.NAME = "Light Group"
slot4 = ""

CoreLightGroupCutsceneKey.register_serialized_attribute("Light Group", CoreLightGroupCutsceneKey, "group")

slot5 = toboolean

CoreLightGroupCutsceneKey.register_serialized_attribute("Light Group", CoreLightGroupCutsceneKey, "enable", false)

slot4 = "enable"

CoreLightGroupCutsceneKey.attribute_affects("Light Group", CoreLightGroupCutsceneKey, "group")

function CoreLightGroupCutsceneKey:__tostring()
	slot6 = self
	slot4 = self.group(slot5)
	slot9 = self

	return string.format(slot2, "Change light group, %s stateto %s.", tostring(self.enable(slot8)))
end
function CoreLightGroupCutsceneKey:prime()
	slot3 = self

	self._build_group_cache(slot2)

	return 
end
function CoreLightGroupCutsceneKey:evaluate()
	slot6 = self
	slot4 = "Could not find group!"
	local group = assert(slot2, self._light_groups(slot4)[self.group(self)])
	slot4 = group

	for _, unit in ipairs(self._light_groups(slot4)[self.group(self)]) do
		slot10 = unit
		slot13 = self

		self._enable_lights(slot8, self, self.enable(slot12))
	end

	return 
end
function CoreLightGroupCutsceneKey:revert()
	slot4 = {
		group = self.group(slot6)
	}
	slot7 = self
	local prev_key = self.preceeding_key(slot2, self)

	if prev_key then
		slot4 = prev_key

		prev_key.evaluate(slot3)
	else
		slot7 = self
		slot5 = "Could not find group!"
		local group = assert(slot3, self._light_groups(slot5)[self.group(self)])
		slot5 = group

		for _, unit in ipairs(self._light_groups(slot5)[self.group(self)]) do
			slot12 = false

			self._enable_lights(slot9, self, unit)
		end
	end

	return 
end
function CoreLightGroupCutsceneKey:unload()
	slot5 = self

	for group_name, group in pairs(self._light_groups(slot4)) do
		slot8 = group

		for _, unit in ipairs(slot7) do
			slot15 = false

			self._enable_lights(slot12, self, unit)
		end
	end

	return 
end
function CoreLightGroupCutsceneKey:can_evaluate_with_player(player)
	return true
end
function CoreLightGroupCutsceneKey:is_valid_group(name)
	slot6 = self

	for group_name, _ in pairs(self._light_groups(slot5)) do
		if group_name == name then
			return true
		end
	end

	return 
end
function CoreLightGroupCutsceneKey:is_valid_enable()
	return true
end
function CoreLightGroupCutsceneKey:on_attribute_changed(attribute_name, value, previous_value)
	if attribute_name == "group" or (attribute_name == "enable" and not value) then
		slot6 = self

		self._eval_prev_group(slot5)
	end

	return 
end
function CoreLightGroupCutsceneKey:_light_groups()
	if not self._light_groups_cache then
		slot3 = self

		self._build_group_cache(slot2)
	end

	return self._light_groups_cache
end
function CoreLightGroupCutsceneKey:_enable_lights(unit, enabled)
	slot6 = "light"
	local lights = unit.get_objects_by_type(slot4, unit)

	if #lights == 0 then
		slot10 = unit
		slot7 = "[CoreLightGroupCutsceneKey] No lights in unit: " .. unit.name(slot9)

		Application.stack_dump_error(slot5, Application)
	end

	slot6 = lights

	for _, light in ipairs(slot5) do
		slot12 = enabled

		light.set_enable(slot10, light)
	end

	return 
end
function CoreLightGroupCutsceneKey:_build_group_cache()
	self._light_groups_cache = {}
	slot5 = managers.cutscene

	for key, unit in pairs(managers.cutscene.cutscene_actors_in_world(slot4)) do
		slot9 = "(.+)_(.+)_(.+)"
		local identifier, name, id = string.match(slot7, key)

		if identifier == "lightgroup" then
			if not self._light_groups_cache[name] then
				self._light_groups_cache[name] = {}
			end

			slot12 = unit

			table.insert(slot10, self._light_groups_cache[name])

			slot13 = false

			self._enable_lights(slot10, self, unit)
		end
	end

	return 
end
function CoreLightGroupCutsceneKey:_eval_prev_group()
	slot4 = {
		group = self.group(slot6)
	}
	slot7 = self
	local prev_key = self.preceeding_key(slot2, self)

	if prev_key then
		slot4 = prev_key

		prev_key.evaluate(slot3)
	else
		slot4 = self

		self.evaluate(slot3)
	end

	return 
end
function CoreLightGroupCutsceneKey:refresh_control_for_group(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot4 = self
	local value = self.group(slot3)
	slot7 = self

	for group_name, _ in pairs(self._light_groups(slot6)) do
		slot11 = group_name

		control.append(slot9, control)

		if group_name == value then
			slot11 = group_name

			control.set_value(slot9, control)
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreLightGroupCutsceneKey:check_box_control(parent_frame, callback_func)
	slot9 = ""
	local control = EWS.CheckBox(slot4, EWS, parent_frame, "Enable", "")
	slot6 = control
	slot9 = control
	slot10 = 0

	control.set_min_size(EWS, control.get_min_size("").with_x("", control.get_min_size("")))

	slot8 = callback_func

	control.connect(EWS, control, "EVT_COMMAND_CHECKBOX_CLICKED")

	return control
end
function CoreLightGroupCutsceneKey:refresh_control_for_enable(control)
	slot4 = control
	slot7 = self

	control.set_value(slot3, self.enable(slot6))

	return 
end
CoreLightGroupCutsceneKey.control_for_group = CoreCutsceneKeyBase.standard_combo_box_control
CoreLightGroupCutsceneKey.control_for_enable = CoreLightGroupCutsceneKey.check_box_control

return 
