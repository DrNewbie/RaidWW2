if not InteractionUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

InteractionUnitElement = slot0
InteractionUnitElement.ON_EXECUTED_ALTERNATIVES = {
	"interacted",
	"interupt",
	"start"
}
function InteractionUnitElement:init(unit)
	slot5 = unit

	InteractionUnitElement.super.init(slot3, self)

	self._hed.tweak_data_id = "none"
	self._hed.override_timer = -1
	slot5 = "tweak_data_id"

	table.insert(-1, self._save_values)

	slot5 = "override_timer"

	table.insert(-1, self._save_values)

	return 
end
function InteractionUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "tweak_data_id"
	slot11 = {
		"none"
	}
	slot14 = tweak_data.interaction

	self._build_value_combobox(slot4, self, panel, panel_sizer, table.list_add(slot10, table.map_keys(slot13)))

	slot10 = "Can be used to override the interaction time specified in tweak data. -1 means that it should not override."

	self._build_value_number(slot4, self, panel, panel_sizer, "override_timer", {
		floats = 1,
		min = -1
	})

	slot6 = "This element creates an interaction. Override time is optional and will replace tweak data timer (-1 means do not overrride). Use disabled/enabled state on element to set active state on interaction."

	self._add_help_text(slot4, self)

	return 
end
function InteractionUnitElement:add_to_mission_package()
	slot4 = {
		name = "units/dev_tools/mission_elements/point_interaction/interaction_dummy",
		category = "units",
		continent = self._unit.unit_data(slot6).continent
	}
	slot7 = self._unit

	managers.editor.add_to_world_package(slot2, managers.editor)

	return 
end

return 
