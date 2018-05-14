-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- Decompilation Error: _glue_flows(node)

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
slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot3 = "CoreLocalizationManager"

core.import(slot1, core)

slot3 = "CoreNewsReportManager"

core.import(slot1, core)

slot3 = "CoreSubtitleManager"

core.import(slot1, core)

slot3 = "CoreViewportManager"

core.import(slot1, core)

slot3 = "CoreSequenceManager"

core.import(slot1, core)

slot3 = "CoreMissionManager"

core.import(slot1, core)

slot3 = "CoreControllerManager"

core.import(slot1, core)

slot3 = "CoreListenerManager"

core.import(slot1, core)

slot3 = "CoreSlotManager"

core.import(slot1, core)

slot3 = "CoreCameraManager"

core.import(slot1, core)

slot3 = "CoreExpressionManager"

core.import(slot1, core)

slot3 = "CoreShapeManager"

core.import(slot1, core)

slot3 = "CorePortalManager"

core.import(slot1, core)

slot3 = "CoreDOFManager"

core.import(slot1, core)

slot3 = "CoreRumbleManager"

core.import(slot1, core)

slot3 = "CoreOverlayEffectManager"

core.import(slot1, core)

slot3 = "CoreSessionManager"

core.import(slot1, core)

slot3 = "CoreInputManager"

core.import(slot1, core)

slot3 = "CoreGTextureManager"

core.import(slot1, core)

slot3 = "CoreSmoketestManager"

core.import(slot1, core)

slot3 = "CoreEnvironmentAreaManager"

core.import(slot1, core)

slot3 = "CoreEnvironmentEffectsManager"

core.import(slot1, core)

slot3 = "CoreSlaveManager"

core.import(slot1, core)

slot3 = "CoreHelperUnitManager"

core.import(slot1, core)

slot3 = "CoreSystemEventListenerHolder"

core.import(slot1, core)

slot3 = "CoreSystemEventListenerManager"

core.import(slot1, core)

slot2 = "core/lib/managers/cutscene/CoreCutsceneManager"

require(slot1)

slot2 = "core/lib/managers/CoreWorldCameraManager"

require(slot1)

slot2 = "core/lib/managers/CoreSoundEnvironmentManager"

require(slot1)

slot2 = "core/lib/managers/CoreMusicManager"

require(slot1)

slot2 = "core/lib/managers/CoreWorldInstanceManager"

require(slot1)

slot2 = "core/lib/utils/dev/editor/WorldHolder"

require(slot1)

slot2 = "core/lib/managers/CoreWorldCollection"

require(slot1)

slot2 = "core/lib/managers/CoreEnvironmentControllerManager"

require(slot1)

slot2 = "core/lib/units/CoreSpawnSystem"

require(slot1)

slot2 = "core/lib/units/CoreUnitDamage"

require(slot1)

slot2 = "core/lib/units/CoreEditableGui"

require(slot1)

slot2 = "core/lib/units/data/CoreScriptUnitData"

require(slot1)

slot2 = "core/lib/units/data/CoreWireData"

require(slot1)

slot2 = "core/lib/units/data/CoreCutsceneData"

require(slot1)

slot2 = Application

if Application.ews_enabled(slot1) then
	slot3 = "CoreLuaProfilerViewer"

	core.import(slot1, core)

	slot3 = "CoreDatabaseManager"

	core.import(slot1, core)

	slot3 = "CoreToolHub"

	core.import(slot1, core)

	slot3 = "CoreInteractionEditor"

	core.import(slot1, core)

	slot3 = "CoreInteractionEditorConfig"

	core.import(slot1, core)

	slot2 = "core/lib/utils/dev/tools/CoreUnitReloader"

	require(slot1)

	slot2 = "core/lib/utils/dev/tools/CoreUnitTestBrowser"

	require(slot1)

	slot2 = "core/lib/utils/dev/tools/CoreEnvEditor"

	require(slot1)

	slot2 = "core/lib/utils/dev/tools/CoreDatabaseBrowser"

	require(slot1)

	slot2 = "core/lib/utils/dev/tools/CoreLuaProfiler"

	require(slot1)

	slot2 = "core/lib/utils/dev/tools/CoreXMLEditor"

	require(slot1)

	slot2 = "core/lib/utils/dev/ews/CoreEWSDeprecated"

	require(slot1)

	slot2 = "core/lib/utils/dev/tools/CorePuppeteer"

	require(slot1)

	slot2 = "core/lib/utils/dev/tools/material_editor/CoreMaterialEditor"

	require(slot1)

	slot2 = "core/lib/utils/dev/tools/particle_editor/CoreParticleEditor"

	require(slot1)

	slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneEditor"

	require(slot1)
