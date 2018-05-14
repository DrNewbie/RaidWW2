-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CarryData = CarryData or class()
CarryData.EVENT_IDS = {
	explode = 2,
	will_explode = 1
}
function CarryData:init(unit)
	self._unit = unit
	self._dye_initiated = false
	self._has_dye_pack = false
	self._dye_value_multiplier = 100
	self._value = 0

	if self._disable_update then
		slot5 = "CarryData:init disabled!"

		Application.debug(slot3, Application)

		slot7 = "carry_data"

		self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(false))
	end

	return 
end
function CarryData:set_mission_element(mission_element)
	self._mission_element = mission_element

	return 
end
function CarryData:trigger_load(instigator)
	if not self._mission_element then
		return 
	end

	slot6 = instigator

	self._mission_element.trigger(slot3, self._mission_element, "load")

	return 
end
function CarryData:update(unit, t, dt)
	slot6 = Network

	if not Network.is_server(slot5) then
		return 
	end

	if self._explode_t and self._explode_t < t then
		self._explode_t = nil
		slot6 = self

		self._explode(slot5)
	end

	return 
end
function CarryData:_check_dye_explode()
	return 

	slot3 = 1
	local chance = math.rand(slot2)

	if chance < 0.25 then
		self._dye_risk = nil
		slot4 = self

		self._dye_exploded(slot3)

		return 
	end

	slot6 = 3
	self._dye_risk.next_t = Application.time(slot4) + 2 + math.random(Application)

	return 
end
function CarryData:sync_dye_exploded()
	slot3 = self

	self._dye_exploded(slot2)

	return 
end
function CarryData:_dye_exploded()
	return 

	slot3 = "CarryData DYE BOOM"

	print(slot2)

	self._value = self._value * (1 - self._dye_value_multiplier / 100)
	slot3 = self._value
	self._value = math.round(1 - self._dye_value_multiplier / 100)
	self._has_dye_pack = false

	return 
end
function CarryData:check_explodes_on_impact(velocity, air_time)
	slot5 = Network

	if not Network.is_server(slot4) then
		return 
	end

	if self._explode_t then
		return 
	end

	slot5 = self

	if self.can_explode(slot4) then
		if air_time < 0.5 then
			return 
		end

		slot5 = velocity
		local vel = mvector3.length(slot4)
		local vel_limit = 500

		if vel < vel_limit then
			return 
		end

		slot8 = 0.9
		slot12 = 1
		local chance = math.lerp(slot6, 0, math.min(slot10, (vel - vel_limit) / (1200 - vel_limit)))
		slot8 = 1

		if math.rand(0) <= chance then
			slot8 = self

			self.start_explosion(slot7)

			return true
		end
	end

	return 
end
function CarryData:explode_sequence_started()
	return (self._explode_t and true) or false
end
function CarryData:can_explode()
	if self._disarmed then
		return false
	end

	local tweak_info = tweak_data.carry[self._carry_id]

	return tweak_data.carry.types[tweak_info.type].can_explode
end
function CarryData:start_explosion()
	if self._explode_t then
		return 
	end

	slot3 = self

	if not self.can_explode(slot2) then
		return 
	end

	slot3 = self

	self._unregister_steal_SO(slot2)

	slot3 = self

	self._start_explosion(slot2)

	slot3 = managers.network
	slot7 = CarryData.EVENT_IDS.will_explode

	managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_unit_event_id_16", self._unit, "carry_data")

	slot4 = 3
	self._explode_t = Application.time(slot2) + 1 + math.rand(Application)

	return 
end
function CarryData:_start_explosion()
	slot3 = self._unit
	slot4 = false

	self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2))

	return 
end
function CarryData:disarm()
	self._explode_t = nil
	self._disarmed = true

	return 
end
function CarryData:bullet_hit()
	slot3 = self

	if self.can_explode(slot2) then
		slot3 = self

		self._explode(slot2)
	end

	return 
