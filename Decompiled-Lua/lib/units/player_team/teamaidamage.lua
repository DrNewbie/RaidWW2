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
slot2 = "lib/units/beings/player/PlayerDamage"

require(slot1)

TeamAIDamage = TeamAIDamage or class()
TeamAIDamage._all_event_types = {
	"bleedout",
	"death",
	"hurt",
	"light_hurt",
	"heavy_hurt",
	"fatal",
	"none"
}
TeamAIDamage._RESULT_INDEX_TABLE = {
	light_hurt = 4,
	hurt = 1,
	bleedout = 2,
	heavy_hurt = 5,
	death = 3,
	fatal = 6
}
TeamAIDamage._HEALTH_GRANULARITY = CopDamage._HEALTH_GRANULARITY
TeamAIDamage.set_invulnerable = CopDamage.set_invulnerable
TeamAIDamage._hurt_severities = CopDamage._hurt_severities
TeamAIDamage.get_damage_type = CopDamage.get_damage_type
function TeamAIDamage:init(unit)
	self._unit = unit
	slot5 = unit
	self._char_tweak = tweak_data.character[unit.base(slot4)._tweak_table]
	local damage_tweak = self._char_tweak.damage
	self._HEALTH_INIT = damage_tweak.HEALTH_INIT
	self._HEALTH_BLEEDOUT_INIT = damage_tweak.BLEED_OUT_HEALTH_INIT
	self._HEALTH_TOTAL = self._HEALTH_INIT + self._HEALTH_BLEEDOUT_INIT
	self._HEALTH_TOTAL_PERCENT = self._HEALTH_TOTAL / 100
	self._health = self._HEALTH_INIT
	self._health_ratio = self._health / self._HEALTH_INIT
	self._invulnerable = false
	self._char_dmg_tweak = damage_tweak
	self._focus_delay_mul = 1
	slot5 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(self._HEALTH_INIT)
	self._bleed_out_paused_count = 0
	self._dmg_interval = damage_tweak.MIN_DAMAGE_INTERVAL
	self._next_allowed_dmg_t = -100
	self._last_received_dmg = 0
	self._spine2_obj = unit.get_object(self._HEALTH_INIT, Idstring(slot7))
	slot6 = "effects/vanilla/character/taser_hittarget_001"
	slot6 = self._unit
	slot9 = "e_taser"
	self._tase_effect_table = {
		effect = Idstring(unit),
		parent = self._unit.get_object(unit, Idstring("Spine2"))
	}

	return 
end
function TeamAIDamage:update(unit, t, dt)
	if self._regenerate_t then
		if self._regenerate_t < t then
			slot6 = self

			self._regenerated(slot5)
		end
	elseif self._arrested_timer and self._arrested_paused_counter == 0 then
		self._arrested_timer = self._arrested_timer - dt

		if self._arrested_timer <= 0 then
			self._arrested_timer = nil
			local action_data = {
				variant = "stand",
				body_part = 1,
				type = "act",
				blocks = {
					heavy_hurt = -1,
					hurt = -1,
					action = -1,
					aim = -1,
					walk = -1
				}
			}
			slot7 = self._unit
			slot8 = action_data
			local res = self._unit.movement(slot6).action_request(slot6, self._unit.movement(slot6))
			slot8 = self._unit
			slot9 = self._unit

			self._unit.brain(self._unit.movement(slot6)).on_recovered(self._unit.movement(slot6), self._unit.brain(self._unit.movement(slot6)))

			slot8 = self._unit
			slot9 = "from_server_unit_recovered"

			self._unit.network(self._unit.movement(slot6)).send(self._unit.movement(slot6), self._unit.network(self._unit.movement(slot6)))

			slot8 = managers.groupai
			slot9 = self._unit

			managers.groupai.state(self._unit.movement(slot6)).on_criminal_recovered(self._unit.movement(slot6), managers.groupai.state(self._unit.movement(slot6)))

			slot11 = self._unit
			slot9 = self._unit.unit_data(slot10).mugshot_id

			managers.hud.set_mugshot_normal(self._unit.movement(slot6), managers.hud)
		end
	end

	if self._revive_reminder_line_t and self._revive_reminder_line_t < t then
		self._revive_reminder_line_t = nil
	end

	return 
end
function TeamAIDamage:damage_melee(attack_data)
	if self._invulnerable or self._dead or self._fatal or self._arrested_timer then
		return 
	end

	slot5 = attack_data.attacker_unit

	if PlayerDamage.is_friendly_fire(slot3, self) then
		return 
	end

	local result = {
		variant = "melee"
	}
	slot7 = result
	local damage_percent, health_subtracted = self._apply_damage(slot4, self, attack_data)
	slot7 = TimerManager
	slot7 = TimerManager.game(attack_data)
	local t = TimerManager.game(attack_data).time(attack_data)
	self._next_allowed_dmg_t = t + self._dmg_interval
	self._last_received_dmg_t = t

	if 0 < health_subtracted then
		slot10 = health_subtracted

		self._send_damage_drama(slot7, self, attack_data)
	end

	if self._dead then
		slot8 = self

		self._unregister_unit(slot7)
	end

	slot9 = attack_data

	self._call_listeners(slot7, self)

	slot9 = attack_data

	self._send_melee_attack_result(slot7, self)

	return result
