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
HUDManager = HUDManager or class()
slot3 = "guis/tab_screen_saferect"
HUDManager.TAB_SCREEN_SAFERECT = Idstring(slot2)
slot3 = "guis/tab_screen_fullscreen"
HUDManager.TAB_SCREEN_FULLSCREEN = Idstring(slot2)
slot3 = "guis/weapon_select_screen_saferect_pd2"
HUDManager.WEAPON_SELECT_SCREEN_SAFERECT = Idstring(slot2)
slot3 = "guis/weapon_select_screen_fullscreen"
HUDManager.WEAPON_SELECT_SCREEN_FULLSCREEN = Idstring(slot2)
HUDManager.ASSAULT_DIALOGS = {
	"gen_ban_b01a",
	"gen_ban_b01b",
	"gen_ban_b02a",
	"gen_ban_b02b",
	"gen_ban_b02c",
	"gen_ban_b03x",
	"gen_ban_b04x",
	"gen_ban_b05x",
	"gen_ban_b10",
	"gen_ban_b11",
	"gen_ban_b12"
}
HUDManager.OVERHEAD_Y_OFFSET = 18
HUDManager.SUSPICION_INDICATOR_Y_OFFSET = 40
HUDManager.DEFAULT_ALPHA = 1
HUDManager.DIFFERENT_SUSPICION_INDICATORS_FOR_TEAMMATES = true
HUDManager.NAME_LABEL_HEIGHT_FROM_HEAD = 50
HUDManager.NAME_LABEL_Y_DIST_COEFF = 4
HUDManager.NAME_LABEL_DIST_TO_ALPHA_COEFF = 0.004
slot3 = "CoreEvent"

core.import(0.004, core)

function HUDManager:init()
	self._component_map = {}
	local safe_rect_pixels = managers.viewport.get_safe_rect_pixels(slot2)
	slot4 = managers.viewport
	local safe_rect = managers.viewport.get_safe_rect(managers.viewport)
	local res = RenderSettings.resolution
	self._workspace_size = {
		x = 0,
		y = 0,
		w = res.x,
		h = res.y
	}
	self._saferect_size = {
		x = safe_rect.x,
		y = safe_rect.y,
		w = safe_rect.width,
		h = safe_rect.height
	}
	slot6 = managers.gui_data
	self._mid_saferect = managers.gui_data.create_saferect_workspace(safe_rect.height)
	slot6 = self._mid_saferect
	slot9 = TimerManager

	self._mid_saferect.set_timer(safe_rect.height, TimerManager.game(slot8))

	slot6 = managers.gui_data
	self._fullscreen_workspace = managers.gui_data.create_fullscreen_16_9_workspace(safe_rect.height)
	slot6 = self._fullscreen_workspace
	slot9 = TimerManager

	self._fullscreen_workspace.set_timer(safe_rect.height, TimerManager.game(slot8))

	slot6 = managers.gui_data
	self._saferect = managers.gui_data.create_saferect_workspace(safe_rect.height)
	slot6 = self._saferect
	slot9 = TimerManager

	self._saferect.set_timer(safe_rect.height, TimerManager.game(slot8))

	slot7 = self._saferect

	managers.gui_data.layout_corner_saferect_1280_workspace(safe_rect.height, managers.gui_data)

	slot6 = Overlay
	slot12 = RenderSettings.resolution.y
	self._workspace = Overlay.gui(safe_rect.height).create_scaled_screen_workspace(safe_rect.height, Overlay.gui(safe_rect.height), self._workspace_size.w, self._workspace_size.h, self._workspace_size.x, self._workspace_size.y, RenderSettings.resolution.x)
	slot6 = self._workspace
	slot9 = TimerManager

	self._workspace.set_timer(safe_rect.height, TimerManager.game(self._workspace_size.h))

	slot7 = self._workspace

	managers.gui_data.layout_fullscreen_workspace(safe_rect.height, managers.gui_data)

	self._updators = {}
	slot6 = managers.viewport
	slot11 = "resolution_changed"

	managers.viewport.add_resolution_changed_func(safe_rect.height, callback(self._workspace_size.h, self, self))

	slot7 = "hud"
	self._sound_source = SoundDevice.create_source(safe_rect.height, SoundDevice)
	slot12 = "controller_mod_changed"

	managers.user.add_setting_changed_callback(safe_rect.height, managers.user, "controller_mod", callback(self, self, self))

	slot7 = "hud_manager"
	slot12 = "controller_mod_changed"

	managers.controller.add_hotswap_callback(safe_rect.height, managers.controller, callback(true, self, self))

	slot6 = self

	self._init_player_hud_values(safe_rect.height)

	self._chatinput_changed_callback_handler = CoreEvent.CallbackEventHandler.new(safe_rect.height)
	HUDManager.HIDEABLE_HUDS = {}
	slot7 = PlayerBase.INGAME_HUD_SAFERECT
	HUDManager.HIDEABLE_HUDS[PlayerBase.INGAME_HUD_SAFERECT.key(CoreEvent.CallbackEventHandler)] = true
	slot7 = PlayerBase.INGAME_HUD_FULLSCREEN
	HUDManager.HIDEABLE_HUDS[PlayerBase.INGAME_HUD_FULLSCREEN.key(true)] = true
	slot7 = IngameWaitingForRespawnState.GUI_SPECTATOR
	HUDManager.HIDEABLE_HUDS[IngameWaitingForRespawnState.GUI_SPECTATOR.key(true)] = true

	if Global.debug_show_coords then
		slot6 = self

		self.debug_show_coordinates(slot5)
	else
		slot6 = self

		self.debug_hide_coordinates(slot5)
	end

	self._visible_huds_states = {}
	self._progress_target = {}
	slot8 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.PEER_LEVEL_UP
	}
	slot13 = "_peer_changed_level"

	managers.system_event_listener.add_listener(slot5, managers.system_event_listener, "peer_changed_level", callback(slot10, self, self))

	return 
end
function HUDManager:_peer_changed_level(params)
	local peer = params.peer
	slot5 = managers.criminals
	slot8 = peer
	local character_data = managers.criminals.character_data_by_peer_id(slot4, peer.id(slot7))

	if character_data and character_data.panel_id then
		slot6 = self._teammate_panels[character_data.panel_id]
		slot9 = peer

		self._teammate_panels[character_data.panel_id].set_level(character_data.panel_id, peer.level(slot8))
	end

	return 
end
function HUDManager:saferect_w()
	slot3 = self._saferect

	return self._saferect.width(slot2)
end
function HUDManager:saferect_h()
	slot3 = self._saferect

	return self._saferect.height(slot2)
end
function HUDManager:add_chatinput_changed_callback(callback_func)
	slot5 = callback_func

	self._chatinput_changed_callback_handler.add(slot3, self._chatinput_changed_callback_handler)

	return 
end
function HUDManager:remove_chatinput_changed_callback(callback_func)
	slot5 = callback_func

	self._chatinput_changed_callback_handler.remove(slot3, self._chatinput_changed_callback_handler)

	return 
end
slot3 = "PS3"
local is_PS3 = SystemInfo.platform(function (self, callback_func)
	slot5 = callback_func

	self._chatinput_changed_callback_handler.remove(slot3, self._chatinput_changed_callback_handler)

	return 
end) == Idstring(SystemInfo)
function HUDManager:init_finalize()
	slot4 = PlayerBase.PLAYER_CUSTODY_HUD

	if not self.exists(slot2, self) then
		slot8 = {}

		managers.hud.load_hud(slot2, managers.hud, PlayerBase.PLAYER_CUSTODY_HUD, false, false, true)
	end

	slot4 = PlayerBase.INGAME_HUD_SAFERECT

	if not self.exists(slot2, self) then
		slot8 = {}

		managers.hud.load_hud(slot2, managers.hud, PlayerBase.INGAME_HUD_FULLSCREEN, false, false, false)

		slot8 = {}

		managers.hud.load_hud(slot2, managers.hud, PlayerBase.INGAME_HUD_SAFERECT, false, false, true)
	end

	return 
end
function HUDManager:set_safe_rect(rect)
	self._saferect_size = rect
	slot9 = RenderSettings.resolution.x

	self._saferect.set_screen(slot3, self._saferect, rect.w, rect.h, rect.x, rect.y)

	return 
end
function HUDManager:load_hud(name, visible, using_collision, using_saferect, mutex_list, bounding_box_list, using_mid_saferect, using_16_9_fullscreen)
	slot12 = name

	if self._component_map[name.key(slot11)] then
		slot15 = name
		slot12 = "ERROR! Component " .. tostring(slot14) .. " have already been loaded!"

		Application.error(slot10, Application)

		return 
	end

	local bounding_box = {}
	local panel = nil

	if using_16_9_fullscreen then
		slot13 = self._fullscreen_workspace
		slot15 = {}
		panel = self._fullscreen_workspace.panel(slot12).gui(slot12, self._fullscreen_workspace.panel(slot12), name)
	elseif using_mid_saferect then
		slot13 = self._mid_saferect
		slot15 = {}
		panel = self._mid_saferect.panel(slot12).gui(slot12, self._mid_saferect.panel(slot12), name)
	elseif using_saferect then
		slot13 = self._saferect
		slot15 = {}
		panel = self._saferect.panel(slot12).gui(slot12, self._saferect.panel(slot12), name)
	else
		slot13 = self._workspace
		slot15 = {}
		panel = self._workspace.panel(slot12).gui(slot12, self._workspace.panel(slot12), name)
	end

	slot13 = panel

	panel.hide(slot12)

	local bb_list = bounding_box_list

	if not bb_list then
		slot14 = panel

		if panel.has_script(slot13) then
			slot16 = panel

			for k, v in pairs(panel.script(slot15)) do
				if k == "get_bounding_box_list" then
					slot19 = v

					if type(slot18) == "function" then
						bb_list = v()
					end

					break
				end
			end
		end
	end

	if bb_list then
		if bb_list.x then
			slot15 = {
				x1 = bb_list.x,
				y1 = bb_list.y,
				x2 = bb_list.x + bb_list.w,
				y2 = bb_list.y + bb_list.h
			}

			table.insert(slot13, bb_list)
		else
			slot14 = bb_list

			for _, rect in pairs(slot13) do
				slot20 = {
					x1 = rect.x,
					y1 = rect.y,
					x2 = rect.x + rect.w,
					y2 = rect.y + rect.h
				}

				table.insert(slot18, bounding_box)
			end
		end
	else
		slot15 = panel
		bounding_box = self._create_bounding_boxes(slot13, self)
	end

	slot15 = name
	self._component_map[name.key(slot14)] = {}
	slot15 = name
	self._component_map[name.key()].panel = panel
	slot15 = name
	self._component_map[name.key()].bb_list = bounding_box
	slot15 = name
	self._component_map[name.key()].mutex_list = {}
	slot15 = name
	self._component_map[name.key()].overlay_list = {}
	slot15 = name
	self._component_map[name.key()].idstring = name
	slot15 = name
	self._component_map[name.key()].load_visible = visible
	slot15 = name
	self._component_map[name.key()].load_using_collision = using_collision
	slot15 = name
	self._component_map[name.key()].load_using_saferect = using_saferect

	if mutex_list then
		slot15 = name
		self._component_map[name.key(slot14)].mutex_list = mutex_list
	end

	if using_collision then
		slot15 = name
		slot16 = name
		self._component_map[name.key(slot14)].overlay_list = self._create_overlay_list(slot14, self)
	end

	if visible then
		slot14 = panel

		panel.show(slot13)
	end

	slot15 = name

	self.setup(slot13, self)

	slot15 = name

	self.layout(slot13, self)

	return 
