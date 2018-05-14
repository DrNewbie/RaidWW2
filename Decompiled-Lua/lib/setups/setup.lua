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
slot3 = "lib/managers/PlatformManager"

core.register_module(slot1, core)

slot3 = "lib/managers/SystemMenuManager"

core.register_module(slot1, core)

slot3 = "lib/managers/UserManager"

core.register_module(slot1, core)

slot3 = "lib/managers/SequenceManager"

core.register_module(slot1, core)

slot3 = "lib/managers/ControllerManager"

core.register_module(slot1, core)

slot3 = "lib/managers/SlotManager"

core.register_module(slot1, core)

slot3 = "lib/managers/DebugManager"

core.register_module(slot1, core)

slot3 = "lib/utils/game_state_machine/GameState"

core.register_module(slot1, core)

slot3 = "lib/utils/dev/FreeFlight"

core.register_module(slot1, core)

slot3 = Application
Global.DEBUG_MENU_ON = Application.debug_enabled(core)
Global.DEFAULT_DIFFICULTY = "difficulty_2"
Global.DEFAULT_PERMISSION = "public"
Global.STREAM_ALL_PACKAGES = false
slot3 = "CoreSetup"

core.import(false, core)
require(false)

slot3 = DLCManager
slot1 = DLCManager.new("lib/managers/DLCManager")
managers.dlc = slot1
slot2 = "lib/tweak_data/TweakData"

require(slot1)

slot2 = "lib/utils/Utl"

require(slot1)

slot2 = "lib/utils/MessageSystem"

require(slot1)

slot2 = "lib/utils/CoroutineManager"

require(slot1)

slot2 = "lib/utils/EventListenerHolder"

require(slot1)

slot2 = "lib/utils/QueuedEventListenerHolder"

require(slot1)

slot2 = "lib/utils/Easing"

require(slot1)

slot2 = "lib/utils/UIAnimation"

require(slot1)

slot2 = "lib/utils/TemporaryPropertyManager"

require(slot1)

slot2 = "lib/managers/UpgradesManager"

require(slot1)

slot2 = "lib/managers/GoldEconomyManager"

require(slot1)

slot2 = "lib/managers/RaidExperienceManager"

require(slot1)

slot2 = "lib/managers/PlayerManager"

require(slot1)

slot2 = "lib/managers/SavefileManager"

require(slot1)

slot2 = "lib/managers/MenuManager"

require(slot1)

slot2 = "lib/managers/AchievmentManager"

require(slot1)

slot2 = "lib/managers/SkillTreeManager"

require(slot1)

slot2 = "lib/managers/DynamicResourceManager"

require(slot1)

slot2 = "lib/managers/VehicleManager"

require(slot1)

slot2 = "lib/managers/FireManager"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuSceneManager"

require(slot1)

slot2 = "lib/managers/CharacterCustomizationManager"

require(slot1)

slot2 = "lib/units/BuffEffect"

require(slot1)

slot2 = "lib/managers/BuffEffectManager"

require(slot1)

slot2 = "lib/managers/ChallengeCardsManager"

require(slot1)

slot2 = "lib/managers/ConsumableMissionManager"

require(slot1)

slot2 = "lib/managers/GreedManager"

require(slot1)

slot2 = "lib/managers/EventSystemManager"

require(slot1)

slot2 = "lib/managers/ProgressionManager"

require(slot1)

slot2 = "lib/managers/WeaponSkillsManager"

require(slot1)

slot2 = "lib/managers/QueuedTasksManager"

require(slot1)

slot2 = "lib/managers/WarcryManager"

require(slot1)

slot2 = "lib/managers/warcries/Warcry"

require(slot1)

slot2 = "lib/managers/warcries/WarcryBerserk"

require(slot1)

slot2 = "lib/managers/warcries/WarcryClustertruck"

require(slot1)

slot2 = "lib/managers/warcries/WarcryGhost"

require(slot1)

slot2 = "lib/managers/warcries/WarcrySharpshooter"

require(slot1)

slot2 = "lib/managers/WeaponInventoryManager"

require(slot1)

slot2 = "lib/utils/PlayerSkill"

require(slot1)

slot3 = "PlatformManager"

core.import(slot1, core)

slot3 = "SystemMenuManager"

core.import(slot1, core)

slot3 = "UserManager"

core.import(slot1, core)

slot3 = "ControllerManager"

core.import(slot1, core)

slot3 = "SlotManager"

core.import(slot1, core)

slot3 = "FreeFlight"

core.import(slot1, core)

slot3 = "CoreGuiDataManager"

core.import(slot1, core)

slot2 = "lib/managers/ControllerWrapper"

require(slot1)

slot2 = "lib/utils/game_state_machine/GameStateMachine"

require(slot1)

slot2 = "lib/utils/LightLoadingScreenGuiScript"

require(slot1)

slot2 = "lib/managers/LocalizationManager"

require(slot1)

slot2 = "lib/managers/MousePointerManager"

require(slot1)

slot2 = "lib/managers/VideoManager"

require(slot1)

slot2 = "lib/managers/menu/TextBoxGui"

require(slot1)

slot2 = "lib/managers/menu/BookBoxGui"

require(slot1)

slot2 = "lib/managers/menu/CircleGuiObject"

require(slot1)

slot2 = "lib/managers/menu/ArcGuiObject"

require(slot1)

slot2 = "lib/managers/menu/ProgressBarGuiObject"

require(slot1)

slot2 = "lib/managers/menu/BoxGuiObject"

require(slot1)

slot2 = "lib/managers/menu/ImageBoxGui"

require(slot1)

slot2 = "lib/managers/menu/SpecializationBoxGui"

