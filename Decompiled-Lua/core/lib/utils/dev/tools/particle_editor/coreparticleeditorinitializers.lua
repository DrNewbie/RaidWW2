CoreParticleEditorInitializers = CoreParticleEditorInitializers or class()
local min_keys = 1
local max_keys = 8
function CoreParticleEditorInitializers:create_boxrandomposition()
	slot6 = "Position (Box Random)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomposition", "initializer")
	slot5 = "Initializes particle positions randomly within a given box."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = [[
Determines how positions are treated:
relative - Positions are rotated with effect rotation
world - Positions are not rotated

Positions are always offsetted with effect position.]]
	slot9 = help
	local p = CoreEffectProperty.new(initializer, CoreEffectProperty, "relative", "value_list", "effect")
	slot7 = "effect"

	p.add_value(CoreEffectProperty, p)

	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	help = "Box inside which particle positions will be randomly generated.\nCoordinates are in centimeters."
	slot10 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "box", "box", "")
	slot11 = -1
	slot7 = Vector3("box", -1, -1)
	slot12 = 1

	p.set_min_max(CoreEffectProperty, p, Vector3(-1, 1, 1))

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomvelocity()
	slot6 = "Velocity (Box Random)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomvelocity", "initializer")
	slot5 = "Initializes particle velocities randomly within a given box."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = [[
Determines how velocities are treated:
effect - Velocities are rotated with effect rotation
world - Velocities are not rotated

Velocities are always offsetted with effect spawn velocity.]]
	slot9 = help
	local p = CoreEffectProperty.new(initializer, CoreEffectProperty, "relative", "value_list", "effect")
	slot7 = "effect"

	p.add_value(CoreEffectProperty, p)

	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	help = "Box inside which particle velocities will be randomly generated.\nCoordinates are in centimeters per second and relative to effect spawn point and rotation."
	slot10 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "box", "box", "")
	slot11 = -100
	slot7 = Vector3("box", -100, -100)
	slot12 = 100

	p.set_min_max(CoreEffectProperty, p, Vector3(-100, 100, 100))

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	return initializer
end
function CoreParticleEditorInitializers:create_centervelocity()
	slot6 = "Velocity (To/From Center)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "centervelocity", "initializer")
	slot5 = "Initializes particle velocities with a vector pointing to/from a point in space."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Determines what position channel to read from:\nlocal - local positions\nworld - world position"
	slot9 = help
	local p = CoreEffectProperty.new(initializer, CoreEffectProperty, "channel", "value_list", "world")
	slot7 = "local"

	p.add_value(CoreEffectProperty, p)

	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	slot10 = "Position (relative to effect) for which to direct velocities to/from"
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "center", "vector3", "0 0 0")
	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	help = "Direct velocities to or from center"
	slot10 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "direction", "value_list", "from")
	slot7 = "to"

	p.add_value(CoreEffectProperty, p)

	slot7 = "from"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	slot10 = "Minimum velocity (in cm/s)"
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "min", "float", "100")
	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	slot10 = "Maximum velocity (in cm/s)"
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "max", "float", "100")
	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	slot10 = "Random jitter added to velocity (in cm/s)"
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "jitter", "float", "10")
	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	return initializer
end
function CoreParticleEditorInitializers:create_boxevenposition()
	slot6 = "Position (Box Even Distribution)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxevenposition", "initializer")
	slot5 = "Initializes particle positions evenly distributed within a given box.\nMay initialize positions outside box if the number of particles is not evenly dividable with the proportions of the box."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = [[
Determines how positions are treated:
relative - Positions are rotated with effect rotation
world - Positions are not rotated

Positions are always offsetted with effect position.]]
	slot9 = help
	local p = CoreEffectProperty.new(initializer, CoreEffectProperty, "relative", "value_list", "effect")
	slot7 = "effect"

	p.add_value(CoreEffectProperty, p)

	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	help = "Box inside which particle positions will be generated.\nCoordinates are in centimeters and relative to effect spawn point and rotation."
	slot10 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "box", "box", "")
	slot11 = -1
	slot7 = Vector3("box", -1, -1)
	slot12 = 1

	p.set_min_max(CoreEffectProperty, p, Vector3(-1, 1, 1))

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	return initializer
end
function CoreParticleEditorInitializers:create_trail()
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "trail", "initializer")
	slot4 = initializer
	slot11 = "Number of segments in trail"

	initializer.add_property(CoreEffectStackMember, CoreEffectProperty.new("Trail", CoreEffectProperty, "size", "int", "3"))

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomrotation()
	slot6 = "Rotation (Box Random)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomrotation", "initializer")
	slot5 = "Initializes particle rotations to random values, with the normal within a specified box and a random angle around the normal."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Determines how rotations are treated:\nrelative - Rotations are rotated with effect rotation (and output to WORLD_ROTATION channel)\nworld - Rotations are not rotated (and output to ROTATION channel)"
	slot9 = help
	local p = CoreEffectProperty.new(initializer, CoreEffectProperty, "relative", "value_list", "effect")
	slot7 = "effect"

	p.add_value(CoreEffectProperty, p)

	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	help = "Box within which normal will be randomized."
	slot10 = help
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "box", "box", "")
	slot11 = 1
	slot7 = Vector3("box", -10, -10)
	slot12 = 1

	p.set_min_max(CoreEffectProperty, p, Vector3(-10, 10, 10))

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	slot6 = initializer
	slot13 = "Min angle around normal"

	initializer.add_property(CoreEffectProperty, CoreEffectProperty.new(Vector3, CoreEffectProperty, "min_rot", "float", "0"))

	slot6 = initializer
	slot13 = "Max angle around normal"

	initializer.add_property(CoreEffectProperty, CoreEffectProperty.new(Vector3, CoreEffectProperty, "max_rot", "float", "365"))

	return initializer
