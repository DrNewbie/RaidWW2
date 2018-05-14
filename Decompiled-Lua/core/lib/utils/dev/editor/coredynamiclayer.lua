-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreDynamicLayer"

core.module(slot1, core)

slot3 = "CoreLayer"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

if not DynamicLayer then
	slot2 = CoreLayer.Layer
	slot0 = class(slot1)
end

DynamicLayer = slot0
function DynamicLayer:init(owner, save_name, units_vector, slot_mask)
	slot9 = save_name

	DynamicLayer.super.init(slot6, self, owner)

	slot8 = units_vector

	self.load_unit_map_from_vector(slot6, self)

	self._unit_name = ""
	slot8 = slot_mask
	self._slot_mask = managers.slot.get_mask(slot6, managers.slot)
	self._distance = 1000
	self._unit_picked = false

	return 
end
function DynamicLayer:pickup_unit()
	if self._selected_unit and not self._unit_picked then
		slot3 = self._selected_unit
		slot3 = self._selected_unit.rotation(slot2)
		self._up = self._selected_unit.rotation(slot2).z(slot2)
		slot3 = self._selected_unit
		slot3 = self._selected_unit.rotation(slot2)
		self._forward = self._selected_unit.rotation(slot2).y(slot2)
		slot6 = "core/physic_effects/editor_lift"
		slot9 = self._distance
		slot8 = self._forward
		self._lift_effect = World.play_physic_effect(slot2, World, Idstring(slot5), self._selected_unit, self._owner.get_cursor_look_point(slot7, self._owner), self._up)
		self._unit_picked = true
	end

	return 
end
function DynamicLayer:spawn_unit()
	if self._selected_unit and self._unit_picked then
		slot3 = self

		self.release_unit(slot2)
	else
		local pos = self._current_pos
		slot8 = 0
		slot9 = 0
		slot5 = Vector3(1, 0, 1)
		slot10 = 1
		local rot = Rotation(slot3, Vector3(slot5, 1, 0), Vector3(0, 0, 0))
		slot8 = rot

		self.do_spawn_unit(Vector3(slot5, 1, 0), self, self._unit_name, pos)
	end

	return 
end
function DynamicLayer:do_spawn_unit(name, pos, rot)
	slot9 = rot
	local unit = DynamicLayer.super.do_spawn_unit(slot5, self, name, pos)

	if unit then
		slot7 = self
		slot12 = unit
		slot12 = 1500

		self.set_distance(slot6, math.clamp(slot9, unit.bounding_sphere_radius(slot11) * 2, 100))

		slot7 = self

		self.pickup_unit(slot6)
	end

	return unit
end
function DynamicLayer:set_distance(d)
	slot6 = 4000
	self._distance = math.clamp(slot3, d, 100)
	slot5 = self._distance

	self._ews_distance.set_value(slot3, self._ews_distance)

	return 
end
function DynamicLayer:set_select_unit(unit)
	if self._selected_unit and self._selected_unit == unit then
		if not self._unit_picked then
			slot4 = self

			self.pickup_unit(slot3)
		else
			slot4 = self

			self.release_unit(slot3)
		end
	else
		slot4 = self

		self.release_unit(slot3)

		slot5 = unit

		DynamicLayer.super.set_select_unit(slot3, self)
	end

	return 
end
function DynamicLayer:release_unit()
	if self._selected_unit and self._unit_picked then
		slot4 = self._lift_effect

		if World.is_playing_physic_effect(slot2, World) then
			slot4 = self._lift_effect

			World.stop_physic_effect(slot2, World)
		end
	end

	self._unit_picked = false

	return 
end
function DynamicLayer:delete_selected_unit()
	if self._selected_unit then
		slot3 = self

		self.release_unit(slot2)

		slot5 = self._selected_units

		for _, unit in ipairs(CoreTable.clone(slot4)) do
			slot9 = unit

			if table.contains(slot7, self._created_units) then
				slot9 = unit

				self.delete_unit(slot7, self)
			else
				slot12 = unit
				slot15 = unit
				slot9 = "" .. unit.unit_data(slot11).name_id .. " belongs to " .. managers.editor.unit_in_layer_name(slot13, managers.editor) .. " and cannot be deleted from here."

				managers.editor.output_warning(slot7, managers.editor)
			end
		end
	end

	return 
