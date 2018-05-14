slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreChangeEnvCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreChangeEnvCutsceneKey = slot0
CoreChangeEnvCutsceneKey.ELEMENT_NAME = "change_env"
CoreChangeEnvCutsceneKey.NAME = "Environment Change"
slot4 = ""

CoreChangeEnvCutsceneKey.register_serialized_attribute("Environment Change", CoreChangeEnvCutsceneKey, "name")

slot5 = tonumber

CoreChangeEnvCutsceneKey.register_serialized_attribute("Environment Change", CoreChangeEnvCutsceneKey, "transition_time", 0)

function CoreChangeEnvCutsceneKey:__tostring()
	slot4 = self

	return "Change environment to \"" .. self.name(slot3) .. "\"."
end
function CoreChangeEnvCutsceneKey:prime(player)
	slot7 = self
	slot6 = false

	managers.environment.preload_environment(slot3, managers.environment, self.name(slot6))

	return 
end
function CoreChangeEnvCutsceneKey:unload(player)
	if self.__previous_environment_name then
		slot4 = managers.viewport
		slot5 = self.__previous_environment_name

		managers.viewport.first_active_viewport(slot3).set_environment(slot3, managers.viewport.first_active_viewport(slot3))
	end

	return 
end
function CoreChangeEnvCutsceneKey:evaluate(player, fast_forward)
	if not self.__previous_environment_name then
		slot5 = managers.environment
		slot3 = managers.environment.get_current_environment_name(slot4)
	end

	self.__previous_environment_name = slot3
	slot5 = self
	local transition_time = self.transition_time(slot4)

	if transition_time and 0 < transition_time then
		slot6 = managers.viewport
		slot9 = self
		slot8 = transition_time

		managers.viewport.first_active_viewport(slot5).set_environment(slot5, managers.viewport.first_active_viewport(slot5), self.name(slot8))
	else
		slot6 = managers.viewport
		slot6 = managers.viewport.first_active_viewport(slot5)
		slot9 = self

		managers.viewport.first_active_viewport(slot5).set_environment(slot5, self.name(slot8))
	end

	return 
end
function CoreChangeEnvCutsceneKey:can_evaluate_with_player(player)
	return true
end
function CoreChangeEnvCutsceneKey:is_valid_name(name)
	slot6 = name

	return Database.has(slot3, Database, "environment")
end
function CoreChangeEnvCutsceneKey:is_valid_transition_time(value)
	return value and 0 <= value
end
CoreChangeEnvCutsceneKey.control_for_name = CoreCutsceneKeyBase.standard_combo_box_control
function CoreChangeEnvCutsceneKey:refresh_control_for_name(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot4 = self
	local value = self.name(slot3)
	slot8 = "environment"

	for _, name in ipairs(managers.database.list_entries_of_type(slot6, managers.database)) do
		slot11 = name

		control.append(slot9, control)

		if name == value then
			slot11 = value

			control.set_value(slot9, control)
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end

return 
