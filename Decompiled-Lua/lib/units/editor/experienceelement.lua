if not ExperienceUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

ExperienceUnitElement = slot0
ExperienceUnitElement.SAVE_UNIT_POSITION = false
ExperienceUnitElement.SAVE_UNIT_ROTATION = false
function ExperienceUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.elements = {}
	self._hed.event = nil
	slot5 = "event"

	table.insert(nil, self._save_values)

	return 
end
function ExperienceUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = managers.experience
	slot10 = "Specify special xp bonus awarded to player."

	self._build_value_combobox(slot4, self, panel, panel_sizer, "event", managers.experience.get_script_xp_events(slot10))

	return 
end

return 
