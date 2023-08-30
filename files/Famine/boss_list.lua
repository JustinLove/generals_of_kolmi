table.insert(gok_boss_list, 1, {
	animal_icon = "boss_centipede",
	orbs = 33 - 28,
	orbs_ngp = 33 - 13,
})

gok_famine_bosses = {
	miniboss_friend_super = 0,
	miniboss_friend = 2,
	miniboss_robot = 3,
	miniboss_alchemist = 1,
	miniboss_dragon = 2,
}

for i = 1,#gok_boss_list do
	local boss = gok_boss_list[i]
	if boss.flag_run then
		local fam = gok_famine_bosses[boss.flag_run]
		if fam ~= nil then
			if boss.orbs_ngp > 0 then
				boss.orbs_ngp = fam
			end
			boss.orbs = fam
		end
	end
end
