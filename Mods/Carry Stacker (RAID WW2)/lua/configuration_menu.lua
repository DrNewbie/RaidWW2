_G.BLT_CarryStacker = _G.BLT_CarryStacker or {}
BLT_CarryStacker._path = ModPath
BLT_CarryStacker.settings = {}

function BLT_CarryStacker:getMovementPenalties()
	return self.settings.movement_penalties
end

function BLT_CarryStacker:setMovementPenalty(carry_type, penalty)
	if not self.settings.movement_penalties[carry_type] then
		return
	end
	self.movement_penalties_server[carry_type] = penalty
end

function BLT_CarryStacker:getCompleteTable()
	local tbl = {}
	for i, v in pairs(BLT_CarryStacker.settings.movement_penalties) do
		tbl[i] = v
	end
	tbl["toggle_host"] = BLT_CarryStacker.settings["toggle_host"]
	return tbl
end

function BLT_CarryStacker:ResetWeights()
	self.settings.movement_penalties = {
		["light"] = 10,
		["coke_light"] = 10,
		["medium"] = 20,
		["heavy"] = 30,
		["very_heavy"] = 40,
		["mega_heavy"] = 50,

		["being"] = 30,
		["slightly_very_heavy"] = 30
	}
	self.settings["toggle_host"] = true
	self.movement_penalties_server = {}
end

function BLT_CarryStacker:getWeightForType(carry_id)
	local carry_type = tweak_data.carry[carry_id].type
	if LuaNetworking:IsMultiplayer() and not LuaNetworking:IsHost() and BLT_CarryStacker:IsRemoteHostSyncEnabled() then
		return self.movement_penalties_server[carry_type] ~= nil and ((100 - self.movement_penalties_server[carry_type]) / 100) or 1
	end
	return self.settings.movement_penalties[carry_type] ~= nil and ((100 - self.settings.movement_penalties[carry_type]) / 100) or 1
end

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_BLT_CarryStacker", function(menu_manager)
	BLT_CarryStacker:ResetWeights()
end)
