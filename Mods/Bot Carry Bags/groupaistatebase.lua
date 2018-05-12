Hooks:PreHook(GroupAIStateBase, "remove_one_teamAI", "BotCarry_GroupAI_remove_one_teamAI", function(self)
	local _all_AI_criminals = self:all_AI_criminals() or {}	
	for _, data in pairs(_all_AI_criminals) do
		if data.unit and alive(data.unit) and data.unit:movement():carrying_bag() then
			data.unit:movement():throw_bag()
		end
	end
end)