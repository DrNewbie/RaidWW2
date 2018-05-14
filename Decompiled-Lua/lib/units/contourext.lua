-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
ContourExt = ContourExt or class()
local idstr_contour = Idstring(slot1)
local idstr_material = Idstring("contour")
local idstr_contour_color = Idstring("material")
slot5 = "contour_opacity"
local idstr_contour_opacity = Idstring("contour_color")
slot11 = 0
ContourExt._types = {
	teammate = {
		priority = 5,
		ray_check = true,
		off_opacity = 1,
		persistence = 0.3,
		off_color = Vector3(slot8, 0, 0)
	},
	teammate_downed = {
		priority = 4,
		color = tweak_data.contour.character.downed_color
	},
	teammate_downed_selected = {
		priority = 3,
		color = tweak_data.contour.character_interactable.selected_color
	},
	teammate_dead = {
		priority = 4,
		color = tweak_data.contour.character.dead_color
	},
	teammate_cuffed = {
		priority = 4,
		color = tweak_data.contour.character.downed_color
	},
	friendly = {
		priority = 3,
		material_swap_required = true,
		color = tweak_data.contour.character.friendly_color
	},
	drunk_pilot = {
		priority = 5
	},
	boris = {
		priority = 5
	},
	taxman = {
		priority = 5,
		color = tweak_data.contour.character_interactable.standard_color
	},
	mark_unit = {
		priority = 4,
		fadeout = 4.5,
		color = tweak_data.contour.character.dangerous_color
	},
	mark_unit_dangerous = {
		priority = 4,
		fadeout = 9,
		color = tweak_data.contour.character.dangerous_color
	},
	mark_unit_friendly = {
		priority = 3,
		fadeout = 9,
		color = tweak_data.contour.character.friendly_color
	},
	mark_enemy = {
		fadeout = 4.5,
		priority = 5,
		material_swap_required = true,
		fadeout_silent = 13.5,
		color = tweak_data.contour.character.dangerous_color
	},
	mark_enemy_ghost = {
		fadeout = 0,
		priority = 2,
		material_swap_required = true,
		persistence = 0,
		color = tweak_data.contour.character.ghost_warcry
	},
	mark_enemy_sharpshooter = {
		fadeout = 0,
		priority = 0,
		material_swap_required = true,
		persistence = 0,
		color = tweak_data.contour.character.sharpshooter_warcry
	},
	mark_enemy_damage_bonus = {
		fadeout = 4.5,
		priority = 4,
		material_swap_required = true,
		damage_bonus = true,
		fadeout_silent = 13.5,
		color = tweak_data.contour.character.more_dangerous_color
	},
	highlight = {
		priority = 4,
		color = tweak_data.contour.interactable.standard_color
	},
	highlight_character = {
		priority = 6,
		material_swap_required = true,
		color = tweak_data.contour.interactable.standard_color
	},
	generic_interactable = {
		priority = 2,
		material_swap_required = true,
		color = tweak_data.contour.character_interactable.standard_color
	},
	generic_interactable_selected = {
		priority = 1,
		material_swap_required = true,
		color = tweak_data.contour.character_interactable.selected_color
	},
	hostage_trade = {
		priority = 1,
		material_swap_required = true,
		color = tweak_data.contour.character_interactable.standard_color
	},
	deployable_selected = {
		priority = 1,
		unique = true,
		color = tweak_data.contour.deployable.selected_color
	},
	deployable_disabled = {
		priority = 2,
		unique = true,
		color = tweak_data.contour.deployable.disabled_color
	},
	deployable_active = {
		priority = 3,
		unique = true,
		color = tweak_data.contour.deployable.active_color
	},
	deployable_interactable = {
		priority = 4,
		unique = true,
		color = tweak_data.contour.deployable.interact_color
	}
}
ContourExt.indexed_types = {}
slot6 = ContourExt._types

for name, preset in pairs() do
	slot12 = name

	table.insert(slot10, ContourExt.indexed_types)
end

if 32 < #ContourExt.indexed_types then
	slot7 = "[ContourExt] max # contour presets exceeded!"

	Application.error(slot5, Application)
end

ContourExt._MAX_ID = 100000
ContourExt._next_id = 1
function ContourExt:init(unit)
	self._unit = unit
	self._enabled = 1
	slot6 = false

	self._unit.set_extension_update_enabled(slot3, self._unit, idstr_contour)

	slot2 = ContourExt

	if not ContourExt._slotmask_world_geometry then
		slot6 = "world_geometry"
		slot3 = managers.slot.get_mask(slot4, managers.slot)
	end

	slot2._slotmask_world_geometry = slot3

	if self.init_contour then
		self.add(slot3, self, self.init_contour, nil)
	end

	return 
