local function basic_boss(name, xml, damage, tipe)
	return {
		name = name,
		spawn = function(x, y)
			local entity_id = EntityLoad( xml, x, y )
			EntityInflictDamage( entity_id, damage or 1000, tipe or "DAMAGE_PROJECTILE", "", "NONE", 0, 0 )
		end,
	}
end

gok_test_boss_death_list = {
	{
		name = 'friend_super',
		spawn = function(x, y)
			GlobalsSetValue( "ULTIMATE_KILLER_KILLS", "9" )
			local entity_id = EntityLoad( 'data/entities/animals/friend.xml', x, y )
			EntityInflictDamage( entity_id, 100000, "DAMAGE_DRILL", "", "NONE", 0, 0 )
		end,
	},
	basic_boss( 'friend', 'data/entities/animals/friend.xml' ),
	basic_boss( 'fish_giga', 'data/entities/animals/boss_fish/fish_giga.xml', 100000, "DAMAGE_EXPLOSION" ),
	basic_boss( 'boss_robot', 'data/entities/animals/boss_robot/boss_robot.xml', 1000, "DAMAGE_ELECTRICITY" ),
	basic_boss( 'maggot_tiny', 'data/entities/animals/maggot_tiny/maggot_tiny.xml', 1000, "DAMAGE_EXPLOSION" ),
	basic_boss( 'boss_alchemist', 'data/entities/animals/boss_alchemist/boss_alchemist.xml' ),
	basic_boss( 'boss_wizard', 'mods/generals_of_kolmi/files/test/test_wizard.xml' ),
	basic_boss( 'boss_pit', 'mods/generals_of_kolmi/files/test/test_pit.xml' ),
	basic_boss( 'boss_ghost', 'data/entities/animals/boss_ghost/boss_ghost.xml', 1000, 'DAMAGE_EXPLOSION' ),
	basic_boss( 'gate_monster_a', 'data/entities/animals/boss_gate/gate_monster_a.xml' ),
	basic_boss( 'gate_monster_b', 'data/entities/animals/boss_gate/gate_monster_b.xml' ),
	basic_boss( 'gate_monster_c', 'data/entities/animals/boss_gate/gate_monster_c.xml' ),
	basic_boss( 'gate_monster_d', 'data/entities/animals/boss_gate/gate_monster_d.xml' ),
	basic_boss( 'boss_dragon', 'mods/generals_of_kolmi/files/test/test_dragon.xml' ),
	basic_boss( 'boss_limbs', 'data/entities/animals/boss_limbs/boss_limbs.xml', 50 ),
}

function gok_test_boss_death(name, x, y)
	for i = 1,#gok_test_boss_death_list do
		if gok_test_boss_death_list[i].name == name then
			gok_test_boss_death_list[i].spawn(x, y)
		end
	end
end

local function set_flags()
	dofile_once( "mods/generals_of_kolmi/files/boss_list.lua" )
	for i = 1,#gok_boss_list do
		local flag = gok_boss_list[i].flag_run
		if flag then
			GameAddFlagRun(gok_boss_list[i].flag_run)
		end
	end
end

function gok_test( player_entity )
	--set_flags()
	--EntitySetTransform( player_entity, 3500, 13000 ) -- kolmi
	--local x, y = EntityGetTransform( player_entity )
	--gok_test_boss_death('boss_dragon', x, y - 100)
	--dofile_once( "mods/generals_of_kolmi/files/destroy_effect.lua" )
	--gok_destroy_effect( player_entity, "miniboss_dragon" )
	--gok_destroy_effect( player_entity, "miniboss_fish" )
end

