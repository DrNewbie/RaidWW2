-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CorePortalLayer"

core.module(slot1, core)

slot3 = "CoreStaticLayer"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

slot3 = "CorePortalManager"

core.import(slot1, core)

if not PortalLayer then
	slot2 = CoreStaticLayer.StaticLayer
	slot0 = class(slot1)
end

PortalLayer = slot0
function PortalLayer:init(owner)
	slot8 = "portal_layer"

	PortalLayer.super.init(slot3, self, owner, "portal", {
		"portal"
	})

	self._portal_shapes = {}
	slot6 = "update_portal_shape"
	self.update_function = callback(slot3, self, self)
	self._min = -30000
	self._max = 30000
	self._only_draw_selected = false
	self._dont_draw_boxes = false
	self._dont_draw_units = false
	slot4 = Draw
	self._portal_brush = Draw.brush(slot3)
	self._portal_point_unit = "core/units/portal_point/portal_point"
	self._portal_shape_unit = "core/units/portal_shape/portal_shape"

	return 
end
function PortalLayer:get_layer_name()
	return "Portal"
end
function PortalLayer:load(world_holder, offset)
	slot8 = offset
	local portal_data = world_holder.create_world(slot4, world_holder, "world", self._save_name)
	slot7 = portal_data

	if not self._old_load(world_holder, self) then
		slot6 = portal_data.portals

		for _, portal in ipairs(slot5) do
			local name = portal.name
			local r = 0.25 + math.rand(slot11)
			local g = 0.25 + math.rand(0.75)
			slot14 = 0.75
			local b = 0.25 + math.rand(0.75)
			local draw_base = portal.draw_base or 0
			self._portal_shapes[name] = {
				portal = {},
				top = portal.top,
				bottom = portal.bottom,
				draw_base = draw_base,
				r = r,
				g = g,
				b = b
			}
			self._current_shape = self._portal_shapes[name]
			self._current_portal = self._portal_shapes[name].portal
			slot16 = portal.points

			for _, data in ipairs() do
				slot23 = data.position

				self.do_spawn_unit(slot20, self, self._portal_point_unit)
			end
		end

		slot8 = managers.portal

		for _, group in pairs(managers.portal.unit_groups(slot7)) do
			slot13 = group

			for _, shape in ipairs(group.shapes(slot12)) do
				slot18 = shape.position(slot19)
				slot21 = shape
				local unit = PortalLayer.super.do_spawn_unit(slot15, self, self._portal_shape_unit, shape.rotation(shape))
				slot17 = unit
				unit.unit_data(self).portal_group_shape = shape
				slot17 = unit
				slot18 = unit

				unit.unit_data(self).portal_group_shape.set_unit(self, unit.unit_data(self).portal_group_shape)
			end
		end
	end

	slot7 = self._shapes_listbox

	self.update_shapes_listbox(slot5, self)

	slot6 = self

	self.select_portal(slot5)

	slot6 = self

	self.update_groups_listbox(slot5)

	slot6 = self

	self.clear_selected_units(slot5)

	return 
end
function PortalLayer:_old_load(portal)
	if not portal._portal_shapes then
		return false
	end

	if portal._portal_shapes then
		slot4 = portal._portal_shapes

		for name, portal in pairs(slot3) do
			local r = 0.25 + math.rand(slot8)
			local g = 0.25 + math.rand(0.75)
			slot11 = 0.75
			local b = 0.25 + math.rand(0.75)
			local draw_base = portal.draw_base or 0
			self._portal_shapes[name] = {
				portal = {},
				top = portal.top,
				bottom = portal.bottom,
				draw_base = draw_base,
				r = r,
				g = g,
				b = b
			}
			self._current_shape = self._portal_shapes[name]
			self._current_portal = self._portal_shapes[name].portal
			slot13 = portal.portal

			for _, data in ipairs() do
				slot20 = data.pos

				self.do_spawn_unit(slot17, self, self._portal_point_unit)
			end
		end
	end

	slot6 = managers.portal

	for _, group in pairs(managers.portal.unit_groups(slot5)) do
		slot11 = group

		for _, shape in ipairs(group.shapes(slot10)) do
			slot16 = shape.position(slot17)
			slot19 = shape
			local unit = PortalLayer.super.do_spawn_unit(slot13, self, self._portal_shape_unit, shape.rotation(shape))
			slot15 = unit
			unit.unit_data(self).portal_group_shape = shape
			slot15 = unit
			slot16 = unit

			unit.unit_data(self).portal_group_shape.set_unit(self, unit.unit_data(self).portal_group_shape)
		end
	end

	return true
end
function PortalLayer:save(save_params)
	local portals = {}
	local unit_groups = managers.portal.save_level_data(slot4)
	slot6 = self._portal_shapes

	for name, data in pairs(managers.portal) do
		local portal_data = {
			name = name,
			top = data.top,
			draw_base = data.draw_base,
			bottom = data.bottom,
			points = {}
		}
		slot12 = data.portal

		for _, unit in ipairs(slot11) do
			slot18 = {
				position = unit.position(slot20),
				rotation = unit.rotation(slot20)
			}
			slot21 = unit
			slot21 = unit

			table.insert(slot16, portal_data.points)
		end

		slot13 = portal_data

		table.insert(slot11, portals)
	end

	local t = {
		single_data_block = true,
		entry = self._save_name,
		data = {
			portals = portals,
			unit_groups = unit_groups
		}
	}
	slot8 = t.data

	self._add_project_save_data(slot6, self)

	slot8 = t

	managers.editor.add_save_data(slot6, managers.editor)

	return 
end
function PortalLayer:get_portal_shapes()
	return self._portal_shapes
