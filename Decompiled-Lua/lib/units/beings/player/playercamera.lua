PlayerCamera = PlayerCamera or class()
slot3 = ""
PlayerCamera.IDS_NOTHING = Idstring(slot2)
function PlayerCamera:init(unit)
	self._unit = unit
	slot4 = unit
	self._m_cam_rot = unit.rotation(slot3)
	slot4 = unit
	self._m_cam_pos = unit.position(slot3) + math.UP * tweak_data.player.PLAYER_EYE_HEIGHT
	slot4 = self._m_cam_rot
	self._m_cam_fwd = self._m_cam_rot.y(math.UP * tweak_data.player.PLAYER_EYE_HEIGHT)
	slot4 = World
	self._camera_object = World.create_camera(math.UP * tweak_data.player.PLAYER_EYE_HEIGHT)
	slot5 = managers.viewport.CAMERA_NEAR_RANGE

	self._camera_object.set_near_range(math.UP * tweak_data.player.PLAYER_EYE_HEIGHT, self._camera_object)

	slot5 = managers.viewport.CAMERA_FAR_RANGE

	self._camera_object.set_far_range(math.UP * tweak_data.player.PLAYER_EYE_HEIGHT, self._camera_object)

	slot5 = 75

	self._camera_object.set_fov(math.UP * tweak_data.player.PLAYER_EYE_HEIGHT, self._camera_object)

	slot4 = self

	self.spawn_camera_unit(math.UP * tweak_data.player.PLAYER_EYE_HEIGHT)
	self._setup_sound_listener(math.UP * tweak_data.player.PLAYER_EYE_HEIGHT)

	slot5 = unit
	slot5 = unit.rotation(self)
	self._sync_dir = {
		pitch = 0,
		yaw = unit.rotation(self).yaw(self)
	}
	self._last_sync_t = 0
	slot4 = self
	slot7 = managers.player

	self.setup_viewport(unit.rotation(self).yaw(self), managers.player.viewport_config(slot6))

	return 
end
function PlayerCamera:setup_viewport(data)
	if self._vp then
		slot4 = self._vp

		self._vp.destroy(slot3)
	end

	local dimensions = data.dimensions
	slot6 = self._id
	local name = "player" .. tostring(slot5)
	slot11 = name
	local vp = managers.viewport.new_vp(slot5, managers.viewport, dimensions.x, dimensions.y, dimensions.w, dimensions.h)
	slot7 = vp
	self._director = vp.director(managers.viewport)
	slot7 = self._director
	self._shaker = self._director.shaker(managers.viewport)
	slot7 = self._shaker

	self._shaker.set_timer(managers.viewport, managers.player.player_timer(dimensions.w))

	slot8 = self._camera_object
	slot11 = "fps"
	self._camera_controller = self._director.make_camera(managers.viewport, self._director, Idstring(managers.player))
	slot8 = self._camera_controller

	self._director.set_camera(managers.viewport, self._director)

	slot8 = self._camera_object

	self._director.position_as(managers.viewport, self._director)

	slot8 = self._camera_unit

	self._camera_controller.set_both(managers.viewport, self._camera_controller)

	slot10 = managers.player

	self._camera_controller.set_timer(managers.viewport, managers.player.player_timer(Idstring))

	self._shakers = {}
	slot10 = 0.3
	self._shakers.breathing = self._shaker.play(self._camera_controller, self._shaker, "breathing")
	slot10 = 0
	self._shakers.headbob = self._shaker.play(self._camera_controller, self._shaker, "headbob")
	slot8 = self._camera_object

	vp.set_camera(self._shaker.play(self._camera_controller, self._shaker, "headbob"), vp)

	self._vp = vp

	if false then
		slot7 = vp

		vp.set_width_mul_enabled(slot6)

		slot7 = vp
		slot7 = vp.camera(slot6)
		slot10 = 1.7777777777777777

		vp.camera(slot6).set_width_multiplier(slot6, CoreMath.width_mul(slot9))

		slot7 = self

		self._set_dimensions(slot6)
	end

	return 
end
function PlayerCamera:_set_dimensions()
	slot7 = RenderSettings.aspect_ratio / 1.7777777777777777

	self._vp._vp.set_dimensions(slot2, self._vp._vp, 0, (1 - RenderSettings.aspect_ratio / 1.7777777777777777) / 2, 1)

	return 