require(slot1)

slot2 = "lib/managers/menu/MenuBackdropGUI"

require(slot1)

slot2 = "lib/managers/WeaponFactoryManager"

require(slot1)

slot2 = "lib/managers/BlackMarketManager"

require(slot1)

slot2 = "lib/managers/LootDropManager"

require(slot1)

slot2 = "lib/managers/ChatManager"

require(slot1)

slot2 = "lib/managers/LootManager"

require(slot1)

slot2 = "lib/managers/RaidJobManager"

require(slot1)

slot2 = "lib/managers/VoiceBriefingManager"

require(slot1)

slot2 = "lib/managers/VoiceOverManager"

require(slot1)

slot2 = "lib/managers/BreadcrumbManager"

require(slot1)

slot2 = "lib/managers/ChallengeManager"

require(slot1)

slot2 = "lib/managers/challenges/Challenge"

require(slot1)

slot2 = "lib/managers/challenges/ChallengeTasks"

require(slot1)

slot2 = "lib/managers/MusicManager"

require(slot1)

slot2 = "lib/managers/VoteManager"

require(slot1)

slot2 = "lib/managers/UnlockManager"

require(slot1)

slot2 = "lib/units/UnitDamage"

require(slot1)

slot2 = "lib/units/props/TextGui"

require(slot1)

slot2 = "lib/units/props/MaterialControl"

require(slot1)

slot2 = "lib/units/props/AlphaRefControl"

require(slot1)

slot2 = "lib/units/props/TankTrackAnimation"

require(slot1)

slot2 = "lib/units/props/WaypointExt"

require(slot1)

slot2 = "lib/units/props/EscortExt"

require(slot1)

slot2 = "lib/units/props/FoxholeExt"

require(slot1)

slot2 = "lib/managers/hud/HUDLoadingScreen"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIPanel"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControl"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlInputField"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlLabel"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlLabelNamedValue"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlLabelNamedValueWithDelta"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlLabelTitle"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlLabelSubtitle"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlBreadcrumb"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButton"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonSmall"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonShortPrimary"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonShortPrimaryGold"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonShortPrimaryDisabled"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonShortSecondary"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonShortTertiary"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonLongPrimary"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonLongPrimaryDisabled"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonLongSecondary"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonLongTertiary"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonSubtitle"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlImage"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlInfoIcon"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlBackgroundImage"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlThreeCutBitmap"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlImageButton"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlNavigationButton"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlAnimatedBitmap"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemCharacterSelect"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemCharacterSelectButton"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemCharacterCreateClass"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemCharacterCreateNation"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlCharacterDescription"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlClassDescription"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlNationalityDescription"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemIconDescription"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemIcon"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemMenu"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemRaids"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemOperations"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemSaveSlots"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItemWeapons"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListItem"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlList"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlListActive"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlStepper"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlStepperSimple"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlSlider"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlSliderSimple"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonToggle"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonToggleSmall"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlButtonSwitch"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlTableRow"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlTableCell"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlTableCellButton"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlTableCellImage"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlTableCellImageButton"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlTable"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlTabs"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlTab"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlTabFilter"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlRotateUnit"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlProgressBar"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlProgressBarSimple"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlBranchingProgressBar"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlSkilltree"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlBranchingBarNode"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlBranchingBarSkilltreeNode"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlBranchingBarPath"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlBranchingBarLootScreenPath"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlBranchingBarSkilltreePath"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGuiControlKeyBind"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGuiControlDifficultyStars"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlGrid"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlGridActive"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlGridItem"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlGridItemActive"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlPagedGrid"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlScrollGrid"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlPagedGridCharacterCustomization"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlScrollableArea"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlScrollbar"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlLegend"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlVideo"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlGreedBarSmall"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlMissionUnlock"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlCardDetails"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlLootCardDetails"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlLootRewardCards"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlLootBreakdownItem"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlCardPeerLoot"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlCard"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlCardBase"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlCardWithSelector"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlCardSuggested"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlCardSuggestedLarge"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlSuggestedCards"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlSuggestedCardsLarge"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlCharacterCustomizationDetails"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlCharacterCustomizationPeerLoot"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlExperiencePeerLoot"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlGoldBarRewardDetails"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlGoldBarPeerLoot"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlMeleeWeaponPeerLoot"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlPeerRewardCardPack"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlMeleeWeaponRewardDetails"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlWeaponPointPeerLoot"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlWeaponPointRewardDetails"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlXPRewardDetails"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlServerPlayerDescription"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlReadyUpPlayerDescription"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlRewardCardPack"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlXPUnlocks"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlXPBreakdown"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlStatsBreakdown"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlSkillDetails"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlRespec"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlTopStat"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlTopStatBig"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlTopStatSmall"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlWeaponSkills"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlWeaponSkillRow"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlWeaponSkillDesc"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlButtonWeaponSkill"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlXPCell"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlPeerDetails"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlOperationProgress"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlIntelImageGrid"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlIntelImage"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlIntelImageDetails"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlSaveInfo"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlXPProgressBar"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlSkilltreeProgressBar"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlLootProgressBar"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlLootBracket"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/custom/RaidGUIControlKickMuteWidget"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlWeaponStats"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlMeleeWeaponStats"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlGrenadeWeaponStats"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlTabWeaponStats"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlIntelBulletin"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlIntelOperationalStatus"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlIntelRaidPersonel"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlIntelOppositeForces"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlIntelControlArchive"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlImageViewer"

require(slot1)

slot2 = "lib/managers/hud/HUDSaveIcon"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIControlDialogTest"

require(slot1)

slot2 = "lib/utils/StatisticsGenerator"

