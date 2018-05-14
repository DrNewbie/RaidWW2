HUDSuspicion = HUDSuspicion or class()
function HUDSuspicion:init(hud, sound_source)
	self._hud_panel = hud.panel
	self._sound_source = sound_source
	slot6 = "suspicion_panel"

	if self._hud_panel.child(slot4, self._hud_panel) then
		slot5 = self._hud_panel
		slot9 = "suspicion_panel"

		self._hud_panel.remove(slot4, self._hud_panel.child(slot7, self._hud_panel))
	end

	slot6 = {
		y = 0,
		name = "suspicion_panel",
		layer = 1,
		visible = false,
		valign = "center"
	}
	self._suspicion_panel = self._hud_panel.panel(slot4, self._hud_panel)

	self._suspicion_panel.set_size(slot4, self._suspicion_panel, 256)

	slot8 = self._suspicion_panel
	slot9 = self._suspicion_panel
	slot7 = self._suspicion_panel.parent(self._suspicion_panel.parent(256)).h(self._suspicion_panel.parent(256)) / 2

	self._suspicion_panel.set_center(slot4, self._suspicion_panel, self._suspicion_panel.parent(256).w(256) / 2)

	local scale = 1
	slot7 = {
		texture = "ui/ingame/textures/hud/hud_circle",
		name = "ring",
		h = 256,
		visible = true,
		alpha = 0.55,
		w = 256,
		blend_mode = "add",
		valign = "center"
	}
	local ring = self._suspicion_panel.bitmap(self._suspicion_panel, self._suspicion_panel)
	slot11 = ring

	ring.set_size(self._suspicion_panel, ring, ring.w(self._suspicion_panel.parent(self._suspicion_panel.parent(256))) * scale)

	slot10 = self._suspicion_panel
	slot8 = self._suspicion_panel.w(ring.h(ring) * scale) / 2

	ring.set_center_x(self._suspicion_panel, ring)

	slot10 = self._suspicion_panel
	slot8 = self._suspicion_panel.h(ring.h(ring) * scale) / 2

	ring.set_center_y(self._suspicion_panel, ring)

	return 
end
function HUDSuspicion:show()
	return 
end
function HUDSuspicion:hide()
	self._suspicion_value = 0
	self._discovered = nil
	self._back_to_stealth = nil
	slot3 = self._suspicion_panel

	if alive(slot2) then
		slot4 = false

		self._suspicion_panel.set_visible(slot2, self._suspicion_panel)
	end

	return 
end
function HUDSuspicion:back_to_stealth()
	self._back_to_stealth = true
	slot3 = self

	self.hide(slot2)

	return 
end
function HUDSuspicion:discovered()
	self._discovered = true

	return 
end

return 
