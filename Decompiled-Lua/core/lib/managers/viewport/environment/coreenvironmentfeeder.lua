-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEnvironmentFeeder"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

local is_editor = Application.editor(slot1)
local platform_intensity_scale = LightIntensityDB.platform_intensity_scale(Application)
local ids_sun_anim_group = Idstring(LightIntensityDB)
local ids_ref_cam_obj = Idstring("d_sun")
local ids_sky = Idstring("rp_skydome")
local ids_top_color = Idstring("sky")
local ids_bottom_color = Idstring("color0")
local ids_ambient_falloff_scale = Idstring("color2")
local ids_ambient_color = Idstring("ambient_falloff_scale")
local ids_sky_top_color = Idstring("ambient_color")
local ids_sky_bottom_color = Idstring("sky_top_color")
local ids_fog_start_color = Idstring("sky_bottom_color")
local ids_fog_far_low_color = Idstring("fog_start_color")
local ids_fog_max_range = Idstring("fog_far_low_color")
local ids_fog_min_range = Idstring("fog_max_range")
local ids_fog_max_density = Idstring("fog_min_range")
local ids_effect_light_scale = Idstring("fog_max_density")
local ids_slice0 = Idstring("effect_light_scale")
local ids_slice1 = Idstring("slice0")
local ids_slice2 = Idstring("slice1")
local ids_slice3 = Idstring("slice2")
local ids_shadow_slice_depths = Idstring("slice3")
local ids_shadow_slice_overlap = Idstring("shadow_slice_depths")
local ids_ssao_radius = Idstring("shadow_slice_overlap")
local ids_ssao_intensity = Idstring("ssao_radius")
local ids_vls_density = Idstring("ssao_intensity")
local ids_vls_weight = Idstring("light_scatter_density")
local ids_vls_decay = Idstring("light_scatter_weight")
local ids_vls_exposure = Idstring("light_scatter_decay")
local ids_reflection_texture = Idstring("light_scatter_exposure")
local ids_bloom_intensity = Idstring("reflection_texture")
local ids_ghost_dispersal = Idstring("bloom_intensity")
local ids_halo_width = Idstring("ghost_dispersal")
local ids_chromatic_distortion = Idstring("halo_width")
local ids_weight_exponent = Idstring("chromatic_distortion")
local ids_downsample_scale = Idstring("weight_exponent")
local ids_downsample_bias = Idstring("downsample_scale")
local ids_cg_LUT1 = Idstring("downsample_bias")
local ids_cg_LUT2 = Idstring("filter_color_texture")
local ids_gloss_factor = Idstring("refraction_texture")
local ids_spec_factor = Idstring("gloss_factor")
local ids_lens_flare_modifier = Idstring("spec_factor")
local ids_post_lens_flare = Idstring("lens_flare_material")
local ids_post_lens_flare_apply = Idstring("lens_flare_post_processor")
local ids_lens_flare_effect = Idstring("lens_flare_apply_post_processor")
local ids_lens_flare_apply_effect = Idstring("lens_flare_effect")
slot48 = "post_effect/lens_flare_post_processor/lens_flare_effect/lens_flare_material"
local ids_lens_flare_id = Idstring("lens_flare_apply_effect").key("lens_flare_apply_effect")
local ids_cg = Idstring(Idstring("lens_flare_apply_effect"))
local ids_cg_modifier = Idstring("colorgrade")
local ids_post_cg = Idstring("lut_settings")
slot52 = "post_effect/color_grading_post/colorgrade/colorgrade"
local ids_cg_id = Idstring("color_grading_post").key("color_grading_post")
local ids_post_DOF_modifier = Idstring(Idstring("color_grading_post"))
local ids_post_bloom_prepare = Idstring("post_DOF")
local ids_post_bloom_combine = Idstring("bloom_prepare_post_processor")
local ids_bloom_dof_effect = Idstring("bloom_combine_post_processor")
local ids_dof_effect = Idstring("bloom_DOF_combine")
local ids_bloom_prepare_effect = Idstring("DOF")
local ids_deferred = Idstring("bloom_prepare")
local ids_deferred_lighting = Idstring("deferred")
local ids_apply_ambient = Idstring("deferred_lighting")
slot62 = "post_effect/deferred/deferred_lighting/apply_ambient"
local ids_apply_ambient_id = Idstring("apply_ambient").key("apply_ambient")
local ids_post_SSAO = Idstring(Idstring("apply_ambient"))
local ids_SSAO = Idstring("SSAO_post_processor")
local ids_apply_SSAO = Idstring("SSAO")
slot66 = "post_effect/SSAO_post_processor/SSAO/ "
local ids_apply_SSAO_id = Idstring("apply_SSAO").key("apply_SSAO")
local ids_vls = Idstring(Idstring("apply_SSAO"))
local ids_post_vls = Idstring("volumetric_light_scatter")
slot69 = "post_effect/volumetric_light_scatter/volumetric_light_scatter/post_volumetric_light_scatter"
local ids_post_vls_id = Idstring("post_volumetric_light_scatter").key("post_volumetric_light_scatter")
local ids_shadow_processor = Idstring(Idstring("post_volumetric_light_scatter"))
local ids_shadow_rendering = Idstring("shadow_processor")
local ids_shadow_modifier = Idstring("shadow_rendering")
slot73 = "post_effect/shadow_processor/shadow_rendering/shadow_modifier"
local ids_shadow_modifier_id = Idstring("shadow_modifier").key("shadow_modifier")
local ids_normal = Idstring(Idstring("shadow_modifier"))
local ids_cubemap = Idstring("normal")
slot78 = 0
local zero_rotation = Rotation("cubemap", 0, 0)
slot79 = 0
local zero_vector3 = Vector3(0, 0, 0)
slot80 = 0
local temp_rotation = Rotation(0, 0, 0)
slot81 = 0
local temp_vector3 = Vector3(0, 0, 0)
Feeder = Feeder or CoreClass.class()
Feeder.APPLY_GROUP_ID = 0
Feeder.DATA_PATH_KEY = nil
Feeder.IS_GLOBAL = nil
Feeder.AFFECTED_LIST = nil
Feeder.FILTER_CATEGORY = "Others"
Feeder.init = function (self, current)
	slot5 = current

	self.set(slot3, self)

	return 