require(slot1)

script_data = script_data or {}
game_state_machine = game_state_machine or nil

if not Setup then
	slot2 = CoreSetup.CoreSetup
	slot0 = class(slot1)
end

Setup = slot0
function Setup:init_category_print()
	slot3 = self

	CoreSetup.CoreSetup.init_category_print(slot2)

	if Global.category_print_initialized.setup then
		return 
	end

	if not Global.interface_sound then
	end

	local cat_list = {
		"dialog_manager",
		"user_manager",
		"exec_manager",
		"savefile_manager",
		"loading_environment",
		"player_intel",
		"player_damage",
		"player_action",
		"AI_action",
		"bt",
		"dummy_ai",
		"dummy_block_chance",
		"johan",
		"george",
		"qa",
		"bob",
		"jansve",
		"sound_placeholder",
		"spam"
	}
	slot4 = cat_list

	for _, cat in ipairs(slot3) do
		Global.category_print[cat] = false
	end

	catprint_load()

	return 
end
function Setup:set_resource_loaded_clbk(...)
	slot3 = PackageManager

	PackageManager.set_resource_loaded_clbk(slot2, ...)

	return 
end
function Setup:load_packages()

	-- Decompilation error in this vicinity:
	slot4 = "[Setup:load_packages()]"

	Application.debug(slot2, Application)

	slot6 = "unit"

	setup.set_resource_loaded_clbk(slot2, setup, Idstring(slot5))

	slot4 = true

	TextureCache.set_streaming_enabled(slot2, TextureCache)

	slot3 = TextureCache
	slot1 = TextureCache.set_LOD_streaming_enabled
	slot7 = "XB1"
	slot4 = "packages/base"

	if not PackageManager.loaded(slot2, PackageManager) then
		slot4 = "packages/base"

		PackageManager.load(slot2, PackageManager)
	end

	slot4 = "packages/dyn_resources"

	if not PackageManager.loaded(slot2, PackageManager) then
		slot4 = "packages/dyn_resources"

		PackageManager.load(slot2, PackageManager)
	end

	slot4 = "packages/zone_germany"

	if not PackageManager.loaded(slot2, PackageManager) then
		slot4 = "packages/zone_germany"

		PackageManager.load(slot2, PackageManager)
	end

	return 
end
function Setup:init_managers(managers)
	slot2 = Global

	if not Global.game_settings then
		slot3 = {
			drop_in_allowed = true,
			auto_kick = true,
			job_plan = -1,
			team_ai = true,
			search_appropriate_jobs = true,
			kick_option = 1,
			permission = "public",
			is_playing = false,
			reputation_permission = 0,
			selected_team_ai = true,
			level_id = (managers.dlc.is_trial(slot5) and "raid_trial") or "streaming_level",
			difficulty = Global.DEFAULT_DIFFICULTY
		}
		slot6 = managers.dlc
	end

	slot2.game_settings = slot3
	slot4 = managers.dlc

	managers.dlc.setup(slot3)

	slot4 = DynamicResourceManager
	managers.dyn_resource = DynamicResourceManager.new(slot3)
	slot4 = CoreGuiDataManager.GuiDataManager
	managers.gui_data = CoreGuiDataManager.GuiDataManager.new(slot3)
	slot4 = PlatformManager.PlatformManager
	managers.platform = PlatformManager.PlatformManager.new(slot3)
	slot4 = MusicManager
	managers.music = MusicManager.new(slot3)
	slot4 = SystemMenuManager.SystemMenuManager
	managers.system_menu = SystemMenuManager.SystemMenuManager.new(slot3)
	slot4 = AchievmentManager
	managers.achievment = AchievmentManager.new(slot3)
	slot4 = SavefileManager
	managers.savefile = SavefileManager.new(slot3)
	slot4 = UserManager.UserManager
	managers.user = UserManager.UserManager.new(slot3)
	slot4 = UpgradesManager
	managers.upgrades = UpgradesManager.new(slot3)
	slot4 = RaidExperienceManager
	managers.experience = RaidExperienceManager.new(slot3)
	slot4 = GoldEconomyManager
	managers.gold_economy = GoldEconomyManager.new(slot3)
	slot4 = SkillTreeManager
	managers.skilltree = SkillTreeManager.new(slot3)
	slot4 = PlayerManager
	managers.player = PlayerManager.new(slot3)
	slot4 = VideoManager
	managers.video = VideoManager.new(slot3)
	slot5 = self.IS_START_MENU
	managers.menu = MenuManager.new(slot3, MenuManager)
	slot4 = RaidMenuSceneManager
	managers.raid_menu = RaidMenuSceneManager.new(slot3)
	slot4 = managers.subtitle
	slot9 = 22

	managers.subtitle.set_presenter(slot3, CoreSubtitlePresenter.OverlayPresenter.new(slot6, CoreSubtitlePresenter.OverlayPresenter, tweak_data.gui.fonts.din_compressed_outlined_22))

	slot4 = MousePointerManager
	managers.mouse_pointer = MousePointerManager.new(slot3)
	slot4 = WeaponFactoryManager
	managers.weapon_factory = WeaponFactoryManager.new(slot3)
	slot4 = BlackMarketManager
	managers.blackmarket = BlackMarketManager.new(slot3)
	slot4 = LootDropManager
	managers.lootdrop = LootDropManager.new(slot3)
	slot4 = ChatManager
	managers.chat = ChatManager.new(slot3)
	slot4 = MenuComponentManager
	managers.menu_component = MenuComponentManager.new(slot3)
	slot4 = LootManager
	managers.loot = LootManager.new(slot3)
	managers.raid_job = RaidJobManager.get_instance()
	slot4 = VoiceBriefingManager
	managers.briefing = VoiceBriefingManager.new(slot3)
	slot4 = VoiceOverManager
	managers.voice_over = VoiceOverManager.new(slot3)
	managers.breadcrumb = BreadcrumbManager.get_instance()
	managers.challenge = ChallengeManager.get_instance()
	managers.greed = GreedManager.get_instance()
	managers.event_system = EventSystemManager.get_instance()
	slot4 = VoteManager
	managers.vote = VoteManager.new(slot3)
	slot4 = VehicleManager
	managers.vehicle = VehicleManager.new(slot3)
	slot4 = FireManager
	managers.fire = FireManager.new(slot3)
	slot4 = CharacterCustomizationManager
	managers.character_customization = CharacterCustomizationManager.new(slot3)
	slot4 = BuffEffectManager
	managers.buff_effect = BuffEffectManager.new(slot3)
	slot4 = ChallengeCardsManager
	managers.challenge_cards = ChallengeCardsManager.new(slot3)
	slot4 = ConsumableMissionManager
	managers.consumable_missions = ConsumableMissionManager.new(slot3)
	slot4 = WeaponSkillsManager
	managers.weapon_skills = WeaponSkillsManager.new(slot3)
	slot4 = QueuedTasksManager
	managers.queued_tasks = QueuedTasksManager.new(slot3)
	managers.warcry = WarcryManager.get_instance()
	managers.weapon_inventory = WeaponInventoryManager.get_instance()
	managers.progression = ProgressionManager.get_instance()
	managers.unlock = UnlockManager.get_instance()
	slot4 = GameStateMachine
	game_state_machine = GameStateMachine.new(slot3)

	return 
