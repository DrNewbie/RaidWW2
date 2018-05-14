slot3 = "CorePortableLocalUserStorage"

core.module(slot1, core)

slot3 = "CoreFakeLocalUserStorage"

core.import(slot1, core)

slot3 = "X360"

if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
	Storage = CoreFakeLocalUserStorage.Storage
else
	slot3 = "WIN32"

	if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
		Storage = CoreFakeLocalUserStorage.Storage
	else
		slot3 = "PS3"

		if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
			Storage = CoreFakeLocalUserStorage.Storage
		else
			slot3 = "XB1"

			if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
				Storage = CoreFakeLocalUserStorage.Storage
			else
				slot3 = "PS4"

				if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
					Storage = CoreFakeLocalUserStorage.Storage
				end
			end
		end
	end
end

return 
