if not AIAreaElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

AIAreaElement = slot0
AIAreaElement.SAVE_UNIT_ROTATION = false
function AIAreaElement:init(unit)
	slot5 = unit

	AIAreaElement.super.init(slot3, self)

	self._nav_seg_units = {}
	slot5 = "nav_segs"

	table.insert(slot3, self._save_values)

	return 
end
function AIAreaElement:post_init(...)
	slot3 = self

	AIAreaElement.super.post_init(slot2, ...)

	return 
end
function AIAreaElement:layer_finished()
	slot3 = self

	AIAreaElement.super.layer_finished(slot2)

	if not self._hed.nav_segs then
		return 
	end

	slot3 = self._hed.nav_segs

	for _, u_id in ipairs(slot2) do
		slot9 = u_id
		slot14 = "load_nav_seg_unit"
		local unit = managers.worlddefinition.get_unit_on_load(slot7, managers.worlddefinition, callback(slot11, self, self))

		if unit then
			self._nav_seg_units[u_id] = unit
		end
	end

	return 
end
function AIAreaElement:load_nav_seg_unit(unit)
	slot5 = unit
	self._nav_seg_units[unit.unit_data(slot4).unit_id] = unit

	return 
end
function AIAreaElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	AIAreaElement.super.draw_links(slot6, self, t, dt)

	if selected_unit and self._unit ~= selected_unit then
		slot8 = selected_unit

		if not self._nav_seg_units[selected_unit.unit_data(slot7).unit_id] then
			return 
		end
	end

	slot7 = self._nav_seg_units

	for u_id, unit in pairs(slot6) do
		slot13 = {
			g = 0.75,
			b = 0,
			r = 0,
			from_unit = self._unit,
			to_unit = unit
		}

		self._draw_link(slot11, self)
	end

	return 
end
function AIAreaElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self

	self._chk_units_alive(slot6)

	slot8 = "Ai"
	slot9 = dt

	managers.editor.layer(slot6, managers.editor).external_draw(slot6, managers.editor.layer(slot6, managers.editor), t)

	slot11 = all_units

	self.draw_links(slot6, self, t, dt, selected_unit)

	slot8 = t

	SpecialObjectiveUnitElement._highlight_if_outside_the_nav_field(slot6, self)

	return 
end
function AIAreaElement:update_unselected(t, dt, selected_unit, all_units)
	slot7 = self

	self._chk_units_alive(slot6)

	return 
end
function AIAreaElement:_chk_units_alive()
	slot3 = self._nav_seg_units

	for u_id, unit in pairs(slot2) do
		slot8 = unit

		if not alive(slot7) then
			self._nav_seg_units[u_id] = nil
			slot9 = u_id

			self._remove_nav_seg(nil, self)
		end
	end

	return 
end
function AIAreaElement:update_editing()
	slot3 = self

	self._raycast(slot2)

	return 
end
function AIAreaElement:_raycast()
	slot4 = {
		ray_type = "editor",
		mask = 19
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if not ray then
		return 
	end

	slot4 = ray.unit
	slot4 = ray.unit.name(slot3)

	if ray.unit.name(slot3).s(slot3) == "core/units/nav_surface/nav_surface" then
		slot8 = 0

		Application.draw(slot3, Application, ray.unit, 0, 1)

		return ray.unit
	else
		slot9 = 1

		Application.draw_sphere(slot3, Application, ray.position, 10, 1, 1)
	end

	return 
end
function AIAreaElement:_lmb()
	slot3 = self
	local unit = self._raycast(slot2)

	if not unit then
		return 
	end

	slot4 = unit
	local u_id = unit.unit_data(slot3).unit_id

	if self._nav_seg_units[u_id] then
		slot6 = unit

		self._remove_unit(slot4, self)
	else
		slot6 = unit

		self._add_unit(slot4, self)
	end

	return 
end
function AIAreaElement:_add_unit(unit)
	local u_id = unit.unit_data(slot3).unit_id
	self._nav_seg_units[u_id] = unit
	slot6 = unit

	self._add_nav_seg(unit, self)

	return 
end
function AIAreaElement:_remove_unit(unit)
	slot4 = unit
	local u_id = unit.unit_data(slot3).unit_id
	self._nav_seg_units[u_id] = nil
	slot6 = u_id

	self._remove_nav_seg(nil, self)

	return 
end
function AIAreaElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "_lmb"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function AIAreaElement:selected()
	slot3 = self

	AIAreaElement.super.selected(slot2)

	slot3 = self

	self._chk_units_alive(slot2)

	return 
end
function AIAreaElement:_build_panel(panel, panel_sizer)
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

	return 
end
function AIAreaElement:add_unit_list_btn()
	local function f(unit)
		slot4 = unit

		if self._nav_seg_units[unit.unit_data(slot3).unit_id] then
			return false
		end

		slot3 = unit
		slot3 = unit.name(slot2)

		if unit.name(slot2).s(slot2) == "core/units/nav_surface/nav_surface" then
			return true
		else
			return false
		end

		return 
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Add Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot11 = unit

		if not self._nav_seg_units[unit.unit_data(slot10).unit_id] then
			slot11 = unit

			self._add_unit(slot9, self)
		end
	end

	return 
end
function AIAreaElement:remove_unit_list_btn()
	local function f(unit)
		slot4 = unit

		return self._nav_seg_units[unit.unit_data(slot3).unit_id]
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Remove Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot11 = unit

		if self._nav_seg_units[unit.unit_data(slot10).unit_id] then
			slot11 = unit

			self._remove_unit(slot9, self)
		end
	end

	return 
end
function AIAreaElement:add_to_mission_package()
	return 
end
function AIAreaElement:_add_nav_seg(unit)
	self._hed.nav_segs = self._hed.nav_segs or {}
	slot7 = unit
	slot5 = unit.unit_data(slot6).unit_id

	table.insert(self._hed.nav_segs or , self._hed.nav_segs)

	return 
end
function AIAreaElement:_remove_nav_seg(u_id)
	slot4 = self._hed.nav_segs

	for i, test_u_id in ipairs(slot3) do
		if u_id == test_u_id then
			slot10 = i

			table.remove(slot8, self._hed.nav_segs)

			if #self._hed.nav_segs == 0 then
				self._hed.nav_segs = nil
			end

			return 
		end
	end

	return 
end

return 