end

CoreSetup = CoreSetup or class()
local _CoreSetup = CoreSetup
function CoreSetup:init()
	CoreClass.close_override()

	self.__quit = false
	self.__exec = false
	self.__context = nil
	self.__firstupdate = true

	return 
end
function CoreSetup:init_category_print()
	return 
end
function CoreSetup:load_packages()
	return 
end
function CoreSetup:unload_packages()
	return 
end
function CoreSetup:start_boot_loading_screen()
	return 
end
function CoreSetup:init_managers(managers)
	return 
end
function CoreSetup:init_toolhub(toolhub)
	return 
end
function CoreSetup:init_game()
	return 
end
function CoreSetup:init_finalize()
	slot3 = managers.mission

	managers.mission.post_init(slot2)

	return 
end
function CoreSetup:start_loading_screen()
	return 
end
function CoreSetup:stop_loading_screen()
	return 
end
function CoreSetup:update(t, dt)
	return 
end
function CoreSetup:paused_update(t, dt)
	return 
end
function CoreSetup:render()
	return 
end
function CoreSetup:end_frame(t, dt)
	return 
end
function CoreSetup:end_update(t, dt)
	return 
end
function CoreSetup:paused_end_update(t, dt)
	return 
end
function CoreSetup:save(data)
	return 
end
function CoreSetup:load(data)
	return 
end
function CoreSetup:destroy()
	return 
end
function CoreSetup:freeflight()
	return self.__freeflight
end
function CoreSetup:exec(context)
	self.__exec = true
	self.__context = context

	return 
end
function CoreSetup:quit()
	slot3 = Application

	if not Application.editor(slot2) then
		self.__quit = true
	end

	return 
end
function CoreSetup:block_exec()
	return false
end
function CoreSetup:block_quit()
	return false
end
function CoreSetup:has_queued_exec()
	return self.__exec