end
function HUDManager:setup(name)
	slot5 = name
	local panel = self.script(slot3, self).panel
	slot5 = panel

	if not panel.has_script(self) then
		return 
	end

	slot7 = panel

	for k, v in pairs(panel.script(slot6)) do
		if k == "setup" then
			slot10 = panel
			slot10 = self

			panel.script(slot9).setup(slot9)

			break
		end
	end

	return 
end
function HUDManager:layout(name)
	slot5 = name
	local panel = self.script(slot3, self).panel
	slot5 = panel

	if not panel.has_script(self) then
		return 
	end

	slot7 = panel

	for k, v in pairs(panel.script(slot6)) do
		if k == "layout" then
			slot10 = panel
			slot10 = self

			panel.script(slot9).layout(slot9)

			break
		end
	end

	return 
end
function HUDManager:delete(name)
	slot5 = name
	self._component_map[name.key(slot4)] = nil

	return 
end
function HUDManager:set_disabled()
	self._disabled = true
	slot3 = HUDManager.HIDEABLE_HUDS

	for name, _ in pairs(slot2) do
		if self._visible_huds_states[name] then
			local component = self._component_map[name]

			if component then
				slot9 = component.panel

				if alive(slot8) then
					slot9 = component.panel

					component.panel.hide(slot8)
				end
			end
		end
	end

	return 
end
function HUDManager:set_enabled()
	self._disabled = false
	slot3 = HUDManager.HIDEABLE_HUDS

	for name, _ in pairs(slot2) do
		if self._visible_huds_states[name] then
			local component = self._component_map[name]

			if component then
				slot9 = component.panel

				if alive(slot8) then
					slot9 = component.panel

					component.panel.show(slot8)
				end
			end
		end
	end

	return 
end
function HUDManager:set_freeflight_disabled()
	slot3 = self._saferect

	self._saferect.hide(slot2)

	slot3 = self._workspace

	self._workspace.hide(slot2)

	slot3 = self._mid_saferect

	self._mid_saferect.hide(slot2)

	slot3 = self._fullscreen_workspace

	self._fullscreen_workspace.hide(slot2)

	return 
end
function HUDManager:set_freeflight_enabled()
	slot3 = self._saferect

	self._saferect.show(slot2)

	slot3 = self._workspace

	self._workspace.show(slot2)

	slot3 = self._mid_saferect

	self._mid_saferect.show(slot2)

	slot3 = self._fullscreen_workspace

	self._fullscreen_workspace.show(slot2)

	return 
end
function HUDManager:on_loading_screen_faded_to_black()
	slot4 = true

	self.hide_comm_wheel(slot2, self)

	slot3 = self

	self.hide_stats_screen(slot2)

	slot3 = self

	self.reset_player_panel_states(slot2)

	slot3 = self._hud_chat

	self._hud_chat.clear(slot2)

	slot3 = self._hud_chat

	self._hud_chat.hide(slot2)

	slot3 = self

	self.clear_vehicle_name_labels(slot2)

	return 
end
function HUDManager:disabled()
	return self._disabled
end
function HUDManager:reload_player_hud()
	slot3 = self

	self.reload(slot2)

	return 
end
function HUDManager:reload_all()
	slot3 = self

	self.reload(slot2)

	slot5 = self._component_map

	for name, gui in pairs(clone(slot4)) do
		slot9 = gui.idstring
		local visible = self.visible(slot7, self)
		slot10 = gui.idstring

		self.hide(self, self)

		slot10 = gui.idstring

		self.delete(self, self)

		slot14 = {}

		self.load_hud(self, self, gui.idstring, gui.load_visible, gui.load_using_collision, gui.load_using_saferect)

		if visible then
			slot10 = gui.idstring

			self.show(slot8, self)
		end
	end

	return 
end
function HUDManager:reload()
	slot6 = managers.database
	slot4 = managers.database.root_path(slot5) .. "assets\\guis\\"

	self._recompile(slot2, self)

	return 
end
function HUDManager:_recompile(dir)
	local source_files = self._source_files(slot3, self)
	local t = {
		target_db_name = "all",
		send_idstrings = false,
		verbose = false
	}
	slot8 = SystemInfo
	slot8 = SystemInfo.platform(slot7)
	t.platform = string.lower(SystemInfo.platform(slot7).s(slot7))
	slot6 = managers.database
	t.source_root = managers.database.root_path(dir) .. "/assets"
	slot6 = Application
	t.target_db_root = Application.base_path("/assets") .. "assets"
	t.source_files = source_files
	slot7 = t

	Application.data_compile("assets", Application)

	slot6 = DB

	DB.reload("assets")

	slot6 = managers.database

	managers.database.clear_all_cached_indices("assets")

	slot6 = source_files

	for _, file in ipairs("assets") do
		slot15 = file
		slot12 = managers.database.entry_type(slot13, managers.database).id(slot13)
		slot16 = file
		slot15 = managers.database.entry_path(managers.database.entry_type(slot13, managers.database), managers.database)

		PackageManager.reload(slot10, PackageManager, managers.database.entry_path(managers.database.entry_type(slot13, managers.database), managers.database).id(managers.database.entry_type(slot13, managers.database)))
	end

	return 
end
function HUDManager:_source_files(dir)
	local files = {}
	slot6 = dir
	local entry_path = managers.database.entry_path(slot4, managers.database) .. "/"
	slot9 = dir

	for _, file in ipairs(SystemFS.list(slot7, SystemFS)) do
		slot12 = entry_path .. file

		table.insert(slot10, files)
	end

	slot10 = true

	for _, sub_dir in ipairs(SystemFS.list(slot7, SystemFS, dir)) do
		slot14 = dir .. "/" .. sub_dir

		for _, file in ipairs(SystemFS.list(slot12, SystemFS)) do
			slot17 = entry_path .. sub_dir .. "/" .. file

			table.insert(slot15, files)
		end
	end

	return files
end
function HUDManager:panel(name)
	slot5 = name

	if not self._component_map[name.key(slot4)] then
		slot8 = name
		slot5 = "ERROR! Component " .. tostring(slot7) .. " isn't loaded!"

		Application.error(slot3, Application)
	else
		slot5 = name

		return self._component_map[name.key(slot4)].panel
	end

	return 
end
function HUDManager:alive(name)
	slot5 = name
	local component = self._component_map[name.key(slot4)]

	if component then
		slot5 = component.panel
		slot3 = alive(slot4)
	end

	return slot3
end
function HUDManager:script(name)
	slot5 = name
	local component = self._component_map[name.key(slot4)]

	if component then
		slot5 = component.panel

		if alive(slot4) then
			slot6 = name
			slot5 = self._component_map[name.key(slot5)].panel

			return self._component_map[name.key(slot5)].panel.script(name.key(slot5))
		end
	end

	return 
end
function HUDManager:exists(name)
	slot5 = name

	return not not self._component_map[name.key(slot4)]
end
function HUDManager:show(name)
	slot5 = name

	if HUDManager.disabled[name.key(slot4)] then
		return 
	end

	slot5 = name
	self._visible_huds_states[name.key(slot4)] = true

	if self._disabled then
		slot5 = name

		if HUDManager.HIDEABLE_HUDS[name.key(slot4)] then
			return 
		end
	end

	slot5 = name

	if self._component_map[name.key(slot4)] then
		slot5 = name
		local panel = self.script(slot3, self).panel
		slot5 = panel

		if panel.has_script(self) then
			slot7 = panel

			for k, v in pairs(panel.script(slot6)) do
				if k == "show" then
					slot10 = panel
					slot10 = self

					panel.script(slot9).show(slot9)

					break
				end
			end
		end

		slot8 = name
		slot5 = self._component_map[name.key(slot7)].mutex_list

		for _, mutex_name in pairs(slot4) do
			slot11 = mutex_name
			slot10 = self._component_map[mutex_name.key(slot10)].panel

			if self._component_map[mutex_name.key(slot10)].panel.visible(mutex_name.key(slot10)) then
				slot11 = mutex_name
				slot10 = self._component_map[mutex_name.key(slot10)].panel

				self._component_map[mutex_name.key(slot10)].panel.hide(mutex_name.key(slot10))
			end
		end

		slot6 = name

		if self._validate_components(slot4, self) then
			slot6 = name
			slot5 = self._component_map[name.key(slot5)].panel

			self._component_map[name.key(slot5)].panel.show(name.key(slot5))
		end
	else
		slot8 = name
		slot5 = "ERROR! Component " .. tostring(slot7) .. " isn't loaded!"

		Application.error(slot3, Application)
	end

	slot4 = self._hud_chat

	self._hud_chat.clear(slot3)

	slot4 = self._hud_chat

	self._hud_chat.unregister(slot3)

	if name == PlayerBase.INGAME_HUD_SAFERECT then
		self._hud_chat = self._hud_chat_ingame
	elseif name == IngameWaitingForRespawnState.GUI_SPECTATOR then
		self._hud_chat = self._hud_chat_respawn
	end

	slot4 = self._hud_chat

	self._hud_chat.register(slot3)

	slot4 = self._hud_chat

	self._hud_chat.hide(slot3)

	return 
end
function HUDManager:hide(name)
	slot5 = name
	self._visible_huds_states[name.key(slot4)] = nil
	slot5 = name
	local panel = self.script(name.key(slot4), self).panel
	slot5 = panel

	if panel.has_script(self) then
		slot7 = panel

		for k, v in pairs(panel.script(slot6)) do
			if k == "hide" then
				slot10 = panel
				slot10 = self

				panel.script(slot9).hide(slot9)

				break
			end
		end
	end

	slot6 = name
	local component = self._component_map[name.key(slot5)]

	if component then
		slot6 = component.panel
	elseif not component then
		slot10 = name
		slot7 = "ERROR! Component " .. tostring(slot9) .. " isn't loaded!"

		Application.error(slot5, Application)
	end

	return 
end
function HUDManager:visible(name)
	slot5 = name

	if self._component_map[name.key(slot4)] then
		slot5 = name
		slot4 = self._component_map[name.key(slot4)].panel

		return self._component_map[name.key(slot4)].panel.visible(name.key(slot4))
	else
		slot8 = name
		slot5 = "ERROR! Component " .. tostring(slot7) .. " isn't loaded!"

		Application.error(slot3, Application)
	end

	return 