end
function TeamAIDamage:force_bleedout()
	local attack_data = {
		damage = 100000,
		pos = Vector3(),
		col_ray = {
			position = Vector3()
		}
	}
	local result = {
		type = "none",
		variant = "bullet"
	}
	attack_data.result = result
	slot8 = true
	local damage_percent, health_subtracted = self._apply_damage(slot4, self, attack_data, result)
	slot7 = TimerManager
	slot7 = TimerManager.game(attack_data)
	self._next_allowed_dmg_t = TimerManager.game(attack_data).time(attack_data) + self._dmg_interval
	self._last_received_dmg = health_subtracted

	if 0 < health_subtracted then
		slot9 = health_subtracted

		self._send_damage_drama(slot6, self, attack_data)
	end

	if self._dead then
		slot7 = self

		self._unregister_unit(slot6)
	end

	slot8 = attack_data

	self._call_listeners(slot6, self)

	slot8 = attack_data

	self._send_bullet_attack_result(slot6, self)

	return 
end
function TeamAIDamage:damage_bullet(attack_data)
	local result = {
		type = "none",
		variant = "bullet"
	}
	attack_data.result = result
	slot5 = self

	if self._cannot_take_damage(slot4) then
		slot6 = attack_data

		self._call_listeners(slot4, self)

		return 
	else
		slot6 = attack_data.damage

		if PlayerDamage._chk_dmg_too_soon(slot4, self) then
			slot6 = attack_data

			self._call_listeners(slot4, self)

			return 
		else
			slot6 = attack_data.attacker_unit

			if PlayerDamage.is_friendly_fire(slot4, self) then
				slot5 = self

				self.friendly_fire_hit(slot4)

				return 
			end
		end
	end

	slot7 = result
	local damage_percent, health_subtracted = self._apply_damage(slot4, self, attack_data)
	slot7 = TimerManager
	slot7 = TimerManager.game(attack_data)
	local t = TimerManager.game(attack_data).time(attack_data)
	self._next_allowed_dmg_t = t + self._dmg_interval
	self._last_received_dmg_t = t
	self._last_received_dmg = health_subtracted

	if 0 < health_subtracted then
		slot10 = health_subtracted

		self._send_damage_drama(slot7, self, attack_data)
	end

	if self._dead then
		slot8 = self

		self._unregister_unit(slot7)
	end

	slot9 = attack_data

	self._call_listeners(slot7, self)

	slot9 = attack_data

	self._send_bullet_attack_result(slot7, self)

	return result
end
function TeamAIDamage:damage_explosion(attack_data)
	slot4 = self

	if self._cannot_take_damage(slot3) then
		return 
	end

	local attacker_unit = attack_data.attacker_unit

	if attacker_unit then
		slot5 = attacker_unit

		if attacker_unit.base(slot4) then
			slot5 = attacker_unit

			if attacker_unit.base(slot4).thrower_unit then
				slot5 = attacker_unit
				slot5 = attacker_unit.base(slot4)
				attacker_unit = attacker_unit.base(slot4).thrower_unit(slot4)
			end
		end
	end

	slot6 = attacker_unit

	if PlayerDamage.is_friendly_fire(slot4, self) then
		slot5 = self

		self.friendly_fire_hit(slot4)

		return 
	end

	local result = {
		variant = attack_data.variant
	}
	slot8 = result
	local damage_percent, health_subtracted = self._apply_damage(slot5, self, attack_data)

	if 0 < health_subtracted then
		slot10 = health_subtracted

		self._send_damage_drama(slot7, self, attack_data)
	end

	if self._dead then
		slot8 = self

		self._unregister_unit(slot7)
	end

	slot9 = attack_data

	self._call_listeners(slot7, self)

	slot9 = attack_data

	self._send_explosion_attack_result(slot7, self)

	return result
end
function TeamAIDamage:damage_fire(attack_data)
	slot4 = self

	if self._cannot_take_damage(slot3) then
		return 
	end

	slot4 = self._unit
	slot4 = self._unit.brain(slot3)

	if self._unit.brain(slot3).objective(slot3) then
		slot4 = self._unit
		slot4 = self._unit.brain(slot3)

		if self._unit.brain(slot3).objective(slot3).type == "revive" then
			return false
		end
	end

	local attacker_unit = attack_data.attacker_unit

	if attacker_unit then
		slot5 = attacker_unit

		if attacker_unit.base(slot4) then
			slot5 = attacker_unit

			if attacker_unit.base(slot4).thrower_unit then
				slot5 = attacker_unit
				slot5 = attacker_unit.base(slot4)
				attacker_unit = attacker_unit.base(slot4).thrower_unit(slot4)
			end
		end
	end

	slot6 = attacker_unit

	if PlayerDamage.is_friendly_fire(slot4, self) then
		slot5 = self

		self.friendly_fire_hit(slot4)

		return 
	end

	local result = {
		variant = attack_data.variant
	}
	slot8 = result
	local damage_percent, health_subtracted = self._apply_damage(slot5, self, attack_data)

	if 0 < health_subtracted then
		slot10 = health_subtracted

		self._send_damage_drama(slot7, self, attack_data)
	end

	if self._dead then
		slot8 = self

		self._unregister_unit(slot7)
	end

	slot9 = attack_data

	self._call_listeners(slot7, self)

	slot9 = attack_data

	self._send_fire_attack_result(slot7, self)

	return result
end
function TeamAIDamage:damage_mission(attack_data)
	if self._dead or (self._invulnerable and not attack_data.forced) then
		return 
	end

	local result = nil
	local damage_percent = self._HEALTH_GRANULARITY
	attack_data.damage = self._health
	attack_data.variant = "explosion"
	local result = {
		variant = attack_data.variant
	}
	slot9 = result
	local damage_percent, health_subtracted = self._apply_damage(slot6, self, attack_data)

	if 0 < health_subtracted then
		slot11 = health_subtracted

		self._send_damage_drama(slot8, self, attack_data)
	end

	if self._dead then
		slot9 = self

		self._unregister_unit(slot8)
	end

	slot10 = attack_data

	self._call_listeners(slot8, self)

	slot10 = attack_data

	self._send_explosion_attack_result(slot8, self)

	return result