end
function ContourExt:enabled()
	return 0 < self._enabled
end
function ContourExt:add(type, sync, multiplier, damage_multiplier)

	-- Decompilation error in this vicinity:
	if Global.debug_contour_enabled then
		return 
	end

	local data = self._types[type]
	local fadeout = data.fadeout

	if data.fadeout_silent then
		slot9 = self._unit
		slot9 = self._unit.base(slot8)

		if self._unit.base(slot8).char_tweak(slot8).silent_priority_shout then
			fadeout = data.fadeout_silent
		end
	end

	if multiplier and 1 < multiplier then
		fadeout = fadeout * multiplier
	end

	self._contour_list = self._contour_list or {}

	if sync then
		local u_id = self._unit.id(slot8)
		slot10 = managers.network
		slot17 = type
		slot17 = damage_multiplier or 1

		managers.network.session(self._unit).send_to_peers_synched(slot9, managers.network.session(self._unit), "sync_contour_state", self._unit, u_id, table.index_of(slot15, ContourExt.indexed_types), true, multiplier or 1)
	end

	slot9 = self._contour_list

	for _, setup in ipairs(slot8) do
		if setup.type == type then
			if fadeout then
				slot14 = TimerManager
				slot14 = TimerManager.game(slot13)
				setup.fadeout_t = TimerManager.game(slot13).time(slot13) + fadeout
			elseif not self._types[setup.type].unique then
				setup.ref_c = (setup.ref_c or 0) + 1
			end

			return setup
		end
	end

	if damage_multiplier and 1 < damage_multiplier then
		slot9 = self._unit
		slot11 = damage_multiplier

		self._unit.character_damage(slot8).on_marked_state(slot8, self._unit.character_damage(slot8), true)

		self._damage_bonus = true
	end

	local setup = {
		ref_c = 1,
		type = type
	}

	if not self._update_enabled then
		slot12 = self

		self._chk_update_state(slot11)
	end

	return setup
end
function ContourExt:change_color(type, color)
	if not self._contour_list then
		return 
	end

	slot5 = self._contour_list

	for i, setup in ipairs(slot4) do
		if setup.type == type then
			setup.color = color
			slot10 = self

			self._upd_color(slot9)

			break
		end
	end

	return 
end
function ContourExt:_set_color(type, color)
	if not self._contour_list then
		return 
	end

	slot5 = self._contour_list

	for i, setup in ipairs(slot4) do
		if setup.type == type then
			slot10 = self
			self._materials = self._get_materials(slot9)
			slot10 = self._materials

			for _, material in ipairs(slot9) do
				slot15 = material

				if alive(slot14) then
					slot17 = color * self._enabled

					material.set_variable(slot14, material, idstr_contour_color)
				end
			end
		end

		return 
	end

	return 
end
function ContourExt:flash(type_or_id, frequency)
	if not self._contour_list then
		return 
	end

	slot5 = self._contour_list

	for i, setup in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		setup.flash_frequency = (frequency and 0 < frequency and frequency) or nil
		slot10 = TimerManager
		slot10 = TimerManager.game(slot9)
		setup.flash_t = TimerManager.game(slot9).time(slot9) + setup.flash_frequency or nil
		setup.flash_on = nil
		slot10 = self

		self._chk_update_state(slot9)

		break
	end

	return 
end
function ContourExt:is_flashing()
	if not self._contour_list then
		return 
	end

	slot3 = self._contour_list

	for i, setup in ipairs(slot2) do
		if setup.flash_frequency then
			return true
		end
	end

	return 
end
function ContourExt:disable()
	slot3 = self
	self._materials = self._get_materials(slot2)
	self._enabled = 0
	slot3 = self._materials

	for _, material in pairs(slot2) do
		slot8 = material

		if alive(slot7) then
			slot10 = 0

			material.set_variable(slot7, material, idstr_contour_opacity)

			slot9 = idstr_contour_color
			slot14 = 0

			material.set_variable(slot7, material, Vector3(slot11, 0, 0))

			slot11 = "contour_distance"
			slot10 = 0

			material.set_variable(slot7, material, Idstring(Vector3))
		end
	end

	return 
