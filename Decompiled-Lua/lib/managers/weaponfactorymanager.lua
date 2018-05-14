-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "unit"
local ids_unit = Idstring(slot1)
WeaponFactoryManager = WeaponFactoryManager or class()
WeaponFactoryManager._uses_tasks = false
WeaponFactoryManager._uses_streaming = true
function WeaponFactoryManager:init()
	slot3 = self

	self._setup(slot2)

	self._tasks = {}
	slot3 = self
	slot7 = "use_thq_weapon_parts"

	self.set_use_thq_weapon_parts(slot2, managers.user.get_setting(slot5, managers.user))

	return 
end
function WeaponFactoryManager:_setup()
	if not Global.weapon_factory then
		Global.weapon_factory = {}
	end

	self._global = Global.weapon_factory
	Global.weapon_factory.loaded_packages = Global.weapon_factory.loaded_packages or {}
	self._loaded_packages = Global.weapon_factory.loaded_packages
	slot3 = self

	self._read_factory_data(Global.weapon_factory.loaded_packages or )

	return 
end
function WeaponFactoryManager:set_use_thq_weapon_parts(use_thq_weapon_parts)
	self._use_thq_weapon_parts = use_thq_weapon_parts

	return 
end
function WeaponFactoryManager:use_thq_weapon_parts()
	return self._use_thq_weapon_parts
end
function WeaponFactoryManager:update(t, dt)
	if self._active_task then
		slot6 = self._active_task

		if self._update_task(slot4, self) then
			self._active_task = nil
			slot5 = self

			self._check_task(slot4)
		end
	else
		slot5 = self._tasks

		if next(slot4) then
			slot5 = self

			self._check_task(slot4)
		end
	end

	return 
end
function WeaponFactoryManager:_read_factory_data()
	self._parts_by_type = {}
	local weapon_data = tweak_data.weapon
	slot4 = tweak_data.weapon.factory.parts

	for id, data in pairs(slot3) do
		self._parts_by_type[data.type] = self._parts_by_type[data.type] or {}
		self._parts_by_type[data.type][id] = true
	end

	self._parts_by_weapon = {}
	self._part_used_by_weapons = {}
	slot4 = tweak_data.weapon.factory

	for factory_id, data in pairs(slot3) do
		if factory_id ~= "parts" then
			self._parts_by_weapon[factory_id] = self._parts_by_weapon[factory_id] or {}
			slot9 = data.uses_parts

			for _, part_id in ipairs(slot8) do
				local type = tweak_data.weapon.factory.parts[part_id].type
				self._parts_by_weapon[factory_id][type] = self._parts_by_weapon[factory_id][type] or {}
				slot16 = part_id

				table.insert(self._parts_by_weapon[factory_id][type] or , self._parts_by_weapon[factory_id][type])

				slot16 = "_npc"

				if not string.match(slot14, factory_id) then
					slot16 = factory_id

					if weapon_data[self.get_weapon_id_by_factory_id(slot14, self)] then
						self._part_used_by_weapons[part_id] = self._part_used_by_weapons[part_id] or {}
						slot16 = factory_id

						table.insert(self._part_used_by_weapons[part_id] or , self._part_used_by_weapons[part_id])
					end
				end
			end
		end
	end

	return 
end
function WeaponFactoryManager:get_all_weapon_categories()
	local weapon_categories = {}
	local weapon_data = tweak_data.weapon
	local category = nil
	slot6 = tweak_data.weapon.factory

	for factory_id, data in pairs(slot5) do
		if factory_id ~= "parts" then
			slot12 = "_npc"

			if not string.match(slot10, factory_id) then
				slot12 = factory_id

				if weapon_data[self.get_weapon_id_by_factory_id(slot10, self)] then
					slot12 = factory_id
					category = weapon_data[self.get_weapon_id_by_factory_id(slot10, self)].category
					weapon_categories[category] = weapon_categories[category] or {}
					slot12 = factory_id

					table.insert(slot10, weapon_categories[category])
				end
			end
		end
	end

	return weapon_categories
end
function WeaponFactoryManager:get_all_weapon_families()
	local weapon_families = {}
	local weapon_data = tweak_data.weapon
	slot5 = tweak_data.weapon.factory

	for factory_id, data in pairs(slot4) do
		if factory_id ~= "parts" then
			slot11 = "_npc"

			if not string.match(slot9, factory_id) then
				slot11 = factory_id

				if weapon_data[self.get_weapon_id_by_factory_id(slot9, self)] and data.family then
					weapon_families[data.family] = weapon_families[data.family] or {}
					slot11 = factory_id

					table.insert(weapon_families[data.family] or , weapon_families[data.family])
				end
			end
		end
	end

	return weapon_families
end
function WeaponFactoryManager:get_weapons_uses_part(part_id)
	return self._part_used_by_weapons[part_id]
end
function WeaponFactoryManager:get_weapon_id_by_factory_id(factory_id)
	slot5 = factory_id
	local upgrade = managers.upgrades.weapon_upgrade_by_factory_id(slot3, managers.upgrades)

	if not upgrade then
		slot7 = factory_id

		Application.error(slot4, Application, "[WeaponFactoryManager:get_weapon_id_by_factory_id] Found no upgrade for factory id")

		return 
	end

	return upgrade.weapon_id
end
function WeaponFactoryManager:get_weapon_name_by_weapon_id(weapon_id)
	if not tweak_data.weapon[weapon_id] then
		return 
	end

	slot5 = tweak_data.weapon[weapon_id].name_id

	return managers.localization.text(slot3, managers.localization)
end
function WeaponFactoryManager:get_weapon_name_by_factory_id(factory_id)
	slot5 = factory_id
	local upgrade = managers.upgrades.weapon_upgrade_by_factory_id(slot3, managers.upgrades)

	if not upgrade then
		slot7 = factory_id

		Application.error(slot4, Application, "[WeaponFactoryManager:get_weapon_name_by_factory_id] Found no upgrade for factory id")

		return 
	end

	local weapon_id = upgrade.weapon_id
	slot7 = tweak_data.weapon[weapon_id].name_id

	return managers.localization.text(slot5, managers.localization)
end
function WeaponFactoryManager:get_factory_id_by_weapon_id(weapon_id)
	slot5 = weapon_id
	local upgrade = managers.upgrades.weapon_upgrade_by_weapon_id(slot3, managers.upgrades)

	if not upgrade then
		slot7 = weapon_id

		Application.error(slot4, Application, "[WeaponFactoryManager:get_factory_id_by_weapon_id] Found no upgrade for factory id")

		return 
	end

	return upgrade.factory_id
end
function WeaponFactoryManager:get_default_blueprint_by_factory_id(factory_id)
	return (tweak_data.weapon.factory[factory_id] and tweak_data.weapon.factory[factory_id].default_blueprint) or {}
end
function WeaponFactoryManager:create_limited_blueprints(factory_id)
	slot5 = factory_id
	local i_table = self._indexed_parts(slot3, self)
	local all_parts_used_once = {}

	for j = 1, #i_table, 1 do
		slot8 = (j == 1 and 1) or 2

		for k = slot8, #i_table[j].parts, 1 do
			local perm = {}
			local part = i_table[j].parts[k]

			if part ~= "" then
				slot17 = i_table[j].parts[k]

				table.insert(slot15, perm)
			end

			for l = 1, #i_table, 1 do
				if j ~= l then
					local part = i_table[l].parts[1]

					if part ~= "" then
						slot22 = i_table[l].parts[1]

						table.insert(slot20, perm)
					end
				end
			end

			slot17 = perm

			table.insert(slot15, all_parts_used_once)
		end
	end

	slot7 = #all_parts_used_once

	print(slot5, "Limited")

	return all_parts_used_once