end
function DynamicLayer:update(t, dt)
	slot7 = dt

	DynamicLayer.super.update(slot4, self, t)

	local vc = self._editor_data.virtual_controller
	slot7 = 0
	self._current_pos = self._owner.get_cursor_look_point(self, self._owner)
	slot7 = self._slot_mask
	local ray = self._owner.select_unit_by_raycast(self, self._owner)

	if ray then
		slot12 = 0

		Application.draw_sphere(slot6, Application, ray.position, self._marker_sphere_size, 1, 1)
	end

	if self._selected_units then
		slot7 = self._selected_units

		for _, unit in ipairs(slot6) do
			slot12 = unit

			if alive(slot11) then
				slot16 = 1

				Application.draw(slot11, Application, unit, 1, 1)
			end
		end
	end

	if self._selected_unit then
		slot11 = 0

		Application.draw(slot6, Application, self._selected_unit, 0, 1)

		if self._unit_picked then
			slot7 = vc
			slot10 = "increase_dynamic_distance"

			if vc.down(slot6, Idstring(slot9)) then
				slot8 = self._distance + 300 * dt

				self.set_distance(slot6, self)
			else
				slot7 = vc
				slot10 = "decrease_dynamic_distance"

				if vc.down(slot6, Idstring(slot9)) then
					slot8 = self._distance - 300 * dt

					self.set_distance(slot6, self)
				end
			end

			slot8 = self._distance
			local pos = self._owner.get_cursor_look_point(slot6, self._owner)
			slot11 = pos

			World.set_physic_effect_parameter(self._owner, World, self._lift_effect, 1)

			slot11 = self._up

			World.set_physic_effect_parameter(self._owner, World, self._lift_effect, 2)

			slot11 = self._forward

			World.set_physic_effect_parameter(self._owner, World, self._lift_effect, 3)

			slot10 = 0
			local draw_rot = Rotation(self._owner, 0, 0)
			slot9 = self

			if self.local_rot(0) then
				slot9 = self._selected_unit
				draw_rot = self._selected_unit.rotation(slot8)
			end

			slot12 = self._selected_unit

			Application.draw_rotation(slot8, Application, self._selected_unit.position(slot11))

			slot12 = self._selected_unit
			slot14 = 0
			slot17 = draw_rot

			Application.draw_circle(slot8, Application, self._selected_unit.position(draw_rot), 200, 1, 0, draw_rot.x(slot16))

			slot12 = self._selected_unit
			slot14 = 0
			slot17 = draw_rot

			Application.draw_circle(slot8, Application, self._selected_unit.position(200), 200, 0, 1, draw_rot.y(slot16))

			slot12 = self._selected_unit
			slot14 = 1
			slot17 = draw_rot

			Application.draw_circle(slot8, Application, self._selected_unit.position(200), 200, 0, 0, draw_rot.z(slot16))

			local rot_speed = self.rotation_speed(slot8) * 30 * dt
			slot10 = self

			if self.shift(self) then
				rot_speed = rot_speed / 2
			end

			slot10 = self._selected_unit
			local u_rot = self._selected_unit.rotation(slot9)
			local rot_axis = nil
			slot12 = vc
			slot15 = "roll_left"

			if vc.down(slot11, Idstring(slot14)) then

				-- Decompilation error in this vicinity:
				slot12 = self
			else
				slot12 = vc
				slot15 = "roll_right"

				if vc.down(slot11, Idstring(slot14)) then

					-- Decompilation error in this vicinity:
					slot12 = self
					rot_axis = slot10 * -1
				else
					slot12 = vc
					slot15 = "pitch_right"

					if vc.down(slot11, Idstring(slot14)) then

						-- Decompilation error in this vicinity:
						slot12 = self
					else
						slot12 = vc
						slot15 = "pitch_left"

						if vc.down(slot11, Idstring(slot14)) then

							-- Decompilation error in this vicinity:
							slot12 = self
							rot_axis = slot10 * -1
						else
							slot12 = vc
							slot15 = "yaw_backward"

							if vc.down(slot11, Idstring(slot14)) then

								-- Decompilation error in this vicinity:
								slot12 = self
							else
								slot12 = vc
								slot15 = "yaw_forward"

								if vc.down(slot11, Idstring(slot14)) then

									-- Decompilation error in this vicinity:
									slot12 = self
									rot_axis = slot10 * -1
								end
							end
						end
					end
				end
			end

			if rot_axis then
				slot13 = rot_speed
				local rot = Rotation(slot11, rot_axis) * u_rot
				slot13 = rot
				self._up = rot.z(rot_axis)
				slot13 = rot
				self._forward = rot.y(rot_axis)
			end
		end
	end

	return 
