if core then
	slot3 = "CoreMath"

	core.module(slot1, core)

	slot3 = "CoreClass"

	core.import(slot1, core)
end

nice = math.nice

function rgb_to_hsv(r, g, b)
	slot7 = b
	local max = math.max(slot4, r, g)
	slot8 = b
	local min = math.min(r, r, g)
	local hue = 0

	if max == min then
		hue = 0
	elseif max == r and b <= g then
		hue = (60 * (g - b)) / (max - min)
	elseif max == r and g < b then
		hue = (60 * (g - b)) / (max - min) + 360
	elseif max == g then
		hue = (60 * (b - r)) / (max - min) + 120
	elseif max == b then
		hue = (60 * (r - g)) / (max - min) + 240
	end

	slot9 = 360
	hue = math.fmod(slot7, hue)
	local saturation = (max == 0 and 0) or 1 - min / max
	local value = max

	return hue, saturation, value
end

function hsv_to_rgb(h, s, v)
	slot5 = h / 60
	local c = math.floor(slot4)
	local f = h / 60 - c
	local p = v * (1 - s)
	local q = v * (1 - f * s)
	local t = v * (1 - (1 - f) * s)
	local cases = {
		[0] = {
			v,
			t,
			p
		},
		{
			q,
			v,
			p
		},
		{
			p,
			v,
			t
		},
		{
			p,
			q,
			v
		},
		{
			t,
			p,
			v
		},
		{
			v,
			p,
			q
		}
	}
	slot14 = 6
	slot11 = cases[math.fmod(slot12, c)]

	return unpack(slot10)
end

function string_to_value(type, value)
	if type == "number" then
		slot4 = value

		return tonumber(slot3)
	elseif type == "boolean" then
		slot4 = value

		return toboolean(slot3)
	elseif type == "Vector3" then
		slot4 = value

		return math.string_to_vector(slot3)
	elseif type == "Rotation" then
		slot4 = value

		return math.string_to_rotation(slot3)
	elseif type == "table" then
		return {}
	elseif type == "nil" then
		return nil
	end

	return value
end

function vector_to_string(v, f)
	if f then
		slot5 = v.x
		local x = string.format(slot3, f)
		slot6 = v.y
		local y = string.format(f, f)
		slot7 = v.z
		local z = string.format(f, f)

		return x .. " " .. y .. " " .. z
	end

	return v.x .. " " .. v.y .. " " .. v.z
end

function rotation_to_string(r, f)
	if f then
		local x = string.format(slot3, r.yaw(slot6))
		local y = string.format(f, r.pitch(r))
		slot6 = f
		slot9 = r
		local z = string.format(f, r.roll(r))

		return x .. " " .. y .. " " .. z
	end

	slot4 = r
	slot6 = r
	slot8 = r

	return r.yaw(slot3) .. " " .. r.pitch(slot5) .. " " .. r.roll(slot7)
end

function width_mul(aspect_ratio)
	return 0.75 * aspect_ratio
end

function wire_set_midpoint(unit, source, target, middle)
	slot7 = source
	local s_pos = unit.get_object(slot5, unit).position(slot5)
	slot8 = target
	local e_pos = unit.get_object(unit.get_object(slot5, unit), unit).position(unit.get_object(slot5, unit))
	slot8 = e_pos - s_pos
	local n = e_pos - s_pos.normalized(unit.get_object(unit.get_object(slot5, unit), unit)).cross(unit.get_object(unit.get_object(slot5, unit), unit), Vector3(slot10, 0, 0))
	slot9 = e_pos - s_pos
	local dir = e_pos - s_pos.normalized(e_pos - s_pos.normalized(unit.get_object(unit.get_object(slot5, unit), unit))).cross(e_pos - s_pos.normalized(unit.get_object(unit.get_object(slot5, unit), unit)), e_pos - s_pos.normalized(e_pos - s_pos.normalized(unit.get_object(unit.get_object(slot5, unit), unit))))
	local m_point = s_pos + (e_pos - s_pos) * 0.5
	slot12 = middle
	slot14 = unit
	slot12 = m_point + dir * unit.wire_data(1).slack

	unit.get_object(n, unit).set_position(n, unit.get_object(n, unit))

	slot11 = unit
	slot14 = "co_cable"
	local co = unit.get_object(n, Idstring(1))

	if co then
		slot12 = co
		slot18 = e_pos - s_pos
		slot17 = math.UP

		co.set_rotation(slot11, Rotation.look_at(slot14, Rotation, e_pos - s_pos.normalized(slot17)))
	end

	return 
