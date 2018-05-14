slot3 = "CoreMenuItem"

core.import(slot1, core)

if not ItemColumn then
	slot2 = CoreMenuItem.Item
	slot0 = class(slot1)
end

ItemColumn = slot0
ItemColumn.TYPE = "column"
function ItemColumn:init(data_node, parameters)
	slot7 = parameters

	CoreMenuItem.Item.init(slot4, self, data_node)

	self._type = ItemColumn.TYPE

	return 
end

if not ItemServerColumn then
	slot2 = ItemColumn
	slot0 = class(slot1)
end

ItemServerColumn = slot0
ItemServerColumn.TYPE = "server_column"
function ItemServerColumn:init(data_node, parameters)
	slot7 = parameters

	ItemServerColumn.super.init(slot4, self, data_node)

	self._type = ItemServerColumn.TYPE

	return 
end

return 
