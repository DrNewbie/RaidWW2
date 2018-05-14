-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
WeaponLionGadget1 = WeaponLionGadget1 or class()
WeaponLionGadget1.GADGET_TYPE = "bipod"
WeaponLionGadget1._previous_state = nil
WeaponLionGadget1.bipod_length = nil
function WeaponLionGadget1:init(unit)
	self._unit = unit
	self._is_npc = false
	self._deployed = false

	return 
end
function WeaponLionGadget1:update(unit, t, dt)
	return 
end
function WeaponLionGadget1:set_npc()
	self._is_npc = true

	return 
end
function WeaponLionGadget1:is_bipod()
	return true
end
function WeaponLionGadget1:bipod_state()
	return self._on
end
function WeaponLionGadget1:is_deployed()
	return self._deployed
end
function WeaponLionGadget1:toggle()
	slot4 = "WeaponLionGadget1:toggle() is_deployed: "
	slot7 = self

	Application.trace(slot2, Application, self.is_deployed(slot6))

	slot3 = self

	if self.is_deployed(slot2) then
		slot3 = self

		self._unmount(slot2)
	else
		slot3 = self

		self.check_state(slot2)
	end

	return 
end
function WeaponLionGadget1:is_usable()
	if not self._center_ray_from or not self._center_ray_to then
		return nil
	end

	slot5 = self._center_ray_to
	local ray_bipod_center = self._unit.raycast(slot2, self._unit, self._center_ray_from)
	slot6 = self._left_ray_to
	local ray_bipod_left = self._unit.raycast(self._unit, self._unit, self._left_ray_from)
	slot7 = self._right_ray_to
	local ray_bipod_right = self._unit.raycast(self._unit, self._unit, self._right_ray_from)

	return ray_bipod_center and (ray_bipod_left or ray_bipod_right)
end
function WeaponLionGadget1:_unmount()
	slot4 = self._previous_state or "standard"

	managers.player.set_player_state(slot2, managers.player)

	self._previous_state = nil
	self._deployed = false

	return 
end
function WeaponLionGadget1:_is_deployable()

	-- Decompilation error in this vicinity:
	if self._is_npc then
		return false
	end

	if not self._bipod_obj then
		slot3 = self._unit

		if self._unit.parent(slot2) then
			slot3 = "No Bipod object. Trying to recover."

			print(slot2)

			slot3 = self._unit
			slot3 = self._unit.parent(slot2)
			slot6 = "a_bp"
			self._bipod_obj = self._unit.parent(slot2).get_object(slot2, Idstring(slot5))

			if not self._bipod_obj then
				slot3 = "Fail."

				print(slot2)

				return false
			end

			slot3 = "Success."

			print(slot2)
		end
	end

	local is_reloading = false
	slot4 = managers.player

	if managers.player.current_state(slot3) == "standard" then
		slot4 = managers.player
		slot4 = managers.player.player_unit(slot3)

		if managers.player.player_unit(slot3).movement(slot3)._current_state then
			slot4 = managers.player
			slot4 = managers.player.player_unit(slot3)
			slot4 = managers.player.player_unit(slot3).movement(slot3)._current_state
			is_reloading = managers.player.player_unit(slot3).movement(slot3)._current_state._is_reloading(slot3)
		end
	end

	slot4 = managers.player
	slot4 = managers.player.player_unit(slot3)
	slot4 = managers.player.player_unit(slot3).mover(slot3)
	slot4 = self
	local bipod_rays = self._shoot_bipod_rays(slot3)

	if not bipod_rays then
		return false
	end

	local bipod_min_length = 5

	if bipod_rays.forward then
		return false
	end

	if bipod_rays.left and bipod_rays.left.distance < bipod_min_length then
		return false
	end

	if bipod_rays.right and bipod_rays.right.distance < bipod_min_length then
		return false
	end

	if ((bipod_rays.left or bipod_rays.right) and bipod_rays.center) or bipod_rays.center then
		return true
	end

	return false
