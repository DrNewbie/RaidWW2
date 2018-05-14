if not CoreEffectStackMember then
	slot2 = CoreEffectPropertyContainer
	slot0 = class(slot1)
end

CoreEffectStackMember = slot0
function CoreEffectStackMember:init(name, stacktype, ui_name)
	slot7 = name

	self.super.init(slot5, self)

	self._stacktype = stacktype
	self._ui_name = ui_name

	return 
end
function CoreEffectStackMember:save(node)
	slot7 = self
	local n = node.make_child(slot3, self.name(slot6))
	slot6 = n

	self.save_properties(node, self)

	return 
end
function CoreEffectStackMember:access()
	local ret = {}

	if self._stacktype == "initializer" then
		local n = Node(slot3)
		slot6 = n

		self.save("initializerstack", self)

		slot5 = World
		slot6 = n
		ret = World.effect_manager("initializerstack").query_initializer_access_pattern("initializerstack", World.effect_manager("initializerstack"))
	elseif self._stacktype == "simulator" then
		local n = Node(slot3)
		slot6 = n

		self.save("simulatorstack", self)

		slot5 = World
		slot6 = n
		ret = World.effect_manager("simulatorstack").query_simulator_access_pattern("simulatorstack", World.effect_manager("simulatorstack"))
	elseif self._stacktype == "visualizer" then
		local n = Node(slot3)
		slot6 = n

		self.save("visualizerstack", self)

		slot5 = World
		slot6 = n
		ret = World.effect_manager("visualizerstack").query_visualizer_access_pattern("visualizerstack", World.effect_manager("visualizerstack"))
	else
		slot5 = "Unhandled stacktype"

		assert(slot3, false)
	end

	return ret
end
function CoreEffectStackMember:reads_writes()
	local reads = {}
	local writes = {}
	local access = self.access(slot4)
	slot6 = access

	for _, a in ipairs(self) do
		if a.access == "WRITE" then
			writes[a.component] = "FULL"
		elseif a.access == "READ" then
			reads[a.component] = "FULL"
		elseif a.access == "WRITE_READ" or a.access == "READ_WRITE" then
			writes[a.component] = "FULL"
			reads[a.component] = "FULL"
		elseif a.access == "READ_WRITE_SOME" then
			reads[a.component] = "FULL"
			writes[a.component] = "SOME"
		elseif a.access == "WRITE_SOME" then
			writes[a.component] = "SOME"
		else
			slot12 = "Unhandled enum"

			assert(slot10, false)
		end
	end

	return reads, writes
end
CoreEffectStack = CoreEffectStack or class()
function CoreEffectStack:init(stacktype)
	self._type = stacktype
	self._stack = {}

	return 
end
function CoreEffectStack:stack()
	return self._stack
end
function CoreEffectStack:member(i)
	return self._stack[i]
end
function CoreEffectStack:add_member(member)
	slot5 = member

	table.insert(slot3, self._stack)

	return 
end
function CoreEffectStack:insert_member(member, i)
	slot7 = member

	table.insert(slot4, self._stack, i)

	return 
end
function CoreEffectStack:move_down(idx)
	if idx == #self._stack then
		return 
	end

	local e = self._stack[idx]
	slot6 = idx

	table.remove(slot4, self._stack)

	slot7 = e

	table.insert(slot4, self._stack, idx + 1)

	return 
end
function CoreEffectStack:move_up(idx)
	if idx == 1 then
		return 
	end

	local e = self._stack[idx]
	slot6 = idx

	table.remove(slot4, self._stack)

	slot7 = e

	table.insert(slot4, self._stack, idx - 1)

	return 
end
function CoreEffectStack:remove(idx)
	slot5 = idx

	table.remove(slot3, self._stack)

	return 
