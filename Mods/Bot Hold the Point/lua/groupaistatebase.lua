Hooks:PostHook(GroupAIStateBase, "on_AI_criminal_death", 'F_'..Idstring("PostHook.GroupAIStateBase.on_AI_criminal_death.Bot Hold the Point"):key(), function(self, criminal_name, unit)
	managers.hud:set_teammate_condition(managers.criminals:character_data_by_unit(unit).panel_id, "ai_set_should_stay", false)
end)

Hooks:PreHook(GroupAIStateBase, "teleport_team_ai", 'F_'..Idstring("PreHook.GroupAIStateBase.teleport_team_ai.Bot Hold the Point"):key(), function(self)
	tweak_data.criminals.loud_teleport_distance_treshold = (BotHold.Options:GetValue("TooFar")*1000)
end)

Hooks:PreHook(GroupAIStateBase, "_do_teleport_ai", 'F_'..Idstring("PreHook.GroupAIStateBase._do_teleport_ai.Bot Hold the Point"):key(), function(self, params)
	local u = params.unit
	if alive(u) then
		u:movement():set_should_stay(false)
	end
end)