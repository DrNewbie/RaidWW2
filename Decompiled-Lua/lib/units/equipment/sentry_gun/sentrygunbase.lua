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
if not SentryGunBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

SentryGunBase = slot0
SentryGunBase.init = function (self, unit)
	slot6 = false

	SentryGunBase.super.init(slot3, self, unit)

	self._unit = unit

	if self._place_snd_event then
		slot4 = self._unit
		slot5 = self._place_snd_event

		self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))
	end

	slot4 = Network

	if Network.is_client(slot3) and not self._skip_authentication then
		self._validate_clbk_id = "sentry_gun_validate" .. tostring(unit.key(slot6))
		slot10 = "_clbk_validate"
		slot9 = Application
		slot7 = Application.time(self) + 60

		managers.enemy.add_delayed_clbk(tostring(unit.key(slot6)), managers.enemy, self._validate_clbk_id, callback(unit, self, self))
	end

	return 
end
SentryGunBase._clbk_validate = function (self)
	self._validate_clbk_id = nil

	if not self._was_dropin then
		slot3 = managers.network
		local peer = managers.network.session(slot2).server_peer(slot2)
		slot5 = VoteManager.REASON.many_assets

		peer.mark_cheater(managers.network.session(slot2), peer)
	end

	return 
end
SentryGunBase.sync_setup = function (self, upgrade_lvl, peer_id)
	if self._validate_clbk_id then
		slot6 = self._validate_clbk_id

		managers.enemy.remove_delayed_clbk(slot4, managers.enemy)

		self._validate_clbk_id = nil
	end

	slot7 = "sentry_gun"

	managers.player.verify_equipment(slot4, managers.player, peer_id)

	slot5 = self

	self._setup_contour(slot4)

	return 
end
SentryGunBase.set_owner_id = function (self, owner_id)
	self._owner_id = owner_id
	slot4 = self

	self._setup_contour(slot3)

	return 
end
SentryGunBase.is_owner = function (self)
	if self._owner_id then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)
		slot4 = managers.network.session(slot3).local_peer(slot3)

		return self._owner_id == managers.network.session(slot3).local_peer(slot3).id(slot3)
	end
end
SentryGunBase._setup_contour = function (self)
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)
	local turret_units = managers.groupai.state(slot2).turrets(slot2)

	if turret_units then
		slot5 = self._unit

		if table.contains(slot3, turret_units) then
			return 
		end
	end

	slot6 = "can_reload"

	if managers.player.has_category_upgrade(slot3, managers.player, "sentry_gun") then
		slot4 = self._unit
		slot5 = "deployable_interactable"

		self._unit.contour(slot3).add(slot3, self._unit.contour(slot3))
	else
		slot4 = self

		if self.is_owner(slot3) then
			slot4 = self._unit
			slot5 = "deployable_active"

			self._unit.contour(slot3).add(slot3, self._unit.contour(slot3))
		end
	end

	return 
end
SentryGunBase.post_init = function (self)
	if self._difficulty_sequences then
		local difficulty = (Global.game_settings and Global.game_settings.difficulty) or Global.DEFAULT_DIFFICULTY
		slot5 = difficulty
		local difficulty_index = tweak_data.difficulty_to_index(slot3, tweak_data)
		slot6 = ";"
		local difficulty_sequences_split = string.split(tweak_data, self._difficulty_sequences)
		local difficulty_sequence = difficulty_sequences_split[difficulty_index]

		if difficulty_sequence and difficulty_sequence ~= "" then
			slot7 = self._unit
			slot8 = difficulty_sequence

			if self._unit.damage(slot6).has_sequence(slot6, self._unit.damage(slot6)) then
				slot7 = self._unit
				slot8 = difficulty_sequence

				self._unit.damage(slot6).run_sequence_simple(slot6, self._unit.damage(slot6))
			end
		end
	end

	slot3 = Network

	if Network.is_client(slot2) then
		slot3 = self._unit
		slot4 = true

		self._unit.brain(slot2).set_active(slot2, self._unit.brain(slot2))
	end

	return 