end
function TeamAIDamage:damage_tase(attack_data)
	if attack_data ~= nil then
		slot5 = attack_data.attacker_unit

		if PlayerDamage.is_friendly_fire(slot3, self) then
			slot4 = self

			self.friendly_fire_hit(slot3)

			return 
		end
	end

	slot4 = self

	if self._cannot_take_damage(slot3) then
		return 
	end

	self._regenerate_t = nil
	local damage_info = {
		variant = "tase",
		result = {
			type = "hurt"
		}
	}

	if self._tase_effect then
		slot5 = World
		slot6 = self._tase_effect

		World.effect_manager(slot4).fade_kill(slot4, World.effect_manager(slot4))
	end

	slot5 = World
	slot6 = self._tase_effect_table
	self._tase_effect = World.effect_manager(slot4).spawn(slot4, World.effect_manager(slot4))
	slot5 = Network

	if Network.is_server(slot4) then
		if math.random() < 0.25 then
			slot5 = self._unit
			slot7 = true

			self._unit.sound(slot4).say(slot4, self._unit.sound(slot4), "s07x_sin")
		end

		if not self._to_incapacitated_clbk_id then
			self._to_incapacitated_clbk_id = "TeamAIDamage_to_incapacitated" .. tostring(self._unit.key(slot7))
			slot11 = "clbk_exit_to_incapacitated"
			slot10 = TimerManager
			slot10 = TimerManager.game(self)
			slot8 = TimerManager.game(self).time(self) + self._char_dmg_tweak.TASED_TIME

			managers.enemy.add_delayed_clbk(tostring(self._unit.key(slot7)), managers.enemy, self._to_incapacitated_clbk_id, callback(self._unit, self, self))
		end
	end

	slot6 = damage_info

	self._call_listeners(slot4, self)

	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = self

		self._send_tase_attack_result(slot4)
	end

	return damage_info
end
function TeamAIDamage:_apply_damage(attack_data, result, force)
	local damage = attack_data.damage * 0.8
	slot9 = self._HEALTH_TOTAL
	damage = math.clamp(slot6, damage, self._HEALTH_TOTAL_PERCENT)
	slot7 = damage / self._HEALTH_TOTAL_PERCENT
	local damage_percent = math.ceil(slot6)
	damage = damage_percent * self._HEALTH_TOTAL_PERCENT
	attack_data.damage = damage
	local dodged = nil

	if not force then
		slot10 = damage_percent / 2
		dodged = self.inc_dodge_count(slot8, self)
	end

	attack_data.pos = attack_data.pos or attack_data.col_ray.position
	attack_data.result = result

	if not force then
	end

	local health_subtracted = nil

	if self._bleed_out then
		health_subtracted = self._bleed_out_health
		self._bleed_out_health = self._bleed_out_health - damage
		slot10 = self

		self._check_fatal(slot9)

		if self._fatal then
			result.type = "fatal"
			self._health_ratio = 0
		else
			health_subtracted = damage
			result.type = "hurt"
			self._health_ratio = self._bleed_out_health / self._HEALTH_BLEEDOUT_INIT
		end
	else
		health_subtracted = self._health
		self._health = self._health - damage
		slot10 = self

		self._check_bleed_out(slot9)

		if self._bleed_out then
			result.type = "bleedout"
			self._health_ratio = 1
		else
			health_subtracted = damage
			slot12 = "bullet"
			result.type = self.get_damage_type(slot9, self, damage_percent) or "none"
			slot10 = self

			self._on_hurt(slot9)

			self._health_ratio = self._health / self._HEALTH_INIT
		end
	end

	return damage_percent, health_subtracted
end
function TeamAIDamage:friendly_fire_hit()
	slot4 = 2

	self.inc_dodge_count(slot2, self)

	return 
end
function TeamAIDamage:inc_dodge_count(n)
	slot4 = Application
	local t = Application.time(slot3)

	if not self._to_dodge_t or self._to_dodge_t - t < 0 then
		self._to_dodge_t = t
	end

	self._to_dodge_t = self._to_dodge_t + n

	if self._to_dodge_t - t < 3 then
		return 
	end

	if self._dodge_t and t - self._dodge_t < 5 then
		return 
	end

	self._to_dodge_t = nil
	self._dodge_t = nil
	slot7 = self._unit

	if CopLogicBase.chk_start_action_dodge(slot4, self._unit.brain("hit")._logic_data) then
		self._dodge_t = t
		slot5 = self

		self._on_hurt(slot4)

		return true
	end

	return 
end
function TeamAIDamage:down_time()
	return self._char_dmg_tweak.DOWNED_TIME
