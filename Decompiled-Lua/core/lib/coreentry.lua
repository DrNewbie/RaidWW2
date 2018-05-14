slot2 = "core/lib/system/CoreSystem"

require(slot1)

slot4 = Application
slot3 = "-slave"

if table.contains(slot1, Application.argv(slot3)) then
	slot2 = "core/lib/setups/CoreSlaveSetup"

	require(slot1)
else
	slot2 = "lib/Entry"

	require(slot1)
end

return 
