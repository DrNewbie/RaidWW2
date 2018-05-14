slot3 = "CoreWireLayer"

core.module(slot1, core)

slot3 = "CoreLayer"

core.import(slot1, core)

slot3 = "CoreEditorSave"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

slot3 = "CoreMath"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not WireLayer then
	slot2 = CoreLayer.Layer
	slot0 = class(slot1)
end

WireLayer = slot0
function WireLayer:init(owner, save_name, units_vector, slot_mask)
	slot9 = save_name or "wires"

	WireLayer.super.init(slot6, self, owner)

	slot9 = 0
	self._current_pos = Vector3(slot6, 0, 0)
	self._current_rot = Rotation()
	self._ctrlrs = {}
	self._mid_point_align = 0.5
	slot8 = units_vector or {
		"wire"
	}

	self.load_unit_map_from_vector(slot6, self)

	self._unit_name = ""
	slot7 = "a_target"
	self._target_name = Idstring(slot6)
	slot7 = "a_bender"
	self._middle_name = Idstring(slot6)
	slot8 = slot_mask or "wires"
	self._slot_mask = managers.slot.get_mask(slot6, managers.slot)

	return 
end
function WireLayer:save()
	slot3 = self._created_units

	for _, unit in ipairs(slot2) do
		slot9 = self._target_name
		local target = unit.get_object(slot7, unit)
		local t_pos = math.vector_to_string(target.position(slot10))
		slot10 = target
		local t_rot = target.rotation(target.position)
		local wire_data = {}
		slot12 = target
		wire_data.target_pos = target.position(target)
		slot12 = target
		wire_data.target_rot = target.rotation(target)
		wire_data.slack = unit.wire_data(target).slack
		local t = {
			entry = self._save_name
		}
		slot13 = unit

		if unit.unit_data(unit).continent then
			slot13 = unit
			slot13 = unit.unit_data(slot12).continent
			slot11 = unit.unit_data(slot12).continent.name(slot12)
		end

		t.continent = slot11
		slot14 = unit
		slot12 = CoreEditorSave.save_data_table(slot13)
		t.data = {
			unit_data = slot12,
			wire_data = wire_data
		}
		slot15 = t.data

		self._add_project_unit_save_data(slot12, self, unit)

		slot14 = t

		managers.editor.add_save_data(slot12, managers.editor)

		slot14 = {
			category = "units",
			name = unit.name(slot16).s(slot16),
			continent = unit.unit_data(slot16).continent
		}
		slot17 = unit
		slot17 = unit.name(slot16)
		slot17 = unit

		managers.editor.add_to_world_package(slot12, managers.editor)
	end

	return 
end
function WireLayer:update_unit_settings()
	slot3 = self

	WireLayer.super.update_unit_settings(slot2)

	if self._selected_unit then
		slot6 = self._selected_unit
		slot4 = self._selected_unit.wire_data(slot5).slack

		CoreEws.change_slider_and_number_value(slot2, self._slack_params)
	else
		slot4 = 0

		CoreEws.change_slider_and_number_value(slot2, self._slack_params)
	end

	return 
end
function WireLayer:spawn_unit()
	if self._grab then
		return 
	end

	if not self._creating_wire then
		slot3 = self

		self.clear_selected_units(slot2)

		slot6 = self._current_rot
		local unit = self.do_spawn_unit(slot2, self, self._unit_name, self._current_pos)

		if self._selected_unit then
			self._creating_wire = true
			slot4 = self._selected_unit
			slot5 = self._current_pos

			self._selected_unit.orientation_object(slot3).set_position(slot3, self._selected_unit.orientation_object(slot3))

			slot5 = self._target_name
			slot5 = self._current_pos

			self._selected_unit.get_object(slot3, self._selected_unit).set_position(slot3, self._selected_unit.get_object(slot3, self._selected_unit))

			self._selected_point = nil
		end
	else
		self._creating_wire = false
		slot4 = self._target_name
		self._selected_point = self._selected_unit.get_object(slot2, self._selected_unit)
	end

	return 
end
function WireLayer:set_select_unit(unit)
	slot5 = unit

	WireLayer.super.set_select_unit(slot3, self)

	self._selected_point = nil

	if self._selected_unit then
		slot5 = self._target_name
		self._selected_point = self._selected_unit.get_object(slot3, self._selected_unit)
	end

	return 
end
function WireLayer:delete_selected_unit()
	if self._selected_unit then
		slot5 = self._selected_units

		for _, unit in ipairs(CoreTable.clone(slot4)) do
			slot9 = unit

			self.delete_unit(slot7, self)
		end
	end

	return 
end
function WireLayer:delete_unit(unit)
	slot5 = unit

	WireLayer.super.delete_unit(slot3, self)

	self._creating_wire = nil
	self._selected_point = nil

	return 
