if not HUDObjectiveDescription then
	slot2 = HUDObjectiveBase
	slot0 = class(slot1)
end

HUDObjectiveDescription = slot0
HUDObjectiveDescription.W = 512
HUDObjectiveDescription.DESCRIPTION_TEXT_FONT = tweak_data.gui.fonts.lato
HUDObjectiveDescription.DESCRIPTION_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_20
function HUDObjectiveDescription:init(objectives_panel, objective)
	self._objective = objective
	self._id = objective.id
	slot6 = objectives_panel

	self._create_text(slot4, self)

	slot5 = self

	self.set_hidden(slot4)

	return 
end
function HUDObjectiveDescription:_create_text(objectives_panel)
	local panel_params = {
		vertical = "top",
		wrap = true,
		align = "right",
		halign = "scale",
		valign = "top"
	}
	slot6 = self._id
	slot4 = tostring(slot5)
	panel_params.name = "objective_" .. slot4 .. "_description"
	panel_params.w = HUDObjectiveDescription.W
	slot7 = HUDObjectiveDescription.DESCRIPTION_TEXT_FONT_SIZE
	panel_params.font = tweak_data.gui.get_font_path(slot4, tweak_data.gui, HUDObjectiveDescription.DESCRIPTION_TEXT_FONT)
	panel_params.font_size = HUDObjectiveDescription.DESCRIPTION_TEXT_FONT_SIZE
	panel_params.text = self._objective.description
	slot6 = panel_params
	self._object = objectives_panel.text(slot4, objectives_panel)
	slot5 = self._object
	local _, _, _, h = self._object.text_rect(slot4)
	slot10 = h

	self._object.set_h(slot8, self._object)

	return 
end
function HUDObjectiveDescription:set_objective_text(text)
	slot5 = text

	self._object.set_text(slot3, self._object)

	return 
end

return 
