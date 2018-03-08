Hooks:PostHook(CopMovement, "post_init", "Pager_Init.Post.CopMovement.post_init", function(self)
	if self._unit:in_slot(managers.slot:get_mask("enemies")) then
		self._unit:unit_data().has_alarm_pager = true
	end
end)