SimpleCharacter = SimpleCharacter or class()
SimpleCharacter.SPEED = 150
function SimpleCharacter:init(unit)
	self._unit = unit

	return 
end
function SimpleCharacter:update(unit, t, dt)
	slot8 = dt

	self.move(slot5, self, t)

	return 
end
function SimpleCharacter:paused_update(unit, t, dt)
	slot8 = dt

	self.move(slot5, self, t)

	return 
end
function SimpleCharacter:move(t, dt)
	slot7 = 0
	local move_vec = Vector3(slot4, 0, 0)
	local keyboard = Input.keyboard(0)
	slot7 = managers.viewport
	local viewport = managers.viewport.first_active_viewport(Input)

	if viewport == nil then
		return 
	end

	local camera = viewport.camera(slot7)
	local cam_rot = camera.rotation(viewport)
	slot11 = cam_rot.pitch(slot12)
	slot14 = cam_rot
	local rotation = Rotation(camera, 90, cam_rot.roll(cam_rot))
	slot11 = self._unit

	if self._unit.mover(90) then
		slot11 = keyboard
		slot14 = "t"

		if keyboard.down(slot10, Idstring(slot13)) then
			slot11 = rotation
			move_vec = move_vec - rotation.z(slot10)
		end

		slot11 = keyboard
		slot14 = "g"

		if keyboard.down(slot10, Idstring(slot13)) then
			slot11 = rotation
			move_vec = move_vec + rotation.z(slot10)
		end

		slot11 = keyboard
		slot14 = "f"

		if keyboard.down(slot10, Idstring(slot13)) then
			slot11 = rotation
			move_vec = move_vec - rotation.x(slot10)
		end

		slot11 = keyboard
		slot14 = "h"

		if keyboard.down(slot10, Idstring(slot13)) then
			slot11 = rotation
			move_vec = move_vec + rotation.x(slot10)
		end

		slot11 = move_vec
		local length = move_vec.length(slot10)

		if 0.001 < length then
			move_vec = move_vec / length
		end

		move_vec = move_vec * self.SPEED * dt
		slot12 = keyboard
		slot15 = "c"

		if keyboard.down(slot11, Idstring(slot14)) then
			slot12 = self._unit
			slot12 = self._unit.mover(slot11)

			self._unit.mover(slot11).jump(slot11)
		end

		slot12 = keyboard
		slot15 = "k"

		if keyboard.down(slot11, Idstring(slot14)) then
			slot12 = self._unit
			slot13 = true

			self._unit.mover(slot11).set_stiff(slot11, self._unit.mover(slot11))
		end

		slot12 = keyboard
		slot15 = "l"

		if keyboard.down(slot11, Idstring(slot14)) then
			slot12 = self._unit
			slot13 = false

			self._unit.mover(slot11).set_stiff(slot11, self._unit.mover(slot11))
		end
	end

	slot12 = move_vec

	self._unit.move(slot10, self._unit)

	return 
end

return 
