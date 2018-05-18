Hooks:PostHook(DistractionRock, "_detonate", "Airstrike_Check_Bomb_Now", function(self)
	if not managers.groupai:state():whisper_mode() and self:get_name_id() == "decoy_coin" and not self._called_airstrike and self:thrower_unit() == managers.player:player_unit() then
		self._called_airstrike = true
		managers.barrage:spawn_flare(self._unit, self._unit)
	end
end)