end
function CoreSetup:__pre_init()
	slot3 = Application

	if Application.editor(slot2) then
		slot4 = CoreGTextureManager.GTextureManager
		managers.global_texture = CoreGTextureManager.GTextureManager.new(slot3)
		local frame_resolution = SystemInfo.desktop_resolution(CoreGTextureManager.GTextureManager.new(slot3))
		slot6 = 0
		local appwin_resolution = Vector3(SystemInfo, frame_resolution.x * 0.75, frame_resolution.y * 0.75)
		slot11 = 0
		slot9 = "CAPTION,CLOSE_BOX,MINIMIZE_BOX,MAXIMIZE_BOX,MAXIMIZE,SYSTEM_MENU,RESIZE_BORDER"
		local frame = EWS.Frame(frame_resolution.x * 0.75, EWS, "World Editor", Vector3(slot8, 0, 0), frame_resolution)
		slot6 = frame
		slot9 = "world_editor_16x16.png"

		frame.set_icon(EWS, CoreEWS.image_path(frame_resolution))

		slot9 = ""
		local frame_panel = EWS.Panel(EWS, EWS, frame, "")
		local appwin = EWS.AppWindow(EWS, EWS, frame_panel, appwin_resolution)
		slot8 = appwin
		slot13 = 0

		appwin.set_max_size(EWS, Vector3("SUNKEN_BORDER", -1, -1))

		Global.application_window = appwin
		Global.frame = frame
		slot9 = "EVT_LEAVE_WINDOW"
		slot14 = "leaving_window"

		appwin.connect(EWS, appwin, callback(-1, nil, _G))

		slot9 = "EVT_ENTER_WINDOW"
		slot14 = "entering_window"

		appwin.connect(EWS, appwin, callback(-1, nil, _G))

		slot9 = "EVT_KILL_FOCUS"
		slot14 = "kill_focus"

		appwin.connect(EWS, appwin, callback(-1, nil, _G))

		slot9 = "EVT_ACTIVATE"
		slot14 = "on_activate"

		appwin.connect(EWS, appwin, callback(-1, nil, _G))

		slot9 = appwin

		Application.set_ews_window(EWS, Application)

		slot9 = "VERTICAL"
		local top_sizer = EWS.BoxSizer(EWS, EWS)
		slot10 = "HORIZONTAL"
		local main_sizer = EWS.BoxSizer(EWS, EWS)
		slot11 = "VERTICAL"
		local left_toolbar_sizer = EWS.BoxSizer(EWS, EWS)
		slot15 = "EXPAND"

		main_sizer.add(EWS, main_sizer, left_toolbar_sizer, 0, 0)

		slot12 = "VERTICAL"
		local app_sizer = EWS.BoxSizer(EWS, EWS)
		slot16 = "EXPAND"

		main_sizer.add(EWS, main_sizer, app_sizer, 4, 0)

		slot16 = "EXPAND"

		app_sizer.add(EWS, app_sizer, appwin, 5, 0)

		slot16 = "EXPAND"

		top_sizer.add(EWS, top_sizer, main_sizer, 1, 0)

		slot13 = top_sizer

		frame_panel.set_sizer(EWS, frame_panel)

		Global.main_sizer = main_sizer
		Global.v_sizer = app_sizer
		Global.frame_panel = frame_panel
		Global.left_toolbar_sizer = left_toolbar_sizer
	end

	return 