end
function DynamicLayer:build_panel(notebook)
	slot5 = "DynamicLayer:build_panel"

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
	slot7 = "Distance (up/down)"
	local distance_sizer = EWS.StaticBoxSizer(slot3, EWS, self._ews_panel, "VERTICAL")
	slot11 = ""
	self._ews_distance = EWS.Slider(EWS, EWS, self._ews_panel, self._distance, 100, 4000, "_distance")
	slot11 = "update_ews_distance"

	self._ews_distance.connect(EWS, self._ews_distance, "EVT_SCROLL_THUMBTRACK", callback(100, self, self))

	slot11 = "update_ews_distance"
	slot8 = self._ews_distance

	self._ews_distance.connect(EWS, self._ews_distance, "EVT_SCROLL_CHANGED", callback(self._ews_distance, self, self))

	slot9 = "EXPAND"

	distance_sizer.add(EWS, distance_sizer, self._ews_distance, 0, 0)

	slot9 = "EXPAND"

	self._sizer.add(EWS, self._sizer, distance_sizer, 0, 0)

	slot5 = self

	self.build_name_id(EWS)

	slot8 = self
	slot9 = "EXPAND"

	self._sizer.add(EWS, self._sizer, self.build_units(0), 1, 0)

	slot9 = "LEFT,RIGHT,EXPAND"

	self._main_sizer.add(EWS, self._main_sizer, self._sizer, 2, 2)

	return self._ews_panel
end
function DynamicLayer:update_ews_distance(slider)
	slot4 = self
	slot7 = slider

	self.set_distance(slot3, slider.get_value(slot6))

	return 
end
function DynamicLayer:deselect()
	if self._selected_unit then
		slot3 = self

		self.release_unit(slot2)
	end

	slot3 = self

	DynamicLayer.super.deselect(slot2)

	return 
end
function DynamicLayer:get_help(text)
	local t = "\t"
	local n = "\n"
	text = text .. "Select unit:     Click left mouse button" .. n
	text = text .. "                 (A physic selected unit will be released)" .. n
	text = text .. "Pick up unit:    Click left mouse button on an already selected unit" .. n
	text = text .. "Create unit:     Click rigth mouse button" .. n
	text = text .. "                 (A physic selected unit will be released first)" .. n
	text = text .. "Release unit:    Click middle mouse button" .. n
	text = text .. "Remove unit:     Press delete"

	return text
end
function DynamicLayer:add_triggers()
	DynamicLayer.super.add_triggers(slot2)

	local vc = self._editor_data.virtual_controller
	slot5 = Idstring(slot6)
	slot10 = "spawn_unit"

	vc.add_trigger(self, vc, callback("rmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "release_unit"

	vc.add_trigger(self, vc, callback("mmb", self, self))

	slot5 = Idstring(callback)
	slot10 = "delete_selected_unit"

	vc.add_trigger(self, vc, callback("destroy", self, self))

	slot4 = self._ews_triggers

	for k, cb in pairs(self) do
		slot12 = k
		slot11 = cb

		vc.add_trigger(slot8, vc, Idstring(slot11))
	end

	return 
end
function DynamicLayer:deactivate()
	slot3 = self

	DynamicLayer.super.deactivate(slot2)

	slot3 = self

	DynamicLayer.super.deselect(slot2)

	return 
end
function DynamicLayer:clear_triggers()
	slot3 = self._editor_data.virtual_controller

	self._editor_data.virtual_controller.clear_triggers(slot2)

	return 
end

return 
