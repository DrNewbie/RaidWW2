-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
ZipLine = ZipLine or class()
ZipLine.DEBUG = false
ZipLine.TYPES = {
	"person",
	"bag"
}
ZipLine.NET_EVENTS = {
	request_access = 1,
	access_denied = 2,
	access_granted = 3,
	set_user = 4,
	remove_user = 5,
	request_attach_bag = 6,
	attach_bag_denied = 7,
	attach_bag_granted = 8
}
slot2 = "rope"
local ids_rope_obj = Idstring(8)
function ZipLine:init(unit)
	self._unit = unit
	slot5 = ids_rope_obj
	self._rope_obj = unit.get_object(slot3, unit)
	slot5 = self._usage_type or "person"

	self.set_usage_type(slot3, self)

	slot4 = Draw
	slot8 = 1
	self._wire_brush = Draw.brush(slot3, Color.black.with_alpha(slot6, Color.black))
	self._current_time = 0
	self._dirty = true
	self._start_pos = self._unit.position(slot3)
	slot5 = self._unit
	slot5 = self._unit.rotation(self._unit)
	self._end_pos = self._start_pos + self._unit.rotation(self._unit).y(self._unit) * 1000
	self._speed = 1000
	self._slack = 0

	self._update_total_time(self._unit.rotation(self._unit).y(self._unit) * 1000)

	self._line_data = {
		offset = Vector3(self, 0, 0)
	}
	slot5 = self._start_pos
	self._line_data.pos = mvector3.copy(self)
	self._line_data.current_dir = Vector3()
	self._sled_data = {
		len = 200
	}
	slot5 = self._unit
	slot8 = "move"
	self._sled_data.object = self._unit.get_object(self, Idstring(200))
	self._sled_data.pos = Vector3()
	self._sled_data.tip1 = Vector3()
	slot3 = Vector3()
	self._sled_data.tip2 = slot3
	slot5 = "zipline"
	self._sound_source = SoundDevice.create_source(slot3, SoundDevice)
	slot5 = self._sled_data.object

	self._sound_source.link(slot3, self._sound_source)

	slot4 = self

	self._update_pos_data(slot3)

	slot5 = true

	self.set_enabled(slot3, self)

	return 
end
function ZipLine:update(unit, t, dt)
	if not self._enabled then
		return 
	end

	slot8 = dt

	self._update_sled(slot5, self, t)

	slot8 = dt

	self._update_sounds(slot5, self, t)

	if ZipLine.DEBUG then
		slot8 = dt

		self.debug_draw(slot5, self, t)
	end

	return 
