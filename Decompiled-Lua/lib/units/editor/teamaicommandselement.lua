if not TeamAICommandsElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

TeamAICommandsElement = slot0
TeamAICommandsElement.SAVE_UNIT_POSITION = false
TeamAICommandsElement.SAVE_UNIT_ROTATION = false
function TeamAICommandsElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.elements = {}
	self._hed.command = "none"
	slot5 = "command"

	table.insert("none", self._save_values)

	return 
end
function TeamAICommandsElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	return 
end

return 
