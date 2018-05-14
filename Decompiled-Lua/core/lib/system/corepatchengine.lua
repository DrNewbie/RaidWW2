-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
Idstring.id = function (self)
	return self
end
string.id = function (self)
	slot3 = self

	return Idstring(slot2)
end
string.t = function (self)
	slot3 = self
	slot3 = Idstring(slot2)

	return Idstring(slot2).t(slot2)
end
string.s = function (self)
	return self
end
string.key = function (self)
	slot3 = self
	slot3 = Idstring(slot2)

	return Idstring(slot2).key(slot2)
end
string.raw = function (self)
	slot3 = self
	slot3 = Idstring(slot2)

	return Idstring(slot2).raw(slot2)
end

if Vector3 then
	Vector3.__concat = function (o1, o2)
		slot5 = o2

		return tostring(slot3) .. tostring(o1)
	end
	Vector3.flat = function (self, v)
		slot7 = self
		slot5 = v

		return math.cross(slot3, math.cross(slot5, v))
	end
	Vector3.orthogonal = function (self, ratio)
		slot4 = self
		slot4 = ratio

		return 
		-- Decompilation error in this vicinity:
		self.orthogonal_func(slot3)(slot3)
	end
	Vector3.orthogonal_func = function (self, start_dir)
		slot2 = Rotation
		slot4 = self

		if not start_dir then
			slot9 = -1
			slot5 = Vector3(slot6, 0, 0)
		end

		local rot = slot2(slot3, slot4)

		return function (ratio)
			slot4 = 180 + 360 * ratio
			slot5 = 90 + 360 * ratio
			slot3 = -rot.z(slot2) * math.cos(rot) + rot.x(rot) * math.cos(rot)

			return -rot.z(slot2) * math.cos(rot) + rot.x(rot) * math.cos(rot).normalized(rot.x(rot) * math.cos(rot))
		end
	end
	Vector3.unpack = function (self)
		return self.x, self.y, self.z
	end
end

if Color then
	Color.unpack = function (self)
		return self.r, self.g, self.b
	end
end

slot2 = Application
local AppClass = getmetatable(slot1)

