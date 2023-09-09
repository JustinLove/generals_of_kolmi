dofile_once( "mods/generals_of_kolmi/files/boss_list.lua" )

function gok_destroy_effect(entity_id, flag_run)
	if GameHasFlagRun(flag_run) then
		return
	end
	local x,y = EntityGetTransform( entity_id )
	local players = EntityGetWithTag( "player_unit" ) or {}
	if #players > 0 then
		local x,y = EntityGetTransform( players[1] )
	end
	local newgame_n = tonumber( SessionNumbersGetValue("NEW_GAME_PLUS_COUNT") )
	local orbs = 'orbs'
	if newgame_n > 0 then
		orbs = 'orbs_ngp'
	end

	local boss

	for b = 1,#gok_boss_list do
		boss = gok_boss_list[b]
		if boss.flag_run == flag_run then
			break
		end
	end

	if not boss then return end

	local pivot = EntityLoad( "mods/generals_of_kolmi/files/destroy_effect.xml", x, y )
	if #players > 0 then
		EntityAddChild( players[1], pivot )
	end

	for o = 1,boss[orbs] do
		local orb = EntityLoad( "mods/generals_of_kolmi/files/orb_red_destroy.xml", x, y )
		local sprite = EntityGetFirstComponent( orb, "SpriteComponent" )
		if sprite then
			ComponentSetValue2( sprite, 'image_file', 'data/ui_gfx/animal_icons/'..boss.animal_icon..'.png')
		end
		EntityAddChild( pivot, orb )
	end

	local var = EntityGetFirstComponent( pivot, "VariableStorageComponent" )
	if var then
		ComponentSetValue2( var, 'value_int', GameGetFrameNum() )
	end

end
