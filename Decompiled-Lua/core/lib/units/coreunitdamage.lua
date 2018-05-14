-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreSequenceManager"

slot0(slot1, slot2)

slot0 = CoreUnitDamage

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreUnitDamage = slot0
slot0 = CoreUnitDamage
slot1 = "*"
slot0.ALL_TRIGGERS = slot1
slot0 = UnitDamage

if not slot0 then
	slot0 = class
	slot2 = CoreUnitDamage
	slot0 = slot0(slot1)
end

UnitDamage = slot0
slot0 = Idstring
slot2 = "damage"
local ids_damage = slot0(slot1)
slot1 = CoreUnitDamage

function slot2(self, unit, default_body_extension_class, body_extension_class_map, ignore_body_collisions, ignore_mover_collisions, mover_collision_ignore_duration)
	self._unit = unit
	slot7 = managers
	slot7 = slot7.sequence
	slot9 = slot7
	slot7 = slot7.get
	slot12 = unit
	slot10 = unit.name
	slot10 = slot10(slot11)
	slot11 = false
	slot12 = true
	slot7 = slot7(slot8, slot9, slot10, slot11)
	self._unit_element = slot7
	slot7 = 0
	self._damage = slot7
	slot7 = self._unit_element
	slot7 = slot7._set_variables

	if slot7 then
		slot7 = next
		slot9 = self._unit_element
		slot9 = slot9._set_variables
		slot7 = slot7(slot8)

		if slot7 then
			slot7 = clone
			slot9 = self._unit_element
			slot9 = slot9._set_variables
			slot7 = slot7(slot8)
			self._variables = slot7
		end
	end

	slot11 = self._update_func_map ~= nil

	self._unit.set_extension_update_enabled(slot8, self._unit, ids_damage)

	slot11 = self._unit_element
	slot7, slot8, slot9 = pairs(self._unit_element.get_proximity_element_map(ids_damage))

	for name, element in slot7, slot8, slot9 do
		local data = {
			name = name
		}
		slot15 = element
		slot13 = element.get_enabled
		slot13 = slot13(slot14)
		data.enabled = slot13
		slot15 = element
		slot13 = element.get_ref_object
		slot13 = slot13(slot14)

		if slot13 then
			slot13 = self._unit
			slot15 = slot13
			slot13 = slot13.get_object
			slot16 = Idstring
			slot20 = element
			slot18 = element.get_ref_object
			slot13 = slot13(slot14, slot16(slot18(slot19)))
		end

		data.ref_object = slot13
		slot15 = element
		data.interval = element.get_interval(slot14)
		slot15 = element
		data.quick = element.is_quick(slot14)
		slot15 = element
		data.is_within = element.get_start_within(slot14)
		slot15 = element
		data.slotmask = element.get_slotmask(slot14)
		slot15 = TimerManager
		slot15 = TimerManager.game(slot14)
		slot14 = math.rand(math.min(slot17, data.interval))
		data.last_check_time = TimerManager.game(slot14).time(slot14) + slot14
		slot17 = "within_data"
		slot20 = element

		self.populate_proximity_range_data(slot14, self, data, element.get_within_element(0))

		slot17 = "outside_data"
		slot20 = element

		self.populate_proximity_range_data(slot14, self, data, element.get_outside_element(0))

		self._proximity_map = self._proximity_map or {}
		self._proximity_map[name] = data
		slot13 = self._proximity_count or 0
		slot13 = slot13 + 1
		self._proximity_count = slot13
		slot13 = data.enabled

		if slot13 then
			slot13 = self._proximity_enabled_count

			if not slot13 then
				slot13 = 0
				self._proximity_enabled_count = slot13
				slot15 = self
				slot13 = self.set_update_callback
				slot16 = "update_proximity_list"
				slot17 = true

				slot13(slot14, slot15, slot16)
			end

			slot13 = self._proximity_enabled_count
			slot13 = slot13 + 1
			self._proximity_enabled_count = slot13
		end
	end

	self._mover_collision_ignore_duration = mover_collision_ignore_duration
	body_extension_class_map = body_extension_class_map or {}
	default_body_extension_class = default_body_extension_class or CoreBodyDamage
	slot7 = get_core_or_local
	slot9 = "InflictUpdator"
	slot7 = slot7(slot8)
	local inflict_updator_damage_type_map = slot7.INFLICT_UPDATOR_DAMAGE_TYPE_MAP
	slot8 = self._unit
	slot10 = slot8
	slot8 = slot8.key
	local unit_key = slot8(slot9)
	slot9 = pairs
	slot11 = self._unit_element
	slot11 = slot11._bodies
	slot9, slot10, slot11 = slot9(slot10)

	for _, body_element in slot9, slot10, slot11 do
		slot14 = self._unit
		slot16 = slot14
		slot14 = slot14.body
		slot17 = body_element._name
		local body = slot14(slot15, slot16)

		if body then
			slot20 = body
			slot18 = body.extension(slot19) or {}

			body.set_extension(slot16, body)

			slot17 = body_extension_class_map[body_element._name] or default_body_extension_class
			slot15 = slot15.new
			slot18 = self._unit
			slot19 = self
			slot20 = body
			slot21 = body_element
			local body_ext = slot15(slot16, slot17, slot18, slot19, slot20)
			slot18 = body
			slot16 = body.extension
			slot16 = slot16(slot17)
			slot16.damage = body_ext
			local body_key = nil
			slot17 = pairs
			slot21 = body_ext
			slot19 = body_ext.get_endurance_map
			slot17, slot18, slot19 = slot17(slot19(slot20))

			for damage_type, _ in slot17, slot18, slot19 do
				slot22 = inflict_updator_damage_type_map[damage_type]

				if slot22 then
					if not body_key then
						slot24 = body
						slot22 = body.key
						slot22 = slot22(slot23)
						body_key = slot22
					end

					self._added_inflict_updator_damage_type_map = self._added_inflict_updator_damage_type_map or {}
					slot22 = self._added_inflict_updator_damage_type_map
					slot23 = {}
					slot22[damage_type] = slot23
					slot22 = self._added_inflict_updator_damage_type_map
					slot22 = slot22[damage_type]
					slot22[body_key] = body_ext
					slot22 = managers
					slot22 = slot22.sequence
					slot24 = slot22
					slot22 = slot22.add_inflict_updator_body
					slot25 = damage_type
					slot26 = unit_key
					slot27 = body_key
					slot28 = body_ext

					slot22(slot23, slot24, slot25, slot26, slot27)
				end
			end
		else
			slot15 = Application
			slot17 = slot15
			slot15 = slot15.throw_exception
			slot18 = "Unit \""
			slot19 = self._unit
			slot21 = slot19
			slot19 = slot19.name
			slot19 = slot19(slot20)
			slot21 = slot19
			slot19 = slot19.t
			slot19 = slot19(slot20)
			slot20 = "\" doesn't have the body \""
			slot21 = body_element._name
			slot22 = "\" that was loaded into the SequenceManager."
			slot18 = slot18 .. slot19 .. slot20 .. slot21 .. slot22

			slot15(slot16, slot17)
		end
	end

	if not ignore_body_collisions then
		slot9 = self._unit
		slot11 = slot9
		slot9 = slot9.set_body_collision_callback
		slot12 = callback
		slot14 = self
		slot15 = self
		slot16 = "body_collision_callback"

		slot9(slot10, slot12(slot13, slot14, slot15))
	end

	slot9 = self._unit
	slot11 = slot9
	slot9 = slot9.mover
	slot9 = slot9(slot10)

	if slot9 and not ignore_mover_collisions then
		slot9 = self._unit
		slot11 = slot9
		slot9 = slot9.set_mover_collision_callback
		slot12 = callback
		slot14 = self
		slot15 = self
		slot16 = "mover_collision_callback"

		slot9(slot10, slot12(slot13, slot14, slot15))
	end

	slot9 = self._unit_element
	slot11 = slot9
	slot9 = slot9.get_water_element_map
	slot9 = slot9(slot10)
	self._water_check_element_map = slot9
	slot9 = self._water_check_element_map

	if slot9 then
		slot9 = pairs
		slot11 = self._water_check_element_map
		slot9, slot10, slot11 = slot9(slot10)

		for name, water_element in slot9, slot10, slot11 do
			slot16 = self
			slot14 = self.set_water_check
			slot17 = name
			slot20 = water_element
			slot18 = water_element.get_enabled
			slot18 = slot18(slot19)
			slot21 = water_element
			slot19 = water_element.get_interval
			slot19 = slot19(slot20)
			slot22 = water_element
			slot20 = water_element.get_ref_object
			slot20 = slot20(slot21)
			slot23 = water_element
			slot21 = water_element.get_ref_body
			slot21 = slot21(slot22)
			slot24 = water_element
			slot22 = water_element.get_body_depth
			slot22 = slot22(slot23)
			slot25 = water_element
			slot23 = water_element.get_physic_effect

			slot14(slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot23(slot24))
		end
	end

	slot9 = self._unit_element
	slot11 = slot9
	slot9 = slot9.get_startup_sequence_map
	slot12 = self._unit
	slot13 = self
	slot9 = slot9(slot10, slot11, slot12)
	self._startup_sequence_map = slot9
	slot9 = self._startup_sequence_map

	if slot9 then
		slot9 = managers
		slot9 = slot9.sequence
		slot11 = slot9
		slot9 = slot9.add_startup_callback
		slot12 = callback
		slot14 = self
		slot15 = self
		slot16 = "run_startup_sequences"
		slot9 = slot9(slot10, slot12(slot13, slot14, slot15))
		self._startup_sequence_callback_id = slot9
	end

	slot9 = Application
	slot11 = slot9
	slot9 = slot9.editor
	slot9 = slot9(slot10)

	if slot9 then
		slot9 = self._unit_element
		slot11 = slot9
		slot9 = slot9.get_editor_startup_sequence_map
		slot12 = self._unit
		slot13 = self
		slot9 = slot9(slot10, slot11, slot12)
		self._editor_startup_sequence_map = slot9
		slot9 = self._editor_startup_sequence_map

		if slot9 then
			slot9 = managers
			slot9 = slot9.sequence
			slot11 = slot9
			slot9 = slot9.add_startup_callback
			slot12 = callback
			slot14 = self
			slot15 = self
			slot16 = "run_editor_startup_sequences"
			slot9 = slot9(slot10, slot12(slot13, slot14, slot15))
			self._editor_startup_sequence_callback_id = slot9
		end
	end

	return 
end

slot1.init = slot2
slot1 = CoreUnitDamage

function slot2(self, object)
	self._sound_sources = self._sound_sources or {}
	slot2 = self._sound_sources
	local sound_source = slot2[object]

	if not sound_source then
		slot3 = SoundDevice
		slot5 = slot3
		slot3 = slot3.create_source
		slot6 = object
		slot3 = slot3(slot4, slot5)
		sound_source = slot3
		slot3 = self._unit
		slot5 = slot3
		slot3 = slot3.get_object
		slot6 = Idstring
		slot8 = object
		local obj = slot3(slot4, slot6(slot7))

		if obj then
			slot6 = sound_source
			slot4 = sound_source.link
			slot7 = obj

			slot4(slot5, slot6)
		else
			return 
		end

		slot4 = self._sound_sources
		slot4[object] = sound_source
	end

	return sound_source
end

slot1.get_sound_source = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._added_inflict_updator_damage_type_map

	if slot1 then
		slot1 = self._unit
		slot3 = slot1
		slot1 = slot1.key
		local unit_key = slot1(slot2)
		slot2 = pairs
		slot4 = self._added_inflict_updator_damage_type_map
		slot2, slot3, slot4 = slot2(slot3)

		for damage_type, body_map in slot2, slot3, slot4 do
			slot7 = pairs
			slot9 = body_map
			slot7, slot8, slot9 = slot7(slot8)

			for body_key in slot7, slot8, slot9 do
				slot11 = managers
				slot11 = slot11.sequence
				slot13 = slot11
				slot11 = slot11.remove_inflict_updator_body
				slot14 = damage_type
				slot15 = unit_key
				slot16 = body_key

				slot11(slot12, slot13, slot14, slot15)
			end
		end
	end

	slot1 = self._water_check_map

	if slot1 then
		slot1 = pairs
		slot3 = self._water_check_map
		slot1, slot2, slot3 = slot1(slot2)

		for name in slot1, slot2, slot3 do
			slot7 = self
			slot5 = self.set_water_check_active
			slot8 = name
			slot9 = false

			slot5(slot6, slot7, slot8)
		end
	end

	slot1 = self._inherit_destroy_unit_list

	if slot1 then
		slot1 = ipairs
		slot3 = self._inherit_destroy_unit_list
		slot1, slot2, slot3 = slot1(slot2)

		for _, unit in slot1, slot2, slot3 do
			slot6 = alive
			slot8 = unit
			slot6 = slot6(slot7)

			if slot6 then
				slot8 = unit
				slot6 = unit.set_slot
				slot9 = 0

				slot6(slot7, slot8)
			end
		end
	end

	return 
end

slot1.destroy = slot2
slot1 = CoreUnitDamage

function slot2(self, unit, t, dt)
	slot4 = self._update_func_map

	if slot4 then
		slot4 = pairs
		slot6 = self._update_func_map
		slot4, slot5, slot6 = slot4(slot5)

		for func_name, data in slot4, slot5, slot6 do
			slot9 = self[func_name]
			slot11 = self
			slot12 = unit
			slot13 = t
			slot14 = dt
			slot15 = data

			slot9(slot10, slot11, slot12, slot13, slot14)
		end
	else
		slot4 = Application
		slot6 = slot4
		slot4 = slot4.error
		slot7 = "Some scripter tried to enable the damage extension on unit \""
		slot8 = tostring
		slot12 = unit
		slot10 = unit.name
		slot8 = slot8(slot10(slot11))
		slot9 = "\" or an artist have specified more than one damage-extension in the unit xml. This would have resulted in a crash, so fix it!"
		slot7 = slot7 .. slot8 .. slot9

		slot4(slot5, slot6)

		slot4 = self._unit
		slot6 = slot4
		slot4 = slot4.set_extension_update_enabled
		slot7 = ids_damage
		slot8 = false

		slot4(slot5, slot6, slot7)
	end

	return 
end

slot1.update = slot2
slot1 = CoreUnitDamage

function slot2(self, func_name, data)
	if data then
		self._update_func_map = self._update_func_map or {}
		slot3 = self._update_func_map
		slot3 = slot3[func_name]

		if not slot3 then
			slot3 = self._update_func_count

			if not slot3 then
				slot3 = 0
				self._update_func_count = slot3
				slot3 = self._unit
				slot5 = slot3
				slot3 = slot3.set_extension_update_enabled
				slot6 = ids_damage
				slot7 = true

				slot3(slot4, slot5, slot6)
			end

			slot3 = self._update_func_count
			slot3 = slot3 + 1
			self._update_func_count = slot3
		end

		slot3 = self._update_func_map
		slot3[func_name] = data
	else
		slot3 = self._update_func_map

		if slot3 then
			slot3 = self._update_func_map
			slot3 = slot3[func_name]

			if slot3 then
				slot3 = self._update_func_count
				slot3 = slot3 - 1
				self._update_func_count = slot3
				slot3 = self._update_func_map
				slot4 = nil
				slot3[func_name] = slot4
				slot3 = self._update_func_count

				if slot3 == 0 then
					slot3 = self._unit
					slot5 = slot3
					slot3 = slot3.set_extension_update_enabled
					slot6 = ids_damage
					slot7 = false

					slot3(slot4, slot5, slot6)

					slot3 = nil
					self._update_func_map = slot3
					slot3 = nil
					self._update_func_count = slot3
				end
			end
		end
	end

	return 
end

slot1.set_update_callback = slot2
slot1 = CoreUnitDamage

function slot2(self, data, sub_data_name, element)
	if element then
		data[sub_data_name] = {
			element = element,
			activation_count = 0
		}
		slot7 = element
		data[sub_data_name].max_activation_count = element.get_max_activation_count(slot6)
		slot7 = element
		data[sub_data_name].delay = element.get_delay(slot6)
		slot7 = TimerManager
		slot7 = TimerManager.game(slot6)
		slot11 = 0
		slot6 = math.rand(math.min(slot9, data[sub_data_name].delay))
		data[sub_data_name].last_check_time = TimerManager.game(slot6).time(slot6) + slot6
		slot7 = element
		data[sub_data_name].range = element.get_range(slot6)
		slot7 = element
		data[sub_data_name].count = element.get_count(slot6)
		data[sub_data_name].is_within = sub_data_name == "within_data"
	end

	return 
end

slot1.populate_proximity_range_data = slot2
slot1 = CoreUnitDamage

function slot2(self, name, enabled)
	slot3 = self._proximity_map

	if slot3 then
		slot3 = self._proximity_map
		local data = slot3[name]
	end

	if data then
		slot4 = data.enabled
		slot4 = not slot4
		slot5 = not enabled

		if slot4 ~= slot5 then
			data.enabled = enabled

			if enabled then
				slot4 = self._proximity_enabled_count

				if not slot4 then
					slot6 = self
					slot4 = self.set_update_callback
					slot7 = "update_proximity_list"
					slot8 = true

					slot4(slot5, slot6, slot7)

					slot4 = 0
					self._proximity_enabled_count = slot4
				end

				slot4 = self._proximity_enabled_count
				slot4 = slot4 + 1
				self._proximity_enabled_count = slot4
			else
				slot4 = self._proximity_enabled_count
				slot4 = slot4 - 1
				self._proximity_enabled_count = slot4
				slot4 = self._proximity_enabled_count
				slot5 = 0

				if slot4 <= slot5 then
					slot4 = nil
					self._proximity_enabled_count = slot4
					slot6 = self
					slot4 = self.set_update_callback
					slot7 = "update_proximity_list"
					slot8 = nil

					slot4(slot5, slot6, slot7)
				end
			end
		end
	end

	return 
end

slot1.set_proximity_enabled = slot2
slot1 = CoreUnitDamage

function slot2(self, unit, t, dt)
	slot4 = managers
	slot4 = slot4.sequence
	slot6 = slot4
	slot4 = slot4.is_proximity_enabled
	slot4 = slot4(slot5)

	if slot4 then
		slot4 = pairs
		slot6 = self._proximity_map
		slot4, slot5, slot6 = slot4(slot5)

		for name, data in slot4, slot5, slot6 do
			slot9 = data.enabled

			if slot9 then
				slot9 = data.last_check_time
				slot10 = data.interval
				slot9 = slot9 + slot10

				if slot9 <= t then
					local range_data, reversed, range_data_string = nil
					slot12 = data.is_within

					if slot12 then
						range_data = data.outside_data
						range_data_string = "outside_data"

						if not range_data then
							range_data = data.within_data
							range_data_string = "within_data"
							reversed = true
						else
							reversed = false
						end
					else
						range_data = data.within_data
						range_data_string = "within_data"

						if not range_data then
							range_data = data.outside_data
							range_data_string = "outside_data"
							reversed = true
						else
							reversed = false
						end
					end

					data.last_check_time = t
					slot14 = self
					slot12 = self.check_proximity_activation_count
					slot15 = data
					slot12 = slot12(slot13, slot14)

					if slot12 then
						slot12 = range_data.last_check_time
						slot13 = range_data.delay
						slot12 = slot12 + slot13

						if slot12 <= t then
							slot14 = self
							slot12 = self.update_proximity
							slot15 = unit
							slot16 = t
							slot17 = dt
							slot18 = data
							slot19 = range_data
							slot12 = slot12(slot13, slot14, slot15, slot16, slot17, slot18)

							if slot12 ~= reversed then
								range_data.last_check_time = t
								slot12 = data.is_within
								slot12 = not slot12
								data.is_within = slot12

								if not reversed then
									slot14 = self
									slot12 = self.is_proximity_range_active
									slot15 = range_data
									slot12 = slot12(slot13, slot14)

									if slot12 then
										slot12 = range_data.activation_count
										slot12 = slot12 + 1
										range_data.activation_count = slot12
										slot14 = self
										slot12 = self._do_proximity_activation
										slot15 = range_data

										slot12(slot13, slot14)

										slot14 = self
										slot12 = self._check_send_sync_proximity_activation
										slot15 = name
										slot16 = range_data_string

										slot12(slot13, slot14, slot15)

										slot14 = self
										slot12 = self.check_proximity_activation_count
										slot15 = data

										slot12(slot13, slot14)
									end
								end
							end
						end
					end
				end
			end
		end
	end

	return 
end

slot1.update_proximity_list = slot2
slot1 = CoreUnitDamage