end
local mvec1 = Vector3()
local mvec2 = Vector3()
function ZipLine:_update_sled(t, dt)
	local current_time = self._current_time

	if self._attached_bag then
		slot6 = self._attached_bag

		if alive(slot5) then
			slot7 = self._current_time + dt / self._total_time
			self._current_time = math.min(slot5, 1)
			slot8 = self._current_time
			local dir = math.lerp(slot5, self._line_data.dir_s, self._line_data.dir_e)
			slot8 = math.UP
			local rot = Rotation(self._line_data.dir_s, dir)
			slot9 = rot

			self._attached_bag.set_rotation(dir, self._attached_bag)

			slot9 = self._current_time
			local pos = self.update_and_get_pos_at_time(dir, self)
			slot10 = pos

			mvector3.set(self, mvec1)

			slot10 = math.UP

			mvector3.set(self, mvec2)

			slot10 = 180

			mvector3.multiply(self, mvec2)
			mvector3.add(self, mvec1)

			slot11 = rot
			slot9 = rot.y(mvec2)
			slot10 = math.UP
			local dot = mvector3.dot(self, slot9)
			slot11 = dir

			mvector3.set(slot9, mvec2)

			slot11 = 20 * dot

			mvector3.multiply(slot9, mvec2)

			slot11 = mvec2

			mvector3.add(slot9, mvec1)

			slot10 = mvec2
			slot13 = rot

			mvector3.set(slot9, rot.z(slot12))

			slot13 = dot
			slot11 = math.abs(slot12) * -5 - 3

			mvector3.multiply(slot9, mvec2)

			slot11 = mvec2

			mvector3.add(slot9, mvec1)

			slot13 = rot
			slot11 = rot.x(slot12) * self._attached_bag_offset.x

			mvector3.add(slot9, mvec1)

			slot13 = rot
			slot11 = rot.y(self._attached_bag_offset.x) * self._attached_bag_offset.y

			mvector3.add(slot9, mvec1)

			slot13 = rot
			slot11 = rot.z(self._attached_bag_offset.y) * self._attached_bag_offset.z

			mvector3.add(slot9, mvec1)

			slot11 = mvec1

			self._attached_bag.set_position(slot9, self._attached_bag)

			if self._current_time == 1 then
				slot11 = self._attached_bag

				self.release_bag(slot9, self)
			end
		else
			self._attached_bag = nil
		end
	else
		slot6 = self._user_unit

		if not alive(slot5) and self._current_time ~= 0 then
			slot7 = self._current_time - dt / self._total_time
			self._current_time = math.max(slot5, 0)
			slot7 = self._current_time

			self.update_and_get_pos_at_time(slot5, self)

			if self._current_time == 0 then
				slot6 = self

				self._check_interaction_active_state(slot5)
			end
		elseif self._synced_user then
		end
	end

	self._dirty = self._current_time ~= current_time or self._dirty
	slot6 = self

	self._check_dirty(slot5)

	if self._synced_user then
		slot6 = self._user_unit

		if alive(slot5) and self._sled_data.object then
			slot7 = self._sled_data.object
			slot7 = self._sled_data.object.rotation(self._sled_data.object)
			local pos = self._sled_data.object.position(slot5) + self._sled_data.object.rotation(self._sled_data.object).z(self._sled_data.object) * -22
			slot10 = 1

			self._wire_brush.cylinder(self._sled_data.object, self._wire_brush, pos, pos + math.UP * -100)

			slot9 = 2

			self._wire_brush.sphere(self._sled_data.object, self._wire_brush, pos)
		end
	end

	return 
end
function ZipLine:_update_sounds(t, dt)
	if self._current_time ~= 0 and not self._running then
		self._sound_data = {}
		slot6 = self._sled_data.pos
		slot4 = mvector3.copy(slot5)
		self._sound_data.last_pos = slot4
		slot6 = "zipline_hook"

		self._sound_source.post_event(slot4, self._sound_source)

		slot6 = "zipline_start"

		self._sound_source.post_event(slot4, self._sound_source)

		self._running = true
	elseif self._current_time == 0 and self._running then
		self._sound_data = nil
		slot6 = "zipline_stop"

		self._sound_source.post_event(slot4, self._sound_source)

		self._running = false
	elseif self._running then
		local speed = mvector3.length(slot4) / dt
		slot7 = self._sled_data.pos

		mvector3.set(self._sled_data.pos - self._sound_data.last_pos, self._sound_data.last_pos)

		slot8 = 1500
		local rtpc = math.clamp(self._sled_data.pos - self._sound_data.last_pos, speed, 0) / 1500
		slot9 = rtpc

		self._sound_source.set_rtpc(speed, self._sound_source, "zipline_speed")

		if not self._sound_data.has_hooked_off then
			slot7 = self._attached_bag

			if not alive(slot6) then
				slot7 = self._user_unit

				if not alive(slot6) then
					slot8 = "zipline_unhook"

					self._sound_source.post_event(slot6, self._sound_source)

					self._sound_data.has_hooked_off = true
				end
			end
		end
	end

	return 