end
CarryData.EXPLOSION_SETTINGS = {
	damage = 40,
	range = 1000,
	curve_pow = 3,
	player_damage = 20,
	effect = "effects/vanilla/explosions/exp_bag_explosion_001"
}
CarryData.EXPLOSION_CUSTOM_PARAMS = {
	camera_shake_mul = 4,
	effect = CarryData.EXPLOSION_SETTINGS.effect
}
local mvec1 = Vector3()
function CarryData:_explode()
	slot4 = "loot_exploded"

	managers.mission.call_global_event(slot2, managers.mission)

	slot3 = self._unit
	local pos = self._unit.position(slot2)
	local normal = math.UP
	local range = CarryData.EXPLOSION_SETTINGS.range
	local effect = CarryData.EXPLOSION_SETTINGS.effect
	slot8 = "explosion_targets"
	local slot_mask = managers.slot.get_mask(slot6, managers.slot)
	slot8 = self

	self._local_player_explosion_damage(managers.slot)

	slot12 = CarryData.EXPLOSION_CUSTOM_PARAMS

	managers.explosion.play_sound_and_effects(managers.slot, managers.explosion, pos, normal, range)

	local hit_units, splinters = managers.explosion.detect_and_give_dmg(managers.slot, managers.explosion)
	slot10 = hit_units

	for _, unit in pairs({
		player_damage = 0,
		hit_pos = pos,
		range = range,
		collision_slotmask = slot_mask,
		curve_pow = CarryData.EXPLOSION_SETTINGS.curve_pow,
		damage = CarryData.EXPLOSION_SETTINGS.damage,
		ignore_unit = self._unit
	}) do
		if unit ~= self._unit then
			slot15 = unit

			if unit.carry_data(slot14) then
				slot15 = mvec1
				slot18 = unit

				mvector3.set(slot14, unit.position(slot17))

				slot16 = mvec1
				local distance = mvector3.distance(slot14, pos)
				slot21 = 0
				slot18 = math.max(slot19, distance - range / 2) / range
				local chance = math.lerp(pos, 1, 0)
				slot17 = 1

				if math.rand(1) < chance then
					slot17 = splinters

					for i_splinter, s_pos in ipairs(slot16) do
						slot30 = "report"
						local ray_hit = not World.raycast(slot21, World, "ray", s_pos, mvec1, "slot_mask", slot_mask, "ignore_unit", {
							self._unit,
							unit
						})

						if ray_hit then
							slot23 = unit
							slot24 = 0

							unit.carry_data(slot22).start_explosion(slot22, unit.carry_data(slot22))

							break
						end
					end
				end
			end
		end
	end

	slot10 = managers.network
	slot14 = CarryData.EVENT_IDS.explode

	managers.network.session(slot9).send_to_peers_synched(slot9, managers.network.session(slot9), "sync_unit_event_id_16", self._unit, "carry_data")

	slot11 = 0

	self._unit.set_slot(slot9, self._unit)

	return 
end
function CarryData:_local_player_explosion_damage()
	slot3 = self._unit
	local pos = self._unit.position(slot2)
	local range = CarryData.EXPLOSION_SETTINGS.range
	slot8 = CarryData.EXPLOSION_SETTINGS.player_damage

	managers.explosion.give_local_player_dmg(slot4, managers.explosion, pos, range)

	return 
end
function CarryData:sync_net_event(event_id)
	if event_id == CarryData.EVENT_IDS.explode then
		local range = CarryData.EXPLOSION_SETTINGS.range
		slot5 = self

		self._local_player_explosion_damage(slot4)

		slot8 = self._unit
		slot12 = CarryData.EXPLOSION_CUSTOM_PARAMS

		managers.explosion.explode_on_client(slot4, managers.explosion, self._unit.position(slot7), math.UP, nil, CarryData.EXPLOSION_SETTINGS.damage, range, CarryData.EXPLOSION_SETTINGS.curve_pow)
	elseif event_id == CarryData.EVENT_IDS.will_explode then
		slot4 = self

		self._start_explosion(slot3)
	end

	return 