end
function CoreParticleEditorInitializers:create_constantage()
	slot6 = "Age (Constant)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "constantage", "initializer")
	slot5 = "Initializes particle ages to specified value.\nThis initializer is useful if you want to create a set of particles that are very old, for initializing\neffect surface type effects."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Age that particles should have assigned (in seconds)."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "age", "time", "99999"))

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomage()
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomage", "initializer")
	slot5 = "Initializes particle ages within specified range."

	initializer.set_description(CoreEffectStackMember, initializer)

	slot4 = initializer
	slot11 = "Lower bound of time value"

	initializer.add_property(CoreEffectStackMember, CoreEffectProperty.new("Age (Box Random)", CoreEffectProperty, "min", "time", "0"))

	slot4 = initializer
	slot11 = "Upper bound of time value"

	initializer.add_property(CoreEffectStackMember, CoreEffectProperty.new("Age (Box Random)", CoreEffectProperty, "max", "time", "1"))

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomcolor()
	slot6 = "Color (Box Random)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomcolor", "initializer")
	slot5 = "Initializes particle colors within a range of colors."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Minimum color."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "min", "color", "0 0 0"))

	help = "Maximum color."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "max", "color", "255 255 255"))

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomcolorgradient()
	slot6 = "Color (Box Random Gradient)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomcolorgradient", "initializer")
	slot5 = "Initializes particle colors with a base color and randomized gradients of this color."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Color"
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "color", "color", "255 255 255"))

	help = "Minimum multiplier for base color"
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "min", "percentage", "0"))

	help = "Maximum multiplier for base color"
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "max", "percentage", "1"))

	return initializer
end
function CoreParticleEditorInitializers:create_localboxrandomposition()
	slot6 = "Local Position (Box Random)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "localboxrandomposition", "initializer")
	slot5 = "Initializes particle positions randomly within a given box.\nThe positions are written to the local position channel, and are not transformed by effect orientation."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Box within which normal will be randomized."
	slot9 = help
	local p = CoreEffectProperty.new(initializer, CoreEffectProperty, "box", "box", "")
	slot11 = -1
	slot7 = Vector3("", -1, -1)
	slot12 = 1

	p.set_min_max(CoreEffectProperty, p, Vector3(-1, 1, 1))

	slot7 = p

	initializer.add_property(CoreEffectProperty, initializer)

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomangle()
	slot6 = "Angle (Box Random)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomangle", "initializer")
	slot5 = "Initializes angles randomly using a box distribution."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Minimum angle (degrees)."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "min", "float", "0"))

	help = "Maximum angle (degrees)."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "max", "float", "360"))

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomanglevelocity()
	slot6 = "Angle Velocity (Box Random)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomanglevelocity", "initializer")
	slot5 = "Initializes angle velocities randomly using a box distribution."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Minimum angle velocity (degrees/s)."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "min", "float", "180"))

	help = "Maximum angle velocity (degrees/s)."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "max", "float", "-180"))

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomopacity()
	slot6 = "Opacity (Box Random)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomopacity", "initializer")
	slot5 = "Initializes opacities randomly using a box distribution."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Minimum opacity (0 - 255)."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "min", "opacity", "0"))

	help = "Maximum opacity (0 - 255)."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "max", "opacity", "255"))

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomsize()
	slot6 = "Size (Box Random)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomsize", "initializer")
	slot5 = "Initializes sizes randomly using a box distribution."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Minimum size (cm)."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "min", "vector2", "100 100"))

	help = "Maximum size (cm)."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "max", "vector2", "200 200"))

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomaspectsize()
	slot6 = "Size (Box Random Aspect)"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomaspectsize", "initializer")
	slot5 = "Initializes sizes randomly with a certain aspect using a box distribution."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Base size."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "size", "vector2", "100 100"))

	help = "Min multiplier"
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "min", "float", "0.5"))

	help = "Max multiplier"
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "max", "float", "1.5"))

	return initializer
