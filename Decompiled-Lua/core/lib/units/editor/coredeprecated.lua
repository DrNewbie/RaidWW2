if not CoreDeprecatedHubElement then
	slot2 = HubElement
	slot0 = class(slot1)
end

CoreDeprecatedHubElement = slot0

if not DeprecatedHubElement then
	slot2 = CoreDeprecatedHubElement
	slot0 = class(slot1)
end

DeprecatedHubElement = slot0
function DeprecatedHubElement:init(...)
	slot3 = self

	CoreDeprecatedHubElement.init(slot2, ...)

	return 
end
function CoreDeprecatedHubElement:init(unit)
	slot5 = unit

	HubElement.init(slot3, self)

	return 
end
function CoreDeprecatedHubElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "VERTICAL"
	local deprecated_sizer = EWS.BoxSizer(slot4, EWS)
	slot13 = ""
	slot10 = "ALIGN_CENTER"

	deprecated_sizer.add(EWS, deprecated_sizer, EWS.StaticText(slot8, EWS, panel, "This hub element is deprecated", 0), 1, 0)

	slot13 = ""
	slot10 = "ALIGN_CENTER"

	deprecated_sizer.add(EWS, deprecated_sizer, EWS.StaticText(1, EWS, panel, "Please remove", 0), 1, 0)

	slot13 = ""
	slot10 = "ALIGN_CENTER"

	deprecated_sizer.add(EWS, deprecated_sizer, EWS.StaticText(1, EWS, panel, "", 0), 1, 0)

	slot13 = ""
	slot10 = "ALIGN_CENTER"

	deprecated_sizer.add(EWS, deprecated_sizer, EWS.StaticText(1, EWS, panel, "Have a nice day!", 0), 1, 0)

	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, deprecated_sizer, 0, 0)

	return 
end

return 