end

function probability(chance_table, result_table)
	slot4 = 100
	local random = math.random(slot3)
	local total_chance = 0
	local choice = #chance_table
	slot7 = chance_table

	for id, chance in ipairs(slot6) do
		total_chance = total_chance + chance

		if random <= total_chance then
			choice = id

			break
		end
	end

	if result_table then
		return result_table[choice]
	end

	return choice
end

function get_fit_size(width, height, bounding_width, bounding_height)
	local bounding_aspect = bounding_width / bounding_height
	local aspect = width / height

	if aspect <= bounding_aspect then
		return (bounding_width * aspect) / bounding_aspect, bounding_height
	else
		return bounding_width, (bounding_height * bounding_aspect) / aspect
	end

	return 
end

os.get_oldest_date = function (date1, date2)
	if date2.year < date1.year then
		return date1
	elseif date1.year < date2.year then
		return date2
	elseif date2.yday < date1.yday then
		return date1
	elseif date1.yday < date2.yday then
		return date2
	elseif date2.hour < date1.hour then
		return date1
	elseif date1.hour < date2.hour then
		return date2
	elseif date2.min < date1.min then
		return date1
	elseif date1.min < date2.min then
		return date2
	elseif date2.sec < date1.sec then
		return date1
	elseif date1.sec < date2.sec then
		return date2
	else
		return nil
	end

	return 
end
slot5 = 1
math.UP = Vector3(slot2, 0, 0)
slot5 = -1
math.DOWN = Vector3(slot2, 0, 0)
math.Z = math.UP
slot5 = 0
math.X = Vector3(slot2, 1, 0)
slot5 = 0
math.Y = Vector3(slot2, 0, 1)
math.rand = function (a, b)
	if b then
		return math.random() * (b - a) + a
	else
		return math.random() * a
	end

	return 
end
math.round = function (n, precision)
	precision = precision or 1
	slot4 = (n + precision / 2) / precision

	return math.floor(slot3) * precision
end
math.min_max = function (a, b)
	if a < b then
		return a, b
	else
		return b, a
	end

	return 
end
math.vector_min_max = function (a, b)
	local min_x, max_x = math.min_max(slot3, a.x)
	local min_y, max_y = math.min_max(b.x, a.y)
	local min_z, max_z = math.min_max(b.y, a.z)
	slot12 = min_z
	local min_vector = Vector3(b.z, min_x, min_y)
	slot13 = max_z
	local max_vector = Vector3(min_x, max_x, max_y)

	return min_vector, max_vector
end
math.vector_clamp = function (vector, min, max)
	slot5 = min

	if CoreClass.type_name(slot4) ~= "Vector3" then
		slot7 = min
		min = Vector3(slot4, min, min)
	end

	slot5 = max

	if CoreClass.type_name(slot4) ~= "Vector3" then
		slot7 = max
		max = Vector3(slot4, max, max)
	end

	slot9 = max.x
	slot10 = max.y
	slot6 = math.clamp(vector.x, vector.y, min.y)
	slot11 = max.z

	return Vector3(slot4, math.clamp(slot6, vector.x, min.x), math.clamp(vector.y, vector.z, min.z))
end
math.lerp = function (a, b, t)
	return a * (1 - t) + b * t
end
math.string_to_rotation = function (v)
	local r = math.string_to_vector(slot2)
	slot6 = r.z

	return Rotation(v, r.x, r.y)
