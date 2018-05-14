if not CoreMotionPathOperatorUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreMotionPathOperatorUnitElement = slot0

if not MotionPathOperatorUnitElement then
	slot2 = CoreMotionPathOperatorUnitElement
	slot0 = class(slot1)
end

MotionPathOperatorUnitElement = slot0
function MotionPathOperatorUnitElement:init(...)
	slot3 = self

	MotionPathOperatorUnitElement.super.init(slot2, ...)

	return 
end
function CoreMotionPathOperatorUnitElement:init(unit)
	slot5 = unit

	CoreMotionPathOperatorUnitElement.super.init(slot3, self)

	self._hed.operation = "none"
	self._hed.marker = nil
	self._hed.elements = {}
	self._hed.marker_ids = {}
	slot5 = "operation"

	table.insert(, self._save_values)

	slot5 = "marker"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	slot5 = "marker_ids"

	table.insert(, self._save_values)

	return 
end
function CoreMotionPathOperatorUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreMotionPathOperatorUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.25,
				b = 0.25,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	if self._hed.marker then
		local unit = all_units[self._hed.marker_ids[self._hed.marker]]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot9 = unit

			if alive(slot8) then
				slot9 = self._unit

				if alive(slot8) then
					slot10 = {
						g = 0.55,
						b = 0.05,
						r = 0.95,
						from_unit = self._unit,
						to_unit = unit
					}

					self._draw_link(slot8, self)
				end
			end
		end
	end

	return 
end
function CoreMotionPathOperatorUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreMotionPathOperatorUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "operator"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function CoreMotionPathOperatorUnitElement:update_editing()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot8 = 0

		Application.draw(slot3, Application, ray.unit, 0, 1)
	end

	return 
end
function CoreMotionPathOperatorUnitElement:update_selected()
	slot8 = self._unit
	slot8 = self._unit.rotation(self._unit)
	slot9 = 1

	Application.draw_cone(slot2, Application, self._unit.position(slot5), self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * 75, 35, 1, 1)

	return 
end
function CoreMotionPathOperatorUnitElement:add_element()
	slot4 = {
		ray_type = "body editor",
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "units/dev_tools/mission_elements/motion_path_marker/motion_path_marker"

		if ray.unit.name(slot3) == Idstring(ray.unit) then
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
function CoreMotionPathOperatorUnitElement:remove_links(unit)
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
function CoreMotionPathOperatorUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreMotionPathOperatorUnitElement:_motion_path_markers()
	self._hed.marker_ids = {}
	local motion_path_markers = {
		"none"
	}
	local mission_elements = managers.worlddefinition._mission_element_units
	slot5 = mission_elements

	for _, me in pairs(slot4) do
		slot10 = me

		if alive(slot9) then
			slot11 = "units/dev_tools/mission_elements/motion_path_marker/motion_path_marker"

			if me.name(slot9) == Idstring(me) then
				slot13 = me
				slot11 = me.unit_data(slot12).name_id

				table.insert_sorted(slot9, motion_path_markers)

				slot12 = me
				self._hed.marker_ids[me.unit_data(motion_path_markers).name_id] = me.unit_data(me).unit_id
			end
		end
	end

	return motion_path_markers
end
function CoreMotionPathOperatorUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	self._build_value_combobox(slot4, self, panel, panel_sizer, "operation", {
		"none",
		"goto_marker",
		"teleport",
		"move",
		"wait",
		"rotate",
		"activate_bridge",
		"deactivate_bridge",
		"path_stop",
		"path_start"
	})

	slot11 = self
	slot10 = "Select motion path marker."
	local markers_combo = self._build_value_combobox(slot4, self, panel, panel_sizer, "marker", self._motion_path_markers("Select an operation for the selected elements."))
	slot8 = markers_combo

	Application.debug(self, Application, "CoreMotionPathOperatorUnitElement:_build_panel( panel, panel_sizer ): ")

	slot12 = "on_executed_marker_selected"
	slot9 = nil

	markers_combo.connect(self, markers_combo, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self._motion_path_markers("Select an operation for the selected elements."), self, self))

	slot7 = "This element can modify motion path marker elements. Select motion path marker elements to modify using insert and clicking on the elements."

	self._add_help_text(self, self)

	return 
end
function CoreMotionPathOperatorUnitElement:on_executed_marker_selected()
	slot6 = self._hed.marker_ids[self._hed.marker]

	Application.debug(slot2, Application, "CoreMotionPathOperatorUnitElement:_build_panel( panel, panel_sizer ): ", self._hed.marker)

	if self._hed.marker == "none" then
		self._hed.marker = nil
	end

	return 
end

if not CoreMotionPathTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreMotionPathTriggerUnitElement = slot0

if not MotionPathTriggerUnitElement then
	slot2 = CoreMotionPathTriggerUnitElement
	slot0 = class(slot1)
end

MotionPathTriggerUnitElement = slot0
function MotionPathTriggerUnitElement:init(...)
	slot3 = self

	MotionPathTriggerUnitElement.super.init(slot2, ...)

	return 
end
function CoreMotionPathTriggerUnitElement:init(unit)
	slot5 = unit

	CoreMotionPathTriggerUnitElement.super.init(slot3, self)

	self._hed.outcome = "marker_reached"
	self._hed.elements = {}
	slot5 = "outcome"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function CoreMotionPathTriggerUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreMotionPathTriggerUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.85,
				b = 0.25,
				r = 0.85,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function CoreMotionPathTriggerUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreMotionPathTriggerUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "trigger"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function CoreMotionPathTriggerUnitElement:update_editing()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot8 = 0

		Application.draw(slot3, Application, ray.unit, 0, 1)
	end

	return 
end
function CoreMotionPathTriggerUnitElement:add_element()
	slot4 = {
		ray_type = "body editor",
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "units/dev_tools/mission_elements/motion_path_marker/motion_path_marker"

		if ray.unit.name(slot3) == Idstring(ray.unit) then
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
function CoreMotionPathTriggerUnitElement:remove_links(unit)
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
function CoreMotionPathTriggerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreMotionPathTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select an outcome to trigger on"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "outcome", {
		"marker_reached"
	})

	slot6 = "This element is a trigger on motion path marker element."

	self._add_help_text(slot4, self)

	return 
end

return 
