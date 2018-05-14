-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
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

-- Decompilation error in this vicinity:
--- BLOCK #0 1-3, warpins: 1 ---
slot0 = WalletGuiObject or class()
WalletGuiObject = slot0
WalletGuiObject.init = function (self, panel)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot4 = panel

	WalletGuiObject.set_wallet(slot3)

	return 
	--- END OF BLOCK #0 ---



end
WalletGuiObject.set_wallet = function (panel, layer)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	WalletGuiObject.remove_wallet()

	slot2 = Global
	slot5 = panel
	slot3 = panel.panel
	slot6 = {
		name = "WalletGuiObject"
	}

	if not layer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		slot7 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-256, warpins: 2 ---
	slot6.layer = slot7
	slot2.wallet_panel = slot3(slot4, slot5)
	slot5 = {
		texture = "guis/textures/pd2/shared_wallet_symbol",
		name = "wallet_money_icon"
	}
	local money_icon = Global.wallet_panel.bitmap(slot3(slot4, slot5), Global.wallet_panel)
	slot6 = {
		texture = "guis/textures/pd2/shared_level_symbol",
		name = "wallet_level_icon"
	}
	local level_icon = Global.wallet_panel.bitmap(Global.wallet_panel, Global.wallet_panel)
	slot7 = {
		texture = "guis/textures/pd2/shared_skillpoint_symbol",
		name = "wallet_skillpoint_icon"
	}
	local skillpoint_icon = Global.wallet_panel.bitmap(Global.wallet_panel, Global.wallet_panel)
	slot8 = {
		text = "",
		name = "wallet_money_text",
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text
	}
	local money_text = Global.wallet_panel.text(Global.wallet_panel, Global.wallet_panel)
	slot9 = {
		name = "wallet_level_text",
		text = tostring(managers.experience.current_level(slot13)),
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text
	}
	slot14 = managers.experience
	local level_text = Global.wallet_panel.text(Global.wallet_panel, Global.wallet_panel)
	slot10 = {
		name = "wallet_skillpoint_text",
		text = tostring(managers.experience.current_level),
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = tweak_data.screen_colors.text
	}
	local skillpoint_text = Global.wallet_panel.text(Global.wallet_panel, Global.wallet_panel)
	slot10 = money_text
	local mw, mh = WalletGuiObject.make_fine_text(Global.wallet_panel)
	slot12 = level_text
	local lw, lh = WalletGuiObject.make_fine_text(tweak_data.screen_colors.text)
	slot14 = skillpoint_text
	local sw, sh = WalletGuiObject.make_fine_text(0)

	money_icon.set_leftbottom(slot15, money_icon, 2)

	slot19 = money_icon
	slot17 = money_icon.right(Global.wallet_panel.h(money_icon) - 2) + 2

	money_text.set_left(slot15, money_text)

	slot16 = money_text
	slot19 = money_icon

	money_text.set_center_y(slot15, money_icon.center_y(Global.wallet_panel.h(money_icon) - 2))

	slot16 = money_text
	slot21 = money_text

	money_text.set_y(slot15, math.round(money_text.y(Global.wallet_panel)))
	level_icon.set_leftbottom(slot15, level_icon, money_text.right(Global.wallet_panel.h(money_icon) - 2) + 10)

	slot19 = level_icon
	slot17 = level_icon.right(Global.wallet_panel.h(money_text) - 2) + 2

	level_text.set_left(slot15, level_text)

	slot16 = level_text
	slot19 = level_icon

	level_text.set_center_y(slot15, level_icon.center_y(Global.wallet_panel.h(money_text) - 2))

	slot16 = level_text
	slot21 = level_text

	level_text.set_y(slot15, math.round(level_text.y(Global.wallet_panel)))
	skillpoint_icon.set_leftbottom(slot15, skillpoint_icon, level_text.right(Global.wallet_panel.h(money_text) - 2) + 10)

	slot19 = skillpoint_icon
	slot17 = skillpoint_icon.right(Global.wallet_panel.h(level_text) - 2) + 2

	skillpoint_text.set_left(slot15, skillpoint_text)

	slot16 = skillpoint_text
	slot19 = skillpoint_icon

	skillpoint_text.set_center_y(slot15, skillpoint_icon.center_y(Global.wallet_panel.h(level_text) - 2))

	slot16 = skillpoint_text

	skillpoint_text.set_y(slot15, math.round(skillpoint_text.y(Global.wallet_panel)))

	local max_w = skillpoint_text.right(slot15)
	slot18 = {
		texture = "guis/textures/test_blur_df",
		name = "bg_blur",
		h = 0,
		w = 0,
		render_template = "VertexColorTexturedBlur3D",
		layer = -1
	}
	local bg_blur = Global.wallet_panel.bitmap(skillpoint_text, Global.wallet_panel)
	slot19 = 0
	slot22 = Global.wallet_panel

	bg_blur.set_leftbottom(Global.wallet_panel, bg_blur, Global.wallet_panel.h(skillpoint_text))

	slot19 = max_w + 2

	bg_blur.set_w(Global.wallet_panel, bg_blur)

	slot22 = money_icon
	slot19 = Global.wallet_panel.h(Global.wallet_panel.h) - money_icon.top(Global.wallet_panel)

	bg_blur.set_h(Global.wallet_panel, bg_blur)

	slot19 = false

	WalletGuiObject.set_object_visible(Global.wallet_panel, "wallet_skillpoint_icon")

	slot19 = false

	WalletGuiObject.set_object_visible(Global.wallet_panel, "wallet_skillpoint_text")

	return 
	--- END OF BLOCK #1 ---



