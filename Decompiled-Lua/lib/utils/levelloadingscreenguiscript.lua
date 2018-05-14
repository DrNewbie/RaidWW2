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
slot0 = LevelLoadingScreenGuiScript or class()
LevelLoadingScreenGuiScript = slot0
LevelLoadingScreenGuiScript.init = function (self, scene_gui, res, progress, base_layer)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	self._scene_gui = scene_gui
	self._res = res
	self._base_layer = base_layer
	self._level_tweak_data = arg.load_level_data.level_tweak_data
	self._gui_tweak_data = arg.load_level_data.gui_tweak_data
	self._menu_tweak_data = arg.load_level_data.menu_tweak_data
	self._scale_tweak_data = arg.load_level_data.scale_tweak_data

	if not arg.load_level_data.controller_coords then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-25, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-163, warpins: 2 ---
	self._coords = slot5
	self._gui_data = arg.load_level_data.gui_data
	self._workspace_size = self._gui_data.workspace_size
	self._saferect_size = self._gui_data.saferect_size
	local challenges = arg.load_level_data.challenges
	local safe_rect_pixels = self._gui_data.safe_rect_pixels
	local safe_rect = self._gui_data.safe_rect
	local aspect_ratio = self._gui_data.aspect_ratio
	self._safe_rect_pixels = safe_rect_pixels
	self._safe_rect = safe_rect
	slot16 = aspect_ratio
	self._gui_data_manager = GuiDataManager.new(slot10, GuiDataManager, self._scene_gui, res, safe_rect_pixels, safe_rect)
	slot14 = true
	self._back_drop_gui = MenuBackdropGUI.new(slot10, MenuBackdropGUI, nil, self._gui_data_manager)
	slot13 = 1

	self._back_drop_gui.set_pattern(slot10, self._back_drop_gui, "guis/textures/loading/loading_foreground")

	local base_panel = self._back_drop_gui.get_new_base_layer(slot10)
	slot13 = {
		layer = 0,
		texture = self._gui_data.bg_texture
	}
	local level_image = base_panel.bitmap(self._back_drop_gui, base_panel)
	slot14 = 0

	level_image.set_alpha(base_panel, level_image)

	slot14 = self._gui_data.bg_texture

	print(base_panel, "self._gui_data.bg_texture")

	slot16 = level_image
	slot18 = level_image
	slot16 = level_image.texture_height(level_image)
	slot14 = level_image.parent(safe_rect).h(safe_rect) * level_image.texture_width(level_image.parent(safe_rect)) / slot16
	slot17 = level_image
	slot17 = level_image.parent(slot16)

	level_image.set_size(base_panel, level_image, level_image.parent(slot16).h(slot16))

	slot15 = 0

	level_image.set_position(base_panel, level_image, 0)

	local background_fullpanel = self._back_drop_gui.get_new_background_layer(base_panel)
	local background_safepanel = self._back_drop_gui.get_new_background_layer(self._back_drop_gui)

	self._back_drop_gui.set_panel_to_saferect(self._back_drop_gui, self._back_drop_gui)

	slot18 = "debug_loading_level"
	local text = string.upper(managers.localization.text(background_safepanel, managers.localization))
	slot17 = {
		y = 0,
		vertical = "bottom",
		h = 36,
		font_size = 36,
		align = "left",
		font = "fonts/font_large_mf",
		halign = "left",
		layer = 0,
		text = text,
		color = Color.white
	}
	self._level_title_text = background_safepanel.text(managers.localization.text, background_safepanel)
	slot16 = self._level_title_text
	local _, _, w, h = self._level_title_text.text_rect(managers.localization.text)
	slot22 = h

	self._level_title_text.set_size(slot19, self._level_title_text, w)

	if self._coords then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 164-184, warpins: 1 ---
		slot21 = {
			texture = "guis/textures/controller",
			w = 512,
			h = 256,
			layer = 1
		}
		self._controller = background_safepanel.bitmap(slot19, background_safepanel)
		slot24 = background_safepanel
		slot22 = background_safepanel.h(background_safepanel) / 2

		self._controller.set_center(slot19, self._controller, background_safepanel.w(background_safepanel.h(background_safepanel) / 2) / 2)

		slot20 = self._coords

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 185-275, warpins: 0 ---
		for id, data in pairs(slot19) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 185-212, warpins: 1 ---
			slot26 = {
				font_size = 24,
				font = "fonts/font_medium_mf",
				halign = "center",
				valign = "center",
				name = data.id,
				text = data.string,
				align = data.align,
				vertical = data.vertical,
				color = data.color
			}
			data.text = background_safepanel.text(slot24, background_safepanel)
			slot25 = data.text
			local _, _, w, h = data.text.text_rect(slot24)
			slot31 = h

			data.text.set_size(slot28, data.text, w)

			if data.x then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 213-227, warpins: 1 ---
				local x = self._controller.x(slot28) + data.x
				slot30 = self._controller
				local y = self._controller.y(self._controller) + data.y

				if data.align == "left" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 228-233, warpins: 1 ---
					slot32 = x

					data.text.set_left(slot30, data.text)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 234-236, warpins: 1 ---
					if data.align == "right" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 237-242, warpins: 1 ---
						slot32 = x

						data.text.set_right(slot30, data.text)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 243-245, warpins: 1 ---
						if data.align == "center" then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 246-250, warpins: 1 ---
							slot32 = x

							data.text.set_center_x(slot30, data.text)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 251-253, warpins: 4 ---
				if data.vertical == "top" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 254-259, warpins: 1 ---
					slot32 = y

					data.text.set_top(slot30, data.text)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 260-262, warpins: 1 ---
					if data.vertical == "bottom" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 263-268, warpins: 1 ---
						slot32 = y

						data.text.set_bottom(slot30, data.text)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 269-273, warpins: 1 ---
						slot32 = y

						data.text.set_center_y(slot30, data.text)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 274-275, warpins: 5 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 276-276, warpins: 2 ---
	return 
	--- END OF BLOCK #2 ---



