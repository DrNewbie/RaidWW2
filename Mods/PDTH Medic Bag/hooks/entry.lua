local ThisModPath = ModPath
local ThisModAssetsPath = tostring(ThisModPath.."assets/")
local IsLoadDown = false
_G.MedicBagUsedMaxTimes = _G.MedicBagUsedMaxTimes or 1
_G.MedicBagUsedTimes = _G.MedicBagUsedTimes or _G.MedicBagUsedMaxTimes
_G.MedicBagLists = _G.MedicBagLists or {}
_G.GamingEventBool = _G.GamingEventBool or false
Hooks:PostHook(PlayerStandard, "update", "load_doctor_bag_simple_assets000", function(self, ...)
	if not IsLoadDown and self._unit and alive(self._unit) and self._unit:movement() then
		IsLoadDown = true
		local LoadThoseAssets = {
			{"texture", "units/gen_equipment_medicbag/equipment_bags_df"},
			{"texture", "units/gen_equipment_medicbag/equipment_bags_nm"},
			{"unit", "units/gen_equipment_medicbag/gen_equipment_medicbag"},
			{"object", "units/gen_equipment_medicbag/gen_equipment_medicbag"},
			{"model", "units/gen_equipment_medicbag/gen_equipment_medicbag"},
			{"sequence_manager", "units/gen_equipment_medicbag/gen_equipment_medicbag"},
			{"material_config", "units/gen_equipment_medicbag/gen_equipment_medicbag"},
			{"cooked_physics", "units/gen_equipment_medicbag/gen_equipment_medicbag"}
		}
		for _, __d in pairs(LoadThoseAssets) do
			DB:create_entry(__d[1], __d[2], ThisModAssetsPath..__d[2].."."..__d[1])
		end
		if not managers.dyn_resource:is_resource_ready(Idstring("unit"), Idstring("units/gen_equipment_medicbag/gen_equipment_medicbag"), managers.dyn_resource.DYN_RESOURCES_PACKAGE) then
			managers.dyn_resource:load(Idstring("unit"), Idstring("units/gen_equipment_medicbag/gen_equipment_medicbag"), managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)
		end
	end
	if game_state_machine and game_state_machine._current_state then
		if _G.GamingEventBool and tostring(game_state_machine._current_state._name) == "ingame_loading" then
			_G.GamingEventBool = false
		end
		if not _G.GamingEventBool then
			_G.GamingEventBool = true
			_G.MedicBagUsedTimes = _G.MedicBagUsedMaxTimes
			for __k, __u in pairs(_G.MedicBagLists) do
				__u:base():_set_empty()
				_G.MedicBagLists[__k] = nil
			end
		end
	end
end)