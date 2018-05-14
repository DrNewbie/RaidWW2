if not LookAtTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

LookAtTriggerUnitElement = slot0
function LookAtTriggerUnitElement:init(unit)
	slot5 = unit

	LookAtTriggerUnitElement.super.init(slot3, self)

	self._hed.trigger_times = 1
	self._hed.interval = 0.1
	self._hed.sensitivity = 0.9
	self._hed.distance = 0
	self._hed.in_front = false
	slot5 = "interval"

	table.insert(false, self._save_values)

	slot5 = "sensitivity"

	table.insert(false, self._save_values)

	slot5 = "distance"

	table.insert(false, self._save_values)

	slot5 = "in_front"

	table.insert(false, self._save_values)

	return 
end
function LookAtTriggerUnitElement:update_selected(t, dt)
	if self._hed.distance ~= 0 then
		local brush = Draw.brush(slot4)
		slot6 = brush
		slot12 = 1

		brush.set_color(Draw, Color(slot8, 0.15, 1, 1))

		slot6 = Draw
		slot12 = 0.5
		local pen = Draw.pen(Draw, Color(slot8, 0.15, 0.5, 0.5))

		if not self._hed.in_front then
			slot10 = self._unit
			slot10 = 4

			brush.sphere(slot6, brush, self._unit.position(slot9), self._hed.distance)

			slot10 = self._unit
			slot9 = self._hed.distance

			pen.sphere(slot6, pen, self._unit.position(self._hed.distance))
		else
			slot10 = self._unit
			slot12 = self._unit
			slot12 = self._unit.rotation(slot11)

			brush.half_sphere(slot6, brush, self._unit.position(slot9), self._hed.distance, -self._unit.rotation(slot11).y(slot11))

			slot10 = self._unit
			slot12 = self._unit
			slot12 = self._unit.rotation(4)
			slot10 = -self._unit.rotation(4).y(4)

			pen.half_sphere(slot6, pen, self._unit.position(self._hed.distance), self._hed.distance)
		end
	end

	return 
end
function LookAtTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Set the check interval for the look at, in seconds"

	self._build_value_number(slot4, self, panel, panel_sizer, "interval", {
		floats = 2,
		min = 0.01
	})

	local sensitivity_params = {
		name = "Sensitivity:",
		ctrlr_proportions = 2,
		slider_ctrlr_proportions = 3,
		name_proportions = 1,
		number_ctrlr_proportions = 1,
		min = 0.5,
		floats = 3,
		max = 0.999,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.sensitivity
	}
	slot6 = sensitivity_params

	CoreEws.slider_and_number_controller(self)

	slot12 = "set_element_data"

	sensitivity_params.slider_ctrlr.connect(self, sensitivity_params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(, self, self))

	slot12 = "set_element_data"

	sensitivity_params.slider_ctrlr.connect(self, sensitivity_params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback({
		value = "sensitivity",
		ctrlr = sensitivity_params.number_ctrlr
	}, self, self))

	slot12 = "set_element_data"

	sensitivity_params.number_ctrlr.connect(self, sensitivity_params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback({
		value = "sensitivity",
		ctrlr = sensitivity_params.number_ctrlr
	}, self, self))

	slot12 = "set_element_data"
	slot9 = {
		value = "sensitivity",
		ctrlr = sensitivity_params.number_ctrlr
	}

	sensitivity_params.number_ctrlr.connect(self, sensitivity_params.number_ctrlr, "EVT_KILL_FOCUS", callback({
		value = "sensitivity",
		ctrlr = sensitivity_params.number_ctrlr
	}, self, self))

	slot11 = "(Optional) Sets a distance to use with the check (in meters)"

	self._build_value_number(self, self, panel, panel_sizer, "distance", {
		floats = 2,
		min = 0
	})

	slot10 = "Only in front"

	self._build_value_checkbox(self, self, panel, panel_sizer, "in_front")

	slot7 = "Interval defines how offen the check should be done. Sensitivity defines how precise the look angle must be. A sensitivity of 0.999 means that you need to look almost directly at it, 0.5 means that you will get the trigger somewhere at the edge of the screen (might be outside or inside). \n\nDistance(in meters) can be used as a filter to the trigger (0 means no distance filtering)"

	self._add_help_text(self, self)

	return 
end

return 
