function TeamAIMovement:carrying_bag()
	return self._carry_unit and alive(self._carry_unit) and true or false
end

function TeamAIMovement:set_carrying_bag(unit)
	self._carry_unit = unit
end

function TeamAIMovement:carry_id()
	return self:carrying_bag() and self._carry_unit:carry_data():carry_id()
end

function TeamAIMovement:carry_data()
	return self:carrying_bag() and self._carry_unit:carry_data()
end

function TeamAIMovement:carry_tweak()
	return self:carry_id() and tweak_data.carry.types[tweak_data.carry[self:carry_id()].type]
end

function TeamAIMovement:throw_bag(target_unit, reason)
	if not target_unit or not alive(target_unit) then
		local _all_AI_criminals = managers.groupai:state():all_criminals() or {}	
		for _, data in pairs(_all_AI_criminals) do
			if data.unit and alive(data.unit) then
				target_unit = data.unit
				break
			end
		end
	end
	if not self:carrying_bag() then
		return
	end
	local carry_unit = self._carry_unit
	self._was_carrying = {
		unit = carry_unit,
		reason = reason
	}
	carry_unit:carry_data():unlink()
	if Network:is_server() then
		self:sync_throw_bag(carry_unit, target_unit)
		managers.network:session():send_to_peers("sync_ai_throw_bag", self._unit, carry_unit, target_unit)
	end
end

function TeamAIMovement:was_carrying_bag()
	return self._was_carrying
end

function TeamAIMovement:sync_throw_bag(carry_unit, target_unit)
	if alive(target_unit) then
		local dir = target_unit:position() - self._unit:position()
		mvector3.set_z(dir, math.abs(dir.x + dir.y) * 0.5)
		local throw_distance_multiplier = tweak_data.carry.types[tweak_data.carry[carry_unit:carry_data():carry_id()].type].throw_distance_multiplier
		carry_unit:push(tweak_data.ai_carry.throw_force, (dir - carry_unit:velocity()) * throw_distance_multiplier)
	end
end


Hooks:PostHook(TeamAIMovement, "save", "BotCarry_Mov_save", function(self, save_data)
	save_data.movement.has_bag = self:carrying_bag()
end)