end
function CoreEffectStack:validate(channels)
	local ret = {
		valid = true,
		message = "",
		node = nil
	}

	if #self._stack == 0 then
		ret.valid = false
		ret.message = self._type .. " stack is empty"

		return ret
	end

	if self._type == "visualizer" then
		slot5 = self._stack

		for _, m in ipairs(slot4) do
			slot10 = m

			if m.name(slot9) == "trail" then
				slot13 = "size"
				local num_backlog = tonumber(slot9)
				slot14 = "tesselation"
				local tesselation = tonumber(m.get_property(m.get_property(m, m)._value, m)._value)
				local l = 1 + num_backlog * (tesselation + 1)

				if 80 <= l then
					ret.valid = false
					ret.message = "Trail visualizer has a too high tesselation or backlog size, decrease tesselation or backlog"
					m._valid_properties = false

					return ret
				end
			end
		end
	end

	local position_written = false
	slot6 = self._stack

	for _, m in ipairs(slot5) do
		slot11 = m
		ret = m.validate_properties(slot10)

		if not ret.valid then
			slot13 = m
			ret.message = self._type .. "stack, " .. m.name(slot12) .. " - " .. ret.message
			m._valid_properties = false

			return ret
		end

		m._valid_properties = true
		local access = m.access(slot10)
		slot12 = access

		for _, a in ipairs(m) do
			if a.access == "WRITE" or a.access == "WRITE_READ" then
				channels[a.component] = true

				if a.component == "POSITION" then
					position_written = true
				end
			elseif a.access == "READ" or a.access == "READ_WRITE" or a.access == "READ_WRITE_SOME" then
				if not channels[a.component] then
					ret.valid = false
					slot17 = m
					ret.message = m.name(slot16) .. " in " .. self._type .. "stack reads from " .. a.component .. " before it has beeen written"

					return ret
				end

				if a.access == "READ_WRITE" then
					channels[a.component] = true

					if a.component == "POSITION" then
						position_written = true
					end
				end
			end
		end
	end

	if self._type == "simulator" and not position_written then
		ret.valid = false
		ret.message = "Position channel not fully written in simulator stack, this is needed for effect bounding box to be valid"

		return ret
	end

	return ret
end
function CoreEffectStack:save(node)
	slot5 = self._type .. "stack"
	local stack = node.make_child(slot3, node)
	slot5 = self._stack

	for _, m in ipairs(node) do
		slot11 = stack

		m.save(slot9, m)
	end

	return 
end
function CoreEffectStack:load(node)
	slot4 = node

	for child1 in node.children(slot3) do
		slot8 = child1

		if child1.name(slot7) == self._type .. "stack" then
			slot8 = child1

			for child2 in child1.children(slot7) do
				slot13 = child2
				local creator = stack_members[self._type][child2.name(slot12)]
				slot14 = "Could not resolve creator for member type"

				assert(slot12, creator)

				local m = creator()
				slot15 = child2

				m.load_properties(creator, m)

				slot15 = m

				table.insert(creator, self._stack)
			end

			return 
		end
	end

	return 
end

if not CoreEffectAtom then
	slot2 = CoreEffectPropertyContainer
	slot0 = class(slot1)
end

