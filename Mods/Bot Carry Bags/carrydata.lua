local ids_g_bag = Idstring("g_bag")
local ids_g_canvasbag = Idstring("g_canvasbag")
local ids_g_g = Idstring("g_g")
local ids_g_goat = Idstring("g_goat")
local ids_g_bodybag = Idstring("g_bodybag")

Hooks:PostHook(CarryData, "update", "BotCarry_Carry_update_throw_link", function(self, unit, t, dt)
	if not self._linked_to then
		local bag_object = self._unit:get_object(ids_g_bag) or self._unit:get_object(ids_g_canvasbag) or self._unit:get_object(ids_g_g) or self._unit:get_object(ids_g_goat) or self._unit:get_object(ids_g_bodybag)
		if bag_object and bag_object:visibility() then
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
	end
end)