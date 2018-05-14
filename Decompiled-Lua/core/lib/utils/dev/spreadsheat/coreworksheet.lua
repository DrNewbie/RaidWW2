slot3 = "CoreWorksheet"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

local EMPTY_WORKSHEET_XML1 = " <Worksheet ss:Name=\"%s\">\n  <Table> "
local EMPTY_WORKSHEET_XML2 = "\n  </Table>\n </Worksheet> "
Worksheet = Worksheet or CoreClass.class()
function Worksheet:init(name)
	self._name = name
	self._rows = {}

	return 
end
function Worksheet:add_row(row)
	slot5 = row

	table.insert(slot3, self._rows)

	return 
end
function Worksheet:to_xml(f)
	slot4 = f
	slot8 = self._name

	f.write(slot3, string.format(slot6, EMPTY_WORKSHEET_XML1))

	slot4 = self._rows

	for _, r in ipairs(slot3) do
		slot10 = "\n"

		f.write(slot8, f)

		slot10 = f

		r.to_xml(slot8, r)
	end

	slot5 = EMPTY_WORKSHEET_XML2

	f.write(slot3, f)

	return 
end

return 
