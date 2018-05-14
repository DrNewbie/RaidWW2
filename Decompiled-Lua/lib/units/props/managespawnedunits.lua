-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
ManageSpawnedUnits = ManageSpawnedUnits or class()
function ManageSpawnedUnits:init(unit)
	self._unit = unit
	self._spawned_units = {}
	self._temp_link_units = {}

	return 
end
function ManageSpawnedUnits:spawn_unit(unit_id, align_obj_name, unit)
	slot6 = self._unit
	slot9 = align_obj_name
	local align_obj = self._unit.get_object(slot5, Idstring(slot8))
	local spawn_unit = nil
	slot8 = unit

	if type_name(Idstring) == "string" then
		slot8 = Network

		if Network.is_server(slot7) then
			local spawn_pos = align_obj.position(slot7)
			local spawn_rot = align_obj.rotation(align_obj)
			slot12 = unit
			slot12 = spawn_rot
			spawn_unit = safe_spawn_unit(align_obj, Idstring(slot11), spawn_pos)
			slot10 = spawn_unit
			spawn_unit.unit_data(align_obj).parent_unit = self._unit
		end
	else
		spawn_unit = unit
	end

	if not spawn_unit then
		return 
	end

	slot11 = align_obj_name
	slot13 = spawn_unit
	slot13 = spawn_unit.orientation_object(true)

	self._unit.link(slot7, self._unit, Idstring(slot10), spawn_unit, spawn_unit.orientation_object(true).name(true))

	local unit_entry = {
		align_obj_name = align_obj_name,
		unit = spawn_unit
	}
	self._spawned_units[unit_id] = unit_entry
	slot9 = Network

	if Network.is_server(self._unit) then
		slot9 = managers.network
		slot15 = "spawn_manager"

		managers.network.session(slot8).send_to_peers_synched(slot8, managers.network.session(slot8), "sync_unit_spawn", self._unit, spawn_unit, align_obj_name, unit_id)
	end

	return 
end
function ManageSpawnedUnits:sync_link_unit(align_obj_name, spawn_unit)
	if align_obj_name and spawn_unit then
		slot8 = align_obj_name
		slot10 = spawn_unit
		slot10 = spawn_unit.orientation_object(true)

		self._unit.link(slot4, self._unit, Idstring(slot7), spawn_unit, spawn_unit.orientation_object(true).name(true))
	end

	return 
end
function ManageSpawnedUnits:spawn_and_link_unit(joint_table, unit_id, unit)
	if not self[joint_table] then
		slot9 = "in unit file:"
		slot12 = self._unit

		Application.error(slot5, Application, "No table named:", joint_table, self._unit.name(slot11))

		return 
	end

	if not unit_id then
		slot8 = "nil:\n"
		slot11 = self._unit

		Application.error(slot5, Application, "param2", self._unit.name(slot10))

		return 
	end

	if not unit then
		slot8 = "nil:\n"
		slot11 = self._unit

		Application.error(slot5, Application, "param3", self._unit.name(slot10))

		return 
	end

	slot9 = unit

	self.spawn_unit(slot5, self, unit_id, self[joint_table][1])

	self._sync_spawn_and_link = self._sync_spawn_and_link or {}
	self._sync_spawn_and_link[unit_id] = {
		joint_table = joint_table
	}
	slot6 = Network

	if Network.is_server() then
		slot8 = joint_table

		self._link_joints(slot5, self, unit_id)
	elseif self._temp_link_units[unit_id] then
		self._temp_link_units[unit_id] = nil
		slot8 = joint_table

		self._link_joints(nil, self, unit_id)
	end

	return 
end
function ManageSpawnedUnits:spawn_run_sequence(unit_id, sequence_name)
	local entry = self._spawned_units[unit_id]

	if not entry then
		return 
	end

	slot6 = entry.unit

	if not alive(slot5) then
		return 
	end

	slot6 = Network

	if Network.is_server(slot5) then
		slot6 = managers.network
		slot11 = sequence_name

		managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "run_spawn_unit_sequence", self._unit, "spawn_manager", unit_id)
	end

	slot8 = sequence_name

	self._spawn_run_sequence(slot5, self, unit_id)

	return 
