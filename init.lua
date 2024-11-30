---@type mod_calllbacks
local M = {}
	dofile("data/scripts/lua_mods/mods/PrimordialisUnhinged/data/scripts/enemies/donothing_brain.lua")
	--dofile("data/scripts/lua_mods/mods/PrimordialisUnhinged/data/scripts/enemies/snail_spammer_brain.lua")
	--these were causeing crash^^^^^
	
---@type brain_function
_G["example.no_brain"] = function(body)
	---@type brain
	local brain = {}
	brain.rotation = 5 -- be a spinny
	return brain
end

---@type spawn_function
_G["example.explosion_resist"] = function(body_id, x, y)
	give_mutation(body_id, MUT_EXPLOSIVE_RESISTANCE)
	return { nil, nil, x, y } -- this determines spawn extra info
end

-- pre hook is for changing how functions that everyone uses behaves
function M.pre(api, config)
	-- shadow the add_creature_spawn_chance function so we can modify it
	local old_add_creature_spawn_chance = add_creature_spawn_chance
	function add_creature_spawn_chance(...)
		local args = { ... } -- collect the arguments into a table for easy modification
		args[4] = args[4] * 20 -- this arg is the xp drop amount, so make everything drop 20x xp
		return old_add_creature_spawn_chance(unpack(args)) -- call the original with the modified args
	end
end