end
function ContourExt:remove(type, sync)
	if not self._contour_list then
		return 
	end

	local contour_list = clone(slot4)
	slot6 = contour_list

	for i, setup in ipairs(self._contour_list) do
		if setup.type == type then
			slot13 = sync

			self._remove(slot10, self, i)

			if self._update_enabled then
				slot11 = self

				self._chk_update_state(slot10)
			end

			return 
		end
	end

	return 
end
function ContourExt:remove_by_id(id, sync)
	if not self._contour_list then
		return 
	end

	slot5 = self._contour_list

	for i, setup in ipairs(slot4) do
		if setup == id then
			slot12 = sync

			self._remove(slot9, self, i)

			if self._update_enabled then
				slot10 = self

				self._chk_update_state(slot9)
			end

			return 
		end
	end

	return 
end
function ContourExt:_clear()
	self._contour_list = nil
	self._materials = nil

	return 
end
function ContourExt:_remove(index, sync)
	local setup = self._contour_list[index]

	if not setup then
		return 
	end

	local contour_type = setup.type
	local data = self._types[setup.type]

	if setup.ref_c and 1 < setup.ref_c then
		setup.ref_c = setup.ref_c - 1

		return 
	end

	if #self._contour_list == 1 then
		slot9 = self._unit

		managers.occlusion.add_occlusion(slot7, managers.occlusion)

		if data.material_swap_required then
			slot8 = self._unit
			slot9 = true

			self._unit.base(slot7).set_material_state(slot7, self._unit.base(slot7))

			slot8 = self._unit
			slot9 = true

			self._unit.base(slot7).set_allow_invisible(slot7, self._unit.base(slot7))
		else
			slot8 = self._materials

			for _, material in ipairs(slot7) do
				slot15 = 0

				material.set_variable(slot12, material, idstr_contour_opacity)
			end
		end

		if self._damage_bonus then
			slot8 = self._unit
			slot9 = false

			self._unit.character_damage(slot7).on_marked_state(slot7, self._unit.character_damage(slot7))

			self._damage_bonus = nil
		end
	end

	self._last_opacity = nil
	slot9 = index

	table.remove(slot7, self._contour_list)

	if #self._contour_list == 0 then
		slot8 = self

		self._clear(slot7)
	elseif index == 1 then
		slot8 = self

		self._apply_top_preset(slot7)
	end

	if sync then
		local u_id = self._unit.id(slot7)
		slot9 = managers.network
		slot16 = contour_type
		slot16 = 1

		managers.network.session(self._unit).send_to_peers_synched(self._unit, managers.network.session(self._unit), "sync_contour_state", self._unit, u_id, table.index_of(slot14, ContourExt.indexed_types), false, 1)
	end

	return 
end
function ContourExt:update(unit, t, dt)
	local index = 1

	while self._contour_list and index <= #self._contour_list do
		local setup = self._contour_list[index]
		local data = self._types[setup.type]
		local is_current = index == 1

		if data.ray_check then
			local turn_on = nil

			if is_current then
				slot11 = managers.viewport
				local cam_pos = managers.viewport.get_current_camera_position(slot10)

				if cam_pos then
					slot12 = cam_pos
					slot15 = unit
					slot15 = unit.movement(slot14)
					turn_on = 16000000 < mvector3.distance_sq(slot11, unit.movement(slot14).m_com(slot14))

					if not turn_on then
						slot16 = unit
						slot16 = unit.movement(slot15)
						slot18 = "report"
						turn_on = unit.raycast(slot11, unit, "ray", unit.movement(slot15).m_com(slot15), cam_pos, "slot_mask", self._slotmask_world_geometry)
					end
				end
			end

			if turn_on then
				slot11 = self

				self._upd_color(slot10)

				slot12 = 1

				self._upd_opacity(slot10, self)

				setup.last_turned_on_t = t
			elseif not setup.last_turned_on_t or data.persistence < t - setup.last_turned_on_t then
				local color = data.off_color or setup.color
				slot14 = color

				self._set_color(slot11, self, setup.type)

				if is_current then
					local op = data.off_opacity or 0
					slot14 = op

					self._upd_opacity(slot12, self)
				end

				setup.last_turned_on_t = nil
			end
		end

		if setup.flash_t and setup.flash_t < t then
			setup.flash_t = t + setup.flash_frequency
			setup.flash_on = not setup.flash_on
			slot11 = (setup.flash_on and 1) or 0

			self._upd_opacity(slot9, self)
		end

		if setup.fadeout_t and setup.fadeout_t < t then
			slot11 = index

			self._remove(slot9, self)

			slot10 = self

			self._chk_update_state(slot9)
		else
			index = index + 1
		end
	end

	return 
