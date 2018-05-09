Hooks:PostHook(FragGrenade, "set_thrower_unit", "Airstrike_init", function(self)
	if self._thrower_unit and self._thrower_unit == managers.player:player_unit() then
		local player = managers.player:player_unit()
		if player and alive(player) then
			local PlyStandard = player:movement() and player:movement()._states.standard or nil
			if PlyStandard and PlyStandard:use_second_interact() then
				self._airstrike = true
			end
		end
	end
end)

Hooks:PostHook(FragGrenade, "_detonate", "Airstrike_detonate", function(self)
	if self._airstrike and self._thrower_unit and self._thrower_unit == managers.player:player_unit() then
		managers.barrage:spawn_flare(self._unit, self._unit)
	end
end)