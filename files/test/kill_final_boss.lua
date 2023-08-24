function spawn_minion()
end

local entity_id = GetUpdatedEntityID()

EntityInflictDamage( entity_id, 1000, "DAMAGE_PROJECTILE", "", "NONE", 0, 0 )

local entities = EntityGetWithTag( "boss_centipede_minion" )
for i,entity_id in ipairs(entities) do
	EntityKill( entity_id )
end
