gok_original_death = death

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	local entity_id    = GetUpdatedEntityID()
	local name = EntityGetName(entity_id)
	local flag_run = name .. "_killed"
	dofile_once( "mods/generals_of_kolmi/files/destroy_effect.lua" )
	gok_destroy_effect( GetUpdatedEntityID(), flag_run )

	gok_original_death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
end