end
function Setup:start_boot_loading_screen()
	slot4 = "packages/boot_screen"

	if not PackageManager.loaded(slot2, PackageManager) then
		slot4 = "packages/boot_screen"

		PackageManager.load(slot2, PackageManager)
	end

	slot3 = self

	self._start_loading_screen(slot2)

	return 
end
function Setup:start_loading_screen()
	slot3 = self

	self._start_loading_screen(slot2)

	return 
end
function Setup:stop_loading_screen()
	slot4 = "[Setup:stop_loading_screen()]"

	Application.debug(slot2, Application)

	if Global.is_loading then
		slot4 = "[LoadingEnvironment] Stop."

		Application.debug(slot2, Application)

		slot4 = false

		self.set_main_thread_loading_screen_visible(slot2, self)

		Global.is_loading = nil
	else
		slot4 = "[LoadingEnvironment] Tried to stop loading screen when it wasn't started."

		Application.stack_dump_error(slot2, Application)
	end

	return 
end
function Setup:_start_loading_screen()
	slot4 = "[Setup:_start_loading_screen()]"

	Application.debug(slot2, Application)

	slot3 = Application

	Application.stack_dump(slot2)

	if Global.is_loading then
		slot4 = "[LoadingEnvironment] Tried to start loading screen when it was already started."

		Application.stack_dump_error(slot2, Application)

		return 
	else
		slot3 = SystemInfo

		if not SystemInfo.threaded_renderer(slot2) then
			slot4 = "[LoadingEnvironment] Skipped (renderer is not threaded)."

			cat_print(slot2, "loading_environment")

			Global.is_loading = true

			return 
		end
	end

	slot4 = "[LoadingEnvironment] Start."

	cat_print(slot2, "loading_environment")

	local setup = nil
	slot4 = LoadingEnvironmentScene

	if not LoadingEnvironmentScene.loaded("loading_environment") then
		slot6 = false

		LoadingEnvironmentScene.load(slot3, LoadingEnvironmentScene, "levels/zone")
	end

	local load_level_data = nil

	if Global.load_level then
		slot6 = "packages/load_level"

		if not PackageManager.loaded(slot4, PackageManager) then
			slot6 = "packages/load_level"

			PackageManager.load(slot4, PackageManager)
		end

		local using_steam_controller = false
		setup = "lib/setups/LevelLoadingSetup"
		load_level_data = {
			level_data = Global.level_data,
			level_tweak_data = tweak_data.levels[Global.level_data.level_id] or {}
		}
		slot4 = load_level_data.level_tweak_data

		if load_level_data.level_tweak_data.name_id then
			slot8 = load_level_data.level_tweak_data.name_id
			slot5 = managers.localization.text(slot6, managers.localization)
		end

		slot4.name = slot5
		load_level_data.gui_tweak_data = tweak_data.load_level
		load_level_data.menu_tweak_data = tweak_data.menu
		load_level_data.scale_tweak_data = tweak_data.scale
		slot6 = tweak_data.tips
		load_level_data.tip_id = tweak_data.tips.get_a_tip(slot5)

		if using_steam_controller then
		else
			slot6 = tweak_data
			local coords = tweak_data.get_controller_help_coords(slot5)

			if coords then
				slot7 = {
					"normal",
					"vehicle"
				}
				slot5 = coords[table.random(slot6)]
			end

			load_level_data.controller_coords = slot5
			load_level_data.controller_image = "guis/textures/controller"
			load_level_data.controller_shapes = {
				{
					position = {
						cy = 0.5,
						cx = 0.5
					},
					texture_rect = {
						0,
						0,
						512,
						256
					}
				}
			}
		end

		if load_level_data.controller_coords then
			slot6 = load_level_data.controller_coords

			for id, data in pairs(slot5) do

				-- Decompilation error in this vicinity:
				if data.localize ~= false or not data.id then
					slot12 = data.id
					slot9 = managers.localization.to_upper_text(slot10, managers.localization)
				end

				data.string = slot9
				slot13 = 0.5
				data.color = Color(slot10, 0.5, 0.5) or Color.white
			end
		end

		local load_data = load_level_data.level_tweak_data.load_data
		local safe_rect_pixels = managers.viewport.get_safe_rect_pixels(slot6)
		local safe_rect = managers.viewport.get_safe_rect(managers.viewport)
		slot9 = managers.viewport
		local aspect_ratio = managers.viewport.aspect_ratio(managers.viewport)
		local res = RenderSettings.resolution
		load_level_data.gui_data = {
			safe_rect_pixels = safe_rect_pixels,
			safe_rect = safe_rect,
			aspect_ratio = aspect_ratio,
			res = res,
			workspace_size = {
				x = 0,
				y = 0,
				w = res.x,
				h = res.y
			},
			saferect_size = {
				x = safe_rect.x,
				y = safe_rect.y,
				w = safe_rect.width,
				h = safe_rect.height
			},
			bg_texture = (load_data and load_data.image) or "ui/loading_screens/loading_flak"
		}
	elseif not Global.boot_loading_environment_done then
		setup = "lib/setups/LightLoadingSetup"
	else
		setup = "lib/setups/HeavyLoadingSetup"
	end

	local data = {
		res = RenderSettings.resolution,
		layer = tweak_data.gui.LOADING_SCREEN_LAYER,
		load_level_data = load_level_data
	}
	slot7 = "WIN32"
	data.is_win32 = SystemInfo.platform(slot5) == Idstring(SystemInfo)
	Global.is_loading = true

	return 