end
Feeder.destroy = function (self)
	self._source = nil
	self._target = nil

	return 
end
Feeder.get_next_id = function ()
	Feeder.APPLY_GROUP_ID = Feeder.APPLY_GROUP_ID + 1

	return Feeder.APPLY_GROUP_ID
end
Feeder.set_target = function (self, target)
	self._source = self._current
	self._target = target

	return 
end
Feeder.equals = function (self, value)
	return self._current == value
end
Feeder.get_current = function (self)
	return self._current
end
Feeder.set = function (self, current)
	self._current = current
	self._source = current
	self._target = current

	return 
end
Feeder.get_modifier = function (self)
	return self._modifier_func, self._is_modifier_override
end
Feeder.set_modifier = function (self, modifier_func, is_modifier_override)
	self._modifier_func = modifier_func
	self._is_modifier_override = is_modifier_override

	return 
end
Feeder.update = function (self, handler, scale)
	if self._modifier_func then
		local is_done, is_not_changed = nil

		if not self._is_modifier_override then
			slot9 = scale
			is_done, is_not_changed = self.update_current(slot6, self, handler)
		end

		slot11 = is_not_changed
		self._current, is_done, is_not_changed = self._modifier_func(slot6, handler, self, scale, is_done)

		return is_done, is_not_changed
	else
		slot7 = scale

		return self.update_current(slot4, self, handler)
	end

	return 
end
Feeder.update_current = function (self, handler, scale)
	slot7 = scale
	self._current = math.lerp(slot4, self._source, self._target)

	return scale == 1, false
end
Feeder._set_variable = function (self, viewport, scene, pp, effect, modifier_id, variable)
	slot12 = effect
	local post_processor = viewport.get_post_processor_effect(slot8, viewport, scene, pp)

	if post_processor then
		slot11 = modifier_id
		local modifier = post_processor.modifier(slot9, post_processor)

		if modifier then
			slot11 = modifier
			material = modifier.material(slot10)
			slot13 = self._current

			material.set_variable(slot10, material, variable)
		end
	end

	return 
end
Feeder.apply = function (self, handler, viewport, scene)
	return 
end

if not Vector3Feeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

Vector3Feeder = slot78
Vector3Feeder.set = function (self, current)
	slot4 = current
	self._current = mvector3.copy(slot3)
	self._source = current
	self._target = current

	return 
end
Vector3Feeder.set_target = function (self, target)
	slot4 = self._current
	self._source = mvector3.copy(slot3)
	self._target = target

	return 
end
Vector3Feeder.equals = function (self, value)
	slot5 = value

	return mvector3.equal(slot3, self._current)
end
Vector3Feeder.update_current = function (self, handler, scale)
	slot8 = scale

	mvector3.lerp(slot4, self._current, self._source, self._target)

	return scale == 1, false
end

if not StringFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

StringFeeder = slot78
StringFeeder.update_current = function (self, handler, scale)
	if 0.5 < scale then
		self._current = self._target

		return true, false
	else
		return false, true
	end

	return 
end

if not ColorgradeFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

ColorgradeFeeder = slot78
slot81 = "others/colorgrade"
slot81 = Idstring(slot80)
ColorgradeFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
ColorgradeFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
ColorgradeFeeder.IS_GLOBAL = nil
ColorgradeFeeder.FILTER_CATEGORY = "Colorgrade"
ColorgradeFeeder.set_target = function (self, target)
	self._source = self._target
	slot4 = target
	self._target = Idstring(slot3)
	self._current = 0

	return 
end
ColorgradeFeeder.equals = function (self, value)
	return false
end
ColorgradeFeeder.set = function (self, current)
	slot4 = current
	self._source = Idstring(slot3)
	slot4 = current
	self._target = Idstring(slot3)
	self._current = 0

	return 
end
ColorgradeFeeder.update = function (self, handler, scale)
	slot7 = scale

	return self.update_current(slot4, self, handler)
end
ColorgradeFeeder.update_current = function (self, handler, scale)
	self._current = scale

	return scale == 1, false
end
ColorgradeFeeder.apply = function (self, handler, viewport, scene)
	slot7 = ""

	if self._source ~= Idstring(slot6) then
		slot7 = ""

		if self._target ~= Idstring(slot6) then
			slot9 = ids_cg
			local post_processor = viewport.get_post_processor_effect(slot5, viewport, scene, ids_post_cg)
			slot8 = ids_cg_modifier
			local modifier = post_processor.modifier(viewport, post_processor)

			if modifier then
				local material = modifier.material(slot7)
				slot14 = 0

				Application.set_material_texture(modifier, Application, material, ids_cg_LUT1, self._source, ids_normal)

				slot14 = 0

				Application.set_material_texture(modifier, Application, material, ids_cg_LUT2, self._target, ids_normal)

				slot10 = self._current

				managers.environment_controller.set_lut_lerp_value(modifier, managers.environment_controller)
			end
		end
	end

	return 
end

if not UnderlayPathFeeder then
	slot80 = StringFeeder
	slot78 = CoreClass.class(slot79)
end

