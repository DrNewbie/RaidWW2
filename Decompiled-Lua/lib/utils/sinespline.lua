SineSpline = SineSpline or class()
function SineSpline:init(position_table, nr_subseg, curviness, first_control_point, last_control_point)
	self._segments = position_table
	self._manual_first_control_point = first_control_point
	self._manual_last_control_point = last_control_point
	self._curviness = curviness
	self._nr_subseg = nr_subseg
	self._control_points = {}

	if first_control_point then
		self._control_points[1] = {
			p2 = first_control_point
		}
	end

	if last_control_point then
		self._control_points[#position_table] = {
			p1 = last_control_point
		}
	end

	return 
end
function SineSpline:prepare_walk_data(backward)
	if 1 < #self._segments then
		self._mvec3_1 = Vector3()
		self._mvec3_2 = Vector3()

		if backward then
			local nr_seg = #self._segments

			if not self._control_points[nr_seg - 1] then
				slot6 = nr_seg - 1

				self._extract_control_points_at_index(slot4, self)
			end

			if not self._control_points[nr_seg] then
				slot6 = nr_seg

				self._extract_control_points_at_index(slot4, self)
			end

			local next_subseg = self._segments[nr_seg]
			slot11 = self._control_points[nr_seg - 1].p2
			local cur_subseg = self._position_at_time_on_segment(slot5, self, (self._nr_subseg - 1) / self._nr_subseg, self._segments[nr_seg - 1], self._segments[nr_seg], self._control_points[nr_seg].p1)
			slot8 = next_subseg
			local subseg_len = mvector3.distance(self, cur_subseg)
			local playtime_data = {
				seg_i = nr_seg - 1,
				subseg_i = self._nr_subseg - 1,
				subseg_start = cur_subseg,
				subseg_end = next_subseg,
				subseg_dis = subseg_len,
				subseg_len = subseg_len
			}
			self._playtime_data = playtime_data
		else
			if not self._control_points[2] then
				slot5 = 2

				self._extract_control_points_at_index(slot3, self)
			end

			if not self._control_points[1] then
				slot5 = 1

				self._extract_control_points_at_index(slot3, self)
			end

			local cur_subseg = self._segments[1]
			slot10 = self._control_points[1].p2
			local next_subseg = self._position_at_time_on_segment(slot4, self, 1 / self._nr_subseg, cur_subseg, self._segments[2], self._control_points[2].p1)
			slot7 = next_subseg
			local subseg_len = mvector3.distance(self, cur_subseg)
			local playtime_data = {
				seg_i = 1,
				subseg_i = 1,
				subseg_start = cur_subseg,
				subseg_end = next_subseg,
				subseg_dis = 0,
				subseg_len = subseg_len
			}
			self._playtime_data = playtime_data
		end
	end

	return 
end
function SineSpline:delete_walk_data()
	self._mvec3_1 = nil
	self._mvec3_2 = nil
	self._control_points = {}
	self._playtime_data = nil

	return 
end
function SineSpline:_position_at_time_on_segment(seg_t, pos_start, pos_end, p1, p2)
	slot11 = seg_t

	mvector3.lerp(slot7, self._mvec3_1, pos_start, p2)

	slot11 = seg_t

	mvector3.lerp(slot7, self._mvec3_2, p1, pos_end)

	local xpo = (math.sin(slot7) + 1) * self._curviness
	slot11 = xpo

	return math.lerp((seg_t * 2 - 1) * 90, self._mvec3_1, self._mvec3_2)
