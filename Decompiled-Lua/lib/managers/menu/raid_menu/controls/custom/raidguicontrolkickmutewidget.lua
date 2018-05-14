-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlKickMuteWidget then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlKickMuteWidget = slot0
RaidGUIControlKickMuteWidget.HEIGHT = 64
RaidGUIControlKickMuteWidget.HIGHLIGHT_LINE_X = 13
RaidGUIControlKickMuteWidget.HIGHLIGHT_LINE_W = 3
RaidGUIControlKickMuteWidget.HIGHLIGHT_LINE_H = 32
RaidGUIControlKickMuteWidget.NAME_X = 32
RaidGUIControlKickMuteWidget.NAME_H = 64
RaidGUIControlKickMuteWidget.NAME_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlKickMuteWidget.NAME_FONT_SIZE = tweak_data.gui.font_sizes.small
RaidGUIControlKickMuteWidget.NAME_FONT_COLOR_INACTIVE = tweak_data.gui.colors.raid_grey
RaidGUIControlKickMuteWidget.NAME_FONT_COLOR_ACTIVE = tweak_data.gui.colors.raid_dirty_white
RaidGUIControlKickMuteWidget.BUTTON_PADDING = 96
function RaidGUIControlKickMuteWidget:init(parent, params)
	slot5 = params
	self._params = clone(slot4)
	self._index = params.index
	self._name = params.name
	slot7 = params

	self._create_panel(slot4, self, parent)

	slot5 = self

	self._create_highlight_line(slot4)

	slot5 = self

	self._create_name_text(slot4)

	self._buttons = {}
	slot5 = self

	self._create_kick_button(slot4)

	slot5 = self

	self._create_mute_button(slot4)

	slot6 = "XB1"

	if SystemInfo.platform(slot4) == Idstring(SystemInfo) then
		slot5 = self

		self._create_gamercard_button(slot4)
	end

	slot5 = self

	self._create_invite_button(slot4)

	return 
end
function RaidGUIControlKickMuteWidget:_create_panel(parent, params)
	local parent_params = {
		halign = "scale",
		name = "kick_mute_widget_panel",
		visible = false,
		valign = "top",
		y = params.y,
		h = RaidGUIControlKickMuteWidget.HEIGHT
	}
	slot7 = parent_params
	self._object = parent.panel(slot5, parent)

	return 
end
function RaidGUIControlKickMuteWidget:_create_highlight_line()
	local highlight_params = {
		name = "highlight_line",
		halign = "left",
		alpha = 0,
		x = RaidGUIControlKickMuteWidget.HIGHLIGHT_LINE_X,
		w = RaidGUIControlKickMuteWidget.HIGHLIGHT_LINE_W,
		h = RaidGUIControlKickMuteWidget.HIGHLIGHT_LINE_H,
		color = tweak_data.gui.colors.raid_red
	}
	slot5 = highlight_params
	self._highlight_line = self._object.rect(slot3, self._object)
	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._highlight_line.set_center_y(slot3, self._highlight_line)

	return 
end
function RaidGUIControlKickMuteWidget:_create_name_text()
	local name_params = {
		name = "name",
		vertical = "center",
		align = "left",
		text = "WWWWWWWWWWWWWWWW",
		halign = "left",
		x = RaidGUIControlKickMuteWidget.NAME_X
	}
	slot4 = self._object
	name_params.w = self._object.w(slot3) - RaidGUIControlKickMuteWidget.NAME_X
	name_params.h = RaidGUIControlKickMuteWidget.NAME_H
	name_params.font = RaidGUIControlKickMuteWidget.NAME_FONT
	name_params.font_size = RaidGUIControlKickMuteWidget.NAME_FONT_SIZE
	name_params.color = RaidGUIControlKickMuteWidget.NAME_FONT_COLOR_INACTIVE
	slot5 = name_params
	self._name = self._object.text(RaidGUIControlKickMuteWidget.NAME_X, self._object)

	return 
