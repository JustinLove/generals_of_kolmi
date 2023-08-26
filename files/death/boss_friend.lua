gok_original_death = death

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	gok_original_death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	GameAddFlagRun( "miniboss_friend" )

	local tcount = tonumber( GlobalsGetValue( "ULTIMATE_KILLER_KILLS", "0" ) )
	if ( tcount >= 9 ) then
		GameAddFlagRun( "miniboss_friend_super" )
	end
end
