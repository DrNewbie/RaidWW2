-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
FeedBackManager = FeedBackManager or class()
function FeedBackManager:init()
	self._effect_types = {
		rumble = FeedBackrumble,
		camera_shake = FeedBackCameraShake,
		above_camera_effect = FeedBackAboveCameraEffect
	}
	slot3 = self

	self.setup_preset_effects(FeedBackAboveCameraEffect)

	self._feedback_map = {}

	return 
end
function FeedBackManager:setup_preset_effects()
	self._feedback = {
		mission_triggered = {}
	}
	self._feedback.mission_triggered.camera_shake = {
		name = "mission_triggered"
	}
	self._feedback.mission_triggered.rumble = {
		name = "mission_triggered"
	}
	self._feedback.mission_triggered.above_camera_effect = {
		effect = "none"
	}

	return 
end
function FeedBackManager:get_effect_names()
	local names = {}
	slot4 = self._feedback

	for name, _ in pairs(slot3) do
		slot10 = name

		table.insert(slot8, names)
	end

	return names
end
function FeedBackManager:create(feedback, ...)
	local extra_params = {
		...
	}
	slot7 = self._feedback[feedback]
	local f = FeedBack.new(slot4, FeedBack, feedback)

	if not f then
		slot10 = feedback
		slot7 = "no effect called " .. tostring(slot9)

		Application.stack_dump_error(slot5, Application)

		return nil
	end

	for i = 1, #extra_params, 2 do
		if extra_params[i] and extra_params[i + 1] and f["set_" .. extra_params[i]] then
			slot11 = extra_params[i + 1]

			f["set_" .. extra_params[i]](extra_params[i], f)
		else
			slot14 = extra_params[i]
			slot16 = extra_params[i + 1]
			slot11 = "bad params to create_feedback " .. tostring(slot13) .. " " .. tostring(slot15)

			Application.stack_dump_error(slot9, Application)
		end
	end

	return f
end
function FeedBackManager:reload(feedback)
	slot4 = self

	self.setup_preset_effects(slot3)

	return 
end
function FeedBackManager:get_effect_table(name)
	return self._feedback[name]
end
function FeedBackManager:stop_all(name)
	slot5 = "all"

	managers.rumble.stop(slot3, managers.rumble)

	return 
end
FeedBack = FeedBack or class()
function FeedBack:init(effect_name, effect_table)
	self._name = effect_name
	self._feedback = {}
	slot5 = effect_table

	for name, param in pairs(slot4) do
		slot12 = self._name
		self._feedback[name] = managers.feedback._effect_types[name].new(slot10, managers.feedback._effect_types[name])
	end

	return 
end
function FeedBack:set_enabled(feedback_type, enabled)
	if self._feedback[feedback_type] then
		slot6 = enabled

		self._feedback[feedback_type].set_enabled(slot4, self._feedback[feedback_type])
	end

	return 
end
function FeedBack:is_enabled(feedback_type)
	local effect = self._feedback[feedback_type]

	if effect then
		slot5 = effect
		slot3 = effect.is_enabled(slot4)
	end

	return slot3
end
function FeedBack:set_unit(unit, effect)
	if not effect then
		slot5 = self._feedback

		for _, effect in pairs(slot4) do
			slot11 = unit

			effect.set_unit(slot9, effect)
		end
	elseif self._feedback[effect] then
		slot6 = unit

		self._feedback[effect].set_unit(slot4, self._feedback[effect])
	end

	return 
end
function FeedBack:set_viewport(vp, effect)
	if effect then
		slot6 = vp

		self._feedback[effect].set_viewport(slot4, self._feedback[effect])
	else
		slot5 = self._feedback

		for _, effect in pairs(slot4) do
			slot11 = vp

			effect.set_viewport(slot9, effect)
		end
	end

	return 
end
function FeedBack:set_param(effect, param_name, value)
	if self._feedback[effect] then
		slot8 = value

		self._feedback[effect].set_param(slot5, self._feedback[effect], param_name)
	end

	return 
end
function FeedBack:reset_params(effect)
	if self._feedback[effect] then
		slot4 = self._feedback[effect]

		self._feedback[effect].reset_params(slot3)
	end

	return 
end
function FeedBack:extra_params(effect)
	return self._extra_params[effect]