end
function HUDManager:_collision(rect1_map, rect2_map)
	if rect2_map.x2 <= rect1_map.x1 then
		return false
	end

	if rect1_map.x2 <= rect2_map.x1 then
		return false
	end

	if rect2_map.y2 <= rect1_map.y1 then
		return false
	end

	if rect1_map.y2 <= rect2_map.y1 then
		return false
	end

	return true
end
function HUDManager:_inside(rect1_map, rect2_map)
	if rect1_map.x1 < rect2_map.x1 or rect2_map.x2 < rect1_map.x1 then
		return false
	end

	if rect1_map.y1 < rect2_map.y1 or rect2_map.y2 < rect1_map.y1 then
		return false
	end

	if rect1_map.x2 < rect2_map.x1 or rect2_map.x2 < rect1_map.x2 then
		return false
	end

	if rect1_map.y2 < rect2_map.x1 or rect2_map.y2 < rect1_map.y2 then
		return false
	end

	return true
end
function HUDManager:_collision_rects(rect1_list, rect2_list)
	slot5 = rect1_list

	for _, rc1_map in pairs(slot4) do
		slot10 = rect2_list

		for _, rc2_map in pairs(slot9) do
			slot17 = rc2_map

			if self._collision(slot14, self, rc1_map) then
				return true
			end
		end
	end

	return false
end
function HUDManager:_is_mutex(component_map, name)
	slot5 = component_map.mutex_list

	for _, mutex_name in pairs(slot4) do
		slot10 = mutex_name

		if mutex_name.key(slot9) == name then
			return true
		end
	end

	return false
end
function HUDManager:_create_bounding_boxes(panel)
	local bounding_box_list = {}
	slot5 = panel
	local childrens = panel.children(slot4)
	local rect_map = {}
	slot7 = childrens

	for _, object in pairs(slot6) do
		slot13 = object
		slot13 = object
		slot14 = object
		slot14 = object
		rect_map = {
			x1 = object.x(slot12),
			y1 = object.y(slot12),
			x2 = object.x(slot12) + object.w(object),
			y2 = object.y(object.w(object)) + object.h(object)
		}

		if #bounding_box_list == 0 then
			slot13 = rect_map

			table.insert(slot11, bounding_box_list)
		else
			slot12 = bounding_box_list

			for _, bb_rect_map in pairs(slot11) do
				slot19 = bb_rect_map

				if self._inside(slot16, self, rect_map) == false then
					slot18 = rect_map

					table.insert(slot16, bounding_box_list)

					break
				end
			end
		end
	end

	return bounding_box_list
end
function HUDManager:_create_overlay_list(name)
	local component = self._component_map[name.key(slot4)]
	local overlay_list = {}
	slot6 = self._component_map

	for cmp_name, cmp_map in pairs(name) do
		slot11 = name

		if name.key(slot10) ~= cmp_name then
			slot12 = cmp_map
			slot15 = name

			if not self._is_mutex(slot10, self, name.key(slot14)) then
				slot13 = cmp_map.bb_list

				if self._collision_rects(slot10, self, component.bb_list) then
					slot12 = cmp_map.idstring

					table.insert(slot10, overlay_list)

					slot13 = cmp_name

					if not self._is_mutex(slot10, self, component) then
						slot12 = name

						table.insert(slot10, self._component_map[cmp_name].overlay_list)
					end

					slot11 = Application

					if Application.production_build(slot10) then
						slot15 = name
						slot17 = cmp_map.idstring
						slot12 = "WARNING! Component " .. tostring(slot14) .. " collides with " .. tostring(slot16)

						Application.error(slot10, Application)
					end
				end
			end
		end
	end

	return overlay_list
end
function HUDManager:_validate_components(name)
	slot7 = name
	slot4 = self._component_map[name.key(slot6)].overlay_list

	for _, overlay_name in pairs(slot3) do
		slot10 = overlay_name

		if self._component_map[overlay_name.key(slot9)] then
			slot10 = overlay_name
			slot9 = self._component_map[overlay_name.key(slot9)].panel

			if self._component_map[overlay_name.key(slot9)].panel.visible(overlay_name.key(slot9)) then
				slot13 = name
				slot15 = overlay_name
				slot10 = "WARNING! Component " .. tostring(slot12) .. " collides with " .. tostring(slot14)

				Application.error(slot8, Application)

				return false
			end
		end
	end

	return true
end
function HUDManager:resolution_changed()
	local res = RenderSettings.resolution
	local safe_rect_pixels = managers.viewport.get_safe_rect_pixels(slot3)
	local safe_rect = managers.viewport.get_safe_rect(managers.viewport)
	slot7 = self._saferect

	managers.gui_data.layout_corner_saferect_1280_workspace(managers.viewport, managers.gui_data)

	slot7 = self._workspace

	managers.gui_data.layout_fullscreen_workspace(managers.viewport, managers.gui_data)

	slot7 = self._mid_saferect

	managers.gui_data.layout_workspace(managers.viewport, managers.gui_data)

	slot7 = self._fullscreen_workspace

	managers.gui_data.layout_fullscreen_workspace(managers.viewport, managers.gui_data)

	slot6 = self._component_map

	for name, gui in pairs(managers.viewport) do
		slot12 = gui.idstring

		self.layout(slot10, self)
	end

	return 
end
function HUDManager:update(t, dt)
	slot5 = self._updators

	for _, cb in pairs(slot4) do
		slot11 = dt

		cb(slot9, t)
	end

	slot7 = dt

	self._update_name_labels(slot4, self, t)

	slot7 = dt

	self._update_vehicle_name_labels(slot4, self, t)

	slot7 = dt

	self._update_waypoints(slot4, self, t)

	slot7 = dt

	self._update_suspicion_indicators(slot4, self, t)

	if self._debug then
		slot5 = managers.viewport
		local cam_pos = managers.viewport.get_current_camera_position(slot4)

		if cam_pos then
			slot6 = self._debug.coord
			slot12 = cam_pos.z

			self._debug.coord.set_text(slot5, string.format(slot8, "Cam pos:   \"%.0f %.0f %.0f\" [cm]", cam_pos.x, cam_pos.y))
		end
	end

	return 
end
function HUDManager:change_map_floor(new_floor)
	self.current_floor = new_floor

	if self._tab_screen then
		slot5 = new_floor

		self._tab_screen.change_floor(slot3, self._tab_screen)
	end

	return 
end
function HUDManager:add_updator(id, cb)
	self._updators[id] = cb

	return 
end
function HUDManager:remove_updator(id)
	self._updators[id] = nil

	return 
end
local nl_w_pos = Vector3()
local nl_pos = Vector3()
local nl_dir = Vector3()
local nl_dir_normalized = Vector3()
local nl_cam_forward = Vector3()
function HUDManager:_calculate_name_label_screen_position(name_label, cam)
	slot5 = name_label

	if name_label.movement(slot4) == nil then
		return 
	end

	slot5 = name_label
	slot5 = name_label.movement(slot4)
	slot8 = "Head"
	local head_obj = name_label.movement(slot4).get_object(slot4, Idstring(slot7))

	if head_obj == nil then
		slot7 = "[HUDManager:_calculate_name_label_screen_position] Tried to calculate name label position on dead unit!"

		Application.warn(slot5, Application)

		return 
	end

	local pos = head_obj.position(slot5)
	slot8 = pos

	mvector3.set(head_obj, nl_w_pos)

	slot7 = nl_w_pos
	slot14 = HUDManager.NAME_LABEL_HEIGHT_FROM_HEAD
	slot10 = pos + Vector3(slot11, 0, 0)

	mvector3.set_z(head_obj, mvector3.z(slot9))

	slot7 = nl_pos
	slot12 = nl_w_pos

	mvector3.set(head_obj, self._workspace.world_to_screen(slot9, self._workspace, cam))

	return 
end
function HUDManager:_handle_name_label_overlapping(name_label1, name_label2, cam_pos)

	-- Decompilation error in this vicinity:
	if not name_label1 or not name_label2 then
		return 
	end

	slot7 = name_label2

	if not name_label1.is_overlapping(slot5, name_label1) then
		return 
	end

	slot6 = name_label1
	slot6 = name_label1.panel(slot5)
	slot6 = name_label1
	slot6 = name_label1
	local head_obj1 = name_label1.movement(slot5).get_object(slot5, Idstring(slot8))
	slot7 = name_label2
	slot7 = name_label2.movement(name_label1.movement(slot5))
	slot10 = "Head"
	local head_obj2 = name_label2.movement(name_label1.movement(slot5)).get_object(name_label1.movement(slot5), Idstring("Head"))

	if head_obj1 == nil or head_obj2 == nil then
		slot9 = "[HUDManager:_handle_name_label_overlapping] Tried to calculate name label overlap on dead unit!"

		Application.warn(slot7, Application)

		return 
	end

	local head_pos1 = head_obj1.position(slot7)
	local head_pos2 = head_obj2.position(head_obj1)
	local label1_unit_dist = head_pos1 - cam_pos.length(head_obj2)
	slot11 = head_pos2 - cam_pos
	local label2_unit_dist = head_pos2 - cam_pos.length(head_pos1 - cam_pos)
	local further_label = name_label1

	if label1_unit_dist < label2_unit_dist then
		further_label = name_label2
	end

	slot16 = name_label1
	slot17 = name_label2
	slot17 = name_label2.panel(name_label1.panel(slot15))
	slot15 = name_label2.panel(name_label1.panel(slot15)).center_y(name_label1.panel(slot15))
	slot14 = name_label1.panel(slot15).center_y(slot15) - slot15
	local label_dist = HUDManager.NAME_LABEL_Y_DIST_COEFF * math.abs(slot13)
	slot16 = name_label1
	slot17 = name_label2
	slot17 = name_label2.panel(name_label1.panel(slot15))
	slot14 = name_label1.panel(slot15).center_x(slot15) - name_label2.panel(name_label1.panel(slot15)).center_x(name_label1.panel(slot15))
	label_dist = label_dist + math.abs(slot13)
	slot18 = 1
	slot17 = further_label
	slot17 = further_label.panel(label_dist * HUDManager.NAME_LABEL_DIST_TO_ALPHA_COEFF)
	local alpha = math.min(slot13, further_label.panel(label_dist * HUDManager.NAME_LABEL_DIST_TO_ALPHA_COEFF).alpha(label_dist * HUDManager.NAME_LABEL_DIST_TO_ALPHA_COEFF))
	slot15 = further_label
	slot16 = alpha

	further_label.panel(math.clamp(name_label2.panel(name_label1.panel(slot15)).center_x(name_label1.panel(slot15)), label_dist * HUDManager.NAME_LABEL_DIST_TO_ALPHA_COEFF, 0)).set_alpha(math.clamp(name_label2.panel(name_label1.panel(slot15)).center_x(name_label1.panel(slot15)), label_dist * HUDManager.NAME_LABEL_DIST_TO_ALPHA_COEFF, 0), further_label.panel(math.clamp(name_label2.panel(name_label1.panel(slot15)).center_x(name_label1.panel(slot15)), label_dist * HUDManager.NAME_LABEL_DIST_TO_ALPHA_COEFF, 0)))

	return 
