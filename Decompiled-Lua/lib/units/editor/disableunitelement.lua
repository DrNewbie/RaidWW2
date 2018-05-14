if not DisableUnitUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

DisableUnitUnitElement = slot0
function DisableUnitUnitElement:init(unit)
	slot5 = unit

	DisableUnitUnitElement.super.init(slot3, self)

	self._units = {}
	self._hed.unit_ids = {}
	self._hed.destroy_units = false
	slot5 = "unit_ids"

	table.insert(false, self._save_values)

	slot5 = "destroy_units"

	table.insert(false, self._save_values)

	return 
end
function DisableUnitUnitElement:layer_finished()
	slot3 = self

	MissionElement.layer_finished(slot2)

	slot3 = self._hed.unit_ids

	for _, id in pairs(slot2) do
		slot9 = id
		slot14 = "load_unit"
		local unit = managers.worlddefinition.get_unit_on_load(slot7, managers.worlddefinition, callback(slot11, self, self))

		if unit then
			slot10 = unit
			self._units[unit.unit_data(slot9).unit_id] = unit
		end
	end

	return 
end
function DisableUnitUnitElement:load_unit(unit)
	if unit then
		slot5 = unit
		self._units[unit.unit_data(slot4).unit_id] = unit
	end

	return 
end
function DisableUnitUnitElement:update_selected()
	slot3 = self._hed.unit_ids

	for _, id in pairs(slot2) do
		slot8 = self._units[id]

		if not alive(slot7) then
			slot9 = id

			table.delete(slot7, self._hed.unit_ids)

			self._units[id] = nil
		end
	end

	slot3 = self._units

	for id, unit in pairs(slot2) do
		slot8 = unit

		if not alive(slot7) then
			slot9 = id

			table.delete(slot7, self._hed.unit_ids)

			self._units[id] = nil
		else
			local params = {
				g = 0,
				b = 0,
				r = 1,
				from_unit = self._unit,
				to_unit = unit
			}
			slot10 = params

			self._draw_link(slot8, self)

			slot13 = 0

			Application.draw(slot8, Application, unit, 1, 0)
		end
	end

	return 
end
function DisableUnitUnitElement:update_unselected(t, dt, selected_unit, all_units)
	slot7 = self._hed.unit_ids

	for _, id in pairs(slot6) do
		slot12 = self._units[id]

		if not alive(slot11) then
			slot13 = id

			table.delete(slot11, self._hed.unit_ids)

			self._units[id] = nil
		end
	end

	slot7 = self._units

	for id, unit in pairs(slot6) do
		slot12 = unit

		if not alive(slot11) then
			slot13 = id

			table.delete(slot11, self._hed.unit_ids)

			self._units[id] = nil
		end
	end

	return 
end
function DisableUnitUnitElement:draw_links_unselected(...)
	slot3 = self

	DisableUnitUnitElement.super.draw_links_unselected(slot2, ...)

	slot3 = self._units

	for id, unit in pairs(slot2) do
		local params = {
			g = 0,
			b = 0,
			r = 0.5,
			from_unit = self._unit,
			to_unit = unit
		}
		slot10 = params

		self._draw_link(slot8, self)

		slot13 = 0

		Application.draw(slot8, Application, unit, 0.5, 0)
	end

	return 
end
function DisableUnitUnitElement:update_editing()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot8 = 0

		Application.draw(slot3, Application, ray.unit, 0, 1)
	end

	return 
end
function DisableUnitUnitElement:select_unit()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		local unit = ray.unit
		slot6 = unit

		if self._units[unit.unit_data(slot5).unit_id] then
			slot6 = unit

			self._remove_unit(slot4, self)
		else
			slot6 = unit

			self._add_unit(slot4, self)
		end
	end

	return 
end
function DisableUnitUnitElement:_remove_unit(unit)
	slot5 = unit
	self._units[unit.unit_data(slot4).unit_id] = nil
	slot7 = unit
	slot5 = unit.unit_data(slot6).unit_id

	table.delete(unit.unit_data(slot4).unit_id, self._hed.unit_ids)

	return 
end
function DisableUnitUnitElement:_add_unit(unit)
	slot5 = unit
	self._units[unit.unit_data(slot4).unit_id] = unit
	slot7 = unit
	slot5 = unit.unit_data(slot6).unit_id

	table.insert(unit.unit_data(slot4).unit_id, self._hed.unit_ids)

	return 
end
function DisableUnitUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "select_unit"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function DisableUnitUnitElement:add_unit_list_btn()
	local function f(unit)
		slot4 = unit

		if self._units[unit.unit_data(slot3).unit_id] then
			return false
		end

		slot4 = "Statics"
		slot4 = unit
		slot4 = unit.type(managers.editor.layer(slot2, managers.editor))

		return managers.editor.layer(slot2, managers.editor).category_map(slot2)[unit.type(managers.editor.layer(slot2, managers.editor)).s(managers.editor.layer(slot2, managers.editor))]
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Add Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot11 = unit

		if not self._units[unit.unit_data(slot10).unit_id] then
			slot11 = unit

			self._add_unit(slot9, self)
		end
	end

	return 
end
function DisableUnitUnitElement:remove_unit_list_btn()
	local function f(unit)
		slot4 = unit

		return self._units[unit.unit_data(slot3).unit_id]
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Remove Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot11 = unit

		if self._units[unit.unit_data(slot10).unit_id] then
			slot11 = unit

			self._remove_unit(slot9, self)
		end
	end

	return 
end
function DisableUnitUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "TB_FLAT,TB_NODIVIDER"
	self._btn_toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot10 = "world_editor\\unit_by_name_list.png"

	self._btn_toolbar.add_tool(slot4, self._btn_toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(slot9))

	slot12 = "add_unit_list_btn"

	self._btn_toolbar.connect(slot4, self._btn_toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot10 = "toolbar\\delete_16x16.png"

	self._btn_toolbar.add_tool(slot4, self._btn_toolbar, "REMOVE_UNIT_LIST", "Remove unit from unit list", CoreEws.image_path(nil))

	slot12 = "remove_unit_list_btn"
	slot9 = nil

	self._btn_toolbar.connect(slot4, self._btn_toolbar, "REMOVE_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot5 = self._btn_toolbar

	self._btn_toolbar.realize(slot4)

	slot9 = "EXPAND,LEFT"

	panel_sizer.add(slot4, panel_sizer, self._btn_toolbar, 0, 1)

	slot9 = "Destroy unit(s) when disabled"
	self._destroy_units = self._build_value_checkbox(slot4, self, panel, panel_sizer, "destroy_units")

	return 
end

return 