UnderlayPathFeeder = slot78
UnderlayPathFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
slot81 = "others/underlay"
slot81 = Idstring(slot80)
UnderlayPathFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
UnderlayPathFeeder.IS_GLOBAL = true
UnderlayPathFeeder.FILTER_CATEGORY = "Underlay path"
UnderlayPathFeeder.apply = function (self, handler, viewport, scene)

	-- Decompilation error in this vicinity:
	slot6 = Global._global_light

	if CoreCode.alive(slot5) then
		slot7 = Global._global_light

		World.delete_light(slot5, World)
	end

	slot6 = Global._underlay_ref_camera

	if CoreCode.alive(slot5) then
		slot7 = Global._underlay_ref_camera

		Underlay.delete_camera(slot5, Underlay)
	end

	slot9 = false

	Underlay.load(slot6, Underlay, underlay_path)

	slot6 = World.create_light(Underlay, World)
	Global._global_light = slot6
	slot7 = Global._global_light
	slot11 = ids_sun_anim_group

	Global._global_light.link(slot6, Underlay.get_object("directional|specular", Underlay))

	slot8 = zero_rotation

	Global._global_light.set_local_rotation(slot6, Global._global_light)

	slot8 = Global._global_light

	World.set_global_shadow_caster(slot6, World)

	slot8 = Underlay
	slot6 = Underlay.create_camera(World)
	Global._underlay_ref_camera = slot6
	slot8 = 1000

	Global._underlay_ref_camera.set_near_range(slot6, Global._underlay_ref_camera)

	slot8 = 10000000

	Global._underlay_ref_camera.set_far_range(slot6, Global._underlay_ref_camera)

	slot8 = 75

	Global._underlay_ref_camera.set_fov(slot6, Global._underlay_ref_camera)

	slot9 = ids_sky
	UnderlayPathFeeder.sky_material = Underlay.material(Global._underlay_ref_camera, Underlay)
	slot6 = Underlay.get_object(Global._underlay_ref_camera, Underlay)
	UnderlayPathFeeder.ref_cam_obj = slot6
	slot7 = Global._underlay_ref_camera
	slot10 = UnderlayPathFeeder.ref_cam_obj

	Global._underlay_ref_camera.set_local_position(slot6, UnderlayPathFeeder.ref_cam_obj.position(ids_ref_cam_obj))

	slot8 = Global._underlay_ref_camera

	Underlay.set_reference_camera(slot6, Underlay)

	Global._current_underlay_name = self._current

	return 
end

if not GlobalLightColorFeeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

GlobalLightColorFeeder = slot78
slot81 = "others/sun_ray_color"
slot81 = Idstring(slot80)
GlobalLightColorFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
GlobalLightColorFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
GlobalLightColorFeeder.IS_GLOBAL = true
GlobalLightColorFeeder.FILTER_CATEGORY = "Sun"
GlobalLightColorFeeder.apply = function (self, handler, viewport, scene)
	slot6 = Global._global_light

	if alive(slot5) then
		slot7 = GlobalLightColorFeeder.DATA_PATH_KEY
		local color = handler.get_value(slot5, handler)

		if color then
			slot8 = GlobalLightColorScaleFeeder.DATA_PATH_KEY
			local color_scale = handler.get_value(slot6, handler) or 1
			slot9 = color

			mvector3.set(slot7, temp_vector3)

			slot9 = color_scale

			mvector3.multiply(slot7, temp_vector3)

			slot9 = temp_vector3

			Global._global_light.set_color(slot7, Global._global_light)
		else
			slot8 = zero_vector3

			Global._global_light.set_color(slot6, Global._global_light)
		end
	else
		slot7 = "[EnvironmentManager][GlobalLightFeeder] No underlay loaded."

		Application.error(slot5, Application)
	end

	return 
end

if not GlobalLightColorScaleFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

GlobalLightColorScaleFeeder = slot78
slot81 = "others/sun_ray_color_scale"
slot81 = Idstring(slot80)
GlobalLightColorScaleFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
GlobalLightColorScaleFeeder.APPLY_GROUP_ID = GlobalLightColorFeeder.APPLY_GROUP_ID
GlobalLightColorScaleFeeder.IS_GLOBAL = GlobalLightColorFeeder.IS_GLOBAL
GlobalLightColorScaleFeeder.FILTER_CATEGORY = GlobalLightColorFeeder.FILTER_CATEGORY
GlobalLightColorScaleFeeder.apply = GlobalLightColorFeeder.apply

if not CubeMapTextureFeeder then
	slot80 = StringFeeder
	slot78 = CoreClass.class(slot79)
end

CubeMapTextureFeeder = slot78
slot81 = "others/global_texture"
slot81 = Idstring(slot80)
CubeMapTextureFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
CubeMapTextureFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
CubeMapTextureFeeder.IS_GLOBAL = nil
CubeMapTextureFeeder.FILTER_CATEGORY = "Cubemap"
CubeMapTextureFeeder.apply = function (self, handler, viewport, scene)
	slot9 = "CUBEMAP"

	managers.global_texture.set_texture(slot5, managers.global_texture, "current_global_texture", self._current)

	slot9 = ids_deferred_lighting
	local post_processor = viewport.get_post_processor_effect(slot5, viewport, scene, ids_deferred)

	if post_processor then
		slot8 = ids_apply_ambient
		local modifier = post_processor.modifier(slot6, post_processor)

		if modifier then
			local ids_current = Idstring(slot7)
			slot9 = ""

			if ids_current ~= Idstring(self._current) then
				slot9 = modifier
				material = modifier.material(slot8)
				slot14 = 0

				Application.set_material_texture(slot8, Application, material, ids_reflection_texture, ids_current, ids_cubemap)
			end
		end
	end

	return 
end

if not WorldOverlayTextureFeeder then
	slot80 = StringFeeder
	slot78 = CoreClass.class(slot79)
end

WorldOverlayTextureFeeder = slot78
slot81 = "others/global_world_overlay_texture"
slot81 = Idstring(slot80)
WorldOverlayTextureFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
WorldOverlayTextureFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
WorldOverlayTextureFeeder.IS_GLOBAL = true
WorldOverlayTextureFeeder.FILTER_CATEGORY = "GlobalTexture"
WorldOverlayTextureFeeder.apply = function (self, handler, viewport, scene)
	slot9 = "texture"

	managers.global_texture.set_texture(slot5, managers.global_texture, "current_global_world_overlay_texture", self._current)

	return 
end

if not WorldOverlayMaskTextureFeeder then
	slot80 = StringFeeder
	slot78 = CoreClass.class(slot79)
end

WorldOverlayMaskTextureFeeder = slot78
slot81 = "others/global_world_overlay_mask_texture"
slot81 = Idstring(slot80)
WorldOverlayMaskTextureFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
WorldOverlayMaskTextureFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
WorldOverlayMaskTextureFeeder.IS_GLOBAL = true
WorldOverlayMaskTextureFeeder.FILTER_CATEGORY = "GlobalTexture"
WorldOverlayMaskTextureFeeder.apply = function (self, handler, viewport, scene)
	slot9 = "texture"

	managers.global_texture.set_texture(slot5, managers.global_texture, "current_global_world_overlay_mask_texture", self._current)

	return 
end

if not SkyRotationFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