end
function PortalLayer:update(time, rel_time)
	if not self._dont_draw then
		if not self._only_draw_selected then
			slot7 = managers.portal

			for name, group in pairs(managers.portal.unit_groups(slot6)) do
				slot15 = self._dont_draw_units

				group.draw(slot9, group, time, rel_time, 0.6, self._dont_draw_boxes)
			end
		end

		if self._current_group then
			slot10 = self._dont_draw_units

			self._current_group.draw(slot4, self._current_group, time, rel_time, 1, self._dont_draw_boxes)
		end
	end

	if self._draw_units_in_no_portal_state then
		slot8 = 1

		self._draw_units_in_no_portal(slot4, self, time, rel_time)
	end

	if self._draw_not_current then
		slot8 = 1

		self._draw_units_in_not_current_portal(slot4, self, time, rel_time)
	end

	slot7 = rel_time

	PortalLayer.super.update(slot4, self, time)

	if self.update_function then
		slot6 = rel_time

		self.update_function(slot4, time)
	end

	return 
end
function PortalLayer:update_portal_shape(time, rel_time)
	slot5 = self

	self.draw_limit(slot4)

	slot5 = self

	self.calc_mid_point(slot4)

	return 
end
function PortalLayer:draw_limit()
	slot3 = self._portal_shapes

	for n, data in pairs(slot2) do
		slot9 = data

		self.draw_portal(slot7, self)
	end

	return 
end
function PortalLayer:draw_portal(data)
	if self._only_draw_selected and data.portal ~= self._current_portal then
		return 
	end

	slot6 = Application
	slot4 = Application.time(slot5) * 100
	local puls = 0.8 + (1 + math.sin(slot3)) / 10
	local int = 1 * puls
	local portal = data.portal
	local min = self._min + data.draw_base
	local max = self._max + data.draw_base

	if data.bottom ~= 0 or data.top ~= 0 then
		min = data.bottom
		max = data.top
	end

	if portal ~= self._current_portal then
		int = 0.6 * puls
	end

	local r = data.r * int
	local g = data.g * int
	local b = data.b * int
	slot12 = self._portal_brush
	slot18 = b

	self._portal_brush.set_color(slot11, Color(slot14, 0.75, r, g))

	for i = 1, #portal, 1 do
		local s_point = portal[i]
		local e_point = portal[i + 1]

		if i == #portal then
			e_point = portal[1]
		end

		local s_pos = s_point.position(slot17)
		local e_pos = e_point.position(s_point)
		slot22 = 0
		slot23 = 0
		local dir = Vector3(e_point, e_pos.x, e_pos.y) - Vector3(e_pos.x, s_pos.x, s_pos.y)
		local length = dir.length(e_pos.x)
		slot22 = dir
		dir = dir.normalized(dir)
		slot24 = min
		local c1 = Vector3(dir, s_pos.x, s_pos.y)
		slot25 = max
		local c2 = Vector3(s_pos.x, s_pos.x, s_pos.y)
		slot26 = max
		local c3 = Vector3(s_pos.x, e_pos.x, e_pos.y)
		slot27 = min
		local c4 = Vector3(e_pos.x, e_pos.x, e_pos.y)
		slot30 = c4

		self._portal_brush.quad(e_pos.x, self._portal_brush, c1, c2, c3)

		slot31 = min
		slot32 = max
		slot32 = 0 * int

		Application.draw_cylinder(e_pos.x, Application, Vector3(c2, s_pos.x, s_pos.y), Vector3(s_pos.x, s_pos.x, s_pos.y), 50, 1 * int, 1 * int)
	end

	return 
end
function PortalLayer:_draw_units_in_no_portal()
	slot3 = self._portal_brush
	slot9 = 0

	self._portal_brush.set_color(slot2, Color(slot5, 0.75, 1, 0))

	slot6 = "Statics"
	slot5 = managers.editor.layer(Color, managers.editor)

	for _, unit in pairs(managers.editor.layer(Color, managers.editor).created_units(Color)) do
		slot8 = unit

		if unit.visible(slot7) then
			slot8 = unit

			if not unit.unit_data(slot7).only_visible_in_editor then
				slot8 = unit

				if not unit.unit_data(slot7).only_exists_in_editor then
					slot9 = unit

					if not managers.portal.unit_in_any_unit_group(slot7, managers.portal) then
						slot9 = unit

						self._portal_brush.unit(slot7, self._portal_brush)
					end
				end
			end
		end
	end

	return 
end
function PortalLayer:_draw_units_in_not_current_portal()
	if not self._current_group then
		return 
	end

	slot3 = self._portal_brush
	slot9 = 1

	self._portal_brush.set_color(slot2, Color(slot5, 0.75, 0, 0))

	slot6 = "Statics"
	slot5 = managers.editor.layer(Color, managers.editor)

	for _, unit in pairs(managers.editor.layer(Color, managers.editor).created_units(Color)) do
		slot8 = unit

		if unit.visible(slot7) then
			slot8 = unit

			if not unit.unit_data(slot7).only_visible_in_editor then
				slot8 = unit

				if not unit.unit_data(slot7).only_exists_in_editor then
					slot9 = unit

					if not self._current_group.unit_in_group(slot7, self._current_group) then
						slot9 = unit

						self._portal_brush.unit(slot7, self._portal_brush)
					end
				end
			end
		end
	end

	return 