end
function ManageSpawnedUnits:local_push_child_unit(unit_id, mass, pow, vec3_a, vec3_b)
	if not unit_id then
		slot10 = "nil:\n"
		slot13 = self._spawned_units[unit_id].unit

		Application.error(slot7, Application, "param1", self._spawned_units[unit_id].unit.name(slot12))

		return 
	end

	if not mass then
		slot10 = "nil:\n"
		slot13 = self._spawned_units[unit_id].unit

		Application.error(slot7, Application, "param2", self._spawned_units[unit_id].unit.name(slot12))

		return 
	end

	if not pow then
		slot10 = "nil:\n"
		slot13 = self._spawned_units[unit_id].unit

		Application.error(slot7, Application, "param3", self._spawned_units[unit_id].unit.name(slot12))

		return 
	end

	if not vec3_a then
		slot10 = "nil:\n"
		slot13 = self._spawned_units[unit_id].unit

		Application.error(slot7, Application, "param4", self._spawned_units[unit_id].unit.name(slot12))

		return 
	end

	if not vec3_b then
		slot10 = "nil:\n"
		slot13 = self._spawned_units[unit_id].unit

		Application.error(slot7, Application, "param5", self._spawned_units[unit_id].unit.name(slot12))

		return 
	end

	if not self._spawned_units then
		return 
	end

	if not self._spawned_units[unit_id] then
		return 
	end

	slot8 = self._spawned_units[unit_id].unit

	if not alive(slot7) then
		return 
	end

	local dir = Vector3()
	slot9 = self._unit
	local spawnObj = self._unit.get_object(slot8, Idstring(slot11)).position(slot8)
	slot10 = self._unit
	slot13 = vec3_b
	local forwObj = self._unit.get_object(self._unit.get_object(slot8, Idstring(slot11)), Idstring(vec3_a)).position(self._unit.get_object(slot8, Idstring(slot11)))
	slot13 = forwObj

	mvector3.direction(self._unit.get_object(self._unit.get_object(slot8, Idstring(slot11)), Idstring(vec3_a)), dir, spawnObj)

	slot12 = pow

	mvector3.multiply(self._unit.get_object(self._unit.get_object(slot8, Idstring(slot11)), Idstring(vec3_a)), dir)

	if self._push_spread then
		slot12 = self._push_spread

		mvector3.spread(slot10, dir)
	end

	slot13 = dir

	self._spawned_units[unit_id].unit.push(slot10, self._spawned_units[unit_id].unit, mass)

	slot11 = Network

	if Network.is_server(slot10) then
		slot11 = managers.network
		slot19 = vec3_b

		managers.network.session(slot10).send_to_peers_synched(slot10, managers.network.session(slot10), "run_local_push_child_unit", self._unit, "spawn_manager", unit_id, mass, pow, vec3_a)
	end

	return 
end
function ManageSpawnedUnits:remove_unit(unit_id)
	local entry = self._spawned_units[unit_id]
	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = entry.unit

		if alive(slot4) then
			slot6 = 0

			entry.unit.set_slot(slot4, entry.unit)
		end
	end

	self._spawned_units[unit_id] = nil

	return 
end
function ManageSpawnedUnits:destroy(unit)
	slot4 = self._spawned_units

	for i, entry in pairs(slot3) do
		slot9 = entry.unit

		if alive(slot8) then
			slot10 = 0

			entry.unit.set_slot(slot8, entry.unit)
		end
	end

	self._spawned_units = {}

	return 
end
function ManageSpawnedUnits:save(data)

	-- Decompilation error in this vicinity:
	slot4 = self._unit
	data.managed_spawned_units = {
		linked_joints = self._sync_spawn_and_link
	}
	slot4 = self._spawned_units

	for sync_id, unit_entry in pairs(self._sync_spawn_and_link) do
		slot9 = unit_entry.unit

		if alive(slot8) and sync_id ~= -1 then
			slot9 = managers.network
			slot15 = "spawn_manager"

			managers.network.session(slot8).send_to_peers_synched(slot8, managers.network.session(slot8), "sync_unit_spawn", self._unit, unit_entry.unit, unit_entry.align_obj_name, sync_id)
		end
	end

	return 
end
function ManageSpawnedUnits:load(data)
	if not data.managed_spawned_units then
		return 
	end

	self._sync_spawn_and_link = data.managed_spawned_units.linked_joints or {}

	return 
end
function ManageSpawnedUnits:_spawn_run_sequence(unit_id, sequence_name)
	local entry = self._spawned_units[unit_id]

	if not entry then
		return 
	end

	slot6 = entry.unit

	if not alive(slot5) then
		return 
	end

	if not sequence_name then
		slot10 = self._unit

		Application.error(slot5, Application, "No sequence_name param passed\n", self._unit.name("\n"))

		return 
	end

	slot6 = self._spawned_units[unit_id].unit
	slot7 = sequence_name

	if self._spawned_units[unit_id].unit.damage(slot5).has_sequence(slot5, self._spawned_units[unit_id].unit.damage(slot5)) then
		slot6 = self._spawned_units[unit_id].unit
		slot7 = sequence_name

		self._spawned_units[unit_id].unit.damage(slot5).run_sequence_simple(slot5, self._spawned_units[unit_id].unit.damage(slot5))
	else
		slot8 = "sequence does not exist in:\n"
		slot11 = self._spawned_units[unit_id].unit

		Application.error(slot5, Application, sequence_name, self._spawned_units[unit_id].unit.name(slot10))
	end

	return 
end
function ManageSpawnedUnits:_link_joints(unit_id, joint_table)
	slot5 = self[joint_table]

	for index, value in ipairs(slot4) do
		if 1 < index then
			local parent_object = self._unit.get_object(slot9, Idstring(slot12))
			local child_object = self._spawned_units[unit_id].unit.get_object(self._unit, Idstring(value))
			slot13 = parent_object

			child_object.link(self._spawned_units[unit_id].unit, child_object)

			slot12 = child_object
			slot15 = parent_object

			child_object.set_position(self._spawned_units[unit_id].unit, parent_object.position(value))

			slot12 = child_object
			slot15 = parent_object

			child_object.set_rotation(self._spawned_units[unit_id].unit, parent_object.rotation(value))
		end
	end

	slot5 = self._unit

	self._unit.set_moving(slot4)

	return 
end
function ManageSpawnedUnits:sync_unit_spawn(unit_id)
	if self._sync_spawn_and_link and self._sync_spawn_and_link[unit_id] then
		slot6 = self._sync_spawn_and_link[unit_id].joint_table

		self._link_joints(slot3, self, unit_id)

		self._sync_spawn_and_link[unit_id] = nil
	else
		self._temp_link_units = self._temp_link_units or {}
		self._temp_link_units[unit_id] = true
	end

	return 
end

return 
