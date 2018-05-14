if not FirstAidKitBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

FirstAidKitBase = slot0
FirstAidKitBase.spawn = function (pos, rot, upgrade_lvl, peer_id)
	local unit_name = "units/pd2_dlc_old_hoxton/equipment/gen_equipment_first_aid_kit/gen_equipment_first_aid_kit"
	slot10 = unit_name
	slot10 = rot
	local unit = World.spawn_unit(slot6, World, Idstring(slot9), pos)
	slot8 = managers.network
	slot12 = peer_id or 0

	managers.network.session(World).send_to_peers_synched(slot7, managers.network.session(World), "sync_equipment_setup", unit, upgrade_lvl)

	slot8 = unit
	slot9 = upgrade_lvl

	unit.base(slot7).setup(slot7, unit.base(slot7))

	return unit
end
FirstAidKitBase.set_server_information = function (self, peer_id)
	self._server_information = {
		owner_peer_id = peer_id
	}
	slot4 = managers.network
	slot5 = peer_id
	slot5 = true

	managers.network.session(slot3).peer(slot3, managers.network.session(slot3)).set_used_deployable(slot3, managers.network.session(slot3).peer(slot3, managers.network.session(slot3)))

	return 
end
FirstAidKitBase.server_information = function (self)
	return self._server_information
end
FirstAidKitBase.init = function (self, unit)
	slot6 = false

	UnitBase.init(slot3, self, unit)

	self._unit = unit
	slot4 = self._unit
	slot5 = "ammo_bag_drop"

	self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))

	slot4 = Network

	if Network.is_client(slot3) then
		self._validate_clbk_id = "first_aid_kit_validate" .. tostring(unit.key(slot6))
		slot10 = "_clbk_validate"
		slot9 = Application
		slot7 = Application.time(self) + 60

		managers.enemy.add_delayed_clbk(tostring(unit.key(slot6)), managers.enemy, self._validate_clbk_id, callback(unit, self, self))
	end

	return 
end
FirstAidKitBase._clbk_validate = function (self)
	self._validate_clbk_id = nil

	if not self._was_dropin then
		slot3 = managers.network
		local peer = managers.network.session(slot2).server_peer(slot2)
		slot5 = VoteManager.REASON.many_assets

		peer.mark_cheater(managers.network.session(slot2), peer)
	end

	return 
end
FirstAidKitBase.sync_setup = function (self, upgrade_lvl, peer_id)
	if self._validate_clbk_id then
		slot6 = self._validate_clbk_id

		managers.enemy.remove_delayed_clbk(slot4, managers.enemy)

		self._validate_clbk_id = nil
	end

	slot7 = "first_aid_kit"

	managers.player.verify_equipment(slot4, managers.player, peer_id)

	slot6 = upgrade_lvl

	self.setup(slot4, self)

	return 
end
FirstAidKitBase.setup = function (self, upgrade_lvl)
	self._damage_reduction_upgrade = upgrade_lvl == 1
	slot4 = Network

	if Network.is_server(slot3) then
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
FirstAidKitBase.update = function (self, unit, t, dt)
	slot6 = self

	self._check_body(slot5)

	return 
end
FirstAidKitBase._check_body = function (self)
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
FirstAidKitBase.server_set_dynamic = function (self)
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
FirstAidKitBase.sync_net_event = function (self, event_id)
	if event_id == 1 then
		slot4 = self

		self._set_dynamic(slot3)
	elseif event_id == 2 then
		slot4 = self

		self._set_empty(slot3)
	end

	return 
end
FirstAidKitBase._set_dynamic = function (self)
	self._is_dynamic = true
	slot4 = "dynamic"
	slot4 = true

	self._unit.body(slot2, self._unit).set_enabled(slot2, self._unit.body(slot2, self._unit))

	return 
end
FirstAidKitBase.take = function (self, unit)
	if self._empty then
		return 
	end

	slot4 = unit
	slot4 = unit.character_damage(slot3)

	unit.character_damage(slot3).band_aid_health(slot3)

	if self._damage_reduction_upgrade then
		slot6 = "first_aid_damage_reduction"

		managers.player.activate_temporary_upgrade(slot3, managers.player, "temporary")
	end

	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot8 = 2

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_unit_event_id_16", self._unit, "base")
	end

	slot4 = self

	self._set_empty(slot3)

	return 
end
FirstAidKitBase._set_empty = function (self)
	self._empty = true
	slot4 = 0

	self._unit.set_slot(slot2, self._unit)

	return 
end
FirstAidKitBase.save = function (self, data)
	local state = {
		is_dynamic = self._is_dynamic
	}
	data.FirstAidKitBase = state

	return 
end
FirstAidKitBase.load = function (self, data)
	local state = data.FirstAidKitBase

	if state.is_dynamic then
		slot5 = self

		self._set_dynamic(slot4)
	end

	self._was_dropin = true

	return 
end
FirstAidKitBase.destroy = function (self)
	if self._validate_clbk_id then
		slot4 = self._validate_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._validate_clbk_id = nil
	end

	return 
end

return 
