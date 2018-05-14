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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneFrameVisitor"

require(slot1)

slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneMayaExporterCurve"

require(slot1)

if not CoreCutsceneMayaExporter then
	slot2 = CoreCutsceneFrameVisitor
	slot0 = class(slot1)
end

CoreCutsceneMayaExporter = slot0
CoreCutsceneMayaExporter.MAYA_VERSION = 8.5
function CoreCutsceneMayaExporter:init(parent_window, cutscene_editor, start_frame, end_frame, output_path)
	slot12 = end_frame

	self.super.init(slot7, self, parent_window, cutscene_editor, start_frame)

	self.__output_path = output_path
	self.__sampled_units = {}
	self.__curve_sets = {}
	slot10 = self.__output_path
	slot9 = "Must supply a valid output path."

	assert(slot7, type(parent_window) == "string")

	return 
end
function CoreCutsceneMayaExporter:add_unit(unit_name, unit)
	local existing_unit = self.__sampled_units[unit_name]

	if existing_unit == nil then
		self.__sampled_units[unit_name] = unit
	elseif existing_unit ~= unit then
		slot10 = existing_unit.name(slot11)
		slot13 = unit

		error(string.format(slot7, "Duplicate unit name \"%s\" used for \"%s\" and \"%s\".", unit_name, unit.name(existing_unit)))
	end

	return 
end
function CoreCutsceneMayaExporter:_visit_frame(frame)
	slot4 = self

	self._sample_animation_curves(slot3)

	return 
end
function CoreCutsceneMayaExporter:_done(aborted)
	if not aborted then
		slot5 = "w"
		local file = io.open(slot3, self.__output_path)
		slot6 = file

		self._write_header(self.__output_path, self)

		slot6 = file

		self._write_hierarchies(self.__output_path, self)

		slot6 = file
		slot9 = self

		self._write_camera_node(self.__output_path, self, self._combined_camera_node_name(slot8))

		slot6 = file

		self._write_animation_curves(self.__output_path, self)

		slot5 = file

		io.close(self.__output_path)
	end

	return 
end
function CoreCutsceneMayaExporter:_combined_camera_node_name()
	local node_name = "camera_directed"

	while self.__sampled_units[node_name] ~= nil do
		local node_name, num_suffix = string.match(slot3, node_name)
		slot6 = num_suffix
		num_suffix = tonumber("(.-)(%d*)$")
		node_name = node_name_without_num_suffix .. ((num_suffix and num_suffix + 1) or "")
	end

	return node_name
end
function CoreCutsceneMayaExporter:_write_header(file)
	slot4 = file
	slot8 = self.MAYA_VERSION

	file.write(slot3, string.format(slot6, "//Maya ASCII %.1f scene\n"))

	slot4 = file
	slot8 = self.MAYA_VERSION

	file.write(slot3, string.format(slot6, "requires maya \"%.1f\";\n"))

	slot5 = "currentUnit -l centimeter -a degree -t ntsc;\n"

	file.write(slot3, file)

	slot5 = "createNode transform -s -n \"persp\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".v\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".t\" -type \"double3\" 28 -29 21 ;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".r\" -type \"double3\" 62.482924915355788 -3.1805546814635168e-015 43.994913994745808;\n"

	file.write(slot3, file)

	slot5 = "createNode camera -s -n \"perspShape\" -p \"persp\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr -k off \".v\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".fl\" 34.999999999999993;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".ncp\" 1;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".fcp\" 10000;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".coi\" 45.453272709454041;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".imn\" -type \"string\" \"persp\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".den\" -type \"string\" \"persp_depth\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".man\" -type \"string\" \"persp_mask\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".hc\" -type \"string\" \"viewSet -p %camera\";\n"

	file.write(slot3, file)

	slot5 = "createNode transform -s -n \"top\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".v\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".t\" -type \"double3\" 0 0 100.1 ;\n"

	file.write(slot3, file)

	slot5 = "createNode camera -s -n \"topShape\" -p \"top\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr -k off \".v\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".rnd\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".coi\" 100.1;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".ow\" 30;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".imn\" -type \"string\" \"top\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".den\" -type \"string\" \"top_depth\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".man\" -type \"string\" \"top_mask\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".hc\" -type \"string\" \"viewSet -t %camera\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".o\" yes;\n"

	file.write(slot3, file)

	slot5 = "createNode transform -s -n \"front\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".v\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".t\" -type \"double3\" 0 -100.1 0 ;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".r\" -type \"double3\" 89.999999999999986 0 0 ;\n"

	file.write(slot3, file)

	slot5 = "createNode camera -s -n \"frontShape\" -p \"front\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr -k off \".v\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".rnd\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".coi\" 100.1;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".ow\" 30;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".imn\" -type \"string\" \"front\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".den\" -type \"string\" \"front_depth\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".man\" -type \"string\" \"front_mask\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".hc\" -type \"string\" \"viewSet -f %camera\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".o\" yes;\n"

	file.write(slot3, file)

	slot5 = "createNode transform -s -n \"side\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".v\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".t\" -type \"double3\" 100.1 0 0 ;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".r\" -type \"double3\" 90 4.7708320221952799e-014 89.999999999999986;\n"

	file.write(slot3, file)

	slot5 = "createNode camera -s -n \"sideShape\" -p \"side\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr -k off \".v\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".rnd\" no;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".coi\" 100.1;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".ow\" 30;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".imn\" -type \"string\" \"side\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".den\" -type \"string\" \"side_depth\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".man\" -type \"string\" \"side_mask\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".hc\" -type \"string\" \"viewSet -s %camera\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".o\" yes;\n"

	file.write(slot3, file)

	slot5 = "createNode lightLinker -n \"lightLinker1\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr -s 2 \".lnk\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr -s 2 \".slnk\";\n"

	file.write(slot3, file)

	slot5 = "createNode displayLayerManager -n \"layerManager\";\n"

	file.write(slot3, file)

	slot5 = "createNode displayLayer -n \"defaultLayer\";\n"

	file.write(slot3, file)

	slot5 = "createNode renderLayerManager -n \"renderLayerManager\";\n"

	file.write(slot3, file)

	slot5 = "createNode renderLayer -n \"defaultRenderLayer\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".g\" yes;\n"

	file.write(slot3, file)

	slot5 = "select -ne :time1;\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".o\" 0;\n"

	file.write(slot3, file)

	slot5 = "createNode script -name \"sceneConfigurationScriptNode\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".before\" -type \"string\" \"playbackOptions -loop once -minTime " .. self.__start_frame .. " -maxTime " .. self.__end_frame .. " -animationStartTime " .. self.__start_frame .. " -animationEndTime " .. self.__end_frame .. "\";\n"

	file.write(slot3, file)

	slot5 = "\tsetAttr \".scriptType\" 6;\n"

	file.write(slot3, file)

	return 
