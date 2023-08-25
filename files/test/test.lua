gok_test_final_boss = false

local function gok_spawn_final_boss( x, y )
	local entity_id = EntityLoad( "data/entities/animals/boss_centipede/boss_centipede.xml", x, y )
	EntitySetComponentsWithTagEnabled( entity_id, "disabled_at_start", true )
	EntitySetComponentsWithTagEnabled( entity_id, "enabled_at_start", false )
	PhysicsSetStatic( entity_id, false )

	EntityLoad( "data/entities/animals/boss_centipede/reference_point.xml", x, y )

	local child_entities = EntityGetAllChildren( entity_id )
	local child_to_remove = 0

	if ( child_entities ~= nil ) then
		for i,child_id in ipairs( child_entities ) do
			if EntityHasTag( child_id, "protection" ) then
				child_to_remove = child_id
			end
		end
	end

	if ( child_to_remove ~= 0 ) then
		EntityKill( child_to_remove )
	end
end

local function set_flags()
	dofile_once( "mods/generals/files/boss_list.lua" )
	for i = 1,#gok_boss_list do
		local flag = gok_boss_list[i].flag_run
		if flag then
			GameAddFlagRun(gok_boss_list[i].flag_run)
		end
	end
end

function gok_test( player_entity )
	--set_flags()
	--EntitySetTransform( player_entity, 1540, 6050 ) -- forge
	EntitySetTransform( player_entity, 3500, 13000 ) -- kolmi
	local x, y = EntityGetTransform( player_entity )
	if gok_test_final_boss then gok_spawn_final_boss( x - 100, y - 100 ) end

end