end
function TeamAIDamage:_check_bleed_out()
	if self._health <= 0 then
		self._bleed_out_health = self._HEALTH_BLEEDOUT_INIT
		self._health = 0
		self._bleed_out = true
		self._regenerate_t = nil
		self._bleed_out_paused_count = 0
		slot3 = Network

		if Network.is_server(slot2) then
			if not self._to_dead_clbk_id then
				slot2 = tostring(self._unit.key(slot5))
				self._to_dead_clbk_id = "TeamAIDamage_to_dead" .. slot2
				slot3 = TimerManager
				slot4 = self
				self._to_dead_t = TimerManager.game(slot2).time(slot2) + self.down_time(TimerManager.game(slot2))
				slot9 = "clbk_exit_to_dead"
				slot6 = self._to_dead_t

				managers.enemy.add_delayed_clbk(self.down_time(TimerManager.game(slot2)), managers.enemy, self._to_dead_clbk_id, callback(self._unit, self, self))
			end

			slot3 = self._unit
			slot5 = true

			self._unit.sound(slot2).say(slot2, self._unit.sound(slot2), "player_gen_call_help")

			self._revive_reminder_line_t = self._to_dead_t - 10
		end

		slot3 = managers.groupai
		slot4 = self._unit

		managers.groupai.state(slot2).on_criminal_disabled(slot2, managers.groupai.state(slot2))

		slot3 = Network

		if Network.is_server(slot2) then
			slot3 = managers.groupai
			slot4 = self._unit

			managers.groupai.state(slot2).report_criminal_downed(slot2, managers.groupai.state(slot2))
		end

		slot3 = self._unit
		slot4 = "revive"

		self._unit.interaction(slot2).set_tweak_data(slot2, self._unit.interaction(slot2))

		slot3 = self._unit

		self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), true)

		slot7 = self._unit
		slot5 = self._unit.unit_data(self._unit).name_label_id

		managers.hud.on_teammate_downed(slot2, managers.hud, self._unit.unit_data(false).teammate_panel_id)
	end

	return 
end
function TeamAIDamage:_check_fatal()
	if self._bleed_out_health <= 0 then
		if not self._bleed_out then
			slot3 = self._unit
			slot4 = "revive"

			self._unit.interaction(slot2).set_tweak_data(slot2, self._unit.interaction(slot2))

			slot3 = self._unit
			slot5 = false

			self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), true)
		end

		self._bleed_out = nil
		self._bleed_death_t = nil
		self._bleed_out_health = nil
		self._health_ratio = 0
		self._fatal = true
		slot3 = managers.groupai

		managers.groupai.state(slot2).on_criminal_disabled(slot2, managers.groupai.state(slot2))

		slot5 = self._unit
		slot5 = "team_AI"

		PlayerMovement.set_attention_settings(slot2, self._unit.brain(self._unit), nil)
	end

	return 
end
TeamAIDamage.get_paused_counter_name_by_peer = PlayerDamage.get_paused_counter_name_by_peer
function TeamAIDamage:pause_bleed_out(peer_id)
	self._bleed_out_paused_count = self._bleed_out_paused_count + 1
	slot6 = "bleed_out"

	PlayerDamage.set_peer_paused_counter(slot3, self, peer_id)

	if (self._bleed_out or self._fatal) and self._bleed_out_paused_count == 1 then
		slot5 = TimerManager
		slot5 = TimerManager.game(slot4)
		self._to_dead_remaining_t = self._to_dead_t - TimerManager.game(slot4).time(slot4)

		if self._to_dead_remaining_t < 0 then
			return 
		end

		slot4 = Network

		if Network.is_server(slot3) then
			slot5 = self._to_dead_clbk_id

			managers.enemy.remove_delayed_clbk(slot3, managers.enemy)

			self._to_dead_clbk_id = nil
		end

		self._to_dead_t = nil
	end

	return 
end
function TeamAIDamage:unpause_bleed_out(peer_id)
	self._bleed_out_paused_count = self._bleed_out_paused_count - 1
	slot6 = nil

	PlayerDamage.set_peer_paused_counter(slot3, self, peer_id)

	if (self._bleed_out or self._fatal) and self._bleed_out_paused_count == 0 then
		slot4 = TimerManager
		slot4 = TimerManager.game(slot3)
		self._to_dead_t = TimerManager.game(slot3).time(slot3) + self._to_dead_remaining_t
		slot4 = Network

		if Network.is_server(self._to_dead_remaining_t) and not self._dead and not self._to_dead_clbk_id then
			self._to_dead_clbk_id = "TeamAIDamage_to_dead" .. tostring(self._unit.key(slot6))
			slot10 = "clbk_exit_to_dead"
			slot7 = self._to_dead_t

			managers.enemy.add_delayed_clbk(tostring(self._unit.key(slot6)), managers.enemy, self._to_dead_clbk_id, callback(self._unit, self, self))
		end

		self._to_dead_remaining_t = nil
	end

	return 
end
function TeamAIDamage:stop_bleedout()
	slot3 = self

	self._regenerated(slot2)

	return 
end
function TeamAIDamage:on_arrested()
	slot3 = self

	self.stop_bleedout(slot2)

	self._arrested_timer = self._char_dmg_tweak.ARRESTED_TIME
	self._arrested_paused_counter = 0
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.groupai
		slot4 = self._unit

		managers.groupai.state(slot2).report_criminal_downed(slot2, managers.groupai.state(slot2))
	end

	return 
end
function TeamAIDamage:pause_arrested_timer(peer_id)
	self._arrested_paused_counter = self._arrested_paused_counter + 1
	slot6 = "arrested"

	PlayerDamage.set_peer_paused_counter(slot3, self, peer_id)

	return 
end
function TeamAIDamage:unpause_arrested_timer(peer_id)
	self._arrested_paused_counter = self._arrested_paused_counter - 1
	slot6 = nil

	PlayerDamage.set_peer_paused_counter(slot3, self, peer_id)

	return 
end
function TeamAIDamage:_on_hurt()
	if self._to_incapacitated_clbk_id then
		return 
	end

	local regen_time = self._char_dmg_tweak.REGENERATE_TIME_AWAY
	local dis_limit = 6250000
	slot7 = managers.groupai
	slot7 = managers.groupai.state(slot6)

	for _, crim in pairs(managers.groupai.state(slot6).all_player_criminals(slot6)) do
		slot12 = self._unit
		slot10 = self._unit.movement(slot11).m_pos(slot11)
		slot13 = crim.unit
		slot13 = crim.unit.movement(self._unit.movement(slot11))

		if mvector3.distance_sq(slot9, crim.unit.movement(self._unit.movement(slot11)).m_pos(self._unit.movement(slot11))) < 6250000 then
			regen_time = self._char_dmg_tweak.REGENERATE_TIME

			break
		end
	end

	slot5 = TimerManager
	slot5 = TimerManager.game(slot4)
	self._regenerate_t = TimerManager.game(slot4).time(slot4) + regen_time

	return 
