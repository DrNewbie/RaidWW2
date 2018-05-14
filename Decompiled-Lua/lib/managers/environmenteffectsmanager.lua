-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- Decompilation Error: _glue_flows(node)

slot3 = "CoreEnvironmentEffectsManager"

core.import(slot1, core)

slot2 = Application
local is_editor = Application.editor(slot1)

if not EnvironmentEffectsManager then
	slot3 = CoreEnvironmentEffectsManager.EnvironmentEffectsManager
	slot1 = class(slot2)
end

EnvironmentEffectsManager = slot1
function EnvironmentEffectsManager:init()
	slot3 = self

	EnvironmentEffectsManager.super.init(slot2)

	slot4 = "rain"
	slot7 = RainEffect

	self.add_effect(slot2, self, RainEffect.new(slot6))

	slot4 = "raindrop_screen"
	slot7 = RainDropScreenEffect

	self.add_effect(slot2, self, RainDropScreenEffect.new(slot6))

	slot4 = "lightning"
	slot7 = LightningEffect

	self.add_effect(slot2, self, LightningEffect.new(slot6))

	self._camera_position = Vector3()
	self._camera_rotation = Rotation()

	return 
end
function EnvironmentEffectsManager:update(t, dt)
	slot5 = managers.viewport
	self._camera_position = managers.viewport.get_current_camera_position(slot4)
	slot5 = managers.viewport
	self._camera_rotation = managers.viewport.get_current_camera_rotation(slot4)
	slot7 = dt

	EnvironmentEffectsManager.super.update(slot4, self, t)

	return 
end
function EnvironmentEffectsManager:camera_position()
	return self._camera_position
end
function EnvironmentEffectsManager:camera_rotation()
	return self._camera_rotation
end
EnvironmentEffect = EnvironmentEffect or class()
function EnvironmentEffect:init(default)
	self._default = default

	return 
end
function EnvironmentEffect:load_effects()
	return 
end
function EnvironmentEffect:update(t, dt)
	return 
end
function EnvironmentEffect:start()
	return 
end
function EnvironmentEffect:stop()
	return 
end
function EnvironmentEffect:default()
	return self._default
end

if not RainEffect then
	slot3 = EnvironmentEffect
	slot1 = class(slot2)
end

RainEffect = slot1
function RainEffect:init()
	slot3 = self

	EnvironmentEffect.init(slot2)

	slot3 = "effects/vanilla/rain/rain_01_a"
	self._effect_name = Idstring(slot2)

	return 
end
function RainEffect:load_effects()
	if is_editor then
		slot5 = "effect"
		slot4 = self._effect_name

		CoreEngineAccess._editor_load(slot2, Idstring(slot4))
	end

	return 
end
function RainEffect:update(t, dt)
	slot5 = managers.viewport
	local vp = managers.viewport.first_active_viewport(slot4)

	if vp and self._vp ~= vp then
		slot6 = vp
		slot8 = Idstring(slot9)
		slot11 = "streaks_rain"

		vp.vp(slot5).set_post_processor_effect(slot5, vp.vp(slot5), "World", Idstring("streaks"))

		slot6 = self._vp

		if alive(slot5) then
			slot6 = self._vp
			slot8 = Idstring(slot9)
			slot11 = "streaks"

			self._vp.vp(slot5).set_post_processor_effect(slot5, self._vp.vp(slot5), "World", Idstring("streaks"))
		end

		self._vp = vp
	end

	slot6 = managers.environment_effects
	local c_pos = managers.environment_effects.camera_position(slot5)

	if not c_pos then
		return 
	end

	slot7 = World
	slot9 = c_pos

	World.effect_manager(slot6).move(slot6, World.effect_manager(slot6), self._effect)

	return 
end
function RainEffect:start()
	slot3 = World
	slot4 = {
		effect = self._effect_name,
		position = Vector3(),
		rotation = Rotation()
	}
	self._effect = World.effect_manager(slot2).spawn(slot2, World.effect_manager(slot2))

	return 
end
function RainEffect:stop()
	slot3 = World
	slot4 = self._effect

	World.effect_manager(slot2).kill(slot2, World.effect_manager(slot2))

	self._effect = nil
	slot3 = self._vp

	if alive(slot2) then
		slot3 = self._vp
		slot5 = Idstring(slot6)
		slot8 = "streaks"

		self._vp.vp(slot2).set_post_processor_effect(slot2, self._vp.vp(slot2), "World", Idstring("streaks"))

		self._vp = nil
	end

	return 
end

if not LightningEffect then
	slot3 = EnvironmentEffect
	slot1 = class(slot2)
end

LightningEffect = slot1
function LightningEffect:init()
	slot3 = self

	EnvironmentEffect.init(slot2)

	return 
end
function LightningEffect:load_effects()
	return 
end
function LightningEffect:_update_wait_start()
	slot3 = Underlay

	if Underlay.loaded(slot2) then
		slot3 = self

		self.start(slot2)
	end

	return 
