local ModPath = ModPath
local TweakDataList = {
	["lib/tweak_data/achievementtweakdata"] = "AchievementTweakData",
	["lib/tweak_data/attentiontweakdata"] = "AttentionTweakData",
	["lib/tweak_data/barragetweakdata"] = "BarrageTweakData",
	["lib/tweak_data/blackmarket/colorstweakdata"] = "ColorsTweakData",
	["lib/tweak_data/blackmarket/maskstweakdata"] = "MasksTweakData",
	["lib/tweak_data/blackmarket/materialstweakdata"] = "MaterialsTweakData",
	["lib/tweak_data/blackmarket/meleeweaponstweakdata"] = "MeleeWeaponsTweakData",
	["lib/tweak_data/blackmarket/texturestweakdata"] = "TexturesTweakData",
	["lib/tweak_data/blackmarket/weaponskinstweakdata"] = "WeaponSkinsTweakData",
	["lib/tweak_data/blackmarkettweakdata"] = "BlackmarketTweakData",
	["lib/tweak_data/campcustomizationtweakdata"] = "CampCustomizationTweakData",
	["lib/tweak_data/carrytweakdata"] = "CarryTweakData",
	["lib/tweak_data/challengecardstweakdata"] = "ChallengeCardsTweakData",
	["lib/tweak_data/challengetweakdata"] = "ChallengeTweakData",
	["lib/tweak_data/charactercustomizationtweakdata"] = "CharacterCustomizationTweakData",
	["lib/tweak_data/charactertweakdata"] = "CharacterTweakData",
	["lib/tweak_data/commwheeltweakdata"] = "CommWheelTweakData",
	["lib/tweak_data/dlctweakdata"] = "DLCTweakData",
	["lib/tweak_data/dramatweakdata"] = "DramaTweakData",
	["lib/tweak_data/droploottweakdata"] = "DropLootTweakData",
	["lib/tweak_data/equipmentstweakdata"] = "EquipmentsTweakData",
	["lib/tweak_data/greedtweakdata"] = "GreedTweakData",
	["lib/tweak_data/group_ai/groupairaidtweakdata"] = "GroupAIRaidTweakData",
	["lib/tweak_data/groupaitweakdata"] = "GroupAITweakData",
	["lib/tweak_data/guitweakdata"] = "GuiTweakData",
	["lib/tweak_data/hudiconstweakdata"] = "HudIconsTweakData",
	["lib/tweak_data/inputtweakdata"] = "InputTweakData",
	["lib/tweak_data/inteltweakdata"] = "IntelTweakData",
	["lib/tweak_data/interactiontweakdata"] = "InteractionTweakData",
	["lib/tweak_data/levelstweakdata"] = "LevelsTweakData",
	["lib/tweak_data/lootdroptweakdata"] = "LootDropTweakData",
	["lib/tweak_data/mountedweapontweakdata"] = "MountedWeaponTweakData",
	["lib/tweak_data/operationstweakdata"] = "OperationsTweakData",
	["lib/tweak_data/playertweakdata"] = "PlayerTweakData",
	["lib/tweak_data/projectilestweakdata"] = "ProjectilesTweakData",
	["lib/tweak_data/skilltreetweakdata"] = "SkillTreeTweakData",
	["lib/tweak_data/soundtweakdata"] = "SoundTweakData",
	["lib/tweak_data/statisticstweakdata"] = "StatisticsTweakData",
	["lib/tweak_data/subtitlestweakdata"] = "SubtitlesTweakData",
	["lib/tweak_data/timespeedeffecttweakdata"] = "TimeSpeedEffectTweakData",
	["lib/tweak_data/tipstweakdata"] = "TipsTweakData",
	["lib/tweak_data/tweakdata"] = "TweakData",
	["lib/tweak_data/upgradestweakdata"] = "UpgradesTweakData",
	["lib/tweak_data/vehicletweakdata"] = "VehicleTweakData",
	["lib/tweak_data/warcrytweakdata"] = "WarcryTweakData",
	["lib/tweak_data/weaponfactorytweakdata"] = "WeaponFactoryTweakData",
	["lib/tweak_data/weaponinventorytweakdata"] = "WeaponInventoryTweakData",
	["lib/tweak_data/weaponskillstweakdata"] = "WeaponSkillsTweakData",
	["lib/tweak_data/weapontweakdata"] = "WeaponTweakData"
}
local lower_name_list = {
	["ColorsTweakData"] = "colors",
	["MasksTweakData"] = "masks",
	["MaterialsTweakData"] = "materials",
	["MeleeWeaponsTweakData"] = "melee_weapons",
	["TexturesTweakData"] = "textures",
	["WeaponSkinsTweakData"] = "weapon_skins"
}
local _modtxt = io.open(ModPath..'mod.txt', "w+")
_modtxt:write('{ \n')
_modtxt:write('	"name" : "Tweak Dump", \n')
_modtxt:write('	"description" : " ", \n')
_modtxt:write('	"author" : "Dr_Newbie", \n')
_modtxt:write('	"contact" : " ", \n')
_modtxt:write('	"blt_version" : 2, \n')
_modtxt:write('	"undisablable" : false, \n')
_modtxt:write('	"disable_safe_mode" : false, \n')
_modtxt:write('	"version" : "1", \n')
_modtxt:write('	"hooks" : [ \n')
for path_name, data_name in pairs(TweakDataList) do
	local _file = io.open(ModPath..('Hooks/'..data_name..'.lua'), "w+")
	_file:write('local ModPath = ModPath \n')
	if lower_name_list[data_name] then
		_file:write('Hooks:PostHook(BlackMarketTweakData, "_init_'..lower_name_list[data_name]..'", "'..data_name..'_Init", function(self, ...) \n')
		_file:write('	local _file = io.open(ModPath.."Output/'..data_name..'.json", "w+") \n')
		_file:write('	_file:write(tostring(json.encode(self.'..lower_name_list[data_name]..'))) \n')
		_file:write('	_file:close() \n')
		_file:write('end) \n')
	elseif data_name == "BlackmarketTweakData" then
		_file:write('Hooks:PostHook(BlackMarketTweakData, "init", "PostHookBlackMarketTweakData", function(self) \n')
		_file:write('	local _file = io.open(ModPath.."Output/'..data_name..'.json", "w+") \n')
		_file:write('	_file:write(tostring(json.encode(self))) \n')
		_file:write('	_file:close() \n')
		_file:write('end) \n')
	else
		_file:write('Hooks:PostHook('..data_name..', "init", "'..data_name..'_Init", function(self) \n')
		_file:write('	local _file = io.open(ModPath.."Output/'..data_name..'.json", "w+") \n')
		_file:write('	_file:write(tostring(json.encode(self))) \n')
		_file:write('	_file:close() \n')
		_file:write('end) \n')
	end
	_modtxt:write('		{ \n')
	_modtxt:write('			"hook_id": "'..path_name..'", \n')
	_modtxt:write('			"script_path": "Hooks/'..data_name..'.lua" \n')
	_modtxt:write('		}, \n')
end
_modtxt:write('		{ \n')
_modtxt:write('			"hook_id": "lib/managers/localizationmanager", \n')
_modtxt:write('			"script_path": "Base.lua" \n')
_modtxt:write('		} \n')
_modtxt:write('	] \n')
_modtxt:write('} \n')
_modtxt:close()