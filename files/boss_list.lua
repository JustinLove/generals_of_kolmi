gok_boss_list = {
	{
		animal_icon = "friend",
		flag_show = "final_secret_orb3",
		flag_run = "miniboss_friend_super",
		orbs = 4,
	},
	{
		animal_icon = "friend",
		flag_show = "final_secret_orb3",
		flag_run = "miniboss_friend",
		orbs = 1,
	},
	{
		animal_icon = "fish_giga",
		flag_show = "miniboss_fish",
		flag_run = "miniboss_fish",
		orbs = 4,
	},
	{
		animal_icon = "boss_robot",
		flag_show = "miniboss_robot",
		flag_run = "miniboss_robot",
		orbs = 4,
	},
	{
		animal_icon = "maggot_tiny",
		flag_show = "miniboss_maggot",
		flag_run = "miniboss_maggot",
		orbs = 4,
	},
	{
		animal_icon = "boss_alchemist",
		flag_show = "miniboss_alchemist",
		flag_run = "miniboss_alchemist",
		orbs = 2,
	},
	{
		animal_icon = "boss_wizard",
		flag_show = "miniboss_wizard",
		flag_run = "miniboss_wizard",
		orbs = 3,
	},
	{
		animal_icon = "boss_pit",
		flag_show = "miniboss_pit",
		flag_run = "miniboss_pit",
		orbs = 3,
	},
	{
		animal_icon = "boss_ghost",
		flag_show = "miniboss_ghost",
		flag_run = "miniboss_ghost",
		orbs = 3,
	},
	{
		animal_icon = "gate_monster_a",
		flag_show = "miniboss_gate_monsters",
		flag_run = "$animal_gate_monster_a_killed",
		orbs = 1,
	},
	{
		animal_icon = "gate_monster_b",
		flag_show = "miniboss_gate_monsters",
		flag_run = "$animal_gate_monster_b_killed",
		orbs = 0,
	},
	{
		animal_icon = "gate_monster_c",
		flag_show = "miniboss_gate_monsters",
		flag_run = "$animal_gate_monster_c_killed",
		orbs = 0,
	},
	{
		animal_icon = "gate_monster_d",
		flag_show = "miniboss_gate_monsters",
		flag_run = "$animal_gate_monster_d_killed",
		orbs = 1,
	},
	{
		animal_icon = "boss_dragon",
		flag_show = "miniboss_dragon",
		flag_run = "miniboss_dragon",
		orbs = 1,
	},
	{
		animal_icon = "boss_limbs",
		flag_show = "card_unlocked_pyramid",
		flag_run = "miniboss_limbs",
		orbs = 1,
	},
}

function gok_boss_orbcount()
	local count = 0
	for b = 1,#gok_boss_list do
		local boss = gok_boss_list[b]
		local done = boss.flag_run and GameHasFlagRun(boss.flag_run)
		if not done then
			count = count + boss.orbs
		end
	end
	return count
end
