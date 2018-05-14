if not RaidGUIControlXPCell then
	slot2 = RaidGUIControlTableCell
	slot0 = class(slot1)
end

RaidGUIControlXPCell = slot0
RaidGUIControlXPCell.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlXPCell.FONT_SIZE = tweak_data.gui.font_sizes.small
function RaidGUIControlXPCell:init(parent, params)
	params.font = RaidGUIControlXPCell.FONT
	params.font_size = RaidGUIControlXPCell.FONT_SIZE
	slot7 = params

	RaidGUIControlXPCell.super.init(slot4, self, parent)

	slot5 = self._object
	self._starting_x = self._object.x(slot4)
	slot5 = self._object
	self._initial_color = self._object.color(slot4)
	slot5 = self._object
	self._bottom = self._object.bottom(slot4)
	slot5 = self._object
	self._center_x = self._object.center_x(slot4)
	slot5 = self._object
	self._initial_font_size = self._object.font_size(slot4)

	return 
end
function RaidGUIControlXPCell:set_text(text, animate)
	slot5 = self._object

	if text ~= self._object.text(slot4) then
		slot6 = text

		self._object.set_text(slot4, self._object)

		if animate then
			slot5 = self._object

			self._object.stop(slot4)

			slot5 = self._object
			slot10 = "animate_change_text"
			self._text_change_animation_thread = self._object.animate(slot4, callback(slot7, self, self))
		end
	end

	return 
end
function RaidGUIControlXPCell:set_visible(flag)
	local alpha = (flag and 1) or 0
	slot6 = alpha

	self._object.set_alpha(slot4, self._object)

	return 
end
function RaidGUIControlXPCell:fade_in(duration)
	if self._fade_in_animation_thread then
		slot4 = self._panel
		slot5 = self._fade_in_animation_thread

		self._panel.get_engine_panel(slot3).stop(slot3, self._panel.get_engine_panel(slot3))
	end

	slot4 = self._panel
	slot9 = "animate_fade_in"
	slot6 = duration
	self._fade_in_animation_thread = self._panel.get_engine_panel(slot3).animate(slot3, self._panel.get_engine_panel(slot3), callback(slot6, self, self))

	return 
end
function RaidGUIControlXPCell:animate_fade_in(panel, duration)
	local t = 0
	local anim_duration = duration or 0.15

	while t < anim_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = anim_duration
		local current_alpha = Easing.quartic_out(slot7, t, 0, 1)
		slot10 = current_alpha

		self._object.set_alpha(t, self._object)
	end

	slot8 = 1

	self._object.set_alpha(slot6, self._object)

	return 
end
function RaidGUIControlXPCell:animate_change_text(panel)
	local starting_color = tweak_data.gui.colors.xp_breakdown_active_column
	local offset = 15
	local t = 0
	slot8 = self._starting_x - offset

	self._object.set_x(slot6, self._object)

	while t < 0.5 do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = 0.5
		local current_position = Easing.quartic_in(slot7, t, self._starting_x - offset, offset)
		slot10 = current_position

		self._object.set_x(t, self._object)

		slot12 = 0.5
		local new_r = Easing.quartic_in(t, t, starting_color.r, self._initial_color.r)
		slot13 = 0.5
		local new_g = Easing.quartic_in(t, t, starting_color.g, self._initial_color.g)
		local new_b = Easing.quartic_in(t, t, starting_color.b, self._initial_color.b)
		slot12 = self._object
		slot17 = new_b

		self._object.set_color(t, Color(0.5, new_r, new_g))
	end

	slot8 = self._starting_x

	self._object.set_x(slot6, self._object)

	slot8 = self._initial_color

	self._object.set_color(slot6, self._object)

	return 
end
function RaidGUIControlXPCell:highlight_on()
	return 
end
function RaidGUIControlXPCell:highlight_off()
	return 
end
function RaidGUIControlXPCell:select_on()
	return 
end
function RaidGUIControlXPCell:select_off()
	return 
end
function RaidGUIControlXPCell:on_double_click(button)
	return 
end

return 
