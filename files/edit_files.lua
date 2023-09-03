local function edit_file(path, f, ...)
	local text = ModTextFileGetContent( path )
	if text then
		ModTextFileSetContent( path, f( text, ... ) )
	end
end

local function text_file_append(path, append)
	local text = ModTextFileGetContent( path )
	if text then
		text = text .. '\ndofile("' .. append .. '")\n'
		ModTextFileSetContent( path, text )
	end
end

local function boss_orbcount(text)
	text = string.gsub( text, 'orbcount = GameGetOrbCountThisRun%(%)', 'orbcount = GameGetOrbCountThisRun()\ndofile("mods/generals_of_kolmi/files/boss_list.lua")\norbcount = orbcount + gok_boss_orbcount()' )
	return text
end

local function cheat_death(text)
	text = string.gsub( text, '_GUI_menu = mobs end},', '_GUI_menu = mobs end},\n{name="-Boss Death",func=function() _GUI_menu = gok_cheat_boss_deaths end},' )
	text = text .. "\npublic_grid = grid"
	return text
end

function gok_edit_files()
	--edit_file( "data/translations/common.csv", function(content)
		--return content .. translations .. gok_wand_upgrade_translations
	--end)

	if not ModIsEnabled('Famine') then
		edit_file( "data/entities/animals/boss_centipede/boss_centipede_update.lua", boss_orbcount )
	end

	text_file_append( "data/entities/animals/boss_fish/death.lua", "mods/generals_of_kolmi/files/death/boss_fish.lua" )
	text_file_append( "data/entities/animals/boss_robot/death.lua", "mods/generals_of_kolmi/files/death/boss_robot.lua" )
	text_file_append( "data/entities/animals/maggot_tiny/death.lua", "mods/generals_of_kolmi/files/death/maggot_tiny.lua" )
	text_file_append( "data/entities/animals/boss_alchemist/death.lua", "mods/generals_of_kolmi/files/death/boss_alchemist.lua" )
	text_file_append( "data/entities/animals/boss_wizard/death.lua", "mods/generals_of_kolmi/files/death/boss_wizard.lua" )
	text_file_append( "data/entities/animals/boss_pit/boss_pit_death.lua", "mods/generals_of_kolmi/files/death/boss_pit.lua" )
	text_file_append( "data/entities/animals/boss_ghost/death.lua", "mods/generals_of_kolmi/files/death/boss_ghost.lua" )
	text_file_append( "data/entities/animals/boss_gate/gate_monster_death.lua", "mods/generals_of_kolmi/files/death/boss_gate.lua" )
	text_file_append( "data/scripts/animals/friend_death.lua", "mods/generals_of_kolmi/files/death/boss_friend.lua" )
	text_file_append( "data/scripts/animals/boss_dragon_death.lua", "mods/generals_of_kolmi/files/death/boss_dragon.lua" )
	text_file_append( "data/entities/animals/boss_limbs/boss_limbs_death.lua", "mods/generals_of_kolmi/files/death/boss_limbs.lua" )

	if ModIsEnabled( 'Cheat Menu by Everfades' ) then
		edit_file( "data/example_gui/gui.lua", cheat_death )
	end
end