end
function TeamAIDamage:bleed_out()
	return self._bleed_out
end
function TeamAIDamage:fatal()
	return self._fatal
end
function TeamAIDamage:is_downed()
	return self._bleed_out or self._fatal
end
function TeamAIDamage:_regenerated()
	self._health = self._HEALTH_INIT
	self._health_ratio = 1

	if self._bleed_out then
		self._bleed_out = nil
		self._bleed_death_t = nil
		self._bleed_out_health = nil
	elseif self._fatal then
		self._fatal = nil
	end

	self._bleed_out_paused_count = 0
	self._to_dead_t = nil
	self._to_dead_remaining_t = nil
	slot3 = self

	self._clear_damage_transition_callbacks(slot2)

	self._regenerate_t = nil

	return 
end
function TeamAIDamage:_convert_to_health_percentage(health_abs)
	return 
end
function TeamAIDamage:_clamp_health_percentage(health_abs)
	slot6 = self._HEALTH_TOTAL
	health_abs = math.clamp(slot3, health_abs, self._HEALTH_TOTAL_PERCENT)
	slot4 = health_abs / self._HEALTH_TOTAL_PERCENT
	local health_percent = math.ceil(slot3)
	health_abs = health_percent * self._HEALTH_TOTAL_PERCENT

	return health_abs, health_percent
end
function TeamAIDamage:_die()
	self._dead = true
	self._revive_reminder_line_t = nil

	if self._bleed_out or self._fatal then
		slot3 = self._unit
		slot5 = false

		self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), false)

		self._bleed_out = nil
		self._bleed_out_health = nil
	end

	self._regenerate_t = nil
	self._health_ratio = 0
	slot3 = self._unit
	slot5 = 17

	self._unit.base(slot2).set_slot(slot2, self._unit.base(slot2), self._unit)

	slot3 = self

	self._clear_damage_transition_callbacks(slot2)

	return 
end
function TeamAIDamage:_unregister_unit()
	slot4 = self._unit
	local char_name = managers.criminals.character_name_by_unit(slot2, managers.criminals)
	slot4 = managers.groupai
	slot6 = self._unit

	managers.groupai.state(managers.criminals).on_AI_criminal_death(managers.criminals, managers.groupai.state(managers.criminals), char_name)

	slot4 = managers.groupai
	slot5 = self._unit

	managers.groupai.state(managers.criminals).on_criminal_neutralized(managers.criminals, managers.groupai.state(managers.criminals))

	slot4 = self._unit
	slot4 = self._unit.base(managers.criminals)

	self._unit.base(managers.criminals).unregister(managers.criminals)

	slot4 = self

	self._clear_damage_transition_callbacks(managers.criminals)

	slot5 = self._unit

	Network.detach_unit(managers.criminals, Network)

	return 
end
function TeamAIDamage:_send_damage_drama(attack_data, health_subtracted)
	slot7 = health_subtracted

	PlayerDamage._send_damage_drama(slot4, self, attack_data)

	return 
end
function TeamAIDamage:_call_listeners(damage_info)
	slot5 = damage_info

	CopDamage._call_listeners(slot3, self)

	return 
end
function TeamAIDamage:add_listener(...)
	slot3 = self

	CopDamage.add_listener(slot2, ...)

	return 
end
function TeamAIDamage:remove_listener(key)
	slot5 = key

	CopDamage.remove_listener(slot3, self)

	return 
end
function TeamAIDamage:get_base_health()
	return self._HEALTH_INIT
end
function TeamAIDamage:health_ratio()
	return self._health_ratio
end
function TeamAIDamage:focus_delay_mul()
	return 1
end
function TeamAIDamage:dead()
	return self._dead
end
function TeamAIDamage:sync_damage_bullet(attacker_unit, damage, i_body, hit_offset_height)
	slot7 = self

	if self._cannot_take_damage(slot6) then
		return 
	end

	slot8 = i_body
	local body = self._unit.body(slot6, self._unit)
	damage = damage * self._HEALTH_TOTAL_PERCENT
	local result = {
		variant = "bullet"
	}
	slot11 = self._unit
	slot11 = self._unit.movement(slot10)
	local hit_pos = mvector3.copy(self._unit.movement(slot10).m_pos(slot10))
	slot11 = hit_pos.z + hit_offset_height

	mvector3.set_z(self._unit.movement(slot10).m_pos, hit_pos)

	local attack_dir = nil

	if attacker_unit then
		slot11 = attacker_unit
		slot11 = attacker_unit.movement(slot10)
		attack_dir = hit_pos - attacker_unit.movement(slot10).m_head_pos(slot10)
		slot11 = attack_dir

		mvector3.normalize(slot10)
	else
		slot11 = self._unit
		slot11 = self._unit.rotation(slot10)
		attack_dir = self._unit.rotation(slot10).y(slot10)
	end

	if not self._no_blood then
		slot13 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot10, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = "bullet",
		attacker_unit = attacker_unit,
		damage = damage,
		attack_dir = attack_dir,
		pos = hit_pos
	}
	slot14 = result
	local damage_percent, health_subtracted = self._apply_damage(slot11, self, attack_data)
	slot16 = health_subtracted

	self._send_damage_drama(attack_data, self, attack_data)

	slot16 = hit_offset_height

	self._send_bullet_attack_result(attack_data, self, attack_data)

	slot15 = attack_data

	self._call_listeners(attack_data, self)

	return 
