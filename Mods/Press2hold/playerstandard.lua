PlayerStandard.INTERACTION_LOCK_SETTINGS = {
	default = true
}
PlayerStandard.EQUIPMENT_PRESS_INTERRUPT = true
PlayerStandard.VISUAL_LOCK = false

local _check_action_interact_original = PlayerStandard._check_action_interact
local _start_action_interact_original = PlayerStandard._start_action_interact
local _update_interaction_timers_original = PlayerStandard._update_interaction_timers

function PlayerStandard:_check_action_interact(t, input, ...)
	self:_check_interaction_input(input)
	return _check_action_interact_original(self, t, input, ...)
end

function PlayerStandard:_start_action_interact(t, ...)
	_start_action_interact_original(self, t, ...)
	self:_check_interaction_locked_data(t)
end

function PlayerStandard:_update_interaction_timers(t, ...)
	self:_check_interaction_locked(t)
	return _update_interaction_timers_original(self, t, ...)
end
	
function PlayerStandard:_check_interaction_input(input)
	if self._interact_params and self._interact_params.locked then
		if input[PlayerStandard.EQUIPMENT_PRESS_INTERRUPT and "btn_use_item_press" or "btn_interact_press"] then
			input.btn_interact_press = nil
			input.btn_interact_release = true
		elseif input.btn_interact_release then
			input.btn_interact_release = nil
		end
	end
end

function PlayerStandard:_check_interaction_locked_data(t)
	local locked = false
	local lock_data = PlayerStandard.INTERACTION_LOCK_SETTINGS.default
	
	if PlayerStandard.INTERACTION_LOCK_SETTINGS[self._interact_params.tweak_data] ~= nil then
		lock_data = PlayerStandard.INTERACTION_LOCK_SETTINGS[self._interact_params.tweak_data]
	end
	
	if lock_data ~= false then
		local lock_delay = type(lock_data) == "number" and lock_data or 0
		self._interact_params.lock_t = t + lock_delay
		locked = lock_delay <= 0
	end
	
	self:_set_interaction_locked(locked)
end

function PlayerStandard:_check_interaction_locked(t)
	if self._interact_params and self._interact_params.lock_t and not self._interact_params.locked then
		if t >= self._interact_params.lock_t then
			self:_set_interaction_locked(true)
		end
	end
end

function PlayerStandard:_set_interaction_locked(status)
	self._interact_params.locked = status
	
	if PlayerStandard.VISUAL_LOCK then
		managers.hud:set_interaction_locked(status)
	end
end