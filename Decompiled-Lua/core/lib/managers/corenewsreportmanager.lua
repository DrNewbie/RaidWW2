-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreNewsReportManager"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreString"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

NewsReportManager = NewsReportManager or CoreClass.class()
NewsReportManager.NEWS_FILE = "settings/news"
NewsReportManager.OLD_NEWS_FILE = "settings/old_news"
NewsReportManager.KEYWORDS = {
	WIKI_URL = "http://ganonbackup/wiki_artistwiki/index.php/Main_Page",
	GANON_URL = "http://ganonbackup",
	CT_WIKI_URL = "http://ganonbackup/wiki_artistwiki/index.php/Core_Team",
	GRIN = [[

  _|_|_|  _|_|_|    _|_|_|  _|      _|
_|        _|    _|    _|    _|_|    _|
_|  _|_|  _|_|_|      _|    _|  _|  _|
_|    _|  _|    _|    _|    _|    _|_|
  _|_|_|  _|    _|  _|_|_|  _|      _|
]],
	NL = "\n",
	GRIN_URL = "http://www.grin.se",
	SP = " ",
	TB = "\t",
	ENV = {
		os.getenv,
		true
	}
}
function NewsReportManager:init()
	self._news_dates = {}
	local news_file = self.NEWS_FILE .. ".xml"
	local old_news_file = self.OLD_NEWS_FILE .. ".xml"
	slot6 = news_file

	if SystemFS.exists(slot4, SystemFS) then
		slot6 = old_news_file

		if not SystemFS.exists(slot4, SystemFS) then
			slot9 = "w"
			local old_news = assert(SystemFS.open(slot6, SystemFS, old_news_file))
			slot7 = "<old_news/>"

			old_news.write(SystemFS.open, old_news)

			slot6 = old_news

			old_news.close(SystemFS.open)
		else
			slot9 = self.OLD_NEWS_FILE
			local old_news_root = assert(DB.load_node(slot6, DB, "xml"))
			slot6 = old_news_root

			for cat in old_news_root.children(DB.load_node) do
				slot13 = "date"
				self._news_dates[cat.name(slot10)] = cat.parameter(cat, cat)
			end
		end
	else
		slot6 = "[CoreNewsReportManager] Can't find: " .. news_file

		CoreDebug.cat_print(slot4, "spam")
	end

	return 
end
function NewsReportManager:replace(str)
	local function replace_str(s)
		local value = NewsReportManager.KEYWORDS[s]
		slot6 = value
		slot4 = (type(slot5) == "table" and value[1]()) or value or s

		return tostring(slot3)
	end

	slot5 = NewsReportManager.KEYWORDS

	for k, v in pairs(slot4) do
		slot10 = v

		if type(slot9) == "table" and v[2] then
			slot12 = v[1]
			str = string.gsub(slot9, str, "%$" .. k .. "%s([%w_]+)")
		end
	end

	slot7 = replace_str
	str = string.gsub(slot4, str, "%$([%w_]+)")

	return str
end
function NewsReportManager:format_news(news, format, ...)
	if format == "TEXT" then
		local output = nil
		slot6 = news

		for _, v in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			slot12 = output
			output = self.replace(slot10, self)
		end

		return output
	else
		local start = 0

		if 20 < #news then
			slot6 = 20 - #news
			start = math.abs(slot5)
		end

		local output = {}
		slot7 = news

		for i, v in ipairs(slot6) do
			if start < i then
				slot14 = v.text
				local str = string.format(slot11, "Date: %s%s", v.date)
				slot13 = output
				slot17 = str

				table.insert("Date: %s%s", self.replace(slot15, self))
			end
		end

		return 0 < #output and output
	end

	return 
end
function NewsReportManager:write_new_date()
	slot7 = "w"
	local old_news = assert(SystemFS.open(slot4, SystemFS, self.OLD_NEWS_FILE .. ".xml"))
	slot5 = "<old_news>\n"

	old_news.write(SystemFS.open, old_news)

	slot4 = self._news_dates

	for k, v in pairs(SystemFS.open) do
		slot12 = v

		old_news.printf(slot8, old_news, "\t<%s date=\"%s\"/>\n", k)
	end

	slot5 = "</old_news>"

	old_news.write(slot3, old_news)

	slot4 = old_news

	old_news.close(slot3)

	return 
end
function NewsReportManager:check_min_date(min_date, date)
	local d0 = {}
	local d1 = {}
	slot8 = "%d+"

	for n in string.gmatch(slot6, min_date) do
		slot11 = d0
		slot14 = n

		table.insert(slot10, tonumber(slot13))
	end

	slot8 = "%d+"

	for n in string.gmatch(slot6, date) do
		slot11 = d1
		slot14 = n

		table.insert(slot10, tonumber(slot13))
	end

	slot8 = "Bad date format!"

	assert(slot6, #d0 == #d1)

	slot7 = d0

	for i, n in ipairs(slot6) do
		if d1[i] < n then
			break
		elseif n < d1[i] then
			return true
		end
	end

	return false
end
function NewsReportManager:check_news(category, include_old_news, format, ...)
	local news = {}
	local news_updated = false
	slot10 = self.NEWS_FILE

	if DB.has(slot7, DB, "xml") then
		slot10 = self.NEWS_FILE
		local news_root = DB.load_node(slot7, DB, "xml")
	end

	if news_root then
		slot9 = news_root

		for cat in news_root.children(slot8) do
			slot13 = cat
			local cat_name = cat.name(slot12)

			if cat_name == category then
				local i = 1
				slot15 = cat

				for msg in cat.children(slot14) do

					-- Decompilation error in this vicinity:
					slot20 = "date"
					local msg_date = msg.parameter(slot18, msg)
					local old_date = self._news_dates[cat_name]
				end
			end
		end
	end

	if date_updated then
		slot9 = self

		self.write_new_date(slot8)
	end

	slot11 = format

	return self.format_news(slot8, self, news, ...)
end
function NewsReportManager:get_news(category)
	slot5 = category

	return self.check_news(slot3, self)
end
function NewsReportManager:get_old_news(category)
	slot6 = true

	return self.check_news(slot3, self, category)
end

return 
