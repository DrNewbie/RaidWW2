Easing = Easing or class()
Easing.linear = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	return (change * t) / duration + starting_value
end
Easing.quadratic_in = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration

	return change * t * t + starting_value
end
Easing.quadratic_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration

	return -change * t * (t - 2) + starting_value
end
Easing.quadratic_in_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration / 2

	if t < 1 then
		return change / 2 * t * t + starting_value
	end

	t = t - 1

	return -(change / 2) * (t * (t - 2) - 1) + starting_value
end
Easing.cubic_in = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration

	return change * t * t * t + starting_value
end
Easing.cubic_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration
	t = t - 1

	return change * (t * t * t + 1) + starting_value
end
Easing.cubic_in_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration / 2

	if t < 1 then
		return change / 2 * t * t * t + starting_value
	end

	t = t - 2

	return change / 2 * (t * t * t + 2) + starting_value
end
Easing.quartic_in = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration

	return change * t * t * t * t + starting_value
end
Easing.quartic_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration
	t = t - 1

	return -change * (t * t * t * t - 1) + starting_value
end
Easing.quartic_in_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration / 2

	if t < 1 then
		return change / 2 * t * t * t * t + starting_value
	end

	t = t - 2

	return -(change / 2) * (t * t * t * t - 2) + starting_value
end
Easing.quintic_in = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration

	return change * t * t * t * t * t + starting_value
end
Easing.quintic_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration
	t = t - 1

	return change * (t * t * t * t * t + 1) + starting_value
end
Easing.quintic_in_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration / 2

	if t < 1 then
		return change / 2 * t * t * t * t * t + starting_value
	end

	t = t - 2

	return change / 2 * (t * t * t * t * t + 2) + starting_value
end
Easing.sinusoidal_in = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	slot7 = t / duration * math.pi / 2

	return -change * math.cos(slot6) + change + starting_value
end
Easing.sinusoidal_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	slot6 = t / duration * math.pi / 2

	return change * math.sin(slot5) + starting_value
end
Easing.sinusoidal_in_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	slot7 = (math.pi * t) / duration

	return -change / 2 * (math.cos(slot6) - 1) + starting_value
end
Easing.exponential_in = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	slot7 = 10 * (t / duration - 1)

	return change * math.pow(slot5, 2) + starting_value
end
Easing.exponential_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	slot7 = (-10 * t) / duration

	return change * (-math.pow(slot5, 2) + 1) + starting_value
end
Easing.exponential_in_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration / 2

	if t < 1 then
		slot8 = 10 * (t - 1)

		return change / 2 * math.pow(slot6, 2) + starting_value
	end

	t = t - 1
	slot8 = -10 * t

	return change / 2 * (-math.pow(slot6, 2) + 2) + starting_value
end
Easing.circular_in = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration
	slot7 = 1 - t * t

	return -change * (math.sqrt(slot6) - 1) + starting_value
end
Easing.circular_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t - 1
	slot6 = 1 - t * t

	return change * math.sqrt(slot5) + starting_value
end
Easing.circular_in_out = function (t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration / 2

	if t < 1 then
		slot7 = 1 - t * t

		return -change / 2 * (math.sqrt(slot6) - 1) + starting_value
	end

	t = t - 2
	slot7 = 1 - t * t

	return change / 2 * (math.sqrt(slot6) + 1) + starting_value
end
Easing.sine_pulse = function (t, duration)
	duration = duration or 1

	if t <= 0 then
		return 0
	elseif 0 < t and t <= duration then
		slot4 = t / duration * 2 * 180 - 90

		return math.sin(slot3) + 1
	end

	return 0
end
Easing.sine_step = function (t)
	if t <= 0 then
		return 0
	elseif 0 < t and t <= 1 then
		slot3 = t * 180 - 90

		return math.sin(slot2) + 1
	end

	return 1
end

return 