end
function CarryData:clbk_out_of_world()
	if self._bodies_to_revert then
		slot3 = self._bodies_to_revert

		for i_body, body in ipairs(slot2) do
			slot8 = body

			body.set_dynamic(slot7)
		end

		self._bodies_to_revert = nil
		self._register_out_of_world_dynamic_clbk_id = nil

		return 
	else
		slot3 = self._unit

		if self._unit.position(slot2).z < PlayerMovement.OUT_OF_WORLD_Z then
			self._bodies_to_revert = {}
			slot3 = self._unit
			local bodies = self._unit.num_bodies(slot2)

			for i_body = 0, bodies - 1, 1 do
				slot9 = i_body
				local body = self._unit.body(slot7, self._unit)
				slot9 = body

				if body.enabled(self._unit) then
					slot9 = body

					if body.dynamic(slot8) then
						slot10 = body

						table.insert(slot8, self._bodies_to_revert)

						slot9 = body

						body.set_keyframed(slot8)
					end
				end
			end

			local tracker = managers.navigation.create_nav_tracker(slot3, managers.navigation, self._unit.position(false))
			slot5 = self._unit
			slot8 = tracker

			self._unit.set_position(managers.navigation, tracker.field_position(self._unit))

			slot6 = tracker

			managers.navigation.destroy_nav_tracker(managers.navigation, managers.navigation)

			self._register_out_of_world_dynamic_clbk_id = "BagOutOfWorldDynamic" .. tostring(self._unit.key(self._unit))
			slot11 = "clbk_out_of_world"
			slot10 = TimerManager
			slot10 = TimerManager.game(self)
			slot8 = TimerManager.game(self).time(self) + 0.2

			managers.enemy.add_delayed_clbk(tostring(self._unit.key(self._unit)), managers.enemy, self._register_out_of_world_dynamic_clbk_id, callback(self._unit, self, self))

			self._register_out_of_world_clbk_id = nil

			return 
		end
	end

	slot9 = "clbk_out_of_world"
	slot8 = TimerManager
	slot8 = TimerManager.game(self)

	managers.enemy.add_delayed_clbk(slot2, managers.enemy, self._register_out_of_world_clbk_id, callback(TimerManager.game(self).time(self) + 2, self, self))

	return 
end
function CarryData:carry_id()
	return self._carry_id
end
function CarryData:set_carry_id(carry_id)
	self._carry_id = carry_id
	self._register_steal_SO_clbk_id = "CarryDataregiserSO" .. tostring(self._unit.key(slot6))
	slot10 = "clbk_register_steal_SO"
	slot7 = 0

	managers.enemy.add_delayed_clbk(tostring(self._unit.key(slot6)), managers.enemy, self._register_steal_SO_clbk_id, callback(self._unit, self, self))

	return 
end
function CarryData:clbk_register_steal_SO(carry_id)
	self._register_steal_SO_clbk_id = nil
	slot4 = self

	self._chk_register_steal_SO(slot3)

	return 
end
function CarryData:set_dye_initiated(initiated)
	self._dye_initiated = initiated

	return 
end
function CarryData:dye_initiated()
	return self._dye_initiated
end
function CarryData:has_dye_pack()
	return self._has_dye_pack
end
function CarryData:dye_value_multiplier()
	return self._dye_value_multiplier
end
function CarryData:set_dye_pack_data(dye_initiated, has_dye_pack, dye_value_multiplier)
	self._dye_initiated = dye_initiated
	self._has_dye_pack = has_dye_pack
	self._dye_value_multiplier = dye_value_multiplier
	slot6 = Network

	if not Network.is_server(slot5) then
		return 
	end

	if self._has_dye_pack then
		self._dye_risk = {}
		slot8 = 3
		self._dye_risk.next_t = Application.time(slot6) + 2 + math.random(Application)
	end

	return 
end
function CarryData:dye_pack_data()
	return self._dye_initiated, self._has_dye_pack, self._dye_value_multiplier
end
function CarryData:_disable_dye_pack()
	self._dye_risk = false

	return 
end
function CarryData:value()
	return self._value
end
function CarryData:set_value(value)
	self._value = value

	return 
end
function CarryData:multiplier()
	return self._multiplier
end
function CarryData:set_multiplier(multiplier)
	self._multiplier = multiplier

	return 
end
function CarryData:sequence_clbk_secured()
	slot3 = self

	self._disable_dye_pack(slot2)

	return 
