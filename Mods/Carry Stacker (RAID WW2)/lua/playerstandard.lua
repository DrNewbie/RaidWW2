local btn_use_item_held = false

Hooks:PostHook(PlayerStandard, "update", 'F_'..Idstring("PostHook.PlayerStandard.update.Carry Stacker (Raid WW2)"):key(), function(self)
	if self ~= nil and self._get_input ~= nil then
		btn_use_item_held = self._controller:get_input_bool("use_item")
	end
end)

function PlayerStandard:use_item_held()
	return btn_use_item_held
end