end
function HUDManager:_update_name_labels(t, dt)
	slot5 = managers.viewport
	local cam = managers.viewport.get_current_camera(slot4)

	if not cam then
		return 
	end

	slot6 = managers.player
	local player = managers.player.local_player(slot5)
	local in_steelsight = false
	slot8 = player

	if alive(slot7) then

		-- Decompilation error in this vicinity:
		slot8 = player
		slot8 = player
		slot8 = player.movement(slot7)
		slot8 = player
		slot8 = player.movement(slot7)
		slot8 = player.movement(slot7).current_state(slot7)
		in_steelsight = player.movement(slot7).current_state(slot7).in_steelsight(slot7) or false
	end

	local cam_pos = managers.viewport.get_current_camera_position(slot7)
	local cam_rot = managers.viewport.get_current_camera_rotation(managers.viewport)
	slot11 = nl_cam_forward

	mrotation.y(managers.viewport, cam_rot)

	local panel = nil
	slot11 = self._hud.name_labels

	for index, name_label in ipairs(cam_rot) do

		-- Decompilation error in this vicinity:
		if not panel then
			slot16 = name_label
			slot16 = name_label.panel(slot15)
			local panel = name_label.panel(slot15).parent(slot15)
		end

		slot19 = cam

		self._calculate_name_label_screen_position(slot16, self, name_label)

		slot18 = nl_w_pos

		mvector3.set(slot16, nl_dir)

		slot18 = cam_pos

		mvector3.subtract(slot16, nl_dir)

		slot18 = nl_dir

		mvector3.set(slot16, nl_dir_normalized)

		slot17 = nl_dir_normalized

		mvector3.normalize(slot16)

		slot18 = nl_dir_normalized
		local dot = mvector3.dot(slot16, nl_cam_forward)
		slot18 = name_label

		if name_label.movement(slot17) then
			slot18 = name_label

			if name_label.movement(slot17).current_state_name then
				slot18 = name_label
				slot18 = name_label.movement(slot17)
			else
				slot18 = name_label

				if name_label.movement(slot17).vehicle_seat then
					slot18 = name_label

					if name_label.movement(slot17).vehicle_seat.occupant ~= nil then
						slot18 = name_label

						name_label.hide(slot17)
					end
				end
			end
		end

		slot18 = name_label
		slot18 = name_label.panel(slot17)

		if name_label.panel(slot17).visible(slot17) then
			slot18 = name_label
			slot20 = nl_pos.y

			name_label.panel(slot17).set_center(slot17, name_label.panel(slot17), nl_pos.x)
		end
	end

	for i = 1, #self._hud.name_labels, 1 do
		for j = i + 1, #self._hud.name_labels, 1 do
			slot22 = cam_pos

			self._handle_name_label_overlapping(slot18, self, self._hud.name_labels[i], self._hud.name_labels[j])
		end
	end

	return 
end
function HUDManager:_update_vehicle_name_labels(t, dt)
	slot5 = managers.viewport
	local cam = managers.viewport.get_current_camera(slot4)

	if not cam then
		return 
	end

	local cam_pos = managers.viewport.get_current_camera_position(slot5)
	local cam_rot = managers.viewport.get_current_camera_rotation(managers.viewport)
	slot9 = nl_cam_forward

	mrotation.y(managers.viewport, cam_rot)

	local panel = nil
	slot9 = self._hud.vehicle_name_labels

	for index, name_label in ipairs(cam_rot) do

		-- Decompilation error in this vicinity:
		if not panel then
			slot14 = name_label
			slot14 = name_label.panel(slot13)
			local panel = name_label.panel(slot13).parent(slot13)
		end

		local pos = name_label._vehicle_unit.position(slot14)
		slot17 = pos

		mvector3.set(name_label._vehicle_unit, nl_w_pos)

		slot16 = nl_w_pos
		slot23 = 200
		slot19 = pos + Vector3(slot20, 0, 0)

		mvector3.set_z(name_label._vehicle_unit, mvector3.z(slot18))

		slot16 = nl_pos
		slot21 = nl_w_pos

		mvector3.set(name_label._vehicle_unit, self._workspace.world_to_screen(slot18, self._workspace, cam))

		slot17 = nl_w_pos

		mvector3.set(name_label._vehicle_unit, nl_dir)

		slot17 = cam_pos

		mvector3.subtract(name_label._vehicle_unit, nl_dir)

		slot17 = nl_dir

		mvector3.set(name_label._vehicle_unit, nl_dir_normalized)

		slot16 = nl_dir_normalized

		mvector3.normalize(name_label._vehicle_unit)

		slot17 = nl_dir_normalized
		local dot = mvector3.dot(name_label._vehicle_unit, nl_cam_forward)
		slot17 = name_label
		slot17 = name_label.panel(slot16)

		if name_label.panel(slot16).visible(slot16) then
			slot17 = name_label
			slot19 = nl_pos.y

			name_label.panel(slot16).set_center(slot16, name_label.panel(slot16), nl_pos.x)
		end
	end

	return 
end
function HUDManager:_init_player_hud_values()
	self._hud = self._hud or {}
	self._hud.waypoints = self._hud.waypoints or {}
	self._hud.stored_waypoints = self._hud.stored_waypoints or {}
	self._hud.weapons = self._hud.weapons or {}
	self._hud.mugshots = self._hud.mugshots or {}
	self._hud.name_labels = self._hud.name_labels or {}
	self._hud.vehicle_name_labels = self._hud.vehicle_name_labels or {}
	self._hud.suspicion_indicators = self._hud.suspicion_indicators or {}

	return 
end
function HUDManager:post_event(event)
	slot5 = event

	self._sound_source.post_event(slot3, self._sound_source)

	return 
end
function HUDManager:_player_hud_layout()
	slot3 = self

	self._init_player_hud_values(slot2)

	slot3 = self._hud.stored_waypoints

	for id, data in pairs(slot2) do
		slot10 = data

		self.add_waypoint(slot7, self, id)
	end

	return 
end
function HUDManager:add_suspicion_indicator(id, data)
	if self._hud.suspicion_indicators[id] then
		slot6 = id

		self.remove_suspicion_indicator(slot4, self)
	end

	slot6 = PlayerBase.INGAME_HUD_FULLSCREEN
	local hud = managers.hud.script(slot4, managers.hud)

	if not hud then
		return 
	end

	slot10 = data.suspect

	self.create_suspicion_indicator(slot5, self, id, data.position, data.state)

	slot8 = data
	local suspicion = HUDSuspicionIndicator.new(slot5, HUDSuspicionIndicator, hud)
	self._hud.suspicion_indicators[id] = suspicion

	return 
end
function HUDManager:remove_suspicion_indicator(id)
	if self._hud.suspicion_indicators[id] then
		slot4 = self._hud.suspicion_indicators[id]

		self._hud.suspicion_indicators[id].destroy(slot3)

		self._hud.suspicion_indicators[id] = nil
	end

	if self._progress_target then
		self._progress_target[id] = nil
	end

	slot5 = id

	self._hud_suspicion_direction.remove_suspicion_indicator(slot3, self._hud_suspicion_direction)

	return 
end
function HUDManager:set_suspicion_indicator_state(id, state)
	if not self._hud.suspicion_indicators[id] then
		return 
	end

	slot5 = self._hud.suspicion_indicators[id]
	local old_state = self._hud.suspicion_indicators[id].state(slot4)

	if old_state == "calling" then
		return 
	end

	if old_state == "alarmed" and state ~= "calling" then
		return 
	end

	slot7 = state

	self._hud.suspicion_indicators[id].set_state(slot5, self._hud.suspicion_indicators[id])

	slot8 = state

	self._hud_suspicion_direction.set_state(slot5, self._hud_suspicion_direction, id)

	return 
end
function HUDManager:_get_raid_icon(icon)

	-- Decompilation error in this vicinity:
	slot8 = icon
	slot5 = "[HUDManager] _get_raid_icon(): " .. tostring(slot7)

	Application.trace(slot3, Application)

	slot5 = 1
	slot8 = "waypoint_special"

	return 