end
function ZipLine:_check_dirty()
	if not self._dirty then
		return 
	end

	self._dirty = nil
	slot6 = self._current_time

	mvector3.lerp(slot2, self._line_data.current_dir, self._line_data.dir_s, self._line_data.dir_e)

	local len = 16
	slot5 = self._line_data.current_dir

	mvector3.set(self._line_data.current_dir, self._sled_data.tip1)

	slot5 = -len

	mvector3.multiply(self._line_data.current_dir, self._sled_data.tip1)

	slot5 = self._sled_data.pos

	mvector3.add(self._line_data.current_dir, self._sled_data.tip1)

	slot5 = self._line_data.current_dir

	mvector3.set(self._line_data.current_dir, self._sled_data.tip2)

	slot5 = len

	mvector3.multiply(self._line_data.current_dir, self._sled_data.tip2)

	slot5 = self._sled_data.pos

	mvector3.add(self._line_data.current_dir, self._sled_data.tip2)

	slot4 = self

	self._update_sled_object(self._line_data.current_dir)

	slot5 = {
		self._line_data.start_pos,
		self._sled_data.tip1,
		self._sled_data.tip2,
		self._line_data.end_pos
	}

	self._rope_obj.set_control_points(self._line_data.current_dir, self._rope_obj)

	return 
end
function ZipLine:_update_sled_object()
	if self._sled_data.object then
		slot4 = self._sled_data.pos

		self._sled_data.object.set_position(slot2, self._sled_data.object)

		slot3 = self._sled_data.object
		slot7 = math.UP

		self._sled_data.object.set_rotation(slot2, Rotation(slot5, self._line_data.current_dir))

		slot3 = self._unit

		self._unit.set_moving(slot2)

		slot3 = self._unit
		slot3 = self._unit.interaction(slot2)

		if self._unit.interaction(slot2).active(slot2) then
			slot3 = self._unit
			slot3 = self._unit.interaction(slot2)

			self._unit.interaction(slot2).external_upd_interaction_topology(slot2)
		end
	end

	return 
end
function ZipLine:_check_interaction_active_state()
	if not self._enabled then
		slot3 = self._unit
		slot4 = false

		self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2))

		return 
	end

	slot3 = self._unit
	slot6 = self
	slot4 = not self.is_interact_blocked(slot5)

	self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2))

	return 
end
function ZipLine:is_interact_blocked()
	if self._booked_by_peer_id then
		return true
	end

	if self._booked_bag_peer_id then
		return true
	end

	slot3 = self._attached_bag

	if alive(slot2) then
		return true
	end

	if self._current_time == 0 then
		slot5 = self
		slot1 = alive(self.user_unit(slot4))

		if alive(self.user_unit(slot4)) then
			slot1 = false
		end
	else
		slot1 = true
	end

	return slot1
end
function ZipLine:on_interacted(unit)
	slot4 = self

	if self.is_interact_blocked(slot3) then
		return 
	end

	slot4 = self

	if self.is_usage_type_bag(slot3) then
		slot4 = managers.player

		if managers.player.is_carrying(slot3) then
			slot4 = Network

			if Network.is_server(slot3) then
				slot5 = self._unit

				managers.player.drop_carry(slot3, managers.player)
			else
				slot5 = unit

				self._client_request_attach_bag(slot3, self)
			end

			return 
		end

		return 
	end

	slot4 = self

	if self.is_usage_type_person(slot3) then
		slot4 = Network

		if Network.is_server(slot3) then
			slot4 = self._user_unit

			if not alive(slot3) then
				slot5 = unit

				self.set_user(slot3, self)
			end
		else
			slot5 = unit

			self._client_request_access(slot3, self)
		end
	end

	return 
end
function ZipLine:_client_request_attach_bag(player)
	self._request_unit = player
	slot4 = player
	slot5 = true

	player.movement(slot3).set_carry_restriction(slot3, player.movement(slot3))

	slot4 = managers.network
	slot8 = self.NET_EVENTS.request_attach_bag

	managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "sync_unit_event_id_16", self._unit, "zipline")

	return 
end
function ZipLine:_attach_bag_response(granted)
	slot4 = self._request_unit

	if alive(slot3) then
		slot4 = self._request_unit
		slot5 = false

		self._request_unit.movement(slot3).set_carry_restriction(slot3, self._request_unit.movement(slot3))

		if granted then
			slot5 = self._unit

			managers.player.drop_carry(slot3, managers.player)
		end
	end

	self._request_unit = nil

	return 