SkyRotationFeeder = slot78
slot81 = "others/sky_rotation"
slot81 = Idstring(slot80)
SkyRotationFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
SkyRotationFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
SkyRotationFeeder.IS_GLOBAL = true
SkyRotationFeeder.FILTER_CATEGORY = false
SkyRotationFeeder.apply = function (self, handler, viewport, scene)
	slot6 = UnderlayPathFeeder.ref_cam_obj

	if alive(slot5) then
		slot9 = 0

		mrotation.set_yaw_pitch_roll(slot5, temp_rotation, -self._current, 0)

		slot7 = temp_rotation

		UnderlayPathFeeder.ref_cam_obj.set_rotation(slot5, UnderlayPathFeeder.ref_cam_obj)
	elseif UnderlayPathFeeder.ref_cam_obj then
		slot7 = "[SkyRotationFeeder:apply] ref_cam_obj exists, but is destroyed"

		Application.error(slot5, Application)
	end

	return 
end

if not UnderlaySkyTopColorFeeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

UnderlaySkyTopColorFeeder = slot78
slot81 = "underlay_effect/sky/color0"
slot81 = Idstring(slot80)
UnderlaySkyTopColorFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
UnderlaySkyTopColorFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
UnderlaySkyTopColorFeeder.IS_GLOBAL = true
UnderlaySkyTopColorFeeder.FILTER_CATEGORY = "Sky"
UnderlaySkyTopColorFeeder.apply = function (self, handler, viewport, scene)
	slot6 = UnderlayPathFeeder.sky_material

	if alive(slot5) then
		slot7 = UnderlaySkyTopColorFeeder.DATA_PATH_KEY
		local color = handler.get_value(slot5, handler)

		if color then
			slot8 = UnderlaySkyTopColorScaleFeeder.DATA_PATH_KEY
			local color_scale = handler.get_value(slot6, handler) or 1
			slot9 = color

			mvector3.set(slot7, temp_vector3)

			slot9 = color_scale

			mvector3.multiply(slot7, temp_vector3)

			slot10 = temp_vector3

			UnderlayPathFeeder.sky_material.set_variable(slot7, UnderlayPathFeeder.sky_material, ids_top_color)
		else
			slot9 = zero_vector3

			UnderlayPathFeeder.sky_material.set_variable(slot6, UnderlayPathFeeder.sky_material, ids_top_color)
		end
	elseif UnderlayPathFeeder.sky_material then
		slot7 = "[UnderlaySkyTopColorFeeder:apply] sky_material exists, but is destroyed"

		Application.error(slot5, Application)
	end

	return 
end

if not UnderlaySkyTopColorScaleFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

UnderlaySkyTopColorScaleFeeder = slot78
slot81 = "underlay_effect/sky/color0_scale"
slot81 = Idstring(slot80)
UnderlaySkyTopColorScaleFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
UnderlaySkyTopColorScaleFeeder.APPLY_GROUP_ID = UnderlaySkyTopColorFeeder.APPLY_GROUP_ID
UnderlaySkyTopColorScaleFeeder.IS_GLOBAL = UnderlaySkyTopColorFeeder.IS_GLOBAL
UnderlaySkyTopColorScaleFeeder.FILTER_CATEGORY = UnderlaySkyTopColorFeeder.FILTER_CATEGORY
UnderlaySkyTopColorScaleFeeder.apply = UnderlaySkyTopColorFeeder.apply

if not UnderlaySkyBottomColorFeeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

UnderlaySkyBottomColorFeeder = slot78
slot81 = "underlay_effect/sky/color2"
slot81 = Idstring(slot80)
UnderlaySkyBottomColorFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
UnderlaySkyBottomColorFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
UnderlaySkyBottomColorFeeder.IS_GLOBAL = true
UnderlaySkyBottomColorFeeder.FILTER_CATEGORY = "Sky"
UnderlaySkyBottomColorFeeder.apply = function (self, handler, viewport, scene)
	slot6 = UnderlayPathFeeder.sky_material

	if alive(slot5) then
		slot7 = UnderlaySkyBottomColorFeeder.DATA_PATH_KEY
		local color = handler.get_value(slot5, handler)

		if color then
			slot8 = UnderlaySkyBottomColorScaleFeeder.DATA_PATH_KEY
			local color_scale = handler.get_value(slot6, handler) or 1
			slot9 = color

			mvector3.set(slot7, temp_vector3)

			slot9 = color_scale

			mvector3.multiply(slot7, temp_vector3)

			slot10 = temp_vector3

			UnderlayPathFeeder.sky_material.set_variable(slot7, UnderlayPathFeeder.sky_material, ids_bottom_color)
		else
			slot9 = zero_vector3

			UnderlayPathFeeder.sky_material.set_variable(slot6, UnderlayPathFeeder.sky_material, ids_bottom_color)
		end
	elseif UnderlayPathFeeder.sky_material then
		slot7 = "[UnderlaySkyBottomColorFeeder:apply] sky_material exists, but is destroyed"

		Application.error(slot5, Application)
	end

	return 
end

if not UnderlaySkyBottomColorScaleFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

UnderlaySkyBottomColorScaleFeeder = slot78
slot81 = "underlay_effect/sky/color2_scale"
slot81 = Idstring(slot80)
UnderlaySkyBottomColorScaleFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
UnderlaySkyBottomColorScaleFeeder.APPLY_GROUP_ID = UnderlaySkyBottomColorFeeder.APPLY_GROUP_ID
UnderlaySkyBottomColorScaleFeeder.IS_GLOBAL = UnderlaySkyBottomColorFeeder.IS_GLOBAL
UnderlaySkyBottomColorScaleFeeder.FILTER_CATEGORY = UnderlaySkyBottomColorFeeder.FILTER_CATEGORY
UnderlaySkyBottomColorScaleFeeder.apply = UnderlaySkyBottomColorFeeder.apply

if not PostSpecFactorFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostSpecFactorFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/spec_factor"
slot81 = Idstring(slot80)
PostSpecFactorFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostSpecFactorFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostSpecFactorFeeder.IS_GLOBAL = nil
PostSpecFactorFeeder.FILTER_CATEGORY = "Ambient"
PostSpecFactorFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot9 = self._current

	material.set_variable(handler, material, ids_spec_factor)

	return 
end

