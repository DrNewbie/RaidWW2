slot3 = "CoreMenuStateInEditor"

core.module(slot1, core)

slot3 = "CoreMenuStateInGame"

core.import(slot1, core)

if not InEditor then
	slot2 = CoreMenuStateInGame.InGame
	slot0 = class(slot1)
end

InEditor = slot0
function InEditor:init()
	slot3 = self.menu_state

	self.menu_state._set_stable_for_loading(slot2)

	return 
end
function InEditor:destroy()
	slot3 = self.menu_state

	self.menu_state._not_stable_for_loading(slot2)

	return 
end

return 