end
SentryGunBase.spawn = function (owner, pos, rot, ammo_multiplier, armor_multiplier, damage_multiplier, peer_id, verify_equipment)
	return 
end
SentryGunBase.spawn_from_sequence = function (self, align_obj_name, module_id)
	return 
end
SentryGunBase.activate_as_module = function (self, team_type, tweak_table_id)
	self._tweak_table_id = tweak_table_id
	slot6 = team_type
	local team_id = tweak_data.levels.get_default_team_ID(slot4, tweak_data.levels)
	slot6 = managers.groupai
	slot7 = team_id
	local team_data = managers.groupai.state(tweak_data.levels).team_data(tweak_data.levels, managers.groupai.state(tweak_data.levels))
	slot7 = self._unit
	slot8 = team_data

	self._unit.movement(managers.groupai.state(tweak_data.levels)).set_team(managers.groupai.state(tweak_data.levels), self._unit.movement(managers.groupai.state(tweak_data.levels)))

	slot7 = self._unit
	slot8 = tweak_table_id

	self._unit.movement(managers.groupai.state(tweak_data.levels)).on_activated(managers.groupai.state(tweak_data.levels), self._unit.movement(managers.groupai.state(tweak_data.levels)))

	local weapon_setup_data = {
		auto_reload = true,
		expend_ammo = true,
		spread_mul = 1,
		autoaim = true,
		alert_AI = false,
		ignore_units = {
			self._unit
		}
	}
	slot9 = "bullet_impact_targets"
	weapon_setup_data.bullet_slotmask = managers.slot.get_mask(self._unit, managers.slot)
	slot8 = self._unit
	slot10 = 1

	self._unit.weapon(self._unit).setup(self._unit, self._unit.weapon(self._unit), weapon_setup_data)

	slot8 = Network

	if Network.is_server(self._unit) then
		slot8 = self._unit
		slot9 = tweak_data.weapon[tweak_table_id].CLIP_SIZE

		self._unit.weapon(slot7).set_ammo(slot7, self._unit.weapon(slot7))
	end

	slot8 = self._unit
	slot10 = tweak_data.weapon[tweak_table_id].SHIELD_HEALTH_INIT

	self._unit.character_damage(slot7).set_health(slot7, self._unit.character_damage(slot7), tweak_data.weapon[tweak_table_id].HEALTH_INIT)

	slot8 = self._unit
	slot9 = 1

	self._unit.brain(slot7).setup(slot7, self._unit.brain(slot7))

	slot8 = self._unit
	slot9 = tweak_table_id

	self._unit.brain(slot7).on_activated(slot7, self._unit.brain(slot7))

	slot8 = self._unit
	slot9 = true

	self._unit.brain(slot7).set_active(slot7, self._unit.brain(slot7))

	self._is_module = true
	slot8 = managers.groupai
	slot9 = self._unit

	managers.groupai.state(slot7).register_turret(slot7, managers.groupai.state(slot7))

	return 
end
SentryGunBase.deactivate_as_module = function (self)
	slot3 = self._unit
	slot3 = self._unit.movement(slot2)

	self._unit.movement(slot2).on_deactivated(slot2)

	slot3 = self._unit
	slot4 = false

	self._unit.brain(slot2).set_active(slot2, self._unit.brain(slot2))

	slot3 = self

	self.on_death(slot2)

	return 
end
SentryGunBase.get_name_id = function (self)
	return self._tweak_table_id
end
SentryGunBase.set_server_information = function (self, peer_id)
	self._server_information = {
		owner_peer_id = peer_id
	}
	slot4 = managers.network
	slot5 = peer_id
	slot5 = true

	managers.network.session(slot3).peer(slot3, managers.network.session(slot3)).set_used_deployable(slot3, managers.network.session(slot3).peer(slot3, managers.network.session(slot3)))

	return 
end
SentryGunBase.server_information = function (self)
	return self._server_information