-- post hook is for defining creatures
function M.post(api, config)
	local spawn_rate = config.spawn_rates or 0.2
	-- we shadow the creature_list function to call our additional code after it
	local old_creature_list = creature_list
	creature_list = function(...)
		-- call the original
		local r = { old_creature_list(...) }

		-- register our creatures
		--register_creature("FLER", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/FLEER.bod", "fleer_brain")
		register_creature("SSRK", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SAW_SHARK.bod", "saw_shark_brain","budding_spawn")
		register_creature("PCTT", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/POLYCHAETE_TINY.bod", "polychaete_tiny_brain")
		register_creature("SNYL", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL.bod", "snail_brain")
		register_creature("SNY2", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL2.bod", "snail_brain")
		register_creature("SNY3", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL3.bod", "snail_brain")
		register_creature("SNY4", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL4.bod", "snail_brain")
		register_creature("SNY5", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL5.bod", "snail_brain")
		register_creature("SNY6", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL6.bod", "snail_spammer_brain")
		register_creature("CATH", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_hard1.bod", "snail_brain")
		register_creature("CATB", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_basic1.bod", "snail_brain")
		register_creature("CATS", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_spike1.bod", "snail_brain")--old lower biomass design
		register_creature("CATV", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_venom1.bod", "snail_brain")
		register_creature("CATP", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_poison1.bod", "snail_brain")--old lower biomass design, not used rn
		register_creature("CATL", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_light2.bod", "snail_brain")
		register_creature("CATR", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_24rocket1.bod", "snail_spammer_brain")
		register_creature("SFOX", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/starfoxboss1.bod","donothing_brain")
		register_creature("BUS2", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/missile_bush1.bod","donothing_brain")
		-- return the result of the original, not strictly neccesary here but useful in some situations
		return unpack(r)
	end

	-- shadow init_biomes function to call our stuff afterwards
	local old_init_biomes = init_biomes
	init_biomes = function(...)
		local r = { old_init_biomes(...) }
		-- add our creatures to the starting biome, if spawn_rates are too high you will start to see issues where only some creatures can spawn
		-- to fix this make sure the sum isn't too high, i will perhaps add a prehook for compat with this in future
		--add_creature_spawn_chance("SAFE", "SNY6", 0.2, 199)
		add_creature_spawn_chance("SAFE", "DUMY", 0.01, 0)
		add_creature_spawn_chance("SAFE", "SNYL", 0.01, 3)
		add_creature_spawn_chance("SAFE", "CATH", 0.01, 3)
		--add_creature_spawn_chance("SAFE", "SFOX", 0.1, 3)
		-- add_creature_spawn_chance("SAFE", "SFOX", 0.2, 2)
			--add_creature_spawn_chance("SAFE", "CATR", 0.1, 100)
			--add_plant_spawn_chance("SAFE", "BUS2", 0.2, 1)

		add_creature_spawn_chance("STRT", "FISH", 0.05, 6)
		add_creature_spawn_chance("STRT", "JSQD", 0.2, 3)
		add_creature_spawn_chance("STRT", "SHLD", 0.008, 5)
		add_creature_spawn_chance("STRT", "MWRM", 0.005, 15)
		add_creature_spawn_chance("STRT", "SPDY", 0.01, 5)
		add_creature_spawn_chance("STRT", "CHRT", 0.008, 6)
		add_creature_spawn_chance("STRT", "SCRP", 0.005, 9)
		add_creature_spawn_chance("STRT", "GRUB", 0.05, 1)
		add_creature_spawn_chance("STRT", "AANT", 0.04, 3)
		add_creature_spawn_chance("STRT", "SNYL", 0.03, 3)
		add_creature_spawn_chance("STRT", "SNY2", 0.01, 5)
		add_creature_spawn_chance("STRT", "SNY3", 0.01, 6)
		add_creature_spawn_chance("STRT", "SNY4", 0.01, 4)
		add_creature_spawn_chance("STRT", "PCTT", 0.02, 3)

		add_creature_spawn_chance("STRT", "SNY2", 0.01, 5)
		add_creature_spawn_chance("STRT", "SNY3", 0.01, 6)
		add_creature_spawn_chance("STRT", "SNY4", 0.01, 4)
		
		add_creature_spawn_chance("STRT", "CATH", 0.01, 3)
		add_creature_spawn_chance("STRT", "CATB", 0.02, 3)
		add_creature_spawn_chance("STRT", "CATS", 0.01, 3)
		add_creature_spawn_chance("STRT", "CATV", 0.01, 3)
		--add_creature_spawn_chance("STRT", "CATR", 0.1, 9)

		--add_plant_spawn_chance("STRT", "BUSH", 0.04, 1)
		add_plant_spawn_chance("STRT", "BUS2", 0.04, 1)
		add_plant_spawn_chance("STRT", "GRAS", 0.01, 1)
		add_plant_spawn_chance("STRT", "STRP", 0.005, 1)

		add_creature_spawn_chance("ICEE", "FISH", 0.04, 5)
		add_creature_spawn_chance("ICEE", "FSH2", 0.02, 20)
		add_creature_spawn_chance("ICEE", "EJEL", 0.008, 20)
		add_creature_spawn_chance("ICEE", "TXPL", 0.01, 20)
		add_creature_spawn_chance("ICEE", "LSTR", 0.02, 10)
		add_creature_spawn_chance("ICEE", "FLER", 0.002, 40)
		add_creature_spawn_chance("ICEE", "NEUR", 0.002, 40)
		add_creature_spawn_chance("ICEE", "COMP", 0.0005, 40)
		add_creature_spawn_chance("ICEE", "SSRK", 0.01, 20)
		add_creature_spawn_chance("ICEE", "MJEL", 0.1, 1)
		add_creature_spawn_chance("ICEE", "SNY2", 0.02, 5)
		add_creature_spawn_chance("ICEE", "SNY5", 0.04, 8)
		add_creature_spawn_chance("ICEE", "CATH", 0.01, 3)
		add_creature_spawn_chance("ICEE", "CATS", 0.01, 3)
		add_creature_spawn_chance("ICEE", "CATV", 0.01, 3)

		add_plant_spawn_chance("ICEE", "CORL", 0.02, 1)

		add_creature_spawn_chance("FIRE", "MSLR", 0.01, 120)
		add_creature_spawn_chance("FIRE", "ESTR", 0.02, 40)
		add_creature_spawn_chance("FIRE", "FNOM", 0.01, 80)
		add_creature_spawn_chance("FIRE", "CHIN", 0.01, 60)
		add_creature_spawn_chance("FIRE", "FRNX", 0.005, 100)
		add_creature_spawn_chance("FIRE", "MINE", 0.01, 80)

		add_creature_spawn_chance("DARK", "ASSN", 0.05, 20)
		add_creature_spawn_chance("DARK", "TONG", 0.01, 20)
		add_creature_spawn_chance("DARK", "GLBG", 0.2, 1)
		add_creature_spawn_chance("DARK", "CATL", 0.05, 2)

		add_creature_spawn_chance("BOSS", "B100", 0.005, 1000)
		add_creature_spawn_chance("BOSS", "BMSL", 0.02, 1000)
		add_creature_spawn_chance("BOSS", "DNUT", 0.02, 1000)
		return unpack(r)
	end
end

return M
--[[
	function budding_spawn(body_id, x, y)
		local target_x = x
		local target_y = y

		values = {}
		values[3] = target_x
		values[4] = target_y

		give_mutation(body_id, MUT_BUDDING);

		return values
	end


	dofile("data/scripts/lua_mods/mods/PrimordialisUnhinged/data/scripts/enemies/donothing_brain.lua")
	dofile("data/scripts/lua_mods/mods/PrimordialisUnhinged/data/scripts/enemies/snail_spammer_brain.lua")

	function creature_list()
		register_creature("FLER", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/FLEER.bod", "fleer_brain")
		register_creature("TONG", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/TONGUE.bod", "tongue_brain")
		register_creature("FRNX", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/FURNACE.bod", "furnace_brain", "example_spawn")
		register_creature("CHIN", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/CHAINSAW.bod", "chainsaw_brain")
		register_creature("COMP", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/COMPRESSOR.bod", "saw_shark_brain", "example_spawn")
		register_creature("SCRP", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SCORPION.bod", "scorpion_brain")
		register_creature("SSRK", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SAW_SHARK.bod", "saw_shark_brain","budding_spawn")
		register_creature("MINE", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/MINER.bod", "miner_brain", "example_spawn")
		register_creature("NEUR", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/NEURON.bod", "neuron_brain")
		register_creature("PCTT", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/POLYCHAETE_TINY.bod", "polychaete_tiny_brain")
		register_creature("SNYL", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL.bod", "snail_brain")
		register_creature("SNY2", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL2.bod", "snail_brain")
		register_creature("SNY3", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL3.bod", "snail_brain")
		register_creature("SNY4", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL4.bod", "snail_brain")
		register_creature("SNY5", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL5.bod", "snail_brain")
		register_creature("SNY6", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/SNAIL6.bod", "snail_spammer_brain")
		register_creature("CATH", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_hard1.bod", "snail_brain")
		register_creature("CATB", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_basic1.bod", "snail_brain")
		register_creature("CATS", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_spike1.bod", "snail_brain")--old lower biomass design
		register_creature("CATV", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_venom1.bod", "snail_brain")
		register_creature("CATP", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_poison1.bod", "snail_brain")--old lower biomass design, not used rn
		register_creature("CATL", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_light2.bod", "snail_brain")
		register_creature("CATR", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/caterpillar_24rocket.bod", "snail_spammer_brain")
		register_creature("SFOX", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/starfoxboss1.bod","donothing_brain")
		register_creature("BUS2", "data/scripts/lua_mods/mods/PrimordialisUnhinged/bodies/missile_bush1.bod","donothing_brain")
	end
		
	function init_biomes()
		--add_creature_spawn_chance("SAFE", "SNY6", 0.2, 199)
		add_creature_spawn_chance("SAFE", "DUMY", 0.01, 0)
		add_creature_spawn_chance("SAFE", "SNYL", 0.01, 3)
		add_creature_spawn_chance("SAFE", "CATH", 0.01, 3)
		--add_creature_spawn_chance("SAFE", "SFOX", 0.1, 3)
		-- add_creature_spawn_chance("SAFE", "SFOX", 0.2, 2)
			--add_creature_spawn_chance("SAFE", "CATR", 0.1, 100)
			add_plant_spawn_chance("SAFE", "BUS2", 0.2, 1)

		add_creature_spawn_chance("STRT", "FISH", 0.05, 6)
		add_creature_spawn_chance("STRT", "JSQD", 0.2, 3)
		add_creature_spawn_chance("STRT", "SHLD", 0.008, 5)
		add_creature_spawn_chance("STRT", "MWRM", 0.005, 15)
		add_creature_spawn_chance("STRT", "SPDY", 0.01, 5)
		add_creature_spawn_chance("STRT", "CHRT", 0.008, 6)
		add_creature_spawn_chance("STRT", "SCRP", 0.005, 9)
		add_creature_spawn_chance("STRT", "GRUB", 0.05, 1)
		add_creature_spawn_chance("STRT", "AANT", 0.04, 3)
		add_creature_spawn_chance("STRT", "SNYL", 0.03, 3)
		add_creature_spawn_chance("STRT", "SNY2", 0.01, 5)
		add_creature_spawn_chance("STRT", "SNY3", 0.01, 6)
		add_creature_spawn_chance("STRT", "SNY4", 0.01, 4)
		add_creature_spawn_chance("STRT", "PCTT", 0.02, 3)

		add_creature_spawn_chance("STRT", "SNY2", 0.01, 5)
		add_creature_spawn_chance("STRT", "SNY3", 0.01, 6)
		add_creature_spawn_chance("STRT", "SNY4", 0.01, 4)
		
		add_creature_spawn_chance("STRT", "CATH", 0.01, 3)
		add_creature_spawn_chance("STRT", "CATB", 0.02, 3)
		add_creature_spawn_chance("STRT", "CATS", 0.01, 3)
		add_creature_spawn_chance("STRT", "CATV", 0.01, 3)
		--add_creature_spawn_chance("STRT", "CATR", 0.1, 9)

		--add_plant_spawn_chance("STRT", "BUSH", 0.04, 1)
		add_plant_spawn_chance("STRT", "BUS2", 0.04, 1)
		add_plant_spawn_chance("STRT", "GRAS", 0.01, 1)
		add_plant_spawn_chance("STRT", "STRP", 0.005, 1)

		add_creature_spawn_chance("ICEE", "FISH", 0.04, 5)
		add_creature_spawn_chance("ICEE", "FSH2", 0.02, 20)
		add_creature_spawn_chance("ICEE", "EJEL", 0.008, 20)
		add_creature_spawn_chance("ICEE", "TXPL", 0.01, 20)
		add_creature_spawn_chance("ICEE", "LSTR", 0.02, 10)
		add_creature_spawn_chance("ICEE", "FLER", 0.002, 40)
		add_creature_spawn_chance("ICEE", "NEUR", 0.002, 40)
		add_creature_spawn_chance("ICEE", "COMP", 0.0005, 40)
		add_creature_spawn_chance("ICEE", "SSRK", 0.01, 20)
		add_creature_spawn_chance("ICEE", "MJEL", 0.1, 1)
		add_creature_spawn_chance("ICEE", "SNY2", 0.02, 5)
		add_creature_spawn_chance("ICEE", "SNY5", 0.04, 8)
		add_creature_spawn_chance("ICEE", "CATH", 0.01, 3)
		add_creature_spawn_chance("ICEE", "CATS", 0.01, 3)
		add_creature_spawn_chance("ICEE", "CATV", 0.01, 3)

		add_plant_spawn_chance("ICEE", "CORL", 0.02, 1)

		add_creature_spawn_chance("FIRE", "MSLR", 0.01, 120)
		add_creature_spawn_chance("FIRE", "ESTR", 0.02, 40)
		add_creature_spawn_chance("FIRE", "FNOM", 0.01, 80)
		add_creature_spawn_chance("FIRE", "CHIN", 0.01, 60)
		add_creature_spawn_chance("FIRE", "FRNX", 0.005, 100)
		add_creature_spawn_chance("FIRE", "MINE", 0.01, 80)

		add_creature_spawn_chance("DARK", "ASSN", 0.05, 20)
		add_creature_spawn_chance("DARK", "TONG", 0.01, 20)
		add_creature_spawn_chance("DARK", "GLBG", 0.2, 1)
		add_creature_spawn_chance("DARK", "CATL", 0.05, 2)

		add_creature_spawn_chance("BOSS", "B100", 0.005, 1000)
		add_creature_spawn_chance("BOSS", "BMSL", 0.02, 1000)
		add_creature_spawn_chance("BOSS", "DNUT", 0.02, 1000)
	end
end
--]]