end
function HUDManager:add_waypoint(id, data)
	if self._hud.waypoints[id] then
		slot6 = id

		self.remove_waypoint(slot4, self)
	end

	slot6 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot4, managers.hud)

	if not hud then
		self._hud.stored_waypoints[id] = data

		return 
	end

	local icon = data.icon or "wp_standard"
	slot8 = icon
	local icon, texture_rect, rect_over = self._get_raid_icon(slot6, self)
	self._hud.waypoints[id] = {
		move_speed = 1,
		id_string = id,
		init_data = data,
		state = data.state or "present",
		present_timer = data.present_timer or 2,
		position = data.position,
		rotation = data.rotation,
		unit = data.unit,
		suspect = data.suspect,
		no_sync = data.no_sync,
		radius = data.radius or 160,
		waypoint_type = data.waypoint_type,
		waypoint_display = data.waypoint_display,
		waypoint_color = data.waypoint_color,
		waypoint_width = data.waypoint_width,
		waypoint_depth = data.waypoint_depth,
		waypoint_radius = data.waypoint_radius,
		icon = icon,
		map_icon = data.map_icon,
		texture_rect = texture_rect,
		show_on_screen = data.show_on_screen or (data.show_on_screen == nil and true)
	}
	slot8 = self._hud.waypoints[id].init_data

	if not data.position then
		slot11 = data.unit
		slot9 = data.unit.position(slot10)
	end

	slot8.position = slot9

	if self._tab_screen ~= nil and data.position ~= nil and data.waypoint_type == "objective" then
		slot11 = self._hud.waypoints[id]

		self._tab_screen.add_waypoint(slot9, self._tab_screen)
	end

	local show_on_screen = self._hud.waypoints[id].show_on_screen

	if show_on_screen == true then
		local waypoint_panel = hud.panel
		slot13 = {
			layer = 0,
			rotation = 360,
			name = "bitmap" .. id,
			texture = icon,
			texture_rect = texture_rect,
			w = texture_rect[3],
			h = texture_rect[4],
			blend_mode = data.blend_mode
		}
		local bitmap = waypoint_panel.bitmap(slot11, waypoint_panel)
		local bitmap_over, searching, aiming = nil

		if rect_over then
			slot17 = {
				h = 0,
				blend_mode = "normal",
				w = 32,
				layer = 0,
				rotation = 360,
				name = "bitmap_over" .. id,
				texture = icon,
				texture_rect = rect_over
			}
			bitmap_over = waypoint_panel.bitmap(slot15, waypoint_panel)
			local aiming_icon, aiming_rect = tweak_data.hud_icons.get_icon_data(slot15, tweak_data.hud_icons)
			local searching_icon, searching_rect = tweak_data.hud_icons.get_icon_data("wp_aiming", tweak_data.hud_icons)
			slot21 = {
				h = 16,
				blend_mode = "normal",
				w = 32,
				layer = 0,
				rotation = 360,
				name = "searching" .. id,
				texture = searching_icon,
				texture_rect = searching_rect
			}
			searching = waypoint_panel.bitmap("wp_investigating", waypoint_panel)
			slot21 = {
				h = 16,
				blend_mode = "normal",
				w = 32,
				layer = 0,
				rotation = 360,
				name = "aiming" .. id,
				texture = aiming_icon,
				texture_rect = aiming_rect
			}
			aiming = waypoint_panel.bitmap("wp_investigating", waypoint_panel)
		end

		local arrow_icon = tweak_data.gui.icons.map_waypoint_pov_out.texture
		local arrow_texture_rect = tweak_data.gui.icons.map_waypoint_pov_out.texture_rect
		slot19 = {
			layer = 0,
			visible = false,
			rotation = 360,
			name = "arrow" .. id,
			texture = arrow_icon,
			texture_rect = arrow_texture_rect,
			color = data.color or Color.white,
			w = arrow_texture_rect[3],
			h = arrow_texture_rect[4],
			blend_mode = data.blend_mode
		}
		local arrow = waypoint_panel.bitmap(slot17, waypoint_panel)
		local distance = nil

		if data.distance then
			slot21 = {
				vertical = "center",
				h = 26,
				w = 128,
				align = "center",
				text = "",
				rotation = 360,
				layer = 0,
				name = "distance" .. id,
				color = data.color or Color.white,
				font = tweak_data.gui.fonts.din_compressed_outlined_24,
				font_size = tweak_data.gui.font_sizes.size_24,
				blend_mode = data.blend_mode
			}
			distance = waypoint_panel.text(slot19, waypoint_panel)
			slot21 = false

			distance.set_visible(slot19, distance)
		end

		if data.timer then
			slot21 = {
				font_size = 32,
				h = 32,
				vertical = "center",
				w = 32,
				align = "center",
				rotation = 360,
				layer = 0,
				name = "timer" .. id,
				text = ((math.round(id) < 10 and "0") or "") .. math.round(data.timer),
				font = tweak_data.gui.fonts.din_compressed_outlined_32
			}
			slot25 = data.timer
			local timer = waypoint_panel.text(slot19, waypoint_panel)
		end

		slot21 = bitmap
		local w, h = bitmap.size(slot20)
		local stealth_over_rect = nil

		if rect_over then
			stealth_over_rect = {
				rect_over[1],
				rect_over[2],
				rect_over[3],
				rect_over[4]
			}
		end

		self._hud.waypoints[id].bitmap = bitmap
		self._hud.waypoints[id].bitmap_over = bitmap_over
		self._hud.waypoints[id].searching = searching
		self._hud.waypoints[id].aiming = aiming
		self._hud.waypoints[id].stealth_over_rect = stealth_over_rect
		self._hud.waypoints[id].arrow = arrow
		slot27 = 0
		self._hud.waypoints[id].size = Vector3(slot24, w, h)
		self._hud.waypoints[id].distance = distance
		self._hud.waypoints[id].timer_gui = timer
		self._hud.waypoints[id].timer = data.timer
		self._hud.waypoints[id].pause_timer = data.pause_timer or (data.timer and 0)
		local slot = 1
		local t = {}
		slot26 = self._hud.waypoints

		for _, data in pairs(slot25) do
			if data.slot then
				t[data.slot] = 0
			end
		end

		for i = 1, 10, 1 do
			if not t[i] then
				self._hud.waypoints[id].slot = i

				break
			end
		end

		self._hud.waypoints[id].slot_x = 0

		if self._hud.waypoints[id].slot == 2 then
			self._hud.waypoints[id].slot_x = t[1] / 2 + 10
		elseif self._hud.waypoints[id].slot == 3 then
			self._hud.waypoints[id].slot_x = -t[1] / 2 - 10
		elseif self._hud.waypoints[id].slot == 4 then
			self._hud.waypoints[id].slot_x = t[1] / 2 + t[2] + 20
		elseif self._hud.waypoints[id].slot == 5 then
			self._hud.waypoints[id].slot_x = -t[1] / 2 - t[3] - 20
		end
	end

	return 
end
function HUDManager:change_waypoint_icon(id, icon)
	if not self._hud.waypoints[id] then
		slot7 = id

		Application.error(slot4, Application, "[HUDManager:change_waypoint_icon] no waypoint with id")

		return 
	end

	slot6 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot4, managers.hud)
	local waypoint_panel = hud.panel
	local wp_data = self._hud.waypoints[id]
	slot10 = {
		0,
		0,
		32,
		32
	}
	local texture, rect, rect_over = tweak_data.hud_icons.get_icon_data(slot7, tweak_data.hud_icons, icon)
	wp_data.icon = texture
	wp_data.texture_rect = rect
	local show_on_screen = wp_data.show_on_screen

	if show_on_screen == true then
		slot17 = rect[4]

		wp_data.bitmap.set_image(slot11, wp_data.bitmap, texture, rect[1], rect[2], rect[3])

		slot14 = rect[4]

		wp_data.bitmap.set_size(slot11, wp_data.bitmap, rect[3])

		slot13 = rect[4]
		wp_data.size = Vector3(slot11, rect[3])

		if wp_data.bitmap_over then
			slot13 = wp_data.bitmap_over

			waypoint_panel.remove(slot11, waypoint_panel)

			slot13 = wp_data.searching

			waypoint_panel.remove(slot11, waypoint_panel)

			slot13 = wp_data.aiming

			waypoint_panel.remove(slot11, waypoint_panel)

			wp_data.bitmap_over = nil
			wp_data.searching = nil
			wp_data.aiming = nil
		end

		if rect_over then
			wp_data.stealth_over_rect = {
				rect_over[1],
				rect_over[2],
				rect_over[3],
				rect_over[4]
			}
			slot13 = {
				h = 0,
				blend_mode = "normal",
				w = 32,
				layer = 0,
				rotation = 360,
				name = "bitmap_over" .. id,
				texture = texture,
				texture_rect = rect_over
			}
			wp_data.bitmap_over = waypoint_panel.bitmap(rect_over[4], waypoint_panel)
			local aiming_icon, aiming_rect = tweak_data.hud_icons.get_icon_data(rect_over[4], tweak_data.hud_icons)
			local searching_icon, searching_rect = tweak_data.hud_icons.get_icon_data("wp_aiming", tweak_data.hud_icons)
			slot17 = {
				h = 16,
				blend_mode = "normal",
				w = 32,
				layer = 0,
				rotation = 360,
				name = "searching" .. id,
				texture = searching_icon,
				texture_rect = searching_rect
			}
			wp_data.searching = waypoint_panel.bitmap("wp_investigating", waypoint_panel)
			slot17 = {
				h = 16,
				blend_mode = "normal",
				w = 32,
				layer = 0,
				rotation = 360,
				name = "aiming" .. id,
				texture = aiming_icon,
				texture_rect = aiming_rect
			}
			wp_data.aiming = waypoint_panel.bitmap("wp_investigating", waypoint_panel)
		end
	end

	return 
end
function HUDManager:change_waypoint_icon_alpha(id, alpha)
	if not self._hud.waypoints[id] then
		slot7 = id

		Application.error(slot4, Application, "[HUDManager:change_waypoint_icon] no waypoint with id")

		return 
	end

	local wp_data = self._hud.waypoints[id]
	local show_on_screen = wp_data.show_on_screen

	if show_on_screen == true then
		slot8 = alpha

		wp_data.bitmap.set_alpha(slot6, wp_data.bitmap)
	end

	return 
end
function HUDManager:change_waypoint_arrow_color(id, color)
	if not self._hud.waypoints[id] then
		slot7 = id

		Application.error(slot4, Application, "[HUDManager:change_waypoint_icon] no waypoint with id")

		return 
	end

	local wp_data = self._hud.waypoints[id]
	local show_on_screen = wp_data.show_on_screen

	if show_on_screen == true then
		slot7 = wp_data.arrow
		slot13 = wp_data.arrow
		slot11 = wp_data.arrow.color(slot12).a

		wp_data.arrow.set_color(slot6, color.with_alpha(slot9, color))
	end

	return 
end
function HUDManager:change_waypoint_distance_color(id, color)
	if not self._hud.waypoints[id] then
		slot7 = id

		Application.error(slot4, Application, "[HUDManager:change_waypoint_distance_color] no waypoint with id")

		return 
	end

	local wp_data = self._hud.waypoints[id]
	local show_on_screen = wp_data.show_on_screen

	if show_on_screen == true then
		slot7 = wp_data.distance
		slot13 = wp_data.distance
		slot11 = wp_data.distance.color(slot12).a

		wp_data.distance.set_color(slot6, color.with_alpha(slot9, color))
	end

	return 
end
function HUDManager:remove_waypoint(id)
	self._hud.stored_waypoints[id] = nil

	if not self._hud.waypoints[id] then
		return 
	end

	slot5 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot3, managers.hud)

	if not hud then
		return 
	end

	if self._tab_screen ~= nil then
		slot5 = self._tab_screen
		slot8 = id

		self._tab_screen.remove_waypoint(slot4, tostring(slot7))
	end

	local waypoint_panel = hud.panel
	local show_on_screen = self._hud.waypoints[id].show_on_screen

	if show_on_screen == true then
		slot8 = self._hud.waypoints[id].bitmap

		waypoint_panel.remove(slot6, waypoint_panel)

		if self._hud.waypoints[id].bitmap_over then
			slot8 = self._hud.waypoints[id].bitmap_over

			waypoint_panel.remove(slot6, waypoint_panel)

			slot8 = self._hud.waypoints[id].searching

			waypoint_panel.remove(slot6, waypoint_panel)

			slot8 = self._hud.waypoints[id].aiming

			waypoint_panel.remove(slot6, waypoint_panel)
		end

		slot8 = self._hud.waypoints[id].arrow

		waypoint_panel.remove(slot6, waypoint_panel)
	end

	if self._hud.waypoints[id].timer_gui then
		slot8 = self._hud.waypoints[id].timer_gui

		waypoint_panel.remove(slot6, waypoint_panel)
	end

	if self._hud.waypoints[id].distance then
		slot8 = self._hud.waypoints[id].distance

		waypoint_panel.remove(slot6, waypoint_panel)
	end

	self._hud.waypoints[id] = nil
	slot7 = self

	self._check_and_hide_suspicion(nil)

	return 
