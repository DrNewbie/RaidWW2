local BotCarryBags_PlayerManager_server_drop_carry = PlayerManager.server_drop_carry

function PlayerManager:server_drop_carry(...)
	local carry_unit = BotCarryBags_PlayerManager_server_drop_carry(self, ...)
	if carry_unit and alive(carry_unit) and carry_unit:carry_data() then
		if tweak_data.carry and tweak_data.carry[carry_unit:carry_data()._carry_id].is_corpse then
			
		else
			carry_unit:carry_data()._bot_can_carry = true
		end
	end
	return carry_unit
end