end
function ContourExt:_get_materials()
	slot3 = self._unit
	local customization = self._unit.customization(slot2)

	if customization and customization._attached_units then
		local materials = {}
		slot5 = customization._attached_units

		for _, attached_unit in pairs(slot4) do
			slot10 = attached_unit

			if alive(slot9) then
				slot12 = attached_unit

				for _, material in ipairs(attached_unit.materials(slot11)) do
					slot16 = material

					table.insert(slot14, materials)
				end
			end
		end

		return materials
	else
		if not self._materials then
			slot5 = idstr_material
			slot2 = self._unit.get_objects_by_type(slot3, self._unit)
		end

		return slot2
	end

	return 
end
function ContourExt:_upd_opacity(opacity, is_retry)
	if opacity == self._last_opacity then
		return 
	end

	if Global.debug_contour_enabled and opacity == 1 then
		return 
	end

	slot5 = self
	self._materials = self._get_materials(slot4)
	slot5 = self._materials

	for _, material in ipairs(slot4) do
		slot10 = material

		if not alive(slot9) then
			slot10 = self

			self.update_materials(slot9)

			if not is_retry then
				slot12 = true

				self._upd_opacity(slot9, self, opacity)

				self._last_opacity = opacity
			end

			return 
		end

		slot12 = opacity * self._enabled

		material.set_variable(slot9, material, idstr_contour_opacity)
	end

	return 
end
function ContourExt:_upd_color(is_retry)
	local color = self._types[self._contour_list[1].type].color or self._contour_list[1].color

	if not color then
		return 
	end

	slot5 = self
	self._materials = self._get_materials(slot4)
	slot5 = self._materials

	for _, material in ipairs(slot4) do
		slot10 = material

		if not alive(slot9) then
			slot10 = self

			self.update_materials(slot9)

			if not is_retry then
				slot11 = true

				self._upd_color(slot9, self)
			end

			return 
		end

		slot12 = color * self._enabled

		material.set_variable(slot9, material, idstr_contour_color)
	end

	return 
end
function ContourExt:_apply_top_preset()
	local setup = self._contour_list[1]
	local data = self._types[setup.type]
	self._last_opacity = nil

	if data.material_swap_required then
		self._materials = nil
		self._last_opacity = nil
		slot5 = self._unit
		slot5 = self._unit.base(slot4)

		if self._unit.base(slot4).is_in_original_material(slot4) then
			slot5 = self._unit
			slot5 = self._unit.base(slot4)
			slot11 = true

			self._unit.base(slot4).swap_material_config(slot4, callback(slot7, self, ContourExt, "material_applied"))
		else
			slot5 = self

			self.material_applied(slot4)
		end
	else
		slot6 = self._unit

		managers.occlusion.remove_occlusion(slot4, managers.occlusion)

		slot5 = self

		self.material_applied(slot4)
	end

	return 
end
function ContourExt:material_applied()
	if not self._contour_list then
		return 
	end

	local setup = self._contour_list[1]
	local data = self._types[setup.type]
	self._materials = nil
	slot5 = self

	self._upd_color(slot4)

	if not data.ray_check then
		slot6 = 1

		self._upd_opacity(slot4, self)
	end

	return 
end
function ContourExt:_chk_update_state()
	local needs_update = nil

	if self._contour_list then
		slot4 = self._contour_list

		if next(slot3) then
			slot4 = self._contour_list

			for i, setup in ipairs(slot3) do
				if setup.fadeout_t or self._types[setup.type].ray_check or setup.flash_t then
					needs_update = true

					break
				end
			end
		end
	end

	if self._update_enabled ~= needs_update then
		self._update_enabled = needs_update
		slot6 = (needs_update and true) or false

		self._unit.set_extension_update_enabled(slot3, self._unit, idstr_contour)
	end

	return 
end
function ContourExt:update_materials()
	if self._contour_list then
		slot3 = self._contour_list

		if next(slot2) then
			self._materials = nil
			slot3 = self

			self._upd_color(slot2)

			self._last_opacity = nil
			slot4 = 1

			self._upd_opacity(slot2, self)
		end
	end

	return 
end
function ContourExt:save(data)
	if self._contour_list then
		slot4 = self._contour_list

		for _, setup in ipairs(slot3) do
			if setup.type == "highlight_character" and setup.sync then
				data.highlight_character = setup

				return 
			end
		end
	end

	return 
end
function ContourExt:load(data)
	if data and data.highlight_character then
		slot5 = data.highlight_character.type

		self.add(slot3, self)
	end

	return 
end

return 
