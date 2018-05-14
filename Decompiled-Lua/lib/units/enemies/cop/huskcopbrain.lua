HuskCopBrain = HuskCopBrain or class()
HuskCopBrain._NET_EVENTS = {
	weapon_laser_off = 2,
	weapon_laser_on = 1
}
function HuskCopBrain:init(unit)
	self._unit = unit

	return 
end
function HuskCopBrain:post_init()
	slot6 = self._unit
	slot2 = tostring(self._unit.key(slot5))
	self._alert_listen_key = "HuskCopBrain" .. slot2
	slot3 = managers.groupai
	slot4 = "criminal"
	local alert_listen_filter = managers.groupai.state(slot2).get_unit_type_filter(slot2, managers.groupai.state(slot2))
	slot4 = managers.groupai
	slot8 = {
		aggression = true,
		bullet = true,
		vo_intimidate = true,
		explosion = true,
		footstep = true,
		vo_cbt = true
	}
	slot11 = self._unit
	slot11 = self._unit.movement("on_alert")

	managers.groupai.state(managers.groupai.state(slot2)).add_alert_listener(managers.groupai.state(slot2), managers.groupai.state(managers.groupai.state(slot2)), self._alert_listen_key, callback(slot7, self, self), alert_listen_filter, self._unit.movement("on_alert").m_head_pos("on_alert"))

	self._last_alert_t = 0
	self._distance_to_target = 100000
	slot4 = self._unit
	slot10 = self._unit
	slot6 = {
		"death"
	}
	slot11 = "clbk_death"

	self._unit.character_damage(managers.groupai.state(slot2)).add_listener(managers.groupai.state(slot2), self._unit.character_damage(managers.groupai.state(slot2)), "HuskCopBrain_death" .. tostring(self._unit.key(self._unit.movement("on_alert").m_head_pos)), callback(self._unit.key, self, self))

	slot5 = BuffEffectManager.EFFECT_ATTACK_ONLY_IN_AIR

	if managers.buff_effect.is_effect_active(managers.groupai.state(slot2), managers.buff_effect) then
		slot4 = self._unit

		if self._unit.damage(slot3) then
			slot4 = self._unit
			slot5 = "halloween_2017"

			if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
				slot4 = self._unit
				slot5 = "halloween_2017"

				self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))
			end
		end
	end

	return 
end
function HuskCopBrain:interaction_voice()
	return self._interaction_voice
end
function HuskCopBrain:on_intimidated(amount, aggressor_unit)
	slot7 = amount * 10
	slot7 = 10
	amount = math.clamp(slot4, math.ceil(slot6), 0)
	slot5 = self._unit
	slot8 = aggressor_unit

	self._unit.network(slot4).send_to_host(slot4, self._unit.network(slot4), "long_dis_interaction", amount)

	return self._interaction_voice
end
function HuskCopBrain:clbk_death(my_unit, damage_info)
	if self._alert_listen_key then
		slot5 = managers.groupai
		slot6 = self._alert_listen_key

		managers.groupai.state(slot4).remove_alert_listener(slot4, managers.groupai.state(slot4))

		self._alert_listen_key = nil
	end

	slot5 = self._unit
	slot5 = self._unit.inventory(slot4)

	if self._unit.inventory(slot4).equipped_unit(slot4) then
		slot5 = self._unit
		slot5 = self._unit.inventory(slot4)
		slot5 = self._unit.inventory(slot4).equipped_unit(slot4)
		slot6 = false

		self._unit.inventory(slot4).equipped_unit(slot4).base(slot4).set_laser_enabled(slot4, self._unit.inventory(slot4).equipped_unit(slot4).base(slot4))
	end

	if self._following_hostage_contour_id then
		slot5 = self._unit
		slot6 = self._following_hostage_contour_id

		self._unit.contour(slot4).remove_by_id(slot4, self._unit.contour(slot4))

		self._following_hostage_contour_id = nil
	end

	return 
end
function HuskCopBrain:set_interaction_voice(voice)
	self._interaction_voice = voice

	return 
end
function HuskCopBrain:load(load_data)
	local my_load_data = load_data.brain
	slot6 = my_load_data.interaction_voice

	self.set_interaction_voice(slot4, self)

	if my_load_data.weapon_laser_on then
		slot6 = self._NET_EVENTS.weapon_laser_on

		self.sync_net_event(slot4, self)
	end

	if my_load_data.trade_flee_contour then
		slot5 = self._unit

		self._unit.contour(slot4).add(slot4, self._unit.contour(slot4), "hostage_trade", nil)
	end

	if my_load_data.following_hostage_contour then
		slot5 = self._unit

		self._unit.contour(slot4).add(slot4, self._unit.contour(slot4), "friendly", nil)
	end

	return 
