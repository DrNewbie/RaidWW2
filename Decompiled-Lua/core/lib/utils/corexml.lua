slot3 = "CoreXml"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreMath"

core.import(slot1, core)

function simple_value_string(name, value, t)
	t = t or ""
	local string = t
	local type = CoreClass.type_name(slot5)
	slot7 = value
	local v = tostring(value)

	if type == "Vector3" then
		slot9 = "%.4f"
		v = CoreMath.vector_to_string(slot7, value)
	elseif type == "Rotation" then
		slot9 = "%.4f"
		v = CoreMath.rotation_to_string(slot7, value)
	elseif type == "table" then
		string = string .. "<value name=\"" .. name .. "\" type=\"" .. type .. "\">\n"
		slot11 = t
		string = string .. save_table_value_string(name, value, "")
		string = string .. t .. "</value>"

		return string
	end

	string = string .. "<value name=\"" .. name .. "\" value=\"" .. v .. "\" type=\"" .. type .. "\"/>"

	return string
end

function save_value_string(c, name, t, unit)
	t = t or ""
	local string = t

	if name == "unit:position" then
		name = "position"
		slot7 = unit
		c[name] = unit.position(slot6)
	end

	if name == "unit:rotation" then
		name = "rotation"
		slot7 = unit
		c[name] = unit.rotation(slot6)
	end

	local type = CoreClass.type_name(slot6)
	slot8 = c[name]
	local v = tostring(c[name])

	if type == "Vector3" then
		slot10 = "%.4f"
		v = CoreMath.vector_to_string(slot8, c[name])
	elseif type == "Rotation" then
		slot10 = "%.4f"
		v = CoreMath.rotation_to_string(slot8, c[name])
	elseif type == "table" then
		string = string .. "<value name=\"" .. name .. "\" type=\"" .. type .. "\">\n"
		slot12 = t
		string = string .. save_table_value_string(name, c[name], "")
		string = string .. t .. "</value>"

		return string
	end

	string = string .. "<value name=\"" .. name .. "\" value=\"" .. v .. "\" type=\"" .. type .. "\"/>"

	return string
end

function save_table_value_string(in_table, string, t)
	t = t .. "\t"
	slot5 = in_table

	for i, value in pairs("\t") do
		local type = CoreClass.type_name(slot9)
		slot11 = value
		local v = tostring(value)

		if type == "table" then
			string = string .. t .. "<value name=\"" .. i .. "\" type=\"" .. type .. "\">\n"
			slot15 = t
			string = string .. save_table_value_string("<value name=\"", value, "")
			string = string .. t .. "</value>\n"
		else
			if type == "Vector3" then
				slot13 = "%.4f"
				v = CoreMath.vector_to_string(slot11, value)
			elseif type == "Rotation" then
				slot13 = "%.4f"
				v = CoreMath.rotation_to_string(slot11, value)
			end

			string = string .. t .. "<value name=\"" .. i .. "\" value=\"" .. v .. "\" type=\"" .. type .. "\"/>\n"
		end
	end

	return string
end

function parse_values_node(node)
	local t = {}
	slot4 = node

	for node_value in node.children(slot3) do
		slot8 = node_value
		local name, value = parse_value_node(slot7)
		t[name] = value
	end

	return t
end

function parse_value_node(node)
	slot4 = "name"
	local value_name = node.parameter(slot2, node)
	slot5 = "type"
	local type = node.parameter(node, node)

	if type == "table" then
		local t = {}
		slot6 = node

		for table_node in node.children(slot5) do
			slot11 = "name"
			local name = table_node.parameter(slot9, table_node)
			slot11 = name

			if not tonumber(table_node) then
			end

			slot11 = table_node
			local _, value = parse_value_node(slot10)
			t[name] = value
		end

		return value_name, t
	end

	local val = node.parameter(slot4, node)
	slot8 = val

	return value_name, CoreMath.string_to_value("value", type)
end

return 
