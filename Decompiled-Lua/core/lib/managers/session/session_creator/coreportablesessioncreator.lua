slot3 = "CorePortableSessionCreator"

core.module(slot1, core)

slot3 = "CoreFakeSessionCreator"

core.import(slot1, core)

slot3 = "X360"

if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
	Creator = CoreFakeSessionCreator.Creator
else
	slot3 = "WIN32"

	if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
		Creator = CoreFakeSessionCreator.Creator
	else
		slot3 = "PS3"

		if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
			Creator = CoreFakeSessionCreator.Creator
		else
			slot3 = "XB1"

			if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
				Creator = CoreFakeSessionCreator.Creator
			else
				slot3 = "PS4"

				if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
					Creator = CoreFakeSessionCreator.Creator
				end
			end
		end
	end
end

return 