end
function CoreSetup:__init()
	slot3 = self

	self.init_category_print(slot2)

	slot4 = "core/packages/base"

	if not PackageManager.loaded(slot2, PackageManager) then
		slot4 = "core/packages/base"

		PackageManager.load(slot2, PackageManager)
	end

	slot1 = managers

	if not managers.global_texture then
		slot4 = CoreGTextureManager.GTextureManager
		slot2 = CoreGTextureManager.GTextureManager.new(slot3)
	end

	slot1.global_texture = slot2
	slot4 = CoreSlotManager.SlotManager
	managers.slot = CoreSlotManager.SlotManager.new(slot3)
	slot4 = CoreSequenceManager.SequenceManager
	managers.sequence = CoreSequenceManager.SequenceManager.new(slot3)
	slot5 = {
		ordered = true,
		random = false
	}
	managers.worldcollection = CoreWorldCollection.new(slot3, CoreWorldCollection)

	if not Global.__coresetup_bootdone then
		slot3 = self

		self.start_boot_loading_screen(slot2)

		Global.__coresetup_bootdone = true
	end

	slot3 = self

	self.load_packages(slot2)

	slot8 = -20000
	slot4 = Vector3(slot5, -50000, -80000)
	slot9 = 30000

	World.set_raycast_bounds(slot2, World, Vector3(-50000, 90000, 50000))

	slot5 = false

	World.load(slot2, World, (Application.editor(Vector3) and "core/levels/editor/editor") or "core/levels/zone")

	slot4 = "Core Systems"

	min_exe_version(slot2, "1.0.0.7000")

	slot8 = "UnitDamage"
	slot5 = rawget(Application, _G) or CoreUnitDamage

	rawset(slot2, _G, "UnitDamage")

	slot8 = "EditableGui"
	slot5 = rawget(Application, _G) or CoreEditableGui

	rawset(slot2, _G, "EditableGui")

	local aspect_ratio = nil
	slot4 = Application

	if Application.editor(slot3) then
		slot4 = SystemInfo
		local frame_resolution = SystemInfo.desktop_resolution(slot3)
		aspect_ratio = frame_resolution.x / frame_resolution.y
	else
		slot5 = "WIN32"

		if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
			aspect_ratio = RenderSettings.aspect_ratio

			if aspect_ratio == 0 then
				aspect_ratio = RenderSettings.resolution.x / RenderSettings.resolution.y
			end
		else
			slot5 = "X360"
		end
	end

	slot4 = Application

	if Application.ews_enabled(slot3) then
		slot5 = CoreDatabaseManager.DatabaseManager
		managers.database = CoreDatabaseManager.DatabaseManager.new(slot4)
	end

	slot5 = CoreSystemEventListenerManager.SystemEventListenerManager
	managers.system_event_listener = CoreSystemEventListenerManager.SystemEventListenerManager.new(slot4)
	slot5 = CoreLocalizationManager.LocalizationManager
	managers.localization = CoreLocalizationManager.LocalizationManager.new(slot4)
	slot5 = CoreControllerManager.ControllerManager
	managers.controller = CoreControllerManager.ControllerManager.new(slot4)
	slot5 = CoreListenerManager.ListenerManager
	managers.listener = CoreListenerManager.ListenerManager.new(slot4)
	slot6 = aspect_ratio
	managers.viewport = CoreViewportManager.ViewportManager.new(slot4, CoreViewportManager.ViewportManager)
	slot5 = CoreMissionManager.MissionManager
	managers.mission = CoreMissionManager.MissionManager.new(slot4)
	slot5 = CoreExpressionManager.ExpressionManager
	managers.expression = CoreExpressionManager.ExpressionManager.new(slot4)
	slot5 = CoreWorldCameraManager
	managers.worldcamera = CoreWorldCameraManager.new(slot4)
	slot5 = CoreEnvironmentEffectsManager.EnvironmentEffectsManager
	managers.environment_effects = CoreEnvironmentEffectsManager.EnvironmentEffectsManager.new(slot4)
	slot5 = CoreShapeManager.ShapeManager
	managers.shape = CoreShapeManager.ShapeManager.new(slot4)
	slot5 = CorePortalManager.PortalManager
	managers.portal = CorePortalManager.PortalManager.new(slot4)
	slot5 = CoreSoundEnvironmentManager
	managers.sound_environment = CoreSoundEnvironmentManager.new(slot4)
	slot5 = CoreEnvironmentAreaManager.EnvironmentAreaManager
	managers.environment_area = CoreEnvironmentAreaManager.EnvironmentAreaManager.new(slot4)
	slot5 = CoreCutsceneManager
	managers.cutscene = CoreCutsceneManager.new(slot4)
	slot5 = CoreRumbleManager.RumbleManager
	managers.rumble = CoreRumbleManager.RumbleManager.new(slot4)
	slot5 = CoreDOFManager.DOFManager
	managers.DOF = CoreDOFManager.DOFManager.new(slot4)
	slot5 = CoreSubtitleManager.SubtitleManager
	managers.subtitle = CoreSubtitleManager.SubtitleManager.new(slot4)
	slot5 = CoreOverlayEffectManager.OverlayEffectManager
	managers.overlay_effect = CoreOverlayEffectManager.OverlayEffectManager.new(slot4)
	slot5 = CoreCameraManager.CameraTemplateManager
	managers.camera = CoreCameraManager.CameraTemplateManager.new(slot4)
	slot5 = CoreSlaveManager.SlaveManager
	managers.slave = CoreSlaveManager.SlaveManager.new(slot4)
	slot5 = CoreWorldInstanceManager
	managers.world_instance = CoreWorldInstanceManager.new(slot4)
	slot5 = CoreEnvironmentControllerManager
	managers.environment_controller = CoreEnvironmentControllerManager.new(slot4)
	slot5 = CoreHelperUnitManager.HelperUnitManager
	slot3 = CoreHelperUnitManager.HelperUnitManager.new(slot4)
	managers.helper_unit = slot3
	slot4 = CoreInputManager.InputManager
	self._input = CoreInputManager.InputManager.new(slot3)
	self._session = CoreSessionManager.SessionManager.new(slot3, CoreSessionManager.SessionManager, self.session_factory)
	slot4 = CoreSmoketestManager.Manager
	slot7 = self._session
	self._smoketest = CoreSmoketestManager.Manager.new(slot3, self._session.session(self._input))
	slot4 = managers.sequence

	managers.sequence.internal_load(slot3)

	slot5 = managers

	self.init_managers(slot3, self)

	slot4 = Application

	if Application.ews_enabled(slot3) then
		slot5 = CoreNewsReportManager.NewsReportManager
		managers.news = CoreNewsReportManager.NewsReportManager.new(slot4)
		slot5 = CoreToolHub.ToolHub
		slot3 = CoreToolHub.ToolHub.new(slot4)
		managers.toolhub = slot3
		slot6 = CoreEnvEditor

		managers.toolhub.add(slot3, managers.toolhub, "Environment Editor")

		slot6 = CoreMaterialEditor

		managers.toolhub.add(slot3, managers.toolhub, CoreMaterialEditor.TOOLHUB_NAME)

		slot6 = CoreLuaProfiler

		managers.toolhub.add(slot3, managers.toolhub, "LUA Profiler")

		slot6 = CoreParticleEditor

		managers.toolhub.add(slot3, managers.toolhub, "Particle Editor")

		slot6 = CorePuppeteer

		managers.toolhub.add(slot3, managers.toolhub, CorePuppeteer.EDITOR_TITLE)

		slot6 = CoreCutsceneEditor

		managers.toolhub.add(slot3, managers.toolhub, CoreCutsceneEditor.EDITOR_TITLE)

		slot4 = Application

		if not Application.editor(slot3) then
			slot6 = CoreUnitReloader

			managers.toolhub.add(slot3, managers.toolhub, "Unit Reloader")
		end

		slot5 = managers.toolhub

		self.init_toolhub(slot3, self)

		slot4 = managers.toolhub

		managers.toolhub.buildmenu(slot3)
	end

	slot6 = self
	self.__gsm = assert(slot3, self.init_game("self:init_game must return a GameStateMachine."))
	slot4 = managers.cutscene

	managers.cutscene.post_init(slot3)

	slot4 = self._smoketest

	self._smoketest.post_init(slot3)

	slot4 = Application

	if not Application.editor(slot3) then
	end

	slot4 = self

	self.init_finalize(slot3)

	return 
