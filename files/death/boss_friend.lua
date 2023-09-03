gok_original_death = death

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	dofile_once( "mods/generals_of_kolmi/files/destroy_effect.lua" )
	gok_destroy_effect( GetUpdatedEntityID(), "miniboss_friend" )
	GameAddFlagRun( "miniboss_friend" )

	local tcount = tonumber( GlobalsGetValue( "ULTIMATE_KILLER_KILLS", "0" ) )
	if ( tcount >= 9 ) then
		gok_destroy_effect( GetUpdatedEntityID(), "miniboss_friend_super" )
		GameAddFlagRun( "miniboss_friend_super" )
	end

	gok_original_death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
end
