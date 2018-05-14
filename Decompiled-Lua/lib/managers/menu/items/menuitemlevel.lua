slot3 = "CoreMenuItem"

core.import(slot1, core)

if not MenuItemLevel then
	slot2 = CoreMenuItem.Item
	slot0 = class(slot1)
end

MenuItemLevel = slot0
MenuItemLevel.TYPE = "level"
function MenuItemLevel:init(data_node, parameters)
	slot7 = parameters

	CoreMenuItem.Item.init(slot4, self, data_node)

	self._type = MenuItemLevel.TYPE

	return 
end

return 