end
function HuskCopBrain:on_tied(aggressor_unit)
	slot4 = self._unit
	slot6 = aggressor_unit

	self._unit.network(slot3).send_to_host(slot3, self._unit.network(slot3), "unit_tied")

	return 
end
function HuskCopBrain:on_trade(trading_unit)
	slot4 = self._unit
	slot6 = trading_unit

	self._unit.network(slot3).send_to_host(slot3, self._unit.network(slot3), "unit_traded")

	return 
end
function HuskCopBrain:on_cool_state_changed(state)
	return 
end
function HuskCopBrain:on_action_completed(action)
	return 
end
function HuskCopBrain:on_alert(alert_data)
	slot4 = self._unit

	if self._unit.id(slot3) == -1 then
		return 
	end

	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)

	if TimerManager.game(slot3).time(slot3) - self._last_alert_t < 5 then
		return 
	end

	slot6 = self._unit
	slot6 = self._unit.movement(alert_data)

	if CopLogicBase._chk_alert_obstructed(slot3, self._unit.movement(alert_data).m_head_pos(alert_data)) then
		return 
	end

	slot4 = self._unit
	slot6 = alert_data[5]

	self._unit.network(slot3).send_to_host(slot3, self._unit.network(slot3), "alert")

	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	self._last_alert_t = TimerManager.game(slot3).time(slot3)

	return 
end
function HuskCopBrain:on_long_dis_interacted(amount, aggressor_unit)
	slot7 = amount * 10
	slot7 = 10
	amount = math.clamp(slot4, math.ceil(slot6), 0)
	slot5 = self._unit
	slot8 = aggressor_unit

	self._unit.network(slot4).send_to_host(slot4, self._unit.network(slot4), "long_dis_interaction", amount)

	return 
end
function HuskCopBrain:on_team_set(team_data)
	return 
end
function HuskCopBrain:sync_net_event(event_id)
	if event_id == self._NET_EVENTS.weapon_laser_on then
		self._weapon_laser_on = true
		slot4 = self._unit
		slot4 = self._unit.inventory(slot3)
		slot4 = self._unit.inventory(slot3).equipped_unit(slot3)
		slot5 = true

		self._unit.inventory(slot3).equipped_unit(slot3).base(slot3).set_laser_enabled(slot3, self._unit.inventory(slot3).equipped_unit(slot3).base(slot3))

		slot4 = managers.enemy
		slot7 = self._unit

		managers.enemy._destroy_unit_gfx_lod_data(slot3, self._unit.key(slot6))
	elseif event_id == self._NET_EVENTS.weapon_laser_off then
		self._weapon_laser_on = nil
		slot4 = self._unit
		slot4 = self._unit.inventory(slot3)

		if self._unit.inventory(slot3).equipped_unit(slot3) then
			slot4 = self._unit
			slot4 = self._unit.inventory(slot3)
			slot4 = self._unit.inventory(slot3).equipped_unit(slot3)
			slot5 = false

			self._unit.inventory(slot3).equipped_unit(slot3).base(slot3).set_laser_enabled(slot3, self._unit.inventory(slot3).equipped_unit(slot3).base(slot3))
		end

		slot4 = self._unit
		slot4 = self._unit.character_damage(slot3)

		if not self._unit.character_damage(slot3).dead(slot3) then
			slot5 = self._unit

			managers.enemy._create_unit_gfx_lod_data(slot3, managers.enemy)
		end
	end

	return 
end
function HuskCopBrain:pre_destroy()
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self._unit
		slot3 = self._unit.movement(slot2)

		self._unit.movement(slot2).set_attention(slot2)
	else
		slot3 = self._unit
		slot3 = self._unit.movement(slot2)

		self._unit.movement(slot2).synch_attention(slot2)
	end

	if self._alert_listen_key then
		slot3 = managers.groupai
		slot4 = self._alert_listen_key

		managers.groupai.state(slot2).remove_alert_listener(slot2, managers.groupai.state(slot2))

		self._alert_listen_key = nil
	end

	if self._weapon_laser_on then
		slot4 = self._NET_EVENTS.weapon_laser_off

		self.sync_net_event(slot2, self)
	end

	slot3 = managers.enemy
	slot6 = self._unit

	managers.enemy._destroy_unit_gfx_lod_data(slot2, self._unit.key(slot5))

	return 
end
function HuskCopBrain:distance_to_target()
	return self._distance_to_target
end
function HuskCopBrain:set_distance_to_target(distance)
	self._distance_to_target = distance

	return 
end
function HuskCopBrain:anim_clbk_throw_flare(unit)
	return 
end

return 
