function UnitNetworkHandler:sync_ai_throw_bag(unit, carry_unit, target_unit, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender) then
		return
	end
	if alive(unit) and alive(carry_unit) then
		unit:movement():sync_throw_bag(carry_unit, target_unit)
	end
end

function UnitNetworkHandler:request_carried_bag_unit(ai_unit, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	local peer = self._verify_sender(sender)

	if not peer then
		return
	end

	if alive(ai_unit) then
		local carry_unit = ai_unit:movement()._carry_unit
		if carry_unit then
			managers.network:session():send_to_peer(peer, "sync_carried_bag_unit", ai_unit, carry_unit)
		end
	end
end

function UnitNetworkHandler:sync_carried_bag_unit(ai_unit, carry_unit, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender) then
		return
	end
	if alive(ai_unit) and alive(carry_unit) then
		ai_unit:movement():set_carrying_bag(carry_unit)
		carry_unit:carry_data():link_to(ai_unit)
	end
end