end
function ZipLine:_client_request_access(unit)
	self._request_unit = unit
	slot4 = managers.network
	slot8 = self.NET_EVENTS.request_access

	managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "sync_unit_event_id_16", self._unit, "zipline")

	return 
end
function ZipLine:set_user(unit)
	local old_unit = self._user_unit
	self._user_unit = unit

	if self._user_unit then
		slot7 = self._user_unit

		self.run_sequence(slot4, self, "on_person_enter_zipline")

		slot5 = self._user_unit
		slot6 = self._unit

		self._user_unit.movement(slot4).on_enter_zipline(slot4, self._user_unit.movement(slot4))

		slot6 = self.NET_EVENTS.set_user

		self._send_net_event(slot4, self)
	else
		slot7 = old_unit

		self.run_sequence(slot4, self, "on_person_exit_zipline")

		slot6 = self.NET_EVENTS.remove_user

		self._send_net_event(slot4, self)
	end

	slot5 = self

	self._check_interaction_active_state(slot4)

	return 
end
function ZipLine:sync_set_user(unit)
	self._booked_by_peer_id = nil
	self._user_unit = unit
	slot4 = self._user_unit
	self._synced_user = (alive(slot3) and true) or nil

	if self._user_unit then
		slot6 = self._user_unit

		self.run_sequence(slot3, self, "on_person_enter_zipline")

		slot4 = self._user_unit
		slot5 = self._unit

		self._user_unit.movement(slot3).on_enter_zipline(slot3, self._user_unit.movement(slot3))
	end

	slot4 = self

	self._check_interaction_active_state(slot3)

	return 
end
function ZipLine:sync_remove_user()
	slot3 = self._user_unit

	if alive(slot2) then
		slot5 = self._user_unit

		self.run_sequence(slot2, self, "on_person_exit_zipline")
	end

	self._user_unit = nil
	self._synced_user = nil
	slot3 = self

	self._check_interaction_active_state(slot2)

	return 
end
function ZipLine:user_unit()
	return self._user_unit
end
function ZipLine:is_valid()
	return self._start_pos and self._end_pos and true
end
function ZipLine:set_speed(speed)
	if not speed then
		return 
	end

	self._speed = speed
	slot4 = self

	self._update_total_time(slot3)

	return 
end
function ZipLine:speed()
	return self._speed
end
function ZipLine:set_ai_ignores_bag(ai_ignores_bag)
	self._ai_ignores_bag = ai_ignores_bag

	return 
end
function ZipLine:ai_ignores_bag()
	return self._ai_ignores_bag
end
function ZipLine:set_slack(slack)
	if not slack then
		return 
	end

	self._slack = slack
	slot4 = self

	self._update_pos_data(slot3)

	return 
end
function ZipLine:slack()
	return self._slack
end
function ZipLine:set_total_time(total_time)
	self._total_time = total_time

	return 
end
function ZipLine:total_time()
	return self._total_time
end
function ZipLine:_update_total_time()
	slot7 = self
	slot6 = self.start_pos(slot5) - self.end_pos(self)
	slot4 = self.start_pos(slot5) - self.end_pos(self).length(self.end_pos(self)) / self._speed

	self.set_total_time(slot2, self)

	return 
end
function ZipLine:start_pos()
	return self._start_pos
end
function ZipLine:end_pos()
	return self._end_pos
end
function ZipLine:set_start_pos(pos)
	self._start_pos = pos
	slot4 = self

	self._update_pos_data(slot3)

	slot4 = self

	self._update_total_time(slot3)

	return 
end
function ZipLine:set_end_pos(pos)
	self._end_pos = pos
	slot4 = self

	self._update_pos_data(slot3)

	slot4 = self

	self._update_total_time(slot3)

	return 
end
function ZipLine:set_end_pos_by_line(pos)
	slot5 = pos - self._line_data.offset

	self.set_end_pos(slot3, self)

	return 
