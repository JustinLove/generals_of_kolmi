--[[
animal_icon: data/ui_gfx/animal_icons key.
flag_show: AddFlagPersistent - has the boss ever been killed, allows showing the boss animal icon on the visualizer orbs. Mods responsible for setting flag in new bosses.
flag_run: GameAddFlagRun - check for whether the boss has been killed this run. Mods responsible for setting flag in new bosses.
orbs: Kolmi orb levels added if not defeated, vanilla bosses range 1-4.
orbs_ngp: Alternate orb value for newgame+; often 0 (boss not present)
]]

gok_boss_list = {
	{
		animal_icon = "friend",
		flag_show = "final_secret_orb3",
		flag_run = "miniboss_friend_super",
		orbs = 3,
		orbs_ngp = 0,
	},
	{
		animal_icon = "friend",
		flag_show = "final_secret_orb3",
		flag_run = "miniboss_friend",
		orbs = 1,
		orbs_ngp = 0,
	},
	{
		animal_icon = "fish_giga",
		flag_show = "miniboss_fish",
		flag_run = "miniboss_fish",
		orbs = 4,
		orbs_ngp = 4,
	},
	{
		animal_icon = "boss_robot",
		flag_show = "miniboss_robot",
		flag_run = "miniboss_robot",
		orbs = 4,
		orbs_ngp = 0,
	},
	{
		animal_icon = "maggot_tiny",
		flag_show = "miniboss_maggot",
		flag_run = "miniboss_maggot",
		orbs = 4,
		orbs_ngp = 4,
	},
	{
		animal_icon = "boss_alchemist",
		flag_show = "miniboss_alchemist",
		flag_run = "miniboss_alchemist",
		orbs = 2,
		orbs_ngp = 0,
	},
	{
		animal_icon = "boss_wizard",
		flag_show = "miniboss_wizard",
		flag_run = "miniboss_wizard",
		orbs = 3,
		orbs_ngp = 0,
	},
	{
		animal_icon = "boss_pit",
		flag_show = "miniboss_pit",
		flag_run = "miniboss_pit",
		orbs = 3,
		orbs_ngp = 3,
	},
	{
		animal_icon = "boss_ghost",
		flag_show = "miniboss_ghost",
		flag_run = "miniboss_ghost",
		orbs = 3,
		orbs_ngp = 0,
	},
	{
		animal_icon = "gate_monster_a",
		flag_show = "miniboss_gate_monsters",
		flag_run = "$animal_gate_monster_a_killed",
		orbs = 1,
		orbs_ngp = 0,
	},
	{
		animal_icon = "gate_monster_b",
		flag_show = "miniboss_gate_monsters",
		flag_run = "$animal_gate_monster_b_killed",
		orbs = 0,
		orbs_ngp = 0,
	},
	{
		animal_icon = "gate_monster_c",
		flag_show = "miniboss_gate_monsters",
		flag_run = "$animal_gate_monster_c_killed",
		orbs = 0,
		orbs_ngp = 0,
	},
	{
		animal_icon = "gate_monster_d",
		flag_show = "miniboss_gate_monsters",
		flag_run = "$animal_gate_monster_d_killed",
		orbs = 1,
		orbs_ngp = 0,
	},
	{
		animal_icon = "boss_dragon",
		flag_show = "miniboss_dragon",
		flag_run = "miniboss_dragon",
		orbs = 1,
		orbs_ngp = 1,
	},
	{
		animal_icon = "boss_limbs",
		flag_show = "card_unlocked_pyramid",
		flag_run = "miniboss_limbs",
		orbs = 1,
		orbs_ngp = 0,
	},
}

function gok_boss_orbcount()
	local orbs = 'orbs'
	if tonumber( SessionNumbersGetValue("NEW_GAME_PLUS_COUNT") ) > 0 then
		orbs = 'orbs_ngp'
	end
	local count = 0
	for b = 1,#gok_boss_list do
		local boss = gok_boss_list[b]
		local done = boss.flag_run and GameHasFlagRun(boss.flag_run)
		if not done then
			count = count + boss[orbs]
		end
	end
	return count
end