end
function Setup:_setup_loading_environment()
	local env_map = {}
	slot8 = 5500
	slot8 = 400
	slot8 = 0
	slot8 = 0
	slot8 = 0
	slot8 = 0
	slot8 = 1
	slot8 = 0
	slot8 = 0
	env_map.deferred = {
		shadow = {
			shadow_slice_depths = Vector3(slot5, 800, 1600),
			shadow_slice_overlap = Vector3(slot5, 150, 300),
			slice0 = Vector3(slot5, 0, 800),
			slice1 = Vector3(slot5, 650, 1600),
			slice2 = Vector3(slot5, 1300, 5500),
			slice3 = Vector3(slot5, 5100, 17500)
		},
		apply_ambient = {
			ambient_falloff_scale = 0,
			effect_light_scale = 1,
			ambient_color_scale = 0.31999999284744,
			ambient_scale = 1,
			ambient_color = Vector3(slot5, 1, 1),
			sky_top_color = Vector3(slot5, 0, 0),
			sky_bottom_color = Vector3(slot5, 0, 0)
		}
	}
	slot8 = 0
	slot8 = 0
	slot8 = 0
	slot8 = 0
	slot8 = 5500
	slot8 = 400
	env_map.shadow_processor = {
		shadow_modifier = {
			slice0 = Vector3(slot5, 0, 800),
			slice1 = Vector3(slot5, 650, 1600),
			slice2 = Vector3(slot5, 1300, 5500),
			slice3 = Vector3(slot5, 5100, 17500),
			shadow_slice_depths = Vector3(slot5, 800, 1600),
			shadow_slice_overlap = Vector3(slot5, 150, 300)
		}
	}
	local dummy_vp = Application.create_world_viewport(, Application, 0, 0, 1)
	slot5 = LoadingEnvironment
	slot7 = Idstring(1)
	slot10 = "empty"

	LoadingEnvironment.viewport(Application).set_post_processor_effect(Application, LoadingEnvironment.viewport(Application), "World", Idstring("dof_prepare_post_processor"))

	slot5 = LoadingEnvironment
	slot7 = Idstring(Idstring)
	slot10 = "bloom_combine_empty"

	LoadingEnvironment.viewport(Application).set_post_processor_effect(Application, LoadingEnvironment.viewport(Application), "World", Idstring("bloom_combine_post_processor"))

	slot6 = dummy_vp

	Application.destroy_viewport(Application, Application)

	return 
end
function Setup:init_game()
	if not Global.initialized then
		Global.level_data = {}
		Global.initialized = true
	end

	self._end_frame_clbks = {}
	local scene_gui = Overlay.gui(slot2)
	slot12 = "WIN32"
	slot9 = SystemInfo.platform(slot10) == Idstring(SystemInfo)
	self._main_thread_loading_screen_gui_script = LightLoadingScreenGuiScript.new(Overlay, LightLoadingScreenGuiScript, scene_gui, RenderSettings.resolution, -1, tweak_data.gui.LOADING_SCREEN_LAYER)
	self._main_thread_loading_screen_gui_visible = true

	return game_state_machine
end
function Setup:init_finalize()
	slot3 = self

	Setup.super.init_finalize(slot2)

	slot3 = game_state_machine

	game_state_machine.init_finilize(slot2)

	slot3 = managers.dlc

	managers.dlc.init_finalize(slot2)

	slot3 = managers.achievment

	managers.achievment.init_finalize(slot2)

	slot3 = managers.system_menu

	managers.system_menu.init_finalize(slot2)

	slot3 = managers.controller

	managers.controller.init_finalize(slot2)

	slot3 = Application

	if Application.editor(slot2) then
		slot3 = managers.user

		managers.user.init_finalize(slot2)
	end

	slot3 = managers.blackmarket

	managers.blackmarket.init_finalize(slot2)

	slot4 = "WIN32"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot5 = 0

		AnimationManager.set_anim_cache_size(slot2, AnimationManager, 10485760)
	end

	slot5 = self.on_tweak_data_reloaded

	tweak_data.add_reload_callback(slot2, tweak_data, self)

	return 
