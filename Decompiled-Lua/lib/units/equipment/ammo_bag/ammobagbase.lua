if not AmmoBagBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

AmmoBagBase = slot0
local dec_mul = 10000
AmmoBagBase.spawn = function (pos, rot, ammo_upgrade_lvl, peer_id)
	local unit_name = "removed during cleanup"
	slot10 = unit_name
	slot10 = rot
	local unit = World.spawn_unit(slot6, World, Idstring(slot9), pos)
	slot8 = managers.network
	slot12 = peer_id or 0

	managers.network.session(World).send_to_peers_synched(slot7, managers.network.session(World), "sync_equipment_setup", unit, ammo_upgrade_lvl)

	slot8 = unit
	slot9 = ammo_upgrade_lvl

	unit.base(slot7).setup(slot7, unit.base(slot7))

	return unit
end
AmmoBagBase.set_server_information = function (self, peer_id)
	self._server_information = {
		owner_peer_id = peer_id
	}
	slot4 = managers.network
	slot5 = peer_id
	slot5 = true

	managers.network.session(slot3).peer(slot3, managers.network.session(slot3)).set_used_deployable(slot3, managers.network.session(slot3).peer(slot3, managers.network.session(slot3)))

	return 
end
AmmoBagBase.server_information = function (self)
	return self._server_information
end
AmmoBagBase.init = function (self, unit)
	slot6 = false

	UnitBase.init(slot3, self, unit)

	self._unit = unit
	self._is_attachable = true
	slot8 = 1
	slot3 = managers.player.upgrade_value_by_level(self, managers.player, "ammo_bag", "ammo_increase")
	self._max_ammo_amount = tweak_data.upgrades.ammo_bag_base + slot3
	slot4 = self._unit
	slot5 = "ammo_bag_drop"

	self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))

	slot4 = Network

	if Network.is_client(slot3) then
		self._validate_clbk_id = "ammo_bag_validate" .. tostring(unit.key(slot6))
		slot10 = "_clbk_validate"
		slot9 = Application
		slot7 = Application.time(self) + 60

		managers.enemy.add_delayed_clbk(tostring(unit.key(slot6)), managers.enemy, self._validate_clbk_id, callback(unit, self, self))
	end

	return 
end
AmmoBagBase._clbk_validate = function (self)
	self._validate_clbk_id = nil

	if not self._was_dropin then
		slot3 = managers.network
		local peer = managers.network.session(slot2).server_peer(slot2)
		slot5 = VoteManager.REASON.many_assets

		peer.mark_cheater(managers.network.session(slot2), peer)
	end

	return 
end
AmmoBagBase.sync_setup = function (self, ammo_upgrade_lvl, peer_id)
	if self._validate_clbk_id then
		slot6 = self._validate_clbk_id

		managers.enemy.remove_delayed_clbk(slot4, managers.enemy)

		self._validate_clbk_id = nil
	end

	slot7 = "ammo_bag"

	managers.player.verify_equipment(slot4, managers.player, peer_id)

	slot6 = ammo_upgrade_lvl

	self.setup(slot4, self)

	return 
end
AmmoBagBase.setup = function (self, ammo_upgrade_lvl)
	slot8 = ammo_upgrade_lvl
	slot3 = managers.player.upgrade_value_by_level(slot4, managers.player, "ammo_bag", "ammo_increase")
	self._ammo_amount = tweak_data.upgrades.ammo_bag_base + slot3
	slot4 = self

	self._set_visual_stage(slot3)

	slot4 = Network

	if Network.is_server(slot3) and self._is_attachable then
		slot5 = self._unit
		slot5 = self._unit.rotation(self._unit)
		local from_pos = self._unit.position(slot3) + self._unit.rotation(self._unit).z(self._unit) * 10
		slot6 = self._unit
		slot6 = self._unit.rotation(self._unit)
		local to_pos = self._unit.position(self._unit) + self._unit.rotation(self._unit).z(self._unit) * -10
		slot10 = "slot_mask"
		slot14 = "world_geometry"
		local ray = self._unit.raycast(self._unit, self._unit, "ray", from_pos, to_pos, managers.slot.get_mask(slot12, managers.slot))

		if ray then
			self._attached_data = {
				body = ray.body
			}
			slot8 = ray.body
			self._attached_data.position = ray.body.position(slot7)
			slot8 = ray.body
			self._attached_data.rotation = ray.body.rotation(slot7)
			self._attached_data.index = 1
			self._attached_data.max_index = 3
			slot10 = "base"
			slot9 = true

			self._unit.set_extension_update_enabled(3, self._unit, Idstring(slot9))
		end
	end

	return 
end
AmmoBagBase.update = function (self, unit, t, dt)
	slot6 = self

	self._check_body(slot5)

	return 
end
AmmoBagBase._check_body = function (self)
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
AmmoBagBase.server_set_dynamic = function (self)
	slot3 = self

	self._set_dynamic(slot2)

	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot7 = 1

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_unit_event_id_16", self._unit, "base")
	end

	return 
end
AmmoBagBase.sync_net_event = function (self, event_id)
	slot4 = self

	self._set_dynamic(slot3)

	return 
end
AmmoBagBase._set_dynamic = function (self)
	self._is_dynamic = true
	slot4 = "dynamic"
	slot4 = true

	self._unit.body(slot2, self._unit).set_enabled(slot2, self._unit.body(slot2, self._unit))

	return 
