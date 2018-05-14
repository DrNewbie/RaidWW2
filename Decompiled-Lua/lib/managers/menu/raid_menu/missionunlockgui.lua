-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not MissionUnlockGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

MissionUnlockGui = slot0
MissionUnlockGui.CONTENT_WIDTH = 1568
MissionUnlockGui.CONTENT_HEIGHT = 688
MissionUnlockGui.CONTENT_Y = 96
MissionUnlockGui.UNLOCK_BUTTON_CENTER_Y = 864
function MissionUnlockGui:init(ws, fullscreen_ws, node, component_name)
	self._selected_mission = nil
	slot11 = component_name

	MissionUnlockGui.super.init(slot6, self, ws, fullscreen_ws, node)

	self._controller_list = {}
	slot8 = managers.controller

	for index = 1, managers.controller.get_wrapper_count(self), 1 do
		slot14 = false
		local con = managers.controller.create_controller(slot10, managers.controller, "boot_" .. index, index)
		slot12 = con

		con.enable(managers.controller)

		self._controller_list[index] = con
	end

	slot8 = "mission_unlock_gui"
	slot13 = "on_controller_hotswap"

	managers.controller.add_hotswap_callback(slot6, managers.controller, callback(slot10, self, self))

	return 
end
function MissionUnlockGui:_set_initial_data()
	slot4 = "mission_unlock_screen_title"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header)

	return 
end
function MissionUnlockGui:close()
	slot4 = "mission_unlock_gui"

	managers.controller.remove_hotswap_callback(slot2, managers.controller)

	slot3 = Overlay
	slot4 = self._fullscreen_ws

	Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

	slot3 = Overlay
	slot4 = self._safe_rect_workspace

	Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

	slot3 = self

	MissionUnlockGui.super.close(slot2)

	return 
end
function MissionUnlockGui:_layout()
	slot3 = self

	MissionUnlockGui.super._layout(slot2)

	slot3 = self

	self._layout_contents_panel(slot2)

	slot3 = self

	self._layout_offered_missions(slot2)

	slot3 = self

	self._layout_unlock_button(slot2)

	slot3 = self

	self._create_video_panels(slot2)

	slot3 = self

	self._bind_controller_inputs(slot2)

	slot3 = managers.controller

	if managers.controller.is_using_controller(slot2) then
		slot4 = true

		self._offered_missions[1].set_selected(slot2, self._offered_missions[1])

		slot3 = self._offered_missions[1]
		self._selected_mission = self._offered_missions[1].mission(slot2)
		slot3 = self._unlock_button

		self._unlock_button.hide(slot2)
	end

	return 
end
function MissionUnlockGui:_layout_contents_panel()
	local contents_panel_params = {
		halign = "scale",
		name = "contents_panel",
		valign = "scale"
	}
	slot5 = contents_panel_params
	self._contents_panel = self._root_panel.panel(slot3, self._root_panel)

	return 
