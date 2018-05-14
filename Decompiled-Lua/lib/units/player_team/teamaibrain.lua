slot2 = "lib/units/player_team/logics/TeamAILogicBase"

require(slot1)

slot2 = "lib/units/player_team/logics/TeamAILogicInactive"

require(slot1)

slot2 = "lib/units/player_team/logics/TeamAILogicIdle"

require(slot1)

slot2 = "lib/units/player_team/logics/TeamAILogicAssault"

require(slot1)

slot2 = "lib/units/player_team/logics/TeamAILogicTravel"

require(slot1)

slot2 = "lib/units/player_team/logics/TeamAILogicDisabled"

require(slot1)

slot2 = "lib/units/player_team/logics/TeamAILogicSurrender"

require(slot1)

if not TeamAIBrain then
	slot2 = CopBrain
	slot0 = class(slot1)
end

TeamAIBrain = slot0
TeamAIBrain._create_attention_setting_from_descriptor = PlayerMovement._create_attention_setting_from_descriptor
TeamAIBrain._logics = {
	inactive = TeamAILogicInactive,
	idle = TeamAILogicIdle,
	surrender = TeamAILogicSurrender,
	travel = TeamAILogicTravel,
	assault = TeamAILogicAssault,
	disabled = TeamAILogicDisabled
}
local reload = nil

if TeamAIBrain._reload_clbks then
	reload = true
else
	TeamAIBrain._reload_clbks = {}
end

function TeamAIBrain:init(unit)
	self._unit = unit
	slot4 = TimerManager
	self._timer = TimerManager.game(slot3)
	slot5 = false

	self.set_update_enabled_state(slot3, self)

	self._current_logic = nil
	self._current_logic_name = nil
	self._active = true
	slot8 = unit
	slot5 = tweak_data.character[unit.base(slot7)._tweak_table].access
	self._SO_access = managers.navigation.convert_access_flag(slot3, managers.navigation)
	slot8 = "on_reload"
	self._reload_clbks[unit.key(managers.navigation)] = callback(unit, self, self)
	self.random_travel_applied = true

	return 
end
function TeamAIBrain:post_init()
	slot3 = self

	self._reset_logic_data(slot2)

	slot5 = self._unit
	local my_key = tostring(self._unit.key(slot4))
	slot4 = self._unit
	slot6 = {
		"bleedout",
		"hurt",
		"light_hurt",
		"heavy_hurt",
		"fatal",
		"none"
	}
	slot11 = "clbk_damage"

	self._unit.character_damage(self._unit.key).add_listener(self._unit.key, self._unit.character_damage(self._unit.key), "TeamAIBrain_hurt" .. my_key, callback(slot8, self, self))

	slot4 = self._unit
	slot6 = {
		"death"
	}
	slot11 = "clbk_death"

	self._unit.character_damage(self._unit.key).add_listener(self._unit.key, self._unit.character_damage(self._unit.key), "TeamAIBrain_death" .. my_key, callback(slot8, self, self))

	slot4 = managers.groupai
	slot6 = {
		"enemy_weapons_hot"
	}
	slot11 = "clbk_heat"

	managers.groupai.state(self._unit.key).add_listener(self._unit.key, managers.groupai.state(self._unit.key), "TeamAIBrain" .. my_key, callback(slot8, self, self))

	if not self._current_logic then
		slot5 = "idle"

		self.set_init_logic(slot3, self)
	end

	slot4 = self

	self._setup_attention_handler(slot3)

	slot7 = self._unit
	slot3 = tostring(self._unit.key(slot6))
	self._alert_listen_key = "TeamAIBrain" .. slot3
	slot4 = managers.groupai
	slot5 = "combatant"
	local alert_listen_filter = managers.groupai.state(slot3).get_unit_type_filter(slot3, managers.groupai.state(slot3))
	slot5 = managers.groupai
	slot9 = {
		bullet = true,
		vo_intimidate = true
	}
	slot12 = self._unit
	slot12 = self._unit.movement("on_alert")

	managers.groupai.state(managers.groupai.state(slot3)).add_alert_listener(managers.groupai.state(slot3), managers.groupai.state(managers.groupai.state(slot3)), self._alert_listen_key, callback(slot8, self, self), alert_listen_filter, self._unit.movement("on_alert").m_head_pos("on_alert"))

	return 
end
function TeamAIBrain:current_logic_name()
	return self._current_logic_name
