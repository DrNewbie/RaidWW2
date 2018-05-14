if not RaidOptionsBackground then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidOptionsBackground = slot0
function RaidOptionsBackground:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	RaidOptionsBackground.super.init(slot6, self, ws, fullscreen_ws, node)

	slot8 = "[RaidOptionsBackground:init]  "
	slot11 = self._background

	Application.debug(slot6, Application, inspect(node))

	return 
end

return 
