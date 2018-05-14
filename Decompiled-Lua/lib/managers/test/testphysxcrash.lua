TestPhysXCrash = TestPhysXCrash or class()
slot6 = 22.7375
slot6 = 537.501
slot6 = 68.5001
slot6 = 90.1195
slot6 = 2234.12
slot6 = 68.5001
slot6 = 137.75
slot6 = 37.3692
slot6 = 222.044
slot6 = 428.336
slot6 = 61.4985
slot6 = 37.1985
slot6 = 38.4998
slot6 = 138.751
slot6 = 70.2581
TestPhysXCrash.testPositions = {
	Vector3(slot3, 1506, -1225),
	Vector3(slot3, -5533.26, -2864.1),
	Vector3(slot3, 1751.39, -2134.46),
	Vector3(slot3, -841.854, -1704.87),
	Vector3(slot3, 2381.24, 2805.92),
	Vector3(slot3, 5721.93, -2210.52),
	Vector3(slot3, -4601.63, -5450.82),
	Vector3(slot3, 989.35, -1742.43),
	Vector3(slot3, -1686.51, -272.814),
	Vector3(slot3, 537.232, -2294.28),
	Vector3(slot3, 1912.01, -3619.06),
	Vector3(slot3, -661.549, -1700.14),
	Vector3(slot3, 6172.45, -86.1826),
	Vector3(slot3, -1967.56, -3135.17),
	Vector3(slot3, 5996.02, -2469.51)
}
local counter = 1
function TestPhysXCrash:init()
	counter = 1

	return 
end
function TestPhysXCrash:update(t, dt)
	slot7 = dt

	self.hardcodeCrash(slot4, self, t)

	return 
end
function TestPhysXCrash:toggleTest()
	counter = 1

	return 
end
function TestPhysXCrash:hardcodeCrash(t, dt)
	if counter < #TestPhysXCrash.testPositions + 1 then
		slot6 = TestPhysXCrash.testPositions[counter]

		managers.test.utils.spawn_projectile_at_pos(slot4, managers.test.utils)

		counter = counter + 1
	end

	return 
end

return 