end
function CarryData:_unregister_steal_SO()
	if not self._steal_SO_data then
		return 
	end

	if self._steal_SO_data.SO_registered then
		slot3 = managers.groupai
		slot4 = self._steal_SO_data.SO_id

		managers.groupai.state(slot2).remove_special_objective(slot2, managers.groupai.state(slot2))

		slot3 = managers.groupai
		slot3 = managers.groupai.state(slot2)
		slot6 = self._unit

		managers.groupai.state(slot2).unregister_loot(slot2, self._unit.key(slot5))
	elseif self._steal_SO_data.thief then
		local thief = self._steal_SO_data.thief
		self._steal_SO_data.thief = nil

		if self._steal_SO_data.picked_up then
			slot4 = self

			self.unlink(slot3)
		end

		slot4 = thief

		if alive(slot3) then
			slot4 = thief
			slot5 = nil

			thief.brain(slot3).set_objective(slot3, thief.brain(slot3))
		end
	end

	self._steal_SO_data = nil

	return 
end
function CarryData:_chk_register_steal_SO()

	-- Decompilation error in this vicinity:
	slot4 = "hinge_body_1"

	if not self._unit.body(slot2, self._unit) then
		slot4 = 0
		local body = self._unit.body(slot2, self._unit)
	end

	if not self._has_body_activation_clbk then
		slot5 = body
		slot3 = body.key(slot4)
		self._has_body_activation_clbk = {
			[slot3] = true
		}
		slot4 = self._unit
		slot9 = "clbk_body_active_state"

		self._unit.add_body_activation_callback(slot3, callback(slot6, self, self))

		slot4 = body
		slot7 = "bag_moving"

		body.set_activate_tag(slot3, Idstring(slot6))

		slot4 = body
		slot7 = "bag_still"

		body.set_deactivate_tag(slot3, Idstring(slot6))
	end

	slot4 = Network
	local tweak_info = tweak_data.carry[self._carry_id]
	local AI_carry = tweak_info.AI_carry

	if not AI_carry then
		return 
	end

	if self._steal_SO_data then
		return 
	end

	slot6 = body
	local is_body_active = body.active(slot5)

	if is_body_active then
		return 
	end

	local SO_category = AI_carry.SO_category
	slot9 = SO_category
	local SO_filter = managers.navigation.convert_SO_AI_group_to_access(slot7, managers.navigation)
	slot12 = self._unit
	local tracker_pickup = managers.navigation.create_nav_tracker(managers.navigation, managers.navigation, self._unit.position(false))
	local pickup_nav_seg = tracker_pickup.nav_segment(managers.navigation)
	local pickup_pos = tracker_pickup.field_position(tracker_pickup)
	slot12 = managers.groupai
	slot13 = pickup_nav_seg
	local pickup_area = managers.groupai.state(tracker_pickup).get_area_from_nav_seg_id(tracker_pickup, managers.groupai.state(tracker_pickup))
	slot14 = tracker_pickup

	managers.navigation.destroy_nav_tracker(managers.groupai.state(tracker_pickup), managers.navigation)

	if pickup_area.enemy_loot_drop_points then
		return 
	end

	local drop_pos, drop_nav_seg, drop_area = nil
	slot16 = managers.groupai
	slot17 = pickup_nav_seg
	local drop_point = managers.groupai.state(slot15).get_safe_enemy_loot_drop_point(slot15, managers.groupai.state(slot15))

	if drop_point then
		slot17 = drop_point.pos
		drop_pos = mvector3.copy(slot16)
		drop_nav_seg = drop_point.nav_seg
		drop_area = drop_point.area
	elseif not self._register_steal_SO_clbk_id then
		self._register_steal_SO_clbk_id = "CarryDataregiserSO" .. tostring(self._unit.key(slot19))
		slot23 = "clbk_register_steal_SO"
		slot22 = TimerManager
		slot22 = TimerManager.game(self)
		slot20 = TimerManager.game(self).time(self) + 10

		managers.enemy.add_delayed_clbk(tostring(self._unit.key(slot19)), managers.enemy, self._register_steal_SO_clbk_id, callback(self._unit, self, self))

		return 
	end

	local drop_objective = {
		type = "act",
		interrupt_health = 0.9,
		action_duration = 2,
		haste = "walk",
		pose = "crouch",
		interrupt_dis = 700,
		nav_seg = drop_nav_seg,
		pos = drop_pos,
		area = drop_area
	}
	slot20 = "on_secure_SO_failed"
	drop_objective.fail_clbk = callback(slot17, self, self)
	slot20 = "on_secure_SO_completed"
	drop_objective.complete_clbk = callback(slot17, self, self)
	drop_objective.action = {
		variant = "untie",
		align_sync = true,
		body_part = 1,
		type = "act"
	}
	local pickup_objective = {
		destroy_clbk_key = false,
		type = "act",
		haste = "run",
		interrupt_health = 0.9,
		pose = "crouch",
		interrupt_dis = 700,
		nav_seg = pickup_nav_seg,
		area = pickup_area,
		pos = pickup_pos
	}
	slot21 = "on_pickup_SO_failed"
	pickup_objective.fail_clbk = callback(self, self, self)
	slot21 = "on_pickup_SO_completed"
	pickup_objective.complete_clbk = callback(self, self, self)
	pickup_objective.action = {
		variant = "untie",
		align_sync = true,
		body_part = 1,
		type = "act"
	}
	slot20 = 2.5
	pickup_objective.action_duration = math.lerp(self, 1, math.random())
	pickup_objective.followup_objective = drop_objective
	local so_descriptor = {
		interval = 0,
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = pickup_objective,
		search_pos = pickup_objective.pos
	}
	slot22 = "clbk_pickup_SO_verification"
	so_descriptor.verification_clbk = callback(1, self, self)
	so_descriptor.AI_group = AI_carry.SO_category
	so_descriptor.admin_clbk = callback(1, self, self)
	slot23 = self._unit
	local so_id = "carrysteal" .. tostring(self._unit.key("on_pickup_SO_administered"))
	self._steal_SO_data = {
		SO_registered = true,
		picked_up = false,
		SO_id = so_id,
		pickup_area = pickup_area,
		pickup_objective = pickup_objective
	}
	slot21 = managers.groupai
	slot23 = so_descriptor

	managers.groupai.state(self).add_special_objective(self, managers.groupai.state(self), so_id)

	slot21 = managers.groupai
	slot23 = pickup_area

	managers.groupai.state(self).register_loot(self, managers.groupai.state(self), self._unit)

	return 