function slot2(self, range_data)
	slot2 = self._proximity_env

	if not slot2 then
		slot2 = CoreSequenceManager
		slot2 = slot2.SequenceEnvironment
		slot4 = slot2
		slot2 = slot2.new
		slot5 = "proximity"
		slot6 = self._unit
		slot7 = self._unit
		slot8 = nil
		slot9 = Vector3
		slot11 = 0
		slot12 = 0
		slot13 = 0
		slot9 = slot9(slot10, slot11, slot12)
		slot10 = Vector3
		slot12 = 0
		slot13 = 0
		slot14 = 0
		slot10 = slot10(slot11, slot12, slot13)
		slot11 = Vector3
		slot13 = 0
		slot14 = 0
		slot15 = 0
		slot11 = slot11(slot12, slot13, slot14)
		slot12 = 0
		slot13 = Vector3
		slot15 = 0
		slot16 = 0
		slot17 = 0
		slot13 = slot13(slot14, slot15, slot16)
		slot14 = nil
		slot15 = self._unit_element
		slot2 = slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14)
	end

	self._proximity_env = slot2
	slot2 = range_data.element
	slot4 = slot2
	slot2 = slot2.activate_elements
	slot5 = self._proximity_env

	slot2(slot3, slot4)

	return 
end

slot1._do_proximity_activation = slot2
slot1 = CoreUnitDamage

function slot2(self, name, range_data_string)

	-- Decompilation error in this vicinity:
	slot3 = Network
	slot5 = slot3
	slot3 = slot3.is_server
	slot3 = slot3(slot4)
	slot3 = managers
	slot3 = slot3.network
	slot5 = slot3
	slot3 = slot3.session
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.send_to_peers_synched
	slot6 = "sync_proximity_activation"
	slot7 = self._unit
	slot8 = name
	slot9 = range_data_string

	slot3(slot4, slot5, slot6, slot7, slot8)

	return 
end

slot1._check_send_sync_proximity_activation = slot2
slot1 = CoreUnitDamage

function slot2(self, name, range_data_string)
	slot3 = self._proximity_map
	local data = slot3[name]
	local range_data = data[range_data_string]
	slot7 = self
	slot5 = self._do_proximity_activation
	slot8 = range_data

	slot5(slot6, slot7)

	return 
end

slot1.sync_proximity_activation = slot2
slot1 = CoreUnitDamage

function slot2(self, range_data)
	if range_data then

		-- Decompilation error in this vicinity:
		slot2 = range_data.max_activation_count
		slot3 = 0

		return range_data.activation_count < range_data.max_activation_count
	end
end

slot1.is_proximity_range_active = slot2
slot1 = CoreUnitDamage

function slot2(self, data)
	slot4 = self
	slot2 = self.is_proximity_range_active
	slot5 = data.within_data
	slot2 = slot2(slot3, slot4)

	if not slot2 then
		slot4 = self
		slot2 = self.is_proximity_range_active
		slot5 = data.outside_data
		slot2 = slot2(slot3, slot4)
	else
		slot2 = true

		return slot2
	end

	return 
end

slot1.check_proximity_activation_count = slot2
slot1 = CoreUnitDamage

function slot2(self, unit, t, dt, data, range_data)

	-- Decompilation error in this vicinity:
	local pos = nil
	slot7 = data.ref_object

	if slot7 then
		slot7 = data.ref_object
		slot9 = slot7
		slot7 = slot7.position
		slot7 = slot7(slot8)
		pos = slot7
	else
		slot7 = self._unit
		slot9 = slot7
		slot7 = slot7.position
		slot7 = slot7(slot8)
		pos = slot7
	end

	local unit_list = {}
	slot8 = self._unit
	slot10 = slot8
	slot8 = slot8.find_units_quick
	slot11 = "all"
	slot12 = data.slotmask
	local units = slot8(slot9, slot10, slot11)
	slot9 = ipairs
	slot11 = units
	slot9, slot10, slot11 = slot9(slot10)

	for _, unit in slot9, slot10, slot11 do
		slot14 = mvector3
		slot14 = slot14.distance
		slot16 = pos
		slot19 = unit
		slot17 = unit.movement
		slot17 = slot17(slot18)
		slot19 = slot17
		slot17 = slot17.m_newest_pos
		slot14 = slot14(slot15, slot17(slot18))
		slot15 = range_data.range

		if slot14 < slot15 then
			slot14 = table
			slot14 = slot14.insert
			slot16 = unit_list
			slot17 = unit

			slot14(slot15, slot16)
		end
	end

	slot9 = data.is_within

	return 
end

slot1.update_proximity = slot2
slot1 = CoreUnitDamage

function slot2(self)
	return self._proximity_map or {}
end

slot1.get_proximity_map = slot2
slot1 = CoreUnitDamage

function slot2(self, name, slotmask)
	slot3 = self._proximity_map
	slot3 = slot3[name]
	slot3.slotmask = slotmask

	return 
end

slot1.set_proximity_slotmask = slot2
slot1 = CoreUnitDamage

function slot2(self, name, ref_obj_name)
	slot3 = self._proximity_map
	slot3 = slot3[name]

	if ref_obj_name then
		slot4 = self._unit
		slot6 = slot4
		slot4 = slot4.get_object
		slot7 = Idstring
		slot9 = ref_obj_name
		slot4 = slot4(slot5, slot7(slot8))
	end

	slot3.ref_object = slot4

	return 
end

slot1.set_proximity_ref_obj_name = slot2
slot1 = CoreUnitDamage

function slot2(self, name, interval)
	slot3 = self._proximity_map
	slot3 = slot3[name]
	slot3.interval = interval

	return 
end

slot1.set_proximity_interval = slot2
slot1 = CoreUnitDamage

function slot2(self, name, is_within)
	slot3 = self._proximity_map
	slot3 = slot3[name]
	slot3.is_within = is_within

	return 
end

slot1.set_proximity_is_within = slot2
slot1 = CoreUnitDamage

function slot2(self, name, activations)
	slot3 = self._proximity_map
	local data = slot3[name]
	local within_data = data.within_data

	if within_data then
		within_data.activations = activations
		slot7 = self
		slot5 = self.check_proximity_activation_count
		slot8 = data

		return slot5(slot6, slot7)
	end

	return 
end

slot1.set_proximity_within_activations = slot2
slot1 = CoreUnitDamage

function slot2(self, name, max_activations)
	slot3 = self._proximity_map
	local data = slot3[name]
	local within_data = data.within_data

	if within_data then
		within_data.max_activations = max_activations
		slot7 = self
		slot5 = self.check_proximity_activation_count
		slot8 = data

		return slot5(slot6, slot7)
	end

	return 
end

slot1.set_proximity_within_max_activations = slot2
slot1 = CoreUnitDamage

function slot2(self, name, delay)
	slot3 = self._proximity_map
	slot3 = slot3[name]
	local within_data = slot3.within_data

	if within_data then
		within_data.delay = delay
	end

	return 
end

slot1.set_proximity_within_delay = slot2
slot1 = CoreUnitDamage

function slot2(self, name, range)
	slot3 = self._proximity_map
	slot3 = slot3[name]
	local within_data = slot3.within_data

	if within_data then
		within_data.range = range
	end

	return 
end

slot1.set_proximity_within_range = slot2
slot1 = CoreUnitDamage

function slot2(self, name, count)
	slot3 = self._proximity_map
	slot3 = slot3[name]
	local within_data = slot3.within_data

	if within_data then
		within_data.count = count
	end

	return 
end

slot1.set_proximity_inside_count = slot2
slot1 = CoreUnitDamage

function slot2(self, name, activations)
	slot3 = self._proximity_map
	local data = slot3[name]
	local outside_data = data.outside_data

	if outside_data then
		outside_data.activations = activations
		slot7 = self
		slot5 = self.check_proximity_activation_count
		slot8 = data

		return slot5(slot6, slot7)
	end

	return 
end

slot1.set_proximity_outside_activations = slot2
slot1 = CoreUnitDamage

function slot2(self, name, max_activations)
	slot3 = self._proximity_map
	local data = slot3[name]
	local outside_data = data.outside_data

	if outside_data then
		outside_data.max_activations = max_activations
		slot7 = self
		slot5 = self.check_proximity_activation_count
		slot8 = data

		return slot5(slot6, slot7)
	end

	return 
end

slot1.set_proximity_outside_max_activations = slot2
slot1 = CoreUnitDamage

function slot2(self, name, delay)
	slot3 = self._proximity_map
	slot3 = slot3[name]
	local outside_data = slot3.outside_data

	if outside_data then
		outside_data.delay = delay
	end

	return 
end

slot1.set_proximity_outside_delay = slot2
slot1 = CoreUnitDamage

function slot2(self, name, range)
	slot3 = self._proximity_map
	slot3 = slot3[name]
	local outside_data = slot3.outside_data

	if outside_data then
		outside_data.range = range
	end

	return 
end

slot1.set_proximity_outside_range = slot2
slot1 = CoreUnitDamage

function slot2(self, name, range)
	slot3 = self._proximity_map
	slot3 = slot3[name]
	local outside_data = slot3.outside_data

	if outside_data then
		slot4 = count
		outside_data.range = slot4
	end

	return 
end

slot1.set_proximity_outside_range = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._water_check_map

	return slot1
end

slot1.get_water_check_map = slot2
slot1 = CoreUnitDamage

function slot2(self, name, enabled, interval, ref_object_name, ref_body_name, body_depth, physic_effect)
	self._water_check_map = self._water_check_map or {}
	slot8 = self._water_check_map
	local water_check = slot8[name]

	if ref_object_name then
		slot9 = self._unit
		slot11 = slot9
		slot9 = slot9.get_object
		slot12 = Idstring
		slot14 = ref_object_name
		local ref_object = slot9(slot10, slot12(slot13))
	end

	if ref_body_name then
		slot10 = self._unit
		slot12 = slot10
		slot10 = slot10.body
		slot13 = ref_body_name
		local ref_body = slot10(slot11, slot12)
	end

	if not water_check then
		slot11 = CoreDamageWaterCheck
		slot13 = slot11
		slot11 = slot11.new
		slot14 = self._unit
		slot15 = self
		slot16 = name
		slot17 = interval
		slot18 = ref_object
		slot19 = ref_body
		slot20 = body_depth
		slot21 = physic_effect
		slot11 = slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20)
		water_check = slot11
		slot11 = self._water_check_map
		slot11[name] = water_check
	else
		slot13 = water_check
		slot11 = water_check.set_interval
		slot14 = interval

		slot11(slot12, slot13)

		slot13 = water_check
		slot11 = water_check.set_body_depth
		slot14 = body_depth

		slot11(slot12, slot13)

		if ref_object then
			slot13 = water_check
			slot11 = water_check.set_ref_object
			slot14 = ref_object

			slot11(slot12, slot13)
		elseif ref_body then
			slot13 = water_check
			slot11 = water_check.set_ref_body
			slot14 = ref_body

			slot11(slot12, slot13)
		end
	end

	slot13 = self
	slot11 = self.set_water_check_active
	slot14 = name
	slot15 = enabled

	slot11(slot12, slot13, slot14)

	slot13 = water_check
	slot11 = water_check.is_valid
	slot11 = slot11(slot12)

	if not slot11 then
		slot11 = Application
		slot13 = slot11
		slot11 = slot11.error
		slot14 = "Invalid water check \""
		slot15 = tostring
		slot17 = name
		slot15 = slot15(slot16)
		slot16 = "\" in unit \""
		slot17 = tostring
		slot19 = self._unit
		slot21 = slot19
		slot19 = slot19.name
		slot17 = slot17(slot19(slot20))
		slot18 = "\". Neither ref_body nor ref_object is speicified in it."
		slot14 = slot14 .. slot15 .. slot16 .. slot17 .. slot18

		slot11(slot12, slot13)

		slot13 = self
		slot11 = self.remove_water_check
		slot14 = name

		slot11(slot12, slot13)
	end

	return 
end

slot1.set_water_check = slot2
slot1 = CoreUnitDamage

function slot2(self, name)
	slot2 = self._water_check_map

	if slot2 then
		slot2 = self._water_check_map
		local water_check = slot2[name]

		if water_check then
			slot5 = self
			slot3 = self.set_water_check_active
			slot6 = name
			slot7 = false

			slot3(slot4, slot5, slot6)

			slot3 = self._water_check_map
			slot4 = nil
			slot3[name] = slot4
		end
	end

	return 
end

slot1.remove_water_check = slot2
slot1 = CoreUnitDamage

function slot2(self, name)
	slot2 = self._water_check_map

	if slot2 then
		return self._water_check_map[name] ~= nil
	end
end

slot1.exists_water_check = slot2
slot1 = CoreUnitDamage

function slot2(self, name)
	slot2 = self._active_water_check_map

	if slot2 then
		return self._active_water_check_map[name] ~= nil
	end
end

slot1.is_water_check_active = slot2
slot1 = CoreUnitDamage

function slot2(self, name, active)
	slot3 = self._water_check_map

	if slot3 then
		slot3 = self._water_check_map
		local water_check = slot3[name]
	end

	if water_check then
		if active then
			slot4 = self._active_water_check_map
		else
			slot6 = water_check
			slot4 = water_check.set_activation_callbacks_enabled
			slot7 = false

			slot4(slot5, slot6)

			slot4 = self._active_water_check_map

			if slot4 then
				slot4 = self._active_water_check_map
				slot4 = slot4[name]

				if slot4 then
					slot4 = self._active_water_check_map
					slot5 = nil
					slot4[name] = slot5
					slot4 = self._active_water_check_count
					slot4 = slot4 - 1
					self._active_water_check_count = slot4
					slot4 = self._active_water_check_count

					if slot4 == 0 then
						slot4 = managers
						slot4 = slot4.sequence
						slot6 = slot4
						slot4 = slot4.remove_callback
						slot7 = self._water_check_func_id

						slot4(slot5, slot6)

						slot4 = nil
						self._water_check_func_id = slot4
						slot4 = nil
						self._active_water_check_map = slot4
						slot4 = nil
						self._active_water_check_count = slot4
					end
				end
			end
		end
	end

	return 
end

slot1.set_water_check_active = slot2
slot1 = CoreUnitDamage

function slot2(self, t, dt)
	slot3 = pairs
	slot5 = self._active_water_check_map
	slot3, slot4, slot5 = slot3(slot4)

	for name, water_check in slot3, slot4, slot5 do
		slot10 = water_check
		slot8 = water_check.update
		slot11 = t
		slot12 = dt

		slot8(slot9, slot10, slot11)
	end

	return 
end

slot1.update_water_checks = slot2
slot1 = CoreUnitDamage

function slot2(self, name, water_check, src_unit, body, normal, position, direction, damage, velocity, water_depth)
	slot11 = self._water_check_element_map
	local element = slot11[name]

	if element then
		slot12 = CoreSequenceManager
		slot12 = slot12.SequenceEnvironment
		slot14 = slot12
		slot12 = slot12.new
		slot15 = "water"
		slot16 = src_unit
		slot17 = self._unit
		slot18 = body
		slot19 = normal
		slot20 = position
		slot21 = direction
		slot22 = damage
		slot23 = velocity
		slot24 = {
			water_depth = water_depth
		}
		slot25 = self._unit_element
		local env = slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24)
		slot15 = element
		slot13 = element.activate_enter
		slot16 = env

		slot13(slot14, slot15)
	end

	return 
end

slot1.water_check_enter = slot2
slot1 = CoreUnitDamage

function slot2(self, name, water_check, src_unit, body, normal, position, direction, damage, velocity, water_depth)
	slot11 = self._water_check_element_map
	local element = slot11[name]

	if element then
		slot12 = CoreSequenceManager
		slot12 = slot12.SequenceEnvironment
		slot14 = slot12
		slot12 = slot12.new
		slot15 = "water"
		slot16 = src_unit
		slot17 = self._unit
		slot18 = body
		slot19 = normal
		slot20 = position
		slot21 = direction
		slot22 = damage
		slot23 = velocity
		slot24 = {
			water_depth = water_depth
		}
		slot25 = self._unit_element
		local env = slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24)
		slot15 = element
		slot13 = element.activate_exit
		slot16 = env

		slot13(slot14, slot15)
	end

	return 
end

slot1.water_check_exit = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._unit_element

	return slot1
end

slot1.get_unit_element = slot2
slot1 = CoreUnitDamage

function slot2(self, data)
	local state = {}
	local changed = false
	slot4 = self._runned_sequences

	if slot4 then
		slot4 = pairs
		slot6 = self._runned_sequences
		slot4, slot5, slot6 = slot4(slot5)

		for k, v in slot4, slot5, slot6 do
			slot9 = table
			slot9 = slot9.map_copy
			slot11 = self._runned_sequences
			slot9 = slot9(slot10)
			state.runned_sequences = slot9
			changed = true

			break
		end
	end

	slot4 = self._state

	if slot4 then
		slot4 = pairs
		slot6 = self._state
		slot4, slot5, slot6 = slot4(slot5)

		for k, v in slot4, slot5, slot6 do
			slot9 = deep_clone
			slot11 = self._state
			slot9 = slot9(slot10)
			state.state = slot9
			changed = true

			break
		end
	end

	slot4 = self._damage

	if slot4 ~= 0 then
		slot4 = self._damage
		state.damage = slot4
		changed = true
	end

	slot4 = self._variables

	if slot4 then
		slot4 = pairs
		slot6 = self._variables
		slot4, slot5, slot6 = slot4(slot5)

		for k, v in slot4, slot5, slot6 do

			-- Decompilation error in this vicinity:
			slot9 = self._unit_element
			slot9 = slot9._set_variables
		end
	end

	slot4 = self._proximity_count

	if slot4 then
		changed = true
		state.proximity_count = self._proximity_count
		state.proximity_enabled_count = self._proximity_enabled_count
		slot4 = pairs
		slot6 = self._proximity_map or {}
		slot4, slot5, slot6 = slot4(slot5)

		for name, data in slot4, slot5, slot6 do
			state.proximity_map = state.proximity_map or {}
			slot9 = state.proximity_map
			slot10 = {}
			slot9[name] = slot10
			slot9 = pairs
			slot11 = data
			slot9, slot10, slot11 = slot9(slot10)

			for attribute_name, attribute_value in slot9, slot10, slot11 do
				if attribute_name == "ref_object" then
					slot14 = state.proximity_map
					slot14 = slot14[name]

					if attribute_value then
						slot17 = attribute_value
						slot15 = attribute_value.name
						slot15 = slot15(slot16)
					end

					slot14[attribute_name] = slot15
				elseif attribute_name == "slotmask" then
					slot14 = state.proximity_map
					slot14 = slot14[name]
					slot15 = managers
					slot15 = slot15.slot
					slot17 = slot15
					slot15 = slot15.get_mask_name
					slot18 = attribute_value
					slot15 = slot15(slot16, slot17)
					slot14[attribute_name] = slot15
				elseif attribute_name == "last_check_time" then
					slot14 = state.proximity_map
					slot14 = slot14[name]
					slot15 = TimerManager
					slot17 = slot15
					slot15 = slot15.game
					slot15 = slot15(slot16)
					slot17 = slot15
					slot15 = slot15.time
					slot15 = slot15(slot16)
					slot15 = slot15 - attribute_value
					slot14[attribute_name] = slot15
				elseif attribute_name == "within_data" or attribute_name == "outside_data" then
					slot14 = state.proximity_map
					slot14 = slot14[name]
					slot15 = {}
					slot14[attribute_name] = slot15
					slot14 = pairs
					slot16 = attribute_value
					slot14, slot15, slot16 = slot14(slot15)

					for range_attribute_name, range_attribute_value in slot14, slot15, slot16 do
						if range_attribute_name ~= "element" then
							slot19 = state.proximity_map
							slot19 = slot19[name]
							slot19 = slot19[attribute_name]
							slot19[range_attribute_name] = range_attribute_value
						end
					end
				else
					slot14 = state.proximity_map
					slot14 = slot14[name]
					slot14[attribute_name] = attribute_value
				end
			end
		end
	end

	slot4 = self._trigger_data_map

	if slot4 then
		slot4 = managers
		slot4 = slot4.sequence
		slot6 = slot4
		slot4 = slot4.safe_save_map
		slot7 = self._trigger_data_map
		slot4 = slot4(slot5, slot6)
		state.trigger_data_map = slot4
		slot4 = self._trigger_name_list

		if slot4 then
			slot4 = table
			slot4 = slot4.list_copy
			slot6 = self._trigger_name_list
			slot4 = slot4(slot5)
		end

		state.trigger_name_list = slot4
		slot4 = self._last_trigger_id
		state.last_trigger_id = slot4
		changed = true
	end

	slot4 = ipairs
	slot6 = self._unit
	slot8 = slot6
	slot6 = slot6.anim_groups
	slot4, slot5, slot6 = slot4(slot6(slot7))

	for _, anim_name in slot4, slot5, slot6 do
		state.anim = state.anim or {}
		slot9 = self._unit
		slot11 = slot9
		slot9 = slot9.anim_time
		slot12 = anim_name
		local anim_time = slot9(slot10, slot11)
		slot10 = table
		slot10 = slot10.insert
		slot12 = state.anim
		slot13 = {
			name = anim_name,
			time = anim_time
		}

		slot10(slot11, slot12)

		changed = true
	end

	slot4 = self._skip_save_anim_state_machine

	if not slot4 then
		slot4 = self._unit
		slot6 = slot4
		slot4 = slot4.anim_state_machine
		local state_machine = slot4(slot5)

		if state_machine then
			state.state_machine = state.state_machine or {}
			slot5 = ipairs
			slot9 = state_machine
			slot7 = state_machine.config
			slot7 = slot7(slot8)
			slot9 = slot7
			slot7 = slot7.segments
			slot5, slot6, slot7 = slot5(slot7(slot8))

			for _, segment in slot5, slot6, slot7 do
				slot12 = state_machine
				slot10 = state_machine.segment_state
				slot13 = segment
				local anim_state = slot10(slot11, slot12)
				slot11 = Idstring
				slot13 = ""
				slot11 = slot11(slot12)

				if anim_state ~= slot11 then
					changed = true
					slot13 = state_machine
					slot11 = state_machine.segment_real_time
					slot14 = segment
					local anim_time = slot11(slot12, slot13)
					slot12 = table
					slot12 = slot12.insert
					slot14 = state.state_machine
					slot15 = {
						anim_state = anim_state,
						anim_time = anim_time
					}

					slot12(slot13, slot14)
				end
			end
		end
	end

	slot4 = self._unit_element
	slot6 = slot4
	slot4 = slot4.save_by_unit
	slot7 = self._unit
	slot8 = state
	slot4 = slot4(slot5, slot6, slot7)

	if not slot4 then
	end

	slot4 = self._queued_sequences

	if slot4 then
		changed = true
		slot4 = self._queued_sequences
		state.queued_sequences = slot4
	end

	slot4 = self._startup_sequence_callback_id

	if slot4 then
		slot4 = true
		state.trigger_startup_sequence_callback = slot4
		changed = true
	end

	slot4 = self._editor_startup_sequence_callback_id

	if slot4 then
		slot4 = true
		state.trigger_editor_startup_sequence_callback = slot4
		changed = true
	end

	if changed then
		data.CoreUnitDamage = state
	end

	return 