CoreEffectAtom = slot0
function CoreEffectAtom:init(name)
	slot5 = name

	self.super.init(slot3, self)

	local help = [[
Defines the minimum and maximum number of particles in the atom
The minimum number will be used if the effect quality setting is at the lowest,
the maximum number if the effect quality setting is at the highest, otherwise in between the two.
Test how your effect looks at minimum and maximum quality
using the Play Lowest Quality Once and Play Highest Quality Once buttons.
The default playback mode is the medium quality.]]
	slot5 = self
	slot12 = help

	self.add_property(self, CoreEffectProperty.new(slot7, CoreEffectProperty, "min_size", "int", "1"))

	slot5 = self
	slot12 = help

	self.add_property(self, CoreEffectProperty.new(slot7, CoreEffectProperty, "max_size", "int", "1"))

	help = "Defines the lifetime of the atom - can be -1 which means infinite, or a set number of seconds"
	slot9 = help
	local p = CoreEffectProperty.new(self, CoreEffectProperty, "lifetime", "time", "1")
	slot7 = true

	p.set_can_be_infinite(CoreEffectProperty, p)

	slot7 = p

	self.add_property(CoreEffectProperty, self)

	help = "Defines the start time of the atom, relative to effect spawn time. The atom will not be updated or rendered during this time."
	local p = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "random_start_time", "variant", "false")
	slot8 = "false"
	slot15 = "Start time for atom"

	p.add_variant(CoreEffectProperty, p, CoreEffectProperty.new(help, CoreEffectProperty, "start_time", "time", "0"))

	local random_start_time = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "start_time", "compound", "")
	slot9 = false

	random_start_time.set_save_to_child(CoreEffectProperty, random_start_time)

	slot9 = "random_start_time"
	local random_start_time_container = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot9 = random_start_time_container
	slot16 = "Minimum start time"

	random_start_time_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "min_start_time", "time", "0"))

	slot9 = random_start_time_container
	slot16 = "Maximum start time"

	random_start_time_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "max_start_time", "time", "0"))

	slot10 = random_start_time_container

	random_start_time.set_compound_container(CoreEffectPropertyContainer, random_start_time)

	slot11 = random_start_time

	p.add_variant(CoreEffectPropertyContainer, p, "true")

	slot10 = p

	self.add_property(CoreEffectPropertyContainer, self)

	slot13 = [[
Preroll time for the atom, in seconds.
Atom will appear to have already lived for this time when it is spawned.
This is an expensive parameter - each second corresponds to a number of iterations of the atom simulation stack.

Note that only this effect in isolation will be processed - events generated will be processed after preroll.
This means that effects depending on event handlers being called per frame will not work well with preroll.

The maximum preroll time is 5s. This limitation is for preventing stalls during spawn.
Only infinite-lifetime effects may be prerolled. This limitation is here since the effects that are most
in need of preroll are infinite lifetime effects - other effects should be designed to reach the same
effect by construction of the initializer stack.]]
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "preroll", "time", "0")
	slot10 = p

	self.add_property(CoreEffectPropertyContainer, self)

	slot9 = self
	slot16 = "Multiplier for inherited initial velocity- 0 means no velocity, 2 means double velocity."

	self.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("time", CoreEffectProperty, "inherit_velocity_multiplier", "float", "1"))

	slot13 = "Distance (in meters) at which an effect starts fading in. -1 means no fading.\nSmooth fading only works for effects with a visualizer that respects opacity, other effects will just disappear when they reach the cull distance."
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "fade_in_start", "value_list", "-1")
	slot10 = "-1"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "0"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "0.5"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "1"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "2"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "5"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "7"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "10"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "15"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "20"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "50"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "80"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "100"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "200"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "300"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "400"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "500"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "600"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "700"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "800"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "900"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "1000"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = p

	self.add_property(CoreEffectPropertyContainer, self)

	slot13 = "Distance (in meters) over which to fade in effect. 0 means no fading."
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "fade_in_length", "value_list", "0")
	slot10 = "0"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "0.5"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "1"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "2"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "5"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "7"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "10"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "15"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "20"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "50"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = p

	self.add_property(CoreEffectPropertyContainer, self)

	slot13 = "Distance (in meters) past which an effect starts fading out. -1 means no fading.\nThe distance past fade_out_start over which effect will be faded is calculated by a factor.\nSmooth fading only works for effects with a visualizer that respects opacity, other effects will just disappear when they reach the cull distance."
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "fade_out_start", "value_list", "-1")
	slot10 = "-1"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "2"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "3"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "5"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "10"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "20"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "50"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "65"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "80"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "100"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "200"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "300"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "400"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "500"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "600"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "700"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "800"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "900"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "1000"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = p

	self.add_property(CoreEffectPropertyContainer, self)

	help = "Determines what happens when an atom is spawned at a location which is not visible.\nkill - atom will be killed immediately without being initialized and updated\ninitialize - atom will be initialized and updated at least once, after this the cull policy will apply if the atom is still culled"
	slot13 = help
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "spawn_cull_policy", "value_list", "kill")
	slot10 = "kill"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "initialize"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = p

	self.add_property(CoreEffectPropertyContainer, self)

	help = [[
Determines what happens when atom is culled:
kill - removes the atom from world
freeze - stops updating atom
update - keeps updating atom, only use this when absolutely required since it is expensive
update_render - keeps both updating and rendering atom, only use this when absolutely positively required since it is expensive

The update_render option is required for screen aligned effects to be rendered]]
	slot13 = help
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "cull_policy", "value_list", "kill")
	slot10 = "kill"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "freeze"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "update"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "update_render"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = p

	self.add_property(CoreEffectPropertyContainer, self)

	help = "Defines the period of time in seconds that the atom must be culled before the cull policy is applied.\nIf for example set to 1, and cull_policy is kill, an atom that is not visible will remain alive for 1 second before being removed."
	slot9 = self
	slot16 = help

	self.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("value_list", CoreEffectProperty, "cull_gracetime", "time", "0"))

	help = [[
If this is set to a value >= 0, the given value will be used as the max radius for the visual representation of a particle
You do not need to set this value if the visualizer uses a key curve or a constant for determining its size,
but if the size is dependent on channel input you must set it to get a valid radius.

The max visual radius of a particle is used for building the bounding volume, so if this value is too low
the effect will be culled while still visible]]
	slot9 = self
	slot16 = help

	self.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("value_list", CoreEffectProperty, "max_particle_radius", "float", "-1"))

	help = "Soundbank for sound to be played at atom creation. May be empty."
	slot9 = self
	slot16 = help

	self.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("value_list", CoreEffectProperty, "soundbank", "sound", ""))

	help = "Cue for sound to be played at atom creation. If empty, no sound is played."
	slot9 = self
	slot16 = help

	self.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("value_list", CoreEffectProperty, "cue", "sound", ""))

	help = "If set, sound will be played in ambient mode."
	slot9 = self
	slot16 = help

	self.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("value_list", CoreEffectProperty, "ambient", "boolean", "false"))

	help = "If the effect uses particle-world collision, and this is set to effect, grab position will be rotated with effect transform"
	slot13 = help
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "grab_relative", "value_list", "effect")
	slot10 = "effect"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = "world"

	p.add_value(CoreEffectPropertyContainer, p)

	slot10 = p

	self.add_property(CoreEffectPropertyContainer, self)

	help = "If the effect uses particle-world collision, a copy of the world geometry will be grabbed around this point"
	slot9 = self
	slot16 = help

	self.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("value_list", CoreEffectProperty, "grab_pos", "vector3", "0 0 0"))

	help = "If the effect uses particle-world collision, this radius specifies the region around the grab point within which geometry will be grabbed.\nNote that there is a cap on the amount of geometry that is grabbed - setting a very high radius may result in geometry\nfar from the expected collision area to be grabbed, while ignoring geometry in the collision area."
	slot9 = self
	slot16 = help

	self.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("value_list", CoreEffectProperty, "grab_radius", "float", "200"))

	help = "If the effect uses particle-world collision and this parameter is set, faces pointing away from grab position will be included in collision grab."
	slot9 = self
	slot16 = help

	self.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("value_list", CoreEffectProperty, "grab_backfacing", "boolean", "false"))

	help = "Internal event listeners - these are listeners capable of handling events spawned by the simulators with a fixed behaviour.\nFor more advanced event handling, script callbacks can be registered with effect instances at runtime."
	slot13 = help
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "event_listeners", "list_objects", "")

	local function create_event_types()
		slot6 = "Type of event that handler should respond to"
		local event_types = CoreEffectProperty.new(slot1, CoreEffectProperty, "event", "value_list", "collision")
		slot4 = "collision"

		event_types.add_value(CoreEffectProperty, event_types)

		slot4 = "particleparticle_collision"

		event_types.add_value(CoreEffectProperty, event_types)

		slot4 = "tick"

		event_types.add_value(CoreEffectProperty, event_types)

		slot4 = "teleport"

		event_types.add_value(CoreEffectProperty, event_types)

		return event_types
	end

	local function create_effect_spawn_property()
		local effect_spawn_property = CoreEffectProperty.new(slot1, CoreEffectProperty, "effect_spawn", "compound", "")
		slot4 = false

		effect_spawn_property.set_save_to_child(CoreEffectProperty, effect_spawn_property)

		slot4 = "effect_spawn"
		local effect_spawn_container = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
		slot4 = effect_spawn_container

		effect_spawn_container.add_property(CoreEffectPropertyContainer, create_event_types())

		slot4 = effect_spawn_container
		slot11 = "Effect that should be spawned in response to event"

		effect_spawn_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "effect", "effect", ""))

		slot5 = effect_spawn_container

		effect_spawn_property.set_compound_container(CoreEffectPropertyContainer, effect_spawn_property)

		return effect_spawn_property
	end

	local function create_effect_spawn_once_property()
		local effect_spawn_once_property = CoreEffectProperty.new(slot1, CoreEffectProperty, "effect_spawn_once_drag", "compound", "")
		slot4 = false

		effect_spawn_once_property.set_save_to_child(CoreEffectProperty, effect_spawn_once_property)

		slot4 = "effect_spawn_once_drag"
		local effect_spawn_once_container = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
		slot4 = effect_spawn_once_container

		effect_spawn_once_container.add_property(CoreEffectPropertyContainer, create_event_types())

		slot4 = effect_spawn_once_container
		slot11 = "Effect that should be spawned and dragged in response to event"

		effect_spawn_once_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "effect", "effect", ""))

		slot5 = effect_spawn_once_container

		effect_spawn_once_property.set_compound_container(CoreEffectPropertyContainer, effect_spawn_once_property)

		return effect_spawn_once_property
	end

	local function create_play_sound_property()
		local play_sound = CoreEffectProperty.new(slot1, CoreEffectProperty, "play_sound", "compound", "")
		slot4 = false

		play_sound.set_save_to_child(CoreEffectProperty, play_sound)

		slot4 = "play_sound"
		local play_sound_container = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
		slot4 = play_sound_container

		play_sound_container.add_property(CoreEffectPropertyContainer, create_event_types())

		slot4 = play_sound_container
		slot11 = "If set, sound will only be played once at first event, and then dragged to each new event location"

		play_sound_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "once_then_drag", "boolean", "false"))

		slot4 = play_sound_container
		slot11 = "Soundbank for sound to be played in response to event"

		play_sound_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "bank", "bank", ""))

		slot4 = play_sound_container
		slot11 = "Cue for sound to be played in response to event"

		play_sound_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "cue", "cue", ""))

		help = "If set, sound will be played in ambient mode."
		slot4 = play_sound_container
		slot11 = help

		play_sound_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "ambient", "boolean", "false"))

		slot5 = play_sound_container

		play_sound.set_compound_container(CoreEffectPropertyContainer, play_sound)

		return play_sound
	end

	slot14 = "effect_spawn"

	p.set_object("", p, create_effect_spawn_property())

	slot14 = "effect_spawn_once_drag"

	p.set_object("", p, create_effect_spawn_once_property())

	slot14 = "play_sound"

	p.set_object("", p, create_play_sound_property())

	slot14 = p

	self.add_property("", self)

	slot17 = ""
	p = CoreEffectProperty.new("", CoreEffectProperty, "timeline", "timeline", "")
	slot14 = "timeline_init"

	p.set_timeline_init_callback_name("", p)

	slot14 = p

	self.add_property("", self)

	slot15 = "initializer"
	slot15 = "simulator"
	slot15 = "visualizer"
	self._stacks = {
		initializer = CoreEffectStack.new(self, CoreEffectStack),
		simulator = CoreEffectStack.new(self, CoreEffectStack),
		visualizer = CoreEffectStack.new(self, CoreEffectStack)
	}

	return 