end
function PortalLayer:_auto_fill()
	if not self._current_group then
		return 
	end

	slot8 = self._current_group
	slot7 = "YES_NO,ICON_QUESTION"
	slot12 = 0
	local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "Fill group " .. self._current_group.name(slot7) .. " with units?", "Portals", Vector3(slot9, -1, -1))

	if confirm == "NO" then
		return 
	end

	slot7 = "Statics"
	slot6 = managers.editor.layer(slot5, managers.editor)

	for _, unit in pairs(managers.editor.layer(slot5, managers.editor).created_units(slot5)) do
		slot9 = unit

		if unit.visible(slot8) then
			slot9 = unit

			if not unit.unit_data(slot8).only_visible_in_editor then
				slot9 = unit

				if not unit.unit_data(slot8).only_exists_in_editor then
					slot10 = unit

					if not self._current_group.unit_in_group(slot8, self._current_group) then
						slot9 = self._current_group
						slot12 = unit

						if self._current_group.inside(slot8, unit.position(slot11)) then
							slot10 = unit

							self._current_group.add_unit_id(slot8, self._current_group)
						end
					end
				end
			end
		end
	end

	return 
end
function PortalLayer:toggle_portal_system()
	self._use_portal_system = not self._use_portal_system

	if self._use_portal_system then
		CorePortalManager.PortalUnitGroup._change_units_visibility_old = CorePortalManager.PortalUnitGroup._change_units_visibility
		CorePortalManager.PortalUnitGroup._change_units_visibility = CorePortalManager.PortalUnitGroup._change_units_visibility_in_editor
	else
		CorePortalManager.PortalUnitGroup._change_units_visibility = CorePortalManager.PortalUnitGroup._change_units_visibility_old
	end

	slot3 = managers.portal

	managers.portal.pseudo_reset(slot2)

	return 