end

slot1.save = slot2
slot1 = CoreUnitDamage

function slot2(self, data)
	local state = data.CoreUnitDamage
	slot3 = self._startup_sequence_callback_id

	if slot3 then
		slot3 = managers
		slot3 = slot3.sequence
		slot5 = slot3
		slot3 = slot3.remove_startup_callback
		slot6 = self._startup_sequence_callback_id

		slot3(slot4, slot5)

		slot3 = nil
		self._startup_sequence_callback_id = slot3
	end

	slot3 = self._editor_startup_sequence_callback_id

	if slot3 then
		slot3 = managers
		slot3 = slot3.sequence
		slot5 = slot3
		slot3 = slot3.remove_startup_callback
		slot6 = self._editor_startup_sequence_callback_id

		slot3(slot4, slot5)

		slot3 = nil
		self._editor_startup_sequence_callback_id = slot3
	end

	if state then
		slot3 = state.trigger_startup_sequence_callback

		if slot3 then
			slot3 = managers
			slot3 = slot3.sequence
			slot5 = slot3
			slot3 = slot3.add_startup_callback
			slot6 = callback
			slot8 = self
			slot9 = self
			slot10 = "run_startup_sequences"
			slot3 = slot3(slot4, slot6(slot7, slot8, slot9))
			self._startup_sequence_callback_id = slot3
		end

		slot3 = state.trigger_editor_startup_sequence_callback

		if slot3 then
			slot3 = managers
			slot3 = slot3.sequence
			slot5 = slot3
			slot3 = slot3.add_startup_callback
			slot6 = callback
			slot8 = self
			slot9 = self
			slot10 = "run_editor_startup_sequences"
			slot3 = slot3(slot4, slot6(slot7, slot8, slot9))
			self._editor_startup_sequence_callback_id = slot3
		end

		slot3 = state.runned_sequences

		if slot3 then
			slot3 = table
			slot3 = slot3.map_copy
			slot5 = state.runned_sequences
			slot3 = slot3(slot4)
			self._runned_sequences = slot3
		end

		slot3 = state.state

		if slot3 then
			slot3 = deep_clone
			slot5 = state.state
			slot3 = slot3(slot4)
			self._state = slot3
		end

		self._damage = state.damage or self._damage
		slot3 = state.variables

		if slot3 then
			slot3 = table
			slot3 = slot3.map_copy
			slot5 = state.variables
			slot3 = slot3(slot4)
			self._variables = slot3
		end

		slot3 = state.queued_sequences
		self._queued_sequences = slot3
		slot3 = state.proximity_map

		if slot3 then
			slot3 = state.proximity_count
			self._proximity_count = slot3
			slot3 = state.proximity_enabled_count
			self._proximity_enabled_count = slot3
			slot3 = pairs
			slot5 = state.proximity_map
			slot3, slot4, slot5 = slot3(slot4)

			for name, data in slot3, slot4, slot5 do
				self._proximity_map = self._proximity_map or {}
				slot8 = pairs
				slot10 = data
				slot8, slot9, slot10 = slot8(slot9)

				for attribute_name, attribute_value in slot8, slot9, slot10 do
					if attribute_name == "ref_object" then
						slot13 = self._proximity_map
						slot13 = slot13[name]

						if attribute_value then
							slot14 = self._unit
							slot16 = slot14
							slot14 = slot14.get_object
							slot17 = attribute_value
							slot14 = slot14(slot15, slot16)
						end

						slot13[attribute_name] = slot14
					elseif attribute_name == "slotmask" then
						slot13 = self._proximity_map
						slot13 = slot13[name]
						slot14 = managers
						slot14 = slot14.slot
						slot16 = slot14
						slot14 = slot14.get_mask
						slot17 = attribute_value
						slot14 = slot14(slot15, slot16)
						slot13[attribute_name] = slot14
					elseif attribute_name == "last_check_time" then
						slot13 = self._proximity_map
						slot13 = slot13[name]
						slot14 = TimerManager
						slot16 = slot14
						slot14 = slot14.game
						slot14 = slot14(slot15)
						slot16 = slot14
						slot14 = slot14.time
						slot14 = slot14(slot15)
						slot14 = slot14 - attribute_value
						slot13[attribute_name] = slot14
					elseif attribute_name == "within_data" or attribute_name == "outside_data" then
						slot13 = pairs
						slot15 = attribute_value
						slot13, slot14, slot15 = slot13(slot14)

						for range_attribute_name, range_attribute_value in slot13, slot14, slot15 do
							if range_attribute_name ~= "last_check_time" then
								slot18 = self._proximity_map
								slot18 = slot18[name]
								slot18 = slot18[attribute_name]
								slot18[range_attribute_name] = range_attribute_value
							end
						end
					else
						slot13 = self._proximity_map
						slot13 = slot13[name]
						slot13[attribute_name] = attribute_value
					end
				end
			end

			slot3 = self._proximity_enabled_count

			if slot3 then
				slot5 = self
				slot3 = self.set_update_callback
				slot6 = "update_proximity_list"
				slot7 = true

				slot3(slot4, slot5, slot6)
			end
		end

		slot3 = state.trigger_data_map

		if slot3 then
			slot3 = managers
			slot3 = slot3.sequence
			slot5 = slot3
			slot3 = slot3.safe_load_map
			slot6 = state.trigger_data_map
			slot3 = slot3(slot4, slot5)
			self._trigger_data_map = slot3
			slot3 = state.trigger_name_list

			if slot3 then
				slot3 = table
				slot3 = slot3.list_copy
				slot5 = state.trigger_name_list
				slot3 = slot3(slot4)
			end

			self._trigger_name_list = slot3
			slot3 = state.last_trigger_id
			self._last_trigger_id = slot3
		end

		slot3 = state.anim

		if slot3 then
			slot3 = ipairs
			slot5 = state.anim
			slot3, slot4, slot5 = slot3(slot4)

			for _, anim_data in slot3, slot4, slot5 do
				slot8 = self._unit
				slot10 = slot8
				slot8 = slot8.anim_set_time
				slot11 = anim_data.name
				slot12 = anim_data.time

				slot8(slot9, slot10, slot11)
			end
		end

		slot3 = state.state_machine

		if slot3 then
			slot3 = ipairs
			slot5 = state.state_machine
			slot3, slot4, slot5 = slot3(slot4)

			for _, anim_data in slot3, slot4, slot5 do
				slot8 = self._unit
				slot10 = slot8
				slot8 = slot8.play_state
				slot11 = anim_data.anim_state
				slot12 = anim_data.anim_time

				slot8(slot9, slot10, slot11)
			end
		end

		slot3 = self._state

		if slot3 then
			slot3 = pairs
			slot5 = self._state
			slot3, slot4, slot5 = slot3(slot4)

			for element_name, data in slot3, slot4, slot5 do
				slot8 = managers
				slot8 = slot8.sequence
				slot10 = slot8
				slot8 = slot8.load_element_data
				slot11 = self._unit
				slot12 = element_name
				slot13 = data

				slot8(slot9, slot10, slot11, slot12)
			end
		end

		slot3 = self._unit_element
		slot5 = slot3
		slot3 = slot3.load_by_unit
		slot6 = self._unit
		slot7 = state

		slot3(slot4, slot5, slot6)
	end

	slot3 = managers
	slot3 = slot3.worldcollection
	slot5 = slot3
	slot3 = slot3.add_world_loaded_callback
	slot6 = self

	slot3(slot4, slot5)

	slot5 = self
	slot3 = self._process_sequence_queue

	slot3(slot4)

	return 
end

slot1.load = slot2
slot1 = CoreUnitDamage

function slot2(self)

	-- Decompilation error in this vicinity:
	slot1 = alive
	slot3 = self._unit
	slot1 = slot1(slot2)

	if not slot1 then
		return 
	end

	slot1 = managers
	slot1 = slot1.worldcollection
	slot4 = worlddefinition
	slot2 = worlddefinition.use_me
	slot5 = self._unit

	slot2(slot3, slot4)

	slot4 = worlddefinition
	slot2 = worlddefinition.external_set_only_visible_in_editor
	slot5 = self._unit

	slot2(slot3, slot4)

	return 
end

slot1.on_world_loaded = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = Vector3
	slot3 = 0
	slot4 = 0
	slot5 = 0
	local nil_vector = slot1(slot2, slot3, slot4)
	slot2 = managers
	slot2 = slot2.sequence
	slot4 = slot2
	slot2 = slot2.remove_startup_callback
	slot5 = self._startup_sequence_callback_id

	slot2(slot3, slot4)

	slot2 = nil
	self._startup_sequence_callback_id = slot2
	slot2 = pairs
	slot4 = self._startup_sequence_map
	slot2, slot3, slot4 = slot2(slot3)

	for name in slot2, slot3, slot4 do
		slot6 = alive
		slot8 = self._unit
		slot6 = slot6(slot7)

		if slot6 then
			slot6 = managers
			slot6 = slot6.sequence
			slot8 = slot6
			slot6 = slot6.run_sequence
			slot9 = name
			slot10 = "startup"
			slot11 = self._unit
			slot12 = self._unit
			slot13 = nil
			slot14 = nil_vector
			slot15 = nil_vector
			slot16 = nil_vector
			slot17 = 0
			slot18 = nil_vector

			slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)
		else
			break
		end
	end

	return 
end

slot1.run_startup_sequences = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = Vector3
	slot3 = 0
	slot4 = 0
	slot5 = 0
	local nil_vector = slot1(slot2, slot3, slot4)
	slot2 = managers
	slot2 = slot2.sequence
	slot4 = slot2
	slot2 = slot2.remove_startup_callback
	slot5 = self._editor_startup_sequence_callback_id

	slot2(slot3, slot4)

	slot2 = nil
	self._editor_startup_sequence_callback_id = slot2
	slot2 = pairs
	slot4 = self._editor_startup_sequence_map
	slot2, slot3, slot4 = slot2(slot3)

	for name in slot2, slot3, slot4 do
		slot6 = alive
		slot8 = self._unit
		slot6 = slot6(slot7)

		if slot6 then
			slot6 = managers
			slot6 = slot6.sequence
			slot8 = slot6
			slot6 = slot6.run_sequence
			slot9 = name
			slot10 = "editor_startup"
			slot11 = self._unit
			slot12 = self._unit
			slot13 = nil
			slot14 = nil_vector
			slot15 = nil_vector
			slot16 = nil_vector
			slot17 = 0
			slot18 = nil_vector

			slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)
		else
			break
		end
	end

	return 
end

slot1.run_editor_startup_sequences = slot2
slot1 = CoreUnitDamage

function slot2(self, trigger_name, callback_func)

	-- Decompilation error in this vicinity:
	slot3 = self._trigger_callback_map_list

	if not slot3 then
		slot3 = {}
		self._trigger_callback_map_list = slot3
	end

	slot3 = self._trigger_callback_map_list
	local callback_list = slot3[trigger_name]

	if not callback_list then
		callback_list = {}
		slot4 = self._trigger_callback_map_list
		slot4[trigger_name] = callback_list
	end

	slot4 = table
	slot4 = slot4.insert
	slot6 = callback_list
	slot7 = callback_func

	slot4(slot5, slot6)

	return 
end

slot1.add_trigger_callback = slot2
slot1 = CoreUnitDamage

function slot2(self, trigger_name, callback_func)

	-- Decompilation error in this vicinity:
	slot3 = self._trigger_callback_map_list
	local callback_list = slot3[trigger_name]
	slot4 = ipairs
	slot6 = callback_list
	slot4, slot5, slot6 = slot4(slot5)

	for index, next_callback_func in slot4, slot5, slot6 do
		if callback_func == next_callback_func then
			slot9 = table
			slot9 = slot9.remove
			slot11 = callback_list
			slot12 = index

			slot9(slot10, slot11)

			break
		end
	end

	slot4 = #callback_list

	if slot4 == 0 then
		slot4 = self._trigger_callback_map_list
		slot5 = nil
		slot4[trigger_name] = slot5
		slot4 = next
		slot6 = self._trigger_callback_map_list
		slot4 = slot4(slot5)

		if not slot4 then
			slot4 = nil
			self._trigger_callback_map_list = slot4
		end
	end

	slot4 = self._current_trigger_callback_index

	if slot4 then
		slot4 = self._current_trigger_callback_index
		slot4 = slot4 - 1
		self._current_trigger_callback_index = slot4
	end

	return 
end

slot1.remove_trigger_callback = slot2
slot1 = CoreUnitDamage

function slot2(self, trigger_name, env)
	slot3 = self._trigger_callback_map_list

	if not slot3 then
		return 
	end

	slot3 = self._trigger_callback_map_list
	local callback_list = slot3[trigger_name]

	if not callback_list then
		return 
	end

	slot4 = 0
	self._current_trigger_callback_index = slot4
	slot4 = self._current_trigger_callback_index
	slot5 = #callback_list

	while slot4 < slot5 do
		slot4 = self._current_trigger_callback_index
		slot4 = slot4 + 1
		self._current_trigger_callback_index = slot4
		slot4 = self._current_trigger_callback_index
		slot4 = callback_list[slot4]
		slot6 = trigger_name
		slot7 = env

		slot4(slot5, slot6)
	end

	slot4 = nil
	self._current_trigger_callback_index = slot4

	return 
end

slot1.on_trigger_callback = slot2
slot1 = CoreUnitDamage

function slot2(self, trigger_name, id)
	slot3 = self._trigger_data_map

	if slot3 then
		slot3 = self._trigger_data_map
		slot3 = slot3[trigger_name]

		if slot3 then
			slot3 = ipairs
			slot5 = self._trigger_data_map
			slot5 = slot5[trigger_name]
			slot3, slot4, slot5 = slot3(slot4)

			for index, data in slot3, slot4, slot5 do
				slot8 = data.id

				if slot8 == id then
					slot8 = table
					slot8 = slot8.remove
					slot10 = self._trigger_data_map
					slot10 = slot10[trigger_name]
					slot11 = index

					slot8(slot9, slot10)

					break
				end
			end
		end
	end

	return 
end

slot1.remove_trigger_data = slot2
slot1 = CoreUnitDamage

function slot2(self, trigger_name, notify_unit_sequence, notify_unit, start_time, repeat_nr, params, is_editor)

	-- Decompilation error in this vicinity:
	self._last_trigger_id = (self._last_trigger_id or 0) + 1
	local trigger_data = {
		id = self._last_trigger_id,
		trigger_name = trigger_name,
		notify_unit_sequence = notify_unit_sequence,
		notify_unit = notify_unit,
		time = start_time,
		repeat_nr = repeat_nr,
		params = params
	}
	self._trigger_data_map = self._trigger_data_map or {}
	local list = self._trigger_data_map[trigger_name]

	if not list then
		list = {}
		self._trigger_data_map[trigger_name] = list
		self._trigger_name_list = self._trigger_name_list or {}
		slot10 = table
		slot10 = slot10.insert
		slot12 = self._trigger_name_list
		slot13 = trigger_name

		slot10(slot11, slot12)
	end

	slot10 = table
	slot10 = slot10.insert
	slot12 = list
	slot13 = trigger_data

	slot10(slot11, slot12)

	slot10 = self._last_trigger_id

	return slot10
end

slot1.add_trigger_sequence = slot2
slot1 = CoreUnitDamage

function slot2(self, id, trigger_name, notify_unit_sequence)
	slot4 = self._trigger_data_map

	if slot4 then
		slot4 = self._trigger_data_map
		slot4 = slot4[trigger_name]

		if slot4 then
			slot4 = ipairs
			slot6 = self._trigger_data_map
			slot6 = slot6[trigger_name]
			slot4, slot5, slot6 = slot4(slot5)

			for _, data in slot4, slot5, slot6 do
				slot9 = data.id

				if slot9 == id then
					data.notify_unit_sequence = notify_unit_sequence

					return id
				end
			end
		end
	end

	slot4 = nil

	return slot4
end

slot1.set_trigger_sequence_name = slot2
slot1 = CoreUnitDamage

function slot2(self, id, trigger_name, notify_unit)
	slot4 = self._trigger_data_map

	if slot4 then
		slot4 = self._trigger_data_map
		slot4 = slot4[trigger_name]

		if slot4 then
			slot4 = ipairs
			slot6 = self._trigger_data_map
			slot6 = slot6[trigger_name]
			slot4, slot5, slot6 = slot4(slot5)

			for _, data in slot4, slot5, slot6 do
				slot9 = data.id

				if slot9 == id then
					data.notify_unit = notify_unit

					return id
				end
			end
		end
	end

	slot4 = nil

	return slot4
end

slot1.set_trigger_sequence_unit = slot2
slot1 = CoreUnitDamage

function slot2(self, id, trigger_name, start_time)
	slot4 = self._trigger_data_map

	if slot4 then
		slot4 = self._trigger_data_map
		slot4 = slot4[trigger_name]

		if slot4 then
			slot4 = ipairs
			slot6 = self._trigger_data_map
			slot6 = slot6[trigger_name]
			slot4, slot5, slot6 = slot4(slot5)

			for _, data in slot4, slot5, slot6 do
				slot9 = data.id

				if slot9 == id then
					data.time = start_time

					return id
				end
			end
		end
	end

	slot4 = nil

	return slot4
end

slot1.set_trigger_sequence_time = slot2
slot1 = CoreUnitDamage

function slot2(self, id, trigger_name, repeat_nr)
	slot4 = self._trigger_data_map

	if slot4 then
		slot4 = self._trigger_data_map
		slot4 = slot4[trigger_name]

		if slot4 then
			slot4 = ipairs
			slot6 = self._trigger_data_map
			slot6 = slot6[trigger_name]
			slot4, slot5, slot6 = slot4(slot5)

			for _, data in slot4, slot5, slot6 do
				slot9 = data.id

				if slot9 == id then
					data.repeat_nr = repeat_nr

					return id
				end
			end
		end
	end

	slot4 = nil

	return slot4
end

slot1.set_trigger_sequence_repeat_nr = slot2
slot1 = CoreUnitDamage

