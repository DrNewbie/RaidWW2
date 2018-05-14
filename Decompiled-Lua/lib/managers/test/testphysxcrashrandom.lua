TestPhysXCrashRandom = TestPhysXCrashRandom or class()
TestPhysXCrashRandom.PERIOD_BETWEEN_SPAWNS = 3
local timer = 0
local testing_active = true
function TestPhysXCrashRandom:init()
	timer = TestPhysXCrashRandom.PERIOD_BETWEEN_SPAWNS
	testing_active = true

	return 
end
function TestPhysXCrashRandom:update(t, dt)
	slot7 = dt

	self.randomCrash(slot4, self, t)

	return 
end
function TestPhysXCrashRandom:toggleTest()
	testing_active = not testing_active

	return 
end
function TestPhysXCrashRandom:randomCrash(t, dt)
	if testing_active == true then
		if timer < 0 then
			slot5 = managers.test.utils

			managers.test.utils.spawn_enemy_on_graph(slot4)

			timer = TestPhysXCrashRandom.PERIOD_BETWEEN_SPAWNS
		else
			slot5 = managers.test.utils

			managers.test.utils.spawn_projectile_on_graph(slot4)

			timer = timer - dt
		end
	end

	return 
end

return 
