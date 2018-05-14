if not RaidGuiControlDifficultyStars then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGuiControlDifficultyStars = slot0
RaidGuiControlDifficultyStars.STAR_FILLED_ICON = "star_rating"
RaidGuiControlDifficultyStars.STAR_FILLED_COLOR = tweak_data.gui.colors.raid_dirty_white
RaidGuiControlDifficultyStars.STAR_EMPTY_ICON = "star_rating_empty"
RaidGuiControlDifficultyStars.STAR_EMPTY_COLOR = tweak_data.gui.colors.raid_dirty_white
RaidGuiControlDifficultyStars.STAR_UNAVAILABLE_ICON = "star_rating_empty"
RaidGuiControlDifficultyStars.STAR_UNAVAILABLE_COLOR = tweak_data.gui.colors.raid_dark_grey
RaidGuiControlDifficultyStars.STARS_DISTANCE = 24
RaidGuiControlDifficultyStars.FIRST_STAR_CENTER_X = 9
function RaidGuiControlDifficultyStars:init(parent, params)
	slot7 = params

	RaidGuiControlDifficultyStars.super.init(slot4, self, parent)

	self._filled_color = params.fill_color or RaidGuiControlDifficultyStars.STAR_FILLED_COLOR
	self._empty_color = params.empty_color or params.fill_color or RaidGuiControlDifficultyStars.STAR_EMPTY_COLOR
	self._unavailable_color = params.unavailable_color or RaidGuiControlDifficultyStars.STAR_UNAVAILABLE_COLOR
	self._number_of_stars = params.amount
	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_stars(slot4)

	return 
end
function RaidGuiControlDifficultyStars:_create_panel()
	local panel_params = {
		name = self._params.name or "difficulty_stars_panel",
		x = self._params.x or 0,
		y = self._params.y or 0,
		w = (self._number_of_stars - 1) * RaidGuiControlDifficultyStars.STARS_DISTANCE + RaidGuiControlDifficultyStars.FIRST_STAR_CENTER_X * 2
	}
	slot5 = RaidGuiControlDifficultyStars.STAR_FILLED_ICON
	panel_params.h = tweak_data.gui.icon_h(RaidGuiControlDifficultyStars.FIRST_STAR_CENTER_X * 2, tweak_data.gui)
	slot5 = panel_params
	self._object = self._panel.panel(RaidGuiControlDifficultyStars.FIRST_STAR_CENTER_X * 2, self._panel)

	return 
end
function RaidGuiControlDifficultyStars:_create_stars()
	self._stars = {}
	local center_x = RaidGuiControlDifficultyStars.FIRST_STAR_CENTER_X

	for i = 1, self._number_of_stars, 1 do
		local star_params = {}
		slot10 = i
		star_params.name = "difficulty_star_" .. tostring(slot9)
		star_params.texture = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_UNAVAILABLE_ICON].texture
		star_params.texture_rect = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_UNAVAILABLE_ICON].texture_rect
		star_params.color = self._unavailable_color
		slot10 = star_params
		local star = self._object.bitmap(RaidGuiControlDifficultyStars.STAR_UNAVAILABLE_ICON, self._object)
		slot11 = center_x

		star.set_center_x(self._object, star)

		slot11 = star

		table.insert(self._object, self._stars)

		center_x = center_x + RaidGuiControlDifficultyStars.STARS_DISTANCE
	end

	return 
end
function RaidGuiControlDifficultyStars:set_progress(available, completed)
	for i = 1, #self._stars, 1 do
		slot10 = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_EMPTY_ICON].texture

		self._stars[i].set_image(slot8, self._stars[i])

		slot9 = self._stars[i]
		slot12 = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_EMPTY_ICON].texture_rect

		self._stars[i].set_texture_rect(slot8, unpack(RaidGuiControlDifficultyStars.STAR_EMPTY_ICON))

		slot10 = self._unavailable_color

		self._stars[i].set_color(slot8, self._stars[i])

		slot10 = true

		self._stars[i].set_visible(slot8, self._stars[i])
	end

	for i = 1, completed, 1 do
		slot10 = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_FILLED_ICON].texture

		self._stars[i].set_image(slot8, self._stars[i])

		slot9 = self._stars[i]
		slot12 = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_FILLED_ICON].texture_rect

		self._stars[i].set_texture_rect(slot8, unpack(RaidGuiControlDifficultyStars.STAR_FILLED_ICON))

		slot10 = self._filled_color

		self._stars[i].set_color(slot8, self._stars[i])

		slot10 = true

		self._stars[i].set_visible(slot8, self._stars[i])
	end

	for i = completed + 1, available, 1 do
		slot10 = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_EMPTY_ICON].texture

		self._stars[i].set_image(slot8, self._stars[i])

		slot9 = self._stars[i]
		slot12 = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_EMPTY_ICON].texture_rect

		self._stars[i].set_texture_rect(slot8, unpack(RaidGuiControlDifficultyStars.STAR_EMPTY_ICON))

		slot10 = self._empty_color

		self._stars[i].set_color(slot8, self._stars[i])

		slot10 = true

		self._stars[i].set_visible(slot8, self._stars[i])
	end

	return 
end
function RaidGuiControlDifficultyStars:set_active_difficulty(difficulty)
	for i = 1, #self._stars, 1 do
		slot9 = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_EMPTY_ICON].texture

		self._stars[i].set_image(slot7, self._stars[i])

		slot8 = self._stars[i]
		slot11 = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_EMPTY_ICON].texture_rect

		self._stars[i].set_texture_rect(slot7, unpack(RaidGuiControlDifficultyStars.STAR_EMPTY_ICON))

		slot9 = self._unavailable_color

		self._stars[i].set_color(slot7, self._stars[i])
	end

	for i = 1, difficulty, 1 do
		slot9 = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_FILLED_ICON].texture

		self._stars[i].set_image(slot7, self._stars[i])

		slot8 = self._stars[i]
		slot11 = tweak_data.gui.icons[RaidGuiControlDifficultyStars.STAR_FILLED_ICON].texture_rect

		self._stars[i].set_texture_rect(slot7, unpack(RaidGuiControlDifficultyStars.STAR_FILLED_ICON))

		slot9 = self._filled_color

		self._stars[i].set_color(slot7, self._stars[i])

		slot9 = true

		self._stars[i].set_visible(slot7, self._stars[i])
	end

	return 
end

return 