end
function CoreParticleEditorInitializers:create_boxrandomuvoffset()
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "boxrandomuvoffset", "initializer")
	slot5 = "Initializes uv offsets randomly between frames in a texture."

	initializer.set_description(CoreEffectStackMember, initializer)

	slot4 = initializer
	slot11 = "The UV size of a frame"

	initializer.add_property(CoreEffectStackMember, CoreEffectProperty.new("UV Offset (Box Random Frame)", CoreEffectProperty, "uv_size", "vector2", "0.125 0.125"))

	slot4 = initializer
	slot11 = "UV offset of first frame"

	initializer.add_property(CoreEffectStackMember, CoreEffectProperty.new("UV Offset (Box Random Frame)", CoreEffectProperty, "frame_start", "vector2", "0 0"))

	slot4 = initializer
	slot11 = "Primary step direction"

	initializer.add_property(CoreEffectStackMember, CoreEffectProperty.new("UV Offset (Box Random Frame)", CoreEffectProperty, "primary_step_direction", "string", "+x"))

	slot4 = initializer
	slot11 = "Secondary step direction"

	initializer.add_property(CoreEffectStackMember, CoreEffectProperty.new("UV Offset (Box Random Frame)", CoreEffectProperty, "secondary_step_direction", "string", "+y"))

	slot4 = initializer
	slot11 = "Number of frames contained in texture"

	initializer.add_property(CoreEffectStackMember, CoreEffectProperty.new("UV Offset (Box Random Frame)", CoreEffectProperty, "num_frames", "int", "16"))

	return initializer
end
function CoreParticleEditorInitializers:create_worldtransform()
	slot6 = "Local -> World Transform"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "worldtransform", "initializer")
	slot5 = "Transforms local positions (and optionally rotations) to world coordinates."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "If set, rotation channel will be read and transformed by effect transform into the world rotation channel."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "transform_rotations", "boolean", "false"))

	return initializer
end
function CoreParticleEditorInitializers:create_lightcone()
	slot6 = "Light Cone"
	local initializer = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "lightcone", "initializer")
	slot5 = "Constructs a string of positions along a vector, with associated sizes and opacities. Useful for creating light cones.\nThis initializer will not work very well with atoms of varying size, since the length of the cone will vary with the number of particles."

	initializer.set_description(CoreEffectStackMember, initializer)

	local help = "Vector in local space along which positions will be layed out."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "axis", "vector3", "0 0 1"))

	help = "Distance along axis to place first billboard."
	slot5 = initializer
	slot12 = help

	initializer.add_property(initializer, CoreEffectProperty.new(slot7, CoreEffectProperty, "start", "float", "0"))

	help = "The distance to step between billboards with stepped distance as horizontal axis."
	slot9 = help
	local distance_keys = CoreEffectProperty.new(initializer, CoreEffectProperty, "distance_keys", "keys", "")
	slot7 = "float"

	distance_keys.set_key_type(CoreEffectProperty, distance_keys)

	slot7 = {
		v = "20",
		t = 0
	}

	distance_keys.add_key(CoreEffectProperty, distance_keys)

	slot8 = max_keys

	distance_keys.set_min_max_keys(CoreEffectProperty, distance_keys, min_keys)

	slot7 = distance_keys

	initializer.add_property(CoreEffectProperty, initializer)

	help = "The size of billboards along distance."
	slot10 = help
	local size_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "size_keys", "keys", "")
	slot8 = "vector2"

	size_keys.set_key_type(CoreEffectProperty, size_keys)

	slot8 = {
		v = "100 100",
		t = 0
	}

	size_keys.add_key(CoreEffectProperty, size_keys)

	slot9 = max_keys

	size_keys.set_min_max_keys(CoreEffectProperty, size_keys, min_keys)

	slot8 = size_keys

	initializer.add_property(CoreEffectProperty, initializer)

	help = "The opacity of billboards along distance."
	slot11 = help
	local opacity_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "opacity_keys", "keys", "")
	slot9 = "opacity"

	opacity_keys.set_key_type(CoreEffectProperty, opacity_keys)

	slot9 = {
		v = "255",
		t = 0
	}

	opacity_keys.add_key(CoreEffectProperty, opacity_keys)

	slot10 = max_keys

	opacity_keys.set_min_max_keys(CoreEffectProperty, opacity_keys, min_keys)

	slot9 = opacity_keys

	initializer.add_property(CoreEffectProperty, initializer)

	return initializer
end

return 
