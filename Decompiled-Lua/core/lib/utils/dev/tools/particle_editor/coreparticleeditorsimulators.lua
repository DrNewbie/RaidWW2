CoreParticleEditorSimulators = CoreParticleEditorSimulators or class()
local min_keys = 1
local max_keys = 8
function CoreParticleEditorSimulators:create_velocityintegrator()
	slot6 = "Velocity Integrator"
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "velocityintegrator", "simulator")
	slot5 = "Adds velocity * dt to position."

	simulator.set_description(CoreEffectStackMember, simulator)

	local help = "Determines which position channel integration is performed on:\nworld - world positions are modified\nlocal - local positions are modified."
	slot9 = help
	local p = CoreEffectProperty.new(simulator, CoreEffectProperty, "channel", "value_list", "world")
	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = "local"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	simulator.add_property(CoreEffectProperty, simulator)

	return simulator
end
function CoreParticleEditorSimulators:create_trail()
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "trail", "simulator")
	slot5 = "Copies position and orientation to buffer"

	simulator.set_description(CoreEffectStackMember, simulator)

	slot4 = simulator
	slot11 = "Number of positions"

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Trail", CoreEffectProperty, "size", "int", "3"))

	local p = CoreEffectProperty.new(CoreEffectStackMember, CoreEffectProperty, "mode", "variant", "frequency")
	slot6 = "frequency"
	slot13 = "Frequency of position and orientation being copied to buffer"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("Determines mode in which simulator operates:\nIf set to frequency, particle positions and rotations are copied at a set interval\nIf set to distance, particle positions and rotations are copied when distance exceeds a certain threshold", CoreEffectProperty, "frequency", "float", "1"))

	slot6 = "distance"
	slot13 = "Distance required before position and rotation is copied to buffer"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new("Determines mode in which simulator operates:\nIf set to frequency, particle positions and rotations are copied at a set interval\nIf set to distance, particle positions and rotations are copied when distance exceeds a certain threshold", CoreEffectProperty, "distance", "float", "100"))

	slot6 = p

	simulator.add_property(CoreEffectProperty, simulator)

	return simulator
end
function CoreParticleEditorSimulators:create_scaledvelocityintegrator()
	slot6 = "Velocity Integrator (scaled)"
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "scaledvelocityintegrator", "simulator")
	slot5 = "Adds velocity * dt * scale to position. Scale is determined by a key curve."

	simulator.set_description(CoreEffectStackMember, simulator)

	local help = "Determines which position channel integration is performed on:\nworld - world positions are modified\nlocal - local positions are modified."
	slot9 = help
	local p = CoreEffectProperty.new(simulator, CoreEffectProperty, "channel", "value_list", "world")
	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = "local"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	simulator.add_property(CoreEffectProperty, simulator)

	help = "If set, age will be read per particle, otherwise atom age is used"
	slot6 = simulator
	slot13 = help

	simulator.add_property(CoreEffectProperty, CoreEffectProperty.new("world", CoreEffectProperty, "per_particle_age", "boolean", "false"))

	help = "Determines how velocity is scaled over time."
	slot10 = help
	local scale_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "scale_keys", "keys", "")
	slot8 = "float"

	scale_keys.set_key_type(CoreEffectProperty, scale_keys)

	slot8 = {
		v = "1",
		t = 0
	}

	scale_keys.add_key(CoreEffectProperty, scale_keys)

	slot9 = max_keys

	scale_keys.set_min_max_keys(CoreEffectProperty, scale_keys, min_keys)

	slot8 = scale_keys

	simulator.add_property(CoreEffectProperty, simulator)

	return simulator
end
function CoreParticleEditorSimulators:create_eventtick()
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "eventtick", "simulator")
	slot5 = "Triggers an event for every particle position at a set frequency."

	simulator.set_description(CoreEffectStackMember, simulator)

	slot4 = simulator
	slot11 = "Frequency of event ticks (hz)"

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Event Tick", CoreEffectProperty, "frequency", "float", "1"))

	slot4 = simulator
	slot11 = "Random interval for ticks to occur around event tick period, in seconds "

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Event Tick", CoreEffectProperty, "jitter", "float", "0"))

	slot4 = simulator
	slot11 = "If set, particle velocity will be read and included in event"

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Event Tick", CoreEffectProperty, "use_velocity", "boolean", "false"))

	slot4 = simulator
	slot11 = "If set, particle rotation will be read and included in event"

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Event Tick", CoreEffectProperty, "use_rotation", "boolean", "false"))

	return simulator
