slot3 = "CoreGameStateMachine"

core.import(slot1, core)

slot2 = "lib/states/BootupState"

require(slot1)

slot2 = "lib/states/MenuTitlescreenState"

require(slot1)

slot2 = "lib/states/MenuMainState"

require(slot1)

slot2 = "lib/states/EditorState"

require(slot1)

slot2 = "lib/states/WorldCameraState"

require(slot1)

slot2 = "lib/states/IngamePlayerBase"

require(slot1)

slot2 = "lib/states/IngameStandard"

require(slot1)

slot2 = "lib/states/IngameBleedOut"

require(slot1)

slot2 = "lib/states/IngameFatalState"

require(slot1)

slot2 = "lib/states/IngameWaitingForPlayers"

require(slot1)

slot2 = "lib/states/IngameWaitingForRespawn"

require(slot1)

slot2 = "lib/states/IngameElectrified"

require(slot1)

slot2 = "lib/states/IngameIncapacitated"

require(slot1)

slot2 = "lib/states/EventCompleteState"

require(slot1)

slot2 = "lib/states/IngameSpecialInteraction"

require(slot1)

slot2 = "lib/states/IngameDriving"

require(slot1)

slot2 = "lib/states/IngameParachuting"

require(slot1)

slot2 = "lib/states/IngameFreefall"

require(slot1)

slot2 = "lib/states/IngameLoading"

require(slot1)

slot2 = "lib/states/IngameMenu"

require(slot1)

if not GameStateMachine then
	slot2 = CoreGameStateMachine.GameStateMachine
	slot0 = class(slot1)
end

