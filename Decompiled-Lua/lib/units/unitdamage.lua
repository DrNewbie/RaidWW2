if not UnitDamage then
	slot2 = CoreUnitDamage
	slot0 = class(slot1)
end

UnitDamage = slot0
UnitDamage.COLLISION_SFX_QUITE_TIME = 0.3
slot3 = "sfx_only"
UnitDamage.SFX_COLLISION_TAG = Idstring(slot2)
function UnitDamage:init(unit, ...)
	slot5 = unit

	CoreUnitDamage.init(slot3, self, ...)

	slot4 = self

	if self.can_play_collision_sfx(slot3) then
		self._collision_sfx_quite_time = self._collision_sfx_quite_time or UnitDamage.COLLISION_SFX_QUITE_TIME
		slot4 = self

		self.setup_sfx_collision_body_tags(slot3)
	end

	return 
end
function UnitDamage:setup_sfx_collision_body_tags()
	slot4 = self._unit

	for i = 0, self._unit.num_bodies(slot3) - 1, 1 do
		slot8 = i
		local body = self._unit.body(slot6, self._unit)
		slot8 = self
		slot11 = body

		if not self._has_body_collision_damage(self._unit, body.name(slot10)) then
			slot9 = self.SFX_COLLISION_TAG

			body.set_collision_script_tag(slot7, body)
		end
	end

	return 
end
function UnitDamage:_has_body_collision_damage(body_name)
	slot4 = self._unit_element._bodies

	for name, data in pairs(slot3) do
		slot9 = name

		if Idstring(slot8) == body_name then
			return (data._first_endurance.collision and true) or false
		end
	end

	return false
end
function UnitDamage:can_play_collision_sfx()
	return self._collision_event ~= nil
end
function UnitDamage:set_play_collision_sfx_quite_time(quite_time)
	if self._collision_sfx_quite_time == nil ~= quite_time == nil and quite_time then
		slot4 = self

		self.setup_sfx_collision_body_tags(slot3)
	end

	self._collision_sfx_quite_time = quite_time

	return 
end
function UnitDamage:body_collision_callback(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity)
	if self._collision_sfx_quite_time ~= nil and other_body and body then
		slot13 = TimerManager
		slot13 = TimerManager.game(slot12)
		local t = TimerManager.game(slot12).time(slot12)

		if not self._play_collision_sfx_time or self._play_collision_sfx_time <= t then
			slot18 = collision_velocity

			self.play_collision_sfx(slot13, self, other_unit, position, normal)

			self._play_collision_sfx_time = t + self._collision_sfx_quite_time
		end
	end

	if tag ~= self.SFX_COLLISION_TAG then
		slot23 = other_velocity

		CoreUnitDamage.body_collision_callback(slot12, self, tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity)
	end

	return 
end
function UnitDamage:play_collision_sfx(other_unit, position, normal, collision_velocity)
	if not self._collision_event then
		return 
	end

	slot8 = "collision"
	local ss = SoundDevice.create_source(slot6, SoundDevice)
	slot9 = position

	ss.set_position(SoundDevice, ss)

	slot9 = self._collision_event

	ss.post_event(SoundDevice, ss)

	return 
end
function UnitDamage:set_update_callback(func_name, ...)
	if func_name == "update_proximity_list" then
		slot4 = Network

		if not Network.is_server(slot3) then
			slot4 = self._unit

			if self._unit.id(slot3) ~= -1 then
				return 
			end
		end
	end

	slot5 = func_name

	UnitDamage.super.set_update_callback(slot3, self, ...)

	return 
end
function UnitDamage:parent_run_sequence(sequence_name)
	if not sequence_name then
		slot8 = self._unit
		slot7 = "\n"

		Application.error(slot3, Application, "No sequence_name param passed\n", self._unit.name(slot7))

		return 
	end

	slot4 = self._unit

	if not self._unit.parent(slot3) then
		slot4 = "No Parent! on unit:"
		slot7 = self._unit

		print(slot3, self._unit.name(slot6))

		return 
	end

	local parent_unit = self._unit.parent(slot3)
	slot5 = parent_unit
	slot6 = sequence_name

	if parent_unit.damage(self._unit).has_sequence(self._unit, parent_unit.damage(self._unit)) then
		slot5 = parent_unit
		slot6 = sequence_name

		parent_unit.damage(slot4).run_sequence_simple(slot4, parent_unit.damage(slot4))
	else
		slot7 = "sequence does not exist in:\n"
		slot10 = parent_unit

		Application.error(slot4, Application, sequence_name, parent_unit.name(slot9))
	end

	return 
end

return 
