-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreRumbleManager"

core.module(slot1, core)

RumbleManager = RumbleManager or class()
function RumbleManager:init()
	self._last_played_ids = {}
	self._preset_rumbles = {}
	self._rumbling_controller_types = {}
	slot3 = self

	self.initialize_controller_types(slot2)

	self._registered_controllers = {}
	self._registered_controller_count = {}
	self._registered_controller_pos_callback_list = {}
	self._enabled = true

	return 
end
function RumbleManager:add_preset_rumbles(name, data)
	self._preset_rumbles[name] = data

	return 
end
function RumbleManager:initialize_controller_types()
	self._rumbling_controller_types.xbox360 = true
	self._rumbling_controller_types.ps3 = true
	self._rumbling_controller_types.ps4 = true
	self._rumbling_controller_types.xb1 = true

	return 
end
function RumbleManager:stop(rumble_id)
	if rumble_id then
		if rumble_id == "all" then
			slot4 = self._registered_controllers

			for _, controller in pairs(slot3) do
				if controller then
					slot9 = controller

					controller.stop_rumble(slot8)
				end
			end
		else
			slot4 = rumble_id.controllers

			for _, controller in pairs(slot3) do
				slot10 = rumble_id[1]

				controller.stop_rumble(slot8, controller)

				if rumble_id[2] then
					slot10 = rumble_id[2]

					controller.stop_rumble(slot8, controller)
				end
			end
		end
	end

	return 
end
function RumbleManager:register_controller(controller, pos_callback)
	if self._rumbling_controller_types[controller.TYPE] then
		local ctrl = controller.get_controller(slot4)
		slot6 = ctrl
		local key = ctrl.key(controller)
		self._registered_controllers[key] = ctrl
		self._registered_controller_count[key] = (self._registered_controller_count[key] or 0) + 1
		self._registered_controller_pos_callback_list[key] = self._registered_controller_pos_callback_list[key] or {}
		self._registered_controller_pos_callback_list[key][pos_callback] = true

		return true
	end

	return 
end
function RumbleManager:unregister_controller(controller, pos_callback)
	local ctrl = controller.get_controller(slot4)
	slot6 = ctrl
	local key = ctrl.key(controller)
	self._registered_controller_count[key] = (self._registered_controller_count[key] or 0) - 1

	if self._registered_controller_count[key] <= 0 then
		self._registered_controllers[key] = nil
		self._registered_controller_count[key] = nil
	end

	if self._registered_controller_pos_callback_list[key] then
		self._registered_controller_pos_callback_list[key][pos_callback] = nil
		slot7 = self._registered_controller_pos_callback_list[key]

		if not next(nil) then
			self._registered_controller_pos_callback_list[key] = nil
		end
	end

	return 
end
function RumbleManager:set_enabled(enabled)
	self._enabled = enabled

	if not enabled then
		slot5 = "all"

		self.stop(slot3, self)
	end

	return 
end
function RumbleManager:enabled()
	return self._enabled
end
function RumbleManager:play(name, controller_wrapper, multiplier_data, custom_data)
	if not self._enabled then
		return false
	end

	local rumble_controllers = nil

	if not controller_wrapper then
		rumble_controllers = self._registered_controllers
	elseif self._rumbling_controller_types[controller_wrapper.TYPE] then
		local ctrl = controller_wrapper.get_controller(slot7)
		slot9 = ctrl
		rumble_controllers[ctrl.key(controller_wrapper)] = ctrl
	end

	local effect = self._preset_rumbles[name]

	if effect then
		local rumble_id = {
			controllers = rumble_controllers,
			name = name
		}
		local custom_peak = custom_data and custom_data.peak
		local custom_attack = custom_data and custom_data.attack
		local custom_sustain = custom_data and custom_data.sustain
		local custom_release = custom_data and custom_data.release
		slot14 = rumble_controllers

		for _, controller in pairs(slot13) do
			slot20 = controller

			if self._last_played_ids[controller.key(slot19)] then
				slot20 = controller
				local redundant_rumble = self._last_played_ids[controller.key(slot19)][name]

				if redundant_rumble then
					slot21 = redundant_rumble[1]
				end
			end

			multiplier = multiplier_data or 1

			if not effect.timer then
				slot20 = TimerManager
				local timer = TimerManager.game(slot19)
			end

			if multiplier_data then
				slot21 = multiplier_data

				if type(slot20) == "table" and multiplier_data.func then
					slot24 = controller
					slot22 = multiplier_data.params
					multiplier = multiplier_data.func(slot20, self._registered_controller_pos_callback_list[controller.key(slot23)]) or 1
				end
			end

			if effect.engine == "hybrid" then
				slot22 = 1
				slot26 = {
					engine = "left",
					timer = timer,
					peak = (effect.peak.l or 1) * multiplier,
					attack = effect.attack.l,
					sustain = effect.sustain.l,
					release = effect.release.l
				}

				table.insert(slot20, rumble_id, controller.rumble(slot24, controller))

				slot22 = 2
				slot26 = {
					engine = "right",
					timer = timer,
					peak = (effect.peak.r or 1) * multiplier,
					attack = effect.attack.r,
					sustain = effect.sustain.r,
					release = effect.release.r
				}

				table.insert(slot20, rumble_id, controller.rumble(slot24, controller))
			else
				slot22 = {
					engine = effect.engine,
					timer = timer,
					peak = (custom_peak or effect.peak or 1) * multiplier,
					attack = custom_attack or effect.attack,
					sustain = custom_sustain or effect.sustain,
					release = custom_release or effect.release
				}
				rumble_id[1] = controller.rumble(slot20, controller)
			end

			if not effect.cumulative then
				slot22 = controller
				slot24 = controller
				self._last_played_ids[controller.key(slot21)] = self._last_played_ids[controller.key(slot23)] or {}
				slot22 = controller
				self._last_played_ids[controller.key(self._last_played_ids[controller.key(slot23)] or )][name] = rumble_id
			end
		end

		return rumble_id
	else
		slot12 = " not found."

		Application.error(slot8, Application, "RumbleManager:: Effect ", name)
	end

	return 
end
function RumbleManager:set_multiplier(rumble_id, multiplier)
	if not self._enabled or not rumble_id or not multiplier then
		return false
	end

	local effect = self._preset_rumbles[rumble_id.name]
	slot6 = rumble_id.controllers

	for _, controller in pairs(slot5) do
		if rumble_id[2] then
			slot13 = (effect.peak.l or 1) * multiplier

			controller.set_rumble_peak(slot10, controller, rumble_id[1])

			slot13 = (effect.peak.r or 1) * multiplier

			controller.set_rumble_peak(slot10, controller, rumble_id[2])
		else
			slot13 = (effect.peak or 1) * multiplier

			controller.set_rumble_peak(slot10, controller, rumble_id[1])
		end
	end

	return 
end
function RumbleManager:mult_distance_lerp(pos_func_list, params)
	if pos_func_list then
		local closest_pos = nil
		slot6 = pos_func_list

		for pos_func in pairs(slot5) do

			-- Decompilation error in this vicinity:
			slot10 = params
			local next_closest_pos = pos_func(slot9)
		end

		if closest_pos then
			local full_dis = params.full_dis or 0
			local zero_dis = params.zero_dis or 1000 - full_dis
			local mult = params.multiplier or 1
			local source = params.source
			slot12 = source - closest_pos
			slot12 = zero_dis
			mult = (mult * (zero_dis - math.clamp(slot9, source - closest_pos.length(slot11) - full_dis, 0))) / zero_dis

			return mult
		end
	end

	return 0
end

return 