end
function TeamAIDamage:sync_damage_explosion(attacker_unit, damage, i_attack_variant)
	slot6 = self

	if self._cannot_take_damage(slot5) then
		return 
	end

	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]
	damage = damage * self._HEALTH_TOTAL_PERCENT
	local result = {
		variant = variant
	}
	slot10 = self._unit
	slot10 = self._unit.movement(slot9)
	local hit_pos = mvector3.copy(self._unit.movement(slot9).m_com(slot9))
	local attack_dir = nil

	if attacker_unit then
		slot10 = attacker_unit
		attack_dir = hit_pos - attacker_unit.position(slot9)
		slot10 = attack_dir

		mvector3.normalize(slot9)
	else
		slot10 = self._unit
		slot10 = self._unit.rotation(slot9)
		attack_dir = self._unit.rotation(slot9).y(slot9)
	end

	if not self._no_blood then
		slot12 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot9, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = variant,
		attacker_unit = attacker_unit,
		damage = damage,
		attack_dir = attack_dir,
		pos = hit_pos
	}
	slot13 = result
	local damage_percent, health_subtracted = self._apply_damage(slot10, self, attack_data)
	slot15 = health_subtracted

	self._send_damage_drama(attack_data, self, attack_data)

	slot14 = attack_data

	self._send_explosion_attack_result(attack_data, self)

	slot14 = attack_data

	self._call_listeners(attack_data, self)

	return 
end
function TeamAIDamage:sync_damage_fire(attacker_unit, damage, i_attack_variant)
	slot6 = self

	if self._cannot_take_damage(slot5) then
		return 
	end

	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]
	damage = damage * self._HEALTH_TOTAL_PERCENT
	local result = {
		variant = variant
	}
	slot10 = self._unit
	slot10 = self._unit.movement(slot9)
	local hit_pos = mvector3.copy(self._unit.movement(slot9).m_com(slot9))
	local attack_dir = nil

	if attacker_unit then
		slot10 = attacker_unit
		attack_dir = hit_pos - attacker_unit.position(slot9)
		slot10 = attack_dir

		mvector3.normalize(slot9)
	else
		slot10 = self._unit
		slot10 = self._unit.rotation(slot9)
		attack_dir = self._unit.rotation(slot9).y(slot9)
	end

	if not self._no_blood then
		slot12 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot9, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = variant,
		attacker_unit = attacker_unit,
		damage = damage,
		attack_dir = attack_dir,
		pos = hit_pos
	}
	slot13 = result
	local damage_percent, health_subtracted = self._apply_damage(slot10, self, attack_data)
	slot15 = health_subtracted

	self._send_damage_drama(attack_data, self, attack_data)

	slot14 = attack_data

	self._send_fire_attack_result(attack_data, self)

	slot14 = attack_data

	self._call_listeners(attack_data, self)

	return 
end
function TeamAIDamage:sync_damage_melee(attacker_unit, damage, damage_effect_percent, i_body, hit_offset_height)
	slot8 = self

	if self._cannot_take_damage(slot7) then
		return 
	end

	slot9 = i_body
	local body = self._unit.body(slot7, self._unit)
	damage = damage * self._HEALTH_TOTAL_PERCENT
	local result = {
		variant = "melee"
	}
	slot12 = self._unit
	slot12 = self._unit.movement(slot11)
	local hit_pos = mvector3.copy(self._unit.movement(slot11).m_pos(slot11))
	slot12 = hit_pos.z + hit_offset_height

	mvector3.set_z(self._unit.movement(slot11).m_pos, hit_pos)

	local attack_dir = nil

	if attacker_unit then
		slot12 = attacker_unit
		slot12 = attacker_unit.movement(slot11)
		attack_dir = hit_pos - attacker_unit.movement(slot11).m_head_pos(slot11)
		slot12 = attack_dir

		mvector3.normalize(slot11)
	else
		slot12 = self._unit
		slot12 = self._unit.rotation(slot11)
		attack_dir = self._unit.rotation(slot11).y(slot11)
		slot12 = attack_dir

		mvector3.negate(slot11)
	end

	if not self._no_blood then
		slot14 = attack_dir

		managers.game_play_central.sync_play_impact_flesh(slot11, managers.game_play_central, hit_pos)
	end

	local attack_data = {
		variant = "melee",
		attacker_unit = attacker_unit,
		damage = damage,
		attack_dir = attack_dir,
		pos = hit_pos
	}
	slot15 = result
	local damage_percent, health_subtracted = self._apply_damage(slot12, self, attack_data)
	slot17 = health_subtracted

	self._send_damage_drama(attack_data, self, attack_data)

	slot17 = hit_offset_height

	self._send_melee_attack_result(attack_data, self, attack_data)

	slot16 = attack_data

	self._call_listeners(attack_data, self)

	return 
end
function TeamAIDamage:shoot_pos_mid(m_pos)
	slot5 = m_pos

	self._spine2_obj.m_position(slot3, self._spine2_obj)

	return 
end
function TeamAIDamage:need_revive()
	return (self._bleed_out or self._fatal) and not self._dead
end
function TeamAIDamage:arrested()
	return self._arrested_timer
