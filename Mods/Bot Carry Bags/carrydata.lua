Hooks:PostHook(CarryData, "update", "BotCarry_Carry_update_throw_link", function(self, unit, t, dt)
	if not self._linked_to then
		local _all_AI_criminals = managers.groupai:state():all_AI_criminals() or {}	
		for _, data in pairs(_all_AI_criminals) do
			if data.unit and alive(data.unit) then
				if data.unit:movement()._cool or data.unit:movement():downed() or data.unit:movement().vehicle_unit or mvector3.distance(self._unit:position(), data.unit:position()) > tweak_data.ai_carry.throw_force then
				
				else
					self:link_to(data.unit, false)
					if data.unit:movement().set_carrying_bag then
						data.unit:movement():set_carrying_bag(self._unit)
					end
				end
			end
		end
	end
end)