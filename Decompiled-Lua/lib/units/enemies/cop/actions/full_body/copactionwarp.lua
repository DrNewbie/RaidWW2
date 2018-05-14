CopActionWarp = CopActionWarp or class()
function CopActionWarp:init(action_desc, common_data)
	self._unit = common_data.unit
	slot5 = self._unit

	if self._unit.brain(slot4).set_objective then
		slot5 = self._unit
		slot6 = nil

		self._unit.brain(slot4).set_objective(slot4, self._unit.brain(slot4))
	end

	common_data.ext_movement._queued_actions = {}
	self._dynamic_bodies = {}
	slot5 = self._unit
	local nr_bodies = self._unit.num_bodies()

	for i = 0, nr_bodies - 1, 1 do
		slot11 = i
		local body = self._unit.body(slot9, self._unit)
		slot11 = body

		if body.dynamic(self._unit) then
			slot11 = body

			body.set_keyframed(slot10)

			slot12 = body

			table.insert(slot10, self._dynamic_bodies)
		end
	end

	self._i_update = 0

	if action_desc.position then
		slot7 = action_desc.position

		common_data.ext_movement.set_position(slot5, common_data.ext_movement)
	end

	if action_desc.rotation then
		slot7 = action_desc.rotation

		common_data.ext_movement.set_rotation(slot5, common_data.ext_movement)
	end

	slot6 = Network

	if Network.is_server(slot5) then
		local sync_pos, has_sync_pos = nil

		if action_desc.position then
			has_sync_pos = true
			slot8 = action_desc.position
			sync_pos = mvector3.copy(slot7)
		else
			has_sync_pos = false
			sync_pos = Vector3()
		end

		local sync_yaw, has_rotation = nil

		if action_desc.rotation then
			has_rotation = true
			slot10 = action_desc.rotation
			local yaw = mrotation.yaw(slot9)

			if yaw < 0 then
				yaw = 360 + yaw
			end

			slot11 = (yaw * 254) / 360
			sync_yaw = 1 + math.ceil(slot10)
		else
			has_rotation = false
		end

		slot15 = sync_yaw

		common_data.ext_network.send(slot9, common_data.ext_network, "action_warp_start", has_sync_pos, sync_pos, has_rotation)
	end

	slot6 = common_data.ext_movement

	common_data.ext_movement.enable_update(slot5)

	return true
end
function CopActionWarp:update(t)
	if self._i_update < 1 then
		self._i_update = self._i_update + 1

		return 
	end

	self._expired = true
	slot4 = self._dynamic_bodies

	for i, body in ipairs(slot3) do
		slot9 = body

		body.set_dynamic(slot8)
	end

	return 
end
function CopActionWarp:type()
	return "warp"
end
function CopActionWarp:expired()
	return self._expired
end
function CopActionWarp:need_upd()
	return true
end
function CopActionWarp:chk_block(action_type, t)
	if action_type == "death" then
		return false
	end

	return true
end

return 
