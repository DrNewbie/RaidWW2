ThrowableAmmoBag = ThrowableAmmoBag or class()
ThrowableAmmoBag.LEVEL = {
	1.2,
	1.4,
	1.6
}
slot2 = "units/vanilla/equipment/equip_throwable_ammo_bag/equip_throwable_ammo_bag"
local ammo_bag_ids = Idstring()
ThrowableAmmoBag.spawn = function (pos, dir, level_idx, user_unit)
	slot6 = Network

	if Network.is_server(slot5) then
		slot8 = pos
		local ammo_bag_unit = World.spawn_unit(slot5, World, ammo_bag_ids, Rotation())
		slot7 = ammo_bag_unit
		slot7 = ammo_bag_unit.base(World)
		slot5 = ammo_bag_unit.base(World).set_user_unit

		if not user_unit then
			slot10 = managers.player
			slot8 = managers.player.player_unit(slot9)
		end

		slot5(slot6, slot7)

		slot7 = ammo_bag_unit
		slot7 = ammo_bag_unit.base(slot6)

		ammo_bag_unit.base(slot6).register_collision_callbacks(slot6)

		slot8 = level_idx

		ThrowableAmmoBag.set_level(slot6, ammo_bag_unit)

		slot8 = dir

		ThrowableAmmoBag.throw_bag(slot6, ammo_bag_unit)

		slot7 = managers.network
		slot10 = dir

		managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_throw_ammo_bag", ammo_bag_unit)

		slot7 = managers.network
		slot10 = level_idx

		managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_ammo_bag_level", ammo_bag_unit)
	else
		slot6 = managers.network
		slot10 = level_idx

		managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_spawn_ammo_bag", pos, dir)
	end

	return 
end
ThrowableAmmoBag.throw_bag = function (unit, dir)
	slot5 = unit

	managers.player.switch_carry_to_ragdoll(slot3, managers.player)

	slot6 = dir * 800

	unit.push(slot3, unit, 100)

	return 
end
ThrowableAmmoBag.set_level = function (unit, level_idx)
	slot4 = unit
	slot5 = ThrowableAmmoBag.LEVEL[level_idx]

	unit.pickup(slot3).set_multiplier(slot3, unit.pickup(slot3))

	return 
end
ThrowableAmmoBag.interact_pickup = function (unit, player_unit, owner_peer_id)
	if unit.interaction and player_unit.inventory then
		slot5 = player_unit
		slot5 = player_unit.inventory(slot4)

		if player_unit.inventory(slot4).need_ammo(slot4) then
			slot5 = unit
			slot6 = player_unit

			unit.interaction(slot4).interact(slot4, unit.interaction(slot4))

			slot5 = managers.network
			slot6 = owner_peer_id
			local peer = managers.network.session(slot4).peer(slot4, managers.network.session(slot4))

			if peer then
			end

			return true
		end
	end

	return false
end
ThrowableAmmoBag.init = function (self, unit)
	self._unit = unit
	slot5 = "all_criminals_no_player"
	self._slotmask_criminals = managers.slot.get_mask(slot3, managers.slot)

	return 
end
ThrowableAmmoBag.set_user_unit = function (self, user_unit)
	self._user_unit = user_unit
	slot4 = managers.network
	slot5 = user_unit
	slot4 = managers.network.session(slot3).peer_by_unit(slot3, managers.network.session(slot3))
	self._peer_id = managers.network.session(slot3).peer_by_unit(slot3, managers.network.session(slot3)).id(slot3)

	return 
end
ThrowableAmmoBag.update = function (self, unit, t, dt)
	slot6 = Network

	if Network.is_server(slot5) and not self._waiting_for_response then
		local player_unit = managers.player.player_unit(slot5)
		slot7 = self._unit
		local num_bodies = self._unit.num_bodies(managers.player) - 1

		for i = 1, num_bodies, 1 do
			slot13 = i
			local body = self._unit.body(slot11, self._unit)
			slot15 = self._slotmask_criminals
			local overlapping = body.get_overlapping_bodies(self._unit, body, "slot_mask")

			if overlapping then
				slot14 = overlapping

				for _, b in pairs(slot13) do
					slot19 = b
					local overlapping_unit = b.unit(slot18)

					if overlapping_unit ~= self._user_unit then
						if overlapping_unit == player_unit then
							slot22 = self._peer_id

							if self.interact_pickup(slot19, self._unit, player_unit) then
								slot20 = self

								self._clear(slot19)

								return 
							end
						else
							slot20 = managers.network
							slot21 = overlapping_unit
							local peer = managers.network.session(slot19).peer_by_unit(slot19, managers.network.session(slot19))
							slot21 = managers.network
							slot26 = self._peer_id

							managers.network.session(managers.network.session(slot19)).send_to_peer(managers.network.session(slot19), managers.network.session(managers.network.session(slot19)), peer, "sync_ammo_bag_hit_player", overlapping_unit, self._unit)

							self._waiting_for_response = true

							return 
						end
					end
				end
			end
		end
	end

	return 
end
ThrowableAmmoBag.register_collision_callbacks = function (self)
	slot8 = "_collision_callback"

	self._unit.set_body_collision_callback(slot2, callback(slot5, self, self))

	slot4 = self._unit

	for i = 0, self._unit.num_bodies(self._unit) - 1, 1 do
		slot8 = i
		local body = self._unit.body(slot6, self._unit)
		slot8 = body
		slot11 = "throw"

		body.set_collision_script_tag(self._unit, Idstring(slot10))

		slot9 = 1

		body.set_collision_script_filter(self._unit, body)

		slot9 = 1

		body.set_collision_script_quiet_time(self._unit, body)
	end

	return 
end
ThrowableAmmoBag.from_client_response = function (self, picked_up)
	if picked_up then
		slot4 = self

		self._clear(slot3)
	else
		self._waiting_for_response = nil
	end

	return 
end
ThrowableAmmoBag._collision_callback = function (self, tag, unit, body, other_unit, other_body, position, normal, velocity, ...)
	slot11 = self

	self._clear(slot10)

	return 
end
ThrowableAmmoBag.destroy = function (self)
	slot3 = self._unit

	self._unit.clear_body_collision_callbacks(slot2)

	return 
end
ThrowableAmmoBag._clear = function (self)
	if self._unit then
		slot3 = self._unit

		if alive(slot2) then
			slot6 = "base"

			self._unit.set_extension_update_enabled(slot2, self._unit, Idstring(false))

			slot3 = self._unit

			self._unit.clear_body_collision_callbacks(slot2)
		end
	end

	return 
end

return 