end
function RaidGUIControlKickMuteWidget:_create_kick_button()
	local move_up_index = (1 < self._index and self._index - 1) or 3
	local move_down_index = self._index % 3 + 1
	local kick_button_params = {
		inactive_icon = "players_icon_kick"
	}
	slot7 = self._index
	kick_button_params.name = "kick_button_" .. tostring(slot6)
	slot8 = "on_kick_pressed"
	kick_button_params.on_click_callback = callback(tostring(slot6), self, self)
	slot8 = self._index
	kick_button_params.on_menu_move = {
		left = "mute_button_" .. tostring(self)
	}
	slot9 = "kick"
	kick_button_params.on_selected_callback = callback("mute_button_" .. tostring(self), self, self, "on_button_selected")
	slot9 = "kick"
	kick_button_params.on_unselected_callback = callback("mute_button_" .. tostring(self), self, self, "on_button_unselected")
	slot8 = kick_button_params
	self._kick_button = self._object.create_custom_control("mute_button_" .. tostring(self), self._object, RaidGUIControlButtonToggleSmall)

	if self._params.rightmost_center then
		slot9 = self._object
		slot7 = self._object.w(slot8) - self._params.rightmost_center

		self._kick_button.set_center_x(slot5, self._kick_button)
	else
		slot6 = self._kick_button
		slot9 = self._object

		self._kick_button.set_right(slot5, self._object.w(slot8))
	end

	slot9 = self._object
	slot7 = self._object.h(slot8) / 2

	self._kick_button.set_center_y(slot5, self._kick_button)

	slot7 = self._kick_button

	table.insert(slot5, self._buttons)

	return 
end
function RaidGUIControlKickMuteWidget:_create_mute_button()
	local move_up_index = (1 < self._index and self._index - 1) or 3
	local move_down_index = self._index % 3 + 1
	local mute_button_params = {
		active_icon = "players_icon_unmute",
		inactive_icon = "players_icon_mute"
	}
	slot7 = self._index
	mute_button_params.name = "mute_button_" .. tostring(slot6)
	slot8 = "on_mute_pressed"
	mute_button_params.on_click_callback = callback(tostring(slot6), self, self)
	slot8 = self._index
	mute_button_params.on_menu_move = {
		right = "kick_button_" .. tostring(self)
	}
	slot8 = "on_mute_selected"
	mute_button_params.on_selected_callback = callback("kick_button_" .. tostring(self), self, self)
	slot9 = "mute"
	mute_button_params.on_unselected_callback = callback("kick_button_" .. tostring(self), self, self, "on_button_unselected")
	slot7 = "XB1"

	if SystemInfo.platform("kick_button_" .. tostring(self)) == Idstring(SystemInfo) then
		slot8 = self._index
		mute_button_params.on_menu_move.left = "gamercard_button_" .. tostring(slot7)
	else
		mute_button_params.on_menu_move.left = "list_menu"
	end

	self._mute_button = self._object.create_custom_control(slot5, self._object, RaidGUIControlButtonToggleSmall)
	slot9 = self._kick_button
	slot7 = self._kick_button.center_x(mute_button_params) - RaidGUIControlKickMuteWidget.BUTTON_PADDING

	self._mute_button.set_center_x(slot5, self._mute_button)

	slot9 = self._object
	slot7 = self._object.h(RaidGUIControlKickMuteWidget.BUTTON_PADDING) / 2

	self._mute_button.set_center_y(slot5, self._mute_button)

	slot7 = self._mute_button

	table.insert(slot5, self._buttons)

	return 
end
function RaidGUIControlKickMuteWidget:_create_gamercard_button()
	local move_up_index = (1 < self._index and self._index - 1) or 3
	local move_down_index = self._index % 3 + 1
	local gamercard_button_params = {
		inactive_icon = "players_icon_gamecard"
	}
	slot7 = self._index
	gamercard_button_params.name = "gamercard_button_" .. tostring(slot6)
	slot8 = "show_gamercard"
	gamercard_button_params.on_click_callback = callback(tostring(slot6), self, self)
	slot8 = self._index
	gamercard_button_params.on_menu_move = {
		left = "list_menu",
		right = "mute_button_" .. tostring(self),
		up = "gamercard_button_" .. move_up_index,
		down = "gamercard_button_" .. move_down_index
	}
	slot9 = "gamercard"
	gamercard_button_params.on_selected_callback = callback("gamercard_button_" .. move_down_index, self, self, "on_button_selected")
	slot9 = "gamercard"
	gamercard_button_params.on_unselected_callback = callback("gamercard_button_" .. move_down_index, self, self, "on_button_unselected")
	self._gamercard_button = self._object.create_custom_control("gamercard_button_" .. move_down_index, self._object, RaidGUIControlButtonToggleSmall)
	slot9 = self._mute_button
	slot7 = self._mute_button.center_x(gamercard_button_params) - RaidGUIControlKickMuteWidget.BUTTON_PADDING

	self._gamercard_button.set_center_x("gamercard_button_" .. move_down_index, self._gamercard_button)

	slot9 = self._object
	slot7 = self._object.h(RaidGUIControlKickMuteWidget.BUTTON_PADDING) / 2

	self._gamercard_button.set_center_y("gamercard_button_" .. move_down_index, self._gamercard_button)

	slot7 = self._gamercard_button

	table.insert("gamercard_button_" .. move_down_index, self._buttons)

	return 