end
function CoreCutsceneMayaExporter:_write_hierarchies(file)
	slot4 = self.__sampled_units

	for unit_name, unit in pairs(slot3) do
		slot10 = "camera"

		if string.begins(slot8, unit_name) then
			slot11 = unit_name

			self._write_camera_node(slot8, self, file)
		else
			slot10 = "locator"

			if string.begins(slot8, unit_name) then
				slot9 = file
				slot13 = unit_name

				file.write(slot8, string.format(slot11, "createNode transform -name \"%s\";\n"))

				slot9 = file
				slot14 = unit_name

				file.write(slot8, string.format(slot11, "createNode locator -name \"%sShape\" -parent \"%s\";\n", unit_name))

				slot10 = "\tsetAttr -keyable off \".visibility\";\n"

				file.write(slot8, file)
			else
				local object = unit.orientation_object(slot8)
				slot10 = file
				slot18 = object

				file.write(unit, string.format(slot12, self._maya_node_name(slot15, self, unit_name)))

				slot11 = "\taddAttr -longName \"unitTypeName\" -dataType \"string\";\n"

				file.write(unit, file)

				slot14 = unit
				slot11 = "\tsetAttr -type \"string\" \".unitTypeName\" " .. unit.name("createNode transform -name \"%s\";\n") .. ";\n"

				file.write(unit, file)

				slot8 = ipairs
			end
		end
	end

	return 
end
function CoreCutsceneMayaExporter:_write_hierarchy_entry_for_object(file, unit_name, object, parent_object)

	-- Decompilation error in this vicinity:
	slot9 = object

	if self._should_export(slot6, self, unit_name) then
		slot9 = object
		local object_name = self._maya_node_name(slot6, self, unit_name)
		slot11 = true
		local full_object_name = self._maya_node_name(self, self, unit_name, object)

		if parent_object then
			slot12 = true
			local full_parent_object_name = self._maya_node_name(slot8, self, unit_name, parent_object)
		end

		slot10 = file
		slot14 = object_name

		file.write(slot9, string.format(slot12, "createNode joint -name \"%s\""))

		if full_parent_object_name then
			slot10 = file
			slot14 = full_parent_object_name

			file.write(slot9, string.format(slot12, " -parent \"%s\""))
		end

		slot11 = ";\n"

		file.write(slot9, file)

		if full_parent_object_name then
			slot10 = file
			slot15 = full_object_name

			file.write(slot9, string.format(slot12, "\tconnectAttr \"%s.scale\" \"%s.inverseScale\";\n", full_parent_object_name))
		end
	end

	slot5 = ipairs

	return 
