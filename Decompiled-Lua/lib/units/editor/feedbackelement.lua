if not FeedbackUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

FeedbackUnitElement = slot0
FeedbackUnitElement.USES_POINT_ORIENTATION = true
function FeedbackUnitElement:init(unit)
	slot5 = unit

	FeedbackUnitElement.super.init(slot3, self)

	self._hed.effect = "mission_triggered"
	self._hed.range = 0
	self._hed.use_camera_shake = true
	self._hed.use_rumble = true
	self._hed.camera_shake_effect = "mission_triggered"
	self._hed.camera_shake_amplitude = 1
	self._hed.camera_shake_frequency = 1
	self._hed.camera_shake_attack = 0.1
	self._hed.camera_shake_sustain = 0.3
	self._hed.camera_shake_decay = 2.1
	self._hed.rumble_peak = 1
	self._hed.rumble_attack = 0.1
	self._hed.rumble_sustain = 0.3
	self._hed.rumble_release = 2.1
	self._hed.above_camera_effect = "none"
	self._hed.above_camera_effect_distance = 0.5
	slot5 = "effect"

	table.insert(0.5, self._save_values)

	slot5 = "range"

	table.insert(0.5, self._save_values)

	slot5 = "use_camera_shake"

	table.insert(0.5, self._save_values)

	slot5 = "use_rumble"

	table.insert(0.5, self._save_values)

	slot5 = "camera_shake_effect"

	table.insert(0.5, self._save_values)

	slot5 = "camera_shake_amplitude"

	table.insert(0.5, self._save_values)

	slot5 = "camera_shake_frequency"

	table.insert(0.5, self._save_values)

	slot5 = "camera_shake_attack"

	table.insert(0.5, self._save_values)

	slot5 = "camera_shake_sustain"

	table.insert(0.5, self._save_values)

	slot5 = "camera_shake_decay"

	table.insert(0.5, self._save_values)

	slot5 = "rumble_peak"

	table.insert(0.5, self._save_values)

	slot5 = "rumble_attack"

	table.insert(0.5, self._save_values)

	slot5 = "rumble_sustain"

	table.insert(0.5, self._save_values)

	slot5 = "rumble_release"

	table.insert(0.5, self._save_values)

	slot5 = "above_camera_effect"

	table.insert(0.5, self._save_values)

	slot5 = "above_camera_effect_distance"

	table.insert(0.5, self._save_values)

	return 
end
function FeedbackUnitElement:update_selected(t, dt, selected_unit, all_units)
	if self._hed.orientation_elements then
		slot7 = self._hed.orientation_elements

		for _, id in ipairs(slot6) do
			local unit = all_units[id]
			slot13 = self
			slot16 = unit

			self._draw_ranges(slot12, unit.position(slot15))
		end
	else
		slot7 = self
		slot10 = self._unit

		self._draw_ranges(slot6, self._unit.position(slot9))
	end

	return 
end
function FeedbackUnitElement:_draw_ranges(pos)
	local brush = Draw.brush(slot3)
	slot5 = brush
	slot11 = 1

	brush.set_color(Draw, Color(slot7, 0.15, 1, 1))

	slot11 = 0.5
	local pen = Draw.pen(Draw, Color(slot7, 0.15, 0.5, 0.5))
	slot9 = 4

	brush.sphere(Draw, brush, pos, self._hed.range)
	pen.sphere(Draw, pen, pos)

	slot6 = brush
	slot12 = 0

	brush.set_color(Draw, Color(self._hed.range, 0.15, 0, 1))

	slot6 = pen
	slot12 = 0

	pen.set(Draw, Color(self._hed.range, 0.15, 0, 1))

	slot9 = 4

	brush.sphere(Draw, brush, pos, self._hed.range * self._hed.above_camera_effect_distance)

	slot8 = self._hed.range * self._hed.above_camera_effect_distance

	pen.sphere(Draw, pen, pos)

	return 
