local pivot = GetUpdatedEntityID()
local x, y = EntityGetTransform( pivot )
y = y + 13

local orbs
orbs = EntityGetAllChildren( pivot )

if orbs ~= nil then
	local dist = 20
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

	if #orbs < 2 then
		dist = 0
	end

	if outro_start > 0 then
		local t = (frame - outro_start) / 240
		local s = t*shake
		x = x + Random(-s, s)
		y = y + Random(-s, s)
		if t > 1.0 then
			for i,v in ipairs( orbs ) do
				if EntityHasTag( v, "orbit_projectile" ) then
					EntityConvertToMaterial( v, 'fire' )
					EntityKill(v)
				end
			end
			EntityKill(pivot)
			GamePlaySound( "data/audio/Desktop/event_cues.bank", "event_cues/orb_distant_monster/create", x, y )
			GameScreenshake( 100 )
			return
		elseif t > 0.9 then
			for i,v in ipairs( orbs ) do
				if EntityHasTag( v, "orbit_projectile" ) then
					EntityConvertToMaterial( v, 'fire' )
				end
			end
		end
	else
		ComponentSetValue2( var, 'value_int', frame)
	end

	local spread = math.pi * 2 / #orbs
	local speed = 0
	if dist > 0 then
		speed = 0.5 / dist -- perimeter, but 2pi is just a constant
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

			id = id + 1
		end
	end
end
