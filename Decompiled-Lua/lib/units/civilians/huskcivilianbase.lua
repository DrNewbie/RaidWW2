local ids_lod = Idstring(slot1)
local ids_lod1 = Idstring("lod")
slot4 = "ik_aim"
local ids_ik_aim = Idstring("lod1")

if not HuskCivilianBase then
	slot5 = HuskCopBase
	slot3 = class(slot4)
end

HuskCivilianBase = slot3
function HuskCivilianBase:post_init()
	slot3 = self._unit
	self._ext_movement = self._unit.movement(slot2)
	slot3 = self._unit
	self._ext_anim = self._unit.anim_data(slot2)
	slot3 = self._unit
	slot3 = self._unit.brain(slot2)

	self._unit.brain(slot2).post_init(slot2)

	slot4 = 1

	self.set_anim_lod(slot2, self)

	self._lod_stage = 1
	self._allow_invisible = true
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

	slot4 = self._ext_movement

	self._ext_movement.post_init(slot3)

	slot5 = self._unit

	managers.enemy.register_civilian(slot3, managers.enemy)

	return 
end
function HuskCivilianBase:default_weapon_name()
	return 
end
function HuskCivilianBase:sync_net_event(event_id)
	if event_id == 1 then
		slot4 = managers.groupai
		slot7 = managers.player
		slot7 = true

		managers.groupai.state(slot3).on_hostage_follow(slot3, managers.groupai.state(slot3), managers.player.player_unit(slot6), self._unit)
	elseif event_id == 2 then
		slot4 = managers.groupai
		slot7 = managers.player
		slot7 = false

		managers.groupai.state(slot3).on_hostage_follow(slot3, managers.groupai.state(slot3), managers.player.player_unit(slot6), self._unit)
	end

	return 
end

return 