end
function WeaponFactoryManager:create_blueprints(factory_id)
	slot5 = factory_id
	local i_table = self._indexed_parts(slot3, self)

	local function dump(i_category, result, new_combination_in)
		slot5 = i_table[i_category].parts

		for i_pryl, pryl_name in ipairs(slot4) do
			slot10 = new_combination_in
			local new_combination = clone(slot9)

			if pryl_name ~= "" then
				slot12 = pryl_name

				table.insert(slot10, new_combination)
			end

			if i_category == #i_table then
				slot12 = new_combination

				table.insert(slot10, result)
			else
				slot13 = new_combination

				dump(slot10, i_category + 1, result)
			end
		end

		return 
	end

	local result = {}
	slot9 = {}

	dump(slot6, 1, result)

	slot8 = #result

	print(slot6, "Combinations")

	return result
end
function WeaponFactoryManager:_indexed_parts(factory_id)
	local i_table = {}
	local all_parts = self._parts_by_weapon[factory_id]
	local optional_types = tweak_data.weapon.factory[factory_id].optional_types or {}
	local num_variations = 1
	local tot_parts = 0
	slot9 = all_parts

	for type, parts in pairs(slot8) do
		slot15 = parts

		print(slot13, type)

		if type ~= "foregrip_ext" and type ~= "stock_adapter" and type ~= "sight_special" and type ~= "extra" then
			slot14 = parts
			parts = clone(slot13)
			slot15 = type

			if table.contains(slot13, optional_types) then
				slot15 = ""

				table.insert(slot13, parts)
			end

			slot15 = {
				i = 1,
				parts = parts,
				amount = #parts
			}

			table.insert(slot13, i_table)

			num_variations = num_variations * #parts
			tot_parts = tot_parts + #parts
		end
	end

	slot12 = tot_parts

	print(slot8, "num_variations", num_variations, "tot_parts")

	return i_table
end
function WeaponFactoryManager:_check_task()
	if not self._active_task and 0 < #self._tasks then
		slot4 = 1
		self._active_task = table.remove(slot2, self._tasks)
		slot3 = self._active_task.p_unit

		if not alive(slot2) then
			self._active_task = nil
			slot3 = self

			self._check_task(slot2)
		end
	end

	return 
end
function WeaponFactoryManager:preload_blueprint(factory_id, blueprint, third_person, done_cb, only_record)
	slot13 = only_record

	return self._preload_blueprint(slot7, self, factory_id, blueprint, third_person, done_cb)
end
function WeaponFactoryManager:_preload_blueprint(factory_id, blueprint, third_person, done_cb, only_record)
	if not done_cb then
		slot14 = blueprint
		slot11 = "blueprint: " .. inspect(slot13)

		Application.error(slot7, Application, "[WeaponFactoryManager] _preload_blueprint(): No done_cb!", "factory_id: " .. factory_id)

		slot8 = Application

		Application.stack_dump(slot7)
	end

	local factory = tweak_data.weapon.factory
	local factory_weapon = factory[factory_id]
	slot12 = blueprint
	local forbidden = self._get_forbidden_parts(slot9, self, factory_id)
	slot18 = only_record

	return self._preload_parts(self, self, factory_id, factory_weapon, blueprint, forbidden, third_person, done_cb)
end
function WeaponFactoryManager:_preload_parts(factory_id, factory_weapon, blueprint, forbidden, third_person, done_cb, only_record)
	local parts = {}
	local need_parent = {}
	slot14 = blueprint
	local override = self._get_override_parts(slot11, self, factory_id)
	local async_task_data = nil

	if not only_record and self._uses_streaming then
		async_task_data = {
			spawn = false,
			third_person = third_person,
			parts = parts,
			done_cb = done_cb,
			blueprint = blueprint
		}
		self._async_load_tasks = self._async_load_tasks or {}
		self._async_load_tasks[async_task_data] = true
	end

	slot14 = blueprint

	for _, part_id in ipairs(slot13) do
		slot29 = only_record

		self._preload_part(slot18, self, factory_id, part_id, forbidden, override, parts, third_person, need_parent, done_cb, async_task_data)
	end

	slot14 = need_parent

	for _, part_id in ipairs(slot13) do
		slot29 = only_record

		self._preload_part(slot18, self, factory_id, part_id, forbidden, override, parts, third_person, need_parent, done_cb, async_task_data)
	end

	if async_task_data then
		async_task_data.all_requests_sent = true
		slot17 = Idstring()

		self.clbk_part_unit_loaded(slot13, self, async_task_data, false, Idstring())
	else
		slot15 = blueprint

		done_cb(slot13, parts)
	end

	return parts, blueprint
end
function WeaponFactoryManager:get_assembled_blueprint(factory_id, blueprint)
	local assembled_blueprint = {}
	local factory = tweak_data.weapon.factory
	slot9 = blueprint
	local forbidden = self._get_forbidden_parts(slot6, self, factory_id)
	slot10 = blueprint
	local override = self._get_override_parts(self, self, factory_id)
	slot9 = blueprint

	for _, part_id in ipairs(self) do
		if not forbidden[part_id] then
			slot17 = override
			local part = self._part_data(slot13, self, part_id, factory_id)
			local original_part = factory.parts[part_id] or part

			if factory[factory_id] and factory[factory_id].adds and factory[factory_id].adds[part_id] then
				slot18 = factory[factory_id].adds[part_id]
				local add_blueprint = self.get_assembled_blueprint(slot15, self, factory_id) or {}
				slot17 = add_blueprint

				for i, d in ipairs(slot16) do
					slot23 = d

					table.insert(slot21, assembled_blueprint)
				end
			end

			if part.adds_type then
				slot16 = part.adds_type

				for _, add_type in ipairs(slot15) do
					if factory[factory_id] then
						local add_id = factory[factory_id][add_type]
						slot23 = add_id

						table.insert(slot21, assembled_blueprint)
					end
				end
			end

			if part.adds then
				slot16 = part.adds

				for _, add_id in ipairs(slot15) do
					slot22 = add_id

					table.insert(slot20, assembled_blueprint)
				end
			end

			slot17 = part_id

			table.insert(slot15, assembled_blueprint)
		end
	end

	return assembled_blueprint