end
WalletGuiObject.refresh = function ()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if Global.wallet_panel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-184, warpins: 1 ---
		slot3 = "wallet_money_icon"
		local money_icon = Global.wallet_panel.child(slot1, Global.wallet_panel)
		slot4 = "wallet_level_icon"
		local level_icon = Global.wallet_panel.child(Global.wallet_panel, Global.wallet_panel)
		slot5 = "wallet_skillpoint_icon"
		local skillpoint_icon = Global.wallet_panel.child(Global.wallet_panel, Global.wallet_panel)
		slot6 = "wallet_money_text"
		local money_text = Global.wallet_panel.child(Global.wallet_panel, Global.wallet_panel)
		slot7 = "wallet_level_text"
		local level_text = Global.wallet_panel.child(Global.wallet_panel, Global.wallet_panel)
		slot8 = "wallet_skillpoint_text"
		local skillpoint_text = Global.wallet_panel.child(Global.wallet_panel, Global.wallet_panel)
		slot9 = ""

		money_text.set_text(Global.wallet_panel, money_text)

		slot8 = money_text

		WalletGuiObject.make_fine_text(Global.wallet_panel)
		money_icon.set_leftbottom(Global.wallet_panel, money_icon, 2)

		slot11 = money_icon
		slot9 = money_icon.right(Global.wallet_panel.h(slot11) - 2) + 2

		money_text.set_left(Global.wallet_panel, money_text)

		slot8 = money_text
		slot11 = money_icon

		money_text.set_center_y(Global.wallet_panel, money_icon.center_y(Global.wallet_panel.h(slot11) - 2))

		slot8 = money_text
		slot13 = money_text

		money_text.set_y(Global.wallet_panel, math.round(money_text.y(Global.wallet_panel)))

		slot8 = level_text
		slot13 = managers.experience

		level_text.set_text(Global.wallet_panel, tostring(managers.experience.current_level(Global.wallet_panel)))

		slot8 = level_text

		WalletGuiObject.make_fine_text(Global.wallet_panel)
		level_icon.set_leftbottom(Global.wallet_panel, level_icon, money_text.right(Global.wallet_panel.h(slot11) - 2) + 10)

		slot11 = level_icon
		slot9 = level_icon.right(Global.wallet_panel.h(money_text) - 2) + 2

		level_text.set_left(Global.wallet_panel, level_text)

		slot8 = level_text
		slot11 = level_icon

		level_text.set_center_y(Global.wallet_panel, level_icon.center_y(Global.wallet_panel.h(money_text) - 2))

		slot8 = level_text
		slot13 = level_text

		level_text.set_y(Global.wallet_panel, math.round(level_text.y(Global.wallet_panel)))

		slot8 = skillpoint_text
		slot11 = 0

		skillpoint_text.set_text(Global.wallet_panel, tostring(Global.wallet_panel.h(money_text) - 2))

		slot8 = skillpoint_text

		WalletGuiObject.make_fine_text(Global.wallet_panel)
		skillpoint_icon.set_leftbottom(Global.wallet_panel, skillpoint_icon, level_text.right(Global.wallet_panel.h(money_text) - 2) + 10)

		slot11 = skillpoint_icon
		slot9 = skillpoint_icon.right(Global.wallet_panel.h(level_text) - 2) + 2

		skillpoint_text.set_left(Global.wallet_panel, skillpoint_text)

		slot8 = skillpoint_text
		slot11 = skillpoint_icon

		skillpoint_text.set_center_y(Global.wallet_panel, skillpoint_icon.center_y(Global.wallet_panel.h(level_text) - 2))

		slot8 = skillpoint_text
		slot13 = skillpoint_text

		skillpoint_text.set_y(Global.wallet_panel, math.round(skillpoint_text.y(Global.wallet_panel)))

		slot9 = false

		WalletGuiObject.set_object_visible(Global.wallet_panel, "wallet_skillpoint_icon")

		slot9 = false

		WalletGuiObject.set_object_visible(Global.wallet_panel, "wallet_skillpoint_text")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 185-185, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