end
function FeedbackUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "The range the effect should be felt. 0 means that it will be felt everywhere"

	self._build_value_number(slot4, self, panel, panel_sizer, "range", {
		floats = 0,
		min = -1
	})

	slot8 = "Camera shake"
	local camera_shaker_sizer = EWS.StaticBoxSizer(slot4, EWS, panel, "VERTICAL")
	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, camera_shaker_sizer, 0, 0)

	slot10 = "Use camera shake"

	self._build_value_checkbox(EWS, self, panel, camera_shaker_sizer, "use_camera_shake")

	slot12 = "effect"

	self._build_value_combobox(EWS, self, panel, camera_shaker_sizer, "camera_shake_effect", {
		"mission_triggered",
		"headbob",
		"player_land",
		"breathing"
	}, "Select a camera shake effect")

	slot12 = "amplitude"

	self._build_value_number(EWS, self, panel, camera_shaker_sizer, "camera_shake_amplitude", {
		floats = 2,
		min = -1
	}, "Amplitude basically decides the strenght of the shake")

	slot12 = "frequency"

	self._build_value_number(EWS, self, panel, camera_shaker_sizer, "camera_shake_frequency", {
		floats = 2,
		min = -1
	}, "Changes the frequency of the shake")

	slot12 = "attack"

	self._build_value_number(EWS, self, panel, camera_shaker_sizer, "camera_shake_attack", {
		floats = 2,
		min = -1
	}, "Time to reach maximum shake")

	slot12 = "sustain"

	self._build_value_number(EWS, self, panel, camera_shaker_sizer, "camera_shake_sustain", {
		floats = 2,
		min = -1
	}, "Time to sustain maximum shake")

	slot12 = "decay"

	self._build_value_number(EWS, self, panel, camera_shaker_sizer, "camera_shake_decay", {
		floats = 2,
		min = -1
	}, "Time to decay from maximum shake to zero")

	slot9 = "Rumble"
	local rumble_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, rumble_sizer, 0, 0)

	slot11 = "Use rumble"

	self._build_value_checkbox(EWS, self, panel, rumble_sizer, "use_rumble")

	slot13 = "peak"

	self._build_value_number(EWS, self, panel, rumble_sizer, "rumble_peak", {
		floats = 2,
		min = -1
	}, "A value to determine the strength of the rumble")

	slot13 = "attack"

	self._build_value_number(EWS, self, panel, rumble_sizer, "rumble_attack", {
		floats = 2,
		min = -1
	}, "Time to reach maximum rumble")

	slot13 = "sustain"

	self._build_value_number(EWS, self, panel, rumble_sizer, "rumble_sustain", {
		floats = 2,
		min = -1
	}, "Time to sustain maximum rumble")
	self._build_value_number(EWS, self, panel, rumble_sizer, "rumble_release", {
		floats = 2,
		min = -1
	}, "Time to decay from maximum rumble to zero")

	slot10 = "Above camera effect"
	local above_camera_effect_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot12 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, above_camera_effect_sizer, 0, 0)

	slot14 = {
		"none"
	}
	slot17 = self
	slot14 = "effect"

	self._build_value_combobox(EWS, self, panel, above_camera_effect_sizer, "above_camera_effect", table.list_add("release", self._effect_options(slot16)), "Select and above camera effect")

	slot14 = "distance filter"

	self._build_value_number(EWS, self, panel, above_camera_effect_sizer, "above_camera_effect_distance", {
		min = 0,
		floats = 2,
		max = 1
	}, "A filter value to use with the range. A value of 1 means that the effect will be played whenever inside the range, a lower value means you need to be closer to the position.")

	return 
end
function FeedbackUnitElement:_effect_options()
	local effect_options = {}
	slot7 = "effect"

	for _, name in ipairs(managers.database.list_entries_of_type(slot5, managers.database)) do
		slot10 = name

		table.insert(slot8, effect_options)
	end

	return effect_options
end
function FeedbackUnitElement:add_to_mission_package()
	if self._hed.effect and self._hed.above_camera_effect ~= "none" then
		slot4 = {
			category = "effects",
			name = self._hed.above_camera_effect,
			continent = self._unit.unit_data(slot6).continent
		}
		slot7 = self._unit

		managers.editor.add_to_world_package(slot2, managers.editor)
	end

	return 
end

return 
