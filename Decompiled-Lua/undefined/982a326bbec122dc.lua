-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
AirdropManager = AirdropManager or class()
function AirdropManager:init()
	self._drop_point_groups = {}
	self._planes = {}
	self._drop_pods = {}
	self._in_cooldown = false
	self._items_in_pods = {}

	return 
end
function AirdropManager:register_drop_point_group(drop_point_group)
	slot5 = drop_point_group

	table.insert(slot3, self._drop_point_groups)

	return 
end
function AirdropManager:call_drop(unit)
	if Network then
		slot4 = Network
	else
		slot4 = managers.network
		slot6 = unit

		managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "call_airdrop")
	end

	return 
end
function AirdropManager:_call_drop(unit)
	if self._in_cooldown == true then
		slot13 = "airdrop_cooldown"
		slot5 = "AIRDROP IN COOLDOWN. Please wait " .. tostring(math.ceil(managers.queued_tasks.when(slot11, managers.queued_tasks))) .. " second(s)."

		Application.trace(slot3, Application)

		return 
	end

	local drop_position = nil
	slot5 = managers.player
	slot5 = managers.player.player_unit(slot4)
	slot5 = managers.player.player_unit(slot4).movement(slot4)
	local player_position = managers.player.player_unit(slot4).movement(slot4).m_pos(slot4)

	if 0 < #self._drop_point_groups then
		slot7 = self._drop_point_groups[1]._values.position
		local closest_drop_group_distance = mvector3.distance_sq(slot5, player_position)
		local closest_drop_group = 1

		for i = 1, #self._drop_point_groups, 1 do
			slot13 = self._drop_point_groups[i]._values.position
			local current_group_distance = mvector3.distance_sq(slot11, player_position)

			if current_group_distance < closest_drop_group_distance then
				closest_drop_group_distance = current_group_distance
				closest_drop_group = i
			end
		end

		slot8 = self._drop_point_groups[closest_drop_group]
		drop_position = self._drop_point_groups[closest_drop_group].get_random_drop_point(slot7)
	else
		slot6 = managers.player
		slot6 = managers.player.player_unit(slot5)
		slot6 = managers.player.player_unit(slot5).movement(slot5)
		slot7 = 1000
		drop_position = managers.player.player_unit(slot5).movement(slot5).m_pos(slot5).with_z(slot5, managers.player.player_unit(slot5).movement(slot5).m_pos(slot5))
	end

	local data = {
		position = drop_position,
		unit = unit
	}
	slot13 = nil

	managers.queued_tasks.queue(slot6, managers.queued_tasks, "airdrop", self.drop_item, self, data, tweak_data.interaction.drop_test.delay)

	self._in_cooldown = true
	slot13 = nil

	managers.queued_tasks.queue(slot6, managers.queued_tasks, "airdrop_cooldown", self.exit_cooldown, self, nil, tweak_data.interaction.drop_test.cooldown)

	return 
end
function AirdropManager:drop_item(data)
	slot5 = 359
	local angle = math.random(slot3, 0)
	slot6 = 150
	local dist = math.random(0, 0)
	local dx = dist * math.cos(0)
	local dy = dist * math.sin(angle)
	slot10 = data.position.z
	local position = Vector3(angle, data.position.x + dx, data.position.y + dy)
	slot11 = 0
	local rotation = Rotation(data.position.x + dx, 0, 0)
	slot13 = "units/vanilla/vehicles/vhc_junkers_resupply/vhc_junkers_resupply"
	slot13 = rotation
	local unit = World.spawn_unit(0, World, Idstring(slot12), position)
	slot11 = unit
	slot12 = "anim_drop_pod"

	unit.damage(World).run_sequence_simple(World, unit.damage(World))

	slot11 = unit
	slot12 = data.unit

	unit.base(World).set_drop_unit(World, unit.base(World))

	slot11 = managers.network
	slot14 = "anim_drop_pod"

	managers.network.session(World).send_to_peers_synched(World, managers.network.session(World), "airdrop_trigger_drop_sequence", unit)

	slot12 = unit

	table.insert(World, self._planes)

	return 
end
function AirdropManager:set_plane_sequence(plane_unit, sequence_name)
	slot5 = plane_unit
	slot6 = sequence_name

	plane_unit.damage(slot4).run_sequence_simple(slot4, plane_unit.damage(slot4))

	return 
end
function AirdropManager:spawn_pod(unit_to_spawn, plane_unit)
	if Network then
		slot5 = Network

		if Network.is_server(slot4) then
			slot7 = plane_unit

			self._spawn_pod(slot4, self, unit_to_spawn)
		end
	end

	return 
end
function AirdropManager:_spawn_pod(unit_to_spawn, plane_unit)
	local pod_locator = plane_unit.get_object(slot4, Idstring(slot7))
	slot8 = pod_locator.position("units/vanilla/props/props_drop_pod/props_drop_pod")
	slot11 = pod_locator
	local pod = World.spawn_unit(plane_unit, World, Idstring("spawn_pod"), pod_locator.rotation(pod_locator))
	slot7 = pod
	slot8 = unit_to_spawn

	pod.interaction(World).set_unit(World, pod.interaction(World))

	slot10 = pod
	self._items_in_pods[tostring(pod.id(pod_locator.rotation))] = unit_to_spawn
	slot8 = pod

	table.insert(tostring(pod.id(pod_locator.rotation)), self._drop_pods)

	return 
end
function AirdropManager:spawn_unit_inside_pod(unit, position, yaw, pitch, roll)
	if Network then
		slot8 = Network
	else
		slot8 = managers.network
		slot14 = roll

		managers.network.session(slot7).send_to_host(slot7, managers.network.session(slot7), "airdrop_spawn_unit_in_pod", unit, position, yaw, pitch)
	end

	return 
end
function AirdropManager:_spawn_unit_inside_pod(unit, position, rotation)
	if self._items_in_pods[unit] ~= nil then
		slot9 = self._items_in_pods[unit]
		slot9 = rotation

		World.spawn_unit(slot5, World, Idstring(slot8), position)
	end

	return 
end
function AirdropManager:exit_cooldown()
	self._in_cooldown = false

	return 
end
function AirdropManager:on_simulation_ended()
	slot5 = self

	managers.queued_tasks.unqueue_all(slot2, managers.queued_tasks, nil)

	self._drop_point_groups = {}
	self._items_in_pods = {}

	for i = #self._planes, 1, -1 do
		slot7 = self._planes[i]

		if self._planes[i].alive(slot6) then
			slot8 = 0

			self._planes[i].set_slot(slot6, self._planes[i])
		end
	end

	for i = #self._drop_pods, 1, -1 do
		slot8 = 0

		self._drop_pods[i].set_slot(slot6, self._drop_pods[i])
	end

	self._planes = {}
	self._drop_pods = {}
	self._in_cooldown = false

	return 
end

return 
