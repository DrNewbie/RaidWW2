slot2 = "lib/setups/GameSetup"

require(slot1)

slot2 = "lib/network/base/NetworkManager"

require(slot1)

if not NetworkGameSetup then
	slot2 = GameSetup
	slot0 = class(slot1)
end

NetworkGameSetup = slot0
function NetworkGameSetup:init_managers(managers)
	slot5 = managers

	GameSetup.init_managers(slot3, self)

	slot4 = NetworkManager
	managers.network = NetworkManager.new(slot3)

	return 
end
function NetworkGameSetup:init_finalize()
	slot3 = self

	GameSetup.init_finalize(slot2)

	slot3 = managers.network

	managers.network.init_finalize(slot2)

	return 
end
function NetworkGameSetup:update(t, dt)
	slot7 = dt

	GameSetup.update(slot4, self, t)

	slot7 = dt

	managers.network.update(slot4, managers.network, t)

	return 
end
function NetworkGameSetup:paused_update(t, dt)
	slot7 = dt

	GameSetup.paused_update(slot4, self, t)

	slot7 = dt

	managers.network.update(slot4, managers.network, t)

	return 
end
function NetworkGameSetup:end_update(t, dt)
	slot7 = dt

	GameSetup.end_update(slot4, self, t)

	slot5 = managers.network

	managers.network.end_update(slot4)

	return 
end
function NetworkGameSetup:paused_end_update(t, dt)
	slot7 = dt

	GameSetup.paused_end_update(slot4, self, t)

	slot5 = managers.network

	managers.network.end_update(slot4)

	return 
end

return NetworkGameSetup