end
function CarryData:clbk_pickup_SO_verification(candidate_unit)
	if not self._steal_SO_data or not self._steal_SO_data.SO_id then
		slot7 = candidate_unit
		slot10 = self._steal_SO_data

		debug_pause_unit(slot3, self._unit, "[CarryData:clbk_pickup_SO_verification] SO is not registered", self._unit, inspect(slot9))

		return 
	end

	slot4 = candidate_unit
	slot4 = candidate_unit.movement(slot3)

	if candidate_unit.movement(slot3).cool(slot3) then
		return 
	end

	slot4 = candidate_unit
	slot4 = candidate_unit.movement(slot3)
	slot4 = candidate_unit.movement(slot3).nav_tracker(slot3)
	local nav_seg = candidate_unit.movement(slot3).nav_tracker(slot3).nav_segment(slot3)

	if not self._steal_SO_data.pickup_area.nav_segs[nav_seg] then
		return 
	end

	slot5 = candidate_unit
	slot5 = candidate_unit.base(slot4)

	if not candidate_unit.base(slot4).char_tweak(slot4).steal_loot then
		return 
	end

	return true
end
function CarryData:on_pickup_SO_administered(thief)
	if self._steal_SO_data.thief then
		slot6 = self._steal_SO_data.thief

		debug_pause(slot3, "[CarryData:on_pickup_SO_administered] Already had a thief!!!!", thief)
	end

	self._steal_SO_data.thief = thief
	self._steal_SO_data.SO_registered = false
	slot4 = managers.groupai
	slot4 = managers.groupai.state(false)
	slot7 = self._unit

	managers.groupai.state(false).unregister_loot(false, self._unit.key(slot6))

	return 
end
function CarryData:on_pickup_SO_completed(thief)
	if thief ~= self._steal_SO_data.thief then
		slot6 = thief

		debug_pause_unit(slot3, thief, "[CarryData:on_pickup_SO_completed] idiot thinks he is stealing")

		return 
	end

	self._steal_SO_data.picked_up = true
	slot5 = thief

	self.link_to(true, self)

	return 
end
function CarryData:on_pickup_SO_failed(thief)
	if not self._steal_SO_data.thief then
		return 
	end

	if thief ~= self._steal_SO_data.thief then
		slot6 = thief

		debug_pause_unit(slot3, thief, "[CarryData:on_pickup_SO_failed] idiot thinks he is stealing")

		return 
	end

	self._steal_SO_data = nil
	slot4 = self

	self._chk_register_steal_SO(slot3)

	return 