end
function CoreParticleEditorSimulators:create_particleworldcollision()
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "particleworldcollision", "simulator")
	slot5 = "Simulates collisions between particles with a fixed radius and a slice of the world."

	simulator.set_description(CoreEffectStackMember, simulator)

	slot4 = simulator
	slot11 = "Radius of particles"

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Particle <-> World Collision", CoreEffectProperty, "radius", "float", "5"))

	slot4 = simulator
	slot11 = "Elasticity of collisions"

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Particle <-> World Collision", CoreEffectProperty, "elasticity", "percentage", "0.5"))

	return simulator
end
function CoreParticleEditorSimulators:create_anglevelocityintegrator()
	slot6 = "Angle Velocity Integrator"
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "anglevelocityintegrator", "simulator")
	slot5 = "Adds angle velocity * dt to angle."

	simulator.set_description(CoreEffectStackMember, simulator)

	return simulator
end
function CoreParticleEditorSimulators:create_planecollision()
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "planecollision", "simulator")
	slot5 = "Simulates collision with a plane with set origin and normal. Parameters are runtime modifiable by script."

	simulator.set_description(CoreEffectStackMember, simulator)

	slot11 = "Name of simulator.\nThis is an optional parameter which must be set if script wants to edit exposed parameters in simulator runtime."

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Plane Collision", CoreEffectProperty, "name", "string", ""))

	local help = "Determines how plane coordinates are treated:\nrelative - Center and normal are rotated with effect rotation, and offset with effect position\nworld - Center and normal are not rotated or offset"
	slot9 = help
	local p = CoreEffectProperty.new(simulator, CoreEffectProperty, "relative", "value_list", "effect")
	slot7 = "effect"

	p.add_value(CoreEffectProperty, p)

	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	simulator.add_property(CoreEffectProperty, simulator)

	help = "Center of plane.\nCoordinates are in centimeters and world coordinates.\nParameter is runtime modifiable by script by referencing effect/atom name/simulator name/center"
	slot6 = simulator
	slot13 = help

	simulator.add_property(CoreEffectProperty, CoreEffectProperty.new("effect", CoreEffectProperty, "center", "vector3", "0 0 0"))

	help = [[
Normal of plane.
Coordinates are in centimeters and world coordinates.
Coordinates are in centimeters and world coordinates.
Parameter is runtime modifiable by script by referencing effect/atom name/simulator name/normal]]
	slot6 = simulator
	slot13 = help

	simulator.add_property(CoreEffectProperty, CoreEffectProperty.new("effect", CoreEffectProperty, "normal", "vector3", "0 0 1"))

	help = "Elasticity of collision.\nThis is a value between 0 and 1 describing amount of velocity particles should retain after collision."
	slot6 = simulator
	slot13 = help

	simulator.add_property(CoreEffectProperty, CoreEffectProperty.new("effect", CoreEffectProperty, "elasticity", "percentage", "1"))

	help = "Minimum impact velocity (cm/s) required to generate an event - if set too low, this will continously spawn events for resting particles."
	slot6 = simulator
	slot13 = help

	simulator.add_property(CoreEffectProperty, CoreEffectProperty.new("effect", CoreEffectProperty, "event_threshold_velocity", "float", "100"))

	return simulator
end
function CoreParticleEditorSimulators:create_constantacceleration()
	slot6 = "Constant Acceleration"
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "constantacceleration", "simulator")
	slot5 = "Accelerates particles with a set acceleration. If this value must be runtime modifiable, use variableacceleration."

	simulator.set_description(CoreEffectStackMember, simulator)

	local help = [[
Determines how acceleration is treated:
world - Acceleration is not transformed
effect - Acceleration is transformed with effect system transform
effect_inverse - Acceleration is transformed with inverse effect system transform,
this means that it has the given direction when transformed by the effect system transform.
use this for local position effects where acceleration is still expressed in world coordinates]]
	slot9 = help
	local p = CoreEffectProperty.new(simulator, CoreEffectProperty, "relative", "value_list", "world")
	slot7 = "effect"

	p.add_value(CoreEffectProperty, p)

	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = "effect_inverse"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	simulator.add_property(CoreEffectProperty, simulator)

	help = "Acceleration.\nCoordinates are in centimeters/s^2."
	slot6 = simulator
	slot13 = help

	simulator.add_property(CoreEffectProperty, CoreEffectProperty.new("world", CoreEffectProperty, "acceleration", "vector3", "0 0 -982"))

	return simulator
