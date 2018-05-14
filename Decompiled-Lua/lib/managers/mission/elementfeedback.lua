slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementFeedback then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementFeedback = slot0
slot3 = "effect"
ElementFeedback.IDS_EFFECT = Idstring(slot2)
function ElementFeedback:init(...)
	slot3 = self

	ElementFeedback.super.init(slot2, ...)

	slot4 = self._values.effect
	self._feedback = managers.feedback.create(slot2, managers.feedback)
	slot3 = Application

	if Application.editor(slot2) and self._values.above_camera_effect ~= "none" then
		slot3 = self.IDS_EFFECT
		slot6 = self._values.above_camera_effect

		CoreEngineAccess._editor_load(slot2, self._values.above_camera_effect.id(slot5))
	end

	return 
end
function ElementFeedback:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementFeedback:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.player
	local player = managers.player.player_unit(slot3)

	if player then
		self._feedback.set_unit(slot4, self._feedback)

		slot7 = self._values.use_rumble

		self._feedback.set_enabled(slot4, self._feedback, "rumble")

		slot7 = self._values.use_camera_shake

		self._feedback.set_enabled(slot4, self._feedback, "camera_shake")

		local multiplier = self._calc_multiplier(slot4, self)
		local params = {}
		slot11 = self._values.camera_shake_effect

		self._check_value(player, self, params, "camera_shake", "name")

		slot11 = multiplier

		self._check_value(player, self, params, "camera_shake", "multiplier")

		slot11 = self._values.camera_shake_amplitude

		self._check_value(player, self, params, "camera_shake", "amplitude")

		slot11 = self._values.camera_shake_frequency

		self._check_value(player, self, params, "camera_shake", "frequency")

		slot11 = self._values.camera_shake_attack

		self._check_value(player, self, params, "camera_shake", "attack")

		slot11 = self._values.camera_shake_sustain

		self._check_value(player, self, params, "camera_shake", "sustain")

		slot11 = self._values.camera_shake_decay

		self._check_value(player, self, params, "camera_shake", "decay")

		slot11 = multiplier

		self._check_value(player, self, params, "rumble", "multiplier_data")

		slot11 = self._values.rumble_peak

		self._check_value(player, self, params, "rumble", "peak")

		slot11 = self._values.rumble_attack

		self._check_value(player, self, params, "rumble", "attack")

		slot11 = self._values.rumble_sustain

		self._check_value(player, self, params, "rumble", "sustain")

		slot11 = self._values.rumble_release

		self._check_value(player, self, params, "rumble", "release")
		self._feedback.set_enabled(player, self._feedback, "above_camera_effect")

		slot8 = "above_camera_effect"

		table.insert(player, params)

		slot8 = "effect"

		table.insert(player, params)

		slot8 = self._values.above_camera_effect

		table.insert(player, params)

		slot7 = self._feedback
		slot10 = params

		self._feedback.play(player, unpack(1 - self._values.above_camera_effect_distance <= multiplier))
	end

	slot6 = instigator

	ElementFeedback.super.on_executed(slot4, self)

	return 
end
function ElementFeedback:_check_value(params, cat, setting, value)
	if not value then
		return 
	end

	slot7 = value

	if type_name(slot6) == "string" or 0 <= value then
		slot8 = cat

		table.insert(slot6, params)

		slot8 = setting

		table.insert(slot6, params)

		slot8 = value

		table.insert(slot6, params)
	end

	return 
end
function ElementFeedback:_calc_multiplier(player)
	if self._values.range == 0 then
		return 1
	end

	local pos, _ = self.get_orientation(slot3, self)
	slot6 = player
	local distance = pos - player.position(true).length(true)
	slot9 = 1
	local mul = math.clamp(pos - player.position(true), 1 - distance / self._values.range, 0)

	return mul
end

return 
