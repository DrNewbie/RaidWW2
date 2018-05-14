if not CoreDebugUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreDebugUnitElement = slot0

if not DebugUnitElement then
	slot2 = CoreDebugUnitElement
	slot0 = class(slot1)
end

DebugUnitElement = slot0
DebugUnitElement.SAVE_UNIT_POSITION = false
DebugUnitElement.SAVE_UNIT_ROTATION = false
function DebugUnitElement:init(...)
	slot3 = self

	CoreDebugUnitElement.init(slot2, ...)

	return 
end
function CoreDebugUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.debug_string = "none"
	self._hed.as_subtitle = false
	self._hed.show_instigator = false
	self._hed.color = nil
	self._hed.elements = {}
	slot5 = "elements"

	table.insert(, self._save_values)

	slot5 = "debug_string"

	table.insert(, self._save_values)

	slot5 = "as_subtitle"

	table.insert(, self._save_values)

	slot5 = "show_instigator"

	table.insert(, self._save_values)

	slot5 = "color"

	table.insert(, self._save_values)

	return 
end
function CoreDebugUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = "TE_PROCESS_ENTER"
	local debug = EWS.TextCtrl(slot4, EWS, panel, self._hed.debug_string, "")
	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, debug, 0, 0)

	slot12 = "set_element_data"

	debug.connect(EWS, debug, "EVT_COMMAND_TEXT_ENTER", callback(0, self, self))

	slot12 = "set_element_data"
	slot9 = {
		value = "debug_string",
		ctrlr = debug
	}

	debug.connect(EWS, debug, "EVT_KILL_FOCUS", callback({
		value = "debug_string",
		ctrlr = debug
	}, self, self))

	slot10 = "Show as subtitle"

	self._build_value_checkbox(EWS, self, panel, panel_sizer, "as_subtitle")

	slot10 = "Show instigator"

	self._build_value_checkbox(EWS, self, panel, panel_sizer, "show_instigator")

	return 
end
function CoreDebugUnitElement:update_editing()
	slot4 = {
		ray_type = "editor",
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
function CoreDebugUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_monitored_unit"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreDebugUnitElement:add_monitored_unit()
	slot4 = {
		ray_type = "editor",
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot4 = ray.unit

		if ray.unit.slot(slot3) == 10 then
			local id = ray.unit.unit_data(slot3).unit_id
			slot6 = id

			if table.contains(ray.unit, self._hed.elements) then
				slot6 = id

				table.delete(slot4, self._hed.elements)

				slot6 = ray.unit

				self.unregister_monitor(slot4, self)
			else
				slot6 = id

				table.insert(slot4, self._hed.elements)

				slot6 = ray.unit

				self.register_monitor(slot4, self)
			end
		end
	end

	return 
end
function CoreDebugUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreDebugUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.25,
				b = 0.75,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function CoreDebugUnitElement:on_delete()
	slot4 = "CoreDebugUnitElement:on_delete()"

	Application.trace(slot2, Application)

	return 
end
function CoreDebugUnitElement:register_monitor(unit)
	slot4 = unit

	if unit.mission_element(slot3).register_debug_output_unit then
		slot4 = unit
		slot7 = self._unit
		slot5 = self._unit.unit_data(slot6).unit_id

		unit.mission_element(slot3).register_debug_output_unit(slot3, unit.mission_element(slot3))
	end

	return 
end
function CoreDebugUnitElement:unregister_monitor(unit)
	slot4 = unit

	if unit.mission_element(slot3).unregister_debug_output_unit then
		slot4 = unit
		slot4 = unit.mission_element(slot3)

		unit.mission_element(slot3).unregister_debug_output_unit(slot3)
	end

	return 
end

return 