end
function CoreParticleEditorSimulators:create_windacceleration()
	slot6 = "Wind Acceleration"
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "windacceleration", "simulator")
	slot5 = "Accelerates particles with global wind."

	simulator.set_description(CoreEffectStackMember, simulator)

	local help = "Radius (cm) that particles are considered to have - this affects how much wind the particle picks up, and thus how fast it will accelerate to wind speed.\nThe default value is that of a regulation size ping pong ball."
	slot5 = simulator
	slot12 = help

	simulator.add_property(simulator, CoreEffectProperty.new(slot7, CoreEffectProperty, "radius", "float", "2"))

	help = "Mass (kg) that particles are considered to have - this affects how much wind the particle picks up, and thus how fast it will accelerate to wind speed.\nThe default value is that of a regulation size ping pong ball."
	slot5 = simulator
	slot12 = help

	simulator.add_property(simulator, CoreEffectProperty.new(slot7, CoreEffectProperty, "mass", "float", "0.0027"))

	return simulator
end
function CoreParticleEditorSimulators:create_intervalrandomvelocity()
	slot6 = "Interval Random Velocity"
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "intervalrandomvelocity", "simulator")
	slot5 = "Randomly changes velocity of particles at a set interval."

	simulator.set_description(CoreEffectStackMember, simulator)

	local help = [[
Determines how velocities are treated:
effect - Velocities are rotated with effect rotation
world - Velocities are not rotated

Velocities are always offsetted with effect spawn velocity.]]
	slot9 = help
	local p = CoreEffectProperty.new(simulator, CoreEffectProperty, "relative", "value_list", "effect")
	slot7 = "effect"

	p.add_value(CoreEffectProperty, p)

	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	simulator.add_property(CoreEffectProperty, simulator)

	help = "Box inside which particle velocities will be randomly generated.\nCoordinates are in cm/s."
	slot10 = help
	local p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "box", "box", "")
	slot12 = -100
	slot8 = Vector3("", -100, -100)
	slot13 = 100

	p.set_min_max(CoreEffectProperty, p, Vector3(-100, 100, 100))

	slot8 = p

	simulator.add_property(CoreEffectProperty, simulator)

	slot7 = simulator
	slot14 = "Frequency at which velocities will be reassigned (hz)"

	simulator.add_property(CoreEffectProperty, CoreEffectProperty.new(Vector3, CoreEffectProperty, "frequency", "float", "0.5"))

	return simulator
end
function CoreParticleEditorSimulators:create_variableacceleration()
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "variableacceleration", "simulator")
	slot5 = "Accelerates particles with a set acceleration.\nAcceleration is runtime modifiable by script by referencing effect/atom name/simulator name/acceleration."

	simulator.set_description(CoreEffectStackMember, simulator)

	slot11 = "Name of simulator.\nThis is an optional parameter which must be set if script wants to edit exposed parameters in simulator runtime."

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Variable Acceleration", CoreEffectProperty, "name", "string", ""))

	local help = [[
Determines how acceleration is treated:
world - Acceleration is not transformed
effect - Acceleration is transformed with effect system transform
effect_inverse - Acceleration is transformed with inverse effect system transform,
this means that it has the given direction when transformed by the effect system transform.
use this for local position effects where acceleration is still expressed in world coordinates]]
	slot9 = help
	local p = CoreEffectProperty.new(simulator, CoreEffectProperty, "relative", "value_list", "world")
	slot7 = "effect"

	p.add_value(CoreEffectProperty, p)

	slot7 = "world"

	p.add_value(CoreEffectProperty, p)

	slot7 = "effect_inverse"

	p.add_value(CoreEffectProperty, p)

	slot7 = p

	simulator.add_property(CoreEffectProperty, simulator)

	help = "Acceleration.\nCoordinates are in centimeters/s^2.\nAcceleration is runtime modifiable by script by referencing effect/atom name/simulator name/acceleration (type Vector3)."
	slot6 = simulator
	slot13 = help

	simulator.add_property(CoreEffectProperty, CoreEffectProperty.new("world", CoreEffectProperty, "acceleration", "vector3", "0 0 -982"))

	return simulator