end
function CarryData:on_secure_SO_completed(thief)
	if thief ~= self._steal_SO_data.thief then
		slot6 = thief

		debug_pause_unit(slot3, sympathy_civ, "[CarryData:on_secure_SO_completed] idiot thinks he is stealing")

		return 
	end

	self._steal_SO_data = nil
	slot5 = "loot_lost"

	managers.mission.call_global_event(slot3, managers.mission)

	self._steal_SO_data = nil
	slot4 = self

	self.unlink(slot3)

	return 
end
function CarryData:on_secure_SO_failed(thief)
	if not self._steal_SO_data.thief then
		return 
	end

	if thief ~= self._steal_SO_data.thief then
		slot6 = thief

		debug_pause_unit(slot3, thief, "[CarryData:on_pickup_SO_failed] idiot thinks he is stealing")

		return 
	end

	self._steal_SO_data = nil
	slot4 = self

	self._chk_register_steal_SO(slot3)

	slot4 = self

	self.unlink(slot3)

	return 
end
function CarryData:link_to(parent_unit)
	slot5 = "hinge_body_1"

	if not self._unit.body(slot3, self._unit) then
		slot5 = 0
		local body = self._unit.body(slot3, self._unit)
	end

	slot5 = body

	body.set_keyframed(slot4)

	local parent_obj_name = Idstring(slot4)
	slot8 = self._unit

	parent_unit.link("Neck", parent_unit, parent_obj_name)

	slot7 = parent_obj_name
	local parent_obj = parent_unit.get_object("Neck", parent_unit)
	local parent_obj_rot = parent_obj.rotation(parent_unit)
	slot9 = parent_obj_rot
	slot9 = parent_obj_rot
	local world_pos = parent_obj.position(parent_obj) - parent_obj_rot.z(parent_obj) * 30 - parent_obj_rot.y(parent_obj) * 10

	self._unit.set_position(parent_obj, self._unit)

	slot9 = parent_obj_rot.x(world_pos)
	slot12 = parent_obj_rot
	slot10 = -parent_obj_rot.z(parent_obj_rot)
	local world_rot = Rotation(parent_obj, slot9)
	slot11 = world_rot

	self._unit.set_rotation(slot9, self._unit)

	self._disabled_collisions = {}
	slot10 = self._unit
	local nr_bodies = self._unit.num_bodies(slot9)

	for i_body = 0, nr_bodies - 1, 1 do
		slot16 = i_body
		local body = self._unit.body(slot14, self._unit)
		slot16 = body

		if body.collisions_enabled(self._unit) then
			slot17 = body

			table.insert(slot15, self._disabled_collisions)

			slot17 = false

			body.set_collisions_enabled(slot15, body)
		end
	end

	slot11 = Network

	if Network.is_server(slot10) then
		slot11 = managers.network
		slot14 = parent_unit

		managers.network.session(slot10).send_to_peers_synched(slot10, managers.network.session(slot10), "loot_link", self._unit)
	end

	return 
end
function CarryData:unlink()
	slot3 = self._unit

	self._unit.unlink(slot2)

	slot4 = "hinge_body_1"

	if not self._unit.body(slot2, self._unit) then
		slot4 = 0
		local body = self._unit.body(slot2, self._unit)
	end

	slot4 = body

	body.set_dynamic(slot3)

	if self._disabled_collisions then
		slot4 = self._disabled_collisions

		for _, body in ipairs(slot3) do
			slot10 = true

			body.set_collisions_enabled(slot8, body)
		end

		self._disabled_collisions = nil
	end

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = managers.network
		slot7 = self._unit

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "loot_link", self._unit)
	end

	return 