end
AmmoBagBase.take_ammo = function (self, unit)
	if self._empty then
		return 
	end

	slot5 = unit
	local taken = self._take_ammo(slot3, self)

	if 0 < taken then
		slot5 = unit
		slot6 = "pickup_ammo"

		unit.sound(slot4).play(slot4, unit.sound(slot4))

		if self._ammo_amount <= 0 then
			taken = self._max_ammo_amount
		end

		slot5 = managers.network
		slot8 = taken

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_ammo_bag_ammo_taken", self._unit)
	end

	if self._ammo_amount <= 0 then
		slot5 = self

		self._set_empty(slot4)
	else
		slot5 = self

		self._set_visual_stage(slot4)
	end

	return 0 < taken
end
AmmoBagBase._set_visual_stage = function (self)
	local percentage = self._ammo_amount / self._max_ammo_amount
	slot4 = self._unit

	if self._unit.damage(slot3) then
		slot5 = percentage * 6
		local state = "state_" .. math.ceil(slot4)
		slot5 = self._unit
		slot6 = state

		if self._unit.damage(slot4).has_sequence(slot4, self._unit.damage(slot4)) then
			slot5 = self._unit
			slot6 = state

			self._unit.damage(slot4).run_sequence_simple(slot4, self._unit.damage(slot4))
		end
	end

	return 
end
AmmoBagBase.sync_ammo_taken = function (self, amount)
	slot5 = amount
	amount = self.round_value(slot3, self)
	slot5 = self._ammo_amount - amount
	self._ammo_amount = self.round_value(slot3, self)

	if self._ammo_amount <= 0 then
		slot4 = self

		self._set_empty(slot3)
	else
		slot4 = self

		self._set_visual_stage(slot3)
	end

	return 
end
AmmoBagBase._take_ammo = function (self, unit)
	local taken = 0
	slot5 = unit
	local inventory = unit.inventory(slot4)

	if inventory then
		slot8 = inventory

		for _, weapon in pairs(inventory.available_selections(slot7)) do
			slot14 = weapon.unit
			slot15 = self._ammo_amount
			local took = self.round_value(slot10, weapon.unit.base(slot13).add_ammo_from_bag(slot13, weapon.unit.base(slot13)))
			taken = taken + took
			slot13 = self._ammo_amount - took
			self._ammo_amount = self.round_value(self, self)

			if self._ammo_amount <= 0 then
				slot12 = self

				self._set_empty(slot11)

				return taken
			end
		end
	end

	return taken
end
AmmoBagBase._set_empty = function (self)
	self._ammo_amount = 0
	self._empty = true
	slot4 = 0

	self._unit.set_slot(slot2, self._unit)

	return 
end
AmmoBagBase.save = function (self, data)
	local state = {
		ammo_amount = self._ammo_amount,
		is_dynamic = self._is_dynamic
	}
	data.AmmoBagBase = state

	return 
end
AmmoBagBase.load = function (self, data)
	local state = data.AmmoBagBase
	self._ammo_amount = state.ammo_amount

	if state.is_dynamic then
		slot5 = self

		self._set_dynamic(slot4)
	end

	slot5 = self

	self._set_visual_stage(slot4)

	self._was_dropin = true

	return 
end
AmmoBagBase.round_value = function (self, val)
	slot4 = val * dec_mul

	return math.floor(slot3) / dec_mul
end
AmmoBagBase.destroy = function (self)
	if self._validate_clbk_id then
		slot4 = self._validate_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._validate_clbk_id = nil
	end

	return 
end

if not CustomAmmoBagBase then
	slot3 = AmmoBagBase
	slot1 = class(slot2)
end

CustomAmmoBagBase = slot1
CustomAmmoBagBase.init = function (self, unit)
	slot5 = unit

	CustomAmmoBagBase.super.init(slot3, self)

	self._is_attachable = self.is_attachable or false

	if self._validate_clbk_id then
		slot5 = self._validate_clbk_id

		managers.enemy.remove_delayed_clbk(slot3, managers.enemy)

		self._validate_clbk_id = nil
	end

	slot5 = self.upgrade_lvl or 0

	self.setup(slot3, self)

	return 
end
CustomAmmoBagBase._set_empty = function (self)
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

if not CustomAmmoBag then
	slot3 = AmmoBagBase
	slot1 = class(slot2)
end

CustomAmmoBag = slot1
CustomAmmoBag.init = function (self, unit)
	slot6 = false

	AmmoBagBase.init(slot3, self, unit)

	slot4 = self

	self.setup(slot3)

	return 
end
CustomAmmoBag._take_ammo = function (self, unit)
	local taken = 0
	slot5 = unit
	local inventory = unit.inventory(slot4)

	if inventory then
		slot8 = inventory

		for _, weapon in pairs(inventory.available_selections(slot7)) do
			slot11 = weapon.unit
			slot13 = nil
			local picked_up, took = weapon.unit.base(slot10).add_ammo(slot10, weapon.unit.base(slot10), 1)
			slot14 = took
			took = self.round_value(1, self)
			taken = taken + took
		end

		self._ammo_amount = 0
		slot6 = self

		self._set_empty(slot5)
	end

	return taken
end

return 
