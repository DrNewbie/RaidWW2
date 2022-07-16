local TihsModItemUnit = DoctorBagSimpleBase.UnitName
local TihsModItemUnitIds = Idstring(TihsModItemUnit)

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

local function __PutDownMyEquipment()
	if not __Is_Ready_to_Use() then
		return
	end
	local gro = managers.groupai:state()
	if not gro then
		return
	end
	local ply_unit = managers.player:player_unit()
	if not ply_unit or not alive(ply_unit) then
		return
	end
	local PlyStandard = ply_unit:movement() and ply_unit:movement()._states.standard
	if not PlyStandard then
		return
	end
	if type(_G.MedicBagUsedTimes) ~= "number" or _G.MedicBagUsedTimes <= 0 then
		return
	end
	if ply_unit:movement():current_state():in_air() then
		return
	end
	local pos = ply_unit:movement():m_pos()
	local rot = ply_unit:movement():m_head_rot()
	rot = Rotation(rot:yaw(), 0, 0)
	local Ans = DoctorBagSimpleBase.spawn(pos, rot)
	if Ans then
		_G.MedicBagUsedTimes = _G.MedicBagUsedTimes - 1
	end
end

__PutDownMyEquipment()