-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/setups/Setup"

require(slot1)

slot2 = "lib/network/base/NetworkManager"

require(slot1)

slot2 = "lib/managers/StatisticsManager"

require(slot1)

slot2 = "lib/managers/MissionManager"

require(slot1)

slot2 = "lib/managers/CriminalsManager"

require(slot1)

slot2 = "lib/units/beings/player/PlayerAnimationData"

require(slot1)

slot2 = "lib/units/MenuScriptUnitData"

require(slot1)

slot2 = "lib/units/weapons/WeaponGadgetBase"

require(slot1)

slot2 = "lib/units/weapons/WeaponFlashLight"

require(slot1)

slot2 = "lib/units/weapons/WeaponLaser"

require(slot1)

slot2 = "lib/units/weapons/WeaponSecondSight"

require(slot1)

slot2 = "lib/units/weapons/WeaponSimpleAnim"

require(slot1)

slot2 = "lib/units/weapons/WeaponLionGadget1"

require(slot1)

slot3 = "SequenceManager"

core.import(slot1, core)

if not MenuSetup then
	slot2 = Setup
	slot0 = class(slot1)
end

MenuSetup = slot0
MenuSetup.IS_START_MENU = true
function MenuSetup:load_packages()

	-- Decompilation error in this vicinity:
	slot4 = "[MenuSetup:load_packages()]"

	Application.debug(slot2, Application)

	slot3 = self

	Setup.load_packages(slot2)

	slot4 = "packages/start_menu"

	if not PackageManager.loaded(slot2, PackageManager) then
		slot4 = "packages/start_menu"

		PackageManager.load(slot2, PackageManager)
	end

	slot4 = "packages/load_level"

	if not PackageManager.loaded(slot2, PackageManager) then
		slot4 = "packages/load_level"

		PackageManager.load(slot2, PackageManager)
	end

	slot4 = "packages/load_default"

	if not PackageManager.loaded(slot2, PackageManager) then
		slot4 = "packages/load_default"

		PackageManager.load(slot2, PackageManager)
	end

	local prefix = "packages/dlcs/"
	local sufix = "/start_menu"
	local package = ""
	slot6 = tweak_data.BUNDLED_DLC_PACKAGES

	for dlc_package, bundled in pairs(slot5) do
		slot12 = dlc_package
		package = prefix .. tostring(slot11) .. sufix

		if bundled and (bundled == true or bundled == 1) then
			slot12 = package

			if PackageManager.package_exists(slot10, PackageManager) then
				slot12 = package

				if not PackageManager.loaded(slot10, PackageManager) then
					slot12 = package

					PackageManager.load(slot10, PackageManager)
				end
			end
		end
	end

	local platform = SystemInfo.platform(slot5)
	slot7 = "XB1"
	slot8 = "packages/wip/start_menu"

	if PackageManager.package_exists(slot6, PackageManager) then
		slot8 = "packages/wip/start_menu"

		if not PackageManager.loaded(slot6, PackageManager) then
			slot8 = "packages/wip/start_menu"

			PackageManager.load(slot6, PackageManager)
		end
	end

	return 
end
function MenuSetup:_load_pkg_with_init(pkg)
	local init_pkg = pkg .. "_init"
	slot6 = init_pkg

	if not PackageManager.loaded(slot4, PackageManager) then
		slot7 = init_pkg

		Application.debug(slot4, Application, "[MenuSetup:_load_camp_pkg_with_init] Loading...")

		function slot7()
			slot4 = pkg

			Application.debug(slot1, Application, "[MenuSetup:_load_camp_pkg_with_init] Loading...")

			return 
		end

		PackageManager.load(slot4, PackageManager, init_pkg)
	end

	slot6 = pkg

	if not PackageManager.loaded(slot4, PackageManager) then
		function slot7()
			slot4 = pkg

			Application.debug(slot1, Application, "[MenuSetup:_load_camp_pkg_with_init] DONE")

			return 
		end

		PackageManager.load(slot4, PackageManager, pkg)
	end

	return 