if not PostGlossFactorFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostGlossFactorFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/gloss_factor"
slot81 = Idstring(slot80)
PostGlossFactorFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostGlossFactorFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostGlossFactorFeeder.IS_GLOBAL = nil
PostGlossFactorFeeder.FILTER_CATEGORY = "Ambient"
PostGlossFactorFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot9 = self._current

	material.set_variable(handler, material, ids_gloss_factor)

	return 
end

if not PostAmbientFalloffScaleFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostAmbientFalloffScaleFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/ambient_falloff_scale"
slot81 = Idstring(slot80)
PostAmbientFalloffScaleFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostAmbientFalloffScaleFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostAmbientFalloffScaleFeeder.IS_GLOBAL = nil
PostAmbientFalloffScaleFeeder.FILTER_CATEGORY = "Ambient"
PostAmbientFalloffScaleFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot9 = self._current

	material.set_variable(handler, material, ids_ambient_falloff_scale)

	return 
end

if not PostAmbientColorFeeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostAmbientColorFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/ambient_color"
slot81 = Idstring(slot80)
PostAmbientColorFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostAmbientColorFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostAmbientColorFeeder.IS_GLOBAL = nil
PostAmbientColorFeeder.FILTER_CATEGORY = "Ambient"
PostAmbientColorFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot8 = PostAmbientColorFeeder.DATA_PATH_KEY
	local color = handler.get_value(handler, handler)

	if color then
		slot9 = PostAmbientColorScaleFeeder.DATA_PATH_KEY
		local color_scale = handler.get_value(slot7, handler) or 1
		slot10 = color

		mvector3.set(slot8, temp_vector3)

		slot10 = color_scale * platform_intensity_scale

		mvector3.multiply(slot8, temp_vector3)

		slot11 = temp_vector3

		material.set_variable(slot8, material, ids_ambient_color)
	else
		slot10 = zero_vector3

		material.set_variable(slot7, material, ids_ambient_color)
	end

	return 
end

if not PostAmbientColorScaleFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostAmbientColorScaleFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/ambient_color_scale"
slot81 = Idstring(slot80)
PostAmbientColorScaleFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostAmbientColorScaleFeeder.APPLY_GROUP_ID = PostAmbientColorFeeder.APPLY_GROUP_ID
PostAmbientColorScaleFeeder.IS_GLOBAL = PostAmbientColorFeeder.IS_GLOBAL
PostAmbientColorScaleFeeder.FILTER_CATEGORY = PostAmbientColorFeeder.FILTER_CATEGORY
PostAmbientColorScaleFeeder.apply = PostAmbientColorFeeder.apply

if not PostSkyTopColorFeeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostSkyTopColorFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/sky_top_color"
slot81 = Idstring(slot80)
PostSkyTopColorFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostSkyTopColorFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostSkyTopColorFeeder.IS_GLOBAL = nil
PostSkyTopColorFeeder.FILTER_CATEGORY = "Ambient"
PostSkyTopColorFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot8 = PostSkyTopColorFeeder.DATA_PATH_KEY
	local color = handler.get_value(handler, handler)

	if color then
		slot9 = PostSkyTopColorScaleFeeder.DATA_PATH_KEY
		local color_scale = handler.get_value(slot7, handler) or 1
		slot10 = color

		mvector3.set(slot8, temp_vector3)

		slot10 = color_scale * platform_intensity_scale

		mvector3.multiply(slot8, temp_vector3)

		slot11 = temp_vector3

		material.set_variable(slot8, material, ids_sky_top_color)
	else
		slot10 = zero_vector3

		material.set_variable(slot7, material, ids_sky_top_color)
	end

	return 
end

if not PostSkyTopColorScaleFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostSkyTopColorScaleFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/sky_top_color_scale"
slot81 = Idstring(slot80)
PostSkyTopColorScaleFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostSkyTopColorScaleFeeder.APPLY_GROUP_ID = PostSkyTopColorFeeder.APPLY_GROUP_ID
PostSkyTopColorScaleFeeder.IS_GLOBAL = PostSkyTopColorFeeder.IS_GLOBAL
PostSkyTopColorScaleFeeder.FILTER_CATEGORY = PostSkyTopColorFeeder.FILTER_CATEGORY
PostSkyTopColorScaleFeeder.apply = PostSkyTopColorFeeder.apply

if not PostSkyBottomColorFeeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostSkyBottomColorFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/sky_bottom_color"
slot81 = Idstring(slot80)
PostSkyBottomColorFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostSkyBottomColorFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostSkyBottomColorFeeder.IS_GLOBAL = nil
PostSkyBottomColorFeeder.FILTER_CATEGORY = "Ambient"
PostSkyBottomColorFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot8 = PostSkyBottomColorFeeder.DATA_PATH_KEY
	local color = handler.get_value(handler, handler)

	if color then
		slot9 = PostSkyBottomColorScaleFeeder.DATA_PATH_KEY
		local color_scale = handler.get_value(slot7, handler) or 1
		slot10 = color

		mvector3.set(slot8, temp_vector3)

		slot10 = color_scale * platform_intensity_scale

		mvector3.multiply(slot8, temp_vector3)

		slot11 = temp_vector3

		material.set_variable(slot8, material, ids_sky_bottom_color)
	else
		slot10 = zero_vector3

		material.set_variable(slot7, material, ids_sky_bottom_color)
	end

	return 
end

if not PostSkyBottomColorScaleFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostSkyBottomColorScaleFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/sky_bottom_color_scale"
slot81 = Idstring(slot80)
PostSkyBottomColorScaleFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostSkyBottomColorScaleFeeder.APPLY_GROUP_ID = PostSkyBottomColorFeeder.APPLY_GROUP_ID
PostSkyBottomColorScaleFeeder.IS_GLOBAL = PostSkyBottomColorFeeder.IS_GLOBAL
PostSkyBottomColorScaleFeeder.FILTER_CATEGORY = PostSkyBottomColorFeeder.FILTER_CATEGORY
PostSkyBottomColorScaleFeeder.apply = PostSkyBottomColorFeeder.apply

