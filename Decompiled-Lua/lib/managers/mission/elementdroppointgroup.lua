slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementDropPointGroup then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementDropPointGroup = slot0
function ElementDropPointGroup:init(...)
	slot3 = self

	ElementDropPointGroup.super.init(slot2, ...)

	self._network_execute = true

	if self._values.icon == "guis/textures/waypoint2" or self._values.icon == "guis/textures/waypoint" then
		self._values.icon = "wp_standard"
	end

	return 
end
function ElementDropPointGroup:on_script_activated()
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementDropPointGroup:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementDropPointGroup:get_random_drop_point()
	local eligible_points = {}
	slot4 = self._values.on_executed

	for _, params in ipairs(slot3) do
		slot10 = params.id
		local element = self.get_mission_element(slot8, self)

		if element then
			slot13 = element
			slot11 = element.values(slot12).position

			table.insert(slot9, eligible_points)
		end
	end

	slot4 = #eligible_points

	return eligible_points[math.random(slot3)]
end
function ElementDropPointGroup:on_executed(instigator)
	return 

	if not self._values.enabled then
		return 
	end

	slot5 = self

	managers.airdrop.register_drop_point_group(slot3, managers.airdrop)

	slot5 = instigator

	ElementDropPointGroup.super.on_executed(slot3, self)

	return 
end
function ElementDropPointGroup:operation_remove()
	return 
end

return 
