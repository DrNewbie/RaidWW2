slot3 = "CoreEngineAccess"

core.import(slot1, core)

if not CorePlayEffectUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CorePlayEffectUnitElement = slot0
CorePlayEffectUnitElement.USES_POINT_ORIENTATION = true

if not PlayEffectUnitElement then
	slot2 = CorePlayEffectUnitElement
	slot0 = class(slot1)
end

PlayEffectUnitElement = slot0
function PlayEffectUnitElement:init(...)
	slot3 = self

	CorePlayEffectUnitElement.init(slot2, ...)

	return 
end
function CorePlayEffectUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.effect = "none"
	self._hed.screen_space = false
	self._hed.base_time = 0
	self._hed.random_time = 0
	self._hed.max_amount = 0
	slot5 = "effect"

	table.insert(0, self._save_values)

	slot5 = "screen_space"

	table.insert(0, self._save_values)

	slot5 = "base_time"

	table.insert(0, self._save_values)

	slot5 = "random_time"

	table.insert(0, self._save_values)

	slot5 = "max_amount"

	table.insert(0, self._save_values)

	return 
end
function CorePlayEffectUnitElement:test_element()
	if self._hed.effect ~= "none" then
		slot3 = self

		self.stop_test_element(slot2)

		slot3 = Idstring(slot4)
		slot6 = self._hed.effect

		CoreEngineAccess._editor_load(slot2, self._hed.effect.id("effect"))

		if not self._hed.screen_space or not Vector3() then
			slot3 = self._unit
			local position = self._unit.position(slot2)
		end

		if not self._hed.screen_space or not Rotation() then
			slot4 = self._unit
			local rotation = self._unit.rotation(slot3)
		end

		slot5 = World
		slot6 = {
			effect = self._hed.effect.id(slot8),
			position = position,
			rotation = rotation
		}
		slot9 = self._hed.effect
		self._effect = World.effect_manager(slot4).spawn(slot4, World.effect_manager(slot4))
	end

	return 
end
function CorePlayEffectUnitElement:stop_test_element()
	if self._effect then
		slot3 = World
		slot4 = self._effect

		World.effect_manager(slot2).kill(slot2, World.effect_manager(slot2))

		self._effect = false
	end

	return 
end
function CorePlayEffectUnitElement:_effect_options()
	local effect_options = {
		"none"
	}
	slot7 = "effect"

	for _, name in ipairs(managers.database.list_entries_of_type(slot5, managers.database)) do
		slot10 = name

		table.insert(slot8, effect_options)
	end

	return effect_options
end
function CorePlayEffectUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = "Play in Screen Space"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "screen_space")

	slot11 = self
	slot10 = "Select and effect from the combobox"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "effect", self._effect_options(slot10))

	slot10 = "This is the minimum time to wait before spawning next effect"

	self._build_value_number(slot4, self, panel, panel_sizer, "base_time", {
		floats = 2,
		min = 0
	})

	slot10 = "Random time is added to minimum time to give the time between effect spawns"

	self._build_value_number(slot4, self, panel, panel_sizer, "random_time", {
		floats = 2,
		min = 0
	})

	slot10 = "Maximum amount of spawns when repeating effects (0 = unlimited)"

	self._build_value_number(slot4, self, panel, panel_sizer, "max_amount", {
		floats = 0,
		min = 0
	})

	local help = {
		text = [[
Choose an effect from the combobox. Use "Play in Screen Space" if the effect is set up to be played like that. 

Use base time and random time if you want to repeat playing the effect, keep them at 0 to only play it once. "Base Time" is the minimum time between effects. "Random Time" is added to base time to set the total time until next effect. "Max Amount" can be used to set how many times the effect should be repeated (when base time and random time are used). 

Be sure not to use a looping effect when using repeat or the effects will add to each other and wont be stoppable after run simulation or by calling kill or fade kill.]],
		panel = panel,
		sizer = panel_sizer
	}
	slot7 = help

	self.add_help_text(self, self)

	return 
end
function CorePlayEffectUnitElement:add_to_mission_package()
	if self._hed.effect and self._hed.effect ~= "none" then
		slot4 = {
			category = "effects",
			name = self._hed.effect,
			continent = self._unit.unit_data(slot6).continent
		}
		slot7 = self._unit

		managers.editor.add_to_world_package(slot2, managers.editor)
	end

	return 
end

if not CoreStopEffectUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreStopEffectUnitElement = slot0

if not StopEffectUnitElement then
	slot2 = CoreStopEffectUnitElement
	slot0 = class(slot1)
end

StopEffectUnitElement = slot0
function StopEffectUnitElement:init(...)
	slot3 = self

	CoreStopEffectUnitElement.init(slot2, ...)

	return 
end
function CoreStopEffectUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.operation = "fade_kill"
	self._hed.elements = {}
	slot5 = "operation"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function CoreStopEffectUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	MissionElement.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0,
				b = 0,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function CoreStopEffectUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreStopEffectUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "operator"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function CoreStopEffectUnitElement:update_editing()
	return 
end
function CoreStopEffectUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "env_effect_play", 1) then
			local id = ray.unit.unit_data(slot3).unit_id
			slot6 = id

			if table.contains(ray.unit, self._hed.elements) then
				slot6 = id

				table.delete(slot4, self._hed.elements)
			else
				slot6 = id

				table.insert(slot4, self._hed.elements)
			end
		end
	end

	return 
end
function CoreStopEffectUnitElement:remove_links(unit)
	slot5 = unit

	MissionElement.remove_links(slot3, self)

	slot4 = self._hed.elements

	for _, id in ipairs(slot3) do
		slot9 = unit

		if id == unit.unit_data(slot8).unit_id then
			slot10 = id

			table.delete(slot8, self._hed.elements)
		end
	end

	return 
end
function CoreStopEffectUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreStopEffectUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"env_effect_play"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select a kind of operation to perform on the added effects"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "operation", {
		"kill",
		"fade_kill"
	})

	return 
end

return 
