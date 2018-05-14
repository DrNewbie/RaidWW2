if not RaidGUIControlTableCellImage then
	slot2 = RaidGUIControlImage
	slot0 = class(slot1)
end

RaidGUIControlTableCellImage = slot0
function RaidGUIControlTableCellImage:init(parent, params)
	slot5 = params
	local local_params = clone(slot4)

	if local_params.value and local_params.value.texture and not local_params.texture then
		local_params.texture = local_params.value.texture
	end

	if local_params.value and local_params.value.texture_rect and not local_params.texture_rect then
		local_params.texture_rect = local_params.value.texture_rect
	end

	slot8 = local_params

	RaidGUIControlTableCellImage.super.init(slot5, self, parent)

	return 
end

return 
