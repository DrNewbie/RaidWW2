function HUDHitConfirm:update_tick(t, dt)
	self._left:set_center(self._main:center())
	self._left:set_right(self._main:left())
	
	self._right:set_center(self._main:center())
	self._right:set_left(self._main:right())
	
	self._above_ch:set_center(self._main:center())
	self._above_ch:set_bottom(self._main:top())
	
	self._below_ch:set_center(self._main:center())
	self._below_ch:set_top(self._main:bottom())
    
    
	self._above_ch_left:set_center(self._left:center())
	self._above_ch_left:set_bottom(self._main:top())
	
    self._below_ch_left:set_center(self._left:center())
	self._below_ch_left:set_top(self._main:bottom())
    
	self._above_ch_right:set_center(self._right:center())
	self._above_ch_right:set_bottom(self._main:top())
    
	self._below_ch_right:set_center(self._right:center())
	self._below_ch_right:set_top(self._main:bottom())
end

function HUDHitConfirm:tick(t, dt)
	if not game_state_machine or not game_state_machine._current_state or game_state_machine._current_state._name ~= "ingame_standard" then
		return
	end
	self._main:set_center(self._hud_panel:center())
	self:update_tick(t, dt)
end

Hooks:PostHook(HUDHitConfirm, "init", "Crosshair_define", function(self)
	self._main = self._hud_panel:bitmap({
		visible = false,
		name = "_main",
		layer = 0,
		w = 10,
		h = 10
	})
	self._main:set_center(self._hud_panel:center())
	
	self._offset = self._hud_panel:bitmap({
		visible = false,
		name = "_offset",
		layer = 0,
		w = 5,
		h = 52
	})
	self._offset:set_center(self._hud_panel:center())
	self._offset:set_bottom(self._main:top())
	
	self._left = self._hud_panel:bitmap({
		visible = true,
		name = "_left",
		layer = 0,
		w = 10,
		h = 5
	})
	self._left:set_center(self._hud_panel:center())
	self._left:set_right(self._main:left())
	
	self._right = self._hud_panel:bitmap({
		visible = true,
		name = "_right",
		layer = 0,
		w = 10,
		h = 5
	})
	self._right:set_center(self._hud_panel:center())
	self._right:set_left(self._main:right())
	
	self._above_ch = self._hud_panel:bitmap({
		visible = true,
		name = "_above_ch",
		layer = 0,
		w = 5,
		h = 10
	})
	self._above_ch:set_center(self._hud_panel:center())
	self._above_ch:set_bottom(self._main:top())
	
	self._below_ch = self._hud_panel:bitmap({
		visible = true,
		name = "_below_ch",
		layer = 0,
		w = 5,
		h = 10
	})
	self._below_ch:set_center(self._hud_panel:center())
	self._below_ch:set_top(self._main:bottom())
	
	self._above_ch_left = self._hud_panel:bitmap({
		visible = true,
		name = "_above_ch_left",
		color = Color(0,0,0),
		layer = 0,
		rotation = 315,
		w = 0.5,
		h = 5
	})
	self._above_ch_left:set_center(self._left:center())
	self._above_ch_left:set_bottom(self._main:top())
	
	self._below_ch_left = self._hud_panel:bitmap({
		visible = true,
		name = "_below_ch_left",
		color = Color(0,0,0),
		layer = 0,
		rotation = 45,
		w = 0.5,
		h = 5
	})
	self._below_ch_left:set_center(self._left:center())
	self._below_ch_left:set_top(self._main:bottom())
	
	self._above_ch_right = self._hud_panel:bitmap({
		visible = true,
		name = "_above_ch_right",
		color = Color(0,0,0),
		layer = 0,
		rotation = 45,
		w = 0.5,
		h = 5
	})
	self._above_ch_right:set_center(self._right:center())
	self._above_ch_right:set_bottom(self._main:top())
	
	self._below_ch_right = self._hud_panel:bitmap({
		visible = true,
		name = "_below_ch_right",
		color = Color(0,0,0),
		layer = 0,
		rotation = 315,
		w = 0.5,
		h = 5
	})
	self._below_ch_right:set_center(self._right:center())
	self._below_ch_right:set_top(self._main:bottom())
	managers.hud:add_updator("CrosshairUpdater", callback(self, self, "tick"))
end)