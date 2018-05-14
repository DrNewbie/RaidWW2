local sqrt = math.sqrt
local abs = math.abs
local min = math.min
local max = math.max
local sin = math.sin
local cos = math.cos
local radians = math.rad
local degrees = math.deg
local atan2 = math.atan2

local function hypot(a, b)
	if a == 0 and b == 0 then
		return 0
	end

	slot5 = b
	b = abs(a)
	a = abs(slot3)
	slot5 = b
	slot6 = b
	b = min(a, a)
	a = max(abs(a), a)
	slot4 = 1 + (b / a)^2

	return a * sqrt(min(a, a))
end

local function distance(x1, y1, x2, y2)
	slot7 = y2 - y1

	return hypot(slot5, x2 - x1)
end

local function distance2(x1, y1, x2, y2)
	return (x2 - x1)^2 + (y2 - y1)^2
end

local function point_around(cx, cy, r, angle)
	slot6 = angle
	angle = radians(slot5)
	slot7 = angle

	return cx + cos(slot5) * r, cy + sin(angle) * r
end

local function rotate_point(x, y, cx, cy, angle)
	if angle == 0 then
		return x, y
	end

	slot7 = angle
	angle = radians(slot6)
	y = y - cy
	x = x - cx
	local c = cos(slot6)
	slot8 = angle
	local s = sin(angle)

	return (cx + x * c) - y * s, cy + y * c + x * s
end

local function point_angle(x, y, cx, cy)
	slot9 = x - cx

	return degrees(atan2(slot7, y - cy))
end

local function reflect_point(x, y, cx, cy)
	return 2 * cx - x, 2 * cy - y
end

local function reflect_point_distance(x, y, cx, cy, length)
	slot10 = cy
	local d = distance(slot6, x, y, cx)

	if d == 0 then
		return cx, cy
	end

	local scale = length / d

	return cx + (cx - x) * scale, cy + (cy - y) * scale
end

return {
	hypot = hypot,
	distance = distance,
	distance2 = distance2,
	point_around = point_around,
	rotate_point = rotate_point,
	point_angle = point_angle,
	reflect_point = reflect_point,
	reflect_point_distance = reflect_point_distance
}