end
function CoreParticleEditorSimulators:create_variablesize()
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "variablesize", "simulator")
	slot5 = "Continously writes a set size to the size channel. The size may be changed runtime by the script."

	simulator.set_description(CoreEffectStackMember, simulator)

	slot11 = "Name of simulator.\nThis is an optional parameter which must be set if script wants to edit exposed parameters in simulator runtime."

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Variable Size", CoreEffectProperty, "name", "string", ""))

	local help = "Size.\nCoordinates are in centimeters.\nSize is runtime modifiable by script by referencing effect/atom name/simulator name/size (type Vector2)."
	slot5 = simulator
	slot12 = help

	simulator.add_property(simulator, CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "size", "vector2", "100 100"))

	return simulator
end
function CoreParticleEditorSimulators:create_variableopacity()
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "variableopacity", "simulator")
	slot5 = "Continously writes a set opacity to the opacity channel. The opacity may be changed runtime by the script."

	simulator.set_description(CoreEffectStackMember, simulator)

	slot11 = "Name of simulator.\nThis is an optional parameter which must be set if script wants to edit exposed parameters in simulator runtime."

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Variable Opacity", CoreEffectProperty, "name", "string", ""))

	local help = "Opacity.\nOpacity is runtime modifiable by script by referencing effect/atom name/simulator name/opacity (type float)."
	slot5 = simulator
	slot12 = help

	simulator.add_property(simulator, CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "opacity", "float", "255"))

	return simulator
end
function CoreParticleEditorSimulators:create_rotationbyvelocity()
	slot6 = "Rotation By Velocity"
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "rotationbyvelocity", "simulator")
	slot5 = "Rotates particles so that the Z axis is pointing towards the velocity vector\nThe rotation is not done instantly but with a lerp at a set angular velocity."

	simulator.set_description(CoreEffectStackMember, simulator)

	local help = "Angular velocity of rotation towards velocity vector (degrees / second)."
	slot5 = simulator
	slot12 = help

	simulator.add_property(simulator, CoreEffectProperty.new(slot7, CoreEffectProperty, "velocity", "float", "360"))

	return simulator
