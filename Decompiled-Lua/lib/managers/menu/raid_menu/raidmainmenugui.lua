if not RaidMainMenuGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMainMenuGui = slot0
RaidMainMenuGui.WIDGET_PANEL_Y = 256
RaidMainMenuGui.WIDGET_PANEL_W = 576
RaidMainMenuGui.WIDGET_PANEL_H = 256
RaidMainMenuGui.STEAM_GROUP_BUTTON_W = 544
RaidMainMenuGui.STEAM_GROUP_BUTTON_H = 306
function RaidMainMenuGui:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	RaidMainMenuGui.super.init(slot6, self, ws, fullscreen_ws, node)

	slot8 = true

	managers.menu.mark_main_menu(slot6, managers.menu)

	slot7 = managers.raid_menu

	managers.raid_menu.show_background(slot6)

	slot7 = managers.gold_economy

	managers.gold_economy.get_gold_awards(slot6)

	return 
end
function RaidMainMenuGui:_setup_properties()
	slot3 = self

	RaidMainMenuGui.super._setup_properties(slot2)

	self._background = "ui/backgrounds/raid_main_bg_hud"

	return 
end
function RaidMainMenuGui:_layout()
	slot4 = "WIN32"
	self._display_invite_widget = SystemInfo.platform(slot2) ~= Idstring(SystemInfo)
	slot3 = self

	RaidMainMenuGui.super._layout(slot2)

	slot3 = self

	self._layout_title_logo(slot2)

	slot3 = self

	self._layout_list_menu(slot2)

	slot3 = game_state_machine

	if game_state_machine.current_state_name(slot2) == "menu_main" then
		slot3 = self

		self._layout_steam_group_button(slot2)
	end

	slot3 = managers.platform

	if managers.platform.presence(slot2) == "Playing" then
		slot3 = self

		self._layout_kick_mute_widget(slot2)

		slot5 = {
			CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_DROP_IN
		}
		slot10 = "_layout_kick_mute_widget"

		managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "main_menu_drop_in", callback(slot7, self, self))

		slot5 = {
			CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_DROP_OUT
		}
		slot10 = "_layout_kick_mute_widget"

		managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "main_menu_drop_out", callback(slot7, self, self))
	end

	return 
end
function RaidMainMenuGui:close()
	slot4 = "main_menu_drop_in"

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	slot4 = "main_menu_drop_out"

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	slot4 = false

	self._list_menu.set_selected(slot2, self._list_menu)

	slot3 = self

	RaidMainMenuGui.super.close(slot2)

	return 