end
function CoreCutsceneMayaExporter:_write_camera_node(file, camera_name)
	slot6 = "createNode transform -name \"" .. camera_name .. "\";\n"

	file.write(slot4, file)

	slot5 = file
	slot10 = camera_name

	file.write(slot4, string.format(camera_name, "createNode camera -name \"%sShape\" -parent \"%s\";\n", camera_name))

	slot6 = "\tsetAttr -keyable off \".visibility\";\n"

	file.write(slot4, file)

	slot6 = "\tsetAttr \".renderable\" no;\n"

	file.write(slot4, file)

	slot6 = "\tsetAttr \".cameraAperture\" -type \"double2\" 1.78 1.0;\n"

	file.write(slot4, file)

	slot6 = "\tsetAttr \".lensSqueezeRatio\" 1.0;\n"

	file.write(slot4, file)

	slot6 = "\tsetAttr \".filmFit\" 0;\n"

	file.write(slot4, file)

	slot6 = "\tsetAttr \".nearClipPlane\" 1;\n"

	file.write(slot4, file)

	slot6 = "\tsetAttr \".farClipPlane\" 10000;\n"

	file.write(slot4, file)

	slot6 = "\tsetAttr \".orthographicWidth\" 30;\n"

	file.write(slot4, file)

	slot6 = "\tsetAttr \".imageName\" -type \"string\" \"" .. camera_name .. "\";\n"

	file.write(slot4, file)

	slot6 = "\tsetAttr \".depthName\" -type \"string\" \"" .. camera_name .. "_depth\";\n"

	file.write(slot4, file)

	slot6 = "\tsetAttr \".maskName\" -type \"string\" \"" .. camera_name .. "_mask\";\n"

	file.write(slot4, file)

	return 
end
function CoreCutsceneMayaExporter:_write_animation_curves(file)
	slot4 = self.__curve_sets

	for unit_name, curve_sets in pairs(slot3) do
		slot9 = curve_sets

		for _, curve_set in pairs(slot8) do
			slot15 = file

			curve_set.write(slot13, curve_set)
		end
	end

	if self.__combined_camera_focal_length_curve then
		slot5 = file

		self.__combined_camera_focal_length_curve.write(slot3, self.__combined_camera_focal_length_curve)
	end

	return 
end
function CoreCutsceneMayaExporter:_sample_animation_curves()
	slot3 = self.__sampled_units

	for unit_name, unit in pairs(slot2) do

		-- Decompilation error in this vicinity:
		slot9 = "camera"
	end

	local cutscene_player = self.__cutscene_editor._player
	slot4 = cutscene_player
	local camera_object = cutscene_player._camera_object(slot3)

	if camera_object then
		slot7 = "just_an_identifier"
		slot7 = camera_object

		self._curve_set(slot4, self, self._combined_camera_node_name(slot7)).add_sample(slot4, self._curve_set(slot4, self, self._combined_camera_node_name(slot7)), self.__frame)

		slot5 = self
		slot6 = self.__frame
		slot12 = cutscene_player
		slot10 = cutscene_player.camera_attributes(slot11).fov

		self._combined_camera_focal_length_curve(slot4).add_sample(slot4, self._combined_camera_focal_length_curve(slot4), self._fov_to_focal_length(self, self))
	end

	return 
end
function CoreCutsceneMayaExporter:_sample_animation_curves_for_hierarchy(unit_name, object)

	-- Decompilation error in this vicinity:
	slot7 = object

	if self._should_export(slot4, self, unit_name) then
		slot7 = object
		slot7 = object

		self._curve_set(slot4, self, unit_name).add_sample(slot4, self._curve_set(slot4, self, unit_name), self.__frame)
	end

	slot3 = ipairs

	return 
end
function CoreCutsceneMayaExporter:_curve_set(unit_name, object)
	local curve_sets_for_unit = self.__curve_sets[unit_name]
	local curve_set = curve_sets_for_unit and curve_sets_for_unit[object]

	if curve_set == nil then
		if curve_sets_for_unit == nil then
			curve_sets_for_unit = {}
			self.__curve_sets[unit_name] = curve_sets_for_unit
		end

		slot10 = true
		local target_object_name = self._maya_node_name(slot6, self, unit_name, object)
		slot9 = target_object_name
		curve_set = CoreCutsceneMayaExporterCurveSet.new(self, CoreCutsceneMayaExporterCurveSet)
		curve_sets_for_unit[object] = curve_set
	end

	return curve_set
end
function CoreCutsceneMayaExporter:_combined_camera_focal_length_curve()
	if self.__combined_camera_focal_length_curve == nil then
		slot7 = self
		slot6 = "focalLength"
		self.__combined_camera_focal_length_curve = CoreCutsceneMayaExporterCurve.new(slot2, CoreCutsceneMayaExporterCurve, "animCurveTU", self._combined_camera_node_name(slot6) .. "Shape")
	end

	return self.__combined_camera_focal_length_curve
end
function CoreCutsceneMayaExporter:_fov_to_focal_length(fov)
	slot6 = 0.00872665 * fov
	local focal_length = math.tan(math.deg(slot5))

	return 0.89 / (focal_length * 0.03937)
end
function CoreCutsceneMayaExporter:_should_export(unit_name, object)
	slot5 = object

	return type_name(slot4) == "Object3D"
end
function CoreCutsceneMayaExporter:_maya_node_name(unit_name, object, full_path)

	-- Decompilation error in this vicinity:
	slot7 = "camera"
	slot7 = "^%d"
	local valid_node_name = (string.match(slot5, unit_name) and "actor" .. unit_name) or unit_name
	slot9 = object
	local long_name = valid_node_name .. ":" .. object.name(slot8)

	if full_path then
		slot8 = object
		local parent = object.parent(slot7)
	end
end

return 
