slot3 = "CoreSlaveUpdators"

core.module(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot2 = "slaveupdator"
NETWORK_SLAVE_RECEIVER = Idstring(slot1)
slot2 = "masterupdator"
NETWORK_MASTER_RECEIVER = Idstring(slot1)
DEFAULT_NETWORK_PORT = 31254
DEFAULT_NETWORK_LSPORT = 31255
UNITS_PER_FRAME = 1
SlaveManager = SlaveManager or class()
Updator = Updator or class()
function Updator:init()
	return 
end
function Updator:peer()
	return self._peer
end
function Updator:update()
	return 
end
function Updator:set_batch_count()
	return 
end

if not SlaveUpdator then
	slot2 = Updator
	slot0 = class(slot1)
end

SlaveUpdator = slot0
function SlaveUpdator:init(vp, port)
	slot7 = self

	Network.bind(slot4, Network, port or DEFAULT_NETWORK_PORT)

	slot7 = self

	Network.set_receiver(slot4, Network, NETWORK_SLAVE_RECEIVER)

	self._units = {}
	self._pings = {}
	slot6 = port

	vp.enable_slave(slot4, vp)

	return true
end
function SlaveUpdator:type()
	return "slave"
end
function SlaveUpdator:slaveupdators_sync(key, name, pos, rot, rpc)
	local unit = self._units[key]
	slot9 = unit

	if CoreCode.alive(slot8) then
		slot10 = pos

		unit.set_position(slot8, unit)

		slot10 = rot

		unit.set_rotation(slot8, unit)

		self._pings[key] = nil
	else
		slot9 = Idstring(slot10)
		slot12 = name

		CoreEngineAccess._editor_load(slot8, name.id("unit"))

		slot12 = name
		slot12 = rot
		unit = World.spawn_unit_without_extensions(slot8, World, name.id("unit"), pos)
		self._units[key] = unit
	end

	slot9 = rpc

	rpc.slaveupdators_ready_to_send(slot8)

	return 
end
function SlaveUpdator:slaveupdators_reset(rpc)
	slot4 = self._pings

	for _, unit in pairs(slot3) do
		slot9 = unit

		if CoreCode.alive(slot8) then
			slot10 = unit

			World.delete_unit(slot8, World)
		end
	end

	slot4 = self._units
	self._pings = table.map_copy(slot3)
	slot4 = rpc

	rpc.slaveupdators_ready_to_send(slot3)

	return 
end
function SlaveUpdator:slaveupdators_init()
	slot6 = "all"

	for _, unit in ipairs(World.find_units_quick(slot4, World)) do
		slot8 = unit

		if CoreCode.alive(slot7) then
			slot9 = unit

			World.delete_unit(slot7, World)
		end
	end

	self._units = {}
	self._pings = {}

	return 
end

if not MasterUpdator then
	slot2 = Updator
	slot0 = class(slot1)
end

MasterUpdator = slot0
function MasterUpdator:init(vp, host, port, master_listener_port, manual_pumping)
	slot10 = port or DEFAULT_NETWORK_PORT
	self._peer = Network.handshake(slot7, Network, host or "localhost")

	if not self._peer then
		return false
	end

	slot10 = self

	Network.bind(slot7, Network, master_listener_port or DEFAULT_NETWORK_LSPORT)

	slot10 = self

	Network.set_receiver(slot7, Network, NETWORK_MASTER_RECEIVER)

	self._unitqueue = {}
	self._ready_to_send = true
	slot12 = manual_pumping

	vp.enable_master(slot7, vp, host, port, master_listener_port)

	slot8 = self

	self.set_batch_count(slot7)

	slot8 = self._peer

	self._peer.slaveupdators_init(slot7)

	return true
end
function MasterUpdator:type()
	return "master"
end
function MasterUpdator:set_batch_count(count)
	self._units_per_frame = count or UNITS_PER_FRAME

	return 
end
function MasterUpdator:update(t, dt)
	if #self._unitqueue == 0 then
		slot5 = self._peer

		self._peer.slaveupdators_reset(slot4)

		slot6 = "all"
		self._unitqueue = World.find_units_quick(slot4, World)
	end

	if not self._ready_to_send then
		return 
	end

	local num_sent = 0

	for i = #self._unitqueue, 1, -1 do
		local unit = self._unitqueue[i]
		slot12 = i

		table.remove(slot10, self._unitqueue)

		slot11 = unit

		if CoreCode.alive(slot10) then
			slot11 = unit

			if unit.visible(slot10) then
				slot11 = unit

				if unit.enabled(slot10) then
					slot11 = unit

					if not unit.mover(slot10) then
						slot17 = unit
						slot17 = unit.name(unit)
						slot14 = unit.position(unit.name(unit).s)
						slot17 = unit

						self._peer.slaveupdators_sync(slot10, self._peer, tostring(unit.key(slot15)), assert(unit.name(unit).s(unit)), unit.rotation(unit))

						self._ready_to_send = false
						num_sent = num_sent + 1

						if self._units_per_frame <= num_sent then
							break
						end
					end
				end
			end
		end
	end

	return 
end
function MasterUpdator:slaveupdators_ready_to_send()
	self._ready_to_send = true

	return 
end

return 
