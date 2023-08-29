dofile_once( "mods/generals_of_kolmi/files/boss_list.lua" )

local always_show_image = false

local entity_id = GetUpdatedEntityID()
local x,y = EntityGetTransform( entity_id )
local pivot = EntityLoad( "mods/generals_of_kolmi/files/orb_pivot.xml", x, y )

local newgame_n = tonumber( SessionNumbersGetValue("NEW_GAME_PLUS_COUNT") )
for i = 1,newgame_n do
	local orb = EntityLoad( "mods/generals_of_kolmi/files/orb_green.xml", x, y )
	EntityAddChild( pivot, orb )
end

for b = 1,#gok_boss_list do
	local boss = gok_boss_list[b]
	local done = boss.flag_run and GameHasFlagRun(boss.flag_run)
	if not done then
		for o = 1,boss.orbs do
			local orb = EntityLoad( "mods/generals_of_kolmi/files/orb_red.xml", x, y )
			if boss.flag_run then
				GameAddFlagRun('gok_'..boss.flag_run)
				local var = EntityGetFirstComponent( orb, "VariableStorageComponent" )
				if var then
					ComponentSetValue2( var, 'value_string', boss.flag_run )
				end
			end
			local sprite = EntityGetFirstComponent( orb, "SpriteComponent" )
			if sprite then
				if always_show_image or boss.flag_show == nil or HasFlagPersistent(boss.flag_show) then
					ComponentSetValue2( sprite, 'image_file', 'data/ui_gfx/animal_icons/'..boss.animal_icon..'.png')
				else
					EntitySetComponentIsEnabled( orb, sprite, false )
				end
			end
			EntityAddChild( pivot, orb )
		end
	end
end

local orbcount = GameGetOrbCountThisRun()
for i = 1,orbcount do
	local orb = EntityLoad( "mods/generals_of_kolmi/files/orb_blue.xml", x, y )
	EntityAddChild( pivot, orb )
end

local var = EntityGetFirstComponent( pivot, "VariableStorageComponent" )
if var then
	ComponentSetValue2( var, 'value_int', orbcount )
	--ComponentSetValue2( var, 'value_string', tostring(GameGetFrameNum()) ) -- outro effect test
end

EntityAddChild( entity_id, pivot )
