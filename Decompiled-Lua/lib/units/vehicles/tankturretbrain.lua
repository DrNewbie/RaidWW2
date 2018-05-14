-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not TankTurretBrain then
	slot2 = SentryGunBrain
	slot0 = class(slot1)
end

TankTurretBrain = slot0
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local tmp_vec1 = Vector3()
function TankTurretBrain:init(unit)
	slot5 = unit

	TankTurretBrain.super.init(slot3, self)

	self._locked_t = 0
	self._locked_on_attention = nil
	self._target_pos = Vector3()
	self._locked_phase = false

	return 
end
function TankTurretBrain:update(unit, t, dt)
	slot6 = self

	if self.is_locked(slot5) then
		slot7 = t

		self._update_target_locked(slot5, self)
	else
		slot6 = Network

		if Network.is_server(slot5) then
			slot7 = t

			self._upd_detection(slot5, self)

			slot7 = t

			self._select_focus_attention(slot5, self)

			slot7 = t

			self._upd_flash_grenade(slot5, self)

			slot7 = t

			self._upd_go_idle(slot5, self)
		end

		slot7 = t

		self._upd_fire(slot5, self)
	end

	return 
end
function TankTurretBrain:_lock_on(attention)
	self._locked_phase = true
	local delta_t = self._tweak_data.turret.time_before_taking_shot
	slot5 = TimerManager
	slot5 = TimerManager.game(slot4)
	self._locked_t = TimerManager.game(slot4).time(slot4) + delta_t
	self._locked_on_attention = attention
	slot5 = attention.unit
	self._locked_on_pos = attention.unit.position(slot4)
	slot5 = self._unit
	slot5 = self._unit.weapon(slot4)

	self._unit.weapon(slot4).play_lock_on_sound(slot4)

	return 
end
function TankTurretBrain:is_locked(t)
	return not not self._locked_phase
end
function TankTurretBrain:_update_target_locked(t)
	if self._locked_t <= t then
		slot4 = self

		self._fire_at_locked_position(slot3)
	end

	return 
end
function TankTurretBrain:_fire_at_locked_position()
	self._locked_phase = false
	slot3 = self._unit

	if not alive(slot2) then
		return 
	end

	local expend_ammo = Network.is_server(slot2)
	slot4 = self._unit
	slot8 = self._locked_on_pos

	self._unit.weapon(Network).singleshot(Network, self._unit.weapon(Network), false, expend_ammo, true)

	return 
end
function TankTurretBrain:_upd_fire(t)

	-- Decompilation error in this vicinity:
	slot4 = self._unit

	if not alive(slot3) then
		return 
	end

	slot4 = self._ext_movement

	if not self._tweak_data then
		slot5 = self._unit
		slot5 = self._unit.base(slot4)
		self._tweak_data = tweak_data.weapon[self._unit.base(slot4).get_name_id(slot4)]
	end

	local target_is_visible = self._ext_movement.is_target_visible(slot3)
	slot7 = target_is_visible

	self._upd_abandon_turret(self._ext_movement, self, t)

	slot5 = self._ext_movement
	local attention = self._ext_movement.attention(self._ext_movement)

	if self._firing then
		slot7 = "[TankTurretBrain:_upd_fire] Main tank turret marked as firing - shouldn't be possible since it uses singleshot and nor auto fire."

		Application.error(slot5, Application)

		self._firing = false
	end

	slot6 = self._unit

	if self._unit.weapon(slot5) then
		slot6 = self._unit
		slot6 = self._unit.weapon(slot5)
	else
		slot6 = self._ext_movement

		if self._ext_movement.rearming(slot5) then
			slot6 = self._ext_movement

			self._ext_movement.complete_rearming(slot5)
		elseif attention and attention.reaction and AIAttentionObject.REACT_SHOOT <= attention.reaction then
			slot7 = t

			if not self._ext_movement.warming_up(slot5, self._ext_movement) then
				if attention.pos then
					slot9 = self._ext_movement
					slot8 = attention.pos

					mvec3_dir(slot5, tmp_vec1, self._ext_movement.m_head_pos(slot8))
				else
					slot6 = attention.unit

					if attention.unit.movement(slot5) then
						slot7 = self._ext_movement.m_head_pos(slot8)
						slot10 = attention.unit
						slot10 = attention.unit.movement(self._ext_movement)

						mvec3_dir(slot5, tmp_vec1, attention.unit.movement(self._ext_movement).m_head_pos(self._ext_movement))
					else
						slot7 = self._ext_movement.m_head_pos(slot8)
						slot10 = attention.handler

						mvec3_dir(slot5, tmp_vec1, attention.handler.get_detection_m_pos(self._ext_movement))
					end
				end

				local max_dot = self._tweak_data.KEEP_FIRE_ANGLE
				slot8 = 1 - (1 - max_dot) * (self._shaprness_mul or 1)
				max_dot = math.min(slot6, 0.998)

				if target_is_visible then
					slot7 = tmp_vec1
					slot10 = self._ext_movement

					if max_dot < mvec3_dot(slot6, self._ext_movement.m_head_fwd(slot9)) then
						slot8 = attention

						self._lock_on(slot6, self)
					end
				end
			end
		end
	end

	return 
end

return 
