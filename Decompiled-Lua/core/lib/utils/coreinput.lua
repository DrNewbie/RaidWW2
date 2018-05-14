slot3 = "CoreInput"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

function shift()
	slot2 = Input
	slot2 = Input.keyboard(slot1)
	slot5 = "left shift"

	if not Input.keyboard(slot1).down(slot1, Idstring(slot4)) then
		slot2 = Input
		slot2 = Input.keyboard(slot1)
		slot5 = "right shift"
		slot0 = Input.keyboard(slot1).down(slot1, Idstring(slot4))
	end

	return slot0
end

function ctrl()
	slot2 = Input
	slot2 = Input.keyboard(slot1)
	slot5 = "left ctrl"

	if not Input.keyboard(slot1).down(slot1, Idstring(slot4)) then
		slot2 = Input
		slot2 = Input.keyboard(slot1)
		slot5 = "right ctrl"
		slot0 = Input.keyboard(slot1).down(slot1, Idstring(slot4))
	end

	return slot0
end

function alt()
	slot2 = Input
	slot2 = Input.keyboard(slot1)
	slot5 = "left alt"

	return Input.keyboard(slot1).down(slot1, Idstring(slot4))
end

RepKey = RepKey or CoreClass.class()
function RepKey:init(keys, pause, rep)
	self._keys = keys or {}
	self._current_time = 0
	self._current_rep_time = 0
	self._pause = pause or 0.5
	self._rep = rep or 0.1
	slot6 = Input
	self._input = Input.keyboard(slot5)

	return 
end
function RepKey:set_input(input)
	self._input = input

	return 
end
function RepKey:update(d, dt)
	local anykey = false
	slot6 = self._keys

	for _, key in ipairs(slot5) do
		slot11 = self._input
		slot14 = key

		if self._input.down(slot10, Idstring(slot13)) then
			anykey = true

			break
		end
	end

	local down = false

	if anykey then
		if self._current_time == 0 then
			down = true
		end

		if self._pause <= self._current_time then
			down = true

			if self._rep <= self._current_rep_time then
				down = true
				self._current_rep_time = 0
			else
				down = false
				self._current_rep_time = self._current_rep_time + dt
			end
		else
			self._current_time = self._current_time + dt
		end
	else
		self._current_time = 0
		self._current_rep_time = 0
	end

	return down
end

return 