end
function TeamAIDamage:revive(reviving_unit)
	if self._dead then
		return 
	end

	self._revive_reminder_line_t = nil

	if self._bleed_out or self._fatal then
		self._regenerated(slot3)

		local action_data = {
			variant = "stand",
			body_part = 1,
			type = "act",
			blocks = {
				heavy_hurt = -1,
				hurt = -1,
				action = -1,
				aim = -1,
				walk = -1
			}
		}
		slot5 = self._unit
		slot6 = action_data
		local res = self._unit.movement(self).action_request(self, self._unit.movement(self))
		slot6 = self._unit
		slot8 = false

		self._unit.interaction(self._unit.movement(self)).set_active(self._unit.movement(self), self._unit.interaction(self._unit.movement(self)), false)

		slot6 = self._unit

		self._unit.brain(self._unit.movement(self)).on_recovered(self._unit.movement(self), self._unit.brain(self._unit.movement(self)))

		slot8 = self._unit
		slot8 = "team_AI"

		PlayerMovement.set_attention_settings(self._unit.movement(self), self._unit.brain(reviving_unit), {
			"team_enemy_cbt"
		})

		slot6 = self._unit
		slot7 = "from_server_unit_recovered"

		self._unit.network(self._unit.movement(self)).send(self._unit.movement(self), self._unit.network(self._unit.movement(self)))

		slot6 = managers.groupai
		slot7 = self._unit

		managers.groupai.state(self._unit.movement(self)).on_criminal_recovered(self._unit.movement(self), managers.groupai.state(self._unit.movement(self)))
	elseif self._arrested_timer then
		self._arrested_timer = nil
		local action_data = {
			variant = "stand",
			body_part = 1,
			type = "act",
			blocks = {
				heavy_hurt = -1,
				hurt = -1,
				action = -1,
				aim = -1,
				walk = -1
			}
		}
		slot5 = self._unit
		slot6 = action_data
		local res = self._unit.movement(slot4).action_request(slot4, self._unit.movement(slot4))
		slot6 = self._unit

		self._unit.brain(self._unit.movement(slot4)).on_recovered(self._unit.movement(slot4), self._unit.brain(self._unit.movement(slot4)))

		slot8 = self._unit
		slot8 = "team_AI"

		PlayerMovement.set_attention_settings(self._unit.movement(slot4), self._unit.brain(reviving_unit), {
			"team_enemy_cbt"
		})

		slot6 = self._unit
		slot7 = "from_server_unit_recovered"

		self._unit.network(self._unit.movement(slot4)).send(self._unit.movement(slot4), self._unit.network(self._unit.movement(slot4)))

		slot6 = managers.groupai
		slot7 = self._unit

		managers.groupai.state(self._unit.movement(slot4)).on_criminal_recovered(self._unit.movement(slot4), managers.groupai.state(self._unit.movement(slot4)))
	end

	managers.hud.on_teammate_revived(slot3, managers.hud, self._unit.unit_data(self._unit.unit_data(self._unit).name_label_id).teammate_panel_id)

	slot6 = {
		skip_idle_check = true,
		instigator = managers.player.local_player(self._unit)
	}
	slot9 = managers.player

	managers.dialog.queue_dialog(slot3, managers.dialog, "player_gen_revive_thanks")

	return 
end
function TeamAIDamage:_send_bullet_attack_result(attack_data, hit_offset_height)

	-- Decompilation error in this vicinity:
	if not hit_offset_height then
		slot8 = self._unit
		slot8 = self._unit.movement(300)
		hit_offset_height = math.clamp(slot4, attack_data.col_ray.position.z - self._unit.movement(300).m_pos(300).z, 0)
	end

	local attacker = attack_data.attacker_unit
	local result_index = self._RESULT_INDEX_TABLE[attack_data.result.type] or 0
	slot7 = self._unit
	slot11 = result_index

	self._unit.network(slot6).send(slot6, self._unit.network(slot6), "from_server_damage_bullet", attacker, hit_offset_height)

	return 
end
function TeamAIDamage:_send_explosion_attack_result(attack_data)

	-- Decompilation error in this vicinity:
	local attacker = attack_data.attacker_unit
	local result_index = self._RESULT_INDEX_TABLE[attack_data.result.type] or 0
	slot6 = self._unit
	slot9 = result_index
	slot13 = attack_data.variant

	self._unit.network(slot5).send(slot5, self._unit.network(slot5), "from_server_damage_explosion_fire", attacker, CopDamage._get_attack_variant_index(slot11, self))

	return 
end
function TeamAIDamage:_send_fire_attack_result(attack_data)

	-- Decompilation error in this vicinity:
	local attacker = attack_data.attacker_unit
	local result_index = self._RESULT_INDEX_TABLE[attack_data.result.type] or 0
	slot6 = self._unit
	slot9 = result_index
	slot13 = attack_data.variant

	self._unit.network(slot5).send(slot5, self._unit.network(slot5), "from_server_damage_explosion_fire", attacker, CopDamage._get_attack_variant_index(slot11, self))

	return 
end
function TeamAIDamage:_send_melee_attack_result(attack_data, hit_offset_height)

	-- Decompilation error in this vicinity:
	if not hit_offset_height then
		slot8 = self._unit
		slot8 = self._unit.movement(300)
		hit_offset_height = math.clamp(slot4, attack_data.col_ray.position.z - self._unit.movement(300).m_pos(300).z, 0)
	end

	local attacker = attack_data.attacker_unit
	local result_index = self._RESULT_INDEX_TABLE[attack_data.result.type] or 0
	slot7 = self._unit
	slot11 = result_index

	self._unit.network(slot6).send(slot6, self._unit.network(slot6), "from_server_damage_melee", attacker, hit_offset_height)

	return 
end
function TeamAIDamage:_send_tase_attack_result()
	slot3 = self._unit
	slot4 = "from_server_damage_tase"

	self._unit.network(slot2).send(slot2, self._unit.network(slot2))

	return 
