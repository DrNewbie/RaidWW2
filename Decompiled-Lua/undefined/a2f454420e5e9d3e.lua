if not MetalDetectorElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

MetalDetectorElement = slot0
function MetalDetectorElement:init(unit)
	slot5 = unit

	MetalDetectorElement.super.init(slot3, self)

	self._hed.is_metal_detector_object = true
	slot5 = "is_metal_detector_object"

	table.insert(true, self._save_values)

	return 
end
function MetalDetectorElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	slot6 = "Place this metal detector object somewhere in the world."

	self._add_help_text(slot4, self)

	return 
end

return 
