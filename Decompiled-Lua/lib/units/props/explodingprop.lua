ExplodingProp = ExplodingProp or class()
ExplodingProp.DETONATE_EVENT_ID = 1
ExplodingProp.EXTENSION = "base"
ExplodingProp.DEFAULT_EXPLODE_EVENT = "grenade_explode"
function ExplodingProp:init(unit)
	self._unit = unit

	return 
end
function ExplodingProp:detonate(pos, range, damage, player_damage)
	if not pos or not range or not damage or not player_damage then
		slot11 = pos
		slot13 = range
		slot15 = damage
		slot17 = player_damage
		slot21 = self._unit
		slot21 = self._unit.name(slot20)
		slot8 = "Invalid parameters sent to ExplodingProp-extension. Pos: " .. tostring(slot10) .. ", Range: " .. tostring(slot12) .. ", Damage: " .. tostring(slot14) .. ", Player damage: " .. tostring(slot16) .. ", Unit: " .. tostring(self._unit.name(slot20).t(slot20))

		Application.error(slot6, Application)

		return 
	else
		slot7 = self._unit

		if self._unit.id(slot6) == -1 then
			slot13 = self._unit
			slot13 = self._unit.name(slot12)
			slot8 = "Unit needs to be network synced when using ExplodingProp-extension. Unit: " .. tostring(self._unit.name(slot12).t(slot12))

			Application.error(slot6, Application)

			return 
		end
	end

	local sound_event = self._explosion_sound_event or ExplodingProp.DEFAULT_EXPLODE_EVENT
	local effect_params = {
		effect = "effects/vanilla/explosions/exp_hand_grenade_001",
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		sound_event = sound_event,
		feedback_range = range * 2
	}
	slot9 = Network

	if Network.is_server(slot8) then
		local normal = math.UP
		local slot_mask = managers.slot.get_mask(slot9, managers.slot)
		local damage_params = {
			curve_pow = 3,
			no_raycast_check_characters = false,
			player_damage = 0,
			hit_pos = pos,
			range = range,
			collision_slotmask = slot_mask,
			damage = damage,
			ignore_unit = self._unit,
			alert_radius = self._alert_radius
		}
		slot15 = player_damage

		managers.explosion.give_local_player_dmg("explosion_targets", managers.explosion, pos, range)

		slot16 = effect_params

		managers.explosion.play_sound_and_effects("explosion_targets", managers.explosion, pos, normal, range)

		slot13 = damage_params

		managers.explosion.detect_and_give_dmg("explosion_targets", managers.explosion)

		slot12 = self._unit

		if self._unit[self.EXTENSION](self.EXTENSION) ~= self then
			slot20 = self._unit
			slot20 = self._unit.name(slot19)
			slot13 = "Invalid extension name on ExplodingProp-extension. Should be \"" .. self.EXTENSION .. "\". Unit: " .. tostring(self._unit.name(slot19).t(slot19))

			Application.error(slot11, Application)
		else
			slot12 = managers.network
			slot16 = ExplodingProp.DETONATE_EVENT_ID

			managers.network.session(slot11).send_to_peers_synched(slot11, managers.network.session(slot11), "sync_unit_event_id_16", self._unit, self.EXTENSION)
		end
	else
		if not self._data_list then
			self._data_list = {}
		end

		slot10 = {
			range = range,
			damage = damage,
			player_damage = player_damage,
			pos = pos,
			effect_params = effect_params
		}

		table.insert(slot8, self._data_list)

		slot9 = self

		self._check_detonation_ready(slot8)
	end

	return 
end
function ExplodingProp:sync_net_event(event_id)
	if event_id == ExplodingProp.DETONATE_EVENT_ID then
		slot4 = self

		self._detonate_on_client(slot3)
	end

	return 
end
function ExplodingProp:_detonate_on_client()
	self._recieved_detonate_on_client = true
	slot3 = self

	self._check_detonation_ready(slot2)

	return 
end
function ExplodingProp:_check_detonation_ready()
	if not self._recieved_detonate_on_client then
		return 
	end

	if self._data_list == nil then
		return 
	end

	slot4 = 1
	local data = table.remove(slot2, self._data_list)
	slot7 = data.player_damage

	managers.explosion.give_local_player_dmg(self._data_list, managers.explosion, data.pos, data.range)

	slot11 = data.effect_params

	managers.explosion.explode_on_client(self._data_list, managers.explosion, data.pos, math.UP, nil, data.damage, data.range, 5)

	slot4 = self._data_list

	if not next(self._data_list) then
		self._data_list = nil
	end

	return 
end

return 