function slot2(self, id, trigger_name, params)
	slot4 = self._trigger_data_map

	if slot4 then
		slot4 = self._trigger_data_map
		slot4 = slot4[trigger_name]

		if slot4 then
			slot4 = ipairs
			slot6 = self._trigger_data_map
			slot6 = slot6[trigger_name]
			slot4, slot5, slot6 = slot4(slot5)

			for _, data in slot4, slot5, slot6 do
				slot9 = data.id

				if slot9 == id then
					data.params = params

					return id
				end
			end
		end
	end

	slot4 = nil

	return slot4
end

slot1.set_trigger_sequence_params = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._trigger_name_list

	return slot1
end

slot1.get_trigger_name_list = slot2
slot1 = CoreUnitDamage

function slot2(self, trigger_name)
	slot2 = self._trigger_data_map

	if slot2 then
		slot2 = self._trigger_data_map
		local trigger_data_list = slot2[trigger_name]

		if trigger_data_list then
			slot3 = #trigger_data_list
			slot4 = 1
			slot5 = -1

			for index = slot3, slot4, slot5 do

				-- Decompilation error in this vicinity:
				local trigger_data = trigger_data_list[index]
				slot8 = trigger_data.is_corrupt
			end
		end

		return trigger_data_list
	else
		slot2 = nil

		return slot2
	end

	return 
end

slot1.get_trigger_data_list = slot2
slot1 = CoreUnitDamage

function slot2(self, damage_type, src_body, source_body, normal, position, direction, velocity)
	local damage = nil
	slot11 = source_body
	slot9 = source_body.extension
	local body_ext = slot9(slot10)
	local damage_ext = nil

	if body_ext then
		damage_ext = body_ext.damage

		if damage_ext then
			slot13 = damage_ext
			slot11 = damage_ext.inflict_damage
			slot14 = damage_type
			slot15 = self._unit
			slot16 = src_body
			slot17 = normal
			slot18 = position
			slot19 = direction

			return slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
		end
	end

	slot11 = nil
	slot12 = false

	return slot11, slot12
end

slot1.inflict_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, attack_unit, dest_body, normal, position, direction, damage, unevadable)
	slot10 = self
	slot8 = self.add_damage
	slot11 = "damage"
	slot12 = attack_unit
	slot13 = dest_body
	slot14 = normal
	slot15 = position
	slot16 = direction
	slot17 = damage
	slot18 = Vector3
	slot20 = 0
	slot21 = 0
	slot22 = 0
	slot18 = slot18(slot19, slot20, slot21)
	slot19 = unevadable

	return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)
end

slot1.damage_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, attack_unit, dest_body, normal, position, direction, damage, unevadable)
	slot10 = self
	slot8 = self.add_damage
	slot11 = "bullet"
	slot12 = attack_unit
	slot13 = dest_body
	slot14 = normal
	slot15 = position
	slot16 = direction
	slot17 = damage
	slot18 = Vector3
	slot20 = 0
	slot21 = 0
	slot22 = 0
	slot18 = slot18(slot19, slot20, slot21)
	slot19 = unevadable

	return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)
end

slot1.damage_bullet = slot2
slot1 = CoreUnitDamage

function slot2(self, attack_unit, dest_body, normal, position, direction, damage, unevadable)
	slot10 = self
	slot8 = self.add_damage
	slot11 = "lock"
	slot12 = attack_unit
	slot13 = dest_body
	slot14 = normal
	slot15 = position
	slot16 = direction
	slot17 = damage
	slot18 = Vector3
	slot20 = 0
	slot21 = 0
	slot22 = 0
	slot18 = slot18(slot19, slot20, slot21)
	slot19 = unevadable

	return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)
end

slot1.damage_lock = slot2
slot1 = CoreUnitDamage

function slot2(self, attack_unit, dest_body, normal, position, direction, damage, armor_piercing)
	if armor_piercing then
		slot10 = self
		slot8 = self.damage_armor_piercing
		slot11 = attack_unit
		slot12 = dest_body
		slot13 = normal
		slot14 = position
		slot15 = direction
		slot16 = damage

		return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15)
	end

	slot10 = self
	slot8 = self.add_damage
	slot11 = "explosion"
	slot12 = attack_unit
	slot13 = dest_body
	slot14 = normal
	slot15 = position
	slot16 = direction
	slot17 = damage
	slot18 = Vector3
	slot20 = 0
	slot21 = 0
	slot22 = 0

	return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot18(slot19, slot20, slot21))
end

slot1.damage_explosion = slot2
slot1 = CoreUnitDamage

function slot2(self, attack_unit, dest_body, normal, position, direction, damage, velocity)
	slot10 = self
	slot8 = self.add_damage
	slot11 = "collision"
	slot12 = attack_unit
	slot13 = dest_body
	slot14 = normal
	slot15 = position
	slot16 = direction
	slot17 = damage
	slot18 = velocity

	return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)
end

slot1.damage_collision = slot2
slot1 = CoreUnitDamage

function slot2(self, attack_unit, dest_body, normal, position, direction, damage)
	slot9 = self
	slot7 = self.add_damage
	slot10 = "melee"
	slot11 = attack_unit
	slot12 = dest_body
	slot13 = normal
	slot14 = position
	slot15 = direction
	slot16 = damage
	slot17 = Vector3
	slot19 = 0
	slot20 = 0
	slot21 = 0

	return slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot17(slot18, slot19, slot20))
end

slot1.damage_melee = slot2
slot1 = CoreUnitDamage

function slot2(self, attack_unit, dest_body, normal, position, direction, damage)
	slot9 = self
	slot7 = self.add_damage
	slot10 = "electricity"
	slot11 = attack_unit
	slot12 = dest_body
	slot13 = normal
	slot14 = position
	slot15 = direction
	slot16 = damage
	slot17 = Vector3
	slot19 = 0
	slot20 = 0
	slot21 = 0

	return slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot17(slot18, slot19, slot20))
end

slot1.damage_electricity = slot2
slot1 = CoreUnitDamage

function slot2(self, attack_unit, dest_body, normal, position, direction, damage, velocity)
	slot10 = self
	slot8 = self.add_damage
	slot11 = "fire"
	slot12 = attack_unit
	slot13 = dest_body
	slot14 = normal
	slot15 = position
	slot16 = direction
	slot17 = damage
	slot18 = velocity

	return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)
end

slot1.damage_fire = slot2
slot1 = CoreUnitDamage

function slot2(self, attack_unit, dest_body, normal, position, direction, damage, velocity)
	slot10 = self
	slot8 = self.add_damage
	slot11 = "armor_piercing"
	slot12 = attack_unit
	slot13 = dest_body
	slot14 = normal
	slot15 = position
	slot16 = direction
	slot17 = damage
	slot18 = velocity

	return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)
end

slot1.damage_armor_piercing = slot2
slot1 = CoreUnitDamage

function slot2(self, endurance_type, attack_unit, dest_body, normal, position, direction, damage, velocity)
	slot9 = "damage_"
	slot10 = endurance_type
	slot9 = slot9 .. slot10
	local damage_func = self[slot9]

	if damage_func then
		slot10 = damage_func
		slot12 = self
		slot13 = attack_unit
		slot14 = dest_body
		slot15 = normal
		slot16 = position
		slot17 = direction
		slot18 = damage
		slot19 = velocity

		return slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	else
		slot10 = Application
		slot12 = slot10
		slot10 = slot10.error
		slot13 = "Unit \""
		slot14 = tostring
		slot16 = self._unit
		slot18 = slot16
		slot16 = slot16.name
		slot14 = slot14(slot16(slot17))
		slot15 = "\" doesn't have a \"damage_"
		slot16 = tostring
		slot18 = endurance_type
		slot16 = slot16(slot17)
		slot17 = "\"-function on its unit damage extension."
		slot13 = slot13 .. slot14 .. slot15 .. slot16 .. slot17

		slot10(slot11, slot12)

		slot10 = false
		slot11 = nil

		return slot10, slot11
	end

	return 
end

slot1.damage_by_area = slot2
slot1 = CoreUnitDamage

function slot2(self, endurance_type, attack_unit, dest_body, normal, position, direction, damage, velocity)
	slot9 = self._unit_element

	if slot9 then
		slot9 = self._damage
		slot9 = slot9 + damage
		self._damage = slot9
		slot9 = self._damage
		slot10 = self._unit_element
		slot12 = slot10
		slot10 = slot10.get_endurance
		slot10 = slot10(slot11)

		if slot10 <= slot9 then
			slot9 = true
			slot10 = damage

			return slot9, slot10
		else
			slot9 = false
			slot10 = damage

			return slot9, slot10
		end
	else
		slot9 = false
		slot10 = 0

		return slot9, slot10
	end

	return 
end

slot1.add_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, effect_type, attack_unit, dest_body, normal, position, direction, velocity, params)
	return 
end

slot1.damage_effect = slot2
slot1 = CoreUnitDamage

function slot2(self, name, params)
	slot5 = self
	slot3 = self.run_sequence_simple2
	slot6 = name
	slot7 = ""
	slot8 = params

	slot3(slot4, slot5, slot6, slot7)

	return 
end

slot1.run_sequence_simple = slot2
slot1 = CoreUnitDamage

function slot2(self, name, endurance_type, params)
	slot6 = self
	slot4 = self.run_sequence_simple3
	slot7 = name
	slot8 = endurance_type
	slot9 = self._unit
	slot10 = params

	slot4(slot5, slot6, slot7, slot8, slot9)

	return 
end

slot1.run_sequence_simple2 = slot2
slot1 = CoreUnitDamage

function slot2(self, name, endurance_type, source_unit, params)
	slot7 = self
	slot5 = self.run_sequence
	slot8 = name
	slot9 = endurance_type
	slot10 = source_unit
	slot11 = nil
	slot12 = Vector3
	slot14 = 0
	slot15 = 0
	slot16 = 1
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = self._unit
	slot15 = slot13
	slot13 = slot13.position
	slot13 = slot13(slot14)
	slot14 = Vector3
	slot16 = 0
	slot17 = 0
	slot18 = -1
	slot14 = slot14(slot15, slot16, slot17)
	slot15 = 0
	slot16 = Vector3
	slot18 = 0
	slot19 = 0
	slot20 = 0
	slot16 = slot16(slot17, slot18, slot19)
	slot17 = params

	slot5(slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16)

	return 
end

slot1.run_sequence_simple3 = slot2
slot1 = CoreUnitDamage

function slot2(self, name, endurance_type, source_unit, dest_body, normal, position, direction, damage, velocity, params)
	slot11 = self._unit_element
	slot13 = slot11
	slot11 = slot11.run_sequence
	slot14 = name
	slot15 = endurance_type
	slot16 = source_unit
	slot17 = self._unit
	slot18 = dest_body
	slot19 = normal
	slot20 = position
	slot21 = direction
	slot22 = damage
	slot23 = velocity
	slot24 = params

	slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23)

	return 
end

slot1.run_sequence = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._damage

	return slot1
end

slot1.get_damage = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._unit_element

	if slot1 then
		slot1 = self._unit_element
		slot3 = slot1
		slot1 = slot1.get_endurance

		return slot1(slot2)
	else
		slot1 = 0

		return slot1
	end

	return 
end

slot1.get_endurance = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._unit_element

	if slot1 then
		slot1 = self._unit_element
		slot3 = slot1
		slot1 = slot1.get_endurance
		slot1 = slot1(slot2)
		slot2 = 0
	else
		slot1 = 0

		return slot1
	end

	return 
end

slot1.get_damage_ratio = slot2
slot1 = CoreUnitDamage

function slot2(self, t, dt)
	slot3 = self._inflict_dest_body

	if slot3 then
		slot3 = pairs
		slot5 = self._inflict_dest_body
		slot3, slot4, slot5 = slot3(slot4)

		for damage_type, dest_body in slot3, slot4, slot5 do

			-- Decompilation error in this vicinity:
			slot8 = self._inflict_done
		end
	end

	slot3 = nil
	self._inflict_done = slot3

	return 
end

slot1.update_inflict_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, damage_type, src_body, dest_body, normal, pos, dir, velocity)
	slot12 = dest_body
	local can_inflict, delayed = self.can_receive_inflict_damage(slot9, self, damage_type)
	self._inflict_done = self._inflict_done or {}
	self._inflict_done[damage_type] = self._inflict_done[damage_type] or can_inflict or delayed

	if can_inflict then
		self._inflict_dest_body = self._inflict_dest_body or {}
		self._inflict_src_body = self._inflict_src_body or {}
		slot10 = self._inflict_dest_body
		local old_dest_body = slot10[damage_type]
		slot11 = alive
		slot13 = old_dest_body
		slot11 = slot11(slot12)

		if slot11 then
			slot13 = old_dest_body
			slot11 = old_dest_body.key
			slot11 = slot11(slot12)
			slot14 = dest_body
			slot12 = dest_body.key
			slot12 = slot12(slot13)

			if slot11 ~= slot12 then
				slot13 = self
				slot11 = self.exit_inflict_damage
				slot14 = damage_type
				slot15 = self._inflict_src_body
				slot15 = slot15[damage_type]
				slot16 = old_dest_body
				slot17 = normal
				slot18 = pos
				slot19 = dir
				slot20 = velocity

				slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19)
			end
		end

		slot11 = self._inflict_dest_body
		slot11[damage_type] = dest_body
		slot11 = self._inflict_src_body
		slot11[damage_type] = src_body
		slot13 = self
		slot11 = self.enter_inflict_damage
		slot14 = damage_type
		slot15 = src_body
		slot16 = dest_body
		slot17 = normal
		slot18 = pos
		slot19 = dir
		slot20 = velocity
		local entered = slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19)
	end

	slot10 = false
	slot11 = nil

	return slot10, slot11
end

slot1.check_inflict_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, damage_type, dest_body)
	slot3 = alive
	slot5 = dest_body
	slot3 = slot3(slot4)

	if slot3 then
		slot5 = dest_body
		slot3 = dest_body.extension
		local body_ext = slot3(slot4)

		if body_ext then
			local damage_ext = body_ext.damage

			if damage_ext then
				slot7 = damage_ext
				slot5 = damage_ext.can_inflict_damage
				slot8 = damage_type
				slot9 = self._unit

				return slot5(slot6, slot7, slot8)
			end
		end
	end

	slot3 = false
	slot4 = false

	return slot3, slot4
end

slot1.can_receive_inflict_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, damage_type, src_body, dest_body, normal, position, direction, velocity)
	slot10 = dest_body
	slot8 = dest_body.extension
	slot8 = slot8(slot9)
	slot8 = slot8.damage
	slot10 = slot8
	slot8 = slot8.enter_inflict_damage
	slot11 = damage_type
	slot12 = self._unit
	slot13 = src_body
	slot14 = normal
	slot15 = position
	slot16 = direction
	slot17 = velocity

	return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16)
end

slot1.enter_inflict_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, damage_type, src_body, dest_body, normal, position, direction, velocity)
	slot10 = dest_body
	slot8 = dest_body.extension
	slot8 = slot8(slot9)
	slot8 = slot8.damage
	slot10 = slot8
	slot8 = slot8.inflict_damage
	slot11 = damage_type
	slot12 = self._unit
	slot13 = src_body
	slot14 = normal
	slot15 = position
	slot16 = direction
	slot17 = velocity

	return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16)
end

slot1.inflict_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, damage_type, src_body, dest_body, normal, pos, dir, velocity)
	slot10 = dest_body
	slot8 = dest_body.extension
	slot8 = slot8(slot9)
	slot8 = slot8.damage
	slot10 = slot8
	slot8 = slot8.exit_inflict_damage
	slot11 = damage_type
	slot12 = src_body
	slot13 = normal
	slot14 = pos
	slot15 = dir
	slot16 = velocity

	slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15)

	return 
end

slot1.exit_inflict_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, direct_attack_unit)
	self._direct_attack_unit = direct_attack_unit

	return 
end

slot1.set_direct_attack_unit = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._direct_attack_unit

	return slot1
end

slot1.get_direct_attack_unit = slot2
slot1 = CoreUnitDamage

function slot2(self, func)
	self._last_body_collision_callback_id = (self._last_body_collision_callback_id or 0) + 1
	self._body_collision_callback_list = self._body_collision_callback_list or {}
	slot2 = self._body_collision_callback_list
	slot3 = self._last_body_collision_callback_id
	slot2[slot3] = func
	slot2 = self._last_body_collision_callback_id

	return slot2
end

slot1.add_body_collision_callback = slot2
slot1 = CoreUnitDamage

function slot2(self, id)
	slot2 = self._body_collision_callback_list

	if slot2 then
		slot2 = self._body_collision_callback_list
		slot3 = nil
		slot2[id] = slot3
	end

	return 
end

slot1.remove_body_collision_callback = slot2
slot1 = CoreUnitDamage

function slot2(self, func)
	self._last_mover_collision_callback_id = (self._last_mover_collision_callback_id or 0) + 1
	self._mover_collision_callback_list = self._mover_collision_callback_list or {}
	slot2 = self._mover_collision_callback_list
	slot3 = self._last_mover_collision_callback_id
	slot2[slot3] = func
	slot2 = self._last_mover_collision_callback_id

	return slot2
end

slot1.add_mover_collision_callback = slot2
slot1 = CoreUnitDamage

function slot2(self, id)
	slot2 = self._mover_collision_callback_list

	if slot2 then
		slot2 = self._mover_collision_callback_list
		slot3 = nil
		slot2[id] = slot3
	end

	return 
end

slot1.remove_mover_collision_callback = slot2
slot1 = CoreUnitDamage

function slot2(self, unit_key, time)
	self._ignore_mover_collision_unit_map = self._ignore_mover_collision_unit_map or {}
	slot3 = self._ignore_mover_collision_unit_map
	slot3[unit_key] = time

	return 
end

slot1.set_ignore_mover_collision_unit = slot2
slot1 = CoreUnitDamage

function slot2(self, body_key, time)
	self._ignore_mover_collision_body_map = self._ignore_mover_collision_body_map or {}
	slot3 = self._ignore_mover_collision_body_map
	slot3[body_key] = time

	return 
end

slot1.set_ignore_mover_collision_body = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = nil
	self._ignore_mover_collision_unit_map = slot1

	return 
end

slot1.clear_ignore_mover_collision_units = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = nil
	self._ignore_mover_collision_body_map = slot1

	return 
end

slot1.clear_ignore_mover_collision_bodies = slot2
slot1 = CoreUnitDamage

function slot2(self, unit_key, time)
	self._ignore_body_collision_unit_map = self._ignore_body_collision_unit_map or {}
	slot3 = self._ignore_body_collision_unit_map
	slot3[unit_key] = time

	return 
end

slot1.set_ignore_body_collision_unit = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = nil
	self._ignore_body_collision_unit_map = slot1

	return 
end

slot1.clear_ignore_body_collision_units = slot2
slot1 = CoreUnitDamage

function slot2(self, ignore)
	if ignore then
		slot2 = true
		self._ignore_mover_on_mover_collisions = slot2
	else
		slot2 = nil
		self._ignore_mover_on_mover_collisions = slot2
	end

	return 
end

slot1.set_ignore_mover_on_mover_collisions = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._ignore_mover_on_mover_collisions
	slot1 = not slot1
	slot1 = not slot1

	return slot1
end

slot1.get_ignore_mover_on_mover_collisions = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._skip_give_body_collision_velocity
	slot1 = not slot1

	return slot1
end

slot1.give_body_collision_velocity = slot2
slot1 = CoreUnitDamage

function slot2(self, give_body_velocity)
	slot2 = not give_body_velocity
	self._skip_give_body_collision_velocity = slot2

	return 
end

slot1.set_give_body_collision_velocity = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._skip_give_mover_collision_velocity
	slot1 = not slot1

	return slot1
end

slot1.give_mover_collision_velocity = slot2
slot1 = CoreUnitDamage

function slot2(self, give_mover_velocity)
	slot2 = not give_mover_velocity
	self._skip_give_mover_collision_velocity = slot2

	return 
end

slot1.set_give_mover_collision_velocity = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._skip_give_body_collision_damage
	slot1 = not slot1

	return slot1
end

slot1.give_body_collision_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, give_body_damage)
	slot2 = not give_body_damage
	self._skip_give_body_collision_damage = slot2

	return 
end

slot1.set_give_body_collision_damage = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._skip_give_mover_collision_damage
	slot1 = not slot1

	return slot1
end

slot1.give_mover_collision_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, give_mover_damage)
	slot2 = not give_mover_damage
	self._skip_give_mover_collision_damage = slot2

	return 
end

slot1.set_give_mover_collision_damage = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._skip_receive_body_collision_damage
	slot1 = not slot1

	return slot1