end
function CoreSetup:__destroy()
	slot3 = self

	self.destroy(slot2)

	slot3 = self.__gsm

	self.__gsm.destroy(slot2)

	slot3 = managers.global_texture

	managers.global_texture.destroy(slot2)

	slot3 = managers.cutscene

	managers.cutscene.destroy(slot2)

	slot3 = managers.subtitle

	managers.subtitle.destroy(slot2)

	slot3 = managers.worldcamera

	managers.worldcamera.destroy(slot2)

	slot3 = managers.viewport

	managers.viewport.destroy(slot2)

	slot3 = managers.overlay_effect

	managers.overlay_effect.destroy(slot2)

	slot3 = self._session

	self._session.destroy(slot2)

	slot3 = self._input

	self._input.destroy(slot2)

	slot3 = self._smoketest

	self._smoketest.destroy(slot2)

	return 
end
function CoreSetup:loading_update(t, dt)
	return 
end
function CoreSetup:__update(t, dt)
	if self.__firstupdate then
		slot5 = self

		self.stop_loading_screen(slot4)

		self.__firstupdate = false
	end

	slot7 = dt

	managers.controller.update(slot4, managers.controller, t)

	slot5 = managers.cutscene

	managers.cutscene.update(slot4)

	slot7 = dt

	managers.sequence.update(slot4, managers.sequence, t)

	slot7 = dt

	managers.worldcamera.update(slot4, managers.worldcamera, t)

	slot7 = dt

	managers.environment_effects.update(slot4, managers.environment_effects, t)

	slot7 = dt

	managers.sound_environment.update(slot4, managers.sound_environment, t)

	slot7 = dt

	managers.environment_area.update(slot4, managers.environment_area, t)
	managers.expression.update(slot4, managers.expression, t)

	slot8 = TimerManager
	slot6 = TimerManager.game_animation(dt).time(dt)
	slot9 = TimerManager
	slot9 = TimerManager.game_animation(TimerManager.game_animation(dt))

	managers.subtitle.update(slot4, managers.subtitle, TimerManager.game_animation(TimerManager.game_animation(dt)).delta_time(TimerManager.game_animation(dt)))

	slot7 = dt

	managers.overlay_effect.update(slot4, managers.overlay_effect, t)

	slot7 = dt

	managers.viewport.update(slot4, managers.viewport, t)

	slot7 = dt

	managers.mission.update(slot4, managers.mission, t)

	slot7 = dt

	managers.slave.update(slot4, managers.slave, t)

	slot7 = dt

	self._session.update(slot4, self._session, t)

	slot7 = dt

	self._input.update(slot4, self._input, t)

	slot7 = dt

	self._smoketest.update(slot4, self._smoketest, t)

	slot7 = dt

	managers.environment_controller.update(slot4, managers.environment_controller, t)

	slot7 = dt

	self.update(slot4, self, t)

	return 
