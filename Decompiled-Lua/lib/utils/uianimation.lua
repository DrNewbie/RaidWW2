UIAnimation = UIAnimation or class()
UIAnimation.linear = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	return (change * t) / duration + starting_value
end
UIAnimation.animate_text_glow = function (text, new_color, duration_per_letter, delay_between_letters, delay, initial_delay)
	if initial_delay ~= nil then
		slot8 = initial_delay

		wait(slot7)
	end

	while true do
		slot10 = text
		local number_of_letters = string.len(text.text(slot9))
		slot9 = text
		local original_color = text.color(text.text)
		local change_r = new_color.r - original_color.r
		local change_g = new_color.g - original_color.g
		local change_b = new_color.b - original_color.b
		local t = 0
		local duration = delay_between_letters * (number_of_letters - 1) + duration_per_letter

		while t < duration do
			local dt = coroutine.yield()
			t = t + dt

			for i = 1, number_of_letters, 1 do
				slot20 = (t - (i - 1) * delay_between_letters) / duration_per_letter
				local blend_amount = Easing.sine_pulse(slot19)
				local current_r = original_color.r + blend_amount * change_r
				local current_g = original_color.g + blend_amount * change_g
				local current_b = original_color.b + blend_amount * change_b
				slot26 = i
				slot31 = current_b

				text.set_range_color(slot23, text, i - 1, Color(slot28, current_r, current_g))
			end
		end

		slot16 = original_color

		text.set_color(slot14, text)

		if delay ~= nil then
			slot15 = delay

			wait(slot14)
		end
	end

	return 
end

return 
