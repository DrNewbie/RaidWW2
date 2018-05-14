-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
BoxGuiObject = BoxGuiObject or class()
local mvector_tl = Vector3()
local mvector_tr = Vector3()
local mvector_bl = Vector3()
local mvector_br = Vector3()
function BoxGuiObject:init(panel, config)
	slot7 = config

	self.create_sides(slot4, self, panel)

	return 
end
function BoxGuiObject:create_sides(panel, config)
	slot5 = panel

	if not alive(slot4) then
		slot6 = "[BoxGuiObject:create_sides] Failed creating BoxGui. Parent panel not alive!"

		Application.error(slot4, Application)

		slot5 = Application

		Application.stack_dump(slot4)

		return 
	end

	slot5 = self._panel

	if alive(slot4) then
		slot5 = self._panel
		slot6 = self._panel

		self._panel.parent(slot4).remove(slot4, self._panel.parent(slot4))

		self._panel = nil
	end

	slot6 = {
		valign = "grow",
		layer = 1,
		halign = "grow",
		name = config.name
	}
	self._panel = panel.panel(slot4, panel)
	self._color = config.color or self._color or Color.white
	local left_side = (config.sides and config.sides[1]) or config.left or 0
	local right_side = (config.sides and config.sides[2]) or config.right or 0
	local top_side = (config.sides and config.sides[3]) or config.top or 0
	local bottom_side = (config.sides and config.sides[4]) or config.bottom or 0
	slot12 = left_side

	self._create_side(slot8, self, self._panel, "left")

	slot12 = right_side

	self._create_side(slot8, self, self._panel, "right")

	slot12 = top_side

	self._create_side(slot8, self, self._panel, "top")

	slot12 = bottom_side

	self._create_side(slot8, self, self._panel, "bottom")

	return 
end
function BoxGuiObject:_create_side(panel, side, type)
	local ids_side = Idstring(slot5)
	local ids_left = Idstring(side)
	local ids_right = Idstring("left")
	local ids_top = Idstring("right")
	slot10 = "bottom"
	local ids_bottom = Idstring("top")
	local left_or_right = false
	local w, h = nil

	if ids_side == ids_left or ids_side == ids_right then
		left_or_right = true
		w = 2
		slot14 = panel
		h = panel.h(slot13)
	else
		slot14 = panel
		w = panel.w(slot13)
		h = 2
	end

	slot15 = {
		halign = "grow",
		valign = "grow",
		name = side,
		w = w,
		h = h
	}
	local side_panel = panel.panel(slot13, panel)

	if type == 0 then
		return 
	elseif type == 1 then
	elseif type == 2 then
	else
		slot18 = "is not supported"

		Application.error(slot14, Application, "[BoxGuiObject] Type", type)

		slot15 = Application

		Application.stack_dump(slot14)

		return 
	end

	slot17 = 0

	side_panel.set_position(slot14, side_panel, 0)

	if ids_side == ids_right then
		slot15 = side_panel
		slot18 = panel

		side_panel.set_right(slot14, panel.w(slot17))
	elseif ids_side == ids_bottom then
		slot15 = side_panel
		slot18 = panel

		side_panel.set_bottom(slot14, panel.h(slot17))
	end

	return side_panel
end
function BoxGuiObject:hide()
	slot3 = self._panel

	self._panel.hide(slot2)

	return 
end
function BoxGuiObject:show()
	slot3 = self._panel

	self._panel.show(slot2)

	return 
end
function BoxGuiObject:set_visible(visible)
	slot5 = visible

	self._panel.set_visible(slot3, self._panel)

	return 
end
function BoxGuiObject:visible()
	slot3 = self._panel

	return self._panel.visible(slot2)
end
function BoxGuiObject:set_layer(layer)
	slot5 = layer

	self._panel.set_layer(slot3, self._panel)

	return 
end
function BoxGuiObject:size()
	slot3 = self._panel

	return self._panel.size(slot2)
end
function BoxGuiObject:alive()
	slot3 = self._panel

	return alive(slot2)
end
function BoxGuiObject:inside(x, y, side)
	slot6 = self

	if not self.alive(slot5) then
		return false
	end

	if side then
		slot7 = side

		if self._panel.child(slot5, self._panel) then
			slot7 = side
			slot8 = y
			slot4 = self._panel.child(slot5, self._panel).inside(slot5, self._panel.child(slot5, self._panel), x)
		end

		return slot4
	else
		slot8 = y

		return self._panel.inside(slot5, self._panel, x)
	end

	return 
end
function BoxGuiObject:set_aligns(halign, valign)
	slot7 = self._panel

	for i, d in pairs(self._panel.children(slot6)) do
		slot11 = valign

		d.set_valign(slot9, d)

		slot11 = halign

		d.set_halign(slot9, d)
	end

	return 
end
function BoxGuiObject:set_clipping(clip, rec_panel)

	-- Decompilation error in this vicinity:
	slot3 = pairs

	for i, d in slot3(slot4) do
		if d.set_rotation then
			slot11 = (clip and 0) or 360

			d.set_rotation(slot9, d)
		else
			slot12 = d

			self.set_clipping(slot9, self, clip)
		end
	end

	return 
end
function BoxGuiObject:color()
	return self._color
end
function BoxGuiObject:set_color(color, rec_panel)

	-- Decompilation error in this vicinity:
	self._color = color
	slot3 = pairs

	for i, d in slot3(slot4) do
		if d.set_color then
			slot11 = color

			d.set_color(slot9, d)
		else
			slot12 = d

			self.set_color(slot9, self, color)
		end
	end

	return 
end
function BoxGuiObject:blend_mode()
	return self._blend_mode
end
function BoxGuiObject:set_blend_mode(blend_mode, rec_panel)

	-- Decompilation error in this vicinity:
	self._blend_mode = blend_mode
	slot3 = pairs

	for i, d in slot3(slot4) do
		if d.set_blend_mode then
			slot11 = blend_mode

			d.set_blend_mode(slot9, d)
		else
			slot12 = d

			self.set_blend_mode(slot9, self, blend_mode)
		end
	end

	return 
end
function BoxGuiObject:close()
	slot3 = self._panel

	if alive(slot2) then
		slot5 = self._panel

		if alive(self._panel.parent(slot4)) then
			slot3 = self._panel
			slot4 = self._panel

			self._panel.parent(slot2).remove(slot2, self._panel.parent(slot2))
		end
	end

	return 
end

return 