end
function CoreEffectAtom:collect_stack_time_events()
	local ret = {}

	local function traverse_property(pref, ret, p)
		if p._type == "time" then
			slot6 = {
				pref .. p.name(slot9),
				p,
				"_value"
			}
			slot10 = p

			table.insert(slot4, ret)
		elseif p._type == "variant" then
			slot7 = p._variants[p._value]

			traverse_property(slot4, pref, ret)
		elseif p._type == "compound" then
			slot5 = p._compound_container

			for _, q in ipairs(slot4) do
				slot12 = q

				traverse_property(slot9, pref, ret)
			end
		elseif p._type == "keys" then
			slot5 = p._keys

			for _, k in ipairs(slot4) do
				slot11 = {
					pref .. p.name(slot14),
					k,
					"t"
				}
				slot15 = p

				table.insert(slot9, ret)
			end
		end

		return 
	end

	slot5 = self._stacks

	for _, stack in pairs(slot4) do
		slot10 = stack._stack

		for _, member in ipairs(slot9) do
			slot15 = member._properties

			for _, p in ipairs(slot14) do
				slot22 = member
				local pref = stack._type .. "/" .. member.name(slot21) .. "/"
				slot23 = p

				traverse_property(member.name(slot21), pref, ret)
			end
		end
	end

	return ret