if not PostFogStartColorFeeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostFogStartColorFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/fog_start_color"
slot81 = Idstring(slot80)
PostFogStartColorFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostFogStartColorFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostFogStartColorFeeder.IS_GLOBAL = nil
PostFogStartColorFeeder.FILTER_CATEGORY = "Fog"
PostFogStartColorFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot8 = self._current

	mvector3.set(handler, temp_vector3)

	slot8 = platform_intensity_scale

	mvector3.multiply(handler, temp_vector3)

	slot9 = temp_vector3

	material.set_variable(handler, material, ids_fog_start_color)

	return 
end

if not PostFogFarLowColorFeeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostFogFarLowColorFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/fog_far_low_color"
slot81 = Idstring(slot80)
PostFogFarLowColorFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostFogFarLowColorFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostFogFarLowColorFeeder.IS_GLOBAL = nil
PostFogFarLowColorFeeder.FILTER_CATEGORY = "Fog"
PostFogFarLowColorFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot8 = self._current

	mvector3.set(handler, temp_vector3)

	slot8 = platform_intensity_scale

	mvector3.multiply(handler, temp_vector3)

	slot9 = temp_vector3

	material.set_variable(handler, material, ids_fog_far_low_color)

	return 
end

if not PostFogMinRangeFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostFogMinRangeFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/fog_min_range"
slot81 = Idstring(slot80)
PostFogMinRangeFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostFogMinRangeFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostFogMinRangeFeeder.IS_GLOBAL = nil
PostFogMinRangeFeeder.FILTER_CATEGORY = "Fog"
PostFogMinRangeFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot9 = self._current

	material.set_variable(handler, material, ids_fog_min_range)

	return 
end

if not PostFogMaxRangeFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostFogMaxRangeFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/fog_max_range"
slot81 = Idstring(slot80)
PostFogMaxRangeFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostFogMaxRangeFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostFogMaxRangeFeeder.IS_GLOBAL = nil
PostFogMaxRangeFeeder.FILTER_CATEGORY = "Fog"
PostFogMaxRangeFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot9 = self._current

	material.set_variable(handler, material, ids_fog_max_range)

	return 
end

if not PostFogMaxDensityFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostFogMaxDensityFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/fog_max_density"
slot81 = Idstring(slot80)
PostFogMaxDensityFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostFogMaxDensityFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostFogMaxDensityFeeder.IS_GLOBAL = nil
PostFogMaxDensityFeeder.FILTER_CATEGORY = "Fog"
PostFogMaxDensityFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot9 = self._current

	material.set_variable(handler, material, ids_fog_max_density)

	return 
end

if not PostEffectLightScaleFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostEffectLightScaleFeeder = slot78
slot81 = "post_effect/deferred/deferred_lighting/apply_ambient/effect_light_scale"
slot81 = Idstring(slot80)
PostEffectLightScaleFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostEffectLightScaleFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostEffectLightScaleFeeder.IS_GLOBAL = nil
PostEffectLightScaleFeeder.FILTER_CATEGORY = "Ambient"
PostEffectLightScaleFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_ambient
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_ambient_id, ids_deferred, ids_deferred_lighting)
	slot9 = self._current

	material.set_variable(handler, material, ids_effect_light_scale)

	return 
end

if not SSAORadiusFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

SSAORadiusFeeder = slot78
slot81 = "post_effect/SSAO_post_processor/SSAO/apply_SSAO/ssao_radius"
slot81 = Idstring(slot80)
SSAORadiusFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
SSAORadiusFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
SSAORadiusFeeder.IS_GLOBAL = nil
SSAORadiusFeeder.FILTER_CATEGORY = "Ambient"
SSAORadiusFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_apply_SSAO
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_SSAO_id, ids_post_SSAO, ids_SSAO)
	slot9 = self._current

	material.set_variable(handler, material, ids_ssao_radius)

	return 
end

if not SSAOIntensityFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

SSAOIntensityFeeder = slot78
slot81 = "post_effect/SSAO_post_processor/SSAO/apply_SSAO/ssao_intensity"
slot81 = Idstring(slot80)
SSAOIntensityFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
SSAOIntensityFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
SSAOIntensityFeeder.IS_GLOBAL = nil
SSAOIntensityFeeder.FILTER_CATEGORY = "Ambient"
SSAOIntensityFeeder.apply = function (self, handler, viewport, scene)
	slot6 = managers.environment_controller
	slot10 = "ssao_setting"

	managers.environment_controller.set_ssao_setting(slot5, managers.user.get_setting(slot8, managers.user))

	slot12 = ids_apply_SSAO
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_apply_SSAO_id, ids_post_SSAO, ids_SSAO)
	slot9 = self._current

	material.set_variable(handler, material, ids_ssao_intensity)

	return 
end

if not PostBloomIntensityFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostBloomIntensityFeeder = slot78
slot81 = "post_effect/bloom_combine_post_processor/bloom_DOF_combine/post_DOF/bloom_intensity"
slot81 = Idstring(slot80)
PostBloomIntensityFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostBloomIntensityFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostBloomIntensityFeeder.IS_GLOBAL = nil
PostBloomIntensityFeeder.FILTER_CATEGORY = "Sun"
PostBloomIntensityFeeder.apply = function (self, handler, viewport, scene)
	local has_bloom = 1e-05 < self._current
	slot10 = ids_bloom_prepare_effect
	local bloom_prepare_effect = viewport.get_post_processor_effect(slot6, viewport, scene, ids_post_bloom_prepare)
	slot9 = has_bloom

	bloom_prepare_effect.set_visibility(viewport, bloom_prepare_effect)

	if has_bloom then
		if not is_editor then
			slot11 = ids_bloom_dof_effect

			viewport.set_post_processor_effect(slot7, viewport, "World", ids_post_bloom_combine)
		end

		slot14 = ids_bloom_intensity

		self._set_variable(slot7, self, viewport, scene, ids_post_bloom_combine, ids_bloom_dof_effect, ids_post_DOF_modifier)
	elseif not is_editor then
		slot11 = ids_dof_effect

		viewport.set_post_processor_effect(slot7, viewport, "World", ids_post_bloom_combine)
	end

	return 
end