end
function PlayerCamera:spawn_camera_unit()
	local lvl_tweak_data = Global.level_data and Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	slot7 = "units/vanilla/characters/players/players_default_fps/players_default_fps"
	self._camera_unit = World.spawn_unit(slot3, World, Idstring(slot6), self._m_cam_pos)
	slot4 = self._camera_unit
	self._machine = self._camera_unit.anim_state_machine(slot3)
	slot5 = self._camera_unit

	self._unit.link(slot3, self._unit)

	slot4 = self._camera_unit
	slot5 = self._unit

	self._camera_unit.base(slot3).set_parent_unit(slot3, self._camera_unit.base(slot3))

	slot4 = self._camera_unit
	slot4 = self._camera_unit.base(slot3)

	self._camera_unit.base(slot3).reset_properties(slot3)

	slot4 = self._camera_unit
	slot5 = "standard"

	self._camera_unit.base(slot3).set_stance_instant(slot3, self._camera_unit.base(slot3))

	slot5 = "player_camera"
	slot10 = "controller_hotswap_triggered"

	managers.controller.add_hotswap_callback(slot3, managers.controller, callback(self._m_cam_rot, self, self))

	return 
end
function PlayerCamera:controller_hotswap_triggered()
	slot3 = self._unit
	slot3 = self._unit.base(slot2)

	self._unit.base(slot2)._setup_controller(slot2)

	slot3 = self._camera_unit
	slot4 = self._unit

	self._camera_unit.base(slot2).set_parent_unit(slot2, self._camera_unit.base(slot2))

	return 
end
function PlayerCamera:camera_unit()
	return self._camera_unit
end
function PlayerCamera:anim_state_machine()
	slot3 = self._camera_unit

	return self._camera_unit.anim_state_machine(slot2)
end
function PlayerCamera:play_redirect(redirect_name, speed, offset_time)
	slot6 = self._camera_unit
	slot9 = offset_time
	local result = self._camera_unit.base(slot5).play_redirect(slot5, self._camera_unit.base(slot5), redirect_name, speed)

	return result ~= PlayerCamera.IDS_NOTHING and result
end
function PlayerCamera:play_redirect_timeblend(state, redirect_name, offset_time, t)
	slot7 = self._camera_unit
	slot11 = t
	local result = self._camera_unit.base(slot6).play_redirect_timeblend(slot6, self._camera_unit.base(slot6), state, redirect_name, offset_time)

	return result ~= PlayerCamera.IDS_NOTHING and result
end
function PlayerCamera:play_state(state_name, at_time)
	slot5 = self._camera_unit
	slot7 = at_time
	local result = self._camera_unit.base(slot4).play_state(slot4, self._camera_unit.base(slot4), state_name)

	return result ~= PlayerCamera.IDS_NOTHING and result
end
function PlayerCamera:play_raw(name, params)
	slot5 = self._camera_unit
	slot7 = params
	local result = self._camera_unit.base(slot4).play_raw(slot4, self._camera_unit.base(slot4), name)

	return result ~= PlayerCamera.IDS_NOTHING and result
end
function PlayerCamera:set_speed(state_name, speed)
	slot7 = speed

	self._machine.set_speed(slot4, self._machine, state_name)

	return 
end
function PlayerCamera:anim_data()
	slot3 = self._camera_unit

	return self._camera_unit.anim_data(slot2)
end
function PlayerCamera:destroy()
	slot3 = self._vp

	self._vp.destroy(slot2)

	self._unit = nil
	slot3 = self._camera_object

	if alive(slot2) then
		slot4 = self._camera_object

		World.delete_camera(slot2, World)
	end

	self._camera_object = nil
	slot3 = self

	self.remove_sound_listener(slot2)

	slot4 = "player_camera"

	managers.controller.remove_hotswap_callback(slot2, managers.controller)

	return 
end
function PlayerCamera:remove_sound_listener()
	if not self._listener_id then
		return 
	end

	slot4 = self._sound_check_object

	managers.sound_environment.remove_check_object(slot2, managers.sound_environment)

	slot4 = self._listener_id

	managers.listener.remove_listener(slot2, managers.listener)

	slot4 = "player_camera"

	managers.listener.remove_set(slot2, managers.listener)

	self._listener_id = nil

	return 
end
function PlayerCamera:clbk_fp_enter(aim_dir)
	if self._camera_manager_mode ~= "first_person" then
		self._camera_manager_mode = "first_person"
	end

	return 
end
function PlayerCamera:_setup_sound_listener()
	slot8 = false
	self._listener_id = managers.listener.add_listener(slot2, managers.listener, "player_camera", self._camera_object, self._camera_object, nil)
	slot5 = {
		"player_camera"
	}

	managers.listener.add_set(slot2, managers.listener, "player_camera")

	slot5 = "player_camera"
	self._listener_activation_id = managers.listener.activate_set(slot2, managers.listener, "main")
	slot4 = {
		primary = true,
		active = true,
		object = self._unit.orientation_object(self._camera_object)
	}
	slot7 = self._unit
	self._sound_check_object = managers.sound_environment.add_check_object(slot2, managers.sound_environment)

	return 