end
SentryGunBase.setup = function (self, owner, ammo_multiplier, armor_multiplier, damage_multiplier, spread_multiplier, rot_speed_multiplier, has_shield, attached_data)
	slot11 = Network

	if Network.is_client(slot10) and not self._skip_authentication then
		self._validate_clbk_id = "sentry_gun_validate" .. tostring(unit.key(slot13))
		slot17 = "_clbk_validate"
		slot16 = Application
		slot14 = Application.time(self) + 60

		managers.enemy.add_delayed_clbk(tostring(unit.key(slot13)), managers.enemy, self._validate_clbk_id, callback(unit, self, self))
	end

	self._attached_data = attached_data
	self._ammo_multiplier = ammo_multiplier
	self._armor_multiplier = armor_multiplier
	self._damage_multiplier = damage_multiplier
	self._spread_multiplier = spread_multiplier
	self._rot_speed_multiplier = rot_speed_multiplier

	if has_shield then
		slot11 = self

		self.enable_shield(slot10)
	end

	local ammo_amount = tweak_data.upgrades.sentry_gun_base_ammo * ammo_multiplier
	slot12 = self._unit
	slot13 = ammo_amount

	self._unit.weapon(slot11).set_ammo(slot11, self._unit.weapon(slot11))

	local armor_amount = tweak_data.upgrades.sentry_gun_base_armor * armor_multiplier
	slot13 = self._unit
	slot15 = 0

	self._unit.character_damage(self._unit.weapon(slot11)).set_health(self._unit.weapon(slot11), self._unit.character_damage(self._unit.weapon(slot11)), armor_amount)

	self._owner = owner

	if owner then
		slot13 = managers.network
		slot14 = owner
		local peer = managers.network.session(slot12).peer_by_unit(slot12, managers.network.session(slot12))

		if peer then
			slot14 = peer
			self._owner_id = peer.id(slot13)
		end
	end

	slot13 = self._unit
	slot14 = rot_speed_multiplier

	self._unit.movement(slot12).setup(slot12, self._unit.movement(slot12))

	slot13 = self._unit
	slot14 = 1 / rot_speed_multiplier

	self._unit.brain(slot12).setup(slot12, self._unit.brain(slot12))

	slot13 = self

	self.register(slot12)

	if owner then
		slot13 = self._unit
		slot13 = self._unit.movement(slot12)
		slot16 = owner
		slot16 = owner.movement(slot15)

		self._unit.movement(slot12).set_team(slot12, owner.movement(slot15).team(slot15))
	end

	local setup_data = {
		expend_ammo = true,
		autoaim = true,
		alert_AI = true,
		creates_alerts = true,
		user_unit = self._owner,
		ignore_units = {
			self._unit,
			self._owner
		}
	}
	slot14 = self._owner
	slot14 = self._owner.brain(self._owner)
	setup_data.alert_filter = self._owner.brain(self._owner).SO_access(self._owner)
	setup_data.spread_mul = spread_multiplier
	slot14 = self._unit
	slot16 = damage_multiplier

	self._unit.weapon(self._owner).setup(self._owner, self._unit.weapon(self._owner), setup_data)

	slot14 = self

	self._setup_contour(self._owner)

	return true
end
SentryGunBase.get_owner = function (self)
	return self._owner
end
SentryGunBase.update = function (self, unit, t, dt)
	slot6 = self

	self._check_body(slot5)

	return 
end
SentryGunBase._check_body = function (self)
	if not self._attached_data then
		return 
	end

	if self._attached_data.index == 1 then
		slot3 = self._attached_data.body

		if not self._attached_data.body.enabled(slot2) then
			slot5 = self._unit
			self._attached_data = self._attach(slot2, nil, nil)

			if not self._attached_data then
				slot3 = self

				self.remove(slot2)

				return 
			end
		end
	elseif self._attached_data.index == 2 then
		slot3 = self._attached_data.body
	elseif self._attached_data.index == 3 then
		slot3 = self._attached_data.body
	end

	self._attached_data.index = ((self._attached_data.index < self._attached_data.max_index and self._attached_data.index) or 0) + 1

	return 
end
SentryGunBase.remove = function (self)
	self._removed = true
	slot4 = 0

	self._unit.set_slot(slot2, self._unit)

	return 