end
function CoreEffectAtom:collect_time_events()
	slot4 = "random_start_time"
	local start_time = self.get_property(slot2, self)._variants.false
	slot5 = "lifetime"
	local lifetime = self.get_property(self, self)
	local ret = self.collect_stack_time_events(self)
	slot6 = ret

	for _, e in ipairs(self) do
		local name = e[1]
		slot13 = start_time._value
		local t = tonumber(slot11) + tonumber(e[2][e[3]])
		e[2] = {
			t
		}
		e[3] = 1
	end

	slot7 = {
		"start_time",
		start_time,
		"_value"
	}

	table.insert(slot5, ret)

	slot6 = lifetime._value

	if 0 <= tonumber(slot5) then
		slot7 = {
			"end_time",
			{
				tonumber(slot10) + tonumber(start_time._value)
			},
			1
		}
		slot12 = lifetime._value

		table.insert(slot5, ret)
	end

	return ret
end
function CoreEffectAtom:scale_timeline(istart, iend, tstart, tend)
	local events = self.collect_stack_time_events(slot6)
	slot9 = "random_start_time"
	local start_time = self.get_property(self, self)._variants.false
	local lifetime = self.get_property(self, self)
	local end_time = {
		"end_time",
		lifetime,
		"_value"
	}
	slot11 = lifetime._value

	if 0 <= tonumber("lifetime") then
		slot12 = end_time

		table.insert(slot10, events)
	end

	local start_time_v = tonumber(slot10)
	slot12 = events

	for _, e in ipairs(start_time._value) do
		e[2][e[3]] = e[2][e[3]] + start_time_v
	end

	slot13 = {
		"start_time",
		start_time,
		"_value"
	}

	table.insert(slot11, events)

	slot12 = events

	for _, e in ipairs(slot11) do
		local name = e[1]
		slot18 = e[2][e[3]]
		local t = tonumber(slot17)

		if t <= istart then
			t = (t + tstart) - istart
		elseif iend <= t then
			t = (t + tend) - iend
		else
			local rel = 0

			if iend - istart ~= 0 then
				rel = (t - istart) / (iend - istart)
			end

			t = tstart + rel * (tend - tstart)
		end

		e[2][e[3]] = t
	end

	local new_start_time_v = tonumber(slot11)
	slot13 = events

	for _, e in ipairs(start_time._value) do
		if e[2] ~= start_time then
			e[2][e[3]] = e[2][e[3]] - new_start_time_v
		end
	end

	return 
