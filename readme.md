# Generals of Kolmisilmä

Main boss is stronger, defeat other bosses to weaken it.

This re-implements a mechanic from BestBardTopNA's [Famine](https://steamcommunity.com/sharedfiles/filedetails/?id=2759088032). Famine has many interesting ideas that work together, but the boss mechanic in particular resists just speedrunning to the end, which can be used as a challenge by itself, or used as speedrun resistance for other types of challenge runs. The power level assigned to each miniboss is slightly different than Famine.

Provides a strength visualizer at Kolmisilmä. Boss icons are only visible if you have the progress flag for the accompanying boss, so it can spoil that more bosses exist, but not their image.

## Mod Interactions

### Supported:

- Famine - acts only as a visualizer for Famine 1.2 numbers
- NG+

### Known unsupported:

- Nightmare

This mod includes no support for additional mod bosses.

### Mod Extension

To support additional bosses, append to

`mods/generals_of_kolmi/files/boss_list.lua`

Add entries to `gok_boss_list`, see file for currently supported fields. Mods are responsible for setting `flag_show` (`AddFlagPersistent` has ever killed) and `flag_run` (`GameAddFlagRun` killed this run)

For orb destroy effects on kill, add to the boss death script:

```
  if ModIsEnabled('generals_of_kolmi') then
    dofile_once( "mods/generals_of_kolmi/files/destroy_effect.lua" )
    gok_destroy_effect( GetUpdatedEntityID(), "miniboss_my_boss_flag_run" )
  end
```

This should run before GameAddFlagRun so it can skip the effect if the flag is already set.
