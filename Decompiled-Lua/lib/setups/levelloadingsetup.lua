slot2 = "core/lib/setups/CoreLoadingSetup"

require(slot1)

slot2 = "lib/utils/LevelLoadingScreenGuiScript"

require(slot1)

slot2 = "lib/managers/menu/MenuBackdropGUI"

require(slot1)

slot2 = "core/lib/managers/CoreGuiDataManager"

require(slot1)

slot2 = "core/lib/utils/CoreMath"

require(slot1)

slot2 = "core/lib/utils/CoreEvent"

require(slot1)

if not LevelLoadingSetup then
	slot2 = CoreLoadingSetup
	slot0 = class(slot1)
end

LevelLoadingSetup = slot0
function LevelLoadingSetup:init()
	return 
end
function LevelLoadingSetup:update(t, dt)
	return 
end
function LevelLoadingSetup:destroy()
	slot3 = self

	LevelLoadingSetup.super.destroy(slot2)

	return 
end

if not setup then
	slot2 = LevelLoadingSetup
	slot0 = LevelLoadingSetup.new(slot1)
end

setup = slot0
slot2 = setup

setup.make_entrypoint(slot1)

return 
