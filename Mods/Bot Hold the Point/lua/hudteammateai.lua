Hooks:PostHook(HUDTeammateAI, "set_condition", 'F_'..Idstring("PostHook.HUDTeammateAI.set_condition.Bot Hold the Point"):key(), function(self, icon_data, text)
	if icon_data == "ai_set_should_stay" then
		if text == true then
			self:_set_status_icon(self._ai_stopped_icon)
		else
			self:_set_status_icon(self._nationality_icon)
		end
	end
end)

function HUDTeammateAI:_create_ai_stopped_icon()
	local ai_stopped_icon_params = {
		name = "ai_stopped_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.hud_icons.wp_key.texture,
		texture_rect = tweak_data.hud_icons.wp_key.texture_rect
	}
	self._ai_stopped_icon = self._status_panel:bitmap(ai_stopped_icon_params)
	self._ai_stopped_icon:set_center_x(self._status_panel:w() / 2)
	self._ai_stopped_icon:set_center_y(self._status_panel:h() / 2)
end

Hooks:PostHook(HUDTeammateAI, "_create_dead_icon", 'F_'..Idstring("PostHook.HUDTeammateAI._create_dead_icon.Bot Hold the Point"):key(), function(self)
	self:_create_ai_stopped_icon()
end)