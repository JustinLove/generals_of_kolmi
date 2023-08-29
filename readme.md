# Generals of Kolmisilmä

Main boss is stronger, defeat other bosses to weaken it.

This re-implements a mechanic from BestBardTopNA's [Famine](https://steamcommunity.com/sharedfiles/filedetails/?id=2759088032). Famine has many interesting ideas that work together, but the boss mechanic in particular resists just speedrunning to the end, which can be used as a challenge by itself, or used as speedrun resistance for other types of challenge runs. The power level assigned to each miniboss is slightly different than Famine.

Provides a strength visualizer at Kolmisilmä. Boss icons are only visible if you have the progress flag for the accompanying boss, so it can spoil that more bosses exist, but not their image.

## Mod Interactions

This mod includes NO compatibility for other mods, or for vanilla game modes.

## Mod Extension

To support additional bosses, append to

`mods/generals_of_kolmi/files/boss_list.lua"`

Add entries to `gok_boss_list`, see file for currently supported fields. Mods are responsible for setting `flag_show` (`AddFlagPersistent` has-ever-killed) and `flag_run` (`GameAddFlagRun` killed this run)

