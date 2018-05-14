-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreString"

core.module(slot1, core)

utf8.find_char = function (text, char)
	slot6 = text

	for i, c in ipairs(utf8.characters(slot5)) do
		if c == char then
			return i
		end
	end

	return 
end
string.begins = function (s, beginning)
	if s and beginning then
		slot6 = #beginning

		return s.sub(slot3, s, 1) == beginning
	end

	return false
end
string.ends = function (s, ending)
	if s and ending then

		-- Decompilation error in this vicinity:
		slot5 = -(#ending)

		return s.sub(slot3, s) == ending
	end

	return false
end
string.case_insensitive_compare = function (a, b)
	slot5 = b

	return string.lower(slot3) < string.lower(a)
end
string.split = function (s, separator_pattern, keep_empty, max_splits)
	local result = {}
	local pattern = "(.-)" .. separator_pattern .. "()"
	local count = 0
	local final_match_end_index = 0
	slot11 = pattern

	for part, end_index in string.gmatch(slot9, s) do
		final_match_end_index = end_index

		if keep_empty or part ~= "" then
			count = count + 1
			result[count] = part

			if count == max_splits then
				break
			end
		end
	end

	slot11 = final_match_end_index
	local remainder = string.sub(slot9, s)
	result[count + 1] = ((keep_empty or remainder ~= "") and remainder) or nil

	return result
end
string.join = function (separator, elements, keep_empty)
	function slot6(element)
		slot3 = element
		local as_string = tostring(slot2)

		if as_string ~= "" or keep_empty then
			return as_string
		end

		return 
	end

	local strings = table.collect(slot4, elements)
	slot7 = separator

	return table.concat(elements, strings)
end
string.trim = function (s, pattern)
	pattern = pattern or "%s*"
	slot5 = "^" .. pattern .. "(.-)" .. pattern .. "$"

	return string.match(slot3, s)
end
string.capitalize = function (s)
	function slot5(first_letter, remaining_letters)
		slot5 = remaining_letters

		return string.upper(slot3) .. string.lower(first_letter)
	end

	return string.gsub(slot2, s, "(%w)(%w*)")
end
string.pretty = function (s, capitalize)

	-- Decompilation error in this vicinity:
	slot6 = " "
	local pretty = string.gsub(slot3, s, "%W")
end
string.rep = function (self, n)
	local out = ""

	for i = 1, n, 1 do
		out = out .. self
	end

	return out
end
string.left = function (self, n)
	slot8 = self
	slot6 = n - self.len(slot7)

	return self .. " ".rep(slot4, " ")
end
string.add_decimal_marks_to_string = function (str)
	local total = str
	slot4 = total
	local reverse = string.reverse(slot3)
	local s = ""
	slot7 = reverse

	for i = 1, string.len(slot6), 1 do

		-- Decompilation error in this vicinity:
		slot8 = s
		slot13 = i
		slot9 = string.sub(slot10, reverse, i)
		slot13 = 3
		slot12 = reverse
		s = slot8 .. slot9 .. ((i ~= string.len(slot11) and ".") or "")
	end

	slot6 = s

	return string.reverse(slot5)
end

return 