GameStateMachine = slot0
function GameStateMachine:init()
	if not Global.game_state_machine then
		Global.game_state_machine = {
			is_boot_intro_done = false,
			is_boot_from_sign_out = false
		}
	end

	self._is_boot_intro_done = Global.game_state_machine.is_boot_intro_done
	Global.game_state_machine.is_boot_intro_done = true
	self._is_boot_from_sign_out = Global.game_state_machine.is_boot_from_sign_out
	Global.game_state_machine.is_boot_from_sign_out = false

	if not self._is_boot_intro_done then
		slot3 = Application
		slot1 = not Application.editor(slot2)
	else
		slot1 = false

		if false then
			local setup_boot = true
		end
	end

	if setup_boot or self._is_boot_from_sign_out then
		slot4 = Application
		local setup_title = not Application.editor(slot3)
	end

	local states = {}
	slot8 = self
	local empty = GameState.new(slot5, GameState, "empty")
	slot8 = self
	local editor = EditorState.new(GameState, EditorState)
	slot9 = self
	local world_camera = WorldCameraState.new(EditorState, WorldCameraState)
	slot11 = setup_boot
	local bootup = BootupState.new(WorldCameraState, BootupState, self)
	slot12 = setup_title
	local menu_titlescreen = MenuTitlescreenState.new(BootupState, MenuTitlescreenState, self)
	slot12 = self
	local menu_main = MenuMainState.new(MenuTitlescreenState, MenuMainState)
	slot13 = self
	local ingame_standard = IngameStandardState.new(MenuMainState, IngameStandardState)
	slot14 = self
	local ingame_bleed_out = IngameBleedOutState.new(IngameStandardState, IngameBleedOutState)
	slot15 = self
	local ingame_fatal = IngameFatalState.new(IngameBleedOutState, IngameFatalState)
	slot16 = self
	local ingame_electrified = IngameElectrifiedState.new(IngameFatalState, IngameElectrifiedState)
	slot17 = self
	local ingame_incapacitated = IngameIncapacitatedState.new(IngameElectrifiedState, IngameIncapacitatedState)
	slot18 = self
	local ingame_waiting_for_players = IngameWaitingForPlayersState.new(IngameIncapacitatedState, IngameWaitingForPlayersState)
	slot19 = self
	local ingame_waiting_for_respawn = IngameWaitingForRespawnState.new(IngameWaitingForPlayersState, IngameWaitingForRespawnState)
	slot20 = self
	local ingame_driving = IngameDriving.new(IngameWaitingForRespawnState, IngameDriving)
	slot21 = self
	local ingame_parachuting = IngameParachuting.new(IngameDriving, IngameParachuting)
	slot22 = self
	local ingame_freefall = IngameFreefall.new(IngameParachuting, IngameFreefall)
	slot23 = self
	local ingame_special_interaction = IngameSpecialInteraction.new(IngameFreefall, IngameSpecialInteraction)
	slot24 = self
	local ingame_loading = IngameLoading.new(IngameSpecialInteraction, IngameLoading)
	slot25 = self
	local ingame_menu = IngameMenu.new(IngameLoading, IngameMenu)
	slot26 = self
	local event_complete_screen = EventCompleteState.new(IngameMenu, EventCompleteState)
	slot28 = "default_transition"
	local empty_func = callback(EventCompleteState, nil, empty)
	slot29 = "default_transition"
	local editor_func = callback(nil, nil, editor)
	slot30 = "default_transition"
	local world_camera_func = callback(nil, nil, world_camera)
	slot31 = "default_transition"
	local bootup_func = callback(nil, nil, bootup)
	slot32 = "default_transition"
	local menu_titlescreen_func = callback(nil, nil, menu_titlescreen)
	slot33 = "default_transition"
	local menu_main_func = callback(nil, nil, menu_main)
	slot34 = "default_transition"
	local ingame_standard_func = callback(nil, nil, ingame_standard)
	slot35 = "default_transition"
	local ingame_bleed_out_func = callback(nil, nil, ingame_bleed_out)
	slot36 = "default_transition"
	local ingame_fatal_func = callback(nil, nil, ingame_fatal)
	slot37 = "default_transition"
	local ingame_electrified_func = callback(nil, nil, ingame_electrified)
	slot38 = "default_transition"
	local ingame_incapacitated_func = callback(nil, nil, ingame_incapacitated)
	slot39 = "default_transition"
	local ingame_waiting_for_players_func = callback(nil, nil, ingame_waiting_for_players)
	slot40 = "default_transition"
	local ingame_waiting_for_respawn_func = callback(nil, nil, ingame_waiting_for_respawn)
	slot41 = "default_transition"
	local ingame_driving_func = callback(nil, nil, ingame_driving)
	slot42 = "default_transition"
	local ingame_parachuting_func = callback(nil, nil, ingame_parachuting)
	slot43 = "default_transition"
	local ingame_freefall_func = callback(nil, nil, ingame_freefall)
	slot44 = "default_transition"
	local ingame_special_interaction_func = callback(nil, nil, ingame_special_interaction)
	slot45 = "default_transition"
	local ingame_loading_func = callback(nil, nil, ingame_loading)
	slot46 = "default_transition"
	local ingame_menu_func = callback(nil, nil, ingame_menu)
	slot47 = "default_transition"
	local event_complete_screen_func = callback(nil, nil, event_complete_screen)
	self._controller_enabled_count = 1
	slot47 = empty

	CoreGameStateMachine.GameStateMachine.init(nil, self)

	slot49 = editor_func

	self.add_transition(nil, self, editor, empty)

	slot49 = editor_func

	self.add_transition(nil, self, editor, world_camera)

	slot49 = editor_func

	self.add_transition(nil, self, editor, editor)

	slot49 = editor_func

	self.add_transition(nil, self, editor, ingame_standard)

	slot49 = editor_func

	self.add_transition(nil, self, editor, ingame_parachuting)

	slot49 = editor_func

	self.add_transition(nil, self, editor, ingame_freefall)

	slot49 = editor_func

	self.add_transition(nil, self, editor, ingame_bleed_out)

	slot49 = editor_func

	self.add_transition(nil, self, editor, ingame_fatal)

	slot49 = editor_func

	self.add_transition(nil, self, editor, event_complete_screen)

	slot49 = editor_func

	self.add_transition(nil, self, editor, ingame_loading)

	slot49 = editor_func

	self.add_transition(nil, self, editor, ingame_menu)

	slot49 = editor_func

	self.add_transition(nil, self, editor, ingame_waiting_for_players)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, editor)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, empty)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, world_camera)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_standard)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_parachuting)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_freefall)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_bleed_out)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_fatal)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_electrified)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_incapacitated)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_waiting_for_players)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_waiting_for_respawn)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, event_complete_screen)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_loading)

	slot49 = world_camera_func

	self.add_transition(nil, self, world_camera, ingame_menu)

	slot49 = menu_titlescreen_func

	self.add_transition(nil, self, menu_titlescreen, menu_main)

	slot49 = bootup_func

	self.add_transition(nil, self, bootup, menu_titlescreen)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, editor)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, world_camera)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_parachuting)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_freefall)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_bleed_out)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_fatal)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_electrified)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_incapacitated)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, event_complete_screen)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_waiting_for_respawn)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_standard)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_waiting_for_players)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_special_interaction)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_driving)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_loading)

	slot49 = ingame_standard_func

	self.add_transition(nil, self, ingame_standard, ingame_menu)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, editor)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, world_camera)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, ingame_standard)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, ingame_bleed_out)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, ingame_fatal)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, ingame_electrified)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, ingame_incapacitated)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, ingame_waiting_for_respawn)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, event_complete_screen)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, ingame_loading)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, ingame_menu)

	slot49 = ingame_special_interaction_func

	self.add_transition(nil, self, ingame_special_interaction, ingame_waiting_for_players)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, editor)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, world_camera)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, ingame_standard)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, ingame_bleed_out)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, ingame_fatal)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, ingame_electrified)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, ingame_incapacitated)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, ingame_waiting_for_respawn)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, event_complete_screen)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, ingame_loading)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, ingame_menu)

	slot49 = ingame_driving_func

	self.add_transition(nil, self, ingame_driving, ingame_waiting_for_players)

	slot49 = ingame_bleed_out_func

	self.add_transition(nil, self, ingame_bleed_out, editor)

	slot49 = ingame_bleed_out_func

	self.add_transition(nil, self, ingame_bleed_out, world_camera)

	slot49 = ingame_bleed_out_func

	self.add_transition(nil, self, ingame_bleed_out, ingame_standard)

	slot49 = ingame_bleed_out_func

	self.add_transition(nil, self, ingame_bleed_out, ingame_fatal)

	slot49 = ingame_bleed_out_func

	self.add_transition(nil, self, ingame_bleed_out, event_complete_screen)

	slot49 = ingame_bleed_out_func

	self.add_transition(nil, self, ingame_bleed_out, ingame_waiting_for_respawn)

	slot49 = ingame_bleed_out_func

	self.add_transition(nil, self, ingame_bleed_out, ingame_loading)

	slot49 = ingame_bleed_out_func

	self.add_transition(nil, self, ingame_bleed_out, ingame_menu)

	slot49 = ingame_bleed_out_func

	self.add_transition(nil, self, ingame_bleed_out, ingame_waiting_for_players)

	slot49 = ingame_fatal_func

	self.add_transition(nil, self, ingame_fatal, editor)

	slot49 = ingame_fatal_func

	self.add_transition(nil, self, ingame_fatal, world_camera)

	slot49 = ingame_fatal_func

	self.add_transition(nil, self, ingame_fatal, ingame_standard)

	slot49 = ingame_fatal_func

	self.add_transition(nil, self, ingame_fatal, ingame_bleed_out)

	slot49 = ingame_fatal_func

	self.add_transition(nil, self, ingame_fatal, event_complete_screen)

	slot49 = ingame_fatal_func

	self.add_transition(nil, self, ingame_fatal, ingame_waiting_for_respawn)

	slot49 = ingame_fatal_func

	self.add_transition(nil, self, ingame_fatal, ingame_loading)

	slot49 = ingame_fatal_func

	self.add_transition(nil, self, ingame_fatal, ingame_menu)

	slot49 = ingame_fatal_func

	self.add_transition(nil, self, ingame_fatal, ingame_waiting_for_players)

	slot49 = ingame_electrified_func

	self.add_transition(nil, self, ingame_electrified, editor)

	slot49 = ingame_electrified_func

	self.add_transition(nil, self, ingame_electrified, world_camera)

	slot49 = ingame_electrified_func

	self.add_transition(nil, self, ingame_electrified, ingame_standard)

	slot49 = ingame_electrified_func

	self.add_transition(nil, self, ingame_electrified, ingame_incapacitated)

	slot49 = ingame_electrified_func

	self.add_transition(nil, self, ingame_electrified, event_complete_screen)

	slot49 = ingame_electrified_func

	self.add_transition(nil, self, ingame_electrified, ingame_bleed_out)

	slot49 = ingame_electrified_func

	self.add_transition(nil, self, ingame_electrified, ingame_fatal)

	slot49 = ingame_electrified_func

	self.add_transition(nil, self, ingame_electrified, ingame_loading)

	slot49 = ingame_electrified_func

	self.add_transition(nil, self, ingame_electrified, ingame_menu)

	slot49 = ingame_electrified_func

	self.add_transition(nil, self, ingame_electrified, ingame_waiting_for_players)

	slot49 = ingame_incapacitated_func

	self.add_transition(nil, self, ingame_incapacitated, editor)

	slot49 = ingame_incapacitated_func

	self.add_transition(nil, self, ingame_incapacitated, world_camera)

	slot49 = ingame_incapacitated_func

	self.add_transition(nil, self, ingame_incapacitated, ingame_standard)

	slot49 = ingame_incapacitated_func

	self.add_transition(nil, self, ingame_incapacitated, event_complete_screen)

	slot49 = ingame_incapacitated_func

	self.add_transition(nil, self, ingame_incapacitated, ingame_waiting_for_respawn)

	slot49 = ingame_incapacitated_func

	self.add_transition(nil, self, ingame_incapacitated, ingame_loading)

	slot49 = ingame_incapacitated_func

	self.add_transition(nil, self, ingame_incapacitated, ingame_menu)

	slot49 = ingame_incapacitated_func

	self.add_transition(nil, self, ingame_incapacitated, ingame_waiting_for_players)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_waiting_for_players, ingame_standard)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_waiting_for_players, event_complete_screen)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_waiting_for_players, ingame_parachuting)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_waiting_for_players, ingame_freefall)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_waiting_for_players, ingame_loading)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_waiting_for_players, ingame_menu)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_waiting_for_players, world_camera)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_waiting_for_players, ingame_waiting_for_respawn)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_loading, ingame_standard)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_loading, event_complete_screen)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_loading, ingame_parachuting)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_loading, ingame_freefall)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_loading, ingame_waiting_for_players)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_loading, world_camera)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_loading, ingame_waiting_for_respawn)

	slot49 = ingame_waiting_for_players_func

	self.add_transition(nil, self, ingame_loading, ingame_waiting_for_players)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, ingame_standard)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, ingame_driving)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, event_complete_screen)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, ingame_menu)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, ingame_parachuting)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, ingame_freefall)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, ingame_loading)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, ingame_waiting_for_players)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, world_camera)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, ingame_waiting_for_respawn)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, ingame_waiting_for_players)

	slot49 = ingame_menu_func

	self.add_transition(nil, self, ingame_menu, ingame_bleed_out)

	slot49 = ingame_waiting_for_respawn_func

	self.add_transition(nil, self, ingame_waiting_for_respawn, ingame_standard)

	slot49 = ingame_waiting_for_respawn_func

	self.add_transition(nil, self, ingame_waiting_for_respawn, editor)

	slot49 = ingame_waiting_for_respawn_func

	self.add_transition(nil, self, ingame_waiting_for_respawn, event_complete_screen)

	slot49 = ingame_waiting_for_respawn_func

	self.add_transition(nil, self, ingame_waiting_for_respawn, ingame_loading)

	slot49 = ingame_waiting_for_respawn_func

	self.add_transition(nil, self, ingame_waiting_for_respawn, ingame_menu)

	slot49 = ingame_waiting_for_respawn_func

	self.add_transition(nil, self, ingame_waiting_for_respawn, ingame_waiting_for_players)

	slot49 = ingame_parachuting_func

	self.add_transition(nil, self, ingame_parachuting, editor)

	slot49 = ingame_parachuting_func

	self.add_transition(nil, self, ingame_parachuting, world_camera)

	slot49 = ingame_parachuting_func

	self.add_transition(nil, self, ingame_parachuting, ingame_standard)

	slot49 = ingame_parachuting_func

	self.add_transition(nil, self, ingame_parachuting, ingame_bleed_out)

	slot49 = ingame_parachuting_func

	self.add_transition(nil, self, ingame_parachuting, ingame_fatal)

	slot49 = ingame_parachuting_func

	self.add_transition(nil, self, ingame_parachuting, event_complete_screen)

	slot49 = ingame_parachuting_func

	self.add_transition(nil, self, ingame_parachuting, ingame_loading)

	slot49 = ingame_parachuting_func

	self.add_transition(nil, self, ingame_parachuting, ingame_menu)

	slot49 = ingame_parachuting_func

	self.add_transition(nil, self, ingame_parachuting, ingame_waiting_for_players)

	slot49 = ingame_freefall_func

	self.add_transition(nil, self, ingame_freefall, editor)

	slot49 = ingame_freefall_func

	self.add_transition(nil, self, ingame_freefall, world_camera)

	slot49 = ingame_freefall_func

	self.add_transition(nil, self, ingame_freefall, ingame_standard)

	slot49 = ingame_freefall_func

	self.add_transition(nil, self, ingame_freefall, ingame_bleed_out)

	slot49 = ingame_freefall_func

	self.add_transition(nil, self, ingame_freefall, ingame_parachuting)

	slot49 = ingame_freefall_func

	self.add_transition(nil, self, ingame_freefall, ingame_fatal)

	slot49 = ingame_freefall_func

	self.add_transition(nil, self, ingame_freefall, event_complete_screen)

	slot49 = ingame_freefall_func

	self.add_transition(nil, self, ingame_freefall, ingame_loading)

	slot49 = ingame_freefall_func

	self.add_transition(nil, self, ingame_freefall, ingame_menu)

	slot49 = ingame_freefall_func

	self.add_transition(nil, self, ingame_freefall, ingame_waiting_for_players)

	slot49 = event_complete_screen_func

	self.add_transition(nil, self, event_complete_screen, ingame_standard)

	slot49 = event_complete_screen_func

	self.add_transition(nil, self, event_complete_screen, editor)

	slot49 = event_complete_screen_func

	self.add_transition(nil, self, event_complete_screen, ingame_fatal)

	slot49 = event_complete_screen_func

	self.add_transition(nil, self, event_complete_screen, ingame_bleed_out)

	slot49 = event_complete_screen_func

	self.add_transition(nil, self, event_complete_screen, ingame_electrified)

	slot49 = event_complete_screen_func

	self.add_transition(nil, self, event_complete_screen, world_camera)

	slot49 = event_complete_screen_func

	self.add_transition(nil, self, event_complete_screen, empty)

	slot49 = event_complete_screen_func

	self.add_transition(nil, self, event_complete_screen, menu_main)

	slot49 = event_complete_screen_func

	self.add_transition(nil, self, event_complete_screen, ingame_loading)

	slot49 = event_complete_screen_func

	self.add_transition(nil, self, event_complete_screen, ingame_waiting_for_players)

	slot49 = empty_func

	self.add_transition(nil, self, empty, editor)

	slot49 = empty_func

	self.add_transition(nil, self, empty, world_camera)

	slot49 = empty_func

	self.add_transition(nil, self, empty, bootup)

	slot49 = empty_func

	self.add_transition(nil, self, empty, menu_titlescreen)

	slot49 = empty_func

	self.add_transition(nil, self, empty, menu_main)

	slot49 = empty_func

	self.add_transition(nil, self, empty, ingame_standard)

	slot49 = empty_func

	self.add_transition(nil, self, empty, ingame_parachuting)

	slot49 = empty_func

	self.add_transition(nil, self, empty, ingame_freefall)

	slot49 = empty_func

	self.add_transition(nil, self, empty, ingame_bleed_out)

	slot49 = empty_func

	self.add_transition(nil, self, empty, ingame_waiting_for_players)

	slot49 = empty_func

	self.add_transition(nil, self, empty, ingame_waiting_for_respawn)

	slot49 = empty_func

	self.add_transition(nil, self, empty, event_complete_screen)

	slot49 = empty_func

	self.add_transition(nil, self, empty, ingame_loading)

	slot46 = managers.menu
	slot51 = "menu_active_changed_callback"

	managers.menu.add_active_changed_callback(nil, callback(ingame_loading, self, self))

	slot46 = managers.system_menu
	slot51 = "dialog_active_changed_callback"

	managers.system_menu.add_active_changed_callback(nil, callback(ingame_loading, self, self))

	return 