if not PostLFGhostDispersalFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostLFGhostDispersalFeeder = slot78
slot81 = "post_effect/lens_flare_post_processor/lens_flare_effect/lens_flare_material/ghost_dispersal"
slot81 = Idstring(slot80)
PostLFGhostDispersalFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostLFGhostDispersalFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostLFGhostDispersalFeeder.IS_GLOBAL = nil
PostLFGhostDispersalFeeder.FILTER_CATEGORY = "Sun"
PostLFGhostDispersalFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_ghost_dispersal

	self._set_variable(slot5, self, viewport, scene, ids_post_lens_flare, ids_lens_flare_effect, ids_lens_flare_modifier)

	return 
end

if not PostLFHaloWidthFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostLFHaloWidthFeeder = slot78
slot81 = "post_effect/lens_flare_post_processor/lens_flare_effect/lens_flare_material/halo_width"
slot81 = Idstring(slot80)
PostLFHaloWidthFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostLFHaloWidthFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostLFHaloWidthFeeder.IS_GLOBAL = nil
PostLFHaloWidthFeeder.FILTER_CATEGORY = "Sun"
PostLFHaloWidthFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_halo_width

	self._set_variable(slot5, self, viewport, scene, ids_post_lens_flare, ids_lens_flare_effect, ids_lens_flare_modifier)

	return 
end

if not PostLFChromaticDistortionFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostLFChromaticDistortionFeeder = slot78
slot81 = "post_effect/lens_flare_post_processor/lens_flare_effect/lens_flare_material/chromatic_distortion"
slot81 = Idstring(slot80)
PostLFChromaticDistortionFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostLFChromaticDistortionFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostLFChromaticDistortionFeeder.IS_GLOBAL = nil
PostLFChromaticDistortionFeeder.FILTER_CATEGORY = "Sun"
PostLFChromaticDistortionFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_chromatic_distortion

	self._set_variable(slot5, self, viewport, scene, ids_post_lens_flare, ids_lens_flare_effect, ids_lens_flare_modifier)

	return 
end

if not PostLFWeightExponentFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostLFWeightExponentFeeder = slot78
slot81 = "post_effect/lens_flare_post_processor/lens_flare_effect/lens_flare_material/weight_exponent"
slot81 = Idstring(slot80)
PostLFWeightExponentFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostLFWeightExponentFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostLFWeightExponentFeeder.IS_GLOBAL = nil
PostLFWeightExponentFeeder.FILTER_CATEGORY = "Sun"
PostLFWeightExponentFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_weight_exponent

	self._set_variable(slot5, self, viewport, scene, ids_post_lens_flare, ids_lens_flare_effect, ids_lens_flare_modifier)

	return 
end

if not PostLFDownsampleScaleFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostLFDownsampleScaleFeeder = slot78
slot81 = "post_effect/lens_flare_post_processor/lens_flare_effect/lens_flare_material/downsample_scale"
slot81 = Idstring(slot80)
PostLFDownsampleScaleFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostLFDownsampleScaleFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostLFDownsampleScaleFeeder.IS_GLOBAL = nil
PostLFDownsampleScaleFeeder.FILTER_CATEGORY = "Sun"
PostLFDownsampleScaleFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_downsample_scale

	self._set_variable(slot5, self, viewport, scene, ids_post_lens_flare, ids_lens_flare_effect, ids_lens_flare_modifier)

	return 
end

if not PostLFDownsampleBiasFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostLFDownsampleBiasFeeder = slot78
slot81 = "post_effect/lens_flare_post_processor/lens_flare_effect/lens_flare_material/downsample_bias"
slot81 = Idstring(slot80)
PostLFDownsampleBiasFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostLFDownsampleBiasFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostLFDownsampleBiasFeeder.IS_GLOBAL = nil
PostLFDownsampleBiasFeeder.FILTER_CATEGORY = "Sun"
PostLFDownsampleBiasFeeder.apply = function (self, handler, viewport, scene)
	slot9 = ids_lens_flare_effect
	local lens_flare_post = viewport.get_post_processor_effect(slot5, viewport, scene, ids_post_lens_flare)
	slot10 = ids_lens_flare_apply_effect
	local lens_flare_apply_post = viewport.get_post_processor_effect(viewport, viewport, scene, ids_post_lens_flare_apply)
	slot9 = self._current < 1

	lens_flare_post.set_visibility(slot7, lens_flare_post)

	slot9 = self._current < 1

	lens_flare_apply_post.set_visibility(slot7, lens_flare_apply_post)

	local save_current = self._current
	slot11 = self._current
	self._current = Vector3(lens_flare_apply_post, self._current, self._current)
	slot15 = ids_downsample_bias

	self._set_variable(lens_flare_apply_post, self, viewport, scene, ids_post_lens_flare, ids_lens_flare_effect, ids_lens_flare_modifier)

	self._current = save_current

	return 
end

if not PostVLSDensityFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostVLSDensityFeeder = slot78
slot81 = "post_effect/volumetric_light_scatter/volumetric_light_scatter/post_volumetric_light_scatter/light_scatter_density"
slot81 = Idstring(slot80)
PostVLSDensityFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostVLSDensityFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostVLSDensityFeeder.IS_GLOBAL = true
PostVLSDensityFeeder.FILTER_CATEGORY = "Sun"
PostVLSDensityFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_vls_density

	self._set_variable(slot5, self, viewport, scene, ids_vls, ids_vls, ids_post_vls)

	return 
end

if not PostVLSWeightFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostVLSWeightFeeder = slot78
slot81 = "post_effect/volumetric_light_scatter/volumetric_light_scatter/post_volumetric_light_scatter/light_scatter_weight"
slot81 = Idstring(slot80)
PostVLSWeightFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostVLSWeightFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostVLSWeightFeeder.IS_GLOBAL = true
PostVLSWeightFeeder.FILTER_CATEGORY = "Sun"
PostVLSWeightFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_vls_weight

	self._set_variable(slot5, self, viewport, scene, ids_vls, ids_vls, ids_post_vls)

	return 
end