end
function HUDManager:_check_and_hide_suspicion()
	local found = false
	slot4 = self._hud.waypoints

	for _, data in pairs(slot3) do
		if data.waypoint_type == "suspicion" then
			found = true
		end
	end

	slot4 = self._hud.suspicion_indicators

	for _, suspicion_indicator in pairs(slot3) do
		found = true
	end

	if not found then
		slot4 = self

		self.hide_suspicion(slot3)
	end

	return 
end
function HUDManager:set_waypoint_timer_pause(id, pause)
	if not self._hud.waypoints[id] then
		return 
	end

	if self._hud.waypoints[id].show_on_screen == true and self._hud.waypoints[id].pause_timer then
		self._hud.waypoints[id].pause_timer = self._hud.waypoints[id].pause_timer + ((pause and 1) or -1)
	end

	return 
end
function HUDManager:get_waypoint_data(id)
	return self._hud.waypoints[id]
end
function HUDManager:get_all_waypoints()
	return self._hud.waypoints
end
function HUDManager:clear_waypoints()
	slot5 = self._hud.waypoints

	for id, _ in pairs(clone(slot4)) do
		slot9 = id

		self.remove_waypoint(slot7, self)
	end

	slot5 = self._hud.suspicion_indicators

	for id, indicator in pairs(clone(slot4)) do
		slot8 = indicator

		indicator.destroy(slot7)

		indicator = nil
	end

	self._hud.suspicion_indicators = {}

	return 
end
function HUDManager:clear_objectives()
	slot3 = self._hud_objectives

	self._hud_objectives._clear_objectives(slot2)

	return 
end
function HUDManager:get_waypoint_for_unit(unit)
	slot4 = self._hud.waypoints

	for id, data in pairs(slot3) do
		if data.unit and data.unit == unit then
			return id
		end
	end

	return 
end
function HUDManager:clear_weapons()
	self._hud.weapons = {}

	return 
end
function HUDManager:add_mugshot_by_unit(unit)
	slot4 = unit

	if unit.base(slot3).is_local_player then
		return 
	end

	slot4 = managers.criminals
	local characters = managers.criminals.characters(slot3)
	local nationality = nil

	for i = 1, #characters, 1 do
		if characters[i].unit == unit then
			nationality = characters[i].name
		end
	end

	slot6 = unit
	local character_name = unit.base(slot5).nick_name(slot5)
	slot8 = {
		name = character_name,
		unit = unit,
		nationality = nationality
	}
	local name_label_id = managers.hud._add_name_label(unit.base(slot5), managers.hud)
	slot8 = unit
	unit.unit_data(managers.hud).name_label_id = name_label_id
	local is_husk_player = unit.base(managers.hud).is_husk_player
	slot10 = unit
	local character_name_id = managers.criminals.character_name_by_unit(unit, managers.criminals)
	slot10 = self._hud.mugshots

	for i, data in ipairs(managers.criminals) do
		if data.character_name_id == character_name_id then
			if is_husk_player and not data.peer_id then
				slot16 = data.id

				self._remove_mugshot(slot14, self)

				break
			else
				slot15 = unit
				unit.unit_data(slot14).mugshot_id = data.id
				slot18 = unit
				slot16 = unit.unit_data(slot17).mugshot_id

				managers.hud.set_mugshot_normal(data.id, managers.hud)

				slot18 = unit

				managers.hud.set_mugshot_armor(data.id, managers.hud, unit.unit_data(slot17).mugshot_id)

				slot18 = unit
				slot17 = 1

				managers.hud.set_mugshot_health(data.id, managers.hud, unit.unit_data(1).mugshot_id)

				return 
			end
		end
	end

	local peer, peer_id = nil

	if is_husk_player then
		slot12 = unit
		slot12 = unit.network(slot11)
		peer = unit.network(slot11).peer(slot11)
		slot12 = peer
		peer_id = peer.id(slot11)
	end

	local use_lifebar = (is_husk_player and true) or false
	slot14 = {
		name = character_name,
		use_lifebar = use_lifebar,
		peer_id = peer_id,
		character_name_id = character_name_id
	}
	local mugshot_id = managers.hud.add_mugshot(slot12, managers.hud)
	slot14 = unit
	unit.unit_data(managers.hud).mugshot_id = mugshot_id

	if peer then
		slot14 = peer

		if peer.is_cheater(slot13) then
			if NetworkPeer.CHEAT_CHECKS_DISABLED == true then
				return 
			end

			slot15 = peer_id

			self.mark_cheater(slot13, self)
		end
	end

	return mugshot_id, name_label_id
end
function HUDManager:add_mugshot_without_unit(char_name, ai, peer_id, name)
	local character_name = name
	local character_name_id = char_name
	local use_lifebar = not ai
	slot11 = {
		name = character_name,
		use_lifebar = use_lifebar,
		peer_id = peer_id,
		character_name_id = character_name_id
	}
	local mugshot_id = managers.hud.add_mugshot(slot9, managers.hud)

	return mugshot_id
end
function HUDManager:get_character_name_by_nationality(nationality)
	local name = "DEFAULT_NAME"

	if nationality == "russian" then
		name = "kurgan"
	elseif nationality == "german" then
		name = "wolfgang"
	elseif nationality == "british" then
		name = "stirling"
	elseif nationality == "american" then
		name = "rivet"
	end

	slot5 = name

	return utf8.to_upper(slot4)
end
function HUDManager:add_mugshot(data)
	slot8 = data.peer_id
	local panel_id = self.add_teammate_panel(slot3, self, data.character_name_id, data.name, not data.use_lifebar)
	slot6 = data.character_name_id
	managers.criminals.character_data_by_name(self, managers.criminals).panel_id = panel_id
	local last_id = (self._hud.mugshots[#self._hud.mugshots] and self._hud.mugshots[#self._hud.mugshots].id) or 0
	local id = last_id + 1
	slot8 = {
		id = id,
		character_name_id = data.character_name_id,
		peer_id = data.peer_id
	}

	table.insert(slot6, self._hud.mugshots)

	return id
end
function HUDManager:remove_hud_info_by_unit(unit)
	slot4 = unit

	if unit.unit_data(slot3).name_label_id then
		slot7 = unit
		slot5 = unit.unit_data(slot6).name_label_id

		self._remove_name_label(slot3, self)
	end

	return 
end
function HUDManager:remove_mugshot_by_character_name(character_name)
	slot4 = self._hud.mugshots

	for i, data in ipairs(slot3) do
		if data.character_name_id == character_name then
			slot10 = data.id

			self._remove_mugshot(slot8, self)

			break
		end
	end

	return 
end
function HUDManager:remove_mugshot(id)
	slot5 = id

	self._remove_mugshot(slot3, self)

	return 
end
function HUDManager:_remove_mugshot(id)
	slot4 = self._hud.mugshots

	for i, data in ipairs(slot3) do
		if data.id == id then
			slot10 = i

			table.remove(slot8, self._hud.mugshots)

			slot10 = data.character_name_id

			self.remove_teammate_panel_by_name_id(slot8, self)

			break
		end
	end

	return 
end
function HUDManager:remove_teammate_panel_by_name_id(name_id)
	slot5 = name_id
	local character_data = managers.criminals.character_data_by_name(slot3, managers.criminals)

	if character_data and character_data.panel_id then
		slot6 = character_data.panel_id

		self.remove_teammate_panel(slot4, self)
	end

	return 
end
function HUDManager:set_mugshot_weapon(id, hud_icon_id, weapon_index)
	slot6 = self._hud.mugshots

	for i, data in ipairs(slot5) do
		if data.id == id then
			slot14 = weapon_index

			print(slot10, "set_mugshot_weapon", id, hud_icon_id)

			slot15 = data.character_name_id
			slot14 = hud_icon_id

			self._set_teammate_weapon_selected(slot10, self, managers.criminals.character_data_by_name(hud_icon_id, managers.criminals).panel_id, weapon_index)

			break
		end
	end

	return 
end
function HUDManager:set_mugshot_armor(id, amount)
	if not id then
		return 
	end

	slot5 = self._hud.mugshots

	for i, data in ipairs(slot4) do
		if data.id == id then
			slot14 = data.character_name_id
			slot12 = {
				total = 1,
				max = 1,
				current = amount
			}

			self.set_teammate_armor(slot9, self, managers.criminals.character_data_by_name(slot12, managers.criminals).panel_id)

			break
		end
	end

	return 
end
function HUDManager:set_mugshot_health(id, amount)
	if not id then
		return 
	end

	slot5 = self._hud.mugshots

	for i, data in ipairs(slot4) do
		if data.id == id then
			slot14 = data.character_name_id
			slot12 = {
				total = 1,
				max = 1,
				current = amount
			}

			self.set_teammate_health(slot9, self, managers.criminals.character_data_by_name(slot12, managers.criminals).panel_id)

			break
		end
	end

	return 
end
function HUDManager:_get_mugshot_data(id)
	if not id then
		return nil
	end

	slot4 = self._hud.mugshots

	for i, data in ipairs(slot3) do
		if data.id == id then
			return data
		end
	end

	return nil
end
function HUDManager:set_mugshot_normal(id)
	slot5 = id
	local data = self._get_mugshot_data(slot3, self)

	if not data then
		return 
	end

	slot9 = data.character_name_id
	slot8 = ""

	self.set_teammate_condition(slot4, self, managers.criminals.character_data_by_name(slot7, managers.criminals).panel_id, "mugshot_normal")

	return 
end
function HUDManager:set_mugshot_downed(id)
	slot4 = self._teammate_panels[id]

	self._teammate_panels[id].go_into_bleedout(slot3)

	return 
end
function HUDManager:set_mugshot_custody(id)
	slot6 = "mugshot_in_custody"
	slot10 = "debug_mugshot_in_custody"
	local data = self._set_mugshot_state(slot3, self, id, managers.localization.text(slot8, managers.localization))

	if data then
		slot6 = data.character_name_id
		local i = managers.criminals.character_data_by_name(slot4, managers.criminals).panel_id
		slot8 = {
			total = 100,
			current = 0,
			no_hint = true
		}

		self.set_teammate_health(managers.criminals, self, i)

		slot8 = {
			total = 100,
			current = 0,
			no_hint = true
		}

		self.set_teammate_armor(managers.criminals, self, i)
	end

	return 
end
function HUDManager:_set_mugshot_state(id, icon_data, text)
	slot7 = id
	local data = self._get_mugshot_data(slot5, self)

	if not data then
		return 
	end

	slot8 = data.character_name_id
	local i = managers.criminals.character_data_by_name(slot6, managers.criminals).panel_id
	slot11 = text

	self.set_teammate_condition(managers.criminals, self, i, icon_data)

	return data
end
function HUDManager:update_vehicle_label_by_id(label_id, num_players)
	return 
end
function HUDManager:start_anticipation(data)
	return 
end
function HUDManager:sync_start_anticipation()
	return 
end
function HUDManager:check_start_anticipation_music(t)
	if not self._anticipation_music_started and t < 30 then
		self._anticipation_music_started = true
		slot4 = managers.network
		slot5 = "sync_start_anticipation_music"

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3))

		slot4 = self

		self.sync_start_anticipation_music(slot3)
	end

	return 
