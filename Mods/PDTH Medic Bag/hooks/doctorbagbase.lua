DoctorBagSimpleBase = DoctorBagSimpleBase or class(DoctorBagBase)

DoctorBagSimpleBase.UnitName = "units/gen_equipment_medicbag/gen_equipment_medicbag"

function DoctorBagSimpleBase.spawn(pos, rot, amount_upgrade_lvl, peer_id)
	local unit = World:spawn_unit(Idstring(DoctorBagSimpleBase.UnitName), pos, rot)
	if unit then
		unit:base():setup(amount_upgrade_lvl)
		table.insert(_G.MedicBagLists, unit)
	end
	return unit
end

function DoctorBagSimpleBase:set_server_information(peer_id) end
function DoctorBagSimpleBase:server_information() return end

function DoctorBagSimpleBase:init(unit)
	UnitBase.init(self, unit, false)
	self._unit = unit
	self._is_attachable = false
	self._max_amount = 2
end

function DoctorBagSimpleBase:_clbk_validate() end
function DoctorBagSimpleBase:sync_setup(amount_upgrade_lvl, peer_id) end

function DoctorBagSimpleBase:_set_visual_stage() end

function DoctorBagSimpleBase:setup(amount_upgrade_lvl)
	self._amount = 2
end

function DoctorBagSimpleBase:_check_body() end
function DoctorBagSimpleBase:server_set_dynamic() end
function DoctorBagSimpleBase:sync_net_event(event_id) end
function DoctorBagSimpleBase:_set_dynamic() end

function DoctorBagSimpleBase:take(unit)
	if self._empty then
		return
	end
	local taken = self:_take(unit)
	if self._amount <= 0 then
		self:_set_empty()
	end
	return taken > 0
end

function DoctorBagSimpleBase:sync_taken(amount) end

function DoctorBagSimpleBase:_take(unit)
	local taken = 1
	self._amount = self._amount - taken
	unit:character_damage():recover_health()
	return taken
end