end
function LightningEffect:_update(t, dt)

	-- Decompilation error in this vicinity:
	if self._flashing then
		slot7 = dt

		self._update_function(slot4, self, t)
	end

	if self._sound_delay then
		self._sound_delay = self._sound_delay - dt

		if self._sound_delay <= 0 then
			self._sound_delay = nil
		end
	end

	self._next = self._next - dt

	if self._next <= 0 then
		slot5 = self

		self._set_lightning_values(slot4)

		slot5 = self

		self._make_lightning(slot4)

		self._update_function = self._update_first
		slot5 = self

		self._set_next_timer(slot4)

		self._flashing = true
	end

	return 
end
function LightningEffect:start()
	slot3 = Underlay

	if not Underlay.loaded(slot2) then
		self.update = self._update_wait_start

		return 
	end

	self.update = self._update
	slot3 = Underlay
	slot6 = "sky"
	self._sky_material = Underlay.material(slot2, Idstring(slot5))
	slot3 = self._sky_material
	slot6 = "color0"
	self._original_color0 = self._sky_material.get_variable(slot2, Idstring(slot5))
	slot3 = Global._global_light
	self._original_light_color = Global._global_light.color(slot2)
	slot3 = Underlay
	slot6 = "sun_horizontal"
	self._original_sun_horizontal = Underlay.time(slot2, Idstring(slot5))
	self._min_interval = 2
	self._rnd_interval = 10
	slot4 = "thunder"
	self._sound_source = SoundDevice.create_source(slot2, SoundDevice)
	slot3 = self

	self._set_next_timer(slot2)

	return 
end
function LightningEffect:stop()
	slot3 = self

	self._set_original_values(slot2)

	return 
end
function LightningEffect:_update_first(t, dt)
	self._first_flash_time = self._first_flash_time - dt

	if self._first_flash_time <= 0 then
		slot5 = self

		self._set_original_values(slot4)

		self._update_function = self._update_pause
	end

	return 
end
function LightningEffect:_update_pause(t, dt)
	self._pause_flash_time = self._pause_flash_time - dt

	if self._pause_flash_time <= 0 then
		slot5 = self

		self._make_lightning(slot4)

		self._update_function = self._update_second
	end

	return 
end
function LightningEffect:_update_second(t, dt)
	self._second_flash_time = self._second_flash_time - dt

	if self._second_flash_time <= 0 then
		slot5 = self

		self._set_original_values(slot4)

		self._flashing = false
	end

	return 
end
function LightningEffect:_set_original_values()
	slot6 = "color0"

	self._sky_material.set_variable(slot2, self._sky_material, Idstring(slot5))

	slot4 = self._original_light_color

	Global._global_light.set_color(slot2, Global._global_light)

	slot6 = "sun_horizontal"
	slot5 = self._original_sun_horizontal

	Underlay.set_time(slot2, Underlay, Idstring(self._original_color0))

	return 
end
function LightningEffect:_make_lightning()
	slot6 = "color0"

	self._sky_material.set_variable(slot2, self._sky_material, Idstring(slot5))

	slot4 = self._intensity_value

	Global._global_light.set_color(slot2, Global._global_light)

	slot6 = "sun_horizontal"
	slot5 = self._flash_anim_time

	Underlay.set_time(slot2, Underlay, Idstring(self._intensity_value))

	return 
end
function LightningEffect:_set_lightning_values()
	self._first_flash_time = 0.1
	self._pause_flash_time = 0.1
	self._second_flash_time = 0.3
	slot3 = 360
	self._flash_roll = math.rand(slot2)
	slot5 = self._flash_roll
	slot3 = Rotation(slot2, 0, 0)
	self._flash_dir = Rotation(slot2, 0, 0).y(slot2)
	self._flash_anim_time = math.rand(slot2, 0)
	slot3 = 1
	self._distance = math.rand(slot2)
	slot7 = 2
	slot8 = 5
	slot5 = self._distance
	self._intensity_value = math.lerp(slot2, Vector3(1, 2, 2), Vector3(2, 5, 5))
	slot3 = managers.environment_effects
	local c_pos = managers.environment_effects.camera_position(slot2)

	if c_pos then
		local sound_speed = 30000
		self._sound_delay = self._distance * 2
		slot7 = self._distance * 4000

		self._sound_source.set_rtpc(slot4, self._sound_source, "lightning_distance")
	end

	return 
end
function LightningEffect:_set_next_timer()
	slot4 = self._rnd_interval
	self._next = self._min_interval + math.rand(slot3)

	return 
end

if not RainDropScreenEffect then
	slot3 = EnvironmentEffect
	slot1 = class(slot2)
end

RainDropScreenEffect = slot1
function RainDropScreenEffect:init()
	slot3 = self

	EnvironmentEffect.init(slot2)

	self._material = nil
	self._settings_1 = nil
	self._settings_2 = nil

	return 