WalletGuiObject.make_fine_text = function (text)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot3 = text
	local x, y, w, h = text.text_rect(slot2)
	slot9 = h

	text.set_size(slot6, text, w)

	slot8 = math.round(text.x(slot11))
	slot13 = text

	text.set_position(slot6, text, math.round(text.y(text)))

	return w, h
	--- END OF BLOCK #0 ---



end
WalletGuiObject.set_layer = function (layer)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot3 = Global.wallet_panel

	if not alive(slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-14, warpins: 2 ---
	slot4 = layer

	Global.wallet_panel.set_layer(slot2, Global.wallet_panel)

	return 
	--- END OF BLOCK #1 ---



end
WalletGuiObject.move_wallet = function (mx, my)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot4 = Global.wallet_panel

	if not alive(slot3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-15, warpins: 2 ---
	slot6 = my

	Global.wallet_panel.move(slot3, Global.wallet_panel, mx)

	return 
	--- END OF BLOCK #1 ---



end
WalletGuiObject.set_object_visible = function (object, visible)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot4 = Global.wallet_panel

	if not alive(slot3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-34, warpins: 2 ---
	slot5 = object
	slot5 = visible

	Global.wallet_panel.child(slot3, Global.wallet_panel).set_visible(slot3, Global.wallet_panel.child(slot3, Global.wallet_panel))

	slot5 = "bg_blur"
	local bg_blur = Global.wallet_panel.child(slot3, Global.wallet_panel)
	slot6 = "wallet_skillpoint_icon"
	slot5 = Global.wallet_panel.child(Global.wallet_panel, Global.wallet_panel)

	if Global.wallet_panel.child(Global.wallet_panel, Global.wallet_panel).visible(Global.wallet_panel) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-47, warpins: 1 ---
		slot5 = bg_blur
		slot9 = "wallet_skillpoint_text"
		slot8 = Global.wallet_panel.child(slot7, Global.wallet_panel)

		bg_blur.set_w(slot4, Global.wallet_panel.child(slot7, Global.wallet_panel).right(slot7))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-58, warpins: 1 ---
		slot6 = "wallet_level_icon"
		slot5 = Global.wallet_panel.child(slot4, Global.wallet_panel)

		if Global.wallet_panel.child(slot4, Global.wallet_panel).visible(slot4) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 59-71, warpins: 1 ---
			slot5 = bg_blur
			slot9 = "wallet_level_text"
			slot8 = Global.wallet_panel.child(slot7, Global.wallet_panel)

			bg_blur.set_w(slot4, Global.wallet_panel.child(slot7, Global.wallet_panel).right(slot7))
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-82, warpins: 1 ---
			slot6 = "wallet_money_icon"
			slot5 = Global.wallet_panel.child(slot4, Global.wallet_panel)

			if Global.wallet_panel.child(slot4, Global.wallet_panel).visible(slot4) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 83-95, warpins: 1 ---
				slot5 = bg_blur
				slot9 = "wallet_money_text"
				slot8 = Global.wallet_panel.child(slot7, Global.wallet_panel)

				bg_blur.set_w(slot4, Global.wallet_panel.child(slot7, Global.wallet_panel).right(slot7))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 96-99, warpins: 1 ---
				slot6 = 0

				bg_blur.set_w(slot4, bg_blur)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 100-112, warpins: 4 ---
	slot5 = bg_blur
	slot9 = "wallet_money_icon"
	slot8 = Global.wallet_panel.child(slot7, Global.wallet_panel)

	bg_blur.set_leftbottom(slot4, Global.wallet_panel.child(slot7, Global.wallet_panel).leftbottom(slot7))

	return 
	--- END OF BLOCK #2 ---



end
WalletGuiObject.remove_wallet = function ()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = Global.wallet_panel
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-33, warpins: 2 ---
	slot2 = Global.wallet_panel
	slot3 = Global.wallet_panel

	Global.wallet_panel.parent(slot1).remove(slot1, Global.wallet_panel.parent(slot1))

	Global.wallet_panel = nil

	return 
	--- END OF BLOCK #1 ---



end
WalletGuiObject.close_wallet = function (panel)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot3 = Global.wallet_panel
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-26, warpins: 2 ---
	slot3 = Global.wallet_panel

	if panel ~= Global.wallet_panel.parent(slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-27, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-36, warpins: 2 ---
	slot4 = Global.wallet_panel

	panel.remove(slot2, panel)

	Global.wallet_panel = nil

	return 
	--- END OF BLOCK #2 ---



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
--- BLOCK #2 6-34, warpins: 2 ---
--- END OF BLOCK #2 ---



