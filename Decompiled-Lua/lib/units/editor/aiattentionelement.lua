-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not AIAttentionElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

AIAttentionElement = slot0
function AIAttentionElement:init(unit)
	slot5 = unit

	AIAttentionElement.super.init(slot3, self)

	self._nav_link_filter = {}
	self._nav_link_filter_check_boxes = {}
	self._hed.preset = "none"
	self._hed.local_pos = nil
	self._hed.local_rot = nil
	self._hed.use_instigator = nil
	self._hed.instigator_ids = {}
	self._hed.parent_u_id = nil
	self._hed.parent_obj_name = nil
	self._hed.att_obj_u_id = nil
	self._hed.operation = "set"
	self._hed.override = "none"
	slot5 = "preset"

	table.insert("none", self._save_values)

	slot5 = "local_pos"

	table.insert("none", self._save_values)

	slot5 = "use_instigator"

	table.insert("none", self._save_values)

	slot5 = "instigator_ids"

	table.insert("none", self._save_values)

	slot5 = "parent_u_id"

	table.insert("none", self._save_values)

	slot5 = "parent_obj_name"

	table.insert("none", self._save_values)

	slot5 = "att_obj_u_id"

	table.insert("none", self._save_values)

	slot5 = "operation"

	table.insert("none", self._save_values)

	slot5 = "override"

	table.insert("none", self._save_values)

	self._parent_unit = nil
	self._parent_obj = nil
	self._att_obj_unit = nil

	return 
end
function AIAttentionElement:post_init(...)
	slot3 = self

	AIAttentionElement.super.post_init(slot2, ...)

	return 
end
function AIAttentionElement:save(t)
	slot4 = self._hed.instigator_ids

	if not next(slot3) then
		t.instigator_ids = nil
	end

	return 
end
function AIAttentionElement:layer_finished()
	slot3 = self

	AIAttentionElement.super.layer_finished(slot2)

	if self._hed.parent_u_id then
		slot4 = self._hed.parent_u_id
		slot9 = "load_parent_unit"
		self._parent_unit = managers.worlddefinition.get_unit_on_load(slot2, managers.worlddefinition, callback(slot6, self, self))

		if self._parent_unit then
			slot3 = self._parent_unit
			slot6 = self._hed.parent_obj_name
			self._parent_obj = self._parent_unit.get_object(slot2, Idstring(slot5))
		end
	end

	if self._hed.att_obj_u_id then
		slot4 = self._hed.att_obj_u_id
		slot9 = "load_att_obj_unit"
		self._att_obj_unit = managers.worlddefinition.get_unit_on_load(slot2, managers.worlddefinition, callback(slot6, self, self))
	end

	return 
end
function AIAttentionElement:load_parent_unit(unit)
	self._parent_unit = unit

	if self._parent_unit then
		slot4 = self._parent_unit
		slot7 = self._hed.parent_obj_name
		self._parent_obj = self._parent_unit.get_object(slot3, Idstring(slot6))
	end

	return 
end
function AIAttentionElement:load_att_obj_unit(unit)
	self._att_obj_unit = unit

	return 
end
function AIAttentionElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	AIAttentionElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.instigator_ids

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0,
				b = 0.75,
				r = 0,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot13, self)
		end
	end

	if selected_unit and self._parent_unit ~= selected_unit and self._parent_unit ~= selected_unit and self._unit ~= selected_unit then
		return 
	end

	if self._parent_unit then
		slot8 = {
			g = 0.75,
			b = 0,
			r = 0,
			from_unit = self._unit,
			to_unit = self._parent_unit
		}

		self._draw_link(slot6, self)
	end

	if self._att_obj_unit then
		slot8 = {
			g = 0,
			b = 0.75,
			r = 0,
			from_unit = self._unit,
			to_unit = self._att_obj_unit
		}

		self._draw_link(slot6, self)
	end

	return 
end
function AIAttentionElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self

	self._chk_units_alive(slot6)

	if selected_unit and self._parent_unit ~= selected_unit and self._att_obj_unit ~= selected_unit and self._unit ~= selected_unit then
		return 
	end

	if self._parent_unit then
		slot8 = {
			g = 0.75,
			b = 0,
			r = 0,
			from_unit = self._unit,
			to_unit = self._parent_unit
		}

		self._draw_link(slot6, self)
	end

	if self._att_obj_unit then
		slot8 = {
			g = 0,
			b = 0,
			r = 0.75,
			from_unit = self._unit,
			to_unit = self._att_obj_unit
		}

		self._draw_link(slot6, self)
	end

	slot7 = self._hed.instigator_ids

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		slot14 = {
			g = 0,
			b = 0.75,
			r = 0,
			from_unit = unit,
			to_unit = self._unit
		}

		self._draw_link(slot12, self)
	end

	return 
end
function AIAttentionElement:update_unselected(t, dt, selected_unit, all_units)
	slot7 = self

	self._chk_units_alive(slot6)

	return 
end
function AIAttentionElement:_chk_units_alive()
	if self._parent_unit then
		slot3 = self._parent_unit

		if not alive(slot2) then
			self._parent_unit = nil
			self._parent_obj = nil
			self._hed.parent_obj_name = nil
			self._hed.parent_u_id = nil
			slot3 = self

			self._chk_set_link_values(nil)
		end
	end

	if self._att_obj_unit then
		slot3 = self._att_obj_unit

		if not alive(slot2) then
			self._att_obj_unit = nil
			self._hed.att_obj_u_id = nil
			slot3 = self

			self._chk_set_link_values(nil)
		end
	end

	return 
