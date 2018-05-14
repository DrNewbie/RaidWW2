if not TankCopActionWalk then
	slot2 = CopActionWalk
	slot0 = class(slot1)
end

TankCopActionWalk = slot0
TankCopActionWalk._walk_anim_velocities = {
	stand = {
		cbt = {
			walk = {
				bwd = 112.85,
				l = 118.53,
				fwd = 144,
				r = 122.48
			},
			run = {
				bwd = 357.23,
				l = 287.43,
				fwd = 361.5,
				r = 318.33
			}
		}
	}
}
TankCopActionWalk._walk_anim_velocities.stand.ntl = TankCopActionWalk._walk_anim_velocities.stand.cbt
TankCopActionWalk._walk_anim_velocities.stand.hos = TankCopActionWalk._walk_anim_velocities.stand.cbt
TankCopActionWalk._walk_anim_velocities.stand.wnd = TankCopActionWalk._walk_anim_velocities.stand.cbt
TankCopActionWalk._walk_anim_velocities.crouch = TankCopActionWalk._walk_anim_velocities.stand
TankCopActionWalk._walk_anim_lengths = {
	stand = {
		cbt = {
			walk = {
				bwd = 40,
				l = 40,
				fwd = 34,
				r = 38
			},
			run = {
				bwd = 21,
				l = 20,
				fwd = 20,
				r = 21
			}
		}
	}
}
slot2 = TankCopActionWalk._walk_anim_lengths

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

TankCopActionWalk._walk_anim_lengths.stand.ntl = TankCopActionWalk._walk_anim_lengths.stand.cbt
TankCopActionWalk._walk_anim_lengths.stand.hos = TankCopActionWalk._walk_anim_lengths.stand.cbt
TankCopActionWalk._walk_anim_lengths.stand.wnd = TankCopActionWalk._walk_anim_lengths.stand.cbt
TankCopActionWalk._walk_anim_lengths.crouch = TankCopActionWalk._walk_anim_lengths.stand

return 
