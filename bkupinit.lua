


dofile("data/scripts/utilities.lua")

function example_spawn(body_id, x, y)
    local target_x = x
    local target_y = y

    values = {}
    values[3] = target_x
    values[4] = target_y

    give_mutation(body_id, MUT_EXPLOSIVE_RESISTANCE);

    return values
end

function budding_spawn(body_id, x, y)
    local target_x = x
    local target_y = y

    values = {}
    values[3] = target_x
    values[4] = target_y

    give_mutation(body_id, MUT_BUDDING);

    return values
end

dofile("data/scripts/enemies/default_brain.lua")
dofile("data/scripts/enemies/fleer_brain.lua")
dofile("data/scripts/enemies/tongue_brain.lua")
dofile("data/scripts/enemies/chainsaw_brain.lua")
dofile("data/scripts/enemies/miner_brain.lua")
dofile("data/scripts/enemies/furnace_brain.lua")
dofile("data/scripts/enemies/scorpion_brain.lua")
dofile("data/scripts/enemies/saw_shark_brain.lua")
dofile("data/scripts/enemies/neuron_brain.lua")
dofile("data/scripts/enemies/polychaete_tiny_brain.lua")
dofile("data/scripts/enemies/snail_brain.lua")
dofile("data/scripts/lua_mods/mods/PrimordialisUnhinged/data/scripts/enemies/donothing_brain.lua")
dofile("data/scripts/lua_mods/mods/PrimordialisUnhinged/data/scripts/enemies/snail_spammer_brain.lua")

function creature_list()
	register_creature("FLER", "body plans/FLEER.bod", "fleer_brain")
	register_creature("TONG", "body plans/TONGUE.bod", "tongue_brain")
	register_creature("FRNX", "body plans/FURNACE.bod", "furnace_brain", "example_spawn")
	register_creature("CHIN", "body plans/CHAINSAW.bod", "chainsaw_brain")
	register_creature("COMP", "body plans/COMPRESSOR.bod", "saw_shark_brain", "example_spawn")
	register_creature("SCRP", "body plans/SCORPION.bod", "scorpion_brain")
	register_creature("SSRK", "body plans/SAW_SHARK.bod", "saw_shark_brain","budding_spawn")
	register_creature("MINE", "body plans/MINER.bod", "miner_brain", "example_spawn")
	register_creature("NEUR", "body plans/NEURON.bod", "neuron_brain")
	register_creature("PCTT", "body plans/POLYCHAETE_TINY.bod", "polychaete_tiny_brain")
	register_creature("SNYL", "body plans/SNAIL.bod", "snail_brain")
	register_creature("SNY2", "body plans/SNAIL2.bod", "snail_brain")
	register_creature("SNY3", "body plans/SNAIL3.bod", "snail_brain")
	register_creature("SNY4", "body plans/SNAIL4.bod", "snail_brain")
	register_creature("SNY5", "body plans/SNAIL5.bod", "snail_brain")
	register_creature("SNY6", "body plans/SNAIL6.bod", "snail_spammer_brain")
	register_creature("CATH", "body plans/caterpillar_hard1.bod", "snail_brain")
	register_creature("CATB", "body plans/caterpillar_basic1.bod", "snail_brain")
	register_creature("CATS", "body plans/caterpillar_spike1.bod", "snail_brain")--old lower biomass design
	register_creature("CATV", "body plans/caterpillar_venom1.bod", "snail_brain")
	register_creature("CATP", "body plans/caterpillar_poison1.bod", "snail_brain")--old lower biomass design, not used rn
	register_creature("CATL", "body plans/caterpillar_light2.bod", "snail_brain")
	register_creature("CATR", "body plans/caterpillar_24rocket.bod", "snail_spammer_brain")
	register_creature("SFOX", "body plans/starfoxboss1.bod","donothing_brain")
	register_creature("BUS2", "body plans/missile_bush1.bod","donothing_brain")
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
