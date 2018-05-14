slot3 = "CoreElementPlaySound"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementPlaySound then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementPlaySound = slot0
function ElementPlaySound:init(...)
	slot3 = self

	ElementPlaySound.super.init(slot2, ...)

	return 
end
function ElementPlaySound:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementPlaySound:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._source then
		slot4 = self._source

		self._source.stop(slot3)
	end

	if self._values.use_instigator then
		slot4 = Network

		if Network.is_server(slot3) then
			slot4 = instigator

			if alive(slot3) then
				slot4 = instigator

				if instigator.id(slot3) ~= -1 then
					slot4 = instigator
					slot8 = true

					instigator.sound(slot3).say(slot3, instigator.sound(slot3), self._values.sound_event, true, not self._values.append_prefix)
				end
			end
		end
	elseif not self._values.elements or #self._values.elements == 0 then
		slot4 = self

		self._play_sound(slot3)
	else
		slot4 = Network

		if Network.is_server(slot3) then
			slot4 = self

			self._play_sound_on_elements(slot3)
		end
	end

	slot5 = instigator

	ElementPlaySound.super.on_executed(slot3, self)

	return 
end
function ElementPlaySound:_play_sound_on_elements()
	local function f(unit)
		slot3 = unit

		if unit.id(slot2) ~= -1 then
			slot3 = unit
			slot7 = true

			unit.sound(slot2).say(slot2, unit.sound(slot2), self._values.sound_event, true, not self._values.append_prefix)
		end

		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)
		slot11 = f

		element.execute_on_all_units(self, element)
	end

	return 
end
function ElementPlaySound:_play_sound()
	if self._values.sound_event then
		if self._source then
			slot3 = self._source

			self._source.stop(slot2)
		end

		slot4 = self._editor_name
		self._source = SoundDevice.create_source(slot2, SoundDevice)
		slot4 = self._values.position

		self._source.set_position(slot2, self._source)

		slot4 = self._values.rotation

		self._source.set_orientation(slot2, self._source)

		slot9 = "sound_ended"
		slot7 = "end_of_event"

		if self._source.post_event(slot2, self._source, self._values.sound_event, callback(slot6, self, self), nil) then
			slot4 = self._id

			self._mission_script.add_save_state_cb(slot2, self._mission_script)

			self._playing = true
		end
	else
		slot3 = Application

		if Application.editor(slot2) then
			slot4 = "Cant play sound event nil [" .. self._editor_name .. "]"

			managers.editor.output_error(slot2, managers.editor)
		end
	end

	return 
end
function ElementPlaySound:sound_ended(...)
	slot4 = self._id

	self._mission_script.remove_save_state_cb(slot2, self._mission_script)

	self._playing = false

	return 
end
function ElementPlaySound:operation_remove()
	if self._source then
		slot3 = self._source

		self._source.stop(slot2)

		slot3 = self

		self.sound_ended(slot2)
	end

	return 
end
function ElementPlaySound:save(data)
	data.enabled = self._values.enabled
	data.playing = self._playing

	return 
end
function ElementPlaySound:load(data)
	slot5 = data.enabled

	self.set_enabled(slot3, self)

	if data.playing then
		slot4 = self

		self._play_sound(slot3)
	end

	return 
end
function ElementPlaySound:stop_simulation()
	if self._source then
		slot3 = self._source

		self._source.stop(slot2)
	end

	slot3 = self

	ElementPlaySound.super.stop_simulation(slot2)

	return 
end
function ElementPlaySound:pre_destroy()
	if self._source then
		slot3 = self._source

		self._source.stop(slot2)

		slot3 = self

		self.sound_ended(slot2)
	end

	return 
end
function ElementPlaySound:destroy()
	if self._source then
		slot3 = self._source

		self._source.stop(slot2)

		slot3 = self._source

		self._source.delete(slot2)

		self._source = nil
		slot3 = self

		self.sound_ended(slot2)
	end

	return 
end

return 