end

slot1.receive_body_collision_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, receive_body_damage)
	slot2 = not receive_body_damage
	self._skip_receive_body_collision_damage = slot2

	return 
end

slot1.set_receive_body_collision_damage = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot1 = self._skip_receive_mover_collision_damage
	slot1 = not slot1

	return slot1
end

slot1.receive_mover_collision_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, receive_mover_damage)
	slot2 = not receive_mover_damage
	self._skip_receive_mover_collision_damage = slot2

	return 
end

slot1.set_receive_mover_collision_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, time, unit, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity)

	-- Decompilation error in this vicinity:
	slot10 = alive
	slot12 = other_body
	local alive_other_body = slot10(slot11)
	slot13 = other_unit
	slot11 = other_unit.damage
	local damage_ext = slot11(slot12)
end

slot1.can_mover_collide = slot2
slot1 = CoreUnitDamage

function slot2(self, time, tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity)

	-- Decompilation error in this vicinity:
	slot14 = other_unit
	slot12 = other_unit.damage
	local damage_ext = slot12(slot13)
end

slot1.can_body_collide = slot2
slot1 = CoreUnitDamage

function slot2(self, position, body, other_body, other_unit, collision_velocity, normal, is_mover, velocity, other_velocity)
	slot12 = other_unit
	slot10 = other_unit.damage
	local damage_ext = slot10(slot11)
	slot11 = alive
	slot13 = other_body
	slot11 = slot11(slot12)
	local is_other_mover = not slot11

	if damage_ext then
		if is_other_mover then
			slot14 = damage_ext
			slot12 = damage_ext.give_mover_collision_velocity
			slot12 = slot12(slot13)

			if not slot12 then
				slot12 = Vector3
				slot12 = slot12()
				other_velocity = slot12
			end
		else
			slot14 = damage_ext
			slot12 = damage_ext.give_body_collision_velocity
			slot12 = slot12(slot13)

			if not slot12 then
				slot12 = Vector3
				slot12 = slot12()
				other_velocity = slot12
			end
		end
	end

	if is_mover then
		slot14 = other_velocity
		slot12 = other_velocity.normalized
		local other_velocity_dir = slot12(slot13)
		slot15 = other_velocity
		slot13 = other_velocity.length
		local other_velocity_length = slot13(slot14)
		slot14 = math
		slot14 = slot14.clamp
		slot16 = math
		slot16 = slot16.dot
		slot18 = velocity
		slot19 = other_velocity_dir
		slot16 = slot16(slot17, slot18)
		slot17 = 0
		slot18 = other_velocity_length
		slot14 = slot14(slot15, slot16, slot17)
		velocity = other_velocity_dir * slot14
	end

	collision_velocity = velocity - other_velocity
	slot14 = other_velocity
	slot12 = other_velocity.length
	slot12 = slot12(slot13)
	slot15 = velocity
	slot13 = velocity.length
	slot13 = slot13(slot14)

	if slot13 < slot12 then
		collision_velocity = -collision_velocity
	end

	slot14 = collision_velocity
	slot12 = collision_velocity.normalized
	local direction = slot12(slot13)
	slot15 = direction
	slot13 = direction.length
	slot13 = slot13(slot14)

	if slot13 == 0 then
		direction = -normal
	end

	slot15 = self
	slot13 = self.add_angular_velocity
	slot16 = position
	slot17 = direction
	slot18 = body
	slot19 = other_body
	slot20 = other_unit
	slot21 = collision_velocity
	slot22 = is_mover

	return slot13(slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21)
end

slot1.get_collision_velocity = slot2
slot1 = CoreUnitDamage

function slot2(self, position, direction, body, other_body, other_unit, collision_velocity, is_mover)
	slot8 = Vector3
	local angular_velocity_addition = slot8()
	slot9 = alive
	slot11 = body
	slot9 = slot9(slot10)

	if slot9 then
		slot11 = body
		slot9 = body.angular_velocity
		local body_ang_vel = slot9(slot10)
		slot10 = direction * 200
		slot13 = body_ang_vel
		slot11 = body_ang_vel.length
		slot11 = slot11(slot12)
		slot10 = slot10 * slot11
		slot11 = math
		slot11 = slot11.abs
		slot13 = math
		slot13 = slot13.dot
		slot17 = body_ang_vel
		slot15 = body_ang_vel.normalized
		slot15 = slot15(slot16)
		slot16 = direction
		slot11 = slot11(slot13(slot14, slot15))
		slot11 = 1 + slot11
		slot10 = slot10 * slot11
		slot11 = math
		slot11 = slot11.pi
		slot11 = 10 * slot11
		angular_velocity_addition = slot10 / slot11
	end

	slot9 = alive
	slot11 = other_body
	slot9 = slot9(slot10)

	if slot9 then
		slot11 = other_body
		slot9 = other_body.angular_velocity
		local other_body_ang_vel = slot9(slot10)
		slot10 = direction * 200
		slot13 = other_body_ang_vel
		slot11 = other_body_ang_vel.length
		slot11 = slot11(slot12)
		slot10 = slot10 * slot11
		slot11 = math
		slot11 = slot11.abs
		slot13 = math
		slot13 = slot13.dot
		slot17 = other_body_ang_vel
		slot15 = other_body_ang_vel.normalized
		slot15 = slot15(slot16)
		slot16 = direction
		slot11 = slot11(slot13(slot14, slot15))
		slot11 = 1 + slot11
		slot10 = slot10 * slot11
		slot11 = math
		slot11 = slot11.pi
		slot11 = 10 * slot11
		slot10 = slot10 / slot11
		angular_velocity_addition = angular_velocity_addition + slot10
		slot10 = math
		slot10 = slot10.clamp
		slot14 = angular_velocity_addition
		slot12 = angular_velocity_addition.length
		slot12 = slot12(slot13)
		slot13 = 0
		slot14 = 200
		slot10 = slot10(slot11, slot12, slot13)
		angular_velocity_addition = direction * slot10
	end

	slot9 = collision_velocity + angular_velocity_addition
	slot10 = direction

	return slot9, slot10
end

slot1.add_angular_velocity = slot2
slot1 = CoreUnitDamage

function slot2(self, tag, body, other_unit, other_body, position, normal, collision_velocity, is_mover_collision)
	slot9 = math
	slot9 = slot9.clamp
	slot13 = collision_velocity
	slot11 = collision_velocity.length
	slot11 = slot11(slot12)
	slot11 = slot11 - 400
	slot11 = slot11 / 100
	slot12 = 0
	slot13 = 75

	return slot9(slot10, slot11, slot12)
end

slot1.get_collision_damage = slot2
slot1 = CoreUnitDamage

function slot2(self, tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity)
	slot11 = TimerManager
	slot13 = slot11
	slot11 = slot11.game
	slot11 = slot11(slot12)
	slot13 = slot11
	slot11 = slot11.time
	local time = slot11(slot12)
	local new_velocity, direction, damage = nil
	slot17 = self
	slot15 = self.can_body_collide
	slot18 = time
	slot19 = tag
	slot20 = unit
	slot21 = body
	slot22 = other_unit
	slot23 = other_body
	slot24 = position
	slot25 = normal
	slot26 = collision_velocity
	slot27 = velocity
	slot28 = other_velocity
	slot15 = slot15(slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27)

	if slot15 then
		slot17 = self
		slot15 = self.get_collision_velocity
		slot18 = position
		slot19 = body
		slot20 = other_body
		slot21 = other_unit
		slot22 = collision_velocity
		slot23 = normal
		slot24 = false
		slot25 = velocity
		slot26 = other_velocity
		slot15, slot16 = slot15(slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25)
		direction = slot16
		new_velocity = slot15
		slot17 = self
		slot15 = self.get_collision_damage
		slot18 = tag
		slot19 = body
		slot20 = other_unit
		slot21 = other_body
		slot22 = position
		slot23 = normal
		slot24 = new_velocity
		slot25 = false
		slot15 = slot15(slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24)
		damage = slot15
		slot17 = self
		slot15 = self.collision
		slot18 = tag
		slot19 = unit
		slot20 = body
		slot21 = other_unit
		slot22 = other_body
		slot23 = position
		slot24 = normal
		slot25 = direction
		slot26 = damage
		slot27 = new_velocity
		slot28 = false

		slot15(slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27)
	end

	slot15 = self._body_collision_callback_list

	if slot15 then
		slot15 = pairs
		slot17 = self._body_collision_callback_list
		slot15, slot16, slot17 = slot15(slot16)

		for _, func in slot15, slot16, slot17 do
			slot20 = func
			slot22 = tag
			slot23 = unit
			slot24 = body
			slot25 = other_unit
			slot26 = other_body
			slot27 = position
			slot28 = normal
			slot29 = collision_velocity
			slot30 = velocity
			slot31 = other_velocity
			slot32 = new_velocity
			slot33 = direction
			slot34 = damage

			slot20(slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29, slot30, slot31, slot32, slot33)
		end
	end

	return 
end

slot1.body_collision_callback = slot2
slot1 = CoreUnitDamage

function slot2(self, unit, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity)
	slot9 = TimerManager
	slot11 = slot9
	slot9 = slot9.game
	slot9 = slot9(slot10)
	slot11 = slot9
	slot9 = slot9.time
	local time = slot9(slot10)
	local new_velocity, direction, damage = nil
	slot15 = self
	slot13 = self.can_mover_collide
	slot16 = time
	slot17 = unit
	slot18 = other_unit
	slot19 = other_body
	slot20 = position
	slot21 = normal
	slot22 = collision_velocity
	slot23 = velocity
	slot24 = other_velocity
	slot13 = slot13(slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23)

	if slot13 then
		slot15 = self
		slot13 = self.get_collision_velocity
		slot16 = position
		slot17 = nil
		slot18 = other_body
		slot19 = other_unit
		slot20 = collision_velocity
		slot21 = normal
		slot22 = true
		slot23 = velocity
		slot24 = other_velocity
		slot13, slot14 = slot13(slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23)
		direction = slot14
		new_velocity = slot13
		slot15 = self
		slot13 = self.get_collision_damage
		slot16, slot17 = nil
		slot18 = other_unit
		slot19 = other_body
		slot20 = position
		slot21 = normal
		slot22 = new_velocity
		slot23 = true
		slot13 = slot13(slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22)
		damage = slot13
		slot13 = 0

		if slot13 < damage then
			slot13 = alive
			slot15 = other_body
			slot13 = slot13(slot14)

			if slot13 then
				slot15 = other_body
				slot13 = other_body.constrained_bodies
				local body_list = slot13(slot14)
				slot14 = table
				slot14 = slot14.insert
				slot16 = body_list
				slot17 = other_body

				slot14(slot15, slot16)

				slot14 = ipairs
				slot16 = body_list
				slot14, slot15, slot16 = slot14(slot15)

				for _, body in slot14, slot15, slot16 do
					slot24 = body
					slot23 = time + (self._mover_collision_ignore_duration or 1)

					self.set_ignore_mover_collision_body(slot20, self, body.key(slot23))
				end
			else
				slot13 = alive
				slot15 = other_unit
				slot13 = slot13(slot14)

				if slot13 then
					slot18 = other_unit
					slot17 = time + (self._mover_collision_ignore_duration or 1)

					self.set_ignore_mover_collision_unit(slot14, self, other_unit.key(slot17))
				end
			end
		end

		slot15 = self
		slot13 = self.collision
		slot16 = nil
		slot17 = unit
		slot18 = nil
		slot19 = other_unit
		slot20 = other_body
		slot21 = position
		slot22 = normal
		slot23 = direction
		slot24 = damage
		slot25 = new_velocity
		slot26 = true

		slot13(slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25)
	end

	slot13 = self._mover_collision_callback_list

	if slot13 then
		slot13 = pairs
		slot15 = self._mover_collision_callback_list
		slot13, slot14, slot15 = slot13(slot14)

		for _, func in slot13, slot14, slot15 do
			slot18 = func
			slot20 = unit
			slot21 = other_unit
			slot22 = other_body
			slot23 = position
			slot24 = normal
			slot25 = collision_velocity
			slot26 = velocity
			slot27 = other_velocity
			slot28 = new_velocity
			slot29 = direction
			slot30 = damage

			slot18(slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27, slot28, slot29)
		end
	end

	return 
end

slot1.mover_collision_callback = slot2
slot1 = CoreUnitDamage

function slot2(self, tag, unit, body, other_unit, other_body, position, normal, direction, damage, collision_velocity, is_mover_collision)
	slot12 = 0

	if slot12 < damage then
		if body then
			slot14 = body
			slot12 = body.extension
			local body_ext = slot12(slot13)

			if body_ext then
				slot13 = body_ext.damage

				if slot13 then
					slot13 = body_ext.damage
					slot15 = slot13
					slot13 = slot13.damage_collision
					slot16 = other_unit
					slot17 = normal
					slot18 = position
					slot19 = direction
					slot20 = damage
					slot21 = collision_velocity

					slot13(slot14, slot15, slot16, slot17, slot18, slot19, slot20)
				end
			end
		else
			slot14 = self
			slot12 = self.damage_collision
			slot15 = other_unit
			slot16 = body
			slot17 = normal
			slot18 = position
			slot19 = direction
			slot20 = damage
			slot21 = collision_velocity

			slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20)
		end
	end

	return 
end

slot1.collision = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot3 = self
	slot1 = self.toggle_debug_collision_body

	slot1(slot2)

	slot3 = self
	slot1 = self.toggle_debug_collision_mover

	slot1(slot2)

	return 
end

slot1.toggle_debug_collision_all = slot2
slot1 = CoreUnitDamage

function slot2(self, enabled)
	slot4 = self
	slot2 = self.toggle_debug_collision_body
	slot5 = enabled

	slot2(slot3, slot4)

	slot4 = self
	slot2 = self.toggle_debug_collision_mover
	slot5 = enabled

	slot2(slot3, slot4)

	return 
end

slot1.set_debug_collision_all = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot3 = self
	slot1 = self.set_debug_collision_body
	slot4 = self._debug_collision_body_id
	slot4 = not slot4

	slot1(slot2, slot3)

	return 
end

slot1.toggle_debug_collision_body = slot2
slot1 = CoreUnitDamage

function slot2(self, enabled)
	slot2 = self._debug_collision_body_id
	slot2 = not slot2
	slot3 = not enabled

	if slot2 ~= slot3 then
		if enabled then
			slot4 = self
			slot2 = self.add_body_collision_callback
			slot5 = callback
			slot7 = self
			slot8 = self
			slot9 = "debug_collision_body"
			slot2 = slot2(slot3, slot5(slot6, slot7, slot8))
			self._debug_collision_body_id = slot2
		else
			slot4 = self
			slot2 = self.remove_body_collision_callback
			slot5 = self._debug_collision_body_id

			slot2(slot3, slot4)

			slot2 = nil
			self._debug_collision_body_id = slot2
		end

		slot2 = cat_debug
		slot4 = "debug"
		slot5 = "Body collision debugging "
		slot6 = tostring
		slot8 = self._unit
		slot6 = slot6(slot7)
		slot7 = " enabled: "
		slot8 = tostring
		slot10 = not enabled
		slot10 = not slot10
		slot8 = slot8(slot9)
		slot5 = slot5 .. slot6 .. slot7 .. slot8

		slot2(slot3, slot4)
	end

	return 
end

slot1.set_debug_collision_body = slot2
slot1 = CoreUnitDamage

function slot2(self)
	slot3 = self
	slot1 = self.set_debug_collision_mover
	slot4 = self._debug_collision_mover_id
	slot4 = not slot4

	slot1(slot2, slot3)

	return 
end

slot1.toggle_debug_collision_mover = slot2
slot1 = CoreUnitDamage

function slot2(self, enabled)
	slot2 = self._debug_collision_mover_id
	slot2 = not slot2
	slot3 = not enabled

	if slot2 ~= slot3 then
		if enabled then
			slot4 = self
			slot2 = self.add_mover_collision_callback
			slot5 = callback
			slot7 = self
			slot8 = self
			slot9 = "debug_collision_mover"
			slot2 = slot2(slot3, slot5(slot6, slot7, slot8))
			self._debug_collision_mover_id = slot2
		else
			slot4 = self
			slot2 = self.remove_mover_collision_callback
			slot5 = self._debug_collision_mover_id

			slot2(slot3, slot4)

			slot2 = nil
			self._debug_collision_mover_id = slot2
		end

		slot2 = cat_debug
		slot4 = "debug"
		slot5 = "Mover collision debugging "
		slot6 = tostring
		slot8 = self._unit
		slot6 = slot6(slot7)
		slot7 = " enabled: "
		slot8 = tostring
		slot10 = not enabled
		slot10 = not slot10
		slot8 = slot8(slot9)
		slot5 = slot5 .. slot6 .. slot7 .. slot8

		slot2(slot3, slot4)
	end

	return 
end

slot1.set_debug_collision_mover = slot2
slot1 = CoreUnitDamage

function slot2(self, tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage)

	-- Decompilation error in this vicinity:
	slot14 = TimerManager
	slot16 = slot14
	slot14 = slot14.game
	slot14 = slot14(slot15)
	slot16 = slot14
	slot14 = slot14.time
	local time = slot14(slot15)
	slot15 = cat_debug
	slot17 = "debug"
	slot18 = string
	slot18 = slot18.format
	slot20 = "[B %g] Velocity: %g, Damage: %g, Ignored: %s"
	slot21 = time

	return 
end

slot1.debug_collision_body = slot2
slot1 = CoreUnitDamage

function slot2(self, unit, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage)

	-- Decompilation error in this vicinity:
	slot12 = TimerManager
	slot14 = slot12
	slot12 = slot12.game
	slot12 = slot12(slot13)
	slot14 = slot12
	slot12 = slot12.time
	local time = slot12(slot13)
	slot13 = cat_debug
	slot15 = "debug"
	slot16 = string
	slot16 = slot16.format
	slot18 = "[M %g] Velocity: %g, Damage: %g, Ignored: %s"
	slot19 = time

	return 
end

slot1.debug_collision_mover = slot2
slot1 = CoreUnitDamage
slot2 = "debug_draw_velocity"

function slot3(self, index, label, position, velocity, red, green, blue)
	slot8 = managers
	slot8 = slot8.debug
	slot8 = slot8.gui
	slot10 = slot8
	slot8 = slot8.set_color
	slot11 = index
	slot12 = red
	slot13 = green
	slot14 = blue

	slot8(slot9, slot10, slot11, slot12, slot13)

	if velocity then
		slot8 = managers
		slot8 = slot8.debug
		slot8 = slot8.gui
		slot10 = slot8
		slot8 = slot8.set
		slot11 = index
		slot12 = string
		slot12 = slot12.format
		slot14 = "%s: %g   (%g, %g, %g)"
		slot15 = label
		slot18 = velocity
		slot16 = velocity.length
		slot16 = slot16(slot17)
		slot17 = velocity.x
		slot18 = velocity.y
		slot19 = velocity.z

		slot8(slot9, slot10, slot12(slot13, slot14, slot15, slot16, slot17, slot18))
	else
		slot8 = managers
		slot8 = slot8.debug
		slot8 = slot8.gui
		slot10 = slot8
		slot8 = slot8.set
		slot11 = index
		slot12 = string
		slot12 = slot12.format
		slot14 = "%s: nil"
		slot15 = label

		slot8(slot9, slot10, slot12(slot13, slot14))
	end

	slot8 = managers
	slot8 = slot8.debug
	slot8 = slot8.pos
	slot10 = slot8
	slot8 = slot8.set
	slot11 = 1
	slot12 = Vector3
	slot14 = 0
	slot15 = 0
	slot16 = index - 2
	slot12 = slot12(slot13, slot14, slot15)
	slot12 = position + slot12
	slot13 = "debug_collision_body_"
	slot14 = index - 1
	slot13 = slot13 .. slot14
	slot14 = red
	slot15 = green
	slot16 = blue

	slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15)

	slot8 = managers
	slot8 = slot8.debug
	slot8 = slot8.pos
	slot10 = slot8
	slot8 = slot8.set
	slot11 = 2
	slot12 = Vector3
	slot14 = 0
	slot15 = 0
	slot16 = index - 2
	slot12 = slot12(slot13, slot14, slot15)
	slot12 = position + slot12

	if not velocity then
		slot13 = Vector3
		slot13 = slot13()
	end

	slot12 = slot12 + slot13
	slot13 = "debug_collision_body_"
	slot14 = index - 1
	slot13 = slot13 .. slot14
	slot14 = red
	slot15 = green
	slot16 = blue

	slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15)

	return 
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "outside_worlds_bounding_box"

