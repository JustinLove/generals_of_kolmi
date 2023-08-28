dofile_once( "mods/generals/files/edit_files.lua" )
dofile_once( "mods/generals/files/test/test.lua" )

function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
	local init_check_flag = "gok_init_done"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
	GameAddFlagRun( init_check_flag )

	gok_test( player_entity )
end

function OnModInit()
	ModLuaFileAppend( "data/entities/animals/boss_centipede/boss_centipede_before_fight.lua", "mods/generals/files/boss_centipede_before_fight.lua" )

	if ModIsEnabled( 'Cheat Menu by Everfades' ) then
		ModLuaFileAppend( "mods/Cheat Menu by Everfades/files/locations.lua", "mods/generals/files/Cheat Menu by Everfades/locations.lua" )
		ModLuaFileAppend( "data/example_gui/gui.lua", "mods/generals/files/Cheat Menu by Everfades/deaths.lua" )
	end

	gok_edit_files()
end

-- This code runs when all mods' filesystems are registered
