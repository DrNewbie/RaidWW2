local BotCarryBags_PlayerManager_server_drop_carry = PlayerManager.server_drop_carry

function PlayerManager:server_drop_carry(...)
	local carry_unit = BotCarryBags_PlayerManager_server_drop_carry(self, ...)
	if carry_unit and alive(carry_unit) and carry_unit:carry_data() then
		carry_unit:carry_data()._bot_can_carry = true	
	end
	return carry_unit
end