end
function CoreEffectAtom:extend_timeline(istart, iend, tstart, tend)
	local events = self.collect_stack_time_events(slot6)
	slot9 = "random_start_time"
	local start_time = self.get_property(self, self)._variants.false
	local lifetime = self.get_property(self, self)
	local end_time = {
		"end_time",
		lifetime,
		"_value"
	}
	slot11 = lifetime._value

	if 0 <= tonumber("lifetime") then
		slot12 = end_time

		table.insert(slot10, events)
	end

	local start_time_v = tonumber(slot10)
	slot12 = events

	for _, e in ipairs(start_time._value) do
		e[2][e[3]] = e[2][e[3]] + start_time_v
	end

	slot13 = {
		"start_time",
		start_time,
		"_value"
	}

	table.insert(slot11, events)

	slot12 = events

	for _, e in ipairs(slot11) do
		local name = e[1]
		slot18 = e[2][e[3]]
		local t = tonumber(slot17)

		if t <= istart then
			t = (t + tstart) - istart
		elseif iend <= t then
			t = (t + tend) - iend
		end

		e[2][e[3]] = t
	end

	local new_start_time_v = tonumber(slot11)
	slot13 = events

	for _, e in ipairs(start_time._value) do
		if e[2] ~= start_time then
			e[2][e[3]] = e[2][e[3]] - new_start_time_v
		end
	end

	return 