function slot3(self)
	slot1 = alive
	slot3 = self._unit
	slot1 = slot1(slot2)

	if slot1 then
		slot3 = self
		slot1 = self.kill
		slot4 = "collision"
		slot5 = self._unit
		slot6 = nil
		slot7 = math
		slot7 = slot7.UP
		slot8 = self._unit
		slot10 = slot8
		slot8 = slot8.position
		slot8 = slot8(slot9)
		slot9 = math
		slot9 = slot9.DOWN
		slot10 = 0
		slot11 = self._unit
		slot13 = slot11
		slot11 = slot11.sampled_velocity

		slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot11(slot12))
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "report_enemy_killed"

function slot3(self)
	slot1 = self._enemy_killed_reported

	if not slot1 then
		slot1 = self._unit
		slot3 = slot1
		slot1 = slot1.enemy_data
		local enemy_data = slot1(slot2)

		if enemy_data then
			local group = enemy_data.enemy_group

			if group then
				slot5 = group
				slot3 = group.unit_killed

				slot3(slot4)

				slot3 = true
				self._enemy_killed_reported = slot3
			end
		end
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "kill"

function slot3(self, endurance_type, attack_unit, dest_body, normal, position, direction, damage, velocity)
	slot9 = alive
	slot11 = self._unit
	slot9 = slot9(slot10)

	if slot9 then
		slot11 = self
		slot9 = self.report_enemy_killed

		slot9(slot10)
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "remove"

function slot3(self)
	slot1 = alive
	slot3 = self._unit
	slot1 = slot1(slot2)

	if slot1 then
		slot3 = self
		slot1 = self.report_enemy_killed

		slot1(slot2)

		slot1 = self._unit
		slot3 = slot1
		slot1 = slot1.set_slot
		slot4 = 0

		slot1(slot2, slot3)
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "add_inherit_destroy_unit"

function slot3(self, unit)
	self._inherit_destroy_unit_list = self._inherit_destroy_unit_list or {}
	slot2 = table
	slot2 = slot2.insert
	slot4 = self._inherit_destroy_unit_list
	slot5 = unit

	slot2(slot3, slot4)

	return 
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "has_sequence"

function slot3(self, sequence_name)
	slot2 = self._unit_element

	if slot2 then
		slot2 = self._unit_element
		slot4 = slot2
		slot2 = slot2.has_sequence
		slot5 = sequence_name
		slot2 = slot2(slot3, slot4)
	end

	return slot2
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "set_variable"

function slot3(self, key, val)
	self._variables = self._variables or {}
	slot3 = self._variables
	slot3[key] = val
	slot3 = self._variables

	return slot3
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "anim_clbk_set_sequence_block_state"

function slot3(self, unit, state)
	if state == "true" then
		state = true
	else
		state = false
	end

	slot5 = self
	slot3 = self.set_sequence_block_state
	slot6 = state

	slot3(slot4, slot5)

	return 
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "set_sequence_block_state"

function slot3(self, state)
	self._sequence_block_state = state

	if not state then
		slot4 = self
		slot2 = self._process_sequence_queue

		slot2(slot3)
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "_process_sequence_queue"

function slot3(self)

	-- Decompilation error in this vicinity:
	slot1 = self._sequence_block_state
	slot1 = self._sequence_block_state

	while not slot1 and slot1 and slot1 do
		slot1 = table
		slot1 = slot1.remove
		slot3 = self._queued_sequences
		slot4 = 1
		local front_seq = slot1(slot2, slot3)
		slot4 = self
		slot2 = self.run_sequence_simple
		slot5 = front_seq.name
		slot6 = front_seq.params

		slot2(slot3, slot4, slot5)
	end

	slot1 = next
	slot3 = self._queued_sequences
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = nil
		self._queued_sequences = slot1
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreUnitDamage
slot2 = "add_queued_sequence"

function slot3(self, name, params)
	slot3 = self._sequence_block_state

	if not slot3 then
		slot5 = self
		slot3 = self.run_sequence_simple
		slot6 = name
		slot7 = params

		slot3(slot4, slot5, slot6)

		return 
	end

	self._queued_sequences = self._queued_sequences or {}
	local new_entry = {
		name = name,
		params = params
	}
	slot7 = new_entry

	table.insert(slot5, self._queued_sequences)

	return 
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage

if not slot1 then
	slot1 = class
	slot1 = slot1()
end

CoreBodyDamage = slot1
slot1 = CoreBodyDamage

function slot2(self, unit, unit_extension, body, body_element)
	self._unit = unit
	self._unit_extension = unit_extension
	self._body = body
	slot5 = self._unit
	slot7 = slot5
	slot5 = slot5.get_body_index
	slot8 = self._body
	slot10 = slot8
	slot8 = slot8.name
	slot5 = slot5(slot6, slot8(slot9))
	self._body_index = slot5
	self._body_element = body_element
	slot7 = unit_extension
	slot5 = unit_extension.get_unit_element
	slot5 = slot5(slot6)
	self._unit_element = slot5
	slot5 = {}
	self._endurance = slot5
	slot5 = {}
	self._damage = slot5

	if body_element then
		slot5 = pairs
		slot7 = body_element._first_endurance
		slot5, slot6, slot7 = slot5(slot6)

		for k, v in slot5, slot6, slot7 do
			if k == "collision" then
				slot10 = self._body
				slot12 = slot10
				slot10 = slot10.set_collision_script_tag
				slot13 = Idstring
				slot15 = "core"

				slot10(slot11, slot13(slot14))
			end

			slot10 = self._endurance
			slot10[k] = v
			slot10 = self._damage
			slot11 = 0
			slot10[k] = slot11
		end
	end

	slot5 = self._body_element

	if slot5 then
		slot5 = self._body_element
		slot7 = slot5
		slot5 = slot5.get_inflict_element_list
		local inflict_element_list = slot5(slot6)

		if inflict_element_list then
			slot6 = get_core_or_local
			slot8 = "InflictUpdator"
			local updator_class = slot6(slot7)
			slot7 = pairs
			slot9 = inflict_element_list
			slot7, slot8, slot9 = slot7(slot8)

			for damage_type, inflict_element in slot7, slot8, slot9 do
				slot12 = updator_class.INFLICT_UPDATOR_DAMAGE_TYPE_MAP
				local updator_type_class = slot12[damage_type]

				if updator_type_class then
					slot15 = updator_type_class
					slot13 = updator_type_class.new
					slot16 = unit
					slot17 = body
					slot18 = self
					slot19 = inflict_element
					slot20 = self._unit_element
					local updator = slot13(slot14, slot15, slot16, slot17, slot18, slot19)
					slot16 = updator
					slot14 = updator.is_valid
					slot14 = slot14(slot15)

					if slot14 then
						self._inflict_updator_map = self._inflict_updator_map or {}
						slot14 = self._inflict_updator_map
						slot14[damage_type] = updator
					end
				else
					local inflict_data = {}
					self._inflict = self._inflict or {}
					self._inflict[damage_type] = inflict_data
					slot16 = inflict_element
					inflict_data.damage = inflict_element.get_damage(slot15) or 0
					slot16 = inflict_element
					inflict_data.interval = inflict_element.get_interval(slot15) or 0
					slot16 = inflict_element
					inflict_data.instant = inflict_element.get_instant(slot15)
					slot16 = inflict_element
					inflict_data.enabled = inflict_element.get_enabled(slot15)
					inflict_data = {}
					self._original_inflict = self._original_inflict or {}
					self._original_inflict[damage_type] = inflict_data
					slot14 = pairs
					slot16 = inflict_data
					slot14, slot15, slot16 = slot14(slot15)

					for k, v in slot14, slot15, slot16 do
						inflict_data[k] = v
					end

					self._inflict_time = self._inflict_time or {}
					self._inflict_time[damage_type] = {}
					self._run_exit_inflict_sequences = self._run_exit_inflict_sequences or {}
					slot17 = inflict_element
					self._run_exit_inflict_sequences[damage_type] = 0 < inflict_element.exit_sequence_count(slot16)
				end
			end
		end
	end

	return 
end

slot1.init = slot2
slot1 = CoreBodyDamage
slot2 = "set_damage"

function slot3(self, damage_type, damage)
	slot3 = self._damage
	slot3[damage_type] = damage
	slot3 = self._body_element
	slot3 = slot3._first_endurance
	local element = slot3[damage_type]

	while element and slot4 <= slot5 do
		slot4 = element._next
		element = slot4[damage_type]
	end

	slot4 = self._endurance
	slot4[damage_type] = element

	return 
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "get_body"

function slot3(self)
	slot1 = self._body

	return slot1
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "get_inflict_updator_map"

function slot3(self)
	slot1 = self._inflict_updator_map

	return slot1
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "get_endurance_map"

function slot3(self)
	slot1 = self._endurance

	return slot1
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "get_inflict_time"

function slot3(self, damage_type, src_unit)
	slot3 = self._inflict_time
	slot3 = slot3[damage_type]
	slot3 = slot3[src_unit]

	return slot3
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "can_inflict_damage"

function slot3(self, damage_type, src_unit)
	slot3 = self._inflict

	if slot3 then
		slot3 = self._inflict
		slot3 = slot3[damage_type]

		if slot3 then
			slot3 = self._inflict
			slot3 = slot3[damage_type]
			slot3 = slot3.enabled

			if slot3 then
				slot3 = self._inflict_time
				slot3 = slot3[damage_type]
				slot6 = src_unit
				slot4 = src_unit.key
				slot4 = slot4(slot5)
				local last_time = slot3[slot4]

				if last_time then
					slot7 = TimerManager
					slot7 = TimerManager.game(slot6)
					local delayed = TimerManager.game(slot6).time(slot6) < last_time + self._inflict[damage_type].interval
					slot5 = not delayed
					slot6 = delayed

					return slot5, slot6
				else
					slot4 = true
					slot5 = false

					return slot4, slot5
				end
			end
		end
	end

	slot3 = false
	slot4 = false

	return slot3, slot4
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage

function slot2(self, damage_type, src_unit, src_body, normal, position, direction, velocity)
	slot10 = src_unit
	slot8 = src_unit.key
	local unit_key = slot8(slot9)
	slot9 = self._inflict_time
	local list = slot9[damage_type]
	slot10 = list[unit_key]

	if not slot10 then
		slot10 = TimerManager
		slot12 = slot10
		slot10 = slot10.game
		slot10 = slot10(slot11)
		slot12 = slot10
		slot10 = slot10.time
		slot10 = slot10(slot11)
		list[unit_key] = slot10
		slot10 = self._inflict
		slot10 = slot10[damage_type]
		local damage = slot10.damage
		slot11 = CoreSequenceManager
		slot11 = slot11.SequenceEnvironment
		slot13 = slot11
		slot11 = slot11.new
		slot14 = damage_type
		slot15 = src_unit
		slot16 = self._unit
		slot17 = self._body
		slot18 = normal
		slot19 = position
		slot20 = direction
		slot21 = damage
		slot22 = velocity
		slot23 = nil
		slot24 = self._unit_element
		local env = slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23)
		slot12 = self._body_element
		slot14 = slot12
		slot12 = slot12.activate_inflict_enter
		slot15 = env

		slot12(slot13, slot14)

		slot12 = true

		return slot12
	else
		slot10 = false

		return slot10
	end

	return 
end

slot1.enter_inflict_damage = slot2
slot1 = CoreBodyDamage

function slot2(self, damage_type, src_body, normal, pos, dir, velocity)
	slot7 = alive
	slot9 = src_body
	slot7 = slot7(slot8)

	if slot7 then
		slot9 = src_body
		slot7 = src_body.unit
		local src_unit = slot7(slot8)
		slot10 = src_unit
		slot8 = src_unit.key
		local unit_key = slot8(slot9)
		slot9 = self._inflict_time
		local list = slot9[damage_type]
		slot10 = list[unit_key]

		if slot10 then
			slot10 = nil
			list[unit_key] = slot10
			slot10 = self._run_exit_inflict_sequences

			if slot10 then
				slot10 = self._run_exit_inflict_sequences
				slot10 = slot10[damage_type]

				if slot10 then
					slot10 = CoreSequenceManager
					slot10 = slot10.SequenceEnvironment
					slot12 = slot10
					slot10 = slot10.new
					slot13 = damage_type
					slot14 = src_unit
					slot15 = self._unit
					slot16 = self._body
					slot17 = normal
					slot18 = pos
					slot19 = dir
					slot20 = 0
					slot21 = velocity
					slot22 = nil
					slot23 = self._unit_element
					local env = slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22)
					slot11 = self._body_element
					slot13 = slot11
					slot11 = slot11.activate_inflict_exit
					slot14 = env

					slot11(slot12, slot13)
				end
			end
		end
	end

	return 
end

slot1.exit_inflict_damage = slot2
slot1 = CoreBodyDamage

function slot2(self, damage_type, src_unit, src_body, normal, position, direction, velocity)
	slot10 = src_unit
	slot8 = src_unit.key
	local unit_key = slot8(slot9)
	slot9 = self._inflict_time
	slot9 = slot9[damage_type]
	slot10 = TimerManager
	slot12 = slot10
	slot10 = slot10.game
	slot10 = slot10(slot11)
	slot12 = slot10
	slot10 = slot10.time
	slot10 = slot10(slot11)
	slot9[unit_key] = slot10
	slot9 = self._inflict
	slot9 = slot9[damage_type]
	local damage = slot9.damage
	slot10 = CoreSequenceManager
	slot10 = slot10.SequenceEnvironment
	slot12 = slot10
	slot10 = slot10.new
	slot13 = damage_type
	slot14 = src_unit
	slot15 = self._unit
	slot16 = self._body
	slot17 = normal
	slot18 = position
	slot19 = direction
	slot20 = damage
	slot21 = velocity
	slot22 = nil
	slot23 = self._unit_element
	local env = slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22)
	slot11 = self._body_element
	slot13 = slot11
	slot11 = slot11.activate_inflict_damage
	slot14 = env

	slot11(slot12, slot13)

	slot13 = src_body
	slot11 = src_body.extension
	slot11 = slot11(slot12)
	local damage_ext = slot11.damage
	slot12 = "damage_"
	slot13 = damage_type
	slot12 = slot12 .. slot13
	slot12 = damage_ext[slot12]
	slot14 = damage_ext
	slot15 = self._unit
	slot16 = normal
	slot17 = position
	slot18 = direction
	slot19 = damage
	slot20 = velocity

	return slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19)
end

slot1.inflict_damage = slot2
slot1 = CoreBodyDamage

function slot2(self, attack_unit, normal, position, direction, damage, unevadable)
	slot9 = self
	slot7 = self.damage_endurance
	slot10 = "damage"
	slot11 = attack_unit
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = Vector3
	slot18 = 0
	slot19 = 0
	slot20 = 0
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot16(slot17, slot18, slot19))
	damage = slot7
	slot7 = self._unit_extension
	slot9 = slot7
	slot7 = slot7.damage_damage
	slot10 = attack_unit
	slot11 = self._body
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = unevadable

	return slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
end

slot1.damage_damage = slot2
slot1 = CoreBodyDamage

function slot2(self, attack_unit, normal, position, direction, damage, unevadable)
	slot9 = self
	slot7 = self.damage_endurance
	slot10 = "bullet"
	slot11 = attack_unit
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = Vector3
	slot18 = 0
	slot19 = 0
	slot20 = 0
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot16(slot17, slot18, slot19))
	damage = slot7
	slot7 = self._unit_extension
	slot9 = slot7
	slot7 = slot7.damage_bullet
	slot10 = attack_unit
	slot11 = self._body
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = unevadable

	return slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
end

slot1.damage_bullet = slot2
slot1 = CoreBodyDamage

function slot2(self, attack_unit, normal, position, direction, damage, unevadable)
	slot9 = self
	slot7 = self.damage_endurance
	slot10 = "lock"
	slot11 = attack_unit
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = Vector3
	slot18 = 0
	slot19 = 0
	slot20 = 0
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot16(slot17, slot18, slot19))
	damage = slot7
	slot7 = self._unit_extension
	slot9 = slot7
	slot7 = slot7.damage_lock
	slot10 = attack_unit
	slot11 = self._body
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = unevadable

	return slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
end

slot1.damage_lock = slot2
slot1 = CoreBodyDamage

function slot2(self, attack_unit, normal, position, direction, damage, armor_piercing)
	if armor_piercing then
		slot9 = self
		slot7 = self.damage_armor_piercing
		slot10 = attack_unit
		slot11 = normal
		slot12 = position
		slot13 = direction
		slot14 = damage

		return slot7(slot8, slot9, slot10, slot11, slot12, slot13)
	end

	slot9 = self
	slot7 = self.damage_endurance
	slot10 = "explosion"
	slot11 = attack_unit
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = Vector3
	slot18 = 0
	slot19 = 0
	slot20 = 0
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot16(slot17, slot18, slot19))
	damage = slot7
	slot7 = false
	slot8 = 0

	return slot7, slot8
end

slot1.damage_explosion = slot2
slot1 = CoreBodyDamage

function slot2(self, attack_unit, normal, position, direction, damage, velocity)
	slot9 = self
	slot7 = self.damage_endurance
	slot10 = "collision"
	slot11 = attack_unit
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = velocity
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
	damage = slot7
	slot7 = self._unit_extension
	slot9 = slot7
	slot7 = slot7.damage_collision
	slot10 = attack_unit
	slot11 = self._body
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = velocity

	return slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
end

slot1.damage_collision = slot2
slot1 = CoreBodyDamage

function slot2(self, attack_unit, normal, position, direction, damage)
	slot8 = self
	slot6 = self.damage_endurance
	slot9 = "melee"
	slot10 = attack_unit
	slot11 = normal
	slot12 = position
	slot13 = direction
	slot14 = damage
	slot15 = Vector3
	slot17 = 0
	slot18 = 0
	slot19 = 0
	slot6 = slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot15(slot16, slot17, slot18))
	damage = slot6
	slot6 = self._unit_extension
	slot8 = slot6
	slot6 = slot6.damage_melee
	slot9 = attack_unit
	slot10 = self._body
	slot11 = normal
	slot12 = position
	slot13 = direction
	slot14 = damage

	return slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13)
end

slot1.damage_melee = slot2
slot1 = CoreBodyDamage

function slot2(self, attack_unit, normal, position, direction, damage)
	slot8 = self
	slot6 = self.damage_endurance
	slot9 = "electricity"
	slot10 = attack_unit
	slot11 = normal
	slot12 = position
	slot13 = direction
	slot14 = damage
	slot15 = Vector3
	slot17 = 0
	slot18 = 0
	slot19 = 0
	slot6 = slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot15(slot16, slot17, slot18))
	damage = slot6
	slot6 = self._unit_extension
	slot8 = slot6
	slot6 = slot6.damage_electricity
	slot9 = attack_unit
	slot10 = self._body
	slot11 = normal
	slot12 = position
	slot13 = direction
	slot14 = damage

	return slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13)
end

slot1.damage_electricity = slot2
slot1 = CoreBodyDamage

function slot2(self, attack_unit, normal, position, direction, damage, velocity)
	slot9 = self
	slot7 = self.damage_endurance
	slot10 = "fire"
	slot11 = attack_unit
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = velocity
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
	damage = slot7
	slot7 = self._unit_extension
	slot9 = slot7
	slot7 = slot7.damage_fire
	slot10 = attack_unit
	slot11 = self._body
	slot12 = normal
	slot13 = position
	slot14 = direction
	slot15 = damage
	slot16 = velocity

	return slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
end

slot1.damage_fire = slot2
slot1 = CoreBodyDamage

function slot2(self, attack_unit, normal, position, direction, damage)
	slot8 = self
	slot6 = self.damage_endurance
	slot9 = "armor_piercing"
	slot10 = attack_unit
	slot11 = normal
	slot12 = position
	slot13 = direction
	slot14 = damage
	slot15 = Vector3
	slot17 = 0
	slot18 = 0
	slot19 = 0
	slot6 = slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot15(slot16, slot17, slot18))
	damage = slot6
	slot6 = false
	slot7 = 0

	return slot6, slot7
end

slot1.damage_armor_piercing = slot2
slot1 = CoreBodyDamage