end
function MenuSetup:load_stream_level_packages()
	slot4 = "[MenuSetup:load_stream_level_packages]"

	Application.debug(slot2, Application)

	local function _empty_func()
		return 
	end

	slot7 = "unit"
	slot6 = nil

	setup.set_resource_loaded_clbk(Application, setup, Idstring(slot6))

	slot5 = "levels/vanilla/streaming_level/world_sounds"

	if not PackageManager.loaded(Application, PackageManager) then
		slot6 = _empty_func

		PackageManager.load(slot3, PackageManager, "levels/vanilla/streaming_level/world_sounds")
	end

	slot5 = "levels/vanilla/streaming_level/world"

	self._load_pkg_with_init(slot3, self)

	slot5 = "levels/vanilla/streaming_level/world/world"

	self._load_pkg_with_init(slot3, self)

	return 
end
function MenuSetup:load_camp_packages()
	slot4 = "[MenuSetup:load_camp_packages]"

	Application.debug(slot2, Application)

	local function _empty_func()
		return 
	end

	slot5 = "levels/wip/camp/world_sounds"

	if not PackageManager.loaded(Application, PackageManager) then
		slot6 = _empty_func

		PackageManager.load(slot3, PackageManager, "levels/wip/camp/world_sounds")
	end

	slot5 = "levels/vanilla/camp/world"

	self._load_pkg_with_init(slot3, self)

	slot5 = "levels/vanilla/camp/caracter_menu/caracter_menu"

	self._load_pkg_with_init(slot3, self)

	slot5 = "levels/vanilla/camp/level_art/level_art"

	self._load_pkg_with_init(slot3, self)

	slot5 = "levels/vanilla/camp/lights/lights"

	self._load_pkg_with_init(slot3, self)

	slot5 = "levels/vanilla/camp/world/world"

	self._load_pkg_with_init(slot3, self)

	return 
end
function MenuSetup:gather_packages_to_unload()
	slot3 = self

	Setup.unload_packages(slot2)

	self._started_unloading_packages = true
	self._packages_to_unload = self._packages_to_unload or {}

	if not Global.load_start_menu then
		slot4 = "packages/start_menu"

		if PackageManager.loaded(slot2, PackageManager) then
		end

		local prefix = "packages/dlcs/"
		local sufix = "/start_menu"
		local package = ""
		slot6 = tweak_data.BUNDLED_DLC_PACKAGES

		for dlc_package, bundled in pairs(slot5) do
			slot12 = dlc_package
			package = prefix .. tostring(slot11) .. sufix

			if bundled and (bundled == true or bundled == 1) then
				slot12 = package

				if PackageManager.package_exists(slot10, PackageManager) then
					slot12 = package

					if PackageManager.loaded(slot10, PackageManager) then
						slot12 = package

						table.insert(slot10, self._packages_to_unload)
					end
				end
			end
		end

		slot7 = "packages/wip/start_menu"

		if PackageManager.loaded(slot5, PackageManager) then
			slot7 = "packages/wip/start_menu"

			table.insert(slot5, self._packages_to_unload)
		end
	end

	return 
end
function MenuSetup:unload_packages()
	slot3 = self

	Setup.unload_packages(slot2)

	slot4 = "packages/start_menu"

	if PackageManager.loaded(slot2, PackageManager) then
		slot4 = "packages/start_menu"

		PackageManager.unload(slot2, PackageManager)
	end

	return 
end
function MenuSetup:init_game()
	local gsm = Setup.init_game(slot2)
	slot4 = Application

	if not Application.editor(self) then
		local event_id, checkpoint_index, level, level_class_name, mission, world_setting, difficulty, intro_skipped = nil

		if not Global.exe_arguments_parsed then
			slot12 = Application
			local arg_list = Application.argv(slot11)

			for i = 1, #arg_list, 1 do
				local arg = arg_list[i]

				if arg == "-event_id" then
					event_id = arg_list[i + 1]
					i = i + 1
				elseif arg == "-checkpoint_index" then
					slot18 = arg_list[i + 1]
					checkpoint_index = tonumber(slot17)
					i = i + 1
				elseif arg == "-level" then
					level = arg_list[i + 1]
					Global.exe_argument_level = level
					i = i + 1
				elseif arg == "-difficulty" then
					difficulty = arg_list[i + 1]
					Global.exe_argument_difficulty = difficulty
					i = i + 1
				elseif arg == "-class" then
					level_class_name = arg_list[i + 1]
					i = i + 1
				elseif arg == "-mission" then
					mission = arg_list[i + 1]
					i = i + 1
				elseif arg == "-world_setting" then
					world_setting = arg_list[i + 1]
					i = i + 1
				elseif arg == "-skip_intro" then
					slot19 = true

					game_state_machine.set_boot_intro_done(slot17, game_state_machine)

					intro_skipped = true
				elseif arg == "+connect_lobby" then
					Global.boot_invite = arg_list[i + 1]
				elseif arg == "-auto_enter_level" then
					Global.exe_argument_auto_enter_level = true
					i = i + 1
				end
			end

			if Global.exe_argument_level and not Global.exe_argument_difficulty then
				Global.exe_argument_difficulty = Global.DEFAULT_DIFFICULTY
			end

			Global.exe_arguments_parsed = true
		end

		slot12 = game_state_machine

		if game_state_machine.is_boot_intro_done(slot11) then
			slot12 = game_state_machine

			if game_state_machine.is_boot_from_sign_out(slot11) or intro_skipped then
				slot13 = "menu_titlescreen"

				game_state_machine.change_state_by_name(slot11, game_state_machine)
			else
				slot13 = "menu_main"

				game_state_machine.change_state_by_name(slot11, game_state_machine)
			end
		else
			slot13 = "bootup"

			game_state_machine.change_state_by_name(slot11, game_state_machine)
		end
	end

	return gsm
