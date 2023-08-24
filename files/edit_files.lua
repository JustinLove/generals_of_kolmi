local function edit_file(path, f, ...)
	local text = ModTextFileGetContent( path )
	if text then
		ModTextFileSetContent( path, f( text, ... ) )
	end
end

function gok_edit_files()
	--edit_file( "data/translations/common.csv", function(content)
		--return content .. translations .. gok_wand_upgrade_translations
	--end)

	--edit_file( "data/entities/animals/boss_limbs/boss_limbs_death.lua", tweak_boss_wands, 42, "SHUFFLE" )
end
