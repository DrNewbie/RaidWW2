slot3 = "CoreSsRow"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

local EMPTY_ROW_XML = "   <Row> %s\n   </Row> "
local CELL_XML = "    <Cell><Data ss:Type=\"String\">%s</Data></Cell> "
Row = Row or CoreClass.class()
function Row:init(...)
	self._vals = {
		...
	}

	return 
end
function Row:add_val(val)
	slot5 = val

	table.insert(slot3, self._vals)

	return 
end
function Row:_to_cells_xml()
	local cells_xml = ""
	slot4 = self._vals

	for _, v in ipairs(slot3) do
		slot12 = v
		cells_xml = cells_xml .. "\n" .. string.format(slot10, CELL_XML)
	end

	return cells_xml
end
function Row:to_xml(f)
	slot4 = f
	slot7 = EMPTY_ROW_XML
	slot10 = self

	f.write(slot3, string.format(slot6, self._to_cells_xml(slot9)))

	return 
end
local EMPTY_HEADER1_ROW_XML = "   <Row ss:StyleID=\"header1\"> %s\n   </Row> "

if not Header1Row then
	slot5 = Row
	slot3 = CoreClass.class(slot4)
end

Header1Row = slot3
function Header1Row:to_xml(f)
	slot4 = f
	slot7 = EMPTY_HEADER1_ROW_XML
	slot10 = self

	f.write(slot3, string.format(slot6, self._to_cells_xml(slot9)))

	return 
end
local EMPTY_HEADER2_ROW_XML = "   <Row ss:StyleID=\"header2\"> %s\n   </Row> "

if not Header2Row then
	slot6 = Row
	slot4 = CoreClass.class(slot5)
end

Header2Row = slot4
function Header2Row:to_xml(f)
	slot4 = f
	slot7 = EMPTY_HEADER2_ROW_XML
	slot10 = self

	f.write(slot3, string.format(slot6, self._to_cells_xml(slot9)))

	return 
end

return 