end
function RaidGUIControlKickMuteWidget:_create_invite_button()
	local move_up_index = (1 < self._index and self._index - 1) or 3
	local move_down_index = self._index % 3 + 1
	local invite_button_params = {
		active_icon = "players_icon_xbox_invite",
		visible = false,
		inactive_icon = "players_icon_xbox_invite"
	}
	slot7 = self._index
	invite_button_params.name = "invite_button_" .. tostring(slot6)
	slot8 = "on_invite_pressed"
	invite_button_params.on_click_callback = callback(tostring(slot6), self, self)
	invite_button_params.on_menu_move = {
		left = "list_menu",
		up = "kick_button_" .. move_up_index,
		down = "kick_button_" .. move_down_index
	}
	slot9 = "invite"
	invite_button_params.on_selected_callback = callback("kick_button_" .. move_down_index, self, self, "on_button_selected")
	slot9 = "invite"
	invite_button_params.on_unselected_callback = callback("kick_button_" .. move_down_index, self, self, "on_button_unselected")
	self._invite_button = self._object.create_custom_control("kick_button_" .. move_down_index, self._object, RaidGUIControlButtonToggleSmall)
	slot6 = self._invite_button
	slot9 = self._object

	self._invite_button.set_right("kick_button_" .. move_down_index, self._object.w(invite_button_params))

	slot9 = self._object
	slot7 = self._object.h(invite_button_params) / 2

	self._invite_button.set_center_y("kick_button_" .. move_down_index, self._invite_button)

	slot7 = self._invite_button

	table.insert("kick_button_" .. move_down_index, self._buttons)

	return 
end
function RaidGUIControlKickMuteWidget:_refresh_mute_button()
	slot3 = self._mute_button
	slot6 = self._peer

	self._mute_button.set_value(slot2, self._peer.is_muted(slot5))

	return 
end
function RaidGUIControlKickMuteWidget:set_peer(peer, mute_button, kick_button)
	self._peer = peer
	slot6 = self._name
	slot11 = peer

	self._name.set_text(slot5, utf8.to_upper(peer.name(slot10)))

	slot6 = self._name
	local _, _, w, _ = self._name.text_rect(slot5)
	slot11 = w

	self._name.set_w(peer.name, self._name)

	slot10 = self

	self._refresh_mute_button(peer.name)

	slot11 = mute_button

	self._mute_button.set_visible(peer.name, self._mute_button)

	slot11 = kick_button

	self._kick_button.set_visible(peer.name, self._kick_button)

	slot11 = true

	self._object.set_visible(peer.name, self._object)

	return 
end
function RaidGUIControlKickMuteWidget:calculate_width()
	local w = 0
	slot4 = self._object
	local leftmost_button_x = self._object.w(slot3)

	for i = 1, #self._buttons, 1 do
		slot9 = self._buttons[i]

		if self._buttons[i].x(slot8) < leftmost_button_x then
			slot9 = self._buttons[i]
			leftmost_button_x = self._buttons[i].x(slot8)
		end
	end

	slot5 = self._object
	w = (w + self._object.w(slot4)) - leftmost_button_x
	w = w + RaidGUIControlKickMuteWidget.BUTTON_PADDING
	slot5 = self._name
	local _, _, name_w, _ = self._name.text_rect(slot4)
	w = w + name_w + RaidGUIControlKickMuteWidget.NAME_X

	return w
end
function RaidGUIControlKickMuteWidget:set_w(w)
	slot5 = w

	RaidGUIControlKickMuteWidget.super.set_w(slot3, self)

	slot4 = self

	self._fit_size(slot3)

	return 
