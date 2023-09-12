local pivot = GetUpdatedEntityID()
local x, y = EntityGetTransform( pivot )
y = y + 13

local orbs
orbs = EntityGetAllChildren( pivot )

if orbs ~= nil then
	local orbit_dist = 60
	local dist = orbit_dist
	local shake = 1
	local frame = GameGetFrameNum()
	SetRandomSeed( frame, x+y)
	local outro_start = 0
	local boss
	local var = EntityGetFirstComponent( pivot, "VariableStorageComponent" )
	if var then
		outro_start = ComponentGetValue2( var, 'value_int' )
	else
		return
	end

	local t = 0
	local alpha = 0

	if outro_start > 0 then
		t = (frame - outro_start) / 580
		alpha = 1
		local s = t*shake
		x = x + Random(-s, s)
		y = y + Random(-s, s)
		if t > 1.0 then
			for i,v in ipairs( orbs ) do
				if EntityHasTag( v, "orbit_projectile" ) then
					EntityConvertToMaterial( v, 'fire' )
					EntityRemoveFromParent(v)
					EntityKill(v)
				end
			end
			EntityRemoveFromParent(pivot)
			EntityKill(pivot)
			GamePlaySound( "data/audio/Desktop/event_cues.bank", "event_cues/orb_distant_monster/create", x, y )
			GameScreenshake( 100 )
			return
		elseif t > 0.95 then
			for i,v in ipairs( orbs ) do
				if EntityHasTag( v, "orbit_projectile" ) then
					EntityConvertToMaterial( v, 'fire' )
				end
			end
		elseif t < 0.5 then
			alpha = t*2
			dist = orbit_dist + (0.5 - t) * 250
		end
	else
		ComponentSetValue2( var, 'value_int', frame)
	end

	local spread = math.pi * 2 / #orbs
	local speed = 0
	if dist > 0 then
		speed = 0.5 / orbit_dist -- perimeter, but 2pi is just a constant
	end

	local id = 0

	for i,v in ipairs( orbs ) do
		if EntityHasTag( v, "orbit_projectile" ) then
			local angle = spread * id + frame * speed
			local rot = 0 -- sprite rotation - ( angle - math.pi * 0.5 )
			
			local px = x + math.cos( angle ) * dist
			local py = y - math.sin( angle ) * dist

			--print(angle, rot, px, py)

			EntitySetTransform( v, px, py, rot )
			EntityApplyTransform( v, px, py, rot )

			local sprites = EntityGetComponent( orbs[i], "SpriteComponent" )
			local sprite_alpha = alpha
			print(alpha)
			for s = 1,#sprites do
				if s == 2 then
					sprite_alpha = sprite_alpha * 0.6
				elseif s == 3 then
					sprite_alpha = sprite_alpha * 0.4
				end
				ComponentSetValue2( sprites[s], 'alpha', sprite_alpha)
			end

			id = id + 1
		end
	end
end