end
SentryGunBase._attach = function (pos, rot, sentrygun_unit)
	if not pos then
		slot5 = sentrygun_unit
		pos = sentrygun_unit.position(slot4)
	end

	if not rot then
		slot5 = sentrygun_unit
		rot = sentrygun_unit.rotation(slot4)
	end

	local from_pos = pos + rot.z(slot4) * 10
	slot6 = rot
	local to_pos = pos + rot.z(rot) * -10
	local ray = nil

	if sentrygun_unit then
		slot12 = "slot_mask"
		slot16 = "world_geometry"
		ray = sentrygun_unit.raycast(slot7, sentrygun_unit, "ray", from_pos, to_pos, managers.slot.get_mask(slot14, managers.slot))
	else
		slot12 = "slot_mask"
		slot16 = "world_geometry"
		ray = World.raycast(slot7, World, "ray", from_pos, to_pos, managers.slot.get_mask(slot14, managers.slot))
	end

	if ray then
		local attached_data = {
			max_index = 3,
			index = 1,
			body = ray.body
		}
		slot9 = ray.body
		attached_data.position = ray.body.position(slot8)
		slot9 = ray.body
		attached_data.rotation = ray.body.rotation(slot8)

		return attached_data
	end

	return 
end
SentryGunBase.set_visibility_state = function (self, stage)
	local state = stage and true

	if self._visibility_state ~= state then
		slot6 = state

		self._unit.set_visible(slot4, self._unit)

		self._visibility_state = state
	end

	self._lod_stage = stage

	return 
end
SentryGunBase.contour_selected = function (self)
	slot3 = self._unit
	slot4 = "deployable_selected"

	self._unit.contour(slot2).add(slot2, self._unit.contour(slot2))

	return 
end
SentryGunBase.contour_unselected = function (self)
	slot3 = self._unit
	slot4 = "deployable_selected"

	self._unit.contour(slot2).remove(slot2, self._unit.contour(slot2))

	return 
end
SentryGunBase.weapon_tweak_data = function (self)
	slot4 = self._unit

	return tweak_data.weapon[self._unit.weapon(slot3)._name_id]
end
SentryGunBase.check_interact_blocked = function (self, player)

	-- Decompilation error in this vicinity:
	slot4 = self._unit

	return result
end
SentryGunBase.can_interact = function (self, player)
	slot5 = player

	return not self.check_interact_blocked(slot3, self)
end
SentryGunBase.show_blocked_hint = function (self, interaction_tweak_data, player, skip_hint)
	slot9 = skip_hint

	print(slot5, "SentryGunBase:show_blocked_hint", interaction_tweak_data, player)

	return 
end
local refill_ratios = {
	1,
	0.9375,
	0.875,
	0.8125,
	0.75,
	0.6875,
	0.625,
	0.5625,
	0.5,
	0.4375,
	0.375,
	0.3125,
	0.25,
	0.1875,
	0.125,
	0.0625
}
SentryGunBase.get_net_event_id = function (self, player)
	local sentry_gun_reload_ratio = tweak_data.upgrades.sentry_gun_reload_ratio or 1

	if sentry_gun_reload_ratio == 0 then
		return 1
	end

	slot5 = self._unit
	slot5 = self._unit.weapon(slot4)
	local ammo_needed = 1 - self._unit.weapon(slot4).ammo_ratio(slot4)
	local ammo_got = 0
	local i = 0
	slot10 = player
	slot10 = player.inventory(slot9)

	for id, weapon in pairs(player.inventory(slot9).available_selections(slot9)) do
		slot13 = weapon.unit
		slot13 = weapon.unit.base(slot12)
		ammo_got = ammo_got + weapon.unit.base(slot12).get_ammo_ratio(slot12)
		i = i + 1
	end

	slot9 = 1
	ammo_got = ammo_got / math.max(slot7, i)
	local ammo_wanted = ammo_needed
	local wanted_event_id = nil
	local index = 1

	repeat
		if not refill_ratios[index] then
			break
		elseif refill_ratios[index] <= ammo_wanted then
			wanted_event_id = index
		end

		index = index + 1
	until wanted_event_id

	local ammo_possible = ammo_got / sentry_gun_reload_ratio
	local possible_event_id = nil
	local index = 1

	repeat
		if not refill_ratios[index] then
			break
		elseif refill_ratios[index] <= ammo_possible then
			possible_event_id = index
		end

		index = index + 1
	until possible_event_id

	if wanted_event_id and possible_event_id then
		slot15 = possible_event_id
		local event_id = math.max(slot13, wanted_event_id)
	end

	return event_id, wanted_event_id, possible_event_id
