-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not GrenadeCrateBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

GrenadeCrateBase = slot0
GrenadeCrateBase.spawn = function (pos, rot)
	local unit_name = "removed during cleanup"
	slot8 = unit_name
	slot8 = rot
	local unit = World.spawn_unit(slot4, World, Idstring(slot7), pos)
	slot6 = managers.network
	slot10 = 1

	managers.network.session(World).send_to_peers_synched(World, managers.network.session(World), "sync_unit_event_id_16", unit, "sync")

	return unit
end
GrenadeCrateBase.set_server_information = function (self, peer_id)
	self._server_information = {
		owner_peer_id = peer_id
	}

	return 
end
GrenadeCrateBase.server_information = function (self)
	return self._server_information
end
GrenadeCrateBase.init = function (self, unit)
	slot6 = false

	UnitBase.init(slot3, self, unit)

	self._unit = unit
	self._is_attachable = true
	self._max_grenade_amount = tweak_data.upgrades.grenade_crate_base
	slot4 = self._unit
	slot5 = "ammo_bag_drop"

	self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))

	slot4 = self

	self.setup(slot3)

	return 
end
GrenadeCrateBase.setup = function (self)
	self._grenade_amount = self._max_grenade_amount or tweak_data.upgrades.grenade_crate_base
	self._empty = false
	slot3 = self

	self._set_visual_stage(slot2)

	slot3 = Network

	if Network.is_server(slot2) and self._is_attachable then
		slot4 = self._unit
		slot4 = self._unit.rotation(self._unit)
		local from_pos = self._unit.position(slot2) + self._unit.rotation(self._unit).z(self._unit) * 10
		slot5 = self._unit
		slot5 = self._unit.rotation(self._unit)
		local to_pos = self._unit.position(self._unit) + self._unit.rotation(self._unit).z(self._unit) * -10
		slot9 = "slot_mask"
		slot13 = "world_geometry"
		local ray = self._unit.raycast(self._unit, self._unit, "ray", from_pos, to_pos, managers.slot.get_mask(slot11, managers.slot))

		if ray then
			self._attached_data = {
				body = ray.body
			}
			slot7 = ray.body
			self._attached_data.position = ray.body.position(slot6)
			slot7 = ray.body
			self._attached_data.rotation = ray.body.rotation(slot6)
			self._attached_data.index = 1
			self._attached_data.max_index = 3
			slot9 = "base"
			slot8 = true

			self._unit.set_extension_update_enabled(3, self._unit, Idstring(slot8))
		end
	end

	return 
end
GrenadeCrateBase.update = function (self, unit, t, dt)
	slot6 = self

	self._check_body(slot5)

	return 
end
GrenadeCrateBase._check_body = function (self)
	if self._is_dynamic then
		return 
	end

	slot3 = self._attached_data.body

	if not alive(slot2) then
		slot3 = self

		self.server_set_dynamic(slot2)

		return 
	end

	if self._attached_data.index == 1 then
		slot3 = self._attached_data.body

		if not self._attached_data.body.enabled(slot2) then
			slot3 = self

			self.server_set_dynamic(slot2)
		end
	elseif self._attached_data.index == 2 then
		slot3 = self._attached_data.rotation
		slot6 = self._attached_data.body

		if not mrotation.equal(slot2, self._attached_data.body.rotation(slot5)) then
			slot3 = self

			self.server_set_dynamic(slot2)
		end
	elseif self._attached_data.index == 3 then
		slot3 = self._attached_data.position
		slot6 = self._attached_data.body

		if mvector3.not_equal(slot2, self._attached_data.body.position(slot5)) then
			slot3 = self

			self.server_set_dynamic(slot2)
		end
	end

	self._attached_data.index = ((self._attached_data.index < self._attached_data.max_index and self._attached_data.index) or 0) + 1

	return 
end
GrenadeCrateBase.server_set_dynamic = function (self)
	slot3 = self

	self._set_dynamic(slot2)

	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot7 = 2

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_unit_event_id_16", self._unit, "base")
	end

	return 
end
GrenadeCrateBase.sync_net_event = function (self, event_id, peer)
	if event_id == 1 then
		if peer then
			slot5 = managers.player
			slot8 = peer

			managers.player.register_grenade(slot4, peer.id(slot7))
		end

		slot6 = 1

		self.sync_grenade_taken(slot4, self)
	elseif event_id == 2 then
		slot5 = self

		self._set_dynamic(slot4)
	end

	return 
end
GrenadeCrateBase._set_dynamic = function (self)
	self._is_dynamic = true
	slot4 = "dynamic"
	slot4 = true

	self._unit.body(slot2, self._unit).set_enabled(slot2, self._unit.body(slot2, self._unit))

	return 