end
function PortalLayer:build_panel(notebook)
	slot5 = notebook

	PortalLayer.super.build_panel(slot3, self)

	slot7 = ""
	local dont_draw = EWS.CheckBox(slot3, EWS, self._ews_panel, "Don't draw portals")
	slot6 = self._dont_draw

	dont_draw.set_value(EWS, dont_draw)

	slot9 = "EXPAND,TOP,BOTTOM"

	self._sizer.add(EWS, self._sizer, dont_draw, 0, 2)

	slot11 = "cb_toogle"
	slot8 = {
		value = "_dont_draw",
		cb = dont_draw
	}

	dont_draw.connect(EWS, dont_draw, "EVT_COMMAND_CHECKBOX_CLICKED", callback(2, self, self))

	slot8 = ""
	local only_draw_selected = EWS.CheckBox(EWS, EWS, self._ews_panel, "Only draw current")
	slot7 = self._only_draw_selected

	only_draw_selected.set_value(EWS, only_draw_selected)

	slot10 = "EXPAND,TOP,BOTTOM"

	self._sizer.add(EWS, self._sizer, only_draw_selected, 0, 2)

	slot12 = "cb_toogle"

	only_draw_selected.connect(EWS, only_draw_selected, "EVT_COMMAND_CHECKBOX_CLICKED", callback(2, self, self))

	slot12 = "on_only_draw_current"
	slot9 = nil

	only_draw_selected.connect(EWS, only_draw_selected, "EVT_COMMAND_CHECKBOX_CLICKED", callback({
		value = "_only_draw_selected",
		cb = only_draw_selected
	}, self, self))

	slot9 = ""
	local dont_draw_boxes = EWS.CheckBox(EWS, EWS, self._ews_panel, "Don't draw portal shapes")
	slot8 = self._dont_draw_boxes

	dont_draw_boxes.set_value(EWS, dont_draw_boxes)

	slot11 = "EXPAND,TOP,BOTTOM"

	self._sizer.add(EWS, self._sizer, dont_draw_boxes, 0, 2)

	slot13 = "cb_toogle"
	slot10 = {
		value = "_dont_draw_boxes",
		cb = dont_draw_boxes
	}

	dont_draw_boxes.connect(EWS, dont_draw_boxes, "EVT_COMMAND_CHECKBOX_CLICKED", callback(2, self, self))

	slot10 = ""
	local dont_draw_units = EWS.CheckBox(EWS, EWS, self._ews_panel, "Don't draw portal units")
	slot9 = self._dont_draw_units

	dont_draw_units.set_value(EWS, dont_draw_units)

	slot12 = "EXPAND,TOP,BOTTOM"

	self._sizer.add(EWS, self._sizer, dont_draw_units, 0, 2)

	slot14 = "cb_toogle"
	slot11 = {
		value = "_dont_draw_units",
		cb = dont_draw_units
	}

	dont_draw_units.connect(EWS, dont_draw_units, "EVT_COMMAND_CHECKBOX_CLICKED", callback(2, self, self))

	slot11 = ""
	local draw_nonportaled = EWS.CheckBox(EWS, EWS, self._ews_panel, "Draw non-portaled units")
	slot10 = self._draw_units_in_no_portal_state

	draw_nonportaled.set_value(EWS, draw_nonportaled)

	slot13 = "EXPAND,TOP,BOTTOM"

	self._sizer.add(EWS, self._sizer, draw_nonportaled, 0, 2)

	slot15 = "cb_toogle"
	slot12 = {
		value = "_draw_units_in_no_portal_state",
		cb = draw_nonportaled
	}

	draw_nonportaled.connect(EWS, draw_nonportaled, "EVT_COMMAND_CHECKBOX_CLICKED", callback(2, self, self))

	slot12 = ""
	local draw_not_current = EWS.CheckBox(EWS, EWS, self._ews_panel, "Draw units not in current portal")
	slot11 = self._draw_not_current

	draw_not_current.set_value(EWS, draw_not_current)

	slot14 = "EXPAND,TOP,BOTTOM"

	self._sizer.add(EWS, self._sizer, draw_not_current, 0, 2)

	slot16 = "cb_toogle"
	slot13 = {
		value = "_draw_not_current",
		cb = draw_not_current
	}

	draw_not_current.connect(EWS, draw_not_current, "EVT_COMMAND_CHECKBOX_CLICKED", callback(2, self, self))

	slot13 = ""
	local draw_not_current = EWS.CheckBox(EWS, EWS, self._ews_panel, "Activate portal system in editor")
	slot12 = self._use_portal_system

	draw_not_current.set_value(EWS, draw_not_current)

	slot15 = "EXPAND,TOP,BOTTOM"

	self._sizer.add(EWS, self._sizer, draw_not_current, 0, 2)

	slot12 = "EVT_COMMAND_CHECKBOX_CLICKED"
	slot17 = "toggle_portal_system"

	draw_not_current.connect(EWS, draw_not_current, callback(2, self, self))

	slot14 = "TAB_TRAVERSAL"
	self._portal_panel = EWS.Panel(EWS, EWS, self._ews_panel, "")
	slot14 = "Portals"
	local portal_sizer = EWS.StaticBoxSizer(EWS, EWS, self._portal_panel, "VERTICAL")
	slot13 = portal_sizer

	self._portal_panel.set_sizer(EWS, self._portal_panel)

	slot13 = "HORIZONTAL"
	local btn_sizer = EWS.BoxSizer(EWS, EWS)
	slot17 = "BU_EXACTFIT,NO_BORDER"
	local new_btn = EWS.Button(EWS, EWS, self._portal_panel, "Create New", "")
	slot18 = "RIGHT,BOTTOM,TOP,EXPAND"

	btn_sizer.add(EWS, btn_sizer, new_btn, 0, 5)

	slot18 = "BU_EXACTFIT,NO_BORDER"
	local delete_btn = EWS.Button(EWS, EWS, self._portal_panel, "Delete", "")
	slot19 = "RIGHT,BOTTOM,TOP,EXPAND"

	btn_sizer.add(EWS, btn_sizer, delete_btn, 0, 5)

	slot19 = "EXPAND"

	portal_sizer.add(EWS, portal_sizer, btn_sizer, 0, 0)

	slot18 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	local portals = EWS.ListBox(EWS, EWS, self._portal_panel, "portal_layer_portals")
	self._shapes_listbox = portals
	slot17 = portals

	self.update_shapes_listbox(EWS, self)

	slot20 = "EXPAND"

	portal_sizer.add(EWS, portal_sizer, portals, 1, 0)

	slot22 = "select_portal"

	portals.connect(EWS, portals, "EVT_COMMAND_LISTBOX_SELECTED", callback(0, self, self))

	slot22 = "new_portal"

	new_btn.connect(EWS, new_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(portals, self, self))

	slot22 = "delete_portal"
	slot19 = portals

	delete_btn.connect(EWS, delete_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(portals, self, self))

	slot23 = ""
	slot20 = "ALIGN_CENTER_HORIZONTAL"

	portal_sizer.add(EWS, portal_sizer, EWS.StaticText(callback(portals, self, self), EWS, self._portal_panel, "Draw Base", 0), 0, 0)

	slot22 = ""
	local draw_base = EWS.Slider(EWS, EWS, self._portal_panel, 0, -15000, 15000, "")
	slot21 = "EXPAND"

	portal_sizer.add(EWS, portal_sizer, draw_base, 0, 0)

	slot23 = "change_draw_base"

	draw_base.connect(EWS, draw_base, "EVT_SCROLL_CHANGED", callback(0, self, self))

	slot23 = "change_draw_base"
	slot20 = draw_base

	draw_base.connect(EWS, draw_base, "EVT_SCROLL_THUMBTRACK", callback(draw_base, self, self))

	slot20 = "Top/Bottom [m]"
	local spin_sizer = EWS.StaticBoxSizer(EWS, EWS, self._portal_panel, "HORIZONTAL")
	local top_spin = EWS.SpinCtrl(EWS, EWS, self._portal_panel, 0, "")
	slot21 = 500

	top_spin.set_range(EWS, top_spin, -500)

	slot25 = "update_spin"

	top_spin.connect(EWS, top_spin, "EVT_SCROLL_THUMBTRACK", callback("", self, self))

	slot25 = "update_spin"
	slot22 = {
		value = "top",
		spin = top_spin
	}

	top_spin.connect(EWS, top_spin, "EVT_COMMAND_TEXT_UPDATED", callback({
		value = "top",
		spin = top_spin
	}, self, self))

	slot23 = {
		value = "top",
		spin = top_spin
	}
	slot18 = callback(top_spin, self, self, "set_height")
	self._ews_triggers.set_portal_top = slot18
	slot23 = "EXPAND"

	spin_sizer.add(slot18, spin_sizer, top_spin, 1, 0)

	local bottom_spin = EWS.SpinCtrl(slot18, EWS, self._portal_panel, 0, "")
	slot22 = 500

	bottom_spin.set_range(EWS, bottom_spin, -500)

	slot26 = "update_spin"

	bottom_spin.connect(EWS, bottom_spin, "EVT_SCROLL_THUMBTRACK", callback("", self, self))

	slot26 = "update_spin"
	slot23 = {
		value = "bottom",
		spin = bottom_spin
	}

	bottom_spin.connect(EWS, bottom_spin, "EVT_COMMAND_TEXT_UPDATED", callback({
		value = "bottom",
		spin = bottom_spin
	}, self, self))

	slot24 = {
		value = "bottom",
		spin = bottom_spin
	}
	slot19 = callback(bottom_spin, self, self, "set_height")
	self._ews_triggers.set_portal_bottom = slot19
	slot24 = "EXPAND"

	spin_sizer.add(slot19, spin_sizer, bottom_spin, 1, 0)

	slot24 = "EXPAND"

	portal_sizer.add(slot19, portal_sizer, spin_sizer, 0, 0)

	self._ctrlrs = {
		draw_base = draw_base,
		top_spin = {
			value = "top",
			spin = top_spin
		},
		bottom_spin = {
			value = "bottom",
			spin = bottom_spin
		},
		portals = portals
	}

	self._sizer.add(, self._sizer, self._portal_panel, 2, 0)

	slot23 = "Groups"
	self._portal_groups = EWS.StaticBoxSizer(, EWS, self._ews_panel, "VERTICAL")
	slot23 = "TB_FLAT,TB_NODIVIDER"
	self._unit_group_toolbar = EWS.ToolBar(, EWS, self._ews_panel, "")
	slot25 = "world_editor\\new_portal_group.png"

	self._unit_group_toolbar.add_tool(, self._unit_group_toolbar, "CREATE_NEW", "Create new group", CoreEws.image_path("EXPAND"))

	slot27 = "new_group"

	self._unit_group_toolbar.connect(, self._unit_group_toolbar, "CREATE_NEW", "EVT_COMMAND_MENU_SELECTED", callback("Create new group", self, self))

	slot25 = "toolbar\\rename2_16x16.png"

	self._unit_group_toolbar.add_tool(, self._unit_group_toolbar, "RENAME", "Rename group", CoreEws.image_path(nil))

	slot27 = "rename_group"

	self._unit_group_toolbar.connect(, self._unit_group_toolbar, "RENAME", "EVT_COMMAND_MENU_SELECTED", callback("Rename group", self, self))

	slot25 = "toolbar\\delete_16x16.png"

	self._unit_group_toolbar.add_tool(, self._unit_group_toolbar, "DELETE", "Delete group", CoreEws.image_path(nil))

	slot27 = "delete_group"

	self._unit_group_toolbar.connect(, self._unit_group_toolbar, "DELETE", "EVT_COMMAND_MENU_SELECTED", callback("Delete group", self, self))

	slot25 = "world_editor\\unit_by_name_list.png"

	self._unit_group_toolbar.add_tool(, self._unit_group_toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(nil))

	slot27 = "add_unit_list_btn"

	self._unit_group_toolbar.connect(, self._unit_group_toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot25 = "world_editor\\unit_by_name_list.png"

	self._unit_group_toolbar.add_tool(, self._unit_group_toolbar, "REMOVE_UNIT_LIST", "Remove units from unit list", CoreEws.image_path(nil))

	slot27 = "remove_unit_list_btn"

	self._unit_group_toolbar.connect(, self._unit_group_toolbar, "REMOVE_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot25 = "toolbar\\fill_16x16.png"

	self._unit_group_toolbar.add_tool(, self._unit_group_toolbar, "FILL_WITH_UNITS", "Fill portal group with units", CoreEws.image_path(nil))

	slot27 = "_auto_fill"
	slot24 = nil

	self._unit_group_toolbar.connect(, self._unit_group_toolbar, "FILL_WITH_UNITS", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot20 = self._unit_group_toolbar

	self._unit_group_toolbar.realize()

	slot24 = "EXPAND,BOTTOM"

	self._portal_groups.add(, self._portal_groups, self._unit_group_toolbar, 0, 1)

	slot23 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	local groups = EWS.ListBox(, EWS, self._ews_panel, "portal_layer_groups")
	self._groups_listbox = groups
	slot25 = "EXPAND"

	self._portal_groups.add(EWS, self._portal_groups, groups, 1, 0)

	slot27 = "select_group"
	slot24 = groups

	groups.connect(EWS, groups, "EVT_COMMAND_LISTBOX_SELECTED", callback(0, self, self))

	self._ctrlrs.groups = groups
	slot25 = "EXPAND"

	self._sizer.add(EWS, self._sizer, self._portal_groups, 2, 0)

	return self._ews_panel
end
function PortalLayer:on_only_draw_current()
	slot3 = self

	self.set_unit_visible_state(slot2)

	return 
end
function PortalLayer:set_unit_visible_state()
	slot3 = self._portal_shapes

	for n, data in pairs(slot2) do
		slot8 = data.portal

		for _, unit in ipairs(slot7) do
			local visible = not self._only_draw_selected or (self._current_portal and self._current_portal == data.portal)
			slot16 = visible

			managers.editor.set_unit_visible(slot13, managers.editor, unit)
		end
	end

	return 
end
function PortalLayer:change_draw_base(draw_base)
	slot4 = self._ctrlrs.portals
	local i = self._ctrlrs.portals.selected_index(slot3)

	if -1 < i then
		slot6 = i
		local name = self._ctrlrs.portals.get_string(slot4, self._ctrlrs.portals)

		if self._portal_shapes[name] then
			slot7 = draw_base
			self._portal_shapes[name].draw_base = draw_base.get_value(slot6)
		end
	end

	return 
end
function PortalLayer:update_spin(data)
	slot4 = self._ctrlrs.portals
	local i = self._ctrlrs.portals.selected_index(slot3)

	if -1 < i then
		slot6 = i
		local name = self._ctrlrs.portals.get_string(slot4, self._ctrlrs.portals)

		if self._portal_shapes[name] then
			slot8 = data.spin
			self._portal_shapes[name][data.value] = data.spin.get_value(slot7) * 100
		end
	end

	return 
end
function PortalLayer:set_height(data)
	slot4 = self._ctrlrs.portals
	local i = self._ctrlrs.portals.selected_index(slot3)

	if -1 < i then
		slot6 = i
		local name = self._ctrlrs.portals.get_string(slot4, self._ctrlrs.portals)

		if self._portal_shapes[name] then
			slot8 = managers.editor
			local value = math.round(slot5)
			slot8 = value

			data.spin.set_value(managers.editor.camera_position(slot7).z / 100, data.spin)
		end
	end

	return 
end
function PortalLayer:clone()
	slot4 = "Clone not yet supported in Portals layer"

	managers.editor.output(slot2, managers.editor)

	return 
end
function PortalLayer:click_select_unit()
	slot3 = self._ctrl
	slot6 = "add_to_portal_unit_group"

	if self._ctrl.down(slot2, Idstring(slot5)) and self._current_group then
		slot4 = {
			ray_type = "body editor",
			sample = true,
			mask = 1
		}
		local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

		if ray and ray.unit then
			slot5 = ray.unit

			self._current_group.add_unit_id(slot3, self._current_group)
		end

		return 
	end

	slot3 = self

	PortalLayer.super.click_select_unit(slot2)

	return 
end
function PortalLayer:set_select_unit(unit)
	slot4 = self._portal_shapes

	for name, data in pairs(slot3) do
		slot10 = unit

		if table.contains(slot8, data.portal) then
			slot11 = name

			self.set_selection_shapes_listbox(slot8, self, self._shapes_listbox)

			slot9 = self

			self.select_portal(slot8)

			self._current_group = nil
		end
	end

	slot4 = unit

	if alive(slot3) then
		slot4 = unit

		if unit.unit_data(slot3).portal_group_shape then
			slot7 = unit
			slot5 = unit.unit_data(slot6).portal_group_shape
			self._current_group = managers.portal.unit_group_on_shape(slot3, managers.portal)
			slot4 = self
			slot7 = self._current_group

			self.set_selection_groups_listbox(slot3, self._current_group.name(slot6))

			self._current_portal = nil
		end
	end

	slot5 = unit

	PortalLayer.super.set_select_unit(slot3, self)

	return 
end
function PortalLayer:do_spawn_unit(name, pos, rot)
	if name == self._portal_point_unit and not self._current_portal then
		slot7 = "Create or select a portal first!"

		managers.editor.output(slot5, managers.editor)

		return 
	end

	if name == self._portal_shape_unit and not self._current_group then
		slot7 = "Create or select a group first!"

		managers.editor.output(slot5, managers.editor)

		return 
	end

	slot9 = rot
	local unit = PortalLayer.super.do_spawn_unit(slot5, self, name, pos)
	slot7 = unit

	if alive(self) then
		slot8 = self._portal_point_unit

		if unit.name(slot6) == Idstring(unit) then
			slot9 = pos

			self.create_portal_point(slot6, self, unit)
		else
			slot8 = self._portal_shape_unit

			if unit.name(slot6) == Idstring(unit) then
				slot8 = {}
				local shape = self._current_group.add_shape(slot6, self._current_group)
				slot8 = unit
				unit.unit_data(self._current_group).portal_group_shape = shape
				slot8 = unit
				slot9 = unit

				unit.unit_data(self._current_group).portal_group_shape.set_unit(self._current_group, unit.unit_data(self._current_group).portal_group_shape)

				slot8 = unit
				slot10 = self._portal_groups
				self._current_shape_panel = unit.unit_data(self._current_group).portal_group_shape.panel(self._current_group, unit.unit_data(self._current_group).portal_group_shape, self._ews_panel)
				slot8 = self

				self.set_portal_shape_gui(self._current_group)
			end
		end
	end

	return unit
end
function PortalLayer:set_portal_shape_gui()
	if self._current_shape_panel then
		slot3 = self._current_shape_panel

		if self._current_shape_panel.extension(slot2).alive then
			slot4 = false

			self._current_shape_panel.set_visible(slot2, self._current_shape_panel)
		end
	end

	slot3 = self._selected_unit

	if alive(slot2) then
		slot4 = self._portal_shape_unit

		if self._selected_unit.name(slot2) == Idstring(self._selected_unit) then
			slot3 = self._selected_unit
			local shape = self._selected_unit.unit_data(slot2).portal_group_shape

			if shape then
				slot6 = self._portal_groups
				self._current_shape_panel = shape.panel(slot3, shape, self._ews_panel)
				slot5 = true

				self._current_shape_panel.set_visible(slot3, self._current_shape_panel)
			end
		end
	end

	slot3 = self._ews_panel

	self._ews_panel.layout(slot2)

	return 
end
function PortalLayer:create_portal_point(unit, pos)
	slot6 = unit

	table.insert(slot4, self._current_portal)

	return 
end
function PortalLayer:new_portal(portals)
	local name = "portal1"
	local i = 1

	while self._portal_shapes["portal" .. i] do
		i = i + 1
		name = "portal" .. i
	end

	local r = 0.25 + math.rand(slot5)
	local g = 0.25 + math.rand(0.75)
	slot8 = 0.75
	local b = 0.25 + math.rand(0.75)
	self._portal_shapes[name] = {
		draw_base = 0,
		top = 0,
		bottom = 0,
		portal = {},
		r = r,
		g = g,
		b = b
	}
	slot10 = portals

	self.update_shapes_listbox(, self)

	slot11 = name

	self.set_selection_shapes_listbox(, self, portals)

	slot9 = self

	self.select_portal()

	slot9 = self

	self.clear_selected_units()

	return 
end
function PortalLayer:delete_portal(portals)
	slot4 = portals
	local i = portals.selected_index(slot3)

	if i < 0 then
		return 
	end

	slot6 = i
	local name = portals.get_string(slot4, portals)
	local to_delete = CoreTable.clone(portals)
	slot7 = to_delete

	for _, unit in ipairs(self._portal_shapes[name].portal) do
		slot13 = unit

		self.delete_unit(slot11, self)
	end

	slot7 = self._selected_unit

	if not alive(slot6) then
		slot7 = self

		self.clear_selected_units(slot6)
	end

	self._portal_shapes[name] = nil
	slot8 = portals

	self.update_shapes_listbox(nil, self)

	slot7 = self

	self.select_portal(nil)

	slot7 = self

	self.update_unit_settings(nil)

	return 
end
function PortalLayer:update_shapes_listbox(portals)
	slot4 = portals

	portals.clear(slot3)

	slot4 = self._portal_shapes

	for name, _ in pairs(slot3) do
		slot10 = name

		portals.append(slot8, portals)
	end

	return 
end
function PortalLayer:set_selection_shapes_listbox(portals, name)
	slot6 = portals

	for i = 0, portals.nr_items(slot5) - 1, 1 do
		slot10 = i

		if name == portals.get_string(slot8, portals) then
			slot10 = i

			portals.select_index(slot8, portals)
		end
	end

	return 
end
function PortalLayer:select_portal()
	slot3 = self._ctrlrs.portals
	local i = self._ctrlrs.portals.selected_index(slot2)

	if 0 <= i then
		slot5 = i
		local name = self._ctrlrs.portals.get_string(slot3, self._ctrlrs.portals)

		if self._current_shape ~= self._portal_shapes[name] then
			self._current_shape = self._portal_shapes[name]
			self._current_portal = self._portal_shapes[name].portal
			self._current_group = nil
			slot6 = self._portal_shapes[name].top / 100

			self._ctrlrs.top_spin.spin.set_value(slot4, self._ctrlrs.top_spin.spin)

			slot6 = self._portal_shapes[name].bottom / 100

			self._ctrlrs.bottom_spin.spin.set_value(slot4, self._ctrlrs.bottom_spin.spin)

			slot6 = self._portal_shapes[name].draw_base

			self._ctrlrs.draw_base.set_value(slot4, self._ctrlrs.draw_base)

			slot5 = self

			self.clear_selected_units(slot4)
		end
	else
		self._current_shape = nil
		self._current_portal = nil
	end

	slot4 = self

	self.set_unit_visible_state(slot3)

	return 
end
function PortalLayer:select_group()
	slot3 = self._ctrlrs.groups
	local i = self._ctrlrs.groups.selected_index(slot2)

	if -1 < i then
		local name = self._ctrlrs.groups.get_string(slot3, self._ctrlrs.groups)
		slot7 = name

		if self._current_group ~= managers.portal.unit_group(i, managers.portal) then
			slot6 = name
			self._current_group = managers.portal.unit_group(slot4, managers.portal)
			self._current_portal = nil
		end
	else
		self._current_group = nil
	end

	return 
end
function PortalLayer:new_group()
	local name = managers.portal.group_name(slot2)
	slot13 = 0
	slot10 = true
	name = EWS.get_text_from_user(managers.portal, EWS, Global.frame_panel, "Enter name for the new portal group:", "New portal group", name, Vector3(slot10, -1, -1))

	if name and name ~= "" then
		slot5 = name

		if managers.portal.unit_group(slot3, managers.portal) then
			slot4 = self

			self.new_group(slot3)
		else
			slot5 = name
			self._current_group = managers.portal.add_unit_group(slot3, managers.portal)
			self._current_portal = nil
			slot4 = self

			self.update_groups_listbox(slot3)

			slot5 = name

			self.set_selection_groups_listbox(slot3, self)
		end
	end

	return 
end
function PortalLayer:rename_group()
	local groups = self._ctrlrs.groups
	slot4 = groups
	local i = groups.selected_index(slot3)

	if i < 0 then
		return 
	end

	slot6 = i
	local name = groups.get_string(slot4, groups)
	slot15 = 0
	slot12 = true
	local new_name = EWS.get_text_from_user(groups, EWS, Global.frame_panel, "Enter name for the portal group:", "Rename portal group", name, Vector3(slot12, -1, -1))

	if new_name and new_name ~= "" then
		slot8 = new_name

		if managers.portal.unit_group(slot6, managers.portal) then
			slot7 = self

			self.rename_group(slot6)
		else
			slot9 = new_name

			managers.portal.rename_unit_group(slot6, managers.portal, name)

			slot8 = new_name
			self._current_group = managers.portal.unit_group(slot6, managers.portal)
			self._current_portal = nil
			slot7 = self

			self.update_groups_listbox(slot6)

			slot8 = new_name

			self.set_selection_groups_listbox(slot6, self)
		end
	end

	return 
end
function PortalLayer:delete_group()
	local groups = self._ctrlrs.groups
	slot4 = groups
	local i = groups.selected_index(slot3)

	if i < 0 then
		return 
	end

	slot6 = i
	local name = groups.get_string(slot4, groups)
	slot6 = self._selected_unit

	if not alive(groups) then
		slot6 = self

		self.clear_selected_units(slot5)
	end

	slot7 = name
	local group = managers.portal.unit_group(slot5, managers.portal)
	slot11 = group

	for _, shape in ipairs(CoreTable.clone(group.shapes(slot10))) do
		slot14 = shape

		if alive(shape.unit(slot13)) then
			slot12 = self
			slot15 = shape

			self.delete_unit(slot11, shape.unit(slot14))
		end
	end

	slot8 = name

	managers.portal.remove_unit_group(slot6, managers.portal)

	if self._current_group then
		slot7 = self._current_group

		if self._current_group.name(slot6) == name then
			self._current_group = nil
		end
	end

	slot7 = self

	self.update_groups_listbox(slot6)

	slot7 = self

	self.update_unit_settings(slot6)

	return 
end
function PortalLayer:add_unit_list_btn()
	local groups = self._ctrlrs.groups
	slot4 = groups
	local i = groups.selected_index(slot3)

	if i < 0 then
		return 
	end

	slot6 = i
	local name = groups.get_string(slot4, groups)
	local group = managers.portal.unit_group(groups, managers.portal)

	local function f(unit)
		slot3 = unit

		return unit.slot(slot2) == 1
	end

	slot9 = "SelectUnitByNameModal"
	local dialog = rawget(name, _G).new(name, rawget(name, _G), "Add Unit")
	slot11 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot15 = unit

		group.add_unit_id(slot13, group)
	end

	return 
end
function PortalLayer:remove_unit_list_btn()
	local groups = self._ctrlrs.groups
	slot4 = groups
	local i = groups.selected_index(slot3)

	if i < 0 then
		return 
	end

	slot6 = i
	local name = groups.get_string(slot4, groups)
	local group = managers.portal.unit_group(groups, managers.portal)

	local function f(unit)
		slot4 = unit

		return group.ids(slot2)[unit.unit_data(group).unit_id]
	end

	slot9 = "SelectUnitByNameModal"
	local dialog = rawget(name, _G).new(name, rawget(name, _G), "Remove Unit")
	slot11 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot15 = unit

		group.remove_unit_id(slot13, group)
	end

	return 
end
function PortalLayer:update_groups_listbox()
	slot3 = self._ctrlrs.groups

	self._ctrlrs.groups.clear(slot2)

	slot5 = managers.portal

	for name, _ in pairs(managers.portal.unit_groups(slot4)) do
		slot9 = name

		self._ctrlrs.groups.append(slot7, self._ctrlrs.groups)
	end

	return 
end
function PortalLayer:set_selection_groups_listbox(name)
	local groups = self._ctrlrs.groups
	slot6 = groups

	for i = 0, groups.nr_items(slot5) - 1, 1 do
		slot10 = i

		if name == groups.get_string(slot8, groups) then
			slot10 = i

			groups.select_index(slot8, groups)
		end
	end

	return 
end
function PortalLayer:delete_unit(unit)
	slot5 = self._portal_point_unit

	if unit.name(slot3) == Idstring(unit) then
		slot4 = self._portal_shapes

		for name, shape in pairs(slot3) do
			slot10 = unit

			table.delete(slot8, shape.portal)
		end
	end

	slot5 = self._portal_shape_unit

	if unit.name(slot3) == Idstring(unit) then
		slot4 = unit

		if unit.unit_data(slot3).portal_group_shape then
			slot5 = unit.unit_data(slot6).portal_group_shape
			local group = managers.portal.unit_group_on_shape(slot3, managers.portal)
			slot8 = unit
			slot6 = unit.unit_data(unit).portal_group_shape

			group.remove_shape(managers.portal, group)
		end
	end

	slot5 = unit

	PortalLayer.super.delete_unit(slot3, self)

	return 
end
function PortalLayer:calc_mid_point()
	if not self._current_portal then
		return 
	end

	slot3 = self._selected_unit

	if alive(slot2) then
		slot4 = self._portal_point_unit

		if self._selected_unit.name(slot2) == Idstring(self._selected_unit) then
			slot4 = self._selected_unit
			local i = table.get_vector_index(slot2, self._current_portal)

			if i < #self._current_portal then
				slot4 = self._selected_unit
				slot6 = self._selected_unit
				self._mid_pos = self._selected_unit.position(slot3) + (self._current_portal[i + 1].position(i + 1) - self._selected_unit.position(self._current_portal[i + 1])) / 2
			else
				slot6 = self._selected_unit
				self._mid_pos = self._selected_unit.position(slot3) + (self._current_portal[1].position(self._selected_unit) - self._selected_unit.position(self._current_portal[1])) / 2
			end

			slot9 = 1

			Application.draw_sphere(slot3, Application, self._mid_pos, 30, 1, 1)

			slot9 = self._min
			slot10 = 15000
			slot9 = 1

			Application.draw_line(slot3, Application, Vector3(30, self._mid_pos.x, self._mid_pos.y), Vector3(self._mid_pos.x, self._mid_pos.x, self._mid_pos.y), 1, 1)
		end
	end

	return 
end
function PortalLayer:insert()

	-- Decompilation error in this vicinity:
	slot3 = self._selected_unit
	slot4 = self._selected_unit
	local i = table.get_vector_index(slot2, self._current_portal)
	slot6 = self._mid_pos
	self._selected_unit = self.do_spawn_unit(self._current_portal, self, self._portal_point_unit)
	slot4 = self._current_portal

	table.remove(self._current_portal)

	slot6 = self._selected_unit

	table.insert(self._current_portal, self._current_portal, i + 1)

	return 
end
function PortalLayer:replace_unit()
	slot4 = "Can't replace or reload portal units."

	managers.editor.output_error(slot2, managers.editor)

	return 
end
function PortalLayer:update_unit_settings()
	slot3 = self

	PortalLayer.super.update_unit_settings(slot2)

	slot3 = self

	self.set_portal_shape_gui(slot2)

	return 
end
function PortalLayer:clear()
	self._portal_shapes = {}
	slot4 = self._shapes_listbox

	self.update_shapes_listbox(slot2, self)

	slot3 = self

	self.select_portal(slot2)

	slot3 = self

	PortalLayer.super.clear(slot2)

	slot3 = managers.portal

	managers.portal.clear(slot2)

	self._current_group = nil
	slot3 = self

	self.update_groups_listbox(slot2)

	return 
end
function PortalLayer:add_triggers()
	PortalLayer.super.add_triggers(slot2)

	local vc = self._editor_data.virtual_controller
	slot5 = Idstring(slot6)
	slot10 = "insert"

	vc.add_trigger(self, vc, callback("enter", self, self))

	return 
end

return 