end
function CoreSetup:__paused_update(t, dt)
	slot7 = dt

	managers.viewport.paused_update(slot4, managers.viewport, t)

	slot7 = dt

	managers.controller.paused_update(slot4, managers.controller, t)

	slot7 = dt

	managers.cutscene.paused_update(slot4, managers.cutscene, t)

	slot7 = dt

	managers.overlay_effect.paused_update(slot4, managers.overlay_effect, t)

	slot7 = dt

	managers.slave.paused_update(slot4, managers.slave, t)

	slot7 = dt

	self._session.update(slot4, self._session, t)

	slot7 = dt

	self._input.update(slot4, self._input, t)

	slot7 = dt

	self._smoketest.update(slot4, self._smoketest, t)

	slot7 = dt

	self.paused_update(slot4, self, t)

	return 
end
function CoreSetup:__end_update(t, dt)
	slot7 = dt

	managers.camera.update(slot4, managers.camera, t)

	slot7 = dt

	self._session.end_update(slot4, self._session, t)

	slot7 = dt

	self.end_update(slot4, self, t)

	slot7 = dt

	self.__gsm.end_update(slot4, self.__gsm, t)

	slot7 = dt

	managers.viewport.end_update(slot4, managers.viewport, t)

	slot7 = dt

	managers.controller.end_update(slot4, managers.controller, t)

	slot7 = dt

	managers.DOF.update(slot4, managers.DOF, t)

	slot5 = Application

	if Application.ews_enabled(slot4) then
		slot7 = dt

		managers.toolhub.end_update(slot4, managers.toolhub, t)
	end

	return 
end
function CoreSetup:__paused_end_update(t, dt)
	slot7 = dt

	self.paused_end_update(slot4, self, t)

	slot7 = dt

	self.__gsm.end_update(slot4, self.__gsm, t)

	slot7 = dt

	managers.DOF.paused_update(slot4, managers.DOF, t)

	return 
end
function CoreSetup:__render()
	slot3 = managers.portal

	managers.portal.render(slot2)

	slot3 = managers.viewport

	managers.viewport.render(slot2)

	slot3 = managers.overlay_effect

	managers.overlay_effect.render(slot2)

	slot3 = self

	self.render(slot2)

	return 