end
function Setup:update(t, dt)
	slot5 = TimerManager
	local main_t = TimerManager.main(slot4).time(slot4)
	slot6 = TimerManager
	local main_dt = TimerManager.main(TimerManager.main(slot4)).delta_time(TimerManager.main(slot4))
	slot9 = dt

	managers.weapon_factory.update(TimerManager.main(TimerManager.main(slot4)), managers.weapon_factory, t)

	slot9 = dt

	managers.platform.update(TimerManager.main(TimerManager.main(slot4)), managers.platform, t)

	slot9 = dt

	managers.user.update(TimerManager.main(TimerManager.main(slot4)), managers.user, t)

	slot7 = managers.dyn_resource

	managers.dyn_resource.update(TimerManager.main(TimerManager.main(slot4)))

	slot9 = main_dt

	managers.system_menu.update(TimerManager.main(TimerManager.main(slot4)), managers.system_menu, main_t)

	slot9 = dt

	managers.savefile.update(TimerManager.main(TimerManager.main(slot4)), managers.savefile, t)

	slot9 = main_dt

	managers.menu.update(TimerManager.main(TimerManager.main(slot4)), managers.menu, main_t)

	slot9 = dt

	managers.player.update(TimerManager.main(TimerManager.main(slot4)), managers.player, t)

	slot9 = dt

	managers.blackmarket.update(TimerManager.main(TimerManager.main(slot4)), managers.blackmarket, t)

	slot9 = dt

	managers.vote.update(TimerManager.main(TimerManager.main(slot4)), managers.vote, t)

	slot9 = dt

	managers.vehicle.update(TimerManager.main(TimerManager.main(slot4)), managers.vehicle, t)

	slot9 = dt

	managers.warcry.update(TimerManager.main(TimerManager.main(slot4)), managers.warcry, t)

	slot9 = dt

	managers.progression.update(TimerManager.main(TimerManager.main(slot4)), managers.progression, t)

	slot9 = dt

	managers.video.update(TimerManager.main(TimerManager.main(slot4)), managers.video, t)

	slot9 = dt

	game_state_machine.update(TimerManager.main(TimerManager.main(slot4)), game_state_machine, t)

	slot9 = dt

	managers.challenge_cards.update(TimerManager.main(TimerManager.main(slot4)), managers.challenge_cards, t)

	if self._main_thread_loading_screen_gui_visible then
		slot9 = dt

		self._main_thread_loading_screen_gui_script.update(slot6, self._main_thread_loading_screen_gui_script, -1)
	end

	return 
end
function Setup:paused_update(t, dt)
	slot7 = dt

	managers.platform.paused_update(slot4, managers.platform, t)

	slot7 = dt

	managers.user.paused_update(slot4, managers.user, t)

	slot5 = managers.dyn_resource

	managers.dyn_resource.update(slot4)

	slot7 = dt

	managers.system_menu.paused_update(slot4, managers.system_menu, t)

	slot7 = dt

	managers.savefile.paused_update(slot4, managers.savefile, t)

	slot7 = dt

	managers.menu.update(slot4, managers.menu, t)

	slot7 = dt

	managers.blackmarket.update(slot4, managers.blackmarket, t)

	slot7 = dt

	game_state_machine.paused_update(slot4, game_state_machine, t)

	return 
end
function Setup:end_update(t, dt)
	slot7 = dt

	game_state_machine.end_update(slot4, game_state_machine, t)

	while 0 < #self._end_frame_clbks do
		slot6 = 1


		-- Decompilation error in this vicinity:
		table.remove(slot4, self._end_frame_clbks)()
	end

	return 
end
function Setup:paused_end_update(t, dt)
	slot7 = dt

	game_state_machine.end_update(slot4, game_state_machine, t)

	while 0 < #self._end_frame_clbks do
		slot6 = 1


		-- Decompilation error in this vicinity:
		table.remove(slot4, self._end_frame_clbks)()
	end

	return 
end
function Setup:end_frame(t, dt)
	while self._end_frame_callbacks and 0 < #self._end_frame_callbacks do
		slot5 = self._end_frame_callbacks


		-- Decompilation error in this vicinity:
		table.remove(slot4)()
	end

	slot5 = self

	self._upd_unload_packages(slot4)

	return 
end
function Setup:add_end_frame_callback(callback)
	self._end_frame_callbacks = self._end_frame_callbacks or {}
	slot5 = callback

	table.insert(slot3, self._end_frame_callbacks)

	return 
end
function Setup:add_end_frame_clbk(func)
	slot5 = func

	table.insert(slot3, self._end_frame_clbks)

	return 
end
function Setup:on_tweak_data_reloaded()
	slot3 = managers.dlc

	managers.dlc.on_tweak_data_reloaded(slot2)

	slot3 = managers.voice_over

	managers.voice_over.on_tweak_data_reloaded(slot2)

	return 
end
function Setup:destroy()
	slot3 = managers.system_menu

	managers.system_menu.destroy(slot2)

	slot3 = managers.menu

	managers.menu.destroy(slot2)

	if self._main_thread_loading_screen_gui_script then
		slot3 = self._main_thread_loading_screen_gui_script

		self._main_thread_loading_screen_gui_script.destroy(slot2)

		self._main_thread_loading_screen_gui_script = nil
	end

	return 
