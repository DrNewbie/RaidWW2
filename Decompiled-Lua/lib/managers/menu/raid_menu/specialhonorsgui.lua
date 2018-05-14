if not SpecialHonorsGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

SpecialHonorsGui = slot0
SpecialHonorsGui.TOP_STATS_SMALL_Y = 448
SpecialHonorsGui.TOP_STATS_SMALL_W = 320
SpecialHonorsGui.TOP_STATS_SMALL_H = 224
SpecialHonorsGui.TOP_STATS_TITLE_CENTER_Y = 80
SpecialHonorsGui.TOP_STATS_TITLE_H = 96
SpecialHonorsGui.TOP_STATS_TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
SpecialHonorsGui.TOP_STATS_TITLE_COLOR = tweak_data.gui.colors.raid_red
SpecialHonorsGui.TOP_STATS_TITLE_TEXT = "top_stats_title_label"
SpecialHonorsGui.TOP_STATS_TITLE_TEXT_FAILURE = "top_stats_title_label_failure"
SpecialHonorsGui.FONT = tweak_data.gui.fonts.din_compressed
SpecialHonorsGui.GAMERCARD_BUTTONS = {
	{
		"menu_controller_face_left",
		"menu_legend_top_stats_label_1",
		"BTN_X"
	},
	{
		"menu_controller_face_top",
		"menu_legend_top_stats_label_2",
		"BTN_Y"
	},
	{
		"menu_controller_face_right",
		"menu_legend_top_stats_label_3",
		"BTN_B"
	}
}
function SpecialHonorsGui:init(ws, fullscreen_ws, node, component_name)
	slot7 = "[SpecialHonorsGui:init()]"

	print(slot6)

	self._closing = false
	slot7 = game_state_machine
	self.current_state = game_state_machine.current_state(slot6)
	slot7 = RaidMenuCallbackHandler
	self._callback_handler = RaidMenuCallbackHandler.new(slot6)
	slot11 = component_name

	SpecialHonorsGui.super.init(slot6, self, ws, fullscreen_ws, node)

	slot7 = managers.raid_menu
	slot12 = "on_escape"

	managers.raid_menu.register_on_escape_callback(slot6, callback(fullscreen_ws, self, self))

	return 
end
function SpecialHonorsGui:_set_initial_data()
	slot4 = "menu_header_experience_success"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header)

	slot4 = 0

	self._node.components.raid_menu_header._screen_name_label.set_alpha(slot2, self._node.components.raid_menu_header._screen_name_label)

	return 
end
function SpecialHonorsGui:_layout()
	slot3 = self

	SpecialHonorsGui.super._layout(slot2)

	slot3 = self

	self._layout_first_screen(slot2)

	slot3 = game_state_machine

	if game_state_machine.current_state(slot2).stats_ready then
		slot3 = self

		self.show_honors(slot2)
	end

	slot3 = self

	self.bind_controller_inputs(slot2)

	return 
end
function SpecialHonorsGui:_layout_first_screen()
	local top_stats_big_panel_params = {
		halign = "scale",
		name = "top_stats_big_panel",
		valign = "scale"
	}
	slot5 = top_stats_big_panel_params
	self._top_stats_big_panel = self._root_panel.panel(slot3, self._root_panel)
	slot4 = game_state_machine
	slot4 = game_state_machine.current_state(slot3)
	local title_text = (game_state_machine.current_state(slot3).is_success(slot3) and SpecialHonorsGui.TOP_STATS_TITLE_TEXT) or SpecialHonorsGui.TOP_STATS_TITLE_TEXT_FAILURE
	local top_stats_title_params = {
		vertical = "center",
		name = "top_stats_title",
		alpha = 0,
		align = "center",
		h = SpecialHonorsGui.TOP_STATS_TITLE_H,
		font = SpecialHonorsGui.FONT,
		font_size = SpecialHonorsGui.TOP_STATS_TITLE_FONT_SIZE,
		color = SpecialHonorsGui.TOP_STATS_TITLE_COLOR
	}
	slot8 = true
	top_stats_title_params.text = self.translate(slot5, self, title_text)
	slot7 = top_stats_title_params
	local top_stats_title = self._top_stats_big_panel.text(slot5, self._top_stats_big_panel)
	slot8 = SpecialHonorsGui.TOP_STATS_TITLE_CENTER_Y

	top_stats_title.set_center_y(self._top_stats_big_panel, top_stats_title)

	self._top_stats_big = {}

	for i = 1, 3, 1 do
		local top_stat_big_params = {}
		slot13 = i
		top_stat_big_params.name = "top_stat_big_" .. tostring(slot12)
		slot13 = self._root_panel
		top_stat_big_params.x = (i - 1) * self._root_panel.w(slot12) / 3
		slot14 = top_stat_big_params
		local top_stat_big = self._top_stats_big_panel.create_custom_control(self._root_panel.w(slot12) / 3, self._top_stats_big_panel, RaidGUIControlTopStatBig)
		slot14 = top_stat_big

		table.insert(self._top_stats_big_panel, self._top_stats_big)
	end

	return 