end
function MissionUnlockGui:_layout_offered_missions()
	local offered_missions_panel_params = {
		name = "offered_missions_panel",
		y = MissionUnlockGui.CONTENT_Y,
		w = MissionUnlockGui.CONTENT_WIDTH,
		h = MissionUnlockGui.CONTENT_HEIGHT
	}
	slot5 = offered_missions_panel_params
	self._offered_missions_panel = self._contents_panel.panel(slot3, self._contents_panel)
	slot7 = self._contents_panel
	slot5 = self._contents_panel.w(slot6) / 2

	self._offered_missions_panel.set_center_x(slot3, self._offered_missions_panel)

	slot4 = managers.progression
	local pending_missions = managers.progression.pending_missions_to_unlock(slot3)
	self._offered_missions = {}
	local w = 0

	for i = 1, #pending_missions, 1 do
		local left_move, right_move = nil

		if 0 < i - 1 then
			slot13 = i - 1
			left_move = "offered_mission_" .. tostring(slot12)
		end

		if i + 1 <= #pending_missions then
			slot13 = i + 1
			right_move = "offered_mission_" .. tostring(slot12)
		end

		local offered_mission_params = {}
		slot14 = i
		slot12 = tostring(slot13)
		offered_mission_params.name = "offered_mission_" .. slot12
		offered_mission_params.mission = pending_missions[i]
		slot15 = "on_mission_chosen"
		offered_mission_params.on_click_callback = callback(slot12, self, self)
		offered_mission_params.on_menu_move = {
			left = left_move,
			right = right_move
		}
		slot15 = offered_mission_params
		local mission = self._offered_missions_panel.create_custom_control(slot12, self._offered_missions_panel, RaidGUIControlMissionUnlock)
		slot15 = mission

		table.insert(self._offered_missions_panel, self._offered_missions)

		slot14 = mission
		w = w + mission.w(self._offered_missions_panel)
	end

	slot6 = self._offered_missions_panel
	local space_left = self._offered_missions_panel.w(slot5) - w
	local mission_padding = space_left / (#self._offered_missions - 1)
	local x = 0

	for i = 1, #self._offered_missions, 1 do
		slot14 = x

		self._offered_missions[i].set_x(slot12, self._offered_missions[i])

		slot13 = self._offered_missions[i]
		x = x + self._offered_missions[i].w(slot12) + mission_padding
	end

	return 
end
function MissionUnlockGui:_layout_unlock_button()
	local unlock_button_params = {
		name = "unlock_button",
		layer = 1
	}
	slot6 = true
	unlock_button_params.text = self.translate(slot3, self, "mission_unlock_button_text")
	slot6 = "show_unlock_confirmation_prompt"
	unlock_button_params.on_click_callback = callback(slot3, self, self)
	slot5 = unlock_button_params
	self._unlock_button = self._contents_panel.short_primary_button(slot3, self._contents_panel)
	slot5 = MissionUnlockGui.UNLOCK_BUTTON_CENTER_Y

	self._unlock_button.set_center_y(slot3, self._unlock_button)

	slot4 = self._unlock_button

	self._unlock_button.disable(slot3)

	return 
end
function MissionUnlockGui:_create_video_panels()
	slot3 = managers.gui_data
	self._fullscreen_ws = managers.gui_data.create_fullscreen_16_9_workspace(slot2)
	slot3 = self._fullscreen_ws
	self._full_panel = self._fullscreen_ws.panel(slot2)
	slot3 = Overlay
	slot3 = Overlay.gui(slot2)
	self._safe_rect_workspace = Overlay.gui(slot2).create_screen_workspace(slot2)
	slot4 = self._safe_rect_workspace

	managers.gui_data.layout_workspace(slot2, managers.gui_data)

	slot3 = self._safe_rect_workspace
	self._safe_panel = self._safe_rect_workspace.panel(slot2)

	return 
end
function MissionUnlockGui:_play_control_briefing_video(mission_id)
	local potential_videos = tweak_data.operations.missions[mission_id].control_brief_video
	local chosen_index = math.random(slot4, 1)
	local chosen_video = potential_videos[chosen_index]
	slot8 = chosen_video
	local chosen_video_unlock_id = tweak_data.intel.get_control_video_by_path(#potential_videos, tweak_data.intel)

	if chosen_video_unlock_id then
		slot10 = {
			chosen_video_unlock_id
		}

		managers.unlock.unlock(slot7, managers.unlock, {
			slot = UnlockManager.SLOT_PROFILE,
			identifier = UnlockManager.CATEGORY_CONTROL_ARCHIVE
		})
	end

	local video_panel_params = {
		is_root_panel = true,
		layer = 100
	}
	slot11 = video_panel_params
	self._video_panel = RaidGUIPanel.new(slot8, RaidGUIPanel, self._full_panel)
	local video_panel_background_params = {
		layer = 1,
		name = "video_background",
		halign = "scale",
		valign = "scale",
		color = Color.black
	}
	local video_panel_background = self._video_panel.rect(RaidGUIPanel, self._video_panel)
	local video_params = {
		layer = 2
	}
	slot12 = self._video_panel
	video_params.layer = self._video_panel.layer(video_panel_background_params) + 1
	video_params.video = chosen_video
	slot12 = self._video_panel
	video_params.width = self._video_panel.w(video_panel_background_params)
	slot13 = video_params
	self._control_briefing_video = self._video_panel.video(video_panel_background_params, self._video_panel)
	slot17 = self._control_briefing_video
	slot13 = self._video_panel.w(slot14) * self._control_briefing_video.video_height(self._video_panel) / self._control_briefing_video.video_width(self._control_briefing_video)

	self._control_briefing_video.set_h(video_panel_background_params, self._control_briefing_video)

	slot15 = self._video_panel
	slot13 = self._video_panel.h(self._control_briefing_video.video_height(self._video_panel) / self._control_briefing_video.video_width(self._control_briefing_video)) / 2

	self._control_briefing_video.set_center_y(video_panel_background_params, self._control_briefing_video)

	self._playing_briefing_video = true
	slot13 = false

	self._contents_panel.set_visible(video_panel_background_params, self._contents_panel)

	slot12 = managers.controller
	local press_any_key_text = (managers.controller.is_using_controller(video_panel_background_params) and "press_any_key_to_skip_controller") or "press_any_key_to_skip"
	local press_any_key_params = {
		name = "press_any_key_prompt",
		alpha = 0
	}
	slot16 = tweak_data.gui.font_sizes.size_32
	press_any_key_params.font = tweak_data.gui.get_font_path(slot13, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	press_any_key_params.font_size = tweak_data.gui.font_sizes.size_32
	slot17 = press_any_key_text
	press_any_key_params.text = utf8.to_upper(managers.localization.text(tweak_data.gui.fonts.din_compressed, managers.localization))
	press_any_key_params.color = tweak_data.gui.colors.raid_dirty_white
	slot14 = self._control_briefing_video
	press_any_key_params.layer = self._control_briefing_video.layer(slot13) + 100
	slot15 = press_any_key_params
	local press_any_key_prompt = self._safe_panel.text(slot13, self._safe_panel)
	slot15 = press_any_key_prompt
	local _, _, w, h = press_any_key_prompt.text_rect(self._safe_panel)
	slot20 = w

	press_any_key_prompt.set_w(slot18, press_any_key_prompt)

	slot20 = h

	press_any_key_prompt.set_h(slot18, press_any_key_prompt)

	slot22 = self._safe_panel
	slot20 = self._safe_panel.w(slot21) - 50

	press_any_key_prompt.set_right(slot18, press_any_key_prompt)

	slot22 = self._safe_panel
	slot20 = self._safe_panel.h(slot21) - 50

	press_any_key_prompt.set_bottom(slot18, press_any_key_prompt)

	slot19 = press_any_key_prompt
	slot24 = "_animate_show_press_any_key_prompt"

	press_any_key_prompt.animate(slot18, callback(slot21, self, self))

	slot20 = "menu_volume_set"

	managers.menu_component.post_event(slot18, managers.menu_component)

	slot19 = managers.music

	managers.music.stop(slot18)

	slot19 = managers.raid_menu
	slot24 = "complete_video"

	managers.raid_menu.register_on_escape_callback(slot18, callback(slot21, self, self))

	return 
end
function MissionUnlockGui:_animate_show_press_any_key_prompt(prompt)
	local duration = 0.7
	local t = 0
	slot6 = 3

	wait(slot5)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0, 0.85)
		slot9 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot7 = 0.85

	prompt.set_alpha(slot5, prompt)

	return 
end
function MissionUnlockGui:_animate_change_press_any_key_prompt(prompt)
	local fade_out_duration = 0.25
	slot5 = prompt
	local t = (1 - prompt.alpha(slot4)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0.85, -0.85)
		slot9 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot7 = 0

	prompt.set_alpha(slot5, prompt)

	slot6 = managers.controller
	local press_any_key_text = (managers.controller.is_using_controller(slot5) and "press_any_key_to_skip_controller") or "press_any_key_to_skip"
	slot7 = prompt

	prompt.set_text(slot6, utf8.to_upper(managers.localization.text(slot11, managers.localization)))

	slot7 = prompt
	local _, _, w, h = prompt.text_rect(slot6)
	slot12 = w

	prompt.set_w(managers.localization.text, prompt)

	slot12 = h

	prompt.set_h(managers.localization.text, prompt)

	slot14 = self._safe_panel
	slot12 = self._safe_panel.w(press_any_key_text) - 50

	prompt.set_right(managers.localization.text, prompt)

	local fade_in_duration = 0.25
	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot16 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot12, t, 0, 0.85)
		slot15 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot13 = 0.85

	prompt.set_alpha(slot11, prompt)

	return 
end
function MissionUnlockGui:on_controller_hotswap()
	if self._playing_briefing_video then
		slot4 = "press_any_key_prompt"
		local press_any_key_prompt = self._safe_panel.child(slot2, self._safe_panel)

		if press_any_key_prompt then
			slot4 = press_any_key_prompt

			press_any_key_prompt.stop(slot3)

			slot4 = press_any_key_prompt
			slot9 = "_animate_change_press_any_key_prompt"

			press_any_key_prompt.animate(slot3, callback(slot6, self, self))
		end
	else
		slot3 = managers.controller

		if managers.controller.is_using_controller(slot2) then
			slot3 = self._unlock_button

			self._unlock_button.animate_hide(slot2)
		else
			slot3 = self._unlock_button

			self._unlock_button.animate_show(slot2)
		end
	end

	return 
end
function MissionUnlockGui:update(t, dt)
	if self._playing_briefing_video then
		slot5 = self
	end

	return 
end
function MissionUnlockGui:complete_video()
	slot3 = self._control_briefing_video

	self._control_briefing_video.destroy(slot2)

	slot3 = self._video_panel

	if self._video_panel.engine_panel_alive(slot2) then
		slot4 = self._control_briefing_video

		self._video_panel.remove(slot2, self._video_panel)

		slot3 = self._video_panel

		self._video_panel.remove_background(slot2)

		slot3 = self._video_panel
		slot7 = "video_background"

		self._video_panel.remove(slot2, self._video_panel.child(slot5, self._video_panel))

		slot3 = self._video_panel
		slot7 = "disclaimer"

		self._video_panel.remove(slot2, self._video_panel.child(slot5, self._video_panel))
	end

	self._control_briefing_video = nil
	self._video_panel = nil
	self._playing_briefing_video = false
	slot3 = self._safe_panel

	if alive(slot2) then
		slot4 = "press_any_key_prompt"
		slot3 = self._safe_panel.child(slot2, self._safe_panel)

		self._safe_panel.child(slot2, self._safe_panel).stop(slot2)

		slot3 = self._safe_panel
		slot7 = "press_any_key_prompt"

		self._safe_panel.remove(slot2, self._safe_panel.child(slot5, self._safe_panel))
	end

	slot3 = self

	self._finish_video(slot2)

	return true
end
function MissionUnlockGui:is_playing()
	slot3 = self._control_briefing_video

	if alive(slot2) then
		slot3 = self._control_briefing_video

		return self._control_briefing_video.loop_count(slot2) < 1
	else
		return false
	end

	return 
end
function MissionUnlockGui:is_skipped()
	slot3 = self._controller_list

	for _, controller in ipairs(slot2) do
		slot8 = controller

		if controller.get_any_input_pressed(slot7) then
			return true
		end
	end

	return false
end
function MissionUnlockGui:_finish_video()
	slot4 = "menu_volume_reset"

	managers.menu_component.post_event(slot2, managers.menu_component)

	slot3 = managers.music

	managers.music.stop(slot2)

	slot5 = true

	managers.music.post_event(slot2, managers.music, "music_camp")

	slot3 = self

	self._complete_mission_unlock_process(slot2)

	slot4 = nil

	managers.raid_menu.register_on_escape_callback(slot2, managers.raid_menu)

	return 
end
function MissionUnlockGui:on_mission_chosen(control, mission, active)
	if active then
		self._selected_mission = mission
		slot6 = self._unlock_button

		self._unlock_button.enable(slot5)

		slot7 = true

		control.set_active(slot5, control)

		if self._selected_control then
			slot7 = false

			self._selected_control.set_active(slot5, self._selected_control)
		end

		self._selected_control = control
	else
		self._selected_mission = nil
		slot6 = self._unlock_button

		self._unlock_button.disable(slot5)

		slot7 = false

		control.set_active(slot5, control)

		self._selected_control = nil
	end

	return 
end
function MissionUnlockGui:on_mission_double_click(mission)
	self._selected_mission = mission
	slot4 = self

	self.show_unlock_confirmation_prompt(slot3)

	return 
end
function MissionUnlockGui:show_unlock_confirmation_prompt()
	if not self._selected_mission then
		return 
	end

	local confirmation_dialog_params = {}
	slot6 = "on_unlock_confirmed"
	confirmation_dialog_params.yes_func = callback(slot3, self, self)
	slot5 = tweak_data.operations.missions[self._selected_mission].name_id
	confirmation_dialog_params.mission_title = self.translate(slot3, self)
	slot5 = confirmation_dialog_params

	managers.menu.show_unlock_mission_confirm_dialog(slot3, managers.menu)

	return 
end
function MissionUnlockGui:on_unlock_confirmed()
	slot4 = self._selected_mission

	managers.progression.choose_offered_mission(slot2, managers.progression)

	slot4 = "new_raid_unlocked"

	managers.menu_component.post_event(slot2, managers.menu_component)

	if tweak_data.operations.missions[self._selected_mission] and tweak_data.operations.missions[self._selected_mission].control_brief_video then
		slot3 = managers.controller

		if managers.controller.is_using_controller(slot2) then
			slot9 = nil

			managers.queued_tasks.queue(slot2, managers.queued_tasks, "play_unlocked_raid_control_video", self._play_control_briefing_video, self, self._selected_mission, 0.1)
		else
			slot4 = self._selected_mission

			self._play_control_briefing_video(slot2, self)
		end
	else
		slot3 = self

		self._complete_mission_unlock_process(slot2)
	end

	return 
end
function MissionUnlockGui:_complete_mission_unlock_process()
	slot4 = "mission_unlock_menu"

	managers.raid_menu.remove_menu_name_from_stack(slot2, managers.raid_menu)

	slot5 = false

	managers.raid_menu.open_menu(slot2, managers.raid_menu, "mission_selection_menu")

	return 
end
function MissionUnlockGui:_bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_face_bottom"
	slot7 = "show_unlock_confirmation_prompt"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = managers.localization
	local translated_text = managers.localization.get_default_macros().BTN_A
	slot12 = true
	translated_text = translated_text .. " " .. utf8.to_upper(self.translate("_on_legend_pc_back", self, "mission_unlock_button_text"))
	slot7 = {
		translated_text = translated_text
	}

	table.insert(" ", legend.controller)

	slot7 = legend

	self.set_legend(" ", self)

	return 
end

return 
