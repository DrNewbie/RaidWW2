if not EscortWithSuitcaseActionWalk then
	slot2 = CopActionWalk
	slot0 = class(slot1)
end

EscortWithSuitcaseActionWalk = slot0
EscortWithSuitcaseActionWalk._walk_anim_velocities = {
	stand = {
		hos = {
			walk = {
				bwd = 70,
				l = 93,
				fwd = 138,
				r = 65
			}
		}
	}
}
EscortWithSuitcaseActionWalk._walk_anim_lengths = {
	stand = {
		hos = {
			walk = {
				bwd = 32,
				l = 45,
				fwd = 28,
				r = 39
			}
		}
	}
}
slot2 = EscortWithSuitcaseActionWalk._walk_anim_lengths

for pose, stances in pairs() do
	slot7 = stances

	for stance, speeds in pairs(slot6) do
		slot12 = speeds

		for speed, sides in pairs(slot11) do
			slot17 = sides

			for side, speed in pairs(slot16) do
				sides[side] = speed * 0.03333
			end
		end
	end
end

if not EscortPrisonerActionWalk then
	slot2 = CopActionWalk
	slot0 = class(slot1)
end

EscortPrisonerActionWalk = slot0
EscortPrisonerActionWalk._walk_anim_velocities = {
	stand = {
		ntl = {
			run = {
				bwd = 170,
				l = 170,
				fwd = 329,
				r = 170
			}
		}
	}
}
EscortPrisonerActionWalk._walk_anim_lengths = {
	stand = {
		ntl = {
			run = {
				bwd = 19,
				l = 25,
				fwd = 22,
				r = 29
			}
		}
	}
}
slot2 = EscortPrisonerActionWalk._walk_anim_lengths

for pose, stances in pairs() do
	slot7 = stances

	for stance, speeds in pairs(slot6) do
		slot12 = speeds

		for speed, sides in pairs(slot11) do
			slot17 = sides

			for side, speed in pairs(slot16) do
				sides[side] = speed * 0.03333
			end
		end
	end
end

return 
