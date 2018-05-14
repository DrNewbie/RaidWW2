if not TextTemplateBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

TextTemplateBase = slot0
function TextTemplateBase:init(unit)
	slot6 = false

	TextTemplateBase.super.init(slot3, self, unit)

	slot4 = self

	self._apply_template(slot3)

	return 
end
function TextTemplateBase:_apply_template()
	if self.TEMPLATE == "stocks" then
		slot3 = self

		self._stock_ticker(slot2)
	elseif self.TEMPLATE == "big_bank_welcome" then
		slot3 = self

		self._big_bank_welcome(slot2)
	end

	return 
end
function TextTemplateBase:set_template(template)
	self.TEMPLATE = template
	slot4 = self

	self._apply_template(slot3)

	return 
end
function TextTemplateBase:_stock_ticker()
	slot4 = self._unit

	for i = 1, self._unit.text_gui(slot3).ROWS, 1 do
		slot7 = self._unit
		slot9 = 20

		self._unit.text_gui(slot6).set_row_gap(slot6, self._unit.text_gui(slot6), i)

		slot7 = self._unit
		slot8 = i

		self._unit.text_gui(slot6).clear_row_and_guis(slot6, self._unit.text_gui(slot6))

		slot7 = self._unit
		slot12 = 1
		slot9 = i * 100 + 40 + 120 * math.rand(slot11)

		self._unit.text_gui(slot6).set_row_speed(slot6, self._unit.text_gui(slot6), i)
	end

	local companies = {
		"Common Carriers",
		"Avalon",
		"Kranich",
		"Gensec Industries",
		"Murkywater Solutions",
		"iPear",
		"Falcogini",
		"Monarch",
		"Garnet Group",
		"White Mesa",
		"TimeOut!",
		"DC Menswear",
		"Shield Malls",
		"Harvest & Trustee",
		"Benevolent Conglomerate",
		"Sparkle and Spirit",
		"Triceraopt",
		"Rated T",
		"Bodhi's Pool Maintenance & Repair",
		"Kung Bo China",
		"Tasteful Club",
		"Omni Transport",
		"First World Bank",
		"Mercy Hospital",
		"OVERKILL Bombers",
		"Starbreeze Suns",
		"SRC Finance Consultants",
		"Green Air Foundation",
		"Zecchino",
		"Telescam",
		"Smithsonian Bike Rentals",
		"DC Bus",
		"Hector the Dog Daycare",
		"DJ D Enterprises",
		"Jan SWE Security Corps.",
		"Jules Baguettes",
		"Robert's Bank of Savings & Trust",
		"Sweet Relief",
		"Ultracoat",
		"Sanco Gas",
		"Cheese Toast Inc.",
		"Kenneth Cleaning Services",
		"ShasanBox",
		"Sentinel",
		"Omni Exports",
		"Hefty Shipping & Transport LTD",
		"Almendia Logistics",
		"Capitol Savings Bank",
		"Perfect Fits",
		"Shear Hairmony",
		"Cosmetics DermoProfessionnel",
		"Sweat Like A Maniac Gym",
		"Miss We Bags & Accessories",
		"Gioielli Di Famiglia",
		"Douglas Development Corporation",
		"Raw Deal Sushi",
		"Apartments 4 Rent",
		"Twenty Four Seven",
		"Solid Gold Rifles",
		"OVE Power Tools",
		"The Mask Makers Guild",
		"Berger Combat Gear",
		"Infamy Eyewear",
		"Bronco Firearms",
		"TITAN",
		"Frans Yaeger Safes",
		"Precious Things",
		"Tempfix",
		"Importante",
		"Buffler",
		"Alliance Towing",
		"Alpha Electric",
		"Ball Fortress",
		"Ballinger",
		"Beacon",
		"Biggs",
		"Binksi Logging",
		"Binski Paper Co",
		"BLU Builders League United",
		"BLU Blast Complex",
		"BLU Brewery",
		"BLU Co",
		"BLU Freight & Shipping",
		"BLU Industries Incorporated",
		"Blue Corn Co.",
		"BLU Steel",
		"Bonk!",
		"Brown Nugget Prospecting",
		"Captain Dan's",
		"Casali Shafting Co.",
		"Clem's",
		"Cliffe Rocks Inc.",
		"Co Op",
		"Conagher's Tool & Munitions",
		"Cornwell",
		"Cracky Pop!",
		"Crummy's Burgers",
		"Dalokohs",
		"Driller",
		"Farmers Elevator",
		"Farmers Feed & Seed Co.",
		"Ferguson System",
		"Freeman Airboat Tours",
		"General Industries Co.",
		"Gilded Gold",
		"Gold Medal",
		"Goldstream Fuel Co.",
		"Gray Gravel Co.",
		"Hampshire's Heavy Lifting Equipment",
		"Handy Hoe",
		"Happy Farmers Cooperative",
		"Holdingford Mill",
		"Husky Acres",
		"Icarus Airliners",
		"Imperial Mining",
		"Industrial",
		"Jenkin Coal Co.",
		"Jimi Jam",
		"Jobbs Orchards",
		"Lucky Plucker",
		"Mann Co.",
		"Newell and Sons",
		"Northern Express",
		"Old Geezer",
		"P.R.P.",
		"Piper & Piper Pipeworks Inc.",
		"Primaprime",
		"Projecto",
		"RED Reliable Excavation Demolition",
		"Red Bread",
		"RED Iron",
		"RED Iron Works",
		"Red Shed",
		"Red Valley Mining",
		"Redstone Cargo",
		"Regal Plumbing Supplies",
		"Rib Place",
		"Rio Grande Coal Co.",
		"Rolling Stone Mining Logistics",
		"Sanders BBQ",
		"Schucker & Sons",
		"Scoot's Canoe",
		"Shiny's Bullion",
		"Sunny Hay",
		"Superior Feeds",
		"Telemax",
		"Wright Shipping",
		"XXX",
		"Zippy Plow"
	}

	if not TextTemplateBase.STOCK_PERCENT then
		TextTemplateBase.STOCK_PERCENT = {}
		local bankruptcy_chance = math.rand()
		local bad_chance = math.rand(0.01)
		local good_chance = math.rand(0.1)
		slot7 = 0.01
		local joker_chance = math.rand(0.1)
		local srand = nil
		slot9 = companies

		for i, company in ipairs(slot8) do
			srand = 0
			slot14 = 1

			if math.rand(slot13) < bankruptcy_chance then
				slot15 = -45
				srand = math.rand(slot13, -99)
			else
				slot14 = 1

				if math.rand(slot13) < bad_chance then
					slot15 = -5
					srand = math.rand(slot13, -55)
				else
					slot14 = 1

					if math.rand(slot13) < good_chance then
						slot15 = 40
						srand = math.rand(slot13, 0)
					else
						slot14 = 1

						if math.rand(slot13) < joker_chance then
							slot15 = 250
							srand = math.rand(slot13, -100)
						else
							slot15 = 10
							srand = math.rand(slot13, -10)
						end
					end
				end
			end

			TextTemplateBase.STOCK_PERCENT[i] = srand
		end
	end

	slot4 = companies

	for i, company in ipairs(slot3) do
		local j = TextTemplateBase.STOCK_PERCENT[i]
		slot13 = self._unit
		slot11 = self._unit.text_gui(slot12).ROWS
		local row = math.mod(slot9, i) + 1
		slot11 = self._unit
		slot14 = "white"

		self._unit.text_gui(i).add_text(i, self._unit.text_gui(i), row, company)

		slot11 = self._unit
		slot18 = j
		slot17 = self._unit
		slot17 = nil

		self._unit.text_gui(i).add_text(slot10, self._unit.text_gui(i), row, "" .. ((j < 0 and "") or "+") .. string.format(slot16, "%.2f") .. "%", (j < 0 and "light_red") or "light_green", self._unit.text_gui(slot16).FONT_SIZE / 1.5, "bottom")

		slot11 = self._unit
		slot14 = "white"

		self._unit.text_gui(slot10).add_text(slot10, self._unit.text_gui(slot10), row, "  ")
	end

	return 