end
function TeamAIBrain:_reset_logic_data()
	TeamAIBrain.super._reset_logic_data(slot2)

	self._logic_data.enemy_slotmask = managers.slot.get_mask(self, managers.slot)
	slot7 = managers.groupai
	slot6 = "on_criminal_objective_complete"
	self._logic_data.objective_complete_clbk = callback(self, managers.groupai.state("enemies"), managers.groupai.state(managers.groupai))
	slot7 = managers.groupai
	slot6 = "on_criminal_objective_failed"
	self._logic_data.objective_failed_clbk = callback(self, managers.groupai.state(managers.groupai.state(managers.groupai)), managers.groupai.state(managers.groupai))

	return 
end
function TeamAIBrain:set_spawn_ai(spawn_ai)
	slot5 = spawn_ai

	TeamAIBrain.super.set_spawn_ai(slot3, self)

	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	if managers.groupai.state(slot3).enemy_weapons_hot(slot3) then
		slot4 = self

		self.clbk_heat(slot3)
	end

	return 
end
function TeamAIBrain:clbk_damage(my_unit, damage_info)
	slot6 = damage_info

	self._current_logic.damage_clbk(slot4, self._logic_data)

	return 
end
function TeamAIBrain:clbk_death(my_unit, damage_info)
	slot7 = damage_info

	TeamAIBrain.super.clbk_death(slot4, self, my_unit)

	slot5 = self

	self.set_objective(slot4)

	return 
end
function TeamAIBrain:on_cop_neutralized(cop_key)
	slot5 = cop_key

	return self._current_logic.on_cop_neutralized(slot3, self._logic_data)
end
function TeamAIBrain:on_long_dis_interacted(amount, other_unit)
	slot5 = self._unit

	if self._unit.anim_data(slot4).forced then
		slot6 = "[TeamAIBrain:on_long_dis_interacted] ignore while parachuting"

		Application.debug(slot4, Application)

		return 
	end

	slot5 = self._unit
	slot6 = false

	self._unit.movement(slot4).set_cool(slot4, self._unit.movement(slot4))

	slot6 = other_unit

	return self._current_logic.on_long_dis_interacted(slot4, self._logic_data)
end
function TeamAIBrain:on_recovered(reviving_unit)
	slot5 = reviving_unit

	self._current_logic.on_recovered(slot3, self._logic_data)

	return 
end
function TeamAIBrain:clbk_heat()
	slot3 = self._logic_data

	self._current_logic.clbk_heat(slot2)

	return 
end
function TeamAIBrain:pre_destroy(unit)
	slot5 = unit

	TeamAIBrain.super.pre_destroy(slot3, self)

	slot4 = managers.groupai
	slot10 = self._unit
	slot5 = "TeamAIBrain" .. tostring(self._unit.key(slot9))

	managers.groupai.state(slot3).remove_listener(slot3, managers.groupai.state(slot3))

	return 
end
function TeamAIBrain:set_active(state)
	slot5 = state

	TeamAIBrain.super.set_active(slot3, self)

	if not state then
		slot4 = self

		self.set_objective(slot3)
	end

	slot4 = self._unit
	slot4 = self._unit.character_damage(slot3)

	self._unit.character_damage(slot3).disable(slot3)

	return 
end
function TeamAIBrain:_setup_attention_handler()
	slot3 = self

	TeamAIBrain.super._setup_attention_handler(slot2)

	slot3 = self
	slot6 = self._unit
	slot6 = self._unit.movement(slot5)

	self.on_cool_state_changed(slot2, self._unit.movement(slot5).cool(slot5))

	return 
end
function TeamAIBrain:on_cool_state_changed(state)
	if self._logic_data then
		self._logic_data.cool = state
	end

	if not self._attention_handler then
		return 
	end

	local att_settings = nil

	if state then
		att_settings = {
			"team_team_idle"
		}
	else
		att_settings = {
			"team_enemy_cbt"
		}
	end

	slot7 = "team_AI"

	PlayerMovement.set_attention_settings(slot4, self, att_settings)

	return 
end
function TeamAIBrain:clbk_attention_notice_sneak(observer_unit, status)
	return 
end
function TeamAIBrain:_chk_enable_bodybag_interaction()
	slot3 = self._unit
	slot4 = "dead"

	self._unit.interaction(slot2).set_tweak_data(slot2, self._unit.interaction(slot2))

	return 
end

return 