end
function HUDManager:sync_start_anticipation_music()
	slot4 = "anticipation"

	managers.music.raid_music_state_change(slot2, managers.music)

	return 
end
function HUDManager:start_assault(data)
	self._hud.in_assault = true
	slot4 = managers.network
	slot5 = "sync_start_assault"

	managers.network.session(true).send_to_peers_synched(true, managers.network.session(true))

	slot5 = data

	self.sync_start_assault(true, self)

	return 
end
function HUDManager:end_assault(result)
	self._anticipation_music_started = false
	self._hud.in_assault = false
	slot5 = result

	self.sync_end_assault(false, self)

	slot4 = managers.network
	slot6 = result

	managers.network.session(false).send_to_peers_synched(false, managers.network.session(false), "sync_end_assault")

	return 
end
function HUDManager:setup_anticipation(total_t)
	local exists = (self._anticipation_dialogs and true) or false
	self._anticipation_dialogs = {}

	if not exists and total_t == 45 then
		slot6 = {
			time = 45,
			dialog = 1
		}

		table.insert(slot4, self._anticipation_dialogs)

		slot6 = {
			time = 30,
			dialog = 2
		}

		table.insert(slot4, self._anticipation_dialogs)
	elseif exists and total_t == 45 then
		slot6 = {
			time = 30,
			dialog = 6
		}

		table.insert(slot4, self._anticipation_dialogs)
	end

	if total_t == 45 then
		slot6 = {
			time = 20,
			dialog = 3
		}

		table.insert(slot4, self._anticipation_dialogs)

		slot6 = {
			time = 10,
			dialog = 4
		}

		table.insert(slot4, self._anticipation_dialogs)
	end

	if total_t == 35 then
		slot6 = {
			time = 20,
			dialog = 7
		}

		table.insert(slot4, self._anticipation_dialogs)

		slot6 = {
			time = 10,
			dialog = 4
		}

		table.insert(slot4, self._anticipation_dialogs)
	end

	if total_t == 25 then
		slot6 = {
			time = 10,
			dialog = 8
		}

		table.insert(slot4, self._anticipation_dialogs)
	end

	return 
end
function HUDManager:set_crosshair_offset(offset)
	return 
end
function HUDManager:set_crosshair_visible(visible)
	return 
end
function HUDManager:present_mid_text(params)
	params.present_mid_text = true
	slot5 = params

	self.present(slot3, self)

	return 
end
function HUDManager:_update_crosshair_offset(t, dt)
	return 
end
function HUDManager:_upd_suspition_waypoint_pos(data)
	if data.bitmap_over then
		slot4 = data.bitmap_over
		slot7 = data.bitmap

		data.bitmap_over.set_bottom(slot3, data.bitmap.bottom(slot6))

		slot4 = data.bitmap_over
		slot7 = data.bitmap

		data.bitmap_over.set_left(slot3, data.bitmap.left(slot6))

		slot4 = data.searching
		slot7 = data.bitmap

		data.searching.set_bottom(slot3, data.bitmap.top(slot6))

		slot4 = data.searching
		slot7 = data.bitmap

		data.searching.set_left(slot3, data.bitmap.left(slot6))

		slot4 = data.aiming
		slot7 = data.bitmap

		data.aiming.set_bottom(slot3, data.bitmap.top(slot6))

		slot4 = data.aiming
		slot7 = data.bitmap

		data.aiming.set_left(slot3, data.bitmap.left(slot6))
	end

	return 
end
function HUDManager:_upd_suspition_waypoint_alpha(data, alpha)
	local fix = 0

	if 0 < alpha then
		fix = 0.15
	end

	if data.bitmap_over then
		slot6 = data.bitmap_over
		slot9 = data.bitmap_over
		slot10 = alpha

		data.bitmap_over.set_color(slot5, data.bitmap_over.color(slot8).with_alpha(slot8, data.bitmap_over.color(slot8)))

		slot6 = data.searching
		slot9 = data.searching
		slot10 = alpha + fix

		data.searching.set_color(slot5, data.searching.color(slot8).with_alpha(slot8, data.searching.color(slot8)))

		slot6 = data.aiming
		slot9 = data.aiming
		slot10 = alpha + fix

		data.aiming.set_color(slot5, data.aiming.color(slot8).with_alpha(slot8, data.aiming.color(slot8)))
	end

	return 
end
function HUDManager:_animate_suspition_waypoint_alpha(data, callback, x, y, z)
	local fix = 0

	if 0 < x then
		fix = 0.15
	end

	slot9 = data.arrow

	data.arrow.stop(slot8)

	slot14 = z

	data.arrow.animate(slot8, data.arrow, callback, data, x, y)

	slot9 = data.bitmap

	data.bitmap.stop(slot8)

	slot14 = z

	data.bitmap.animate(slot8, data.bitmap, callback, data, x, y)

	if data.bitmap_over ~= nil then
		slot9 = data.bitmap_over

		data.bitmap_over.stop(slot8)

		slot14 = z

		data.bitmap_over.animate(slot8, data.bitmap_over, callback, data, x, y)

		slot9 = data.searching

		data.searching.stop(slot8)

		slot14 = z

		data.searching.animate(slot8, data.searching, callback, data, x + fix, y)

		slot9 = data.aiming

		data.aiming.stop(slot8)

		slot14 = z

		data.aiming.animate(slot8, data.aiming, callback, data, x + fix, y)
	end

	return 
end
function HUDManager:_upd_suspition_waypoint_state(data, show_on_screen)
	if not show_on_screen then
		return 
	end

	if data.bitmap_over ~= nil then
		if data.is_aiming then
			slot6 = true

			data.aiming.set_visible(slot4, data.aiming)
		else
			slot6 = false

			data.aiming.set_visible(slot4, data.aiming)
		end

		if data.is_searching then
			slot6 = true

			data.searching.set_visible(slot4, data.searching)
		else
			slot6 = false

			data.searching.set_visible(slot4, data.searching)
		end
	end

	return 
end
local wp_pos = Vector3()
local wp_dir = Vector3()
local wp_dir_normalized = Vector3()
local wp_cam_forward = Vector3()
local wp_onscreen_direction = Vector3()
local wp_onscreen_target_pos = Vector3()
function HUDManager:_update_suspicion_indicators(t, dt)
	slot5 = managers.viewport
	local cam = managers.viewport.get_current_camera(slot4)

	if not cam then
		return 
	end

	local cam_pos = managers.viewport.get_current_camera_position(slot5)
	local cam_rot = managers.viewport.get_current_camera_rotation(managers.viewport)
	slot9 = wp_cam_forward

	mrotation.y(managers.viewport, cam_rot)

	if self._hud.suspicion_indicators then
		slot8 = self._hud.suspicion_indicators

		for id, suspicion_indicator in pairs(slot7) do
			slot15 = dt

			suspicion_indicator.update_progress(slot12, suspicion_indicator, t)

			local parent_panel = suspicion_indicator.parent(slot12)
			local observer_position = suspicion_indicator.observer_position(suspicion_indicator)
			slot15 = wp_pos
			slot20 = observer_position

			mvector3.set(suspicion_indicator, self._fullscreen_workspace.world_to_screen(slot17, self._fullscreen_workspace, cam))

			slot16 = observer_position

			mvector3.set(suspicion_indicator, wp_dir)

			slot16 = cam_pos

			mvector3.subtract(suspicion_indicator, wp_dir)

			slot16 = wp_dir

			mvector3.set(suspicion_indicator, wp_dir_normalized)

			slot15 = wp_dir_normalized

			mvector3.normalize(suspicion_indicator)

			slot16 = wp_dir_normalized
			local dot = mvector3.dot(suspicion_indicator, wp_cam_forward)
			slot16 = suspicion_indicator

			if suspicion_indicator.suspect(wp_cam_forward) == "player" or HUDManager.DIFFERENT_SUSPICION_INDICATORS_FOR_TEAMMATES ~= true then
			else
				slot17 = wp_pos

				mvector3.set(slot15, suspicion_indicator.current_position)

				slot20 = suspicion_indicator.current_position
				slot18 = mvector3.y(suspicion_indicator.current_position) - HUDManager.SUSPICION_INDICATOR_Y_OFFSET

				suspicion_indicator.set_center(slot15, suspicion_indicator, mvector3.x(slot18))
			end
		end
	end

	return 
end
function HUDManager:_update_waypoints(t, dt)

	-- Decompilation error in this vicinity:
	slot5 = managers.viewport
	local cam = managers.viewport.get_current_camera(slot4)

	if not cam then
		return 
	end

	local cam_pos = managers.viewport.get_current_camera_position(slot5)
	local cam_rot = managers.viewport.get_current_camera_rotation(managers.viewport)
	slot9 = wp_cam_forward

	mrotation.y(managers.viewport, cam_rot)

	slot8 = self._hud.waypoints

	for id, data in pairs(managers.viewport) do
		local show_on_screen = data.show_on_screen
		slot16 = show_on_screen

		self._upd_suspition_waypoint_state(slot13, self, data)

		if show_on_screen == true then
			slot14 = data.bitmap
			local panel = data.bitmap.parent(slot13)

			if data.state == "dirty" then
			end

			if data.state == "sneak_present" then
				if data.suspect == "teammate" then
					slot15 = data.bitmap
					slot18 = data.bitmap
					slot19 = 0

					data.bitmap.set_color(slot14, data.bitmap.color(slot17).with_alpha(slot17, data.bitmap.color(slot17)))

					slot17 = 0

					self._upd_suspition_waypoint_alpha(slot14, self, data)
				end

				slot15 = panel.center_x(slot16)
				slot18 = panel
				data.current_position = Vector3(slot14, panel.center_y(panel))
				slot16 = data.current_position.x

				data.bitmap.set_center_x(slot14, data.bitmap)

				slot16 = data.current_position.y

				data.bitmap.set_center_y(slot14, data.bitmap)

				slot15 = wp_pos
				slot20 = data.position

				mvector3.set(slot14, self._saferect.world_to_screen(panel, self._saferect, cam))

				slot19 = wp_pos
				slot17 = mvector3.y(wp_pos) - HUDManager.OVERHEAD_Y_OFFSET

				data.bitmap.set_center(slot14, data.bitmap, mvector3.x(panel))

				slot16 = data

				self._upd_suspition_waypoint_pos(slot14, self)

				data.slot = nil
				data.current_scale = 1
				data.state = "present_ended"
				data.text_alpha = 0.5
				data.in_timer = 1
				data.target_scale = 1

				if data.distance then
					slot16 = true

					data.distance.set_visible(slot14, data.distance)
				end
			elseif data.state == "present" then
				slot15 = panel.center_x(slot16)
				slot18 = panel
				data.current_position = Vector3(slot14, panel.center_y(panel))
				slot16 = data.current_position.x

				data.bitmap.set_center_x(slot14, data.bitmap)

				slot16 = data.current_position.y

				data.bitmap.set_center_y(slot14, data.bitmap)

				slot16 = data

				self._upd_suspition_waypoint_pos(slot14, self)

				data.present_timer = data.present_timer - dt

				if data.present_timer <= 0 then
					data.slot = nil
					data.current_scale = 1
					data.state = "present_ended"
					data.text_alpha = 0.5
					data.in_timer = 1
					data.target_scale = 1

					if data.distance then
						slot16 = true

						data.distance.set_visible(slot14, data.distance)
					end
				end
			else
				local pos_has_external_update = data.waypoint_type == "spotter" or data.waypoint_type == "suspicion" or data.waypoint_type == "unit_waypoint"
			end

			if data.timer_gui then
				slot15 = data.timer_gui
				slot18 = data.bitmap

				data.timer_gui.set_center_x(slot14, data.bitmap.center_x(slot17))

				slot15 = data.timer_gui
				slot18 = data.bitmap

				data.timer_gui.set_bottom(slot14, data.bitmap.top(slot17))

				if data.pause_timer == 0 then
					data.timer = data.timer - dt

					if data.timer < 0 then
						slot13 = "00"
					else
						slot16 = data.timer
						local text = ((math.round(slot14) < 10 and "0") or "") .. math.round(data.timer)
					end

					slot17 = text

					data.timer_gui.set_text(slot15, data.timer_gui)
				end
			end
		end
	end

	return 