end
function CoreSetup:__end_frame(t, dt)
	slot7 = dt

	self.end_frame(slot4, self, t)

	slot7 = dt

	managers.viewport.end_frame(slot4, managers.viewport, t)

	if self.__quit then
		slot5 = self

		if not self.block_quit(slot4) then
			CoreEngineAccess._quit()
		end
	elseif self.__exec then
		slot5 = self

		if not self.block_exec(slot4) then
			if managers.network then
				slot5 = managers.network

				if managers.network.session(slot4) then
					slot5 = managers.network

					managers.network.save(slot4)
				end
			end

			if managers.mission then
				slot5 = managers.mission

				managers.mission.destroy(slot4)
			end

			if managers.worldcollection then
				slot5 = managers.worldcollection

				managers.worldcollection.destroy(slot4)
			end

			if managers.worldcollection then
				slot5 = managers.worldcollection

				managers.worldcollection.destroy(slot4)
			end

			slot5 = World

			World.unload_all_units(slot4)

			if managers.blackmarket then
				slot5 = managers.blackmarket

				managers.blackmarket.release_preloaded_blueprints(slot4)
			end

			if managers.dyn_resource then
				slot5 = managers.dyn_resource

				if not managers.dyn_resource.is_ready_to_close(slot4) then
					slot5 = Application

					Application.cleanup_thread_garbage(slot4)

					slot5 = managers.dyn_resource

					managers.dyn_resource.update(slot4)
				end
			end

			if managers.sound_environment then
				slot5 = managers.sound_environment

				managers.sound_environment.destroy(slot4)
			end

			slot5 = TextureCache

			TextureCache.abort_all_script_requests(slot4)

			slot5 = self

			self.start_loading_screen(slot4)

			if managers.worlddefinition then
				slot5 = managers.worlddefinition

				managers.worlddefinition.unload_packages(slot4)
			end

			if managers.worldcollection then
				slot5 = managers.worldcollection

				managers.worldcollection.unload_packages(slot4)
			end

			slot5 = self

			self.unload_packages(slot4)

			slot5 = managers.menu

			managers.menu.destroy(slot4)

			slot5 = Overlay
			slot5 = Overlay.newgui(slot4)

			Overlay.newgui(slot4).destroy_all_workspaces(slot4)

			slot5 = Application

			Application.cleanup_thread_garbage(slot4)

			slot6 = self.__context

			CoreEngineAccess._exec(slot4, "core/lib/CoreEntry")
		end
	end

	return 
end
function CoreSetup:__loading_update(t, dt)
	slot7 = dt

	self._session.update(slot4, self._session, t)

	slot5 = self

	self.loading_update(slot4)

	return 
end
function CoreSetup:__animations_reloaded()
	return 
end
function CoreSetup:__script_reloaded()
	return 
end
function CoreSetup:__entering_window(user_data, event_object)
	slot5 = Global.frame

	if Global.frame.is_active(slot4) then
		slot5 = Global.application_window

		Global.application_window.set_focus(slot4)

		slot5 = Input
		slot5 = Input.keyboard(slot4)

		Input.keyboard(slot4).acquire(slot4)
	end

	return 
end
function CoreSetup:__on_activate(user_data, event_object)
	slot5 = Global.application_window

	Global.application_window.refresh(slot4)

	return 
end
function CoreSetup:__leaving_window(user_data, event_object)
	if not managers.editor or managers.editor._in_mixed_input_mode then
		slot5 = Input
		slot5 = Input.keyboard(slot4)

		Input.keyboard(slot4).unacquire(slot4)
	end

	return 
end
function CoreSetup:__kill_focus(user_data, event_object)
	if managers.editor then
		slot5 = managers.editor

		if not managers.editor.in_mixed_input_mode(slot4) and not Global.running_simulation then
			slot6 = true

			managers.editor.set_in_mixed_input_mode(slot4, managers.editor)
		end
	end

	return 
end
function CoreSetup:__save(data)
	slot5 = data

	self.save(slot3, self)

	return 
