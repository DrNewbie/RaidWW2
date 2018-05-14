CoreParticleEditorVisualizers = CoreParticleEditorVisualizers or class()
local min_keys = 1
local max_keys = 8
function CoreParticleEditorVisualizers:create_billboard()
	slot6 = "Billboard"
	local visualizer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "billboard", "visualizer")
	slot5 = "Visualizes particles using quads with different alignment and blending schemes and a set texture"

	visualizer.set_description(CoreEffectStackMember, visualizer)

	local help = "Texture used assigned to the billboards."
	slot5 = visualizer
	slot12 = help

	visualizer.add_property(visualizer, CoreEffectProperty.new(slot7, CoreEffectProperty, "texture", "texture", "core/textures/default_texture_df"))

	slot5 = LightIntensityDB
	local intensities = LightIntensityDB.list(visualizer)
	local defintensity = ""
	slot11 = "Intensity of billboards - choose a template that corresponds closest to the intensity range you want.\nTo scale the intensity over time, use the color."
	local p = CoreEffectProperty.new(CoreEffectProperty.new, CoreEffectProperty, "intensity", "value_list", defintensity)
	slot9 = ""

	p.add_value(CoreEffectProperty, p)

	slot8 = intensities

	for _, i in ipairs(CoreEffectProperty) do
		slot13 = p
		slot16 = i

		p.add_value(slot12, i.s(slot15))
	end

	slot9 = p

	visualizer.add_property(slot7, visualizer)

	help = [[
Determines alignment type of billboard:
camera_facing - billboard is always facing camera position, use this for ex. smoke particles
camera_facing_sorted - billboards are always facing camera position and are sorted 
camera_facing_not_depth_sorted - billboards are always facing camera position. Batched billboards don't get sorted by depth
normal_locked - billboard rotates around particle normal trying to face camera as much as possible, use this for ex. spark particles
axialz_locked - billboard rotates around world Z trying to face camera as much as possible
normal_facing - billboard faces particle normal
screen_aligned - billboard faces camera near clip plane
NOTE: for screen_aligned billboards you will want to set the atom to never cull,
and play it in (0,0,0) (move the gizmo using the Move To Origo button)]]
	slot12 = help
	p = CoreEffectProperty.new(slot7, CoreEffectProperty, "billboard_type", "value_list", "camera_facing")
	slot9 = "camera_facing"

	p.add_value(slot7, p)

	slot9 = "camera_facing_sorted"

	p.add_value(slot7, p)

	slot9 = "camera_facing_not_depth_sorted"

	p.add_value(slot7, p)

	slot9 = "normal_locked"

	p.add_value(slot7, p)

	slot9 = "axialz_locked"

	p.add_value(slot7, p)

	slot9 = "normal_facing"

	p.add_value(slot7, p)

	slot9 = "screen_aligned"

	p.add_value(slot7, p)

	slot9 = "rotation_aligned"

	p.add_value(slot7, p)

	slot9 = p

	visualizer.add_property(slot7, visualizer)

	help = "If positions are read, this channel will be used"
	slot12 = help
	local p = CoreEffectProperty.new(slot7, CoreEffectProperty, "rotation_channel", "value_list", "world_rotation")
	slot10 = "rotation"

	p.add_value(CoreEffectProperty, p)

	slot10 = "world_rotation"

	p.add_value(CoreEffectProperty, p)

	slot10 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = [[
Determines how billboard is blended against the background:
add - color becomes color of destination + billboard alpha * billboard color
normal - color becomes color of destination * (1 - billboard alpha) + billboard alpha * billboard color
premultiplied - color becomes color of destination + billboard color
add_no_alpha - color becomes color of destination + billboard color]]
	slot13 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "blend_mode", "value_list", "normal")
	slot10 = "normal"

	p.add_value(CoreEffectProperty, p)

	slot10 = "add"

	p.add_value(CoreEffectProperty, p)

	slot10 = "premultiplied"

	p.add_value(CoreEffectProperty, p)

	slot10 = "add_no_alpha"

	p.add_value(CoreEffectProperty, p)

	p._visible = false
	slot10 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = "Determines method used to render billboard:\n\tHalo - no lighting"
	slot13 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "render_template", "value_list", "effect_op")
	slot10 = "effect_op"

	p.add_value(CoreEffectProperty, p)

	slot10 = "effect_op_halo"

	p.add_value(CoreEffectProperty, p)

	slot10 = "effect_op_add"

	p.add_value(CoreEffectProperty, p)

	slot10 = "effect_op_glow"

	p.add_value(CoreEffectProperty, p)

	slot10 = "effect_glow_view_angle_fallof"

	p.add_value(CoreEffectProperty, p)

	slot10 = "effect_blood"

	p.add_value(CoreEffectProperty, p)

	slot10 = "effect_money"

	p.add_value(CoreEffectProperty, p)

	slot10 = "effect_money_menu"

	p.add_value(CoreEffectProperty, p)

	slot10 = "effect_geometry_fade_out"

	p.add_value(CoreEffectProperty, p)

	slot10 = "effect_geometry_fade_out_add"

	p.add_value(CoreEffectProperty, p)

	slot10 = "effect_geometry_fade_out_glow"

	p.add_value(CoreEffectProperty, p)

	slot10 = "heat_shimmer"

	p.add_value(CoreEffectProperty, p)

	slot10 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = "The uv origo of the billboard - billboard will be centered on this point when rendered"
	slot9 = visualizer
	slot16 = help

	visualizer.add_property(CoreEffectProperty, CoreEffectProperty.new("value_list", CoreEffectProperty, "origo", "vector2", "0.5 0.5"))

	help = "Determines if a different age is assigned to each particle - this requires an AGE channel to be created.\nIf this is not set, age is age of atom."
	slot9 = visualizer
	slot16 = help

	visualizer.add_property(CoreEffectProperty, CoreEffectProperty.new("value_list", CoreEffectProperty, "per_particle_age", "boolean", "false"))

	help = [[
Size of particle
constant - use constant value
keys - use key curve over time
channel - read from channel
scaled_channel - read from channel, scale with key curve]]
	slot13 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "size_input", "variant", "constant")
	slot10 = "constant"
	slot17 = "Constant size of particle"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "size", "vector2", "100 100"))

	slot10 = "channel"
	slot17 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot13 = ""
	local size_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "size_keys", "keys", "")
	slot11 = "vector2"

	size_keys.set_key_type(CoreEffectProperty, size_keys)

	slot11 = {
		v = "100 100",
		t = 0
	}

	size_keys.add_key(CoreEffectProperty, size_keys)

	slot12 = max_keys

	size_keys.set_min_max_keys(CoreEffectProperty, size_keys, min_keys)

	slot11 = {
		{
			"Grow",
			{
				{
					0,
					Vector3("", 100, 100)
				},
				{
					2,
					Vector3("", 200, 200)
				}
			}
		},
		{
			"Shrink",
			{
				{
					0,
					Vector3("", 200, 200)
				},
				{
					2,
					Vector3("", 100, 100)
				}
			}
		},
		{
			"Grow And Shrink",
			{
				{
					0,
					Vector3("", 100, 100)
				},
				{
					1,
					Vector3("", 200, 200)
				},
				{
					2,
					Vector3("", 100, 100)
				}
			}
		}
	}
	slot19 = 0
	slot19 = 0
	slot19 = 0
	slot19 = 0
	slot19 = 0
	slot19 = 0
	slot19 = 0

	size_keys.set_presets(CoreEffectProperty, size_keys)

	slot12 = size_keys

	p.add_variant(CoreEffectProperty, p, "keys")

	slot14 = ""
	local size_scale_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "size_scale_keys", "keys", "")
	slot12 = "vector2"

	size_scale_keys.set_key_type(CoreEffectProperty, size_scale_keys)

	slot12 = {
		v = "1 1",
		t = 0
	}

	size_scale_keys.add_key(CoreEffectProperty, size_scale_keys)

	slot13 = max_keys

	size_scale_keys.set_min_max_keys(CoreEffectProperty, size_scale_keys, min_keys)

	slot13 = size_scale_keys

	p.add_variant(CoreEffectProperty, p, "scaled_channel")

	slot12 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = [[
Color of particle
constant - use constant value
keys - use key curve over time
channel - read from channel
scaled_channel - read from channel, scale with key curve]]
	slot15 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "color_input", "variant", "constant")
	slot12 = "constant"
	slot19 = "Constant color of particle"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "color", "color", "255 255 255"))

	slot12 = "channel"
	slot19 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot15 = ""
	local color_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "color_keys", "keys", "")
	slot13 = "color"

	color_keys.set_key_type(CoreEffectProperty, color_keys)

	slot13 = {
		v = "255 255 255",
		t = 0
	}

	color_keys.add_key(CoreEffectProperty, color_keys)

	slot14 = max_keys

	color_keys.set_min_max_keys(CoreEffectProperty, color_keys, min_keys)

	slot14 = color_keys

	p.add_variant(CoreEffectProperty, p, "keys")

	slot16 = ""
	local color_scale_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "color_scale_keys", "keys", "")
	slot14 = "vector3"

	color_scale_keys.set_key_type(CoreEffectProperty, color_scale_keys)

	slot14 = {
		v = "1 1 1",
		t = 0
	}

	color_scale_keys.add_key(CoreEffectProperty, color_scale_keys)

	slot15 = max_keys

	color_scale_keys.set_min_max_keys(CoreEffectProperty, color_scale_keys, min_keys)

	slot15 = color_scale_keys

	p.add_variant(CoreEffectProperty, p, "scaled_channel")

	slot14 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = [[
Opacity of particle
constant - use constant value
keys - use key curve over time
channel - read from channel
scaled_channel - read from channel, scale with key curve]]
	slot17 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "opacity_input", "variant", "constant")
	slot14 = "constant"
	slot21 = "Constant opacity of particle"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "opacity", "opacity", "255"))

	slot14 = "channel"
	slot21 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot17 = ""
	local opacity_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "opacity_keys", "keys", "")
	slot15 = "opacity"

	opacity_keys.set_key_type(CoreEffectProperty, opacity_keys)

	slot15 = {
		v = "255",
		t = 0
	}

	opacity_keys.add_key(CoreEffectProperty, opacity_keys)

	slot16 = max_keys

	opacity_keys.set_min_max_keys(CoreEffectProperty, opacity_keys, min_keys)

	slot16 = opacity_keys

	p.add_variant(CoreEffectProperty, p, "keys")

	slot18 = ""
	local opacity_scale_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "opacity_scale_keys", "keys", "")
	slot16 = "float"

	opacity_scale_keys.set_key_type(CoreEffectProperty, opacity_scale_keys)

	slot16 = {
		v = "1",
		t = 0
	}

	opacity_scale_keys.add_key(CoreEffectProperty, opacity_scale_keys)

	slot17 = max_keys

	opacity_scale_keys.set_min_max_keys(CoreEffectProperty, opacity_scale_keys, min_keys)

	slot17 = opacity_scale_keys

	p.add_variant(CoreEffectProperty, p, "scaled_channel")

	slot16 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = [[
Rotation of particle
constant - use constant value
keys - use key curve over time
channel - read from channel
scaled_channel - read from channel, scale with key curve]]
	slot19 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "rotation_input", "variant", "constant")
	slot16 = "constant"
	slot23 = "Constant rotation of particle"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "rotation", "angle", "0"))

	slot16 = "channel"
	slot23 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot19 = ""
	local rotation_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "rotation_keys", "keys", "")
	slot17 = "angle"

	rotation_keys.set_key_type(CoreEffectProperty, rotation_keys)

	slot17 = {
		v = "0",
		t = 0
	}

	rotation_keys.add_key(CoreEffectProperty, rotation_keys)

	slot18 = max_keys

	rotation_keys.set_min_max_keys(CoreEffectProperty, rotation_keys, min_keys)

	slot17 = {
		{
			"Spin Then Pan",
			{
				{
					0,
					Vector3("", 0, 0)
				},
				{
					1,
					Vector3("", 3600, 0)
				}
			}
		},
		{
			"Spin",
			{
				{
					0,
					Vector3("", 0, 0)
				},
				{
					2,
					Vector3("", 7200, 0)
				}
			}
		},
		{
			"Spin Fast Then Slow",
			{
				{
					0,
					Vector3("", 0, 0)
				},
				{
					1,
					Vector3("", 3600, 0)
				},
				{
					2,
					Vector3("", 5400, 0)
				}
			}
		}
	}
	slot25 = 0
	slot25 = 0
	slot25 = 0
	slot25 = 0
	slot25 = 0
	slot25 = 0
	slot25 = 0

	rotation_keys.set_presets(CoreEffectProperty, rotation_keys)

	slot18 = rotation_keys

	p.add_variant(CoreEffectProperty, p, "keys")

	slot20 = ""
	local rotation_scale_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "rotation_scale_keys", "keys", "")
	slot18 = "float"

	rotation_scale_keys.set_key_type(CoreEffectProperty, rotation_scale_keys)

	slot18 = {
		v = "1",
		t = 0
	}

	rotation_scale_keys.add_key(CoreEffectProperty, rotation_scale_keys)

	slot19 = max_keys

	rotation_scale_keys.set_min_max_keys(CoreEffectProperty, rotation_scale_keys, min_keys)
	p.add_variant(CoreEffectProperty, p, "scaled_channel")

	slot18 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = "Axis around which to apply angular rotation.\nThis parameter ONLY APPLIES for rotation_aligned billboards."
	slot17 = visualizer
	slot24 = help

	visualizer.add_property(CoreEffectProperty, CoreEffectProperty.new(rotation_scale_keys, CoreEffectProperty, "rotation_axis", "vector3", "0 0 1"))

	help = "Size of uv rectangle referenced by billboard.\nIf you are using an uv animation controller, this is the uv size of the frame."
	slot17 = visualizer
	slot24 = help

	visualizer.add_property(CoreEffectProperty, CoreEffectProperty.new(rotation_scale_keys, CoreEffectProperty, "uv_size", "vector2", "1 1"))

	help = [[
UV offset of particle
constant - use constant value
keys - uv animation, stepping between the uv offsets of each frame over time
channel - read from channel]]
	slot21 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "uv_offset_input", "variant", "constant")
	slot18 = "constant"
	slot25 = "const uv offset of particles"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "uv_offset", "vector2", "0 0"))

	slot18 = "channel"
	slot25 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot18 = "uv_animation"
	local uv_animation = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot19 = "Steps between uv offsets within a texture containing all the frames of an animation."

	uv_animation.set_description(CoreEffectPropertyContainer, uv_animation)

	slot18 = uv_animation
	slot25 = "UV offset of first frame"

	uv_animation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("constant", CoreEffectProperty, "frame_start", "vector2", "0 0"))

	slot18 = uv_animation
	slot25 = "Primary step direction"

	uv_animation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("constant", CoreEffectProperty, "primary_step_direction", "string", "+x"))

	slot18 = uv_animation
	slot25 = "Secondary step direction"

	uv_animation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("constant", CoreEffectProperty, "secondary_step_direction", "string", "+y"))

	slot18 = uv_animation
	slot25 = "Number of frames contained in texture"

	uv_animation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("constant", CoreEffectProperty, "num_frames", "int", "16"))

	slot22 = "fps that animation should play at"
	local q = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "fps", "float", "30")

	q.set_range(CoreEffectProperty, q, 1)

	slot20 = q

	uv_animation.add_property(CoreEffectProperty, uv_animation)

	slot19 = uv_animation
	slot26 = "If set, animation will loop back to first frame"

	uv_animation.add_property(CoreEffectProperty, CoreEffectProperty.new(100000, CoreEffectProperty, "loop", "boolean", "false"))

	slot22 = ""
	local uv_animation_prop = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "", "compound")
	slot21 = uv_animation

	uv_animation_prop.set_compound_container(CoreEffectProperty, uv_animation_prop)

	slot21 = false

	uv_animation_prop.set_save_to_child(CoreEffectProperty, uv_animation_prop)

	slot22 = uv_animation_prop

	p.add_variant(CoreEffectProperty, p, "keys")

	slot21 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	return visualizer
