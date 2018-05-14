if not HintUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

HintUnitElement = slot0
function HintUnitElement:init(unit)
	slot5 = unit

	HintUnitElement.super.init(slot3, self)

	self._hed.hint_id = "none"
	slot5 = "hint_id"

	table.insert("none", self._save_values)

	return 
end
function HintUnitElement:_set_text()
	return 
end
function HintUnitElement:set_element_data(params, ...)
	slot5 = params

	HintUnitElement.super.set_element_data(slot3, self, ...)

	if params.value == "hint_id" then
		slot4 = self

		self._set_text(slot3)
	end

	return 
end
function HintUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "HORIZONTAL"
	local text_sizer = EWS.BoxSizer(slot4, EWS)
	slot13 = ""
	slot10 = "ALIGN_CENTER_VERTICAL,RIGHT,EXPAND"

	text_sizer.add(EWS, text_sizer, EWS.StaticText(slot8, EWS, panel, "Text: ", ""), 1, 2)

	slot10 = ""
	self._text = EWS.StaticText(EWS, EWS, panel, "", "")
	slot10 = "RIGHT,TOP,EXPAND"

	text_sizer.add(EWS, text_sizer, self._text, 2, 2)

	slot6 = self

	self._set_text(EWS)

	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, text_sizer, 1, 0)

	return 
end

return 
