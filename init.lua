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

	ModLuaFileAppend( "data/entities/animals/boss_robot/death.lua", "mods/generals/files/death/boss_robot.lua" )
	ModLuaFileAppend( "data/entities/animals/boss_alchemist/death.lua", "mods/generals/files/death/boss_alchemist.lua" )
	ModLuaFileAppend( "data/entities/animals/boss_wizard/death.lua", "mods/generals/files/death/boss_wizard.lua" )
	ModLuaFileAppend( "data/entities/animals/boss_pit/boss_pit_death.lua", "mods/generals/files/death/boss_pit.lua" )
	ModLuaFileAppend( "data/entities/animals/boss_ghost/death.lua", "mods/generals/files/death/boss_ghost.lua" )
	ModLuaFileAppend( "data/scripts/animals/friend_death.lua", "mods/generals/files/death/boss_friend.lua" )
	ModLuaFileAppend( "data/scripts/animals/boss_dragon_death.lua", "mods/generals/files/death/boss_dragon.lua" )

	if gok_test_final_boss then
		--ModLuaFileAppend( "data/entities/animals/boss_centipede/boss_centipede_update.lua", "mods/generals/files/test/kill_final_boss.lua" )
	end

	if ModIsEnabled( 'Cheat Menu by Everfades' ) then
		ModLuaFileAppend( "mods/Cheat Menu by Everfades/files/locations.lua", "mods/generals/files/Cheat Menu by Everfades/locations.lua" )
	end

	gok_edit_files()
end

-- This code runs when all mods' filesystems are registered
