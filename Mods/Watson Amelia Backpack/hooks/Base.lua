local ThisModPath = ModPath
local ThisModIds = Idstring(ThisModPath):key()
local __Name = function(__id)
	return "BBHIC_"..Idstring(tostring(__id).."::"..ThisModIds):key()
end

local BoxUnit = __Name("BoxUnit")
_G[BoxUnit] = _G[BoxUnit] or {}

local LoadThoseAssets = {
	{"unit", "units/jfr_props/wpn_fps_upg_charm_watson"},
	{"model", "units/jfr_props/wpn_fps_upg_charm_watson"},
	{"object", "units/jfr_props/wpn_fps_upg_charm_watson"},
	{"cooked_physics", "units/jfr_props/wpn_fps_upg_charm_watson"},
	{"material_config", "units/jfr_props/wpn_fps_upg_charm_watson"},
	{"material_config", "units/jfr_props/wpn_fps_upg_charm_watson_cc_thq"},
	{"material_config", "units/jfr_props/wpn_fps_upg_charm_watson_thq"},
	{"texture", "units/jfr_props/watson_df"},
	{"texture", "units/jfr_props/watson_nm"}
}
local ThisModAssetsPath = ThisModPath.."assets/"
for _, __d in pairs(LoadThoseAssets) do
	if io.file_is_readable(ThisModAssetsPath..__d[2].."."..__d[1]) then
		DB:create_entry(Idstring(__d[1]), Idstring(__d[2]), ThisModAssetsPath..__d[2].."."..__d[1])
	end
end
local TihsModItemUnit = "units/jfr_props/wpn_fps_upg_charm_watson"
local TihsModItemUnitIds = Idstring("units/jfr_props/wpn_fps_upg_charm_watson")

local function __Is_Ready_to_Use()
	if DB:has("unit", TihsModItemUnit) then
		if not managers.dyn_resource:is_resource_ready(Idstring("unit"), TihsModItemUnitIds, managers.dyn_resource.DYN_RESOURCES_PACKAGE) then
			managers.dyn_resource:load(Idstring("unit"), TihsModItemUnitIds, managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)
		else
			return true
		end
	end
	return false
end

local function __Delete_Box(u_key)
	_G[BoxUnit] = _G[BoxUnit] or {}
	if u_key then
		if _G[BoxUnit][u_key] and alive(_G[BoxUnit][u_key]) then
			_G[BoxUnit][u_key]:unlink()
			World:delete_unit(_G[BoxUnit][u_key])
		end
		_G[BoxUnit][u_key] = nil
	else
		for __k, _ in pairs(_G[BoxUnit]) do
			if _G[BoxUnit][__k] and alive(_G[BoxUnit][__k]) then
				World:delete_unit(_G[BoxUnit][__k])
			end
			_G[BoxUnit][__k] = nil
		end
	end
	return
end

local function __Spawn_and_Link_to_User(parent_unit, weapon_unit)
	if not __Is_Ready_to_Use() then
		return
	end
	if type(parent_unit) ~= "userdata" or type(weapon_unit) ~= "userdata" then
		return
	end
	if not alive(parent_unit) or not alive(weapon_unit) or not type(weapon_unit.base) == "function" or not weapon_unit:base() then
		return
	end
	local parent_obj_name = Idstring("Neck")
	local parent_obj = parent_unit:get_object(parent_obj_name)
	if not parent_obj then
		return
	end
	local s_unit = World:spawn_unit(TihsModItemUnitIds, parent_unit:position())
	if s_unit then
		__Delete_Box(parent_unit:key())
		local __pos_fix = function(__p_obj, __p_obj_rot)
			return __p_obj:position() - __p_obj_rot:x() * 0 - __p_obj_rot:y() * 30 - __p_obj_rot:z() * 40
		end
		local __rot_fix = function(__p_obj, __p_obj_rot)
			local __rot = Rotation(-__p_obj_rot:x(), -__p_obj_rot:z())
			return __rot
		end
		parent_unit:link(parent_obj_name, s_unit)
		local parent_obj_rot = parent_obj:rotation()
		local world_pos = __pos_fix(parent_obj, parent_obj_rot)
		local world_rot = __rot_fix(parent_obj, parent_obj_rot)
		s_unit:set_position(world_pos)
		s_unit:set_rotation(world_rot)
		local p_key = parent_unit:key()
		_G[BoxUnit][parent_unit:key()] = s_unit
		if type(parent_unit.base) == "function" and parent_unit:base() then
			if type(parent_unit:base().pre_destroy) == "function" then
				local old_destory = parent_unit:base().pre_destroy
				parent_unit:base().pre_destroy = function(...)
					if _G[BoxUnit][p_key] and alive(_G[BoxUnit][p_key]) then
						_G[BoxUnit][p_key]:unlink()
						World:delete_unit(_G[BoxUnit][p_key])
					end
					_G[BoxUnit][p_key] = nil
					old_destory(...)
				end
			elseif type(parent_unit:base().destroy) == "function" then
				local old_destory = parent_unit:base().destroy
				parent_unit:base().destroy = function(...)
					if _G[BoxUnit][p_key] and alive(_G[BoxUnit][p_key]) then
						_G[BoxUnit][p_key]:unlink()
						World:delete_unit(_G[BoxUnit][p_key])
					end
					_G[BoxUnit][p_key] = nil
					old_destory(...)
				end
			end
		end
		return s_unit
	end
	return
end

local __dt = __Name("update::dt")

if TeamAIMovement and string.lower(tostring(RequiredScript)) == "lib/units/player_team/teamaimovement" then
	Hooks:PostHook(TeamAIMovement, "update", __Name("TeamAIMovement:update"), function(self)
		self[__dt] = self[__dt] or 0
		if TimerManager:game():time() > self[__dt] then
			self[__dt] = TimerManager:game():time() + 10
			__Spawn_and_Link_to_User(self._unit, self._unit:inventory():equipped_unit())
		end
	end)
	Hooks:PreHook(TeamAIMovement, "pre_destroy", __Name("TeamAIMovement:pre_destroy"), function(self)
		__Delete_Box(self._unit)
	end)
end

if HuskTeamAIMovement and string.lower(tostring(RequiredScript)) == "lib/units/player_team/huskteamaimovement" then
	Hooks:PostHook(HuskTeamAIMovement, "update", __Name("HuskTeamAIMovement:update"), function(self)
		self[__dt] = self[__dt] or 0
		if TimerManager:game():time() > self[__dt] then
			self[__dt] = TimerManager:game():time() + 10
			__Spawn_and_Link_to_User(self._unit, self._unit:inventory():equipped_unit())
		end
	end)
	Hooks:PreHook(HuskTeamAIMovement, "pre_destroy", __Name("HuskTeamAIMovement:pre_destroy"), function(self)
		__Delete_Box(self._unit)
	end)
end