end
function WeaponLionGadget1:_shoot_bipod_rays(debug_draw)
	local mvec1 = Vector3()
	local mvec2 = Vector3()
	local mvec3 = Vector3()
	local mvec_look_dir = Vector3()
	local mvec_gun_down_dir = Vector3()
	local from = mvec1
	local to = mvec2
	local from_offset = mvec3
	local bipod_max_length = WeaponLionGadget1.bipod_length or 90

	if not self._bipod_obj then
		return nil
	end

	slot15 = self._bipod_obj

	mrotation.y(slot12, self._bipod_obj.rotation(slot14))

	slot15 = self._bipod_obj
	slot14 = mvec_gun_down_dir

	mrotation.x(slot12, self._bipod_obj.rotation(mvec_look_dir))

	slot13 = mvec_look_dir

	if 60 < mvec_look_dir.to_polar(slot12).pitch then
		return nil
	end

	slot13 = from
	slot16 = self._bipod_obj

	mvector3.set(slot12, self._bipod_obj.position(slot15))

	slot14 = mvec_gun_down_dir

	mvector3.set(slot12, to)

	slot14 = bipod_max_length

	mvector3.multiply(slot12, to)

	slot13 = to
	slot17 = 120

	mvector3.rotate_with(slot12, Rotation(slot15, mvec_look_dir))

	slot14 = from

	mvector3.add(slot12, to)

	slot15 = to
	local ray_bipod_left = self._unit.raycast(slot12, self._unit, from)

	if not debug_draw then
		slot16 = from.z
		self._left_ray_from = Vector3(slot13, from.x, from.y)
		slot16 = to.z
		self._left_ray_to = Vector3(slot13, to.x, to.y)
	else
		local color = (ray_bipod_left and {
			0,
			1,
			0
		}) or {
			1,
			0,
			0
		}
		slot17 = to
		slot20 = color

		Application.draw_line(slot14, Application, from, unpack(slot19))
	end

	slot15 = mvec_gun_down_dir

	mvector3.set(slot13, to)

	slot15 = bipod_max_length

	mvector3.multiply(slot13, to)

	slot14 = to
	slot18 = 60

	mvector3.rotate_with(slot13, Rotation(slot16, mvec_look_dir))

	slot15 = from

	mvector3.add(slot13, to)

	slot16 = to
	local ray_bipod_right = self._unit.raycast(slot13, self._unit, from)

	if not debug_draw then
		slot17 = from.z
		self._right_ray_from = Vector3(slot14, from.x, from.y)
		slot17 = to.z
		self._right_ray_to = Vector3(slot14, to.x, to.y)
	else
		local color = (ray_bipod_right and {
			0,
			1,
			0
		}) or {
			1,
			0,
			0
		}
		slot18 = to
		slot21 = color

		Application.draw_line(slot15, Application, from, unpack(slot20))
	end

	slot16 = mvec_gun_down_dir

	mvector3.set(slot14, to)

	slot18 = 30
	slot16 = bipod_max_length * math.cos(slot17)

	mvector3.multiply(slot14, to)

	slot15 = to
	slot19 = 90

	mvector3.rotate_with(slot14, Rotation(slot17, mvec_look_dir))

	slot16 = from

	mvector3.add(slot14, to)

	slot17 = to
	local ray_bipod_center = self._unit.raycast(slot14, self._unit, from)

	if not debug_draw then
		slot18 = from.z
		self._center_ray_from = Vector3(slot15, from.x, from.y)
		slot18 = to.z
		self._center_ray_to = Vector3(slot15, to.x, to.y)
	else
		local color = (ray_bipod_center and {
			0,
			1,
			0
		}) or {
			1,
			0,
			0
		}
		slot19 = to
		slot22 = color

		Application.draw_line(slot16, Application, from, unpack(slot21))
	end

	slot16 = from_offset
	slot21 = 0

	mvector3.set(slot15, Vector3(slot18, 0, -100))

	slot16 = from_offset
	slot19 = self._bipod_obj

	mvector3.rotate_with(slot15, self._bipod_obj.rotation(slot18))

	slot17 = from_offset

	mvector3.add(slot15, from)

	slot17 = mvec_look_dir

	mvector3.set(slot15, to)

	slot17 = 500

	mvector3.multiply(slot15, to)

	slot17 = from

	mvector3.add(slot15, to)

	slot18 = to
	local ray_bipod_forward = self._unit.raycast(slot15, self._unit, from)

	if debug_draw then
		local color = (ray_bipod_forward and {
			1,
			0,
			0
		}) or {
			0,
			1,
			0
		}
		slot20 = to
		slot23 = color

		Application.draw_line(slot17, Application, from, unpack(slot22))
	end

	return {
		left = ray_bipod_left,
		right = ray_bipod_right,
		center = ray_bipod_center,
		forward = ray_bipod_forward
	}
end
function WeaponLionGadget1:check_state()
	if self._is_npc then
		return false
	end

	slot3 = self
	local bipod_deployable = self._is_deployable(slot2)
	self._deployed = false

	if not self._is_npc then
		slot4 = managers.player

		if managers.player.current_state(slot3) ~= "bipod" and bipod_deployable then
			slot4 = managers.player
			self._previous_state = managers.player.current_state(slot3)
			slot5 = "bipod"

			managers.player.set_player_state(slot3, managers.player)

			self._deployed = true
		else
			slot4 = managers.player

			if managers.player.current_state(slot3) == "bipod" then
				slot4 = self

				self._unmount(slot3)
			end
		end
	end

	slot7 = "base"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(self._deployed))

	return 
end
function WeaponLionGadget1:destroy(unit)
	return 
end

return 