end
function CoreSetup:__load(data)
	slot5 = data

	self.load(slot3, self)

	return 
end
slot4 = "CoreSetup"

core.module(function (self, data)
	slot5 = data

	self.load(slot3, self)

	return 
end, core)

CoreSetup = _CoreSetup
function CoreSetup:make_entrypoint()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not _G.CoreSetup.__entrypoint_is_setup then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-12, warpins: 1 ---
		slot6 = "pre_init"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "init"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "destroy"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "update"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "end_update"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "paused_update"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "paused_end_update"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "render"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "end_frame"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "animations_reloaded"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "script_reloaded"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "entering_window"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "leaving_window"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "kill_focus"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "save"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "load"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		slot6 = "on_activate"
		slot3 = rawget(slot4, _G) == nil

		assert(slot2)

		_G.CoreSetup.__entrypoint_is_setup = true
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-23, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-34, warpins: 2 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 38-45, warpins: 2 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 49-56, warpins: 2 ---
		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 60-67, warpins: 2 ---
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 71-78, warpins: 2 ---
		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 82-89, warpins: 2 ---
		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #8



		-- Decompilation error in this vicinity:
		--- BLOCK #8 93-100, warpins: 2 ---
		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #9 104-111, warpins: 2 ---
		--- END OF BLOCK #9 ---

		FLOW; TARGET BLOCK #10



		-- Decompilation error in this vicinity:
		--- BLOCK #10 115-122, warpins: 2 ---
		--- END OF BLOCK #10 ---

		FLOW; TARGET BLOCK #11



		-- Decompilation error in this vicinity:
		--- BLOCK #11 126-133, warpins: 2 ---
		--- END OF BLOCK #11 ---

		FLOW; TARGET BLOCK #12



		-- Decompilation error in this vicinity:
		--- BLOCK #12 137-144, warpins: 2 ---
		--- END OF BLOCK #12 ---

		FLOW; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #13 148-155, warpins: 2 ---
		--- END OF BLOCK #13 ---

		FLOW; TARGET BLOCK #14



		-- Decompilation error in this vicinity:
		--- BLOCK #14 159-166, warpins: 2 ---
		--- END OF BLOCK #14 ---

		FLOW; TARGET BLOCK #15



		-- Decompilation error in this vicinity:
		--- BLOCK #15 170-177, warpins: 2 ---
		--- END OF BLOCK #15 ---

		FLOW; TARGET BLOCK #16



		-- Decompilation error in this vicinity:
		--- BLOCK #16 181-188, warpins: 2 ---
		--- END OF BLOCK #16 ---

		FLOW; TARGET BLOCK #17



		-- Decompilation error in this vicinity:
		--- BLOCK #17 192-196, warpins: 2 ---
		--- END OF BLOCK #17 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 197-359, warpins: 2 ---
	slot4 = "pre_init"
	slot9 = "__pre_init"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "init"
	slot9 = "__init"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "destroy"
	slot9 = "__destroy"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "update"
	slot9 = "__update"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "end_update"
	slot9 = "__end_update"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "loading_update"
	slot9 = "__loading_update"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "paused_update"
	slot9 = "__paused_update"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "paused_end_update"
	slot9 = "__paused_end_update"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "render"
	slot9 = "__render"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "end_frame"
	slot9 = "__end_frame"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "animations_reloaded"
	slot9 = "__animations_reloaded"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "script_reloaded"
	slot9 = "__script_reloaded"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "entering_window"
	slot9 = "__entering_window"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "on_activate"
	slot9 = "__on_activate"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "leaving_window"
	slot9 = "__leaving_window"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "kill_focus"
	slot9 = "__kill_focus"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "save"
	slot9 = "__save"

	rawset(slot2, _G, callback(slot6, self, self))

	slot4 = "load"
	slot9 = "__load"

	rawset(slot2, _G, callback(slot6, self, self))

	return 
	--- END OF BLOCK #1 ---



end

return 
