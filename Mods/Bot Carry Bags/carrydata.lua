Hooks:PostHook(CarryData, "unlink", "BotCarry_CarryData_unlink", function(self)
	self._linked_to = nil
end)

Hooks:PostHook(CarryData, "update", "BotCarry_CarryData_update", function(self)
	if self._bot_can_carry and self._unit:interaction() and self._unit:interaction():active() then
		local _all_AI_criminals = managers.groupai:state():all_AI_criminals() or {}	
		for _, data in pairs(_all_AI_criminals) do
			if data.unit and alive(data.unit) then
				if data.unit:movement()._cool or not data.unit:movement().set_carrying_bag or data.unit:movement():downed() or data.unit:movement().vehicle_unit or mvector3.distance(self._unit:position(), data.unit:position()) > tweak_data.ai_carry.throw_force then
				
				else
					if not data.unit:movement():carrying_bag() then
						self:link_to(data.unit)
						self._linked_to = data.unit
						data.unit:movement():set_carrying_bag(self._unit)
						break
					end
				end
			end
		end
	end
end)