end
function GameStateMachine:init_finilize()
	if managers.hud then
		slot3 = managers.hud
		slot8 = "chatinput_changed_callback"

		managers.hud.add_chatinput_changed_callback(slot2, callback(slot5, self, self))
	end

	return 
end
function GameStateMachine:set_boot_intro_done(is_boot_intro_done)
	Global.game_state_machine.is_boot_intro_done = is_boot_intro_done
	self._is_boot_intro_done = is_boot_intro_done

	return 
end
function GameStateMachine:is_boot_intro_done()
	return self._is_boot_intro_done
end
function GameStateMachine:set_boot_from_sign_out(is_boot_from_sign_out)
	Global.game_state_machine.is_boot_from_sign_out = is_boot_from_sign_out

	return 
end
function GameStateMachine:is_boot_from_sign_out()
	return self._is_boot_from_sign_out
end
function GameStateMachine:menu_active_changed_callback(active)
	slot5 = not active

	self._set_controller_enabled(slot3, self)

	return 
end
function GameStateMachine:dialog_active_changed_callback(active)
	slot5 = not active

	self._set_controller_enabled(slot3, self)

	return 
end
function GameStateMachine:chatinput_changed_callback(active)
	slot5 = not active

	self._set_controller_enabled(slot3, self)

	return 
end
function GameStateMachine:is_controller_enabled()
	return 0 < self._controller_enabled_count
end
function GameStateMachine:_set_controller_enabled(enabled)
	slot4 = self
	local was_enabled = self.is_controller_enabled(slot3)
	local old_controller_enabled_count = self._controller_enabled_count

	if enabled then
		self._controller_enabled_count = self._controller_enabled_count + 1
	else
		self._controller_enabled_count = self._controller_enabled_count - 1
	end

	slot7 = self

	if not was_enabled ~= not self.is_controller_enabled(slot6) then
		slot6 = self
		local state = self.current_state(slot5)

		if state then
			slot8 = enabled

			state.set_controller_enabled(slot6, state)
		else
			self._controller_enabled_count = old_controller_enabled_count
		end
	else
		self._controller_enabled_count = old_controller_enabled_count
	end

	return 
end

return 
