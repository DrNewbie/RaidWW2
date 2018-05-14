if not AiGlobalEventUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

AiGlobalEventUnitElement = slot0
function AiGlobalEventUnitElement:init(unit)
	slot5 = unit

	AiGlobalEventUnitElement.super.init(slot3, self)

	self._hed.blame = "none"
	slot5 = "wave_mode"

	table.insert("none", self._save_values)

	slot5 = "AI_event"

	table.insert("none", self._save_values)

	slot5 = "blame"

	table.insert("none", self._save_values)

	return 
end
function AiGlobalEventUnitElement:post_init(...)
	slot3 = self

	AiGlobalEventUnitElement.super.post_init(slot2, ...)

	if self._hed.event then
		self._hed.wave_mode = self._hed.event
		self._hed.event = nil
	end

	return 
end
function AiGlobalEventUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = ElementAiGlobalEvent._wave_modes

	self._build_value_combobox(slot4, self, panel, panel_sizer, "wave_mode")

	slot9 = ElementAiGlobalEvent._AI_events

	self._build_value_combobox(slot4, self, panel, panel_sizer, "AI_event")

	slot9 = ElementAiGlobalEvent._blames

	self._build_value_combobox(slot4, self, panel, panel_sizer, "blame")

	return 
end

return 