end
function WeaponFactoryManager:_preload_part(factory_id, part_id, forbidden, override, parts, third_person, need_parent, done_cb, async_task_data, only_record)
	if forbidden[part_id] then
		return 
	end

	local factory = tweak_data.weapon.factory
	slot17 = override
	local part = self._part_data(slot13, self, part_id, factory_id)
	local original_part = factory.parts[part_id] or part

	if factory[factory_id].adds and factory[factory_id].adds[part_id] then
		slot16 = factory[factory_id].adds[part_id]

		for _, add_id in ipairs(slot15) do
			slot31 = only_record

			self._preload_part(slot20, self, factory_id, add_id, forbidden, override, parts, third_person, need_parent, done_cb, async_task_data)
		end
	end

	if part.adds_type then
		slot16 = part.adds_type

		for _, add_type in ipairs(slot15) do
			local add_id = factory[factory_id][add_type]
			slot32 = only_record

			self._preload_part(slot21, self, factory_id, add_id, forbidden, override, parts, third_person, need_parent, done_cb, async_task_data)
		end
	end

	if part.adds then
		slot16 = part.adds

		for _, add_id in ipairs(slot15) do
			slot31 = only_record

			self._preload_part(slot20, self, factory_id, add_id, forbidden, override, parts, third_person, need_parent, done_cb, async_task_data)
		end
	end

	if parts[part_id] then
		return 
	end

	if part.parent and not async_task_data then
		slot18 = parts

		if not self.get_part_from_weapon_by_type(slot15, self, part.parent) then
			slot17 = part_id

			table.insert(slot15, need_parent)

			return 
		end
	end

	local unit_name = (third_person and part.third_unit) or part.unit
	slot17 = unit_name
	local ids_unit_name = Idstring(slot16)
	local original_unit_name = (third_person and original_part.third_unit) or original_part.unit
	slot19 = original_unit_name
	local ids_orig_unit_name = Idstring(slot18)
	local package = nil

	if not third_person and ids_unit_name == ids_orig_unit_name and not self._uses_streaming then
		package = "packages/fps_weapon_parts/" .. part_id
		slot22 = Idstring(slot23)
		slot25 = package

		if DB.has(part_id, DB, Idstring("package")) then
			parts[part_id] = {
				package = package
			}
			slot22 = parts[part_id].package

			self.load_package(slot20, self)
		else
			slot22 = part_id

			print(slot20, "[WeaponFactoryManager] Expected weapon part packages for")

			package = nil
		end
	end

	if not package then
		parts[part_id] = {
			name = ids_unit_name,
			is_streaming = (async_task_data and true) or nil
		}

		if not only_record then
			if async_task_data then
				slot24 = managers.dyn_resource.DYN_RESOURCES_PACKAGE
				slot30 = async_task_data

				managers.dyn_resource.load(slot20, managers.dyn_resource, ids_unit, ids_unit_name, callback(slot26, self, self, "clbk_part_unit_loaded"))
			else
				slot21 = managers.dyn_resource
				slot24 = parts[part_id]

				managers.dyn_resource.load(slot20, unpack(slot23))
			end
		end
	end

	return 
end
function WeaponFactoryManager:assemble_default(factory_id, p_unit, third_person, done_cb, skip_queue)
	local blueprint = clone(slot7)
	slot15 = skip_queue

	return self._assemble(tweak_data.weapon.factory[factory_id].default_blueprint, self, factory_id, p_unit, blueprint, third_person, done_cb), blueprint
end
function WeaponFactoryManager:assemble_from_blueprint(factory_id, p_unit, blueprint, third_person, done_cb, skip_queue)
	slot15 = skip_queue

	return self._assemble(slot8, self, factory_id, p_unit, blueprint, third_person, done_cb)
end
function WeaponFactoryManager:assemble_for_visual_only(factory_id, p_unit, blueprint, third_person)
	local factory = tweak_data.weapon.factory
	local factory_weapon = factory[factory_id]
	slot11 = blueprint
	local forbidden = self._get_forbidden_parts(slot8, self, factory_id)
	slot16 = false

	return self._add_parts_for_visual_only(self, self, p_unit, factory_id, factory_weapon, blueprint, forbidden)
end
function WeaponFactoryManager:_add_parts_for_visual_only(p_unit, factory_id, factory_weapon, blueprint, forbidden, third_person)
	self._tasks = self._tasks or {}
	local parts = {}
	local need_parent = {}
	slot13 = blueprint
	local override = self._get_override_parts(slot10, self, factory_id)
	slot12 = blueprint

	for _, part_id in ipairs(self) do
		slot25 = need_parent

		self._add_part_for_visual_only(slot16, self, p_unit, factory_id, part_id, forbidden, override, parts, third_person)
	end

	slot12 = need_parent

	for _, part_id in ipairs(slot11) do
		slot25 = need_parent

		self._add_part_for_visual_only(slot16, self, p_unit, factory_id, part_id, forbidden, override, parts, third_person)
	end

	return parts, blueprint
end
function WeaponFactoryManager:_add_part_for_visual_only(p_unit, factory_id, part_id, forbidden, override, parts, third_person, need_parent)
	if forbidden[part_id] then
		return 
	end

	local factory = tweak_data.weapon.factory
	slot15 = override
	local part = self._part_data(slot11, self, part_id, factory_id)

	if factory[factory_id].adds and factory[factory_id].adds[part_id] then
		slot13 = factory[factory_id].adds[part_id]

		for _, add_id in ipairs(slot12) do
			slot26 = need_parent

			self._add_part_for_visual_only(slot17, self, p_unit, factory_id, add_id, forbidden, override, parts, third_person)
		end
	end

	if part.adds_type then
		slot13 = part.adds_type

		for _, add_type in ipairs(slot12) do
			local add_id = factory[factory_id][add_type]
			slot27 = need_parent

			self._add_part_for_visual_only(slot18, self, p_unit, factory_id, add_id, forbidden, override, parts, third_person)
		end
	end

	if part.adds then
		slot13 = part.adds

		for _, add_id in ipairs(slot12) do
			slot26 = need_parent

			self._add_part_for_visual_only(slot17, self, p_unit, factory_id, add_id, forbidden, override, parts, third_person)
		end
	end

	if parts[part_id] then
		return 
	end

	local link_to_unit = p_unit

	if part.parent then
		slot16 = parts
		local parent_part = self.get_part_from_weapon_by_type(slot13, self, part.parent)

		if parent_part then
			link_to_unit = parent_part.unit
		else
			slot16 = part_id

			table.insert(slot14, need_parent)

			return 
		end
	end

	unit_name = (third_person and part.third_unit) or part.unit
	local ids_unit_name = Idstring(slot14)
	slot20 = false

	managers.dyn_resource.load(unit_name, managers.dyn_resource, ids_unit, ids_unit_name, "packages/dyn_resources")

	slot20 = link_to_unit
	slot18 = link_to_unit.get_object(part.unit, Idstring(slot22)).position(part.unit)
	slot21 = link_to_unit
	slot24 = part.a_obj
	slot21 = link_to_unit.get_object(link_to_unit.get_object(part.unit, Idstring(slot22)), Idstring(part.a_obj))
	local unit = World.spawn_unit(unit_name, World, Idstring(ids_unit_name), link_to_unit.get_object(link_to_unit.get_object(part.unit, Idstring(slot22)), Idstring(part.a_obj)).rotation(link_to_unit.get_object(part.unit, Idstring(slot22))))
	parts[part_id] = {
		unit = unit
	}

	return 
end
function WeaponFactoryManager:_assemble(factory_id, p_unit, blueprint, third_person, done_cb, skip_queue)
	if not done_cb then
		slot10 = "-----------------------------"

		Application.error(slot8, Application)

		slot9 = Application

		Application.stack_dump(slot8)
	end

	local factory = tweak_data.weapon.factory
	local factory_weapon = factory[factory_id]
	slot13 = blueprint
	local forbidden = self._get_forbidden_parts(slot10, self, factory_id)
	slot20 = skip_queue

	return self._add_parts(self, self, p_unit, factory_id, factory_weapon, blueprint, forbidden, third_person, done_cb)