end
function FeedBack:play(...)
	local extra_params = {
		...
	}
	self._extra_params = {}

	for i = 1, #extra_params, 3 do
		if extra_params[i] and extra_params[i + 1] and extra_params[i + 2] and self._feedback[extra_params[i]] then
			self._extra_params[extra_params[i]] = self._extra_params[extra_params[i]] or {}
			self._extra_params[extra_params[i]][extra_params[i + 1]] = extra_params[i + 2]
		end
	end

	slot7 = self._name

	for name in pairs(managers.feedback.get_effect_table(slot5, managers.feedback)) do
		local effect = self._feedback[name]
		slot9 = effect

		if effect.is_enabled(slot8) then
			if effect then
				slot10 = self._extra_params[name]

				effect.play(slot8, effect)
			else
				slot11 = self._name
				self._feedback[name] = managers.feedback._effect_types[name].new(slot9, managers.feedback._effect_types[name])
			end
		end
	end

	for i = 1, #extra_params, 3 do
		if extra_params[i] and extra_params[i + 1] and extra_params[i + 2] and self._feedback[extra_params[i]] then
			slot8 = self._feedback[extra_params[i]]
		else
			local msg = ""

			if not self._feedback[extra_params[i]] then
				slot10 = extra_params[i]
				msg = "no effect called " .. tostring(slot9)
			end
		end
	end

	return 
end
function FeedBack:stop(effect, ...)
	local extra_params = {
		...
	}

	for i = 1, #extra_params, 2 do
		if extra_params[i] and extra_params[i + 1] and f["set_" .. extra_params[i]] then
			slot10 = extra_params[i + 1]

			f["set_" .. extra_params[i]]("set_" .. extra_params[i], f)
		else
			slot13 = extra_params[i]
			slot15 = extra_params[i + 1]
			slot10 = "bad params to create_feedback " .. tostring(slot12) .. " " .. tostring(slot14)

			Application.stack_dump_error(slot8, Application)
		end
	end

	if not effect then
		slot5 = self._feedback

		for name, effect in pairs(slot4) do
			slot10 = effect

			effect.stop(slot9)
		end
	else
		slot5 = self._feedback[effect]

		self._feedback[effect].stop(slot4)
	end

	return 
end
function FeedBack:is_playing(effect)
	if not effect then
		slot4 = self._feedback

		for name, effect in pairs(slot3) do
			slot9 = effect

			if effect.is_playing(slot8) then
				return true
			end
		end

		return false
	else
		slot4 = self._feedback[effect]

		return self._feedback[effect].is_playing(slot3)
	end

	return 
end
FeedBackEffect = FeedBackEffect or class()
function FeedBackEffect:init(name)
	self._params = {}
	self._name = name
	self._enabled = true

	return 
end
function FeedBackEffect:set_enabled(enabled)
	if not self._enabled ~= not enabled then
		if self._enabled then
			slot4 = self

			self.stop(slot3)
		end

		self._enabled = enabled
	end

	return 
end
function FeedBackEffect:is_enabled()
	return self._enabled
end
function FeedBackEffect:set_unit(unit)
	return 
end
function FeedBackEffect:set_viewport(vp)
	return 
end
function FeedBackEffect:set_static_param(name, value)
	self._params[name] = value

	return 
end
function FeedBackEffect:set_param(name, value)
	self._params[name] = value

	return 
end
function FeedBackEffect:reset_params()
	self._params = {}

	return 
end
function FeedBackEffect:play()
	slot4 = self._name
	local params = managers.feedback.get_effect_table(slot2, managers.feedback)[self._type]
	slot6 = self._params

	mixin(managers.feedback, params, params)

	return params
end
function FeedBackEffect:stop()
	return 
end
function FeedBackEffect:is_playing()
	return false
end

if not FeedBackrumble then
	slot2 = FeedBackEffect
	slot0 = class(slot1)
end

FeedBackrumble = slot0
function FeedBackrumble:init(name)
	slot5 = name

	FeedBackEffect.init(slot3, self)

	self._type = "rumble"

	return 
end
function FeedBackrumble:set_unit(unit)
	self._unit = unit

	return 
end
function FeedBackrumble:set_param(name, value)
	if name == "multiplier_data" and self._id then
		slot7 = value

		managers.rumble.set_multiplier(slot4, managers.rumble, self._id)
	end

	return 
end
function FeedBackrumble:play(extra_params)
	slot4 = self
	local params = FeedBackEffect.play(slot3)

	if self._unit then
		slot9 = extra_params
		self._id = managers.rumble.play(slot4, managers.rumble, params.name, nil, params.multiplier_data)
	elseif not self._unit then
		slot6 = "no unit set to rumble in feedbackRumble use either set_unit or send unit at create"

		Application.stack_dump_error(slot4, Application)
	end

	return 
end
function FeedBackrumble:stop()
	slot4 = self._id

	managers.rumble.stop(slot2, managers.rumble)

	self._id = nil

	return 
end
function FeedBackrumble:is_playing()
	local rumble = nil

	if not self._id then
		return false
	end

	slot4 = self._id.controllers

	for _, controller in pairs(slot3) do
		slot10 = self._id[1]
		rumble = controller.is_rumble_playing(slot8, controller)

		if self._id[2] and not rumble then
			slot10 = self._id[2]
			rumble = controller.is_rumble_playing(slot8, controller)
		end

		if rumble then
			return rumble
		end
	end

	return rumble
end

if not FeedBackCameraShake then
	slot2 = FeedBackEffect
	slot0 = class(slot1)
