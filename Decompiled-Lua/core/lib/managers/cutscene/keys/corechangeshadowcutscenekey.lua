slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreChangeShadowCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreChangeShadowCutsceneKey = slot0
CoreChangeShadowCutsceneKey.ELEMENT_NAME = "change_shadow"
CoreChangeShadowCutsceneKey.NAME = "Shadow Change"
slot4 = ""

CoreChangeShadowCutsceneKey.register_serialized_attribute("Shadow Change", CoreChangeShadowCutsceneKey, "name")

function CoreChangeShadowCutsceneKey:init(keycollection)
	self.super.init(slot3, self)

	self._modify_func_map = {}
	self._shadow_interface_id_map = nil
	local list = {
		"slice0",
		"slice1",
		"slice2",
		"slice3",
		"shadow_slice_overlap",
		"shadow_slice_depths"
	}
	local suffix = "post_effect/shadow_processor/shadow_rendering/shadow_modifier/"
	slot6 = list

	for _, var in ipairs(keycollection) do
		slot11 = suffix .. var
		slot11 = Idstring(slot10)
		local data_path_key = Idstring(slot10).key(slot10)

		local function func()
			slot5 = self
			slot4 = data_path_key

			return managers.viewport.get_environment_value(slot1, managers.viewport, self.name(slot4)), true
		end

		self._modify_func_map[data_path_key] = func
	end

	return 
end
function CoreChangeShadowCutsceneKey:__tostring()
	slot4 = self

	return "Change shadow settings to \"" .. self.name(slot3) .. "\"."
end
function CoreChangeShadowCutsceneKey:evaluate(player, fast_forward)
	slot5 = self
	slot3 = self.preceeding_key
	slot6 = {}

	if self.unit_name then
		slot9 = self
		slot7 = self.unit_name(slot8)
	end

	slot6.unit_name = slot7

	if self.object_name then
		slot9 = self
		slot7 = self.object_name(slot8)
	end

	slot6.object_name = slot7
	local preceeding_key = slot3(slot4, slot5)

	if preceeding_key then
		slot6 = preceeding_key

		preceeding_key.revert(slot5)
	end

	self._shadow_interface_id_map = {}
	slot6 = self._modify_func_map

	for data_path_key, func in pairs(slot5) do
		slot12 = managers.viewport
		slot15 = func
		self._shadow_interface_id_map[data_path_key] = managers.viewport.first_active_viewport(slot11).create_environment_modifier(slot11, managers.viewport.first_active_viewport(slot11), data_path_key, true)
	end

	return 
end
function CoreChangeShadowCutsceneKey:revert()
	slot3 = self

	self._reset_interface(slot2)

	return 
end
function CoreChangeShadowCutsceneKey:unload()
	slot3 = self

	self._reset_interface(slot2)

	return 
end
function CoreChangeShadowCutsceneKey:can_evaluate_with_player(player)
	return true
end
function CoreChangeShadowCutsceneKey:is_valid_name(name)
	if name then
		slot6 = name
		slot2 = DB.has(slot3, DB, "environment")
	end

	return slot2
end
CoreChangeShadowCutsceneKey.control_for_name = CoreCutsceneKeyBase.standard_combo_box_control
function CoreChangeShadowCutsceneKey:refresh_control_for_name(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot4 = self
	local value = self.name(slot3)
	slot8 = "environment"

	for _, setting_name in ipairs(managers.database.list_entries_of_type(slot6, managers.database)) do
		slot11 = setting_name

		control.append(slot9, control)

		if setting_name == value then
			slot11 = setting_name

			control.set_value(slot9, control)
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreChangeShadowCutsceneKey:_reset_interface()
	if self._shadow_interface_id_map then
		slot3 = self._shadow_interface_id_map

		for data_path_key, id in pairs(slot2) do
			slot8 = managers.viewport
			slot9 = id

			managers.viewport.first_active_viewport(slot7).destroy_modifier(slot7, managers.viewport.first_active_viewport(slot7))
		end

		self._shadow_interface_id_map = nil
	end

	return 
end

return 
