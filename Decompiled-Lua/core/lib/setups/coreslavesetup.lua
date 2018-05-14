-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreSetup"

core.import(slot1, core)

slot3 = "CoreGameStateMachine"

core.import(slot1, core)

slot3 = "CoreInternalGameState"

core.import(slot1, core)

slot3 = "CoreSlaveUpdators"

core.import(slot1, core)

slave_state_machine = slave_state_machine or nil

if not SetupSlaveSetup then
	slot2 = CoreSetup.CoreSetup
	slot0 = class(slot1)
end

SetupSlaveSetup = slot0
SetupSlaveSetup.SLAVE_ARG_NAME = "-slave"
SetupSlaveSetup.SLAVE_LSP_ARG_NAME = "-slavelsport"
function SetupSlaveSetup:init_game()
	slot8 = "slave"
	self._viewport = managers.viewport.new_vp(slot2, managers.viewport, 0, 0, 1, 1)
	slot3 = World
	self._camera = World.create_camera(slot2)
	slot4 = managers.viewport.CAMERA_NEAR_RANGE

	self._camera.set_near_range(slot2, self._camera)

	slot4 = managers.viewport.CAMERA_FAR_RANGE

	self._camera.set_far_range(slot2, self._camera)

	slot4 = 75

	self._camera.set_fov(slot2, self._camera)

	slot4 = self._camera

	self._viewport.set_camera(slot2, self._viewport)

	slot4 = true

	self._viewport.set_active(slot2, self._viewport)

	slot3 = self.SLAVE_ARG_NAME
	local port = CoreApp.arg_value(slot2)

	if port then

		-- Decompilation error in this vicinity:
		slot4 = port
		port = string.lower(slot3)
		slot4 = port
		port = tonumber(slot3) or CoreSlaveUpdators.DEFAULT_NETWORK_PORT
	end

	slot4 = self.SLAVE_LSP_ARG_NAME
	local lsport = CoreApp.arg_value(slot3)

	if lsport then

		-- Decompilation error in this vicinity:
		slot5 = lsport
		lsport = string.lower(slot4)
		slot5 = lsport
		lsport = tonumber(slot4) or CoreSlaveUpdators.DEFAULT_NETWORK_LSPORT
	end

	slot10 = lsport

	assert(managers.slave.start(slot6, managers.slave, self._viewport, port))

	slot5 = CoreGameStateMachine.GameStateMachine
	slot9 = "empty"
	slave_state_machine = CoreGameStateMachine.GameStateMachine.new(slot4, CoreInternalGameState.GameState.new(managers.slave, CoreInternalGameState.GameState))

	return slave_state_machine
end
function SetupSlaveSetup:update(t, dt)
	slot7 = dt

	slave_state_machine.update(slot4, slave_state_machine, t)

	return 
end
function SetupSlaveSetup:paused_update(t, dt)
	slot7 = dt

	slave_state_machine.update(slot4, slave_state_machine, t)

	return 
end

if not slave_setup then
	slot2 = SetupSlaveSetup
	slot0 = SetupSlaveSetup.new(slot1)
end

slave_setup = slot0
slot2 = slave_setup

slave_setup.make_entrypoint(slot1)

return 
