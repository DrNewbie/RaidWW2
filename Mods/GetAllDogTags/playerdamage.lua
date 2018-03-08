local GetAllDogTagsEvent_bool = false

Hooks:PostHook(PlayerDamage, "update", "GetAllDogTagsEvent", function(self, unit, t)
	if not game_state_machine or not game_state_machine._current_state then
		return
	end
	if GetAllDogTagsEvent_bool and tostring(game_state_machine._current_state._name) == "ingame_loading" then
		GetAllDogTagsEvent_bool = false
	end
	if not GetAllDogTagsEvent_bool then
		if not managers.interaction or not managers.interaction._interactive_units then
			return
		end
		local wanted = {
			consumable_mission = true,
			hold_take_dogtags = true,
			hold_take_loot = true
		}
		local get_loot = false
		local get_count = 1
		for _, unit in pairs(managers.interaction._interactive_units) do
			if unit:interaction() and unit:interaction().tweak_data and wanted[unit:interaction().tweak_data] then
				get_count = get_count + 1
				DelayedCalls:Add('GetAllDogTagsEvent_Take_'..get_count, get_count*0.5, function()
					if unit and alive(unit) and unit:interaction() then
						unit:interaction():interact(managers.player:player_unit())
					end
				end)
				get_loot = true
			end
		end
		if get_loot then
			GetAllDogTagsEvent_bool = true
		end
	end
end)