end
function SpecialHonorsGui:_continue_button_on_click()
	slot3 = managers.raid_menu

	managers.raid_menu.close_menu(slot2)

	return 
end
function SpecialHonorsGui:close()
	if self._closing then
		return 
	end

	self._closing = true
	slot3 = game_state_machine

	if game_state_machine.current_state_name(slot2) == "event_complete_screen" then
		slot3 = game_state_machine
		slot3 = game_state_machine.current_state(slot2)

		game_state_machine.current_state(slot2).continue(slot2)
	end

	slot3 = self

	SpecialHonorsGui.super.close(slot2)

	return 
end
function SpecialHonorsGui:show_honors()
	slot4 = "top_stats_title"
	local top_stats_title = self._top_stats_big_panel.child(slot2, self._top_stats_big_panel)
	slot9 = "_fade_in_label"
	slot5 = callback(slot6, self, self)
	slot7 = 0.2

	top_stats_title.animate(self._top_stats_big_panel, top_stats_title, slot5, 0.2)

	slot4 = game_state_machine
	local honors = game_state_machine.current_state(self._top_stats_big_panel).special_honors
	local stats_used = "top_stats"
	slot6 = game_state_machine
	slot6 = game_state_machine.current_state(slot5)

	if not game_state_machine.current_state(slot5).is_success(slot5) then
		stats_used = "bottom_stats"
	end

	for i = 1, 3, 1 do
		local sound_effect = nil
		slot12 = managers.network
		slot12 = managers.network.session(slot11)
		slot12 = managers.network.session(slot11).local_peer(slot11)

		if honors[i].peer_id == managers.network.session(slot11).local_peer(slot11).id(slot11) then
			sound_effect = "mvp_1p"
		else
			sound_effect = "mvp_team"
		end

		local data = {
			player_nickname = honors[i].peer_name,
			stat = honors[i].id,
			text_id = tweak_data.statistics[stats_used][honors[i].id].text_id,
			icon = tweak_data.statistics[stats_used][honors[i].id].icon,
			icon_texture = tweak_data.statistics[stats_used][honors[i].id].texture,
			icon_texture_rect = tweak_data.statistics[stats_used][honors[i].id].texture_rect,
			sound_effect = sound_effect,
			score = honors[i].score,
			score_format = tweak_data.statistics[stats_used][honors[i].id].score_format
		}
		slot12 = game_state_machine
		slot12 = game_state_machine.current_state(honors[i].id)
		data.mission_successful = game_state_machine.current_state(honors[i].id).is_success(honors[i].id)
		slot13 = data

		self._top_stats_big[i].set_data(honors[i].id, self._top_stats_big[i])

		slot13 = 2 * (i - 1) + 0.55
		slot18 = "bind_controller_inputs"

		self._top_stats_big[i].animate_show(honors[i].id, self._top_stats_big[i], callback(slot15, self, self))
	end

	return 
