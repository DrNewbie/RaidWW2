if not CharacterManageSpawnedUnits then
	slot2 = ManageSpawnedUnits
	slot0 = class(slot1)
end

CharacterManageSpawnedUnits = slot0
local mvec1 = Vector3()
function CharacterManageSpawnedUnits:spawn_character_debris(unit_id, align_obj_name, unit, push_mass)
	slot7 = self._unit
	slot10 = align_obj_name
	local align_obj = self._unit.get_object(slot6, Idstring(slot9))
	local spawned_unit = nil
	local child_bodies = {}
	slot10 = self._unit

	if not self._unit.character_damage(slot9) then
		slot11 = "[CharacterManageSpawnedUnits:spawn_character_debris] Unit is missing CopDamage extension!"
		slot14 = unit

		Application.error(slot9, Application, inspect(slot13))

		return 
	end

	slot10 = unit

	if type_name(slot9) == "string" then
		local spawn_pos = align_obj.position(slot9)
		slot13 = unit
		slot12 = spawn_pos
		slot17 = 0
		spawned_unit = safe_spawn_unit(align_obj, Idstring(slot12), Rotation(slot14, 0, 0))
		slot11 = spawned_unit
		spawned_unit.unit_data(align_obj).parent_unit = self._unit
	else
		slot14 = unit
		slot11 = "[CharacterManageSpawnedUnits:spawn_character_debris] Unit name provided is of type: " .. type(slot13) .. ". String was expected"

		Application.error(slot9, Application)

		return 
	end

	if not spawned_unit then
		slot12 = unit

		Application.error(slot9, Application, "[CharacterManageSpawnedUnits:spawn_character_debris] Failed to spawn unit: ")

		return 
	end

	slot10 = spawned_unit
	local materials = spawned_unit.materials(slot9)
	local decal_data = tweak_data.character.dismemberment_data.blood_decal_data[unit_id]
	slot12 = materials

	for _, material in ipairs(slot11) do
		slot18 = Idstring(slot19)
		slot23 = 0

		material.set_variable(slot16, material, Vector3("gradient_uv_offset", decal_data[1], decal_data[2]))

		slot20 = "gradient_power"
		slot19 = decal_data[3]

		material.set_variable(slot16, material, Idstring(Vector3))
	end

	local unit_entry = {
		align_obj_name = align_obj_name,
		unit = spawned_unit
	}
	self._spawned_units[unit_id] = unit_entry
	slot14 = spawned_unit

	for i = 0, spawned_unit.num_bodies(slot13) - 1, 1 do
		slot18 = i
		child_bodies[i] = spawned_unit.body(slot16, spawned_unit)
		slot18 = false

		child_bodies[i].set_enabled(slot16, child_bodies[i])
	end

	slot14 = false

	spawned_unit.set_visible(slot12, spawned_unit)

	local joint_root_array = {
		"Neck",
		"LeftArm",
		"RightArm",
		"LeftUpLeg",
		"RightUpLeg"
	}
	slot14 = joint_root_array

	for _, joint in ipairs(spawned_unit) do
		slot19 = spawned_unit
		slot22 = joint
		local child_joint = spawned_unit.get_object(slot18, Idstring(slot21))

		if child_joint then
			local parent_joint = self._unit.get_object(slot19, Idstring(slot22))
			slot21 = child_joint
			slot24 = parent_joint

			child_joint.set_rotation(self._unit, parent_joint.rotation(joint))

			slot21 = spawned_unit

			spawned_unit.set_moving(self._unit)
		end
	end

	local joint_array = {
		"Head",
		"LeftForeArm",
		"RightForeArm",
		"LeftLeg",
		"RightLeg"
	}
	slot15 = joint_array

	for _, joint in ipairs(slot14) do
		slot20 = spawned_unit
		slot23 = joint
		local child_joint = spawned_unit.get_object(slot19, Idstring(slot22))

		if child_joint then
			local parent_joint = self._unit.get_object(slot20, Idstring(slot23))
			slot22 = child_joint
			slot25 = parent_joint

			child_joint.set_local_rotation(self._unit, parent_joint.local_rotation(joint))

			slot22 = spawned_unit

			spawned_unit.set_moving(self._unit)
		end
	end

	slot15 = self._unit
	slot15 = self._unit.character_damage(slot14)
	local direction = self._unit.character_damage(slot14).get_last_damage_direction(slot14)

	if not direction then
		slot17 = "Vector3 direction specified is nil"

		Application.error(slot15, Application)

		return 
	end

	local que_data = {
		unit = spawned_unit,
		push_direction = direction,
		push_mass = push_mass
	}
	slot23 = nil

	managers.queued_tasks.queue(slot16, managers.queued_tasks, "enable_bodies", self.enable_debris_bodies, self, que_data, 0.02)

	return 
end
function CharacterManageSpawnedUnits:enable_debris_bodies(data)
	local unit = data.unit
	local direction = data.push_direction
	local push_mass = data.push_mass
	slot7 = unit

	if not alive(slot6) then
		return 
	end

	slot8 = unit

	for i = 0, unit.num_bodies(slot7) - 1, 1 do
		slot12 = i
		slot12 = true

		unit.body(slot10, unit).set_enabled(slot10, unit.body(slot10, unit))
	end

	slot8 = direction

	mvector3.set(slot6, mvec1)

	slot8 = 1000

	mvector3.multiply(slot6, mvec1)

	slot9 = mvec1

	unit.push(slot6, unit, push_mass)

	slot8 = true

	unit.set_visible(slot6, unit)

	return 
end
function CharacterManageSpawnedUnits:destroy(unit)
	slot5 = unit

	CharacterManageSpawnedUnits.super.destroy(slot3, self)

	slot6 = self

	managers.queued_tasks.unqueue_all(slot3, managers.queued_tasks, nil)

	return 
end

return 
