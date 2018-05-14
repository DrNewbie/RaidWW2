slot3 = "CoreWorkbook"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

local EMPTY_WORKBOOK_XML1 = [[
<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
  </Style>
  <Style ss:ID="header1">
   <Font x:Family="Swiss" ss:Bold="1"/>
  </Style>
  <Style ss:ID="header2">
   <Font x:Family="Swiss" ss:Bold="1" ss:Italic="1"/>
  </Style>
 </Styles>]]
local EMPTY_WORKBOOK_XML2 = "</Workbook> "
Workbook = Workbook or CoreClass.class()
function Workbook:init()
	self._worksheets = {}

	return 
end
function Workbook:add_worksheet(worksheet)
	slot5 = worksheet

	table.insert(slot3, self._worksheets)

	return 
end
function Workbook:to_xml(f)
	slot5 = EMPTY_WORKBOOK_XML1

	f.write(slot3, f)

	local ws_xml = ""
	slot5 = self._worksheets

	for _, ws in ipairs(f) do
		slot11 = "\n"

		f.write(slot9, f)

		slot11 = f

		ws.to_xml(slot9, ws)
	end

	slot6 = EMPTY_WORKBOOK_XML2

	f.write(slot4, f)

	return 
end

return 