end
function SpecialHonorsGui:show_gamercard(i)
	local peer_id = game_state_machine.current_state(slot3).special_honors[i].peer_id
	slot5 = managers.network
	slot6 = peer_id
	local peer = managers.network.session(game_state_machine).peer(game_state_machine, managers.network.session(game_state_machine))
	slot12 = peer
	slot7 = "[SpecialHonorsGui:show_gamercard] showing gamercard for peer " .. tostring(peer.name(slot11))

	Application.trace(managers.network.session(game_state_machine), Application)

	slot7 = "[SpecialHonorsGui:show_gamercard]"
	slot10 = peer

	Application.debug(managers.network.session(game_state_machine), Application, inspect(slot9))

	slot6 = self._callback_handler
	slot9 = peer

	self._callback_handler.view_gamer_card(managers.network.session(game_state_machine), peer.xuid(inspect))

	return 
end
function SpecialHonorsGui:_fade_in_label(text, duration, delay)
	local anim_duration = duration or 0.15
	slot7 = text
	local t = text.alpha(slot6) * anim_duration

	if delay then
		slot8 = delay

		wait(slot7)
	end

	while t < anim_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = anim_duration
		local current_alpha = Easing.quartic_out(slot8, t, 0, 1)
		slot11 = current_alpha

		text.set_alpha(t, text)
	end

	slot9 = 1

	text.set_alpha(slot7, text)

	return 
end
function SpecialHonorsGui:confirm_pressed()
	slot3 = self

	self._continue_button_on_click(slot2)

	return 
end
function SpecialHonorsGui:on_escape()
	return true
end
function SpecialHonorsGui:bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_face_bottom"
	slot7 = "_continue_button_on_click"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	local legend = {
		controller = {
			{
				text = "menu_legend_continue",
				padding = 24
			}
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_continue",
			callback = callback(self, self, self, "_continue_button_on_click")
		}
	}
	slot6 = "XB1"

	if SystemInfo.platform() == Idstring(SystemInfo) then
		local gamercard_prompts_shown = 0
		local stats_per_peer = {}

		for i = 1, #self._top_stats_big, 1 do
			slot11 = self._top_stats_big[i]

			if self._top_stats_big[i].shown(slot10) then
				local binding = {}
				slot12 = SpecialHonorsGui.GAMERCARD_BUTTONS[i][1]
				binding.key = Idstring(slot11)
				slot15 = i
				binding.callback = callback(slot11, self, self, "show_gamercard")
				slot13 = binding

				table.insert(slot11, bindings)

				slot12 = game_state_machine
				local peer_name = game_state_machine.current_state(slot11).special_honors[i].peer_name
				local found_peer = false

				for j = 1, #stats_per_peer, 1 do
					if stats_per_peer[j].name == peer_name then
						slot19 = SpecialHonorsGui.GAMERCARD_BUTTONS[i][3]

						table.insert(slot17, stats_per_peer[j].buttons)

						found_peer = true
					end
				end

				if not found_peer then
					gamercard_prompts_shown = gamercard_prompts_shown + 1
					slot15 = {
						name = peer_name,
						buttons = {
							SpecialHonorsGui.GAMERCARD_BUTTONS[i][3]
						}
					}

					table.insert(slot13, stats_per_peer)
				end
			end
		end

		slot7 = stats_per_peer

		for index, stat in pairs(slot6) do
			local translated_text = ""

			for i = 1, #stat.buttons, 1 do
				slot18 = managers.localization
				translated_text = translated_text .. managers.localization.get_default_macros(slot17)[stat.buttons[i]] .. " "
			end

			slot14 = stat.name
			translated_text = translated_text .. utf8.to_upper(slot13)
			slot14 = {
				translated_text = translated_text
			}

			table.insert(utf8.to_upper(slot13), legend.controller)
		end

		if 0 < gamercard_prompts_shown then
			slot9 = "menu_legend_gamercards_label"

			table.insert(slot6, legend.controller, #legend.controller - gamercard_prompts_shown + 1)
		end
	end

	slot7 = true

	self.set_controller_bindings(slot4, self, bindings)

	slot6 = legend

	self.set_legend(slot4, self)

	return 
end

return 