end
function WireLayer:grab_point()
	self._grab = true

	return 
end
function WireLayer:release_grab_point()
	self._grab = false

	return 
end
function WireLayer:update(t, dt)
	slot7 = dt

	WireLayer.super.update(slot4, self, t)

	slot6 = self._slot_mask
	local ray = self._owner.select_unit_by_raycast(slot4, self._owner)

	if ray then
		slot11 = 0

		Application.draw_sphere(slot5, Application, ray.position, 50, 1, 1)
	end

	slot7 = 0
	local p1 = self._owner.get_cursor_look_point(slot5, self._owner)
	slot8 = 25000
	local p2 = self._owner.get_cursor_look_point(self._owner, self._owner)
	slot19 = 38
	local ray = World.raycast(self._owner, World, p1, p2, nil, 1, 11, 15, 20, 21, 24, 35)

	if ray then
		self._current_pos = ray.position
		local n = ray.normal
		local u_rot = Rotation()
		local z = n
		slot13 = z
		slot16 = u_rot
		local x = u_rot.x(slot11) - z * z.dot(u_rot, u_rot.x(slot15)).normalized(z * z.dot(u_rot, u_rot.x(slot15)))
		slot14 = x
		local y = z.cross(u_rot.x(slot11) - z * z.dot(u_rot, u_rot.x(slot15)), z)
		slot16 = z
		local rot = Rotation(z, x, y)
		self._current_rot = rot
	end

	slot9 = self._selected_units

	for _, unit in ipairs(slot8) do
		slot14 = unit

		if alive(slot13) then
			slot14 = unit
			slot17 = "co_cable"
			local co = unit.get_object(slot13, Idstring(slot16))

			if co then
				slot19 = 0

				Application.draw(slot14, Application, co, 0, 1)
			end
		end
	end

	slot14 = 0

	Application.draw_sphere(slot8, Application, self._current_pos, 10, 0, 1)

	if self._selected_unit then
		if self._creating_wire or self._grab then
			slot9 = self._current_rot
			slot9 = self._current_rot.y(slot8)
			slot12 = self._selected_unit
			slot12 = self._selected_unit.rotation(slot11)
			local dot = self._current_rot.y(slot8).dot(slot8, self._selected_unit.rotation(slot11).y(slot11))
			dot = (dot - 1) / -2
			slot13 = 0
			self._current_rot = self._current_rot * Rotation(self._selected_unit.rotation(slot11).y, 180 * dot, 0)
		end

		slot13 = self._middle_name
		slot12 = self._selected_unit.get_object(slot11, self._selected_unit)
		slot14 = 1

		Application.draw_sphere(slot8, Application, self._selected_unit.get_object(slot11, self._selected_unit).position(slot11), 15, 0, 0)

		slot9 = self._selected_unit
		slot12 = "co_cable"
		local co = self._selected_unit.get_object(slot8, Idstring(15))

		if co then
			slot14 = 0

			Application.draw(slot9, Application, co, 0, 1)
		end

		if self._creating_wire then
			slot10 = self._selected_unit
			local s_pos = self._selected_unit.orientation_object(slot9).position(slot9)
			slot12 = self._target_name
			slot12 = self._current_pos

			self._selected_unit.get_object(self._selected_unit.orientation_object(slot9), self._selected_unit).set_position(self._selected_unit.orientation_object(slot9), self._selected_unit.get_object(self._selected_unit.orientation_object(slot9), self._selected_unit))

			slot12 = self._target_name
			slot12 = self._current_rot

			self._selected_unit.get_object(self._selected_unit.orientation_object(slot9), self._selected_unit).set_rotation(self._selected_unit.orientation_object(slot9), self._selected_unit.get_object(self._selected_unit.orientation_object(slot9), self._selected_unit))

			slot11 = self._selected_unit

			self._selected_unit.set_moving(self._selected_unit.orientation_object(slot9))

			slot11 = self

			self.set_midpoint(self._selected_unit.orientation_object(slot9))
		end
	end

	if self._selected_point then
		slot12 = self._selected_point
		slot14 = 0

		Application.draw_sphere(slot8, Application, self._selected_point.position(slot11), 25, 1, 1)

		if self._grab then
			slot9 = self._selected_unit
			local s_pos = self._selected_unit.orientation_object(slot8).position(slot8)
			slot11 = self._current_pos

			self._selected_point.set_position(self._selected_unit.orientation_object(slot8), self._selected_point)

			slot11 = self._current_rot

			self._selected_point.set_rotation(self._selected_unit.orientation_object(slot8), self._selected_point)

			slot10 = self._selected_unit

			self._selected_unit.set_moving(self._selected_unit.orientation_object(slot8))

			slot10 = self

			self.set_midpoint(self._selected_unit.orientation_object(slot8))
		end
	end

	slot11 = self._current_rot

	Application.draw_rotation(slot8, Application, self._current_pos)

	return 