end
function RainDropScreenEffect:update(t, dt)
	slot5 = self._settings_2

	for name, value in pairs(slot4) do
		slot11 = 0
		local new_alpha = math.max(slot9, value.y - dt * 0.5)

		if new_alpha == 0 then
			slot11 = managers.player
			local player = managers.player.local_player(slot10)

			if not player then
				return 
			end

			slot14 = player
			slot14 = player.camera(slot13)
			slot13 = FPCameraPlayerBase.MAX_PITCH
			local camera_y = math.rad(player.camera(slot13).rotation(slot13).pitch(slot13)) / math.rad(player.camera(slot13).rotation(slot13).pitch)
			slot16 = 1
			slot14 = -1
			camera_y = math.max(player.camera(slot13).rotation(slot13).pitch, math.min(player.camera(slot13).rotation(slot13), camera_y))
			camera_y = camera_y * 0.5 + 0.5
			slot14 = 5
			camera_y = math.pow(player.camera(slot13).rotation(slot13).pitch, camera_y)

			if math.random() < camera_y then
				slot13 = value
				slot18 = 0

				mvector3.set(slot12, Vector3(slot15, math.random(), math.random()))

				local offset_x = math.random() * math.random()
				local offset_y = math.random() * math.random()
				slot15 = self._settings_1[name]
				slot20 = math.random() * 2 * math.pi

				mvector3.set(Vector3, Vector3(math.random(), offset_x, offset_y))
			end
		else
			slot11 = value
			slot16 = value.z

			mvector3.set(slot10, Vector3(slot13, value.x, new_alpha))
		end
	end

	slot5 = self

	self._set_variables(slot4)

	return 
end
function RainDropScreenEffect:_acquire_material(...)
	slot3 = managers.viewport
	local vp = managers.viewport.first_active_viewport(slot2)

	if vp then
		slot4 = vp
		slot6 = Idstring(slot7)
		slot9 = "water_drops"

		vp.vp(slot3).set_post_processor_effect(slot3, vp.vp(slot3), "World", Idstring("water_drops"))

		slot4 = vp
		slot5 = "World"
		slot8 = "water_drops"
		slot4 = vp.vp(slot3).get_post_processor_effect(slot3, vp.vp(slot3), Idstring(Idstring))
		slot7 = "water_drops_mod"
		slot4 = vp.vp(slot3).get_post_processor_effect(slot3, vp.vp(slot3), Idstring(Idstring)).modifier(slot3, Idstring(Idstring))
		self._material = vp.vp(slot3).get_post_processor_effect(slot3, vp.vp(slot3), Idstring(Idstring)).modifier(slot3, Idstring(Idstring)).material(slot3)
	end

	return 
end
function RainDropScreenEffect:start()
	slot6 = math.random() * 2 * math.pi
	slot6 = math.random() * 2 * math.pi
	slot6 = math.random() * 2 * math.pi
	slot6 = math.random() * 2 * math.pi
	self._settings_1 = {
		uv_settings1 = Vector3(slot3, math.random(), math.random()),
		uv_settings2 = Vector3(slot3, math.random(), math.random()),
		uv_settings3 = Vector3(slot3, math.random(), math.random()),
		uv_settings4 = Vector3(slot3, math.random(), math.random())
	}
	slot6 = 0
	slot6 = 0
	slot6 = 0
	slot6 = 0
	self._settings_2 = {
		uv_settings1 = Vector3(slot3, math.random(), math.random()),
		uv_settings2 = Vector3(slot3, math.random(), math.random()),
		uv_settings3 = Vector3(slot3, math.random(), math.random()),
		uv_settings4 = Vector3(slot3, math.random(), math.random())
	}
	slot3 = self

	self._set_variables(Vector3(slot3, math.random(), math.random()))

	return 
end
function RainDropScreenEffect:_set_variables()
	if not self._material then
		slot3 = self

		self._acquire_material(slot2)

		if not self._material then
			return 
		end
	end

	slot3 = self._settings_1

	for name, value in pairs(slot2) do
		slot11 = name .. "_1"
		slot10 = value

		self._material.set_variable(slot7, self._material, Idstring(slot10))
	end

	slot3 = self._settings_2

	for name, value in pairs(slot2) do
		slot11 = name .. "_2"
		slot10 = value

		self._material.set_variable(slot7, self._material, Idstring(slot10))
	end

	return 
end
function RainDropScreenEffect:stop()
	slot3 = managers.viewport
	local vp = managers.viewport.first_active_viewport(slot2)

	if vp then
		slot4 = vp
		slot6 = Idstring(slot7)
		slot9 = "empty"

		vp.vp(slot3).set_post_processor_effect(slot3, vp.vp(slot3), "World", Idstring("water_drops"))
	end

	self._material = nil

	return 
end
slot4 = EnvironmentEffectsManager

CoreClass.override_class(function (self)
	slot3 = managers.viewport
	local vp = managers.viewport.first_active_viewport(slot2)

	if vp then
		slot4 = vp
		slot6 = Idstring(slot7)
		slot9 = "empty"

		vp.vp(slot3).set_post_processor_effect(slot3, vp.vp(slot3), "World", Idstring("water_drops"))
	end

	self._material = nil

	return 
end, CoreEnvironmentEffectsManager.EnvironmentEffectsManager)

return 
