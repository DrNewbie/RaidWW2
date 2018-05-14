CoreCutsceneMayaExporterCurve = CoreCutsceneMayaExporterCurve or class()
CoreCutsceneMayaExporterCurveSet = CoreCutsceneMayaExporterCurveSet or class()
local SAMPLED_COMPONENTS = {
	"x",
	"y",
	"z"
}
local ROTATION_ACCESS_METHODS = {
	z = "roll",
	x = "yaw",
	y = "pitch"
}
local VALID_MAYA_NODE_TYPES = {}
slot5 = {
	"A",
	"L",
	"T",
	"U"
}

for _, char in ipairs(slot4) do
	slot11 = "animCurveT" .. char

	table.insert(slot9, VALID_MAYA_NODE_TYPES)

	slot11 = "animCurveU" .. char

	table.insert(slot9, VALID_MAYA_NODE_TYPES)
end

function CoreCutsceneMayaExporterCurve:init(maya_node_type, node_name, attribute_name)
	self.__samples = {}
	self.__sample_count = 0
	slot8 = maya_node_type
	self.__maya_node_type = assert(slot5, tostring(slot7))
	slot8 = node_name
	self.__node_name = assert(slot5, tostring("Must supply a valid maya node type."))
	slot8 = attribute_name
	self.__attribute_name = assert(slot5, tostring("Must supply a valid node name."))
	slot9 = self.__maya_node_type
	slot6 = table.contains("Must supply a valid attribute name.", VALID_MAYA_NODE_TYPES)
	slot10 = self.__maya_node_type

	assert(slot5, string.format(VALID_MAYA_NODE_TYPES, "Unsupported maya node type \"%s\". Only subclasses of animCurve are supported."))

	slot9 = "^%l"
	slot6 = string.match(string.format, self.__node_name)
	slot10 = self.__node_name

	assert(slot5, string.format(self.__node_name, "Unsupported node name \"%s\". Must start with a lower-case letter."))

	return 
end
function CoreCutsceneMayaExporterCurve:add_sample(frame, value)
	if frame ~= (self.__previous_frame or -1) + 1 then
		self.__previous_value = nil
	end

	if value ~= self.__previous_value then
		self.__samples[frame] = value
		self.__sample_count = self.__sample_count + 1
		self.__previous_value = value
	end

	self.__previous_frame = frame

	return 
end
function CoreCutsceneMayaExporterCurve:last_added_value()
	return self.__previous_value
end
function CoreCutsceneMayaExporterCurve:write(file)
	if 1 <= self.__sample_count then
		slot6 = "_"
		local curve_name = string.gsub(slot3, self.__node_name, "[:|]") .. "_" .. self.__attribute_name
		slot5 = file
		slot10 = curve_name

		file.write(self.__attribute_name, string.format(slot7, "createNode %s -name \"%s\";\n", self.__maya_node_type))

		slot6 = "\tsetAttr \".tangentType\" 5;\n"

		file.write(self.__attribute_name, file)

		slot6 = "\tsetAttr \".weightedTangents\" no;\n"

		file.write(self.__attribute_name, file)

		if self.__sample_count == 1 then
			slot6 = "\tsetAttr -size 1 \".keyTimeValue[0]\""

			file.write(slot4, file)
		else
			slot5 = file
			slot10 = self.__sample_count - 1

			file.write(slot4, string.format(slot7, "\tsetAttr -size %i \".keyTimeValue[0:%i]\"", self.__sample_count))
		end

		slot5 = self.__samples
		local max_frame = table.maxn(slot4)

		for frame = 0, max_frame, 1 do
			local value = self.__samples[frame]

			if value ~= nil then
				slot11 = file
				slot16 = value

				file.write(slot10, string.format(slot13, " %i %g", frame))
			end
		end

		slot7 = ";\n"

		file.write(slot5, file)

		slot6 = file
		slot12 = self.__attribute_name

		file.write(slot5, string.format(slot8, "connectAttr \"%s.output\" \"%s.%s\";\n", curve_name, self.__node_name))
	end

	return 
end
function CoreCutsceneMayaExporterCurveSet:init(target_object_name)
	self.__curves = {}
	slot4 = SAMPLED_COMPONENTS

	for _, axis in ipairs(slot3) do
		slot14 = "t" .. axis
		self.__curves["t" .. axis] = CoreCutsceneMayaExporterCurve.new(slot10, CoreCutsceneMayaExporterCurve, "animCurveTL", target_object_name)
		slot14 = "r" .. axis
		self.__curves["r" .. axis] = CoreCutsceneMayaExporterCurve.new(slot10, CoreCutsceneMayaExporterCurve, "animCurveTA", target_object_name)
	end

	return 
end
function CoreCutsceneMayaExporterCurveSet:add_sample(frame, object)
	local position = object.local_position(slot4)
	local rotation = object.new_local_rotation(object)
	slot7 = SAMPLED_COMPONENTS

	for _, component in ipairs(object) do
		local position_value = position[component]
		slot15 = position_value

		self.__curves["t" .. component].add_sample("t" .. component, self.__curves["t" .. component], frame)

		local method = ROTATION_ACCESS_METHODS[component]
		slot14 = rotation
		local rotation_value = rotation[method](self.__curves["t" .. component])
		slot17 = rotation_value

		self.__curves["r" .. component].add_sample("r" .. component, self.__curves["r" .. component], frame)
	end

	return 
end
function CoreCutsceneMayaExporterCurveSet:write(file)
	slot4 = self.__curves

	for _, curve in pairs(slot3) do
		slot10 = file

		curve.write(slot8, curve)
	end

	return 
end

return 