end
function WireLayer:build_panel(notebook)
	slot5 = "WireLayer:build_panel"

	cat_print(slot3, "editor")

	self._ews_triggers = {}
	slot7 = "TAB_TRAVERSAL"
	self._ews_panel = EWS.Panel(slot3, EWS, notebook, "")
	slot5 = "HORIZONTAL"
	self._main_sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self._main_sizer

	self._ews_panel.set_sizer(slot3, self._ews_panel)

	slot5 = "VERTICAL"
	self._sizer = EWS.BoxSizer(slot3, EWS)
	slot4 = self

	self.build_name_id(slot3)

	slot7 = self
	slot8 = "EXPAND"

	self._sizer.add(slot3, self._sizer, self.build_units(""), 1, 0)

	slot5 = "VERTICAL"
	local slack_sizer = EWS.BoxSizer(slot3, EWS)

	self._sizer.add(EWS, self._sizer, slack_sizer, 1, 0)

	local slack_params = {
		value = 0,
		name = "Slack:",
		ctrlr_proportions = 4,
		slider_ctrlr_proportions = 3,
		name_proportions = 1,
		number_ctrlr_proportions = 1,
		min = 0,
		floats = 0,
		max = 2500,
		panel = self._ews_panel,
		sizer = slack_sizer
	}
	slot6 = slack_params

	CoreEws.slider_and_number_controller(self._sizer)

	slot12 = "change_slack"

	slack_params.slider_ctrlr.connect(self._sizer, slack_params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback("EXPAND", self, self))

	slot12 = "change_slack"

	slack_params.slider_ctrlr.connect(self._sizer, slack_params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback(nil, self, self))

	slot12 = "change_slack"

	slack_params.number_ctrlr.connect(self._sizer, slack_params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(nil, self, self))

	slot12 = "change_slack"
	slot9 = nil

	slack_params.number_ctrlr.connect(self._sizer, slack_params.number_ctrlr, "EVT_KILL_FOCUS", callback(nil, self, self))

	self._slack_params = slack_params
	slot10 = "EXPAND"

	self._main_sizer.add(self._sizer, self._main_sizer, self._sizer, 1, 0)

	return self._ews_panel
end
function WireLayer:change_slack(wire_slack)
	if self._selected_unit then
		slot4 = self._selected_unit
		self._selected_unit.wire_data(slot3).slack = self._slack_params.value
		slot4 = self._selected_unit

		self._selected_unit.set_moving(self._slack_params.value)

		slot4 = self

		self.set_midpoint(self._slack_params.value)
	end

	return 
end
function WireLayer:set_midpoint()
	if self._selected_unit then
		slot6 = self._selected_unit
		slot6 = self._selected_unit.orientation_object(slot5)
		slot6 = self._middle_name

		CoreMath.wire_set_midpoint(slot2, self._selected_unit, self._selected_unit.orientation_object(slot5).name(slot5), self._target_name)
	end

	return 
end
function WireLayer:deselect()
	slot3 = self

	WireLayer.super.deselect(slot2)

	return 
end
function WireLayer:clear()
	slot3 = self

	WireLayer.super.clear(slot2)

	self._selected_point = nil

	return 
end
function WireLayer:get_help(text)
	local t = "\t"
	local n = "\n"
	text = text .. "Select unit:     Click left mouse button on either attach point" .. n
	text = text .. "Create unit:     Click rigth mouse button (once the spawn, twice to attach target position)" .. n
	text = text .. "Remove unit:     Press delete"

	return text
end
function WireLayer:add_triggers()
	WireLayer.super.add_triggers(slot2)

	local vc = self._editor_data.virtual_controller
	slot5 = Idstring(slot6)
	slot10 = "delete_selected_unit"

	vc.add_trigger(self, vc, callback("destroy", self, self))

	slot5 = Idstring(callback)
	slot10 = "spawn_unit"

	vc.add_trigger(self, vc, callback("rmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "grab_point"

	vc.add_trigger(self, vc, callback("emb", self, self))

	slot5 = Idstring(callback)
	slot10 = "release_grab_point"

	vc.add_release_trigger(self, vc, callback("emb", self, self))

	slot4 = self._ews_triggers

	for k, cb in pairs(self) do
		slot12 = k
		slot11 = cb

		vc.add_trigger(slot8, vc, Idstring(slot11))
	end

	return 
end
function WireLayer:deactivate()
	slot3 = self

	WireLayer.super.deactivate(slot2)

	slot3 = self

	WireLayer.super.deselect(slot2)

	return 
end
function WireLayer:clear_triggers()
	slot3 = self._editor_data.virtual_controller

	self._editor_data.virtual_controller.clear_triggers(slot2)

	return 
end

return 