end
function RaidGUIControlKickMuteWidget:_fit_size()
	slot3 = self._name
	local _, _, w, _ = self._name.text_rect(slot2)
	slot8 = w

	self._name.set_w(slot6, self._name)

	if self._params.rightmost_center then
		slot10 = self._object
		slot8 = self._object.w(slot9) - self._params.rightmost_center

		self._kick_button.set_center_x(slot6, self._kick_button)
	else
		slot7 = self._kick_button
		slot10 = self._object

		self._kick_button.set_right(slot6, self._object.w(slot9))
	end

	slot7 = self._kick_button

	if self._kick_button.visible(slot6) then
		slot10 = self._kick_button
		slot8 = self._kick_button.center_x(slot9) - RaidGUIControlKickMuteWidget.BUTTON_PADDING

		self._mute_button.set_center_x(slot6, self._mute_button)
	else
		slot7 = self._mute_button
		slot10 = self._object

		self._mute_button.set_right(slot6, self._object.w(slot9))
	end

	local button_panel_left = nil
	slot9 = "XB1"

	if SystemInfo.platform(slot7) == Idstring(SystemInfo) then
		slot11 = self._mute_button
		slot9 = self._mute_button.center_x(slot10) - RaidGUIControlKickMuteWidget.BUTTON_PADDING

		self._gamercard_button.set_center_x(slot7, self._gamercard_button)

		slot8 = self._gamercard_button
		button_panel_left = self._gamercard_button.x(slot7)
	else
		slot8 = self._mute_button
		button_panel_left = self._mute_button.x(slot7)
	end

	slot8 = self._invite_button
	slot11 = self._object

	self._invite_button.set_right(slot7, self._object.w(slot10))

	slot9 = RaidGUIControlKickMuteWidget.HIGHLIGHT_LINE_X

	self._highlight_line.set_x(slot7, self._highlight_line)

	slot9 = RaidGUIControlKickMuteWidget.NAME_X

	self._name.set_x(slot7, self._name)

	return 
end
function RaidGUIControlKickMuteWidget:on_mute_selected()
	if self._params.on_button_selected_callback then
		slot5 = self._mute_button
		slot3 = (self._mute_button.get_value(slot4) and "unmute") or "mute"

		self._params.on_button_selected_callback(slot2)
	end

	return 
end
function RaidGUIControlKickMuteWidget:on_mute_pressed()
	if not self._peer then
		return 
	end

	slot3 = self

	self.on_mute_selected(slot2)

	slot6 = self._peer
	slot4 = not self._peer.is_muted(slot5)

	self._peer.set_muted(slot2, self._peer)

	slot3 = self

	self._refresh_mute_button(slot2)

	return 
end
function RaidGUIControlKickMuteWidget:on_kick_pressed()
	if not self._peer then
		return 
	end

	local params = {}
	slot6 = "on_kick_confirmed"
	params.yes_callback = callback(slot3, self, self)
	slot4 = self._peer
	params.player_name = self._peer.name(slot3)
	slot5 = params

	managers.menu.show_kick_peer_dialog(slot3, managers.menu)

	return 
end
function RaidGUIControlKickMuteWidget:on_invite_pressed()
	RaidMenuCallbackHandler.invite_friend()

	return 
end
function RaidGUIControlKickMuteWidget:set_invite_widget()
	slot3 = self._buttons

	for index, button in pairs(slot2) do
		slot9 = false

		button.set_visible(slot7, button)
	end

	slot4 = true

	self._invite_button.set_visible(slot2, self._invite_button)

	slot4 = true

	self._object.set_visible(slot2, self._object)

	slot3 = self._name
	slot8 = true

	self._name.set_text(slot2, self.translate(slot5, self, "menu_widget_label_invite_player"))

	return 