end
function RaidMainMenuGui:_layout_title_logo()
	slot4 = {
		text = "",
		h = 64,
		y = 0,
		x = 0,
		w = self._root_panel.w(slot6),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_56
	}
	slot7 = self._root_panel
	self._title_label = self._root_panel.text(slot2, self._root_panel)
	self._title_icon = self._root_panel.bitmap(slot2, self._root_panel)
	local logo_texture = tweak_data.gui.icons.raid_logo_small.texture
	local logo_texture_rect = tweak_data.gui.icons.raid_logo_small.texture_rect
	slot6 = DLCTweakData.DLC_NAME_SPECIAL_EDITION

	if managers.dlc.is_dlc_unlocked({
		h = 64,
		y = 0,
		w = 64,
		x = 0,
		texture = tweak_data.gui.icons.missions_camp.texture,
		texture_rect = tweak_data.gui.icons.missions_camp.texture_rect
	}, managers.dlc) then
		logo_texture = tweak_data.gui.icons.raid_se_logo_small.texture
		logo_texture_rect = tweak_data.gui.icons.raid_se_logo_small.texture_rect
	end

	slot6 = {
		name = "raid_logo_small",
		y = 0,
		x = 0,
		texture = logo_texture,
		texture_rect = logo_texture_rect
	}
	self._raid_logo_small = self._root_panel.image(slot4, self._root_panel)
	slot5 = self._raid_logo_small
	slot8 = self._root_panel

	self._raid_logo_small.set_right(slot4, self._root_panel.w(slot7))

	slot5 = RaidMenuCallbackHandler

	if RaidMenuCallbackHandler.is_in_main_menu(slot4) then
		slot5 = self._title_icon

		self._title_icon.hide(slot4)

		slot6 = 0

		self._title_label.set_x(slot4, self._title_label)

		slot5 = self._title_label
		slot10 = true

		self._title_label.set_text(slot4, self.translate(slot7, self, "menu_main_title"))

		slot6 = tweak_data.gui.colors.raid_red

		self._title_label.set_color(slot4, self._title_label)

		slot5 = self._raid_logo_small

		self._raid_logo_small.show(slot4)
	else
		slot5 = RaidMenuCallbackHandler

		if RaidMenuCallbackHandler.is_in_camp(slot4) then
			slot6 = tweak_data.gui.icons.missions_camp.texture

			self._title_icon.set_image(slot4, self._title_icon)

			slot5 = self._title_icon
			slot8 = tweak_data.gui.icons.missions_camp.texture_rect

			self._title_icon.set_texture_rect(slot4, unpack(slot7))

			slot5 = self._title_icon

			self._title_icon.show(slot4)

			slot6 = 90

			self._title_label.set_x(slot4, self._title_label)

			slot5 = self._title_label
			slot10 = true

			self._title_label.set_text(slot4, self.translate(slot7, self, tweak_data.operations.missions.camp.name_id))

			slot6 = tweak_data.gui.colors.raid_red

			self._title_label.set_color(slot4, self._title_label)

			slot5 = self._raid_logo_small

			self._raid_logo_small.hide(slot4)
		else
			slot5 = RaidMenuCallbackHandler

			if not RaidMenuCallbackHandler.is_in_main_menu(slot4) then
				slot5 = RaidMenuCallbackHandler

				if not RaidMenuCallbackHandler.is_in_camp(slot4) then
					slot5 = managers.raid_job
					local current_job = managers.raid_job.current_job(slot4)

					if current_job and current_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
						slot7 = tweak_data.gui.icons[current_job.icon_menu].texture

						self._title_icon.set_image(slot5, self._title_icon)

						slot6 = self._title_icon
						slot9 = tweak_data.gui.icons[current_job.icon_menu].texture_rect

						self._title_icon.set_texture_rect(slot5, unpack(current_job.icon_menu))

						slot6 = self._title_icon

						self._title_icon.show(slot5)

						slot7 = 90

						self._title_label.set_x(slot5, self._title_label)

						slot6 = self._title_label
						slot11 = true

						self._title_label.set_text(slot5, self.translate(current_job.icon_menu, self, tweak_data.operations.missions[current_job.job_id].name_id))

						slot7 = tweak_data.gui.colors.raid_red

						self._title_label.set_color(slot5, self._title_label)
					elseif current_job and current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
						slot7 = tweak_data.gui.icons[current_job.icon_menu].texture

						self._title_icon.set_image(slot5, self._title_icon)

						slot6 = self._title_icon
						slot9 = tweak_data.gui.icons[current_job.icon_menu].texture_rect

						self._title_icon.set_texture_rect(slot5, unpack(current_job.icon_menu))

						slot6 = self._title_icon

						self._title_icon.show(slot5)

						slot8 = true
						local operation_name = self.translate(slot5, self, tweak_data.operations.missions[current_job.job_id].name_id)
						local operation_progress = current_job.current_event .. "/" .. #current_job.events_index
						slot10 = true
						local level_name = self.translate(#current_job.events_index, self, tweak_data.operations.missions[current_job.job_id].events[current_job.events_index[current_job.current_event]].name_id)
						slot10 = 90

						self._title_label.set_x(self, self._title_label)

						slot11 = true

						self._title_label.set_text(self, self._title_label, operation_name .. " " .. operation_progress .. ": " .. level_name)

						slot10 = tweak_data.gui.colors.raid_red

						self._title_label.set_color(self, self._title_label)
					end

					slot6 = self._raid_logo_small

					self._raid_logo_small.hide(slot5)
				end
			end
		end
	end

	return 
end
function RaidMainMenuGui:_layout_logo()
	return 
end
function RaidMainMenuGui:_layout_list_menu()
	local list_menu_params = {
		selection_enabled = true,
		name = "list_menu",
		h = 972,
		w = 480,
		loop_items = true,
		y = 112,
		x = 0
	}
	slot6 = "_on_list_menu_item_selected"
	list_menu_params.on_item_clicked_callback = callback(slot3, self, self)
	slot6 = "_list_menu_data_source"
	list_menu_params.data_source_callback = callback(slot3, self, self)
	list_menu_params.on_menu_move = {}
	slot5 = list_menu_params
	self._list_menu = self._root_panel.list(slot3, self._root_panel)
	slot5 = true

	self._list_menu.set_selected(slot3, self._list_menu)

	return 
end
function RaidMainMenuGui:_layout_steam_group_button()
	local steam_group_panel_params = {
		layer = 50,
		name = "steam_group_panel",
		h = 576,
		halign = "right",
		w = 1024,
		valign = "bottom"
	}
	slot5 = steam_group_panel_params
	self._steam_group_panel = self._root_panel.panel(slot3, self._root_panel)
	self._steam_button_t = 0
	self._steam_button_pressed_scale = 0.95
	local group_button_frame_params = {
		texture = "ui/elements/banner_steam_group_frame",
		name = "steam_group_button_frame",
		layer = 10,
		halign = "scale",
		valign = "scale"
	}
	slot6 = group_button_frame_params
	self._steam_group_button_frame = self._steam_group_panel.bitmap(self._root_panel, self._steam_group_panel)
	slot8 = self._steam_group_panel
	slot6 = self._steam_group_panel.w(slot7) / 2

	self._steam_group_button_frame.set_center_x(self._root_panel, self._steam_group_button_frame)

	local group_button_image_params = {
		texture = "ui/elements/banner_steam_group",
		name = "steam_group_button_image",
		layer = 5,
		halign = "scale",
		valign = "scale"
	}
	slot8 = "mouse_over_steam_group_button"
	group_button_image_params.on_mouse_enter_callback = callback(self._steam_group_button_frame, self, self)
	slot8 = "mouse_exit_steam_group_button"
	group_button_image_params.on_mouse_exit_callback = callback(self._steam_group_button_frame, self, self)
	slot8 = "mouse_pressed_steam_group_button"
	group_button_image_params.on_mouse_pressed_callback = callback(self._steam_group_button_frame, self, self)
	group_button_image_params.on_mouse_released_callback = callback(self._steam_group_button_frame, self, self)
	slot7 = group_button_image_params
	self._steam_group_button_image = self._steam_group_panel.image(self._steam_group_button_frame, self._steam_group_panel)
	slot9 = self._steam_group_panel
	slot7 = self._steam_group_panel.w("mouse_released_steam_group_button") / 2

	self._steam_group_button_image.set_center_x(self._steam_group_button_frame, self._steam_group_button_image)

	slot7 = RaidMainMenuGui.STEAM_GROUP_BUTTON_W

	self._steam_group_panel.set_w(self._steam_group_button_frame, self._steam_group_panel)

	slot7 = RaidMainMenuGui.STEAM_GROUP_BUTTON_H

	self._steam_group_panel.set_h(self._steam_group_button_frame, self._steam_group_panel)

	slot6 = self._steam_group_panel
	slot9 = self._root_panel

	self._steam_group_panel.set_right(self._steam_group_button_frame, self._root_panel.w("mouse_released_steam_group_button"))

	slot9 = self._root_panel
	slot7 = self._root_panel.h("mouse_released_steam_group_button") - 77

	self._steam_group_panel.set_bottom(self._steam_group_button_frame, self._steam_group_panel)

	return 
end
function RaidMainMenuGui:mouse_over_steam_group_button()
	slot3 = self._steam_group_button_frame
	slot6 = "ff8880"

	self._steam_group_button_frame.set_color(slot2, Color(slot5))

	return 
end
function RaidMainMenuGui:mouse_exit_steam_group_button()
	slot4 = Color.white

	self._steam_group_button_frame.set_color(slot2, self._steam_group_button_frame)

	slot3 = self._steam_group_button_frame

	self._steam_group_button_frame.stop(slot2)

	slot3 = self._steam_group_button_frame
	slot8 = "_animate_steam_group_button_release"

	self._steam_group_button_frame.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidMainMenuGui:mouse_pressed_steam_group_button()
	slot3 = self._steam_group_button_frame

	self._steam_group_button_frame.stop(slot2)

	slot3 = self._steam_group_button_frame
	slot8 = "_animate_steam_group_button_press"

	self._steam_group_button_frame.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidMainMenuGui:mouse_released_steam_group_button()
	slot3 = self._steam_group_button_frame

	self._steam_group_button_frame.stop(slot2)

	slot3 = self._steam_group_button_frame
	slot8 = "_animate_steam_group_button_release"

	self._steam_group_button_frame.animate(slot2, callback(slot5, self, self))

	slot5 = "http://steamcommunity.com/games/414740"

	Steam.overlay_activate(slot2, Steam, "url")

	return 
end
function RaidMainMenuGui:_animate_steam_group_button_press(o)
	local duration = 0.15
	local t = self._steam_button_t * duration
	local center_x = self._steam_group_panel.center_x(slot5)
	slot7 = self._steam_group_panel
	local center_y = self._steam_group_panel.center_y(self._steam_group_panel)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = duration
		local current_scale = Easing.quartic_out(slot8, t, 1, self._steam_button_pressed_scale - 1)
		slot11 = RaidMainMenuGui.STEAM_GROUP_BUTTON_W * current_scale

		self._steam_group_panel.set_w(t, self._steam_group_panel)

		slot11 = RaidMainMenuGui.STEAM_GROUP_BUTTON_H * current_scale

		self._steam_group_panel.set_h(t, self._steam_group_panel)

		slot11 = center_x

		self._steam_group_panel.set_center_x(t, self._steam_group_panel)

		slot11 = center_y

		self._steam_group_panel.set_center_y(t, self._steam_group_panel)

		self._steam_button_t = t / duration
	end

	slot9 = RaidMainMenuGui.STEAM_GROUP_BUTTON_W * self._steam_button_pressed_scale

	self._steam_group_panel.set_w(slot7, self._steam_group_panel)

	slot9 = RaidMainMenuGui.STEAM_GROUP_BUTTON_H * self._steam_button_pressed_scale

	self._steam_group_panel.set_h(slot7, self._steam_group_panel)

	slot9 = center_x

	self._steam_group_panel.set_center_x(slot7, self._steam_group_panel)

	slot9 = center_y

	self._steam_group_panel.set_center_y(slot7, self._steam_group_panel)

	self._steam_button_t = 1

	return 
end
function RaidMainMenuGui:_animate_steam_group_button_release(o)
	local duration = 0.15
	local t = (1 - self._steam_button_t) * duration
	local center_x = self._steam_group_panel.center_x(slot5)
	slot7 = self._steam_group_panel
	local center_y = self._steam_group_panel.center_y(self._steam_group_panel)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = duration
		local current_scale = Easing.quartic_out(slot8, t, self._steam_button_pressed_scale, 1 - self._steam_button_pressed_scale)
		slot11 = RaidMainMenuGui.STEAM_GROUP_BUTTON_W * current_scale

		self._steam_group_panel.set_w(t, self._steam_group_panel)

		slot11 = RaidMainMenuGui.STEAM_GROUP_BUTTON_H * current_scale

		self._steam_group_panel.set_h(t, self._steam_group_panel)

		slot11 = center_x

		self._steam_group_panel.set_center_x(t, self._steam_group_panel)

		slot11 = center_y

		self._steam_group_panel.set_center_y(t, self._steam_group_panel)

		self._steam_button_t = t / duration
	end

	slot9 = RaidMainMenuGui.STEAM_GROUP_BUTTON_W

	self._steam_group_panel.set_w(slot7, self._steam_group_panel)

	slot9 = RaidMainMenuGui.STEAM_GROUP_BUTTON_H

	self._steam_group_panel.set_h(slot7, self._steam_group_panel)

	slot8 = self._steam_group_panel
	slot11 = self._root_panel

	self._steam_group_panel.set_right(slot7, self._root_panel.w(slot10))

	slot11 = self._root_panel
	slot9 = self._root_panel.h(slot10) - 77

	self._steam_group_panel.set_bottom(slot7, self._steam_group_panel)

	self._steam_button_t = 0

	return 
end
function RaidMainMenuGui:_layout_kick_mute_widget()
	if self._widget_panel then
		slot3 = self._widget_panel

		self._widget_panel.clear(slot2)
	else
		local widget_panel_params = {
			halign = "right",
			name = "widget_panel",
			valign = "top",
			y = RaidMainMenuGui.WIDGET_PANEL_Y,
			w = RaidMainMenuGui.WIDGET_PANEL_W,
			h = RaidMainMenuGui.WIDGET_PANEL_H
		}
		slot5 = widget_panel_params
		self._widget_panel = self._root_panel.panel(slot3, self._root_panel)
		slot4 = self._widget_panel
		slot7 = self._root_panel

		self._widget_panel.set_right(slot3, self._root_panel.w(slot6))
	end

	slot3 = self._widget_label_panel

	if not alive(slot2) then
		local label_panel_params = {
			visible = false,
			name = "widget_label_panel",
			h = 64,
			halign = "scale"
		}
		slot4 = self._widget_panel
		slot5 = label_panel_params
		self._widget_label_panel = self._widget_panel.get_engine_panel(slot3).panel(slot3, self._widget_panel.get_engine_panel(slot3))
		slot4 = self._widget_label_panel
		slot7 = self._widget_panel

		self._widget_label_panel.set_right(slot3, self._widget_panel.w(slot6))
	end

	local widget_title_params = {
		name = "widget_title",
		h = 64,
		vertical = "center",
		align = "left",
		halign = "left",
		x = 32
	}
	slot4 = self._widget_panel
	widget_title_params.w = self._widget_panel.w(slot3) - 32
	slot6 = tweak_data.gui.font_sizes.menu_list
	widget_title_params.font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	widget_title_params.font_size = tweak_data.gui.font_sizes.menu_list
	widget_title_params.color = tweak_data.gui.colors.raid_dirty_white
	slot6 = true
	widget_title_params.text = self.translate(slot3, self, "menu_kick_mute_widget_title")
	local widget_title = self._widget_label_panel.text(slot3, self._widget_label_panel)
	local widget_action_title_params = {
		name = "widget_action_title",
		h = 64,
		vertical = "center",
		w = 150,
		align = "right",
		text = "",
		halign = "right",
		font = tweak_data.gui.get_font_path(widget_title_params, tweak_data.gui, tweak_data.gui.fonts.din_compressed),
		font_size = tweak_data.gui.font_sizes.extra_small,
		color = tweak_data.gui.colors.raid_grey_effects
	}
	slot7 = widget_action_title_params
	self._widget_action_title = self._widget_label_panel.text(widget_title_params, self._widget_label_panel)
	slot6 = self._widget_action_title
	slot9 = self._widget_label_panel

	self._widget_action_title.set_right(widget_title_params, self._widget_label_panel.w(tweak_data.gui.font_sizes.extra_small))

	slot6 = self._widget_action_title
	slot9 = widget_title

	self._widget_action_title.set_center_y(widget_title_params, widget_title.center_y(tweak_data.gui.font_sizes.extra_small))

	slot6 = managers.network
	slot6 = managers.network.session(widget_title_params)
	local peers = managers.network.session(widget_title_params).peers(widget_title_params)
	self._widgets = {}

	for i = 1, 3, 1 do
		local widget_params = {
			index = i
		}
		slot13 = i
		slot11 = tostring(slot12)
		widget_params.name = "kick_mute_widget_" .. slot11
		widget_params.y = i * 64
		widget_params.menu_move = {
			left = "list_menu"
		}
		slot14 = "on_widget_button_selected"
		widget_params.on_button_selected_callback = callback(slot11, self, self)
		slot14 = "on_widget_button_unselected"
		widget_params.on_button_unselected_callback = callback(slot11, self, self)
		slot14 = widget_params
		local widget = self._widget_panel.create_custom_control(slot11, self._widget_panel, RaidGUIControlKickMuteWidget)
		slot14 = widget

		table.insert(self._widget_panel, self._widgets)
	end

	slot8 = self._name

	managers.menu_component.gather_controls_for_component(slot6, managers.menu_component)

	local widget_index = 1
	local invite_widget_shown = false
	local largest_w = 0
	slot10 = peers

	for index, peer in pairs(slot9) do
		slot17 = true
		slot20 = Network

		self._widgets[widget_index].set_peer(slot14, self._widgets[widget_index], peer, Network.is_server(slot19))

		slot16 = true

		self._widgets[widget_index].set_visible(slot14, self._widgets[widget_index])

		slot16 = true

		self._widget_label_panel.set_visible(slot14, self._widget_label_panel)

		slot15 = self._widgets[widget_index]
		local w = self._widgets[widget_index].calculate_width(slot14)

		if largest_w < w then
			largest_w = w
		end

		widget_index = widget_index + 1
	end

	if widget_index < 4 and self._display_invite_widget then
		slot10 = self._widgets[widget_index]

		self._widgets[widget_index].set_invite_widget(slot9)

		slot11 = true

		self._widgets[widget_index].set_visible(slot9, self._widgets[widget_index])

		slot11 = true

		self._widget_label_panel.set_visible(slot9, self._widget_label_panel)

		invite_widget_shown = true
		slot10 = self._widgets[widget_index]
		local w = self._widgets[widget_index].calculate_width(slot9)

		if largest_w < w then
			largest_w = w
		end
	else
		widget_index = widget_index - 1
	end

	for i = 1, #self._widgets, 1 do
		slot14 = self._widgets[i]
		local w = self._widgets[i].calculate_width(slot13)

		if largest_w < w then
			largest_w = w
		end

		slot15 = self._widgets[i]

		if self._widgets[i].visible(slot14) then
			slot17 = invite_widget_shown

			self._widgets[i].set_move_controls(slot14, self._widgets[i], widget_index)
		end
	end

	slot10 = self._widget_label_panel

	if not self._widget_label_panel.visible(slot9) then
		slot11 = true

		self._list_menu.set_selected(slot9, self._list_menu)
	else
		slot11 = largest_w

		self._widget_panel.set_w(slot9, self._widget_panel)

		slot10 = self._widget_panel
		slot13 = self._root_panel

		self._widget_panel.set_right(slot9, self._root_panel.w(slot12))

		for i = 1, #self._widgets, 1 do
			slot15 = largest_w

			self._widgets[i].set_w(slot13, self._widgets[i])
		end
	end

	slot10 = self._widgets

	for id, widget_data in pairs(slot9) do
		slot16 = false

		widget_data.set_selected(slot14, widget_data)
	end

	slot11 = true

	self._list_menu.set_selected(slot9, self._list_menu)

	local menu_move = {}
	slot11 = self._widget_label_panel

	if self._widget_label_panel.visible(self._list_menu) then
		if 0 < widget_index then
			slot12 = "XB1"

			if SystemInfo.platform(slot10) == Idstring(SystemInfo) then
				menu_move.right = "gamercard_button_1"
			else
				menu_move.right = "mute_button_1"
			end
		elseif self._display_invite_widget then
			menu_move.right = "invite_button_1"
		end
	end

	slot12 = menu_move

	self._list_menu.set_menu_move_controls(slot10, self._list_menu)

	return 
end
function RaidMainMenuGui:on_widget_button_selected(button)
	local widget_action = nil

	if button == "kick" then
		widget_action = "menu_kick_widget_label"
	elseif button == "mute" then
		widget_action = "menu_mute_widget_label"
	elseif button == "unmute" then
		widget_action = "menu_unmute_widget_label"
	elseif button == "gamercard" then
		widget_action = "menu_gamercard_widget_label"
	elseif button == "invite" then
		widget_action = "menu_widget_label_action_invite_player"
	end

	slot5 = self._widget_action_title
	slot10 = true

	self._widget_action_title.set_text(slot4, self.translate(slot7, self, widget_action))

	return 
end
function RaidMainMenuGui:on_widget_button_unselected(button)
	slot5 = ""

	self._widget_action_title.set_text(slot3, self._widget_action_title)

	return 
end
function RaidMainMenuGui:_list_menu_data_source()
	local _list_items = {}
	slot5 = {
		callback = "raid_play_online",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_play"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "raid_play_offline",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_play_offline"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "raid_play_tutorial",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.SHOULD_SHOW_TUTORIAL
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_tutorial_hl"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "resume_game_raid",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_resume_game"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "singleplayer_restart_mission",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.SINGLEPLAYER_RESTART
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_restart_mission"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "singleplayer_restart_game_to_camp",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.SINGLEPLAYER_RESTART
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_restart_to_camp"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "restart_mission",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.RESTART_LEVEL_VISIBLE,
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_CAMP,
			RaidGUIItemAvailabilityFlag.IS_NOT_CONSUMABLE
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_restart_mission"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "restart_to_camp",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.RESTART_LEVEL_VISIBLE
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_restart_to_camp"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "restart_to_camp_client",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.RESTART_LEVEL_VISIBLE_CLIENT
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_restart_to_camp"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "restart_vote",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.RESTART_VOTE_VISIBLE,
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_CAMP
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_restart_vote"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "on_mission_selection_clicked",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_IN_CAMP
		},
		breadcrumb = {
			delay = 0.2,
			category = BreadcrumbManager.CATEGORY_MISSIONS
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_mission_selection"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "on_multiplayer_clicked",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_IN_CAMP,
			RaidGUIItemAvailabilityFlag.IS_MULTIPLAYER
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_servers"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "on_select_character_profile_clicked",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_IN_CAMP
		},
		breadcrumb = {
			delay = 0.2,
			category = BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION
		},
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_character_setup"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "on_weapon_select_clicked",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_IN_CAMP
		},
		breadcrumb = {
			delay = 0.2,
			category = BreadcrumbManager.CATEGORY_WEAPON,
			check_callback = callback(managers.localization.text, managers.weapon_skills, managers.weapon_skills)
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "has_new_weapon_upgrades"
	slot11 = "menu_header_weapons_screen_name"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "on_select_character_skills_clicked",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_IN_CAMP
		},
		breadcrumb = {
			delay = 0.2,
			category = BreadcrumbManager.CATEGORY_RANK_REWARD
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_skills"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "on_options_clicked",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_CAMP,
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_options"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "on_options_clicked",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_IN_CAMP
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_options"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "on_options_clicked",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_options"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "show_credits",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_credits"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "end_game",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_NOT_EDITOR,
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_end_game"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "quit_game",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_NOT_EDITOR,
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_MAIN_MENU,
			RaidGUIItemAvailabilityFlag.IS_IN_CAMP
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_quit"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "quit_game_pause_menu",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_NOT_EDITOR,
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_MAIN_MENU,
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_CAMP
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_quit"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "quit_game",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.IS_NOT_EDITOR,
			RaidGUIItemAvailabilityFlag.IS_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_quit"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "debug_main",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.DEBUG_MENU_ENABLED,
			RaidGUIItemAvailabilityFlag.IS_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_debug"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "debug_camp",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.DEBUG_MENU_ENABLED,
			RaidGUIItemAvailabilityFlag.IS_IN_CAMP,
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_debug"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "debug_ingame",
		availability_flags = {
			RaidGUIItemAvailabilityFlag.DEBUG_MENU_ENABLED,
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_CAMP,
			RaidGUIItemAvailabilityFlag.IS_NOT_IN_MAIN_MENU
		},
		text = utf8.to_upper(managers.localization.text(managers.weapon_skills, managers.localization))
	}
	slot11 = "menu_debug"

	table.insert(slot3, _list_items)

	return _list_items
end
function RaidMainMenuGui:_on_list_menu_item_selected(data)
	if not data.callback then
		return 
	end

	if not self._callback_handler then
		slot4 = RaidMenuCallbackHandler
		slot2 = RaidMenuCallbackHandler.new(slot3)
	end

	self._callback_handler = slot2
	slot6 = data.callback
	local on_click_callback = callback(slot3, self._callback_handler, self._callback_handler)

	if on_click_callback then
		on_click_callback()
	end

	return 
end

return 
