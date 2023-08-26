local pivot    = GetUpdatedEntityID()
local x, y = EntityGetTransform( pivot )
y = y + 13

local dists = { 50, 70, 90, 110, 130 }
local spaces = { 15, 21, 28, 34, 40 }
local min = { 0, 7, 18, 32, 49 }
local max = { 15, 36, 64, 98, 138 }
local rings = {{}, {}, {}, {}, {}}

local orbits
local cx,cy,cw,ch = GameGetCameraBounds()
if cx-cw < x and x < cx+cw*2 and cy-ch < y and y < cy+ch*2 then
	orbits = EntityGetAllChildren( pivot )
end

if orbits ~= nil then
	local frame = GameGetFrameNum()
	local outro_start = 0
	local var = EntityGetFirstComponent( pivot, "VariableStorageComponent" )
	if var then
		outro_start = tonumber(ComponentGetValue2( var, 'value_string' ))
	end

	local dist_factor = 1
	if outro_start > 0 then
		local t = (frame - outro_start) / 120
		-- https://easings.net/#easeInBack
		local c1 = 1.70158;
		local c3 = c1 + 1;

		local progress = c3 * t * t * t - c1 * t * t;
		if progress < 1 then
			dist_factor = 1 - progress
		else
			dist_factor = 0
			EntityRemoveFromParent(pivot)
			EntityKill(pivot)
			return
		end
	elseif GlobalsGetValue("FINAL_BOSS_ACTIVE") == "1" then
		ComponentSetValue2( var, 'value_string', tostring(frame))
	end

	local count = 1
	for r = 1,#min do
		if #orbits >= min[r] then
			count = r
		end
	end

	local cap = max[count]

	local r = 1
	local orbs = #orbits
	local fill = orbs/cap
	local space = math.floor(spaces[r]*fill)
	for o = 1,orbs do
		if #(rings[r]) > space then
			r = r + 1
			space = math.floor(spaces[r]*fill)
		end
		table.insert(rings[r], orbits[o])
	end

	for r = 1,#rings do
		local orbs = rings[r]
		local dist = dists[r] * dist_factor
		local spread = math.pi * 2 / #orbs
		local speed = 0.05 / dist -- perimeter, but 2pi is just a constant
		if r % 2 == 1 then
			speed = speed * -1
		end

		local id = 0

		for i,v in ipairs( orbs ) do
			if EntityHasTag( v, "orbit_projectile" ) then
				local angle = spread * id + frame * speed
				local rot = 0 -- - ( angle - math.pi * 0.5 )
				
				local px = x + math.cos( angle ) * dist
				local py = y - math.sin( angle ) * dist

				--print(angle, rot, px, py)

				EntitySetTransform( v, px, py, rot )
				EntityApplyTransform( v, px, py, rot )

				id = id + 1
			end
		end
	end
end
