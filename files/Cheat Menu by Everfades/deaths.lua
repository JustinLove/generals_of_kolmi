dofile_once( "mods/generals_of_kolmi/files/test/test.lua" )

function gok_boss_death(item)
	local x,y = EntityGetTransform(EntityGetWithTag( "player_unit" )[1])
	item.spawn(x, y - 100)
end

gok_cheat_boss_deaths = function()
	public_grid("Boss Deaths",gok_test_boss_death_list,gok_boss_death)
end
