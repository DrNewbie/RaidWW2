slot3 = "CoreManagerBase"

core.module(slot1, core)

PRIO_FUTURECORE1 = 1
PRIO_FUTURECORE2 = 2
PRIO_FUTURECORE3 = 3
PRIO_FUTURECORE4 = 4
PRIO_FUTURECORE5 = 5
PRIO_FREEFLIGHT = 10
PRIO_CUTSCENE = 20
PRIO_WORLDCAMERA = 30
PRIO_GAMEPLAY = 40
PRIO_DEFAULT = PRIO_GAMEPLAY
ManagerBase = ManagerBase or class()
function ManagerBase:init(name)
	self.__name = name
	self.__aos = {}
	self.__ao2prio = {}
	self.__really_active = {}
	self.__active_requested = {}
	self.__changed = false

	return 
end
function ManagerBase:_add_accessobj(accessobj, prio)
	slot7 = accessobj
	slot5 = accessobj.active_requested(slot6) == false

	assert(slot4)

	slot7 = accessobj
	slot5 = accessobj.really_active(slot6) == false

	assert(slot4)

	slot5 = 0 < prio

	assert(slot4)

	self.__ao2prio[accessobj] = prio
	slot6 = accessobj

	table.insert(slot4, self.__aos)

	return 
end
function ManagerBase:_del_accessobj(accessobj)
	self.__ao2prio[accessobj] = nil
	slot5 = accessobj

	table.delete(nil, self.__aos)

	slot5 = accessobj

	table.delete(nil, self.__really_active)

	slot5 = accessobj

	table.delete(nil, self.__active_requested)

	slot4 = accessobj

	accessobj._really_deactivate(nil)

	return 
end
function ManagerBase:_all_ao()
	return self.__aos
end
function ManagerBase:_all_really_active()
	return self.__really_active
end
function ManagerBase:_all_active_requested()
	return self.__active_requested
end
function ManagerBase:_ao_by_name(name)
	function slot5(ao)
		slot3 = ao

		return ao.name(slot2) == name
	end

	return table.find_value(slot3, self.__aos)
end
function ManagerBase:_all_ao_by_prio(prio)
	function slot5(ao)
		return self.__ao2prio[ao] == prio
	end

	return table.find_all_values(slot3, self.__aos)
end
function ManagerBase:_all_really_active_by_prio(prio)
	function slot5(ao)
		return self.__ao2prio[ao] == prio
	end

	return table.find_all_values(slot3, self.__really_active)
end
function ManagerBase:_all_active_requested_by_prio(prio)
	function slot5(ao)
		return self.__ao2prio[ao] == prio
	end

	return table.find_all_values(slot3, self.__active_requested)
end
function ManagerBase:_prioritize_and_activate()
	function slot4(ao)
		slot3 = ao

		return ao.active_requested(slot2)
	end

	self.__active_requested = table.find_all_values(slot2, self.__aos)
	local req_prio = math.huge
	slot4 = self.__active_requested

	for _, ao in ipairs(self.__aos) do
		slot10 = self.__ao2prio[ao]
		req_prio = math.min(slot8, req_prio)
	end

	slot4 = self.__ao2prio

	for ao, prio in pairs(slot3) do
		if prio < req_prio then
			slot9 = ao

			if ao.really_active(slot8) then
				slot9 = ao

				ao._really_deactivate(slot8)
			end
		elseif prio == req_prio then
			slot9 = ao

			if not ao.active_requested(slot8) then
				slot9 = ao

				if ao.really_active(slot8) then
					slot9 = ao

					ao._really_deactivate(slot8)
				end
			end
		else
			slot9 = ao

			if ao.really_active(slot8) then
				slot9 = ao

				ao._really_deactivate(slot8)
			end
		end
	end

	slot4 = self.__ao2prio

	for ao, prio in pairs(slot3) do
		if prio == req_prio then
			slot9 = ao

			if ao.active_requested(slot8) then
				slot9 = ao

				if not ao.really_active(slot8) then
					slot9 = ao

					ao._really_activate(slot8)
				end
			end
		end
	end

	function slot5(ao)
		slot3 = ao

		return ao.really_active(slot2)
	end

	self.__really_active = table.find_all_values(slot3, self.__aos)
	self.__changed = true

	return 
end
function ManagerBase:end_update(t, dt)
	if self.__changed then
		local p2aos = {}
		slot6 = self.__ao2prio

		for ao, p in pairs(slot5) do
			p2aos[p] = p2aos[p] or {}
			slot12 = ao

			table.insert(slot10, p2aos[p])
		end

		slot10 = self.__name
		slot7 = "[ManagerBase] During this frame activation states changed for manager " .. string.upper(slot9) .. ":"

		cat_print(slot5, "spam")
		cat_print(slot5, "spam")

		slot8 = p2aos

		for _, p in ipairs(table.map_keys("[ManagerBase]   <name>           <prio> <active> <really_active>")) do
			slot11 = p2aos[p]

			for _, ao in ipairs(slot10) do
				slot16 = "spam"
				slot24 = ao
				slot25 = ao
				slot23 = (ao.really_active(ao) and "YES") or "no"

				cat_print(slot15, string.format(slot18, "[ManagerBase]    %-15s %5d   %-6s   %s", tostring(ao.name(slot23)), p, (ao.active_requested(slot23) and "YES") or "no"))
			end
		end

		self.__changed = false
	end

	return 
end

return 