end
math.vector_to_string = function (v)
	slot3 = v.x
	slot5 = v.y
	slot7 = v.z

	return tostring(slot2) .. " " .. tostring(slot4) .. " " .. tostring(slot6)
end
math.spline = function (points, t)
	local mu = t * t
	local a0 = points[4] - points[3] - points[1] + points[2]
	local a1 = points[1] - points[2] - a0
	local a2 = points[3] - points[1]
	local a3 = points[2]

	return a0 * t * mu + a1 * mu + a2 * t + a3
end
math.spline_len = function (points, n)
	local len = 0
	local old_p = points[1]

	for i = 1, n, 1 do
		slot11 = i / n
		local p = math.spline(slot9, points)
		slot11 = p - old_p
		len = len + p - old_p.length(points)
		old_p = p
	end

	return len
end
math.bezier = function (points, t)
	local p1 = points[1]
	local p2 = points[2]
	local p3 = points[3]
	local p4 = points[4]
	local t_squared = t * t
	local t_cubed = t_squared * t
	local a1 = p1 * (1 - t) * (1 - t) * (1 - t)
	local a2 = 3 * p2 * t * (1 - t) * (1 - t)
	local a3 = 3 * p3 * t_squared * (1 - t)
	local a4 = p4 * t_cubed

	return a1 + a2 + a3 + a4
end
math.linear_bezier = function (points, t)
	local p1 = points[1]
	local p2 = points[2]

	return p1 * (1 - t) + p2 * t
end
math.quadratic_bezier = function (points, t)
	local p1 = points[1]
	local p2 = points[2]
	local p3 = points[3]

	return p1 * (1 - t) * (1 - t) + p2 * 2 * t * (1 - t) + p3 * t * t
end
math.bezier_len = function (points, n)
	local len = 0
	local old_p = points[1]

	for i = 1, n, 1 do
		slot11 = i / n
		local p = math.bezier(slot9, points)
		slot11 = p - old_p
		len = len + p - old_p.length(points)
		old_p = p
	end

	return len
end
math.point_on_line = function (l1, l2, p)
	local u = (p.x - l1.x) * (l2.x - l1.x) + (p.y - l1.y) * (l2.y - l1.y) + (p.z - l1.z) * (l2.z - l1.z)
	slot10 = l2 - l1
	slot9 = 2
	slot8 = 1
	local u = math.clamp(l2.z - l1.z, u / math.pow(slot7, l2 - l1.length(slot9)), 0)
	local x = l1.x + u * (l2.x - l1.x)
	local y = l1.y + u * (l2.y - l1.y)
	local z = l1.z + u * (l2.z - l1.z)
	slot12 = z

	return Vector3(l1.z, x, y)
end
math.distance_to_line = function (l1, l2, p)
	slot7 = p
	local closest_point = math.point_on_line(slot4, l1, l2)
	slot6 = closest_point - p

	return closest_point - p.length(l1), closest_point
end
math.limitangle = function (angle)
	slot4 = 360
	local newangle = math.fmod(slot2, angle)

	if newangle < 0 then
		newangle = newangle + 360
	end

	return newangle
end
math.world_to_obj = function (obj, point)
	if obj == nil then
		return point
	end

	local vec = point - obj.position(slot3)
	slot5 = vec
	slot8 = obj
	slot8 = obj.rotation(slot7)

	return vec.rotate_with(obj, obj.rotation(slot7).inverse(slot7))
end
math.obj_to_world = function (obj, point)
	if obj == nil then
		return point
	end

	slot7 = obj
	local vec = point.rotate_with(slot3, obj.rotation(slot6))
	slot5 = obj

	return vec + obj.position(point)
end
math.within = function (x, min, max)
	return min <= x and x <= max
end
math.shuffle = function (array)
	for i = #array, 2, -1 do
		slot7 = i
		local j = math.random(slot6)
		local temp = array[i]
		array[i] = array[j]
		array[j] = temp
	end

	return 
end

return 