end
function Setup:load_level(level, mission, world_setting, level_class_name, level_id)
	slot8 = managers.menu

	managers.menu.close_all_menus(slot7)

	slot8 = managers.platform

	managers.platform.destroy_context(slot7)

	Global.load_level = true
	Global.load_start_menu = false
	Global.load_start_menu_lobby = false
	Global.level_data.level = level
	Global.level_data.mission = mission
	Global.level_data.world_setting = world_setting
	Global.level_data.level_class_name = level_class_name
	Global.level_data.level_id = level_id
	slot9 = level

	self.exec(false, self)

	return 
end
function Setup:load_start_menu_lobby()
	slot3 = self

	self.load_start_menu(slot2)

	Global.load_start_menu_lobby = true

	return 
end
function Setup:load_start_menu(save_progress)
	slot5 = "[Setup:load_start_menu()]"

	Application.trace(slot3, Application)

	slot5 = false

	managers.platform.set_playing(slot3, managers.platform)

	slot4 = managers.raid_job

	managers.raid_job.deactivate_current_job(slot3)

	slot4 = managers.menu

	managers.menu.close_all_menus(slot3)

	slot4 = managers.mission

	managers.mission.pre_destroy(slot3)

	slot4 = managers.platform

	managers.platform.destroy_context(slot3)

	Global.load_level = false
	Global.load_start_menu = true
	Global.load_start_menu_lobby = false
	Global.level_data.level = nil
	Global.level_data.mission = nil
	Global.level_data.world_setting = nil
	Global.level_data.level_class_name = nil
	Global.level_data.level_id = nil

	if save_progress then
		Global.savefile_manager.setting_changed = true
		slot5 = true

		managers.savefile.save_setting(true, managers.savefile)

		slot4 = managers.savefile

		managers.savefile.save_progress(true)
	end

	slot5 = nil

	self.exec(slot3, self)

	return 
end
function Setup:exec(context)
	if managers.network then
		slot5 = "PS4"

		if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
			function slot6()
				return 
			end

			PSN.set_matchmaking_callback(slot3, PSN, "session_destroyed")
		end

		slot4 = "SETTING BLACK LOADING SCREEN"

		print(slot3)

		self._black_loading_screen = true

		if Network.set_loading_state then
			slot5 = true

			Network.set_loading_state(slot3, Network)
		end
	end

	slot5 = "WIN32"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		slot5 = 30

		self.set_fps_cap(slot3, self)
	end

	slot4 = managers.music

	managers.music.stop(slot3)

	slot4 = managers.vote

	managers.vote.stop(slot3)

	slot4 = SoundDevice

	SoundDevice.stop(slot3)

	slot4 = managers.system_menu

	if not managers.system_menu.is_active(slot3) then
		slot5 = true

		self.set_main_thread_loading_screen_visible(slot3, self)
	end

	slot5 = context

	CoreSetup.CoreSetup.exec(slot3, self)

	return 
end
function Setup:quit()
	slot3 = self

	CoreSetup.CoreSetup.quit(slot2)

	slot3 = managers.system_menu

	if not managers.system_menu.is_active(slot2) then
		slot4 = true

		self.set_main_thread_loading_screen_visible(slot2, self)

		slot4 = "Exiting"

		self._main_thread_loading_screen_gui_script.set_text(slot2, self._main_thread_loading_screen_gui_script)
	end

	return 
end
function Setup:return_to_camp_client()
	slot3 = Network

	if Network.is_client(slot2) then
		slot4 = "ingame_standard"

		game_state_machine.change_state_by_name(slot2, game_state_machine)

		slot3 = managers.hud

		managers.hud.set_disabled(slot2)

		slot4 = {
			quit = true
		}

		managers.statistics.stop_session(slot2, managers.statistics)

		slot3 = managers.raid_job

		managers.raid_job.deactivate_current_job(slot2)

		slot3 = managers.raid_job

		managers.raid_job.cleanup(slot2)

		slot3 = managers.queued_tasks

		managers.queued_tasks.unqueue_all(slot2)

		slot3 = managers.lootdrop

		managers.lootdrop.reset_loot_value_counters(slot2)

		slot4 = false

		managers.consumable_missions.on_level_exited(slot2, managers.consumable_missions)

		slot4 = false

		managers.greed.on_level_exited(slot2, managers.greed)

		slot3 = managers.network
		slot4 = "set_peer_left"

		managers.network.session(slot2).send_to_peers(slot2, managers.network.session(slot2))

		slot3 = managers.network

		managers.network.stop_network(slot2)

		slot3 = managers.network.matchmake

		managers.network.matchmake.destroy_game(slot2)

		slot3 = managers.network.voice_chat

		managers.network.voice_chat.destroy_voice(slot2)

		slot3 = managers.network

		managers.network.host_game(slot2)

		slot3 = managers.network
		slot8 = Global.game_settings.level_id

		managers.network.session(slot2).load_level(slot2, managers.network.session(slot2), Global.level_data.level, nil, nil, nil)
	end

	return 