end
function RaidGUIControlKickMuteWidget:set_move_controls(number_of_widgets_shown, invite_widget_shown)

	-- Decompilation error in this vicinity:
	if number_of_widgets_shown < 2 then
		local invite_button_move = {
			left = "list_menu"
		}
		slot7 = invite_button_move

		self._invite_button.set_menu_move_controls(slot5, self._invite_button)

		return 
	end

	move_up_index = (1 < self._index and self._index - 1) or number_of_widgets_shown
	local move_down_index = self._index % number_of_widgets_shown + 1
	local is_invite_up = invite_widget_shown and self._index == 1
	local is_invite_down = invite_widget_shown and self._index == number_of_widgets_shown - 1
	local on_menu_move = nil
	slot11 = "XB1"

	if SystemInfo.platform(slot9) == Idstring(SystemInfo) then

		-- Decompilation error in this vicinity:
		slot8 = {
			left = "list_menu",
			right = "mute_button_" .. tostring(slot11)
		}
		slot12 = self._index
		slot8.up = slot9
		slot8.down = slot9
		on_menu_move = slot8
		slot11 = on_menu_move

		self._gamercard_button.set_menu_move_controls(slot9, self._gamercard_button)
	end

	slot8 = {}
	slot12 = "XB1"
	slot8.up = slot9
	slot8.down = slot9
	on_menu_move = slot8
	slot11 = on_menu_move

	self._kick_button.set_menu_move_controls(slot9, self._kick_button)

	slot8 = {
		left = "list_menu"
	}
	slot11 = Network
	slot8.up = slot9
	slot11 = Network
	slot8.down = slot9
	on_menu_move = slot8
	slot11 = on_menu_move

	self._invite_button.set_menu_move_controls(slot9, self._invite_button)

	return 
end
function RaidGUIControlKickMuteWidget:show_gamercard()
	slot9 = self._peer
	slot4 = "[RaidGUIControlKickMuteWidget:show_gamercard] showing gamercard for peer " .. tostring(self._peer.name(slot8))

	Application.trace(slot2, Application)

	slot4 = "[RaidGUIControlKickMuteWidget:show_gamercard]"
	slot7 = self._peer

	Application.debug(slot2, Application, inspect(slot6))

	slot3 = self._callback_handler
	slot6 = self._peer

	self._callback_handler.view_gamer_card(slot2, self._peer.xuid(inspect))

	return 
end
function RaidGUIControlKickMuteWidget:on_kick_confirmed()
	slot4 = self._peer

	managers.vote.host_kick(slot2, managers.vote)

	slot4 = "kick_player"

	managers.menu_component.post_event(slot2, managers.menu_component)

	return 
end
function RaidGUIControlKickMuteWidget:highlight_on()
	slot3 = self._highlight_line

	self._highlight_line.stop(slot2)

	slot3 = self._highlight_line
	slot8 = "_animate_highlight_on"

	self._highlight_line.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlKickMuteWidget:highlight_off()
	slot3 = self._highlight_line

	self._highlight_line.stop(slot2)

	slot3 = self._highlight_line
	slot8 = "_animate_highlight_off"

	self._highlight_line.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlKickMuteWidget:set_selected(selected)
	self._selected = selected

	if selected then
		slot5 = true

		self._kick_button.set_selected(slot3, self._kick_button)

		slot5 = false

		self._mute_button.set_selected(slot3, self._mute_button)
	else
		slot5 = false

		self._kick_button.set_selected(slot3, self._kick_button)

		slot5 = false

		self._mute_button.set_selected(slot3, self._mute_button)
	end

	return 
end
function RaidGUIControlKickMuteWidget:on_button_selected(button)
	if self._params.on_button_selected_callback then
		slot4 = button

		self._params.on_button_selected_callback(slot3)
	end

	return 
end
function RaidGUIControlKickMuteWidget:on_button_unselected(button)
	if self._params.on_button_unselected_callback then
		slot4 = button

		self._params.on_button_unselected_callback(slot3)
	end

	return 
end
function RaidGUIControlKickMuteWidget:_animate_highlight_on()
	local duration = 0.2
	slot4 = self._highlight_line
	local t = self._highlight_line.alpha(slot3) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quintic_in_out(slot5, t, 0, 1)
		slot8 = current_alpha

		self._highlight_line.set_alpha(t, self._highlight_line)
	end

	slot6 = 1

	self._highlight_line.set_alpha(slot4, self._highlight_line)

	return 
end
function RaidGUIControlKickMuteWidget:_animate_highlight_off()
	local duration = 0.2
	slot4 = self._highlight_line
	local t = (1 - self._highlight_line.alpha(slot3)) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quintic_in_out(slot5, t, 1, -1)
		slot8 = current_alpha

		self._highlight_line.set_alpha(t, self._highlight_line)
	end

	slot6 = 0

	self._highlight_line.set_alpha(slot4, self._highlight_line)

	return 
end

return 