function slot2(self, endurance_type, attack_unit, normal, position, direction, damage, velocity)
	slot8 = "damage_"
	slot9 = endurance_type
	slot8 = slot8 .. slot9
	local damage_func = self[slot8]

	if damage_func then
		slot9 = damage_func
		slot11 = self
		slot12 = attack_unit
		slot13 = normal
		slot14 = position
		slot15 = direction
		slot16 = damage
		slot17 = velocity

		return slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16)
	else
		slot9 = Application
		slot11 = slot9
		slot9 = slot9.error
		slot12 = "Unit \""
		slot13 = tostring
		slot15 = self._unit
		slot17 = slot15
		slot15 = slot15.name
		slot13 = slot13(slot15(slot16))
		slot14 = "\" doesn't have a \"damage_"
		slot15 = tostring
		slot17 = endurance_type
		slot15 = slot15(slot16)
		slot16 = "\"-function on its body damage extension."
		slot12 = slot12 .. slot13 .. slot14 .. slot15 .. slot16

		slot9(slot10, slot11)

		slot9 = false
		slot10 = nil

		return slot9, slot10
	end

	return 
end

slot1.damage_by_area = slot2
slot1 = CoreBodyDamage

function slot2(self, effect_type, attack_unit, normal, position, direction, velocity, params)
	slot8 = self._unit_extension
	slot10 = slot8
	slot8 = slot8.damage_effect
	slot11 = effect_type
	slot12 = attack_unit
	slot13 = self._body
	slot14 = normal
	slot15 = position
	slot16 = direction
	slot17 = velocity
	slot18 = params

	return slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)
end

slot1.damage_effect = slot2
slot1 = CoreBodyDamage
slot2 = "endurance_exists"

function slot3(self, endurance_type)
	return self._endurance[endurance_type] ~= nil
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "damage_endurance"

function slot3(self, endurance_type, attack_unit, normal, position, direction, damage, velocity)
	slot8 = self._body_element

	if slot8 then
		slot8 = self._body_element
		slot8 = slot8._damage_multiplier
		damage = damage * slot8
	end

	slot8 = self._endurance
	slot8 = slot8[endurance_type]

	if slot8 then
		slot8 = CoreSequenceManager
		slot8 = slot8.SequenceEnvironment
		slot10 = slot8
		slot8 = slot8.new
		slot11 = endurance_type
		slot12 = attack_unit
		slot13 = self._unit
		slot14 = self._body
		slot15 = normal
		slot16 = position
		slot17 = direction
		slot18 = damage
		slot19 = velocity
		slot20 = nil
		slot21 = self._unit_element
		local env = slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20)
		slot9 = self._endurance
		slot9 = slot9[endurance_type]
		slot11 = slot9
		slot9 = slot9.damage
		slot12 = env

		slot9(slot10, slot11)
	end

	return damage
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "get_body_param"

function slot3(self, param_name)
	slot2 = self._body_element

	if slot2 then
		slot2 = self._body_element
		slot4 = slot2
		slot2 = slot2.get_body_param
		slot5 = param_name

		return slot2(slot3, slot4)
	else
		slot2 = nil

		return slot2
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "set_inflict_damage"

function slot3(self, damage_type, damage)
	slot5 = self
	slot3 = self.set_inflict_attribute
	slot6 = damage_type
	slot7 = "damage"
	slot8 = damage

	slot3(slot4, slot5, slot6, slot7)

	return 
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "set_inflict_interval"

function slot3(self, damage_type, interval)
	slot5 = self
	slot3 = self.set_inflict_attribute
	slot6 = damage_type
	slot7 = "interval"
	slot8 = interval

	slot3(slot4, slot5, slot6, slot7)

	return 
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "set_inflict_instant"

function slot3(self, damage_type, instant)
	slot5 = self
	slot3 = self.set_inflict_attribute
	slot6 = damage_type
	slot7 = "instant"
	slot8 = instant

	slot3(slot4, slot5, slot6, slot7)

	return 
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "set_inflict_enabled"

function slot3(self, damage_type, enabled)
	slot5 = self
	slot3 = self.set_inflict_attribute
	slot6 = damage_type
	slot7 = "enabled"
	slot8 = enabled

	slot3(slot4, slot5, slot6, slot7)

	return 
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "get_inflict_damage"

function slot3(self, damage_type)
	slot4 = self
	slot2 = self.get_inflict_attribute
	slot5 = damage_type
	slot6 = "damage"

	return slot2(slot3, slot4, slot5)
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "get_inflict_interval"

function slot3(self, damage_type)
	slot4 = self
	slot2 = self.get_inflict_attribute
	slot5 = damage_type
	slot6 = "interval"

	return slot2(slot3, slot4, slot5)
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "get_inflict_instant"

function slot3(self, damage_type)
	slot4 = self
	slot2 = self.get_inflict_attribute
	slot5 = damage_type
	slot6 = "instant"

	return slot2(slot3, slot4, slot5)
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "get_inflict_enabled"

function slot3(self, damage_type)
	slot4 = self
	slot2 = self.get_inflict_attribute
	slot5 = damage_type
	slot6 = "enabled"

	return slot2(slot3, slot4, slot5)
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "set_inflict_attribute"

function slot3(self, damage_type, attribute, attribute_value)
	slot4 = self._inflict

	if slot4 then
		slot4 = self._inflict
		local inflict = slot4[damage_type]
	end

	if inflict then
		if attribute_value ~= nil then
			inflict[attribute] = attribute_value
			slot5 = true
			slot6 = true

			return slot5, slot6
		else
			slot5 = false
			slot6 = true

			return slot5, slot6
		end
	else
		slot5 = self._inflict_updator_map

		if slot5 then
			slot5 = self._inflict_updator_map
			local updator = slot5[damage_type]
		end

		if updator then
			slot8 = updator
			slot6 = updator.set_attribute
			slot9 = attribute
			slot10 = attribute_value
			slot6 = slot6(slot7, slot8, slot9)
			slot7 = true

			return slot6, slot7
		else
			slot6 = false
			slot7 = false

			return slot6, slot7
		end
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage
slot2 = "get_inflict_attribute"

function slot3(self, damage_type, attribute)
	slot3 = self._inflict

	if slot3 then
		slot3 = self._inflict
		local inflict = slot3[damage_type]
	end

	if inflict then
		slot4 = inflict[attribute]

		return slot4
	else
		slot4 = self._inflict_updator_map

		if slot4 then
			slot4 = self._inflict_updator_map
			local updator = slot4[damage_type]
		end

		if updator then
			slot7 = updator
			slot5 = updator.get_attribute
			slot8 = attribute

			return slot5(slot6, slot7)
		else
			slot5 = error
			slot7 = "Tried to get "
			slot8 = tostring
			slot10 = attribute
			slot8 = slot8(slot9)
			slot9 = " on non-existing \""
			slot10 = tostring
			slot12 = damage_type
			slot10 = slot10(slot11)
			slot11 = "\"-inflict on body \""
			slot12 = tostring
			slot14 = self._body

			if slot14 then
				slot14 = self._body
				slot16 = slot14
				slot14 = slot14.name
				slot14 = slot14(slot15)
			end

			slot12 = slot12(slot13)
			slot13 = "\" that exist on unit \""
			slot14 = tostring
			slot16 = self._unit

			if slot16 then
				slot16 = self._unit
				slot18 = slot16
				slot16 = slot16.name
				slot16 = slot16(slot17)
			end

			slot14 = slot14(slot15)
			slot15 = "\"."
			slot7 = slot7 .. slot8 .. slot9 .. slot10 .. slot11 .. slot12 .. slot13 .. slot14 .. slot15

			slot5(slot6)
		end
	end

	slot4 = nil

	return slot4
end

slot1[slot2] = slot3
slot1 = CoreBodyDamage

function slot2(self, data)
	local state = {}
	local changed = false
	slot4 = pairs
	slot6 = self._damage
	slot4, slot5, slot6 = slot4(slot5)

	for k, v in slot4, slot5, slot6 do
		if v ~= 0 then
			slot9 = table
			slot9 = slot9.map_copy
			slot11 = self._damage
			slot9 = slot9(slot10)
			state.damage = slot9
			changed = true

			break
		end
	end

	slot4 = self._inflict

	if slot4 then
		slot4 = pairs
		slot6 = self._inflict
		slot4, slot5, slot6 = slot4(slot5)

		for damage_type, inflict_data in slot4, slot5, slot6 do
			slot9 = pairs
			slot11 = inflict_data
			slot9, slot10, slot11 = slot9(slot10)

			for k, v in slot9, slot10, slot11 do
				slot14 = self._original_inflict
				slot14 = slot14[damage_type]
				slot14 = slot14[k]

				if v ~= slot14 then
					state.inflict = state.inflict or {}
					state.inflict[damage_type] = state.inflict[damage_type] or {}
					state.inflict[damage_type][k] = v
					changed = true
				end
			end
		end
	end

	local updator_state = nil
	slot5 = self._inflict_updator_map

	if slot5 then
		slot5 = pairs
		slot7 = self._inflict_updator_map
		slot5, slot6, slot7 = slot5(slot6)

		for damage_type, updator in slot5, slot6, slot7 do
			local sub_updator_state = {}
			slot13 = updator
			slot11 = updator.save
			slot14 = sub_updator_state
			slot11 = slot11(slot12, slot13)

			if slot11 then
				updator_state = updator_state or {}
				updator_state[damage_type] = sub_updator_state
				changed = true
			end
		end
	end

	state.InflictUpdatorMap = updator_state

	if changed then
		slot5 = self._body_index
		data[slot5] = state
	end

	return changed
end

slot1.save = slot2
slot1 = CoreBodyDamage

function slot2(self, data)
	slot2 = self._body_index
	local state = data[slot2]

	if state then
		slot3 = state.damage

		if slot3 then
			slot3 = pairs
			slot5 = state.damage
			slot3, slot4, slot5 = slot3(slot4)

			for damage_type, damage in slot3, slot4, slot5 do
				slot10 = self
				slot8 = self.set_damage
				slot11 = damage_type
				slot12 = damage

				slot8(slot9, slot10, slot11)
			end
		end

		slot3 = state.inflict

		if slot3 then
			slot3 = pairs
			slot5 = state.inflict
			slot3, slot4, slot5 = slot3(slot4)

			for damage_type, inflict_data in slot3, slot4, slot5 do
				slot8 = pairs
				slot10 = state.inflict
				slot8, slot9, slot10 = slot8(slot9)

				for k, v in slot8, slot9, slot10 do
					self._inflict = self._inflict or {}
					slot13 = self._inflict
					slot13 = slot13[damage_type]
					slot13[k] = v
				end
			end
		end

		local updator_state = state.InflictUpdatorMap

		if updator_state then
			slot4 = self._inflict_updator_map

			if slot4 then
				slot4 = pairs
				slot6 = self._inflict_updator_map
				slot4, slot5, slot6 = slot4(slot5)

				for damage_type, updator in slot4, slot5, slot6 do
					local sub_updator_state = updator_state[damage_type]

					if sub_updator_state then
						slot12 = updator
						slot10 = updator.load
						slot13 = sub_updator_state

						slot10(slot11, slot12)
					end
				end
			end
		end
	end

	return 
end

slot1.load = slot2
slot1 = CoreDamageWaterCheck

if not slot1 then
	slot1 = class
	slot1 = slot1()
end

CoreDamageWaterCheck = slot1
slot1 = CoreDamageWaterCheck
slot2 = "MIN_INTERVAL"
slot3 = 0.2
slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "DEFAULT_PHYSIC_EFFECT"
slot3 = "water_box"
slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck

function slot2(self, unit, damage_ext, name, interval, ref_object, ref_body, body_depth, physic_effect)
	self._unit = unit
	self._damage_ext = damage_ext
	self._name = name
	self._activation_callbacks_enabled = false
	self._activation_listener_enabled = false
	self._current_ref_body_depth = nil
	slot12 = interval

	self.set_interval(slot10, self)

	slot12 = ref_object

	self.set_ref_object(slot10, self)

	slot12 = body_depth

	self.set_body_depth(slot10, self)

	slot12 = ref_body

	self.set_ref_body(slot10, self)

	self._physic_effect = physic_effect or self.DEFAULT_PHYSIC_EFFECT
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "body_activated"
	slot9 = slot9(slot10, slot11, slot12)
	self._body_activation_func = slot9
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "water_collision"
	slot9 = slot9(slot10, slot11, slot12)
	self._water_callback_func = slot9
	slot9 = TimerManager
	slot11 = slot9
	slot9 = slot9.game
	slot9 = slot9(slot10)
	slot11 = slot9
	slot9 = slot9.time
	slot9 = slot9(slot10)
	slot10 = math
	slot10 = slot10.random
	slot10 = slot10()
	slot11 = self._interval
	slot10 = slot10 * slot11
	slot9 = slot9 + slot10
	self._check_time = slot9
	slot9 = false
	self._enter_water = slot9

	return 
end

slot1.init = slot2
slot1 = CoreDamageWaterCheck
slot2 = "is_valid"

function slot3(self)
	return self._ref_object or self._ref_body
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck

function slot2(self, t, dt)
	slot3 = self._check_time

	if slot3 <= t then
		slot5 = self
		slot3 = self.check_active_body
		slot3 = slot3(slot4)

		if slot3 then
			slot3 = self._in_water_check_func
			local enter_water = slot3()
			slot4 = self._enter_water
			slot4 = not slot4
			slot5 = not enter_water

			if slot4 ~= slot5 then
				self._enter_water = enter_water

				if enter_water then
					slot4 = self._damage_ext
					slot6 = slot4
					slot4 = slot4.water_check_enter
					slot7 = self._name
					slot8 = self
					slot11 = self
					slot9 = self.get_env_variables
					slot12 = enter_water

					slot4(slot5, slot6, slot7, slot9(slot10, slot11))
				else
					slot4 = self._damage_ext
					slot6 = slot4
					slot4 = slot4.water_check_exit
					slot7 = self._name
					slot8 = self
					slot11 = self
					slot9 = self.get_env_variables
					slot12 = enter_water

					slot4(slot5, slot6, slot7, slot9(slot10, slot11))
				end
			end
		end
	end

	return 
end

slot1.update = slot2
slot1 = CoreDamageWaterCheck
slot2 = "get_env_variables"

function slot3(self, enter_water)
	local normal, position, velocity, water_depth = nil

	if enter_water then
		slot6 = Vector3
		slot8 = 0
		slot9 = 0
		slot10 = 1
		slot6 = slot6(slot7, slot8, slot9)
		normal = slot6
	else
		slot6 = Vector3
		slot8 = 0
		slot9 = 0
		slot10 = -1
		slot6 = slot6(slot7, slot8, slot9)
		normal = slot6
	end

	slot6 = self._ref_object

	if slot6 then
		slot6 = self._ref_object
		slot8 = slot6
		slot6 = slot6.position
		slot6 = slot6(slot7)
		position = slot6
		slot6 = alive
		slot8 = self._ref_body
		slot6 = slot6(slot7)

		if slot6 then
			slot6 = self._ref_body
			slot8 = slot6
			slot6 = slot6.velocity
			slot6 = slot6(slot7)
			velocity = slot6
			slot6 = self._ref_body
			slot8 = slot6
			slot6 = slot6.in_water
			slot6 = slot6(slot7)
			water_depth = slot6
		else
			slot6 = self._unit
			slot8 = slot6
			slot6 = slot6.velocity
			slot6 = slot6(slot7)
			velocity = slot6
			water_depth = 0
		end
	else
		slot6 = self._unit
		slot8 = slot6
		slot6 = slot6.velocity
		slot6 = slot6(slot7)
		velocity = slot6
		water_depth = 0
		slot6 = alive
		slot8 = self._ref_body
		slot6 = slot6(slot7)

		if slot6 then
			slot6 = self._ref_body
			slot8 = slot6
			slot6 = slot6.position
			slot6 = slot6(slot7)
			position = slot6
		else
			slot6 = self._unit
			slot8 = slot6
			slot6 = slot6.position
			slot6 = slot6(slot7)
			position = slot6
		end
	end

	slot6 = self._unit
	slot7 = self._ref_body
	slot8 = normal
	slot9 = position
	slot12 = velocity
	slot10 = velocity.normalized
	slot10 = slot10(slot11)
	slot11 = 0
	slot12 = velocity
	slot13 = water_depth

	return slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "set_update_variables"

function slot3(self)
	slot1 = self._ref_object

	if slot1 then
		slot1 = callback
		slot3 = self
		slot4 = self
		slot5 = "is_ref_object_in_water"
		slot1 = slot1(slot2, slot3, slot4)
		self._in_water_check_func = slot1
	else
		slot1 = alive
		slot3 = self._ref_body
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = callback
			slot3 = self
			slot4 = self
			slot5 = "is_ref_body_in_water_depth"
			slot1 = slot1(slot2, slot3, slot4)
			self._in_water_check_func = slot1
		end
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "check_active_body"

function slot3(self)
	slot1 = self._check_time
	slot2 = self._interval
	slot1 = slot1 + slot2
	self._check_time = slot1
	slot1 = alive
	slot3 = self._ref_body
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = self._ref_body
		slot3 = slot1
		slot1 = slot1.in_water
		slot1 = slot1(slot2)
	end

	self._current_ref_body_depth = slot1
	slot1 = self._current_ref_body_depth

	if slot1 then
		slot1 = self._ref_body
		slot3 = slot1
		slot1 = slot1.dynamic
		slot1 = slot1(slot2)
		slot1 = not slot1

		if not slot1 then
			slot1 = false
		end
	else
		local static = true
	end

	if not static then
		slot2 = self._ref_body
		slot4 = slot2
		slot2 = slot2.active
		slot2 = slot2(slot3)

		if not slot2 and (0 < self._current_ref_body_depth) == self._enter_water then
			slot4 = self
			slot2 = self.set_activation_listener_enabled
			slot5 = true

			slot2(slot3, slot4)

			slot2 = false

			return slot2
		end
	end

	slot2 = true

	return slot2
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "set_activation_callbacks_enabled"

function slot3(self, enabled)
	slot2 = self._activation_callbacks_enabled

	if slot2 ~= enabled then
		self._activation_callbacks_enabled = enabled

		if enabled then
			slot2 = self._unit
			slot4 = slot2
			slot2 = slot2.add_body_activation_callback
			slot5 = self._body_activation_func

			slot2(slot3, slot4)

			slot2 = self._unit
			slot4 = slot2
			slot2 = slot2.add_water_collision_callback
			slot5 = self._water_callback_func

			slot2(slot3, slot4)
		else
			slot2 = self._unit
			slot4 = slot2
			slot2 = slot2.remove_body_activation_callback
			slot5 = self._body_activation_func

			slot2(slot3, slot4)

			slot2 = self._unit
			slot4 = slot2
			slot2 = slot2.remove_water_collision_callback
			slot5 = self._water_callback_func

			slot2(slot3, slot4)

			slot2 = TimerManager
			slot4 = slot2
			slot2 = slot2.game
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.time
			slot2 = slot2(slot3)
			slot3 = self._interval
			slot2 = slot2 + slot3
			self._check_time = slot2
		end
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "set_activation_listener_enabled"

function slot3(self, enabled)
	slot2 = self._activation_listener_enabled

	if slot2 ~= enabled then
		self._activation_listener_enabled = enabled
		slot2 = self._damage_ext
		slot4 = slot2
		slot2 = slot2.set_water_check_active
		slot5 = self._name
		slot6 = not enabled

		slot2(slot3, slot4, slot5)

		slot4 = self
		slot2 = self.set_activation_callbacks_enabled
		slot5 = enabled

		slot2(slot3, slot4)
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "is_ref_object_in_water"

function slot3(self)
	slot1 = World
	slot3 = slot1
	slot1 = slot1.in_physic_effect
	slot4 = self._physic_effect
	slot5 = self._ref_object
	slot7 = slot5
	slot5 = slot5.position

	return slot1(slot2, slot3, slot5(slot6))
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "is_ref_body_in_water_depth"

function slot3(self)
	slot1 = self._current_ref_body_depth

	if slot1 then
		return body_depth < self._current_ref_body_depth
	end
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "get_interval"

function slot3(self)
	slot1 = self._interval

	return slot1
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "set_interval"

function slot3(self, interval)
	slot5 = self.MIN_INTERVAL
	self._interval = math.max(slot3, interval or self.MIN_INTERVAL)

	return 
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "get_ref_object"

function slot3(self)
	slot1 = self._ref_object

	return slot1
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "set_ref_object"

function slot3(self, ref_object)
	self._ref_object = ref_object
	slot4 = self
	slot2 = self.set_activation_listener_enabled
	slot5 = false

	slot2(slot3, slot4)

	slot4 = self
	slot2 = self.set_update_variables

	slot2(slot3)

	return 
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "get_ref_body"

function slot3(self)
	slot1 = self._ref_body

	return slot1
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "set_ref_body"