end
SentryGunBase.interaction_text_id = function (self)
	return "debug_interact_sentry_gun_reload"
end
SentryGunBase.add_string_macros = function (self, macroes)

	-- Decompilation error in this vicinity:
	slot4 = self
	slot7 = managers.player
	local event_id, wanted_event_id, possible_event_id = self.get_net_event_id(slot3, managers.player.local_player(slot6))
end
SentryGunBase.sync_net_event = function (self, event_id, peer)
	slot5 = peer
	local player = peer.unit(slot4)
	local ammo_ratio = refill_ratios[event_id]
	slot8 = ammo_ratio

	self.refill(slot6, self)

	slot7 = player

	if alive(slot6) then
		slot9 = managers.player

		if alive(managers.player.local_player(slot8)) then
			slot8 = managers.player
			slot8 = managers.player.local_player(player)

			if player.key(slot6) == managers.player.local_player(player).key(player) then
				local sentry_gun_reload_ratio = tweak_data.upgrades.sentry_gun_reload_ratio or 1

				if 0 < sentry_gun_reload_ratio then
					local ammo_reduction = ammo_ratio * sentry_gun_reload_ratio
					local leftover = 0
					local weapon_list = {}
					slot13 = player
					slot13 = player.inventory(slot12)

					for id, weapon in pairs(player.inventory(slot12).available_selections(slot12)) do
						slot16 = weapon.unit
						slot16 = weapon.unit.base(slot15)
						local ammo_ratio = weapon.unit.base(slot15).get_ammo_ratio(slot15)

						if ammo_ratio < ammo_reduction then
							leftover = (leftover + ammo_reduction) - ammo_ratio
							weapon_list[id] = {
								unit = weapon.unit,
								amount = ammo_ratio,
								total = ammo_ratio
							}
						else
							weapon_list[id] = {
								unit = weapon.unit,
								amount = ammo_reduction,
								total = ammo_ratio
							}
						end
					end

					slot11 = weapon_list

					for id, data in pairs(slot10) do
						local ammo_left = data.total - data.amount

						if 0 < leftover and 0 < ammo_left then
							local extra_ammo = (ammo_left < leftover and ammo_left) or leftover
							leftover = leftover - extra_ammo
							data.amount = data.amount + extra_ammo
						end

						if 0 < data.amount then
							slot17 = data.unit
							slot18 = data.amount

							data.unit.base(slot16).reduce_ammo_by_procentage_of_total(slot16, data.unit.base(slot16))

							slot18 = id
							slot21 = data.unit
							slot21 = data.unit.base(slot20)

							managers.hud.set_ammo_amount(slot16, managers.hud, data.unit.base(slot20).ammo_info(slot20))
						end
					end

					if 0 < leftover then
						slot12 = "[SentryGunBase:sync_net_event]: Not all ammo was reducted from the weapons"

						Application.error(slot10, Application)
					end
				end
			end
		end
	end

	return 
