if not CoreExecuteInOtherMissionUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreExecuteInOtherMissionUnitElement = slot0

if not ExecuteInOtherMissionUnitElement then
	slot2 = CoreExecuteInOtherMissionUnitElement
	slot0 = class(slot1)
end

ExecuteInOtherMissionUnitElement = slot0
function ExecuteInOtherMissionUnitElement:init(...)
	slot3 = self

	CoreExecuteInOtherMissionUnitElement.init(slot2, ...)

	return 
end
function CoreExecuteInOtherMissionUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	return 
end
function CoreExecuteInOtherMissionUnitElement:selected()
	slot3 = self

	MissionElement.selected(slot2)

	return 
end
function CoreExecuteInOtherMissionUnitElement:add_unit_list_btn()
	local function f(unit)
		slot4 = "mission_element"

		return unit.type(slot2) == Idstring(unit) and unit ~= self._unit
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Add other mission unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot11 = unit

		self.add_on_executed(slot9, self)
	end

	return 
end
function CoreExecuteInOtherMissionUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "TB_FLAT,TB_NODIVIDER"
	self._btn_toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot10 = "world_editor\\unit_by_name_list.png"

	self._btn_toolbar.add_tool(slot4, self._btn_toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(slot9))

	slot12 = "add_unit_list_btn"
	slot9 = nil

	self._btn_toolbar.connect(slot4, self._btn_toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot5 = self._btn_toolbar

	self._btn_toolbar.realize(slot4)

	slot9 = "EXPAND,LEFT"

	panel_sizer.add(slot4, panel_sizer, self._btn_toolbar, 0, 1)

	return 
end

return 