end
function MenuSetup:init_managers(managers)
	slot5 = managers

	Setup.init_managers(slot3, self)

	slot5 = "[MenuSetup:init_managers]"

	Application.debug(slot3, Application)

	slot4 = MenuSceneManager
	managers.menu_scene = MenuSceneManager.new(slot3)
	slot4 = StatisticsManager
	managers.statistics = StatisticsManager.new(slot3)
	slot4 = NetworkManager
	managers.network = NetworkManager.new(slot3)

	if Global.STREAM_ALL_PACKAGES then
		slot4 = self

		self.load_stream_level_packages(slot3)
	else
		slot4 = managers.sequence

		managers.sequence.preload(slot3)

		slot5 = Idstring(slot6)
		slot10 = "clbk_pkg_manager_unit_loaded"

		setup.set_resource_loaded_clbk(slot3, setup, callback("unit", managers.sequence, managers.sequence))
	end

	return 
end
function MenuSetup:init_finalize()
	slot3 = self

	Setup.init_finalize(slot2)

	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network

		managers.network.init_finalize(slot2)
	end

	slot4 = "PS3"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		if not Global.hdd_space_checked then
			slot3 = managers.savefile

			managers.savefile.check_space_required(slot2)

			self.update = self.update_wait_for_savegame_info
		else
			slot3 = managers.achievment

			managers.achievment.chk_install_trophies(slot2)
		end
	end

	slot4 = "PS4"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot3 = managers.achievment

		managers.achievment.chk_install_trophies(slot2)
	end

	if managers.music then
		slot3 = managers.music

		managers.music.init_finalize(slot2)
	end

	slot3 = managers.dyn_resource

	managers.dyn_resource.post_init(slot2)

	return 
end
function MenuSetup:update_wait_for_savegame_info(t, dt)
	slot7 = dt

	managers.savefile.update(slot4, managers.savefile, t)

	slot5 = "Checking fetch_savegame_hdd_space_required"

	print(slot4)

	slot5 = managers.savefile

	if managers.savefile.fetch_savegame_hdd_space_required(slot4) then

		-- Decompilation error in this vicinity:
		slot6 = managers.savefile.fetch_savegame_hdd_space_required(slot7)
		slot9 = managers.dlc

		Application.check_sufficient_hdd_space_to_launch(slot4, Application, managers.dlc.has_full_game(managers.savefile))

		slot6 = "PS3"
		Global.hdd_space_checked = true
		self.update = nil
	end

	return 
end
function MenuSetup:update(t, dt)
	slot7 = dt

	Setup.update(slot4, self, t)

	slot7 = dt

	managers.network.update(slot4, managers.network, t)

	return 
end
function MenuSetup:paused_update(t, dt)
	slot7 = dt

	Setup.paused_update(slot4, self, t)

	slot7 = dt

	managers.network.update(slot4, managers.network, t)

	return 
end
function MenuSetup:end_update(t, dt)
	slot7 = dt

	Setup.end_update(slot4, self, t)

	slot5 = managers.network

	managers.network.end_update(slot4)

	return 
end
function MenuSetup:paused_end_update(t, dt)
	slot7 = dt

	Setup.paused_end_update(slot4, self, t)

	slot5 = managers.network

	managers.network.end_update(slot4)

	return 
end
function MenuSetup:destroy()
	slot3 = self

	MenuSetup.super.destroy(slot2)

	return 
end

return MenuSetup
