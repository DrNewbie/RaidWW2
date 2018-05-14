if not CoreRandomUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreRandomUnitElement = slot0
CoreRandomUnitElement.SAVE_UNIT_POSITION = false
CoreRandomUnitElement.SAVE_UNIT_ROTATION = false

if not RandomUnitElement then
	slot2 = CoreRandomUnitElement
	slot0 = class(slot1)
end

RandomUnitElement = slot0
function RandomUnitElement:init(...)
	slot3 = self

	CoreRandomUnitElement.init(slot2, ...)

	return 
end
function CoreRandomUnitElement:init(unit)
	slot5 = unit

	CoreRandomUnitElement.super.init(slot3, self)

	self._hed.amount = 1
	self._hed.amount_random = 0
	self._hed.ignore_disabled = true
	self._hed.counter_id = nil
	slot5 = "amount"

	table.insert(nil, self._save_values)

	slot5 = "amount_random"

	table.insert(nil, self._save_values)

	slot5 = "ignore_disabled"

	table.insert(nil, self._save_values)

	slot5 = "counter_id"

	table.insert(nil, self._save_values)

	return 
end
function CoreRandomUnitElement:update_editing()
	return 
end
function CoreRandomUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreRandomUnitElement.super.draw_links(slot6, self, t, dt)

	if self._hed.counter_id then
		local unit = all_units[self._hed.counter_id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot10 = {
				g = 0.85,
				b = 0.25,
				r = 0.85,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot8, self)
		end
	end

	return 
end
function CoreRandomUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "core/units/mission_elements/logic_counter/logic_counter"

		if ray.unit.name(slot3) == Idstring(ray.unit) then
			slot4 = ray.unit
			local id = ray.unit.unit_data(slot3).unit_id

			if self._hed.counter_id == id then
				self._hed.counter_id = nil
			else
				self._hed.counter_id = id
			end
		end
	end

	return 
end
function CoreRandomUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreRandomUnitElement:remove_links(unit)
	if self._hed.counter_id then
		slot5 = unit

		if self._hed.counter_id == unit.unit_data(slot4).unit_id then
			self._hed.counter_id = nil
		end
	end

	return 
end
function CoreRandomUnitElement:_add_counter_filter(unit)
	slot5 = "core/units/mission_elements/logic_counter/logic_counter"

	return unit.name(slot3) == Idstring(unit)
end
function CoreRandomUnitElement:_set_counter_id(unit)
	slot5 = unit
	self._hed.counter_id = unit.unit_data(slot4).unit_id

	return 
end
function CoreRandomUnitElement:_remove_counter_filter(unit)
	slot5 = unit

	return self._hed.counter_id == unit.unit_data(slot4).unit_id
end
function CoreRandomUnitElement:_remove_counter_id(unit)
	self._hed.counter_id = nil

	return 
end
function CoreRandomUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = {
		single = true,
		add_filter = callback(slot10, self, self),
		add_result = callback(slot10, self, self),
		remove_filter = callback(slot10, self, self),
		remove_result = callback(slot10, self, self)
	}
	slot13 = "_add_counter_filter"
	slot13 = "_set_counter_id"
	slot13 = "_remove_counter_filter"
	slot13 = "_remove_counter_id"

	self._build_add_remove_static_unit_from_list(slot4, self, panel, panel_sizer)

	slot10 = "Specifies the amount of elements to be executed"

	self._build_value_number(slot4, self, panel, panel_sizer, "amount", {
		floats = 0,
		min = 1
	})

	slot10 = "Add a random amount to amount"

	self._build_value_number(slot4, self, panel, panel_sizer, "amount_random", {
		floats = 0,
		min = 0
	})

	slot8 = "ignore_disabled"

	self._build_value_checkbox(slot4, self, panel, panel_sizer)

	slot6 = "Use 'Amount' only to specify an exact amount of elements to execute. Use 'Amount Random' to add a random amount to 'Amount' ('Amount' + random('Amount Random')."

	self._add_help_text(slot4, self)

	return 
end

return 