end
SentryGunBase.refill = function (self, ammo_ratio)
	slot4 = self._unit
	slot4 = self._unit.character_damage(slot3)

	if self._unit.character_damage(slot3).dead(slot3) then
		return 
	end

	slot4 = Network

	if Network.is_server(slot3) then
		slot4 = self._unit
		local ammo_total = self._unit.weapon(slot3).ammo_total(slot3)
		slot5 = self._unit
		local ammo_max = self._unit.weapon(self._unit.weapon(slot3)).ammo_max(self._unit.weapon(slot3))
		slot6 = self._unit
		slot6 = self._unit.weapon(self._unit.weapon(self._unit.weapon(slot3)))
		slot9 = ammo_max * ammo_ratio

		self._unit.weapon(self._unit.weapon(self._unit.weapon(slot3))).change_ammo(self._unit.weapon(self._unit.weapon(slot3)), math.ceil(slot8))
	else
		slot5 = true

		self.set_waiting_for_refill(slot3, self)
	end

	slot4 = self._unit
	slot4 = self._unit.brain(slot3)

	self._unit.brain(slot3).switch_on(slot3)

	slot4 = self._unit
	slot5 = true

	self._unit.interaction(slot3).set_dirty(slot3, self._unit.interaction(slot3))

	slot4 = self

	self._setup_contour(slot3)

	slot4 = self._unit
	slot5 = "deployable_disabled"

	self._unit.contour(slot3).remove(slot3, self._unit.contour(slot3))

	return 
end
SentryGunBase.set_waiting_for_refill = function (self, state)
	self._waiting_for_refill = (state and true) or nil

	return 
end
SentryGunBase.waiting_for_refill = function (self)
	return self._waiting_for_refill
end
SentryGunBase.on_death = function (self)
	slot3 = self._unit

	if self._unit.contour(slot2) then
		slot3 = self._unit
		slot4 = "deployable_active"

		self._unit.contour(slot2).remove(slot2, self._unit.contour(slot2))

		slot3 = self._unit
		slot4 = "deployable_interactable"

		self._unit.contour(slot2).remove(slot2, self._unit.contour(slot2))
	end

	slot6 = "base"
	slot5 = false

	self._unit.set_extension_update_enabled(slot2, self._unit, Idstring(slot5))

	slot3 = self

	self.unregister(slot2)

	return 
end
SentryGunBase.enable_shield = function (self)
	self._has_shield = true
	slot3 = self._unit
	slot6 = "g_shield"
	slot4 = true

	self._unit.get_object(slot2, Idstring(slot5)).set_visibility(slot2, self._unit.get_object(slot2, Idstring(slot5)))

	slot3 = self._unit
	slot6 = "s_shield"
	slot4 = true

	self._unit.get_object(slot2, Idstring(slot5)).set_visibility(slot2, self._unit.get_object(slot2, Idstring(slot5)))

	slot3 = self._unit
	slot6 = "dm_metal_shield"
	slot5 = true

	self._unit.decal_surface(slot2).set_mesh_enabled(slot2, self._unit.decal_surface(slot2), Idstring(slot5))

	slot4 = "shield"
	slot4 = true

	self._unit.body(slot2, self._unit).set_enabled(slot2, self._unit.body(slot2, self._unit))

	return 
end
SentryGunBase.has_shield = function (self)
	return self._has_shield
end
SentryGunBase.unregister = function (self)
	if self._registered then
		self._registered = nil
		slot3 = managers.groupai
		slot4 = self._unit

		managers.groupai.state(slot2).unregister_criminal(slot2, managers.groupai.state(slot2))
	end

	return 
end
SentryGunBase.register = function (self)
	return 
end
SentryGunBase.save = function (self, save_data)
	local my_save_data = {}
	save_data.base = my_save_data
	my_save_data.tweak_table_id = self._tweak_table_id
	my_save_data.is_module = self._is_module

	return 
end
SentryGunBase.load = function (self, save_data)
	self._was_dropin = true
	local my_save_data = save_data.base

	if not my_save_data then
		return 
	end

	self._tweak_table_id = my_save_data.tweak_table_id
	self._is_module = my_save_data.is_module

	if self._is_module then
		slot5 = managers.groupai
		slot5 = managers.groupai.state(slot4)
		local turret_units = managers.groupai.state(slot4).turrets(slot4)
	end

	return 
end
SentryGunBase.pre_destroy = function (self)
	slot4 = self._unit

	SentryGunBase.super.pre_destroy(slot2, self)

	slot3 = self

	self.unregister(slot2)

	self._removed = true

	if self._validate_clbk_id then
		slot4 = self._validate_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._validate_clbk_id = nil
	end

	return 
end

return 
