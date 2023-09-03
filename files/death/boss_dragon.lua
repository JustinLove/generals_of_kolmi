gok_original_death = death

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	dofile_once( "mods/generals_of_kolmi/files/destroy_effect.lua" )
	gok_destroy_effect( GetUpdatedEntityID(), "miniboss_dragon" )
	GameAddFlagRun( "miniboss_dragon" )

	gok_original_death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
end
