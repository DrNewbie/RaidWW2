slot2 = "core/lib/utils/dev/tools/material_editor/CoreSmartNode"

require(slot1)

slot2 = "core/lib/utils/dev/tools/material_editor/parameter_widgets/CoreMaterialEditorParameter"
local CoreMaterialEditorParameter = require(slot1)

if not CoreMaterialEditorSeparator then
	slot3 = CoreMaterialEditorParameter
	local CoreMaterialEditorSeparator = class(slot2)
end

function CoreMaterialEditorSeparator:init(parent)
	slot7 = ""
	self._panel = EWS.Panel(slot3, EWS, parent, "")
	slot5 = "HORIZONTAL"
	self._box = EWS.BoxSizer(slot3, EWS)
	slot7 = ""
	self._line = EWS.StaticLine(slot3, EWS, self._panel, "")
	slot8 = "TOP,EXPAND"

	self._box.add(slot3, self._box, self._line, 1, 4)

	slot5 = self._box

	self._panel.set_sizer(slot3, self._panel)

	return 
end
function CoreMaterialEditorSeparator:update(t, dt)
	return 
end
function CoreMaterialEditorSeparator:destroy()
	slot3 = self

	CoreMaterialEditorParameter.destroy(slot2)

	return 
end

return CoreMaterialEditorSeparator