end
function CoreParticleEditorVisualizers:create_trail()
	local visualizer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "trail", "visualizer")
	slot5 = "Visualizes particles using quads with different alignment and blending schemes and a set texture"

	visualizer.set_description(CoreEffectStackMember, visualizer)

	slot4 = visualizer
	slot11 = "The number of segments in the trail"

	visualizer.add_property(CoreEffectStackMember, CoreEffectProperty.new("Trail", CoreEffectProperty, "size", "int", "1"))

	slot8 = "If set to normal_locked, trail segments will always try to face camera while remaining locked around each particle Z"
	local p = CoreEffectProperty.new(CoreEffectStackMember, CoreEffectProperty, "trail_type", "value_list", "custom_aligned")
	slot6 = "custom_aligned"

	p.add_value(CoreEffectProperty, p)

	slot6 = "normal_locked"

	p.add_value(CoreEffectProperty, p)

	slot6 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	slot5 = visualizer
	slot12 = "The number of segments created in between segments by interpolation"

	visualizer.add_property(CoreEffectProperty, CoreEffectProperty.new("custom_aligned", CoreEffectProperty, "tesselation", "int", "3"))

	slot5 = visualizer
	slot12 = "Determines how much particle rotation at segment points influence curve interpolation, larger values will result in wilder curves - curve becomes unstable for values > 0.5"

	visualizer.add_property(CoreEffectProperty, CoreEffectProperty.new("custom_aligned", CoreEffectProperty, "curvature", "percentage", "0.1"))

	slot5 = visualizer
	slot12 = "If set, uv is tiled between each segment, if not set, uv is stretched across length of trail"

	visualizer.add_property(CoreEffectProperty, CoreEffectProperty.new("custom_aligned", CoreEffectProperty, "tile_uv", "boolean", "false"))

	slot12 = "If uv is tiling, it will tile with this interval"

	visualizer.add_property(CoreEffectProperty, CoreEffectProperty.new("custom_aligned", CoreEffectProperty, "tiles_per_meter", "float", "1"))

	local help = "Texture used assigned to the billboards."
	slot6 = visualizer
	slot13 = help

	visualizer.add_property(visualizer, CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "texture", "texture", "core/texture/default_texture_df"))

	slot6 = LightIntensityDB
	local intensities = LightIntensityDB.list(visualizer)
	local defintensity = ""
	slot12 = "Intensity of billboards - choose a template that corresponds closest to the intensity range you want.\nTo scale the intensity over time, use the color."
	p = CoreEffectProperty.new(CoreEffectProperty.new, CoreEffectProperty, "intensity", "value_list", defintensity)
	slot9 = ""

	p.add_value(CoreEffectProperty.new, p)

	slot8 = intensities

	for _, i in ipairs(CoreEffectProperty.new) do
		slot13 = p
		slot16 = i

		p.add_value(slot12, i.s(slot15))
	end

	slot9 = p

	visualizer.add_property(slot7, visualizer)

	help = [[
Determines how billboard is blended against the background:
add - color becomes color of destination + billboard alpha * billboard color
normal - color becomes color of destination * (1 - billboard alpha) + billboard alpha * billboard color
premultiplied - color becomes color of destination + billboard color
add_no_alpha - color becomes color of destination + billboard color]]
	slot12 = help
	p = CoreEffectProperty.new(slot7, CoreEffectProperty, "blend_mode", "value_list", "normal")
	slot9 = "normal"

	p.add_value(slot7, p)

	slot9 = "add"

	p.add_value(slot7, p)

	slot9 = "premultiplied"

	p.add_value(slot7, p)

	slot9 = "add_no_alpha"

	p.add_value(slot7, p)

	p._visible = false
	slot9 = p

	visualizer.add_property(slot7, visualizer)

	help = "Determines method used to render billboard:\n\tHalo - no lighting"
	slot12 = help
	p = CoreEffectProperty.new(slot7, CoreEffectProperty, "render_template", "value_list", "effect_op")
	slot9 = "effect_op"

	p.add_value(slot7, p)

	slot9 = "effect_op_halo"

	p.add_value(slot7, p)

	slot9 = "effect_op_add"

	p.add_value(slot7, p)

	slot9 = "effect_op_glow"

	p.add_value(slot7, p)

	slot9 = "effect_glow_view_angle_fallof"

	p.add_value(slot7, p)

	slot9 = "effect_blood"

	p.add_value(slot7, p)

	slot9 = "effect_money"

	p.add_value(slot7, p)

	slot9 = "effect_money_menu"

	p.add_value(slot7, p)

	slot9 = "effect_geometry_fade_out"

	p.add_value(slot7, p)

	slot9 = "effect_geometry_fade_out_add"

	p.add_value(slot7, p)

	slot9 = "effect_geometry_fade_out_glow"

	p.add_value(slot7, p)

	slot9 = "heat_shimmer"

	p.add_value(slot7, p)

	slot9 = p

	visualizer.add_property(slot7, visualizer)

	help = "Determines if a different age is assigned to each particle - this requires an AGE channel to be created.\nIf this is not set, age is age of atom."
	slot8 = visualizer
	slot15 = help

	visualizer.add_property(slot7, CoreEffectProperty.new("value_list", CoreEffectProperty, "per_particle_age", "boolean", "false"))

	help = [[
Color of particle
constant - use constant value
keys - use key curve over time
channel - read from channel
scaled_channel - read from channel, scale with key curve]]
	slot12 = help
	p = CoreEffectProperty.new(slot7, CoreEffectProperty, "color_input", "variant", "constant")
	slot9 = "constant"
	slot16 = "Constant color of particle"

	p.add_variant(slot7, p, CoreEffectProperty.new("constant", CoreEffectProperty, "color", "color", "255 255 255"))

	slot9 = "channel"
	slot16 = ""

	p.add_variant(slot7, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot12 = ""
	local color_keys = CoreEffectProperty.new(slot7, CoreEffectProperty, "color_keys", "keys", "")
	slot10 = "color"

	color_keys.set_key_type(CoreEffectProperty, color_keys)

	slot10 = {
		v = "255 255 255",
		t = 0
	}

	color_keys.add_key(CoreEffectProperty, color_keys)

	slot11 = max_keys

	color_keys.set_min_max_keys(CoreEffectProperty, color_keys, min_keys)

	slot11 = color_keys

	p.add_variant(CoreEffectProperty, p, "keys")

	slot13 = ""
	local color_scale_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "color_scale_keys", "keys", "")
	slot11 = "vector3"

	color_scale_keys.set_key_type(CoreEffectProperty, color_scale_keys)

	slot11 = {
		v = "1 1 1",
		t = 0
	}

	color_scale_keys.add_key(CoreEffectProperty, color_scale_keys)

	slot12 = max_keys

	color_scale_keys.set_min_max_keys(CoreEffectProperty, color_scale_keys, min_keys)

	slot12 = color_scale_keys

	p.add_variant(CoreEffectProperty, p, "scaled_channel")

	slot11 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	slot14 = "Multiplier for color over length"
	local color_multiplier_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "color_multiplier_keys", "keys", "")
	slot12 = "vector3"

	color_multiplier_keys.set_key_type(CoreEffectProperty, color_multiplier_keys)

	slot12 = {
		v = "1 1 1",
		t = 0
	}

	color_multiplier_keys.add_key(CoreEffectProperty, color_multiplier_keys)

	slot13 = max_keys

	color_multiplier_keys.set_min_max_keys(CoreEffectProperty, color_multiplier_keys, min_keys)

	slot12 = color_multiplier_keys

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = [[
Opacity of particle
constant - use constant value
keys - use key curve over time
channel - read from channel
scaled_channel - read from channel, scale with key curve]]
	slot15 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "opacity_input", "variant", "constant")
	slot12 = "constant"
	slot19 = "Constant opacity of particle"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "opacity", "opacity", "255"))

	slot12 = "channel"
	slot19 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot15 = ""
	local opacity_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "opacity_keys", "keys", "")
	slot13 = "opacity"

	opacity_keys.set_key_type(CoreEffectProperty, opacity_keys)

	slot13 = {
		v = "255",
		t = 0
	}

	opacity_keys.add_key(CoreEffectProperty, opacity_keys)

	slot14 = max_keys

	opacity_keys.set_min_max_keys(CoreEffectProperty, opacity_keys, min_keys)

	slot14 = opacity_keys

	p.add_variant(CoreEffectProperty, p, "keys")

	slot16 = ""
	local opacity_scale_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "opacity_scale_keys", "keys", "")
	slot14 = "float"

	opacity_scale_keys.set_key_type(CoreEffectProperty, opacity_scale_keys)

	slot14 = {
		v = "1",
		t = 0
	}

	opacity_scale_keys.add_key(CoreEffectProperty, opacity_scale_keys)

	slot15 = max_keys

	opacity_scale_keys.set_min_max_keys(CoreEffectProperty, opacity_scale_keys, min_keys)

	slot15 = opacity_scale_keys

	p.add_variant(CoreEffectProperty, p, "scaled_channel")

	slot14 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	slot17 = "Multiplier for opacity over length"
	local opacity_multiplier_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "opacity_multiplier_keys", "keys", "")
	slot15 = "float"

	opacity_multiplier_keys.set_key_type(CoreEffectProperty, opacity_multiplier_keys)

	slot15 = {
		v = "1",
		t = 0
	}

	opacity_multiplier_keys.add_key(CoreEffectProperty, opacity_multiplier_keys)

	slot16 = max_keys

	opacity_multiplier_keys.set_min_max_keys(CoreEffectProperty, opacity_multiplier_keys, min_keys)

	slot15 = opacity_multiplier_keys

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = [[
Width of trail
constant - use constant value
keys - use key curve over length of trail
channel - read from channel
scaled_channel - read from channel, scale over length with key curve]]
	slot18 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "width_input", "variant", "constant")
	slot15 = "constant"
	slot22 = "Constant width of trail"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "width", "float", "50"))

	slot15 = "channel"
	slot22 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot18 = ""
	local width_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "width_keys", "keys", "")
	slot16 = "float"

	width_keys.set_key_type(CoreEffectProperty, width_keys)

	slot16 = {
		v = "50",
		t = 0
	}

	width_keys.add_key(CoreEffectProperty, width_keys)

	slot17 = max_keys

	width_keys.set_min_max_keys(CoreEffectProperty, width_keys, min_keys)

	slot17 = width_keys

	p.add_variant(CoreEffectProperty, p, "keys")

	slot19 = ""
	local width_scale_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "width_scale_keys", "keys", "")
	slot17 = "float"

	width_scale_keys.set_key_type(CoreEffectProperty, width_scale_keys)

	slot17 = {
		v = "1",
		t = 0
	}

	width_scale_keys.add_key(CoreEffectProperty, width_scale_keys)

	slot18 = max_keys

	width_scale_keys.set_min_max_keys(CoreEffectProperty, width_scale_keys, min_keys)
	p.add_variant(CoreEffectProperty, p, "scaled_channel")

	slot17 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = "Size of uv rectangle referenced by billboard.\nIf you are using an uv animation controller, this is the uv size of the frame."
	slot16 = visualizer
	slot23 = help

	visualizer.add_property(CoreEffectProperty, CoreEffectProperty.new(width_scale_keys, CoreEffectProperty, "uv_size", "vector2", "1 1"))

	help = [[
UV offset of particle
constant - use constant value
keys - uv animation, stepping between the uv offsets of each frame over time
channel - read from channel]]
	slot20 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "uv_offset_input", "variant", "constant")
	slot17 = "constant"
	slot24 = "const uv offset of particles"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "uv_offset", "vector2", "0 0"))

	slot17 = "channel"
	slot24 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot17 = "uv_animation"
	local uv_animation = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot18 = "Steps between uv offsets within a texture containing all the frames of an animation."

	uv_animation.set_description(CoreEffectPropertyContainer, uv_animation)

	slot17 = uv_animation
	slot24 = "UV offset of first frame"

	uv_animation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("constant", CoreEffectProperty, "frame_start", "vector2", "0 0"))

	slot17 = uv_animation
	slot24 = "Primary step direction"

	uv_animation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("constant", CoreEffectProperty, "primary_step_direction", "string", "+x"))

	slot17 = uv_animation
	slot24 = "Secondary step direction"

	uv_animation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("constant", CoreEffectProperty, "secondary_step_direction", "string", "+y"))

	slot17 = uv_animation
	slot24 = "Number of frames contained in texture"

	uv_animation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("constant", CoreEffectProperty, "num_frames", "int", "16"))

	slot17 = uv_animation
	slot24 = "fps that animation should play at"

	uv_animation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("constant", CoreEffectProperty, "fps", "float", "30"))

	slot17 = uv_animation
	slot24 = "If set, animation will loop back to first frame"

	uv_animation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("constant", CoreEffectProperty, "loop", "boolean", "false"))

	slot20 = ""
	local uv_animation_prop = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "", "compound")
	slot19 = uv_animation

	uv_animation_prop.set_compound_container(CoreEffectProperty, uv_animation_prop)

	slot19 = false

	uv_animation_prop.set_save_to_child(CoreEffectProperty, uv_animation_prop)

	slot20 = uv_animation_prop

	p.add_variant(CoreEffectProperty, p, "keys")

	slot19 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	return visualizer