end
LevelLoadingScreenGuiScript.setup = function (self, res, progress)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-72, warpins: 1 ---
	slot5 = self._saferect_panel
	self._saferect_bottom_y = self._saferect_panel.h(slot4) - self._gui_tweak_data.upper_saferect_border
	slot9 = self._gui_tweak_data.upper_saferect_border - self._gui_tweak_data.border_pad

	self._level_title_text.set_shape(self._gui_tweak_data.upper_saferect_border, self._level_title_text, 0, 0, self._safe_rect_pixels.width)

	slot5 = self._level_title_text
	local _, _, w, _ = self._level_title_text.text_rect(self._gui_tweak_data.upper_saferect_border)
	slot10 = w

	self._level_title_text.set_w(self._safe_rect_pixels.width, self._level_title_text)

	slot12 = self._bg_gui
	slot14 = self._bg_gui
	slot12 = self._bg_gui.texture_height(self._bg_gui)
	slot10 = self._bg_gui.parent(slot11).h(slot11) * self._bg_gui.texture_width(self._bg_gui.parent(slot11)) / slot12
	slot13 = self._bg_gui
	slot13 = self._bg_gui.parent(self._bg_gui)

	self._bg_gui.set_size(self._safe_rect_pixels.width, self._bg_gui, self._bg_gui.parent(self._bg_gui).h(slot12))

	slot9 = self._bg_gui
	slot12 = self._bg_gui
	slot12 = self._bg_gui.parent(self._bg_gui.parent(self._bg_gui).h)

	self._bg_gui.set_center(self._safe_rect_pixels.width, self._bg_gui.parent(self._bg_gui.parent(self._bg_gui).h).center(self._bg_gui.parent(self._bg_gui).h))

	if self._briefing_text then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 73-75, warpins: 1 ---
		if self._res and self._res.y <= 601 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 81-115, warpins: 1 ---
			slot9 = self._briefing_text
			slot12 = self._briefing_text

			self._briefing_text.set_w(slot8, self._briefing_text.parent(slot11).w(slot11))

			slot9 = self._briefing_text
			local _, _, w, h = self._briefing_text.text_rect(slot8)
			slot15 = h

			self._briefing_text.set_size(self._briefing_text.parent(slot11), self._briefing_text, w)

			slot17 = self._briefing_text
			slot17 = self._briefing_text.parent(slot16)
			slot15 = self._briefing_text.parent(slot16).h(slot16) / 2

			self._briefing_text.set_lefttop(self._briefing_text.parent(slot11), self._briefing_text, 0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 116-152, warpins: 2 ---
			slot12 = self._briefing_text
			slot10 = self._briefing_text.parent(slot11).w(slot11) * 0.5

			self._briefing_text.set_w(slot8, self._briefing_text)

			slot9 = self._briefing_text
			local _, _, w, h = self._briefing_text.text_rect(slot8)

			self._briefing_text.set_size(self._briefing_text.parent(slot11), self._briefing_text, w)

			slot16 = self._briefing_text
			slot16 = self._briefing_text.parent(h)
			slot15 = self._saferect_bottom_y - self._gui_tweak_data.border_pad

			self._briefing_text.set_rightbottom(self._briefing_text.parent(slot11), self._briefing_text, self._briefing_text.parent(h).w(h))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 153-271, warpins: 3 ---
	local border_size = 2
	local bar_size = 2
	slot11 = self._stonecold_small_logo
	slot14 = self._stonecold_small_logo
	slot14 = self._stonecold_small_logo.parent(slot13)

	self._stonecold_small_logo.set_righttop(slot10, self._stonecold_small_logo.parent(slot13).righttop(slot13))

	slot12 = self._gui_tweak_data.upper_saferect_border - self._gui_tweak_data.border_pad

	self._stonecold_small_logo.set_bottom(slot10, self._stonecold_small_logo)

	self._top_y = self._safe_rect_pixels.y + self._gui_tweak_data.upper_saferect_border
	slot12 = self._saferect_panel
	self._bottom_y = (self._safe_rect_pixels.y + self._saferect_panel.h(self._stonecold_small_logo)) - self._gui_tweak_data.upper_saferect_border
	slot12 = self._screen_y + self._gui_tweak_data.upper_saferect_border

	self._upper_frame_rect.set_h(self._gui_tweak_data.upper_saferect_border, self._upper_frame_rect)

	slot11 = self._lower_frame_rect
	slot14 = self._upper_frame_rect

	self._lower_frame_rect.set_h(self._gui_tweak_data.upper_saferect_border, self._upper_frame_rect.h(self._gui_tweak_data.upper_saferect_border))

	slot14 = self._lower_frame_rect
	slot14 = self._lower_frame_rect.parent(self._gui_tweak_data.upper_saferect_border)

	self._lower_frame_rect.set_bottom(self._gui_tweak_data.upper_saferect_border, self._lower_frame_rect.parent(self._gui_tweak_data.upper_saferect_border).h(self._gui_tweak_data.upper_saferect_border))

	local tip_top = self._gui_tweak_data.upper_saferect_border + self._gui_tweak_data.border_pad + 14
	slot12 = self._tips_head_line
	local _, _, w, h = self._tips_head_line.text_rect(self._lower_frame_rect)
	slot18 = h

	self._tips_head_line.set_size(slot15, self._tips_head_line, w)

	slot17 = tip_top

	self._tips_head_line.set_top(slot15, self._tips_head_line)

	local offset = 20
	slot21 = self._tips_head_line
	slot18 = self._saferect_panel.w(slot19) - self._tips_head_line.w(self._saferect_panel) - offset

	self._tips_text.set_w(self._tips_head_line, self._tips_text)

	slot18 = tip_top

	self._tips_text.set_top(self._tips_head_line, self._tips_text)

	slot20 = self._tips_head_line
	slot18 = self._tips_head_line.right(self._tips_head_line.w(self._saferect_panel)) + offset

	self._tips_text.set_left(self._tips_head_line, self._tips_text)

	if 0 < progress then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 272-272, warpins: 1 ---
		self._init_progress = progress
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 273-276, warpins: 2 ---
	slot17 = self._challenges

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 277-313, warpins: 0 ---
	for i, challenge in ipairs(slot16) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 277-311, warpins: 1 ---
		local h = challenge.panel.h(slot21)
		slot24 = self._saferect_bottom_y - (h + 2) * (#self._challenges - i)

		challenge.panel.set_bottom(challenge.panel, challenge.panel)

		slot26 = challenge.panel
		slot24 = challenge.panel.right((h + 2) * (#self._challenges - i)) + 8 * self._scale_tweak_data.loading_challenge_bar_scale

		challenge.text.set_left(challenge.panel, challenge.text)

		slot23 = challenge.text
		slot26 = challenge.panel

		challenge.text.set_center_y(challenge.panel, challenge.panel.center_y(8 * self._scale_tweak_data.loading_challenge_bar_scale))
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 312-313, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 314-320, warpins: 1 ---
	slot17 = self._challenges_topic
	slot15 = self._challenges_topic.set_visible

	if self._challenges[1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 321-322, warpins: 1 ---
		slot18 = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 323-323, warpins: 1 ---
		slot18 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 324-328, warpins: 2 ---
	slot15(slot16, slot17)

	if self._challenges[1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 329-339, warpins: 1 ---
		slot20 = self._challenges[1].panel
		slot18 = self._challenges[1].panel.top(slot19) - 4

		self._challenges_topic.set_bottom(slot16, self._challenges_topic)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 340-342, warpins: 2 ---
	if self._coords then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 343-360, warpins: 1 ---
		slot21 = self._saferect_panel
		slot19 = self._saferect_panel.h(self._saferect_panel) / 2

		self._controller.set_center(slot16, self._controller, self._saferect_panel.w(slot19) / 2)

		slot17 = self._coords

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 361-436, warpins: 0 ---
		for id, data in pairs(slot16) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 361-373, warpins: 1 ---
			slot22 = data.text
			local _, _, w, h = data.text.text_rect(slot21)
			slot28 = h

			data.text.set_size(slot25, data.text, w)

			if data.x then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 374-388, warpins: 1 ---
				local x = self._controller.x(slot25) + data.x
				slot27 = self._controller
				local y = self._controller.y(self._controller) + data.y

				if data.align == "left" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 389-394, warpins: 1 ---
					slot29 = x

					data.text.set_left(slot27, data.text)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 395-397, warpins: 1 ---
					if data.align == "right" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 398-403, warpins: 1 ---
						slot29 = x

						data.text.set_right(slot27, data.text)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 404-406, warpins: 1 ---
						if data.align == "center" then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 407-411, warpins: 1 ---
							slot29 = x

							data.text.set_center_x(slot27, data.text)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 412-414, warpins: 4 ---
				if data.vertical == "top" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 415-420, warpins: 1 ---
					slot29 = y

					data.text.set_top(slot27, data.text)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 421-423, warpins: 1 ---
					if data.vertical == "bottom" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 424-429, warpins: 1 ---
						slot29 = y

						data.text.set_bottom(slot27, data.text)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 430-434, warpins: 1 ---
						slot29 = y

						data.text.set_center_y(slot27, data.text)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 435-436, warpins: 5 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 437-437, warpins: 2 ---
	return 
	--- END OF BLOCK #7 ---



end
LevelLoadingScreenGuiScript.update = function (self, progress, t, dt)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return 
	--- END OF BLOCK #0 ---



end
LevelLoadingScreenGuiScript.get_loading_text = function (self, dot_count)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot5 = "."
	slot8 = dot_count

	return self._init_text .. string.rep(slot4, math.floor(slot7))
	--- END OF BLOCK #0 ---



end
LevelLoadingScreenGuiScript.set_text = function (self, text)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot5 = text

	self._text_gui.set_text(slot3, self._text_gui)

	self._init_text = text

	return 
	--- END OF BLOCK #0 ---



end
LevelLoadingScreenGuiScript.destroy = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = self._saferect

	if alive(slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-12, warpins: 1 ---
		slot4 = self._saferect

		self._scene_gui.destroy_workspace(slot2, self._scene_gui)

		self._saferect = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-17, warpins: 2 ---
	slot3 = self._fullrect

	if alive(slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-24, warpins: 1 ---
		slot4 = self._fullrect

		self._scene_gui.destroy_workspace(slot2, self._scene_gui)

		self._fullrect = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-29, warpins: 2 ---
	slot3 = self._ws

	if alive(slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-36, warpins: 1 ---
		slot4 = self._ws

		self._scene_gui.destroy_workspace(slot2, self._scene_gui)

		self._ws = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 37-39, warpins: 2 ---
	if self._back_drop_gui then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-45, warpins: 1 ---
		slot3 = self._back_drop_gui

		self._back_drop_gui.destroy(slot2)

		self._back_drop_gui = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 46-46, warpins: 2 ---
	return 
	--- END OF BLOCK #4 ---



end
LevelLoadingScreenGuiScript.visible = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = self._ws

	return self._ws.visible(slot2)
	--- END OF BLOCK #0 ---



end
LevelLoadingScreenGuiScript.set_visible = function (self, visible)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if visible then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-7, warpins: 1 ---
		slot4 = self._ws

		self._ws.show(slot3)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-11, warpins: 1 ---
		slot4 = self._ws

		self._ws.hide(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-12, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end

return 

--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #1 4-5, warpins: 1 ---
slot0 = class()
--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #2 6-31, warpins: 2 ---
--- END OF BLOCK #2 ---



