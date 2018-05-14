if not CivilianBase then
	slot2 = CopBase
	slot0 = class(slot1)
end

CivilianBase = slot0
function CivilianBase:post_init()
	slot3 = self._unit
	self._ext_movement = self._unit.movement(slot2)
	slot3 = self._unit
	self._ext_anim = self._unit.anim_data(slot2)
	local spawn_state = nil

	if self._spawn_state then
		if self._spawn_state ~= "" then
			spawn_state = self._spawn_state
		end
	else
		spawn_state = "civilian/spawn/loop"
	end

	if spawn_state then
		slot5 = spawn_state

		self._ext_movement.play_state(slot3, self._ext_movement)
	end

	slot4 = self._unit
	self._unit.anim_data(slot3).idle_full_blend = true
	slot4 = self._ext_movement

	self._ext_movement.post_init(true)

	slot4 = self._unit
	slot4 = self._unit.brain(true)

	self._unit.brain(true).post_init(true)

	slot5 = self._unit

	managers.enemy.register_civilian(true, managers.enemy)

	return 
end
function CivilianBase:default_weapon_name()
	return 
end

return 