end
function WeaponFactoryManager:_get_forbidden_parts(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local forbidden = {}
	slot9 = blueprint
	local override = self._get_override_parts(slot6, self, factory_id)
	slot8 = blueprint

	for _, part_id in ipairs(self) do
		slot16 = override
		local part = self._part_data(slot12, self, part_id, factory_id)

		if part.depends_on then
			local part_forbidden = true
			slot15 = blueprint

			for _, other_part_id in ipairs(slot14) do
				slot23 = override
				local other_part = self._part_data(slot19, self, other_part_id, factory_id)

				if part.depends_on == other_part.type then
					part_forbidden = false

					break
				end
			end

			if part_forbidden then
				forbidden[part_id] = part.depends_on
			end
		end

		if part.forbids then
			slot14 = part.forbids

			for _, forbidden_id in ipairs(slot13) do
				forbidden[forbidden_id] = part_id
			end
		end

		if part.adds then
			slot16 = part.adds
			local add_forbidden = self._get_forbidden_parts(slot13, self, factory_id)
			slot15 = add_forbidden

			for forbidden_id, part_id in pairs(self) do
				forbidden[forbidden_id] = part_id
			end
		end
	end

	return forbidden
end
function WeaponFactoryManager:_get_override_parts(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local overridden = {}
	local override_override = {}
	slot8 = blueprint

	for _, part_id in ipairs(slot7) do
		slot15 = factory_id
		local part = self._part_data(slot12, self, part_id)

		if part.override then
			slot14 = part.override

			for override_id, override_data in pairs(slot13) do
				if override_data.override then
					override_override[override_id] = override_data
				end
			end
		end
	end

	slot8 = blueprint

	for _, part_id in ipairs(slot7) do
		slot16 = override_override
		local part = self._part_data(slot12, self, part_id, factory_id)

		if part.override then
			slot14 = part.override

			for override_id, override_data in pairs(slot13) do
				overridden[override_id] = override_data
			end
		end
	end

	return overridden
end
function WeaponFactoryManager:_update_task(task)
	slot4 = task.p_unit

	if not alive(slot3) then
		return true
	end

	if task.blueprint_i <= #task.blueprint then
		local part_id = task.blueprint[task.blueprint_i]
		slot13 = task.need_parent

		self._add_part(slot4, self, task.p_unit, task.factory_id, part_id, task.forbidden, task.override, task.parts, task.third_person)

		task.blueprint_i = task.blueprint_i + 1

		return 
	end

	if task.need_parent_i <= #task.need_parent then
		local part_id = task.need_parent[task.need_parent_i]
		slot13 = task.need_parent

		self._add_part(slot4, self, task.p_unit, task.factory_id, part_id, task.forbidden, task.override, task.parts, task.third_person)

		task.need_parent_i = task.need_parent_i + 1

		return 
	end

	slot4 = "WeaponFactoryManager:_update_task done"

	print(slot3)

	slot5 = task.blueprint

	task.done_cb(slot3, task.parts)

	return true
end
function WeaponFactoryManager:_add_parts(p_unit, factory_id, factory_weapon, blueprint, forbidden, third_person, done_cb, skip_queue)
	self._tasks = self._tasks or {}
	local parts = {}
	local need_parent = {}
	slot15 = blueprint
	local override = self._get_override_parts(slot12, self, factory_id)

	if self._uses_tasks and not skip_queue then
		slot15 = {
			need_parent_i = 1,
			blueprint_i = 1,
			done_cb = done_cb,
			p_unit = p_unit,
			factory_id = factory_id,
			blueprint = blueprint,
			forbidden = forbidden,
			third_person = third_person,
			parts = parts,
			need_parent = need_parent,
			override = override
		}

		table.insert(slot13, self._tasks)
	else
		local async_task_data = nil

		if self._uses_streaming then
			async_task_data = {
				spawn = true,
				third_person = third_person,
				parts = parts,
				done_cb = done_cb,
				blueprint = blueprint
			}
			self._async_load_tasks = self._async_load_tasks or {}
			self._async_load_tasks[async_task_data] = true
		end

		slot15 = blueprint

		for _, part_id in ipairs(slot14) do
			slot29 = async_task_data

			self._add_part(slot19, self, p_unit, factory_id, part_id, forbidden, override, parts, third_person, need_parent)
		end

		slot15 = need_parent

		for _, part_id in ipairs(slot14) do
			slot29 = async_task_data

			self._add_part(slot19, self, p_unit, factory_id, part_id, forbidden, override, parts, third_person, need_parent)
		end

		if async_task_data then
			async_task_data.all_requests_sent = true
			slot18 = Idstring()

			self.clbk_part_unit_loaded(slot14, self, async_task_data, false, Idstring())
		else
			slot16 = blueprint

			done_cb(slot14, parts)
		end
	end

	return parts, blueprint
end
function WeaponFactoryManager:_part_data(part_id, factory_id, override)
	local factory = tweak_data.weapon.factory

	if not factory.parts[part_id] then
		slot11 = factory_id

		Application.error(slot6, Application, "[WeaponFactoryManager:_part_data] Part do not exist!", part_id, "factory_id")

		return 
	end

	slot7 = factory.parts[part_id]
	local part = deep_clone(slot6)

	if factory[factory_id] and factory[factory_id].override and factory[factory_id].override[part_id] then
		slot8 = factory[factory_id].override[part_id]

		for d, v in pairs(slot7) do

			-- Decompilation error in this vicinity:
			slot13 = v
			slot13 = v
			part[d] = deep_clone(slot12) or v
		end
	end

	if override and override[part_id] then
		slot8 = override[part_id]

		for d, v in pairs(slot7) do

			-- Decompilation error in this vicinity:
			slot13 = v
			slot13 = v
			part[d] = deep_clone(slot12) or v
		end
	end

	return part
end
function WeaponFactoryManager:_add_part(p_unit, factory_id, part_id, forbidden, override, parts, third_person, need_parent, async_task_data)
	if forbidden[part_id] then
		return 
	end

	local factory = tweak_data.weapon.factory
	slot16 = override
	local part = self._part_data(slot12, self, part_id, factory_id)

	if factory[factory_id].adds and factory[factory_id].adds[part_id] then
		slot14 = factory[factory_id].adds[part_id]

		for _, add_id in ipairs(slot13) do
			slot28 = async_task_data

			self._add_part(slot18, self, p_unit, factory_id, add_id, forbidden, override, parts, third_person, need_parent)
		end
	end

	if part.adds_type then
		slot14 = part.adds_type

		for _, add_type in ipairs(slot13) do
			local add_id = factory[factory_id][add_type]
			slot29 = async_task_data

			self._add_part(slot19, self, p_unit, factory_id, add_id, forbidden, override, parts, third_person, need_parent)
		end
	end

	if part.adds then
		slot14 = part.adds

		for _, add_id in ipairs(slot13) do
			slot28 = async_task_data

			self._add_part(slot18, self, p_unit, factory_id, add_id, forbidden, override, parts, third_person, need_parent)
		end
	end

	if parts[part_id] then
		return 
	end

	local link_to_unit = p_unit

	if async_task_data then
		if part.parent then
			link_to_unit = nil
		end
	elseif part.parent then
		slot17 = parts
		local parent_part = self.get_part_from_weapon_by_type(slot14, self, part.parent)

		if parent_part then
			link_to_unit = parent_part.unit
		else
			slot17 = part_id

			table.insert(slot15, need_parent)

			return 
		end
	end

	unit_name = (third_person and part.third_unit) or part.unit
	slot16 = unit_name
	local ids_unit_name = Idstring(slot15)
	local package = nil

	if not third_person and not async_task_data then
		slot23 = "unit"
		local tweak_unit_name = tweak_data.get_raw_value(slot17, tweak_data, "weapon", "factory", "parts", part_id)

		if tweak_unit_name then
			slot19 = tweak_unit_name
			local ids_tweak_unit_name = Idstring(slot18)
		end

		if ids_tweak_unit_name and ids_tweak_unit_name == ids_unit_name then
			package = "packages/fps_weapon_parts/" .. part_id
			slot21 = Idstring(slot22)
			slot24 = package

			if DB.has(part_id, DB, Idstring("package")) then
				slot20 = "HAS PART AS PACKAGE"

				print(slot19)

				slot21 = package

				self.load_package(slot19, self)
			else
				slot21 = part_id

				print(slot19, "[WeaponFactoryManager] Expected weapon part packages for")

				package = nil
			end
		end
	end

	if async_task_data then
		slot19 = part.a_obj
		parts[part_id] = {
			is_streaming = true,
			animations = part.animations,
			name = ids_unit_name,
			link_to_unit = link_to_unit,
			a_obj = Idstring(slot18),
			parent = part.parent
		}
		slot21 = "packages/dyn_resources"
		slot27 = async_task_data

		managers.dyn_resource.load(part.parent, managers.dyn_resource, ids_unit, ids_unit_name, callback(slot23, self, self, "clbk_part_unit_loaded"))
	else
		if not package then
			slot22 = false

			managers.dyn_resource.load(slot17, managers.dyn_resource, ids_unit, ids_unit_name, "packages/dyn_resources")
		end

		slot22 = part.a_obj
		slot22 = link_to_unit
		local unit = self._spawn_and_link_unit(slot17, self, ids_unit_name, Idstring(slot21), third_person)
		parts[part_id] = {
			unit = unit,
			animations = part.animations,
			name = ids_unit_name,
			package = package
		}
	end

	return 
end
function WeaponFactoryManager:clbk_part_unit_loaded(task_data, status, u_type, u_name)
	if not self._async_load_tasks[task_data] then
		return 
	end

	if task_data.spawn then
		local function _spawn(part)
			slot7 = part.link_to_unit
			local unit = self._spawn_and_link_unit(slot2, self, part.name, part.a_obj, task_data.third_person)
			slot5 = false

			unit.set_enabled(self, unit)

			part.unit = unit
			part.a_obj = nil
			part.link_to_unit = nil

			return 
		end

		slot8 = task_data.parts

		for part_id, part in pairs(slot7) do
			if part.name == u_name and part.is_streaming then
				part.is_streaming = nil

				if part.link_to_unit then
					slot13 = part

					_spawn(slot12)
				else
					slot15 = task_data.parts
					local parent_part = self.get_part_from_weapon_by_type(slot12, self, part.parent)

					if parent_part and parent_part.unit then
						part.link_to_unit = parent_part.unit
						slot14 = part

						_spawn(slot13)
					end
				end
			end
		end

		repeat
			local re_iterate = nil
			slot9 = task_data.parts

			for part_id, part in pairs(slot8) do
				if not part.unit and not part.is_streaming then
					slot16 = task_data.parts
					local parent_part = self.get_part_from_weapon_by_type(slot13, self, part.parent)

					if parent_part and parent_part.unit then
						part.link_to_unit = parent_part.unit
						slot15 = part

						_spawn(slot14)

						re_iterate = true
					end
				end
			end
		until not re_iterate
	else
		slot7 = task_data.parts

		for part_id, part in pairs(slot6) do
			if part.name == u_name and part.is_streaming then
				part.is_streaming = nil
			end
		end
	end

	if not task_data.all_requests_sent then
		return 
	end

	slot7 = task_data.parts

	for part_id, part in pairs(slot6) do
		if part.is_streaming or (task_data.spawn and not part.unit) then
			return 
		end
	end

	slot7 = task_data.parts

	for part_id, part in pairs(slot6) do
		slot12 = part.unit

		if alive(slot11) then
			slot13 = true

			part.unit.set_enabled(slot11, part.unit)
		end
	end

	self._async_load_tasks[task_data] = nil

	if not task_data.done_cb then
		return 
	end

	slot8 = task_data.blueprint

	task_data.done_cb(slot6, task_data.parts)

	return 
end
function WeaponFactoryManager:_spawn_and_link_unit(u_name, a_obj, third_person, link_to_unit)
	slot9 = Vector3()
	local unit = World.spawn_unit(slot6, World, u_name, Rotation())
	slot10 = unit
	slot13 = unit
	slot13 = unit.orientation_object(slot12)
	local res = link_to_unit.link(World, link_to_unit, a_obj, unit.orientation_object(slot12).name(slot12))

	if managers.occlusion and not third_person then
		slot10 = unit

		managers.occlusion.remove_occlusion(slot8, managers.occlusion)
	end

	return unit
end
function WeaponFactoryManager:load_package(package)
	slot5 = package

	print(slot3, "WeaponFactoryManager:_load_package")

	if not self._loaded_packages[package] then
		slot5 = package

		print(slot3, "  Load for real")

		slot5 = package

		PackageManager.load(slot3, PackageManager)

		self._loaded_packages[package] = 1
	else
		self._loaded_packages[package] = self._loaded_packages[package] + 1
	end

	return 
end
function WeaponFactoryManager:unload_package(package)
	slot5 = package

	print(slot3, "WeaponFactoryManager:_unload_package")

	if not self._loaded_packages[package] then
		slot5 = "Trying to unload package that wasn't loaded"

		Application.error(slot3, Application)

		return 
	end

	self._loaded_packages[package] = self._loaded_packages[package] - 1

	if self._loaded_packages[package] <= 0 then
		slot5 = package

		print(slot3, "  Unload for real")

		slot5 = package

		PackageManager.unload(slot3, PackageManager)

		self._loaded_packages[package] = nil
	end

	return 
end
function WeaponFactoryManager:get_parts_from_weapon_by_type_or_perk(type_or_perk, factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local type_parts = {}
	slot12 = blueprint

	for _, id in ipairs(self.get_assembled_blueprint(slot9, self, factory_id)) do
		slot15 = factory_id
		local part = self._part_data(slot12, self, id)

		if part.type ~= type_or_perk and part.perks then
			slot15 = type_or_perk

			if table.contains(slot13, part.perks) then
				slot15 = id

				table.insert(slot13, type_parts)
			end
		end
	end

	return type_parts
end
function WeaponFactoryManager:get_parts_from_weapon_by_perk(perk, parts)
	local factory = tweak_data.weapon.factory
	local type_parts = {}
	slot7 = parts

	for id, data in pairs(slot6) do
		local perks = factory.parts[id].perks

		if perks then
			slot14 = perk

			if table.contains(slot12, perks) then
				slot14 = parts[id]

				table.insert(slot12, type_parts)
			end
		end
	end

	return type_parts
end
function WeaponFactoryManager:get_custom_stats_from_part_id(part_id)
	local factory = tweak_data.weapon.factory.parts

	return (factory[part_id] and factory[part_id].custom_stats) or false
end
function WeaponFactoryManager:get_custom_stats_from_weapon(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local t = {}
	slot11 = blueprint

	for _, id in ipairs(self.get_assembled_blueprint(slot8, self, factory_id)) do
		slot14 = factory_id
		local part = self._part_data(slot11, self, id)

		if part.custom_stats then
			t[id] = part.custom_stats
		end
	end

	return t
end
function WeaponFactoryManager:get_ammo_data_from_weapon(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local t = {}
	slot11 = blueprint

	for _, id in ipairs(self.get_assembled_blueprint(slot8, self, factory_id)) do
		if factory.parts[id].type == "ammo" then
			slot14 = factory_id
			local part = self._part_data(slot11, self, id)
			t = part.custom_stats
		end
	end

	return t
end
function WeaponFactoryManager:get_part_id_from_weapon_by_type(type, blueprint)
	local factory = tweak_data.weapon.factory
	slot6 = blueprint

	for _, part_id in pairs(slot5) do
		if factory.parts[part_id].type == type then
			return part_id
		end
	end

	return false
end
function WeaponFactoryManager:get_part_from_weapon_by_type(type, parts)
	local factory = tweak_data.weapon.factory
	slot6 = parts

	for id, data in pairs(slot5) do
		if factory.parts[id].type == type then
			return parts[id]
		end
	end

	return false
end
function WeaponFactoryManager:get_part_data_type_from_weapon_by_type(type, data_type, parts)
	local factory = tweak_data.weapon.factory
	slot7 = parts

	for id, data in pairs(slot6) do
		if factory.parts[id].type == type then
			return factory.parts[id][data_type]
		end
	end

	return false
end
function WeaponFactoryManager:is_weapon_unmodded(factory_id, blueprint)
	local weapon_tweak = tweak_data.weapon.factory[factory_id]
	local blueprint_map = {}
	slot7 = blueprint

	for _, part in ipairs(slot6) do
		blueprint_map[part] = true
	end

	slot7 = weapon_tweak.default_blueprint

	for _, part in ipairs(slot6) do
		if not blueprint_map[part] then
			return false
		end

		blueprint_map[part] = nil
	end

	slot7 = blueprint_map

	return table.size(slot6) == 0
end
function WeaponFactoryManager:has_weapon_more_than_default_parts(factory_id)
	local weapon_tweak = tweak_data.weapon.factory[factory_id]

	return #weapon_tweak.default_blueprint < #weapon_tweak.uses_parts
end
function WeaponFactoryManager:get_parts_from_factory_id(factory_id)
	return self._parts_by_weapon[factory_id]
end
function WeaponFactoryManager:get_parts_from_weapon_id(weapon_id)
	slot5 = weapon_id
	local factory_id = self.get_factory_id_by_weapon_id(slot3, self)

	return self._parts_by_weapon[factory_id]
end
function WeaponFactoryManager:is_part_standard_issue(factory_id, part_id)
	local weapon_factory_tweak_data = tweak_data.weapon.factory[factory_id]
	local part_tweak_data = tweak_data.weapon.factory.parts[part_id]

	if not part_tweak_data then
		slot9 = part_id

		Application.error(slot6, Application, "[WeaponFactoryManager:is_part_standard_issue] Found no part with part id")

		return false
	end

	if not weapon_factory_tweak_data then
		slot9 = factory_id

		Application.error(slot6, Application, "[WeaponFactoryManager:is_part_standard_issue] Found no weapon with factory id")

		return false
	end

	slot8 = part_id

	return table.contains(slot6, weapon_factory_tweak_data.default_blueprint or {})
end
function WeaponFactoryManager:is_part_standard_issue_by_weapon_id(weapon_id, part_id)
	slot9 = weapon_id

	return self.is_part_standard_issue(slot4, self, self.get_factory_id_by_weapon_id(part_id, self))
end
function WeaponFactoryManager:get_part_desc_by_part_id_from_weapon(part_id, factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	slot9 = blueprint
	local override = self._get_override_parts(slot6, self, factory_id)
	slot11 = override
	local part = self._part_data(self, self, part_id, factory_id)
	local desc_id = part.desc_id or tweak_data.blackmarket.weapon_mods[part_id].desc_id
	local params = {}
	slot13 = true
	params.BTN_GADGET = managers.localization.btn_macro(slot10, managers.localization, "weapon_gadget")
	slot13 = true
	params.BTN_BIPOD = managers.localization.btn_macro(slot10, managers.localization, "deploy_bipod")
	slot11 = managers.menu

	if managers.menu.is_pc_controller(slot10) then
		slot12 = desc_id .. "_pc"
	else
		slot12 = desc_id

		if managers.localization.exists(slot10, managers.localization) then
			slot13 = params

			return managers.localization.text(slot10, managers.localization, desc_id)
		end
	end

	slot11 = Application

	return (Application.production_build(slot10) and "Add ##desc_id## to ##" .. part_id .. "## in tweak_data.blackmarket.weapon_mods") or ""
end
function WeaponFactoryManager:get_part_data_by_part_id_from_weapon(part_id, factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	slot9 = blueprint
	local override = self._get_override_parts(slot6, self, factory_id)
	slot11 = override

	return self._part_data(self, self, part_id, factory_id)
end
function WeaponFactoryManager:get_part_name_by_part_id_from_weapon(part_id, factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	slot9 = blueprint
	local forbidden = self._get_forbidden_parts(slot6, self, factory_id)
	slot10 = blueprint
	local override = self._get_override_parts(self, self, factory_id)

	if not forbidden[part_id] then
		slot12 = override
		local part = self._part_data(slot8, self, part_id, factory_id)
		local name_id = part.name_id
		slot12 = name_id

		return managers.localization.text(part_id, managers.localization)
	end

	return 
end
function WeaponFactoryManager:get_part_desc_by_part_id(part_id)

	-- Decompilation error in this vicinity:
	local part_tweak_data = tweak_data.weapon.factory.parts[part_id]

	if not part_tweak_data then
		slot7 = part_id

		Application.error(slot4, Application, "[WeaponFactoryManager:get_part_desc_by_part_id] Found no part with part id")

		return 
	end

	local desc_id = tweak_data.blackmarket.weapon_mods[part_id].desc_id
end
function WeaponFactoryManager:get_part_name_by_part_id(part_id)
	local part_tweak_data = tweak_data.weapon.factory.parts[part_id]

	if not part_tweak_data then
		slot7 = part_id

		Application.error(slot4, Application, "[WeaponFactoryManager:get_part_name_by_part_id] Found no part with part id")

		return 
	end

	slot6 = part_tweak_data.name_id

	return managers.localization.text(slot4, managers.localization)
end
function WeaponFactoryManager:change_part(p_unit, factory_id, part_id, parts, blueprint)
	local factory = tweak_data.weapon.factory
	local part = factory.parts[part_id]

	if not part then
		slot13 = "doesn't exist!"

		Application.error(slot9, Application, "WeaponFactoryManager:change_part Part", part_id)

		return parts
	end

	local type = part.type

	if self._parts_by_weapon[factory_id][type] then
		slot12 = part_id

		if table.contains(slot10, self._parts_by_weapon[factory_id][type]) then
			slot11 = parts

			for rem_id, rem_data in pairs(slot10) do
				if factory.parts[rem_id].type == type then
					slot17 = rem_id

					table.delete(slot15, blueprint)

					break
				end
			end

			slot12 = part_id

			table.insert(slot10, blueprint)

			slot12 = parts

			self.disassemble(slot10, self)

			slot14 = blueprint

			return self.assemble_from_blueprint(slot10, self, factory_id, p_unit)
		else
			slot16 = "!"

			Application.error(slot10, Application, "WeaponFactoryManager:change_part Part", part_id, "not allowed for weapon", factory_id)
		end
	else
		slot16 = "!"

		Application.error(slot10, Application, "WeaponFactoryManager:change_part Part", part_id, "not allowed for weapon", factory_id)
	end

	return parts
end
function WeaponFactoryManager:remove_part_from_blueprint(part_id, blueprint)
	local factory = tweak_data.weapon.factory
	local part = factory.parts[part_id]

	if not part then
		slot10 = "doesn't exist!"

		Application.error(slot6, Application, "WeaponFactoryManager:remove_part_from_blueprint Part", part_id)

		return 
	end

	slot8 = part_id

	table.delete(slot6, blueprint)

	return 
end
function WeaponFactoryManager:change_part_blueprint_only(factory_id, part_id, blueprint, remove_part)
	local factory = tweak_data.weapon.factory
	local part = factory.parts[part_id]

	if not part then
		slot12 = " doesn't exist!"

		Application.error(slot8, Application, "WeaponFactoryManager:change_part Part", part_id)

		return false
	end

	local type = part.type

	if remove_part then
		slot11 = part_id

		table.delete(slot9, blueprint)

		slot12 = blueprint
		local forbidden = WeaponFactoryManager._get_forbidden_parts(slot9, WeaponFactoryManager, factory_id) or {}
		slot11 = blueprint

		for _, rem_id in ipairs(slot10) do
			if forbidden[rem_id] then
				slot17 = rem_id

				table.delete(slot15, blueprint)
			end
		end
	elseif self._parts_by_weapon[factory_id][type] then
		slot11 = part_id

		if table.contains(slot9, self._parts_by_weapon[factory_id][type]) then
			slot10 = blueprint

			for _, rem_id in ipairs(slot9) do
				if factory.parts[rem_id].type == type then
					slot16 = rem_id

					table.delete(slot14, blueprint)

					break
				end
			end

			slot11 = part_id

			table.insert(slot9, blueprint)

			slot12 = blueprint
			local forbidden = WeaponFactoryManager._get_forbidden_parts(slot9, WeaponFactoryManager, factory_id) or {}
			slot11 = blueprint

			for _, rem_id in ipairs(slot10) do
				if forbidden[rem_id] then
					slot17 = rem_id

					table.delete(slot15, blueprint)
				end
			end

			return true
		else
			slot15 = "!"

			Application.error(slot9, Application, "WeaponFactoryManager:change_part Part", part_id, "not allowed for weapon", factory_id)
		end
	else
		slot15 = "!"

		Application.error(slot9, Application, "WeaponFactoryManager:change_part Part", part_id, "not allowed for weapon", factory_id)
	end

	return false
end
function WeaponFactoryManager:get_replaces_parts(factory_id, part_id, blueprint, remove_part)
	local factory = tweak_data.weapon.factory
	local part = factory.parts[part_id]

	if not part then
		slot12 = " doesn't exist!"

		Application.error(slot8, Application, "WeaponFactoryManager:change_part Part", part_id)

		return nil
	end

	local replaces = {}
	local type = part.type

	if self._parts_by_weapon[factory_id][type] then
		slot12 = part_id

		if table.contains(slot10, self._parts_by_weapon[factory_id][type]) then
			slot11 = blueprint

			for _, rep_id in ipairs(slot10) do
				if factory.parts[rep_id].type == type then
					slot17 = rep_id

					table.insert(slot15, replaces)

					break
				end
			end
		else
			slot16 = "!"

			Application.error(slot10, Application, "WeaponFactoryManager:check_replaces_part Part", part_id, "not allowed for weapon", factory_id)
		end
	else
		slot16 = "!"

		Application.error(slot10, Application, "WeaponFactoryManager:check_replaces_part Part", part_id, "not allowed for weapon", factory_id)
	end

	return replaces
end
function WeaponFactoryManager:get_removes_parts(factory_id, part_id, blueprint, remove_part)
	local factory = tweak_data.weapon.factory
	local part = factory.parts[part_id]

	if not part then
		slot12 = " doesn't exist!"

		Application.error(slot8, Application, "WeaponFactoryManager:get_removes_parts Part", part_id)

		return nil
	end

	local removes = {}
	local new_blueprint = deep_clone(slot9)
	slot15 = remove_part

	self.change_part_blueprint_only(blueprint, self, factory_id, part_id, new_blueprint)

	slot11 = blueprint

	for i, b_id in ipairs(blueprint) do
		slot17 = b_id

		if not table.contains(slot15, new_blueprint) then
			local b_part = factory.parts[b_id]

			if b_part and part and b_part.type ~= part.type then
				slot18 = b_id

				table.insert(slot16, removes)
			end
		end
	end

	return removes
end
function WeaponFactoryManager:can_add_part(factory_id, part_id, blueprint)
	local new_blueprint = deep_clone(slot5)
	slot8 = part_id

	table.insert(blueprint, new_blueprint)

	slot9 = new_blueprint
	local forbidden = self._get_forbidden_parts(blueprint, self, factory_id)
	slot8 = forbidden

	for forbid_part_id, forbidder_part_id in pairs(self) do
		if forbid_part_id == part_id then
			return forbidder_part_id
		end
	end

	return nil
end
function WeaponFactoryManager:remove_part(p_unit, factory_id, part_id, parts, blueprint)
	local factory = tweak_data.weapon.factory
	local part = factory.parts[part_id]

	if not part then
		slot13 = "doesn't exist!"

		Application.error(slot9, Application, "WeaponFactoryManager:remove_part Part", part_id)

		return parts
	end

	slot11 = part_id

	table.delete(slot9, blueprint)

	slot11 = parts

	self.disassemble(slot9, self)

	slot13 = blueprint

	return self.assemble_from_blueprint(slot9, self, factory_id, p_unit)
end
function WeaponFactoryManager:remove_part_by_type(p_unit, factory_id, type, parts, blueprint)
	local factory = tweak_data.weapon.factory
	slot9 = parts

	for part_id, part_data in pairs(slot8) do
		if factory.parts[part_id].type == type then
			slot15 = part_id

			table.delete(slot13, blueprint)

			break
		end
	end

	slot10 = parts

	self.disassemble(slot8, self)

	slot12 = blueprint

	return self.assemble_from_blueprint(slot8, self, factory_id, p_unit)
end
function WeaponFactoryManager:change_blueprint(p_unit, factory_id, parts, blueprint)
	slot8 = parts

	self.disassemble(slot6, self)

	slot10 = blueprint

	return self.assemble_from_blueprint(slot6, self, factory_id, p_unit)
end
function WeaponFactoryManager:blueprint_to_string(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local index_table = {}
	slot5 = ipairs
	slot7 = (factory[factory_id] and factory[factory_id].uses_parts) or {}

	for i, part_id in slot5(slot6) do
		index_table[part_id] = i
	end

	local s = ""
	slot8 = blueprint

	for _, part_id in ipairs(slot7) do
		if index_table[part_id] then
			slot14 = index_table[part_id]
			s = s .. tostring(slot13) .. " "
		else
			slot18 = part_id

			Application.error(slot12, Application, "[WeaponFactoryManager:blueprint_to_string] Part do not exist in weapon's uses_parts!", "factory_id", factory_id, "part_id")
		end
	end

	return s
end
function WeaponFactoryManager:unpack_blueprint_from_string(factory_id, blueprint_string)
	local factory = tweak_data.weapon.factory
	slot7 = " "
	local index_table = string.split(slot5, blueprint_string)
	local blueprint = {}
	local part_id = nil
	slot9 = index_table

	for _, part_index in ipairs(slot8) do
		slot15 = part_index
		part_id = factory[factory_id].uses_parts[tonumber(slot14)]

		if part_id then
			slot15 = part_id

			table.insert(slot13, blueprint)
		end
	end

	return blueprint
end
function WeaponFactoryManager:get_stats(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	slot8 = blueprint
	local forbidden = self._get_forbidden_parts(slot5, self, factory_id)
	slot9 = blueprint
	local override = self._get_override_parts(self, self, factory_id)
	local stats = {}
	slot9 = blueprint

	for _, part_id in ipairs(factory_id) do
		if not forbidden[part_id] and factory.parts[part_id].stats then
			slot16 = factory_id
			local part = self._part_data(slot13, self, part_id)
			slot15 = part.stats

			for stat_type, value in pairs(self) do
				stats[stat_type] = stats[stat_type] or 0
				stats[stat_type] = stats[stat_type] + value
			end
		end
	end

	return stats
end
function WeaponFactoryManager:get_stance_mod(factory_id, blueprint, using_second_sight)
	local factory = tweak_data.weapon.factory
	slot9 = blueprint
	local assembled_blueprint = self.get_assembled_blueprint(slot6, self, factory_id)
	slot10 = assembled_blueprint
	local forbidden = self._get_forbidden_parts(self, self, factory_id)
	slot11 = assembled_blueprint
	local override = self._get_override_parts(self, self, factory_id)
	local part = nil
	local translation = Vector3()
	local rotation = Rotation()
	local lens_distortion = managers.environment_controller.get_lens_distortion_value(slot12)
	slot14 = assembled_blueprint

	for _, part_id in ipairs(managers.environment_controller) do
		if not forbidden[part_id] then
			slot22 = override
			part = self._part_data(slot18, self, part_id, factory_id)

			if part.stance_mod and ((part.type ~= "sight" and part.type ~= "gadget") or (using_second_sight and part.type == "gadget") or (not using_second_sight and part.type == "sight")) and part.stance_mod[factory_id] then
				local part_translation = part.stance_mod[factory_id].translation

				if part_translation then
					slot21 = part_translation

					mvector3.add(slot19, translation)
				end

				local part_rotation = part.stance_mod[factory_id].rotation

				if part_rotation then
					slot22 = part_rotation

					mrotation.multiply(slot20, rotation)
				end

				local part_lens_distortion = part.stance_mod[factory_id].lens_distortion_power

				if part_lens_distortion then
					lens_distortion = part_lens_distortion
				end
			end
		end
	end

	return {
		translation = translation,
		rotation = rotation,
		lens_distortion = lens_distortion
	}
end
function WeaponFactoryManager:has_perk(perk_name, factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	slot9 = blueprint
	local forbidden = self._get_forbidden_parts(slot6, self, factory_id)
	slot8 = blueprint

	for _, part_id in ipairs(self) do
		if not forbidden[part_id] and factory.parts[part_id].perks then
			slot13 = factory.parts[part_id].perks

			for _, perk in ipairs(slot12) do
				if perk == perk_name then
					return true
				end
			end
		end
	end

	return false
end
function WeaponFactoryManager:get_perks_from_part_id(part_id)
	local factory = tweak_data.weapon.factory

	if not factory.parts[part_id] then
		return {}
	end

	local perks = {}

	if factory.parts[part_id].perks then
		slot6 = factory.parts[part_id].perks

		for _, perk in ipairs(slot5) do
			perks[perk] = true
		end
	end

	return perks
end
function WeaponFactoryManager:get_perks(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	slot8 = blueprint
	local forbidden = self._get_forbidden_parts(slot5, self, factory_id)
	local perks = {}
	slot8 = blueprint

	for _, part_id in ipairs(factory_id) do
		if not forbidden[part_id] and factory.parts[part_id].perks then
			slot13 = factory.parts[part_id].perks

			for _, perk in ipairs(slot12) do
				perks[perk] = true
			end
		end
	end

	return perks
end
function WeaponFactoryManager:get_sound_switch(switch_group, factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	slot9 = blueprint
	local forbidden = self._get_forbidden_parts(slot6, self, factory_id)
	local t = {}
	slot9 = blueprint

	for _, part_id in ipairs(factory_id) do
		if not forbidden[part_id] and factory.parts[part_id].sound_switch and factory.parts[part_id].sound_switch[switch_group] then
			slot15 = part_id

			table.insert(slot13, t)
		end
	end

	if 0 < #t then
		if 1 < #t then
			local part_x, part_y = nil

			function slot12(x, y)
				part_x = factory.parts[x]
				part_y = factory.parts[y]

				if part_x.sub_type == "silencer" then
					return true
				end

				if part_y.sub_type == "silencer" then
					return false
				end

				return x < y
			end

			table.sort(slot10, t)
		end

		return factory.parts[t[1]].sound_switch[switch_group]
	end

	return nil
end
function WeaponFactoryManager:disassemble(parts)
	slot4 = self._async_load_tasks

	for task_data, _ in pairs(slot3) do
		if task_data.parts == parts then
			self._async_load_tasks[task_data] = nil

			break
		end
	end

	local names = {}

	if parts then
		slot5 = parts

		for part_id, data in pairs(slot4) do
			if data.package then
				slot11 = data.package

				self.unload_package(slot9, self)
			else
				slot11 = data.name

				table.insert(slot9, names)
			end

			slot10 = data.unit

			if alive(slot9) then
				slot11 = data.unit

				World.delete_unit(slot9, World)
			end
		end
	end

	parts = {}
	slot5 = names

	for _, name in pairs(slot4) do
		slot14 = false

		managers.dyn_resource.unload(slot9, managers.dyn_resource, ids_unit, name, "packages/dyn_resources")
	end

	return 
end
function WeaponFactoryManager:save(data)
	data.weapon_factory = self._global

	return 
end
function WeaponFactoryManager:load(data)
	self._global = data.weapon_factory

	return 
end
function WeaponFactoryManager:debug_get_stats(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	slot8 = blueprint
	local forbidden = self._get_forbidden_parts(slot5, self, factory_id)
	local stats = {}
	slot8 = blueprint

	for _, part_id in ipairs(factory_id) do
		if not forbidden[part_id] then
			stats[part_id] = factory.parts[part_id].stats
		end
	end

	return stats
end

return 
