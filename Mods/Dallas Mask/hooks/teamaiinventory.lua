function TeamAIInventory:set_mask_visibility(state)
	self._mask_visibility = state
	if self._unit == managers.player:player_unit() or not alive(self._unit) then
		return
	end
	if alive(self._mask_unit) then
		if not state then
			for _, linked_unit in ipairs(self._mask_unit:children()) do
				linked_unit:unlink()
				World:delete_unit(linked_unit)
			end
			self._mask_unit:unlink()
			local name = self._mask_unit:name()
			World:delete_unit(self._mask_unit)
		end
		return
	end
	if not state then
		return
	end
	local mask_unit_name = self._mask_unit_name
	if type(mask_unit_name) ~= "string" or not DB:has("unit", mask_unit_name) or not managers.dyn_resource:is_resource_ready(Idstring("unit"), mask_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE) then
		return
	end
	local mask_align = self._unit:get_object(Idstring("Head"))
	local mask_unit = World:spawn_unit(Idstring(mask_unit_name), mask_align:position(), mask_align:rotation())
	self._unit:link(mask_align:name(), mask_unit)
	self._mask_unit = mask_unit
end

function TeamAIInventory:_reset_mask_visibility()
	self:set_mask_visibility(true)
end

function TeamAIInventory:clbk_mask_unit_loaded(status, asset_type, asset_name)
	self._mask_unit_loaded = status
	self:_reset_mask_visibility()
end

function TeamAIInventory:preload_mask()
	local mask_unit_name = "units/payday2/masks/msk_dallas/msk_dallas"
	self._mask_unit_name = mask_unit_name
	managers.dyn_resource:load(Idstring("unit"), Idstring(mask_unit_name), managers.dyn_resource.DYN_RESOURCES_PACKAGE, callback(self, self, "clbk_mask_unit_loaded"))
end

local old1 = TeamAIInventory.set_mask_visibility
local old2 = TeamAIInventory._reset_mask_visibility
local old3 = TeamAIInventory.clbk_mask_unit_loaded
local old4 = TeamAIInventory.preload_mask
local old5 = TeamAIInventory.init

function TeamAIInventory:set_mask_visibility(...)
	pcall(old1, self, ...)
end

function TeamAIInventory:_reset_mask_visibility(...)
	pcall(old2, self, ...)
end

function TeamAIInventory:clbk_mask_unit_loaded(...)
	pcall(old3, self, ...)
end

function TeamAIInventory:preload_mask(...)
	pcall(old4, self, ...)
end

function TeamAIInventory:init(...)
	pcall(old5, self, ...)
	self:preload_mask()
end