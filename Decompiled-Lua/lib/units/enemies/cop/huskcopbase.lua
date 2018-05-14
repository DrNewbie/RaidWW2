if not HuskCopBase then
	slot2 = CopBase
	slot0 = class(slot1)
end

HuskCopBase = slot0
function HuskCopBase:post_init()
	slot3 = self._unit
	self._ext_movement = self._unit.movement(slot2)
	slot3 = self._unit
	self._ext_anim = self._unit.anim_data(slot2)
	slot4 = 1

	self.set_anim_lod(slot2, self)

	self._lod_stage = 1
	slot3 = managers.navigation

	if managers.navigation.is_data_ready(slot2) then
		slot3 = self

		self._do_post_init(slot2)
	else
		slot4 = "[HuskCopBase:post_init()] Navigation not ready! Queue cop post_init method."

		Application.debug(slot2, Application, inspect(slot6))

		slot6 = self._unit
		self._nav_ready_listener_key = "HuskCopBase" .. tostring(self._unit.key(inspect))
		slot5 = {
			"navigation_ready"
		}
		slot10 = "_do_post_init"

		managers.navigation.add_listener(tostring(self._unit.key(inspect)), managers.navigation, self._nav_ready_listener_key, callback(managers.navigation._nav_segments, self, self))
	end

	return 
end
function HuskCopBase:_do_post_init()
	slot5 = self._nav_ready_listener_key

	Application.debug(slot2, Application, "[HuskCopBase:post_init()] Navigation READY!")

	slot3 = self._ext_movement

	self._ext_movement.post_init(slot2)

	slot3 = self._unit
	slot3 = self._unit.brain(slot2)

	self._unit.brain(slot2).post_init(slot2)

	slot4 = self._unit

	managers.enemy.register_enemy(slot2, managers.enemy)

	slot3 = self

	self._chk_spawn_gear(slot2)

	if self._nav_ready_listener_key then
		slot4 = self._nav_ready_listener_key

		managers.navigation.remove_listener(slot2, managers.navigation)
	end

	return 
end
function HuskCopBase:pre_destroy(unit)
	slot4 = self._headwear_unit

	if alive(slot3) then
		slot5 = 0

		self._headwear_unit.set_slot(slot3, self._headwear_unit)
	end

	slot5 = unit

	UnitBase.pre_destroy(slot3, self)

	return 
end

return 
