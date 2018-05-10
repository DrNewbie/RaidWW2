Hooks:PostHook(TradeManager, "update", "BotRespawn_Trade_update", function(self, t, dt)
	if not managers.criminals then
		return 
	end
	if not self._trade_crim and type(self._criminals_to_respawn) == "table" and table.size(self._criminals_to_respawn) > 0 then
		local trade_crim = nil
		for _, crim in ipairs(self._criminals_to_respawn) do
			if crim.ai then
				trade_crim = crim
				break
			end
		end
		if trade_crim then
			self._trade_crim = trade_crim
			self._trade_crim_t = 120
		end
	end
	if self._trade_crim then
		if self._trade_crim_t then
			self._trade_crim_t = self._trade_crim_t - dt
			if self._trade_crim_t <= 0 then
				self._trade_crim_t = nil
			end
		elseif not self._trade_crim_t then
			if managers.criminals:get_valid_player_respawn_pos_rot() then
				local spawned_unit = managers.groupai:state():spawn_one_teamAI(false, self._trade_crim.id)
				if spawned_unit and alive(spawned_unit) then
					for i, crim in ipairs(self._criminals_to_respawn) do
						if crim == self._trade_crim then
							table.remove(self._criminals_to_respawn, i)
						end
					end
				end
			end
			self._trade_crim = nil
			self._trade_crim_t = nil
		end
	end
end)