end
function PlayerCamera:set_default_listener_object()
	slot4 = self._camera_object

	self.set_listener_object(slot2, self)

	return 
end
function PlayerCamera:set_listener_object(object)
	slot8 = nil

	managers.listener.set_listener(slot3, managers.listener, self._listener_id, object, object)

	return 
end
function PlayerCamera:position()
	return self._m_cam_pos
end
function PlayerCamera:rotation()
	return self._m_cam_rot
end
function PlayerCamera:forward()
	return self._m_cam_fwd
end
local camera_mvec = Vector3()
local reticle_mvec = Vector3()
function PlayerCamera:position_with_shake()
	slot4 = camera_mvec

	self._camera_object.m_position(slot2, self._camera_object)

	return camera_mvec
end
function PlayerCamera:forward_with_shake_toward_reticle(reticle_obj)
	slot5 = reticle_mvec

	reticle_obj.m_position(slot3, reticle_obj)

	slot5 = camera_mvec

	self._camera_object.m_position(slot3, self._camera_object)

	slot5 = camera_mvec

	mvector3.subtract(slot3, reticle_mvec)

	slot4 = reticle_mvec

	mvector3.normalize(slot3)

	return reticle_mvec
end
function PlayerCamera:set_position(pos)
	slot5 = pos

	self._camera_controller.set_camera(slot3, self._camera_controller)

	slot5 = pos

	mvector3.set(slot3, self._m_cam_pos)

	return 
end
local mvec1 = Vector3()
function PlayerCamera:set_rotation(rot)
	slot5 = mvec1

	mrotation.y(slot3, rot)

	slot5 = 100000

	mvector3.multiply(slot3, mvec1)

	slot5 = self._m_cam_pos

	mvector3.add(slot3, mvec1)

	slot5 = mvec1

	self._camera_controller.set_target(slot3, self._camera_controller)

	slot5 = mvec1

	mrotation.z(slot3, rot)

	slot5 = mvec1

	self._camera_controller.set_default_up(slot3, self._camera_controller)

	slot9 = rot

	mrotation.set_yaw_pitch_roll(slot3, self._m_cam_rot, rot.yaw(rot.pitch(rot)), rot.roll(rot))
	mrotation.y(slot3, self._m_cam_rot)

	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	local t = TimerManager.game(slot3).time(slot3)
	local sync_dt = t - self._last_sync_t
	slot6 = rot
	local sync_yaw = rot.yaw(self._m_cam_fwd)
	sync_yaw = sync_yaw % 360

	if sync_yaw < 0 then
		sync_yaw = 360 - sync_yaw
	end

	slot7 = (255 * sync_yaw) / 360
	sync_yaw = math.floor(slot6)
	slot9 = rot
	slot7 = rot.pitch(slot8)
	slot9 = 85
	local sync_pitch = math.clamp(slot6, slot7, -85) + 85
	slot8 = (127 * sync_pitch) / 170
	sync_pitch = math.floor(slot7)
	slot9 = self._sync_dir.pitch - sync_pitch
	local angle_delta = math.abs(slot7) + math.abs(self._sync_dir.yaw - sync_yaw)

	if (1 < sync_dt and 0 < angle_delta) or 5 < angle_delta then
		slot9 = self._unit
		slot12 = sync_pitch

		self._unit.network(slot8).send(slot8, self._unit.network(slot8), "set_look_dir", sync_yaw)

		self._sync_dir.yaw = sync_yaw
		self._sync_dir.pitch = sync_pitch
		self._last_sync_t = t
	end

	return 
end
function PlayerCamera:set_FOV(fov_value)
	slot5 = fov_value

	self._camera_object.set_fov(slot3, self._camera_object)

	return 
end
function PlayerCamera:viewport()
	return self._vp
end
function PlayerCamera:set_shaker_parameter(effect, parameter, value)
	if not self._shakers then
		return 
	end

	if self._shakers[effect] then
		slot9 = value

		self._shaker.set_parameter(slot5, self._shaker, self._shakers[effect], parameter)
	end

	return 
end
function PlayerCamera:play_shaker(effect, amplitude, frequency, offset)
	slot11 = offset or 0

	return self._shaker.play(slot6, self._shaker, effect, amplitude or 1, frequency or 1)
end
function PlayerCamera:stop_shaker(id)
	slot5 = id

	self._shaker.stop_immediately(slot3, self._shaker)

	return 
end
function PlayerCamera:shaker()
	return self._shaker
end

return 
