Hooks:PostHook(InteractionTweakData, "init", "doctor_bag_simple_interaction_tweak_init000", function(self, ...)
	self.doctor_bag_simple = {
		icon = "equipment_doctor_bag",
		text_id = "debug_interact_doctor_bag_simple",
		contour = "deployable",
		timer = 3.5,
		action_text_id = "hud_action_healing",
		interact_distance = self.POWERUP_INTERACTION_DISTANCE
	}
end)

Hooks:Add("LocalizationManagerPostInit", "doctor_bag_simple_interaction_loc000", function(self)
	self:add_localized_strings({
		["debug_interact_doctor_bag_simple"] = "Use Medic Bag",
	})
end)