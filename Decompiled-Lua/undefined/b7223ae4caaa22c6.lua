slot3 = "CoreStaticLayer"

core.import(slot1, core)

slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not CoverLayer then
	slot2 = CoreStaticLayer.StaticLayer
	slot0 = class(slot1)
end

CoverLayer = slot0
function CoverLayer:init(owner, save_name, units_vector, slot_mask)
	slot11 = "cover_layer"

	CoverLayer.super.init(slot6, self, owner, "cover", {
		"cover"
	})

	slot7 = Draw
	self._brush = Draw.brush(slot6)
	slot8 = units_vector

	self.load_unit_map_from_vector(slot6, self)

	self._unit_name = ""
	slot9 = 0
	self._current_pos = Vector3(slot6, 0, 0)
	slot9 = 0
	self._offset_move_vec = Vector3(slot6, 0, 0)
	slot8 = "cover"
	self._slot_mask = managers.slot.get_mask(slot6, managers.slot)

	return 
end
function CoverLayer:build_panel(notebook)
	slot7 = "TAB_TRAVERSAL"
	self._ews_panel = EWS.Panel(slot3, EWS, notebook, "")
	slot5 = "VERTICAL"
	self._main_sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self._main_sizer

	self._ews_panel.set_sizer(slot3, self._ews_panel)

	slot7 = ""
	local btn_sizer = EWS.StaticBoxSizer(slot3, EWS, self._ews_panel, "HORIZONTAL")
	slot9 = "BU_EXACTFIT,NO_BORDER"
	local create_btn = EWS.Button(EWS, EWS, self._ews_panel, "Create covers", "")
	slot10 = "LEFT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, create_btn, 0, 5)

	slot12 = "create_covers"
	slot9 = nil

	create_btn.connect(EWS, create_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot10 = "BU_EXACTFIT,NO_BORDER"
	local delete_btn = EWS.Button(EWS, EWS, self._ews_panel, "Delete covers", "")
	slot11 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, delete_btn, 0, 5)

	slot13 = "delete_covers"
	slot10 = nil

	delete_btn.connect(EWS, delete_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot11 = "EXPAND,LEFT"

	self._main_sizer.add(EWS, self._main_sizer, btn_sizer, 0, 1)

	return self._ews_panel, true
end
function CoverLayer:add_btns_to_toolbar(...)
	slot3 = self

	CoverLayer.super.add_btns_to_toolbar(slot2, ...)

	return 
end
function CoverLayer:create_covers()
	slot4 = "all"
	slot8 = "world_geometry"
	local all_static_units = World.find_units_quick(slot2, World, managers.slot.get_mask(slot6, managers.slot))
	slot4 = all_static_units

	for _, unit in pairs(World) do
		slot10 = inspect(slot11)
		slot13 = unit.cover_placement

		Application.trace(slot8, Application, inspect(unit))

		if unit.cover_placement then
			slot9 = unit

			if unit.cover_placement(slot8) then
				slot9 = unit
				slot9 = unit.cover_placement(slot8)

				unit.cover_placement(slot8).create_cover_points(slot8)
			end
		end
	end

	return 
end
function CoverLayer:delete_covers()
	slot4 = "all"
	slot8 = "world_geometry"
	local all_static_units = World.find_units_quick(slot2, World, managers.slot.get_mask(slot6, managers.slot))
	slot4 = all_static_units

	for _, unit in pairs(World) do
		if unit.cover_placement then
			slot9 = unit

			unit.delete_cover_points(slot8)
		end
	end

	return 
end
function CoverLayer:set_enabled(enabled)
	if not enabled then
		slot5 = "Don't want to disable Cover layer since it is super cool."

		managers.editor.output_warning(slot3, managers.editor)
	end

	return false
end

return 