end
GrenadeCrateBase.take_grenade = function (self, unit)
	if self._empty then
		return 
	end

	slot4 = self
	local can_take_grenade = (self._can_take_grenade(slot3) and 1) or 0

	if can_take_grenade == 1 then
		slot5 = unit
		slot6 = "pickup_ammo"

		unit.sound(slot4).play(slot4, unit.sound(slot4))

		slot6 = 1

		managers.player.add_grenade_amount(slot4, managers.player)

		slot5 = managers.network
		slot9 = 1

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_unit_event_id_16", self._unit, "base")

		slot5 = managers.player
		slot8 = managers.network
		slot8 = managers.network.session(self._unit)
		slot8 = managers.network.session(self._unit).local_peer(self._unit)

		managers.player.register_grenade(slot4, managers.network.session(self._unit).local_peer(self._unit).id(self._unit))

		self._grenade_amount = self._grenade_amount - 1
		slot5 = "Took " .. 1 .. " grenades, " .. self._grenade_amount .. " left"

		print(slot4)
	end

	if self._grenade_amount <= 0 then
		slot5 = self

		self._set_empty(slot4)
	end

	slot5 = self

	self._set_visual_stage(slot4)

	return can_take_grenade
end
GrenadeCrateBase._set_visual_stage = function (self)
	slot3 = self._unit

	if alive(slot2) then
		slot3 = self._unit

		if self._unit.damage(slot2) then
			slot8 = self._max_grenade_amount
			local state = "state_" .. tostring(math.clamp(slot5, self._max_grenade_amount - self._grenade_amount, 0))
			slot4 = self._unit
			slot5 = state

			if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
				slot4 = self._unit
				slot5 = state

				self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))
			end
		end
	end

	return 
end
GrenadeCrateBase.sync_grenade_taken = function (self, amount)
	self._grenade_amount = self._grenade_amount - amount

	if self._grenade_amount <= 0 then
		slot4 = self

		self._set_empty(slot3)
	end

	slot4 = self

	self._set_visual_stage(slot3)

	return 
end
GrenadeCrateBase._can_take_grenade = function (self, unit)
	return true
end
GrenadeCrateBase._set_empty = function (self)

	-- Decompilation error in this vicinity:
	self._empty = true
	slot3 = self._unit

	if alive(slot2) then
		slot3 = self._unit
		slot4 = false

		self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2))
	end

	return 
end
GrenadeCrateBase.save = function (self, data)
	local state = {
		grenade_amount = self._grenade_amount,
		is_dynamic = self._is_dynamic
	}
	data.GrenadeCrateBase = state

	return 
end
GrenadeCrateBase.load = function (self, data)
	local state = data.GrenadeCrateBase
	self._grenade_amount = state.grenade_amount

	if state.is_dynamic then
		slot5 = self

		self._set_dynamic(slot4)
	end

	if self._grenade_amount <= 0 then
		slot5 = self

		self._set_empty(slot4)
	end

	slot5 = self

	self._set_visual_stage(slot4)

	return 
end
GrenadeCrateBase.destroy = function (self)
	return 
end

if not CustomGrenadeCrateBase then
	slot2 = GrenadeCrateBase
	slot0 = class(slot1)
end

CustomGrenadeCrateBase = slot0
CustomGrenadeCrateBase.init = function (self, unit)
	slot6 = false

	UnitBase.init(slot3, self, unit)

	self._unit = unit
	self._is_attachable = self.is_attachable or false
	self._max_grenade_amount = self.max_grenade_amount or tweak_data.upgrades.grenade_crate_base
	slot4 = self

	self.setup(slot3)

	return 
end
CustomGrenadeCrateBase._set_empty = function (self)
	self._empty = true
	slot3 = self._unit

	if alive(slot2) then
		slot3 = self._unit
		slot4 = false

		self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2))
	end

	slot3 = self._unit
	slot4 = "empty"

	if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
		slot3 = self._unit
		slot4 = "empty"

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	end

	return 
end
GrenadeCrateSync = GrenadeCrateSync or class()
GrenadeCrateSync.init = function (self, unit)
	slot4 = Network

	if Network.is_client(slot3) then
		self._validate_clbk_id = "grenade_crate_validate" .. tostring(unit.key(slot6))
		slot10 = "_clbk_validate"
		slot9 = Application
		slot7 = Application.time(self) + 60

		managers.enemy.add_delayed_clbk(tostring(unit.key(slot6)), managers.enemy, self._validate_clbk_id, callback(unit, self, self))
	end

	return 
end
GrenadeCrateSync.sync_net_event = function (self, event_id)
	if self._validate_clbk_id then
		slot5 = self._validate_clbk_id

		managers.enemy.remove_delayed_clbk(slot3, managers.enemy)

		self._validate_clbk_id = nil
	end

	slot6 = "grenade_crate"

	managers.player.verify_equipment(slot3, managers.player, 0)

	return 
end
GrenadeCrateSync.load = function (self, save_data)
	self._was_dropin = true

	return 
end
GrenadeCrateSync.destroy = function (self)
	if self._validate_clbk_id then
		slot4 = self._validate_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._validate_clbk_id = nil
	end

	return 
end
GrenadeCrateSync._clbk_validate = function (self)
	self._validate_clbk_id = nil

	if not self._was_dropin then
		slot3 = managers.network
		local peer = managers.network.session(slot2).server_peer(slot2)
		slot5 = VoteManager.REASON.many_assets

		peer.mark_cheater(managers.network.session(slot2), peer)
	end

	return 
end

return 
