slot3 = "CorePointerDraw"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

PointerDraw = PointerDraw or CoreClass.class()
function PointerDraw:init(color, size, position)
	self.__shape = shape or "sphere"

	if not color then
		slot6 = "ff0000"
		slot4 = Color(slot5)
	end

	self.__color = slot4
	self.__position = position
	self.__size = size or 30

	return 
end
function PointerDraw:update(time, delta_time)
	if self.__position then
		local pen = Draw.pen(slot4)
		slot7 = "no_z"

		pen.set(Draw, pen)

		slot7 = self.__color

		pen.set(Draw, pen)

		slot8 = self.__size

		pen.sphere(Draw, pen, self.__position)
	end

	return 
end
function PointerDraw:set_position(position)
	self.__position = position

	return 
end

return 