end
function CarryData:clbk_body_active_state(tag, unit, body, activated)
	slot8 = body

	if not self._has_body_activation_clbk[body.key(slot7)] then
		return 
	end

	if activated then
		if not self._steal_SO_data or not self._steal_SO_data.picked_up then
			slot7 = self

			self._unregister_steal_SO(slot6)
		end

		if not self._register_out_of_world_clbk_id then
			self._register_out_of_world_clbk_id = "BagOutOfWorld" .. tostring(self._unit.key(slot9))
			slot13 = "clbk_out_of_world"
			slot12 = TimerManager
			slot12 = TimerManager.game(self)
			slot10 = TimerManager.game(self).time(self) + 2

			managers.enemy.add_delayed_clbk(tostring(self._unit.key(slot9)), managers.enemy, self._register_out_of_world_clbk_id, callback(self._unit, self, self))
		end
	else
		slot7 = self

		self._chk_register_steal_SO(slot6)

		if self._register_out_of_world_clbk_id then
			slot8 = self._register_out_of_world_clbk_id

			managers.enemy.remove_delayed_clbk(slot6, managers.enemy)

			self._register_out_of_world_clbk_id = nil
		end
	end

	return 
end
function CarryData:clbk_send_link()
	slot3 = self._unit

	if alive(slot2) and self._steal_SO_data and self._steal_SO_data.thief and self._steal_SO_data.picked_up then
		slot3 = managers.network
		slot6 = self._steal_SO_data.thief

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "loot_link", self._unit)
	end

	return 
end
function CarryData:set_zipline_unit(zipline_unit)
	self._zipline_unit = zipline_unit
	slot4 = Network

	if not Network.is_server(slot3) then
		return 
	end

	if self._zipline_unit then
		slot4 = self._zipline_unit
		slot4 = self._zipline_unit.zipline(slot3)
	elseif not self._zipline_unit and self._saved_attention_data then
		slot4 = self._saved_attention_data

		for attention_id, attention_data in pairs(slot3) do
			slot9 = self._unit
			slot10 = attention_data

			self._unit.attention(slot8).add_attention(slot8, self._unit.attention(slot8))
		end

		self._saved_attention_data = nil
	end

	return 
end
function CarryData:is_attached_to_zipline_unit()
	return self._zipline_unit and true
end
function CarryData:_on_load_attach_to_zipline(zipline_unit)
	slot4 = zipline_unit

	if alive(slot3) then
		slot4 = zipline_unit
		slot5 = self._unit

		zipline_unit.zipline(slot3).attach_bag(slot3, zipline_unit.zipline(slot3))
	end

	return 
end
function CarryData:on_thrown()
	return 
end
function CarryData:on_pickup()
	return 
end
function CarryData:save(data)
	local state = {
		carry_id = self._carry_id,
		value = self._value,
		dye_initiated = self._dye_initiated,
		has_dye_pack = self._has_dye_pack,
		dye_value_multiplier = self._dye_value_multiplier
	}

	if self._steal_SO_data and self._steal_SO_data.picked_up then
		slot11 = self._unit
		slot11 = "clbk_send_link"
		slot10 = TimerManager

		managers.enemy.add_delayed_clbk(slot4, managers.enemy, "send_loot_link" .. tostring(self._unit.key(TimerManager.game(self))), callback(TimerManager.game(self).time(self) + 0.1, self, self))
	end

	if self._zipline_unit then
		slot5 = self._zipline_unit
		slot3 = self._zipline_unit.editor_id(slot4)
	end

	data.zip_line_unit_id = slot3
	data.CarryData = state

	return 
end
function CarryData:load(data)
	local state = data.CarryData
	self._carry_id = state.carry_id
	self._value = state.value
	self._dye_initiated = state.dye_initiated
	self._has_dye_pack = state.has_dye_pack
	self._dye_value_multiplier = state.dye_value_multiplier

	if data.zip_line_unit_id then
	end

	return 
end
function CarryData:destroy()
	if self._register_steal_SO_clbk_id then
		slot4 = self._register_steal_SO_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._register_steal_SO_clbk_id = nil
	end

	if self._register_out_of_world_clbk_id then
		slot4 = self._register_out_of_world_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._register_out_of_world_clbk_id = nil
	end

	if self._register_out_of_world_dynamic_clbk_id then
		slot4 = self._register_out_of_world_dynamic_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._register_out_of_world_dynamic_clbk_id = nil
	end

	slot3 = self

	self._unregister_steal_SO(slot2)

	return 
end
function CarryData:set_latest_peer_id(peer_id)
	self._latest_peer_id = peer_id

	return 
end
function CarryData:latest_peer_id()
	return self._latest_peer_id
end

return 