end
function CoreParticleEditorVisualizers:create_light()
	slot6 = "Light"
	local visualizer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "light", "visualizer")
	slot5 = "Visualizes particles using lights with positions aligned to the particles"

	visualizer.set_description(CoreEffectStackMember, visualizer)

	local help = "Determines if a different age is assigned to each particle - this requires an AGE channel to be created.\nIf this is not set, age is age of atom."
	slot5 = visualizer
	slot12 = help

	visualizer.add_property(visualizer, CoreEffectProperty.new(slot7, CoreEffectProperty, "per_particle_age", "boolean", "false"))

	help = "Determines if light casts shadows."
	slot5 = visualizer
	slot12 = help

	visualizer.add_property(visualizer, CoreEffectProperty.new(slot7, CoreEffectProperty, "shadow_caster", "boolean", "false"))

	help = "Determines if light has specular component."
	slot5 = visualizer
	slot12 = help

	visualizer.add_property(visualizer, CoreEffectProperty.new(slot7, CoreEffectProperty, "specular", "boolean", "false"))

	help = [[
Color of light
constant - use constant value
keys - use key curve over time
channel - read from channel]]
	local p = CoreEffectProperty.new(visualizer, CoreEffectProperty, "color_input", "variant", "constant")
	slot7 = "constant"
	slot14 = "Constant color of light"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new(help, CoreEffectProperty, "color", "color", "255 255 255"))

	slot7 = "channel"
	slot14 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new(help, CoreEffectProperty, "", "null", ""))

	slot10 = ""
	local color_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "color_keys", "keys", "")
	slot8 = "color"

	color_keys.set_key_type(CoreEffectProperty, color_keys)

	slot8 = {
		v = "255 255 255",
		t = 0
	}

	color_keys.add_key(CoreEffectProperty, color_keys)

	slot9 = max_keys

	color_keys.set_min_max_keys(CoreEffectProperty, color_keys, min_keys)

	slot9 = color_keys

	p.add_variant(CoreEffectProperty, p, "keys")

	slot8 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = [[
Multiplier of light
constant - use constant value
keys - use key curve over time
channel - read from channel]]
	slot11 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "multiplier_input", "variant", "constant")
	slot8 = "constant"
	slot15 = "Constant multiplier of light"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "multiplier", "float", "1"))

	slot8 = "channel"
	slot15 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot11 = ""
	local multiplier_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "multiplier_keys", "keys", "")
	slot9 = "float"

	multiplier_keys.set_key_type(CoreEffectProperty, multiplier_keys)

	slot9 = {
		v = "1.0",
		t = 0
	}

	multiplier_keys.add_key(CoreEffectProperty, multiplier_keys)

	slot10 = max_keys

	multiplier_keys.set_min_max_keys(CoreEffectProperty, multiplier_keys, min_keys)

	slot10 = multiplier_keys

	p.add_variant(CoreEffectProperty, p, "keys")

	slot9 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	help = [[
Far range of light
constant - use constant value
keys - use key curve over time
channel - read from channel]]
	slot12 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "far_range_input", "variant", "constant")
	slot9 = "constant"
	slot16 = "Constant far range of light"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "far_range", "float", "100"))

	slot9 = "channel"
	slot16 = ""

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("constant", CoreEffectProperty, "", "null", ""))

	slot12 = ""
	local far_range_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "far_range_keys", "keys", "")
	slot10 = "float"

	far_range_keys.set_key_type(CoreEffectProperty, far_range_keys)

	slot10 = {
		v = "100",
		t = 0
	}

	far_range_keys.add_key(CoreEffectProperty, far_range_keys)

	slot11 = max_keys

	far_range_keys.set_min_max_keys(CoreEffectProperty, far_range_keys, min_keys)

	slot11 = far_range_keys

	p.add_variant(CoreEffectProperty, p, "keys")

	slot10 = p

	visualizer.add_property(CoreEffectProperty, visualizer)

	return visualizer
end
function CoreParticleEditorVisualizers:create_model()
	slot6 = "Model"
	local visualizer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "model", "visualizer")
	slot5 = "Visualizes particles using models picked from a unit"

	visualizer.set_description(CoreEffectStackMember, visualizer)

	local help = "Name of model/diesel database entry"
	slot12 = help

	visualizer.add_property(visualizer, CoreEffectProperty.new(slot7, CoreEffectProperty, "model", "model", "core/units/widgets"))

	local help = "Name of object/mesh in model."
	slot13 = help

	visualizer.add_property(visualizer, CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "object", "object", "g_z"))

	local help = "Name of material config."
	slot7 = visualizer
	slot14 = help

	visualizer.add_property(visualizer, CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "material_config", "material_config", "core/material_configs/widgets_materials"))

	return visualizer
end

return 