end

FeedBackCameraShake = slot0
function FeedBackCameraShake:init(name)
	slot5 = name

	FeedBackEffect.init(slot3, self)

	self._type = "camera_shake"

	return 
end
function FeedBackEffect:set_viewport(vp)
	slot4 = vp
	slot4 = vp.director(slot3)
	self._camera = vp.director(slot3).shaker(slot3)
	self._playing_camera = self._camera

	return 
end
function FeedBackEffect:set_unit(unit)
	slot4 = unit
	self._unit_camera = unit.camera(slot3)

	return 
end
function FeedBackCameraShake:set_param(name, value)
	if name == "multiplier" then
		return 
	end

	if name == "name" then
		return 
	end

	if name == "amplitude" then
		value = value * self._multiplier
	end

	if self._unit_camera then
		slot5 = self._unit_camera
		slot8 = value

		self._unit_camera.shaker(slot4).set_parameter(slot4, self._unit_camera.shaker(slot4), self._id, name)
	else
		slot5 = self._playing_camera

		if alive(slot4) then
			slot8 = value

			self._playing_camera.set_parameter(slot4, self._playing_camera, self._id, name)
		end
	end

	return 
end
function FeedBackCameraShake:play(extra_params)
	slot5 = self._name
	local params = managers.feedback.get_effect_table(slot3, managers.feedback)[self._type]
	local name = extra_params.name or params.name
	self._multiplier = extra_params.multiplier or 1

	if self._unit_camera then
		slot10 = params.offset or 0
		self._id = self._unit_camera.play_shaker(slot5, self._unit_camera, name, params.amplitude or 1, params.frequency or 1)
	else
		slot6 = self._camera

		if not alive(slot5) or not self._camera then
			slot6 = managers.viewport
			slot4 = managers.viewport.get_current_shaker(slot5)
		end

		self._playing_camera = slot4

		if self._playing_camera then
			slot7 = name
			self._id = self._playing_camera.play(slot5, self._playing_camera)
			slot7 = self._id

			if self._playing_camera.is_playing(slot5, self._playing_camera) then
				local t = {}
				slot9 = self._params

				mixin(slot6, t, params)

				t.name = nil
				slot7 = t

				for param, value in pairs(slot6) do
					slot15 = value

					self._playing_camera.set_parameter(slot11, self._playing_camera, self._id, param)
				end
			end
		end
	end

	return 
end
function FeedBackCameraShake:stop()
	if self._unit_camera then
		slot4 = self._id

		self._unit_camera.stop_shaker(slot2, self._unit_camera)
	else
		slot3 = managers.viewport
		slot4 = self._id

		managers.viewport.get_current_shaker(slot2).stop(slot2, managers.viewport.get_current_shaker(slot2))
	end

	self._id = nil

	return 
end
function FeedBackCameraShake:is_playing()
	if self._unit_camera and self._id then
		slot3 = self._unit_camera
		slot4 = self._id

		return self._unit_camera.shaker(slot2).is_playing(slot2, self._unit_camera.shaker(slot2))
	elseif self._playing_camera and self._id then
		slot4 = self._id

		return self._playing_camera.is_playing(slot2, self._playing_camera)
	else
		return false
	end

	return 
end

if not FeedBackAboveCameraEffect then
	slot2 = FeedBackEffect
	slot0 = class(slot1)
end

FeedBackAboveCameraEffect = slot0
function FeedBackAboveCameraEffect:init(name)
	slot5 = name

	FeedBackAboveCameraEffect.super.init(slot3, self)

	self._type = "above_camera_effect"
	slot6 = 100
	self._offset = Vector3(slot3, 0, 0)

	return 
end
function FeedBackAboveCameraEffect:set_unit(unit)
	slot4 = unit
	self._unit_camera = unit.camera(slot3)

	return 
end
function FeedBackAboveCameraEffect:set_param(name, value)
	self._params[name] = value

	return 
end
function FeedBackAboveCameraEffect:play(extra_params)
	slot4 = self
	local params = FeedBackAboveCameraEffect.super.play(slot3)
	local name = (extra_params and extra_params.effect) or params.effect

	if name == "none" then
		return 
	end

	local effect_params = {}
	slot7 = name
	effect_params.effect = Idstring(slot6)
	slot7 = self._unit_camera
	effect_params.position = self._unit_camera.position(slot6) + self._offset
	slot7 = self._unit_camera
	effect_params.rotation = self._unit_camera.rotation(self._offset)
	slot7 = World
	slot8 = effect_params
	self._id = World.effect_manager(self._offset).spawn(self._offset, World.effect_manager(self._offset))

	return 
end
function FeedBackAboveCameraEffect:stop()
	if self._id then
		slot3 = World
		slot4 = self._id

		World.effect_manager(slot2).kill(slot2, World.effect_manager(slot2))
	end

	return 
end

return 
