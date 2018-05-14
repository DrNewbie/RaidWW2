if not CoreUnitSequenceUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreUnitSequenceUnitElement = slot0

if not UnitSequenceUnitElement then
	slot2 = CoreUnitSequenceUnitElement
	slot0 = class(slot1)
end

UnitSequenceUnitElement = slot0
function UnitSequenceUnitElement:init(...)
	slot3 = self

	CoreUnitSequenceUnitElement.init(slot2, ...)

	return 
end
function CoreUnitSequenceUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.trigger_list = {}
	slot5 = "trigger_list"

	table.insert(, self._save_values)

	return 
end
function CoreUnitSequenceUnitElement:update_unselected(...)
	slot3 = self

	MissionElement.update_unselected(slot2, ...)

	return 
end
function CoreUnitSequenceUnitElement:update_selected(...)
	slot3 = self

	MissionElement.update_selected(slot2, ...)

	slot6 = 1

	self._draw_trigger_units(slot2, self, 0, 1)

	return 
end
function CoreUnitSequenceUnitElement:get_links_to_unit(to_unit, links, all_units)
	slot9 = all_units

	CoreUnitSequenceUnitElement.super.get_links_to_unit(slot5, self, to_unit, links)

	if to_unit == self._unit then
		slot8 = self

		for _, unit in ipairs(self._get_sequence_units(slot7)) do
			slot12 = {
				alternative = "unit",
				unit = unit
			}

			table.insert(slot10, links.on_executed)
		end
	end

	return 
end
function CoreUnitSequenceUnitElement:draw_links_unselected(...)
	slot3 = self

	CoreUnitSequenceUnitElement.super.draw_links_unselected(slot2, ...)

	slot6 = 0.75

	self._draw_trigger_units(slot2, self, 0, 0.75)

	return 
end
function CoreUnitSequenceUnitElement:_get_sequence_units()
	local units = {}
	slot4 = self._unit
	slot4 = self._unit.damage(slot3)
	local trigger_name_list = self._unit.damage(slot3).get_trigger_name_list(slot3)

	if trigger_name_list then
		slot5 = trigger_name_list

		for _, trigger_name in ipairs(slot4) do
			slot10 = self._unit
			slot11 = trigger_name
			local trigger_data = self._unit.damage(slot9).get_trigger_data_list(slot9, self._unit.damage(slot9))

			if trigger_data and 0 < #trigger_data then
				slot11 = trigger_data

				for _, data in ipairs(slot10) do
					slot16 = data.notify_unit

					if alive(slot15) then
						slot17 = data.notify_unit

						table.insert(slot15, units)
					end
				end
			end
		end
	end

	return units
end
function CoreUnitSequenceUnitElement:_draw_trigger_units(r, g, b)
	slot8 = self

	for _, unit in ipairs(self._get_sequence_units(slot7)) do
		local params = {
			from_unit = self._unit,
			to_unit = unit,
			r = r,
			g = g,
			b = b
		}
		slot13 = params

		self._draw_link(slot11, self)

		slot16 = b

		Application.draw(slot11, Application, unit, r, g)
	end

	return 
end
function CoreUnitSequenceUnitElement:new_save_values(...)
	slot3 = self

	self._set_trigger_list(slot2)

	slot3 = self

	return MissionElement.new_save_values(slot2, ...)
end
function CoreUnitSequenceUnitElement:save_values(...)
	slot3 = self

	self._set_trigger_list(slot2)

	slot3 = self

	MissionElement.save_values(slot2, ...)

	return 
end
function CoreUnitSequenceUnitElement:_set_trigger_list()
	self._hed.trigger_list = {}
	slot3 = managers.sequence
	slot6 = self._unit
	local triggers = managers.sequence.get_trigger_list(, self._unit.name(slot5))

	if 0 < #triggers then
		slot4 = self._unit
		slot4 = self._unit.damage(slot3)
		local trigger_name_list = self._unit.damage(slot3).get_trigger_name_list(slot3)

		if trigger_name_list then
			slot5 = trigger_name_list

			for _, trigger_name in ipairs(slot4) do
				slot10 = self._unit
				slot11 = trigger_name
				local trigger_data = self._unit.damage(slot9).get_trigger_data_list(slot9, self._unit.damage(slot9))

				if trigger_data and 0 < #trigger_data then
					slot11 = trigger_data

					for _, data in ipairs(slot10) do
						slot17 = {
							name = data.trigger_name,
							id = data.id,
							notify_unit_id = data.notify_unit.unit_data(slot19).unit_id,
							time = data.time,
							notify_unit_sequence = data.notify_unit_sequence
						}
						slot20 = data.notify_unit

						table.insert(slot15, self._hed.trigger_list)
					end
				end
			end
		end
	end

	return 
end
function CoreUnitSequenceUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local help = {
		text = "Use the \"Edit Triggable\" interface, which you enable in the down left toolbar, to select and edit which units and sequences you want to run.",
		panel = panel,
		sizer = panel_sizer
	}
	slot7 = help

	self.add_help_text(slot5, self)

	return 
end
function CoreUnitSequenceUnitElement:add_to_mission_package()
	slot4 = {
		name = "core/units/run_sequence_dummy/run_sequence_dummy",
		category = "units",
		continent = self._unit.unit_data(slot6).continent
	}
	slot7 = self._unit

	managers.editor.add_to_world_package(slot2, managers.editor)

	slot4 = {
		name = "core/units/run_sequence_dummy/run_sequence_dummy.sequence_manager",
		category = "script_data",
		continent = self._unit.unit_data(slot6).continent
	}
	slot7 = self._unit

	managers.editor.add_to_world_package(slot2, managers.editor)

	return 
end

return 