end
function TextTemplateBase:_big_bank_welcome()
	slot3 = self._unit
	slot5 = 100

	self._unit.text_gui(slot2).set_row_speed(slot2, self._unit.text_gui(slot2), 1)

	slot3 = self._unit
	slot7 = 1
	slot5 = 240 + 120 * math.rand(slot6)

	self._unit.text_gui(slot2).set_row_speed(slot2, self._unit.text_gui(slot2), 2)

	slot3 = self._unit
	slot5 = 320

	self._unit.text_gui(slot2).set_row_gap(slot2, self._unit.text_gui(slot2), 1)

	slot4 = self._unit

	for i = 1, self._unit.text_gui(self._unit.text_gui(slot2)).ROWS, 1 do
		slot7 = self._unit
		slot8 = i

		self._unit.text_gui(slot6).clear_row_and_guis(slot6, self._unit.text_gui(slot6))
	end

	local texts = {
		"Welcome to the Benevolent bank",
		" - ",
		"We know how to take care of your money",
		" - ",
		"Welcome to the Benevolent bank",
		" - ",
		"You and your money matters",
		" - ",
		"Welcome to the Benevolent Bank",
		" - ",
		"Your money is safe with us",
		" - ",
		"Welcome to the Benevolent bank",
		" - ",
		"Give us your money right now",
		" - ",
		"Welcome to the Benevolent bank",
		" - ",
		"Time to cash out?",
		" - ",
		"Welcome to the Benevolent bank",
		" - ",
		"We love money",
		" - ",
		"Welcome to the Benevolent bank",
		" - ",
		"Money as sweet as honey",
		" - ",
		"Welcome to the Benevolent bank",
		" - ",
		"Why so serious?",
		" - ",
		"Welcome to the Benevolent bank",
		" - ",
		"A penny saved is a penny earned",
		" - "
	}
	local texts2 = {
		"Loan",
		"Invest",
		"Market",
		"Stock",
		"Currencies",
		"Global Markets",
		"Sell",
		"Buy",
		"Portfolio",
		"Funds",
		"Inflation"
	}
	slot5 = texts

	for i, text in ipairs(slot4) do
		slot10 = self._unit
		slot13 = "green"

		self._unit.text_gui(slot9).add_text(slot9, self._unit.text_gui(slot9), 1, text)
	end

	slot5 = texts2

	for i, text in ipairs(slot4) do
		slot10 = self._unit
		slot13 = "light_green"

		self._unit.text_gui(slot9).add_text(slot9, self._unit.text_gui(slot9), 2, text)

		slot10 = self._unit
		slot13 = "light_green"

		self._unit.text_gui(slot9).add_text(slot9, self._unit.text_gui(slot9), 2, " - ")
	end

	return 
end
function TextTemplateBase:destroy()
	return 
end
function TextTemplateBase:save(data)
	local state = {
		template = self.TEMPLATE
	}
	data.TextTemplateBase = state

	return 
end
function TextTemplateBase:load(data)
	local state = data.TextTemplateBase

	if state.template and state.TEMPLATE ~= self.TEMPLATE then
		slot6 = state.template

		self.set_template(slot4, self)
	end

	return 
end

return 
