if not Network or Network:is_server() then
	Hooks:PreHook(DistractionRock, "_detonate", "F_"..Idstring("PostHook:DistractionRock:_detonate:Call an Airstrike"):key(), function(self)
		if not managers.groupai:state():whisper_mode() and self:get_name_id() == "decoy_coin" and not self._called_airstrike and self:thrower_unit() == managers.player:player_unit() then
			self._called_airstrike = true
			local __pos = self._unit:position()
			local flare = safe_spawn_unit(BarrageManager.FLARE_UNIT, __pos, Rotation())
			if flare then
				managers.barrage:sync_spotter_spawn_flare(flare, __pos, Rotation(), math.UP, 1)
				if managers.network then
					managers.network:session():send_to_peers_synched("sync_spotter_spawn_flare", flare, __pos, Rotation(), math.UP)
				end
			end
		end
	end)
end