function slot3(self, ref_body)
	self._ref_body = ref_body
	slot4 = self
	slot2 = self.set_activation_listener_enabled
	slot5 = false

	slot2(slot3, slot4)

	slot2 = self._ref_body

	if slot2 then

		-- Decompilation error in this vicinity:
		slot2 = self._ref_body
		slot4 = slot2
		slot2 = slot2.key
		slot2 = slot2(slot3)
		self._ref_body_key = slot2
		slot2 = self._ref_body
		slot4 = slot2
		slot2 = slot2.set_activate_tag
		slot5 = "CoreDamageWaterCheck"

		slot2(slot3, slot4)

		slot2 = self._ref_body
		slot4 = slot2
		slot2 = slot2.set_deactivate_tag
		slot5 = "CoreDamageWaterCheck"

		slot2(slot3, slot4)

		slot2 = self._ref_body
		slot4 = slot2
		slot2 = slot2.enter_water_script_tag
		local water_tag = slot2(slot3)
		slot3 = self._ref_body
		slot5 = slot3
		slot3 = slot3.set_enter_water_script_tag
		slot6 = water_tag

		slot3(slot4, slot5)

		slot3 = self._ref_body
		slot5 = slot3
		slot3 = slot3.set_exit_water_script_tag
		slot6 = "CoreDamageWaterCheck"

		slot3(slot4, slot5)

		slot3 = self._ref_body
		slot5 = slot3
		slot3 = slot3.set_enter_water_script_filter
		slot6 = 0

		slot3(slot4, slot5)

		slot3 = self._ref_body
		slot5 = slot3
		slot3 = slot3.set_exit_water_script_filter
		slot6 = 0

		slot3(slot4, slot5)
	end

	slot4 = self
	slot2 = self.set_update_variables

	slot2(slot3)

	return 
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "get_body_depth"

function slot3(self)
	slot1 = self._body_depth

	return slot1
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "set_body_depth"

function slot3(self, body_depth)
	slot5 = 0
	self._body_depth = math.max(slot3, body_depth or 0)

	return 
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "water_collision"

function slot3(self, tag, unit, body, surface, enter, position, normal, velocity)
	slot9 = not enter
	slot10 = self._enter_water
	slot10 = not slot10

	if slot9 ~= slot10 then
		slot11 = body
		slot9 = body.key
		slot9 = slot9(slot10)
		slot10 = self._ref_body_key

		if slot9 == slot10 then
			slot11 = self
			slot9 = self.set_activation_listener_enabled
			slot12 = false

			slot9(slot10, slot11)
		end
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "body_activated"

function slot3(self, tag, unit, body, activated)
	if activated then
		slot7 = body
		slot5 = body.key
		slot5 = slot5(slot6)
		slot6 = self._ref_body_key

		if slot5 == slot6 then
			slot7 = self
			slot5 = self.set_activation_listener_enabled
			slot8 = false

			slot5(slot6, slot7)
		end
	end

	return 
end

slot1[slot2] = slot3
slot1 = CoreDamageWaterCheck
slot2 = "to_string"

function slot3(self)

	-- Decompilation error in this vicinity:
	slot1 = string
	slot1 = slot1.format
	slot3 = "[Unit: %s, Name: %s, Enabled: %s, Interval: %g, Object: %s, Body: %s, Body depth: %g]"
	slot4 = self._unit
	slot6 = slot4
	slot4 = slot4.name
	slot4 = slot4(slot5)
	slot5 = self._name
	slot6 = tostring
	slot8 = self._damage_ext
	slot10 = slot8
	slot8 = slot8.is_water_check_active
	slot11 = self._name
	slot6 = slot6(slot8(slot9, slot10))
	slot7 = self._interval
	slot8 = tostring
	slot10 = alive
	slot12 = self._ref_object
	slot10 = slot10(slot11)
end

slot1[slot2] = slot3
slot1 = CoreInflictUpdator

if not slot1 then
	slot1 = class
	slot1 = slot1()
end

CoreInflictUpdator = slot1
CoreInflictUpdator.INFLICT_UPDATOR_DAMAGE_TYPE_MAP = CoreInflictUpdator.INFLICT_UPDATOR_DAMAGE_TYPE_MAP or {}
CoreInflictUpdator.MIN_INTERVAL = 0.2
CoreInflictUpdator.init = function (self, unit, body, body_damage_ext, inflict_element, unit_element)
	self._unit = unit
	self._body = body
	self._body_damage_ext = body_damage_ext
	self._inflict_element = inflict_element
	self._unit_element = unit_element
	self._update_func = callback(slot7, self, self)
	slot11 = inflict_element
	slot9 = inflict_element.get_damage("update") or 0

	self.set_damage(slot7, self)

	slot11 = inflict_element
	slot9 = inflict_element.get_interval(slot10) or 1

	self.set_interval(slot7, self)

	slot8 = self
	slot11 = inflict_element

	self.set_instant(slot7, inflict_element.get_instant(slot10))

	slot8 = self
	slot11 = inflict_element

	self.set_enabled(slot7, inflict_element.get_enabled(slot10))

	self._original_damage = self._damage
	self._original_interval = self._interval
	self._original_instant = self._instant
	self._original_enabled = self._enabled
	slot8 = TimerManager
	slot8 = TimerManager.game(slot7)
	slot8 = math.random()
	self._check_time = TimerManager.game(slot7).time(slot7) + self._interval * slot8
	self._is_inflicting = false
	self._set_attribute_func_map = {}
	slot11 = "set_damage"
	self._set_attribute_func_map.damage = callback(slot8, self, self)
	slot11 = "set_interval"
	self._set_attribute_func_map.interval = callback(slot8, self, self)
	slot11 = "set_instant"
	self._set_attribute_func_map.instant = callback(slot8, self, self)
	slot11 = "set_enabled"
	self._set_attribute_func_map.enabled = callback(slot8, self, self)
	self._get_attribute_func_map = {
		damage = function ()
			return self._damage
		end,
		interval = function ()
			return self._interval
		end,
		instant = function ()
			return self._instant
		end,
		enabled = function ()
			return self._enabled
		end
	}

	return 
end
CoreInflictUpdator.is_valid = function (self)
	return true
end
CoreInflictUpdator.set_damage = function (self, damage)
	self._damage = damage or self._damage

	return 
end
CoreInflictUpdator.set_interval = function (self, interval)
	local old_interval = self._interval
	slot6 = self.MIN_INTERVAL
	self._interval = math.max(slot4, interval or self._interval)

	if old_interval then
		slot9 = TimerManager
		slot9 = TimerManager.game(slot8)
		slot7 = TimerManager.game(slot8).time(slot8) + self._interval
		self._check_time = math.clamp(slot4, self._check_time, self._check_time - old_interval)
	end

	return 
end
CoreInflictUpdator.set_instant = function (self, instant)
	self._instant = not not instant

	return 
end
CoreInflictUpdator.set_enabled = function (self, enabled)
	enabled = not not enabled

	if self._enabled ~= enabled then
		self._enabled = enabled

		if enabled then
			slot5 = self._update_func
			self._id = managers.sequence.add_callback(slot3, managers.sequence)
			slot4 = TimerManager
			slot4 = TimerManager.game(slot3)
			self._check_time = TimerManager.game(slot3).time(slot3) + math.random() * self._interval
		elseif self._id then
			slot5 = self._id

			managers.sequence.remove_callback(slot3, managers.sequence)

			self._id = nil
		end
	end

	return 
end
CoreInflictUpdator.save = function (self, data)
	local state = {}
	local changed = false

	if self._original_damage ~= self._damage then
		state.damage = self._damage
		changed = true
	end

	if self._original_interval ~= self._interval then
		state.interval = self._interval
		changed = true
	end

	if not self._original_instant ~= not self._instant then
		state.instant = self._instant
		changed = true
	end

	if not self._original_enabled ~= not self._enabled then
		state.enabled = self._enabled
		changed = true
	end

	if changed then
		data.CoreInflictUpdator = state
	end

	return changed
end
CoreInflictUpdator.load = function (self, data)
	local state = data.CoreInflictUpdator

	if state then
		self._damage = state.damage or self._damage
		self._interval = state.interval or self._interval

		if state.instant ~= nil then
			slot6 = state.instant

			self.set_instant(slot4, self)
		end

		if state.enabled ~= nil then
			slot6 = state.enabled

			self.set_enabled(slot4, self)
		end
	end

	return 
end
CoreInflictUpdator.update = function (self, t, dt)
	if self._check_time <= t then
		slot5 = self._unit

		if alive(slot4) then
			self._check_time = self._check_time + self._interval
			slot7 = dt

			self.check_damage(self._interval, self, t)
		else
			slot6 = false

			self.set_enabled(slot4, self)
		end
	end

	return 
end
CoreInflictUpdator.set_attribute = function (self, attribute, attribute_value)
	if attribute_value ~= nil then
		local func = self._set_attribute_func_map[attribute]

		if func then
			slot6 = attribute_value

			func(slot5)

			return true
		end
	end

	return false
end
CoreInflictUpdator.get_attribute = function (self, attribute)
	if attribute then
		local func = self._get_attribute_func_map[attribute]

		if func then
			return func()
		end
	end

	slot2 = error
	slot4 = "Tried to get non existing attribute \""
	slot7 = attribute
	slot5 = tostring(slot6)
	slot6 = "\" on body \""
	slot7 = tostring

	if self._body then
		slot11 = self._body
		slot9 = self._body.name(slot10)
	end

	slot7 = slot7(slot8)
	slot8 = "\" that exist on unit \""
	slot9 = tostring

	if self._unit then
		slot13 = self._unit
		slot11 = self._unit.name(slot12)
	end

	slot4 = slot4 .. slot5 .. slot6 .. slot7 .. slot8 .. slot9(slot10) .. "\"."

	slot2(slot3)

	return nil
end
slot1 = CoreInflictFireUpdator

if not slot1 then
	slot1 = class
	slot3 = CoreInflictUpdator
	slot1 = slot1(slot2)
end

CoreInflictFireUpdator = slot1
slot1 = CoreInflictUpdator
slot2 = "INFLICT_UPDATOR_DAMAGE_TYPE_MAP"
slot1 = slot1[slot2]
slot2 = "fire"
slot3 = CoreInflictFireUpdator
slot1[slot2] = slot3
slot1 = CoreInflictFireUpdator
slot2 = "SPHERE_CHECK_SLOTMASK"
slot3 = "fire_damage"
slot1[slot2] = slot3
slot1 = CoreInflictFireUpdator
slot2 = "SPHERE_CHECK_PADDING"
slot3 = 100
slot1[slot2] = slot3
slot1 = CoreInflictFireUpdator
slot2 = "DAMAGE_TYPE"
slot3 = "fire"
slot1[slot2] = slot3
slot1 = CoreInflictFireUpdator

function slot2(self, unit, body, body_damage_ext, inflict_element, unit_element)
	slot6 = CoreInflictUpdator
	slot6 = slot6.init
	slot8 = self
	slot9 = unit
	slot10 = body
	slot11 = body_damage_ext
	slot12 = inflict_element
	slot13 = unit_element

	slot6(slot7, slot8, slot9, slot10, slot11, slot12)

	slot6 = managers
	slot6 = slot6.slot
	slot8 = slot6
	slot6 = slot6.get_mask
	slot9 = self.SPHERE_CHECK_SLOTMASK
	slot6 = slot6(slot7, slot8)
	self._slotmask = slot6
	slot6 = self._inflict_element
	slot8 = slot6
	slot6 = slot6.get_velocity
	slot6 = slot6(slot7)

	if not slot6 then
		slot6 = Vector3
		slot6 = slot6()
	end

	self._velocity = slot6
	slot8 = self._inflict_element
	self._falloff = self._inflict_element.get_falloff(slot7)
	slot10 = inflict_element
	slot9 = 0
	self._fire_height = math.max(slot7, inflict_element.get_fire_height(slot9) or 0)
	slot8 = inflict_element
	self._original_fire_object_name = inflict_element.get_fire_object_name(slot7)
	slot9 = self._original_fire_object_name

	self.set_fire_object_name(slot7, self)

	self._original_velocity = self._velocity
	self._original_falloff = self._falloff
	self._original_fire_height = self._fire_height
	slot8 = inflict_element
	local enter_element = inflict_element.get_enter_element(slot7)

	if enter_element then
		slot7 = callback
		slot9 = enter_element
		slot10 = enter_element
		slot11 = "activate"
		slot7 = slot7(slot8, slot9, slot10)
	end

	self._enter_element_func = slot7
	slot9 = inflict_element
	slot7 = inflict_element.get_exit_element
	local exit_element = slot7(slot8)

	if exit_element then
		slot8 = callback
		slot10 = exit_element
		slot11 = exit_element
		slot12 = "activate"
		slot8 = slot8(slot9, slot10, slot11)
	end

	self._exit_element_func = slot8
	slot10 = inflict_element
	slot8 = inflict_element.get_damage_element
	local damage_element = slot8(slot9)

	if damage_element then
		slot9 = callback
		slot11 = damage_element
		slot12 = damage_element
		slot13 = "activate"
		slot9 = slot9(slot10, slot11, slot12)
	end

	self._damage_element_func = slot9
	slot9 = self._set_attribute_func_map
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "set_fire_object_name"
	slot10 = slot10(slot11, slot12, slot13)
	slot9.fire_object = slot10
	slot9 = self._set_attribute_func_map
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "set_fire_height"
	slot10 = slot10(slot11, slot12, slot13)
	slot9.fire_height = slot10
	slot9 = self._set_attribute_func_map
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "set_velocity"
	slot10 = slot10(slot11, slot12, slot13)
	slot9.velocity = slot10
	slot9 = self._set_attribute_func_map
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "set_falloff"
	slot10 = slot10(slot11, slot12, slot13)
	slot9.falloff = slot10
	slot9 = self._get_attribute_func_map

	function slot10()
		slot0 = self
		slot0 = slot0._fire_object

		return slot0
	end

	slot9.fire_object = slot10
	slot9 = self._get_attribute_func_map

	function slot10()
		slot0 = self
		slot0 = slot0._fire_height

		return slot0
	end

	slot9.fire_height = slot10
	slot9 = self._get_attribute_func_map

	function slot10()
		slot0 = self
		slot0 = slot0._velocity

		return slot0
	end

	slot9.velocity = slot10
	slot9 = self._get_attribute_func_map

	function slot10()
		slot0 = self
		slot0 = slot0._falloff

		return slot0
	end

	slot9.falloff = slot10

	return 
end

slot1.init = slot2
slot1 = CoreInflictFireUpdator
slot2 = "is_valid"

function slot3(self)
	slot1 = CoreInflictUpdator
	slot1 = slot1.is_valid
	slot3 = self
	slot1 = slot1(slot2)

	if slot1 then
		return self._fire_object ~= nil
	end
end

slot1[slot2] = slot3
slot1 = CoreInflictFireUpdator
slot2 = "set_fire_object_name"

function slot3(self, name)
	if name then
		slot2 = self._unit
		slot4 = slot2
		slot2 = slot2.get_object
		slot5 = Idstring
		slot7 = name
		slot2 = slot2(slot3, slot5(slot6))
	end

	self._fire_object = slot2
	slot2 = self._fire_object

	if not slot2 then
		slot4 = self
		slot2 = self.set_enabled
		slot5 = false

		slot2(slot3, slot4)

		slot2 = Application
		slot4 = slot2
		slot2 = slot2.error
		slot5 = "Invalid inflict fire element object \""
		slot6 = tostring
		slot8 = name
		slot6 = slot6(slot7)
		slot7 = "\"."
		slot5 = slot5 .. slot6 .. slot7

		slot2(slot3, slot4)

		slot2 = self._body_damage_ext
		slot4 = slot2
		slot2 = slot2.get_inflict_updator_map
		local inflict_updator_map = slot2(slot3)

		if inflict_updator_map then
			slot3 = self.DAMAGE_TYPE
			slot4 = nil
			inflict_updator_map[slot3] = slot4
		end

		return 
	end

	slot4 = self
	slot2 = self.set_fire_height
	slot5 = self._fire_height

	slot2(slot3, slot4)

	return 
end

slot1[slot2] = slot3
slot1 = CoreInflictFireUpdator
slot2 = "set_fire_height"

function slot3(self, height)
	self._fire_height = height
	slot2 = self._fire_object
	slot4 = slot2
	slot2 = slot2.oobb
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.size
	slot2 = slot2(slot3)
	slot2 = slot2 / 2
	slot4 = slot2
	slot2 = slot2.length
	slot2 = slot2(slot3)
	slot3 = self._fire_height
	slot2 = slot2 + slot3
	slot3 = self.SPHERE_CHECK_PADDING
	slot2 = slot2 + slot3
	self._sphere_check_range = slot2

	return 
end

slot1[slot2] = slot3
slot1 = CoreInflictFireUpdator
slot2 = "set_velocity"

function slot3(self, velocity)
	self._velocity = velocity

	return 
end

slot1[slot2] = slot3
slot1 = CoreInflictFireUpdator
slot2 = "set_falloff"

function slot3(self, falloff)
	self._falloff = falloff

	return 
end

slot1[slot2] = slot3
slot1 = CoreInflictFireUpdator

function slot2(self, data)
	local state = {}
	slot3 = CoreInflictUpdator
	slot3 = slot3.save
	slot5 = self
	slot6 = data
	local changed = slot3(slot4, slot5)
	slot4 = Idstring
	slot6 = self._original_fire_object_name
	slot4 = slot4(slot5)
	slot5 = self._fire_object
	slot7 = slot5
	slot5 = slot5.name
	slot5 = slot5(slot6)

	if slot4 ~= slot5 then
		slot4 = self._fire_object
		slot6 = slot4
		slot4 = slot4.name
		slot4 = slot4(slot5)
		state.fire_object_name = slot4
		changed = true
	end

	slot4 = self._original_velocity
	slot5 = self._velocity

	if slot4 ~= slot5 then
		slot4 = self._velocity
		state.velocity = slot4
		changed = true
	end

	slot4 = self._original_falloff
	slot5 = self._falloff

	if slot4 ~= slot5 then
		slot4 = self._falloff
		state.falloff = slot4
		changed = true
	end

	slot4 = self._original_fire_height
	slot5 = self._fire_height

	if slot4 ~= slot5 then
		slot4 = self._fire_height
		state.fire_height = slot4
		changed = true
	end

	if changed then
		data.CoreInflictFireUpdator = state
	end

	return changed
end

slot1.save = slot2
slot1 = CoreInflictFireUpdator

function slot2(self, data)
	slot2 = CoreInflictUpdator
	slot2 = slot2.load
	slot4 = self
	slot5 = data

	slot2(slot3, slot4)

	local state = data.CoreInflictUpdator

	if state then
		slot3 = state.fire_object_name

		if slot3 then
			slot5 = self
			slot3 = self.set_fire_object_name
			slot6 = state.fire_object_name

			slot3(slot4, slot5)
		end

		slot3 = state.fire_height

		if slot3 then
			slot5 = self
			slot3 = self.set_fire_height
			slot6 = state.fire_height

			slot3(slot4, slot5)
		end

		self._velocity = state.velocity or self._velocity
		self._falloff = state.falloff or self._falloff
	end

	return 
end

slot1.load = slot2
slot1 = Vector3
local mvec1 = slot1()
slot2 = Vector3
local mvec2 = slot2()
slot3 = Vector3
local mvec3 = slot3()
slot4 = CoreInflictFireUpdator
slot5 = "check_damage"

function slot6(self, t, dt)
	slot3 = self._fire_object
	slot5 = slot3
	slot3 = slot3.oobb
	local oobb = slot3(slot4)
	slot6 = oobb
	slot4 = oobb.center
	local oobb_center = slot4(slot5)
	slot5 = self._unit
	slot7 = slot5
	slot5 = slot5.find_units_quick
	slot8 = "sphere"
	slot9 = oobb_center
	slot10 = self._sphere_check_range
	slot11 = self._slotmask
	local unit_list = slot5(slot6, slot7, slot8, slot9, slot10)
	local inflicted_damage, exit_inflict_env = nil
	slot8 = ipairs
	slot10 = unit_list
	slot8, slot9, slot10 = slot8(slot9)

	for _, unit in slot8, slot9, slot10 do

		-- Decompilation error in this vicinity:
		slot13 = managers
		slot13 = slot13.player
		slot15 = slot13
		slot13 = slot13.player_unit
		slot13 = slot13(slot14)
	end

	if not inflicted_damage then
		slot8 = self._is_inflicting

		if slot8 then
			slot8 = false
			self._is_inflicting = slot8

			if exit_inflict_env then
				slot8 = self._exit_element_func
				slot10 = exit_inflict_env

				slot8(slot9)
			end
		end
	end

	return 
end

slot4[slot5] = slot6

return 
