function TeamAIMovement:set_should_stay(should_stay)
	if self._should_stay ~= should_stay then
		local panel = managers.criminals:character_data_by_unit(self._unit)
		if panel then
			managers.hud:set_teammate_condition(panel.panel_id, "ai_set_should_stay", should_stay)
		end
		self._should_stay = should_stay
	end
end

function TeamAIMovement:chk_action_forbidden(action_type)
	if action_type == "walk" and self._should_stay then
		if Network:is_server() and self._unit:brain():objective() and (self._unit:brain():objective().type == "revive" or self._unit:brain():objective().forced) then
			return false
		end
		return true
	end
	return TeamAIMovement.super.chk_action_forbidden(self, action_type)
end

Hooks:PostHook(TeamAIMovement, "save", 'F_'..Idstring("PostHook.TeamAIMovement.save.Bot Hold the Point"):key(), function(self, save_data)
	save_data.movement.should_stay = self._should_stay
end)

Hooks:PostHook(TeamAIMovement, "load", 'F_'..Idstring("PostHook.TeamAIMovement.load.Bot Hold the Point"):key(), function(self, load_data)
	if load_data.movement then
		self:set_should_stay(load_data.movement.should_stay)
	end
end)