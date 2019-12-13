function CopBrain:convert_to_criminal(mastermind_criminal)
	self._logic_data.is_converted = true
	self._logic_data.group = nil

	local attention_setting = PlayerMovement._create_attention_setting_from_descriptor(self, tweak_data.attention.settings["enemy_team_cbt"])
	
	self._attention_handler:override_attention("enemy_team_cbt", attention_preset)

	local health_multiplier = 1
	local damage_multiplier = 1

	self._logic_data.attention_obj = nil

	CopLogicBase._destroy_all_detected_attention_object_data(self._logic_data)

	self._SO_access = managers.navigation:convert_access_flag(tweak_data.character.american.access)
	self._logic_data.SO_access = self._SO_access
	self._logic_data.SO_access_str = tweak_data.character.american.access
	self._slotmask_enemies = managers.slot:get_mask("enemies")
	self._logic_data.enemy_slotmask = self._slotmask_enemies
	
	self:set_objective(nil)
	self:set_logic("idle", nil)

	self._unit:base():set_slot(self._unit, 16)
	self._unit:set_slot(16)
	self._unit:movement():set_stance("hos")

	self._unit:brain():action_request({
		clamp_to_graph = true,
		type = "act",
		body_part = 1,
		variant = "attached_collar_enter",
		blocks = {
			heavy_hurt = -1,
			hurt = -1,
			action = -1,
			light_hurt = -1,
			walk = -1
		}
	})
end