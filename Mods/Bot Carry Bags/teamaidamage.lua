tweak_data.ai_carry = {
	throw_distance = 500,
	throw_force = 100,
	revive_distance_autopickup = 300,
	death_distance_teleport = 300
}

Hooks:PostHook(TeamAIDamage, "revive", "BotCarry_Dmg_revive", function(self, reviving_unit)
	local dropped_bag = self._unit:movement():was_carrying_bag()
	if dropped_bag and alive(dropped_bag.unit) then
		local distance = mvector3.distance_sq(self._unit:movement():m_pos(), dropped_bag.unit:position())
		local max_distance = math.pow(tweak_data.ai_carry.revive_distance_autopickup, 2)
		if distance <= max_distance then
			dropped_bag.unit:carry_data():link_to(self._unit, false)
			if self._unit:movement().set_carrying_bag then
				self._unit:movement():set_carrying_bag(dropped_bag.unit)
			end
		end
	end
end)

Hooks:PreHook(TeamAIDamage, "_check_bleed_out", "BotCarry_Dmg_check_bleed_out", function(self)
	if self._health <= 0 and Network:is_server() and self._unit:movement():carrying_bag() then
		self._unit:movement():throw_bag()
	end
end)

function TeamAIDamage:_teleport_carried_bag()
	if self._unit:movement()._carry_unit then
		self._unit:movement():throw_bag()
	end
	local dropped_bag = self._unit:movement():was_carrying_bag()
	if dropped_bag and alive(dropped_bag.unit) then
		local distance = mvector3.distance_sq(self._unit:movement():m_pos(), dropped_bag.unit:position())
		local max_distance = math.pow(tweak_data.ai_carry.death_distance_teleport, 2)

		if distance <= max_distance then
			local desired_player = self:_get_closest_player(false)
			desired_player = desired_player or self:_get_closest_player(true)
			if desired_player then
				local pos = desired_player:movement():m_head_pos()
				local dir = desired_player:movement():m_head_rot():z()
				if managers.player:player_unit() == desired_player then
					dir = desired_player:camera():forward()
				end
				dropped_bag.unit:carry_data():set_position_and_throw(pos, dir * 5000, 1)
				return true
			else
				
			end
		end
	end
	return false
end

Hooks:PreHook(TeamAIDamage, "_die", "BotCarry_Dmg_die", function(self)
	self:_teleport_carried_bag()
end)