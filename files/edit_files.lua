local function edit_file(path, f, ...)
	local text = ModTextFileGetContent( path )
	if text then
		ModTextFileSetContent( path, f( text, ... ) )
	end
end

local function boss_orbcount(text)
	text = string.gsub( text, 'orbcount = GameGetOrbCountThisRun%(%)', 'orbcount = GameGetOrbCountThisRun()\ndofile("mods/generals/files/boss_list.lua")\norbcount = orbcount + gok_boss_orbcount()' )
	return text
end

function gok_edit_files()
	--edit_file( "data/translations/common.csv", function(content)
		--return content .. translations .. gok_wand_upgrade_translations
	--end)

	edit_file( "data/entities/animals/boss_centipede/boss_centipede_update.lua", boss_orbcount )
end
