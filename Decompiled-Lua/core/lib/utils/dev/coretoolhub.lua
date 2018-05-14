slot3 = "CoreToolHub"

core.module(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

ToolHub = ToolHub or class()
function ToolHub:init()
	self._main_frame = nil
	self._shed = {}
	self._init = {}
	self._tools = {}
	self._closelist = {}
	self._current = nil
	self._show = false
	self._f4 = false
	self._dbgmenu = nil
	self._statsmenu = nil
	self._cheatmenu = nil
	self._catprintmenu = nil
	self._startscreen = "primary"
	slot3 = self

	self.create(slot2)

	return 
end
function ToolHub:destroy()
	slot3 = self._main_frame

	if alive(slot2) then
		slot3 = self._tools

		for _, tool in pairs(slot2) do
			if tool.destroy then
				slot8 = tool

				tool.destroy(slot7)
			end
		end

		slot4 = false

		self._main_frame.set_visible(slot2, self._main_frame)

		slot3 = self._main_frame

		self._main_frame.destroy_children(slot2)

		slot3 = self._main_frame

		self._main_frame.destroy(slot2)
	end

	return 
end
function ToolHub:update(time, rel_time)
	local kb = Input.keyboard(slot4)
	slot6 = kb
	slot9 = "f4"

	if kb.released(Input, Idstring(slot8)) or self._f4 then
		self._f4 = false

		if not self._show then
			slot6 = self

			self.show(slot5)
		else
			slot6 = self._main_frame

			self._main_frame.set_focus(slot5)
		end
	end

	slot6 = self._tools

	for key, value in pairs(slot5) do
		slot13 = rel_time

		value.update(slot10, value, time)
	end

	slot6 = self._closelist

	for key, value in pairs(slot5) do
		local tool = self._tools[key]

		if tool ~= nil then
			slot13 = "ToolHub: Shutting down tool '" .. key .. "'."

			cat_print(slot11, "debug")

			slot12 = self._tools[key]

			self._tools[key].close(slot11)

			tool = nil
			self._tools[key] = nil

			if Global.frame then
				slot12 = Global.frame

				Global.frame.set_focus(slot11)
			end
		end
	end

	self._closelist = {}

	return 
end
function ToolHub:end_update(time, delta_time)
	slot5 = self._tools

	for key, value in pairs(slot4) do
		if value.end_update then
			slot12 = delta_time

			value.end_update(slot9, value, time)
		end
	end

	return 
end
function ToolHub:paused_update(time, rel_time)
	slot7 = rel_time

	self.update(slot4, self, time)

	return 
end
function ToolHub:create()
	slot9 = 0
	slot10 = 0
	slot8 = Global.application_window
	self._main_frame = EWS.Frame(slot2, EWS, "Tool Hub", Vector3(slot6, 0, 0), Vector3(0, 800, 60), "FRAME_NO_TASKBAR,STAY_ON_TOP,CAPTION,CLOSE_BOX")
	slot4 = false

	self._main_frame.set_visible(slot2, self._main_frame)

	slot10 = "on_close"
	slot7 = ""

	self._main_frame.connect(slot2, self._main_frame, "", "EVT_CLOSE_WINDOW", callback("FRAME_NO_TASKBAR,STAY_ON_TOP,CAPTION,CLOSE_BOX", self, self))

	slot4 = "VERTICAL"
	local main_box = EWS.BoxSizer(slot2, EWS)
	slot5 = self._main_frame
	self._main_panel = EWS.Panel(EWS, EWS)
	slot8 = "EXPAND"

	main_box.add(EWS, main_box, self._main_panel, 1, 0)

	slot5 = main_box

	self._main_frame.set_sizer(EWS, self._main_frame)

	slot4 = self._main_frame
	slot8 = self._startscreen

	self._main_frame.set_position(EWS, self.getscreenpos(1, self))

	return 
end
function ToolHub:get_tool_menu(frame)
	local sortkeys = {}
	slot5 = self._shed

	for n in pairs(slot4) do
		sortkeys[#sortkeys + 1] = n
	end

	slot5 = sortkeys

	table.sort(slot4)

	slot6 = ""
	local tool_menu = EWS.Menu(slot4, EWS)
	slot6 = sortkeys

	for key, value in pairs(EWS) do
		slot14 = ""

		tool_menu.append_item(slot10, tool_menu, value, value)

		slot18 = "on_opentool"

		frame.connect(slot10, frame, value, "EVT_COMMAND_MENU_SELECTED", callback("", self, self))
	end

	return tool_menu
end
function ToolHub:buildmenu()
	local menu_bar = EWS.MenuBar(slot2)
	local file_menu = EWS.Menu(EWS, EWS)
	local sortkeys = {}
	slot6 = self._shed

	for n in pairs("") do
		sortkeys[#sortkeys + 1] = n
	end

	slot6 = sortkeys

	table.sort(slot5)

	slot6 = sortkeys

	for key, value in pairs(slot5) do
		slot14 = ""

		file_menu.append_item(slot10, file_menu, value, value)

		slot18 = "on_opentool"

		self._main_frame.connect(slot10, self._main_frame, value, "EVT_COMMAND_MENU_SELECTED", callback("", self, self))
	end

	slot6 = file_menu

	file_menu.append_separator(slot5)

	slot9 = ""

	file_menu.append_item(slot5, file_menu, "TB_CLOSE", "Close")

	slot8 = "File"

	menu_bar.append(slot5, menu_bar, file_menu)

	slot7 = ""
	self._dbgmenu = EWS.Menu(slot5, EWS)
	slot6 = self

	self.menu_showcommands(slot5)

	slot8 = "Debug Draw"

	menu_bar.append(slot5, menu_bar, self._dbgmenu)

	slot7 = ""
	self._statsmenu = EWS.Menu(slot5, EWS)
	slot6 = self

	self.menu_statsommands(slot5)

	slot8 = "Stats"

	menu_bar.append(slot5, menu_bar, self._statsmenu)

	slot7 = menu_bar

	self._main_frame.set_menu_bar(slot5, self._main_frame)

	slot13 = "on_close"

	self._main_frame.connect(slot5, self._main_frame, "TB_CLOSE", "EVT_COMMAND_MENU_SELECTED", callback(slot10, self, self))

	slot7 = menu_bar

	self._main_frame.set_menu_bar(slot5, self._main_frame)

	slot13 = "on_close"

	self._main_frame.connect(slot5, self._main_frame, "TB_CLOSE", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot7 = ""
	self._catprintmenu = EWS.Menu(slot5, EWS)
	slot9 = ""

	self._catprintmenu.append_item(slot5, self._catprintmenu, "TB_CATPRINT_SAVE", "Save")

	slot13 = "on_catprint_save"

	self._main_frame.connect(slot5, self._main_frame, "TB_CATPRINT_SAVE", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot9 = ""

	self._catprintmenu.append_item(slot5, self._catprintmenu, "TB_CATPRINT_DRAWDEBUG", "DrawDebug")

	slot13 = "on_catprint_drawdebug"
	slot10 = ""

	self._main_frame.connect(slot5, self._main_frame, "TB_CATPRINT_DRAWDEBUG", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))
	self._catprintmenu.append_separator(slot5)

	local sorted_category_list = {}
	slot7 = Global.category_print

	for key in pairs(self._catprintmenu) do
		slot12 = key

		table.insert(slot10, sorted_category_list)
	end

	slot7 = sorted_category_list

	table.sort(slot6)

	slot7 = sorted_category_list

	for _, key in ipairs(slot6) do
		slot15 = ""

		self._catprintmenu.append_check_item(slot11, self._catprintmenu, key, key)

		slot19 = "on_catprint"

		self._main_frame.connect(slot11, self._main_frame, key, "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

		slot14 = not not Global.category_print[key]

		self._catprintmenu.set_checked(slot11, self._catprintmenu, key)
	end

	slot9 = "CatPrint"

	menu_bar.append(slot6, menu_bar, self._catprintmenu)

	slot8 = ""
	self._settingsmenu = EWS.Menu(slot6, EWS)
	slot9 = "Settings"

	menu_bar.append(slot6, menu_bar, self._settingsmenu)

	slot8 = ""
	self._screenmenu = EWS.Menu(slot6, EWS)
	slot9 = "primary"

	self._screenmenu.append_item(slot6, self._screenmenu, "TB_SETSCREEN-primary")

	slot9 = "left"

	self._screenmenu.append_item(slot6, self._screenmenu, "TB_SETSCREEN-left")

	slot9 = "right"

	self._screenmenu.append_item(slot6, self._screenmenu, "TB_SETSCREEN-right")
	self._settingsmenu.append_menu(slot6, self._settingsmenu, "TB_MESHDUMP", "Set Tool Screen", self._screenmenu)

	slot14 = "set_screen"

	self._main_frame.connect(slot6, self._main_frame, "TB_SETSCREEN-primary", "EVT_COMMAND_MENU_SELECTED", callback("Screen", self, self))

	slot14 = "set_screen"

	self._main_frame.connect(slot6, self._main_frame, "TB_SETSCREEN-left", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot14 = "set_screen"
	slot11 = ""

	self._main_frame.connect(slot6, self._main_frame, "TB_SETSCREEN-right", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot8 = ""
	local view_menu = EWS.Menu(slot6, EWS)
	slot11 = "Change visualization to Deferred Lighting"

	view_menu.append_item(EWS, view_menu, "LIGHTING", "Deferred Lighting")

	slot11 = "Change visualization to Albedo"

	view_menu.append_item(EWS, view_menu, "ALBEDO", "Albedo")

	slot11 = "Change visualization to Normal"

	view_menu.append_item(EWS, view_menu, "NORMAL", "Normal")

	slot11 = "Change visualization to Specular"

	view_menu.append_item(EWS, view_menu, "SPECULAR", "Specular")

	slot11 = "Change visualization to Glossiness"

	view_menu.append_item(EWS, view_menu, "GLOSSINESS", "Glossiness")

	slot10 = "View"

	menu_bar.append(EWS, menu_bar, view_menu)

	slot15 = "change_visualization"

	self._main_frame.connect(EWS, self._main_frame, "LIGHTING", "EVT_COMMAND_MENU_SELECTED", callback(self, self, self))

	slot15 = "change_visualization"

	self._main_frame.connect(EWS, self._main_frame, "ALBEDO", "EVT_COMMAND_MENU_SELECTED", callback("deferred_lighting", self, self))

	slot15 = "change_visualization"

	self._main_frame.connect(EWS, self._main_frame, "NORMAL", "EVT_COMMAND_MENU_SELECTED", callback("albedo_visualization", self, self))

	slot15 = "change_visualization"

	self._main_frame.connect(EWS, self._main_frame, "SPECULAR", "EVT_COMMAND_MENU_SELECTED", callback("normal_visualization", self, self))

	slot15 = "change_visualization"
	slot12 = "glossiness_visualization"

	self._main_frame.connect(EWS, self._main_frame, "GLOSSINESS", "EVT_COMMAND_MENU_SELECTED", callback("specular_visualization", self, self))

	slot9 = "WIN32"

	if SystemInfo.platform(EWS) == Idstring(SystemInfo) then
		slot9 = ""
		local resolution_menu = EWS.Menu(slot7, EWS)
		slot9 = RenderSettings.modes

		for _, res in ipairs(EWS) do
			local str = res.x .. "x" .. res.y .. ":" .. res.z
			slot18 = ""

			resolution_menu.append_item(res.y, resolution_menu, str, str)

			slot22 = "change_resolution"

			self._main_frame.connect(res.y, self._main_frame, str, "EVT_COMMAND_MENU_SELECTED", callback(res, self, self))
		end

		slot9 = resolution_menu

		resolution_menu.append_separator(slot8)

		slot12 = ""

		resolution_menu.append_item(slot8, resolution_menu, "4/3", "4/3")

		slot12 = ""

		resolution_menu.append_item(slot8, resolution_menu, "16/9", "16/9")

		slot12 = ""

		resolution_menu.append_item(slot8, resolution_menu, "16/10", "16/10")

		slot12 = ""

		resolution_menu.append_item(slot8, resolution_menu, "w/h", "w/h")

		slot16 = "change_aspect_ratio"

		self._main_frame.connect(slot8, self._main_frame, "4/3", "EVT_COMMAND_MENU_SELECTED", callback(slot13, self, self))

		slot16 = "change_aspect_ratio"

		self._main_frame.connect(slot8, self._main_frame, "16/9", "EVT_COMMAND_MENU_SELECTED", callback(1.3333333333333333, self, self))

		slot16 = "change_aspect_ratio"
		slot13 = 1.6

		self._main_frame.connect(slot8, self._main_frame, "16/10", "EVT_COMMAND_MENU_SELECTED", callback(1.7777777777777777, self, self))

		local res = RenderSettings.resolution
		slot17 = "change_aspect_ratio"

		self._main_frame.connect(self._main_frame, self._main_frame, "w/h", "EVT_COMMAND_MENU_SELECTED", callback(self, self, self))

		slot10 = resolution_menu

		resolution_menu.append_separator(self._main_frame)

		slot13 = ""

		resolution_menu.append_item(self._main_frame, resolution_menu, "TOGGLE_FULLSCREEN", "Toggle Fullscreen")

		slot17 = "toggle_fullscreen"
		slot14 = ""

		self._main_frame.connect(self._main_frame, self._main_frame, "TOGGLE_FULLSCREEN", "EVT_COMMAND_MENU_SELECTED", callback(res.x / res.y, self, self))

		slot12 = "Resolution"

		menu_bar.append(self._main_frame, menu_bar, resolution_menu)
	end

	return 
end
function ToolHub:change_visualization(viz)
	slot6 = managers.viewport

	for _, vp in ipairs(managers.viewport.viewports(slot5)) do
		slot10 = viz

		vp.set_visualization_mode(slot8, vp)
	end

	return 
end
function ToolHub:toggle_fullscreen()
	slot4 = not RenderSettings.fullscreen

	managers.viewport.set_fullscreen(slot2, managers.viewport)

	return 
end
function ToolHub:change_resolution(custom_data, event_object)
	slot6 = custom_data

	managers.viewport.set_resolution(slot4, managers.viewport)

	return 
end
function ToolHub:change_aspect_ratio(custom_data, event_object)
	slot6 = custom_data

	managers.viewport.set_aspect_ratio(slot4, managers.viewport)

	return 
end
function ToolHub:menu_showcommands()
	slot5 = "show_gui"

	self.register_showcommand(slot2, self, "show_gui")

	slot5 = "show_gui_sprites"

	self.register_showcommand(slot2, self, "show_gui_sprites")

	slot5 = "show_gui_buttons"

	self.register_showcommand(slot2, self, "show_gui_buttons")

	slot5 = "show_objects"

	self.register_showcommand(slot2, self, "show_objects")

	slot5 = "show_panels"

	self.register_showcommand(slot2, self, "show_panels")

	slot5 = "show_workspaces"

	self.register_showcommand(slot2, self, "show_workspaces")

	slot5 = "show_collision_mover"

	self.register_showcommand(slot2, self, "show_collision_mover")

	slot5 = "show_ai_graphs"

	self.register_showcommand(slot2, self, "show_ai_graphs")

	slot5 = "show_static_ai_graphs"

	self.register_showcommand(slot2, self, "show_static_ai_graphs")

	slot5 = "show_collision_aabb"

	self.register_showcommand(slot2, self, "show_collision_aabb")

	slot5 = "show_collision_oobb"

	self.register_showcommand(slot2, self, "show_collision_oobb")

	slot5 = "show_collision_shape"

	self.register_showcommand(slot2, self, "show_collision_shape")

	slot5 = "show_camera"

	self.register_showcommand(slot2, self, "show_camera")

	slot5 = "show_water"

	self.register_showcommand(slot2, self, "show_water")

	slot5 = "show_unit_rotpos"

	self.register_showcommand(slot2, self, "show_unit_rotpos")

	slot5 = "show_world_listener"

	self.register_showcommand(slot2, self, "show_world_listener")

	slot5 = "show_ai_steering"

	self.register_showcommand(slot2, self, "show_ai_steering")

	slot5 = "show_point_detector"

	self.register_showcommand(slot2, self, "show_point_detector")

	slot5 = "show_sound"

	self.register_showcommand(slot2, self, "show_sound")

	slot5 = "show_lights"

	self.register_showcommand(slot2, self, "show_lights")

	slot5 = "show_links"

	self.register_showcommand(slot2, self, "show_links")

	slot5 = "show_bones"

	self.register_showcommand(slot2, self, "show_bones")

	slot5 = "show_find"

	self.register_showcommand(slot2, self, "show_find")

	slot5 = "show_mini_physics"

	self.register_showcommand(slot2, self, "show_mini_physics")

	slot5 = "show_occluders"

	self.register_showcommand(slot2, self, "show_occluders")

	slot5 = "show_bodies"

	self.register_showcommand(slot2, self, "show_bodies")

	slot5 = "verbose_animations"

	self.register_showcommand(slot2, self, "verbose_animations")

	slot5 = "show_ambient_cube_blend"

	self.register_showcommand(slot2, self, "show_ambient_cube_blend")

	slot5 = "show_moving"

	self.register_showcommand(slot2, self, "show_moving")

	slot5 = "show_camera_controller"

	self.register_showcommand(slot2, self, "show_camera_controller")

	slot5 = "show_raycast"

	self.register_showcommand(slot2, self, "show_raycast")

	slot5 = "show_effect_surface_volume"

	self.register_showcommand(slot2, self, "show_effect_surface_volume")

	slot5 = "show_tngeffects"

	self.register_showcommand(slot2, self, "show_tngeffects")

	slot5 = "print_tngeffects"

	self.register_showcommand(slot2, self, "print_tngeffects")

	slot5 = "show_phantoms"

	self.register_showcommand(slot2, self, "show_phantoms")

	slot5 = "show_shadow_projection"

	self.register_showcommand(slot2, self, "show_shadow_projection")

	return 
end
function ToolHub:menu_statsommands()
	slot5 = "atombatcher"

	self.register_statscommands(slot2, self, "atombatcher")

	slot5 = "cullingmanager"

	self.register_statscommands(slot2, self, "cullingmanager")

	slot5 = "d3d"

	self.register_statscommands(slot2, self, "d3d")

	slot5 = "d3d_locks"

	self.register_statscommands(slot2, self, "d3d_locks")

	slot5 = "d3d_mem"

	self.register_statscommands(slot2, self, "d3d_mem")

	slot5 = "deferred"

	self.register_statscommands(slot2, self, "deferred")

	slot5 = "gui"

	self.register_statscommands(slot2, self, "gui")

	slot5 = "main"

	self.register_statscommands(slot2, self, "main")

	slot5 = "massunit"

	self.register_statscommands(slot2, self, "massunit")

	slot5 = "mem"

	self.register_statscommands(slot2, self, "mem")

	slot5 = "network"

	self.register_statscommands(slot2, self, "network")

	slot5 = "physics"

	self.register_statscommands(slot2, self, "physics")

	slot5 = "profiler"

	self.register_statscommands(slot2, self, "profiler")

	slot5 = "shadowmapper"

	self.register_statscommands(slot2, self, "shadowmapper")

	slot5 = "sound"

	self.register_statscommands(slot2, self, "sound")

	slot5 = "sound_playing"

	self.register_statscommands(slot2, self, "sound_playing")

	slot5 = "stall"

	self.register_statscommands(slot2, self, "stall")

	slot5 = "unit_profiler"

	self.register_statscommands(slot2, self, "unit_profiler")

	return 
end
function ToolHub:register_statscommands(commandname, text)
	slot8 = ""

	self._statsmenu.append_check_item(slot4, self._statsmenu, "TB_" .. commandname, text)

	slot12 = "on_stats"

	self._main_frame.connect(slot4, self._main_frame, "TB_" .. commandname, "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	return 
end
function ToolHub:register_showcommand(commandname, text)
	slot8 = ""

	self._dbgmenu.append_check_item(slot4, self._dbgmenu, "TB_" .. commandname, text)

	slot12 = "on_gaaa"

	self._main_frame.connect(slot4, self._main_frame, "TB_" .. commandname, "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	return 
end
function ToolHub:hide()
	slot3 = Global.frame

	Global.frame.set_focus(slot2)

	slot4 = false

	self._main_frame.set_visible(slot2, self._main_frame)

	self._show = false

	return 
end
function ToolHub:show()
	slot4 = true

	self._main_frame.set_visible(slot2, self._main_frame)

	slot3 = self._main_frame

	self._main_frame.set_focus(slot2)

	self._show = true

	return 
end
function ToolHub:on_close()
	slot3 = self

	self.hide(slot2)

	return 
end
function ToolHub:add(name, tool_class, init_args)
	self._shed[name] = tool_class
	self._init[name] = init_args or {}

	return 
end
function ToolHub:open(name)
	local tool = self._tools[name]

	if not tool then
		slot6 = name
		tool = self.prepare(slot4, self)
		self._tools[name] = tool
		slot5 = tool
		slot9 = self._startscreen

		tool.set_position(slot4, self.getscreenpos(slot7, self))
	end

	return 
end
function ToolHub:close(name)
	self._closelist[name] = true
	slot5 = "ToolHub: Tool '" .. name .. "' added to close down list."

	cat_print(true, "debug")

	return 
end
function ToolHub:prepare(name)
	local tool_class = self._shed[name]

	if tool_class then
		slot5 = tool_class
		slot8 = self._init[name]
		local tool = tool_class.new(slot4, unpack(slot7))

		return tool
	end

	return nil
end
function ToolHub:on_opentool(gaa, commandevent)
	slot9 = commandevent
	slot6 = "Should Open Toool: " .. commandevent.get_id(commandevent)

	cat_print(slot4, "debug")

	slot5 = self

	self.open(slot4, commandevent.get_id(commandevent.get_id(commandevent)))

	return 
end
function ToolHub:on_stats(gaa, commandevent)
	slot7 = commandevent
	slot5 = commandevent.get_id(slot6)
	slot6 = 4
	local cmdname = string.sub(slot4, slot5)
	slot7 = "stats " .. cmdname

	Application.console_command(slot5, Application)

	slot7 = "stats " .. cmdname

	cat_print(slot5, "debug")

	return 
end
function ToolHub:on_gaaa(gaa, commandevent)
	slot8 = commandevent
	local ischecked = self._dbgmenu.is_checked(slot4, commandevent.get_id(slot7))
	slot8 = commandevent
	local cmdname = string.sub(self._dbgmenu, commandevent.get_id(4))

	if ischecked == false then
		slot8 = "set " .. cmdname .. " false"

		Application.console_command(slot6, Application)
	else
		slot8 = "set " .. cmdname .. " true"

		Application.console_command(slot6, Application)
	end

	return 
end
function ToolHub:on_catprint(gaa, commandevent)
	slot9 = commandevent
	slot6 = "Should Toogle Catprint: " .. commandevent.get_id(commandevent)

	cat_print(slot4, "debug")

	slot5 = self._catprintmenu
	local ischecked = self._catprintmenu.is_checked(slot4, commandevent.get_id(commandevent.get_id(commandevent)))

	if ischecked == false then
		slot7 = commandevent
		Global.category_print[commandevent.get_id(slot6)] = false
	else
		slot7 = commandevent
		Global.category_print[commandevent.get_id(slot6)] = true
	end

	return 
end
function ToolHub:on_catprint_save(gaa, commandevent)
	slot6 = "Should Save Catprint"

	cat_print(slot4, "debug")
	CoreDebug.catprint_save()

	return 
end
function ToolHub:on_catprint_drawdebug(gaa, commandevent)
	if Global.render_debug == nil then
		return 
	end

	Global.render_debug.draw_enabled = not Global.render_debug.draw_enabled
	slot9 = Global.render_debug.draw_enabled
	slot6 = "Toggle draw of debug info: " .. tostring(slot8)

	cat_print(not Global.render_debug.draw_enabled, "debug")

	return 
end
function ToolHub:set_screen(gaa, commandevent)
	slot9 = commandevent
	slot6 = "Should set_screen: " .. commandevent.get_id(slot8)

	cat_print(slot4, "debug")

	slot5 = commandevent

	if commandevent.get_id(slot4) == "TB_SETSCREEN-primary" then
		self._startscreen = "primary"
	end

	slot5 = commandevent

	if commandevent.get_id(slot4) == "TB_SETSCREEN-left" then
		self._startscreen = "left"
	end

	slot5 = commandevent

	if commandevent.get_id(slot4) == "TB_SETSCREEN-right" then
		self._startscreen = "right"
	end

	return 
end
function ToolHub:getscreenpos(screen)
	if screen == "primary" then
		slot6 = 0

		return Vector3(slot3, 100, 100)
	end

	if screen == "left" then
		slot6 = 0

		return Vector3(slot3, -1000, 100)
	end

	if screen == "right" then
		slot6 = 0

		return Vector3(slot3, 1800, 100)
	end

	return 
end

return 
