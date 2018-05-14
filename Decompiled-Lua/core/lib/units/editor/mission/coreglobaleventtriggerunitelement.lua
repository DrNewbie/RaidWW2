if not CoreGlobalEventTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreGlobalEventTriggerUnitElement = slot0

if not GlobalEventTriggerUnitElement then
	slot2 = CoreGlobalEventTriggerUnitElement
	slot0 = class(slot1)
end

GlobalEventTriggerUnitElement = slot0
function GlobalEventTriggerUnitElement:init(...)
	slot3 = self

	GlobalEventTriggerUnitElement.super.init(slot2, ...)

	return 
end
function CoreGlobalEventTriggerUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.trigger_times = 1
	self._hed.global_event = "none"
	slot5 = "global_event"

	table.insert("none", self._save_values)

	return 
end
function CoreGlobalEventTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = {
		"none"
	}
	slot14 = managers.mission
	slot10 = "Select a global event from the combobox"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "global_event", table.list_add(slot10, managers.mission.get_global_event_list(slot13)))

	return 
end

return 
