dofile_once( "mods/generals_of_kolmi/files/boss_list.lua" )

local pivot = GetUpdatedEntityID()
local x, y = EntityGetTransform( pivot )

-- (don't see how ng+ could change while things are loaded)

function update_bosses()
	for b = 1,#gok_boss_list do
		local boss = gok_boss_list[b]
		if boss.flag_run then
			--GameAddFlagRun(boss.flag_run)
			local flag_orb = 'gok_orbs_present_'..boss.flag_run
			if GameHasFlagRun(boss.flag_run) and GameHasFlagRun(flag_orb) then
				GameRemoveFlagRun(flag_orb)
				local orbits = EntityGetAllChildren( pivot )

				if orbits ~= nil then
					for i = 1,#orbits do
						local orb = orbits[i]
						local var = EntityGetFirstComponent( orb, "VariableStorageComponent" )
						if var then
							if ComponentGetValue2( var, 'value_string' ) == boss.flag_run then
								EntityRemoveFromParent(orb)
								EntityKill(orb)
							end
						end
					end
				end
			end
		end
	end
end

function update_orbs()
	local orbcount = GameGetOrbCountThisRun()
	local visualcount = orbcount
	local var = EntityGetFirstComponent( pivot, "VariableStorageComponent" )
	if var then
		visualcount = ComponentGetValue2( var, 'value_int' )
		ComponentSetValue2( var, 'value_int', orbcount )
	end
	local add = orbcount - visualcount
	for i = 1,add do
		local orb = EntityLoad( "mods/generals_of_kolmi/files/orb_blue.xml", x, y )
		EntityAddChild( pivot, orb )
	end
end

local cx,cy,cw,ch = GameGetCameraBounds()
if cx-cw*2 < x and x < cx+cw*4 and cy-ch*2 < y and y < cy+ch*4 then
	update_bosses()
	update_orbs()
end