end
function TeamAIDamage:on_tase_ended()
	if self._tase_effect then
		slot3 = World
		slot4 = self._tase_effect

		World.effect_manager(slot2).fade_kill(slot2, World.effect_manager(slot2))
	end

	if self._to_incapacitated_clbk_id then
		slot3 = TimerManager
		slot3 = TimerManager.game(slot2)
		self._regenerate_t = TimerManager.game(slot2).time(slot2) + self._char_dmg_tweak.REGENERATE_TIME
		slot4 = self._to_incapacitated_clbk_id

		managers.enemy.remove_delayed_clbk(self._char_dmg_tweak.REGENERATE_TIME, managers.enemy)

		self._to_incapacitated_clbk_id = nil
		local action_data = {
			variant = "stand",
			body_part = 1,
			type = "act",
			blocks = {
				heavy_hurt = -1,
				hurt = -1,
				action = -1,
				walk = -1
			}
		}
		slot4 = self._unit
		slot5 = action_data
		local res = self._unit.movement(managers.enemy).action_request(managers.enemy, self._unit.movement(managers.enemy))
		slot5 = self._unit
		slot6 = "from_server_unit_recovered"

		self._unit.network(self._unit.movement(managers.enemy)).send(self._unit.movement(managers.enemy), self._unit.network(self._unit.movement(managers.enemy)))

		slot5 = managers.groupai
		slot6 = self._unit

		managers.groupai.state(self._unit.movement(managers.enemy)).on_criminal_recovered(self._unit.movement(managers.enemy), managers.groupai.state(self._unit.movement(managers.enemy)))

		slot5 = self._unit
		slot5 = self._unit.brain(self._unit.movement(managers.enemy))

		self._unit.brain(self._unit.movement(managers.enemy)).on_recovered(self._unit.movement(managers.enemy))
	end

	return 
end
function TeamAIDamage:clbk_exit_to_incapacitated()
	self._to_incapacitated_clbk_id = nil
	slot3 = self

	self._on_incapacitated(slot2)

	return 
end
function TeamAIDamage:on_incapacitated()
	slot3 = self

	if self._cannot_take_damage(slot2) then
		return 
	end

	slot3 = self

	self._on_incapacitated(slot2)

	return 
end
function TeamAIDamage:_on_incapacitated()
	if self._tase_effect then
		slot3 = World
		slot4 = self._tase_effect

		World.effect_manager(slot2).fade_kill(slot2, World.effect_manager(slot2))

		self._tase_effect = nil
	end

	if self._to_incapacitated_clbk_id then
		slot4 = self._to_incapacitated_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._to_incapacitated_clbk_id = nil
	end

	self._regenerate_t = nil
	local dmg_info = {
		variant = "bleeding",
		result = {
			type = "fatal"
		}
	}
	self._bleed_out_health = 0
	slot4 = self

	self._check_fatal(slot3)

	if not self._to_dead_clbk_id then
		slot3 = tostring(self._unit.key(slot6))
		self._to_dead_clbk_id = "TeamAIDamage_to_dead" .. slot3
		slot4 = TimerManager
		slot4 = TimerManager.game(slot3)
		self._to_dead_t = TimerManager.game(slot3).time(slot3) + self._char_dmg_tweak.INCAPACITATED_TIME
		slot10 = "clbk_exit_to_dead"
		slot7 = self._to_dead_t

		managers.enemy.add_delayed_clbk(self._char_dmg_tweak.INCAPACITATED_TIME, managers.enemy, self._to_dead_clbk_id, callback(self._unit, self, self))
	end

	slot5 = dmg_info

	self._call_listeners(slot3, self)

	slot4 = self._unit
	slot5 = "from_server_damage_incapacitated"

	self._unit.network(slot3).send(slot3, self._unit.network(slot3))

	return 
end
function TeamAIDamage:clbk_exit_to_dead(from_client_join)
	self._to_dead_clbk_id = nil
	slot4 = self

	self._die(slot3)

	if not from_client_join then
		slot4 = self._unit
		slot5 = "from_server_damage_bleeding"

		self._unit.network(slot3).send(slot3, self._unit.network(slot3))
	end

	local dmg_info = {
		variant = "bleeding",
		result = {
			type = "death"
		},
		join_game = from_client_join
	}
	slot6 = dmg_info

	self._call_listeners(slot4, self)

	slot5 = self

	self._unregister_unit(slot4)

	return 
end
function TeamAIDamage:pre_destroy()
	slot3 = self

	self._clear_damage_transition_callbacks(slot2)

	return 
end
function TeamAIDamage:_cannot_take_damage()
	return self._invulnerable or self._dead or self._fatal or self._arrested_timer
end
function TeamAIDamage:disable()
	slot3 = self

	self._clear_damage_transition_callbacks(slot2)

	return 
end
function TeamAIDamage:_clear_damage_transition_callbacks()
	if self._to_incapacitated_clbk_id then
		slot4 = self._to_incapacitated_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._to_incapacitated_clbk_id = nil
	end

	if self._to_dead_clbk_id then
		slot4 = self._to_dead_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._to_dead_clbk_id = nil
	end

	return 
end
function TeamAIDamage:last_suppression_t()
	return self._last_received_dmg_t
end
function TeamAIDamage:can_attach_projectiles()
	return false
end
function TeamAIDamage:save(data)
	if self._arrested_timer then
		data.char_dmg = data.char_dmg or {}
		data.char_dmg.arrested = true
	end

	if self._bleed_out then
		data.char_dmg = data.char_dmg or {}
		data.char_dmg.bleedout = true
	end

	if self._fatal then
		data.char_dmg = data.char_dmg or {}
		data.char_dmg.fatal = true
	end

	return 
end
function TeamAIDamage:run_queued_teammate_panel_update()
	return 
end

return 