end
function ZipLine:_update_pos_data()
	slot3 = self

	if not self.is_valid(slot2) then
		return 
	end

	slot4 = self._start_pos

	mvector3.set(slot2, self._sled_data.pos)

	slot4 = self._line_data.offset

	mvector3.add(slot2, self._sled_data.pos)

	self._line_data.start_pos = self._start_pos + self._line_data.offset
	self._line_data.end_pos = self._end_pos + self._line_data.offset
	self._line_data.dir = self._line_data.end_pos - self._start_pos
	slot5 = 0.5
	self._line_data.dir_s = (self.pos_at_time(self._start_pos, self) + self._line_data.offset) - self._line_data.start_pos.normalized(self._line_data.start_pos)
	slot6 = 0.5
	slot4 = self._line_data.end_pos - (self.pos_at_time((self.pos_at_time(self._start_pos, self) + self._line_data.offset) - self._line_data.start_pos, self) + self._line_data.offset)
	slot2 = self._line_data.end_pos - (self.pos_at_time((self.pos_at_time(self._start_pos, self) + self._line_data.offset) - self._line_data.start_pos, self) + self._line_data.offset).normalized(self.pos_at_time((self.pos_at_time(self._start_pos, self) + self._line_data.offset) - self._line_data.start_pos, self) + self._line_data.offset)
	self._line_data.dir_e = slot2
	slot4 = 0

	mvector3.set_z(slot2, self._line_data.dir)

	slot3 = self._line_data.dir

	mvector3.normalize(slot2)

	slot4 = self._sled_data.pos

	mvector3.set(slot2, self._line_data.pos)

	self._dirty = true

	return 
end
function ZipLine:set_enabled(enabled)
	self._enabled = enabled

	if self._enabled then
	end

	slot4 = self

	self._check_interaction_active_state(slot3)

	return 
end
function ZipLine:set_usage_type(usage_type)
	if not usage_type then
		return 
	end

	self._usage_type = usage_type
	slot4 = self._unit
	slot7 = self
	slot5 = (self.is_usage_type_bag(slot6) and "bag_zipline") or "player_zipline"

	self._unit.interaction(slot3).set_tweak_data(slot3, self._unit.interaction(slot3))

	return 
end
function ZipLine:usage_type()
	return self._usage_type
end
function ZipLine:is_usage_type_person()
	return self._usage_type == "person"
end
function ZipLine:is_usage_type_bag()
	return self._usage_type == "bag"
end
function ZipLine:current_time()
	return self._current_time
end
function ZipLine:pos_at_current_time()
	slot4 = self._current_time

	return self.pos_at_time(slot2, self)
end
function ZipLine:update_and_get_pos_at_time(time)
	self._current_time = time
	self._dirty = true
	slot5 = time
	local pos = self.pos_at_time(slot3, self)
	slot6 = pos

	mvector3.set(self, self._sled_data.pos)

	slot6 = self._line_data.offset

	mvector3.add(self, self._sled_data.pos)

	slot6 = self._sled_data.pos

	mvector3.set(self, self._line_data.pos)

	slot5 = self

	self._check_dirty(self)

	return pos
end
local ease_bezier_points = {
	0,
	0,
	1,
	1
}
local slack_bezier_points = {
	0,
	1,
	0.5,
	0
}
function ZipLine:pos_at_time(time)
	slot5 = time
	local bezier_value = math.bezier(slot3, ease_bezier_points)
	slot7 = bezier_value
	local pos = math.lerp(ease_bezier_points, self._start_pos, self._end_pos)
	slot7 = bezier_value
	local slack_bezier = math.bezier(self._start_pos, slack_bezier_points)
	slot9 = slack_bezier
	local slack = math.lerp(slack_bezier_points, 0, self._slack)
	slot11 = pos
	slot9 = mvector3.z(slot10) - slack

	mvector3.set_z(0, pos)

	return pos
end
function ZipLine:current_direction()
	return self._line_data.current_dir