end
function CoreParticleEditorSimulators:create_teleporter()
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "teleporter", "simulator")
	slot5 = [[
Teleports particles to an new location, by a frequency determined by the set particle lifetime and the size of the atom.
When a particle is teleported, its age is set to 0 and its position and velocity are reinitialized using a custom initializer -
the initializerstack does not apply. This simulator is made for creating effect surface type effects, where particles are reused,
for instance a smoke plume.
To make initial particles invisible, initialize their age to a high value and make the opacity at that time 0.]]

	simulator.set_description(CoreEffectStackMember, simulator)

	slot11 = "Name of simulator, must be set if particle_lifetime will be changed runtime"

	simulator.add_property(CoreEffectStackMember, CoreEffectProperty.new("Teleporter", CoreEffectProperty, "name", "string", ""))

	local help = [[
Lifetime of particle
constant - use constant value, this may also be modified runtime by the script
The name of the exposed variable is particle_lifetime. If this is set to -1, respawning is disabled.
keys - use key curve over time]]
	slot9 = help
	local lifetime_input = CoreEffectProperty.new(simulator, CoreEffectProperty, "lifetime_input", "variant", "constant")
	slot10 = "Constant lifetime of particles"
	local constant_lifetime = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "particle_lifetime", "time", "1")
	slot8 = true

	constant_lifetime.set_can_be_infinite(CoreEffectProperty, constant_lifetime)

	local function validate_lifetime(p)
		local ret = {
			message = "",
			valid = true
		}
		slot4 = p._value
		local a = tonumber(slot3)

		if not a or a == 0 then
			ret.message = "Invalid particle lifetime, can be < 0 (infinite) or > 0"
			ret.valid = false
		end

		return ret
	end

	slot9 = validate_lifetime

	constant_lifetime.set_custom_validator(constant_lifetime, constant_lifetime)

	slot10 = constant_lifetime

	lifetime_input.add_variant(constant_lifetime, lifetime_input, "constant")

	slot12 = ""
	local lifetime_keys = CoreEffectProperty.new(constant_lifetime, CoreEffectProperty, "lifetime_keys", "keys", "")
	slot10 = "time"

	lifetime_keys.set_key_type(CoreEffectProperty, lifetime_keys)

	slot10 = {
		v = "1",
		t = 0
	}

	lifetime_keys.add_key(CoreEffectProperty, lifetime_keys)

	slot11 = max_keys

	lifetime_keys.set_min_max_keys(CoreEffectProperty, lifetime_keys, min_keys)

	slot11 = lifetime_keys

	lifetime_input.add_variant(CoreEffectProperty, lifetime_input, "keys")

	slot10 = "lifetime"
	local lifetime_container = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot11 = lifetime_input

	lifetime_container.add_property(CoreEffectPropertyContainer, lifetime_container)

	slot13 = ""
	local lifetime_prop = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "", "compound")
	slot12 = lifetime_container

	lifetime_prop.set_compound_container(CoreEffectProperty, lifetime_prop)

	slot12 = false

	lifetime_prop.set_save_to_child(CoreEffectProperty, lifetime_prop)

	local help = [[
Frequency of particle teleports
constant - use constant value, this may also be modified runtime by the script
The name of the exposed variable is particle_lifetime. If this is set to -1, respawning is disabled.
keys - use key curve over time]]
	slot16 = help
	local frequency_input = CoreEffectProperty.new(lifetime_prop, CoreEffectProperty, "frequency_input", "variant", "constant")
	slot17 = "Constant frequency of teleports"
	local constant_frequency = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "frequency", "time", "1")
	slot15 = true

	constant_frequency.set_can_be_infinite(CoreEffectProperty, constant_frequency)

	slot16 = constant_frequency

	frequency_input.add_variant(CoreEffectProperty, frequency_input, "constant")

	local frequency_keys = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "frequency_keys", "keys", "")
	slot16 = "time"

	frequency_keys.set_key_type(CoreEffectProperty, frequency_keys)

	slot16 = {
		v = "1",
		t = 0
	}

	frequency_keys.add_key(CoreEffectProperty, frequency_keys)

	slot17 = max_keys

	frequency_keys.set_min_max_keys(CoreEffectProperty, frequency_keys, min_keys)

	slot17 = frequency_keys

	frequency_input.add_variant(CoreEffectProperty, frequency_input, "keys")

	slot16 = "frequency"
	local frequency_container = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot17 = frequency_input

	frequency_container.add_property(CoreEffectPropertyContainer, frequency_container)

	slot16 = frequency_container
	slot23 = "Do not teleport a particle unless it is this old"

	frequency_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "min_age", "time", "-1"))

	slot19 = ""
	local frequency_prop = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "", "compound")
	slot18 = frequency_container

	frequency_prop.set_compound_container(CoreEffectProperty, frequency_prop)

	slot18 = false

	frequency_prop.set_save_to_child(CoreEffectProperty, frequency_prop)

	slot18 = "distance"
	local distance_container = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot18 = distance_container
	slot25 = "Distance to move atom before teleport is triggered."

	distance_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("min_age", CoreEffectProperty, "teleport_dist", "float", "100"))

	slot21 = ""
	local distance_prop = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "", "compound")
	slot20 = distance_container

	distance_prop.set_compound_container(CoreEffectProperty, distance_prop)

	slot20 = false

	distance_prop.set_save_to_child(CoreEffectProperty, distance_prop)

	slot23 = "When to trigger teleport - either when atom has moved a certain distance or when a certain time has passed"
	local tt = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "trigger_teleport", "variant", "time")
	slot22 = lifetime_prop

	tt.add_variant(CoreEffectProperty, tt, "time")

	slot22 = frequency_prop

	tt.add_variant(CoreEffectProperty, tt, "frequency")
	tt.add_variant(CoreEffectProperty, tt, "distance")

	slot21 = tt

	simulator.add_property(CoreEffectProperty, simulator)

	slot20 = simulator
	slot27 = "More particles than this will never be teleported per frame."

	simulator.add_property(CoreEffectProperty, CoreEffectProperty.new(distance_prop, CoreEffectProperty, "teleport_cap", "int", "1"))

	slot20 = simulator
	slot27 = "If set, teleported particles will always be moved to current atom position.\nThis reduces lag, but will cause trails of particles to have uneven gaps depending on framerate.\nIf not set, teleported particles will be moved to the linear interpolated position for the time of teleport."

	simulator.add_property(CoreEffectProperty, CoreEffectProperty.new(distance_prop, CoreEffectProperty, "current_position", "boolean", "true"))

	slot24 = "Position channel that particles should be teleported within"
	local p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "channel", "value_list", "world")
	slot22 = "world"

	p.add_value(CoreEffectProperty, p)

	slot22 = "local"

	p.add_value(CoreEffectProperty, p)

	slot22 = p

	simulator.add_property(CoreEffectProperty, simulator)

	slot25 = "Determines how much random jitter normal should receive when particle is repositioned"
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "normal_variation", "percentage", "0")
	slot22 = p

	simulator.add_property(CoreEffectProperty, simulator)

	slot25 = "If set, teleporter will generate an event every time a particle is teleported"
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "teleport_event", "boolean", "false")
	slot22 = p

	simulator.add_property(CoreEffectProperty, simulator)

	help = "Position initializer\ncircle - initializes positions in a circle around (0,0,1) relative to effect location"
	slot25 = help
	local position_variant = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "positioner", "variant", "circle")
	slot23 = false

	position_variant.set_silent(CoreEffectProperty, position_variant)

	slot25 = ""
	local p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "circle", "compound")
	slot24 = "circle"
	local circle_positioner = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot25 = "Initializes positions in a circle around (0,0,1) relative to effect location. Normal always points at (0,1,0)."

	circle_positioner.set_description(CoreEffectPropertyContainer, circle_positioner)

	slot24 = circle_positioner
	slot31 = "Radius of circle"

	circle_positioner.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("true", CoreEffectProperty, "radius", "float", "100"))

	slot24 = circle_positioner
	slot31 = "If this flag is set, position will always lie at the edge of the circle"

	circle_positioner.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("true", CoreEffectProperty, "on_edge", "boolean", "false"))

	slot25 = circle_positioner

	p.set_compound_container(CoreEffectPropertyContainer, p)

	slot27 = p
	slot26 = p

	position_variant.add_variant(CoreEffectPropertyContainer, position_variant, p.name("true"))

	slot27 = ""
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "box", "compound")
	slot25 = "box"
	local box_positioner = CoreEffectPropertyContainer.new(CoreEffectPropertyContainer, CoreEffectPropertyContainer)
	slot26 = "Initializes positions in a box relative to effect location."

	box_positioner.set_description(CoreEffectPropertyContainer, box_positioner)

	help = "Box inside which particle positions will be randomly generated.\nCoordinates are in cm."
	slot29 = help
	local q = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "positions", "box", "")
	slot31 = -100
	slot27 = Vector3("", -100, -100)
	slot32 = 100

	q.set_min_max(CoreEffectProperty, q, Vector3(-100, 100, 100))

	slot27 = q

	box_positioner.add_property(CoreEffectProperty, box_positioner)

	slot30 = "Box inside which particle normals will be randomly generated.\nNormal will be normalized."
	q = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "velocities", "box", "")
	slot31 = 0
	slot27 = Vector3("box", 0, 1)
	slot32 = 0

	q.set_min_max(CoreEffectProperty, q, Vector3(0, 0, 1))
	q.set_min_max_name(CoreEffectProperty, q, "min_normal")

	slot27 = q

	box_positioner.add_property(CoreEffectProperty, box_positioner)

	slot27 = box_positioner

	p.set_compound_container(CoreEffectProperty, p)

	slot29 = p
	slot28 = p

	position_variant.add_variant(CoreEffectProperty, position_variant, p.name("max_normal"))

	slot27 = position_variant

	simulator.add_property(CoreEffectProperty, simulator)

	help = "Velocity initializer\nnormal - initializes velocity along normal from positioner"
	slot30 = help
	local velocity_variant = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "velocity", "variant", "normal")
	slot28 = true

	velocity_variant.set_silent(CoreEffectProperty, velocity_variant)

	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "normal", "compound")
	slot28 = "normal"
	local normal_velocity = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot29 = "Initializes velocity randomly along normal from positioner"

	normal_velocity.set_description(CoreEffectPropertyContainer, normal_velocity)

	slot28 = normal_velocity
	slot35 = "Minimum velocity"

	normal_velocity.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "min_velocity", "float", "0"))

	slot28 = normal_velocity
	slot35 = "Maximum velocity"

	normal_velocity.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "max_velocity", "float", "100"))

	slot29 = normal_velocity

	p.set_compound_container(CoreEffectPropertyContainer, p)

	slot31 = p
	slot30 = p

	velocity_variant.add_variant(CoreEffectPropertyContainer, velocity_variant, p.name(""))

	slot29 = velocity_variant

	simulator.add_property(CoreEffectPropertyContainer, simulator)

	help = "Rotation initializer\nnone - no rotation is assigned\nrandom - initializes with a random rotation"
	slot32 = help
	local rotation_variant = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "rotation", "variant", "none")
	slot30 = true

	rotation_variant.set_silent(CoreEffectProperty, rotation_variant)

	slot32 = ""
	p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "random_rotation", "compound")
	slot30 = "random_rotation"
	local random_rotation = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot31 = "Initializes particle rotations to random values, with the normal within a specified box and a random angle around the normal."

	random_rotation.set_description(CoreEffectPropertyContainer, random_rotation)

	slot34 = "Box within which normal will be randomized."
	q = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "box", "box", "")
	slot35 = 1
	slot31 = Vector3("box", -10, -10)
	slot36 = 1

	q.set_min_max(CoreEffectPropertyContainer, q, Vector3(-10, 10, 10))

	slot31 = q

	random_rotation.add_property(CoreEffectPropertyContainer, random_rotation)

	slot30 = random_rotation
	slot37 = "Min angle around normal"

	random_rotation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new(Vector3, CoreEffectProperty, "min_rot", "float", "0"))

	slot30 = random_rotation
	slot37 = "Max angle around normal"

	random_rotation.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new(Vector3, CoreEffectProperty, "max_rot", "float", "365"))

	slot31 = random_rotation

	p.set_compound_container(CoreEffectPropertyContainer, p)

	slot33 = p
	slot32 = p

	rotation_variant.add_variant(CoreEffectPropertyContainer, rotation_variant, p.name(Vector3))

	slot34 = "No rotation assigned"
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "rotation", "", "")
	slot31 = true

	p.set_silent(CoreEffectPropertyContainer, p)

	slot32 = p

	rotation_variant.add_variant(CoreEffectPropertyContainer, rotation_variant, "none")

	slot31 = rotation_variant

	simulator.add_property(CoreEffectPropertyContainer, simulator)

	return simulator
