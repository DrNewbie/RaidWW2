HUDHitConfirm = HUDHitConfirm or class()
HUDHitConfirm.HIT_ICON = "indicator_hit"
HUDHitConfirm.HEADSHOT_ICON = "indicator_head_shot"
HUDHitConfirm.CRITICAL_ICON = "indicator_kill"
function HUDHitConfirm:init(hud)
	self._hud_panel = hud.panel
	slot4 = self

	self.cleanup(slot3)

	slot6 = HUDHitConfirm.HIT_ICON
	self._hit_confirm = self._create_icon(slot3, self, "hit_confirm")
	slot6 = HUDHitConfirm.HEADSHOT_ICON
	self._headshot_confirm = self._create_icon(slot3, self, "headshot_confirm")
	slot6 = HUDHitConfirm.CRITICAL_ICON
	self._crit_confirm = self._create_icon(slot3, self, "crit_confirm")

	return 
end
function HUDHitConfirm:_create_icon(name, icon)
	local icon_params = {
		valign = "center",
		halign = "center",
		visible = false,
		name = name,
		texture = tweak_data.gui.icons[icon].texture,
		texture_rect = tweak_data.gui.icons[icon].texture_rect
	}
	slot7 = icon_params
	local icon = self._hud_panel.bitmap(slot5, self._hud_panel)
	slot11 = self._hud_panel

	icon.set_center(self._hud_panel, icon, self._hud_panel.w(self._hud_panel.h(self._hud_panel) / 2) / 2)

	return icon
end
function HUDHitConfirm:on_hit_confirmed()
	slot3 = self._hit_confirm

	self._hit_confirm.stop(slot2)

	slot8 = "_animate_show"
	slot9 = "show_done"
	slot6 = 0.25

	self._hit_confirm.animate(slot2, self._hit_confirm, callback(slot5, self, self), callback(self, self, self))

	return 
end
function HUDHitConfirm:on_headshot_confirmed()
	slot3 = self._headshot_confirm

	self._headshot_confirm.stop(slot2)

	slot8 = "_animate_show"
	slot9 = "show_done"
	slot6 = 0.25

	self._headshot_confirm.animate(slot2, self._headshot_confirm, callback(slot5, self, self), callback(self, self, self))

	return 
end
function HUDHitConfirm:on_crit_confirmed()
	slot3 = self._crit_confirm

	self._crit_confirm.stop(slot2)

	slot8 = "_animate_show"
	slot9 = "show_done"
	slot6 = 0.25

	self._crit_confirm.animate(slot2, self._crit_confirm, callback(slot5, self, self), callback(self, self, self))

	return 
end
function HUDHitConfirm:cleanup()
	slot4 = "hit_confirm"

	if self._hud_panel.child(slot2, self._hud_panel) then
		slot3 = self._hud_panel
		slot7 = "hit_confirm"

		self._hud_panel.remove(slot2, self._hud_panel.child(slot5, self._hud_panel))
	end

	slot4 = "headshot_confirm"

	if self._hud_panel.child(slot2, self._hud_panel) then
		slot3 = self._hud_panel
		slot7 = "headshot_confirm"

		self._hud_panel.remove(slot2, self._hud_panel.child(slot5, self._hud_panel))
	end

	slot4 = "crit_confirm"

	if self._hud_panel.child(slot2, self._hud_panel) then
		slot3 = self._hud_panel
		slot7 = "crit_confirm"

		self._hud_panel.remove(slot2, self._hud_panel.child(slot5, self._hud_panel))
	end

	return 
end
function HUDHitConfirm:_animate_show(hint_confirm, done_cb, seconds)
	slot7 = true

	hint_confirm.set_visible(slot5, hint_confirm)

	slot7 = 1

	hint_confirm.set_alpha(slot5, hint_confirm)

	local t = seconds

	while 0 < t do
		local dt = coroutine.yield()
		t = t - dt
		slot9 = t / seconds

		hint_confirm.set_alpha(slot7, hint_confirm)
	end

	slot8 = false

	hint_confirm.set_visible(slot6, hint_confirm)
	done_cb()

	return 
end
function HUDHitConfirm:show_done()
	return 
end

return 