end
function ZipLine:sync_net_event(event_id, peer)
	local net_events = self.NET_EVENTS

	if event_id == net_events.request_access then
		slot6 = "! request_access"

		print(slot5)

		slot6 = self

		if self.is_interact_blocked(slot5) then
			slot6 = " blocked"

			print(slot5)

			slot10 = self.NET_EVENTS.access_denied

			peer.send_queued_sync(slot5, peer, "sync_unit_event_id_16", self._unit, "zipline")
		else
			slot6 = " allowed"

			print(slot5)

			slot6 = peer
			self._booked_by_peer_id = peer.id(slot5)
			slot10 = self.NET_EVENTS.access_granted

			peer.send_queued_sync(slot5, peer, "sync_unit_event_id_16", self._unit, "zipline")
		end
	elseif event_id == net_events.access_denied then
		slot6 = "! access_denied"

		print(slot5)

		self._request_unit = nil
	elseif event_id == net_events.access_granted then
		slot6 = "! access_granted"

		print(slot5)

		slot6 = self._request_unit

		if alive(slot5) then
			slot7 = self._request_unit

			self.set_user(slot5, self)
		end

		self._request_unit = nil
	elseif event_id == net_events.set_user then
		slot6 = "! set user"

		print(slot5)

		local unit = peer.unit(slot5)
		slot7 = unit

		if alive(peer) then
			slot8 = unit

			self.sync_set_user(slot6, self)
		end
	elseif event_id == net_events.remove_user then
		slot6 = "! remove user"

		print(slot5)

		slot6 = self

		self.sync_remove_user(slot5)
	elseif event_id == net_events.request_attach_bag then
		slot6 = "! net_events.request_attach_bag"

		print(slot5)

		slot6 = self

		if self.is_interact_blocked(slot5) then
			slot6 = " respons attach_bag_denied"

			print(slot5)

			slot10 = self.NET_EVENTS.attach_bag_denied

			peer.send_queued_sync(slot5, peer, "sync_unit_event_id_16", self._unit, "zipline")
		else
			slot6 = peer
			self._booked_bag_peer_id = peer.id(slot5)
			slot6 = " respons attach_bag_granted"

			print(slot5)

			slot10 = self.NET_EVENTS.attach_bag_granted

			peer.send_queued_sync(slot5, peer, "sync_unit_event_id_16", self._unit, "zipline")
		end
	elseif event_id == net_events.attach_bag_denied then
		slot6 = "! net_events.attach_bag_denied"

		print(slot5)

		slot7 = false

		self._attach_bag_response(slot5, self)
	elseif event_id == net_events.attach_bag_granted then
		slot6 = "! net_events.attach_bag_granted"

		print(slot5)

		slot7 = true

		self._attach_bag_response(slot5, self)
	end

	return 
end
function ZipLine:_send_net_event(event_id)
	slot4 = managers.network
	slot8 = event_id

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_unit_event_id_16", self._unit, "zipline")

	return 
end
function ZipLine:attach_bag(bag)
	self._booked_bag_peer_id = nil
	slot5 = "hinge_body_1"

	if not bag.body(slot3, bag) then
		slot5 = 0
		local body = bag.body(slot3, bag)
	end

	slot5 = body

	body.set_keyframed(slot4)

	self._attached_bag = bag
	slot5 = self._attached_bag
	local carry_id = self._attached_bag.carry_data(slot4).carry_id(slot4)
	slot7 = carry_id
	self._attached_bag_offset = tweak_data.carry.get_zipline_offset(self._attached_bag.carry_data(slot4), tweak_data.carry)
	self._bag_disabled_collisions = {}
	slot6 = bag
	local nr_bodies = bag.num_bodies(self._attached_bag.carry_data(slot4))

	for i_body = 0, nr_bodies - 1, 1 do
		slot12 = i_body
		local body = bag.body(slot10, bag)
		slot12 = body

		if body.collisions_enabled(bag) then
			slot12 = body

			body.set_keyframed(slot11)

			slot13 = body

			table.insert(slot11, self._bag_disabled_collisions)

			slot13 = false

			body.set_collisions_enabled(slot11, body)
		end
	end

	slot7 = self._attached_bag
	slot11 = math.UP

	self._attached_bag.set_rotation(slot6, Rotation(slot9, self._line_data.dir_s))

	slot7 = self._attached_bag
	slot8 = self._unit

	self._attached_bag.carry_data(slot6).set_zipline_unit(slot6, self._attached_bag.carry_data(slot6))

	slot7 = self

	self._check_interaction_active_state(slot6)

	slot9 = self._attached_bag

	self.run_sequence(slot6, self, "on_attached_bag")

	return 