end
function CoreEffectAtom:validate()
	local ret = {
		valid = true,
		message = "",
		node = nil
	}
	slot4 = self
	ret = self.validate_properties(slot3)

	if not ret.valid then
		return ret
	end

	slot7 = "lifetime"
	slot6 = self.get_property(slot5, self)
	local lifetime = tonumber(self.get_property(slot5, self).value(slot5))

	if not lifetime then
		ret.valid = false
		slot6 = self
		ret.message = "Invalid lifetime for atom " .. self.name(slot5)

		return ret
	end

	slot8 = "preroll"
	slot7 = self.get_property(slot6, self)
	local preroll = tonumber(self.get_property(slot6, self).value(slot6))

	if not preroll or preroll < 0 or 5 < preroll then
		ret.valid = false
		slot7 = self
		ret.message = "Invalid preroll time for atom " .. self.name(slot6) .. ", must be between 0 and 5 seconds"

		return ret
	end

	if 0 <= lifetime and preroll ~= 0 then
		ret.valid = false
		slot7 = self
		ret.message = "Atom " .. self.name(slot6) .. " cannot have  a preroll time set - only infinite-lifetime atoms can have a preroll time"

		return ret
	end

	local channels = {}
	slot8 = channels
	ret = self._stacks.initializer.validate(slot6, self._stacks.initializer)

	if not ret.valid then
		return ret
	end

	slot8 = channels
	ret = self._stacks.simulator.validate(slot6, self._stacks.simulator)

	if not ret.valid then
		return ret
	end

	slot8 = channels
	ret = self._stacks.visualizer.validate(slot6, self._stacks.visualizer)

	if not ret.valid then
		return ret
	end

	return ret
end
function CoreEffectAtom:stack(stacktype)
	return self._stacks[stacktype]
end
function CoreEffectAtom:save(node)
	slot5 = "atom"
	local a = node.make_child(slot3, node)
	slot6 = "name"
	slot9 = self

	a.set_parameter(node, a, self.name(slot8))

	slot6 = a

	self.save_properties(node, self)

	slot6 = a

	self._stacks.initializer.save(node, self._stacks.initializer)

	slot6 = a

	self._stacks.simulator.save(node, self._stacks.simulator)

	slot6 = a

	self._stacks.visualizer.save(node, self._stacks.visualizer)

	return 
end
function CoreEffectAtom:load(node)
	slot5 = "name"
	self._name = node.parameter(slot3, node)
	slot5 = node

	self.load_properties(slot3, self)

	slot5 = node

	self._stacks.initializer.load(slot3, self._stacks.initializer)

	slot5 = node

	self._stacks.simulator.load(slot3, self._stacks.simulator)

	slot5 = node

	self._stacks.visualizer.load(slot3, self._stacks.visualizer)

	return 
end

if not CoreEffectDefinition then
	slot2 = CoreEffectPropertyContainer
	slot0 = class(slot1)
end

