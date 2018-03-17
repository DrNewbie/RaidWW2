function HUDBGBox_create(panel, params, config)
	local box_panel = panel:panel(params)
	local color = config and config.color
	local bg_color = config and config.bg_color or Color(1, 0, 0, 0)
	local blend_mode = config and config.blend_mode

	box_panel:rect({
		blend_mode = "normal",
		name = "bg",
		halign = "grow",
		alpha = 0.25,
		layer = -1,
		valign = "grow",
		color = bg_color
	})

	local left_top = box_panel:bitmap({
		--texture = "ui/ingame/textures/hud/hud_circle",
		name = "left_top",
		visible = true,
		layer = 0,
		y = 0,
		halign = "left",
		x = 0,
		valign = "top",
		color = color,
		blend_mode = blend_mode
	})
	local left_bottom = box_panel:bitmap({
		--texture = "ui/ingame/textures/hud/hud_circle",
		name = "left_bottom",
		visible = true,
		layer = 0,
		x = 0,
		y = 0,
		halign = "left",
		rotation = -90,
		valign = "bottom",
		color = color,
		blend_mode = blend_mode
	})

	left_bottom:set_bottom(box_panel:h())

	local right_top = box_panel:bitmap({
		--texture = "ui/ingame/textures/hud/hud_circle",
		name = "right_top",
		visible = true,
		layer = 0,
		x = 0,
		y = 0,
		halign = "right",
		rotation = 90,
		valign = "top",
		color = color,
		blend_mode = blend_mode
	})

	right_top:set_right(box_panel:w())

	local right_bottom = box_panel:bitmap({
		--texture = "ui/ingame/textures/hud/hud_circle",
		name = "right_bottom",
		visible = true,
		layer = 0,
		x = 0,
		y = 0,
		halign = "right",
		rotation = 180,
		valign = "bottom",
		color = color,
		blend_mode = blend_mode
	})

	right_bottom:set_right(box_panel:w())
	right_bottom:set_bottom(box_panel:h())

	return box_panel
end

HUDEnemyCounter = HUDEnemyCounter or class()

function HUDEnemyCounter:init(hud, full_hud)
	if not hud or not hud.panel or not full_hud or not full_hud.panel then
		return nil
	end
	self._hud_panel = hud.panel
	self._full_hud_panel = full_hud.panel

	local enemy_w = 76
	local enemy_h = 38
	local enemy_box_w = 38 * 2
	local enemy_box_h = 38
	local enemies_panel = self._hud_panel:panel({
		name = "enemies_panel",
		w = enemy_w,
		h = enemy_h,
		x = self._hud_panel:w() - enemy_w * 5
	})
	local enemies_icon = enemies_panel:bitmap({
		texture = "guis/textures/hud_icons",
		texture_rect = {464, 96, 32, 32},
		rect = {464, 96, 32, 32},
		name = "enemies_icon",
		layer = 1,
		y = 0,
		x = 0,
		visible = false,
		valign = "top"
	})
	self._enemies_bg_box = HUDBGBox_create(enemies_panel, {
		x = 0,
		y = 0,
		w = enemy_box_w,
		h = enemy_box_h
	}, {})
	enemies_icon:set_right(enemies_panel:w() + 10)
	enemies_icon:set_center_y(self._enemies_bg_box:h() / 2)
	self._enemies_bg_box:set_right(enemies_icon:left())
	local num_enemies = self._enemies_bg_box:text({
		layer = 1,
		vertical = "center",
		name = "num_enemies",
		align = "center",
		y = 0,
		x = 0,
		valign = "center",
		w = self._enemies_bg_box:w(),
		h = self._enemies_bg_box:h(),
		color = Color(0, 0, 0),
		font = "ui/fonts/pf_din_text_comp_pro_medium_32_mf",
		font_size = 24
	})
end

function HUDEnemyCounter:_show_enemies()
	self._hud_panel:child("enemies_panel"):show()
end

function HUDEnemyCounter:_hide_enemies()
	self._hud_panel:child("enemies_panel"):hide()
end

function HUDEnemyCounter:_set_enemy_offseted(is_offseted)
	local enemy_panel = self._hud_panel:child("enemies_panel")
	self._remove_enemy_offset = nil
	enemy_panel:stop()
end

function HUDEnemyCounter:set_num_enemies(data)
	self._enemies_bg_box:child("num_enemies"):set_text(""..data.nr_enemies)
	--local bg = self._enemies_bg_box:child("bg")
	--bg:stop()
end

Hooks:PostHook(HUDManager, "setup", "Post.HUDManager.setup", function(self)
	local hud = managers.hud:script(PlayerBase.INGAME_HUD_SAFERECT)
	local full_hud = managers.hud:script(PlayerBase.INGAME_HUD_FULLSCREEN)
	self._hud_enemy_counter = HUDEnemyCounter:new(hud, full_hud)
end)