if not PostVLSDecayFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostVLSDecayFeeder = slot78
slot81 = "post_effect/volumetric_light_scatter/volumetric_light_scatter/post_volumetric_light_scatter/light_scatter_decay"
slot81 = Idstring(slot80)
PostVLSDecayFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostVLSDecayFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostVLSDecayFeeder.IS_GLOBAL = true
PostVLSDecayFeeder.FILTER_CATEGORY = "Sun"
PostVLSDecayFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_vls_decay

	self._set_variable(slot5, self, viewport, scene, ids_vls, ids_vls, ids_post_vls)

	return 
end

if not PostVLSExposureFeeder then
	slot80 = Feeder
	slot78 = CoreClass.class(slot79)
end

PostVLSExposureFeeder = slot78
slot81 = "post_effect/volumetric_light_scatter/volumetric_light_scatter/post_volumetric_light_scatter/light_scatter_exposure"
slot81 = Idstring(slot80)
PostVLSExposureFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostVLSExposureFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostVLSExposureFeeder.IS_GLOBAL = true
PostVLSExposureFeeder.FILTER_CATEGORY = "Sun"
PostVLSExposureFeeder.apply = function (self, handler, viewport, scene)
	slot6 = managers.environment_controller
	slot10 = "vls_setting"

	managers.environment_controller.set_volumetric_light_scatter_setting(slot5, managers.user.get_setting(slot8, managers.user))

	slot12 = ids_vls_exposure

	self._set_variable(slot5, self, viewport, scene, ids_vls, ids_vls, ids_post_vls)

	return 
end

if not PostShadowSlice0Feeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostShadowSlice0Feeder = slot78
slot81 = "post_effect/shadow_processor/shadow_rendering/shadow_modifier/slice0"
slot81 = Idstring(slot80)
PostShadowSlice0Feeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostShadowSlice0Feeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostShadowSlice0Feeder.IS_GLOBAL = nil
PostShadowSlice0Feeder.FILTER_CATEGORY = "Shadow"
PostShadowSlice0Feeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_shadow_modifier
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_shadow_modifier_id, ids_shadow_processor, ids_shadow_rendering)
	slot9 = self._current

	material.set_variable(handler, material, ids_slice0)

	return 
end

if not PostShadowSlice1Feeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostShadowSlice1Feeder = slot78
slot81 = "post_effect/shadow_processor/shadow_rendering/shadow_modifier/slice1"
slot81 = Idstring(slot80)
PostShadowSlice1Feeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostShadowSlice1Feeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostShadowSlice1Feeder.IS_GLOBAL = nil
PostShadowSlice1Feeder.FILTER_CATEGORY = "Shadow"
PostShadowSlice1Feeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_shadow_modifier
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_shadow_modifier_id, ids_shadow_processor, ids_shadow_rendering)
	slot9 = self._current

	material.set_variable(handler, material, ids_slice1)

	return 
end

if not PostShadowSlice2Feeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostShadowSlice2Feeder = slot78
slot81 = "post_effect/shadow_processor/shadow_rendering/shadow_modifier/slice2"
slot81 = Idstring(slot80)
PostShadowSlice2Feeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostShadowSlice2Feeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostShadowSlice2Feeder.IS_GLOBAL = nil
PostShadowSlice2Feeder.FILTER_CATEGORY = "Shadow"
PostShadowSlice2Feeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_shadow_modifier
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_shadow_modifier_id, ids_shadow_processor, ids_shadow_rendering)
	slot9 = self._current

	material.set_variable(handler, material, ids_slice2)

	return 
end

if not PostShadowSlice3Feeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostShadowSlice3Feeder = slot78
slot81 = "post_effect/shadow_processor/shadow_rendering/shadow_modifier/slice3"
slot81 = Idstring(slot80)
PostShadowSlice3Feeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostShadowSlice3Feeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostShadowSlice3Feeder.IS_GLOBAL = nil
PostShadowSlice3Feeder.FILTER_CATEGORY = "Shadow"
PostShadowSlice3Feeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_shadow_modifier
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_shadow_modifier_id, ids_shadow_processor, ids_shadow_rendering)
	slot9 = self._current

	material.set_variable(handler, material, ids_slice3)

	return 
end

if not PostShadowSliceDepthsFeeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostShadowSliceDepthsFeeder = slot78
slot81 = "post_effect/shadow_processor/shadow_rendering/shadow_modifier/shadow_slice_depths"
slot81 = Idstring(slot80)
PostShadowSliceDepthsFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostShadowSliceDepthsFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostShadowSliceDepthsFeeder.IS_GLOBAL = nil
PostShadowSliceDepthsFeeder.FILTER_CATEGORY = "Shadow"
PostShadowSliceDepthsFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_shadow_modifier
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_shadow_modifier_id, ids_shadow_processor, ids_shadow_rendering)
	slot9 = self._current

	material.set_variable(handler, material, ids_shadow_slice_depths)

	return 
end

if not PostShadowSliceOverlapFeeder then
	slot80 = Vector3Feeder
	slot78 = CoreClass.class(slot79)
end

PostShadowSliceOverlapFeeder = slot78
slot81 = "post_effect/shadow_processor/shadow_rendering/shadow_modifier/shadow_slice_overlap"
slot81 = Idstring(slot80)
PostShadowSliceOverlapFeeder.DATA_PATH_KEY = Idstring(slot80).key(slot80)
PostShadowSliceOverlapFeeder.APPLY_GROUP_ID = Feeder.get_next_id()
PostShadowSliceOverlapFeeder.IS_GLOBAL = nil
PostShadowSliceOverlapFeeder.FILTER_CATEGORY = "Shadow"
PostShadowSliceOverlapFeeder.apply = function (self, handler, viewport, scene)
	slot12 = ids_shadow_modifier
	local material = handler._get_post_processor_modifier_material(slot5, handler, viewport, scene, ids_shadow_modifier_id, ids_shadow_processor, ids_shadow_rendering)
	slot9 = self._current

	material.set_variable(handler, material, ids_shadow_slice_overlap)

	return 
end
UnderlayPathFeeder.AFFECTED_LIST = {
	GlobalLightColorScaleFeeder,
	GlobalLightColorFeeder,
	SkyRotationFeeder,
	UnderlaySkyTopColorFeeder,
	UnderlaySkyTopColorScaleFeeder,
	UnderlaySkyBottomColorFeeder,
	UnderlaySkyBottomColorScaleFeeder
}

return 