CoreEffectDefinition = slot0
function CoreEffectDefinition:init()
	slot4 = ""

	self.super.init(slot2, self)

	self._atoms = {}
	self._description = ""
	slot7 = "Effects referenced in this list will be included in this effect"
	local p = CoreEffectProperty.new(slot2, CoreEffectProperty, "use", "list_objects", "")
	local use_effect_prop = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "use", "compound", "")
	slot6 = false

	use_effect_prop.set_save_to_child(CoreEffectProperty, use_effect_prop)

	slot6 = "use"
	local use_effect_container = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot6 = use_effect_container
	slot13 = "Effect that should be included in this one"

	use_effect_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "name", "effect", ""))

	slot7 = use_effect_container

	use_effect_prop.set_compound_container(CoreEffectPropertyContainer, use_effect_prop)

	slot8 = use_effect_prop

	p.set_object(CoreEffectPropertyContainer, p, "use")

	slot7 = p

	self.add_property(CoreEffectPropertyContainer, self)

	slot10 = "One effect from each of the sets specified here will be chosen at random and included when this effect is spawned.\nThe typical case is to only have one set and several effects in it - \nif you specify several sets, this means you will get a random combination of one effect from each set."
	p = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "use_random", "list_objects", "")
	slot10 = ""
	local random_set_prop = CoreEffectProperty.new(CoreEffectPropertyContainer, CoreEffectProperty, "use_random", "list_objects", "")
	slot8 = false

	random_set_prop.set_save_to_child(CoreEffectProperty, random_set_prop)

	local random_effect_prop = CoreEffectProperty.new(CoreEffectProperty, CoreEffectProperty, "effect", "compound", "")
	slot9 = false

	random_effect_prop.set_save_to_child(CoreEffectProperty, random_effect_prop)

	slot9 = "effect"
	local random_effect_container = CoreEffectPropertyContainer.new(CoreEffectProperty, CoreEffectPropertyContainer)
	slot9 = random_effect_container
	slot16 = "Effect that should be included in this one"

	random_effect_container.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new("", CoreEffectProperty, "name", "effect", ""))

	slot10 = random_effect_container

	random_effect_prop.set_compound_container(CoreEffectPropertyContainer, random_effect_prop)

	slot11 = random_effect_prop

	random_set_prop.set_object(CoreEffectPropertyContainer, random_set_prop, "effect")
	p.set_object(CoreEffectPropertyContainer, p, "use_random")

	slot10 = p

	self.add_property(CoreEffectPropertyContainer, self)

	slot9 = self
	slot16 = "If set, effect will play on the main thread without frame lag\nThis is useful for parented effects where a frame lag is very noticeable.\nThe CPU cost for for effects with this flag set will end up on the main thread, so use only where required."

	self.add_property(CoreEffectPropertyContainer, CoreEffectProperty.new(random_set_prop, CoreEffectProperty, "force_synch", "boolean", "false"))

	return 
end
function CoreEffectDefinition:find_atom(name)
	slot4 = self._atoms

	for _, atom in ipairs(slot3) do
		slot9 = atom

		if atom.name(slot8) == name then
			return atom
		end
	end

	return nil
end
function CoreEffectDefinition:add_atom(atom)
	slot5 = atom

	table.insert(slot3, self._atoms)

	return 
end
function CoreEffectDefinition:remove_atom(atom)
	slot5 = atom

	table.delete(slot3, self._atoms)

	return 
end
function CoreEffectDefinition:validate()
	local ret = {
		valid = true,
		message = "",
		node = nil
	}
	slot4 = self
	ret = self.validate_properties(slot3)

	if not ret.valid then
		return ret
	end

	if #self._atoms < 1 then
		ret.valid = false
		ret.message = "Empty effect - create an atom and fill stacks"

		return ret
	end

	slot4 = self._atoms

	for _, atom in ipairs(slot3) do
		slot9 = atom
		ret = atom.validate(slot8)

		if not ret.valid then
			return ret
		end
	end

	return ret
end
function CoreEffectDefinition:save(n)
	slot5 = n

	self.save_properties(slot3, self)

	slot4 = self._atoms

	for _, atom in ipairs(slot3) do
		slot10 = n

		atom.save(slot8, atom)
	end

	return 
end
function CoreEffectDefinition:load(n)
	slot5 = n

	self.load_properties(slot3, self)

	slot4 = n

	for child in n.children(slot3) do
		slot8 = child

		if child.name(slot7) == "atom" then
			slot9 = "default"
			local atom = CoreEffectAtom.new(slot7, CoreEffectAtom)
			slot10 = child

			atom.load(CoreEffectAtom, atom)

			slot10 = atom

			table.insert(CoreEffectAtom, self._atoms)
		end
	end

	return 
end

return 