end
function AIAttentionElement:update_editing()
	slot3 = self

	self._find_parent_raycast(slot2)

	slot3 = self

	self._find_att_obj_raycast(slot2)

	slot3 = self

	self._find_instigator_raycast(slot2)

	slot3 = self

	self._raycast(slot2)

	return 
end
function AIAttentionElement:_find_parent_raycast()
	slot4 = 0
	local from = managers.editor.get_cursor_look_point(slot2, managers.editor)
	slot5 = 100000
	local to = managers.editor.get_cursor_look_point(managers.editor, managers.editor)
	slot8 = nil
	slot12 = "all"
	local ray = World.raycast(managers.editor, World, from, to, managers.slot.get_mask(slot10, managers.slot))

	if not ray then
		return 
	end

	slot6 = ray.unit

	if ray.unit.id(slot5) == -1 then
		return 
	end

	slot10 = 0

	Application.draw(slot5, Application, ray.unit, 0, 1)

	return ray
end
function AIAttentionElement:_find_att_obj_raycast()
	slot4 = {
		mask = 38
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if not ray or not ray.unit then
		return 
	end

	slot8 = 1

	Application.draw(slot3, Application, ray.unit, 0, 0)

	return ray.unit
end
function AIAttentionElement:_find_instigator_raycast()

	-- Decompilation error in this vicinity:
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if not ray or not ray.unit then
		return 
	end

	local id = nil
	slot7 = ray.unit
	slot7 = ray.unit.name(slot6)
	slot8 = true

	return id
end
function AIAttentionElement:_raycast()
	slot4 = 0
	local from = managers.editor.get_cursor_look_point(slot2, managers.editor)
	slot5 = 100000
	local to = managers.editor.get_cursor_look_point(managers.editor, managers.editor)
	slot8 = nil
	slot12 = "all"
	local ray = World.raycast(managers.editor, World, from, to, managers.slot.get_mask(slot10, managers.slot))

	if ray and ray.position then
		slot11 = 1

		Application.draw_sphere(slot5, Application, ray.position, 10, 1, 1)

		return ray.position
	end

	return nil
end
function AIAttentionElement:_lmb()
	slot3 = self
	local unit = self._find_att_obj_raycast(slot2)

	if unit then
		if self._att_obj_unit == unit then
			self._att_obj_unit = nil
			self._hed.att_obj_u_id = nil
		else
			self._att_obj_unit = unit
			slot5 = unit
			self._hed.att_obj_u_id = unit.unit_data(slot4).unit_id
		end

		slot4 = self

		self._chk_set_link_values(slot3)

		return 
	end

	slot4 = self
	local id = SpecialObjectiveUnitElement._spawn_raycast(slot3)

	if id then
		slot5 = self._hed.instigator_ids

		for i, si_id in ipairs(slot4) do
			if si_id == id then
				slot11 = i

				table.remove(slot9, self._hed.instigator_ids)

				return 
			end
		end

		slot6 = id

		table.insert(slot4, self._hed.instigator_ids)

		return 
	end

	slot5 = self
	local ray = self._find_parent_raycast(slot4)

	if ray then
		if self._parent_unit == ray.unit then
			self._parent_unit = nil
			self._parent_obj = nil
			self._hed.parent_obj_name = nil
			self._hed.parent_u_id = nil
		else
			self._parent_unit = ray.unit
			self._parent_obj = ray.body.root_object(slot5)
			slot7 = self._parent_obj
			slot7 = self._parent_obj.name(ray.body)
			self._hed.parent_obj_name = self._parent_obj.name(ray.body).s(ray.body)
			slot7 = ray.unit
			self._hed.parent_u_id = ray.unit.unit_data(ray.body).unit_id
		end

		slot6 = self

		self._chk_set_link_values(slot5)

		return 
	end

	return 
end
function AIAttentionElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "_lmb"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function AIAttentionElement:selected()
	slot3 = self

	AIAttentionElement.super.selected(slot2)

	slot3 = self

	self._chk_units_alive(slot2)

	slot3 = self

	self._chk_set_link_values(slot2)

	return 
end
function AIAttentionElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"ai_spawn_enemy",
		"ai_spawn_civilian",
		"ai_enemy_group",
		"ai_civilian_group"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.instigator_ids)

	slot9 = "use_instigator"

	self._build_value_checkbox(slot5, self, panel, panel_sizer)

	slot13 = tweak_data.attention.indexes
	slot11 = "Select the attention preset."

	self._build_value_combobox(slot5, self, panel, panel_sizer, "preset", table.list_add(slot11, {
		"none"
	}))
	self._build_value_combobox(slot5, self, panel, panel_sizer, "operation", {
		"set",
		"add",
		"override"
	})

	slot13 = tweak_data.attention.indexes
	slot11 = "Select the attention preset to be overriden. (valid only with override operation)"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "override", table.list_add("Select an operation.", {
		"none"
	}))

	return 
end
function AIAttentionElement:add_to_mission_package()
	return 
end
function AIAttentionElement:_chk_set_link_values()
	if self._att_obj_unit and self._parent_unit then
		local att_obj_pos = self._att_obj_unit.position(slot2)
		local att_obj_rot = self._att_obj_unit.rotation(self._att_obj_unit)
		local parent_pos = self._parent_obj.position(self._att_obj_unit)
		local parent_rot = self._parent_obj.rotation(self._parent_obj)
		slot7 = parent_rot
		local parent_inv_rot = parent_rot.inverse(self._parent_obj)
		local world_vec = att_obj_pos - parent_pos
		slot11 = parent_inv_rot
		self._hed.local_pos = world_vec.rotate_with(slot9, world_vec)
	else
		self._hed.local_pos = nil
		self._hed.local_rot = nil
	end

	return 
end

return 