end
function HUDManager:show_waypoint(icon, data, new_alpha, duration)
	return 
end
function HUDManager:hide_waypoint(icon, data, new_alpha, duration)
	return 
end
function HUDManager:_animate_alpha(icon, data, new_alpha, duration, delay)
	local t = 0
	local dt = nil
	slot10 = icon
	local starting_alpha = icon.color(slot9).a
	local change = new_alpha - starting_alpha

	while t < duration + delay do
		dt = coroutine.yield()
		t = t + dt

		if data.looking_directly then
			break
		end

		if delay <= t then
			local curr_alpha = Easing.quartic_in_out(slot11, t, starting_alpha, change)
			slot13 = icon
			slot16 = icon
			slot17 = curr_alpha

			icon.set_color(t, icon.color(duration).with_alpha(duration, icon.color(duration)))

			if duration <= t then
				slot13 = icon
				slot16 = icon
				slot17 = starting_alpha + change

				icon.set_color(slot12, icon.color(slot15).with_alpha(slot15, icon.color(slot15)))
			end
		end
	end

	return 
end
function HUDManager:set_aiming_icon(id, status)
	local data = self._hud.waypoints[id]

	if not data then
		slot7 = id

		print(slot5, "[HUDManager:set_aiming_icon] Attempt to change no existant waypoint:")

		return 
	end

	data.is_aiming = status
	slot6 = Network

	if Network.is_server(slot5) then
		slot6 = managers.network

		if managers.network.session(slot5) then
			slot6 = managers.network
			slot10 = status

			managers.network.session(slot5).send_to_peers(slot5, managers.network.session(slot5), "sync_suspicion_icon", data.unit, "aim")
		end
	end

	return 
end
function HUDManager:set_investigate_icon(id, status)
	local data = self._hud.waypoints[id]

	if not data then
		slot8 = id

		Application.error(slot5, Application, "[HUDManager:set_investigate_icon] Attempt to change no existant waypoint:")
	end

	data.is_searching = status
	slot6 = Network

	if Network.is_server(slot5) then
		slot6 = managers.network

		if managers.network.session(slot5) then
			slot6 = managers.network
			slot10 = status

			managers.network.session(slot5).send_to_peers(slot5, managers.network.session(slot5), "sync_suspicion_icon", data.unit, "investigate")
		end
	end

	return 
end
function HUDManager:set_stealth_meter(id, target_id, progress)
	local suspicion_indicator = self._hud.suspicion_indicators[id]

	if not suspicion_indicator then
		slot12 = self._hud.suspicion_indicators
		slot9 = "Current suspicion indicators are " .. inspect(id)

		Application.error(slot6, Application, "[HUDManager:set_stealth_meter] Attempt to set progress to a non-existant suspicion indicator; id: " .. tostring(slot10))

		return 
	end

	slot10 = progress
	local max_progress = self._set_progress_for_target(slot6, self, id, target_id)
	slot9 = max_progress

	suspicion_indicator.set_progress(self, suspicion_indicator)

	return 
end
function HUDManager:_set_progress_for_target(id, target_id, progress)
	self._progress_target[id] = self._progress_target[id] or {}
	slot9 = 1
	self._progress_target[id][target_id] = math.clamp(slot6, progress, 0)
	local max = 0
	slot7 = self._progress_target[id]

	for _, p in pairs(slot6) do
		if max < p then
			max = p
		end
	end

	return max
end
function HUDManager:_upd_suspition_progress(data, dt)
	local old_h = (data.stealth_over_rect and data.stealth_over_rect[4]) or 0

	if data.stealth_target_h then
		slot6 = data.stealth_target_h - old_h
		local distance = math.abs(slot5)

		if 0.1 < distance then
			local lerp_speed = distance / 2
			slot10 = lerp_speed * dt
			local h = math.lerp(slot7, old_h, data.stealth_target_h)
			data.stealth_over_rect[2] = 32 - h
			data.stealth_over_rect[4] = h
		end
	end

	return 
end
function HUDManager:reset_player_hpbar()
	slot3 = managers.criminals
	slot6 = managers.criminals
	local crim_entry = managers.criminals.character_static_data_by_name(slot2, managers.criminals.local_character_name(slot5))

	if not crim_entry then
		return 
	end

	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	local color_id = managers.network.session(slot3).local_peer(slot3).id(slot3)
	slot6 = 4
	slot9 = managers.network
	slot9 = managers.network.session(slot8)
	slot9 = managers.network.session(slot8).local_peer(slot8)

	self.set_teammate_name(managers.network.session(slot3).local_peer(slot3), self, managers.network.session(slot8).local_peer(slot8).name(slot8))

	return 
end
function HUDManager:_create_pd_progress()
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot2, managers.hud)

	if not hud then
		return 
	end

	slot5 = hud
	self._pd2_hud_interaction = HUDInteraction.new(slot3, HUDInteraction)

	return 
end
function HUDManager:pd_start_progress(current, total, msg, icon_id)
	slot8 = total

	self._pd2_hud_interaction.animate_progress(slot6, self._pd2_hud_interaction)

	return 
end
function HUDManager:pd_cancel_progress()
	slot4 = false

	self._pd2_hud_interaction.hide_interaction_bar(slot2, self._pd2_hud_interaction)

	return 
end
function HUDManager:pd_complete_progress()
	slot4 = true

	self._pd2_hud_interaction.hide_interaction_bar(slot2, self._pd2_hud_interaction)

	return 
end
function HUDManager:on_simulation_ended()
	slot4 = "point_of_no_return"

	self.remove_updator(slot2, self)

	slot3 = self

	self.end_assault(slot2)

	slot3 = self

	self._destroy_comm_wheel(slot2)

	slot3 = self._hud_hit_direction

	self._hud_hit_direction.clean_up(slot2)

	slot3 = self._hud_suspicion_direction

	self._hud_suspicion_direction.clean_up(slot2)

	if self._black_screen then
		slot3 = self._black_screen

		self._black_screen.clean_up(slot2)
	end

	if self._toast_notification then
		slot3 = self._toast_notification

		self._toast_notification.cleanup(slot2)

		self._toast_notification = nil
	end

	if self._hud_objectives then
		slot3 = self._hud_objectives

		self._hud_objectives.clean_up(slot2)
	end

	slot4 = "[HUDManager] hide_tab_screen"

	managers.network.account.remove_overlay_listener(slot2, managers.network.account)

	return 
end
function HUDManager:clean_up()
	slot3 = self

	self.clear_waypoints(slot2)

	return 
end
function HUDManager:debug_show_coordinates()
	if self._debug then
		return 
	end

	self._debug = {}
	slot4 = Overlay
	slot4 = Overlay.newgui(slot3)
	self._debug.ws = Overlay.newgui(slot3).create_screen_workspace(slot3)
	slot4 = self._debug.ws
	self._debug.panel = self._debug.ws.panel(slot3)
	slot5 = {
		text = "",
		name = "debug_coord",
		y = 14,
		font_size = 14,
		x = 14,
		layer = 2000,
		font = tweak_data.gui.fonts.din_compressed_outlined_18,
		color = Color.white
	}
	self._debug.coord = self._debug.panel.text(slot3, self._debug.panel)

	return 
end
function HUDManager:debug_hide_coordinates()
	if not self._debug then
		return 
	end

	slot3 = Overlay
	slot4 = self._debug.ws

	Overlay.newgui(slot2).destroy_workspace(slot2, Overlay.newgui(slot2))

	self._debug = nil

	return 
end
function HUDManager:save(d)
	local state = {
		waypoints = {},
		in_assault = self._hud.in_assault,
		teammate_timers = {}
	}
	slot5 = self._hud.waypoints

	for id, data in pairs(slot4) do
		if not data.no_sync then
			state.waypoints[id] = {}
			state.waypoints[id] = data.init_data
			state.waypoints[id].timer = data.timer
			state.waypoints[id].pause_timer = data.pause_timer
			state.waypoints[id].unit = data.unit
		end
	end

	slot5 = self._teammate_panels

	for id, data in pairs(slot4) do
		if data._timer_current and 0 < data._timer_current then
			local name = nil
			slot13 = managers.criminals

			for _, char in pairs(managers.criminals.characters(slot12)) do
				if (char.data.panel_id and char.data.panel_id == data._id) or (data._peer_id and char.peer_id and data._peer_id == char.peer_id) or (data._id == HUDManager.PLAYER_PANEL and char.peer_id == 1) then
					name = char.name
				end
			end

			if name then
				state.teammate_timers[name] = {
					timer_current = data._timer_current,
					timer_total = data._timer_total
				}
			end
		end
	end

	d.HUDManager = state

	return 
end
function HUDManager:load(data)
	local state = data.HUDManager
	slot5 = state.waypoints

	for id, init_data in pairs(slot4) do
		if init_data.waypoint_origin ~= "waypoint_extension" then
			slot12 = init_data

			self.add_waypoint(slot9, self, id)
		end
	end

	self._teammate_timers = state.teammate_timers

	if state.in_assault then
		slot5 = self

		self.sync_start_assault(slot4)
	end

	return 
end
slot14 = "lib/managers/HUDManagerPD2"

require("load")

return 
