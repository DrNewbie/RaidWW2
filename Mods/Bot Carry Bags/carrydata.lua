Hooks:PostHook(CarryData, "init", "BotCarry_CarryData_init", function(self)
	if self._carry_id and tweak_data.carry and self._unit then
		local carry_tweak_data = tweak_data.carry[self._carry_id]
		if carry_tweak_data then
			if carry_tweak_data.is_corpse then
				self._bot_cannot_carry = true
				return
			end
		end
	end
	self._linked_to = nil
end)

Hooks:PostHook(CarryData, "unlink", "BotCarry_CarryData_unlink", function(self)
	self._linked_to = nil
end)

Hooks:PostHook(CarryData, "update", "BotCarry_CarryData_update", function(self)
	if not self._bot_cannot_carry and not self._linked_to and self._unit:interaction() and self._unit:interaction():active() then
		local _all_AI_criminals = managers.groupai:state():all_AI_criminals() or {}	
		for _, data in pairs(_all_AI_criminals) do
			if data.unit and alive(data.unit) then
				if data.unit:movement()._cool or not data.unit:movement().set_carrying_bag or data.unit:movement():downed() or data.unit:movement().vehicle_unit or mvector3.distance(self._unit:position(), data.unit:position()) > tweak_data.ai_carry.throw_force then
				
				else
					if not data.unit:movement():carrying_bag() then
						self._linked_to = data.unit
						data.unit:movement():set_carrying_bag(self._unit)
					end
				end
			end
		end
	end
end)