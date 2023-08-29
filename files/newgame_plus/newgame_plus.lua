gok_base_do_newgame_plus = do_newgame_plus
function do_newgame_plus()
	dofile_once( "mods/generals_of_kolmi/files/boss_list.lua" )
	for i = 1,#gok_boss_list do
		local flag = gok_boss_list[i].flag_run
		if flag then
			GameRemoveFlagRun(gok_boss_list[i].flag_run)
		end
	end

	gok_base_do_newgame_plus()
end