end
function SineSpline:walk(delta_dis)
	local result_pos = nil

	if 1 < #self._segments then
		local segments = self._segments
		local play_data = self._playtime_data
		local new_subseg_dis = play_data.subseg_dis + delta_dis

		if new_subseg_dis < 0 then
			local undershot = new_subseg_dis

			repeat
				if play_data.subseg_i == 1 then
					if play_data.seg_i == 1 then
						play_data.subseg_dis = 0

						return segments[1], undershot
					else
						play_data.seg_i = play_data.seg_i - 1

						if not self._control_points[play_data.seg_i] then
							slot10 = play_data.seg_i

							self._extract_control_points_at_index(slot8, self)
						end

						play_data.subseg_i = self._nr_subseg
						slot14 = self._control_points[play_data.seg_i].p2
						play_data.subseg_start = self._position_at_time_on_segment(slot8, self, (self._nr_subseg - 1) / self._nr_subseg, segments[play_data.seg_i], segments[play_data.seg_i + 1], self._control_points[play_data.seg_i + 1].p1)
						play_data.subseg_end = segments[play_data.seg_i + 1]
						slot10 = play_data.subseg_end
						play_data.subseg_len = mvector3.distance(slot8, play_data.subseg_start)
						new_subseg_dis = play_data.subseg_len + undershot
					end
				else
					play_data.subseg_i = play_data.subseg_i - 1
					play_data.subseg_end = play_data.subseg_start
					slot14 = self._control_points[play_data.seg_i].p2
					play_data.subseg_start = self._position_at_time_on_segment(slot8, self, play_data.subseg_i / self._nr_subseg, segments[play_data.seg_i], segments[play_data.seg_i + 1], self._control_points[play_data.seg_i + 1].p1)
					slot10 = play_data.subseg_end
					play_data.subseg_len = mvector3.distance(slot8, play_data.subseg_start)
					new_subseg_dis = play_data.subseg_len + undershot
				end
			until 0 < new_subseg_dis

			play_data.subseg_dis = new_subseg_dis
			slot11 = play_data.subseg_dis / play_data.subseg_len

			return math.lerp(slot8, play_data.subseg_start, play_data.subseg_end), play_data.subseg_i == 1 and undershot
		else
			while play_data.subseg_len < new_subseg_dis do
				local overshot = new_subseg_dis - play_data.subseg_len

				if play_data.subseg_i == self._nr_subseg then
					if play_data.seg_i == #segments - 1 then
						play_data.subseg_dis = play_data.subseg_len

						return segments[#segments], overshot
					else
						play_data.seg_i = play_data.seg_i + 1

						if not self._control_points[play_data.seg_i + 1] then
							slot10 = play_data.seg_i + 1

							self._extract_control_points_at_index(slot8, self)
						end

						play_data.subseg_i = 1
						play_data.subseg_start = segments[play_data.seg_i]
						slot14 = self._control_points[play_data.seg_i].p2
						play_data.subseg_end = self._position_at_time_on_segment(slot8, self, 1 / self._nr_subseg, segments[play_data.seg_i], segments[play_data.seg_i + 1], self._control_points[play_data.seg_i + 1].p1)
						slot10 = play_data.subseg_end
						play_data.subseg_len = mvector3.distance(slot8, play_data.subseg_start)
						new_subseg_dis = overshot
					end
				else
					play_data.subseg_i = play_data.subseg_i + 1
					play_data.subseg_start = play_data.subseg_end
					slot14 = self._control_points[play_data.seg_i].p2
					play_data.subseg_end = self._position_at_time_on_segment(slot8, self, play_data.subseg_i / self._nr_subseg, segments[play_data.seg_i], segments[play_data.seg_i + 1], self._control_points[play_data.seg_i + 1].p1)
					slot10 = play_data.subseg_end
					play_data.subseg_len = mvector3.distance(slot8, play_data.subseg_start)
					new_subseg_dis = overshot
				end
			end
		end

		play_data.subseg_dis = new_subseg_dis
		slot10 = play_data.subseg_dis / play_data.subseg_len

		return math.lerp(slot7, play_data.subseg_start, play_data.subseg_end), play_data.subseg_i == self._nr_subseg and play_data.subseg_len - play_data.subseg_dis
	else
		return self._segments[1]
	end

	return 
end
function SineSpline:_extract_control_points_at_index(index)
	local segments = self._segments
	local control_points = self._control_points
	local pos = segments[index]
	local segment_control_points = {}

	if index == #segments then
		if control_points[#segments - 1] then
			local last_seg = pos - segments[#segments - 1]
			local last_vec = (control_points[#segments - 1].p2 or segments[1]) - segments[#segments - 1]
			slot11 = last_seg
			local last_angle = last_vec.angle(slot9, last_vec)
			slot12 = last_vec
			local last_rot = last_seg.cross(last_vec, last_seg)
			slot13 = 180 - 2 * last_angle
			last_rot = Rotation(last_seg, last_rot)
			slot13 = last_rot
			local w_vec = pos + last_vec.rotate_with(last_seg, last_vec)
			segment_control_points.p1 = w_vec
		else
			segment_control_points.p1 = pos
		end
	elseif index == 1 then
		if control_points[2] then
			local first_vec = control_points[2].p1 - segments[2]
			local first_seg = segments[2] - segments[1]
			slot11 = first_seg
			local first_angle = first_vec.angle(slot9, first_vec)
			slot12 = first_vec
			local first_rot = first_seg.cross(first_vec, first_seg)
			slot13 = 180 - 2 * first_angle
			first_rot = Rotation(first_seg, first_rot)
			slot14 = first_rot
			local w_vec = segments[1] + first_vec.rotate_with(first_rot, first_vec)
			segment_control_points.p2 = w_vec
		else
			segment_control_points.p2 = pos
		end
	else
		local tan_seg = segments[index + 1] - segments[index - 1]
		slot13 = segments[index - 1]
		slot10 = mvector3.distance(slot11, pos) * self._curviness

		mvector3.set_length(slot8, tan_seg)

		segment_control_points.p1 = pos - tan_seg
		slot13 = segments[index + 1]
		slot10 = mvector3.distance(self._curviness, pos) * self._curviness

		mvector3.set_length(slot8, tan_seg)

		segment_control_points.p2 = pos + tan_seg
	end

	self._control_points[index] = segment_control_points

	return 
end

return 