end
function ZipLine:release_bag()
	slot4 = "hinge_body_1"

	if not self._attached_bag.body(slot2, self._attached_bag) then
		slot4 = 0
		local body = self._attached_bag.body(slot2, self._attached_bag)
	end

	slot4 = body

	body.set_dynamic(slot3)

	if self._bag_disabled_collisions then
		slot4 = self._bag_disabled_collisions

		for _, body in ipairs(slot3) do
			slot9 = body

			body.set_dynamic(slot8)

			slot10 = true

			body.set_collisions_enabled(slot8, body)
		end

		self._bag_disabled_collisions = nil
	end

	slot4 = self._attached_bag
	slot5 = nil

	self._attached_bag.carry_data(slot3).set_zipline_unit(slot3, self._attached_bag.carry_data(slot3))

	slot6 = self._attached_bag

	self.run_sequence(slot3, self, "on_detached_bag")

	self._attached_bag = nil

	return 
end
function ZipLine:run_sequence(sequence_name, user_unit)
	slot5 = self._unit
	slot6 = sequence_name

	if self._unit.damage(slot4).has_sequence(slot4, self._unit.damage(slot4)) then
		slot5 = self._unit
		slot7 = {
			unit = user_unit
		}

		self._unit.damage(slot4).run_sequence_simple(slot4, self._unit.damage(slot4), sequence_name)
	end

	return 
end
function ZipLine:destroy(unit)
	return 
end
function ZipLine:debug_draw(t, dt)
	slot5 = self

	if not self.is_valid(slot4) then
		return 
	end

	slot5 = Draw
	slot9 = 0.5
	local brush = Draw.brush(slot4, Color.white.with_alpha(slot7, Color.white))

	for i = 0, 1, 0.005 do
		slot14 = i

		brush.sphere(slot9, brush, self.pos_at_time(2, self))
	end

	slot8 = 200
	local offset = Vector3(slot5, 0, 0)
	slot11 = 0.5
	local brush = Draw.brush(0, Color.green.with_alpha(slot9, Color.green))
	slot11 = t * 50
	slot9 = (1 + math.sin(Color.green)) / 2
	local pos = self.pos_at_time(Draw, self)
	slot12 = 1

	brush.cylinder(self, brush, self._start_pos + offset, pos + offset)
	brush.cylinder(self, brush, pos + offset, self._end_pos + offset)

	slot15 = 10
	slot11 = 10

	brush.sphere(self, brush, pos + offset + Vector3(1, 0, 0))

	slot11 = 10

	brush.sphere(self, brush, pos)

	return 
end
function ZipLine:save(data)
	local state = {
		enabled = self._enabled,
		current_time = self._current_time,
		end_pos = self._end_pos,
		speed = self._speed,
		slack = self._slack,
		usage_type = self._usage_type
	}
	data.ZipLine = state

	return 
end
function ZipLine:load(data)

	-- Decompilation error in this vicinity:
	local state = data.ZipLine

	if state.enabled ~= self._enabled then
		slot6 = state.enabled

		self.set_enabled(slot4, self)
	end

	slot6 = state.end_pos

	self.set_end_pos(slot4, self)

	slot6 = state.speed

	self.set_speed(slot4, self)

	slot6 = state.slack

	self.set_slack(slot4, self)

	slot6 = state.usage_type

	self.set_usage_type(slot4, self)

	self._current_time = state.current_time
	slot7 = self._unit

	worlddefinition.use_me(slot5, worlddefinition)

	return 
end

return 