end
function CoreParticleEditorSimulators:create_ager()
	slot6 = "Ager"
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "ager", "simulator")
	slot5 = "Adds timestep to age channel."

	simulator.set_description(CoreEffectStackMember, simulator)

	return simulator
end
function CoreParticleEditorSimulators:create_particleparticlecollision()
	slot6 = "Particle <-> Particle Collision"
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "particleparticlecollision", "simulator")
	slot5 = "Simulates collision between particles.\nNote that collions are only simulated between particles within the same atom and instance.\nAn event of type particleparticle_collision will be spawned whenever two particles collide (and total impact velocity is above threshold)"

	simulator.set_description(CoreEffectStackMember, simulator)

	local help = "Radius of particles in cm."
	slot12 = help

	simulator.add_property(simulator, CoreEffectProperty.new(slot7, CoreEffectProperty, "radius", "float", "1"))

	local help = "Elasticity of collision.\nThis is a value between 0 and 1 determining how much velocity particle retains after a collision."
	slot6 = simulator
	slot13 = help

	simulator.add_property(simulator, CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "elasticity", "percentage", "1"))

	help = "Minimum total impact velocity (cm/s) required to generate an event - if set too low, this will continously spawn events for particles resting on each other."
	slot6 = simulator
	slot13 = help

	simulator.add_property(simulator, CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "event_threshold_velocity", "float", "100"))

	return simulator
end
function CoreParticleEditorSimulators:create_worldtransform()
	slot6 = "Local -> World Transform"
	local simulator = CoreEffectStackMember.new(slot2, CoreEffectStackMember, "worldtransform", "simulator")
	slot5 = "Transforms local positions (and optionally rotations) to world coordinates."

	simulator.set_description(CoreEffectStackMember, simulator)

	local help = "If set, rotation channel will be read and transformed by effect transform into the world rotation channel."
	slot5 = simulator
	slot12 = help

	simulator.add_property(simulator, CoreEffectProperty.new(slot7, CoreEffectProperty, "transform_rotations", "boolean", "false"))

	return simulator
end

return 
