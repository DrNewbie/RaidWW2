slot3 = "CoreMenuNode"

core.import(slot1, core)

slot3 = "CoreSerialize"

core.import(slot1, core)

slot3 = "CoreMenuItem"

core.import(slot1, core)

slot3 = "CoreMenuItemToggle"

core.import(slot1, core)

if not MenuNodeTable then
	slot2 = CoreMenuNode.MenuNode
	slot0 = class(slot1)
end

MenuNodeTable = slot0
function MenuNodeTable:init(data_node)
	slot5 = data_node

	MenuNodeTable.super.init(slot3, self)

	self._columns = {}
	slot4 = self

	self._setup_columns(slot3)

	self._parameters.total_proportions = 0
	slot4 = self._columns

	for _, data in ipairs(0) do
		self._parameters.total_proportions = self._parameters.total_proportions + data.proportions
	end

	return 
end
function MenuNodeTable:_setup_columns()
	return 
end
function MenuNodeTable:_add_column(params)
	slot5 = params

	table.insert(slot3, self._columns)

	return 
end
function MenuNodeTable:columns()
	return self._columns
end

return 
