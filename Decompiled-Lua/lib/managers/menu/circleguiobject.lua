-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- Decompilation Error: _glue_flows(node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.

-- Decompilation error in this vicinity:
--- BLOCK #0 1-3, warpins: 1 ---
--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #1



-- Decompilation error in this vicinity:
--- BLOCK #1 6-30, warpins: 2 ---
if not CircleGuiObject then

	-- Decompilation error in this vicinity:
	--- BLOCK #0 4-5, warpins: 1 ---
	slot0 = class()
	--- END OF BLOCK #0 ---



end

CircleGuiObject = slot0
function CircleGuiObject:init(panel, config)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	self._panel = panel

	if not config.radius then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot3 = 20
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-9, warpins: 2 ---
	self._radius = slot3

	if not config.sides then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		slot3 = 10
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-14, warpins: 2 ---
	self._sides = slot3

	if not config.total then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 1 ---
		slot3 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 16-34, warpins: 2 ---
	self._total = slot3
	slot6 = config
	config.triangles = self._create_triangles(slot4, self)
	config.w = self._radius * 2
	config.h = self._radius * 2
	slot6 = config
	self._circle = self._panel.polygon(slot4, self._panel)

	return 
	--- END OF BLOCK #3 ---



end
function CircleGuiObject:_create_triangles(config)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not config.current then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot2 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 2 ---
	slot2 = 360 * slot2

	if not config.total then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		slot3 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-18, warpins: 2 ---
	local amount = slot2 / slot3
	local s = self._radius
	local triangles = {}
	local step = 360 / self._sides

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 19-71, warpins: 0 ---
	for i = step, amount, step do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-71, warpins: 2 ---
		slot14 = 0
		local mid = Vector3(slot11, self._radius, self._radius)
		slot14 = mid

		table.insert(self._radius, triangles)

		slot19 = i
		slot18 = 0
		slot14 = mid + Vector3(slot15, math.sin(slot17) * self._radius, -math.cos(i) * self._radius)

		table.insert(self._radius, triangles)

		slot19 = i - step
		slot18 = 0
		slot14 = mid + Vector3(slot15, math.sin(-math.cos(i) * self._radius) * self._radius, -math.cos(i - step) * self._radius)

		table.insert(self._radius, triangles)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 72-72, warpins: 1 ---
	return triangles
	--- END OF BLOCK #4 ---



end
function CircleGuiObject:set_current(current)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot5 = {
		current = current,
		total = self._total
	}
	local triangles = self._create_triangles(slot3, self)
	slot5 = self._circle

	self._circle.clear(self)

	slot6 = triangles

	self._circle.add_triangles(self, self._circle)

	return 
	--- END OF BLOCK #0 ---



end
function CircleGuiObject:set_position(x, y)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot7 = y

	self._circle.set_position(slot4, self._circle, x)

	return 
	--- END OF BLOCK #0 ---



end
function CircleGuiObject:set_layer(layer)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot5 = layer

	self._circle.set_layer(slot3, self._circle)

	return 
	--- END OF BLOCK #0 ---



end
function CircleGuiObject:layer()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = self._circle

	return self._circle.layer(slot2)
	--- END OF BLOCK #0 ---



end
function CircleGuiObject:remove()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot4 = self._circle

	self._panel.remove(slot2, self._panel)

	return 
	--- END OF BLOCK #0 ---



end
slot0 = CircleBitmapGuiObject or class()
CircleBitmapGuiObject = slot0
function CircleBitmapGuiObject:init(panel, config)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	self._panel = panel

	if not config.radius then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot3 = 20
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-9, warpins: 2 ---
	self._radius = slot3

	if not config.sides then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		slot3 = 64
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-14, warpins: 2 ---
	self._sides = slot3

	if not config.total then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 1 ---
		slot3 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 16-21, warpins: 2 ---
	self._total = slot3
	self._size = 128

	if not config.texture_rect then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-22, warpins: 1 ---
		slot3 = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 23-26, warpins: 2 ---
	config.texture_rect = slot3

	if not config.image then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-27, warpins: 1 ---
		slot3 = "guis/textures/pd2/hud_progress_active"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 28-58, warpins: 2 ---
	config.texture = slot3
	config.w = self._radius * 2
	config.h = self._radius * 2
	slot6 = config
	self._circle = self._panel.bitmap(slot4, self._panel)
	slot5 = self._circle
	slot8 = "VertexColorTexturedRadial"

	self._circle.set_render_template(slot4, Idstring(slot7))

	slot5 = self._circle
	slot8 = self._circle

	self._circle.set_color(slot4, self._circle.color(slot7))

	if config.use_bg then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 59-64, warpins: 1 ---
		slot5 = config
		local bg_config = deep_clone(slot4)

		if not bg_config.bg_texture_rect then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 65-65, warpins: 1 ---
			slot4 = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 66-69, warpins: 2 ---
		bg_config.texture_rect = slot4

		if not config.bg_image then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 70-70, warpins: 1 ---
			slot4 = "guis/textures/pd2/hud_progress_bg"
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 71-82, warpins: 2 ---
		bg_config.texture = slot4
		bg_config.layer = bg_config.layer - 1
		bg_config.blend_mode = "normal"
		slot7 = bg_config
		self._bg_circle = self._panel.bitmap(slot5, self._panel)
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 83-83, warpins: 2 ---
	return 
	--- END OF BLOCK #6 ---



end
function CircleBitmapGuiObject:radius()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return self._radius
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:set_current(current)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	slot6 = current
	slot5 = 8
	local j = math.mod(slot3, math.floor(8))
	local i = math.floor(math.floor(8))
	slot7 = current

	self._circle.set_position_z(current / 8, self._circle)

	return 
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:position()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = self._circle

	return self._circle.position(slot2)
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:set_position(x, y)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot7 = y

	self._circle.set_position(slot4, self._circle, x)

	if self._bg_circle then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-15, warpins: 1 ---
		slot7 = y

		self._bg_circle.set_position(slot4, self._bg_circle, x)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function CircleBitmapGuiObject:set_visible(visible)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot5 = visible

	self._circle.set_visible(slot3, self._circle)

	if self._bg_circle then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-13, warpins: 1 ---
		slot5 = visible

		self._bg_circle.set_visible(slot3, self._bg_circle)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function CircleBitmapGuiObject:visible()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = self._circle

	return self._circle.visible(slot2)
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:set_alpha(alpha)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot5 = alpha

	self._circle.set_alpha(slot3, self._circle)

	return 
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:alpha()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = self._circle

	self._circle.alpha(slot2)

	return 
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:set_color(color)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot5 = color

	self._circle.set_color(slot3, self._circle)

	return 
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:color()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = self._circle

	return self._circle.color(slot2)
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:size()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = self._circle

	return self._circle.size(slot2)
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:set_image(texture)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot5 = texture

	self._circle.set_image(slot3, self._circle)

	return 
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:set_layer(layer)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot5 = layer

	self._circle.set_layer(slot3, self._circle)

	if self._bg_circle then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-13, warpins: 1 ---
		slot5 = layer - 1

		self._bg_circle.set_layer(slot3, self._bg_circle)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function CircleBitmapGuiObject:layer()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = self._circle

	return self._circle.layer(slot2)
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:remove()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot4 = self._circle

	self._panel.remove(slot2, self._panel)

	if self._bg_circle then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-13, warpins: 1 ---
		slot4 = self._bg_circle

		self._panel.remove(slot2, self._panel)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-16, warpins: 2 ---
	self._panel = nil

	return 
	--- END OF BLOCK #1 ---



end
function CircleBitmapGuiObject:hide_bg()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot4 = false

	self._bg_circle.set_visible(slot2, self._bg_circle)

	return 
	--- END OF BLOCK #0 ---



end
function CircleBitmapGuiObject:show_bg()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot4 = true

	self._bg_circle.set_visible(slot2, self._bg_circle)

	return 
	--- END OF BLOCK #0 ---



end

return 

--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #3



-- Decompilation error in this vicinity:
--- BLOCK #2 31-32, warpins: 1 ---
slot0 = class()
--- END OF BLOCK #2 ---

FLOW; TARGET BLOCK #3



-- Decompilation error in this vicinity:
--- BLOCK #3 33-88, warpins: 2 ---
--- END OF BLOCK #3 ---