end
function Setup:quit_to_main_menu()
	slot4 = "ingame_standard"

	game_state_machine.change_state_by_name(slot2, game_state_machine)

	slot4 = false

	managers.platform.set_playing(slot2, managers.platform)

	slot4 = {
		quit = true
	}

	managers.statistics.stop_session(slot2, managers.statistics)

	slot3 = managers.raid_job

	managers.raid_job.deactivate_current_job(slot2)

	slot3 = managers.raid_job

	managers.raid_job.cleanup(slot2)

	slot3 = managers.lootdrop

	managers.lootdrop.reset_loot_value_counters(slot2)

	slot4 = false

	managers.consumable_missions.on_level_exited(slot2, managers.consumable_missions)

	slot4 = false

	managers.greed.on_level_exited(slot2, managers.greed)

	slot3 = managers.worldcollection

	managers.worldcollection.on_simulation_ended(slot2)

	slot3 = managers.queued_tasks

	managers.queued_tasks.unqueue_all(slot2)

	slot3 = Network

	if Network.multiplayer(slot2) then
		slot4 = false

		Network.set_multiplayer(slot2, Network)

		slot3 = managers.network
		slot4 = "set_peer_left"

		managers.network.session(slot2).send_to_peers(slot2, managers.network.session(slot2))

		slot3 = managers.network

		managers.network.queue_stop_network(slot2)
	end

	slot3 = managers.network.matchmake

	managers.network.matchmake.destroy_game(slot2)

	slot3 = managers.network.voice_chat

	managers.network.voice_chat.destroy_voice(slot2)

	if managers.groupai then
		slot3 = managers.groupai
		slot4 = false

		managers.groupai.state(slot2).set_AI_enabled(slot2, managers.groupai.state(slot2))
	end

	if setup.exit_to_main_menu then
		setup.exit_to_main_menu = false
		slot4 = "menu_exit"

		managers.menu.post_event(false, managers.menu)

		slot4 = "menu_pause"

		managers.menu.close_menu(false, managers.menu)

		slot4 = true

		setup.load_start_menu(false, setup)
	end

	return 
end
function Setup:restart()
	local data = Global.level_data

	if data.level then
		slot8 = data.level_class_name

		self.load_level(slot3, self, data.level, data.mission, data.world_setting)
	else
		slot4 = self

		self.load_start_menu(slot3)
	end

	return 
end
function Setup:block_exec()
	if not self._main_thread_loading_screen_gui_visible then
		slot4 = true

		self.set_main_thread_loading_screen_visible(slot2, self)

		return true
	end

	local result = false

	if self._packages_to_unload then
		slot4 = "BLOCKED BY UNLOADING PACKAGES"

		print(slot3)

		result = true
	elseif not self._packages_to_unload_gathered then
		self._packages_to_unload_gathered = true
		slot4 = self

		self.gather_packages_to_unload(slot3)

		result = true
	end

	if managers.worldcollection then
		slot4 = managers.worldcollection

		if managers.worldcollection.has_queued_unloads(slot3) then
			slot4 = "BLOCKED BY WORLD IN WORLD UNLOADING PACKAGES"

			print(slot3)

			result = true
		end
	end

	slot4 = managers.network

	if not managers.network.is_ready_to_load(slot3) then
		slot4 = "BLOCKED BY STOPPING NETWORK"

		print(slot3)

		result = true
	end

	slot4 = managers.dyn_resource

	if not managers.dyn_resource.is_ready_to_close(slot3) then
		if not self._blocked_by_msg then
			slot4 = "BLOCKED BY DYNAMIC RESOURCE MANAGER"

			print(slot3)

			self._blocked_by_msg = true
		end

		result = true
	end

	slot4 = managers.system_menu

	if managers.system_menu.block_exec(slot3) then
		result = true
	end

	slot4 = managers.savefile

	if managers.savefile.is_active(slot3) then
		result = true
	end

	return result
end
function Setup:block_quit()
	slot3 = self

	return self.block_exec(slot2)
end
function Setup:set_main_thread_loading_screen_visible(visible)
	if not self._main_thread_loading_screen_gui_visible ~= not visible then
		slot8 = visible
		slot5 = "[LoadingEnvironment] Main thread loading screen visible: " .. tostring(slot7)

		cat_print(slot3, "loading_environment")

		slot6 = RenderSettings.resolution

		self._main_thread_loading_screen_gui_script.set_visible(slot3, self._main_thread_loading_screen_gui_script, visible)

		self._main_thread_loading_screen_gui_visible = visible
	end

	return 
end
function Setup:set_fps_cap(value)
	if not self._framerate_low then
		slot5 = value

		Application.cap_framerate(slot3, Application)
	end

	return 
end
function Setup:_unload_pkg_with_init(pkg)
	slot6 = pkg

	Application.debug(slot3, Application, "[Setup:_unload_pkg_with_init] Unloading...")

	local init_pkg = pkg .. "_init"
	slot6 = init_pkg

	if PackageManager.loaded(Application, PackageManager) then
		slot6 = init_pkg

		PackageManager.unload(slot4, PackageManager)
	end

	slot6 = pkg

	if PackageManager.loaded(slot4, PackageManager) then
		slot6 = pkg

		PackageManager.unload(slot4, PackageManager)
	end

	return 
end
function Setup:_upd_unload_packages()
	if self._packages_to_unload then
		slot3 = self._packages_to_unload
		local package_name = table.remove(slot2)

		if package_name then
			slot5 = package_name

			PackageManager.unload(slot3, PackageManager)
		end

		slot4 = self._packages_to_unload

		if not next(slot3) then
			self._packages_to_unload = nil
		end
	end

	if Global.package_ref_counter then
		slot3 = Global.package_ref_counter

		for package, count in pairs(slot2) do
			if count == 0 or Global.unload_all_level_packages then
				slot9 = package

				if PackageManager.loaded(slot7, PackageManager) then
					slot10 = package

					Application.debug(slot7, Application, "[Setup:_upd_unload_packages()] Unloading package:")

					slot9 = package

					PackageManager.unload(slot7, PackageManager)
				end

				Global.package_ref_counter[package] = nil
			end
		end

		if Global.unload_all_level_packages then
			Global.unload_all_level_packages = false
		end
	end

	if self._unload_async_camp then
		self._unload_async_camp = false

		if Global.STREAM_ALL_PACKAGES then
			slot3 = self

			self.unload_camp_packages(slot2)
		end
	end

	return 
end
function Setup:is_unloading()
	return self._started_unloading_packages and true
end

return 