if AppClass then
	AppClass.draw_box = function (self, s_pos, e_pos, r, g, b)
		slot14 = s_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, s_pos, Vector3(slot11, e_pos.x, s_pos.y), r, g)

		slot14 = s_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, s_pos, Vector3(r, s_pos.x, e_pos.y), r, g)

		slot13 = s_pos.z
		slot14 = s_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, Vector3(Vector3(r, s_pos.x, e_pos.y), e_pos.x, e_pos.y), Vector3(e_pos.x, s_pos.x, e_pos.y), r, g)

		slot13 = s_pos.z
		slot14 = s_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, Vector3(Vector3(e_pos.x, s_pos.x, e_pos.y), e_pos.x, e_pos.y), Vector3(e_pos.x, e_pos.x, s_pos.y), r, g)

		slot14 = e_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, s_pos, Vector3(r, s_pos.x, s_pos.y), r, g)

		slot13 = s_pos.z
		slot14 = e_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, Vector3(Vector3(r, s_pos.x, s_pos.y), s_pos.x, e_pos.y), Vector3(s_pos.x, s_pos.x, e_pos.y), r, g)

		slot13 = s_pos.z
		slot14 = e_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, Vector3(Vector3(s_pos.x, s_pos.x, e_pos.y), e_pos.x, s_pos.y), Vector3(e_pos.x, e_pos.x, s_pos.y), r, g)

		slot13 = s_pos.z
		slot14 = e_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, Vector3(Vector3(e_pos.x, e_pos.x, s_pos.y), e_pos.x, e_pos.y), Vector3(e_pos.x, e_pos.x, e_pos.y), r, g)

		slot13 = e_pos.z
		slot14 = e_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, Vector3(Vector3(e_pos.x, e_pos.x, e_pos.y), s_pos.x, s_pos.y), Vector3(s_pos.x, e_pos.x, s_pos.y), r, g)

		slot13 = e_pos.z
		slot14 = e_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, Vector3(Vector3(s_pos.x, e_pos.x, s_pos.y), s_pos.x, s_pos.y), Vector3(s_pos.x, s_pos.x, e_pos.y), r, g)

		slot13 = e_pos.z
		slot14 = e_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, Vector3(Vector3(s_pos.x, s_pos.x, e_pos.y), e_pos.x, e_pos.y), Vector3(e_pos.x, s_pos.x, e_pos.y), r, g)

		slot13 = e_pos.z
		slot14 = e_pos.z
		slot13 = b

		Application.draw_line(slot7, Application, Vector3(Vector3(e_pos.x, s_pos.x, e_pos.y), e_pos.x, e_pos.y), Vector3(e_pos.x, e_pos.x, s_pos.y), r, g)

		return 
	end
	AppClass.draw_box_rotation = function (self, pos, rot, width, depth, height, r, g, b)
		local c1 = pos
		local c2 = pos + rot.x(slot11) * width
		local c3 = pos + rot.y(rot) * depth
		slot15 = rot
		local c4 = pos + rot.x(rot) * width + rot.y(rot) * depth
		local c5 = c1 + rot.z(rot) * height
		local c6 = c2 + rot.z(rot) * height
		local c7 = c3 + rot.z(rot) * height
		local c8 = c4 + rot.z(rot) * height
		slot24 = b

		Application.draw_line(rot, Application, c1, c2, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c1, c3, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c2, c4, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c3, c4, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c1, c5, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c2, c6, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c3, c7, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c4, c8, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c5, c6, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c5, c7, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c6, c8, r, g)

		slot24 = b

		Application.draw_line(rot, Application, c7, c8, r, g)

		return 
	end
	AppClass.draw_rotation_size = function (self, pos, rot, size)
		slot10 = rot
		slot11 = 0

		Application.draw_line(slot5, Application, pos, pos + rot.x(slot9) * size, 1, 0)

		slot10 = rot
		slot11 = 0

		Application.draw_line(slot5, Application, pos, pos + rot.y(1) * size, 0, 1)

		slot10 = rot
		slot11 = 1

		Application.draw_line(slot5, Application, pos, pos + rot.z(0) * size, 0, 0)

		return 
	end
	AppClass.draw_arrow = function (self, from, to, r, g, b, scale)
		scale = scale or 1
		local len = to - from.length(slot8)
		slot10 = to - from
		local dir = to - from.normalized(to - from)
		local arrow_end_pos = from + dir * (len - 100 * scale)
		slot18 = b

		Application.draw_cylinder(slot11, Application, from, arrow_end_pos, 10 * scale, r, g)

		slot18 = b

		Application.draw_cone(slot11, Application, to, arrow_end_pos, 40 * scale, r, g)

		return 
	end
	AppClass.stack_dump_error = function (self, ...)
		slot3 = Application

		Application.error(slot2, ...)

		slot3 = Application

		Application.stack_dump(slot2)

		return 
	end
end

if Draw then
	slot3 = Draw

	Draw.pen(slot2)

	Pen.arrow = function (self, from, to, scale)
		scale = scale or 1
		local len = to - from.length(slot5)
		slot7 = to - from
		local dir = to - from.normalized(to - from)
		local arrow_end_pos = from + dir * (len - 100 * scale)
		slot12 = 10 * scale

		self.cylinder(slot8, self, from, arrow_end_pos)

		slot12 = 40 * scale

		self.cone(slot8, self, to, arrow_end_pos)

		return 
	end
end

slot3 = Steam
local SteamClass = getmetatable(slot2)

if SteamClass then
	local steam_http_request = Steam.http_request
	local requests = {}
	local current_request, check_requests_func, request_done_func = nil

	function request_done_func(success, page)
		if current_request then
			local request_clbk = current_request[2]
			current_request = nil
			slot6 = page

			request_clbk(slot4, success)
		end

		check_requests_func()

		return 
	end

	function check_requests_func()
		if not current_request then
			slot3 = 1
			current_request = table.remove(slot1, requests)

			if current_request then
				slot4 = request_done_func

				steam_http_request(slot1, Steam, current_request[1])
			end
		end

		return 
	end

	SteamClass.http_request = function (self, path, clbk, id_key)
		if id_key then
			if current_request and current_request[3] and current_request[3] == id_key then
				return 
			end

			slot6 = requests

			for _, d in ipairs(slot5) do
				if d[3] and d[3] == id_key then
					requests[_] = {
						path,
						clbk,
						id_key
					}

					check_requests_func()

					return 
				end
			end
		end

		slot7 = {
			path,
			clbk,
			id_key
		}

		table.insert(slot5, requests)
		check_requests_func()

		return 
	end
end

return 
