dofile_once( "mods/generals/files/boss_list.lua" )

local always_show_image = false

local entity_id = GetUpdatedEntityID()
local x,y = EntityGetTransform( entity_id )
local pivot = EntityLoad( "mods/generals/files/orb_pivot.xml", x, y )

local newgame_n = tonumber( SessionNumbersGetValue("NEW_GAME_PLUS_COUNT") )
for i = 1,newgame_n do
	local orb = EntityLoad( "mods/generals/files/orb_green.xml", x, y )
	EntityAddChild( pivot, orb )
end

for b = 1,#gok_boss_list do
	local boss = gok_boss_list[b]
	for o = 1,boss.orbs do
		local orb = EntityLoad( "mods/generals/files/orb_red.xml", x, y )
		local sprite = EntityGetFirstComponent( orb, "SpriteComponent" )
		if sprite then
			if always_show_image or boss.flag == nil or HasFlagPersistent(boss.flag) then
				ComponentSetValue2( sprite, 'image_file', 'data/ui_gfx/animal_icons/'..boss.animal_icon..'.png')
			else
				EntitySetComponentIsEnabled( orb, sprite, false )
			end
		end
		EntityAddChild( pivot, orb )
	end
end

local orbcount = GameGetOrbCountThisRun()
for i = 1,orbcount do
	local orb = EntityLoad( "mods/generals/files/orb_blue.xml", x, y )
	EntityAddChild( pivot, orb )
end

EntityAddChild( entity_id, pivot )
