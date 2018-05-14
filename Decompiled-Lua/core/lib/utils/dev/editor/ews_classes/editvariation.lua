slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not EditUnitVariation then
	slot2 = EditUnitBase
	slot0 = class(slot1)
end

EditUnitVariation = slot0
function EditUnitVariation:init(editor)
	local panel, sizer = editor or managers.editor.add_unit_edit_page(slot3, editor or managers.editor)
	self._panel = panel
	self._ctrls = {}
	self._element_guis = {}
	slot7 = "VERTICAL"
	local all_variations_sizer = EWS.BoxSizer({
		name = "Variations",
		class = self
	}, EWS)
	self._mesh_params = {
		default = "default",
		name = "Mesh:",
		ctrlr_proportions = 3,
		name_proportions = 1,
		tooltip = "Select a mesh variation from the combobox",
		sorted = true,
		sizer_proportions = 2,
		panel = panel,
		sizer = all_variations_sizer,
		options = {}
	}
	slot7 = self._mesh_params

	CoreEws.combobox()

	slot13 = "change_variation"

	self._mesh_params.ctrlr.connect(, self._mesh_params.ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot10, self, self))

	self._material_params = {
		default = "default",
		name = "Material:",
		ctrlr_proportions = 3,
		name_proportions = 1,
		tooltip = "Select a material variation from the combobox",
		sorted = true,
		sizer_proportions = 2,
		panel = panel,
		sizer = all_variations_sizer,
		options = {}
	}
	slot7 = self._material_params

	CoreEws.combobox()

	slot13 = "change_material"
	slot10 = nil

	self._material_params.ctrlr.connect(, self._material_params.ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(nil, self, self))

	slot11 = "EXPAND"

	sizer.add(, sizer, all_variations_sizer, 0, 0)

	self._avalible_material_groups = {}
	slot7 = panel

	panel.layout()

	slot8 = false

	panel.set_enabled(, panel)

	return 
end
function EditUnitVariation:change_variation()
	slot3 = self._ctrls.units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			local mesh_variation = self._mesh_params.ctrlr.get_value(slot7)
			slot9 = managers.sequence
			slot12 = unit
			local reset = managers.sequence.get_reset_editable_state_sequence_list(self._mesh_params.ctrlr, unit.name(slot11))[1]

			if reset then
				slot13 = unit

				managers.sequence.run_sequence_simple2(slot9, managers.sequence, reset, "change_state")
			end

			slot10 = managers.sequence
			slot13 = unit
			local variations = managers.sequence.get_editable_state_sequence_list(slot9, unit.name(slot12))

			if 0 < #variations then
				if mesh_variation == "default" then
					slot11 = unit
					unit.unit_data(slot10).mesh_variation = "default"
				else
					slot12 = mesh_variation

					if table.contains(slot10, variations) then
						slot14 = unit

						managers.sequence.run_sequence_simple2(slot10, managers.sequence, mesh_variation, "change_state")

						slot11 = unit
						unit.unit_data(slot10).mesh_variation = mesh_variation
					end
				end
			end
		end
	end

	return 
end
function EditUnitVariation:change_material()
	slot3 = self._ctrls.units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			local material = self._material_params.ctrlr.get_value(slot7)
			slot12 = unit
			local materials = self.get_material_configs_from_meta(self._material_params.ctrlr, unit.name(slot11))
			slot11 = material

			if table.contains(self, materials) then
				if material ~= "default" then
					slot13 = material
					slot12 = true

					unit.set_material_config(slot9, unit, Idstring(slot12))
				end

				slot10 = unit
				unit.unit_data(slot9).material = material
			end
		end
	end

	return 
end
function EditUnitVariation:is_editable(unit, units)
	slot5 = unit

	if alive(slot4) then
		local variations = managers.sequence.get_editable_state_sequence_list(slot4, unit.name(slot7))
		slot6 = self
		slot9 = unit
		local materials = self.get_material_configs_from_meta(managers.sequence, unit.name(unit))

		if 0 < #variations or 0 < #materials then
			self._ctrls.unit = unit
			self._ctrls.units = units
			slot8 = variations

			CoreEws.update_combobox_options(slot6, self._mesh_params)

			slot10 = self._ctrls.unit
			slot8 = self._ctrls.unit.unit_data(slot9).mesh_variation

			CoreEws.change_combobox_value(slot6, self._mesh_params)

			slot8 = 0 < #variations

			self._mesh_params.ctrlr.set_enabled(slot6, self._mesh_params.ctrlr)

			slot8 = materials

			CoreEws.update_combobox_options(slot6, self._material_params)

			slot10 = self._ctrls.unit
			slot8 = self._ctrls.unit.unit_data(slot9).material

			CoreEws.change_combobox_value(slot6, self._material_params)

			slot8 = 0 < #materials

			self._material_params.ctrlr.set_enabled(slot6, self._material_params.ctrlr)

			return true
		end
	end

	return false
end
function EditUnitVariation:get_material_configs_from_meta(unit_name)
	self._avalible_material_groups = self._avalible_material_groups or {}
	slot5 = unit_name

	if self._avalible_material_groups[unit_name.key(slot4)] then
		slot5 = unit_name

		return self._avalible_material_groups[unit_name.key(slot4)]
	end

	slot4 = CoreEngineAccess._editor_unit_data(unit_name.id(slot5))
	local node = CoreEngineAccess._editor_unit_data(unit_name.id(slot5)).model_script_data(slot3)
	local available_groups = {}
	local groups = {}
	slot7 = node

	for child in node.children(unit_name) do
		slot11 = child

		if child.name(slot10) == "metadata" then
			slot12 = "material_config_group"

			if child.parameter(slot10, child) ~= "" then
				slot11 = groups
				slot15 = "material_config_group"

				table.insert(slot10, child.parameter(slot13, child))
			end
		end
	end

	if 0 < #groups then
		slot10 = "material_config"

		for _, entry in ipairs(managers.database.list_entries_of_type(slot8, managers.database)) do
			slot14 = entry
			local node = DB.load_node(slot11, DB, "material_config")
			slot13 = groups

			for _, group in ipairs(DB) do
				slot19 = "group"

				if node.has_parameter(slot17, node) then
					slot19 = "group"
					local group_name = node.parameter(slot17, node)
				end

				if group_name == group then
					slot20 = entry

					if not table.contains(slot18, available_groups) then
						slot20 = entry

						table.insert(slot18, available_groups)
					end
				end
			end
		end
	end

	slot8 = unit_name
	self._avalible_material_groups[unit_name.key(slot7)] = available_groups

	return available_groups
end

return 
